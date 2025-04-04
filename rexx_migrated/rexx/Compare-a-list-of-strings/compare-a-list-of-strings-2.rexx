/*ͺ*REXX program compares a list of  (character) strings for:   equality,  all ascending. */
newV1.1= 'ayu dab dog gar panda tui yak'             /*ͺ*seven strings: they're all ascending.*/
newV1.2= 'oy oy oy oy oy oy oy oy oy oy'             /*ͺ*  ten strings:         all equal.    */
newV1.3= 'somehow   somewhere  sometime'             /*ͺ*three strings:   Β¬equal,  Β¬ascending.*/
newV1.4= 'Hoosiers'                                  /*ͺ*only a single string is defined.     */
newV1.5=                                             /*ͺ*Null.   That is,  no strings here.   */
do j=1  for 5;    say;   say            /*ͺ* [β]  traipse through all the lists. */
say center(' 'newV1.j, 50, "β")             /*ͺ*display a centered title/header.     */
if ifEqual( newV1.j)  then  say 'strings are all equal.'
if ifAscend(newV1.j)  then  say 'strings are ascending.'
end   /*ͺ*j*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
ifEqual:  procedure; parse arg strings           /*ͺ*set  STRINGS  to a string in the list*/
do k=2  to words(strings)            /*ͺ*scan the strings in the list.        */
if word(strings,k)\==word(strings,k-1)  then return 0        /*ͺ*string=prev? */
end   /*ͺ*k*/                          /*ͺ* [β]     0=false,   [β] 1=true.      */
return 1                               /*ͺ*indicate that all strings are equal. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
ifAscend: procedure; parse arg strings           /*ͺ*set  STRINGS  to a string in the list*/
do k=2  to words(strings)            /*ͺ*scan the strings in the list.        */
if word(strings,k)<<=word(strings,k-1)  then return 0        /*ͺ*string>prev? */
end   /*ͺ*k*/                          /*ͺ*  [β]    0=false,     [β]    1=true. */
return 1                               /*ͺ*indicate that strings are ascending. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Compare-a-list-of-strings\compare-a-list-of-strings-2.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
