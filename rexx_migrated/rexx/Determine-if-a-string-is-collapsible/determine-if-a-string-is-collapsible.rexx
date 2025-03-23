/*�*REXX program "collapses" all immediately repeated characters in a string (or strings).*/
newV1.=                                              /*�*define a default for the  @.  array. */
parse arg x                                      /*�*obtain optional argument from the CL.*/
if x\=''  then      newV1.1= x                       /*�*if user specified an arg, use that.  */
else do;  newV1.1=
newV1.2= '"If I were two-faced, would I be wearing this one?" --- Abraham Lincoln '
newV1.3=  ..1111111111111111111111111111111111111111111111111111111111111117777888
newV1.4= "I never give 'em hell, I just tell the truth, and they think it's hell. "
newV1.5= '                                                   ---  Harry S Truman  '
end

do j=1;    L= length(newV1.j)                   /*�*obtain the length of an array element*/
say copies('═', 105)                        /*�*show a separator line between outputs*/
if j>1  &  L==0     then leave              /*�*if arg is null and  J>1, then leave. */
new= collapse(newV1.j)
say 'string' word("isn't is",1+collapsible) 'collapsible' /*�*display semaphore value*/
say '    length='right(L, 3)     "   input=«««"  ||  newV1.j  ||  '»»»'
w= length(new)
say '    length='right(w, 3)     "  output=«««"  ||  new  ||  '»»»'
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
collapse: procedure expose collapsible; parse arg y 1 newV2 2  /*�*get the arg; get 1st char. */
do k=2  to length(y)                 /*�*traipse through almost all the chars.*/
newV3= substr(y, k, 1)                   /*�*pick a character from  Y  (1st arg). */
if newV3==right(newV2, 1)  then iterate      /*�*Is this the same character?  Skip it.*/
newV2= newV2 || newV3                            /*�*append the character, it's different.*/
end   /*�*j*/
collapsible= y\==newV2;       return newV2     /*�*set boolean to  true  if collapsible.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Determine-if-a-string-is-collapsible\determine-if-a-string-is-collapsible.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
