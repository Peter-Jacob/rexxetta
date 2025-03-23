/*�*REXX program solves the  "Twelve Statement Puzzle".                                   */
q=12;      newV1=right('statement',20)           /*�*number of statements in the puzzle.  */
m=0                                              /*�*[↓]  statement one is  TRUE  by fiat.*/
do pass=1  for 2                           /*�*find the maximum number of  "trues". */
do e=0   for 2**(q-1);    n = '1'right( x2b( d2x( e ) ),  q-1,  0)
do b=1  for q                      /*�*define various bits in the number  Q.*/
newV2.b=substr(n, b, 1)                /*�*define a particular  @  bit  (in  Q).*/
end   /*�*b*/
if newV2.1  then if yeses(1,  1)                        \==1  then iterate
if newV2.2  then if yeses(7, 12)                        \==3  then iterate
if newV2.3  then if yeses(2, 12,2)                      \==2  then iterate
if newV2.4  then if yeses(5,  5)   then  if yeses(6, 7) \==2  then iterate
if newV2.5  then if yeses(2,  4)                        \==0  then iterate
if newV2.6  then if yeses(1, 12,2)                      \==4  then iterate
if newV2.7  then if yeses(2,  3)                        \==1  then iterate
if newV2.8  then if yeses(7,  7)   then  if yeses(5,6)  \==2  then iterate
if newV2.9  then if yeses(1,  6)                        \==3  then iterate
if newV2.10 then if yeses(11,12)                        \==2  then iterate
if newV2.11 then if yeses(7,  9)                        \==1  then iterate
if newV2.12 then if yeses(1, 11)                        \==4  then iterate
g=yeses(1, 12)
if pass==1  then do;  m=max(m,g);  iterate;  end
else if g\==m     then iterate
do j=1  for q;             z=substr(n, j, 1)
if z  then  say newV1 right(j, 2)    " is "    word('false true', 1 + z)
end   /*�*tell*/
end       /*�*e*/
end         /*�*pass*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
yeses: parse arg L,H,B;  newV3=0;    do i=L  to H  by word(B 1, 1);  newV3=newV3+newV2.i;  end;   return newV3
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Twelve-statements\twelve-statements-1.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
