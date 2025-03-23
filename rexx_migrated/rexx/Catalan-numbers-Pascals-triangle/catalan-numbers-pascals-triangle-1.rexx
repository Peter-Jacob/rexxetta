/*ª*REXX program  obtains and displays  Catalan numbers  from  a  Pascal's triangle.      */
parse arg N .                                    /*ª*Obtain the optional argument from CL.*/
if N=='' | N==","  then N=15                     /*ª*Not specified?  Then use the default.*/
numeric digits max(9, N%2 + N%8)                 /*ª*so we can handle huge Catalan numbers*/
newV1.=0;   newV1.1=1                                    /*ª*stem array default; define 1st value.*/

do i=1  for N;                               ip=i+1
do j=i   by -1  for N;   jm=j-1;   newV1.j=newV1.j+newV1.jm;    end /*ª*j*/
newV1.ip=newV1.i;           do k=ip  by -1  for N;   km=k-1;   newV1.k=newV1.k+newV1.km;    end /*ª*k*/
say  newV1.ip - newV1.i                                /*ª*display the   Ith   Catalan number.  */
end   /*ª*i*/                                    /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Catalan-numbers-Pascals-triangle\catalan-numbers-pascals-triangle-1.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
