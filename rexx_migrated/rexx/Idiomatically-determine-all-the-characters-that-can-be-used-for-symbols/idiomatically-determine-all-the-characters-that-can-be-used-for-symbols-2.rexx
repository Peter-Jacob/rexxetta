/*ª*REXX program determines what characters are valid for REXX symbols.*/
/*ª* version 1 adapted for general acceptance                          */
Parse Version v
Say v
symbol_characters=''                   /*ª* start with no chars        */
do j=0 To 255                          /*ª* loop through all the chars.*/
c=d2c(j)                             /*ª* convert number to character*/
if datatype(c,'S') then              /*ª* Symbol char                */
symbol_characters=symbol_characters || c  /*ª* add to list.        */
end
say 'symbol characters:' symbol_characters /*ª*display all        */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Idiomatically-determine-all-the-characters-that-can-be-used-for-symbols\idiomatically-determine-all-the-characters-that-can-be-used-for-symbols-2.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
