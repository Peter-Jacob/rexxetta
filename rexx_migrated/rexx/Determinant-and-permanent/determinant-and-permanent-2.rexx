/*ª* REXX ***************************************************************
* determinant.rex
* compute the determinant of the given square matrix
* Input: as: the representation of the matrix as vector (n**2 elements)
* 21.05.2013 Walter Pachl
**********************************************************************/
Parse Arg as
n=sqrt(words(as))
Do i=1 To n
Do j=1 To n
Parse Var as a.i.j as
End
End
Select
When n=2 Then det=a.1.1*a.2.2-a.1.2*a.2.1
When n=3 Then det= a.1.1*a.2.2*a.3.3,
+a.1.2*a.2.3*a.3.1,
+a.1.3*a.2.1*a.3.2,
-a.1.3*a.2.2*a.3.1,
-a.1.2*a.2.1*a.3.3,
-a.1.1*a.2.3*a.3.2
Otherwise Do
det=0
Do k=1 To n
det=det+((-1)**(k+1))*a.1.k*determinant(subm(k))
End
End
End
Return det

subm: Procedure Expose a. n
/*ª**********************************************************************
* compute the submatrix resulting when row 1 and column k are removed
* Input: a.*.*, k
* Output: bs the representation of the submatrix as vector
**********************************************************************/
Parse Arg k
bs=''
do i=2 To n
Do j=1 To n
If j=k Then Iterate
bs=bs a.i.j
End
End
Return bs

sqrt: Procedure
/*ª**********************************************************************
* compute and return the (integer) square root of the given argument
* terminate the program if the argument is not a square
**********************************************************************/
Parse Arg nn
Do n=1 By 1 while n*n<nn
End
If n*n=nn Then
Return n
Else Do
Say 'invalid number of elements:' nn 'is not a square.'
Exit
End
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Determinant-and-permanent\determinant-and-permanent-2.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
