/*ช*REXX program scores the   Bulls & Cows   game with  CBLFs  (Carbon Based Life Forms). */
newV1=; do  until length(newV1)==4;   r= random(1, 9)  /*ช*generate a unique four-digit number.   */
if pos(r,newV1)\==0  then iterate;  newV1= newV1 || r  /*ช*don't allow a repeated digit/numeral.  */
end   /*ช*until length*/                     /*ช* [โ]  builds a unique four-digit number*/
newV2= 'โโโโโโโโ [Bulls & Cows]  '                 /*ช*a literal that is part of the prompt.  */
do  until  bulls==4;      say              /*ช*play until guessed  or  enters  "Quit".*/
say newV2  'Please enter a 4-digit guess (with no zeroes)   [or Quit]:'
pull n;  n=space(n, 0);   if abbrev('QUIT', n, 1)  then exit   /*ช*user wants to quit?*/
q=newV1;   L= length(n);   bulls= 0;   cows= 0 /*ช*initialize some REXX variables.        */
do j=1  for L;    if substr(n, j, 1)\==substr(q, j, 1)  then iterate  /*ช*is bull?*/
bulls= bulls +1;  q= overlay(., q, j)  /*ช*bump the bull count;  disallow for cow.*/
end   /*ช*j*/                            /*ช* [โ]  bull countโโโโโโโโโโโโโโโโโโโโโโโ*/
/*ช*is cow? */
do k=1  for L;   newV3= substr(n, k, 1);           if pos(newV3, q)==0  then iterate
cows=cows + 1;   q= translate(q, , newV3)  /*ช*bump the cow count;  allow mult digits.*/
end   /*ช*k*/                            /*ช* [โ]  cow  countโโโโโโโโโโโโโโโโโโโโโโโ*/
say;                  newV4= 'You got'   bulls
if L\==0  &  bulls\==4  then say newV2  newV4  'bull's(bulls)    "and"    cows   'cow's(cows).
end   /*ช*until bulls*/
say "          โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ"
say "          โ                                         โ"
say "          โ  Congratulations, you've guessed it !!  โ"
say "          โ                                         โ"
say "          โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ"
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
s:  if arg(1)==1  then return '';   return "s"   /*ช*this function handles pluralization. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Bulls-and-cows\bulls-and-cows-1.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
