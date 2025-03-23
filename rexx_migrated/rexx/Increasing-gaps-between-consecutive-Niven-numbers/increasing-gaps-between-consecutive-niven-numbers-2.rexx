/*�*REXX program finds and displays the largest gap between  Niven  numbers (up to LIMIT).*/
parse arg lim .                                  /*�*obtain optional arguments from the CL*/
if lim=='' | lim==','  then lim= 1000000000000   /*�*Not specified?  Then use the default.*/
numeric digits 2 + max(8, length(lim) )          /*�*enable the use of any sized numbers. */
gap= 0;                     old= 0               /*�*initialize (largest) gap; old Niven #*/
newV1= 'gap starts at Niven #'
call tell center('gap size', 12)       center(newV1 "index", 29)          center(newV1, 29)
call tell copies('═'       , 12)       copies('═'         , 29)          copies('═' , 29)
newV2.= 0                                            /*�*set all values to zero for chunk sums*/
do j=1  for 99999                   /*�*pre─compute sums for #a up to 5 digs.*/
parse var  j  1  sum  2  q          /*�*use the first decimal digit for  SUM.*/
do  while  q\=='';    parse var  q    x  2  q;          sum= sum + x
end   /*�*while*/            /*�*do sum of digits the hard way for now*/
newV2.j= sum                            /*�*assume a sum for a particular number.*/
if j>9999 then iterate              /*�*if  J  has five digits or more, skip.*/
do zz= length(j)+1  to 4   /*�*handle all  J's  with leading zeros. */
jz= right(j, zz, 0)        /*�*also add leading zeros from some J's.*/
if newV2.jz==0  then newV2.jz= sum /*�*assign a sum to  000xx  for instance.*/
end   /*�*zz*/
end   /*�*j*/
newV3= 0                                             /*�*#:  is the index of a Niven number.  */
do n=1                                       /*�*◄───── let's go Niven number hunting.*/
parse var n q1 +5 q2 +5 q3 +5 q4 +5 q4 +5 q6 /*�*break apart  N  into 5─digit chunks. */
sum= newV2.q1 + newV2.q2 + newV2.q3 + newV2.q4 + newV2.q5 + newV2.q6 /*�*add the 5─digit chunks to compute sum*/
if n//sum > 0  then iterate                  /*�*is N not divisible by its sum?  Skip.*/
newV3= newV3 + 1                                     /*�*bump the  index  of the Niven number.*/
if n-old<=gap  then do; old= n; iterate; end /*�*Is gap not bigger?  Then keep looking*/
gap= n - old;           old= n               /*�*We found a bigger gap; define new gap*/
idx= max(1, newV3-1);       san= max(1, n-gap)   /*�*handle special case of the first gap.*/
call tell right(commas(gap),  7)left('', 5), /*�*center right─justified Niven gap size*/
right(commas(idx), 25)left('', 4), /*�*   "     "       "     Niven num idx.*/
right(commas(san), 25)             /*�*   "     "       "       "   number. */
if n >= lim  then leave                      /*�*have we exceeded the (huge)  LIMit ? */
end   /*�*n*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas:  parse arg newV4;  do c=length(newV4)-3  to 1  by -3; newV4=insert(',', newV4, c); end;   return newV4
tell:    say arg(1);   return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Increasing-gaps-between-consecutive-Niven-numbers\increasing-gaps-between-consecutive-niven-numbers-2.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
