/*ª*REXX program sounds "ship's bells"  (using PC speaker)  when executing  (perpetually).*/
echo= ( arg()\==0 )                              /*ª*echo time and bells if any arguments.*/
signal on halt                                   /*ª*allow a clean way to stop the program*/
t.1=  '00:30   01:00   01:30   02:00   02:30   03:00   03:30   04:00'
t.2=  '04:30   05:00   05:30   06:00   06:30   07:00   07:30   08:00'
t.3=  '08:30   09:00   09:30   10:00   10:30   11:00   11:30   12:00'

do forever;  t=time();   ss=right(t, 2);   mn=substr(t, 4, 2)  /*ª*the current time.*/
ct=time('C')                               /*ª*[â†“]  maybe add leading zero to time. */
hhmmc=left( right( ct, 7, 0),  5)          /*ª*HH:MM   (maybe with a leading zero). */
if echo  then say center(arg(1) ct, 79)    /*ª*echo the 1st argument with the time? */
if ss\==00 & mn\==00 & mn\==30  then do;  call delay  60-ss;   iterate
end   /*ª* [â†‘]  delay for fraction of a minute.*/
/*ª* [â†“]  the number of bells to peel {$}*/
do j=1  for 3  until newV1\==0;   newV1=wordpos(hhmmc, t.j)
end   /*ª*j*/

if newV1\==0 & echo  then say center(newV1 "bells", 79)       /*ª*echo the number of bells? */

do k=1 for newV1;  call sound 650,1;  call delay 1 + (k//2==0)
end   /*ª*k*/                 /*ª*[â†‘]  peel, and then pause for effect.*/
call delay 60;       if rc\==0  then leave /*ª*ensure we don't reâ”€peel.             */
end   /*ª*forever*/
halt:                                            /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Nautical-bell\nautical-bell.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
