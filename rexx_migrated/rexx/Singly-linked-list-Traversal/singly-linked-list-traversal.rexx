/*�* REXX ********************************************************************
* 25.10.2013 Walter Pachl
*********************************************************************/
in='d:\sll.txt'
Do i=1 By 1 while lines(in)>0
rec=linein(in)
elem.i.val=rec
elem.i.next=0
ip=i-1
elem.ip.next=i
End;
c=1
Do While c<>0
Say c elem.c.val
c=elem.c.next
End
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Singly-linked-list-Traversal\singly-linked-list-traversal.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
