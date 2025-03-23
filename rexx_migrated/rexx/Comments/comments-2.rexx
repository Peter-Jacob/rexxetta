/*ª*REXX program to demonstrate various uses and types of comments. */

/*ª* everything between a "climbstar" and a "starclimb" (exclusive of literals) is
a comment.
climbstar =  /*ª*   [slash-asterisk]
starclimb =  */   [asterisk-slash]

/*ª* this is a nested comment, by gum! */
/*ª*so is this*/

Also, REXX comments can span multiple records.

There can be no intervening character between the slash and asterisk  (or
the asterisk and slash).  These two joined characters cannot be separated
via a continued line, as in the manner of:

say 'If I were twoâ”€faced,' ,
'would I be wearing this one?' ,
'      --- Abraham Lincoln'

Here comes the thingy that ends this REXX comment. â”€â”€â”€â”
â”‚
â”‚
â†“

*/

hour = 12       /*ª*high noon                   */
midnight = 00       /*ª*first hour of the day       */
suits = 1234     /*ª*card suits:   â™¥  â™¦  â™£  â™     */

hutchHdr = '/*ª*§
hutchEnd = "*/"

/*ª* the previous two "hutch" assignments aren't
the start  nor  the end of a REXX comment. */

x=1000000 **   /*ª*Â¡big power!*/   1000

/*ª*not a real good place for a comment (above),
but essentially, a REXX comment can be
anywhere whitespace is allowed.            */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Comments\comments-2.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
