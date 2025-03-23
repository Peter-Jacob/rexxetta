/*ª*REXX program shows how to  simultaneously  loop over  multiple  lists.*/
x = 'a b c d'
y = 'A B C'
z =  1 2 3 4
do j=1  until  output=''
output = word(x,j) || word(y,j) || word(z,j)
say output
end    /*ª*j*/            /*ª*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Loop-over-multiple-arrays-simultaneously\loop-over-multiple-arrays-simultaneously-3.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
