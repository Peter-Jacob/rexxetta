/*�*REXX program  verifies  if an  entered/supplied  string  (sentence)  is a pangram.    */
newV1= 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'               /*�*a list of all (Latin) capital letters*/

do forever;    say                           /*�*keep promoting 'til null (or blanks).*/
say '──────── Please enter a pangramic sentence   (or a blank to quit):';      say
pull y                                       /*�*this also uppercases the  Y variable.*/
if y=''  then leave                          /*�*if nothing entered,  then we're done.*/
absent= space( translate( newV1, , y), 0)     /*�*obtain a list of any absent letters. */
if absent==''  then say  "──────── Sentence is a pangram."
else say  "──────── Sentence isn't a pangram, missing: "    absent
say
end   /*�*forever*/

say '──────── PANGRAM program ended. ────────'   /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Pangram-checker\pangram-checker.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
