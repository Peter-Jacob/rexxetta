/*�*REXX program determines what characters are valid for REXX symbols.*/
/*�* version 1 adapted for general acceptance                          */
Parse Version v
Say v
symbol_characters=''                   /*�* start with no chars        */
do j=0 To 255                          /*�* loop through all the chars.*/
c=d2c(j)                             /*�* convert number to character*/
if datatype(c,'S') then              /*�* Symbol char                */
symbol_characters=symbol_characters || c  /*�* add to list.        */
end
say 'symbol characters:' symbol_characters /*�*display all        */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Idiomatically-determine-all-the-characters-that-can-be-used-for-symbols\idiomatically-determine-all-the-characters-that-can-be-used-for-symbols-2.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
