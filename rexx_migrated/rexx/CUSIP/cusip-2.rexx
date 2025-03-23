/*�*REXX program validates that the  last digit (the check digit)  of a  CUSIP  is valid. */
newV1.=
parse arg newV1.1 .
if newV1.1=='' | newV1.1==","  then do;   newV1.1= 037833100       /*�* Apple Incorporated            */
newV1.2= 17275R102       /*�* Cisco Systems                 */
newV1.3= 38259P508       /*�* Google Incorporated           */
newV1.4= 594918104       /*�* Microsoft Corporation         */
newV1.5= 68389X106       /*�* Oracle Corporation (incorrect)*/
newV1.6= 68389X105       /*�* Oracle Corporation            */
end

do j=1  while newV1.j\='';   chkDig=CUSIPchk(newV1.j)     /*�*calculate check digit from func*/
OK=word("isn't is", 1 + (chkDig==right(newV1.j,1) ) ) /*�*validate  check digit with func*/
say 'CUSIP '    newV1.j    right(OK, 6)     "valid."  /*�*display the CUSIP and validity.*/
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
CUSIPchk: procedure; arg x 9;  newV2=0;         abc= '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ*@#'
/*�* [↓]  if  Y  isn' found,  then POS returns zero.*/
do k=1  for 8;   y=substr(x,k,1) /*�*get a character. */
newV3=pos(y, abc) - 1                /*�*get its position.*/
if newV3   == -1  then return 0      /*�*invalid character*/
if k//2==  0  then newV3=newV3+newV3         /*�*K even? double it*/
newV2=newV2 + newV3%10 + newV3//10
end      /*�*k*/
return (10-newV2//10) // 10
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\CUSIP\cusip-2.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
