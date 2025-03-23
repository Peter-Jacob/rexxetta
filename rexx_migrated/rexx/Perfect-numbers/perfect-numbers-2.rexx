/*ª*REXX version of the  PL/I  program  (code was modified to run with Classic REXX).     */
parse arg low high .                                   /*ª*obtain the specified number(s).*/
if high=='' & low==''  then high=34000000              /*ª*if no arguments,  use a range. */
if  low==''            then  low=1                     /*ª*if no   LOW, then assume unity.*/
if high==''            then high=low                   /*ª*if no  HIGH, then assume  LOW. */

do i=low  to high                       /*ª*process the single # or range. */
if perfect(i)  then say  i  'is a perfect number.'
end   /*ª*i*/
exit

perfect: procedure;  parse arg n                       /*ª*get the number to be tested.   */
sum=0                                                  /*ª*the sum of the factors so far. */
do i=1  for n-1                           /*ª*starting at 1, find all factors*/
if n//i==0 then sum=sum+i                 /*ª*I is a factor of N,  so add it.*/
end   /*ª*i*/
return sum=n                                           /*ª*if the sum matches N, perfect! */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Perfect-numbers\perfect-numbers-2.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
