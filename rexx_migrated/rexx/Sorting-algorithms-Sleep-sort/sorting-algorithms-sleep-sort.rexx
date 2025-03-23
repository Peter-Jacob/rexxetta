/*�*REXX program implements a sleep sort (with numbers entered from the command line (CL).*/
numeric digits 300                               /*�*over the top,  but what the hey!     */
/*�*  (above)  ··· from vaudeville.      */
newV3.=                                              /*�*placeholder for the array of numbers.*/
stuff= 1e9 50 5 40 4 1 100 30 3 12 2 8 9 7 6 6 10 20 0      /*�*alphabetically ··· so far.*/
parse arg numbers                                /*�*obtain optional arguments from the CL*/
if numbers=''  then numbers= stuff               /*�*Not specified?  Then use the default.*/
N= words(numbers)                                /*�*N  is the number of numbers in list. */
w= length(N)                                     /*�*width of  N  (used for nice output). */
parse upper version newV2 .                       /*�*obtain which REXX we're running under*/
newV1= ('REXX-REGINA'==left(newV2, 11) )        /*�*indicate (or not) if this is Regina. */
say N  'numbers to be sorted:'   numbers         /*�*informative informational information*/
/*�*from department of redundancy depart.*/
do j=1  for N                                /*�*let's start to boogie─woogie da sort.*/
newV3.j= word(numbers, j)                        /*�*plug in a single number at a time.   */
if datatype(newV3.j, 'N')  then newV3.j= newV3.j / 1     /*�*normalize it if it's a numeric number*/
if newV1  then call fork                   /*�*only REGINA REXX supports  FORK  BIF.*/
call sortItem j                              /*�*start a sort for an array number.    */
end   /*�*j*/

do forever  while \inOrder(N)              /*�*wait for the sorts to complete.      */
call delay 1                               /*�*one second is minimum effective time.*/
end    /*�*forever while*/                   /*�*well heck,  other than zero seconds. */

m= max(length(newV3.1), length(newV3.N) )                /*�*width of smallest or largest number. */
say;                        say  'after sort:'   /*�*display a blank line and a title.    */

do k=1  for N                              /*�*list the  (sorted)  array's elements.*/
say left('', 20)     'array element'      right(k, w)      '───►'      right(newV3.k, m)
end   /*�*k*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sortItem: procedure expose newV3.;   parse arg newV4     /*�*sorts a single  (numeric)  item.     */
do Asort=1  until \switched        /*�*sort unsorted array until it's sorted*/
switched= 0                        /*�*it's all hunky─dorey, happy─dappy ···*/
do i=1   while   newV3.i\==''  &  \switched
if newV3.newV4 >= newV3.i then iterate     /*�*item is in order. */
parse value   newV3.newV4  newV3.i     with     newV3.i  newV3.newV4
switched= 1                    /*�* [↑]  swapped one.*/
end   /*�*i*/
if Asort//newV4==0  then call delay switched              /*�*sleep if last item*/
end   /*�*Asort*/
return               /*�*Sleeping Beauty awakes.  Not to worry:  (c)=circa 1697.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
inOrder: procedure expose newV3.;  parse arg howMany /*�*is the array in numerical order?     */
do m=1  for howMany-1;  next= m+1;  if newV3.m>newV3.next  then return 0 /*�*¬ in order*/
end   /*�*m*/                           /*�*keep looking for fountain of youth.  */
return 1                                /*�*yes, indicate with an indicator.     */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Sleep-sort\sorting-algorithms-sleep-sort.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
