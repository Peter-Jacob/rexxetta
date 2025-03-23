/*�*REXX program checks for around 125,000 generated balanced brackets expressions  [ ]   */
bals=0
newV1=0;      do j=1  until  L>20                    /*�*generate lots of bracket permutations*/
q=translate( strip( x2b( d2x(j) ), 'L', 0),  "][", 01)        /*�*convert ──► ][*/
L=length(q)
if countStr(']', q) \== countstr('[', q)  then iterate        /*�*not compliant?*/
newV1=newV1+1                                                         /*�*bump legal Q's*/
newV2=0;     do k=1  for L;      parse var q newV3 2 q
if newV3=='['  then     newV2=newV2+1
else do; newV2=newV2-1;  if newV2<0  then iterate j;  end
end   /*�*k*/

if newV2==0  then bals=bals+1
end  /*�*j*/                             /*�*done all 20─character possibilities? */

say newV1   " expressions were checked, "     bals    ' were balanced, ' ,
newV1-bals    " were unbalanced."
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
countStr: procedure;   parse arg n,h,s;    if s==''  then s=1;       w=length(n)
do r=0  until newV4==0;   newV4=pos(n,h,s);   s=newV4+w;   end;      return r
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Balanced-brackets\balanced-brackets-3.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
