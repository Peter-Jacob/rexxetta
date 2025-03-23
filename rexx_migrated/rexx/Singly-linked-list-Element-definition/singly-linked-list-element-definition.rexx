/*�*REXX program demonstrates how to create and show a single-linked list.*/
newV1.=0                                   /*�*define a null linked list.     */
call set@ 3                            /*�*linked list:  12 Proth Primes. */
call set@ 5
call set@ 13
call set@ 17
call set@ 41
call set@ 97
call set@ 113
call set@ 193
call set@ 241
call set@ 257
call set@ 353
call set@ 449
w=newV1.maxnewV2width                          /*�*use the maximum width of nums. */
call list@                             /*�*list all the elements in list. */
exit                                   /*�*stick a fork in it, we're done.*/
/*�*──────────────────────────────────LIST@ subroutine────────────────────*/
list@: say;  w=max(7, newV1.maxnewV2width )    /*�*use the max width of nums or 7.*/
say center('item',6)        center('value',w)        center('next',6)
say center(''    ,6,'─')    center(''     ,w,'─')    center(''    ,6,'─')
p=1
do j=1  until p==0      /*�*show all entries of linked list*/
say  right(j,6)   right(newV1.p.newV2value,w)   right(newV1.p.newV2next,6)
p=newV1.p.newV2next
end   /*�*j*/
return
/*�*──────────────────────────────────SET@ subroutine─────────────────────*/
set@: procedure expose newV1.; parse arg y /*�*get element to be added to list*/
newV2=newV1.newV2last                              /*�*set the previous last element. */
n=newV2+1                                  /*�*bump last ptr in linked list.  */
newV1.newV2.newV2next=n                            /*�*set the  next  pointer value.  */
newV1.newV2last=n                              /*�*define next item in linked list*/
newV1.n.newV2value=y                           /*�*set item to the value specified*/
newV1.n.newV2next=0                            /*�*set the  next  pointer value.  */
newV1..y=n                                 /*�*set a locator pointer to self. */
newV1.maxnewV2width=max(newV1.maxnewV2width,length(y)) /*�*set maximum width of any value.*/
return                                 /*�*return to invoker of this sub. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Singly-linked-list-Element-definition\singly-linked-list-element-definition.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
