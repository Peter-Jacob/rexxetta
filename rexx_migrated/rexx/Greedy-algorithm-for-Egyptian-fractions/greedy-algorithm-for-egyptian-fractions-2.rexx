/*ª*REXX pgm runs the EGYPTIAN program to find biggest denominator & # of terms.*/
parse arg top .                        /*ª*get optional parameter from the C.L. */
if top==''  then top=99                /*ª*Not specified?  Then use the default.*/
oTop=top;   top=abs(top)               /*ª*oTop used as a flag to display maxD. */
maxT=0;     maxD=0;     bigD=;   bigT= /*ª*initialize some REXX variables.      */
/*ª* [â†“]  determine biggest andlongest.  */
do n=2      to top               /*ª*traipse through the  numerators.     */
do d=n+1  to top             /*ª*   "       "     "  denominators     */
fract=n'/'d                  /*ª*create the fraction to be used.      */
y='EGYPTIAN'(fract||.)       /*ª*invoke the REXX program  EGYPTIAN.REX*/
t=words(y)                   /*ª*number of terms in Egyptian fraction.*/
if t>maxT  then bigT=fract   /*ª*is this a new high for number terms? */
maxT=max(maxT,T)             /*ª*find the maximum number of terms.    */
b=substr(word(y,t),3)        /*ª*get denominator from Egyptian fract. */
if b>maxD  then bigD=fract   /*ª*is this a new denominator high ?     */
maxD=max(maxD,b)             /*ª*find the maximum denominator.        */
end   /*ª*d*/                  /*ª* [â†‘]  only use proper fractions.     */
end       /*ª*n*/                  /*ª* [â†‘]  ignore the   1/n   fractions.  */
/*ª* [â†‘]  display the longest and biggest*/
newV1= 'in the Egyptian fractions used is' /*ª*literal is used to make a shorter SAY*/
say 'largest number of terms'  newV1   maxT   "terms for"   bigT
say
say 'highest denominator'      newV1   length(maxD)   "digits for"  bigD
if oTop>0  then say maxD               /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Greedy-algorithm-for-Egyptian-fractions\greedy-algorithm-for-egyptian-fractions-2.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
