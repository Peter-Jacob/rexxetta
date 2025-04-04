/*ͺ*REXX program  solves  the  "noβconnection"  puzzle   (the puzzle has eight pegs).     */
parse arg limit .    /*ͺ*number of solutions wanted.*/   /*ͺ* βββββββββββββββββββββββββββββ */
if limit=='' | limit==","  then limit= 1               /*ͺ* β          A    B           β */
/*ͺ* β         /β\  /β\          β */
newV1.  =                                                  /*ͺ* β        / β \/ β \         β */
newV1.1 = 'A   C D E'                                      /*ͺ* β       /  β /\ β  \        β */
newV1.2 = 'B   D E F'                                      /*ͺ* β      /   β/  \β   \       β */
newV1.3 = 'C   A D G'                                      /*ͺ* β     CββββDββββEββββF      β */
newV1.4 = 'D   A B C E G'                                  /*ͺ* β      \   β\  /β   /       β */
newV1.5 = 'E   A B D F H'                                  /*ͺ* β       \  β \/ β  /        β */
newV1.6 = 'F   B E H'                                      /*ͺ* β        \ β /\ β /         β */
newV1.7 = 'G   C D E'                                      /*ͺ* β         \β/  \β/          β */
newV1.8 = 'H   D E F'                                      /*ͺ* β          G    H           β */
cnt= 0                                                 /*ͺ* βββββββββββββββββββββββββββββ */
do pegs=1  while  newV1.pegs\=='';    newV4= word(newV1.pegs, 1)
subs= 0
do newV5=1  for  words(newV1.pegs) -1  /*ͺ*create list of node paths.*/
newV2= word(newV1.pegs, newV5 + 1);    if newV2>newV4  then iterate
subs= subs + 1;             newV3.newV4.subs= newV2
end  /*ͺ*#*/
newV3.newV4.0= subs                    /*ͺ*assign the number of the node paths. */
end   /*ͺ*pegs*/
pegs= pegs - 1                                   /*ͺ*the number of pegs to be seated.     */
newV4= '    '                      /*ͺ*_   is used for indenting the output.*/
do               a=1  for pegs;     if ?('A')  then iterate
do             b=1  for pegs;     if ?('B')  then iterate
do           c=1  for pegs;     if ?('C')  then iterate
do         d=1  for pegs;     if ?('D')  then iterate
do       e=1  for pegs;     if ?('E')  then iterate
do     f=1  for pegs;     if ?('F')  then iterate
do   g=1  for pegs;     if ?('G')  then iterate
do h=1  for pegs;     if ?('H')  then iterate
say newV4 'a='a newV4 "b="||b newV4 'c='c newV4 "d="d newV4 'e='e newV4 "f="f newV4 'g='g newV4 "h="h
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
?: parse arg node;           nn= value(node)
nH= nn+1
do cn=c2d('A')  to c2d(node)-1;   if value( d2c(cn) )==nn  then return 1
end   /*ͺ*cn*/                       /*ͺ* [β]  see if there any are duplicates.*/
nL= nn-1
do ch=1  for newV3.node.0              /*ͺ* [β]  see if there any  Β¬= Β±1  values.*/
newV6= newV3.node.ch;       fn= value(newV6)   /*ͺ*the node name  and  its current peg #.*/
if nL==fn | nH==fn  then return 1  /*ͺ*if β‘ Β±1,  then the node can't be used.*/
end   /*ͺ*ch*/                       /*ͺ* [β]  looking for suitable number.    */
return 0                                     /*ͺ*the subroutine arg value passed is OK.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Solve-the-no-connection-puzzle\solve-the-no-connection-puzzle-1.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
