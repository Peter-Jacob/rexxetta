...
prod=1
a=7               /*ª*or somesuch.*/
b=3               /*ª*  likewise. */

op='**'           /*ª*or whatever.*/
...
select
when op=='+'         then  r=a+b           /*ª*add.                   */
when op=='-'         then  r=a-b           /*ª*subtract.              */
when op=='âˆ™'         then do; r=a*b; prod=prod*r; end    /*ª*multiply.*/
when op=='*'         then  r=a*b           /*ª*multiply.              */
when op=='**'        then  r=a**b          /*ª*power (exponentiation) */
when op=='/'  & b\=0 then  r=a/b           /*ª*divide.                */
when op=='%'  & b\=0 then  r=a/b           /*ª*interger divide.       */
when op=='//' & b\=0 then  r=a/b           /*ª*modulus (remainder).   */
when op=='||'        then  r=a||b          /*ª*concatenation.         */
when op=='caw'       then  r=xyz(a,b)      /*ª*call the XYZ subroutine*/
otherwise                  r='[n/a]'       /*ª*signify not applicable.*/
end   /*ª*select*/

say 'result for'   a   op   b   "="   r
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Flow-control-structures\flow-control-structures-10.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
