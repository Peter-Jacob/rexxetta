/*�*REXX pgm computes/displays the Jacobi symbol, the # of rows & columns can be specified*/
parse arg rows cols .                            /*�*obtain optional arguments from the CL*/
if rows='' | rows==","  then rows= 17            /*�*Not specified?  Then use the default.*/
if cols='' | cols==","  then cols= 16            /*�* "      "         "   "   "      "   */
call hdrs                                        /*�*display the (two) headers to the term*/
do r=1  by 2  to rows;     newV2= right(r, 3)  /*�*build odd (numbered) rows of a table.*/
do c=0  to cols         /*�* [↓]  build a column for a table row.*/
newV2= newV2 newV3 right(jacobi(c, r), 2);   newV3= '│'  /*�*reset grid end char.*/
end   /*�*c*/
say newV2 '║';  newV3= '║'                         /*�*display a table row; reset grid glyph*/
end   /*�*r*/
say translate(newV1.2, '╩�'b'���╬����ִ╗���������������������*display the bottom of the grid border��
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
hdrs: newV1.1= 'n/a ║';      do c=0  to cols;    newV1.1= newV1.1 || right(c, 3)"  ";   end
L= length(newV1.1);                        newV1.1= left(newV1.1,   L - 1)    ;          say newV1.1
newV1.2= '════╬';      do c=0  to cols;    newV1.2= newV1.2 || "════����ִ"        ;   end
L= length(newV1.2);                        newV1.2= left(newV1.2,   L - 1)"╗" ;          say newV1.2
newV3= '║'        ;    return                  /*�*define an external grid border glyph.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
jacobi: procedure; parse arg a,n;  er= '***error***';        newV4 = 1      /*�*define result.*/
if n//2==0  then do;   say er    n   " must be a positive odd integer.";   exit 13
end
a= a // n                                      /*�*obtain  A  modulus  N          */
do while a\==0                               /*�*perform while  A  isn't zero.  */
do while a//2==0;  a= a % 2   /*�*divide  A  (as a integer) by 2 */
if n//8==3 | n//8==5  then newV4= -newV4               /*�*use  N mod  8 */
end   /*�*while a//2==0*/
parse value  a  n     with     n  a          /*�*swap values of variables:  A N */
if a//4==3 & n//4==3  then newV4= -newV4             /*�* A mod 4, N mod 4.   Both ����ֳ 3 ?*/
a= a // n                                    /*�*obtain  A  modulus  N          */
end   /*�*while a\==0*/
if n==1  then return newV4
return 0
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Jacobi-symbol\jacobi-symbol.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
