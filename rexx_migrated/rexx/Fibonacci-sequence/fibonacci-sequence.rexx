/*ͺ*REXX program calculates the  Nth  Fibonacci number,   N   can be  zero  or  negative. */
numeric digits 210000                            /*ͺ*be able to handle ginormous numbers. */
parse  arg  x y .                                /*ͺ*allow a  single number  or  a range. */
if x=='' | x==","  then do;  x=-40;  y=+40;  end /*ͺ*No input?  Then use range -40 βββΊ +40*/
if y=='' | y==","  then y=x                      /*ͺ*if only one number, display   fib(X).*/
w= max(length(x),  length(y) )                   /*ͺ*W:  used for making formatted output.*/
fw= 10                                           /*ͺ*Minimum maximum width. Sounds kaβrazy*/
do j=x  to y;          q= fib(j)           /*ͺ*process all of the Fibonacci requests*/
L= length(q)                               /*ͺ*obtain the length (decimal digs) of Q*/
fw= max(fw, L)                             /*ͺ*fib number length, or the max so far.*/
say 'Fibonacci('right(j,w)") = "  right(q,fw)                   /*ͺ*right justify Q.*/
if L>10  then  say    'Fibonacci('right(j, w)") has a length of"     L
end   /*ͺ*j*/                                /*ͺ* [β]  list a Fib. sequence of  xβββΊy */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
fib:  procedure; parse arg n;        an= abs(n)  /*ͺ*use  βnβ   (the absolute value of N).*/
a= 0;    b= 1;   if an<2  then return an   /*ͺ*handle two special cases: zero & one.*/
/*ͺ* [β]   this method is nonβrecursive. */
do k=2  to an;   newV1= a+b;   a= b;   b= newV1 /*ͺ*sum  the numbers  up to   βnβ        */
end   /*ͺ*k*/                             /*ͺ* [β]  (only positive Fibs nums used).*/
/*ͺ* [β]  an//2   [same as]   (an//2==1).*/
if n>0 | an//2   then  return  newV1           /*ͺ*Positive or even?   Then return sum. */
return -newV1           /*ͺ*Negative and odd? Return negative sum*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Fibonacci-sequence\fibonacci-sequence.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
