/*�*REXX program gets the source function (source code) and */
/*�*───────────────────────── displays the number of lines. */
newV1=sourceline()
do j=1  for sourceline()
say 'line'  right(j, length(newV1) )  '──►'   ,
strip( sourceline(j), 'T')
end   /*�*j*/
say
parse source x y sID
say  'The name of the  source file (program) is: '    sID
say  'The number of lines in the source program: '     newV1
/*�*stick a fork in it, we're all done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Reflection-Get-source\reflection-get-source.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
