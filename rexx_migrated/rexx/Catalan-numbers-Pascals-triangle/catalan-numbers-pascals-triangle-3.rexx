/*�*REXX program  obtains and displays  Catalan numbers  from  a  Pascal's triangle.      */
parse arg N .                                    /*�*Obtain the optional argument from CL.*/
if N=='' | N==","  then N=15                     /*�*Not specified?  Then use the default.*/
numeric digits max(9, N%2 + N%8)                 /*�*so we can handle huge Catalan numbers*/
do j=1  for N              /*�* [↓]  display   N   Catalan numbers. */
say  comb(j+j, j) % (j+1)  /*�*display the   Jth   Catalan number.  */
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
!:    procedure; parse arg z;   newV1=1;     do j=1  for arg(1);  newV1=newV1*j;  end;        return newV1
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
comb: procedure; parse arg x,y;        if x=y  then return 1;   if y>x  then return 0
if x-y<y  then y=x-y;     newV1=1;   do j=x-y+1  to x;  newV1=newV1*j;  end;       return newV1/!(y)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Catalan-numbers-Pascals-triangle\catalan-numbers-pascals-triangle-3.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
