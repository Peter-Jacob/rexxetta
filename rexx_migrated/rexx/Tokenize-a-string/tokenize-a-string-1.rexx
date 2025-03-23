/*�*REXX program separates a string of comma─delimited words, and echoes them ──► terminal*/
original = 'Hello,How,Are,You,Today'             /*�*some words separated by commas (,).  */
say  'The input string:'  original               /*�*display original string ──► terminal.*/
new= original                                    /*�*make a copy of the string.           */
do newV2=1  until  new==''          /*�*keep processing until  NEW  is empty.*/
parse var  new   newV1.newV2  ','  new  /*�*parse words delineated by a comma (,)*/
end   /*�*#*/                     /*�* [↑]  the new array is named   @.    */
say                                              /*�* NEW  is destructively parsed.   [↑] */
say center(' Words in the string ', 40, "═")     /*�*display a nice header for the list.  */
do j=1  for newV2                   /*�*display all the words (one per line),*/
say newV1.j || left(., j\==newV2)       /*�*maybe append a period (.) to a word. */
end   /*�*j*/                     /*�* [↑]  don't append a period if last. */
say center(' End─of─list ', 40, "═")             /*�*display a (EOL) trailer for the list.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Tokenize-a-string\tokenize-a-string-1.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
