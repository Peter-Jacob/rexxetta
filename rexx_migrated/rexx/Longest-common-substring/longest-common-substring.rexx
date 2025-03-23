/*�*REXX program determines the   LCSUBSTR   (Longest Common Substring)  via a function.  */
parse arg a b .                                  /*�*obtain optional arguments from the CL*/
if a==''  then a= "thisisatest"                  /*�*Not specified?  Then use the default.*/
if b==''  then b= "testing123testing"            /*�* "      "         "   "     "    "   */
say '   string A ='            a                 /*�*echo string A to the terminal screen.*/
say '   string B ='               b              /*�*  "     "   B  "  "      "       "   */
say '   LCsubstr ='   LCsubstr(a, b)             /*�*display the Longest Common Substring.*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
LCsubstr: procedure;  parse arg x,y,,newV1;     newV2= 0 /*�*LCsubstr:  Longest Common Substring. */
L= length(x);     w= length(y)         /*�*placeholders for string length of X,Y*/
if w<L  then do;  parse arg y,x;  L= w /*�*switch X & Y   if Y is shorter than X*/
end
do j=1  for L  while j<=L-newV2         /*�*step through start points in string X*/
do k=L-j+1   to newV2   by -1        /*�*step through string lengths.         */
newV3= substr(x, j, k)               /*�*extract a possible common substring. */
if pos(newV3, y)\==0  then  if k>newV2  then do;     newV1= newV3;     newV2= k;      end
end   /*�*k*/                      /*�* [↑]  determine if string _ is longer*/
end      /*�*j*/                      /*�*#:  the current length of  $  string.*/
return newV1                               /*�*$:  (null if there isn't common str.)*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Longest-common-substring\longest-common-substring.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
