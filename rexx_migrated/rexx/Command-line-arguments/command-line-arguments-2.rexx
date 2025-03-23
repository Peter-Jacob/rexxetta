parse arg aaa                          /*ª*get the arguments.        */
/*ª*another version:          */
/*ª*  aaa=arg(1)              */
say 'command arguments:'
say aaa

opts=''                                /*ª*placeholder for options.  */
data=''                                /*ª*placeholder for data.     */

do j=1 to words(aaa)
x=word(aaa,j)
if left(x,1)=='-' then opts=opts x   /*ª*Option?  Then add to opts.*/
else data=data x   /*ª*Must be data. Add to data.*/
end

/*ª*the above process adds a leading blank to  OPTS and  DATA*/

opts=strip(opts,'L')                   /*ª*strip leading blanks.     */
data=strip(data,'l')                   /*ª*strip leading blanks.     */
say
say 'options='opts
say '   data='data
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Command-line-arguments\command-line-arguments-2.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
