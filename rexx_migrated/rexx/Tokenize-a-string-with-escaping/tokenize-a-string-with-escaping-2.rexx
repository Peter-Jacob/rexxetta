/*ช*REXX program demonstrates tokenizing and displaying a string with escaping sequences. */
str = 'one^|uno||three^^^^|four^^^|^cuatro|'   /*ช*the character string to be tokenized.*/
esc = '^'                                      /*ช* "    escape  character to be used.  */
sep = '|'                                      /*ช* "  separator     "      "  "   "    */
newV1   =                                          /*ช* "  output string  (so far).         */
eMode = 0                                        /*ช*a flag,  escape is in progress.      */
say ' output len        output'                  /*ช*title  verbiage  used for the output.*/
say 'โโโโโโโโโโโโ โโโโโโโโโโโโโโโโโโโโ'          /*ช*  "    separator   "   "   "     "   */

do j=1  for length(str);  newV2=substr(str, j, 1)  /*ช*parse a single character at a time.  */
select
when eMode   then do; newV1=newV1 || newV2;  eMode=0; end      /*ช*are we in in escape  mode?   */
when newV2==esc  then                eMode=1           /*ช*is it an  escape  character? */
when newV2==sep  then do; call show;          end      /*ช* "  " a separator character? */
otherwise             newV1=newV1 || newV2                     /*ช*append the single character. */
end   /*ช*select*/
end       /*ช*j*/

if newV1\=='' | newV2==sep  then call show               /*ช*handle a residual str or a separator.*/
say 'โโโโโโโโโโโโ โโโโโโโโโโโโโโโโโโโโ'          /*ช*the foot separator for the output.   */
say '             ยทยทยทยท^ยทยทยทยท1ยทยทยทยท^ยทยทยทยท2'          /*ช*show the    top    part of the scale.*/
say '  {scale}    12345678901234567890'          /*ช*  "   "    bottom    "   "  "    "   */
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
show:  say  '[length'right(length(newV1),4)"]"   newV1;                 newV1=;                 return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Tokenize-a-string-with-escaping\tokenize-a-string-with-escaping-2.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
