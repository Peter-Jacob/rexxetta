/*ͺ*REXX program implements a sleep sort (with numbers entered from the command line (CL).*/
numeric digits 300                               /*ͺ*over the top,  but what the hey!     */
/*ͺ*  (above)  Β·Β·Β· from vaudeville.      */
newV3.=                                              /*ͺ*placeholder for the array of numbers.*/
stuff= 1e9 50 5 40 4 1 100 30 3 12 2 8 9 7 6 6 10 20 0      /*ͺ*alphabetically Β·Β·Β· so far.*/
parse arg numbers                                /*ͺ*obtain optional arguments from the CL*/
if numbers=''  then numbers= stuff               /*ͺ*Not specified?  Then use the default.*/
N= words(numbers)                                /*ͺ*N  is the number of numbers in list. */
w= length(N)                                     /*ͺ*width of  N  (used for nice output). */
parse upper version newV2 .                       /*ͺ*obtain which REXX we're running under*/
newV1= ('REXX-REGINA'==left(newV2, 11) )        /*ͺ*indicate (or not) if this is Regina. */
say N  'numbers to be sorted:'   numbers         /*ͺ*informative informational information*/
/*ͺ*from department of redundancy depart.*/
do j=1  for N                                /*ͺ*let's start to boogieβwoogie da sort.*/
newV3.j= word(numbers, j)                        /*ͺ*plug in a single number at a time.   */
if datatype(newV3.j, 'N')  then newV3.j= newV3.j / 1     /*ͺ*normalize it if it's a numeric number*/
if newV1  then call fork                   /*ͺ*only REGINA REXX supports  FORK  BIF.*/
call sortItem j                              /*ͺ*start a sort for an array number.    */
end   /*ͺ*j*/

do forever  while \inOrder(N)              /*ͺ*wait for the sorts to complete.      */
call delay 1                               /*ͺ*one second is minimum effective time.*/
end    /*ͺ*forever while*/                   /*ͺ*well heck,  other than zero seconds. */

m= max(length(newV3.1), length(newV3.N) )                /*ͺ*width of smallest or largest number. */
say;                        say  'after sort:'   /*ͺ*display a blank line and a title.    */

do k=1  for N                              /*ͺ*list the  (sorted)  array's elements.*/
say left('', 20)     'array element'      right(k, w)      'ββββΊ'      right(newV3.k, m)
end   /*ͺ*k*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
sortItem: procedure expose newV3.;   parse arg newV4     /*ͺ*sorts a single  (numeric)  item.     */
do Asort=1  until \switched        /*ͺ*sort unsorted array until it's sorted*/
switched= 0                        /*ͺ*it's all hunkyβdorey, happyβdappy Β·Β·Β·*/
do i=1   while   newV3.i\==''  &  \switched
if newV3.newV4 >= newV3.i then iterate     /*ͺ*item is in order. */
parse value   newV3.newV4  newV3.i     with     newV3.i  newV3.newV4
switched= 1                    /*ͺ* [β]  swapped one.*/
end   /*ͺ*i*/
if Asort//newV4==0  then call delay switched              /*ͺ*sleep if last item*/
end   /*ͺ*Asort*/
return               /*ͺ*Sleeping Beauty awakes.  Not to worry:  (c)=circa 1697.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
inOrder: procedure expose newV3.;  parse arg howMany /*ͺ*is the array in numerical order?     */
do m=1  for howMany-1;  next= m+1;  if newV3.m>newV3.next  then return 0 /*ͺ*Β¬ in order*/
end   /*ͺ*m*/                           /*ͺ*keep looking for fountain of youth.  */
return 1                                /*ͺ*yes, indicate with an indicator.     */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Sleep-sort\sorting-algorithms-sleep-sort.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
