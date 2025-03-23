/*�*REXX program illustrates how to display embedded documentation (help) within REXX code*/
parse arg doc                                    /*�*obtain (all) the arguments from C.L. */
if doc='?'  then call help                       /*�*show documentation if arg=a single ? */
/*�*■■■■■■■■■regular■■■■■■■■■■■■■■■■■■■■■■■■■*/
/*�*■■■■■■■■■■■■■■■■■mainline■■■■■■■■■■■■■■■■*/
/*�*■■■■■■■■■■■■■■■■■■■■■■■■■■code■■■■■■■■■■■*/
/*�*■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■here.■■■■■*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
help: newV2=0;    do j=1  for sourceline();  newV1=sourceline(j)         /*�*get a line of source.*/
if newV1='<help>'   then do;  newV2=1;  iterate;  end      /*�*search for  <help>   */
if newV1='</help>'  then leave                         /*�*   "    "   </help>  */
if newV2            then say newV1
end   /*�*j*/
exit                                       /*�*stick a fork in it,  we're all done. */
/*�*══════════════════════════════════start of the in═line documentation AFTER the  <help>
<help>
To use the  YYYY  program, enter one of:

YYYY  numberOfItems
YYYY                            (no arguments uses the default)
YYYY  ?                         (to see this documentation)


─── where:  numberOfItems             is the number of items to be used.

If no  "numberOfItems"  are entered, the default of  100  is used.
</help>
════════════════════════════════════end of the in═line documentation BEFORE the </help> */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Documentation\documentation-1.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
