/*�*REXX program  compute and displays  a sampling of  combinations  and  permutations.   */
numeric digits 100                               /*�*use 100 decimal digits of precision. */

do      j=1  for  12;                newV1=    /*�*show all permutations from  1 ──► 12.*/
do k=1  for   j                       /*�*step through all  J  permutations.   */
newV1=newV1  'P('j","k')='perm(j,k)" "        /*�*add an extra blank between numbers.  */
end       /*�*k*/
say strip(newV1)                               /*�*show the permutations horizontally.  */
end           /*�*j*/
say                                              /*�*display a blank line for readability.*/
do      j=10  to  60  by 10;         newV1=    /*�*show some combinations  10 ──►  60.  */
do k= 1  to   j  by j%5               /*�*step through some combinations.      */
newV1=newV1  'C('j","k')='comb(j,k)" "        /*�*add an extra blank between numbers.  */
end   /*�*k*/
say strip(newV1)                               /*�*show the combinations horizontally.  */
end           /*�*j*/
say                                              /*�*display a blank line for readability.*/
numeric digits 20                                /*�*force floating point for big numbers.*/

do      j=5  to 15000      by 1000;  newV1=    /*�*show a few permutations, big numbers.*/
do k=1  to  j  for 5  by j%10         /*�*step through some  J  permutations.  */
newV1=newV1  'P('j","k')='perm(j,k)" "        /*�*add an extra blank between numbers.  */
end      /*�*k*/
say strip(newV1)                               /*�*show the permutations horizontally.  */
end           /*�*j*/
say                                              /*�*display a blank line for readability.*/
do      j=100  to 1000  by 100;      newV1=    /*�*show a few combinations, big numbers.*/
do k=  1  to    j  by j%5             /*�*step through some combinations.      */
newV1=newV1  'C('j","k')='comb(j,k)" "        /*�*add an extra blank between numbers.  */
end      /*�*k*/
say strip(newV1)                               /*�*show the combinations horizontally.  */
end           /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
perm:      procedure; parse arg x,y;      call .combPerm;                         return newV1
.combPerm:                          newV1=1;    do j=x-y+1  to x;    newV1=newV1*j;  end;     return newV1
newV2:         procedure; parse arg x;  newV2=1;    do j=2      to x;    newV2=newV2*j;  end;     return newV2
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
comb:      procedure; parse arg x,y              /*�*arguments:  X  things,  Y  at-a-time.*/
if y   >x   then return 0  /*�*oops-say, an error,  too big a chunk.*/
if x   =y   then return 1  /*�*X  things are the same as chunk size.*/
if x-y <y   then y=x - y   /*�*switch things around for speed.      */
call .combPerm             /*�*call subroutine to do heavy lifting. */
return newV1 / newV2(y)            /*�*just perform one last division.      */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Combinations-and-permutations\combinations-and-permutations.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
