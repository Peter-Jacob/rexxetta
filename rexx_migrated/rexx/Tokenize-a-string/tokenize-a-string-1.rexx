/*ª*REXX program separates a string of commaâ”€delimited words, and echoes them â”€â”€â–º terminal*/
original = 'Hello,How,Are,You,Today'             /*ª*some words separated by commas (,).  */
say  'The input string:'  original               /*ª*display original string â”€â”€â–º terminal.*/
new= original                                    /*ª*make a copy of the string.           */
do newV2=1  until  new==''          /*ª*keep processing until  NEW  is empty.*/
parse var  new   newV1.newV2  ','  new  /*ª*parse words delineated by a comma (,)*/
end   /*ª*#*/                     /*ª* [â†‘]  the new array is named   @.    */
say                                              /*ª* NEW  is destructively parsed.   [â†‘] */
say center(' Words in the string ', 40, "â•")     /*ª*display a nice header for the list.  */
do j=1  for newV2                   /*ª*display all the words (one per line),*/
say newV1.j || left(., j\==newV2)       /*ª*maybe append a period (.) to a word. */
end   /*ª*j*/                     /*ª* [â†‘]  don't append a period if last. */
say center(' Endâ”€ofâ”€list ', 40, "â•")             /*ª*display a (EOL) trailer for the list.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Tokenize-a-string\tokenize-a-string-1.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
