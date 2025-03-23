/*�*REXX program  partitions  integer(s)    (greater than unity)   into   N   primes.     */
parse arg what                                   /*�*obtain an optional list from the C.L.*/

do  until what==''                             /*�*possibly process a series of integers*/
parse var what x n what; parse var  x  x '-' y /*�*get possible range  and # partitions.*/
parse var  n  n '-' m /*�* "      "      "     "  "      "     */
if x=='' | x==","   then x= 19                 /*�*Not specified?  Then use the default.*/
if y=='' | y==","   then y=  x                 /*�* "      "         "   "   "     "    */
if n=='' | n==","   then n=  3                 /*�* "      "         "   "   "     "    */
if m=='' | m==","   then m=  n                 /*�* "      "         "   "   "     "    */
call genP y                                    /*�*generate   Y   number of primes.     */
do   g=x  to y              /*�*partition  X ───► Y  into partitions.*/
do q=n  to m;  call part  /*�*    "      G   into    Q    primes.  */
end  /*�*q*/
end    /*�*g*/
end   /*�*until*/

exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
genP: arg high;     newV1.1= 2;   newV1.2= 3;    newV2= 2    /*�*get highest prime, assign some vars. */
do j=newV1.newV2+2  by 2  until newV1.newV2>high  /*�*only find odd primes from here on.   */
do k=2  while k*k<=j           /*�*divide by some known low odd primes. */
if j // newV1.k==0  then iterate j /*�*Is  J  divisible by P?  Then ¬ prime.*/
end   /*�*k*/                    /*�* [↓]  a prime  (J)  has been found.  */
newV2= newV2 + 1;               newV1.newV2= j    /*�*bump prime count; assign prime to  @.*/
end      /*�*j*/;         return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
getP: procedure expose i. p. newV1.;  parse arg z    /*�*bump the prime in the partition list.*/
if i.z==0  then do;   newV3= z - 1;     i.z= i.newV3;   end
i.z= i.z + 1;         newV3= i.z;       p.z= newV1.newV3;                      return 0
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
list: newV3= p.1;    if newV5==g  then do j=2  to q;     newV3= newV3 p.j
end   /*�*j*/
else newV3= '__(not_possible)'
return 'prime'  ||  word("s", 1 + (q==1))   translate(newV3, '+ ', " _")    /*�*plural? */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
part: i.= 0;  do j=1  for q;   call getP j
end   /*�*j*/

do newV4=0  by 0;         newV5= 0         /*�*!:  a DO variable for LEAVE & ITERATE*/
do s=1  for q;    newV5= newV5 + p.s   /*�* [↓]  is sum of the primes too large?*/
if newV5>g  then do;  if s==1  then leave newV4        /*�*perform a quick exit?*/
do k=s    to q;  i.k= 0;       end  /*�*k*/
do r=s-1  to q;  call getP r;  end  /*�*r*/
iterate newV4
end
end   /*�*s*/
if newV5==g  then leave                /*�*is sum of the primes exactly right ? */
if newV5 <g  then do;    call getP q;    iterate;    end
end   /*�*!*/                        /*�* [↑]   Is sum too low?  Bump a prime.*/
say 'partitioned'       center(g,9)        "into"        center(q, 5)        list()
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Partition-an-integer-x-into-n-primes\partition-an-integer-x-into-n-primes.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
