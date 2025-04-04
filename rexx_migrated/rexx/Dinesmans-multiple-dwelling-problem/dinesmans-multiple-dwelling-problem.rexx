/*ͺ*REXX program solves the  Dinesman's multipleβdwelling  problem with "natural" wording.*/
names= 'Baker Cooper Fletcher Miller Smith'      /*ͺ*names of multipleβdwelling tenants.  */
newV1= words(names)                           /*ͺ*the number of tenants in the building*/
floors= 5;              top= floors;   bottom= 1 /*ͺ*floor 1 is the ground (bottom) floor.*/
newV3= 0                                             /*ͺ*the number of solutions found so far.*/
do         newV2.1=1  for floors                /*ͺ*iterate through all floors for rules.*/
do       newV2.2=1  for floors                /*ͺ*   "       "     "     "    "    "   */
do     newV2.3=1  for floors                /*ͺ*   "       "     "     "    "    "   */
do   newV2.4=1  for floors                /*ͺ*   "       "     "     "    "    "   */
do newV2.5=1  for floors                /*ͺ*   "       "     "     "    "    "   */
call set
do    j=1   for floors-1;  a= newV2.j /*ͺ* [β]  people don't live on same floor*/
do k=j+1  to floors            /*ͺ*see if any people live on same floor.*/
if a==newV2.k  then iterate newV2.5    /*ͺ*Is anyone cohabiting?  Then not valid*/
end   /*ͺ*k*/
end      /*ͺ*j*/
call Waldo                          /*ͺ* βββ where the rubber meets the road.*/
end        /*ͺ*@.5*/
end          /*ͺ*@.4*/
end            /*ͺ*@.3*/
end              /*ͺ*@.2*/
end                /*ͺ*@.1*/

say 'found '     newV3       " solution"s(newV3).        /*ͺ*display the number of solutions found*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
set:      do p=1  for newV1;   call value word(names, p), newV2.p;   end;       return
s:     if arg(1)=1  then return '';    return "s"        /*ͺ*a simple pluralizer function.*/
th:    arg x;  x=abs(x);  return word('th st nd rd', 1 +x// 10* (x//100%10\==1)*(x//10<4))
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
Waldo: if Baker    == top                                          then return
if Cooper   == bottom                                       then return
if Fletcher == bottom         |   Fletcher == top           then return
if Miller   \> Cooper                                       then return
if Smith    == Fletcher - 1   |   Smith    == Fletcher + 1  then return
if Fletcher == Cooper   - 1   |   Fletcher == Cooper   + 1  then return
newV3= newV3 + 1                                  /*ͺ* [β]  "|"  is REXX's "or" comparator.*/
say;           do p=1  for newV1;             tenant= word(names, p)
say right(tenant, 35)  'lives on the'     newV2.p || th(newV2.p)    "floor."
end   /*ͺ*p*/                /*ͺ* [β]  "||"  is REXX's concatenation. */
return                                    /*ͺ* [β]  show tenants in order in NAMES.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Dinesmans-multiple-dwelling-problem\dinesmans-multiple-dwelling-problem.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
