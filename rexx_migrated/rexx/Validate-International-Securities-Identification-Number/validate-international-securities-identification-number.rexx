/*Ē*REXX program validates the  checksum digit for an  International Securities ID number.*/
parse arg z                                      /*Ē*obtain optional  ISINs  from the C.L.*/
if z=''  then z= "US0378331005 US0373831005 U50378331005 US03378331005 AU0000XVGZA3" ,
'AU0000VXGZA3 FR0000988040'     /*Ē* [â]  use the default list of  ISINs.*/
/*Ē* [â]  process  all  specified  ISINs.*/
do n=1  for words(z);  x=word(z, n);  y= x  /*Ē*obtain an  ISIN  from the  Z  list.  */
newV1=                                          /*Ē* [â]  construct list of ISIN digits. */
do k=1  for length(x);  newV2= substr(x,k,1) /*Ē*the ISIN may contain alphabetic chars*/
p= pos(newV2, 0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ)   /*Ē*X must contain AâââēZ, 0âââē9.*/
if p==0  then y=                                  /*Ē*trigger  "not"  valid below.*/
else newV1= newV1 || p-1                /*Ē*convert  X  string (base 36 âââē dec).*/
end   /*Ē*k*/                              /*Ē* [â]  convert  alphabetic âââē digits.*/
newV3=                                          /*Ē*placeholder for the "not" in message.*/
if length(y)\==12             then newV3= "not" /*Ē*see if the ISIN is exactly 12 chars. */
if \datatype( left(x,2),'U')  then newV3= "not" /*Ē* "   "  "    "  1st 2 chars cap. let.*/
if \datatype(right(x,1),'W')  then newV3= "not" /*Ē* "   "  "    "  last char not a digit*/
if newV3==''  then  if \luhn(newV1)   then newV3= "not" /*Ē* "   "  "    "  passed the Luhn test.*/
say right(x, 30)   right(newV3, 5)   "valid"    /*Ē*display the   yea  or  nay   message.*/
end   /*Ē*n*/                                 /*Ē* [â] 1st 3 IFs could've been combined*/
exit                                             /*Ē*stick a fork in it,  we're all done. */
/*Ē*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
Luhn: procedure;  parse arg x;           newV1= 0    /*Ē*get credit card number;  zero $ sum. */
y= reverse( left(0, length(x) // 2)x)      /*Ē*add leading zero if needed, & reverse*/
do j=1  to length(y)-1  by 2;    newV2= 2  *  substr(y, j+1, 1)
newV1= newV1 + substr(y, j, 1)  +  left(newV2, 1)  +  substr(newV2, 2  , 1, 0)
end   /*Ē*j*/          /*Ē* [â]   sum the  odd and even  digits.*/
return right(newV1, 1)==0                      /*Ē*return "1" if number passed Luhn test*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Validate-International-Securities-Identification-Number\validate-international-securities-identification-number.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
