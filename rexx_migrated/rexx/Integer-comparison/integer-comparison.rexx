/*�*REXX program  prompts  for  two integers,   compares them,  and  displays the results.*/
numeric digits 2000                              /*�*for the users that really go ka─razy.*/
newV1=copies('─', 20)                                /*�*eyeball catcher for the user's eyen. */
a=getInt(newV1  'Please enter your 1st integer:')    /*�*obtain the 1st integer from the user.*/
b=getInt(newV1  'Please enter your 2nd integer:')    /*�*   "    "  2nd    "      "   "    "  */
say
if a<b  then say  newV1   a    ' is less than '        b
if a=b  then say  newV1   a    ' is equal to '         b
if a>b  then say  newV1   a    ' is greater than '     b
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
getInt:       do forever;     say                /*�*keep prompting the user until success*/
say arg(1)         /*�*display the prompt message to console*/
parse pull x                       /*�*obtain  X,  and keep its case intact.*/
select
when x=''               then call serr "No argument was entered."
when words(x)>1         then call serr 'Too many arguments entered.'  x
when \datatype(x, 'N')  then call serr "Argument isn't numeric:"      x
when \datatype(x, 'W')  then call serr "Argument isn't an integer:"   x
otherwise    return x           /*�* [↑]  Eureka!   Return # to invoker. */
end   /*�*select*/
end      /*�*forever*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
serr:  say newV1  '***error*** '    arg(1);        say newV1  "Please try again.";          return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Integer-comparison\integer-comparison.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
