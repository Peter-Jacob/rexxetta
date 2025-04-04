/*ͺ*REXX program counts the number of ways to make change with coins from an given amount.*/
numeric digits 20                                /*ͺ*be able to handle large amounts of $.*/
parse arg N newV4                                    /*ͺ*obtain optional arguments from the CL*/
if N='' | N=","    then N= 100                   /*ͺ*Not specified?  Then Use $1  (β‘100Β’).*/
if newV4='' | newV4=","    then newV4= 1 5 10 25             /*ͺ*Use penny/nickel/dime/quarter default*/
X= N                                             /*ͺ*save original for possible error msgs*/
if left(N,1)=='$'  then do                       /*ͺ*the amount has a leading dollar sign.*/
newV5= substr(N, 2)          /*ͺ*the amount was specified in  dollars.*/
if \isNum(newV5)  then call ser  "amount isn't numeric: "   N
N= 100 * newV5               /*ͺ*change amount (in $) ββββΊ  cents (Β’).*/
end
maxnewV4= 10 ** digits()                             /*ͺ*the maximum amount this pgm can have.*/
if \isNum(N)  then call  ser  X   " amount isn't numeric."
if N=0        then call  ser  X   " amount can't be zero."
if N<0        then call  ser  X   " amount can't be negative."
if N>maxnewV4     then call  ser  X   " amount can't be greater than " maxnewV4'.'
coins= words(newV4);   newV1.= .;     NN= N;       p= 0  /*ͺ*#coins specified; coins; amount; prev*/
newV2.= 0                                            /*ͺ*verify a coin was only specified once*/
do j=1  for coins;     newV5= word(newV4, j)   /*ͺ*create a fast way of accessing specie*/
newV6= newV5  ' coin'                          /*ͺ*define an array element for the coin.*/
if newV5=='Β½' | newV5=="1/2"   then newV5= .5      /*ͺ*an alternate spelling of a halfβcent.*/
if newV5=='ΒΌ' | newV5=="1/4"   then newV5= .25     /*ͺ* "     "         "     " " quarterβΒ’.*/
if \isNum(newV5)  then call ser newV6 "coin value isn't numeric."
if newV5<0        then call ser newV6 "coin value can't be negative."
if newV5<=0       then call ser newV6 "coin value can't be zero."
if newV2.newV5        then call ser newV6 "coin was already specified."
if newV5<p        then call ser newV6 "coin must be greater than previous:"    p
if newV5>N        then call ser newV6 "coin must be less or equal to amount:"  X
newV2.newV5= 1;   p= newV5                         /*ͺ*signify coin was specified; set prev.*/
newV3.j= newV5                                 /*ͺ*assign the value to a particular coin*/
end   /*ͺ*j*/
newV5= n // 100;                    cnt= ' cents'    /*ͺ* [β]  is the amount in whole dollars?*/
if newV5=0  then do;   NN= '$'  ||  (NN%100);  cnt=  /*ͺ*show the amount in dollars, not cents*/
end
say 'with an amount of '        comma(NN)cnt",  there are "       comma( MKchg(N, coins) )
say 'ways to make change with coins of the following denominations: '    newV4
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
isNum: return datatype(arg(1), 'N')              /*ͺ*return 1 if arg is numeric, 0 if not.*/
ser:   say;   say '***error***';   say;   say arg(1);   say;   exit 13      /*ͺ*error msg.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
comma: procedure; parse arg newV5;     n= newV5'.9';      newV7= 123456789;       b= verify(n, newV7, "M")
e= verify(n, newV7'0', , verify(n, newV7"0.", 'M'))  -  4
do j=e  to b  by -3;   newV5= insert(',', newV5, j);    end  /*ͺ*j*/;          return newV5
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
MKchg: procedure expose newV3. newV1.;           parse arg a,k       /*ͺ*function is recursive.   */
if newV1.a.k\==.  then return newV1.a.k                       /*ͺ*found this A & K before? */
if a==0       then return 1                           /*ͺ*unroll for a special case*/
if k==1       then return 1                           /*ͺ*   "    "  "    "      " */
if k==2  then f= 1                                    /*ͺ*handle this special case.*/
else f= MKchg(a, k-1)                        /*ͺ*count, recurse the amount*/
if a==newV3.k  then do;  newV1.a.k= f+1;  return newV1.a.k;  end  /*ͺ*handle this special case.*/
if a <newV3.k  then do;  newV1.a.k= f  ;  return f    ;  end  /*ͺ*   "     "     "      "  */
newV1.a.k= f + MKchg(a-newV3.k, k);       return newV1.a.k        /*ͺ*compute, define, return. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Count-the-coins\count-the-coins-3.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
