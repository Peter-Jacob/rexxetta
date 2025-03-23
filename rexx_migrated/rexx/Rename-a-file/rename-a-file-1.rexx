/*�*REXX program renames a file & a directory  (in current dir & in root).*/
trace off                              /*�*suppress error messages, bad RC*/

do 2                               /*�* [↓]  perform this code twice. */
'RENAME' "input.txt  output.txt"   /*�*rename a particular DOS file.  */
'MOVE'   "\docs  \mydocs"          /*�*use (DOS) MOVE to rename a dir.*/
'CD'     "\"                       /*�*for 2nd pass, change──►root dir*/
end   /*�*2*/
/*�*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Rename-a-file\rename-a-file-1.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
