/*�*REXX program solves the   Hofstadter─Conway  sequence  $10,000   prize  (puzzle).     */
newV1= 'Maximum of    a(n) ÷ n     between '     /*�*a prologue for the text of message.  */
H.=.;   H.1=1;  H.2=1;   newV2.=0;     newV3.=0          /*�*initialize some REXX variables.      */
win=0
do k=0  to 20;     p.k=2**k;  maxp=p.k     /*�*build an array of the powers of two. */
end   /*�*k*/
r=1                                              /*�*R:  is the range of the power of two.*/
do n=1  for maxp;  if n> p.r  then r=r+1   /*�*for golf coders, same as: r=r+(n>p.r)*/
newV4=H(n)/n;          if newV4>=.55  then win=n   /*�*get next seq number; if ≥.55, a win? */
if newV4<=newV3.r  then iterate /*�*less than previous? Then keep looking*/
newV3.r=newV4;      newV2.r=n                          /*�*@.r and  !.r  are like ginkgo biloba.*/
end   /*�*n*/                                /*�*  ··· or in other words, memoization.*/

do j=1  for 20;   range= '2**'right(j-1, 2)              "───► 2**"right(  j, 2)
say newV1  range  '(inclusive)  is '    left(newV3.j, 9)     "  at  n="right(newV2.j, 7)
end   /*�*j*/
say
say 'The winning number is: '    win             /*�*and the money shot is  ···           */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
H: procedure expose H.; parse arg z
if H.z==.  then do;  m=z-1;   newV5=H.m;   newV4=z-newV5;   H.z=H.newV5+H.newV4;   end
return H.z
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Hofstadter-Conway-$10-000-sequence\hofstadter-conway-$10-000-sequence.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
