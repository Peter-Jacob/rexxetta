/*ª*REXX program demonstrates  how to  strip  leading  and/or  trailing  spaces (blanks). */
yyy="   this is a string that has leading/embedded/trailing blanks,  fur shure.  "
say 'YYYâ”€â”€â–º'yyy"â—„â”€â”€"                             /*ª*display the original string + fence. */
/*ª*white space also includes tabs (VT, HT), among other characters.*/

/*ª*all examples in each group are equivalent, only the option's 1st*/
/*ª*character is examined.                                          */
noL=strip(yyy,'L')                               /*ª*elide any  leading white space.      */
noL=strip(yyy,"l")                               /*ª*  (the same as the above statement.) */
noL=strip(yyy,'leading')                         /*ª*    "    "   "  "    "       "       */
say 'noLâ”€â”€â–º'noL"â—„â”€â”€"                             /*ª*display the string with a title+fence*/

noT=strip(yyy,'T')                               /*ª*elide any trailing white space.      */
noT=strip(yyy,"t")                               /*ª*  (the same as the above statement.) */
noT=strip(yyy,'trailing')                        /*ª*    "    "   "  "    "       "       */
say 'noTâ”€â”€â–º'noT"â—„â”€â”€"                             /*ª*display the string with a title+fence*/

noB=strip(yyy)                                   /*ª*elide leading & trailing white space.*/
noB=strip(yyy,)                                  /*ª*  (the same as the above statement.) */
noB=strip(yyy,'B')                               /*ª*    "    "   "  "    "       "       */
noB=strip(yyy,"b")                               /*ª*    "    "   "  "    "       "       */
noB=strip(yyy,'both')                            /*ª*    "    "   "  "    "       "       */
say 'noBâ”€â”€â–º'noB"â—„â”€â”€"                             /*ª*display the string with a title+fence*/

/*ª*elide leading & trailing white space,*/
noX=space(yyy)                                   /*ª* including white space between words.*/
say 'noxâ”€â”€â–º'noX"â—„â”€â”€"                             /*ª*display the string with a title+fence*/
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Strip-whitespace-from-a-string-Top-and-tail\strip-whitespace-from-a-string-top-and-tail-1.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
