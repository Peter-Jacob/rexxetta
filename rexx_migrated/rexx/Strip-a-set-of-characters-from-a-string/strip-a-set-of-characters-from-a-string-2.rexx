/*ª* REXX */
say StripChars('She was a soul stripper. She took my heart!','iea')
exit 0

StripChars: procedure
parse arg strng,remove
removepos=Verify(strng,remove,'MATCH')
if removepos=0 then return strng
parse value strng with strng newV1 +1 rest
return strng || StripChars(rest,remove)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Strip-a-set-of-characters-from-a-string\strip-a-set-of-characters-from-a-string-2.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
