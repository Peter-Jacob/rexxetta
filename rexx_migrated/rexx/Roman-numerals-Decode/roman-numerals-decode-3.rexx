/*�*REXX program  converts  Roman numeral number(s)  ───►  Arabic numerals  (or numbers). */
numeric digits 1000                              /*�*so we can handle the big numbers.    */
parse arg z                                      /*�*obtain optional arguments from the CL*/
if z=''  then z= "MCMXC mmviii IIXX LU MDCLXVI MDWLXVI ((mmm)) [[[[[D]]]]]"  /*�*defaults.*/

do j=1  for words(z);   y=word(z, j)        /*�*process each of the Roman numbers.   */
say  right(y, 20)':'    rom2dec(y)          /*�*display original and decimal version.*/
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
rom2dec:  procedure;   h='0'x;   newV2=0;   newV3=1;   arg n .         /*�*"ARG"  uppercases  N.  */
n=translate(n, '()()', "[]{}");  newV4=verify(n, 'MDCLXVUIJ()')    /*�*trans grouping symbols.*/
if newV4\==0  then return '***error*** invalid Roman numeral:'  substr(n,newV4,1)   /*�*tell error*/
newV1.=1; newV1.m=1000; newV1.d=500; newV1.c=100; newV1.l=50; newV1.x=10; newV1.u=5; newV1.v=5 /*�*Roman numeral values.  */
/*�* [↓]  convert number.  */
do k=length(n)  to 1  by -1;  newV4=substr(n, k, 1)             /*�*examine a Roman numeral*/
/*�* [↑]  scale up or down.*/
if newV4=='(' | newV4==")"  then  do;  newV3=newV3*1000; if newV4=='(' then newV3=1 /*�* (≡scale ↑;  )≡scale ↓ */
iterate                      /*�*go & process next digit*/
end
newV4=newV1.newV4*newV3                                                     /*�*scale it if necessary. */
if newV4>h  then h=newV4                                            /*�*remember Roman numeral.*/
if newV4<h  then newV2=newV2-newV4                                          /*�*char>next?  Then sub.  */
else newV2=newV2+newV4                                          /*�*            else add.  */
end   /*�*k*/
return newV2                                                       /*�*return Arabic number.  */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Roman-numerals-Decode\roman-numerals-decode-3.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
