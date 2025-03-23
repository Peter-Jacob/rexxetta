/*�*REXX program writes  two arrays  to a file  with a  specified (limited)  precision.   */
numeric digits 1000                              /*�*allow use of a huge number of digits.*/
oFID= 'filename'                                 /*�*name of the  output  File IDentifier.*/
x.=;  y.=;                     x.1= 1    ;    y.1=      1
x.2= 2    ;    y.2=      1.4142135623730951
x.3= 3    ;    y.3=      1.7320508075688772
x.4= 1e11 ;    y.4= 316227.76601683791
xPrecision= 3                                    /*�*the precision for the   X   numbers. */
yPrecision= 5                                    /*�* "      "      "   "    Y      "     */
do j=1  while  x.j\==''          /*�*process and reformat all the numbers.*/
newX=rule(x.j, xPrecision)       /*�*format  X  numbers with new precision*/
newY=rule(y.j, yPrecision)       /*�*   "    Y     "      "   "      "    */
aLine=translate(newX || left('',4) || newY,   "e",  'E')
say aLine                        /*�*display re─formatted numbers ──► term*/
call lineout oFID, aLine         /*�*write         "         "     "  disk*/
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
rule: procedure;   parse arg z 1 oz,p;     numeric digits p;       z=format(z,,p)
parse var z  mantissa      'E'  exponent                /*�*get the dec dig exponent*/
parse var    mantissa int  '.'  fraction                /*�* "  integer and fraction*/
fraction=strip(fraction, 'T', 0) /*�*strip  trailing  zeroes.*/
if fraction\==''  then fraction="."fraction             /*�*any fractional digits ? */
if exponent\==''  then exponent="E"exponent             /*�*in exponential format ? */
z=int || fraction || exponent                           /*�*format #  (as per rules)*/
if datatype(z,'W')  then return format(oz/1,,0)         /*�*is it a whole number ?  */
return format(oz/1,,,3,0)      /*�*3 dec. digs in exponent.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Write-float-arrays-to-a-text-file\write-float-arrays-to-a-text-file.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
