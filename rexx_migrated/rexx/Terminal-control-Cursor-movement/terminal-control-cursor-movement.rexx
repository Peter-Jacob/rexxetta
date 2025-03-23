/*ª*REXX pgm demonstrates how to achieve movement of the terminal cursor. */

parse value scrsize() with sd sw       /*ª*find the display screen size.  */
parse value cursor() with row col      /*ª*find where the cursor is now.  */

colL=col-1;  if colL==0 then colL=sw   /*ª*prepare to move cursor to left.*/
call cursor row,colL                   /*ª*move cursor to the left (wrap).*/

colR=col+1;  if colR>sw then colL=1    /*ª*prepare to move cursor to right*/
call cursor row,colR                   /*ª*move cursor to the right (wrap)*/

rowU=row-1;  if rowU==0 then rowU=sd   /*ª*prepare to move cursor up.     */
call cursor rowU,col                   /*ª*move cursor  up  (with wrap).  */

rowD=row+1;  if rowD>sd then rowD=1    /*ª*prepare to move cursor down.   */
call cursor rowD,col                   /*ª*move cursor down (with wrap).  */

call cursor row,1                      /*ª*move cursor to beginning of row*/
call cursor row,sw                     /*ª*move cursor to    end    of row*/
call cursor 1,1                        /*ª*move cursor to top left corner.*/
call cursor sd,sw                      /*ª*move cursor to bot right corner*/

/*ª*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Terminal-control-Cursor-movement\terminal-control-cursor-movement.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
