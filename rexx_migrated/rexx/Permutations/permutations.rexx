/*�*REXX pgm generates/displays all permutations of N different objects taken M at a time.*/
parse arg things bunch inbetweenChars names      /*�*obtain optional arguments from the CL*/
if things=='' | things==","  then things= 3      /*�*Not specified?  Then use the default.*/
if  bunch=='' |  bunch==","  then  bunch= things /*�* "      "         "   "   "     "    */
/*�* ╔════════════════════════════════════════════════════════════════╗ */
/*�* ║  inBetweenChars  (optional)   defaults to a  [null].           ║ */
/*�* ║           names  (optional)   defaults to digits (and letters).║ */
/*�* ╚════════════════════════════════════════════════════════════════╝ */
call permSets things, bunch, inBetweenChars, names
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
p:        return word( arg(1), 1)                /*�*P  function (Pick first arg of many).*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
permSets: procedure; parse arg x,y,between,uSyms /*�*X    things taken    Y    at a time. */
newV5.=;       sep=                        /*�*X  can't be  >  length(@0abcs).      */
newV4  = 'abcdefghijklmnopqrstuvwxyz';     newV2=  newV4;          upper newV2
newV3 = newV2 || newV4;                    newV1= 123456789  ||  newV3

do k=1  for x                        /*�*build a list of permutation symbols. */
newV7= p(word(uSyms, k)  p(substr(newV1, k, 1) k) )    /*�*get/generate a symbol.*/
if length(newV7)\==1  then sep= '_'      /*�*if not 1st character,  then use sep. */
newV6.k= newV7                               /*�*append the character to symbol list. */
end   /*�*k*/

if between==''  then between= sep      /*�*use the appropriate separator chars. */
call .permSet 1                        /*�*start with the  first  permutation.  */
return                                 /*�* [↓]  this is a recursive subroutine.*/
.permSet: procedure expose newV6. newV5. between x y;       parse arg newV8
if newV8>y  then do;  newV7= newV5.1;      do j=2  for y-1
newV7= newV7  ||  between  ||  newV5.j
end   /*�*j*/
say newV7
end
else do q=1  for x             /*�*build the  permutation  recursively. */
do k=1 for newV8-1;  if newV5.k==newV6.q  then iterate q
end   /*�*k*/
newV5.newV8= newV6.q;         call .permSet newV8+1
end     /*�*q*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Permutations\permutations.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
