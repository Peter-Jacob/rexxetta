/*�*REXX program transposes any sized rectangular matrix, displays before & after matrices*/
newV1.=;     newV1.1 =   1.02     2.03      3.04       4.05        5.06         6.07          7.08
newV1.2 = 111     2222     33333     444444     5555555     66666666     777777777
w=0
do    row=1  while newV1.row\==''
do col=1  until newV1.row==''; parse var newV1.row A.row.col newV1.row
w=max(w, length(A.row.col) )    /*�*max width for elements*/
end   /*�*col*/                   /*�*(used to align ouput).*/
end      /*�*row*/    /*�* [↑]  build matrix A from the @ lists*/
row= row-1                                       /*�*adjust for  DO  loop index increment.*/
do    j=1  for row  /*�*process each    row    of the matrix.*/
do k=1  for col  /*�*   "      "    column   "  "     "   */
B.k.j= A.j.k     /*�*transpose the  A  matrix  (into  B). */
end   /*�*k*/
end      /*�*j*/
call showMat  'A', row, col                      /*�*display the   A   matrix to terminal.*/
call showMat  'B', col, row                      /*�*   "     "    B      "    "     "    */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
showMat: arg mat,rows,cols;     say;       say center( mat  'matrix',  (w+1)*cols +4, "─")
do      r=1  for rows;    newV2=                                  /*�*newLine*/
do c=1  for cols;    newV2=newV2 right( value( mat'.'r"."c), w)  /*�*append.*/
end   /*�*c*/
say newV2                                                         /*�*1 line.*/
end        /*�*r*/;         return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Matrix-transposition\matrix-transposition.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
