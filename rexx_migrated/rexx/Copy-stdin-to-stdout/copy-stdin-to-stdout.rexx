/*�*REXX pgm copies data from STDIN──►STDOUT (default input stream──►default output stream*/

do while chars()\==0                           /*�*repeat loop until no more characters.*/
call charin  , x                               /*�*read  a char from the  input stream. */
call charout , x                               /*�*write "   "    "   "   output   "    */
end   /*�*while*/                                /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Copy-stdin-to-stdout\copy-stdin-to-stdout.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
