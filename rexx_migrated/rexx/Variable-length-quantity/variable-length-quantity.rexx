/*ช*REXX program displays  (and also tests/verifies)  some numbers as  octets.            */
nums = x2d(200000)     x2d(1fffff)       2097172      2097151
newV2=words(nums)
say '  number       hex       octet    original'
say 'โโโโโโโโโโ โโโโโโโโโโ โโโโโโโโโโ โโโโโโโโโโ'
ok=1
do j=1  for newV2;      newV1.j= word(nums,j)
onum.j=octet(newV1.j)
orig.j=  x2d( space(onum.j, 0) )
w=10
say center(newV1.j, w)     center(d2x(newV1.j), w)     center(onum.j, w)    center(orig.j, w)
if newV1.j\==orig.j  then ok=0
end   /*ช*j*/
say
if ok  then say 'All '   newV2    " numbers are OK." /*ช*all  of the numbers are   good.      */
else say "Some numbers are not OK."       /*ช*some of the numbers are  ยฌgood.      */
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
octet: procedure;  parse arg z,newV3                 /*ช*obtain  Z  from the passed arguments.*/
x=d2x(z)                                  /*ช*convert Z  to a hexadecimal octet.   */
do j=length(x)  by -2  to 1   /*ช*process the  "little"  end first.    */
newV3= substr(x, j-1, 2, 0)   newV3   /*ช*pad odd hexadecimal characters with  */
end   /*ช*j*/                   /*ช*           ยทยทยท  a zero on the left.  */
return strip(newV3)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Variable-length-quantity\variable-length-quantity.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
