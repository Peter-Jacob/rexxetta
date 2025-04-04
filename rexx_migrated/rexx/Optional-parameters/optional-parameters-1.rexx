sortStrings:  procedure expose @.                /*ช*the stemmed array is named:    @.    */
col= 1                                           /*ช*set some defaults  (here and below). */
reverse= 'NO'
order= 'LEXICOGRAPHIC'
arg options                                      /*ช*obtain the options  (in uppercase).  */
do j=1  for words(options)        /*ช*examine all the words (options).     */
x= word(options, j)
select
when datatype(x, 'W')  then col= x / 1      /*ช*normalize the number. */
when pos('=', x)==0    then order= x        /*ช*has it an equal sign? */
otherwise                   parse var x nam '=' value   /*ช*get value.*/
end   /*ช*select*/
end        /*ช*j*/

/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ
โ check for errors here:  COL isn't a positive integer ยทยทยท, โ
โ                         REVERSE value isn't  NO  or  YES, โ
โ                         ORDER   value is recognized ยทยทยท   โ
โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/

... main body of string sort here ...

return                                           /*ช*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Optional-parameters\optional-parameters-1.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
