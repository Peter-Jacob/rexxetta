/*ª*REXX program uses a  Shoelace  formula to calculate the area of an  N-sided  polygon. */
parse arg pts                                    /*ª*obtain optional arguments from the CL*/
if pts='' then pts= '(3,4),(5,11),(12,8),(9,5),(5,6)'   /*ª*Not specified?   Use default. */
pts=space(pts,0); z=pts                                 /*ª*elide extra blanks;  save pts.*/
do n=1 until z=''                                       /*ª*perform destructive parse on z*/
parse var z '(' x.n ',' y.n ')' ',' z                 /*ª*obtain X and Y coÃ¶rdinates    */
end
a=0
Do i=1 To n-1
j=i+1
a=a+x.i*y.j-x.j*y.i
End
a=a+x.n*y.1-x.1*y.n
a=abs(a)/2
say 'polygon area of' n 'points:' pts 'is --->' a
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Shoelace-formula-for-polygonal-area\shoelace-formula-for-polygonal-area-4.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
