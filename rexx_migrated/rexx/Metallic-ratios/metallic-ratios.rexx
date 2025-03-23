/*ª*REXX pgm computes the 1st N elements of the Lucas sequence for Metallic ratios 0â”€â”€â–º9. */
parse arg n bLO bHI digs .                       /*ª*obtain optional arguments from the CL*/
if    n=='' |    n==","  then    n= 15           /*ª*Not specified?  Then use the default.*/
if  bLO=='' |  bLO==","  then  bLO=  0           /*ª* "      "         "   "   "     "    */
if  bHI=='' |  bHI==","  then  bHI=  9           /*ª* "      "         "   "   "     "    */
if digs=='' | digs==","  then digs= 32           /*ª* "      "         "   "   "     "    */
numeric digits digs + length(.)                  /*ª*specify number of decimal digs to use*/
metals= 'platinum  golden  silver  bronze  copper  nickel  aluminum  iron  tin  lead'
newV1= ' decimal digits past the decimal point:'             /*ª*a literal used in SAY.*/
newV5.=                                              /*ª*the default name for a metallic ratio*/
do k=0  to 9;  newV5.k= word(metals, k+1)   /*ª*assign the (ten) metallic ratio names*/
end   /*ª*k*/

do m=bLO   to bHI;  newV6.= 1;  newV7=  1  1       /*ª*compute the sequence numbers & ratios*/
r=.                                        /*ª*the ratio  (so far).                 */
do newV8=2  until r=old;     old= r         /*ª*compute sequence numbers & the ratio.*/
newV3= newV8-1;       newV4= newV8-2     /*ª*use variables for previous numbers.  */
newV6.newV8= m * newV6.newV3     +     newV6.newV4          /*ª*calculate a number i the sequence.   */
if newV8<n  then newV7= newV7  newV6.newV8                  /*ª*build a sequence list of  N  numbers.*/
r= newV6.newV8  /  newV6.newV3                        /*ª*calculate ratio of the last 2 numbers*/
end   /*ª*#*/

if words(newV7)<n  then newV7= subword(newV7 copies('1 ', n), 1, n) /*ª*extend list if too short*/
L= max(108, length(newV7) )                                 /*ª*ensure width of title.  */
say center(' Lucas sequence for the'  newV5.m  "ratio,  where  B  is " m' ',  L,  "â•")
if n>0  then do;   say 'the first '    n    " elements are:";       say newV7
end                           /*ª*if  N  is positive, then show N nums.*/
newV2= 'approximate'                     /*ª*literal (1 word) that is used for SAY*/
r= format(r,,digs)                         /*ª*limit decimal digits for  R  to digs.*/
if datatype(r, 'W')  then do;      r= r/1;      newV2=     "exact";       end
say 'the'  newV2  "value reached after"   newV8-1   " iterations with "  digs @DecDigs
say r;                    say              /*ª*display the ration plus a blank line.*/
end      /*ª*m*/                             /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Metallic-ratios\metallic-ratios.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
