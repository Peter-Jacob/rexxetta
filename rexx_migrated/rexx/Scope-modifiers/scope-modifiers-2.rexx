a=1
b=2
c=3
Call p  /*ª* a Procedure  */
Say 'in m a b c x' a b c x
Call s  /*ª* a subroutine */
Say 'in m a b c x' a b c x

Exit
p: Procedure Expose sigl b
Say 'in p sigl a b c' sigl a b c
Call s
Return
s:
Say 'in s sigl a b c' sigl a b c
x=4
Return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Scope-modifiers\scope-modifiers-2.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
