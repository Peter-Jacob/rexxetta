/*�*REXX program  emulates  immutable variables  (as a post-computational check).         */
call immutable '$=1'                             /*�* ◄─── assigns an immutable variable. */
call immutable '   pi = 3.14159'                 /*�* ◄───    "     "     "         "     */
call immutable 'radius= 2*pi/4 '                 /*�* ◄───    "     "     "         "     */
call immutable '     r=13/2    '                 /*�* ◄───    "     "     "         "     */
call immutable '     d=0002 * r'                 /*�* ◄───    "     "     "         "     */
call immutable ' f.1  = 12**2  '                 /*�* ◄───    "     "     "         "     */

say '       $ ='  $                              /*�*show the variable, just to be sure.  */
say '      pi ='  pi                             /*�*  "   "      "       "   "  "   "    */
say '  radius ='  radius                         /*�*  "   "      "       "   "  "   "    */
say '       r ='  r                              /*�*  "   "      "       "   "  "   "    */
say '       d ='  d                              /*�*  "   "      "       "   "  "   "    */

do radius=10  to  -10  by -1 /*�*perform some faux important stuff.   */
circum=$*pi*2*radius         /*�*some kind of impressive calculation. */
end   /*�*k*/                  /*�* [↑]  that should do it, by gum.     */
call immutable                                   /*�* ◄═══ see if immutable variables OK. */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
immutable: if symbol('immutable.0')=='LIT'  then immutable.0= /*�*1st time see immutable? */
if arg()==0 then do                                /*�* [↓]  chk all immutables*/
do newV1=1  for words(immutable.0); newV2=word(immutable.0,newV1)
if value(newV2)==value('IMMUTABLE.!'newV2)  then iterate   /*�*same?*/
call ser -12, 'immutable variable  ' newV2 "  compromised."
end   /*�*__*/                  /*�* [↑]  Error?  ERRmsg, exit*/
return 0                        /*�*return and indicate  A-OK.*/
end                             /*�* [↓] immutable must have =*/
if pos('=',arg(1))==0  then call ser -4, "no equal sign in assignment:"  arg(1)
parse arg newV2 '=' newV1;         upper newV2;    newV2=space(newV2)    /*�*purify variable name.*/
if symbol("_")=='BAD'  then call ser -8,newV2 "isn't a valid variable symbol."
immutable.0=immutable.0 newV2                        /*�*add immutable var to list.*/
interpret '__='newV1;     call value newV2,newV1           /*�*assign value to a variable*/
call value 'IMMUTABLE.!'newV2,newV1                     /*�*assign value to bkup var. */
return words(immutable.0)                        /*�*return number immutables. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
ser:       say;     say '***error***'  arg(2);     say;     exit arg(1)     /*�*error msg.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Enforced-immutability\enforced-immutability.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
