...
signal on error
signal on failure
signal on halt
signal on lostdigits      /*�*newer REXXes.*/
signal on notready
signal on novalue
signal on syntax

signal off error
signal off failure
signal off halt
signal off lostdigits     /*�*newer REXXes.*/
signal off notready
signal off novalue
signal off syntax
...
signal on novalue
...
x=oopsay+1                /*�* ◄─── this is it.*/
exit

novalue: say
say '───────────────────────────error!─────────────────────────────────'
say 'that reference to  oopsay  (above) will cause control to get here.'
parse source . . fid .
say;  say  'REXX raised a NOVALUE error in program:' fid
say;  say  'it occurred on line' sigl
say;  say  'the REXX statement is:'     /*�*put it on separate line.*/
say  sourceline(sigl)
say;  say  'which code:' condition('C') "error"
say;  say  'REXX variable:' condition('D')
say;  say  "Moral: shouldn't do that."
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Flow-control-structures\flow-control-structures-11.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
