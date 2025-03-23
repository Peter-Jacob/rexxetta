/*ª*REXX program calculates the Kronecker product   of   two arbitrary size   matrices. */
Signal On syntax
x.=0
amat=4X2 1 2 3 4 5 6 7 8         /*ª* define A matrix size and elements */
bmat=2X3 1 2 3 4 5 6             /*ª* "      B    "     "   "     "     */
Call makeMat 'A',amat            /*ª* construct A matrix from elements  */
Call makeMat 'B',bmat            /*ª* "         B    "     "     "      */
If cols.A<>rows.B Then
Call exit 'Matrices are incompatible for matrix multiplication',
'cols.A='cols.A'<>rows.B='rows.B
Call multMat                     /*ª* multiply A x B                    */
Call showMat 'A',amat            /*ª* display matrix A                  */
Call showMat 'B',bmat            /*ª* "          "   B                  */
Call showMat 'C',mm              /*ª* "          "   C                  */
Exit
/*ª*--------------------------------------------------------------------*/
makeMat:
Parse Arg what,size elements   /*ª*elements: e.1.1 e.1.2 - e.rows cols*/
Parse Var size rows 'X' cols
x.what.shape=rows cols
Parse Value rows cols With rows.what cols.what
n=0
Do r=1 To rows
Do c=1 To cols
n=n+1
element=word(elements,n)
x.what.r.c=element
End
End
Return
/*ª*--------------------------------------------------------------------*/
multMat:
/*ª* x.C.*.* = x.A.*.* x x.B.*.*                                        */
Do i=1 To rows.A
Do j=1 To cols.B
Do k=1 To cols.A
x.C.i.j=x.C.i.j+x.A.i.k*x.B.k.j
End /*ª*k*/
End /*ª*j*/
End /*ª*i*/
mm=rows.A||'X'||cols.B
Do i=1 To rows.A
Do j=1 To cols.B
mm=mm x.C.i.j
End /*ª*j*/
End /*ª*i*/
Call makeMat 'C',mm
Return
/*ª*--------------------------------------------------------------------*/
showMat:
Parse Arg what,size .
Parse Var size rows 'X' cols
z='+'
b6=left('',6)
Say ''
Say b6 copies('-',7) 'matrix' what copies('-',7)
w=0
Do r=1 To rows
Do c=1 To cols
w=max(w,length(x.what.r.c))
End
End
Say b6 b6 '+'copies('-',cols*(w+1)+1)'+' /*ª* top border              */
Do r=1 To rows
line='|' right(x.what.r.1,w)    /*ª* element of first colsumn       */                       /*ª* start with long vertical bar   */
Do c=2 To cols                  /*ª* loop for other columns         */
line=line right(x.what.r.c,w) /*ª* append the elements            */
End /*ª* c */
Say b6 b6 line '|'              /*ª* append a long vertical bar.    */
End /*ª* r */
Say b6 b6 '+'copies('-',cols*(w+1)+1)'+' /*ª* bottom border           */
Return
exit:
Say arg(1)
Exit

Syntax:
Say 'Syntax raised in line' sigl
Say sourceline(sigl)
Say 'rc='rc '('errortext(rc)')'
Say '***** There was a problem!'
Exit
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Matrix-multiplication\matrix-multiplication.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
