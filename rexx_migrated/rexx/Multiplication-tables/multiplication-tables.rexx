/*�*REXX program displays a  NxN  multiplication table  (in a boxed grid) to the terminal.*/
parse arg sz .                                   /*�*obtain optional argument from the CL.*/
if sz=='' | sz==","  then sz= 12                 /*�*Not specified?  Then use the default.*/
w= max(3, length(sz**2) );    newV2= copies('─', w) /*�*calculate the width of the table cell*/
newV1= newV2'──'         /*�*literals used in the subroutines.    */
do r=1  for sz                           /*�*calculate & format a row of the table*/
if r==1  then call top left('│(x)', w+1) /*�*show title of multiplication table.  */
newV3= '│'center(r"x", w)"│"                 /*�*index for a multiplication table row.*/
do c=1  for sz;     prod=         /*�*build a row of multiplication table. */
if r<=c  then prod= r * c         /*�*only display when the  row ����ֳ column. */
newV3= newV3  ||  right(prod,  w+1) '|'   /*�*append product to a cell in the row. */
end   /*�*k*/
say newV3                                    /*�*show a row of multiplication table.  */
if r\==sz  then call sep                 /*�*show a separator except for last row.*/
end          /*�*j*/
call bot                                         /*�*show the bottom line of the table.   */
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
hdr: newV3= newV4'│';   do i=1  for sz; newV3=newV3 || right(i"x|", w+3);  end;  say newV3;   call sep; return
dap: newV3= left(newV3, length(newV3) - 1)arg(1);                                               return
top: newV3= '┌'newV2"┬"copies(newV1'┬', sz);  call dap "┐";  newV4= arg(1);   say newV3;   call hdr; return
sep: newV3= '├'newV2"┼"copies(newV1'┼', sz);  call dap "����ֳ";               say newV3;             return
bot: newV3= '└'newV2"┴"copies(newV1'┴', sz);  call dap "┘";               say newV3;             return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Multiplication-tables\multiplication-tables.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
