/*ª*REXX program selects all even numbers from an array and puts them   */
/*ª* into a new array.                                                  */
Parse Arg n seed .                /*ª* obtain optional arguments from CL*/
If n==''|n=="," Then n=50         /*ª* Not specified?  use the default  */
If datatype(seed,'W') Then
Call random,,seed               /*ª* use RANDOM seed for repeatability*/
Do i=1 For n                      /*ª* generate  N  random numbers      */
old.i=random(1,99999)           /*ª* generate random number           */
End
m=0                               /*ª* number of elements in NEW        */
Do j=1 To n                       /*ª* process the elements of the OLD  */
If old.j//2==0 Then Do          /*ª* if element is even, then         */
m=m+1                         /*ª* bump the number of NEW elemens   */
new.m=old.j                   /*ª* assign the number to the NEW     */
End
End
Do k=1 For m                      /*ª* display all the NEW numbers.     */
Say right('new.'k,20) '=' right(new.k,9)
End
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Filter\filter-1.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
