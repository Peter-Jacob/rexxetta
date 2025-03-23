/*�*REXX program  demonstrates  (with displays)  a method of   parametric polymorphism.   */
call newRoot  1.00, 3                            /*�*new root,  and also indicate 3 stems.*/
/*�* [↓]  no need to label the stems.    */
call addStem  1.10                               /*�*a new stem  and  its initial value.  */
call addStem  1.11                               /*�*"  "    "    "    "     "      "     */
call addStem  1.12                               /*�*"  "    "    "    "     "      "     */
call addStem  1.20                               /*�*"  "    "    "    "     "      "     */
call addStem  1.21                               /*�*"  "    "    "    "     "      "     */
call addStem  1.22                               /*�*"  "    "    "    "     "      "     */
call sayNodes             /*�*display some nicely formatted values.*/
call modRoot  50                                 /*�*modRoot will add fifty to all stems. */
call sayNodes             /*�*display some nicely formatted values.*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
addStem:  nodes= nodes + 1;   do j=1  for stems;   root.nodes.j= arg(1);   end;     return
newRoot:  parse arg newV1,stems; nodes= -1; call addStem copies('═',9); call addStem newV1; return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
modRoot:  arg #;  do    j=1  for nodes           /*�*traipse through all the defined nodes*/
do k=1  for stems           /*�*add bias ──►───────────────────────┐ */
if datatype(root.j.k, 'N')  then root.j.k= root.j.k + #   /*�* ◄───┘ */
end   /*�*k*/                 /*�* [↑]  add  if  stem value is numeric.*/
end      /*�*j*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sayNodes: w= 9;   do    j=0  to  nodes;  newV2=      /*�*ensure each of the nodes gets shown. */
do k=1  for stems;  newV2= newV2 center(root.j.k, w)  /*�*concatenate a node.*/
end   /*�*k*/
newV3= word('node='j,  1 + (j<1) ) /*�*define a label for this line's output*/
say center(newV3, w)  substr(newV2, 2) /*�*ignore 1st (leading) blank which was */
end      /*�*j*/                 /*�* [↑]         caused by concatenation.*/
say                                    /*�*show a blank line to separate outputs*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Parametric-polymorphism\parametric-polymorphism.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
