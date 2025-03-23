/*ª*REXX program uses a control array to tell which elements ars even.  */
Parse Arg n seed .                /*ª* obtain optional arguments from CL*/
If n==''|n=="," Then n=50         /*ª* Not specified?  use the default  */
If datatype(seed,'W') Then
Call random,,seed               /*ª* use RANDOM seed for repeatability*/
Do i=1 For n                      /*ª* generate n random numbers        */
x.i=random(1,99999)             /*ª* generate random number           */
End
even.=0                           /*ª* all even bits are off            */
Do j=1 To n                       /*ª* process the elements of x.*      */
If x.j//2==0 Then               /*ª* if element is even, then         */
even.j=1                      /*ª* turn on the even bit             */
End
Do k=1 To n                       /*ª* display all the numbers          */
If even.k Then                  /*ª* that are even                    */
Say right('x.'k,20) '=' right(x.k,9)
End
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Filter\filter-2.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
