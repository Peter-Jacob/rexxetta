/*�*REXX program shows unique positive integers for ────────── aⁿ+bⁿ+cⁿ+dⁿ==xⁿ  where n=5 */
numeric digits 1000                              /*�*ensure enough decimal digs for powers*/
parse arg N oFID .                               /*�*obtain optional arguments from the CL*/
if N=='' | N==","  then N= 200                   /*�*Not specified?  Then use the default.*/
if oFID==''|oFID==","  then oFID= 'EULERSUM.OUT' /*�* "      "         "   "   "     "    */
tell= N>=0                                       /*�*if N is ≥ 0, show output to terminal.*/
N= abs(N)                                        /*�*use the absolute value of  N.        */
a.1=  27  ;   a.2=    55   /*�*the   A   values for the two sets.   */
b.1=  84  ;   b.2=  3183   /*�* "    B      "    "   "   "    "     */
c.1= 110  ;   c.2= 28969   /*�* "    C      "    "   "   "    "     */
d.1= 133  ;   d.2= 85282   /*�* "    D      "    "   "   "    "     */
x.1= 144  ;   x.2= 85359   /*�* "    X      "    "   "   "    "     */
w= length( commas(N * x.2) )                     /*�*W:  used to align displayed numbers. */
newV1= center(' 'subword( sourceLine(1), 9, 3)" ", 70 +5*w, '─')           /*�*create a title.*/
call show                                        /*�*show a title  (from 1st line of pgm).*/
pad= left('',5)                                  /*�*used for padding (spacing) the output*/
oo= 1;   tt= 1                                   /*�*a counter for the  A.1  &  A.2  sets.*/
newV2= 0                                             /*�*count of number of solutions so far. */
do j=1  until newV2>N                         /*�*step through the possible solutions. */
one= a.1 * oo                             /*�*calculate the 1st set's  A.1  value. */
two= a.2 * tt                             /*�*    "      "  2nd   "    A.2    "    */
use= min(one, two)                        /*�*pick which "set" that is to be used. */
newV2= newV2 + 1                                  /*�*bump counter for number of solutions.*/
if one==use  then do;      mult=oo;      oo= oo + 1;      which= 1;      end
if two==use  then do;      mult=tt;      tt= tt + 1;      which= 2;      end
newV1= pad  'solution'  right(newV2,length(N))":  "  'a='right( commas(a.which * mult), w),
pad     'b='right( commas(b.which * mult), w),
pad     'c='right( commas(c.which * mult), w),
pad     'd='right( commas(d.which * mult), w),
pad     'x='right( commas(x.which * mult), w)
call show                                 /*�*write; maybe show output to terminal.*/
res= (x.which * mult) **5                 /*�*compute the sum of the  right  side. */
sum= (a.which * mult) **5   +   ,         /*�*   "     "   "   "  "    left    "   */
(b.which * mult) **5   +   ,
(c.which * mult) **5   +   ,
(d.which * mult) **5
if sum==res  then iterate                 /*�*All is kosher?   Then keep truckin'. */
newV1= "***error*** the left side sum   doesn't   equal the right side result (X**5)."
tell=1;  call show;  exit 13              /*�*force telling of error to terminal.  */
end   /*�*j*/
tell=1;                                                                          call show
newV1= pad ' Showed '   commas(N)   " solutions,  output written to file: " oFID;    call show
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: parse arg newV3;  do jc=length(newV3)-3  to 1  by -3; newV3=insert(',', newV3, jc); end;  return newV3
show:   if tell  then say newV1;  call lineout oFID, newV1;  newV1=;  return  /*�*show and/or write it*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Eulers-sum-of-powers-conjecture\eulers-sum-of-powers-conjecture-2.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
