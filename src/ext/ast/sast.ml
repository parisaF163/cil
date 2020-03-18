open Pretty
open Cil
open Feature
module E = Errormsg
module H = Hashtbl

let mySymboltbl = (H.create 123456)

let tempScope = ref ""

let rec findVariables (l : exp list) : lval list  =
	match l with
	[] -> []
	| h::tl -> begin
		E.log "find: %a \n" d_exp h;
			let nl = match h with
			| Lval x -> E.log "Lval: %a \n" d_lval x;  
                        [x]
			| BinOp (_,e1,e2,_) -> findVariables [e1;e2]
			| _ -> []
		in
		 List.append nl (findVariables tl)
		end

let rec findPointers (l : lval list) : lval list  =
	match l with
	[] -> []
	| h::tl-> begin	
		let n = match h with
		| (Mem x,_) -> E.log "find Pointer: %a - %a \n" d_lval h d_exp x; findVariables [x]
		| _ -> [h]
		in 
		List.append n (findPointers tl)
	end	

let insertVariables (l : 'a list) : unit =	
	let vlist = findVariables l in
	let vlist2 = findPointers vlist in
	let scope = !tempScope in
        List.iter (fun (Var x,_) -> H.add mySymboltbl x.vname (x.vtype, scope); E.log "?? %a" d_loc x.vdecl) vlist2
	
		
let instrLookup (i : instr)= 
match i with
	| Set(lv, e, l) ->
              E.log "Set: %a \n" d_lval lv;
              insertVariables [Lval lv] ;
	| _ -> ()
                       

                    
class sASTVisitor = object
inherit nopCilVisitor


method vglob (g: global) =
E.log "gl: %a\n" d_global g;
	match g with
	| GVar(v,i,loc) -> tempScope := "global"; insertVariables [Lval(Var v, NoOffset)]; DoChildren
	| GFun(f,loc) -> tempScope := f.svar.vname; DoChildren 
	| _ -> SkipChildren


method vstmt (s: stmt) =
E.log "st: %a \n" d_stmt s;
    let action s =
        match s.skind with
              
        | Loop (b,loc,co,bo) ->
                              
         	E.log "Looooop:\n";
        	E.log "---> %a\n" d_stmt (List.hd b.bstmts);
		let vars = match (List.hd b.bstmts).skind with
		          | If (exp,_,_,_) -> E.log "Iffff:  \n"; findVariables [exp]
		          | _ -> []
		

		in                                
		s

        | Instr il ->
		E.log "Instr: \n";
		List.iter (instrLookup) il;

		s
        | _ -> s
    in ChangeDoChildrenPost(s,action)

 end


let print_my_variables (fname : string)=
        let print_variable = fun x (y,name) -> 
               begin
               match name with
                       | n when n = fname -> Pretty.printf "%s -> %a : %s\n" x d_type y n;()
                       | n when n = "global" -> Pretty.printf "%s -> %a : %s\n" x d_type y n;()
                       | _ -> ()
                end
                 in
        (H.iter print_variable mySymboltbl)


let print_used_global_variables (fname : string)=
        let print_variable = fun x (y,"global") ->
                if H.find_opt (x,(y,fname)) != None -> Pretty.printf "%s -> %a : %s\n" x d_type y n;()

                 in
        (H.iter print_variable mySymboltbl)

class sASTSecondVisitor = object
inherit nopCilVisitor


method vglob (g: global) =
E.log "gl2: %a\n" d_global g;
        match g with
        | GVar(v,i,loc) ->  DoChildren
        | GFun(f,loc) -> Pretty.printf "Method(%s,%a)\n" f.svar.vname d_type f.svar.vtype;
                         print_my_variables f.svar.vname;
                         DoChildren
        | _ -> SkipChildren

end



let feature =
{ fd_name = "sast";
  fd_enabled = false;
  fd_description = "search AST for generating some data";
  fd_extraopt = [];
  fd_doit =
  (function (f: file) ->
    let lvVisitor = new sASTVisitor in
     visitCilFileSameGlobals lvVisitor f;
     let _ = (H.iter (fun x (y,z) -> E.log "%s -> %a, %s\n" x d_type y z) mySymboltbl)
        in
        let secondPass = new sASTSecondVisitor in
        visitCilFile secondPass f
     );

  fd_post_check = true;
}

let () = Feature.register feature


