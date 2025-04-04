/*ช*REXX pgm lists a bunch of esthetic numbers in bases 2 โโโบ 16, & base 10 in two ranges.*/
parse arg baseL baseH range                      /*ช*obtain optional arguments from the CL*/
if baseL=='' | baseL==","  then baseL= 2         /*ช*Not specified?  Then use the default.*/
if baseH=='' | baseH==","  then baseH=16         /*ช* "      "         "   "   "     "    */
if range=='' | range==","  then range=1000..9999 /*ช* "      "         "   "   "     "    */

do radix=baseL  to baseH;  newV4= 0;  if radix<2  then iterate    /*ช*process the bases. */
start= radix * 4;                  stop = radix * 6
newV5=;               do i=1  until newV4==stop;  y= base(i, radix)   /*ช*convert I to base Y*/
if \esthetic(y, radix)  then iterate        /*ช*not esthetic?  Skip*/
newV4= newV4 + 1;   if newV4<start  then iterate        /*ช*is  #  below range?*/
newV5= newV5 y                                      /*ช*append # to $ list.*/
end   /*ช*i*/
say
say center(' base '  radix",  the" th(start)   'โโโบ'   th(stop) ,
"esthetic numbers ",  max(80, length(newV5) - 1),  'โ')
say strip(newV5)
end   /*ช*radix*/
say;                                                                            g= 25
parse var  range   start  '..'  stop
say center(' base 10 esthetic numbers between' start "and" stop '(inclusive) ', g*5-1,"โ")
newV4= 0;        newV5=
do k=start  to  stop;  if \esthetic(k, 10)  then iterate;   newV4= newV4 + 1;    newV5= newV5 k
if newV4//g==0  then do;   say strip(newV5);  newV5=;   end
end   /*ช*k*/
say strip(newV5);               say;                 say newV4   ' esthetic numbers listed.'
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
PorA:  newV6= pos(z, newV2);   p= substr(newV2, newV6-1, 1);   a= substr(newV2, newV6+1, 1);     return
th: parse arg th; return th || word('th st nd rd', 1+(th//10)*(th//100%10\==1)*(th//10<4))
vv: parse arg v,newV6;   vr= x2d(v) + newV6;   if vr==-1  then vr= r;               return d2x(vr)
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
base: procedure expose newV2;  arg x 1 newV4,toB,inB,,y /*ช*Y  is assigned a  "null"  value.     */
if tob==''  then tob= 10                   /*ช*maybe assign a default for TObase.   */
if inb==''  then inb= 10                   /*ช*  "      "   "    "     "  INbase.   */
newV1= '0123456789abcdef';  newV2= newV1;  upper newV2 /*ช*two versions of hexadecimal digits.  */
if inB\==10  then do;   newV4= 0               /*ช*only convert if  not  base 10.       */
do j=1  for length(x) /*ช*convert  X:   base inB  โโโบ base 10. */
newV4= newV4 * inB + pos(substr(x, j, 1), newV2) -1  /*ช*build new number.*/
end    /*ช*j*/          /*ช* [โ]  this also verifies digits.     */
end
if toB==10   then return newV4                 /*ช*if TOB is ten,  then simply return #.*/
do  while  newV4 >= toB                     /*ช*convert #:    base 10  โโโบ  base toB.*/
y= substr(newV1, (newV4 // toB) + 1, 1)y       /*ช*construct the output number.         */
newV4= newV4 % toB                              /*ช*      ยทยทยท and whittle  #  down also. */
end    /*ช*while*/                        /*ช* [โ]  algorithm may leave a residual.*/
return substr(newV1, newV4 + 1, 1)y               /*ช*prepend the residual, if any.        */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
esthetic: procedure expose newV2; arg x,r;       L= length(x);       if L==1  then return 1
if x<2  then return 0
do d=0  to r-1;  newV6= d2x(d);        if pos(newV6 || newV6, x)\==0  then return 0
end   /*ช*d*/                     /*ช* [โ]  check for a duplicated digits. */
do j=1  for L;  newV3.j= substr(x, j, 1) /*ช*assign (base) digits to stemmed array*/
end   /*ช*j*/
if L==2  then do;  z= newV3.1;   call PorA;      if newV3.2==p | newV3.2==a  then nop
else return 0
end
do e=2  to L-1;  z= newV3.e;   pe= e - 1;      ae= e + 1
if (z==vv(newV3.pe,-1)|z==vv(newV3.pe,1))&(z==vv(newV3.ae,-1)|z==vv(newV3.ae,1))  then iterate
return 0
end   /*ช*e*/;         return 1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Esthetic-numbers\esthetic-numbers.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
