/*�*REXX program  obtains and displays  Catalan numbers  from  a  Pascal's triangle.      */
parse arg N .                                    /*�*Obtain the optional argument from CL.*/
if N=='' | N==","  then N=15                     /*�*Not specified?  Then use the default.*/
numeric digits max(9, N%2 + N%8)                 /*�*so we can handle huge Catalan numbers*/
newV1.=.
do j=1  for N              /*�* [↓]  display   N   Catalan numbers. */
say  comb(j+j, j) % (j+1)  /*�*display the   Jth   Catalan number.  */
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
!:    procedure expose newV1.;  parse arg z;     if newV1.z\==. then return newV1.z;  newV2=1
do j=1  for arg(1);   newV2=newV2*j;   end;        newV1.z=newV2;   return newV2
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
comb: procedure expose newV1.;  parse arg x,y;   if x=y  then return 1;  if y>x  then return 0
if x-y<y  then y=x-y;     newV2=1;   do j=x-y+1  to x;  newV2=newV2*j;  end;       return newV2/!(y)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Catalan-numbers-Pascals-triangle\catalan-numbers-pascals-triangle-4.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
