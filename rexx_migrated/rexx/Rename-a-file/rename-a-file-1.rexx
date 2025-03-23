/*ª*REXX program renames a file & a directory  (in current dir & in root).*/
trace off                              /*ª*suppress error messages, bad RC*/

do 2                               /*ª* [â†“]  perform this code twice. */
'RENAME' "input.txt  output.txt"   /*ª*rename a particular DOS file.  */
'MOVE'   "\docs  \mydocs"          /*ª*use (DOS) MOVE to rename a dir.*/
'CD'     "\"                       /*ª*for 2nd pass, changeâ”€â”€â–ºroot dir*/
end   /*ª*2*/
/*ª*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Rename-a-file\rename-a-file-1.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
