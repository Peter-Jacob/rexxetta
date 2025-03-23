/*�*REXX program  writes (appends) two records,  closes the file,  appends another record.*/
tFID= 'PASSWD.TXT'                               /*�*define the name of the  output  file.*/
call lineout tFID                                /*�*close the output file,  just in case,*/
/*�*   it could be open from calling pgm.*/
call writeRec tFID,,                             /*�*append the  1st record  to the file. */
'jsmith',"x", 1001, 1000, 'Joe Smith,Room 1007,(234)555-8917,(234)555-0077,jsmith@rosettacode.org', "/home/jsmith", '/bin/bash'

call writeRec tFID,,                             /*�*append the  2nd record  to the file. */
'jdoe',  "x", 1002, 1000, 'Jane Doe,Room 1004,(234)555-8914,(234)555-0044,jdoe@rosettacode.org',    "/home/jsmith", '/bin/bash'

call lineout fid                                 /*�*close the outfile  (just to be tidy).*/

call writeRec tFID,,                             /*�*append the  3rd record  to the file. */
'xyz',   "x", 1003, 1000, 'X Yz,Room 1003,(234)555-8913,(234)555-0033,xyz@rosettacode.org',         "/home/xyz",    '/bin/bash'
/*�*─account─pw────uid───gid──────────────fullname,office,extension,homephone,Email────────────────────────directory───────shell──*/

call lineout fid                                 /*�*"be safe" programming: close the file*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
s:   if arg(1)==1  then return arg(3);       return word(arg(2) 's', 1)     /*�*pluralizer*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
writeRec: parse arg fid,newV1                        /*�*get the fileID, and also the 1st arg.*/
sep=':'                                /*�*field delimiter used in file, it ··· */
/*�*      ··· can be unique and any size.*/
do i=3  to arg()          /*�*get each argument and append it to   */
newV1=newV1 || sep || arg(i)      /*�*  the previous arg, with a   :   sep.*/
end   /*�*i*/

do tries=0  for 11        /*�*keep trying for  66  seconds.        */
r=lineout(fid, newV1)         /*�*write (append)  the new record.      */
if r==0  then return      /*�*Zero?   Then record was written.     */
call sleep tries          /*�*Error?  So try again after a delay.  */
end   /*�*tries*/           /*�*Note:  not all REXXes have  SLEEP.   */

say '***error***';  say r  'record's(r)   "not written to file"   fid;   exit 13
/*�*some error causes: no write access, disk is full, file lockout, no authority*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Append-a-record-to-the-end-of-a-text-file\append-a-record-to-the-end-of-a-text-file.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
