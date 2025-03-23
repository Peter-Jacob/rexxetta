/*�*REXX program counts the number of ways to make change with coins from an given amount.*/
numeric digits 20                                /*�*be able to handle large amounts of $.*/
parse arg N newV2                                    /*�*obtain optional arguments from the CL*/
if N='' | N=","     then N= 100                  /*�*Not specified?  Then Use $1  (≡100¢).*/
if newV2='' | newV2=","     then newV2= 1 5 10 25            /*�*Use penny/nickel/dime/quarter default*/
if left(N, 1)=='$'  then N= 100 * substr(N, 2)   /*�*the count was specified in  dollars. */
coins= words(newV2)                                  /*�*the number of coins specified.       */
NN= N;              do j=1  for coins            /*�*create a fast way of accessing specie*/
newV3= word(newV2, j)                /*�*define an array element for the coin.*/
if newV3=='1/2'  then newV3=.5       /*�*an alternate spelling of a half-cent.*/
if newV3=='1/4'  then newV3=.25      /*�* "     "         "     " " quarter-¢.*/
newV1.j= newV3                       /*�*assign the value to a particular coin*/
end   /*�*j*/
newV3= n//100;                       cnt=' cents'    /*�* [↓]  is the amount in whole dollars?*/
if newV3=0  then do;    NN= '$' || (NN%100);   cnt=  /*�*show the amount in dollars, not cents*/
end                                 /*�*show the amount in dollars, not cents*/
say 'with an amount of '      comma(NN)cnt",  there are "         comma( MKchg(N, coins) )
say 'ways to make change with coins of the following denominations: '    newV2
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
comma: procedure; parse arg newV3;     n= newV3'.9';      newV4= 123456789;      b= verify(n, newV4, "M")
e= verify(n, newV4'0', , verify(n, newV4"0.", 'M'))  -  4
do j=e  to b  by -3;   newV3= insert(',', newV3, j);    end  /*�*j*/;          return newV3
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
MKchg: procedure expose newV1.;        parse arg a,k /*�*this function is invoked recursively.*/
if a==0    then return 1                  /*�*unroll for a special case of  zero.  */
if k==1    then return 1                  /*�*   "    "  "    "      "   "  unity. */
if k==2    then f= 1                      /*�*handle this special case   of  two.  */
else f= MKchg(a, k-1)          /*�*count,  and then recurse the amount. */
if a==newV1.k  then return f+1                /*�*handle this special case of A=a coin.*/
if a <newV1.k  then return f                  /*�*   "     "     "      "   " A<a coin.*/
return f+MKchg(a-newV1.k,k)   /*�*use diminished amount ($) for change.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Count-the-coins\count-the-coins-1.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
