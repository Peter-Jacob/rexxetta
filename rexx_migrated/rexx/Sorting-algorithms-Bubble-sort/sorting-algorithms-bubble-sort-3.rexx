/*ª*REXX*/
Call random ,,1000
Do i=1 To 10
a.i=random(20)
End
a.0=i-1
Call show 'vorher '
Call bubble_sort
Call show 'nachher'
Exit
bubble_sort: Procedure Expose a.
Do Until no_more_swaps
no_more_swaps=1
Do i=1 To a.0-1
i1=i+1
if a.i > a.i1 Then Do
temp=a.i; a.i=a.i1; a.i1=temp
no_more_swaps=0
End
End
End
Return
show:
l=''; Do i=1 To a.0; l=l a.i; End; Say arg(1)':'l
Return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Bubble-sort\sorting-algorithms-bubble-sort-3.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
