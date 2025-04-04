/*ͺ*REXX program  finds and displays   unprimeable   numbers  (nonβnegative integers).    */
parse arg n x hp .                               /*ͺ*obtain optional arguments from the CL*/
if  n=='' |  n==","  then  n=       35           /*ͺ*Not specified?  Then use the default.*/
if  x=='' |  x==","  then  x=      600           /*ͺ* "      "         "   "   "     "    */
if hp=='' | hp==","  then hp= 10000000           /*ͺ* "      "         "   "   "     "    */
u= 0                                             /*ͺ*number of unprimeable numbers so far.*/
eds=4;     ed.1= 1;  ed.2= 3;  ed.3= 7;  ed.4= 9 /*ͺ*"end" digits which are prime; prime>9*/
call genP hp                                     /*ͺ*generate primes up to & including HP.*/
newV1=;                       newV2.=.                  /*ͺ*a list  "      "         "     "  "  */
do j=100;            if newV4.j  then iterate  /*ͺ*Prime?  Unprimeable must be composite*/
Lm= length(j)                              /*ͺ*obtain the length-1 of the number J. */
meat= left(j, Lm)                          /*ͺ*obtain the first  Lm   digits of  J. */
/*ͺ* [β]  examine the "end" digit of  J. */
do enewV5=1  for eds;  new= meat || ed.enewV5    /*ͺ*obtain a different number  (than  J).*/
if new==j  then iterate                  /*ͺ*Is it the original number? Then skip.*/
if newV4.new   then iterate j                /*ͺ*This new number a prime?     "    "  */
end  /*ͺ*e_*/
/*ͺ* [β]  examine a new 1st digit of  J. */
do fnewV5=0  for 10;   new= (fnewV5||meat) + 0   /*ͺ*obtain a different number  (than  J).*/
if new==j  then iterate                  /*ͺ*Is it the original number? Then skip.*/
if newV4.new   then iterate j                /*ͺ*This new number a prime?     "    "  */
end  /*ͺ*f_*/                              /*ͺ* [β]  examine the front digit of  J. */
do anewV5= 2  for Lm-1           /*ͺ*traipse through the middle digits.   */
meat=   left(j, anewV5 - 1)      /*ͺ*use a number of leftβmost dec. digits*/
rest= substr(j, anewV5 + 1)      /*ͺ* "  "    "    " rightβmost "     "   */
do nnewV5=0  for 10           /*ͺ*traipse through all 1βdigit numbers. */
new= meat || nnewV5 || rest   /*ͺ*construct new number, like a phoenix.*/
if new==j  then iterate   /*ͺ*Is it the original number? Then skip.*/
if newV4.new   then iterate j /*ͺ*This new number a prime?     "    "  */
end   /*ͺ*n_*/
end      /*ͺ*a_*/
u= u + 1                                   /*ͺ*bump the count of unprimeable numbers*/
if u<=n    then newV1= newV1 commas(j)           /*ͺ*maybe add unprimeable # to  $$  list.*/
if u==x    then newV2.ox=  commas(j)           /*ͺ*assign the   Xth  unprimeable number.*/
parse var   j     ''  -1  newV5                /*ͺ*obtain the rightβmost dec digit of J.*/
if newV2.newV5==.  then newV2.newV5= j                     /*ͺ*the 1st unprimeable # that ends in _.*/
if newV2.3==.  then iterate;  if newV2.7==.  then iterate    /*ͺ*test if specific #'s found.*/
if newV2.1==.  then iterate;  if newV2.9==.  then iterate    /*ͺ*  "   "     "     "    "   */
leave                                                /*ͺ*if here,  then we're done. */
end   /*ͺ*j*/

if n>0  then do;  say center(' first '       n       "unprimeable numbers ", 139, 'β')
say strip(newV1);    say
end
if x>0  then say '     the '     th(x)       " unprimeable number is: "       newV2.ox
say
do o=0  for 10;      if length(newV2.o)==0  then iterate
say '     the first unprimeable number that ends in '  o  " is:"right(commas(newV2.o),11)
end   /*ͺ*o*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas:  parse arg newV6;  do c=length(newV6)-3  to 1  by -3; newV6=insert(',', newV6, c); end;   return newV6
th:procedure;parse arg x;return x||word('th st nd rd',1+(x//10)*(x//100%10\==1)*(x//10<4))
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
genP: newV3.1=2; newV3.2=3; newV3.3=5; newV3.4=7; newV3.5=11; newV3.6=13; newV3.7=17; newV3.8=19; newV3.9=23; newV3.10=29; newV3.11=31
newV4.=0; newV4.2=1; newV4.3=1; newV4.5=1; newV4.7=1; newV4.11=1; newV4.13=1; newV4.17=1; newV4.19=1; newV4.23=1; newV4.29=1
newV7= 11;  sq.newV7= newV3.newV7 **2
do lim=100  until lim*lim>=hp /*ͺ*only keep primes up to the sqrt(hp). */
end   /*ͺ*lim*/                 /*ͺ* [β]  find limit for storing primes. */
do j=newV3.newV7+2  by 2  to hp;  parse var j '' -1 newV5;  if newV5==5  then iterate   /*ͺ*Γ· by 5?*/
if j// 3==0  then iterate;   if j// 7==0  then iterate;   if j//11==0  then iterate
if j//13==0  then iterate;   if j//17==0  then iterate;   if j//19==0  then iterate
if j//23==0  then iterate;   if j//29==0  then iterate
do k=11  while sq.k<=j                 /*ͺ*divide by some generated odd primes. */
if j//newV3.k==0  then iterate j           /*ͺ*Is J divisible by  P?  Then not prime*/
end   /*ͺ*k*/                            /*ͺ* [β]  a prime  (J)  has been found.  */
newV7= newV7+1;   if newV7<=lim  then newV3.newV7=j;   newV4.j=1  /*ͺ*bump prime count; assign prime to @. */
sq.newV7= j*j                       /*ͺ*calculate square of J for fast WHILE.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Unprimeable-numbers\unprimeable-numbers.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
