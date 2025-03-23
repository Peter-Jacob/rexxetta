/*ª*REXX program shows how to  assign and/or display  values of a multiâ”€dimensional array.*/
/*ª*REXX arrays can start anywhere.      */
y.=0                                             /*ª*set all values of   Y   array to  0. */
/*ª* [â†‘]  bounds need not be specified.  */
newV1=0                                              /*ª*the count for the number of   SAYs.  */
y.4.3.2.0= 3**7                                  /*ª*set penultimate element to   2187    */
do       i=0  for 5
do     j=0  for 4
do   k=0  for 3
do m=0  for 2;   newV1=newV1+1             /*ª*bump the  SAY  counter.*/
/*ª*the 1st SAYâ”€â”€â–º */         say  'y.'i"."j'.'k"."m   '='   y.i.j.k.m
end   /*ª*m*/
end     /*ª*k*/
end       /*ª*j*/
end         /*ª*i*/
say
say '# of elements displayed = '  newV1              /*ª*should be   5 * 4 * 3 * 2    or   5! */
exit                                             /*ª*stick a fork in it,  we're all done. */

/*ª* [â†“]   other versions of the first (REXX)   SAY   instruction. */
say  'y.' || i || . || k || . || m  '='  y.i.j.k.m
say  'y.'||i||.||k||.||m            '='  y.i.j.k.m
say  'y.'i||.||k||.||m              '='  y.i.j.k.m
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Multi-dimensional-array\multi-dimensional-array-3.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
