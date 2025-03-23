/*ª*REXX program renames a file & a directory  (in current dir & in root).*/
trace off                              /*ª*suppress error messages, bad RC*/
newV1 = '2> NUL'                           /*ª*used to suppress error messages*/

do 2                                 /*ª* [â†“]  perform this code twice. */
'RENAME' "input.txt  output.txt"  newV1  /*ª*rename a particular DOS file.  */
'MOVE'   "\docs  \mydocs"         newV1  /*ª*use (DOS) MOVE to rename a dir.*/
'CD'     "\"                      newV1  /*ª*for 2nd pass, changeâ”€â”€â–ºroot dir*/
end   /*ª*2*/
/*ª*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Rename-a-file\rename-a-file-2.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
