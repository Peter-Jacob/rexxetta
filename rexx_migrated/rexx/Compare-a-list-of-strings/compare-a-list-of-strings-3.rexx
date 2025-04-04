/*ͺ*REXX program compares a list of strings for:  equality, all ascending.                */
newV1.1= 'ayu dab dog gar panda tui yak'             /*ͺ*seven strings: they're all ascending.*/
newV1.2= 'oy oy oy oy oy oy oy oy oy oy'             /*ͺ*  ten strings:         all equal.    */
newV1.3= 'somehow   somewhere  sometime'             /*ͺ*three strings:   Β¬equal,  Β¬ascending.*/
newV1.4= 'Hoosiers'                                  /*ͺ*only a single string is defined.     */
newV1.5=                                             /*ͺ*Null.   That is,  no strings here.   */
newV2= 5;         do j=1  for newV2;    say;   say       /*ͺ* [β]  traipse through all the lists. */
say center(' 'newV1.j, 50, "β")        /*ͺ*display a centered title/header.     */
if cStr(newV1.j, 'Equal'    )  then  say  "  The strings are all equal."
if cStr(newV1.j, 'Ascending')  then  say  "  The strings are ascending."
end   /*ͺ*j*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
cStr: procedure; parse arg x;  arg , how 2       /*ͺ*set X to list; get 1st char of arg #2*/
do k=2  to words(x)                /*ͺ*scan the strings in the list.        */
if how=='E'  then if word(x,k) \== word(x,k-1)  then return 0   /*ͺ*Β¬=prev.?*/
if how=='A'  then if word(x,k) <<= word(x,k-1)  then return 0   /*ͺ*β€ prev.?*/
end   /*ͺ*k*/                        /*ͺ* [β]   1=true.        [β]   0=false. */
return 1                                   /*ͺ*indicate strings have true comparison*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Compare-a-list-of-strings\compare-a-list-of-strings-3.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
