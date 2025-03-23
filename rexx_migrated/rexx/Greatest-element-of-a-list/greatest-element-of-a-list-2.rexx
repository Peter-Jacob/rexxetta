/*ª*REXX program finds the  greatest element  in a list (of the first 25 reversed primes).*/
newV1.=;       newV1.1 = 2;    newV1.2 = 3;    newV1.3 = 5;    newV1.4 = 7;    newV1.5 =11;    newV1.6 =31;    newV1.7 =71
newV1.8 =91;    newV1.9 =32;    newV1.10=92;    newV1.11=13;    newV1.12=73;    newV1.13=14;    newV1.14=34
newV1.15=74;    newV1.16=35;    newV1.17=95;    newV1.18=16;    newV1.19=76;    newV1.20=17;    newV1.21=37
newV1.22=97;    newV1.23=38;    newV1.24=98;    newV1.25=79
big=newV1.1                                          /*ª*choose an initial biggest number.    */
do newV2=2  while newV1.newV2\==''           /*ª*traipse through whole array of nums. */
big = max(big, newV1.newV2)              /*ª*use a BIF to find the biggest number.*/
end   /*ª*#*/
/*ª*stick a fork in it,  we're all done. */
say 'the biggest value in an array of '      newV2-1       " elements is: "           big
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Greatest-element-of-a-list\greatest-element-of-a-list-2.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
