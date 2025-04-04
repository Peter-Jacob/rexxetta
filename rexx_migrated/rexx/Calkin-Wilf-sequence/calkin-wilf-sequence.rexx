/*ͺ*REXX pgm finds the Nth value of the  CalkinβWilf  sequence (which will be a fraction),*/
/*ͺ*ββββββββββββββββββββββ or finds which sequence number contains a specified fraction). */
numeric digits 2000                              /*ͺ*be able to handle ginormic integers. */
parse arg LO HI te .                             /*ͺ*obtain optional arguments from the CL*/
if LO=='' | LO==","   then LO=  1                /*ͺ*Not specified?  Then use the default.*/
if HI=='' | HI==","   then HI= 20                /*ͺ* "      "         "   "   "     "    */
if te=='' | te==","   then te= '/'               /*ͺ* "      "         "   "   "     "    */
if datatype(LO, 'W')  then call CW_terms         /*ͺ*Is LO numeric?  Then show some terms.*/
if pos('/', te)>0     then call CW_frac  te      /*ͺ*Does TE have a / ?   Then find term #*/
exit 0
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas: parse arg newV3;  do jc=length(newV3)-3  to 1  by -3; newV3=insert(',', newV3, jc); end;  return newV3
th:     parse arg th; return word('th st nd rd', 1+(th//10) *(th//100%10\==1) *(th//10<4))
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
CW_frac:   procedure; parse arg p '/' q .;       say
if q==''  then do;  p= 83116;         q= 51639;  end
n= rle2dec( frac2cf(p q) );                    newV1= 'the CalkinβWilf sequence'
say 'for '  p"/"q',  the element number for'   newV1    "is: "    commas(n)th(n)
if length(n)<10  then return
say;  say 'The above number has '     commas(length(n))      " decimal digits."
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
CW_term:   procedure;  parse arg z;                 dd= 1;               nn= 0
do z
parse value  dd  dd*(2*(nn%dd)+1)-nn   with  nn  dd
end   /*ͺ*z*/
return nn'/'dd
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
CW_terms:  newV4=;        if LO\==0  then  do j=LO  to HI;   newV4= newV4  CW_term(j)','
end   /*ͺ*j*/
if newV4==''  then return
say 'CalkinβWilf sequence terms for '  commas(LO)  " βββΊ "  commas(HI)  ' are:'
say strip( strip(newV4), 'T', ",")
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
frac2cf:   procedure;  parse arg p q;  if q==''  then return p;          cf= p % q;   m= q
p= p - cf*q;                n= p;        if p==0  then return cf
do k=1  until n==0;        newV2.k= m % n
m= m  -  newV2.k * n;    parse value  n m   with   m n   /*ͺ*swap N M*/
end   /*ͺ*k*/
/*ͺ*for inverse CalkinβWilf, K must be even.*/
if k//2  then do;  newV2.k= newV2.k - 1;   k= k + 1;    newV2.k= 1;   end
do k=1  for k;       cf= cf newV2.k;            end  /*ͺ*k*/
return cf
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
rle2dec:   procedure;  parse arg f1 rle;                       obin= copies(1, f1)
do until rle=='';               parse var rle f0 f1 rle
obin= copies(1, f1)copies(0, f0)obin
end   /*ͺ*until*/
return x2d( b2x(obin) )            /*ͺ*RLE2DEC: Run Length Encoding βββΊ decimal*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Calkin-Wilf-sequence\calkin-wilf-sequence.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
