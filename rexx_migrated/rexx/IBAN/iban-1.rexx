/*ช*REXX program validates an  IBAN  (International Bank Account Number).                 */
newV2.=;             newV2.1  =  'GB82 WEST 1234 5698 7654 32        '
newV2.2  =  'Gb82 West 1234 5698 7654 32        '
newV2.3  =  'GB82 TEST 1234 5698 7654 32        '
newV2.4  =  'GR16 0110 1250 0000 0001 2300 695  '
newV2.5  =  'GB29 NWBK 6016 1331 9268 19        '
newV2.6  =  'SA03 8000 0000 6080 1016 7519      '
newV2.7  =  'CH93 0076 2011 6238 5295 7         '
newV2.8  =  'IL62 0108 0000 0009 9999 999       '
newV2.9  =  'IL62-0108-0000-0009-9999-999       '
newV2.10 =  'US12 3456 7890 0987 6543 210       '
newV2.11 =  'GR16 0110 1250 0000 0001 2300 695X '
parse arg newV2.0                                             /*ช*get optional 1st arg from CL*/
do k=0 + (arg()==0)  while newV2.k\==''      /*ช*either:   0  or  1  โโโบ  n  */
r = valnewV3IBAN(newV2.k)
if r==0  then say '  valid IBAN:'    newV2.k
else say 'invalid IBAN:'    newV2.k      "  "      r
if k==0  then leave             /*ช*User specified IBAN?  Then we're done*/
end   /*ช*k*/
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
valnewV3IBAN:  procedure; arg x;  numeric digits 200 /*ช*allow for big numbers in the IBAN's. */
x=space(x,0);                 L=length(x)        /*ช*elide blanks;  determine the length. */
cc= 'AD 24 AE 23 AL 28 AT 20 AZ 28 BA 20 BE 16 BG 22 BH 22 BR 29 CH 21 CR 21 CY 28 CZ 24',
'DE 22 DK 18 DO 28 EE 20 ES 24 FI 18 FO 18 FR 27 GB 22 GE 22 GI 23 GL 18 GR 27 GT 28',
'HR 21 HU 28 IE 22 IL 23 IS 26 IT 27 KW 30 KZ 20 LB 28 LI 21 LT 20 LU 20 LV 21 MC 27',
'MD 24 ME 22 MK 19 MR 27 MT 31 MU 30 NL 18 NO 15 PK 24 PL 28 PS 29 PT 25 RO 24 RS 22',
'SA 24 SE 24 SI 19 SK 24 SM 27 TN 24 TR 26 VG 24'      /*ช*a list of valid countries. */
newV1 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'   /*ช*the Latin alphabet and decimal digits*/
ccnewV3=left(x, 2);   kk=substr(x, 3, 2)             /*ช*get IBAN country code and checkDigits*/
c#=wordpos(ccnewV3, cc)                              /*ช*find the country code index.         */
cL=word(cc, c# + 1)                              /*ช*get the length of the country's IBAN.*/
e= '***error***  invalid IBAN'                   /*ช*literal used when displaying an error*/
if c#==0               then return  e  'country code:'   ccnewV3
if \datatype(x, 'A')   then return  e  'character:'      substr(x, verify(x, newV1), 1)
if cL\==L              then return  e  'length:'         L     ' (should be'   cL")"
y=substr(x, 5)left(x, 4)                         /*ช*put four digs in front โโโโบ the back.*/
z=                                               /*ช* [โ]  translate characters โโโบ digits*/
do j=1  for L;      newV3=substr(y, j, 1)
if datatype(newV3, 'U')  then z=z || pos(newV3, newV1) + 9        /*ช*if uppercase, then ยทยทยท */
else z=z || newV3
end   /*ช*j*/

if z//97==1  then return 0                       /*ช*check if correct remainder (modulus).*/
return e   'check digits.'
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\IBAN\iban-1.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
