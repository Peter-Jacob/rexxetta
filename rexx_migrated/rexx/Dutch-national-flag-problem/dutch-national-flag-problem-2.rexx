/*�*REXX program reorders a set of random colored balls into a correct order, which is the*/
/*�*────────────────────────────────── order of colors on the Dutch flag:  red white blue.*/
parse arg N colors                               /*�*obtain optional arguments from the CL*/
if N='' |  N=","  then N=15                      /*�*Not specified?  Then use the default.*/
if colors=''      then colors= "RWB"             /*�*use default:  R=red, W=white, B=blue */
newV1=length(colors)                                 /*�*count the number of colors specified.*/
newV2=right(colors, 1)left(colors, 1)                /*�*ensure balls aren't already in order.*/

do g=3  to N                                 /*�*generate a random # of colored balls.*/
newV2=newV2 ||substr( colors, random(1, newV1), 1)       /*�*append a color (1char) to the @ list.*/
end   /*�*g*/

say 'number of colored balls generated = '    N      ;    say
say center(' original ball order ', max(30,2*newV1), "─")
say newV2                                                ;    say
newV3=;                          do j=1  for newV1;             newV4=substr(colors, j, 1)
newV1=length(newV2) - length( space( translate(newV2, , newV4),   0) )
newV3=newV3 || copies(newV4, newV1)
end   /*�*j*/
say center(' sorted  ball order ', max(30, 2*newV1), "─")
say newV3
say
do k=2  to N                                 /*�*verify the balls are in correct order*/
if pos(substr(newV3,k,1), colors) >= pos(substr(newV3,k-1,1), colors)  then iterate
say "The list of sorted balls isn't in proper order!";         exit 13
end   /*�*k*/
say
say 'The sorted colored ball list has been confirmed as being sorted correctly.'
exit                                             /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Dutch-national-flag-problem\dutch-national-flag-problem-2.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
