/*�*REXX pgm shows named parameters when called as a subroutine/function*/
/*�*┌────────────────────────────────────────────────────────────────────┐
│ The syntax of:   xxx = func1(parmName2=arg2, parmName1=arg1)       │
│                                                                    │
│ in the REXX language is interpreted specifically as:               │
│                                                                    │
│                  xxx = func1(    yyy       ,       zzz     )       │
│                                                                    │
│ where  yyy  is the logical result of comparing (the REXX variables)│
│                                                                    │
│                    parmName2   with   arg2                   and   │
│                                                                    │
│ where  zzz  is the logical result of comparing (the REXX variables)│
│                                                                    │
│                    parmName1   with   arg1                         │
│                                                                    │
│ (either as two strings,  or arithmetically if both "parmName2" and │
│ "arg2"  are both valid REXX numbers.   In the REXX language, there │
│ is no way to declare (define) what a variable is [or its type], as │
│ each literal that can be a variable is assumed to be one.  If it's │
│ not defined, then its uppercase name is used for the value.        │
│                                                                    │
│ Consider the one-line REXX program:    say Where are you?          │
│ causes REXX to consider that four-word expression as a  "SAY"      │
│ statement, followed by three REXX variables,  each of which aren't │
│ defined (that is, have a value), so REXX uses a value which is the │
│ uppercased value of the REXX variable name, namely three values in │
│ this case,  so the following is displayed:   WHERE ARE YOU?        │
│                                                                    │
│ [There is a mechanism in REXX to catch this behavior and raise the │
│ NOVALUE  condition.]                                               │
│                                                                    │
│ To allow a solution to be used for this task's requirement,  and   │
│ and not get tangled up with the legal REXX syntactical expressions │
│ shown,  this REXX  programming example  uses a  variation  of the  │
│ task's illustration  to allow a  method in REXX  of using  named   │
│ parameters:      xxx = func1('parmName2=' arg2, "parmName1=" arg1) │
│                                                                    │
│ Also,  REXX allows the omitting of arguments by just specifying a  │
│ comma  (or nothing at all,  in the case of a single argument):     │
│                                                                    │
│                  xxx = func1(,zzz)                                 │
│                                                                    │
│ would indicate that the 1st argument has been omitted.             │
│                                                                    │
│                  xxx = func1(yyy)                                  │
│                                                                    │
│ would indicate that the 2nd argument  (and all other subsequent    │
│ arguments)  has/have been omitted.                                 │
└────────────────────────────────────────────────────────────────────┘*/

parse arg count,itemX                  /*�*assume 2 values have been used,*/
/*�*or whatever ... just to show...*/
do j=1  for arg();      newV1=arg(1)     /*�*now, lets examine each argument*/
if arg(j,'Omitted')     then iterate /*�*skip examining if argJ omitted.*/
/*�*(above)   This is superfluous, */
/*�* but it demonstrates a method. */
if \arg(j,"Exists")     then iterate /*�*exactly the same as previous.  */
/*�*Only 1st char (2nd arg) is used*/
first=strip(word(newV1,1))               /*�*extract the 1st word in arg(j).*/
if right(first,1)\=='=' then iterate /*�*skip if 1st word isn't:  xxx=  */
parse var newV1 varname '= ' value       /*�*parse the named variable &value*/
if varname==''          then iterate /*�*not the correct format, so skip*/
/*�*(above) fix this for real pgm. */
call value varname,value             /*�*use BIF to set REXX variable.  */
end   /*�*j*/

/*�* ∙∙∙ perform some REXX magic here with specified parameters and stuff:*/
/*�*     do this,  do that,  perform dis & dat, compute, gears whiz, cogs */
/*�*     turn,  wheels spin,  belts move, things get assigned, stuff gets */
/*�*     computed,  wheels spin,  belts move,  things get assigned, motors*/
/*�*     humm, engines roar, coal gets burned, water turns to steam, real */
/*�*     work (some of it useful)  gets done,  and something is produced. */

return  'the final meaning of life, or 42  --- whichever is appropriate.'
/*�*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Named-parameters\named-parameters-1.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
