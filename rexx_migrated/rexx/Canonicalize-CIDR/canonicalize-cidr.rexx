/*ͺ*REXX pgm canonicalizes IPv4 addresses that are in CIDR notation  (dottedβdec/network).*/
parse arg a .                                    /*ͺ*obtain optional argument from the CL.*/
if a=='' | a==","  then a= '87.70.141.1/22'    , /*ͺ*Not specified?  Then use the defaults*/
'36.18.154.103/12'  ,
'62.62.197.11/29'   ,
'67.137.119.181/4'  ,
'161.214.74.21/24'  ,
'184.232.176.184/18'

do i=1  for words(a);  z= word(a, i)         /*ͺ*process each IPv4 address in the list*/
parse var   z    newV2  '/'  -0  mask            /*ͺ*get the address nodes & network mask.*/
newV2= subword( translate(newV2, , .)  0 0 0, 1, 4)  /*ͺ*elide dots from addr, ensure 4 nodes.*/
newV3= newV2                                         /*ͺ*use original node address (for now). */
hb= 32 - substr(word(mask .32, 1), 2)        /*ͺ*obtain the size of the host bits.    */
newV3=;                          newV1=             /*ͺ*crop the host bits only if mask βξεχΦ³ 32.*/
do k=1  for 4;        newV4= word(newV2, k)  /*ͺ*create a 32-bit (binary) IPv4 address*/
newV1= newV1  ||  right(d2b(newV4), 8, 0)      /*ͺ*append eight bits of the   "     "   */
end   /*ͺ*k*/                          /*ͺ* [β] ... and ensure a node is 8 bits.*/
newV1= left(newV1, 32-hb, 0)                       /*ͺ*crop bits in host part of IPv4 addr. */
newV1= left(newV1, 32,    0)                       /*ͺ*replace cropped bits with binary '0's*/
do j=8  by 8  for 4                  /*ͺ* [β]  parse the four nodes of address*/
newV3= newV3 || . || b2d(substr(newV1, j-7, 8)) /*ͺ*reconstitute the decimal nodes.      */
end   /*ͺ*j*/                          /*ͺ* [β]  and insert a dot between nodes.*/
say                                          /*ͺ*introduce a blank line between IPv4's*/
newV3= substr(newV3, 2)                              /*ͺ*elid the leading decimal point in  $ */
say '   original IPv4 address: '  z          /*ͺ*display the original  IPv4  address. */
say '   canonicalized address: '  translate( space(newV3), ., " ")mask  /*ͺ*canonicalized.*/
end   /*ͺ*i*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
b2d: return  x2d( b2x( arg(1) ) )  +  0          /*ͺ*convert binary  ββββΊ  decimal number.*/
d2b: return  x2b( d2x( arg(1) ) )  +  0          /*ͺ*   "    decimal ββββΊ   binary    "   */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Canonicalize-CIDR\canonicalize-cidr.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
