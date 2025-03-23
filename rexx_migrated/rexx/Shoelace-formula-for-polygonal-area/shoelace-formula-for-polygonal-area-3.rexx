/*ª*REXX program uses a  Shoelace  formula to calculate the area of an  N-sided  polygon. */
parse arg pts                                    /*ª*obtain optional arguments from the CL*/
if pts='' then pts= '(3,4),(5,11),(12,8),(9,5),(5,6)'   /*ª*Not specified?   Use default. */
pts=space(pts,0); z=pts                                 /*ª*elide extra blanks;  save pts.*/
do n=1 until z=''                                       /*ª*perform destructive parse on z*/
parse var z '(' x.n ',' y.n ')' ',' z                 /*ª*obtain X and Y coÃ¶rdinates    */
end
z=n+1; y.z=y.1                                          /*ª* take care of end points      */
y.0=y.n
A=0                                                     /*ª*initialize the  area  to zero.*/
do j=1 for n;
jp=j+1;
jm=j-1;
A=A+x.j*(y.jp-y.jm)                                   /*ª*compute a part of the area.   */
end
A=abs(A/2)                                              /*ª*obtain half of the  Â¦ A Â¦  sum*/
say 'polygon area of' n 'points:' pts 'is --->' A
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Shoelace-formula-for-polygonal-area\shoelace-formula-for-polygonal-area-3.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
