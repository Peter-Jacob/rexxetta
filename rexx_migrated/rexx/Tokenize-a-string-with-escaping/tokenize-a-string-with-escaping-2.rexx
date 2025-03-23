/*�*REXX program demonstrates tokenizing and displaying a string with escaping sequences. */
str = 'one^|uno||three^^^^|four^^^|^cuatro|'   /*�*the character string to be tokenized.*/
esc = '^'                                      /*�* "    escape  character to be used.  */
sep = '|'                                      /*�* "  separator     "      "  "   "    */
newV1   =                                          /*�* "  output string  (so far).         */
eMode = 0                                        /*�*a flag,  escape is in progress.      */
say ' output len        output'                  /*�*title  verbiage  used for the output.*/
say '──────────── ────────────────────'          /*�*  "    separator   "   "   "     "   */

do j=1  for length(str);  newV2=substr(str, j, 1)  /*�*parse a single character at a time.  */
select
when eMode   then do; newV1=newV1 || newV2;  eMode=0; end      /*�*are we in in escape  mode?   */
when newV2==esc  then                eMode=1           /*�*is it an  escape  character? */
when newV2==sep  then do; call show;          end      /*�* "  " a separator character? */
otherwise             newV1=newV1 || newV2                     /*�*append the single character. */
end   /*�*select*/
end       /*�*j*/

if newV1\=='' | newV2==sep  then call show               /*�*handle a residual str or a separator.*/
say '──────────── ────────────────────'          /*�*the foot separator for the output.   */
say '             ····^····1····^····2'          /*�*show the    top    part of the scale.*/
say '  {scale}    12345678901234567890'          /*�*  "   "    bottom    "   "  "    "   */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show:  say  '[length'right(length(newV1),4)"]"   newV1;                 newV1=;                 return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Tokenize-a-string-with-escaping\tokenize-a-string-with-escaping-2.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
