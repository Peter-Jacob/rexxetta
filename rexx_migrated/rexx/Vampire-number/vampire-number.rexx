/*ͺ*REXX program displays  N  vampire numbers,  or  verifies  if  a number is vampiric.   */
parse arg N .                                    /*ͺ*obtain optional argument from the CL.*/
if N=='' | N==","  then N= 25                    /*ͺ*Not specified?  Then use the default.*/
newV1.0= 1260;   newV1.1= 11453481;   newV1.2= 115672;   newV1.3= 124483;   newV1.4= 105264  /*ͺ*lowest #, dig*/
newV1.5= 1395;   newV1.6=   126846;   newV1.7=   1827;   newV1.8= 110758;   newV1.9= 156289  /*ͺ*   "   "   " */
L= length(N);                aN= abs(N)          /*ͺ*L:  length of N;  aN:  absolute value*/
numeric digits max(9, length(aN) )               /*ͺ*be able to handle ginormus numbers.  */
newV3 = 0                                            /*ͺ*#:  count of vampire numbers (so far)*/
if N>0 then do j=1260  until  newV3 >= N             /*ͺ*search until N vampire numbers found.*/
if length(j) // 2  then do;  j= j*10 - 1;  iterate   /*ͺ*bump J to even length*/
end                          /*ͺ* [β]  check if odd.  */
parse var  j  ''  -1  newV4              /*ͺ*obtain the last decimal digit of  J. */
if j<newV1.newV4  then iterate               /*ͺ*is number tenable based on last dig? */
f= vampire(j)                        /*ͺ*obtain the  fangs  of  J.            */
if f==''  then iterate               /*ͺ*Are fangs null?   Yes, not vampire.  */
newV3= newV3 + 1                             /*ͺ*bump the vampire count, Vlad.        */
say right('vampire number', 20)  right(newV3, L)  "is: "  right(j, 9)',  fangs=' f
end   /*ͺ*j*/                          /*ͺ* [β]  process a range of numbers.    */
else do;  f= vampire(aN)                  /*ͺ* [β]  process a number; obtain fangs.*/
if f==''  then say       aN      " isn't a vampire number."
else say       aN      " is a vampire number, fangs="     f
end
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
vampire: procedure; parse arg x,, newV2. a bot;   L= length(x)  /*ͺ*get arg;  compute len of X*/
if L//2  then return ''                            /*ͺ*is L odd?   Then Β¬vampire.*/
do k=1  for L;    newV4= substr(x, k, 1);         newV2.newV4= newV2.newV4  ||  newV4
end   /*ͺ*k*/
w= L % 2                                           /*ͺ*%:   is REXX's integer  Γ· */
do m=0  for 10;   bot= bot || newV2.m
end   /*ͺ*m*/
top= left( reverse(bot), w)
bot= left(bot, w)                                  /*ͺ*determine limits of search*/
inc= x // 2    +    1                              /*ͺ*X is odd? INC=2. No? INC=1*/
beg= max(bot, 10 ** (w-1)  )                       /*ͺ*calculate where  to begin.*/
if inc==2  then  if  beg//2==0   then beg= beg + 1 /*ͺ*possibly adjust the begin.*/
/*ͺ* [β]  odd  BEG  if odd INC*/
do d=beg  to  min(top, 10**w - 1)  by inc /*ͺ*use smart  BEG, END, INC. */
if x // d \==0          then iterate      /*ͺ*X  not Γ· by D?  Then skip,*/
q= x % d;     if d>q    then iterate      /*ͺ*is   D > Q        "    "  */
if length(q) \== w      then iterate      /*ͺ*Len of Q Β¬= W?  Then skip.*/
if q*d//9 \== (q+d)//9  then iterate      /*ͺ*modulo 9 congruence test. */
parse var  q  ''  -1  newV4                   /*ͺ*get last decimal dig. of Q*/
if newV4== 0                then if right(d, 1) == 0  then iterate
dq= d  ||  q
t= x;             do i=1  for  L;           p= pos( substr(dq, i, 1), t)
if p==0  then iterate d;  t= delstr(t, p, 1)
end   /*ͺ*i*/
a= a  '['d"β"q'] '                        /*ͺ*construct formatted fangs.*/
end   /*ͺ*d*/                               /*ͺ* [β]  β  is a round bullet*/
return a                                           /*ͺ*return    formatted fangs.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Vampire-number\vampire-number.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
