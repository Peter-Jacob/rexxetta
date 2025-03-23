/*�*REXX program finds the recursion limit:   a subroutine that repeatably calls itself.  */
parse version x;     say x;     say             /*�*display which REXX is being used.     */
newV1=0                                             /*�*initialize the numbers of invokes to 0*/
call self                                       /*�*invoke the  SELF  subroutine.         */
/*�* [↓]  this will never be executed.    */
exit                                            /*�*stick a fork in it,  we're all done.  */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
self: procedure expose newV1                        /*�*declaring that  SELF  is a subroutine.*/
newV1=newV1+1                                     /*�*bump number of times SELF is invoked. */
say newV1                                     /*�*display the number of invocations.    */
call self                                 /*�*invoke ourselves recursively.         */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Find-limit-of-recursion\find-limit-of-recursion-1.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
