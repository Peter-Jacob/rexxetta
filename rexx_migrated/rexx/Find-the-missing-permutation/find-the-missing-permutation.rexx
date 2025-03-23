/*�*REXX pgm finds one or more missing permutations from an internal list & displays them.*/
list= 'ABCD CABD ACDB DACB BCDA ACBD ADCB CDAB DABC BCAD CADB CDBA CBAD ABDC ADBC BDCA',
"DCBA BACD BADC BDAC CBDA DBCA DCAB"       /*�*list that is missing one permutation.*/
newV2.=                                              /*�* [↓]  needs to be as long as  THINGS.*/
newV1 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'             /*�*an uppercase (Latin/Roman) alphabet. */
things= 4                                        /*�*number of unique letters to be used. */
bunch = 4                                        /*�*number letters to be used at a time. */
do j=1  for things              /*�* [↓]  only get a portion of alphabet.*/
newV3.j= substr(newV1, j, 1)        /*�*extract just one letter from alphabet*/
end   /*�*j*/                     /*�* [↑]  build a letter array for speed.*/
call permSet 1                                   /*�*invoke PERMSET subroutine recursively*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
permSet: procedure expose newV3. newV2. bunch list things; parse arg newV4 /*�*calls self recursively.*/
if newV4>bunch  then do;  newV5=
do m=1  for bunch           /*�*build a permutation.   */
newV5= newV5  ||  newV2.m               /*�*add permutation──►list.*/
end   /*�*m*/
/*�* [↓]  is in the list?  */
if wordpos(newV5,list)==0  then say newV5  ' is missing from the list.'
end
else do x=1  for things                   /*�*build a permutation.   */
do k=1  for newV4-1
if newV2.k==newV3.x  then iterate x /*�*was permutation built? */
end  /*�*k*/
newV2.newV4= newV3.x                             /*�*define as being built. */
call permSet  newV4+1                    /*�*call self recursively. */
end   /*�*x*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Find-the-missing-permutation\find-the-missing-permutation.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
