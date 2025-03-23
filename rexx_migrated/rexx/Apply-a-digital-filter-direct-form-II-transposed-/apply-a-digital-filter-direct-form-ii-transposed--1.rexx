/*�*REXX pgm filters a signal with a order3 lowpass Butterworth, direct form II transposed*/
newV2= '1           -2.77555756e-16  3.33333333e-1  -1.85037171e-17'  /*�*filter coefficients*/
newV3=  0.16666667   0.5             0.5             0.16666667       /*�*  "          "     */
newV4= '-0.917843918645  0.141984778794   1.20536903482    0.190286794412  -0.662370894973' ,
'-1.00700480494  -0.404707073677   0.800482325044   0.743500089861   1.01090520172 ' ,
' 0.741527555207  0.277841675195   0.400833448236  -0.2085993586    -0.172842103641' ,
'-0.134316096293  0.0259303398477  0.490105989562   0.549391221511   0.9047198589  '
newV5.=0;            N=words(newV4);    w=length(n);   numeric digits 24  /*�* [↑]  signal vector*/
do i=1  for N;              newV6=0           /*�*process each of the vector elements. */
do j=1  for words(newV3); if i-j >= 0  then newV6= newV6 + word(newV3, j) * word(newV4, i-j+1);  end
do k=1  for words(newV2); newV7= i -k +1;  if i-k >= 0  then newV6= newV6 - word(newV2, k) * newV5.newV7; end
newV5.i= newV6 / word(newV2 ,1);         call tell
end   /*�*i*/                                 newV1=������㮠����*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
tell: numeric digits digits()%2;  say right(i, w)   " "   left('', newV5.i>=0)newV5.i /1;   return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Apply-a-digital-filter-direct-form-II-transposed-\apply-a-digital-filter-direct-form-ii-transposed--1.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
