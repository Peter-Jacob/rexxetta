/*�*REXX program  strips  a string  delineated  by a  hash (#)   or   a  semicolon (;).   */
old1= ' apples, pears # and bananas'      ;      say '                 old ───►'old1"◄───"
new1= stripCom1(old1)                     ;      say '     1st version new ───►'new1"◄───"
new2= stripCom2(old1)                     ;      say '     2nd version new ───►'new2"◄───"
new3= stripCom3(old1)                     ;      say '     3rd version new ───►'new3"◄───"
new4= stripCom4(old1)                     ;      say '     4th version new ───►'new4"◄───"
say  copies('▒', 62)
old2= ' apples, pears ; and bananas'      ;      say '                 old ───►'old2"◄───"
new1= stripCom1(old2)                     ;      say '     1st version new ───►'new1"◄───"
new2= stripCom2(old2)                     ;      say '     2nd version new ───►'new2"◄───"
new3= stripCom3(old2)                     ;      say '     3rd version new ───►'new3"◄───"
new4= stripCom4(old2)                     ;      say '     4th version new ───►'new4"◄───"
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
stripCom1: procedure;   parse arg x              /*�*obtain the argument (the  X  string).*/
x=translate(x, '#', ";")              /*�*translate semicolons to a hash (#).  */
parse  var  x    x  '#'               /*�*parse the X string,  ending in hash. */
return strip(x)                       /*�*return the stripped shortened string.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
stripCom2: procedure;   parse arg x              /*�*obtain the argument (the  X  string).*/
d= ';#'                               /*�*this is the delimiter list to be used*/
d1=left(d,1)                          /*�*get the first character in delimiter.*/
x=translate(x,copies(d1,length(d)),d) /*�*translates delimiters ──►  1st delim.*/
parse  var  x    x  newV1              /*�*parse the string,  ending in a hash. */
return strip(x)                       /*�*return the stripped shortened string.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
stripCom3: procedure;   parse arg x              /*�*obtain the argument (the  X  string).*/
d= ';#'                               /*�*this is the delimiter list to be used*/
do j=1  for length(d) /*�*process each of the delimiters singly*/
newV3=substr(d,j,1)       /*�*use only one delimiter at a time.    */
parse  var  x  x  newV2 /*�*parse the  X  string for each delim. */
end   /*�*j*/           /*�* [↑]    (_)  means stop parsing at _ */
return strip(x)                       /*�*return the stripped shortened string.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
stripCom4: procedure;   parse arg x              /*�*obtain the argument (the  X  string).*/
d= ';#'                               /*�*this is the delimiter list to be used*/
do k=1  for length(d)        /*�*process each of the delimiters singly*/
p=pos(substr(d,k,1), x)      /*�*see if a delimiter is in the X string*/
if p\==0  then x=left(x,p-1) /*�*shorten the X string by one character*/
end   /*�*k*/                  /*�* [↑]  If p==0, then char wasn't found*/
return strip(x)                       /*�*return the stripped shortened string.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Strip-comments-from-a-string\strip-comments-from-a-string-1.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
