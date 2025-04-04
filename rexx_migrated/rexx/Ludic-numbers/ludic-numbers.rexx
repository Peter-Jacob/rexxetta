/*ͺ*REXX program gens/shows (a range of)  ludic numbers,  or a count when a range is used.*/
parse arg N count bot top triples .              /*ͺ*obtain optional arguments from the CL*/
if       N=='' |       N=="," then       N=   25 /*ͺ*Not specified?  Then use the default.*/
if   count=='' |   count=="," then   count= 1000 /*ͺ* "      "         "   "   "     "    */
if     bot=='' |     bot=="," then     bot= 2000 /*ͺ* "      "         "   "   "     "    */
if     top=='' |     top=="," then     top= 2005 /*ͺ* "      "         "   "   "     "    */
if triples=='' | triples=="," then triples=  249 /*ͺ* "      "         "   "   "     "    */
newV1= 0                                             /*ͺ*the number of ludic numbers (so far).*/
newV2= ludic( max(N, count, bot, top, triples) )                /*ͺ*generate enough ludic nums*/
say 'The first '   N   " ludic numbers: "   subword(newV2,1,25) /*ͺ*display 1st  N  ludic nums*/
do j=1  until word(newV2, j) > count             /*ͺ*search up to a specific #.*/
end   /*ͺ*j*/
say
say "There are "          j - 1           ' ludic numbers that are  βξεχΦ² '            count
say
say "The "  bot  'ββββΊ'     top     ' (inclusive)  ludic numbers are: '    subword(newV2, bot)
newV3=                                               /*ͺ*list of ludic triples found (so far).*/
do j=1  for words(newV2)
newV4= word(newV2, j)                               /*ͺ*it is known that ludic   _   exists. */
if newV4>=triples  then leave                   /*ͺ*only process up to a specific number.*/
if wordpos(newV4+2, newV2)==0 | wordpos(newV4+6, newV2)==0  then iterate    /*ͺ*Not triple?  Skip it.*/
newV1= newV1 + 1                                    /*ͺ*bump the triple counter.             */
newV3= newV3 'β'newV4  newV4+2  newV4+6"βΊ "                     /*ͺ*append the newly found triple βββΊ  @ */
end   /*ͺ*j*/
say
if newV3==''  then  say  'From 1βββΊ'triples", no triples found."
else  say  'From 1βββΊ'triples", "     newV1     ' triples found:'      newV3
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
ludic: procedure; parse arg m,,newV3;    newV2= 1 2      /*ͺ*$β‘ludic numbers superset;  @β‘sequence*/
do j=3  by 2  to  m*15;   newV3= newV3 j      /*ͺ*construct an initial list of numbers.*/
end   /*ͺ*j*/
newV3= newV3' ';                    n= words(newV3)   /*ͺ*append a blank to the number sequence*/
do while n\==0;         f= word(newV3, 1) /*ͺ*examine the first word in the @ list.*/
newV2= newV2 f                                /*ͺ*add the word to the  $  list.        */
do d=1  by f  while d<=n;   n= n-1 /*ͺ*use 1st number, elide all occurrences*/
newV3= changestr(' 'word(newV3, d)" ",  newV3,  ' . ')     /*ͺ*crossβout a number in  @ */
end   /*ͺ*d*/                        /*ͺ* [β]  done eliding the "1st" number. */
newV3= translate(newV3, , .)                  /*ͺ*change dots to blanks; count numbers.*/
end      /*ͺ*while*/                    /*ͺ* [β]  done eliding ludic numbers.    */
return subword(newV2, 1, m)                   /*ͺ*return a  range  of  ludic  numbers. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Ludic-numbers\ludic-numbers.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
