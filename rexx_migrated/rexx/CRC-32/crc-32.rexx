/*�*REXX program computes the  CRC─32  (32 bit Cyclic Redundancy Check)  checksum  for a  */
/*�*─────────────────────────────────given string  [as described in ISO 3309, ITU─T V.42].*/
call show  'The quick brown fox jumps over the lazy dog'               /*�*the 1st string.*/
call show  'Generate CRC32 Checksum For Byte Array Example'            /*�* "  2nd    "   */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
CRC_32: procedure; parse arg newV2,newV3; c= 'edb88320'x /*�*2nd arg used for repeated invocations*/
f= 'ffFFffFF'x /*�* [↓]  build an  8─bit  indexed table,*/
do i=0  for 256;        z= d2c(i)      /*�*                  one byte at a time.*/
r= right(z, 4, '0'x)                   /*�*insure the  "R"   is thirty─two bits.*/
/*�* [↓]  handle each rightmost byte bit.*/
do j=0  for 8;       rb= x2b(c2x(r)) /*�*handle each bit of rightmost 8 bits. */
r= x2c( b2x(0 || left(rb, 31) ) )    /*�*shift it right (an unsigned)  1  bit.*/
if right(rb,1)  then r= bitxor(r, c) /*�*this is a bin bit for XOR grunt─work.*/
end    /*�*j*/
newV1.z= r                                 /*�*assign to an eight─bit index table.  */
end      /*�*i*/
newV3=bitxor( word(newV3 '0000000'x, 1), f)      /*�*utilize the user's CRC or a default. */
do k=1  for length(newV2  )                /*�*start number crunching the input data*/
newV4= bitxor(right(newV3,1),  substr(newV2,k,1) )
newV3= bitxor('0'x || left(newV3, 3),  newV1.newV4)
end   /*�*k*/
return newV3                                 /*�*return with cyclic redundancy check. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show:   procedure;   parse arg Xstring;   numeric digits 12;      say;     say
checksum= bitxor(CRC_32(Xstring), 'ffFFffFF'x) /*�*invoke CRC_32 to create a CRC. */
say center(' input string [length of' length(Xstring) "bytes] ", 79, '═')
say Xstring;      say                          /*�*show the string on its own line*/
say  "hex CRC─32 checksum ="   c2x(checksum)     left('', 15),
"dec CRC─32 checksum ="   c2d(checksum)   /*�*show the CRC─32 in hex and dec.*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\CRC-32\crc-32.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
