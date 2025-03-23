/*�*REXX program renames a file & a directory  (in current dir & in root).*/
trace off                              /*�*suppress error messages, bad RC*/
newV1 = '2> NUL'                           /*�*used to suppress error messages*/

do 2                                 /*�* [↓]  perform this code twice. */
'RENAME' "input.txt  output.txt"  newV1  /*�*rename a particular DOS file.  */
'MOVE'   "\docs  \mydocs"         newV1  /*�*use (DOS) MOVE to rename a dir.*/
'CD'     "\"                      newV1  /*�*for 2nd pass, change──►root dir*/
end   /*�*2*/
/*�*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Rename-a-file\rename-a-file-2.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
