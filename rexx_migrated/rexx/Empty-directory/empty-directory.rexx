/*ª*REXX pgm checks to see if a directory is empty; if not, lists entries.*/
parse arg xdir;  if xdir='' then xdir='\someDir' /*ª*Any DIR? Use default.*/
newV1.=0                                   /*ª*default in case ADDRESS fails. */
trace off                              /*ª*suppress REXX err msg for fails*/
address system 'DIR' xdir '/b' with output stem newV1.  /*ª*issue the DIR cmd.*/
if rc\==0  then do                                  /*ª*an error happened?*/
say '***error!*** from DIR' xDIR    /*ª*indicate que pasa.*/
say 'return code='  rc              /*ª*show the ret Code.*/
exit rc                             /*ª*exit with the  RC.*/
end                                 /*ª* [â†‘]  bad address.*/
newV2=newV1.rc                                              /*ª*number of entries.*/
if newV2==0  then newV2='   no   '                          /*ª*use a word, Â¬zero.*/
say center('directory ' xdir " has "     newV2     ' entries.',79,'â”€')
exit newV1.0+rc                            /*ª*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Empty-directory\empty-directory.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
