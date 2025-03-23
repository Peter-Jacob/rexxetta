/*ª*REXX program demonstrates how to create a single-linked list       */
/*ª* and how to insert an element                                      */
z.=0                              /*ª* define a null linked z.       */
Call set_list 3                   /*ª* linked list:  12 Proth primes */
Call set_list 5 /*ª*see https://mathworld.wolfram.com/ProthPrime.html*/
Call set_list 13
Call set_list 17
Call set_list 41
Call set_list 97
Call set_list 113
Call set_list 193
Call set_list 241
Call set_list 257
Call set_list 353
Call set_list 449
Call show_list
newval=100                    /*ª* Insert this value                 */
after=97                      /*ª* after the element with this value */
nnn=z..after                  /*ª* position of zÂ´this value          */
Call ins_list nnn,newval       /*ª* perform the insertion             */
Say ''
Say 'a new value of' newval 'has been inserted',
'after element having the value:' after
Call show_list
Exit                              /*ª* stick a fork in it, we're done.*/

set_list: Procedure Expose z.
Parse Arg value                    /*ª* get element to be added to list*/
last=z.0                           /*ª* set the previous last element. */
new=z.0+1                          /*ª* set the new ast element.       */
z.0=new                            /*ª* define next item in linked list*/
z.last.0next=new                   /*ª* set the  next  pointer value.  */
z.new.0value=value                 /*ª* set item to the value specified*/
z.new.0next=0                      /*ª* set the  next  pointer value.  */
z..value=new                       /*ª* set a locator pointer to self. */
z.0width=max(z.0width,length(value)) /*ª*set maximum width of any value*/
Return

ins_list: Procedure Expose z.
Parse Arg nnn,value
z.0=z.0+1                          /*ª* bump number of list elements.  */
last=z.0                           /*ª* position of the new value      */
z.last.0value=value                /*ª* store the new value            */
z.last.0next=z.nnn.0next           /*ª* uptate the pointers to the     */
z.nnn.0next=last                   /*ª* next element                   */
z..value=last                      /*ª* store position of the new value*/
z.0width=max(z.0width,length(value)) /*ª*set maximum width of any value*/
Return

show_list:
Say
w=max(7,z.0width)                    /*ª* use the max width of nums or 7.*/
Say center('item',6) 'position' center('value',w) center('next',6)
Say center('',6,'-') '--------' center('',w,'-') center('',6,'-')
p=1
Do j=1 Until p==0                 /*ª* show all entries of linked list*/
Say right(j,6) right(p,8) right(z.p.0value,w) right(z.p.0next,6)
p=z.p.0next
End                             /*ª* j                              */
Return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Singly-linked-list-Element-insertion\singly-linked-list-element-insertion.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
