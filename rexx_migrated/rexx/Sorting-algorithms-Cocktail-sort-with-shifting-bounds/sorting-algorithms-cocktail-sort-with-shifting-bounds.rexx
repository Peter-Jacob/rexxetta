/*�*REXX program sorts an array using the   cocktail─sort   method  with shifting bounds. */
call gen                                         /*�*generate some array elements.        */
call show  'before sort'                         /*�*show  unsorted  array elements.      */
say copies('█', 101)                        /*�*show a separator line  (a fence).    */
call cocktailSort  newV3                             /*�*invoke the cocktail sort subroutine. */
call show  ' after sort'                         /*�*show    sorted  array elements.      */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
cocktailSort: procedure expose newV1.;    parse arg N             /*�*N:  is number of items. */
end$= N - 1;     beg$= 1
do while beg$ <= end$
beg$$= end$;               end$$= beg$
do j=beg$ to end$;                   jp= j + 1
if newV1.j>newV1.jp  then do;  newV2=newV1.j;  newV1.j=newV1.jp;  newV1.jp=newV2;  end$$=j;  end
end   /*�*j*/
end$= end$$ - 1
do k=end$  to beg$  by -1;           kp= k + 1
if newV1.k>newV1.kp  then do;  newV2=newV1.k;  newV1.k=newV1.kp;  newV1.kp=newV2;  beg$$=k;  end
end   /*�*k*/
beg$= beg$$ + 1
end      /*�*while*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
gen: newV1.=                                        /*�*assign a default value for the stem. */
newV1.1 = '---the 22 card tarot deck (larger deck has 56 additional cards in 4 suits)---'
newV1.2 = '==========symbol====================pip======================================'
newV1.3 = 'the juggler                  ◄───     I'
newV1.4 = 'the high priestess  [Popess] ◄───    II'
newV1.5 = 'the empress                  ◄───   III'
newV1.6 = 'the emperor                  ◄───    IV'
newV1.7 = 'the hierophant  [Pope]       ◄───     V'
newV1.8 = 'the lovers                   ◄───    VI'
newV1.9 = 'the chariot                  ◄───   VII'
newV1.10= 'justice                      ◄───  VIII'
newV1.11= 'the hermit                   ◄───    IX'
newV1.12= 'fortune  [the wheel of]      ◄───     X'
newV1.13= 'strength                     ◄───    XI'
newV1.14= 'the hanging man              ◄───   XII'
newV1.15= 'death  [often unlabeled]     ◄───  XIII'
newV1.16= 'temperance                   ◄───   XIV'
newV1.17= 'the devil                    ◄───    XV'
newV1.18= 'lightning  [the tower]       ◄───   XVI'
newV1.18= 'the stars                    ◄───  XVII'
newV1.20= 'the moon                     ◄─── XVIII'
newV1.21= 'the sun                      ◄───   XIX'
newV1.22= 'judgment                     ◄───    XX'
newV1.23= 'the world                    ◄───   XXI'
newV1.24= 'the fool  [often unnumbered] ◄───  XXII'

do newV3= 1  until newV1.newV3==''; end;  newV3= newV3-1 /*�*find how many entries in the array.  */
return                                      /*�* [↑]  adjust for DO loop advancement.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show: w= length(newV3);               do j=1  for newV3      /*�*#:  is the number of items in @. */
say 'element'    right(j, w)     arg(1)":"    newV1.j
end   /*�*j*/        /*�*     ↑                           */
return                                         /*�*     └─────max width of any line.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Cocktail-sort-with-shifting-bounds\sorting-algorithms-cocktail-sort-with-shifting-bounds.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
