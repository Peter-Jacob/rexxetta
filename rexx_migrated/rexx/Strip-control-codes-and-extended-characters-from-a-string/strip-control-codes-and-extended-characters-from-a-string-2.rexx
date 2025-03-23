/*�*REXX program strips all  "control codes"  from a character string  (ASCII or EBCDIC). */
x= 'string of ☺☻♥♦⌂, may include control characters and other    ♫☼�'b:bbbbbbbb4bB1C7B2B,bb,b���'
newV1=' !"#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghij' || ,
'klmnopqrstuvwxyz{|}~'
newV2=x                                              /*�*set "new" string to same as the old. */
do  until newV3=0;             newV3=verify(newV2, newV1)     /*�*check if  any  character isn't in  @.*/
if newV3\==0  then newV2=delstr(newV2, newV3, 1)              /*�*Is this a bad char?   Then delete it.*/
end   /*�*until*/                               /*�*stick a fork in it,  we're all done. */

say 'old = »»»' || x || "«««"                    /*�*add ««fence»» before & after old text*/
say 'new = »»»' || newV2 || "«««"                    /*�* "      "        "   "   "   new   " */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Strip-control-codes-and-extended-characters-from-a-string\strip-control-codes-and-extended-characters-from-a-string-2.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
