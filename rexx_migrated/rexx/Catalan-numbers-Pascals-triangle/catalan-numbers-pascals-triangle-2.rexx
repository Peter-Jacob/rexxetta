/*�*REXX program  obtains and displays  Catalan numbers  from  a  Pascal's triangle.      */
parse arg N .                                    /*�*Obtain the optional argument from CL.*/
if N=='' | N==","  then N=15                     /*�*Not specified?  Then use the default.*/
numeric digits max(9, N%2 + N%8)                 /*�*so we can handle huge Catalan numbers*/
newV1.=0;  newV1.1=1                                     /*�*stem array default; define 1st value.*/
do i=1  for N;  ip=i+1
do j=i   by -1  for N;  newV1.j=newV1.j+@(j-1);   end  /*�*j*/
newV1.ip=newV1.i;              do k=ip  by -1  for N;  newV1.k=newV1.k+@(k-1);   end  /*�*k*/
say  newV1.ip - newV1.i                   /*�*display the   Ith   Catalan number.  */
end   /*�*i*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
@:  parse arg newV2;   return newV1.newV2                    /*�*return the value of   @.[arg(1)]     */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Catalan-numbers-Pascals-triangle\catalan-numbers-pascals-triangle-2.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
