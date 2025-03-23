/*ª*REXX program  (translated from PL/I)  flattens a list  (the data need not be numeric).*/
list= '[[1], 2, [[3,4], 5], [[[]]], [[[6]]], 7, 8, []]'  /*ª*the list to be flattened.    */
say list                                                 /*ª*display the original list.   */
c= ','                                                  /*ª*define a literal  (1 comma). */
cc= ',,'                                                 /*ª*   "   "    "     (2 commas).*/
list= translate(list, , "[]")                            /*ª*translate brackets to blanks.*/
list= space(list, 0)                                     /*ª*Converts spaces to nulls.    */
do  while index(list, cc) > 0      /*ª*any double commas ?          */
list= changestr(cc, list, c)       /*ª*convert  ,,  to single comma.*/
end   /*ª*while*/
list= strip(list, 'T', c)                                /*ª*strip the last trailing comma*/
list = '['list"]"                                        /*ª*repackage the list.          */
say list                                                 /*ª*display the flattened list.  */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Flatten-a-list\flatten-a-list.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
