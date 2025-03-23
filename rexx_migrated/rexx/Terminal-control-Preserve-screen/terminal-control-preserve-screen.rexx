/*ª*REXX program saves the screen contents and also the cursor location,  then clears the */
/*ª*â”€â”€â”€â”€ screen, writes a half screen of ~~~ lines, and then restores the original screen.*/

parse value  scrsize()   with  sd  sw  .         /*ª*determine the size of terminal screen*/
parse value cursor(1,1)  with  curRow  curCol .  /*ª*also, find the location of the cursor*/

do original=1  for sd                  /*ª*obtain the original screen contents. */
newV1.original=scrRead(original,1, sw) /*ª*obtain a line of the terminal screen.*/
end   /*ª*original*/                     /*ª* [â†‘]  obtains  SD  number of lines.  */
'CLS'                                            /*ª*start with a clean slate on terminal.*/
do sd % 2                              /*ª*write a line of ~~~ for half of scr. */
say '~~~'                              /*ª*writes ~~~ starting at top of screen.*/
end   /*ª*sd % 2*/                       /*ª* [â†‘]  this shows ~~~ will be overlaid*/
/*ª*no need to clear the screen here.    */
do restore=1  for sd                   /*ª*restore original screen from  @line. */
call scrWrite restore,1, newV1.restore /*ª*write to terminal the original lines.*/
end   /*ª*restore*/                      /*ª* [â†‘]  writes (restores)  SD  lines.  */
/*ª*stick a fork in it,  we're all done. */
call cursor  curRow, curCol                      /*ª*restore the original cursor position.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Terminal-control-Preserve-screen\terminal-control-preserve-screen.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
