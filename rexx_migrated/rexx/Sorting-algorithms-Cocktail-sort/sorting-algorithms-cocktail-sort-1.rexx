/*ͺ*REXX program sorts an array using the cocktailβsort method,  A.K.A.:  happy hour sort,*/
/*ͺ*   bidirectional bubble sort,        */
/*ͺ*   cocktail shaker sort, ripple sort,*/
/*ͺ*   a selection sort variation,       */
/*ͺ*   shuffle sort,  shuttle sort,   or */
/*ͺ*   a bubble sort variation.          */
call genItems                                    /*ͺ*generate some array elements.        */
call showItems 'before sort'                     /*ͺ*show  unsorted  array elements.      */
say copies('β', 101)                             /*ͺ*show a separator line  (a fence).    */
call cocktailSort                                /*ͺ*invoke the cocktail sort subroutine. */
call showItems ' after sort'                     /*ͺ*show    sorted  array elements.      */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
cocktailSort: procedure expose items.
nn = items.0 - 1                                    /*ͺ*items.0:  is number of items. */
do until done
done = 1
do j = 1 for nn
jp = j + 1        /*ͺ* Rexx doesn't allow "items.(j+1)", so use this instead. */
if items.j > items.jp then do
done = 0
temp = items.j
items.j = items.jp
items.jp = temp
end
end /*ͺ*j*/
if done then leave                                    /*ͺ*No swaps done?  Finished*/
do k = nn for nn by -1
kp = k + 1        /*ͺ* Rexx doesn't allow "items.(k+1)", so use this instead. */
if items.k > items.kp  then do
done = 0
temp = items.k
items.k = items.kp
items.kp = temp
end
end /*ͺ*k*/
end /*ͺ*until*/
	
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
genitems: procedure expose items.
items.=                                      /*ͺ*assign a default value for the stem. */
items.1 ='---the 22 card tarot deck (larger deck has 56 additional cards in 4 suits)---'
items.2 ='==========symbol====================pip======================================'
items.3 ='the juggler                  ββββ     I'
items.4 ='the high priestess  [Popess] ββββ    II'
items.5 ='the empress                  ββββ   III'
items.6 ='the emperor                  ββββ    IV'
items.7 ='the hierophant  [Pope]       ββββ     V'
items.8 ='the lovers                   ββββ    VI'
items.9 ='the chariot                  ββββ   VII'
items.10='justice                      ββββ  VIII'
items.11='the hermit                   ββββ    IX'
items.12='fortune  [the wheel of]      ββββ     X'
items.13='strength                     ββββ    XI'
items.14='the hanging man              ββββ   XII'
items.15='death  [often unlabeled]     ββββ  XIII'
items.16='temperance                   ββββ   XIV'
items.17='the devil                    ββββ    XV'
items.18='lightning  [the tower]       ββββ   XVI'
items.19='the stars                    ββββ  XVII'
items.20='the moon                     ββββ XVIII'
items.21='the sun                      ββββ   XIX'
items.22='judgment                     ββββ    XX'
items.23='the world                    ββββ   XXI'
items.24='the fool  [often unnumbered] ββββ  XXII'
items.0 =24                                      /*ͺ* number of entries in the array. */

return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
showitems: procedure expose items.
parse arg phase
width = length(items.0)
do j=1 to items.0                       /*ͺ* items.0 is the number of items in items. */
say 'element' right(j, width) phase || ":" items.j
end /*ͺ*j*/           /*ͺ*     β                                   */
/*ͺ*     ββββββmax width of any line number. */
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Cocktail-sort\sorting-algorithms-cocktail-sort-1.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
