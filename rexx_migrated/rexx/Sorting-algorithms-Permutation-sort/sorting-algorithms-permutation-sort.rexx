/*�*REXX program  sorts and displays  an array  using the  permutation-sort  method.      */
call gen                                         /*�*generate the array elements.         */
call show     'before sort'                      /*�*show the  before  array elements.    */
say  copies('░', 75)  /*�*show separator line between displays.*/
call pSort  L                                    /*�*invoke the permutation sort.         */
call show     ' after sort'                      /*�*show the   after  array elements.    */
say; say 'Permutation sort took '      newV8      " permutations to find the sorted list."
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
.pAdd: newV7=newV7+1; do j=1 for N;  newV2.newV7=newV2.newV7  newV5.j;  end;   return           /*�*add a permutation.*/
show:    do j=1  for L;  say newV4 right(j, wL) arg(1)":" translate(newV3.j, , '_'); end;  return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
gen:   newV3.=;                            newV3.1 = '---Four_horsemen_of_the_Apocalypse---'
newV3.2 = '====================================='
newV3.3 = 'Famine───black_horse'
newV3.4 = 'Death───pale_horse'
newV3.5 = 'Pestilence_[Slaughter]───red_horse'
newV3.6 = 'Conquest_[War]───white_horse'
newV4= right('element', 15)                          /*�*literal used for the display.*/
do L=1  while newV3.L\=='';  newV1.L=newV3.L;   end;    L= L-1;      wL=length(L);    return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
isOrd: parse arg q                                       /*�*see if  Q  list is in order. */
newV6= word(q, 1);  do j=2  to words(q);  x= word(q, j);  if x<newV6  then return 0;   newV6= x
end   /*�*j*/                       /*�* [↑]  Out of order?   ¬sorted*/
do k=1  for newV7;  newV6= word(newV2.newV8, k);  newV3.k= newV1.newV6;  end  /*�*k*/;  return 1  /*�*in order*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
.pNxt: procedure expose newV5.;    parse arg n,i;         nm= n - 1
do k=nm  by -1  for nm;   kp= k + 1
if newV5.k<newV5.kp   then  do;    i= k;         leave;    end
end   /*�*k*/                  /*�* [↓]  swap two array elements*/
do j=i+1  while j<n;  parse value  newV5.j newV5.n  with  newV5.n newV5.j;   n= n-1;  end  /*�*j*/
if i==0  then return 0                            /*�*0:  indicates no more perms. */
do j=i+1  while newV5.j<newV5.i;   end  /*�*j*/          /*�*search perm for a lower value*/
parse value newV5.j newV5.i  with  newV5.i newV5.j;  return 1     /*�*swap two values in !.  array.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
pSort: parse arg n,newV2.;  newV7= 0                     /*�*generate  L  items (!)  permutations.*/
do f=1  for n;                newV5.f= f;        end  /*�*f*/;            call .pAdd
do while .pNxt(n, 0);         call .pAdd;    end  /*�*while*/
do newV8=1  until isOrd(newV9);       newV9=                            /*�*find permutation.*/
do m=1  for newV7; newV6= word(newV2.newV8, m); newV9= newV9 newV3.newV6;  end  /*�*m*/     /*�*build the $ list.*/
end   /*�*?*/;                  return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Permutation-sort\sorting-algorithms-permutation-sort.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
