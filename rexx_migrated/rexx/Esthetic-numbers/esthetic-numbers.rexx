/*�*REXX pgm lists a bunch of esthetic numbers in bases 2 ──► 16, & base 10 in two ranges.*/
parse arg baseL baseH range                      /*�*obtain optional arguments from the CL*/
if baseL=='' | baseL==","  then baseL= 2         /*�*Not specified?  Then use the default.*/
if baseH=='' | baseH==","  then baseH=16         /*�* "      "         "   "   "     "    */
if range=='' | range==","  then range=1000..9999 /*�* "      "         "   "   "     "    */

do radix=baseL  to baseH;  newV4= 0;  if radix<2  then iterate    /*�*process the bases. */
start= radix * 4;                  stop = radix * 6
newV5=;               do i=1  until newV4==stop;  y= base(i, radix)   /*�*convert I to base Y*/
if \esthetic(y, radix)  then iterate        /*�*not esthetic?  Skip*/
newV4= newV4 + 1;   if newV4<start  then iterate        /*�*is  #  below range?*/
newV5= newV5 y                                      /*�*append # to $ list.*/
end   /*�*i*/
say
say center(' base '  radix",  the" th(start)   '──►'   th(stop) ,
"esthetic numbers ",  max(80, length(newV5) - 1),  '─')
say strip(newV5)
end   /*�*radix*/
say;                                                                            g= 25
parse var  range   start  '..'  stop
say center(' base 10 esthetic numbers between' start "and" stop '(inclusive) ', g*5-1,"─")
newV4= 0;        newV5=
do k=start  to  stop;  if \esthetic(k, 10)  then iterate;   newV4= newV4 + 1;    newV5= newV5 k
if newV4//g==0  then do;   say strip(newV5);  newV5=;   end
end   /*�*k*/
say strip(newV5);               say;                 say newV4   ' esthetic numbers listed.'
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
PorA:  newV6= pos(z, newV2);   p= substr(newV2, newV6-1, 1);   a= substr(newV2, newV6+1, 1);     return
th: parse arg th; return th || word('th st nd rd', 1+(th//10)*(th//100%10\==1)*(th//10<4))
vv: parse arg v,newV6;   vr= x2d(v) + newV6;   if vr==-1  then vr= r;               return d2x(vr)
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
base: procedure expose newV2;  arg x 1 newV4,toB,inB,,y /*�*Y  is assigned a  "null"  value.     */
if tob==''  then tob= 10                   /*�*maybe assign a default for TObase.   */
if inb==''  then inb= 10                   /*�*  "      "   "    "     "  INbase.   */
newV1= '0123456789abcdef';  newV2= newV1;  upper newV2 /*�*two versions of hexadecimal digits.  */
if inB\==10  then do;   newV4= 0               /*�*only convert if  not  base 10.       */
do j=1  for length(x) /*�*convert  X:   base inB  ──► base 10. */
newV4= newV4 * inB + pos(substr(x, j, 1), newV2) -1  /*�*build new number.*/
end    /*�*j*/          /*�* [↑]  this also verifies digits.     */
end
if toB==10   then return newV4                 /*�*if TOB is ten,  then simply return #.*/
do  while  newV4 >= toB                     /*�*convert #:    base 10  ──►  base toB.*/
y= substr(newV1, (newV4 // toB) + 1, 1)y       /*�*construct the output number.         */
newV4= newV4 % toB                              /*�*      ··· and whittle  #  down also. */
end    /*�*while*/                        /*�* [↑]  algorithm may leave a residual.*/
return substr(newV1, newV4 + 1, 1)y               /*�*prepend the residual, if any.        */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
esthetic: procedure expose newV2; arg x,r;       L= length(x);       if L==1  then return 1
if x<2  then return 0
do d=0  to r-1;  newV6= d2x(d);        if pos(newV6 || newV6, x)\==0  then return 0
end   /*�*d*/                     /*�* [↑]  check for a duplicated digits. */
do j=1  for L;  newV3.j= substr(x, j, 1) /*�*assign (base) digits to stemmed array*/
end   /*�*j*/
if L==2  then do;  z= newV3.1;   call PorA;      if newV3.2==p | newV3.2==a  then nop
else return 0
end
do e=2  to L-1;  z= newV3.e;   pe= e - 1;      ae= e + 1
if (z==vv(newV3.pe,-1)|z==vv(newV3.pe,1))&(z==vv(newV3.ae,-1)|z==vv(newV3.ae,1))  then iterate
return 0
end   /*�*e*/;         return 1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Esthetic-numbers\esthetic-numbers.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
