/*�*REXX program generates the    Hofstadter  Q     sequence for any specified   N.       */
parse arg a b c d .                              /*�*obtain optional arguments from the CL*/
if a=='' | a==","  then a=       10              /*�*Not specified?  Then use the default.*/
if b=='' | b==","  then b=    -1000              /*�* "      "         "   "   "      "   */
if c=='' | c==","  then c=  -100000              /*�* "      "         "   "   "      "   */
if d=='' | d==","  then d= -1000000              /*�* "      "         "   "   "      "   */
newV1.= 0;     newV1.1= 1;    newV1.2= 1;       ac= abs(c)   /*�* [↑]  negative #'s don't show values.*/
call HofstadterQ  a;   say
call HofstadterQ  b;   say 'HofstadterQ '  commas(abs(b))th(b) " term is: " commas(result)
call HofstadterQ  c;   say
downs= 0;                         do j=2  for ac-1;     jm= j - 1
downs= downs + (newV1.j<newV1.jm)
end   /*�*j*/

say commas(downs)    ' HofstatdterQ terms are less then the previous term,' ,
' HofstatdterQ('commas(ac)  ||  th(ac)")  term is: "     commas(newV1.ac)
call HofstadterQ  d;                                             ad= abs(d);           say
say 'The '   commas(ad) || th(ad)    ' HofstatdterQ term is: '       commas(newV1.ad)
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
HofstadterQ: procedure expose newV1.; parse arg x 1 ox     /*�*get number to generate through.*/
/*�* [↑]   OX    is the same as X. */
x= abs(x);                    w= length( commas(x) )   /*�*use absolute value; get length.*/
do j=1  for x
if newV1.j==0 then newV1.j= QR(j)                   /*�*Not defined?    Then define it.*/
if ox>0  then say 'HofstadterQ('right(j, w)"): "  right(newV1.j,max(w,length(newV1.j)))
end    /*�*j*/
return newV1.x                                             /*�*return the │X│th term to caller*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
QR: procedure expose newV1.;   parse arg n                 /*�*this  QR function is recursive.*/
if newV1.n==0  then newV1.n= QR(n-QR(n-1)) + QR(n-QR(n-2)) /*�*Not defined?    Then define it.*/
return newV1.n                                         /*�*return the value to the invoker*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
th: procedure; newV2=abs(arg(1)); return word('th st nd rd',1+newV2//10*(newV2//100%10\==1)*(newV2//10<4))
commas:  parse arg newV3;  do newV4=length(newV3)-3  to 1  by -3; newV3=insert(',', newV3, newV4); end;   return newV3
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Hofstadter-Q-sequence\hofstadter-q-sequence-3.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
