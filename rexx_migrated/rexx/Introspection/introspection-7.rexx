if testxyz()  then say 'function XYZ not found.'
else say 'function XYZ was found.'
exit
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
testxyz: signal on syntax
call XYZ
return 0
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
syntax:  return 1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Introspection\introspection-7.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
