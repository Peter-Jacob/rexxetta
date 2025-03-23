/*ª*REXX program sorts an array of composite structures                 */
/*ª* (which has two classes of data).                                   */
x.=0                           /*ª*number elements in structure (so far)*/
Call add 'tan'   , 0           /*ª*tan    peanut M&M's are  0%  of total*/
Call add 'orange',10           /*ª*orange    "    "     "  10%   "   "  */
Call add 'yellow',20           /*ª*yellow    "    "     "  20%   "   "  */
Call add 'green' ,20           /*ª*green     "    "     "  20%   "   "  */
Call add 'red'   ,20           /*ª*red       "    "     "  20%   "   "  */
Call add 'brown' ,30           /*ª*brown     "    "     "  30%   "   "  */
Call show 'before sort'
Say copies('Â¦', 70)
Call xSort
call show ' after sort'
Exit                           /*ª*stick a fork in it, we're all done.  */
/*ª*--------------------------------------------------------------------*/
add: Procedure Expose x.
z=x.0+1                      /*ª* bump the number of structure entry  */
x.z.color=arg(1)
x.z.pc=arg(2)                /*ª* construct an entry of the structure */
x.0=z
Return
/*ª*--------------------------------------------------------------------*/
show: Procedure Expose x.
Do i=1 To x.0
/*ª* display  what     name               value.                    */
Say right(arg(1),30) right(x.i.color,9) right(x.i.pc,4)'%'
End
Return
/*ª*--------------------------------------------------------------------*/
xsort: Procedure Expose x.
h=x.0
Do While h>1
h=h%2
Do i=1 For x.0-h
j=i
k=h+i
Do While x.k.color<x.j.color
newV1=x.j.color                 /*ª* swap elements.                 */
x.j.color=x.k.color
x.k.color=newV1
newV1=x.j.pc
x.j.pc=x.k.pc
x.k.pc=newV1
If h>=j Then
Leave
j=j-h
k=k-h
End
End
End
Return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sort-an-array-of-composite-structures\sort-an-array-of-composite-structures.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
