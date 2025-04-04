/*ช*REXX program "collapses" all immediately repeated characters in a string (or strings).*/
newV1.=                                              /*ช*define a default for the  @.  array. */
parse arg x                                      /*ช*obtain optional argument from the CL.*/
if x\=''  then      newV1.1= x                       /*ช*if user specified an arg, use that.  */
else do;  newV1.1=
newV1.2= '"If I were two-faced, would I be wearing this one?" --- Abraham Lincoln '
newV1.3=  ..1111111111111111111111111111111111111111111111111111111111111117777888
newV1.4= "I never give 'em hell, I just tell the truth, and they think it's hell. "
newV1.5= '                                                   ---  Harry S Truman  '
end

do j=1;    L= length(newV1.j)                   /*ช*obtain the length of an array element*/
say copies('โ', 105)                        /*ช*show a separator line between outputs*/
if j>1  &  L==0     then leave              /*ช*if arg is null and  J>1, then leave. */
new= collapse(newV1.j)
say 'string' word("isn't is",1+collapsible) 'collapsible' /*ช*display semaphore value*/
say '    length='right(L, 3)     "   input=ยซยซยซ"  ||  newV1.j  ||  'ยปยปยป'
w= length(new)
say '    length='right(w, 3)     "  output=ยซยซยซ"  ||  new  ||  'ยปยปยป'
end   /*ช*j*/
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
collapse: procedure expose collapsible; parse arg y 1 newV2 2  /*ช*get the arg; get 1st char. */
do k=2  to length(y)                 /*ช*traipse through almost all the chars.*/
newV3= substr(y, k, 1)                   /*ช*pick a character from  Y  (1st arg). */
if newV3==right(newV2, 1)  then iterate      /*ช*Is this the same character?  Skip it.*/
newV2= newV2 || newV3                            /*ช*append the character, it's different.*/
end   /*ช*j*/
collapsible= y\==newV2;       return newV2     /*ช*set boolean to  true  if collapsible.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Determine-if-a-string-is-collapsible\determine-if-a-string-is-collapsible.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
