/*�*REXX program calculates and displays a range of  Bell numbers  (index starts at zero).*/
parse arg LO HI .                                /*�*obtain optional arguments from the CL*/
if LO=='' & HI==""   then do; LO=0; HI=14;  end  /*�*Not specified?  Then use the default.*/
if LO=='' | LO==","  then LO=  0                 /*�* "      "         "   "   "     "    */
if HI=='' | HI==","  then HI= 15                 /*�* "      "         "   "   "     "    */
numeric digits max(9, HI*2)                      /*�*crudely calculate the # decimal digs.*/
newV1.=.;             newV1.0= 1;   newV1.1= 1;      newV2.= 1   /*�*the  FACT  function uses memoization.*/
do j=0  for  HI+1;     newV3= j==0;     jm= j-1 /*�*JM  is used for a shortcut  (below). */
do k=0  for j;            newV4= jm - k  /*�* [↓]  calculate a Bell # the easy way*/
newV3= newV3 + comb(jm, k) * newV2.newV4             /*�*COMB����ֵcombination or binomial function*/
end   /*�*k*/
newV2.j= newV3                                      /*�*assign the Jth Bell number to @ array*/
if j>=LO  &  j<=HI  then say '      Bell('right(j, length(HI) )") = "    commas(newV3)
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas:  parse arg newV4;  do c=length(newV4)-3  to 1  by -3; newV4=insert(',', newV4, c); end;   return newV4
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
comb: procedure expose newV1.; parse arg x,y;        if x==y      then  return 1
if x-y<y  then y= x - y;                   if newV1.x.y\==. then  return newV1.x.y / fact(y)
newV4= 1;          do j=x-y+1  to x;  newV4= newV4*j;  end;    newV1.x.y= newV4;  return     newV4 / fact(y)
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
fact: procedure expose newV1.; parse arg x;    if newV1.x\==.   then return newV1.x;          newV5= 1
do f=2  for x-1;      newV5= newV5 * f;    end;        newV1.x= newV5;       return newV5
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Bell-numbers\bell-numbers.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
