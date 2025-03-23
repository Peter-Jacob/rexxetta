/*�*REXX program demonstrates tokenizing and displaying a string with escaping sequences. */
str = 'one^|uno||three^^^^|four^^^|^cuatro|'   /*�*the character string to be tokenized.*/
esc = '^'                                      /*�* "    escape  character to be used.  */
sep = '|'                                      /*�* "  separator     "      "  "   "    */
out =                                          /*�* "  output string  (so far).         */
eMode = 0                                        /*�*a flag,  escape is in progress.      */

do j=1  for length(str);  newV1=substr(str, j, 1)  /*�*parse a single character at a time.  */
if eMode   then do; out=out || newV1;  eMode=0;  iterate;  end   /*�*are we in escape mode? */
if newV1==esc  then do;                eMode=1;  iterate;  end   /*�*is it an escape char ? */
if newV1==sep  then do; call show;               iterate;  end   /*�* "  " a separator char?*/
out=out || newV1                                                 /*�*append the character.  */
end   /*�*j*/

if out\=='' | newV1==sep  then call show             /*�*handle a residual str or a separator.*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show:  say  '[length'right(length(out),4)"]"   out;             out=;               return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Tokenize-a-string-with-escaping\tokenize-a-string-with-escaping-1.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
