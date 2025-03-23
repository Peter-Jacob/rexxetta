/*ª*REXX program  executes a  system command  and displays the results  (from an array).  */
parse arg xxxCmd                                 /*ª*obtain the (system) command from  CL.*/
trace off                                        /*ª*suppress REXX error msgs for fails.  */
newV1.= 0                                            /*ª*assign default in case ADDRESS fails.*/
address  system  xxxCmd  with  output  stem  newV1.  /*ª*issue/execute the command and parms. */
if rc\==0  then  say  copies('â”€', 40)      ' return code '     rc     " from: "     xxxCmd
/*ª* [â†‘]  display if an  error  occurred.*/
do newV2=1  for newV1.0                       /*ª*display the output from the command. */
say strip(newV1.newV2, 'T')                   /*ª*display one line at a timeâ”€â”€â–ºterminal*/
end   /*ª*#*/                           /*ª* [â†‘]  displays all the output.       */
exit 0                                           /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Get-system-command-output\get-system-command-output.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
