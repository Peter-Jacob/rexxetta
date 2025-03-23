/*ª*REXX pgm copies data from STDINâ”€â”€â–ºSTDOUT (default input streamâ”€â”€â–ºdefault output stream*/

do while chars()\==0                           /*ª*repeat loop until no more characters.*/
call charin  , x                               /*ª*read  a char from the  input stream. */
call charout , x                               /*ª*write "   "    "   "   output   "    */
end   /*ª*while*/                                /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Copy-stdin-to-stdout\copy-stdin-to-stdout.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
