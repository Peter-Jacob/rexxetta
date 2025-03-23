/*�*REXX program counts and displays the number of textonyms that are in a dictionary file*/
parse arg iFID .                                 /*�*obtain optional fileID from the C.L. */
if iFID=='' | iFID=="," then iFID='UNIXDICT.TXT' /*�*Not specified?  Then use the default.*/
newV3.= 0                                            /*�*the placeholder of digit combinations*/
newV4.=;       newV5.=                                   /*�*sparse array of textonyms;  words.   */
alphabet= 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'           /*�*the supported alphabet to be used.   */
digitKey=  22233344455566677778889999            /*�*translated alphabet to digit keys.   */
digKey= 0;                 newV1= 0              /*�*number digit combinations; word count*/
ills= 0 ;    dups= 0;    longest= 0;   mostus= 0 /*�*illegals; duplicated words; longest..*/
first=. ;    last= .;       long= 0;   most=   0 /*�*first, last, longest, most counts.   */
call linein  iFID, 1, 0                          /*�*point to the first char in dictionary*/
newV6= 0                                             /*�*number of textonyms in file (so far).*/

do while  lines(iFID)\==0;     x= linein(iFID) /*�*keep reading the file until exhausted*/
y= x;     upper x                              /*�*save a copy of  X;    uppercase  X.  */
if \datatype(x, 'U')  then do;  ills= ills + 1;  iterate;  end     /*�*Not legal?  Skip.*/
if newV5.x==.             then do;  dups= dups + 1;  iterate;  end     /*�*Duplicate?  Skip.*/
newV5.x= .                                         /*�*indicate that it's a righteous word. */
newV1= newV1 + 1                               /*�*bump the word count  (for the file). */
z= translate(x, digitKey, alphabet)            /*�*build a translated digit key word.   */
newV3.z= newV3.z + 1                                   /*�*flag that the digit key word exists. */
newV4.z= newV4.z  y;        newV7= words(newV4.z)              /*�*build list of equivalent digit key(s)*/

if newV7>most  then do; mostus= z;  most= newV7;  end  /*�*remember the  "mostus"  digit keys.  */

if newV3.z==2  then do; newV6= newV6 + 1                   /*�*bump the count of the  textonyms.    */
if first==.   then first=z /*�*the first textonym found.            */
last= z                    /*�* "   last     "      "               */
newV7= length(newV4.z)             /*�*the length (# chars) of the digit key*/
if newV7>longest  then long= z /*�*is this the  longest  textonym ?     */
longest= max(newV7, longest)   /*�*now, use this length as a target/goal*/
end                            /*�* [↑]  discretionary  (extra credit). */

if newV3.z==1  then digKey= digKey + 1             /*�*bump the count of digit key words.   */
end   /*�*while*/

newV2= 'in the dictionary file'                  /*�*literal used for some displayed text.*/
L= length(commas(max(newV1,ills,dups,digKey,newV6))) /*�*find length of max # being displayed.*/
say 'The dictionary file being used is: '   iFID
say
call tell newV1,  'words'                                           newV2,
"which can be represented by digit key mapping"
if ills>0  then call tell ills,   'word's(ills)  "that contain illegal characters"  newV2
if dups>0  then call tell dups,   'duplicate word's(dups)  "detected"               newV2
call tell digKey, 'combination's(digKey)   "required to represent them"
call tell      newV6, 'digit combination's(newV6)  "that can represent Textonyms"
say
if first \== .  then say '    first digit key='   newV4.first
if  last \== .  then say '     last digit key='   newV4.last
if  long \== 0  then say '  longest digit key='   newV4.long
if  most \== 0  then say ' numerous digit key='   newV4.mostus   " ("most   'words)'
exit newV6                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: parse arg newV7;  do jc=length(newV7)-3  to 1  by -3; newV7=insert(',', newV7, jc); end;  return newV7
tell:   arg newV6newV6; say 'There are ' right(commas(newV6newV6), L)' ' arg(2).; return   /*�*commatize #*/
s:      if arg(1)==1  then return '';      return "s"             /*�*a simple pluralizer.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Textonyms\textonyms.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
