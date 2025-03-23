/*�*REXX program performs a type of  bogo sort  on  numbers in an array.  */
parse arg list                         /*�*obtain optional list from C.L. */
if list=''  then list=-21 333 0 444.4  /*�*Not defined?  Then use default.*/
newV2=words(list)                          /*�*the number of numbers in list. */
do i=1  for words(list);  newV1.i=word(list,i);  end   /*�*create an array.*/
call tell 'before bogo sort'

do bogo=1

do j=1  for newV2-1;   jp=j+1          /*�* [↓]  compare a # with the next*/
if newV1.jp>=newV1.j  then iterate         /*�*so far, so good;  keep looking.*/
/*�*get 2 unique random #s for swap*/
do  until a\==b;  a=random(1, newV2);     b=random(1, newV2);    end

parse value newV1.a newV1.b  with  newV1.b newV1.a /*�*swap 2 random numbers in array.*/
iterate bogo                       /*�*go and try another bogo sort.  */
end     /*�*j*/

leave                                /*�*we're finished with bogo sort. */
end       /*�*bogo*/                   /*�* [↓]  show the # of bogo sorts.*/

say 'number of bogo sorts performed =' bogo
call tell ' after bogo sort'
exit                                   /*�*stick a fork in it, we're done.*/
/*�*──────────────────────────────────TELL subroutine─────────────────────*/
tell:  say;  say center(arg(1), 50, '─')
do t=1  for newV2
say arg(1)  'element'right(t, length(newV2))'='right(newV1.t, 18)
end   /*�*t*/
say
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Bogosort\sorting-algorithms-bogosort-1.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
