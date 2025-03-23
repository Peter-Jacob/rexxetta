/*�*REXX pgm counts how many letters (in the 1st string) are in common with the 2nd string*/
say  count('aAAbbbb', "aA")
say  count('ZZ'     , "z" )
exit                                /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────*/
count: procedure
parse arg stones,jewels  /*�*obtain the two strings specified.    */
number= 0                                     /*�*initialize number  to  zero.*/
do j=1  for length(stones)           /*�*scan STONES for matching JEWELS chars*/
x= substr(stones, j, 1)            /*�*obtain a character of the STONES var.*/
if datatype(x, 'M')  then if pos(x, jewels)\==0  then number=number + 1
end   /*�*j*/                    /*�* [↑]  if a letter and a match, bump number */
return number                        /*�*return the number of common letters. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Jewels-and-stones\jewels-and-stones.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
