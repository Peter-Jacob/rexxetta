/*ͺ*REXX program has a list of ten functions, each returns its invocation (index) squared.*/
parse arg seed base newV1                            /*ͺ*obtain optional arguments from the CL*/
if datatype(seed, 'W')  then call random ,,seed  /*ͺ*Not given?  Use random  start seed.  */
if base=='' | base=","  then base=0              /*ͺ* "    "     Use a zeroβbased list.   */
if newV1=''  then newV1= 8 5 4 9 1 3 2 7 6 0             /*ͺ* "    "     Use ordered function list*/
/*ͺ*the $ list must contain 10 functions.*/
say 'the' word("zero one", base+1)'βbased list is: '   newV1       /*ͺ*show list of functions.*/
/*ͺ*BASED  must be either   1   or   0.  */
newV2='.'random(0, 9)                                /*ͺ*get a random name of a function.     */
interpret  'CALL'  newV2                             /*ͺ*invoke a randomly selected function. */
say 'function '    newV2     " returned "    result  /*ͺ*display the value of random function.*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββ[Below are the closest things to anonymous functions in REXX].*/
.0: return  .(0)                                 /*ͺ*function  .0   βββ bump its counter. */
.1: return  .(1)                                 /*ͺ*    '     .1    "    "   "     "     */
.2: return  .(2)                                 /*ͺ*    '     .2    "    "   "     "     */
.3: return  .(3)                                 /*ͺ*    '     .3    "    "   "     "     */
.4: return  .(4)                                 /*ͺ*    '     .4    "    "   "     "     */
.5: return  .(5)                                 /*ͺ*    '     .5    "    "   "     "     */
.6: return  .(6)                                 /*ͺ*    '     .6    "    "   "     "     */
.7: return  .(7)                                 /*ͺ*    '     .7    "    "   "     "     */
.8: return  .(8)                                 /*ͺ*    '     .8    "    "   "     "     */
.9: return  .(9)                                 /*ͺ*    '     .9    "    "   "     "     */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
.:  arg #;  newV3=wordpos(#,newV1); if newV3==0  then return 'not in the list.'; return (newV3-(\base))**2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Closures-Value-capture\closures-value-capture.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
