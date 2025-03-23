/*�*REXX program calculates the  resistance  between any  two points  on a  resistor grid.*/
if 2=='f2'x  then ohms = "ohms"                  /*�*EBCDIC machine?    Then use  'ohms'. */
else ohms = "Ω"                     /*�* ASCII    "          "   "   Greek Ω.*/
parse arg high wide  Arow Acol  Brow Bcol digs . /*�*obtain optional arguments from the CL*/
if high=='' | high==","  then high= 10           /*�*Not specified?  Then use the default.*/
if wide=='' | wide==","  then wide= 10           /*�* "      "         "   "   "      "   */
if Arow=='' | Arow==","  then Arow=  2           /*�* "      "         "   "   "      "   */
if Acol=='' | Acol==","  then Acol=  2           /*�* "      "         "   "   "      "   */
if Brow=='' | Brow==","  then Brow=  7           /*�* "      "         "   "   "      "   */
if Bcol=='' | Bcol==","  then Bcol=  8           /*�* "      "         "   "   "      "   */
if digs=='' | digs==","  then digs= 20           /*�* "      "         "   "   "      "   */
numeric digits digs                              /*�*use moderate decimal digs (precision)*/
minVal = 1'e-' || (digs*2)                       /*�*calculate the threshold minimal value*/
say '    minimum value is '  format(minVal,,,,0)  " using "  digs  ' decimal digits';  say
say '    resistor mesh size is: '       wide      "wide, "    high   'high'         ;  say
say '    point  A  is at (row,col): '   Arow"," Acol
say '    point  B  is at (row,col): '   Brow"," Bcol
newV1.=0;                                      cell.= 1
do  until  newV3<=minVal;          v= 0
newV1.Arow.Acol=   1  ;            cell.Arow.Acol= 0
newV1.Brow.Bcol= '-1' ;            cell.Brow.Bcol= 0
newV3=0
do   i=1  for high;        im= i-1;       ip= i+1
do j=1  for wide;        n= 0;          v= 0
if i\==1   then do;                     v= v + newV1.im.j;    n= n+1;    end
if j\==1   then do;      jm= j-1;       v= v + newV1.i.jm;    n= n+1;    end
if i<high  then do;                     v= v + newV1.ip.j;    n= n+1;    end
if j<wide  then do;      jp= j+1;       v= v + newV1.i.jp;    n= n+1;    end
v= newV1.i.j  -  v / n;      newV2.i.j= v;      if cell.i.j  then newV3= newV3 + v*v
end   /*�*j*/
end     /*�*i*/
do   r=1  for High
do c=1  for Wide;      newV1.r.c= newV1.r.c   -   newV2.r.c
end   /*�*c*/
end     /*�*r*/
end   /*�*until*/
say
Acur= newV2.Arow.Acol  *  sides(Arow, Acol)
Bcur= newV2.Brow.Bcol  *  sides(Brow, Bcol)
say '    resistance between point  A  and point  B  is: '     4 / (Acur - Bcur)       ohms
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sides:  parse arg row,col;   z=0;    if row\==1 & row\==high  then  z= z+2;    else z= z+1
if col\==1 & col\==wide  then  z= z+2;    else z= z+1
return z
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Resistor-mesh\resistor-mesh.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
