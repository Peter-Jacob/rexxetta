/*�*REXX program prompts the user for a template substitutions within a story  (MAD LIBS).*/
parse arg iFID .                                 /*�*allow user to specify the input file.*/
if iFID=='' | iFID=="," then iFID="MAD_LIBS.TXT" /*�*Not specified?  Then use the default.*/
newV1.=                                              /*�*assign defaults to some variables.   */
newV3=;          do recs=1  while  lines(iFID)\==0   /*�*read the input file until it's done. */
newV1.recs=linein(iFID);  newV3=newV3  newV1.recs   /*�*read a record;  and append it to  @  */
if newV1.recs=''  then leave            /*�*Read a blank line?   Then we're done.*/
end  /*�*recs*/
recs=recs-1                                      /*�*adjust for a E─O─F  or  a blank line.*/
pm= 'please enter a word or phrase to replace: ' /*�*this is part of the  Prompt Message. */
newV2.=0                                             /*�*placeholder for phrases in  MAD LIBS.*/
newV4=0;    do  forever                              /*�*look for templates within the text.  */
parse var  newV3   '<'   newV5   ">"   newV3         /*�*scan for   <ααα>   stuff in the text.*/
if newV5=''   then leave                     /*�*No   ααα ?   Then we're all finished.*/
if newV2.newV5    then iterate                   /*�*Already asked?   Then keep scanning. */
newV2.newV5=1                                    /*�*mark this   ααα   as being  "found". */
do  until  ans\=''                /*�*prompt user for a replacement.       */
say '───────────'   pm    newV5       /*�*prompt the user with a prompt message*/
parse pull ans                    /*�*PULL  obtains the text from console. */
end   /*�*forever*/
newV4=newV4+1                                    /*�*bump the template counter.           */
old.newV4 = '<'newV5">";           new.newV4 = ans   /*�*assign the "old" name and "new" name.*/
end   /*�*forever*/
say                                              /*�*display a blank line for a separator.*/
say;  say copies('═', 79)                        /*�*display a blank line  and  a fence.  */

do m=1  for recs                         /*�*display the text,  line for line.    */
do n=1  for newV4                    /*�*perform substitutions in the text.   */
newV1.m=changestr(old.n, newV1.m, new.n) /*�*maybe replace text in  @.m  haystack.*/
end   /*�*n*/
say newV1.m                                  /*�*display the (new) substituted text.  */
end   /*�*m*/

say copies('═', 79)                              /*�*display a  final (output) fence.     */
say                                              /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Mad-Libs\mad-libs.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
