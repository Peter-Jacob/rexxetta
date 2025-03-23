/*�*REXX pgm generates a self─referential sequence and displays sequences with max length.*/
parse arg LO HI .                                /*�*obtain optional arguments from the CL*/
if LO=='' | LO==","  then LO=      1             /*�*Not specified?  Then use the default.*/
if HI=='' | HI==","  then HI=1000000 - 1         /*�* "      "         "   "   "     "    */
maxnewV3=;      seeds=;    maxL=0                    /*�*inialize some defaults and counters. */

do newV2=LO  to HI;      n=newV2;     newV1.=0;     newV1.newV2=1  /*�*loop thru seed; define some defaults.*/
newV3=n
do c=1  until x==n;       x=n              /*�*generate a self─referential sequence.*/
n=;           do k=9  by -1  for 10        /*�*generate a new sequence (downwards). */
newV4=countstr(k, x)             /*�*obtain the number of sequence counts.*/
if newV4\==0  then n=n || newV4 || k /*�*is count > zero?  Then append it to N*/
end   /*�*k*/
if newV1.n  then leave                         /*�*has sequence been generated before ? */
newV3=newV3'-'n;     newV1.n=1                         /*�*add the number to sequence and roster*/
end   /*�*c*/

if c==maxL then do;  seeds=seeds newV2             /*�*is the sequence equal to max so far ?*/
maxnewV3=maxnewV3   newV3             /*�*append this self─referential # to  $ */
end
else if c>maxL  then do;  seeds=newV2   /*�*use the new number as the new seed.  */
maxL=c; maxnewV3=newV3 /*�*also, set the new maximum L; max seq.*/
end            /*�* [↑]  have we found a new best seq ? */
end   /*�*#*/

say  ' seeds that had the most iterations: '     seeds
say  'the maximum self─referential length: '     maxL

do j=1  for words(maxnewV3) ;      say
say copies('─',30)  "iteration sequence for: "   word(seeds,j)  '  ('maxL  "iterations)"
q=translate( word( maxnewV3, j), ,'-')
do k=1  for words(q);     say  word(q, k)
end   /*�*k*/
end   /*�*j*/                                    /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Summarize-and-say-sequence\summarize-and-say-sequence.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
