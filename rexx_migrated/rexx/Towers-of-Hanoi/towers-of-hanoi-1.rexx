/*ͺ*REXX program  displays  the  moves  to solve  the  Tower of Hanoi  (with  N  disks).  */
parse arg N .                                    /*ͺ*get optional number of disks from CL.*/
if N=='' | N==","  then N=3                      /*ͺ*Not specified?  Then use the default.*/
newV4= 0                                             /*ͺ*#:  the number of disk moves (so far)*/
z= 2**N  -  1                                    /*ͺ*Z:   "     "    " minimum # of moves.*/
call mov  1, 3, N                                /*ͺ*move the top disk,  then recurse Β·Β·Β· */
say                                              /*ͺ* [β]  Display the minimum # of moves.*/
say 'The minimum number of moves to solve a '      N"βdisk  Tower of Hanoi is "     z
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
mov: procedure expose newV4 z; parse arg  newV1,newV2,newV3;          L= length(z)
if newV3==1  then do;  newV4= newV4 + 1                /*ͺ*bump the (disk) move counter by one. */
say 'step'   right(newV4, L)":  move disk on tower"   newV1  'ββββΊ'   newV2
end
else do;  call mov newV1,               6 -newV1 -newV2,         newV3 -1
call mov newV1,               newV2,                  1
call mov 6 - newV1 - newV2,      newV2,                newV3 -1
end
return                                      /*ͺ* [β]  this subroutine uses recursion.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Towers-of-Hanoi\towers-of-hanoi-1.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
