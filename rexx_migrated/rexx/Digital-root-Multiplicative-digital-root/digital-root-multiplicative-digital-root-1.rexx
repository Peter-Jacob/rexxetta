/*�*REXX program finds the  persistence and multiplicative  digital root  of some numbers.*/
numeric digits 100                               /*�*increase the number of decimal digits*/
parse arg x                                      /*�*obtain optional arguments from the CL*/
if x='' | x=","  then x=123321 7739 893 899998   /*�*Not specified?  Then use the default.*/
say center('number', 8)      ' persistence   multiplicative digital root'
say copies('─'     , 8)      ' ───────────   ───────────────────────────'
/*�* [↑]  the title  and  separator.     */
do j=1  for words(x);        n=word(x, j)   /*�*process each number in the   X  list.*/
parse value  MDR(n)   with   mp mdr         /*�*obtain the persistence and the  MDR. */
say right(n,8) center(mp,13) center(mdr,30) /*�*display a number,  persistence,  MDR.*/
end   /*�*j*/                                 /*�* [↑]  show MP & MDR for each number. */
say copies('─'     , 8)      ' ───────────   ───────────────────────────'
say; say;                target=5
say 'MDR        first '  target  " numbers that have a matching MDR"
say '═══   ═══════════════════════════════════════════════════'

do k=0  for 10; hits=0;   newV1=                /*�*show numbers that have an MDR of  K. */
do m=k  until hits==target                /*�*find target numbers with an MDR of K.*/
if word( MDR(m), 2)\==k  then iterate     /*�*is this the  MDR  that's wanted?     */
hits=hits + 1;       newV1=space(newV1 m',')      /*�*yes, we got a hit,  add to the list. */
end   /*�*m*/                               /*�* [↑]  built a list of MDRs that = K. */
say " "k':     ['strip(newV1, , ',')"]"         /*�*display the  K  (MDR)  and the list. */
end     /*�*k*/                               /*�* [↑]  done with the   K   MDR list.  */
say '═══   ═══════════════════════════════════════════════════'
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
MDR: procedure; parse arg y; y=abs(y)            /*�*get the number and determine the MDR.*/
do p=1      until  y<10;    parse var  y  r  2
do k=2  to length(y);   r=r * substr(y, k, 1)
end   /*�*k*/
y=r
end       /*�*p*/               /*�* [↑]  wash, rinse, and repeat ···    */
return p r                       /*�*return the persistence and the  MDR. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Digital-root-Multiplicative-digital-root\digital-root-multiplicative-digital-root-1.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
