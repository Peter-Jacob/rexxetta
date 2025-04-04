/*ͺ*REXX program computes the  CRCβ32  (32 bit Cyclic Redundancy Check)  checksum  for a  */
/*ͺ*βββββββββββββββββββββββββββββββββgiven string  [as described in ISO 3309, ITUβT V.42].*/
call show  'The quick brown fox jumps over the lazy dog'               /*ͺ*the 1st string.*/
call show  'Generate CRC32 Checksum For Byte Array Example'            /*ͺ* "  2nd    "   */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
CRC_32: procedure; parse arg newV2,newV3; c= 'edb88320'x /*ͺ*2nd arg used for repeated invocations*/
f= 'ffFFffFF'x /*ͺ* [β]  build an  8βbit  indexed table,*/
do i=0  for 256;        z= d2c(i)      /*ͺ*                  one byte at a time.*/
r= right(z, 4, '0'x)                   /*ͺ*insure the  "R"   is thirtyβtwo bits.*/
/*ͺ* [β]  handle each rightmost byte bit.*/
do j=0  for 8;       rb= x2b(c2x(r)) /*ͺ*handle each bit of rightmost 8 bits. */
r= x2c( b2x(0 || left(rb, 31) ) )    /*ͺ*shift it right (an unsigned)  1  bit.*/
if right(rb,1)  then r= bitxor(r, c) /*ͺ*this is a bin bit for XOR gruntβwork.*/
end    /*ͺ*j*/
newV1.z= r                                 /*ͺ*assign to an eightβbit index table.  */
end      /*ͺ*i*/
newV3=bitxor( word(newV3 '0000000'x, 1), f)      /*ͺ*utilize the user's CRC or a default. */
do k=1  for length(newV2  )                /*ͺ*start number crunching the input data*/
newV4= bitxor(right(newV3,1),  substr(newV2,k,1) )
newV3= bitxor('0'x || left(newV3, 3),  newV1.newV4)
end   /*ͺ*k*/
return newV3                                 /*ͺ*return with cyclic redundancy check. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
show:   procedure;   parse arg Xstring;   numeric digits 12;      say;     say
checksum= bitxor(CRC_32(Xstring), 'ffFFffFF'x) /*ͺ*invoke CRC_32 to create a CRC. */
say center(' input string [length of' length(Xstring) "bytes] ", 79, 'β')
say Xstring;      say                          /*ͺ*show the string on its own line*/
say  "hex CRCβ32 checksum ="   c2x(checksum)     left('', 15),
"dec CRCβ32 checksum ="   c2d(checksum)   /*ͺ*show the CRCβ32 in hex and dec.*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\CRC-32\crc-32.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
