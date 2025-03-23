/*ª*REXX program shows all files in a  directory tree  that match a given search criteria.*/
parse arg xdir;  if xdir=''  then xdir='\'       /*ª*Any DIR specified?  Then use default.*/
newV1.=0                                             /*ª*default result in case ADDRESS fails.*/
dirCmd= 'DIR /b /s'                              /*ª*the DOS command to do heavy lifting. */
trace off                                        /*ª*suppress REXX error message for fails*/
address system  dirCmd xdir  with output stem newV1. /*ª*issue the DOS DIR command with option*/
if rc\==0  then do                               /*ª*did the DOS DIR command get an error?*/
say '***error!*** from DIR' xDIR /*ª*error message that shows "que pasa". */
say 'return code='  rc           /*ª*show the  return code  from  DOS DIR.*/
exit rc                          /*ª*exit with    "     "     "    "   "  */
end                              /*ª* [â†‘]  bad ADDRESS cmd  (from DOS DIR)*/
newV2=newV1.rc                                           /*ª*the number of  @.  entries generated.*/
if newV2==0  then newV2='   no   '                       /*ª*use a better word choice for 0 (zero)*/
say center('directory '      xdir      " has "      newV2       ' matching entries.', 79, "â”€")

do j=1  for newV2;       say newV1.j     /*ª*show all the files that met criteria.*/
end   /*ª*j*/
exit newV1.0+rc                                      /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Walk-a-directory-Recursively\walk-a-directory-recursively-1.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
