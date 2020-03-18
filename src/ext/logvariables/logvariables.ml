open Pretty
open Cil
open Feature
module E = Errormsg
module H = Hashtbl

let mySymboltbl = (H.create 123456)

let tempScope = ref ""

let rec findVariables (l : exp list) : exp list  =
	match l with
	[] -> []
	| h::tl -> begin
		E.log "find: %a \n" d_exp h;
			let nl = match h with
			| Lval x -> E.log "Lval: %a \n" d_lval x;
			[Lval x]
			| BinOp (_,e1,e2,_) -> findVariables [e1;e2]
			| _ -> []
		in
		 List.append nl (findVariables tl)
		end

let insertVariables (l : exp list) : unit =
	let vlist = findVariables l in
	let scope = !tempScope in
	List.iter (fun (Lval(Var x, y)) -> H.add mySymboltbl x.vname (x.vtype, scope)) vlist
	
		

let instrLookup (i : instr)= 
match i with
	| Set(lv, e, l) ->
              E.log "Set: %a \n" d_lval lv;
              insertVariables [Lval lv] ;
	| _ -> ()
                        
 
let printRes (tl : ('a, 'b)H.t) = H.iter (fun x y -> E.log "%s -> %a \n" x d_type y) tl

(*let stmtLookup (scope:string) (s: stmt) =
E.log "st: %a - %s \n" d_stmt s scope;
        match s.skind with              
        | Loop (b,loc,co,bo) ->                            
            E.log "Looooop:\n";
            E.log "---> %a\n" d_stmt (List.hd b.bstmts);
                   match (List.hd b.bstmts).skind with
                    | If (exp,_,_,_) -> E.log "Iffff:  \n"; insertVariables [exp] scope;
                    | _ -> ()
                            
        | Instr il ->
		E.log "Instr: \n";
		List.iter (instrLookup scope) il;		
        | _ -> ()
 *)   
   
                    
class logVariableVisitor (ifile : file) = object
inherit nopCilVisitor

val vtrace =
        let fdec = emptyFunction "vtrace" in
        fdec.svar.vtype <- TFun(voidType,
                              Some [],
                                true, []);
	fdec


method vglob (g: global) =
E.log "gl: %a\n" d_global g;
	match g with
	| GVar(v,i,loc) -> tempScope := "global"; insertVariables [Lval(Var v, NoOffset)]; DoChildren
	| GFun(f,loc) -> tempScope := f.svar.vname; DoChildren (*let s = Cil.computeCFGInfo f in (List.iter (stmtLookup f.svar.vname) f.sallstmts) ; DoChildren*)
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
        	vtrace.svar.vname <- ("vtrace"^(string_of_int(List.length vars)));
		let vtrace0 = Call((None), (Lval(Var(vtrace.svar),NoOffset)),vars,locUnknown) in 
		let nstatement = mkStmtOneInstr vtrace0 in
		b.bstmts <- nstatement :: b.bstmts;
		let nblock = mkBlock [mkStmt s.skind] in
                    s.skind <- Block nblock;
		s

        | Instr il ->
		E.log "Instr: \n";
		List.iter (instrLookup) il;

		s
        | _ -> s
    in ChangeDoChildrenPost(s,action)

 end


let creatArgs (name: string) =
	let (x,y) = H.find mySymboltbl name
	in (name,x,[])


let contains s1 s2 =
	let re = Str.regexp_string s2
	in
		try ignore (Str.search_forward re s1 0); true
		with Not_found -> false


class injectFunctionsVisitor (ifile : file) = object
inherit nopCilVisitor
 


method vinst (i: instr) : instr list visitAction =
    match i with
     
    | Call(lv, Lval(Var fd,_), args, l) when (contains fd.vname "vtrace") -> 
                    E.log "Call of %s: \n" fd.vname;
	let arglist = findVariables args in
	let findlist = List.map (fun (Lval(Var x, y)) -> creatArgs x.vname) arglist in
	
	E.log "globals1: %a\n" d_global (List.hd ifile.globals);  

	let vtyp = TFun(voidType,
                              Some findlist,
                                true, [])
        in
	 
	let nfun = (findOrCreateFunc ifile fd.vname vtyp) in
	E.log "nfun --> %s - %s - %a \n" ifile.fileName nfun.vname d_type nfun.vtype;
	E.log "globals2: %a\n" d_global (List.hd ifile.globals); 
  
              DoChildren
    | _ -> SkipChildren


