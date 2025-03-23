/*�*REXX program gens/shows (a range of)  ludic numbers,  or a count when a range is used.*/
parse arg N count bot top triples .              /*�*obtain optional arguments from the CL*/
if       N=='' |       N=="," then       N=   25 /*�*Not specified?  Then use the default.*/
if   count=='' |   count=="," then   count= 1000 /*�* "      "         "   "   "     "    */
if     bot=='' |     bot=="," then     bot= 2000 /*�* "      "         "   "   "     "    */
if     top=='' |     top=="," then     top= 2005 /*�* "      "         "   "   "     "    */
if triples=='' | triples=="," then triples=  249 /*�* "      "         "   "   "     "    */
newV1= 0                                             /*�*the number of ludic numbers (so far).*/
newV2= ludic( max(N, count, bot, top, triples) )                /*�*generate enough ludic nums*/
say 'The first '   N   " ludic numbers: "   subword(newV2,1,25) /*�*display 1st  N  ludic nums*/
do j=1  until word(newV2, j) > count             /*�*search up to a specific #.*/
end   /*�*j*/
say
say "There are "          j - 1           ' ludic numbers that are  ����ֲ '            count
say
say "The "  bot  '───►'     top     ' (inclusive)  ludic numbers are: '    subword(newV2, bot)
newV3=                                               /*�*list of ludic triples found (so far).*/
do j=1  for words(newV2)
newV4= word(newV2, j)                               /*�*it is known that ludic   _   exists. */
if newV4>=triples  then leave                   /*�*only process up to a specific number.*/
if wordpos(newV4+2, newV2)==0 | wordpos(newV4+6, newV2)==0  then iterate    /*�*Not triple?  Skip it.*/
newV1= newV1 + 1                                    /*�*bump the triple counter.             */
newV3= newV3 '◄'newV4  newV4+2  newV4+6"► "                     /*�*append the newly found triple ──►  @ */
end   /*�*j*/
say
if newV3==''  then  say  'From 1──►'triples", no triples found."
else  say  'From 1──►'triples", "     newV1     ' triples found:'      newV3
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
ludic: procedure; parse arg m,,newV3;    newV2= 1 2      /*�*$≡ludic numbers superset;  @≡sequence*/
do j=3  by 2  to  m*15;   newV3= newV3 j      /*�*construct an initial list of numbers.*/
end   /*�*j*/
newV3= newV3' ';                    n= words(newV3)   /*�*append a blank to the number sequence*/
do while n\==0;         f= word(newV3, 1) /*�*examine the first word in the @ list.*/
newV2= newV2 f                                /*�*add the word to the  $  list.        */
do d=1  by f  while d<=n;   n= n-1 /*�*use 1st number, elide all occurrences*/
newV3= changestr(' 'word(newV3, d)" ",  newV3,  ' . ')     /*�*cross─out a number in  @ */
end   /*�*d*/                        /*�* [↑]  done eliding the "1st" number. */
newV3= translate(newV3, , .)                  /*�*change dots to blanks; count numbers.*/
end      /*�*while*/                    /*�* [↑]  done eliding ludic numbers.    */
return subword(newV2, 1, m)                   /*�*return a  range  of  ludic  numbers. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Ludic-numbers\ludic-numbers.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
