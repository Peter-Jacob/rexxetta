/*ª*REXX programs spells out  ordinal numbers  (in English, using the American system).   */
numeric digits 3000                              /*ª*just in case the user uses gihugic #s*/
parse arg n                                      /*ª*obtain optional arguments from the CL*/

if n='' | n=","  then n= 1  2  3  4  5  11  65  100  101  272  23456  8007006005004003

pgmOpts= 'ordinal  quiet'                        /*ª*define options needed for $SPELL#.REX*/


do j=1  for words(n)                        /*ª*process each of the specified numbers*/
x=word(n, j)                                /*ª*obtain a number from the input list. */
os=$spell#(x  pgmOpts)                      /*ª*invoke REXX routine to spell ordinal#*/
say right(x, max(20, length(x) ) )      ' spelled ordinal number â”€â”€â”€â–º '      os
end   /*ª*j*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Spelling-of-ordinal-numbers\spelling-of-ordinal-numbers.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
