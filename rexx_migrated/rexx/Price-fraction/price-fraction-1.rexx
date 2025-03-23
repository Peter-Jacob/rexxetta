/*�*REXX program re─scales a (decimal fraction)  price  (in the range of:   0¢  ──►  $1). */
pad= '     '                                     /*�*for inserting spaces into a message. */
do j=0  to 1  by .01                   /*�*process the prices from 0¢  to  ≤ $1 */
if j==0  then j= 0.00                  /*�*handle the special case of zero cents*/
say pad  'original price ──►'    j   pad   adjPrice(j)     " ◄── adjusted price"
end   /*�*j*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
adjPrice: procedure;  parse arg newV1                /*�*a table is used to facilitate changes*/
select
when newV1<0.06  then newV1= 0.10
when newV1<0.11  then newV1= 0.18
when newV1<0.16  then newV1= 0.26
when newV1<0.21  then newV1= 0.32
when newV1<0.26  then newV1= 0.38
when newV1<0.31  then newV1= 0.44
when newV1<0.36  then newV1= 0.50
when newV1<0.41  then newV1= 0.54
when newV1<0.46  then newV1= 0.58
when newV1<0.51  then newV1= 0.62
when newV1<0.56  then newV1= 0.66
when newV1<0.61  then newV1= 0.70
when newV1<0.66  then newV1= 0.74
when newV1<0.71  then newV1= 0.78
when newV1<0.76  then newV1= 0.82
when newV1<0.81  then newV1= 0.86
when newV1<0.86  then newV1= 0.90
when newV1<0.91  then newV1= 0.94
when newV1<0.96  then newV1= 0.98
when newV1<1.01  then newV1= 1.00
otherwise    nop
end   /*�*select*/
return newV1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Price-fraction\price-fraction-1.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
