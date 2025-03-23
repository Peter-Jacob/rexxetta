/*ª*REXX program reads a file and stores it as a continuous character str.*/
Parse Version v
iFID = 'st.in'                         /*ª*name of the input file.        */
If left(v,11)='REXX-Regina' |,
left(v,11)='REXX-ooRexx' Then Do
len=chars(iFid)                      /*ª*size of the file               */
v = charin(iFid,,len)                /*ª*read entire file               */
End
Else Do                                /*ª* for other Rexx Interpreters   */
v=''
Do while chars(iFid)>0               /*ª* read the file chunk by chunk  */
v=v||charin(iFid,,500)
End
End
say 'v='v
say 'length(v)='length(v)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Read-entire-file\read-entire-file-2.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
