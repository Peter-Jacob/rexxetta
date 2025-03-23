/*ª*REXX program constructs and displays a  Sierpinski triangle of up to around order 10k.*/
parse arg n mark .                               /*ª*get the order of Sierpinski triangle.*/
if n==''   | n==","  then n=4                    /*ª*Not specified?  Then use the default.*/
if mark==''          then mark=  "*"             /*ª*MARK  was specified as  a character. */
if length(mark)==2   then mark=x2c(mark)         /*ª*  "    "      "     in  hexadecimal. */
if length(mark)==3   then mark=d2c(mark)         /*ª*  "    "      "      "      decimal. */
numeric digits 12000                             /*ª*this should handle the biggy numbers.*/
/*ª* [â†“]  the blood-'n-guts of the pgm.  */
do j=0  for n*4;  newV1=1;  z=left('', n*4 -1-j)  /*ª*indent the line to be displayed.     */
do k=0  for j+1                         /*ª*construct the line with  J+1  parts. */
if newV1//2==0  then z=z'  '                /*ª*it's either a    blank,   or    Â·Â·Â·  */
else z=z mark               /*ª* Â·Â·Â· it's one of 'em thar characters.*/
newV1=newV1 * (j-k) % (k+1)                     /*ª*calculate handy-dandy thing-a-ma-jig.*/
end   /*ª*k*/                             /*ª* [â†‘]  finished constructing a line.  */
say z                                         /*ª*display a line of the triangle.      */
end         /*ª*j*/                             /*ª* [â†‘]  finished showing triangle.     */
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sierpinski-triangle\sierpinski-triangle.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
