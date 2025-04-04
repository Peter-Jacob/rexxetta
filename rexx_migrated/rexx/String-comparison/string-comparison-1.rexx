/*ͺ*REXX program shows  different ways to  compare  two character strings.*/
say 'This is an '      word('ASCII EBCDIC', 1+(1=='f1'))        ' system.'
say
cat = 'cat'
animal = 'dog'
if animal =  cat  then say $(animal) "is lexically equal to"        $(cat)
if animal \= cat  then say $(animal) "is not lexically equal to"    $(cat)
if animal >  cat  then say $(animal) "is lexically higher than"     $(cat)
if animal <  cat  then say $(animal) "is lexically lower than"      $(cat)
if animal >  cat  then say $(animal) "is not lexically lower than"  $(cat)
if animal <  cat  then say $(animal) "is not lexically higher than" $(cat)

/*ͺ*ββββ [β]  The above comparative operators don't */
/*ͺ*ββββconsider any leading and/or trailing white- */
/*ͺ*ββββspace when making comparisons, but the case */
/*ͺ*ββββis honored  (uppercase, lowercase).         */

fatcat='  cat  '      /*ͺ*pad the cat with leading and trailing blanks.   */
if fatcat =  cat  then say $(fatcat) " is equal to"                 $(cat)

/*ͺ*ββββTo consider any whitespace in a comparison, */
/*ͺ*ββββwe need to use strict comparative operators.*/

if fatcat == cat  then say $(fatcat) "is strictly equal to"         $(cat)

/*ͺ*ββββTo perform caseless comparisons, the easiest*/
/*ͺ*ββββmethod would be to uppercase a copy of both */
/*ͺ*ββββoperands.  Uppercasing is only done for the */
/*ͺ*ββββLatin (or Roman) alphabet in REXX.    [β]   */
kat='cAt'
if caselessComp(cat,kat)  then  say $(cat) 'and' $(kat) "are equal caseless"
exit                                   /*ͺ*stick a fork in it, we're done.*/
/*ͺ*ββββββββββββββββββββββββββββββββββ$ subroutineββββββββββββββββββββββββ*/
$:  return 'βββΊ'arg(1)'βββ'            /*ͺ*bracket the string with βββΊΞ±βββ*/
/*ͺ*ββββββββββββββββββββββββββββββββββCASELESSCOMP subroutineβββββββββββββ*/
caselessComp:  procedure;  arg a,b     /*ͺ*ARG  uppercases the A & B args.*/
return a==b             /*ͺ*if exactly equal, return  1.   */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\String-comparison\string-comparison-1.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
