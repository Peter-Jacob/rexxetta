/*ª*REXX program displays a stem and leaf plot of any non-negative numbers [can include 0]*/
parse arg newV2                                      /*ª* [â†“]  Not specified? Then use default*/
if newV2=''  then newV2=12 127 28 42 39 113 42 18 44 118 44 37 113 124 37 48 127 36 29 31 125 139,
131 115 105 132 104 123 35 113 122 42 117 119 58 109 23 105 63 27 44 105 99 41 128 121,
116 125  32  61 37 127 29 113 121 58 114 126 53 114 96 25 109 7 31 141 46 13 27 43 117,
116  27 7 68 40 31 115 124 42 128 52 71 118 117 38 27 106 33 117 116 111 40 119 47 105,
57 122 109 124 115 43 120 43 27 27 18 28 48 125 107 114 34 133 45 120 30 127 31 116 146
newV1.=;                            bot=.;    top=.  /*ª* [â†‘]  define all #. elements as null.*/
do j=1  for words(newV2);     y=word(newV2, j)      /*ª*â—„â”€â”€â”€ process each number in the list.*/
if \datatype(y,"N")  then do; say '***error*** item' j "isn't numeric:" y;  exit; end
if y<0               then do; say '***error*** item' j "is negative:"   y;  exit; end
n=format(y, , 0) / 1                        /*ª*normalize the numbers (not malformed)*/
stem=word(left(n, length(n) -1)  0, 1)      /*ª*obtain stem (1st digits) from number.*/
parse var  n '' -1 leaf;   newV3=stem * sign(n) /*ª*   "   leaf (last digit)   "    "    */
if bot==.  then do;  bot=newV3;  top=newV3;  end    /*ª*handle the first case for TOP and BOT*/
bot=min(bot, newV3);           top=max(top, newV3)  /*ª*obtain the minimum and maximum so far*/
newV1.stem.leaf= newV1.stem.leaf   leaf             /*ª*construct sorted stem-and-leaf entry.*/
end   /*ª*j*/

w=max(length(min), length(max) )    + 1          /*ª*W:  used to right justify the output.*/
/*ª* [â†“]  display the stem-and-leaf plot.*/
do k=bot  to top;          newV4=               /*ª*$:  is the output string, a plot line*/
do m=0  for 10;         newV4=newV4  newV1.k.m       /*ª*build a line for the stemâ”€&â”€leaf plot*/
end  /*ª*m*/
say right(k, w)    'â•‘'     space(newV4)         /*ª*display a line of stemâ”€andâ”€leaf plot.*/
end   /*ª*k*/                                 /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Stem-and-leaf-plot\stem-and-leaf-plot-1.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
