/*ͺ*REXX pgm finds one or more missing permutations from an internal list & displays them.*/
list= 'ABCD CABD ACDB DACB BCDA ACBD ADCB CDAB DABC BCAD CADB CDBA CBAD ABDC ADBC BDCA',
"DCBA BACD BADC BDAC CBDA DBCA DCAB"       /*ͺ*list that is missing one permutation.*/
newV2.=                                              /*ͺ* [β]  needs to be as long as  THINGS.*/
newV1 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'             /*ͺ*an uppercase (Latin/Roman) alphabet. */
things= 4                                        /*ͺ*number of unique letters to be used. */
bunch = 4                                        /*ͺ*number letters to be used at a time. */
do j=1  for things              /*ͺ* [β]  only get a portion of alphabet.*/
newV3.j= substr(newV1, j, 1)        /*ͺ*extract just one letter from alphabet*/
end   /*ͺ*j*/                     /*ͺ* [β]  build a letter array for speed.*/
call permSet 1                                   /*ͺ*invoke PERMSET subroutine recursively*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
permSet: procedure expose newV3. newV2. bunch list things; parse arg newV4 /*ͺ*calls self recursively.*/
if newV4>bunch  then do;  newV5=
do m=1  for bunch           /*ͺ*build a permutation.   */
newV5= newV5  ||  newV2.m               /*ͺ*add permutationβββΊlist.*/
end   /*ͺ*m*/
/*ͺ* [β]  is in the list?  */
if wordpos(newV5,list)==0  then say newV5  ' is missing from the list.'
end
else do x=1  for things                   /*ͺ*build a permutation.   */
do k=1  for newV4-1
if newV2.k==newV3.x  then iterate x /*ͺ*was permutation built? */
end  /*ͺ*k*/
newV2.newV4= newV3.x                             /*ͺ*define as being built. */
call permSet  newV4+1                    /*ͺ*call self recursively. */
end   /*ͺ*x*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Find-the-missing-permutation\find-the-missing-permutation.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
