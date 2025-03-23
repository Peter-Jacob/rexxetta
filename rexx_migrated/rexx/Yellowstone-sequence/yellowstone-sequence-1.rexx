/*�*REXX program calculates any number of terms in the Yellowstone (permutation) sequence.*/
parse arg m .                                    /*�*obtain optional argument from the CL.*/
if m=='' | m==","  then m= 30                    /*�*Not specified?  Then use the default.*/
newV1.= 0                                            /*�*initialize an array of numbers(used).*/
newV3 = 0                                            /*�*count of Yellowstone numbers in seq. */
newV4=                                               /*�*list   "      "         "     "  "   */
do j=1  until newV3==m;  prev= newV3 - 1
if j<5  then do;  newV3= newV3+1;   newV2.newV3= j;  newV1.newV3= j;  newV1.j= 1;  newV4= strip(newV4 j);  iterate;  end

do k=1;   if newV1.k  then iterate          /*�*Already used?  Then skip this number.*/
if gcd(k, newV2.prev)<2  then iterate       /*�*Not meet requirement?  Then skip it. */
if gcd(k, newV2.newV3) \==1  then iterate       /*�* "    "       "          "    "   "  */
newV3= newV3+1;   newV2.newV3= k;     newV1.k= 1;   newV4= newV4 k  /*�*bump ctr; assign; mark used; add list*/
leave                                   /*�*find the next Yellowstone seq. number*/
end   /*�*k*/
end      /*�*j*/
say newV4                                            /*�*display a list of a Yellowstone seq. */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
gcd: parse arg x,y;  do until y==0;  parse value  x//y  y   with   y  x;  end;    return x
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Yellowstone-sequence\yellowstone-sequence-1.rexx was migrated on 23 Mar 2025 at 10:43:36
 * -------------------------------------------------------------------------
*/ 
