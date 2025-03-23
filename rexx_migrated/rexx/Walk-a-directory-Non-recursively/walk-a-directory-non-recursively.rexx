/*�*REXX program shows files in directory tree that match a given criteria*/
parse arg xdir;  if xdir='' then xdir='\'        /*�*Any DIR? Use default.*/
newV1.=0                                   /*�*default in case ADDRESS fails. */
trace off                              /*�*suppress REXX err msg for fails*/
address system 'DIR' xdir '/b /s' with output stem newV1.   /*�*issue DIR cmd.*/
if rc\==0  then do                                  /*�*an error happened?*/
say '***error!*** from DIR' xDIR    /*�*indicate que pasa.*/
say 'return code='  rc              /*�*show the Ret Code.*/
exit rc                             /*�*exit with the  RC.*/
end                                 /*�* [↑]  bad address.*/
newV2=newV1.rc                                              /*�*number of entries.*/
if newV2==0  then newV2='   no   '                          /*�*use a word, ¬zero.*/
say center('directory ' xdir " has "    newV2     ' matching entries.',79,'─')

do j=1  for newV2;  say newV1.j;  end   /*�*show files that met criteria.  */

exit newV1.0+rc                            /*�*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Walk-a-directory-Non-recursively\walk-a-directory-non-recursively.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
