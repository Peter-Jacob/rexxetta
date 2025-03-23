/*�*REXX program displays a  sparkline  (spark graph)  for a group of values.             */
if arg()==0  then do                             /*�*Optional arguments? Then use defaults*/
call sparkGraph  1  2  3  4  5  6  7  8  7  6  5  4  3  2  1
call sparkGraph '1.5,  0.5  3.5,  2.5  5.5,  4.5  7.5,  6.5'
end
else call sparkGraph arg(1)
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
ceil:       procedure;  parse arg newV1;         newV2=trunc(newV1);          return newV2+(newV1>0)*(newV1\=newV2)
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sparkGraph: procedure;  parse arg x;   say ' input: '  x              /*�*echo the values.*/
x= translate(x, ' ', ",")                  /*�*remove any superfluous commas. */
newV3= '▁▂▃▄▅▆▇█';         L= length(newV3)    /*�*chars to be used for the graph.*/
xmin= word(x, 1);          xmax= xmin      /*�*assume a minimum and a maximum.*/

do n=2  to words(x);   newV2= word(x, n)   /*�*examine successive words in  X.*/
xmin= min(newV2, xmin)                     /*�*find the minimum value in  X.  */
xmax= max(newV2, xmax)                     /*�*  "   "  maximum   "    "  "   */
end   /*�*n*/
z=
do j=1  for words(x)                /*�*build the output spark graph.  */
z= z || substr(newV3, ceil( ( word(x, j) -xmin+1) / (xmax -xmin+1) * L), 1)
end   /*�*j*/

say 'output: '  z;   say;  return          /*�*show the output, + a blank line*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sparkline-in-unicode\sparkline-in-unicode-2.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
