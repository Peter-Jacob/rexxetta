/*ͺ*REXX pgm finds 1st N cyclops (Ξ) #s,  Ξ primes,  blind Ξ primes,  palindromic Ξ primes*/
parse arg n cols .                               /*ͺ*obtain optional argument from the CL.*/
if    n=='' |    n==","  then    n=   50         /*ͺ*Not specified?  Then use the default.*/
if cols=='' | cols==","  then cols=   10         /*ͺ* "      "         "   "   "     "    */
call genP                                        /*ͺ*build array of semaphores for primes.*/
w= max(10, length( commas(newV1.newV5) ) )               /*ͺ*max width of a number in any column. */
prinewV3= 0; blinewV3= 0; palnewV3= 0; call 0 ' first ' commas(n)                   " cyclops numbers"
prinewV3= 1; blinewV3= 0; palnewV3= 0; call 0 ' first ' commas(n)             " prime cyclops numbers"
prinewV3= 1; blinewV3= 1; palnewV3= 0; call 0 ' first ' commas(n)       " blind prime cyclops numbers"
prinewV3= 1; blinewV3= 0; palnewV3= 1; call 0 ' first ' commas(n) " palindromic prime cyclops numbers"
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas: parse arg newV3;  do jc=length(newV3)-3  to 1  by -3; newV3=insert(',', newV3, jc); end;  return newV3
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
0: parse arg title;                idx= 1        /*ͺ*get the title of this output section.*/
say ' index β'center(title,   1 + cols*(w+1)     )      /*ͺ*display the output title.  */
say 'ββββββββΌ'center(""   ,   1 + cols*(w+1), 'β')      /*ͺ*   "     "     "  separator*/
finds= 0;                 newV4=  /*ͺ*the number of finds (so far); $ list.*/
do j=0  until finds== n;      L= length(j)  /*ͺ*find N cyclops numbers, start at 101.*/
if L//2==0  then do;    j= left(1, L+1, 0)  /*ͺ*Is J an even # of digits? Yes, bump J*/
iterate  /*ͺ*use a new J that has odd # of digits.*/
end
z= pos(0, j);  if z\==(L+1)%2 then iterate  /*ͺ* "  "    "    " (zero in mid)?    "  */
if pos(0, j, z+1)>0           then iterate  /*ͺ* "  "    "    " (has two 0's)?    "  */
if prinewV3  then if \newV2.j         then iterate  /*ͺ*Need a cyclops prime?      Then skip.*/
if blinewV3  then do;   newV3= space(translate(j, , 0), 0)   /*ͺ*Need a blind cyclops prime ?*/
if \newV2.newV3   then iterate  /*ͺ*Not a blind cyclops prime? Then skip.*/
end
if palnewV3  then do;   r= reverse(j)           /*ͺ*Need a palindromic cyclops prime?    */
if r\==j  then iterate  /*ͺ*Cyclops number not palindromic? Skip.*/
if \newV2.r   then iterate  /*ͺ*   "    palindrome not prime?     "  */
end
finds= finds + 1                            /*ͺ*bump the number of palindromic primes*/
newV4= newV4 right( commas(j), w)                   /*ͺ*add a palindromic prime βββΊ  $  list.*/
if finds//cols\==0            then iterate  /*ͺ*have we populated a line of output?  */
say center(idx, 7)'β'  substr(newV4, 2);    newV4=  /*ͺ*display what we have so far  (cols). */
idx= idx + cols                             /*ͺ*bump the  index  count for the output*/
end   /*ͺ*j*/
if newV4\==''  then say center(idx, 7)"β"  substr(newV4, 2)  /*ͺ*possible show residual output.*/
say 'ββββββββ΄'center(""  ,   1 + cols*(w+1), 'β');  say
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
genP: newV2.= 0;  hip= 7890987 - 1                   /*ͺ*placeholders for primes (semaphores).*/
newV1.1=2; newV1.2=3; newV1.3=5; newV1.4=7; newV1.5=11; newV1.6=13 /*ͺ*define some low primes.              */
newV2.2=1; newV2.3=1; newV2.5=1; newV2.7=1; newV2.11=1; newV2.13=1 /*ͺ*   "     "   "    "     flags.       */
newV5= 6;     sq.newV5= newV1.newV5 ** 2 /*ͺ*number of primes so far; prime square*/
do j=newV1.newV5+2  by 2  for max(0, hip%2-newV1.newV5%2-1)     /*ͺ*find odd primes from here on. */
parse var   j   ''  -1  newV6                       /*ͺ*get the last dec. digit of  J.*/
if     newV6==5  then iterate;  if j// 3==0  then iterate  /*ͺ*Γ· by 5?  Γ· by 3?  Skip.*/
if j// 7==0  then iterate;  if j//11==0  then iterate  /*ͺ*Γ·  " 7?  Γ· by 11?   "  */
do k=6  while sq.k<=j             /*ͺ* [β]  divide by the known odd primes.*/
if j // newV1.k == 0  then iterate j  /*ͺ*Is  J Γ· X?  Then not prime.     ___  */
end   /*ͺ*k*/                       /*ͺ* [β]  only process numbers  βξεχΦ΄  β J   */
newV5= newV5+1;    newV1.newV5= j;   sq.newV5= j*j;   newV2.j= 1 /*ͺ*bump # Ps;  assign next P;  P sq; P# */
end          /*ͺ*j*/;               return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Cyclops-numbers\cyclops-numbers.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
