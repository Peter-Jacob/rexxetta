/*ª*REXX pgm (pathological FP problem): the chaotic bank society offering a new investment*/
e=2.7182818284590452353602874713526624977572470936999595749669676277240766303535475945713,
||8217852516642742746639193200305992181741359662904357290033429526059563073813232862794,
||3490763233829880753195251019011573834187930702154089149934884167509244761460668082264,
||8001684774118537423454424371075390777449920695517027618386062613313845830007520449338
d = length(e)  -  length(.)                      /*ª*subtract one for the decimal point.  */
parse arg digs show y .                          /*ª*obtain optional arguments from the CL*/
if digs==''  |  digs==","  then digs=  d         /*ª*Not specified?  Then use the default.*/
if show==''  |  show==","  then show= 20         /*ª* "      "         "   "   "     "    */
if    y==''  |     y==","  then    y= 25         /*ª* "      "         "   "   "     "    */
numeric digits digs                              /*ª*have REXX use "digs" decimal digits. */
newV2= e - 1                                         /*ª*subtract $1 from e, that's da deposit*/
/*ª* [â†‘]  value of newly opened account. */
do n=1  for y         /*ª*compute the value of the account/year*/
newV2= newV2*n  -  1          /*ª*   "     "    "    "  "  account now.*/
end   /*ª*n*/
newV1= 'With '     d      " decimal digits, the balance after "      y      ' years is: '
say newV1    '$'format(newV2, , show) / 1              /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Pathological-floating-point-problems\pathological-floating-point-problems-2.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
