/*ª* REXX ***************************************************************
* Translation from Raku->NetRexx->REXX
* 15.05.2013 Walter Pachl
**********************************************************************/
Numeric Digits 100
call time 'R'
n=1
Do i=1 To 30
Say right(n,30) sum35(n)
n=n*10
End
Say time('E') 'seconds'
Exit

sum35: Procedure
Parse Arg maxLimit
return sum_mults(3, maxLimit) + sum_mults(5, maxLimit) - sum_mults(15, maxLimit)

sum_mults: Procedure
Parse Arg first, limit
last = limit - 1
last = last - last // first
sum = (last % first) * (first + last) % 2
return sum
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sum-multiples-of-3-and-5\sum-multiples-of-3-and-5-2.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
