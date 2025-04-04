/*ͺ*REXX pgm computes/displays the Jacobi symbol, the # of rows & columns can be specified*/
parse arg rows cols .                            /*ͺ*obtain optional arguments from the CL*/
if rows='' | rows==","  then rows= 17            /*ͺ*Not specified?  Then use the default.*/
if cols='' | cols==","  then cols= 16            /*ͺ* "      "         "   "   "      "   */
call hdrs                                        /*ͺ*display the (two) headers to the term*/
do r=1  by 2  to rows;     newV2= right(r, 3)  /*ͺ*build odd (numbered) rows of a table.*/
do c=0  to cols         /*ͺ* [β]  build a column for a table row.*/
newV2= newV2 newV3 right(jacobi(c, r), 2);   newV3= 'β'  /*ͺ*reset grid end char.*/
end   /*ͺ*c*/
say newV2 'β';  newV3= 'β'                         /*ͺ*display a table row; reset grid glyph*/
end   /*ͺ*r*/
say translate(newV1.2, 'β©β'b'¬ ’β¬βξεχΦ΄β’©                 ―ͺ*display the bottom of the grid borderͺ―
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
hdrs: newV1.1= 'n/a β';      do c=0  to cols;    newV1.1= newV1.1 || right(c, 3)"  ";   end
L= length(newV1.1);                        newV1.1= left(newV1.1,   L - 1)    ;          say newV1.1
newV1.2= 'βββββ¬';      do c=0  to cols;    newV1.2= newV1.2 || "βββββξεχΦ΄"        ;   end
L= length(newV1.2);                        newV1.2= left(newV1.2,   L - 1)"β" ;          say newV1.2
newV3= 'β'        ;    return                  /*ͺ*define an external grid border glyph.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
jacobi: procedure; parse arg a,n;  er= '***error***';        newV4 = 1      /*ͺ*define result.*/
if n//2==0  then do;   say er    n   " must be a positive odd integer.";   exit 13
end
a= a // n                                      /*ͺ*obtain  A  modulus  N          */
do while a\==0                               /*ͺ*perform while  A  isn't zero.  */
do while a//2==0;  a= a % 2   /*ͺ*divide  A  (as a integer) by 2 */
if n//8==3 | n//8==5  then newV4= -newV4               /*ͺ*use  N mod  8 */
end   /*ͺ*while a//2==0*/
parse value  a  n     with     n  a          /*ͺ*swap values of variables:  A N */
if a//4==3 & n//4==3  then newV4= -newV4             /*ͺ* A mod 4, N mod 4.   Both βξεχΦ³ 3 ?*/
a= a // n                                    /*ͺ*obtain  A  modulus  N          */
end   /*ͺ*while a\==0*/
if n==1  then return newV4
return 0
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Jacobi-symbol\jacobi-symbol.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
