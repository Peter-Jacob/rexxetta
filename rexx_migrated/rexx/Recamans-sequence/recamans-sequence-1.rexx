/*ͺ*REXX pgm computes a RecamΓ‘n sequence up to N; the 1st dup; # terms for a range of #'s.*/
parse arg N h .                                  /*ͺ*obtain optional arguments from the CL*/
if N=='' | N==","  then N=   15                  /*ͺ*Not specified?  Then use the default.*/
if h=='' | h==","  then h= 1000                  /*ͺ* "      "         "   "   "     "    */
say "RecamΓ‘n's sequence for the first "        N         " numbers: "    recaman(N)
say;  say "The first duplicate number in the RecamΓ‘n's sequence is: "          recaman(0)
say;  say "The number of terms to complete the range  0ββββΊ"h    ' is: '       recaman(-h)
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
recaman: procedure; parse arg y,,d.; newV2=0;  newV1.=0;   newV3=0;   newV1.0=1  /*ͺ*init. array and vars.*/
r= y<0;          Reca= 0;    hi= abs(y)      /*ͺ*for the 2nd invoke.  */
o= y==0;         if y<1  then y= 1e8         /*ͺ* "   "  3rd    "     */
do newV4=1  for y-1;          z= newV3 - newV4                    /*ͺ*next # might be < 0. */
if z<0  then              z= newV3 + newV4                    /*ͺ*this is faster than: */
else if newV1.z  then z= newV3 + newV4                    /*ͺ*if !.z | z<0 then Β·Β·Β·*/
newV1.z= 1;                      newV3= z                     /*ͺ*mark it;  add to seq.*/
if r  then do;  if z>hi      then iterate             /*ͺ*ignore #'s too large.*/
if d.z==''   then Reca= Reca + 1      /*ͺ*Unique? Bump counter.*/
d.z= .                                /*ͺ*mark # as a new low. */
if Reca>=hi  then return newV4            /*ͺ*list is complete β₯ HI*/
iterate
end                                        /*ͺ* [β]  a range of #s. */
if o  then do;  if d.z==.  then return z;  d.z=.;  iterate  /*ͺ*check if dup #.*/
end
newV2= newV2 z                                                /*ͺ*add number to $ list?*/
end   /*ͺ*#*/;                    return newV2              /*ͺ*return the  $  list. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Recamans-sequence\recamans-sequence-1.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
