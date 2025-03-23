/*�*REXX program displays  (and also tests/verifies)  some numbers as  octets.            */
nums = x2d(200000)     x2d(1fffff)       2097172      2097151
newV2=words(nums)
say '  number       hex       octet    original'
say '══════════ ══════════ ══════════ ══════════'
ok=1
do j=1  for newV2;      newV1.j= word(nums,j)
onum.j=octet(newV1.j)
orig.j=  x2d( space(onum.j, 0) )
w=10
say center(newV1.j, w)     center(d2x(newV1.j), w)     center(onum.j, w)    center(orig.j, w)
if newV1.j\==orig.j  then ok=0
end   /*�*j*/
say
if ok  then say 'All '   newV2    " numbers are OK." /*�*all  of the numbers are   good.      */
else say "Some numbers are not OK."       /*�*some of the numbers are  ¬good.      */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
octet: procedure;  parse arg z,newV3                 /*�*obtain  Z  from the passed arguments.*/
x=d2x(z)                                  /*�*convert Z  to a hexadecimal octet.   */
do j=length(x)  by -2  to 1   /*�*process the  "little"  end first.    */
newV3= substr(x, j-1, 2, 0)   newV3   /*�*pad odd hexadecimal characters with  */
end   /*�*j*/                   /*�*           ···  a zero on the left.  */
return strip(newV3)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Variable-length-quantity\variable-length-quantity.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
