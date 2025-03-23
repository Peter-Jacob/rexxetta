/*�*REXX program strips all  "control codes"  from a character string  (ASCII or EBCDIC). */
z= 'string of ☺☻♥♦⌂, may include control characters and other    ♫☼�'b:bbbbbbbb4bB1C7B2B,bb,b���'
newV1=' !"#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~'
newV2=
do j=1  for length(z);   newV3=substr(z, j, 1)    /*�*get a char from   X   one at a time. */
if verify(newV3, newV1)==0  then newV2=newV2 || newV3             /*�*Is char in the @ list?   Then use it.*/
end   /*�*j*/                                   /*�*stick a fork in it,  we're all done. */

say 'old = »»»'z"«««"                            /*�*add ««fence»» before & after old text*/
say 'new = »»»'newV2"«««"                            /*�* "      "        "   "   "   new   " */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Strip-control-codes-and-extended-characters-from-a-string\strip-control-codes-and-extended-characters-from-a-string-1.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
