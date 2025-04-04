/*ช*REXX program  using  Knuth's  algorithm  S  (a random sampling   N   of   M   items). */
parse arg trials size .                          /*ช*obtain optional arguments from the CL*/
if trials=='' | trials==","  then trials= 100000 /*ช*Not specified?  Then use the default.*/
if   size=='' |   size==","  then   size=      3 /*ช* "      "         "   "   "     "    */
newV1.= 0                                            /*ช*initialize frequency counter array.  */
do trials                                  /*ช*OK,  now let's light this candle.    */
call snewV3ofnewV3nnewV3creator    size                /*ช*create an initial list of  N  items. */

do gen=0  for 10;  call snewV3ofnewV3n gen     /*ช*call s_of_n with a single decimal dig*/
end   /*ช*gen*/
/*ช* [โ]  examine what  SofN  generated. */
do count=1  for size;     newV3= newV2.count   /*ช*get a dec. digit from the  Nth item. */
newV1.newV3= newV1.newV3 + 1                           /*ช*bump counter for the decimal digit.  */
end   /*ช*count*/
end       /*ช*trials*/
newV4= ' trials, and with a size of '
hdr= "  Using Knuth's algorithm  S  for "  commas(trials)  newV4 || commas(size)":  "
say hdr;         say copies("โ", length(hdr) )   /*ช*display the header and its separator.*/

do dig=0  to 9                           /*ช* [โ]  display the frequency of a dig.*/
say right("frequency of the", 37)       dig       'digit is: '      commas(newV1.dig)
end   /*ช*dig*/
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
commas: parse arg newV3;  do jc=length(newV3)-3  to 1  by -3; newV3=insert(',', newV3, jc); end;  return newV3
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
snewV3ofnewV3n: parse arg item;         items= items + 1 /*ช*get  "item",  bump the items counter.*/
if random(1, items)>size  then return    /*ช*probability isn't good,  so skip it. */
newV3= random(1, size);       newV2.newV3= item      /*ช*now, figure out which previous ยทยทยท   */
return                                   /*ช*      ยทยทยท item to replace with  ITEM.*/
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
snewV3ofnewV3nnewV3creator: parse arg item 1 items           /*ช*generate    ITEM    number of items. */
do k=1  for item     /*ช*traipse through the first  N  items. */
newV2.k= random(0, 9)    /*ช*set the  Kth  item with random digit.*/
end   /*ช*k*/
return                           /*ช*the piddly stuff is done  (for now). */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Knuths-algorithm-S\knuths-algorithm-s.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
