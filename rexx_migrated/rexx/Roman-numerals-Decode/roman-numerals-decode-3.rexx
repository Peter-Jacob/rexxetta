/*ͺ*REXX program  converts  Roman numeral number(s)  ββββΊ  Arabic numerals  (or numbers). */
numeric digits 1000                              /*ͺ*so we can handle the big numbers.    */
parse arg z                                      /*ͺ*obtain optional arguments from the CL*/
if z=''  then z= "MCMXC mmviii IIXX LU MDCLXVI MDWLXVI ((mmm)) [[[[[D]]]]]"  /*ͺ*defaults.*/

do j=1  for words(z);   y=word(z, j)        /*ͺ*process each of the Roman numbers.   */
say  right(y, 20)':'    rom2dec(y)          /*ͺ*display original and decimal version.*/
end   /*ͺ*j*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
rom2dec:  procedure;   h='0'x;   newV2=0;   newV3=1;   arg n .         /*ͺ*"ARG"  uppercases  N.  */
n=translate(n, '()()', "[]{}");  newV4=verify(n, 'MDCLXVUIJ()')    /*ͺ*trans grouping symbols.*/
if newV4\==0  then return '***error*** invalid Roman numeral:'  substr(n,newV4,1)   /*ͺ*tell error*/
newV1.=1; newV1.m=1000; newV1.d=500; newV1.c=100; newV1.l=50; newV1.x=10; newV1.u=5; newV1.v=5 /*ͺ*Roman numeral values.  */
/*ͺ* [β]  convert number.  */
do k=length(n)  to 1  by -1;  newV4=substr(n, k, 1)             /*ͺ*examine a Roman numeral*/
/*ͺ* [β]  scale up or down.*/
if newV4=='(' | newV4==")"  then  do;  newV3=newV3*1000; if newV4=='(' then newV3=1 /*ͺ* (β‘scale β;  )β‘scale β */
iterate                      /*ͺ*go & process next digit*/
end
newV4=newV1.newV4*newV3                                                     /*ͺ*scale it if necessary. */
if newV4>h  then h=newV4                                            /*ͺ*remember Roman numeral.*/
if newV4<h  then newV2=newV2-newV4                                          /*ͺ*char>next?  Then sub.  */
else newV2=newV2+newV4                                          /*ͺ*            else add.  */
end   /*ͺ*k*/
return newV2                                                       /*ͺ*return Arabic number.  */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Roman-numerals-Decode\roman-numerals-decode-3.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
