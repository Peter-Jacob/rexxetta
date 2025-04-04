/*ͺ*REXX program sorts an array using the   cocktailβsort   method  with shifting bounds. */
call gen                                         /*ͺ*generate some array elements.        */
call show  'before sort'                         /*ͺ*show  unsorted  array elements.      */
say copies('β', 101)                        /*ͺ*show a separator line  (a fence).    */
call cocktailSort  newV3                             /*ͺ*invoke the cocktail sort subroutine. */
call show  ' after sort'                         /*ͺ*show    sorted  array elements.      */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
cocktailSort: procedure expose newV1.;    parse arg N             /*ͺ*N:  is number of items. */
end$= N - 1;     beg$= 1
do while beg$ <= end$
beg$$= end$;               end$$= beg$
do j=beg$ to end$;                   jp= j + 1
if newV1.j>newV1.jp  then do;  newV2=newV1.j;  newV1.j=newV1.jp;  newV1.jp=newV2;  end$$=j;  end
end   /*ͺ*j*/
end$= end$$ - 1
do k=end$  to beg$  by -1;           kp= k + 1
if newV1.k>newV1.kp  then do;  newV2=newV1.k;  newV1.k=newV1.kp;  newV1.kp=newV2;  beg$$=k;  end
end   /*ͺ*k*/
beg$= beg$$ + 1
end      /*ͺ*while*/
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
gen: newV1.=                                        /*ͺ*assign a default value for the stem. */
newV1.1 = '---the 22 card tarot deck (larger deck has 56 additional cards in 4 suits)---'
newV1.2 = '==========symbol====================pip======================================'
newV1.3 = 'the juggler                  ββββ     I'
newV1.4 = 'the high priestess  [Popess] ββββ    II'
newV1.5 = 'the empress                  ββββ   III'
newV1.6 = 'the emperor                  ββββ    IV'
newV1.7 = 'the hierophant  [Pope]       ββββ     V'
newV1.8 = 'the lovers                   ββββ    VI'
newV1.9 = 'the chariot                  ββββ   VII'
newV1.10= 'justice                      ββββ  VIII'
newV1.11= 'the hermit                   ββββ    IX'
newV1.12= 'fortune  [the wheel of]      ββββ     X'
newV1.13= 'strength                     ββββ    XI'
newV1.14= 'the hanging man              ββββ   XII'
newV1.15= 'death  [often unlabeled]     ββββ  XIII'
newV1.16= 'temperance                   ββββ   XIV'
newV1.17= 'the devil                    ββββ    XV'
newV1.18= 'lightning  [the tower]       ββββ   XVI'
newV1.18= 'the stars                    ββββ  XVII'
newV1.20= 'the moon                     ββββ XVIII'
newV1.21= 'the sun                      ββββ   XIX'
newV1.22= 'judgment                     ββββ    XX'
newV1.23= 'the world                    ββββ   XXI'
newV1.24= 'the fool  [often unnumbered] ββββ  XXII'

do newV3= 1  until newV1.newV3==''; end;  newV3= newV3-1 /*ͺ*find how many entries in the array.  */
return                                      /*ͺ* [β]  adjust for DO loop advancement.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
show: w= length(newV3);               do j=1  for newV3      /*ͺ*#:  is the number of items in @. */
say 'element'    right(j, w)     arg(1)":"    newV1.j
end   /*ͺ*j*/        /*ͺ*     β                           */
return                                         /*ͺ*     ββββββmax width of any line.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Cocktail-sort-with-shifting-bounds\sorting-algorithms-cocktail-sort-with-shifting-bounds.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
