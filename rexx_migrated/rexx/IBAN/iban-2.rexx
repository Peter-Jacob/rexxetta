/*�*REXX pgm validates an IBAN (International Bank Account Number), including date ranges.*/
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
newV2.12 =  'GT11 2222 3333 4444 5555 6666 7777 '
newV2.13 =  'MK11 2222 3333 4444 555            '
parse arg newV2.0                                             /*�*get optional 1st arg from CL*/
do k=0 + (arg()==0)  while newV2.k\==''      /*�*either:   0  or  1  ──►  n  */
r = valnewV3IBAN(newV2.k)
if r==0  then say '  valid IBAN:'    newV2.k
else say 'invalid IBAN:'    newV2.k      "  "      r
if k==0  then leave             /*�*User specified IBAN?  Then we're done*/
end   /*�*k*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
valnewV3IBAN:  procedure; arg x;  numeric digits 200 /*�*allow for big numbers in the IBAN's. */
x=space(x,0);                 L=length(x)        /*�*elide blanks;  determine the length. */
cc= 'AD 24 AE 23 AL 28 AT 20 AZ 28 BA 20 BE 16 BG 22 BH 22 BR 29 CH 21 CR 21 CY 28 CZ 24',
'DE 22 DK 18 DO 28 EE 20 ES 24 FI 18 FO 18 FR 27 GB 22 GE 22 GI 23 GL 18 GR 27 GT 28',
'HR 21 HU 28 IE 22 IL 23 IS 26 IT 27 KW 30 KZ 20 LB 28 LI 21 LT 20 LU 20 LV 21 MC 27',
'MD 24 ME 22 MK 19 MR 27 MT 31 MU 30 NL 18 NO 15 PK 24 PL 28 PS 29 PT 25 RO 24 RS 22',
'SA 24 SE 24 SI 19 SK 24 SM 27 TN 24 TR 26 VG 24'      /*�*a list of valid countries. */
newV1 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'   /*�*the Latin alphabet and decimal digits*/
ccnewV3=left(x, 2);   kk=substr(x, 3, 2)             /*�*get IBAN country code and checkDigits*/
c#=wordpos(ccnewV3, cc)                              /*�*find the country code index.         */
cL=word(cc, c# + 1)                              /*�*get the length of the country's IBAN.*/
e= '***error***  invalid IBAN'                   /*�*literal used when displaying an error*/
if c#==0               then return  e  'country code:'   ccnewV3
if \datatype(x, 'A')   then return  e  'character:'      substr(x, verify(x, newV1), 1)
if cL\==L              then return  e  'length:'         L     ' (should be'   cL")"
if ccnewV3=='BR' & date("S")<20130701  then return e "country, Brazil isn't valid until 1-July-2013."
if ccnewV3=='GT' & date("S")<20140701  then return e "country, Guatemala isn't valid until 1-July-2014."
if ccnewV3=='BA' & kk\==39             then return e "check digits for Bosnia and Herzegovina:"  kk
if ccnewV3=='MK' & kk\==07             then return e "check digits for Macedonia:"               kk
if ccnewV3=='ME' & kk\==25             then return e "check digits for Montenegro:"              kk
if ccnewV3=='PT' & kk\==50             then return e "check digits for Portugal:"                kk
if ccnewV3=='SI' & kk\==56             then return e "check digits for Slovenia:"                kk
y=substr(x, 5)left(x, 4)                         /*�*put four digs in front ───► the back.*/
z=                                               /*�* [↓]  translate characters ──► digits*/
do j=1  for L;      newV3=substr(y, j, 1)
if datatype(newV3, 'U')  then z=z || pos(newV3, newV1) + 9        /*�*if uppercase, then ··· */
else z=z || newV3
end   /*�*j*/

if z//97==1  then return 0                       /*�*check if correct remainder (modulus).*/
return e    'check digits.'
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\IBAN\iban-2.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
