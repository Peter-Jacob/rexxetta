/*ͺ*REXX program lists a sequence  (or a count)  of  ββstrongββ   or   ββweakββ   primes. */
parse arg N kind newV3 . 1 . okind;     upper kind   /*ͺ*obtain optional arguments from the CL*/
if N=='' | N==","  then N= 36                    /*ͺ*Not specified?   Then assume default.*/
if kind=='' | kind==","  then kind= 'STRONG'     /*ͺ* "      "          "     "      "    */
if newV3\==''                             then call ser 'too many arguments specified.'
if kind\=='WEAK'  &  kind\=='STRONG'  then call ser 'invalid 2nd argument: '   okind
if kind =='WEAK'  then weak= 1;  else weak= 0    /*ͺ*WEAK  is a binary value for function.*/
w = linesize() - 1                               /*ͺ*obtain the usable width of the term. */
tell= (N>0);    newV1.=;    N= abs(N)                /*ͺ*N is negative?   Then don't display. */
newV2.=0;   newV2.1=2;  newV2.2=3;  newV2.3=5;  newV2.4=7;  newV2.5=11;  newV2.6=13;  newV2.7=17;  newV2.8=19;   newV2.9=23;  newV4= 8
newV1.='';  newV1.2=1;  newV1.3=1;  newV1.5=1;  newV1.7=1;  newV1.11=1;  newV1.13=1;  newV1.17=1;  newV1.19=1;   start= newV4 + 1
m= 0;                           lim= 0           /*ͺ*#  is the number of low primes so far*/
newV5=;     do i=3  for newV4-2   while lim<=N           /*ͺ* [β]  find primes, and maybe show 'em*/
call strongWeak i-1;       newV5= strip(newV5)   /*ͺ*go see if other part of a KIND prime.*/
end   /*ͺ*i*/                              /*ͺ* [β]  allows faster loop (below).    */
/*ͺ* [β]  N:  default lists up to 35 #'s.*/
do j=newV2.newV4+2  by 2  while  lim<N                /*ͺ*continue on with the next odd prime. */
if j // 3 == 0  then iterate                  /*ͺ*is this integer a multiple of three? */
parse var  j    ''  -1  newV3                     /*ͺ*obtain the last decimal digit of  J  */
if newV3      == 5  then iterate                  /*ͺ*is this integer a multiple of five?  */
if j // 7 == 0  then iterate                  /*ͺ* "   "     "    "     "     " seven? */
if j //11 == 0  then iterate                  /*ͺ* "   "     "    "     "     " eleven?*/
if j //13 == 0  then iterate                  /*ͺ* "   "     "    "     "     "  13 ?  */
if j //17 == 0  then iterate                  /*ͺ* "   "     "    "     "     "  17 ?  */
if j //19 == 0  then iterate                  /*ͺ* "   "     "    "     "     "  19 ?  */
/*ͺ* [β]  divide by the primes.   ___    */
do k=start  to newV4  while newV2.k * newV2.k<=j /*ͺ*divide  J  by other primes βξεχΦ΅ β J     */
if j // newV2.k ==0   then iterate j     /*ͺ*Γ· by prev. prime?  Β¬prime     ___    */
end   /*ͺ*k*/                          /*ͺ* [β]   only divide up to     β J     */
newV4= newV4 + 1                                      /*ͺ*bump the count of number of primes.  */
newV2.newV4= j;                     newV1.j= 1            /*ͺ*define a prime  and  its index value.*/
call strongWeak newV4-1                           /*ͺ*go see if other part of a KIND prime.*/
end   /*ͺ*j*/
/*ͺ* [β]  display number of primes found.*/
if newV5\==''  then say newV5                            /*ͺ*display any residual primes in $ list*/
say
if tell  then say commas(m)' '     kind    "primes found."
else say commas(m)' '     kind    "primes found below or equal to "    commas(N).
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
add: m= m+1; lim= m; if \tell & y>N  then do; lim= y; m= m-1; end; else call app; return 1
app: if tell  then if length(newV5 y)>w  then do;  say newV5; newV5= y;   end; else newV5= newV5 y;   return 1
ser: say;  say;  say '***error***' arg(1);  say;  say;  exit 13   /*ͺ*tell error message. */
commas: parse arg newV3;  do jc=length(newV3)-3  to 1  by -3; newV3=insert(',', newV3, jc); end;  return newV3
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
strongWeak: parse arg x;  Lp= x - 1;     Hp= x + 1;     y=newV2.x;        s= (newV2.Lp + newV2.Hp) / 2
if weak  then if y<s  then return add()               /*ͺ*is  a    weak prime.*/
else return 0                   /*ͺ*not "      "    "   */
else if y>s  then return add()               /*ͺ*is  an strong prime.*/
return 0                   /*ͺ*not  "   "      "   */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Strong-and-weak-primes\strong-and-weak-primes.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
