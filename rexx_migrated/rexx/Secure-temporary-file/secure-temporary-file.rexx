/*ช*REXX pgm secures (a temporary file), writes to it, displays the file, then deletes it.*/
parse arg tFID newV1 .                               /*ช*obtain optional argument from the CL.*/
if tFID=='' | tFID==","  then tFID= 'TEMP.FILE'  /*ช*Not specified?  Then use the default.*/
if    newV1=='' |    newV1==","  then    newV1= 6            /*ช* "      "         "   "   "     "    */
call lineout tFID                                /*ช*insure file is closed.               */
rc= 0
say 'ยทยทยท creating file: '  tFID
call lineout tFID,,1                             /*ช*insure file is open and at record 1. */
if rc\==0  then call ser rc 'creating file' tFID /*ช*issue error if can't open the file.  */
say 'ยทยทยท writing  file: '  tFID

do j=1  for newV1                                /*ช*write a half-dozen records to file.  */
call lineout tFID, 'line' j                  /*ช*write a  record  to the file.        */
if rc\==0  then call ser rc 'writing file'  tFID    /*ช*Have an error?  Issue err msg.*/
end   /*ช*j*/

call lineout tFID                                /*ช*close the file.                      */
say 'ยทยทยท reading/display file: '  tFID

do j=1  while lines(tFID)>0                  /*ช*read the entire file and display it. */
x= linein(tFID)                              /*ช*read a record from the file.         */
if rc\==0  then call ser rc 'reading file'  tFID    /*ช*Have an error?  Issue err msg.*/
say 'line ' j  " of file" tFID":"  x                /*ช*display a record to the term. */
end   /*ช*j*/

call lineout tFID                                /*ช*close the file.                      */
say 'ยทยทยท erasing file: '  tFID
'ERASE' tFID                                     /*ช*erase the file.                      */
exit 0                                           /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
ser: say; say '***error***' arg(1); say; exit 13 /*ช*issue an error message to the term.  */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Secure-temporary-file\secure-temporary-file.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
