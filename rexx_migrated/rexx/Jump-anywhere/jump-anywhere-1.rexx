/*ª*REXX pgm demonstrates various jumps (GOTOs).  In REXX, it's a SIGNAL. */
say 'starting...'
signal aJump
say 'this statement is never executed.'

aJump:  say 'and here we are at aJump.'
do j=1  to 10
say  'j=' j
if j==7 then signal bJump
end  /*ª*j*/
bJump:  say 'and here we are at bJump.'

signal cJump
say 'this statement is never executed.'
do k=1 to 10
say 'k=' k
cJump:  say 'and here we are at cJump.'
exit
end  /*ª*k*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Jump-anywhere\jump-anywhere-1.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
