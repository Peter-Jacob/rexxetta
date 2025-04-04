/*ͺ*REXX program  sorts and displays  an array  using the  permutation-sort  method.      */
call gen                                         /*ͺ*generate the array elements.         */
call show     'before sort'                      /*ͺ*show the  before  array elements.    */
say  copies('β', 75)  /*ͺ*show separator line between displays.*/
call pSort  L                                    /*ͺ*invoke the permutation sort.         */
call show     ' after sort'                      /*ͺ*show the   after  array elements.    */
say; say 'Permutation sort took '      newV8      " permutations to find the sorted list."
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
.pAdd: newV7=newV7+1; do j=1 for N;  newV2.newV7=newV2.newV7  newV5.j;  end;   return           /*ͺ*add a permutation.*/
show:    do j=1  for L;  say newV4 right(j, wL) arg(1)":" translate(newV3.j, , '_'); end;  return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
gen:   newV3.=;                            newV3.1 = '---Four_horsemen_of_the_Apocalypse---'
newV3.2 = '====================================='
newV3.3 = 'Famineβββblack_horse'
newV3.4 = 'Deathβββpale_horse'
newV3.5 = 'Pestilence_[Slaughter]βββred_horse'
newV3.6 = 'Conquest_[War]βββwhite_horse'
newV4= right('element', 15)                          /*ͺ*literal used for the display.*/
do L=1  while newV3.L\=='';  newV1.L=newV3.L;   end;    L= L-1;      wL=length(L);    return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
isOrd: parse arg q                                       /*ͺ*see if  Q  list is in order. */
newV6= word(q, 1);  do j=2  to words(q);  x= word(q, j);  if x<newV6  then return 0;   newV6= x
end   /*ͺ*j*/                       /*ͺ* [β]  Out of order?   Β¬sorted*/
do k=1  for newV7;  newV6= word(newV2.newV8, k);  newV3.k= newV1.newV6;  end  /*ͺ*k*/;  return 1  /*ͺ*in order*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
.pNxt: procedure expose newV5.;    parse arg n,i;         nm= n - 1
do k=nm  by -1  for nm;   kp= k + 1
if newV5.k<newV5.kp   then  do;    i= k;         leave;    end
end   /*ͺ*k*/                  /*ͺ* [β]  swap two array elements*/
do j=i+1  while j<n;  parse value  newV5.j newV5.n  with  newV5.n newV5.j;   n= n-1;  end  /*ͺ*j*/
if i==0  then return 0                            /*ͺ*0:  indicates no more perms. */
do j=i+1  while newV5.j<newV5.i;   end  /*ͺ*j*/          /*ͺ*search perm for a lower value*/
parse value newV5.j newV5.i  with  newV5.i newV5.j;  return 1     /*ͺ*swap two values in !.  array.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
pSort: parse arg n,newV2.;  newV7= 0                     /*ͺ*generate  L  items (!)  permutations.*/
do f=1  for n;                newV5.f= f;        end  /*ͺ*f*/;            call .pAdd
do while .pNxt(n, 0);         call .pAdd;    end  /*ͺ*while*/
do newV8=1  until isOrd(newV9);       newV9=                            /*ͺ*find permutation.*/
do m=1  for newV7; newV6= word(newV2.newV8, m); newV9= newV9 newV3.newV6;  end  /*ͺ*m*/     /*ͺ*build the $ list.*/
end   /*ͺ*?*/;                  return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Permutation-sort\sorting-algorithms-permutation-sort.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
