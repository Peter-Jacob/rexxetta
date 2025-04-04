/*ͺ*REXX program uses the  straddling checkerboard  cipher to encrypt/decrypt a message.  */
parse arg msg                                    /*ͺ*obtain optional message from the C.L.*/
if msg=''  then msg= 'One night-it was the twentieth of March, 1888-I was returning'
say 'plain text='  msg
call genCipher  'et aon ris',  'bcdfghjklm',  'pq/uvwxyz.'    /*ͺ*build the cipher (board)*/
enc= encrypt(msg);     say ' encrypted='  enc    /*ͺ*encrypt message and show encryption. */
dec= decrypt(enc);     say ' decrypted='  dec    /*ͺ*decrypt    "     "    "  decryption. */
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
genCipher: newV1.=;   arg newV1..,two,three;    z= -1;  newV1.z= newV1..      /*ͺ*build top row of cipher.*/
newV2= pos(' ', newV1..     )  - 1;  newV1.newV2= two              /*ͺ*  "   2nd  "   "    "   */
newV2= pos(' ', newV1.., newV2+2)  - 1;  newV1.newV2= three            /*ͺ*  "   3rd  "   "    "   */
do j=0  for 9;    newV1..= newV1.. || newV1.j   /*ͺ*construct a table for fast searching.*/
if newV1.j\==''  then newV1.r= newV1.r || j
newV2= pos('/', newV1.j)                    /*ͺ*is the escape character in this row? */
if newV2\==0  then newV1.dig= j || (newV2-1)    /*ͺ*define    "       "     for numerals.*/
end   /*ͺ*j*/
newV1..= space(newV1.., 0);       return      /*ͺ*purify the table of encryptable chars*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
encrypt: procedure expose newV1.;  arg newV4,,newV3          /*ͺ*$:  output  (encrypted text)  so far.*/
do j=1  for length(newV4)                 /*ͺ*process each of the plainβtext chars.*/
x= substr(newV4, j, 1)                    /*ͺ*obtain a message char to be encrypted*/
if datatype(x, 'W')  then do;  newV3= newV3 || newV1.dig || x;  iterate;  end  /*ͺ*numeral?*/
if pos(x, newV1..)==0    then iterate     /*ͺ*Not one of the allowable chars?  Skip*/
do k=-1  for 10;  y= pos(x, newV1.k)   /*ͺ*traipse thru rows, looking for match.*/
if y==0           then iterate     /*ͺ*Not in this row?   Then keep looking.*/
z= k;   if z==-1  then z=          /*ͺ*construct the index of the cypher row*/
newV3= newV3  ||  z  ||  (y-1);  leave     /*ͺ*add an encrypted character to output.*/
end   /*ͺ*k*/
end      /*ͺ*j*/;      return newV3
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
decrypt: procedure expose newV1.;     parse arg newV4,,newV3 /*ͺ*$:  output  (decrypted text)  so far.*/
do j=1  to length(newV4);    rw= -1       /*ͺ*process each of the encypted numbers.*/
x= substr(newV4,j,1)                      /*ͺ*obtain a message char to be decrypted*/
if substr(newV4,j,2)==newV1.dig  then do; j= j+2; newV3= newV3 || substr(newV4, j, 1); iterate; end
if pos(x, newV1.r)\==0       then do; j= j+1; rw=x; x=substr(newV4, j, 1);          end
newV3= newV3 || substr(newV1.rw, x+1, 1)          /*ͺ*add a character to decrypted message.*/
end   /*ͺ*j*/;             return newV3
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Straddling-checkerboard\straddling-checkerboard.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
