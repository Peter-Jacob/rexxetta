/*�*REXX program demonstrates a  DO WHILE  with index reduction construct.*/
/*�* [↓] note:   BY   defaults to 1*/
do j=1024  by 0  while  j>>0   /*�*this is an  exact  comparison. */
say right(j,10)                /*�*pretty output by aligning right*/
j=j%2                          /*�*in REXX, % is integer division.*/
end
/*�*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Loops-While\loops-while-4.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
