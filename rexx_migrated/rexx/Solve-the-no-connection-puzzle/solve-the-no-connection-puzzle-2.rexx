/*�*REXX program  solves  the  "no─connection"  puzzle   (the puzzle has eight pegs).     */
newV1= 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
parse arg limit .    /*�*number of solutions wanted.*/   /*�* ╔═══════════════════════════╗ */
if limit=='' | limit==","  then limit= 1               /*�* ║          A    B           ║ */
oLimit= limit;                  limit= abs(limit)      /*�* ║         /│\  /│\          ║ */
newV2.  =                                                  /*�* ║        / │ \/ │ \         ║ */
newV2.1 = 'A   C D E'                                      /*�* ║       /  │ /\ │  \        ║ */
newV2.2 = 'B   D E F'                                      /*�* ║      /   │/  \│   \       ║ */
newV2.3 = 'C   A D G'                                      /*�* ║     C────D────E────F      ║ */
newV2.4 = 'D   A B C E G'                                  /*�* ║      \   │\  /│   /       ║ */
newV2.5 = 'E   A B D F H'                                  /*�* ║       \  │ \/ │  /        ║ */
newV2.6 = 'F   B E H'                                      /*�* ║        \ │ /\ │ /         ║ */
newV2.7 = 'G   C D E'                                      /*�* ║         \│/  \│/          ║ */
newV2.8 = 'H   D E F'                                      /*�* ║          G    H           ║ */
cnt= 0                                                 /*�* ╚═══════════════════════════╝ */
do pegs=1  while  newV2.pegs\=='';    newV5= word(newV2.pegs, 1)
subs= 0
do newV6=1  for  words(newV2.pegs) -1  /*�*create list of node paths.*/
newV3= word(newV2.pegs, newV6+1);      if newV3>newV5  then iterate
subs= subs + 1;             newV4.newV5.subs= newV3
end  /*�*#*/
newV4.newV5.0= subs                   /*�*assign the number of the node paths.  */
end   /*�*pegs*/
pegs= pegs - 1                                  /*�*the number of pegs to be seated.      */
newV5= '    '                     /*�*_   is used for indenting the output. */
do               a=1  for pegs;     if ?('A')  then iterate
do             b=1  for pegs;     if ?('B')  then iterate
do           c=1  for pegs;     if ?('C')  then iterate
do         d=1  for pegs;     if ?('D')  then iterate
do       e=1  for pegs;     if ?('E')  then iterate
do     f=1  for pegs;     if ?('F')  then iterate
do   g=1  for pegs;     if ?('G')  then iterate
do h=1  for pegs;     if ?('H')  then iterate
call showNodes
cnt= cnt + 1;         if cnt==limit  then leave a
end   /*�*h*/
end     /*�*g*/
end       /*�*f*/
end         /*�*e*/
end           /*�*d*/
end             /*�*c*/
end               /*�*b*/
end                 /*�*a*/
say                                              /*�*display a blank line to the terminal.*/
s= left('s', cnt\==1)                            /*�*handle the case of plurals  (or not).*/
say 'found '     cnt     " solution"s'.'         /*�*display the number of solutions found*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
?: parse arg node;         nn= value(node)
nH= nn+1
do cn=c2d('A')  to c2d(node)-1;    if value( d2c(cn) )==nn  then return 1
end   /*�*cn*/                        /*�* [↑]  see if there're any duplicates.*/
nL= nn-1
do ch=1  for newV4.node.0               /*�* [↓]  see if there any ¬= ±1  values.*/
newV7= newV4.node.ch;       fn= value(newV7)    /*�*the node name  and its current peg #.*/
if nL==fn | nH==fn  then return 1   /*�*if ≡ ±1, then the node can't be used.*/
end   /*�*ch*/                        /*�* [↑]  looking for suitable number.   */
return 0                                      /*�*the subroutine arg value passed is OK*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
showNodes: newV5= left('', 5)                        /*�*_   is used for padding the output.  */
show= 0                                          /*�*indicates no graph has been found yet*/
do box=1  for sourceline()  while oLimit<0 /*�*Negative?  Then display the diagram. */
xw= sourceline(box)                        /*�*get a source line of this program.   */
p2= lastpos('*', xw)                       /*�*the position of    last     asterisk.*/
p1= lastpos('*', xw, max(1, p2-1) )        /*�* "      "     " penultimate     "    */
if pos('╔', xw)\==0  then show= 1          /*�*Have found the top-left box corner ? */
if \show             then iterate          /*�*Not found?  Then skip this line.     */
xb= substr(xw, p1+1, p2-p1-2)              /*�*extract the  "box"  part of line.    */
xt= xb                                     /*�*get a working copy of the box.       */
do jx=1  for pegs              /*�*do a substitution for all the pegs.  */
newV8= substr(newV1, jx, 1)         /*�*get the name of the peg  (A ──► Z).  */
xt= translate(xt, value(newV8), newV8) /*�*substitute the peg name with a value.*/
end   /*�*jx*/                   /*�* [↑]    graph is limited to 26 nodes.*/
say newV5 xb newV5 newV5 xt                            /*�*display one line of the graph.       */
if pos('╝', xw)\==0  then return           /*�*Is this last line of graph? Then stop*/
end   /*�*box*/
say newV5  'a='a newV5    "b="||b newV5    'c='c newV5    "d="d newV5   ' e='e newV5    "f="f newV5    'g='g newV5   "h="h
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Solve-the-no-connection-puzzle\solve-the-no-connection-puzzle-2.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
