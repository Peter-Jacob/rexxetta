/*ͺ*REXX program uses the  RamerβDouglasβPeucker (RDP)  line simplification algorithm  for*/
/*ͺ*βββββββββββββββββββββββββββββ reducing the number of points used to define its shape. */
parse arg epsilon pts                            /*ͺ*obtain optional arguments from the CL*/
if epsilon='' | epsilon=","   then epsilon= 1    /*ͺ*Not specified?  Then use the default.*/
if pts=''  then pts= '(0,0) (1,0.1) (2,-0.1) (3,5) (4,6) (5,7) (6,8.1) (7,9) (8,9) (9,9)'
pts= space(pts)                                  /*ͺ*elide all superfluous blanks.        */
say '  error threshold: '   epsilon  /*ͺ*echo the error threshold to the term.*/
say ' points specified: '   pts      /*ͺ*  "   "    shape points   "  "    "  */
newV2= RDP(pts)                                      /*ͺ*invoke RamerβDouglasβPeucker function*/
say 'points simplified: '   rez(newV2)   /*ͺ*display points with () ββββΊ terminal.*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
bld: parse arg newV3; newV4= words(newV3); dMax=-newV4; idx=1; do j=1  for newV4; newV1.j= word(newV3, j); end; return
px:  parse arg newV3;          return word( translate(newV3, , ','),  1)   /*ͺ*obtain the X coΓΆrd.*/
py:  parse arg newV3;          return word( translate(newV3, , ','),  2)   /*ͺ*   "    "  Y   "   */
reb: parse arg a,b,,newV3;                  do k=a  to b;  newV3= newV3 newV1.k;    end;   return strip(newV3)
rez: parse arg z,newV3;   do k=1  for words(z); newV3= newV3 '('word(z, k)") "; end;   return strip(newV3)
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
RDP: procedure expose epsilon;    call bld  space( translate(arg(1), , ')(][}{') )
L= px(newV1.newV4) - px(newV1.1)
H= py(newV1.newV4) - py(newV1.1)                        /*ͺ* [β] find point IDX with max distance*/
do i=2  to newV4-1
d= abs(H*px(newV1.i) - L*py(newV1.i) + px(newV1.newV4)*py(newV1.1) - py(newV1.newV4)*px(newV1.1))
if d>dMax  then do;   idx= i;   dMax= d
end
end   /*ͺ*i*/             /*ͺ* [β]  D is the perpendicular distance*/

if dMax>epsilon  then do;   r= RDP( reb(1, idx) )
return subword(r, 1, words(r) - 1)     RDP( reb(idx, newV4) )
end
return newV1.1  newV1.newV4
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Ramer-Douglas-Peucker-line-simplification\ramer-douglas-peucker-line-simplification-1.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
