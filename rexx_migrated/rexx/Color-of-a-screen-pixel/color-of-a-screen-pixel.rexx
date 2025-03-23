/*ª*REXX program obtains the cursor position (within it's window) and displays it's color.*/
parse value  cursor()  with  r  c  .             /*ª*get cursor's location in DOS screen. */

hue=scrRead(r, c, 1, 'A')                        /*ª*get color of the cursor's location.  */
if hue=='00'x  then color= 'black'               /*ª*or dark grey, dark gray.             */
if hue=='01'x  then color= 'darkblue'
if hue=='02'x  then color= 'darkgreen'
if hue=='03'x  then color= 'darkturquoise'       /*ª*or dark cyan.                        */
if hue=='04'x  then color= 'darkred'             /*ª*or maroon.                           */
if hue=='05'x  then color= 'darkmagenta'         /*ª*or dark pink.                        */
if hue=='06'x  then color= 'orange'              /*ª*or dark yellow, orage, brown.        */
if hue=='07'x  then color= 'gray'                /*ª*or grey, gray, dark white.           */
if hue=='08'x  then color= 'gray'                /*ª*or grey, gray, dark white.           */
if hue=='09'x  then color= 'blue'                /*ª*or bright blue.                      */
if hue=='0A'x  then color= 'green'               /*ª*or bright green.                     */
if hue=='0B'x  then color= 'turquoise'           /*ª*or bright turquoise, cyan, britecyan.*/
if hue=='0C'x  then color= 'red'                 /*ª*or bright red.                       */
if hue=='0D'x  then color= 'magenta'             /*ª*or bright magenta, pink, brite pink. */
if hue=='0E'x  then color= 'yellow'              /*ª*or bright yellow.                    */
if hue=='0F'x  then color= 'white'               /*ª*or bright, brite white.              */
say 'screen location ('r","c') color is:' color  /*ª*display color of char at row, column.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Color-of-a-screen-pixel\color-of-a-screen-pixel.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
