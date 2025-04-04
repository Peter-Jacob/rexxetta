/*ͺ*REXX program lists a sequence  (or a count)  of  ββsafeββ   or   ββunsafeββ   primes. */
parse arg N kind newV3 . 1 . okind;     upper kind   /*ͺ*obtain optional arguments from the CL*/
if N=='' | N==","  then N= 35                    /*ͺ*Not specified?   Then assume default.*/
if kind=='' | kind==","  then kind= 'SAFE'       /*ͺ* "      "          "     "      "    */
if newV3\==''                             then call ser 'too many arguments specified.'
if kind\=='SAFE'  &  kind\=='UNSAFE'  then call ser 'invalid 2nd argument: '   okind
if kind =='UNSAFE'  then safe= 0;  else safe= 1  /*ͺ*SAFE  is a binary value for function.*/
w = linesize() - 1                               /*ͺ*obtain the usable width of the term. */
tell= (N>0);    newV1.=;    N= abs(N)                /*ͺ*N is negative?   Then don't display. */
newV2.=0;   newV2.1=2;  newV2.2=3;  newV2.3=5;  newV2.4=7;  newV2.5=11;  newV2.6=13;  newV2.7=17;  newV2.8=19;    newV4= 8
newV1.='';  newV1.2=1;  newV1.3=1;  newV1.5=1;  newV1.7=1;  newV1.11=1;  newV1.13=1;  newV1.17=1;  newV1.19=1;    start= newV4 + 1
m= 0;                         lim=0              /*ͺ*#  is the number of low primes so far*/
newV5=;     do i=1  for newV4   while lim<=N;  j= newV2.i    /*ͺ* [β]  find primes, and maybe show 'em*/
call safeUnsafe;      newV5= strip(newV5)        /*ͺ*go see if other part of a KIND prime.*/
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
call safeUnsafe                               /*ͺ*go see if other part of a KIND prime.*/
end   /*ͺ*j*/
/*ͺ* [β]  display number of primes found.*/
if newV5\==''  then say newV5                            /*ͺ*display any residual primes in $ list*/
say
if tell  then say commas(m)' '     kind    "primes found."
else say commas(m)' '     kind    "primes found below or equal to "    commas(N).
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
add: m= m+1; lim= m; if \tell & j>N  then do; lim= j; m= m-1; end; else call app; return 1
app: if tell  then if length(newV5 j)>w  then do;  say newV5; newV5 =j;   end; else newV5= newV5 j;   return 1
ser: say;  say;  say '***error***' arg(1);  say;  say;  exit 13   /*ͺ*tell error message. */
commas: parse arg newV3;  do jc=length(newV3)-3  to 1  by -3; newV3=insert(',', newV3, jc); end;  return newV3
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
safeUnsafe: ?= (j-1) % 2                         /*ͺ*obtain the other part of KIND prime. */
if safe  then if newV1.? == ''  then return 0             /*ͺ*not a    safe prime.*/
else return add()         /*ͺ*is  "      "    "   */
else if newV1.? == ''  then return add()         /*ͺ*is  an unsafe prime.*/
else return 0             /*ͺ*not  "   "      "   */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Safe-primes-and-unsafe-primes\safe-primes-and-unsafe-primes.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
