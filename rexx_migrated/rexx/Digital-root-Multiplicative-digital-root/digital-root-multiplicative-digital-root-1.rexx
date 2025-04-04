/*ช*REXX program finds the  persistence and multiplicative  digital root  of some numbers.*/
numeric digits 100                               /*ช*increase the number of decimal digits*/
parse arg x                                      /*ช*obtain optional arguments from the CL*/
if x='' | x=","  then x=123321 7739 893 899998   /*ช*Not specified?  Then use the default.*/
say center('number', 8)      ' persistence   multiplicative digital root'
say copies('โ'     , 8)      ' โโโโโโโโโโโ   โโโโโโโโโโโโโโโโโโโโโโโโโโโ'
/*ช* [โ]  the title  and  separator.     */
do j=1  for words(x);        n=word(x, j)   /*ช*process each number in the   X  list.*/
parse value  MDR(n)   with   mp mdr         /*ช*obtain the persistence and the  MDR. */
say right(n,8) center(mp,13) center(mdr,30) /*ช*display a number,  persistence,  MDR.*/
end   /*ช*j*/                                 /*ช* [โ]  show MP & MDR for each number. */
say copies('โ'     , 8)      ' โโโโโโโโโโโ   โโโโโโโโโโโโโโโโโโโโโโโโโโโ'
say; say;                target=5
say 'MDR        first '  target  " numbers that have a matching MDR"
say 'โโโ   โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ'

do k=0  for 10; hits=0;   newV1=                /*ช*show numbers that have an MDR of  K. */
do m=k  until hits==target                /*ช*find target numbers with an MDR of K.*/
if word( MDR(m), 2)\==k  then iterate     /*ช*is this the  MDR  that's wanted?     */
hits=hits + 1;       newV1=space(newV1 m',')      /*ช*yes, we got a hit,  add to the list. */
end   /*ช*m*/                               /*ช* [โ]  built a list of MDRs that = K. */
say " "k':     ['strip(newV1, , ',')"]"         /*ช*display the  K  (MDR)  and the list. */
end     /*ช*k*/                               /*ช* [โ]  done with the   K   MDR list.  */
say 'โโโ   โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ'
exit 0                                           /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
MDR: procedure; parse arg y; y=abs(y)            /*ช*get the number and determine the MDR.*/
do p=1      until  y<10;    parse var  y  r  2
do k=2  to length(y);   r=r * substr(y, k, 1)
end   /*ช*k*/
y=r
end       /*ช*p*/               /*ช* [โ]  wash, rinse, and repeat ยทยทยท    */
return p r                       /*ช*return the persistence and the  MDR. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Digital-root-Multiplicative-digital-root\digital-root-multiplicative-digital-root-1.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
