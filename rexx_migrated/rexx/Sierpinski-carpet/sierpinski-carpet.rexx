/*ª*REXX program draws any order Sierpinski carpet (order 20 would be â‰ˆ 3.4Gx3.4G carpet).*/
parse arg N char .                               /*ª*get the  order  of the carpet.       */
if N==''  |  N==","  then    N= 3                /*ª*if none specified, then assume  3.   */
if char==''          then char= "*"              /*ª*use the default of an asterisk  (*). */
if length(char)==2   then char= x2c(char)        /*ª*it was specified in hexadecimal char.*/
if length(char)==3   then char= d2c(char)        /*ª* "  "      "      " decimal character*/
width= linesize()                                /*ª*the width of the terminal screen.    */
if N>18  then numeric digits 100                 /*ª*just in case the user went  kaâ”€razy. */
nnn= 3**N                                        /*ª* [â†“]  NNN  is the  cube of  N.       */

do   j=0  for nnn;    z=                       /*ª*Z:  will be the line to be displayed.*/
do k=0  for nnn;   jj= j;   kk= k;   x= char
do  while  jj\==0  &  kk\==0               /*ª*one symbol for a  not (Â¬)  is a   \  */
if jj//3==1  then if kk//3==1  then do     /*ª*in REXX:    //  â‰¡  division remainder*/
x= ' ' /*ª*use a blank for this display line.   */
leave  /*ª*LEAVE   terminates this   DO  WHILE. */
end
jj= jj % 3;          kk= kk % 3            /*ª*in REXX:     %  â‰¡  integer division. */
end   /*ª*while*/

z= z || x                                    /*ª*X      is either   black  or  white. */
end     /*ª*k*/                                /*ª* [â†‘]    "    "       "     "  blank. */

if length(z)<width  then say z                 /*ª*display the line if it fits on screen*/
call lineout 'Sierpinski.'N, z                 /*ª*also, write the line to a (disk) file*/
end       /*ª*j*/                                /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sierpinski-carpet\sierpinski-carpet.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
