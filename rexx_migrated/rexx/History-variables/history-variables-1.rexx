/*ͺ*REXX program demonstrates a method to track history of assignments to a REXX variable.*/
varSet!.=0                                       /*ͺ*initialize the all of the VARSET!'s. */
call varSet 'fluid',min(0,-5/2,-1)     ;    say 'fluid=' fluid
call varSet 'fluid',3.14159            ;    say 'fluid=' fluid
call varSet 'fluid',' Santa  Claus'    ;    say 'fluid=' fluid
call varSet 'fluid',,999
say 'There were' result "assignments (sets) for the FLUID variable."
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
varSet: arg ?x;  parse arg newV1, newV2, newV3            /*ͺ*obtain varName, value, optionalβList.*/
if newV3=='' then do                                /*ͺ*not la ist,  so set the  X  variable.*/
newV4=varSet!.0.?x+1                 /*ͺ*bump the history count  (# of SETs). */
varSet!.0.?x=newV4                   /*ͺ*   ... and store it in the "database"*/
varSet!.newV4.?x=newV2                  /*ͺ*   ... and store the  SET  value.    */
call value(?x),newV2                 /*ͺ*now,  set the real  X  variable.     */
return newV2                         /*ͺ*also, return the value for function. */
end
say                                              /*ͺ*show a blank line for readability.   */
do newV5=1 to newV3 while newV5<=varSet!.0.?x /*ͺ*display the list of  "set"  history. */
say 'history entry' newV5 "for var" newV1":" varSet!.newV5.?x
end   /*ͺ*?j*/
return newV5-1                                      /*ͺ*return the number of assignments.    */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\History-variables\history-variables-1.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
