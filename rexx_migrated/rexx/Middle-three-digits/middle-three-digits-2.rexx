/*�*REXX program returns the  three middle digits  of a decimal number  (or an error msg).*/
n= '123    12345   1234567    987654321   10001    -10001    -123   -100    100   -12345',
'+123   0123    2     -1    -10    2002     -2002   0   abc   1e3   -17e-3   1234567.',
1237654.00     1234567890123456789012345678901234567890123456789012345678901234567

do j=1  for words(n);   newV1=word(n,j)       /*�* [↓]  format number for pretty output*/
say 'middle 3 digits of'    right(newV1, max(15, length(newV1) ) )     "──►"     middle3(newV1)
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
middle3: procedure;  parse arg x;      numeric digits 1e6;           er='    ***error*** '
if  datatype(x,'N')  then x=abs(x)/1;  L=length(x)  /*�*use abs value; get length*/
if \datatype(x,'W')  then return  er  "argument isn't an integer."
if L<3               then return  er  "argument is less than three digits."
if L//2==0           then return  er  "argument isn't an odd number of digits."
return  substr(x, (L-3)%2+1, 3)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Middle-three-digits\middle-three-digits-2.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
