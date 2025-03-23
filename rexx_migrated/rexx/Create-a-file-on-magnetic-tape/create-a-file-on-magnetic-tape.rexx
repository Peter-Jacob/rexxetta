/*ª*REXX pgm  demonstrates  writing records  to an attached magnetic tape.*/
dsName = 'TAPE.FILE'                   /*ª*dsName of "file" being written.*/

do j=1  for 100              /*ª*write 100 records to mag tape. */
call lineout  dsName,  'this is record'   j   ||   "."
end   /*ª*j*/
/*ª*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Create-a-file-on-magnetic-tape\create-a-file-on-magnetic-tape.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
