/*ͺ*REXX program finds and displays the largest gap between  Niven  numbers (up to LIMIT).*/
parse arg lim .                                  /*ͺ*obtain optional arguments from the CL*/
if lim=='' | lim==','  then lim= 10000000        /*ͺ*Not specified?  Then use the default.*/
numeric digits 2 + max(8, length(lim) )          /*ͺ*enable the use of any sized numbers. */
gap= 0;                     old= 0               /*ͺ*initialize (largest) gap; old Niven #*/
newV1= 'gap starts at Niven #'
call tell center('gap size', 12)       center(newV1 "index", 29)          center(newV1, 29)
call tell copies('β'       , 12)       copies('β'         , 29)          copies('β' , 29)
newV2= 0                                             /*ͺ*#:  is the index of a Niven number.  */
do n=1                                       /*ͺ*ββββββ let's go Niven number hunting.*/
parse var  n  1  sum  2  q                   /*ͺ*use the first decimal digit for  SUM.*/
do  while  q\=='';    parse var q x 2 q;          sum= sum + x
end   /*ͺ*while*/                 /*ͺ*    β                                */
if n//sum >0  then iterate                   /*ͺ*    ββββββββ is destructively parsed.*/
newV2= newV2 + 1                                     /*ͺ*bump the  index  of the Niven number.*/
if n-old<=gap  then do; old= n; iterate; end /*ͺ*Is gap not bigger?  Then keep looking*/
gap= n - old;           old= n               /*ͺ*We found a bigger gap; define new gap*/
idx= max(1, newV2-1);       san= max(1, n-gap)   /*ͺ*handle special case of the first gap.*/
call tell right(commas(gap),  7)left('', 5), /*ͺ*center rightβjustified Niven gap size*/
right(commas(idx), 25)left('', 4), /*ͺ*   "     "       "     Niven num idx.*/
right(commas(san), 25)             /*ͺ*   "     "       "       "   number. */
if n >= lim  then leave                      /*ͺ*have we exceeded the (huge)  LIMit ? */
end   /*ͺ*n*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas:  parse arg newV3;  do c=length(newV3)-3  to 1  by -3; newV3=insert(',', newV3, c); end;   return newV3
tell:    say arg(1);   return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Increasing-gaps-between-consecutive-Niven-numbers\increasing-gaps-between-consecutive-niven-numbers-1.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
