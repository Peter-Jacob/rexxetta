/*ช*REXX program "squeezes" all immediately repeated characters in a string (or strings). */
newV1.=                                              /*ช*define a default for the  @.  array. */
newV2.1= ' '; newV1.1=
newV2.2= '-'; newV1.2= '"If I were two-faced, would I be wearing this one?" --- Abraham Lincoln '
newV2.3= '7'; newV1.3=  ..1111111111111111111111111111111111111111111111111111111111111117777888
newV2.4=  . ; newV1.4= "I never give 'em hell, I just tell the truth, and they think it's hell. "
newV2.5= ' '; newV1.5= '                                                   ---  Harry S Truman  '
newV2.6= '-'; newV1.6= newV1.5
newV2.7= 'r'; newV1.7= newV1.5

do j=1;    L= length(newV1.j)                   /*ช*obtain the length of an array element*/
say copies('โ', 105)                        /*ช*show a separator line between outputs*/
if j>1  &  L==0     then leave              /*ช*if arg is null and  J>1, then leave. */
say '    specified immediate repeatable character='     newV2.j      "   ('"c2x(newV2.j)"'x)"
say '    length='right(L, 3)     "   input=ยซยซยซ" || newV1.j || 'ยปยปยป'
new= squeeze(newV1.j, newV2.j)
w= length(new)
say '    length='right(w, 3)     "  output=ยซยซยซ" || new || 'ยปยปยป'
end   /*ช*j*/
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
squeeze: procedure; parse arg y 1 newV3 2,z          /*ช*get string; get immed. repeated char.*/
if pos(z || z, y)==0  then return y     /*ช*No repeated immediate char?  Return Y*/
/*ช* [โ]  Not really needed;  a speedโup.*/
do k=2  to length(y)        /*ช*traipse through almost all the chars.*/
newV4= substr(y, k, 1)                      /*ช*pick a character from  Y */
if newV4==right(newV3, 1) & newV4==z then iterate   /*ช*Same character?  Skip it.*/
newV3= newV3 || newV4                               /*ช*append char., it's diff. */
end     /*ช*j*/
return newV3
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Determine-if-a-string-is-squeezable\determine-if-a-string-is-squeezable.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
