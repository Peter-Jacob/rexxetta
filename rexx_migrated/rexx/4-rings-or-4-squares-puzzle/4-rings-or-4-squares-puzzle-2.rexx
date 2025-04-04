/*ª*REXX pgm solves the 4-rings puzzle,  where letters represent unique (or not) digits). */
arg LO HI unique show .                          /*ª*the  ARG  statement capitalizes args.*/
if LO=='' | LO==","  then LO=1                   /*ª*Not specified?  Then use the default.*/
if HI=='' | HI==","  then HI=7                   /*ª* "      "         "   "   "     "    */
if unique=='' | unique==',' | unique=='UNIQUE'  then u=1       /*ª*unique letter solutions*/
else u=0       /*ª*non-unique        "    */
if   show=='' |   show==',' |   show=='SHOW'    then show=1    /*ª*noshow letter solutions*/
else show=0    /*ª*  show    "       "    */
w=max(3, length(LO), length(HI) )                /*ª*maximum width of any number found.   */
bar=copies('â', w)                               /*ª*define a horizontal bar (for title). */
times=HI - LO + 1                                /*ª*calculate number of times to loop.   */
newV1=0                                              /*ª*number of solutions found (so far).  */
do       a=LO  for times
do      b=LO  for times;  if u  then  if b==a                           then iterate
do     c=LO  for times;  if u  then  if c==a|c==b                      then iterate
do    d=LO  for times;  if u  then  if d==a|d==b|d==c                 then iterate
do   e=LO  for times;  if u  then  if e==a|e==b|e==c|e==d            then iterate
do  f=LO  for times;  if u  then  if f==a|f==b|f==c|f==d|f==e       then iterate
do g=LO  for times;  if u  then  if g==a|g==b|g==c|g==d|g==e|g==f  then iterate
sum=a+b
if f+g==sum & b+c+d==sum & d+e+f==sum  then newV1=newV1+1      /*ª*bump # of solutions.*/
else iterate    /*ª*sum not equal, noâgo*/
if newV1==1  then call align  'a',  'b',  'c',  'd',  'e',  'f',  'g'
if newV1==1  then call align  bar,  bar,  bar,  bar,  bar,  bar,  bar
call align   a,    b,    c,    d,    e,    f,    g
end   /*ª*g*/                                        /*ª*for 1st time, show title*/
end    /*ª*f*/
end     /*ª*e*/
end      /*ª*d*/
end       /*ª*c*/
end        /*ª*b*/
end         /*ª*a*/
say
newV2= ' non-unique'
if u  then newV2= ' unique '
say newV1  newV2  'solutions found.'
exit                                             /*ª*stick a fork in it,  we're all done. */
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
align: parse arg a1,a2,a3,a4,a5,a6,a7
if show  then say  left('',9)  center(a1,w) center(a2,w) center(a3,w) center(a4,w),
center(a5,w) center(a6,w) center(a7,w)
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\4-rings-or-4-squares-puzzle\4-rings-or-4-squares-puzzle-2.rexx was migrated on 23 Mar 2025 at 10:43:04
 * -------------------------------------------------------------------------
*/ 
