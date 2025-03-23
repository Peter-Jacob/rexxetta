/*ª*REXX program strips all  "control codes"  from a character string  (ASCII or EBCDIC). */
x= 'string of â˜ºâ˜»â™¥â™¦âŒ‚, may include control characters and other    â™«â˜¼Â'b:bbbbbbbb4bB1C7B2B,bb,béìë®'
newV1=' !"#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghij' || ,
'klmnopqrstuvwxyz{|}~'
newV2=x                                              /*ª*set "new" string to same as the old. */
do  until newV3=0;             newV3=verify(newV2, newV1)     /*ª*check if  any  character isn't in  @.*/
if newV3\==0  then newV2=delstr(newV2, newV3, 1)              /*ª*Is this a bad char?   Then delete it.*/
end   /*ª*until*/                               /*ª*stick a fork in it,  we're all done. */

say 'old = Â»Â»Â»' || x || "Â«Â«Â«"                    /*ª*add Â«Â«fenceÂ»Â» before & after old text*/
say 'new = Â»Â»Â»' || newV2 || "Â«Â«Â«"                    /*ª* "      "        "   "   "   new   " */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Strip-control-codes-and-extended-characters-from-a-string\strip-control-codes-and-extended-characters-from-a-string-2.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
