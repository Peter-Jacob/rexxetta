/*ͺ*REXX program finds the  persistence and multiplicative  digital root  of some numbers.*/
numeric digits 2000                              /*ͺ*increase the number of decimal digits*/
parse arg target x                               /*ͺ*obtain optional arguments from the CL*/
if \datatype(target, 'W')  then target=25        /*ͺ*Not specified?  Then use the default.*/
if x='' | x=","  then x=123321 7739 893 899998   /*ͺ* "      "         "   "   "      "   */
say center('number',8)  ' persistence   multiplicative digital root'
say copies('β'     ,8)  ' βββββββββββ   βββββββββββββββββββββββββββ'
/*ͺ* [β]  the title  and  the separator. */
do j=1  for words(x);  n= abs( word(x, j) )  /*ͺ*process each number in the list.     */
parse value  MDR(n)   with   mp mdr          /*ͺ*obtain the persistence and the MDR.  */
say right(n,8) center(mp,13) center(mdr,30)  /*ͺ*display the number, persistence, MDR.*/
end   /*ͺ*j*/                                  /*ͺ* [β] show MP and MDR for each number.*/
say copies('β'     ,8)  ' βββββββββββ   βββββββββββββββββββββββββββ'
say;      say                                    /*ͺ* [β] show a blank and the title line.*/
say 'MDR       first '  target  " numbers that have a matching MDR"
say 'βββ  ' copies("β",(target+(target+1)**2)%2) /*ͺ*display a separator line (for title).*/

do k=0  for 9;              hits= 0          /*ͺ*show numbers that have an MDR of  K. */
newV5=
if k==7  then newV5= newV1                          /*ͺ*handle the special case of  seven.   */
else do m=k  until hits==target     /*ͺ*find target numbers with an MDR of K.*/
parse var  m  ''  -1  newV6        /*ͺ*obtain the rightβmost digit of  M.   */
if k\==0  then if newV6==0           then iterate
if k==5   then if newV6//2==0        then iterate
if k==1   then m= copies(1, hits+1)
else if MDR(m, 1)\==k  then iterate
hits= hits + 1                            /*ͺ*got a hit, add to the list*/
newV5= space(newV5 m)                             /*ͺ*elide superfluous blanks. */
if k==3  then do;      o=strip(m, 'T', 1) /*ͺ*strip trailing ones from M*/
if o==3  then m= copies(1, length(m))3  /*ͺ*make a new  M.*/
else do;   t= pos(3, m) - 1    /*ͺ*position of 3 */
m= overlay(3, translate(m, 1, 3), t)
end     /*ͺ* [β] shift the "3" 1 place left.*/
m= m - 1              /*ͺ*adjust for  DO  index increment.*/
end                   /*ͺ* [β]  a shortcut to adj DO index*/
end   /*ͺ*m*/                         /*ͺ* [β]  built a list of MDRs = K  */

say " "k':    ['newV5"]"                         /*ͺ*display the  K  (MDR)  and the list. */
if k==3  then newV1= translate(newV5, 7, k)         /*ͺ*save for later, a special  "7"  case.*/
end   /*ͺ*k*/                                  /*ͺ* [β]  done with the  K  MDR list.    */

newV2.=                                              /*ͺ* [β]  handle MDR of  "9"  special.   */
newV5=  translate(newV1, 9, 7)                          /*ͺ*translate string for MDR  of nine.   */
newV3= translate(newV5, , ',')                          /*ͺ*remove trailing commas from numbers. */
newV4=                                              /*ͺ*assign null string before building.  */

do j=1  for words(newV3)                         /*ͺ*process each number for  MDR 9  case.*/
newV5= space( translate( word(newV3, j), , 9),  0)   /*ͺ*elide all  "9"s   using   SPACE(x,0).*/
L= length(newV5) + 1                              /*ͺ*use a "fudged" length of the number. */
new=                                          /*ͺ*these are the new numbers  (so far). */

do k=0 for L;       q= insert(3, newV5, k)   /*ͺ*insert the  1st  "3"  into the number*/
do i=k  to L;     z= insert(3, q, i)   /*ͺ*   "    "   2nd  "3"    "   "     "  */
if newV2.z\==''  then iterate              /*ͺ*if already define, ignore the number.*/
newV2.z= z;           new= z new           /*ͺ*define it,  and then add to the list.*/
end   /*ͺ*i*/                            /*ͺ* [β]  end of  2nd  insertion of  "3".*/
end     /*ͺ*k*/                            /*ͺ* [β]   "  "   1st      "      "   "  */

newV4= space(newV4 new)                             /*ͺ*remove blanks,  then add to the list.*/
end          /*ͺ*j*/                            /*ͺ* [β]  end of insertion of the  "3"s. */
newV7=                                               /*ͺ* [β]  merge two lists,  3s  and  9s. */
a1= newV3;     a2= newV4              /*ͺ*define some strings for the merge.   */
do  while  a1\==''  &  a2\==''             /*ͺ*process while the lists aren't empty.*/
x= word(a1, 1);  y= word(a2, 1)            /*ͺ*obtain the 1st word in A1 & A2 lists.*/
if x=='' | y=='' then leave                /*ͺ*are   X   or   Y   empty?            */
if x<y  then do;   newV7= newV7 x;   a1= delword(a1, 1, 1);   end  /*ͺ*add  X  to the @ list*/
else do;   newV7= newV7 y;   a2= delword(a2, 1, 1);   end  /*ͺ* "   Y   "  "  "   " */
end   /*ͺ*while*/                            /*ͺ* [β]  only process just enough nums. */

newV7= subword(newV7, 1, target)                         /*ͺ*elide the last trailing comma in list*/
say " "9':     ['newV7"]"                            /*ͺ*display the  "9" (MDR)  and the list.*/
say 'βββ  ' copies("β",(target+(target+1)**2)%2) /*ͺ*display a separator line (for title).*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
MDR: procedure; parse arg y,s;        y= abs(y)  /*ͺ*get the number and determine the MDR.*/
do p=1      until  y<10;    parse var  y  r  2
do k=2  to length(y);   r= r * substr(y, k, 1)
end   /*ͺ*k*/
y= r
end       /*ͺ*p*/               /*ͺ* [β]  wash, rinse, and repeat Β·Β·Β·    */
if s==1  then return r           /*ͺ*return multiplicative digital root.  */
return p r                       /*ͺ*return the persistence and the  MDR. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Digital-root-Multiplicative-digital-root\digital-root-multiplicative-digital-root-2.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
