/*ͺ*REXX program shows a method of computing the total price and tax  for purchased items.*/
numeric digits 200                                        /*ͺ*support for gihugic numbers.*/
taxRate= 7.65                                             /*ͺ*number is:   nn   or   nn%  */
if right(taxRate, 1)\=='%'  then taxRate= taxRate / 100   /*ͺ*handle plain tax rate number*/
taxRate=strip(taxRate, , '%')                             /*ͺ*strip the  %   (if present).*/
item.  =;                          items= 0               /*ͺ*zero out the register.      */
item.1 = '4000000000000000  $5.50  hamburger'             /*ͺ*the  first  item purchased. */
item.2 = '               2  $2.86  milkshake'             /*ͺ* "  second    "      "      */
say  center('quantity', 22)          center("item", 22)           center('price', 22)
hdr= center('',         27 ,"β")     center('',     20, "β")      center('',      27, "β")
say hdr;                             total=0
do j=1  while item.j\==''                        /*ͺ*calculate the total and tax.*/
parse var item.j   quantity price thing          /*ͺ*ring up an item on register.*/
items    = items + quantity                      /*ͺ*tally the number of items.  */
price    = translate(price, , '$')               /*ͺ*maybe scrub out the $ symbol*/
subtotal = quantity * price                      /*ͺ*calculate the     sub-total.*/
total    = total + subtotal                      /*ͺ*    "      "  running total.*/
say right(quantity, 27)        left(thing, 20)               show$(subtotal)
end   /*ͺ*j*/
say                                              /*ͺ*display a blank line for separator.  */
say translate(hdr, 'β', "β")                     /*ͺ*display the separator part of the hdr*/
tax= format(total * taxRate, , 2)                /*ͺ*round the total tax for all the items*/
say right( commas(items  "(items)"), 35)            right('total=', 12)       show$(total)
say right('tax at'  (taxRate * 100 / 1)"%=", 48)                              show$(tax)
say
say right('grand total=', 48)           show$(total + tax)
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas: procedure;  parse arg newV1;   n= newV1'.9';      newV2= 123456789;       b= verify(n, newV2, "M")
e= verify(n, newV2'0', , verify(n, newV2"0.", 'M') )  - 4       /*ͺ* [β]  commatize number*/
do j=e  to b  by -3;    newV1= insert(',', newV1, j);    end  /*ͺ*j*/;           return newV1
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
show$:  return right( commas( '$'arg(1) ), 27)   /*ͺ*rightβjustify and format a number.   */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Currency\currency-2.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
