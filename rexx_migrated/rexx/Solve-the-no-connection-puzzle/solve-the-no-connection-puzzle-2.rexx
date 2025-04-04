/*ͺ*REXX program  solves  the  "noβconnection"  puzzle   (the puzzle has eight pegs).     */
newV1= 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
parse arg limit .    /*ͺ*number of solutions wanted.*/   /*ͺ* βββββββββββββββββββββββββββββ */
if limit=='' | limit==","  then limit= 1               /*ͺ* β          A    B           β */
oLimit= limit;                  limit= abs(limit)      /*ͺ* β         /β\  /β\          β */
newV2.  =                                                  /*ͺ* β        / β \/ β \         β */
newV2.1 = 'A   C D E'                                      /*ͺ* β       /  β /\ β  \        β */
newV2.2 = 'B   D E F'                                      /*ͺ* β      /   β/  \β   \       β */
newV2.3 = 'C   A D G'                                      /*ͺ* β     CββββDββββEββββF      β */
newV2.4 = 'D   A B C E G'                                  /*ͺ* β      \   β\  /β   /       β */
newV2.5 = 'E   A B D F H'                                  /*ͺ* β       \  β \/ β  /        β */
newV2.6 = 'F   B E H'                                      /*ͺ* β        \ β /\ β /         β */
newV2.7 = 'G   C D E'                                      /*ͺ* β         \β/  \β/          β */
newV2.8 = 'H   D E F'                                      /*ͺ* β          G    H           β */
cnt= 0                                                 /*ͺ* βββββββββββββββββββββββββββββ */
do pegs=1  while  newV2.pegs\=='';    newV5= word(newV2.pegs, 1)
subs= 0
do newV6=1  for  words(newV2.pegs) -1  /*ͺ*create list of node paths.*/
newV3= word(newV2.pegs, newV6+1);      if newV3>newV5  then iterate
subs= subs + 1;             newV4.newV5.subs= newV3
end  /*ͺ*#*/
newV4.newV5.0= subs                   /*ͺ*assign the number of the node paths.  */
end   /*ͺ*pegs*/
pegs= pegs - 1                                  /*ͺ*the number of pegs to be seated.      */
newV5= '    '                     /*ͺ*_   is used for indenting the output. */
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
end   /*ͺ*h*/
end     /*ͺ*g*/
end       /*ͺ*f*/
end         /*ͺ*e*/
end           /*ͺ*d*/
end             /*ͺ*c*/
end               /*ͺ*b*/
end                 /*ͺ*a*/
say                                              /*ͺ*display a blank line to the terminal.*/
s= left('s', cnt\==1)                            /*ͺ*handle the case of plurals  (or not).*/
say 'found '     cnt     " solution"s'.'         /*ͺ*display the number of solutions found*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
?: parse arg node;         nn= value(node)
nH= nn+1
do cn=c2d('A')  to c2d(node)-1;    if value( d2c(cn) )==nn  then return 1
end   /*ͺ*cn*/                        /*ͺ* [β]  see if there're any duplicates.*/
nL= nn-1
do ch=1  for newV4.node.0               /*ͺ* [β]  see if there any Β¬= Β±1  values.*/
newV7= newV4.node.ch;       fn= value(newV7)    /*ͺ*the node name  and its current peg #.*/
if nL==fn | nH==fn  then return 1   /*ͺ*if β‘ Β±1, then the node can't be used.*/
end   /*ͺ*ch*/                        /*ͺ* [β]  looking for suitable number.   */
return 0                                      /*ͺ*the subroutine arg value passed is OK*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
showNodes: newV5= left('', 5)                        /*ͺ*_   is used for padding the output.  */
show= 0                                          /*ͺ*indicates no graph has been found yet*/
do box=1  for sourceline()  while oLimit<0 /*ͺ*Negative?  Then display the diagram. */
xw= sourceline(box)                        /*ͺ*get a source line of this program.   */
p2= lastpos('*', xw)                       /*ͺ*the position of    last     asterisk.*/
p1= lastpos('*', xw, max(1, p2-1) )        /*ͺ* "      "     " penultimate     "    */
if pos('β', xw)\==0  then show= 1          /*ͺ*Have found the top-left box corner ? */
if \show             then iterate          /*ͺ*Not found?  Then skip this line.     */
xb= substr(xw, p1+1, p2-p1-2)              /*ͺ*extract the  "box"  part of line.    */
xt= xb                                     /*ͺ*get a working copy of the box.       */
do jx=1  for pegs              /*ͺ*do a substitution for all the pegs.  */
newV8= substr(newV1, jx, 1)         /*ͺ*get the name of the peg  (A βββΊ Z).  */
xt= translate(xt, value(newV8), newV8) /*ͺ*substitute the peg name with a value.*/
end   /*ͺ*jx*/                   /*ͺ* [β]    graph is limited to 26 nodes.*/
say newV5 xb newV5 newV5 xt                            /*ͺ*display one line of the graph.       */
if pos('β', xw)\==0  then return           /*ͺ*Is this last line of graph? Then stop*/
end   /*ͺ*box*/
say newV5  'a='a newV5    "b="||b newV5    'c='c newV5    "d="d newV5   ' e='e newV5    "f="f newV5    'g='g newV5   "h="h
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Solve-the-no-connection-puzzle\solve-the-no-connection-puzzle-2.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
