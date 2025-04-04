/*ͺ*REXX pgm computes&displays X n-smooth numbers; both X and N can be specified as ranges*/
numeric digits 200                               /*ͺ*be able to handle some big numbers.  */
parse arg LOx HIx LOn HIn .                      /*ͺ*obtain optional arguments from the CL*/
if LOx=='' | LOx==","  then LOx=  1              /*ͺ*Not specified?  Then use the default.*/
if HIx=='' | HIx==","  then HIx= LOx + 24        /*ͺ* "      "         "   "   "     "    */
if LOn=='' | LOn==","  then LOn=  2              /*ͺ* "      "         "   "   "     "    */
if HIn=='' | HIn==","  then HIn= LOn + 27        /*ͺ* "      "         "   "   "     "    */
call genP HIn                                    /*ͺ*generate enough primes to satisfy HIn*/
newV1= ' a list of the ';              newV2= ' through '  /*ͺ*literals used with a  SAY.*/

do j=LOn  to  HIn;  if newV4.j==0  then iterate /*ͺ*if not prime, then skip this number. */
call smooth HIx,j;                 newV6=       /*ͺ*invoke SMOOTH; initialize $  (list). */
do k=LOx  to HIx;  newV6= newV6 newV5.k /*ͺ*append a  smooth number to  "  "   " */
end   /*ͺ*k*/
say center(newV1  th(LOx)  newV2  th(HIx)     ' numbers for' j"-smooth ",  130, "β")
say strip(newV6);                      say
end   /*ͺ*j*/                                 /*ͺ* [β]  the $ list has a leading blank.*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
genP: procedure expose newV3. newV4. newV7; parse arg x      /*ͺ*#β‘num of primes; @. β‘array of primes.*/
newV3.=;      newV3.1=2; newV3.2=3; newV3.3=5; newV3.4=7; newV3.5=11; newV3.6=13; newV3.7=17; newV3.8=19; newV3.9=23;    newV7=9
newV4.=0;     newV4.2=1; newV4.3=2; newV4.5=3; newV4.7=4; newV4.11=5; newV4.13=6; newV4.17=7; newV4.19=8; newV4.23=9
do k=newV3.newV7+6  by 2  until newV7>=x ;        if k//3==0    then iterate
parse var  k  ''  -1  newV8;              if newV8==5       then iterate
do d=4  until newV3.d**2>k;  if k//newV3.d==0  then iterate k
end   /*ͺ*d*/
newV7= newV7 + 1;    newV4.k= newV7;       newV3.newV7= k     /*ͺ*found a prime, bump counter; assign @*/
end  /*ͺ*k*/;                return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
smooth: procedure expose newV3. newV4. newV5.; parse arg y,p /*ͺ*obtain the arguments from the invoker*/
if p==''  then p= 3                      /*ͺ*Not specified? Then assume Hamming #s*/
n= newV4.p                                   /*ͺ*the number of primes being used.     */
nn= n - 1;            newV5.=  0;    newV5.1= 1  /*ͺ*an array of n-smooth numbers (so far)*/
f.=  1                                   /*ͺ*the indices of factors of a number.  */
do j=2  for y-1;              newV8= f.1
z= newV3.1 * newV5.newV8
do k=2  for nn;  newV8= f.k;  v= newV3.k * newV5.newV8;    if v<z  then z= v
end   /*ͺ*k*/
newV5.j= z
do d=1  for n;   newV8= f.d;  if newV3.d * newV5.newV8==z  then f.d= f.d + 1
end   /*ͺ*d*/
end   /*ͺ*j*/;                  return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
th: parse arg th; return th || word('th st nd rd', 1+(th//10)*(th//100%10\==1)*(th//10<4))
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\N-smooth-numbers\n-smooth-numbers.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
