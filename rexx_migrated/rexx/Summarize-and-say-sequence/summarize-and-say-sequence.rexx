/*ª*REXX pgm generates a selfâ”€referential sequence and displays sequences with max length.*/
parse arg LO HI .                                /*ª*obtain optional arguments from the CL*/
if LO=='' | LO==","  then LO=      1             /*ª*Not specified?  Then use the default.*/
if HI=='' | HI==","  then HI=1000000 - 1         /*ª* "      "         "   "   "     "    */
maxnewV3=;      seeds=;    maxL=0                    /*ª*inialize some defaults and counters. */

do newV2=LO  to HI;      n=newV2;     newV1.=0;     newV1.newV2=1  /*ª*loop thru seed; define some defaults.*/
newV3=n
do c=1  until x==n;       x=n              /*ª*generate a selfâ”€referential sequence.*/
n=;           do k=9  by -1  for 10        /*ª*generate a new sequence (downwards). */
newV4=countstr(k, x)             /*ª*obtain the number of sequence counts.*/
if newV4\==0  then n=n || newV4 || k /*ª*is count > zero?  Then append it to N*/
end   /*ª*k*/
if newV1.n  then leave                         /*ª*has sequence been generated before ? */
newV3=newV3'-'n;     newV1.n=1                         /*ª*add the number to sequence and roster*/
end   /*ª*c*/

if c==maxL then do;  seeds=seeds newV2             /*ª*is the sequence equal to max so far ?*/
maxnewV3=maxnewV3   newV3             /*ª*append this selfâ”€referential # to  $ */
end
else if c>maxL  then do;  seeds=newV2   /*ª*use the new number as the new seed.  */
maxL=c; maxnewV3=newV3 /*ª*also, set the new maximum L; max seq.*/
end            /*ª* [â†‘]  have we found a new best seq ? */
end   /*ª*#*/

say  ' seeds that had the most iterations: '     seeds
say  'the maximum selfâ”€referential length: '     maxL

do j=1  for words(maxnewV3) ;      say
say copies('â”€',30)  "iteration sequence for: "   word(seeds,j)  '  ('maxL  "iterations)"
q=translate( word( maxnewV3, j), ,'-')
do k=1  for words(q);     say  word(q, k)
end   /*ª*k*/
end   /*ª*j*/                                    /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Summarize-and-say-sequence\summarize-and-say-sequence.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
