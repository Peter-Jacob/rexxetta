/*�*REXX program solves the  Dinesman's multiple─dwelling  problem with "natural" wording.*/
names= 'Baker Cooper Fletcher Miller Smith'      /*�*names of multiple─dwelling tenants.  */
newV1= words(names)                           /*�*the number of tenants in the building*/
floors= 5;              top= floors;   bottom= 1 /*�*floor 1 is the ground (bottom) floor.*/
newV3= 0                                             /*�*the number of solutions found so far.*/
do         newV2.1=1  for floors                /*�*iterate through all floors for rules.*/
do       newV2.2=1  for floors                /*�*   "       "     "     "    "    "   */
do     newV2.3=1  for floors                /*�*   "       "     "     "    "    "   */
do   newV2.4=1  for floors                /*�*   "       "     "     "    "    "   */
do newV2.5=1  for floors                /*�*   "       "     "     "    "    "   */
call set
do    j=1   for floors-1;  a= newV2.j /*�* [↓]  people don't live on same floor*/
do k=j+1  to floors            /*�*see if any people live on same floor.*/
if a==newV2.k  then iterate newV2.5    /*�*Is anyone cohabiting?  Then not valid*/
end   /*�*k*/
end      /*�*j*/
call Waldo                          /*�* ◄══ where the rubber meets the road.*/
end        /*�*@.5*/
end          /*�*@.4*/
end            /*�*@.3*/
end              /*�*@.2*/
end                /*�*@.1*/

say 'found '     newV3       " solution"s(newV3).        /*�*display the number of solutions found*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
set:      do p=1  for newV1;   call value word(names, p), newV2.p;   end;       return
s:     if arg(1)=1  then return '';    return "s"        /*�*a simple pluralizer function.*/
th:    arg x;  x=abs(x);  return word('th st nd rd', 1 +x// 10* (x//100%10\==1)*(x//10<4))
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Waldo: if Baker    == top                                          then return
if Cooper   == bottom                                       then return
if Fletcher == bottom         |   Fletcher == top           then return
if Miller   \> Cooper                                       then return
if Smith    == Fletcher - 1   |   Smith    == Fletcher + 1  then return
if Fletcher == Cooper   - 1   |   Fletcher == Cooper   + 1  then return
newV3= newV3 + 1                                  /*�* [↑]  "|"  is REXX's "or" comparator.*/
say;           do p=1  for newV1;             tenant= word(names, p)
say right(tenant, 35)  'lives on the'     newV2.p || th(newV2.p)    "floor."
end   /*�*p*/                /*�* [↑]  "||"  is REXX's concatenation. */
return                                    /*�* [↑]  show tenants in order in NAMES.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Dinesmans-multiple-dwelling-problem\dinesmans-multiple-dwelling-problem.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
