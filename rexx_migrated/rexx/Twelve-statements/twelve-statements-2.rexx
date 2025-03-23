/*ª*REXX program solves the  "Twelve Statement Puzzle".                                   */
q=12;      newV1=right('statement',20)           /*ª*number of statements in the puzzle.  */
m=0                                              /*ª*[â†“]  statement one is  TRUE  by fiat.*/
do pass=1  for 2                           /*ª*find the maximum number of  "trues". */
do e=0   for 2**(q-1);    n = '1'right( x2b( d2x( e ) ),  q-1,  0)
do b=1  for q                      /*ª*define various bits in the number  Q.*/
newV2.b=substr(n, b, 1)                /*ª*define a particular  @  bit  (in  Q).*/
end   /*ª*b*/
if newV2.1  then   if \ newV2.1                             then iterate
if newV2.2  then   if newV2.7+newV2.8+newV2.9+newV2.10+newV2.11+newV2.12  \==3  then iterate
if newV2.3  then   if newV2.2+newV2.4+newV2.6+newV2.8+newV2.10+newV2.12   \==2  then iterate
if newV2.4  then   if newV2.5  then if \(newV2.6 & newV2.7)         then iterate
if newV2.5  then   if newV2.2  |  newV2.3  |  newV2.4               then iterate
if newV2.6  then   if newV2.1+newV2.3+newV2.5+newV2.7+newV2.9+newV2.11    \==4  then iterate
if newV2.7  then   if \ (newV2.2  &&  newV2.3 )                 then iterate
if newV2.8  then   if newV2.7  then  if \(newV2.5 & newV2.6)        then iterate
if newV2.9  then   if newV2.1+newV2.2+newV2.3+newV2.4+newV2.5+newV2.6     \==3  then iterate
if newV2.10 then   if \ (newV2.11 & newV2.12)                   then iterate
if newV2.11 then   if newV2.7+newV2.8+newV2.9                 \==1  then iterate
g=newV2.1 +newV2.2 +newV2.3 +newV2.4 +newV2.5 +newV2.6 +newV2.7 +newV2.8+ newV2.9 +newV2.10 +newV2.11
if newV2.12 then   if g                           \==4  then iterate
g=g + newV2.12
if pass==1  then do;  m=max(m,g);  iterate;  end
else if g\==m     then iterate
do j=1  for q;  z=substr(n, j, 1)
if z  then  say newV1 right(j, 2)        " is "        word('false true', 1+z)
end   /*ª*tell*/
end       /*ª*e*/
end         /*ª*pass*/                       /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Twelve-statements\twelve-statements-2.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
