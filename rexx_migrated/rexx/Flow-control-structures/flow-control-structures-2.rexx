numeric digits 1000                 /*ͺ*prepare for some gihugeic numbers.*/
...
n=4
call factorial n
say n'!=' result
exit
/*ͺ*ββββββββββββββββββββββββββββββββββFACTORIAL subroutineββββββββββββββββ*/
factorial: parse arg x
newV1=1
do j=2  to x
newV1=newV1*j
end   /*ͺ*j*/
return newV1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Flow-control-structures\flow-control-structures-2.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
