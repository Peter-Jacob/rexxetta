/*ª*REXX program displays the verses of the song:    "The 12 days of Christmas".          */
ordD= 'first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth'
pad= left('', 20)                                /*ª*used for indenting the shown verses. */
newV1.1= 'A partridge in a pear-tree.';   newV1.7 = "Seven swans a-swimming,"
newV1.2= 'Two Turtle Doves, and'      ;   newV1.8 = "Eight maids a-milking,"
newV1.3= 'Three French Hens,'         ;   newV1.9 = "Nine ladies dancing,"
newV1.4= 'Four Calling Birds,'        ;   newV1.10= "Ten lords a-leaping,"
newV1.5= 'Five Golden Rings,'         ;   newV1.11= "Eleven pipers piping,"
newV1.6= 'Six geese a-laying,'        ;   newV1.12= "Twelve drummers drumming,"
do day=1  for 12
say pad  'On the'   word(ordD, day)   "day of Christmas"    /*ª*display line 1 prologue.*/
say pad  'My True Love gave to me:'                         /*ª*   "      "  2     "    */
do j=day  by -1  to 1;       say pad newV1.j        /*ª*   "    the daily gifts.*/
end   /*ª*j*/
say                                            /*ª*add a blank line between the verses. */
end               /*ª*day*/                      /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\The-Twelve-Days-of-Christmas\the-twelve-days-of-christmas.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
