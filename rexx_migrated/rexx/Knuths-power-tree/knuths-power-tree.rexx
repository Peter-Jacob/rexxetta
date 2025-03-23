/*�*REXX program produces & displays a  power tree  for P,  and calculates & displays X^P.*/
numeric digits 1000                              /*�*be able to handle some large numbers.*/
parse arg XP                                     /*�*get sets:   X, low power, high power.*/
if XP=''  then XP='2 -4 17   3 191 191   1.1 81' /*�*Not specified?  Then use the default.*/
/*�*────── X LP HP   X  LP  HP    X  LP  ◄── X, low power, high power ··· repeat*/
do  until XP=''
parse var XP    x pL pH   XP;    x= x / 1   /*�*get X, lowP, highP; and normalize X. */
if pH=''  then pH= pL                       /*�*No highPower?  Then assume lowPower. */

do e=pL  to pH;           p= abs(e) / 1   /*�*use a range of powers;   use  │E│    */
newV4= powerTree(p);          w= length(pH)   /*�*construct the power tree, (pow list).*/
/*�* [↑]  W≡length for an aligned display*/
do i=1  for words(newV4);  newV1.i= word(newV4, i) /*�*build a fast Knuth's power tree array*/
end   /*�*i*/

if p==0  then do;  z= 1;  call show;  iterate;  end  /*�*handle case of zero power.*/
newV2.= .;   z= x;     newV2.1= z;     prv= z     /*�*define/construct the first power of X*/

do k=2  to words(newV4);       n= newV1.k     /*�*obtain the power (number) to be used.*/
prev= k - 1;     diff= n - newV1.prev     /*�*these are used for the odd powers.   */
if n//2==0  then z= prv ** 2          /*�*Even power?   Then square the number.*/
else z= z * newV2.diff        /*�* Odd   "        "  mult. by pow diff.*/
newV2.n= z                                /*�*remember for other multiplications.  */
prv= z                                /*�*remember for squaring the numbers.   */
end   /*�*k*/
call show                                 /*�*display the expression and its value.*/
end       /*�*e*/
end         /*�*until XP ···*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
powerTree: arg y 1 oy;   newV4=                      /*�*Z is the result; $ is the power tree.*/
if y=0 | y=1  then return y           /*�*handle special cases for zero & unity*/
newV3.= 0;   newV1.= 0;    newV3.0= 1             /*�*define default & initial array values*/
/*�* [↓]  add blank "flag" thingy──►list.*/
do  while \(y//2);  newV4= newV4 ' '  /*�*reduce "front" even power #s to odd #*/
if y\==oy  then newV4= y newV4        /*�*(only)  ignore the first power number*/
y= y % 2                      /*�*integer divide the power (it's even).*/
end   /*�*while*/

if newV4\==''  then newV4= y newV4                /*�*re─introduce the last power number.  */
newV4= newV4 oy                               /*�*insert last power number 1st in list.*/
if y>1  then do      while  newV1.y==0;            n= newV3.0;        m= 0
do    while  n\==0;             q= 0;          s= n
do  while  s\==0;             newV5= n + s
if newV1.newV5==0  then do;  if q==0  then mnewV5= newV5;
newV3.newV5= q;  newV1.newV5= n;        q= newV5
end
s= newV1.s
end   /*�*while s¬==0*/
if q\==0  then do;   newV3.m= q;   m= mnewV5;   end
n= newV3.n
end     /*�*while n¬==0*/
newV3.m= 0
end       /*�*while @.y==0*/
z= newV1.y
do  while z\==0;   newV4= z newV4;   z= newV1.z;  end /*�*build power list*/
return space(newV4)                                            /*�*del extra blanks*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show: if e<0  then z=format(1/z, , 40)/1;     newV5=right(e, w)           /*�*use reciprocal? */
say left('power tree for '  newV5  " is: "  newV4,60)  '═══'  x"^"newV5  ' is: '  z;      return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Knuths-power-tree\knuths-power-tree.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
