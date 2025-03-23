/*ª*REXX program prompts the user for a template substitutions within a story  (MAD LIBS).*/
parse arg iFID .                                 /*ª*allow user to specify the input file.*/
if iFID=='' | iFID=="," then iFID="MAD_LIBS.TXT" /*ª*Not specified?  Then use the default.*/
newV1.=                                              /*ª*assign defaults to some variables.   */
newV3=;          do recs=1  while  lines(iFID)\==0   /*ª*read the input file until it's done. */
newV1.recs=linein(iFID);  newV3=newV3  newV1.recs   /*ª*read a record;  and append it to  @  */
if newV1.recs=''  then leave            /*ª*Read a blank line?   Then we're done.*/
end  /*ª*recs*/
recs=recs-1                                      /*ª*adjust for a Eâ”€Oâ”€F  or  a blank line.*/
pm= 'please enter a word or phrase to replace: ' /*ª*this is part of the  Prompt Message. */
newV2.=0                                             /*ª*placeholder for phrases in  MAD LIBS.*/
newV4=0;    do  forever                              /*ª*look for templates within the text.  */
parse var  newV3   '<'   newV5   ">"   newV3         /*ª*scan for   <Î±Î±Î±>   stuff in the text.*/
if newV5=''   then leave                     /*ª*No   Î±Î±Î± ?   Then we're all finished.*/
if newV2.newV5    then iterate                   /*ª*Already asked?   Then keep scanning. */
newV2.newV5=1                                    /*ª*mark this   Î±Î±Î±   as being  "found". */
do  until  ans\=''                /*ª*prompt user for a replacement.       */
say 'â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€'   pm    newV5       /*ª*prompt the user with a prompt message*/
parse pull ans                    /*ª*PULL  obtains the text from console. */
end   /*ª*forever*/
newV4=newV4+1                                    /*ª*bump the template counter.           */
old.newV4 = '<'newV5">";           new.newV4 = ans   /*ª*assign the "old" name and "new" name.*/
end   /*ª*forever*/
say                                              /*ª*display a blank line for a separator.*/
say;  say copies('â•', 79)                        /*ª*display a blank line  and  a fence.  */

do m=1  for recs                         /*ª*display the text,  line for line.    */
do n=1  for newV4                    /*ª*perform substitutions in the text.   */
newV1.m=changestr(old.n, newV1.m, new.n) /*ª*maybe replace text in  @.m  haystack.*/
end   /*ª*n*/
say newV1.m                                  /*ª*display the (new) substituted text.  */
end   /*ª*m*/

say copies('â•', 79)                              /*ª*display a  final (output) fence.     */
say                                              /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Mad-Libs\mad-libs.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
