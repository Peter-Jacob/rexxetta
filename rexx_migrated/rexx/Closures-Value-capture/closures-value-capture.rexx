/*�*REXX program has a list of ten functions, each returns its invocation (index) squared.*/
parse arg seed base newV1                            /*�*obtain optional arguments from the CL*/
if datatype(seed, 'W')  then call random ,,seed  /*�*Not given?  Use random  start seed.  */
if base=='' | base=","  then base=0              /*�* "    "     Use a zero─based list.   */
if newV1=''  then newV1= 8 5 4 9 1 3 2 7 6 0             /*�* "    "     Use ordered function list*/
/*�*the $ list must contain 10 functions.*/
say 'the' word("zero one", base+1)'─based list is: '   newV1       /*�*show list of functions.*/
/*�*BASED  must be either   1   or   0.  */
newV2='.'random(0, 9)                                /*�*get a random name of a function.     */
interpret  'CALL'  newV2                             /*�*invoke a randomly selected function. */
say 'function '    newV2     " returned "    result  /*�*display the value of random function.*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*────────────────────────[Below are the closest things to anonymous functions in REXX].*/
.0: return  .(0)                                 /*�*function  .0   ─── bump its counter. */
.1: return  .(1)                                 /*�*    '     .1    "    "   "     "     */
.2: return  .(2)                                 /*�*    '     .2    "    "   "     "     */
.3: return  .(3)                                 /*�*    '     .3    "    "   "     "     */
.4: return  .(4)                                 /*�*    '     .4    "    "   "     "     */
.5: return  .(5)                                 /*�*    '     .5    "    "   "     "     */
.6: return  .(6)                                 /*�*    '     .6    "    "   "     "     */
.7: return  .(7)                                 /*�*    '     .7    "    "   "     "     */
.8: return  .(8)                                 /*�*    '     .8    "    "   "     "     */
.9: return  .(9)                                 /*�*    '     .9    "    "   "     "     */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
.:  arg #;  newV3=wordpos(#,newV1); if newV3==0  then return 'not in the list.'; return (newV3-(\base))**2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Closures-Value-capture\closures-value-capture.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
