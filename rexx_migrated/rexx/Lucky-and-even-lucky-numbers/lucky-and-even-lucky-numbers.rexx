/*�*REXX program displays  lucky  or  evenLucky  integers   (numbers  or  a number range).*/
parse arg bot top func newV2 .                       /*�*obtain required & optional arguments.*/
if func==''  then func= 'lucky'                  /*�*Not specified?  Then use the default.*/
s= left('s', bot\==top  &  top\==",")            /*�*plural results (or maybe not plural).*/
say func  'number's":"   bot  top   '───►'   newV4lucky(bot, top, func, newV2)
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
newV4lucky: arg x,y,f,?;   if y=='' | y==","  then y= x      /*�*obtain some arguments; set Y.*/
newV3= 0;          newV4=;                    ny= y<0    /*�*set variable NOY: value range*/
if f==''  then f= 'LUCKY';   lucky= (f=="LUCKY") /*�*assume  LUCKY  if omitted.   */
if f\=='LUCKY' & f\=='EVENLUCKY'  then return  'function not valid: '     f
if arg()>3  &  ?\=''      then return  "too many arguments entered: "     ?
if x=''                   then return  "1st argument is missing."
if x<1                    then return  "1st argument isn't a positive integer: " x
if \datatype(x,'W')       then return  "1st argument isn't an integer: "  x
if \datatype(y,'W')       then return  "2nd argument isn't an integer: "  y
if x>ay                   then return  "2nd argument is less than 1st arg."
ay=abs(y); yL=ay; if y>0  then yL= y*10  + y + y /*�*adjust the upper  Y  limit.  */
/*�* [↓]  build LUCKY | EVENLUCKY*/
do j=1  until j>=yL                          /*�*construct list pos. integers.*/
if j//2==(\lucky)  then iterate              /*�*EVENLUCKY? Use only even ints*/

if lucky  then if (j+1)//6==0  then iterate  /*�*prune       if  mod 6 ≡ zero.*/
else nop      /*�*balance the   IF-THEN  logic.*/
else if  j   //8==0  then iterate  /*�*prune next  if  mod 8 ≡ zero.*/
newV3= newV3 + 1                                     /*�*bump the counter of numbers. */
newV4= newV4 j                                       /*�*append integer to the $ list.*/
end   /*�*j*/
q=0
do p=3  until  q=='';       q= word(newV4, p)    /*�*start to prune  integer list.*/
if q>newV3  then leave                           /*�*if integer is too large, stop*/
do j=newV3%q*q  by -q  to q  /*�*elide every  Qth  integer.   */
newV4= delword(newV4, j, 1)      /*�*delete a particular number.  */
newV3= newV3 -1                  /*�*decrease the integer count.  */
end   /*�*j*/              /*�*delete from the right side.  */
end   /*�*p*/
newV1.=
do k=1;  parse var newV4 q newV4;       if q==''  then leave;       newV1.k= q
end   /*�*k*/
newV1.0=k-1
do m=1  for newV3                          /*�*restrict the found integers. */
if (\ny  &  (m<x  |  m>ay))  |  (ny  &  (newV1.m<x | newV1.m>ay))  then newV1.m=
end   /*�*m*/                            /*�* [↑]  a list of #s or a range*/
newV2=
do b=1  for newV1.0;     newV2= newV2 newV1.b          /*�*construct a list of integers.*/
end   /*�*b*/
return space(newV2)                                  /*�*remove superfluous blanks.   */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Lucky-and-even-lucky-numbers\lucky-and-even-lucky-numbers.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
