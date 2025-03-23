/*ª*REXX program displays a stemâ”€andâ”€leaf plot of any real numbers [can be:  neg, 0, pos].*/
parse arg newV2                                      /*ª*obtain optional arguments from the CL*/
if newV2=''  then newV2='15 14 3 2 1 0 -1 -2 -3 -14 -15' /*ª*Not specified?  Then use the default.*/
newV1.=;                  bot=.;    top=.;      z=.  /*ª* [â†‘]  define all #. elements as null.*/
do j=1  for words(newV2);     y=word(newV2, j)     /*ª*â—„â”€â”€â”€ process each number in the list.*/
if \datatype(y,"N")  then do; say '***error*** item' j "isn't numeric:" y; exit; end
n=format(y,,0)/1;  an=abs(n); s=sign(n)    /*ª*normalize the numbers (not malformed)*/
stem=left(an, length(an) -1)
if stem==''  then if s>=0  then stem=0     /*ª*handle case of one-digit positive #. */
else stem='-0'  /*ª*   "     "   "  "    "   negative "  */
else stem=s * stem            /*ª*   "     "   " a  multi-digit number.*/
parse var  n '' -1 leaf                    /*ª*obtain the leaf (the last digit) of #*/
if bot==.  then do; bot=stem; top=bot; end /*ª*handle the first case for TOP and BOT*/
bot=min(bot, stem);     top=max(top, stem) /*ª*obtain the minimum and maximum so far*/
if stem=='-0'  then z=0                    /*ª*use  Z  as a flag to show negative 0.*/
newV1.stem.leaf= newV1.stem.leaf  leaf             /*ª*construct sorted stem-and-leaf entry.*/
end   /*ª*j*/

w=max(length(min), length(max) )  + 1            /*ª*W:  used to rightâ”€justify the output.*/
newV3='-0'                                           /*ª* [â†“]  display the stem-and-leaf plot.*/
do k=bot  to top;           newV4=             /*ª*$:  is the output string, a plot line*/
if k==z  then do                           /*ª*handle a special case for negative 0.*/
do s=0  for 10; newV4=newV4 newV1.newV3.s /*ª*build a line for the stemâ”€&â”€leaf plot*/
end  /*ª*s*/                /*ª* [â†‘]  address special case of  -zero.*/
say right(newV3, w) 'â•‘' space(newV4) /*ª*display a line of stemâ”€andâ”€leaf plot.*/
end                          /*ª* [â†‘]  handles special case of  -zero.*/
newV4=                                         /*ª*a new plot line  (of output).        */
do m=0  for 10;  newV4=newV4  newV1.k.m  /*ª*build a line for the stemâ”€&â”€leaf plot*/
end  /*ª*m*/
say right(k, w)    'â•‘'    space(newV4)         /*ª*display a line of stemâ”€andâ”€leaf plot.*/
end   /*ª*k*/                                /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Stem-and-leaf-plot\stem-and-leaf-plot-2.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
