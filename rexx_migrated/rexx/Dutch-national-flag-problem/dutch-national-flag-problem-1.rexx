/*�*REXX program reorders a set of random colored balls into a correct order, which is the*/
/*�*────────────────────────────────── order of colors on the Dutch flag:  red white blue.*/
parse arg N colors                               /*�*obtain optional arguments from the CL*/
if N='' |  N=","  then N=15                      /*�*Not specified?  Then use the default.*/
if colors=''  then colors= 'red white blue'      /*�* "      "         "   "   "      "   */
newV1=words(colors)                                  /*�*count the number of colors specified.*/
newV2=word(colors, newV1)    word(colors, 1)             /*�*ensure balls aren't already in order.*/

do g=3  to N                                 /*�*generate a random # of colored balls.*/
newV2=newV2  word( colors, random(1, newV1) )            /*�*append a random color to the  @ list.*/
end   /*�*g*/

say 'number of colored balls generated = '   N       ;  say
say center(' original ball order ', length(newV2), "─")
say newV2                                                ;  say
newV3=;                          do j=1  for newV1;
newV4=word(colors, j);      newV3=newV3  copies(newV4' ',   countWords(newV4, newV2))
end   /*�*j*/
say
say center(' sorted  ball order ', length(newV2), "─")
say space(newV3)
say
do k=2  to  N                                /*�*verify the balls are in correct order*/
if wordpos(word(newV3,k), colors) >= wordpos(word(newV3,k-1), colors)  then iterate
say "The list of sorted balls isn't in proper order!";         exit 13
end   /*�*k*/
say
say 'The sorted colored ball list has been confirmed as being sorted correctly.'
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
countWords:  procedure;   parse arg newV5,hay;  s=1
do r=0  until newV4==0;  newV4=wordpos(newV5, hay, s);  s=newV4+1;  end /*�*r*/;  return r
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Dutch-national-flag-problem\dutch-national-flag-problem-1.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
