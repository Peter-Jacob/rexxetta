/*ª*REXX program  demonstrates  disjointed array usage.                   */
yr. = 'year not supported'             /*ª*value for all yr.xxx  (so far).*/

do k=600  to 1100      /*ª*a bunch of years prior to 1800.*/
yr.k=k "AD"            /*ª*Kth element as the year itself.*/
end   /*ª*k*/            /*ª* [â†‘]      defines 501 elements.*/

do j=1800  to 2100         /*ª*start at 1800, define a bunch. */
yr.j=j 'AD'                /*ª*Jth element as the year itself.*/
end   /*ª*j*/                /*ª* [â†‘]      defines 301 elements.*/

year=1946
say 'DOB' year "is:" yr.year

year=1744
say 'DOB' year "is:" yr.year
/*ª*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Arrays\arrays-5.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
