/*�*REXX program computes the  check digit (last digit) for six or seven character SEDOLs.*/
newV1    = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'          /*�*the uppercase Latin alphabet.        */
alphaDigs= '0123456789'newV1                     /*�*legal characters,  and then some.    */
allowable=space(translate(alphaDigs,,'AEIOU'),0) /*�*remove the vowels from the alphabet. */
weights  = 1317391                               /*�*various weights for SEDOL characters.*/
newV2.=                                              /*�* [↓]  the ARG statement capitalizes. */
arg newV2.1 .                                        /*�*allow a user─specified  SEDOL from CL*/
if newV2.1==''  then do                              /*�*if none, then assume eleven defaults.*/
newV2.1  =  710889                  /*�*if all numeric, we don't need quotes.*/
newV2.2  = 'B0YBKJ'
newV2.3  =  406566
newV2.4  = 'B0YBLH'
newV2.5  =  228276
newV2.6  = 'B0YBKL'
newV2.7  =  557910
newV2.8  = 'B0YBKR'
newV2.9  =  585284
newV2.10 = 'B0YBKT'
newV2.11 = 'B00030'
end

do j=1  while  newV2.j\=='';      sedol=newV2.j    /*�*process each of the specified SEDOLs.*/
L=length(sedol)
if L<6 | L>7        then call ser "SEDOL isn't a valid length"
if left(sedol,1)==9 then call swa 'SEDOL is reserved for end user allocation'
newV3=verify(sedol, allowable)
if newV3\==0            then call ser 'illegal character in SEDOL:'  substr(sedol, newV3, 1)
sum=0                                      /*�*the  checkDigit  sum  (so far).      */
do k=1  for 6                      /*�*process each character in the SEDOL. */
sum=sum + ( pos( substr(sedol, k, 1), alphaDigs) -1) * substr(weights, k, 1)
end   /*�*k*/

chkDig= (10-sum//10) // 10
r=right(sedol, 1)
if L==7 & chkDig\==r  then call ser sedol, 'invalid check digit:' r
say 'SEDOL:'   left(sedol,15)      'SEDOL + check digit ───► '   left(sedol,6)chkDig
end       /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sed:  say;  say 'SEDOL:'  sedol;          say;                          return
ser:  say;  say '***error***'   arg(1);   call sed;                     exit 13
swa:  say;  say '***warning***' arg(1);   say;                          return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\SEDOLs\sedols.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
