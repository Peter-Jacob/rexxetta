/*ª*REXX program deletes a file and a folder in the  current directory  and  the root.    */
trace off                                        /*ª*suppress REXX error messages from DOS*/
aFile= 'input.txt'                               /*ª*name of a  file  to be deleted.      */
aDir = 'docs'                                    /*ª*name of a folder to be removed.      */
do j=1  for 2                     /*ª*perform this  DO  loop exactly twice.*/
'ERASE'  aFile                    /*ª*erase this  file in the current dir. */
'RMDIR'  "/s /q"  aDir            /*ª*remove the folder "  "     "     "   */
if j==1  then 'CD \'              /*ª*make the  current dir  the  root dir.*/
end                               /*ª* [â†‘]  just do   CD \    command once.*/
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Delete-a-file\delete-a-file.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
