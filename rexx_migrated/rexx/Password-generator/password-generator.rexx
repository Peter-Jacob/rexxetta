/*ͺ*REXX program generates a  random password  according to the Rosetta Code task's rules.*/
newV3='abcdefghijklmnopqrstuvwxyz'; newV4=newV3; upper newV4 /*ͺ*define lower-, uppercase Latin chars.*/
newV5= 0123456789                                   /*ͺ*   "   " string of base ten numerals.*/
newV6= '!"#$%&()+,-./:;<=>?@[]^{|}~' || "'"         /*ͺ*define a bunch of special characters.*/
parse arg L N seed xxx yyy .                     /*ͺ*obtain optional arguments from the CL*/
if L=='?'               then signal help         /*ͺ*does user want documentation shown?  */
if L=='' | L==","       then L=8                 /*ͺ*Not specified?  Then use the default.*/
if N=='' | N==","       then N=1                 /*ͺ* "      "         "   "   "     "    */
if xxx\==''             then call weed  xxx      /*ͺ*Any chars to be ignored?  Scrub lists*/
if yyy\==''             then call weed  x2c(yyy) /*ͺ*Hex   "    "  "     "       "     "  */
if  datatype(seed,'W')  then call random ,,seed  /*ͺ*the seed for repeatable RANDOM BIF #s*/
if \datatype(L,   'W')  then call serr  "password length, it isn't an integer: "       L
if L<4                  then call serr  "password length, it's too small  (< 4): "     L
if L>80                 then call serr  "password length, it's too large  (> 80): "    L
if \datatype(N,   'W')  then call serr  "number of passwords, it isn't an integer: "   N

do g=1  to N;       newV7=                       /*ͺ*generate N passwords (default is one)*/
do k=1  for L;       z=k;   if z>4  then z=random(1,4) /*ͺ*1st four parts β random*/
if z==1  then newV7=newV7 || substr(newV3,random(1,length(newV3)),1) /*ͺ*append lowercase letter*/
if z==2  then newV7=newV7 || substr(newV4,random(1,length(newV4)),1) /*ͺ*   "   uppercase    "  */
if z==3  then newV7=newV7 || substr(newV5,random(1,length(newV5)),1) /*ͺ*   "    numeral        */
if z==4  then newV7=newV7 || substr(newV6,random(1,length(newV6)),1) /*ͺ*   "  special character*/
end   /*ͺ*k*/
/*ͺ* [β]  scrambles PW, hides gen order. */
do a=1  for L;          b=random(1, L)   /*ͺ*swap every character with another.   */
parse var newV7 newV1 x +1 newV2  y  +1        /*ͺ*β‘  x=substr($,a,1);  y=substr($,b,1) */
newV7=overlay(x,newV7,b);       newV7=overlay(y,newV7,a) /*ͺ*(both statements) swap two characters*/
end  /*ͺ*L+L*/                             /*ͺ* [β]  more swaps obfuscates gen order*/

say right(g, length(N))  'password is: '  newV7  /*ͺ*display the  Nth  password to console*/
/*ͺ*      call lineout 'GENPW.PW', $  */       /*ͺ*and also write the password to a file*/     /*ͺ*or not.*/
end      /*ͺ*g*/                               /*ͺ* [β]  {a comment}   fileID= GENPW.PW */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
weed:  parse arg ig;   newV3=dont(newV3);   newV4=dont(newV4);   newV5=dont(newV5);   newV6=dont(newV6);    return
dont:  return space( translate(arg(1), , ig), 0)              /*ͺ*remove chars from a list*/
serr:  say;   say '***error*** invalid'  arg(1);  exit 13     /*ͺ*display an error message*/
help:  signal .; .: do j=sigL+1 to sourceline(); say strip(left(sourceline(j),79)); end /*ͺ*
βββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ
β  GENPW  ?                    ββββ shows this documentation.                 β
β  GENPW                       ββββ generates 1 password  (with length  8).   β
β  GENPW len                   ββββ generates (all) passwords with this lengthβ
β  GENPW  ,   n                ββββ generates     N      number of passwords. β
β  GENPW  ,   ,  seed          ββββ generates passwords  using a random seed. β
β  GENPW  ,   ,    ,  xxx      ββββ generates passwords that don't contain xxxβ
β  GENPW  ,   ,    ,   ,  yyy  ββββ generates passwords that don't contain yyyβ
β                                                                             β
βββββββββββββ where   [if a  comma (,)  is specified,  the default is used]:  β
β len     is the length of the passwords to be generated.    The default is 8.β
β         The minimum is  4,   the maximum is  80.                            β
β n       is the number of passwords to be generated.        The default is 1.β
β seed    is an integer seed used for the RANDOM BIF.     (Default is random.)β
β xxx     are characters to  NOT  be used for generating passwords.           β
β         The default is to use  all  the  (normal)  available characters.    β
β yyy     (same as XXX,  except the chars are expressed as hexadecimal pairs).β
βββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ         */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Password-generator\password-generator.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