end




(* ----- *)

(*
open Pretty
open Cil
open Feature
module E = Errormsg
(*
let rec print_list (l: 'a list) : unit =
match l with
        [] -> ()
| h::tl -> print_exp h ; print_string " " ; print_list tl

*)

let rec print_list (l: 'a list) =
 match l with
 [] -> ()
 | h::tl -> begin
         match h with
         Lval x ->
                 E.log "%a \n"  d_lval x;
                 print_list tl
         | BinOp (_,e1,e2,_) -> print_list [e1;e2];
         print_list tl
         | _ -> print_list tl

end


let rec insert (x: 'a) (l : 'a list ref) : 'a list ref =
        match !l with
        [] -> ref [x]
        | h::tl -> if h = x then l else (insert x (ref tl))

let rec find_variables (l : 'a list) : 'b list  =
        match l with
        [] -> []
        | h::tl -> begin
                begin match h with
                Lval x -> E.log "%a \n" d_lval x;
                         List.cons (Lval x) (find_variables tl)
                | BinOp (_,e1,e2,_) -> List.append (find_variables [e1;e2]) (find_variables tl)
                | _ -> find_variables tl
                end
                (*find_variables tl*)

        end

let variables_list = ref []

(*class loopProcessClass (fd : fundec) = object
        inherit nopCilVisitor

val vtrace =
            let fdec = emptyFunction "vtrace0" in
        fdec.svar.vtype <- TFun(intType,
                                Some [],
                                true, [Attr("x", [])]);
        fdec

method vstmt (s: stmt) =
    let action s =
        match s.skind with
                    | Loop (b,loc,co,bo) -> E.log "Looooop\n";
                    let vtrace0 = Call((None), (Lval(Var(vtrace.svar),NoOffset)),[one],locUnknown) 				in
                    let nstatement = mkStmtOneInstr vtrace0 in
                        b.bstmts <- nstatement :: b.bstmts; 
                    let nblock = mkBlock [mkStmt s.skind] in
                    s.skind <- Block nblock;
                    s
                    | _ -> E.log "nothing\n"; s
        in ChangeDoChildrenPost(s,action)

end
*)

class logVariableVisitor (ifile : file) = object
  inherit nopCilVisitor
                        
    val vtrace =
        let fdec = emptyFunction "vtrace0" in
        fdec.svar.vtype <- TFun(voidType,
                              Some [(* ("x", intType, []);
                              ("y", intType, [])*)],
                                true, []);
        fdec.sbody <- mkBlock [mkStmt(Return(None, locUnknown))];
        fdec.svar.vstorage <- Extern;
        fdec
(*
        
                let fd = emptyFunction "vtrace0" in
               (*fd.sbody <- (mkBlock []) 
                 *)
               let nf = GFun (fd, locUnknown) in  
        
        ifile.globals <- nf :: ifile.globals;        
*)
   method vinst (i: instr) : instr list visitAction =
    match i with
      Set(lv, e, l) ->
              E.log "Set: %a \n" d_lval lv;
              (*print_list [e];*)
              (*E.log "%a - %a \n" d_type (Cil.typeOf e) d_exp e;*)
              variables_list := List.append (!variables_list) (find_variables [e]);
              DoChildren
    | Call(lv, f, args, l) ->
                    E.log "Call of %a: " d_exp f;
                    (*print_list args;*)
                    variables_list := List.append !variables_list (find_variables args);
                       
                  (*  let proccessFunction (fd : fundec) =
                            let vis = new loopProcessClass vtrace in
                            visitCilFunction vis vtrace; in *)

              DoChildren
    | _ -> SkipChildren

  method vstmt (s: stmt) =
E.log "st: %a \n" d_stmt s;
    let action s =
        match s.skind with
	            (*| Instr i -> begin
			match i with
				| Set(lv, e, l)::_ ->
                      			E.log "Set: %a \n" d_lval lv;
					E.log "Set: %a \n" d_exp e; s
				| [Call(lv, f, args, l)] -> 
                    			E.log "Call of %a: " d_exp f;
					let vars = find_variables args in
					s
				| _ -> E.log ""; s
			end
			*)
                    | Loop (b,loc,co,bo) -> 
                              
                         E.log "Looooop:\n";
		         E.log "---> %a - %a\n" d_attrlist b.battrs d_stmt (List.hd b.bstmts);
                               let vars =   match (List.hd b.bstmts).skind with
                                        | If (exp,_,_,_) -> E.log "Iffff:  \n"; find_variables [exp];
                                        | _ -> []                                        
                               in
                         let nextstmt = List.hd b.bstmts in
                         let vtrace0 = Call((None), (Lval(Var(vtrace.svar),NoOffset)),vars,locUnknown) in 
                         let nstatement = mkStmtOneInstr vtrace0 in
                         b.bstmts <- nstatement :: b.bstmts;
(*
                         let vbod = Set((Var(vtrace.svar),NoOffset),Const(CInt64(2L,IInt,None)),loc) in
                         vtrace.sbody <- mkBlock [mkStmtOneInstr vbod; mkStmt(Return(None, loc))];
*)  
(*
                        E.log "globals1: %a\n" d_global (List.hd ifile.globals);
                         
                        (*
                        let nloc : location = { line = 6; file = loc.file; byte = 6;}    
                        in 
                         ifile.globals <- GFun (vtrace, nloc) :: ifile.globals;
                        *)
                        let nfun = (findOrCreateFunc ifile vtrace.svar.vname vtrace.svar.vtype) in
                         E.log "nfun --> %s \n" nfun.vname;
                         E.log "globals2: %a\n" d_global (List.hd ifile.globals);
*)
                         (*
                         let lvVisitor = new logVariableVisitor ifile in
                        visitCilGlobal lvVisitor (List.hd ifile.globals);
*)




                         
                    (*let nblock = mkBlock [mkStmt s.skind] in
                    s.skind <- Block nblock;*)
			
			(*let a = (List.hd b.bstmts).skind;
			match a with 
			| If(_,_,_,_) -> E.log "heeey";
			| _ -> E.log "nop";
			*)
                                s        
                                
                    | _ -> s
        in ChangeDoChildrenPost(s,action)

        (*
        method vglob (g: global) =
                E.log "vglob: %a \n" d_global g; 
                match g with
                | GFun(fd,loc) when fd.svar.vname = "main" -> let nloc : location = { line = 4; file = loc.file; byte = 4;}
    in
    vtrace.sbody <- mkBlock [mkStmt(Return(None, locUnknown))] ; 
    ChangeTo [GFun (vtrace, locUnknown)]  
                | _ -> DoChildren
in DoChildren

*)

        

      (*   method vfunc (f: fundec) =

           ChangeTo vtrace
*)
(*           method vglobal (g: global) =
                   ChangeTo [nf; g]
*)
end

(*let pr (e:Cil.exp) = E.log "%a" d_exp e;()
let result  = List.iter (function e -> pr e) !variables_list
*)

class mkDiclVisitor (ifile: file) = object
  inherit nopCilVisitor

   method vinst (i: instr) : instr list visitAction =
    match i with
    | Call(lv, Lval(Var vi, NoOffset), args, l) ->
         E.log "globals1: %a\n" d_global (List.hd ifile.globals);                         
 
     let nfun = (findOrCreateFunc ifile vi.vname vi.vtype) in
  E.log "nfun --> %s - %a \n" nfun.vname d_type vi.vtype;


(*
ifile.globals <- GFun (vtrace, locUnknown) :: ifile.globals;
*)

(*
        let fdec = emptyFunction vi.vname in
        fdec.svar.vtype <- TFun(voidType,
                              Some [ ("x", intType, []);
                               ("y", intType, []) ],
                                true, []);
                                fdec.sbody <- mkBlock [mkStmt(Return(None, locUnknown))];
                                fdec.svar.vstorage <- Extern;
ifile.globals <- GFun (fdec, locUnknown) :: ifile.globals;
*)

     E.log "globals2: %a\n" d_global (List.hd ifile.globals);
         DoChildren
    | _ -> DoChildren





end

*)


let feature =
{ fd_name = "logvariables";
  fd_enabled = false;
  fd_description = "generation of code to collect all variables name";
  fd_extraopt = [];
  fd_doit =
  (function (f: file) ->
    let lvVisitor = new logVariableVisitor f in
     let ifVisitor = new injectFunctionsVisitor f in
    let firstphase = visitCilFile lvVisitor f
in let pr = (H.iter (fun x (y,z) -> E.log "%s -> %a, %s \n" x d_type y z) mySymboltbl) in
    visitCilFile ifVisitor f 
  
  );

  fd_post_check = true;
}

let () = Feature.register feature


