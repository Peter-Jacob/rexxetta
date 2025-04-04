/*ͺ*REXX program displays a  NxN  multiplication table  (in a boxed grid) to the terminal.*/
parse arg sz .                                   /*ͺ*obtain optional argument from the CL.*/
if sz=='' | sz==","  then sz= 12                 /*ͺ*Not specified?  Then use the default.*/
w= max(3, length(sz**2) );    newV2= copies('β', w) /*ͺ*calculate the width of the table cell*/
newV1= newV2'ββ'         /*ͺ*literals used in the subroutines.    */
do r=1  for sz                           /*ͺ*calculate & format a row of the table*/
if r==1  then call top left('β(x)', w+1) /*ͺ*show title of multiplication table.  */
newV3= 'β'center(r"x", w)"β"                 /*ͺ*index for a multiplication table row.*/
do c=1  for sz;     prod=         /*ͺ*build a row of multiplication table. */
if r<=c  then prod= r * c         /*ͺ*only display when the  row βξεχΦ³ column. */
newV3= newV3  ||  right(prod,  w+1) '|'   /*ͺ*append product to a cell in the row. */
end   /*ͺ*k*/
say newV3                                    /*ͺ*show a row of multiplication table.  */
if r\==sz  then call sep                 /*ͺ*show a separator except for last row.*/
end          /*ͺ*j*/
call bot                                         /*ͺ*show the bottom line of the table.   */
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
hdr: newV3= newV4'β';   do i=1  for sz; newV3=newV3 || right(i"x|", w+3);  end;  say newV3;   call sep; return
dap: newV3= left(newV3, length(newV3) - 1)arg(1);                                               return
top: newV3= 'β'newV2"β¬"copies(newV1'β¬', sz);  call dap "β";  newV4= arg(1);   say newV3;   call hdr; return
sep: newV3= 'β'newV2"βΌ"copies(newV1'βΌ', sz);  call dap "βξεχΦ³";               say newV3;             return
bot: newV3= 'β'newV2"β΄"copies(newV1'β΄', sz);  call dap "β";               say newV3;             return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Multiplication-tables\multiplication-tables.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
