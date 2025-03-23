/*�*REXX program  using  Knuth's  algorithm  S  (a random sampling   N   of   M   items). */
parse arg trials size .                          /*�*obtain optional arguments from the CL*/
if trials=='' | trials==","  then trials= 100000 /*�*Not specified?  Then use the default.*/
if   size=='' |   size==","  then   size=      3 /*�* "      "         "   "   "     "    */
newV1.= 0                                            /*�*initialize frequency counter array.  */
do trials                                  /*�*OK,  now let's light this candle.    */
call snewV3ofnewV3nnewV3creator    size                /*�*create an initial list of  N  items. */

do gen=0  for 10;  call snewV3ofnewV3n gen     /*�*call s_of_n with a single decimal dig*/
end   /*�*gen*/
/*�* [↓]  examine what  SofN  generated. */
do count=1  for size;     newV3= newV2.count   /*�*get a dec. digit from the  Nth item. */
newV1.newV3= newV1.newV3 + 1                           /*�*bump counter for the decimal digit.  */
end   /*�*count*/
end       /*�*trials*/
newV4= ' trials, and with a size of '
hdr= "  Using Knuth's algorithm  S  for "  commas(trials)  newV4 || commas(size)":  "
say hdr;         say copies("═", length(hdr) )   /*�*display the header and its separator.*/

do dig=0  to 9                           /*�* [↓]  display the frequency of a dig.*/
say right("frequency of the", 37)       dig       'digit is: '      commas(newV1.dig)
end   /*�*dig*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: parse arg newV3;  do jc=length(newV3)-3  to 1  by -3; newV3=insert(',', newV3, jc); end;  return newV3
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
snewV3ofnewV3n: parse arg item;         items= items + 1 /*�*get  "item",  bump the items counter.*/
if random(1, items)>size  then return    /*�*probability isn't good,  so skip it. */
newV3= random(1, size);       newV2.newV3= item      /*�*now, figure out which previous ···   */
return                                   /*�*      ··· item to replace with  ITEM.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
snewV3ofnewV3nnewV3creator: parse arg item 1 items           /*�*generate    ITEM    number of items. */
do k=1  for item     /*�*traipse through the first  N  items. */
newV2.k= random(0, 9)    /*�*set the  Kth  item with random digit.*/
end   /*�*k*/
return                           /*�*the piddly stuff is done  (for now). */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Knuths-algorithm-S\knuths-algorithm-s.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
