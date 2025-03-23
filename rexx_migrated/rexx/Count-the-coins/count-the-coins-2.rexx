/*�*REXX program counts the number of ways to make change with coins from an given amount.*/
numeric digits 20                                /*�*be able to handle large amounts of $.*/
parse arg N newV3                                    /*�*obtain optional arguments from the CL*/
if N='' | N=","    then N= 100                   /*�*Not specified?  Then Use $1  (≡100¢).*/
if newV3='' | newV3=","    then newV3= 1 5 10 25             /*�*Use penny/nickel/dime/quarter default*/
if left(N,1)=='$'  then N= 100 * substr(N, 2)    /*�*the amount was specified in  dollars.*/
NN= N;                     coins= words(newV3)       /*�*the number of coins specified.       */
newV1.= .;        do j=1  for coins                  /*�*create a fast way of accessing specie*/
newV4= word(newV3, j);    newV5= newV4 ' coin'     /*�*define an array element for the coin.*/
if newV4=='½' | newV4=="1/2"   then newV4= .5  /*�*an alternate spelling of a half─cent.*/
if newV4=='¼' | newV4=="1/4"   then newV4= .25 /*�* "     "         "     " " quarter─¢.*/
newV2.j= newV4                             /*�*assign the value to a particular coin*/
end   /*�*j*/
newV4= n // 100;                    cnt=' cents'     /*�* [↓]  is the amount in whole dollars?*/
if newV4=0  then do;   NN= '$'  ||  (NN%100);  cnt=  /*�*show the amount in dollars, not cents*/
end
say 'with an amount of '      comma(NN)cnt",  there are "         comma( MKchg(N, coins) )
say 'ways to make change with coins of the following denominations: '    newV3
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
comma: procedure; parse arg newV4;     n= newV4'.9';      newV6= 123456789;      b= verify(n, newV6, "M")
e= verify(n, newV6'0', , verify(n, newV6"0.", 'M'))  -  4
do j=e  to b  by -3;   newV4= insert(',', newV4, j);    end  /*�*j*/;          return newV4
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
MKchg: procedure expose newV2. newV1.;           parse arg a,k       /*�*function is recursive.   */
if newV1.a.k\==.  then return newV1.a.k                       /*�*found this A & K before? */
if a==0       then return 1                           /*�*unroll for a special case*/
if k==1       then return 1                           /*�*   "    "  "    "      " */
if k==2  then f= 1                                    /*�*handle this special case.*/
else f= MKchg(a, k-1)                        /*�*count, recurse the amount*/
if a==newV2.k  then do;  newV1.a.k= f+1;  return newV1.a.k;  end  /*�*handle this special case.*/
if a <newV2.k  then do;  newV1.a.k= f  ;  return f    ;  end  /*�*   "     "     "      "  */
newV1.a.k= f + MKchg(a-newV2.k, k);       return newV1.a.k        /*�*compute, define, return. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Count-the-coins\count-the-coins-2.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
