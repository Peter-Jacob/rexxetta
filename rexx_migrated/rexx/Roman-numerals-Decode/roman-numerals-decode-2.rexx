/*�*REXX program  converts  Roman numeral number(s)  ───►  Arabic numerals  (or numbers). */
rYear = 'MCMXC'    ;      say right(rYear, 9)":"     rom2dec(rYear)
rYear = 'mmviii'   ;      say right(rYear, 9)":"     rom2dec(rYear)
rYear = 'MDCLXVI'  ;      say right(rYear, 9)":"     rom2dec(rYear)
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
rom2dec: procedure;  arg roman .                 /*�*obtain the Roman numeral number.     */
if verify(roman, 'MDCLXVI')\==0  then return  "***error***  invalid Roman number:"   roman
newV1=rChar(right(roman, 1))                         /*�*start with the last Roman numeral.   */
do j=1  for length(roman) - 1
x=rChar( substr(roman, j  , 1) )     /*�*extract the  current  Roman numeral. */
y=rChar( substr(roman, j+1, 1) )     /*�*extract the     next  Roman numeral. */
if x<y  then newV1 = newV1-x                 /*�*Is   x<y ?         Then subtract it. */
else newV1 = newV1+x                 /*�*Is   x≥y ?           "    add     "  */
end   /*�*j*/
return newV1
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
rChar: procedure;  arg _                         /*�*convert Roman number to Arabic digits*/
if _=='I'  then return    1
if _=='V'  then return    5
if _=='X'  then return   10
if _=='L'  then return   50
if _=='C'  then return  100
if _=='D'  then return  500
if _=='M'  then return 1000
return    0               /*�*indicate an  invalid  Roman numeral. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Roman-numerals-Decode\roman-numerals-decode-2.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
