/*�*REXX pgm encodes/decodes/displays ASCII character strings as  (7─bits)  binary string.*/
parse arg newV1;        if newV1==''  then newV1= 'STRING'   /*�*get optional argument; Use default ? */
say '   input string=' newV1                         /*�*display the input string to terminal.*/
out= comp(newV1);       say ' encoded string='  out  /*�*encode─► 7─bit binary string; display*/
ori= dcomp(out);    say ' decoded string='  ori  /*�*decode─► 8─bit char      "  ;    "   */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
comp:  parse arg x; z=;   do j=1  for length(x)  /*�*convert─►right-justified 7-bit binary*/
z= z || right( x2b( c2x( substr(x, j, 1) )), 7)
end   /*�*j*/;     L= length(z);  return left(z, L+(8-L//8)//8, 0)
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
dcomp: parse arg x; z=;   do k=1  by 7  to length(x);        newV2= substr(x, k, 7)
if right(newV2, 1)==' '  then leave;   z= z || x2c( b2x(0 || newV2) )
end   /*�*k*/;     return z
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Bitwise-IO\bitwise-io-2.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
