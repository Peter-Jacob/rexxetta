/*�*REXX pgm determines  if  a string is a repString, it returns minimum length repString.*/
parse arg s                                      /*�*get optional strings from the C.L.   */
if s=''  then s=1001110011 1110111011 0010010010 1010101010 1111111111 0100101101 0100100 101 11 00 1 45
/*�* [↑]  S  not specified?  Use defaults*/
do k=1  for words(s);   newV3=word(s,k);   w=length(newV3)       /*�*process binary strings. */
say right(newV3,max(25,w))  repString(newV3)                     /*�*show repString & result.*/
end   /*�*k*/                                 /*�* [↑]  the  "result"  may be negatory.*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
repString: procedure;  parse arg x;              L=length(x);         newV1='  rep string='
if \datatype(x,'B')  then return "  ***error***  string isn't a binary string."
h=L%2
do j=1  for L-1  while  j<=h;        newV4=left(x,j);     newV2=copies(newV4,L)
if left(newV2,L)==x  then  return newV1    left(newV4,15)     "[length"     j']'
end   /*�*j*/                    /*�* [↑]  we have found a good repString.*/
return               '      (no repetitions)'    /*�*failure to find repString.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Rep-string\rep-string-2.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
