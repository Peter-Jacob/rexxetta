/*ͺ*REXX program illustrates how to display embedded documentation (help) within REXX code*/
parse arg doc                                    /*ͺ*obtain (all) the arguments from C.L. */
if doc='?'  then call help                       /*ͺ*show documentation if arg=a single ? */
/*ͺ*β β β β β β β β β regularβ β β β β β β β β β β β β β β β β β β β β β β β β */
/*ͺ*β β β β β β β β β β β β β β β β β mainlineβ β β β β β β β β β β β β β β β */
/*ͺ*β β β β β β β β β β β β β β β β β β β β β β β β β β codeβ β β β β β β β β β β */
/*ͺ*β β β β β β β β β β β β β β β β β β β β β β β β β β β β β β β here.β β β β β */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
help: newV2=0;    do j=1  for sourceline();  newV1=sourceline(j)         /*ͺ*get a line of source.*/
if newV1='<help>'   then do;  newV2=1;  iterate;  end      /*ͺ*search for  <help>   */
if newV1='</help>'  then leave                         /*ͺ*   "    "   </help>  */
if newV2            then say newV1
end   /*ͺ*j*/
exit                                       /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββstart of the inβline documentation AFTER the  <help>
<help>
To use the  YYYY  program, enter one of:

YYYY  numberOfItems
YYYY                            (no arguments uses the default)
YYYY  ?                         (to see this documentation)


βββ where:  numberOfItems             is the number of items to be used.

If no  "numberOfItems"  are entered, the default of  100  is used.
</help>
ββββββββββββββββββββββββββββββββββββend of the inβline documentation BEFORE the </help> */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Documentation\documentation-1.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
