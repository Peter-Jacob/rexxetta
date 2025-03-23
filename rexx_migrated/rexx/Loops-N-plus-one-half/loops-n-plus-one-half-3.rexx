list='aa bb cc dd'
sep=', '
Do i=1 By 1 While list<>''
If i>1 Then Call charout ,sep
Parse Var list item list
Call charout ,item
End
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Loops-N-plus-one-half\loops-n-plus-one-half-3.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
