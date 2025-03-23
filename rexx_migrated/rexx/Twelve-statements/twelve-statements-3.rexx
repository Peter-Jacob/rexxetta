/*ª*REXX program solves the  "Twelve Statement Puzzle".                                   */
q=12;      newV1=right('statement',20)           /*ª*number of statements in the puzzle.  */
m=0                                              /*ª*[â†“]  statement one is  TRUE  by fiat.*/
do pass=1  for 2                           /*ª*find the maximum number of  "trues". */
do e=0   for 2**(q-1);    n = '1'right( x2b( d2x( e ) ),  q-1,  0)
parse var  n  newV5 2 newV6 3 newV7 4 newV8 5 newV9 6 newV10 7 newV11 8 newV12 9 newV13 10 newV2 11 newV3 12 newV4
/*ª*â–’â–’â–’â–’  if @1  then   if \ @1                           then iterate  â–’â–’â–’â–’*/
if newV6  then   if newV11+newV12+newV13+newV2+newV3+newV4  \==3     then iterate
if newV7  then   if newV6+newV8+newV10+newV12+newV2+newV4   \==2     then iterate
if newV8  then   if newV9  then if \(newV10 & newV11)         then iterate
if newV9  then   if newV6  |  newV7  |  newV8               then iterate
if newV10  then   if newV5+newV7+newV9+newV11+newV13+newV3    \==4     then iterate
if newV11  then   if \ (newV6  &&  newV7 )                then iterate
if newV12  then   if newV11  then  if \(newV9 & newV10)        then iterate
if newV13  then   if newV5+newV6+newV7+newV8+newV9+newV10     \==3     then iterate
if newV2 then   if \ (newV3 & newV4)                  then iterate
if newV3 then   if newV11+newV12+newV13              \==1     then iterate
g=newV5 + newV6 + newV7 + newV8 + newV9 + newV10 + newV11 + newV12 + newV13 + newV2 + newV3
if newV4 then   if g                     \==4     then iterate
g=g + newV4
if pass==1  then do;  m=max(m,g);  iterate;  end
else if g\==m     then iterate
do j=1  for q;  z=substr(n, j, 1)
if z  then say  newV1 right(j, 2)        " is "        word('false true', 1+z)
end   /*ª*j*/
end       /*ª*e*/
end         /*ª*pass*/                       /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Twelve-statements\twelve-statements-3.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
