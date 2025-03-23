/*ª* REXX ***************************************************************
* show identity matrix of size n
* I consider m.i.j to represent the matrix (not needed for showing)
* 06.07.2012 Walter Pachl
**********************************************************************/
Parse Arg n
Say 'Identity Matrix of size' n '(m.i.j IS the Matrix)'
m.=0
Do i=1 To n
ol=''
Do j=1 To n
m.i.j=(i=j)
ol=ol''format(m.i.j,2) /*ª* or ol=ol (i=j)                         */
End
Say ol
End
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Identity-matrix\identity-matrix-2.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
