/*ª*REXX program to reverse a string  (and show before and after strings).*/

string1 = 'A man, a plan, a canal, Panama!'
string2 =
do j=length(string1)  to 1  by -1
string2 = string2 || substr(string1,j,1)
end   /*ª*j*/
say ' original string: '  string1
say ' reversed string: '  string2
/*ª*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Reverse-a-string\reverse-a-string-4.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
