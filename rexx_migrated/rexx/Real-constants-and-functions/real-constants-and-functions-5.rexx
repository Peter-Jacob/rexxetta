/*ͺ*ββββββββββββββββββββββββββββββββββSQRT subroutineβββββββββββββββββββββββββββ*/
sqrt: procedure;  parse arg x;         if x=0  then return 0  /*ͺ*handle 0 case.*/
if \datatype(x,'N')  then return '[n/a]'   /*ͺ*Not Applicable βββif not numeric.*/
i=;  if x<0  then do; x=-x; i='i'; end /*ͺ*handle complex numbers if  X  is < 0.*/
d=digits()                             /*ͺ*get the current numeric precision.   */
m.=9                                   /*ͺ*technique uses just enough digits.   */
h=d+6                                  /*ͺ*use extra decimal digits for accuracy*/
numeric digits 9                       /*ͺ*use "small" precision at first.      */
numeric form                           /*ͺ*force scientific form of the number. */
if fuzz()\==0  then numeric fuzz 0     /*ͺ*just in case invoker has a FUZZ  set.*/
parse value format(x,2,1,,0)  'E0'  with  g 'E' newV1 .  /*ͺ*get the  X's  exponent.*/
g=(g * .5) || 'e' || (newV1 % 2)      /*ͺ*1st guesstimate for the square root. */
/*ͺ* g= g * .5     'e'    (_ % 2) */   /*ͺ*a shorter & concise version of above.*/
/*ͺ*Note: to insure enough accuracy for  */
/*ͺ*  the result, the precision during   */
/*ͺ*  the SQRT calculations is increased */
/*ͺ*  by two extra decimal digits.       */
do j=0  while  h>9;  m.j=h;  h=h%2+1 /*ͺ*compute the sizes (digs) of precision*/
end   /*ͺ*j*/                          /*ͺ* [β]  precisions are stored in  M.   */
/*ͺ*now, we start to do the heavy lifting*/
do k=j+5  to 0  by -1                /*ͺ*compute the  β  with increasing digs.*/
numeric digits m.k                   /*ͺ*each iteration, increase the digits. */
g=(g+x/g) * .5                       /*ͺ*perform the nitty-gritty calculations*/
end   /*ͺ*k*/                          /*ͺ* [β]  * .5   is faster than   / 2    */
/*ͺ* [β]  normalize β βββΊ original digits*/
numeric digits d                       /*ͺ* [β]  make answer complex if  X < 0. */
return (g/1)i                          /*ͺ*normalize, and add possible I suffix.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Real-constants-and-functions\real-constants-and-functions-5.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
