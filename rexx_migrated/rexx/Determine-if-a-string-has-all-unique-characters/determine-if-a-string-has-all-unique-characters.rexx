/*�*REXX pgm determines if a string is comprised of all unique characters (no duplicates).*/
newV1.=                                              /*�*assign a default for the  @.  array. */
parse arg newV1.1                                    /*�*obtain optional argument from the CL.*/
if newV1.1=''  then do;   newV1.1=                       /*�*Not specified?  Then assume defaults.*/
newV1.2= .
newV1.3= 'abcABC'
newV1.4= 'XYZ ZYX'
newV1.5= '1234567890ABCDEFGHIJKLMN0PQRSTUVWXYZ'
end

do j=1;  if j\==1  &  newV1.j==''  then leave   /*�*String is null & not j=1?  We're done*/
say copies('─', 79)                         /*�*display a separator line  (a fence). */
say 'Testing for the string (length' length(newV1.j)"): "   newV1.j
say
dup= isUnique(newV1.j)
say 'The characters in the string'   word("are aren't", 1 + (dup>0) )  'all unique.'
if dup==0  then iterate
newV2= substr(newV1.j, dup, 1)
say 'The character '  newV2  " ('"c2x(newV2)"'x)  at position "  dup ,
' is repeated at position '  pos(newV2, newV1.j, dup+1)
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
isUnique: procedure; parse arg x                          /*�*obtain the character string.*/
do k=1  to length(x) - 1           /*�*examine all but the last.   */
p= pos( substr(x, k, 1), x, k + 1) /*�*see if the Kth char is a dup*/
if p\==0  then return k            /*�*Find a dup? Return location.*/
end   /*�*k*/
return 0                                        /*�*indicate all chars unique.  */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Determine-if-a-string-has-all-unique-characters\determine-if-a-string-has-all-unique-characters.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
