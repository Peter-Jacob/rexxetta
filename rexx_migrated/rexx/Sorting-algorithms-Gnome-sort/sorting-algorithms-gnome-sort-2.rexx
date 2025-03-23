/*ª* REXX ---------------------------------------------------------------
* 28.06.2014 Walter Pachl  cf ooRexx version 2
* only style changes (reformatting) and adapt for ooRexx compatibility
* NOTE that leading blanks are ignored in the comparison ('  Justice')
* unless strict comparison is used  (i.e., 'If x.km<<=x.k Then')
* 30.06.2014 WP added the missing else clause
*--------------------------------------------------------------------*/
/*ª* generate the array elements.   */
Call gen '---the seven virtues---','=======================',,
'Faith','Hope','Charity  [Love]','Fortitude','  Justice',,
'Prudence','Temperance'
Call show 'before sort'          /*ª* show  "before"  array elements.*/
Call gnomeSort                   /*ª* invoke the infamous gnome sort.*/
Call show ' after sort'          /*ª* show  "after"   array elements.*/
Exit                             /*ª* done.                          */

gnomesort: Procedure Expose x.
k=2
Do j=3 While k<=x.0
km=k-1
If x.km<=x.k Then
k=j
Else Do
t=x.km; x.km=x.k; x.k=t      /*ª* swap two entries in the array. */
k=k-1
If k==1 Then
k=j
Else
j=j-1
End
End
Return

gen: Procedure Expose x.
Do i=1 To arg()
x.i=arg(i)
End
x.0=arg()
Return

show:  Procedure Expose x.
Say arg(1)
Do i=1 To x.0
Say 'element' right(i,2) x.i
End
Return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Gnome-sort\sorting-algorithms-gnome-sort-2.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
