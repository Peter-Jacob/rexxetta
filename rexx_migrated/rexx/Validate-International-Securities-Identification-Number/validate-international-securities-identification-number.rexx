/*�*REXX program validates the  checksum digit for an  International Securities ID number.*/
parse arg z                                      /*�*obtain optional  ISINs  from the C.L.*/
if z=''  then z= "US0378331005 US0373831005 U50378331005 US03378331005 AU0000XVGZA3" ,
'AU0000VXGZA3 FR0000988040'     /*�* [↑]  use the default list of  ISINs.*/
/*�* [↓]  process  all  specified  ISINs.*/
do n=1  for words(z);  x=word(z, n);  y= x  /*�*obtain an  ISIN  from the  Z  list.  */
newV1=                                          /*�* [↓]  construct list of ISIN digits. */
do k=1  for length(x);  newV2= substr(x,k,1) /*�*the ISIN may contain alphabetic chars*/
p= pos(newV2, 0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ)   /*�*X must contain A──►Z, 0──►9.*/
if p==0  then y=                                  /*�*trigger  "not"  valid below.*/
else newV1= newV1 || p-1                /*�*convert  X  string (base 36 ──► dec).*/
end   /*�*k*/                              /*�* [↑]  convert  alphabetic ──► digits.*/
newV3=                                          /*�*placeholder for the "not" in message.*/
if length(y)\==12             then newV3= "not" /*�*see if the ISIN is exactly 12 chars. */
if \datatype( left(x,2),'U')  then newV3= "not" /*�* "   "  "    "  1st 2 chars cap. let.*/
if \datatype(right(x,1),'W')  then newV3= "not" /*�* "   "  "    "  last char not a digit*/
if newV3==''  then  if \luhn(newV1)   then newV3= "not" /*�* "   "  "    "  passed the Luhn test.*/
say right(x, 30)   right(newV3, 5)   "valid"    /*�*display the   yea  or  nay   message.*/
end   /*�*n*/                                 /*�* [↑] 1st 3 IFs could've been combined*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Luhn: procedure;  parse arg x;           newV1= 0    /*�*get credit card number;  zero $ sum. */
y= reverse( left(0, length(x) // 2)x)      /*�*add leading zero if needed, & reverse*/
do j=1  to length(y)-1  by 2;    newV2= 2  *  substr(y, j+1, 1)
newV1= newV1 + substr(y, j, 1)  +  left(newV2, 1)  +  substr(newV2, 2  , 1, 0)
end   /*�*j*/          /*�* [↑]   sum the  odd and even  digits.*/
return right(newV1, 1)==0                      /*�*return "1" if number passed Luhn test*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Validate-International-Securities-Identification-Number\validate-international-securities-identification-number.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
