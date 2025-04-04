/*ͺ*REXX program  sorts and displays  an array  using the  pancake sort  algorithm.       */
call gen                                         /*ͺ*generate elements in the   @.  array.*/
call show          'before sort'                 /*ͺ*display the   BEFORE  array elements.*/
say copies('β', 60)                    /*ͺ*display a separator line for eyeballs*/
call pancakeSort         newV5                       /*ͺ*invoke the   pancake  sort.   Yummy. */
call show          ' after sort'                 /*ͺ*display the    AFTER array elements. */
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
inOrder: parse arg n; do j=1  for n-1;  k= j+1;  if newV2.j>newV2.k  then return 0; end;  return 1
panFlip: parse arg y;  do i=1  for (y+1)%2; yi=y-i+1; newV3=newV2.i; newV2.i=newV2.yi; newV2.yi=newV3; end; return
show: do k=1  for newV5;  say newV1 right(k,length(newV5)) arg(1)':' right(newV2.k,9);  end; return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
gen:  fibs= '-55 -21 -1 -8 -8 -21 -55 0 0'       /*ͺ*some nonβpositive Fibonacci numbers, */
newV1= right('element', 21)             /*ͺ*     most Fibs of which are repeated.*/

/*ͺ* ββββ¬ββββ some paired bread primes which are of the form:  (P-3)Γ·2  and  2βP+3  */
/*ͺ* β  β     where P is a prime. Bread primes are related to sandwich & meat primes*/
/*ͺ* β  β ββββ ββββ βββββ ββββββ ββββββ ββββββ ββββββ βββββββ βββββββ βββββββ ββββββ*/
bp=2 17 5 29 7 37 13 61 43 181 47 197 67 277 97 397 113 461 137 557 167 677 173 701,
797 1117 307 1237 1597 463 1861 467
newV4= bp fibs;       newV5= words(newV4)              /*ͺ*combine the two lists; get # of items*/
do j=1  for newV5; newV2.j= word(newV4, j);  end /*ͺ*ββββ obtain a number from the $ list.*/
return                                     /*ͺ* [β]  populate the  @.  array with #s*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
pancakeSort: procedure expose newV2.;   parse arg n .;  if inOrder(n)  then return
do n=n  by -1  for n-1
newV6= newV2.1;   newV7= 1;                   do j=2  to n;  if newV2.j<=newV6  then iterate
newV6= newV2.j;        newV7= j
end   /*ͺ*j*/
call panFlip newV7;  call panFlip n
end   /*ͺ*n*/;                      return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Pancake-sort\sorting-algorithms-pancake-sort.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
