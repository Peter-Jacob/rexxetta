/*ͺ*REXX program produces & displays a  power tree  for P,  and calculates & displays X^P.*/
numeric digits 1000                              /*ͺ*be able to handle some large numbers.*/
parse arg XP                                     /*ͺ*get sets:   X, low power, high power.*/
if XP=''  then XP='2 -4 17   3 191 191   1.1 81' /*ͺ*Not specified?  Then use the default.*/
/*ͺ*ββββββ X LP HP   X  LP  HP    X  LP  βββ X, low power, high power Β·Β·Β· repeat*/
do  until XP=''
parse var XP    x pL pH   XP;    x= x / 1   /*ͺ*get X, lowP, highP; and normalize X. */
if pH=''  then pH= pL                       /*ͺ*No highPower?  Then assume lowPower. */

do e=pL  to pH;           p= abs(e) / 1   /*ͺ*use a range of powers;   use  βEβ    */
newV4= powerTree(p);          w= length(pH)   /*ͺ*construct the power tree, (pow list).*/
/*ͺ* [β]  Wβ‘length for an aligned display*/
do i=1  for words(newV4);  newV1.i= word(newV4, i) /*ͺ*build a fast Knuth's power tree array*/
end   /*ͺ*i*/

if p==0  then do;  z= 1;  call show;  iterate;  end  /*ͺ*handle case of zero power.*/
newV2.= .;   z= x;     newV2.1= z;     prv= z     /*ͺ*define/construct the first power of X*/

do k=2  to words(newV4);       n= newV1.k     /*ͺ*obtain the power (number) to be used.*/
prev= k - 1;     diff= n - newV1.prev     /*ͺ*these are used for the odd powers.   */
if n//2==0  then z= prv ** 2          /*ͺ*Even power?   Then square the number.*/
else z= z * newV2.diff        /*ͺ* Odd   "        "  mult. by pow diff.*/
newV2.n= z                                /*ͺ*remember for other multiplications.  */
prv= z                                /*ͺ*remember for squaring the numbers.   */
end   /*ͺ*k*/
call show                                 /*ͺ*display the expression and its value.*/
end       /*ͺ*e*/
end         /*ͺ*until XP Β·Β·Β·*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
powerTree: arg y 1 oy;   newV4=                      /*ͺ*Z is the result; $ is the power tree.*/
if y=0 | y=1  then return y           /*ͺ*handle special cases for zero & unity*/
newV3.= 0;   newV1.= 0;    newV3.0= 1             /*ͺ*define default & initial array values*/
/*ͺ* [β]  add blank "flag" thingyβββΊlist.*/
do  while \(y//2);  newV4= newV4 ' '  /*ͺ*reduce "front" even power #s to odd #*/
if y\==oy  then newV4= y newV4        /*ͺ*(only)  ignore the first power number*/
y= y % 2                      /*ͺ*integer divide the power (it's even).*/
end   /*ͺ*while*/

if newV4\==''  then newV4= y newV4                /*ͺ*reβintroduce the last power number.  */
newV4= newV4 oy                               /*ͺ*insert last power number 1st in list.*/
if y>1  then do      while  newV1.y==0;            n= newV3.0;        m= 0
do    while  n\==0;             q= 0;          s= n
do  while  s\==0;             newV5= n + s
if newV1.newV5==0  then do;  if q==0  then mnewV5= newV5;
newV3.newV5= q;  newV1.newV5= n;        q= newV5
end
s= newV1.s
end   /*ͺ*while sΒ¬==0*/
if q\==0  then do;   newV3.m= q;   m= mnewV5;   end
n= newV3.n
end     /*ͺ*while nΒ¬==0*/
newV3.m= 0
end       /*ͺ*while @.y==0*/
z= newV1.y
do  while z\==0;   newV4= z newV4;   z= newV1.z;  end /*ͺ*build power list*/
return space(newV4)                                            /*ͺ*del extra blanks*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
show: if e<0  then z=format(1/z, , 40)/1;     newV5=right(e, w)           /*ͺ*use reciprocal? */
say left('power tree for '  newV5  " is: "  newV4,60)  'βββ'  x"^"newV5  ' is: '  z;      return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Knuths-power-tree\knuths-power-tree.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
