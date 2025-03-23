numeric digits 1000                 /*�*prepare for some gihugeic numbers.*/
...
n=4
call factorial n
say n'!=' result
exit
/*�*──────────────────────────────────FACTORIAL subroutine────────────────*/
factorial: parse arg x
newV1=1
do j=2  to x
newV1=newV1*j
end   /*�*j*/
return newV1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Flow-control-structures\flow-control-structures-2.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
