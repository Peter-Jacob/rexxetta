/*ช*REXX program finds/displays the first perfect square with  N  unique digits in base N.*/
numeric digits 40                                /*ช*ensure enough decimal digits for a #.*/
parse arg LO HI .                                /*ช*obtain optional argument from the CL.*/
if LO==''            then do;  LO=2;  HI=16; end /*ช*not specified?  Then use the default.*/
if LO==','           then      LO=2              /*ช* "      "         "   "   "     "    */
if HI=='' | HI==","  then             HI=LO      /*ช* "      "         "   "   "     "    */
newV1= 1023456789abcdefghijklmnopqrstuvwxyz     /*ช*contains the start # (up to base 36).*/
call base                                        /*ช*initialize 2 arrays for BASE function*/
/*ช* [โ]  find the smallest square with  */
do j=LO  to HI;        beg= left(newV1, j)  /*ช*      N  unique digits in base  N.   */
do k=iSqrt( base(beg,10,j) )  until newV5==0  /*ช*start each search from smallest sqrt.*/
newV4= base(k*k, j, 10)                       /*ช*calculate square, convert to base J. */
newV5= verify(beg, newV4)                         /*ช*count differences between 2 numbers. */
end   /*ช*k*/
say 'base'            right(j, length(HI) )                   "   root="   ,
lower( right( base(k, j, 10), max(5, HI) ) )   '   square='    lower(newV4)
end      /*ช*j*/
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
base: procedure expose newV3. newV2.; arg x 1 newV5,toB,inB /*ช*obtain:  three arguments.            */
newV6= 0123456789abcdefghijklmnopqrstuvwxyz    /*ช*the characters for the Latin alphabet*/
if x==''  then do i=1  for length(newV6);   newV7= substr(newV6, i, 1);    m= i - 1;    newV3.newV7= m
newV2.m= substr(newV6, i, 1)
if i==length(newV6) then return /*ช*Done with shortcuts?  Then go back.  */
end   /*ช*i*/                 /*ช* [โ]  assign shortcut radix values.  */
if inb\==10  then                          /*ช*only convert if  not  base 10.       */
do 1;  newV5= 0                             /*ช*result of converted  X  (in base 10).*/
if inb==2   then do; newV5= b2d(x); leave; end  /*ช*convert   binary    to decimal.  */
if inb==16  then do; newV5= x2d(x); leave; end  /*ช*   "    hexadecimal  "    "      */
do j=1  for length(x)                 /*ช*convert  X:   base inB  โโโบ base 10. */
newV7= substr(x, j, 1);  newV5= newV5 * inB + newV3.newV7 /*ช*build a new number,  digit by digit. */
end    /*ช*j*/                          /*ช* [โ]  this also verifies digits.     */
end
y=                                         /*ช*the value of  X  in base  B (so far).*/
if tob==10  then return newV5                  /*ช*if TOB is ten,  then simply return #.*/
if tob==2   then return d2b(newV5)             /*ช*convert base 10 number to binary.    */
if tob==16  then return d2x(newV5)             /*ช*   "      "   "    "    " hexadecimal*/
do  while  newV5 >= toB                     /*ช*convert #:    base 10  โโโบ  base toB.*/
newV7= newV5 // toB;           y= newV2.newV7 || y     /*ช*construct the output number.         */
newV5= newV5 % toB                              /*ช*      ยทยทยท and whittle  #  down also. */
end    /*ช*while*/                        /*ช* [โ]  algorithm may leave a residual.*/
return newV2.newV5 || y                           /*ช*prepend the residual, if any.        */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
iSqrt: procedure; parse arg x;  r=0;  q=1;             do while q<=x;  q=q*4;  end
do while q>1; q=q%4; newV7=x-r-q; r=r%2; if newV7>=0 then do;x=newV7;r=r+q; end; end; return r
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
b2d:   return x2d( b2x( arg(1) ) )               /*ช*convert binary      number to decimal*/
d2b:   return x2b( d2x( arg(1) ) )  +  0         /*ช*   "    hexadecimal    "    "    "   */
lower: newV6abc= 'abcdefghijklmnopqrstuvwxyz'; return translate(arg(1), newV6abc, translate(newV6abc))
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\First-perfect-square-in-base-n-with-n-unique-digits\first-perfect-square-in-base-n-with-n-unique-digits-2.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
