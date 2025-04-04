/*ช*REXX program computes the average loop length mapping a random field 1ยทยทยทN โโโโบ 1ยทยทยทN */
parse arg runs tests seed .                      /*ช*obtain optional arguments from the CL*/
if  runs =='' |  runs ==","  then runs =      40 /*ช*Not specified?  Then use the default.*/
if tests =='' | tests ==","  then tests= 1000000 /*ช* "      "         "   "   "     "    */
if datatype(seed, 'W')  then call random ,, seed /*ช*Is integer?   For RAND repeatability.*/
newV1.=0;          newV1.0=1                             /*ช*used for  factorial (!)  memoization.*/
numeric digits 100000                            /*ช*be able to calculate 25k! if need be.*/
numeric digits max(9, length( newV4(runs) )   )      /*ช*set the NUMERIC DIGITS for  !(runs). */
say right(     runs, 24)      'runs'             /*ช*display number of runs   we're using.*/
say right(    tests, 24)      'tests'            /*ช*   "       "    " tests    "     "   */
say right( digits(), 24)      'digits'           /*ช*   "       "    " digits   "     "   */
say
say "        N    average     exact     % error "     /*ช* โโโโ title, header โบโโโโโโโโโ  */
hdr="       โโโ  โโโโโโโโโ  โโโโโโโโโ  โโโโโโโโโ";       pad=left('',3)  /*ช* โโโโโโโโโโ  */
say hdr
do newV3=1  for runs;   av=fmtD( exact(newV3) ) /*ช*use four digits past decimal point.  */
xa=fmtD( exper(newV3) ) /*ช* "    "    "      "     "      "     */
say right(newV3,9)  pad xa pad av pad fmtD( abs(xa-av) * 100 / av)   /*ช*show values.*/
end   /*ช*#*/
say hdr                                          /*ช*display the final header (some bars).*/
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
newV4:     procedure expose newV1.;  parse arg z;                      if newV1.z\==0  then return newV1.z
newV4=1;       do j=2  for z -1;  newV4=newV4*j;  newV1.j=newV4;  end; /*ช*compute factorial*/   return newV4
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
exact: parse arg x;  s=0;     do j=1  for x;  s=s + newV4(x) / newV4(x-j) / x**j;  end;   return s
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
exper: parse arg n;  k=0;     do tests;   newV2.=0                      /*ช*do it TESTS times.*/
do n;    r=random(1, n);      if newV2.r  then leave
newV2.r=1;   k=k + 1                   /*ช*bump the counter. */
end   /*ช*n*/
end      /*ช*tests*/
return k/tests
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
fmtD:  parse arg y,d;     d=word(d 4, 1);    y=format(y, , d);     parse var  y  w  '.'  f
if f=0  then return  w || left('', d +1);                                  return y
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Average-loop-length\average-loop-length.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
