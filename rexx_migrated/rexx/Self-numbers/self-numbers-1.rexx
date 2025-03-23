/*�*REXX program displays  N  self numbers (aka Colombian or Devlali numbers). OEIS A3052.*/
parse arg n .                                    /*�*obtain optional argument from the CL.*/
if n=='' | n==","  then n= 50                    /*�*Not specified?  Then use the default.*/
tell = n>0;             n= abs(n)                /*�*TELL:  show the self numbers if  N>0 */
newV1.= .                                            /*�*initialize the array of self numbers.*/
do j=1  for n*10                      /*�*scan through ten times the #s wanted.*/
newV2= j                                  /*�*1st part of sum is the number itself.*/
do k=1  for length(j)           /*�*sum the decimal digits in the number.*/
newV2= newV2 + substr(j, k, 1)          /*�*add a particular digit to the sum.   */
end   /*�*k*/
newV1.newV2=                                  /*�*mark  J  as not being a self number. */
end         /*�*j*/                     /*�*            ───                      */
list= 1                                          /*�*initialize the list to the 1st number*/
newV3= 1                            /*�*the count of self numbers  (so far). */
do i=3  until newV3==n;  if newV1.i=='' then iterate  /*�*Not a self number?   Then skip it.   */
newV3= newV3 + 1;            list= list i             /*�*bump counter of self #'s; add to list*/
end   /*�*i*/
/*�*stick a fork in it,  we're all done. */
say   n     " self numbers were found."          /*�*display the title for the output list*/
if tell  then say list                           /*�*display list of self numbers ──►term.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Self-numbers\self-numbers-1.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
