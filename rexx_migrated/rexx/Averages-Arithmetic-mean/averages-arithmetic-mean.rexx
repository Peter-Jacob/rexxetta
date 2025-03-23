/*�*REXX program finds the averages/arithmetic mean of several lists (vectors) or CL input*/
parse arg newV1.1; if newV1.1=''  then do;   newV2=6                         /*�*vector from the C.L.?*/
newV1.1 =   10 9 8 7 6 5 4 3 2 1
newV1.2 =   10 9 8 7 6 5 4 3 2 1 0 0 0 0  .11
newV1.3 =  '10 20 30 40 50  -100  4.7  -11e2'
newV1.4 =  '1 2 3 4  five  6 7 8 9  10.1.  ±2'
newV1.5 =  'World War I  &  World War II'
newV1.6 =                             /*�*  ◄─── a null value. */
end
else newV2=1                               /*�*number of CL vectors.*/
do j=1  for newV2
say '       numbers = '   newV1.j
say '       average = '   avg(newV1.j)
say copies('═', 79)
end   /*�*t*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
avg: procedure;  parse arg x;     newV2=words(x)                      /*�*#:  number of items.*/
if newV2==0  then return  'N/A: ───[null vector.]'               /*�*No words? Return N/A*/
newV3=0
do k=1  for newV2;      newV4=word(x,k)                         /*�*obtain a number.    */
if datatype(newV4,'N')  then do;  newV3=newV3+newV4;  iterate;   end    /*�*if numeric, then add*/
say left('',40) "***error***  non-numeric: " newV4;  newV2=newV2-1  /*�*error; adjust number*/
end   /*�*k*/

if newV2==0  then return  'N/A: ───[no numeric values.]'         /*�*No nums?  Return N/A*/
return newV3 / newV2                                                 /*�*return the average. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Averages-Arithmetic-mean\averages-arithmetic-mean.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
