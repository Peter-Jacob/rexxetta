/*ͺ*REXX pgm computes the Padovan seq. (using 2 methods), and also computes the Lβstrings.*/
numeric digits 40                                /*ͺ*better precision for Plastic ratio.  */
parse arg n nF Ln cL .                           /*ͺ*obtain optional arguments from the CL*/
if  n=='' |  n==","  then  n= 20                 /*ͺ*Not specified?  Then use the default.*/
if nF=='' | nF==","  then nF= 64                 /*ͺ* "      "         "   "   "     "    */
if Ln=='' | Ln==","  then Ln= 10                 /*ͺ* "      "         "   "   "     "    */
if cL=='' | cL==","  then cL= 32                 /*ͺ* "      "         "   "   "     "    */
PR= 1.324717957244746025960908854                /*ͺ*the plastic ratio  (constant).       */
s= 1.0453567932525329623                        /*ͺ*tge  "s"  constant.                  */
newV1.= .;      newV1.0= 1;      newV1.1= 1;      newV1.2= 1 /*ͺ*initialize 3 terms of the Padovan seq*/
newV2.= .;      newV2.0= 1;      newV2.1= 1;      newV2.2= 1 /*ͺ*     "     "   "    "  "     "     " */
call req1;   call req2;   call req3;   call req4 /*ͺ*invoke the four task's requirements. */
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
floor: procedure; parse arg x;      t= trunc(x);               return t  -  (x<0) * (x\=t)
pF:    procedure expose newV2. PR s; parse arg x;  newV2.x= floor(PR**(x-1)/s + .5);    return newV2.x
th:    parse arg th; return th||word('th st nd rd',1+(th//10)*(th//100%10\==1)*(th//10<4))
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
LnewV3sys: procedure: arg x; q=; a.A= 'B'; a.B= 'C'; a.C= 'AB';      if x==''  then return 'A'
do k=1  for length(x);  newV3= substr(x, k, 1);  q= q  ||  a.newV3
end   /*ͺ*k*/;                           return q
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
p:     procedure expose newV1.; parse arg x;  if newV1.x\==.  then return newV1.x     /*ͺ*@.X defined?*/
xm2= x - 2;    xm3= x - 3;    newV1.x= newV1.xm2 + newV1.xm3;   return newV1.x
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
req1:                   say 'The first '    n    " terms of the Pandovan sequence:";
newV4= newV1.0;  do j=1  for n-1;   newV4= newV4  p(j)
end   /*ͺ*j*/
say newV4;                                                          return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
req2:  ok= 1;           what= ' terms match for  recurrence  and  floorβbased  functions.'
do j=0  for nF;  if p(j)==pF(j)  then iterate
say 'the '   th(j)   " terms don't match:"   p(j)  pF(j);   ok= 0
end   /*ͺ*j*/
say
if ok  then say 'all '    nF    what;                           return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
req3:                               y=;             newV4= 'A'
do j=1  for Ln-1;   y= LnewV3sys(y);    newV4= newV4  LnewV3sys(y)
end   /*ͺ*j*/
say
say 'L_sys:'  newV4;                                                return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
req4:  y=;              what=' terms match for Padovan terms and lengths of L_sys terms.'
ok= 1;   do j=1  for cL;  y= LnewV3sys(y);   L= length(y)
if       L==p(j-1)  then iterate
say 'the '    th(j)    " Padovan term doesn't match the length of the",
'L_sys term:'   p(j-1)  L;           ok= 0
end   /*ͺ*j*/
say
if ok  then say 'all '    cL    what;                           return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Padovan-sequence\padovan-sequence.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
