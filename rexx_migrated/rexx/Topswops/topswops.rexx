/*�*REXX program generates  N  decks of  numbered cards  and  finds the maximum  "swops". */
parse arg things .;          if things=='' then things= 10

do n=1  for things;         newV3= decks(n, n) /*�*create a (things) number of "decks". */
mx= n\==1                                  /*�*handle the case of a  one-card  deck.*/
do i=1  for newV3;  p= swops(newV2.i)  /*�*compute the SWOPS for this iteration.*/
if p>mx  then mx= p            /*�*This a new maximum?   Use a new max. */
end   /*�*i*/
say '──────── maximum swops for a deck of'   right(n,2)   ' cards is'    right(mx,4)
end   /*�*n*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
decks:  procedure expose newV2.; parse arg x,y,,newV4 newV1. /*�*   X  things  taken   Y   at a time. */
newV3= 0;                call .decks 1       /*�* [↑]  initialize  $  &   @.  to null.*/
return newV3                                 /*�*return number of permutations (decks)*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
.decks: procedure expose newV2. newV1. x y newV4 newV3;          parse arg newV5
if newV5>y  then do;  newV6=newV1.1;  do j=2  for y-1;  newV6= newV6 newV1.j;  end /*�*j*/;   newV3= newV3+1;  newV2.newV3=newV6
end
else do;           qm= newV5 - 1
if newV5==1  then qs= 2         /*�*don't use 1-swops that start with  1 */
else if newV1.1==newV5  then qs=2  /*�*skip the 1-swops: 3 x 1 x ···*/
else qs=1
do q=qs  to x           /*�*build the permutations recursively.  */
do k=1  for qm;  if newV1.k==q  then iterate q
end  /*�*k*/
newV1.newV5=q ;                call .decks newV5 + 1
end        /*�*q*/
end
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
swops:  parse arg z;   do u=1;    parse var z t .;    if \datatype(t, 'W')  then t= x2d(t)
if word(z, t)==1  then return u             /*�*found unity at  T. */
do h=10  to things;    if pos(h, z)==0  then iterate
z= changestr(h, z, d2x(h) )         /*�* [↑]  any H's in Z?*/
end   /*�*h*/
z= reverse( subword(z, 1, t) )     subword(z, t + 1)
end   /*�*u*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Topswops\topswops.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
