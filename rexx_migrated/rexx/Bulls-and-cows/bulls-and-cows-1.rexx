/*�*REXX program scores the   Bulls & Cows   game with  CBLFs  (Carbon Based Life Forms). */
newV1=; do  until length(newV1)==4;   r= random(1, 9)  /*�*generate a unique four-digit number.   */
if pos(r,newV1)\==0  then iterate;  newV1= newV1 || r  /*�*don't allow a repeated digit/numeral.  */
end   /*�*until length*/                     /*�* [↑]  builds a unique four-digit number*/
newV2= '──────── [Bulls & Cows]  '                 /*�*a literal that is part of the prompt.  */
do  until  bulls==4;      say              /*�*play until guessed  or  enters  "Quit".*/
say newV2  'Please enter a 4-digit guess (with no zeroes)   [or Quit]:'
pull n;  n=space(n, 0);   if abbrev('QUIT', n, 1)  then exit   /*�*user wants to quit?*/
q=newV1;   L= length(n);   bulls= 0;   cows= 0 /*�*initialize some REXX variables.        */
do j=1  for L;    if substr(n, j, 1)\==substr(q, j, 1)  then iterate  /*�*is bull?*/
bulls= bulls +1;  q= overlay(., q, j)  /*�*bump the bull count;  disallow for cow.*/
end   /*�*j*/                            /*�* [↑]  bull count───────────────────────*/
/*�*is cow? */
do k=1  for L;   newV3= substr(n, k, 1);           if pos(newV3, q)==0  then iterate
cows=cows + 1;   q= translate(q, , newV3)  /*�*bump the cow count;  allow mult digits.*/
end   /*�*k*/                            /*�* [↑]  cow  count───────────────────────*/
say;                  newV4= 'You got'   bulls
if L\==0  &  bulls\==4  then say newV2  newV4  'bull's(bulls)    "and"    cows   'cow's(cows).
end   /*�*until bulls*/
say "          ┌─────────────────────────────────────────┐"
say "          │                                         │"
say "          │  Congratulations, you've guessed it !!  │"
say "          │                                         │"
say "          └─────────────────────────────────────────┘"
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
s:  if arg(1)==1  then return '';   return "s"   /*�*this function handles pluralization. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Bulls-and-cows\bulls-and-cows-1.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
