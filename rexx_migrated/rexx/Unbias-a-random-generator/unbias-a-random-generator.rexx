/*�*REXX program generates  unbiased random numbers  and displays the results to terminal.*/
parse arg newV3 R seed .                             /*�*obtain optional arguments from the CL*/
if newV3==''  |  newV3==","     then newV3=1000              /*�*#:  the number of SAMPLES to be used.*/
if R==''  |  R==","     then R=6                 /*�*R:  the high number for the  range.  */
if datatype(seed, 'W')  then call random ,,seed  /*�*Specified?  Then use for RANDOM seed.*/
dash='─';    newV2="biased";         newV1='un'newV2     /*�*literals for the SAY column headers. */
say left('',5)   ctr("N",5)   ctr(newV2)   ctr(newV2'%')  ctr(newV1)  ctr(newV1"%")   ctr('samples')
dash=
do N=3  to R;      b=0;                u=0
do j=1  for newV3;   b=b + randN(N);     u=u + unbiased()
end   /*�*j*/
say  left('', 5)     ctr(N, 5)     ctr(b)    pct(b)    ctr(u)    pct(u)    ctr(newV3)
end     /*�*N*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
ctr:       return center( arg(1), word(arg(2) 12, 1), left(dash, 1)) /*�*show hdr│numbers.*/
pct:       return ctr( format(arg(1) / newV3 * 100, , 2)'%' )            /*�*2 decimal digits.*/
randN:     parse arg z;            return random(1, z)==z            /*�*ret 1 if rand==Z.*/
unbiased:  do  until x\==randN(N); x=randN(N);  end;       return x  /*�* "  unbiased RAND*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Unbias-a-random-generator\unbias-a-random-generator.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
