/*ͺ*REXX program generates the    Hofstadter  Q     sequence for any specified   N.       */
parse arg a b c d .                              /*ͺ*obtain optional arguments from the CL*/
if a=='' | a==","  then a=       10              /*ͺ*Not specified?  Then use the default.*/
if b=='' | b==","  then b=    -1000              /*ͺ* "      "         "   "   "      "   */
if c=='' | c==","  then c=  -100000              /*ͺ* "      "         "   "   "      "   */
if d=='' | d==","  then d= -1000000              /*ͺ* "      "         "   "   "      "   */
newV1.= 1;                 ac=   abs(c)              /*ͺ* [β]  negative #'s don't show values.*/
call HofstadterQ  a;   say
call HofstadterQ  b;   say 'HofstadterQ '  commas(abs(b))th(b) " term is: " commas(result)
call HofstadterQ  c;   say
downs= 0;                         do j=2  for ac-1;     jm= j - 1
downs= downs + (newV1.j<newV1.jm)
end   /*ͺ*j*/

say commas(downs)    ' HofstatdterQ terms are less then the previous term,' ,
' HofstatdterQ('commas(ac)  ||  th(ac)")  term is: "     commas(newV1.ac)
call HofstadterQ  d;                                             ad= abs(d);           say
say 'The '   commas(ad) || th(ad)    ' HofstatdterQ term is: '       commas(newV1.ad)
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
HofstadterQ: procedure expose newV1.; parse arg x 1 ox     /*ͺ*get number to generate through.*/
/*ͺ* [β]   OX    is the same as X. */
x= abs(x);                    w= length( commas(x) )   /*ͺ*use absolute value; get length.*/
do j=1  for x                               /*ͺ* [β]  use shortβcircuit IF test*/
if j>2   then if newV1.j==1  then  do;    jm1= j - 1;             jm2= j - 2
one= j - newV1.jm1;         two= j - newV1.jm2
newV1.j= newV1.one  +  newV1.two
end
if ox>0  then say 'HofstadterQ('right(j, w)"): "  right(newV1.j,max(w,length(newV1.j)))
end    /*ͺ*j*/
return newV1.x                                             /*ͺ*return the βXβth term to caller*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas:  parse arg newV2;  do newV3=length(newV2)-3  to 1  by -3; newV2=insert(',', newV2, newV3); end;   return newV2
th: procedure; newV4=abs(arg(1)); return word('th st nd rd',1+newV4//10*(newV4//100%10\==1)*(newV4//10<4))
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Hofstadter-Q-sequence\hofstadter-q-sequence-1.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
