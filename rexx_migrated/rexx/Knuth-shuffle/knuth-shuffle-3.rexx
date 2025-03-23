/*ช* REXX ---------------------------------------------------------------
* 05.01.2014 Walter Pachl
*            borrow one improvement from version 1
* 06.01.2014 removed    -"-  (many tests cost more than few "swaps")
*--------------------------------------------------------------------*/
Call random ,,123456                   /*ช* seed for random            */
Do i=1 To 10; a.i=i; End;              /*ช* fill array                 */
Call show 'In',10                      /*ช* show start                 */
do i = 10 To 2 By -1                   /*ช* shuffle                    */
j=random(i-1)+1;
h=right(i,2) right(j,2)
Parse Value a.i a.j With a.j a.i     /*ช* a.i <-> a.j                */
Call show h,i                        /*ช* show intermediate states   */
end;
Call show 'Out',10                     /*ช* show fomaรถ state           */
Exit

show: Procedure Expose a.
Parse Arg txt,n
ol=left(txt,6);
Do k=1 To n; ol=ol right(a.k,2); End
Say ol
Return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Knuth-shuffle\knuth-shuffle-3.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
