/*ͺ*REXX program counts the number of ways to make change with coins from an given amount.*/
numeric digits 20                                /*ͺ*be able to handle large amounts of $.*/
parse arg N newV3                                    /*ͺ*obtain optional arguments from the CL*/
if N='' | N=","    then N= 100                   /*ͺ*Not specified?  Then Use $1  (β‘100Β’).*/
if newV3='' | newV3=","    then newV3= 1 5 10 25             /*ͺ*Use penny/nickel/dime/quarter default*/
if left(N,1)=='$'  then N= 100 * substr(N, 2)    /*ͺ*the amount was specified in  dollars.*/
NN= N;                     coins= words(newV3)       /*ͺ*the number of coins specified.       */
newV1.= .;        do j=1  for coins                  /*ͺ*create a fast way of accessing specie*/
newV4= word(newV3, j);    newV5= newV4 ' coin'     /*ͺ*define an array element for the coin.*/
if newV4=='Β½' | newV4=="1/2"   then newV4= .5  /*ͺ*an alternate spelling of a halfβcent.*/
if newV4=='ΒΌ' | newV4=="1/4"   then newV4= .25 /*ͺ* "     "         "     " " quarterβΒ’.*/
newV2.j= newV4                             /*ͺ*assign the value to a particular coin*/
end   /*ͺ*j*/
newV4= n // 100;                    cnt=' cents'     /*ͺ* [β]  is the amount in whole dollars?*/
if newV4=0  then do;   NN= '$'  ||  (NN%100);  cnt=  /*ͺ*show the amount in dollars, not cents*/
end
say 'with an amount of '      comma(NN)cnt",  there are "         comma( MKchg(N, coins) )
say 'ways to make change with coins of the following denominations: '    newV3
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
comma: procedure; parse arg newV4;     n= newV4'.9';      newV6= 123456789;      b= verify(n, newV6, "M")
e= verify(n, newV6'0', , verify(n, newV6"0.", 'M'))  -  4
do j=e  to b  by -3;   newV4= insert(',', newV4, j);    end  /*ͺ*j*/;          return newV4
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
MKchg: procedure expose newV2. newV1.;           parse arg a,k       /*ͺ*function is recursive.   */
if newV1.a.k\==.  then return newV1.a.k                       /*ͺ*found this A & K before? */
if a==0       then return 1                           /*ͺ*unroll for a special case*/
if k==1       then return 1                           /*ͺ*   "    "  "    "      " */
if k==2  then f= 1                                    /*ͺ*handle this special case.*/
else f= MKchg(a, k-1)                        /*ͺ*count, recurse the amount*/
if a==newV2.k  then do;  newV1.a.k= f+1;  return newV1.a.k;  end  /*ͺ*handle this special case.*/
if a <newV2.k  then do;  newV1.a.k= f  ;  return f    ;  end  /*ͺ*   "     "     "      "  */
newV1.a.k= f + MKchg(a-newV2.k, k);       return newV1.a.k        /*ͺ*compute, define, return. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Count-the-coins\count-the-coins-2.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
