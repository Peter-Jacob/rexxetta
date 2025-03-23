/*ª*REXX program calculates the Kronecker product of two matrices.      */
w=0                              /*ª* W: max width of any matrix element*/
amat=2x2 1 2 3 4                 /*ª* define A matrix size and elements */
bmat=2x2 0 5 6 7                 /*ª* "      B    "     "   "     "     */
Call makeMat 'A',amat            /*ª* construct A matrix from elements  */
Call makeMat 'B',bmat            /*ª* "         B    "     "     "      */
Call KronMat 'Kronecker product' /*ª* calculate the Kronecker  product  */
Call showMat what,arows*brows||'X'||arows*bcols
Say ''
Say copies('|',55)
Say ''
w=0                              /*ª* W: max width of any matrix element*/
amat=3x3 0 1 0 1 1 1 0 1 0       /*ª* define A matrix size and elements */
bmat=3x4 1 1 1 1 1 0 0 1 1 1 1 1 /*ª* "      B    "     "   "     "     */
Call makeMat 'A',amat            /*ª* construct A matrix from elements  */
Call makeMat 'B',bmat            /*ª* "         B    "     "     "      */
Call KronMat 'Kronecker product' /*ª* calculate the Kronecker  product  */
Call showMat what,arows*brows||'X'||arows*bcols
Exit                             /*ª* stick a fork in it, we're all done*/
/*ª*--------------------------------------------------------------------*/
makemat:
Parse Arg what,size elements   /*ª*elements: e.1.1 e.1.2 - e.rows cols*/
Parse Var size rows 'X' cols
x.what.shape=rows cols
n=0
Do r=1 To rows
Do c=1 To cols
n=n+1
element=word(elements,n)
w=max(w,length(element))
x.what.r.c=element
End
End
Call showMat what,size
Return
/*ª*--------------------------------------------------------------------*/
kronmat:                         /*ª* compute the Kronecker Product     */
Parse Arg what
Parse Var x.a.shape arows acols
Parse Var x.b.shape brows bcols
rp=0                           /*ª* row of product                    */
Do ra=1 To arows
Do rb=1 To brows
rp=rp+1                    /*ª* row of product                    */
cp=0                       /*ª* column of product                 */
Do ca=1 To acols
x=x.a.ra.ca
Do cb=1 To bcols
y=x.b.rb.cb
cp=cp+1                /*ª* column of product                 */
xy=x*y
x.what.rp.cp=xy        /*ª* element of product                */
w=max(w,length(xy))
End /*ª* cB */
End /*ª* cA */
End /*ª* rB */
End /*ª* rA */
Return
/*ª*--------------------------------------------------------------------*/
showmat:
Parse Arg what,size .
Parse Var size rows 'X' cols
z='+'
b6=left('',6)
Say ''
Say b6 copies('-',7) 'matrix' what copies('-',7)
Say b6 b6 '+'copies('-',cols*(w+1)+1)'+'
Do r=1 To rows
line='|' right(x.what.r.1,w)    /*ª* element of first column        */                       /*ª* start with long vertical bar   */
Do c=2 To cols                  /*ª* loop for other columns         */
line=line right(x.what.r.c,w) /*ª* append the elements            */
End /*ª* c */
Say b6 b6 line '|'              /*ª* append a long vertical bar.    */
End /*ª* r */
Say b6 b6 '+'copies('-',cols*(w+1)+1)'+'
Return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Kronecker-product\kronecker-product.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
