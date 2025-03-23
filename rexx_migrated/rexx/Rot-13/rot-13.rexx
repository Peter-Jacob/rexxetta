/*�*REXX program  encodes  several example text strings  using  the  ROT-13  algorithm.   */
newV1='foo'                         ; say "simple text=" newV1;  say 'rot-13 text=' rot13(newV1);  say
newV1='bar'                         ; say "simple text=" newV1;  say 'rot-13 text=' rot13(newV1);  say
newV1="Noyr jnf V, 'rer V fnj Ryon."; say "simple text=" newV1;  say 'rot-13 text=' rot13(newV1);  say
newV1='abc?  ABC!'                  ; say "simple text=" newV1;  say 'rot-13 text=' rot13(newV1);  say
newV1='abjurer NOWHERE'             ; say "simple text=" newV1;  say 'rot-13 text=' rot13(newV1);  say
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
rot13: return  translate( arg(1), 'abcdefghijklmABCDEFGHIJKLMnopqrstuvwxyzNOPQRSTUVWXYZ',,
"nopqrstuvwxyzNOPQRSTUVWXYZabcdefghijklmABCDEFGHIJKLM")
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Rot-13\rot-13.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
