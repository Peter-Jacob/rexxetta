/*ª*REXX program demonstrates a  DO WHILE  with index reduction construct.*/
/*ª* [â†“] note:   BY   defaults to 1*/
do j=1024  by 0  while  j>>0   /*ª*this is an  exact  comparison. */
say right(j,10)                /*ª*pretty output by aligning right*/
j=j%2                          /*ª*in REXX, % is integer division.*/
end
/*ª*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Loops-While\loops-while-4.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
