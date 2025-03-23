/*�*REXX pgm checks to see if a directory is empty; if not, lists entries.*/
parse arg xdir;  if xdir='' then xdir='\someDir' /*�*Any DIR? Use default.*/
newV1.=0                                   /*�*default in case ADDRESS fails. */
trace off                              /*�*suppress REXX err msg for fails*/
address system 'DIR' xdir '/b' with output stem newV1.  /*�*issue the DIR cmd.*/
if rc\==0  then do                                  /*�*an error happened?*/
say '***error!*** from DIR' xDIR    /*�*indicate que pasa.*/
say 'return code='  rc              /*�*show the ret Code.*/
exit rc                             /*�*exit with the  RC.*/
end                                 /*�* [↑]  bad address.*/
newV2=newV1.rc                                              /*�*number of entries.*/
if newV2==0  then newV2='   no   '                          /*�*use a word, ¬zero.*/
say center('directory ' xdir " has "     newV2     ' entries.',79,'─')
exit newV1.0+rc                            /*�*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Empty-directory\empty-directory.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
