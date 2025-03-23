/*�*REXX program displays  N  vampire numbers,  or  verifies  if  a number is vampiric.   */
parse arg N .                                    /*�*obtain optional argument from the CL.*/
if N=='' | N==","  then N= 25                    /*�*Not specified?  Then use the default.*/
newV1.0= 1260;   newV1.1= 11453481;   newV1.2= 115672;   newV1.3= 124483;   newV1.4= 105264  /*�*lowest #, dig*/
newV1.5= 1395;   newV1.6=   126846;   newV1.7=   1827;   newV1.8= 110758;   newV1.9= 156289  /*�*   "   "   " */
L= length(N);                aN= abs(N)          /*�*L:  length of N;  aN:  absolute value*/
numeric digits max(9, length(aN) )               /*�*be able to handle ginormus numbers.  */
newV3 = 0                                            /*�*#:  count of vampire numbers (so far)*/
if N>0 then do j=1260  until  newV3 >= N             /*�*search until N vampire numbers found.*/
if length(j) // 2  then do;  j= j*10 - 1;  iterate   /*�*bump J to even length*/
end                          /*�* [↑]  check if odd.  */
parse var  j  ''  -1  newV4              /*�*obtain the last decimal digit of  J. */
if j<newV1.newV4  then iterate               /*�*is number tenable based on last dig? */
f= vampire(j)                        /*�*obtain the  fangs  of  J.            */
if f==''  then iterate               /*�*Are fangs null?   Yes, not vampire.  */
newV3= newV3 + 1                             /*�*bump the vampire count, Vlad.        */
say right('vampire number', 20)  right(newV3, L)  "is: "  right(j, 9)',  fangs=' f
end   /*�*j*/                          /*�* [↑]  process a range of numbers.    */
else do;  f= vampire(aN)                  /*�* [↓]  process a number; obtain fangs.*/
if f==''  then say       aN      " isn't a vampire number."
else say       aN      " is a vampire number, fangs="     f
end
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
vampire: procedure; parse arg x,, newV2. a bot;   L= length(x)  /*�*get arg;  compute len of X*/
if L//2  then return ''                            /*�*is L odd?   Then ¬vampire.*/
do k=1  for L;    newV4= substr(x, k, 1);         newV2.newV4= newV2.newV4  ||  newV4
end   /*�*k*/
w= L % 2                                           /*�*%:   is REXX's integer  ÷ */
do m=0  for 10;   bot= bot || newV2.m
end   /*�*m*/
top= left( reverse(bot), w)
bot= left(bot, w)                                  /*�*determine limits of search*/
inc= x // 2    +    1                              /*�*X is odd? INC=2. No? INC=1*/
beg= max(bot, 10 ** (w-1)  )                       /*�*calculate where  to begin.*/
if inc==2  then  if  beg//2==0   then beg= beg + 1 /*�*possibly adjust the begin.*/
/*�* [↑]  odd  BEG  if odd INC*/
do d=beg  to  min(top, 10**w - 1)  by inc /*�*use smart  BEG, END, INC. */
if x // d \==0          then iterate      /*�*X  not ÷ by D?  Then skip,*/
q= x % d;     if d>q    then iterate      /*�*is   D > Q        "    "  */
if length(q) \== w      then iterate      /*�*Len of Q ¬= W?  Then skip.*/
if q*d//9 \== (q+d)//9  then iterate      /*�*modulo 9 congruence test. */
parse var  q  ''  -1  newV4                   /*�*get last decimal dig. of Q*/
if newV4== 0                then if right(d, 1) == 0  then iterate
dq= d  ||  q
t= x;             do i=1  for  L;           p= pos( substr(dq, i, 1), t)
if p==0  then iterate d;  t= delstr(t, p, 1)
end   /*�*i*/
a= a  '['d"∙"q'] '                        /*�*construct formatted fangs.*/
end   /*�*d*/                               /*�* [↑]  ∙  is a round bullet*/
return a                                           /*�*return    formatted fangs.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Vampire-number\vampire-number.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
