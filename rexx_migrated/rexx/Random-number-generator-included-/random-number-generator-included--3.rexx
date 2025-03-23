/*ª* REXX ***************************************************************
* 08.09.2013 Walter Pachl
*            Please add the output from other REXXes
* 10.09.2013 Walter Pachl added REXX/TSO
* 01.08.2014 Walter Pachl show what ooRexx supports
**********************************************************************/
Parse Version v
Call random ,,44
ol=v':'
Do i=1 To 10
ol=ol random(1,10)
End
If left(v,11)='REXX-ooRexx' Then
ol=ol random(-999999999,0) /*ª* ooRexx supports negative limits */
Say ol
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Random-number-generator-included-\random-number-generator-included--3.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
