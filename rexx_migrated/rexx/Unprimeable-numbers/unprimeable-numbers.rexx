/*�*REXX program  finds and displays   unprimeable   numbers  (non─negative integers).    */
parse arg n x hp .                               /*�*obtain optional arguments from the CL*/
if  n=='' |  n==","  then  n=       35           /*�*Not specified?  Then use the default.*/
if  x=='' |  x==","  then  x=      600           /*�* "      "         "   "   "     "    */
if hp=='' | hp==","  then hp= 10000000           /*�* "      "         "   "   "     "    */
u= 0                                             /*�*number of unprimeable numbers so far.*/
eds=4;     ed.1= 1;  ed.2= 3;  ed.3= 7;  ed.4= 9 /*�*"end" digits which are prime; prime>9*/
call genP hp                                     /*�*generate primes up to & including HP.*/
newV1=;                       newV2.=.                  /*�*a list  "      "         "     "  "  */
do j=100;            if newV4.j  then iterate  /*�*Prime?  Unprimeable must be composite*/
Lm= length(j)                              /*�*obtain the length-1 of the number J. */
meat= left(j, Lm)                          /*�*obtain the first  Lm   digits of  J. */
/*�* [↑]  examine the "end" digit of  J. */
do enewV5=1  for eds;  new= meat || ed.enewV5    /*�*obtain a different number  (than  J).*/
if new==j  then iterate                  /*�*Is it the original number? Then skip.*/
if newV4.new   then iterate j                /*�*This new number a prime?     "    "  */
end  /*�*e_*/
/*�* [↑]  examine a new 1st digit of  J. */
do fnewV5=0  for 10;   new= (fnewV5||meat) + 0   /*�*obtain a different number  (than  J).*/
if new==j  then iterate                  /*�*Is it the original number? Then skip.*/
if newV4.new   then iterate j                /*�*This new number a prime?     "    "  */
end  /*�*f_*/                              /*�* [↑]  examine the front digit of  J. */
do anewV5= 2  for Lm-1           /*�*traipse through the middle digits.   */
meat=   left(j, anewV5 - 1)      /*�*use a number of left─most dec. digits*/
rest= substr(j, anewV5 + 1)      /*�* "  "    "    " right─most "     "   */
do nnewV5=0  for 10           /*�*traipse through all 1─digit numbers. */
new= meat || nnewV5 || rest   /*�*construct new number, like a phoenix.*/
if new==j  then iterate   /*�*Is it the original number? Then skip.*/
if newV4.new   then iterate j /*�*This new number a prime?     "    "  */
end   /*�*n_*/
end      /*�*a_*/
u= u + 1                                   /*�*bump the count of unprimeable numbers*/
if u<=n    then newV1= newV1 commas(j)           /*�*maybe add unprimeable # to  $$  list.*/
if u==x    then newV2.ox=  commas(j)           /*�*assign the   Xth  unprimeable number.*/
parse var   j     ''  -1  newV5                /*�*obtain the right─most dec digit of J.*/
if newV2.newV5==.  then newV2.newV5= j                     /*�*the 1st unprimeable # that ends in _.*/
if newV2.3==.  then iterate;  if newV2.7==.  then iterate    /*�*test if specific #'s found.*/
if newV2.1==.  then iterate;  if newV2.9==.  then iterate    /*�*  "   "     "     "    "   */
leave                                                /*�*if here,  then we're done. */
end   /*�*j*/

if n>0  then do;  say center(' first '       n       "unprimeable numbers ", 139, '═')
say strip(newV1);    say
end
if x>0  then say '     the '     th(x)       " unprimeable number is: "       newV2.ox
say
do o=0  for 10;      if length(newV2.o)==0  then iterate
say '     the first unprimeable number that ends in '  o  " is:"right(commas(newV2.o),11)
end   /*�*o*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas:  parse arg newV6;  do c=length(newV6)-3  to 1  by -3; newV6=insert(',', newV6, c); end;   return newV6
th:procedure;parse arg x;return x||word('th st nd rd',1+(x//10)*(x//100%10\==1)*(x//10<4))
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
genP: newV3.1=2; newV3.2=3; newV3.3=5; newV3.4=7; newV3.5=11; newV3.6=13; newV3.7=17; newV3.8=19; newV3.9=23; newV3.10=29; newV3.11=31
newV4.=0; newV4.2=1; newV4.3=1; newV4.5=1; newV4.7=1; newV4.11=1; newV4.13=1; newV4.17=1; newV4.19=1; newV4.23=1; newV4.29=1
newV7= 11;  sq.newV7= newV3.newV7 **2
do lim=100  until lim*lim>=hp /*�*only keep primes up to the sqrt(hp). */
end   /*�*lim*/                 /*�* [↑]  find limit for storing primes. */
do j=newV3.newV7+2  by 2  to hp;  parse var j '' -1 newV5;  if newV5==5  then iterate   /*�*÷ by 5?*/
if j// 3==0  then iterate;   if j// 7==0  then iterate;   if j//11==0  then iterate
if j//13==0  then iterate;   if j//17==0  then iterate;   if j//19==0  then iterate
if j//23==0  then iterate;   if j//29==0  then iterate
do k=11  while sq.k<=j                 /*�*divide by some generated odd primes. */
if j//newV3.k==0  then iterate j           /*�*Is J divisible by  P?  Then not prime*/
end   /*�*k*/                            /*�* [↓]  a prime  (J)  has been found.  */
newV7= newV7+1;   if newV7<=lim  then newV3.newV7=j;   newV4.j=1  /*�*bump prime count; assign prime to @. */
sq.newV7= j*j                       /*�*calculate square of J for fast WHILE.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Unprimeable-numbers\unprimeable-numbers.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
