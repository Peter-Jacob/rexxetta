/*�*REXX pgm computes the Padovan seq. (using 2 methods), and also computes the L─strings.*/
numeric digits 40                                /*�*better precision for Plastic ratio.  */
parse arg n nF Ln cL .                           /*�*obtain optional arguments from the CL*/
if  n=='' |  n==","  then  n= 20                 /*�*Not specified?  Then use the default.*/
if nF=='' | nF==","  then nF= 64                 /*�* "      "         "   "   "     "    */
if Ln=='' | Ln==","  then Ln= 10                 /*�* "      "         "   "   "     "    */
if cL=='' | cL==","  then cL= 32                 /*�* "      "         "   "   "     "    */
PR= 1.324717957244746025960908854                /*�*the plastic ratio  (constant).       */
s= 1.0453567932525329623                        /*�*tge  "s"  constant.                  */
newV1.= .;      newV1.0= 1;      newV1.1= 1;      newV1.2= 1 /*�*initialize 3 terms of the Padovan seq*/
newV2.= .;      newV2.0= 1;      newV2.1= 1;      newV2.2= 1 /*�*     "     "   "    "  "     "     " */
call req1;   call req2;   call req3;   call req4 /*�*invoke the four task's requirements. */
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
floor: procedure; parse arg x;      t= trunc(x);               return t  -  (x<0) * (x\=t)
pF:    procedure expose newV2. PR s; parse arg x;  newV2.x= floor(PR**(x-1)/s + .5);    return newV2.x
th:    parse arg th; return th||word('th st nd rd',1+(th//10)*(th//100%10\==1)*(th//10<4))
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
LnewV3sys: procedure: arg x; q=; a.A= 'B'; a.B= 'C'; a.C= 'AB';      if x==''  then return 'A'
do k=1  for length(x);  newV3= substr(x, k, 1);  q= q  ||  a.newV3
end   /*�*k*/;                           return q
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
p:     procedure expose newV1.; parse arg x;  if newV1.x\==.  then return newV1.x     /*�*@.X defined?*/
xm2= x - 2;    xm3= x - 3;    newV1.x= newV1.xm2 + newV1.xm3;   return newV1.x
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
req1:                   say 'The first '    n    " terms of the Pandovan sequence:";
newV4= newV1.0;  do j=1  for n-1;   newV4= newV4  p(j)
end   /*�*j*/
say newV4;                                                          return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
req2:  ok= 1;           what= ' terms match for  recurrence  and  floor─based  functions.'
do j=0  for nF;  if p(j)==pF(j)  then iterate
say 'the '   th(j)   " terms don't match:"   p(j)  pF(j);   ok= 0
end   /*�*j*/
say
if ok  then say 'all '    nF    what;                           return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
req3:                               y=;             newV4= 'A'
do j=1  for Ln-1;   y= LnewV3sys(y);    newV4= newV4  LnewV3sys(y)
end   /*�*j*/
say
say 'L_sys:'  newV4;                                                return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
req4:  y=;              what=' terms match for Padovan terms and lengths of L_sys terms.'
ok= 1;   do j=1  for cL;  y= LnewV3sys(y);   L= length(y)
if       L==p(j-1)  then iterate
say 'the '    th(j)    " Padovan term doesn't match the length of the",
'L_sys term:'   p(j-1)  L;           ok= 0
end   /*�*j*/
say
if ok  then say 'all '    cL    what;                           return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Padovan-sequence\padovan-sequence.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
