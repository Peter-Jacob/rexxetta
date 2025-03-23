/*�*REXX program introduces the  IF2  "statement",   a type of a four-way compound  IF:   */
parse arg bot top .                              /*�*obtain optional arguments from the CL*/
if bot=='' | bot==","  then bot=10               /*�*Not specified?  Then use the default.*/
if top=='' | top==","  then top=25               /*�* "      "         "   "   "     "    */
w=max(length(bot), length(top)) + 10             /*�*W:  max width, used for displaying #.*/

do newV1=bot  to  top                          /*�*put a  DO  loop through its paces.   */
/*�* [↓]  divisible by two and/or three? */
if2( newV1//2==0, newV1//3==0)                     /*�*use a new  four-way IF  statement.   */
select                                  /*�*now, test the four possible cases.   */
when if.11  then say right(newV1,w)      " is    divisible by both two and three."
when if.10  then say right(newV1,w)      " is    divisible by two, but not by three."
when if.01  then say right(newV1,w)      " is    divisible by three, but not by two."
when if.00  then say right(newV1,w)      " isn't divisible by two, nor by three."
otherwise    nop                        /*�*◄──┬◄ this statement is optional and */
end   /*�*select*/                        /*�*   ├◄ only exists in case one or more*/
end      /*�*#*/                             /*�*   └◄ WHENs  (above)  are omitted.   */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
if2: parse arg if.10,   if.01                    /*�*assign the cases of  10   and   01   */
if.11=   if.10 & if.01            /*�*   "    "  case   "  11              */
if.00= \(if.10 | if.01)           /*�*   "    "    "    "  00              */
return ''
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Extend-your-language\extend-your-language-2.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
