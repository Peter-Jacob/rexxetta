if  y  then newV1=6                        /*ª* Y  must be either   0  or  1  */

if t**2>u  then x=y                    /*ª*simple  IF  with  THEN & ELSE. */
else x=-y

if t**2>u  then do j=1  for 10;  say prime(j);  end    /*ª*THEN  DO  loop.*/
else x=-y                                   /*ª*simple  ELSE.  */

if z>w+4  then do                                      /*ª*THEN  DO group.*/
z=abs(z)
say 'z='z
end
else do;  z=0;  say 'failed.';  end          /*ª*ELSE  DO group.*/

if x>y  &  c*d<sqrt(pz) |,             /*ª*this statement is continued [,]*/
substr(abc,4,1)=='~'  then  if  z=0  then call punt
else nop       /*ª*NOP pairs up IF*/
else  if  z<0  then z=-y      /*ª*alignment helps*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Conditional-structures\conditional-structures-1.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
