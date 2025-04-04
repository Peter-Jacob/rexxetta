/*ª*REXX program shows unique positive integers for ââââââââââ aâ¿+bâ¿+câ¿+dâ¿==xâ¿  where n=5 */
numeric digits 1000                              /*ª*ensure enough decimal digs for powers*/
parse arg N oFID .                               /*ª*obtain optional arguments from the CL*/
if N=='' | N==","  then N= 200                   /*ª*Not specified?  Then use the default.*/
if oFID==''|oFID==","  then oFID= 'EULERSUM.OUT' /*ª* "      "         "   "   "     "    */
tell= N>=0                                       /*ª*if N is â¥ 0, show output to terminal.*/
N= abs(N)                                        /*ª*use the absolute value of  N.        */
a.1=  27  ;   a.2=    55   /*ª*the   A   values for the two sets.   */
b.1=  84  ;   b.2=  3183   /*ª* "    B      "    "   "   "    "     */
c.1= 110  ;   c.2= 28969   /*ª* "    C      "    "   "   "    "     */
d.1= 133  ;   d.2= 85282   /*ª* "    D      "    "   "   "    "     */
x.1= 144  ;   x.2= 85359   /*ª* "    X      "    "   "   "    "     */
w= length( commas(N * x.2) )                     /*ª*W:  used to align displayed numbers. */
newV1= center(' 'subword( sourceLine(1), 9, 3)" ", 70 +5*w, 'â')           /*ª*create a title.*/
call show                                        /*ª*show a title  (from 1st line of pgm).*/
pad= left('',5)                                  /*ª*used for padding (spacing) the output*/
oo= 1;   tt= 1                                   /*ª*a counter for the  A.1  &  A.2  sets.*/
newV2= 0                                             /*ª*count of number of solutions so far. */
do j=1  until newV2>N                         /*ª*step through the possible solutions. */
one= a.1 * oo                             /*ª*calculate the 1st set's  A.1  value. */
two= a.2 * tt                             /*ª*    "      "  2nd   "    A.2    "    */
use= min(one, two)                        /*ª*pick which "set" that is to be used. */
newV2= newV2 + 1                                  /*ª*bump counter for number of solutions.*/
if one==use  then do;      mult=oo;      oo= oo + 1;      which= 1;      end
if two==use  then do;      mult=tt;      tt= tt + 1;      which= 2;      end
newV1= pad  'solution'  right(newV2,length(N))":  "  'a='right( commas(a.which * mult), w),
pad     'b='right( commas(b.which * mult), w),
pad     'c='right( commas(c.which * mult), w),
pad     'd='right( commas(d.which * mult), w),
pad     'x='right( commas(x.which * mult), w)
call show                                 /*ª*write; maybe show output to terminal.*/
res= (x.which * mult) **5                 /*ª*compute the sum of the  right  side. */
sum= (a.which * mult) **5   +   ,         /*ª*   "     "   "   "  "    left    "   */
(b.which * mult) **5   +   ,
(c.which * mult) **5   +   ,
(d.which * mult) **5
if sum==res  then iterate                 /*ª*All is kosher?   Then keep truckin'. */
newV1= "***error*** the left side sum   doesn't   equal the right side result (X**5)."
tell=1;  call show;  exit 13              /*ª*force telling of error to terminal.  */
end   /*ª*j*/
tell=1;                                                                          call show
newV1= pad ' Showed '   commas(N)   " solutions,  output written to file: " oFID;    call show
exit                                             /*ª*stick a fork in it,  we're all done. */
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
commas: parse arg newV3;  do jc=length(newV3)-3  to 1  by -3; newV3=insert(',', newV3, jc); end;  return newV3
show:   if tell  then say newV1;  call lineout oFID, newV1;  newV1=;  return  /*ª*show and/or write it*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Eulers-sum-of-powers-conjecture\eulers-sum-of-powers-conjecture-2.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
