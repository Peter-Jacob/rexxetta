/*ª*REXX program computes the dot product of two equal size vectors (of any size).*/
vectorA =  '  1   3  -5  '               /*ª*populate vector  A  with some numbers*/
vectorB =  '  4  -2  -1  '               /*ª*    "       "    B    "    "     "   */
Say  'vector A =' vectorA                /*ª*display the elements of vector A.    */
Say  'vector B =' vectorB                /*ª*   "     "     "      "   "    B.    */
p=dot_product(vectorA,vectorB)           /*ª*invoke function & compute dot product*/
Say                                      /*ª*display a blank line for readability.*/
Say 'dot product =' p                    /*ª*display the dot product              */
Exit                                     /*ª*stick a fork in it,  we're all done. */
/*ª*------------------------------------------------------------------------------*/
dot_product:                             /*ª* compute the dot product             */
Parse Arg A,B
/*ª* Begin Error Checking                                                       */
If words(A)<>words(B) Then
Call exit 'Vectors aren''t the same size:' words(A) '<>' words(B)
Do i=1 To words(A)
If datatype(word(A,i))<>'NUM' Then
Call exit 'Element' i 'of vector A isn''t a number:' word(A,i)
If datatype(word(B,i))<>'NUM' Then
Call exit 'Element' i 'of vector B isn''t a number:' word(B,i)
End
/*ª* End Error Checking                                                         */
product=0                              /*ª* initialize the  sum  to   0  (zero).*/
Do i=1 To words(A)
product=product+word(A,i)*word(B,i)  /*ª*multiply corresponding numbers       */
End
Return product
exit:
Say '***error***' arg(1)
Exit 13
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Dot-product\dot-product.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
