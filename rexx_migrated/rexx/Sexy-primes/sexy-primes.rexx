/*ช*REXX program finds and displays various kinds of  sexy and unsexy  primes less than N.*/
parse arg N endU end2 end3 end4 end5 .           /*ช*obtain optional argument from the CL.*/
if    N==''  |    N==","  then    N= 1000035 - 1 /*ช*Not specified?  Then use the default.*/
if endU==''  | endU==","  then endU=      10     /*ช* "      "         "   "   "     "    */
if end2==''  | end2==","  then end2=       5     /*ช* "      "         "   "   "     "    */
if end3==''  | end3==","  then end3=       5     /*ช* "      "         "   "   "     "    */
if end4==''  | end4==","  then end4=       5     /*ช* "      "         "   "   "     "    */
if end5==''  | end5==","  then end4=       5     /*ช* "      "         "   "   "     "    */
call genSq                                       /*ช*gen some squares for the DO k=7 UNTIL*/
call genPx                                       /*ช* " prime (@.) & sexy prime (X.) array*/
call genXU                                       /*ช*gen lists, types of sexy Ps, unsexy P*/
call getXs                                       /*ช*gen lists, last # of types of sexy Ps*/
newV1= ' sexy prime'                            /*ช*a handy literal for some of the SAYs.*/
w2= words( translate(x2,, '~') ); y2= words(x2) /*ช*count #primes in the sexy pairs.     */
w3= words( translate(x3,, '~') ); y3= words(x3) /*ช*  "   "   "    "  "    "  triplets.  */
w4= words( translate(x4,, '~') ); y4= words(x4) /*ช*  "   "   "    "  "    "  quadruplets*/
w5= words( translate(x5,, '~') ); y5= words(x5) /*ช*  "   "   "    "  "    "  quintuplets*/
say 'There are ' commas(w2%2) newV1 "pairs less than "             Nc
say 'The last '  commas(end2) newV1 "pairs are:";        say subword(x2, max(1,y2-end2+1))
say
say 'There are ' commas(w3%3) newV1 "triplets less than "          Nc
say 'The last '  commas(end3) newV1 "triplets are:";     say subword(x3, max(1,y3-end3+1))
say
say 'There are ' commas(w4%4) newV1 "quadruplets less than "       Nc
say 'The last '  commas(end4) newV1 "quadruplets are:";  say subword(x4, max(1,y4-end4+1))
say
say 'There is  ' commas(w5%5) newV1 "quintuplet less than "        Nc
say 'The last '  commas(end4) newV1 "quintuplet are:";   say subword(x5, max(1,y5-end4+1))
say
say 'There are ' commas(s1)         "   sexy primes less than "    Nc
say 'There are ' commas(u1)         " unsexy primes less than "    Nc
say 'The last '  commas(endU)       " unsexy primes are: "   subword(u,  max(1,u1-endU+1))
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
commas: procedure;  parse arg newV4;    n= newV4'.9';     newV5= 123456789;       b= verify(n, newV5, "M")
e= verify(n, newV5'0', , verify(n, newV5"0.", 'M') ) - 4
do j=e  to b  by -3;    newV4= insert(',', newV4, j);     end  /*ช*j*/;          return newV4
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
genSQ: do i=17  by 2  until i**2 > N+7; s.i= i**2; end; return /*ช*S used for square roots*/
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
genPx: newV3.=;              newV5= 0;          newV2.= 0.          /*ช*P array; P count; sexy P array*/
if N>1  then do;  newV5= 1;   newV3.1= 2;  newV2.2= 1;   end /*ช*count of primes found (so far)*/
x.=newV2.;                        LPs=3 5 7 11 13 17 /*ช*sexy prime array;  low P list.*/
do j=3  by 2  to  N+6                          /*ช*start in the cellar & work up.*/
if j<19  then if wordpos(j, LPs)==0  then iterate
else do; newV5= newV5+1;  newV3.newV5= j;  newV2.j= 1;  b= j - 6
if newV2.b  then x.b= 1;        iterate
end
if j// 3 ==0  then iterate                /*ช* ยทยทยท and eliminate multiples of  3.*/
parse var  j  ''  -1  newV4                   /*ช* get the rightmost digit of  J.    */
if     newV4 ==5  then iterate                /*ช* ยทยทยท and eliminate multiples of  5.*/
if j// 7 ==0  then iterate                /*ช* ยทยทยท  "      "         "      "  7.*/
if j//11 ==0  then iterate                /*ช* ยทยทยท  "      "         "      " 11.*/
if j//13 ==0  then iterate                /*ช* ยทยทยท  "      "         "      " 13.*/
do k=7  until s.newV4 > j;  newV4= newV3.k /*ช*รท by primes starting at 7th prime. */
if j // newV4 == 0  then iterate j /*ช*get the remainder of  jรท@.k    ___ */
end   /*ช*k*/                    /*ช*divide up through & including โ J  */
if j<=N  then do;  newV5= newV5+1;  newV3.newV5= j;  end  /*ช*bump P counter;  assign prime to @.*/
newV2.j= 1                                    /*ช*define  Jth  number as being prime.*/
b= j - 6                             /*ช*B: lower part of a sexy prime pair?*/
if newV2.b then do; x.b=1; if j<=N then x.j=1; end /*ช*assign (both parts ?) sexy Ps.*/
end   /*ช*j*/;       return
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
genXU: u= 2;         Nc=commas(N+1);  s=           /*ช*1st unsexy prime; add commas to N+1*/
say 'There are ' commas(newV5)    " primes less than "          Nc;           say
do k=2  for newV5-1; p= newV3.k; if x.p  then s=s p   /*ช*if  sexy prime, add it to list*/
else u= u p  /*ช* " unsexy  "     "   "  "   " */
end   /*ช*k*/                                   /*ช* [โ]  traispe through odd Ps. */
s1= words(s);  u1= words(u);   return       /*ช*# of sexy primes;  # unsexy primes.*/
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
getXs: x2=;  do k=2  for newV5-1;  p=newV3.k;   if \x.p  then iterate  /*ช*build sexy prime list. */
b=p- 6;  if \x.b  then iterate; x2=x2 b'~'p
end   /*ช*k*/
x3=;  do k=2  for newV5-1;  p=newV3.k;   if \x.p  then iterate  /*ช*build sexy P triplets. */
b=p- 6;  if \x.b  then iterate
t=p-12;  if \x.t  then iterate; x3=x3 t'~' || b"~"p
end   /*ช*k*/
x4=;  do k=2  for newV5-1;  p=newV3.k;   if \x.p  then iterate  /*ช*build sexy P quads.    */
b=p- 6;  if \x.b  then iterate
t=p-12;  if \x.t  then iterate
q=p-18;  if \x.q  then iterate; x4=x4 q'~'t"~" || b'~'p
end   /*ช*k*/
x5=;  do k=2  for newV5-1;  p=newV3.k;   if \x.p  then iterate  /*ช*build sexy P quints.   */
b=p- 6;  if \x.b  then iterate
t=p-12;  if \x.t  then iterate
q=p-18;  if \x.q  then iterate
v=p-24;  if \x.v  then iterate; x5=x5 v'~'q"~"t'~' || b"~"p
end   /*ช*k*/;    return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sexy-primes\sexy-primes.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
