/*ͺ*REXX program uses FloydβWarshall algorithm to find shortest distance between vertices.*/
v= 4             /*ͺ*βββ       {1}       βββ*/     /*ͺ*number of vertices in weighted graph.*/
newV1.= 99999999     /*ͺ*βββ    4 /   \ -2   βββ*/     /*ͺ*the default distance  (edge weight). */
newV1.1.3= -2        /*ͺ*βββ     /  3  \     βββ*/     /*ͺ*the distance (weight) for an edge.   */
newV1.2.1=  4        /*ͺ*βββ  {2} βββββΊ {3}  βββ*/     /*ͺ* "     "         "     "   "   "     */
newV1.2.3=  3        /*ͺ*βββ     \     /     βββ*/     /*ͺ* "     "         "     "   "   "     */
newV1.3.4=  2        /*ͺ*βββ   -1 \   / 2    βββ*/     /*ͺ* "     "         "     "   "   "     */
newV1.4.2= -1        /*ͺ*βββ       {4}       βββ*/     /*ͺ* "     "         "     "   "   "     */

do     k=1  for v
do   i=1  for v
do j=1  for v;  newV2= newV1.i.k + newV1.k.j /*ͺ*add two nodes together.              */
if newV1.i.j>newV2  then newV1.i.j= newV2        /*ͺ*use a new distance (weight) for edge.*/
end   /*ͺ*j*/
end     /*ͺ*i*/
end       /*ͺ*k*/
w= 12;                     newV3= left('', 20)       /*ͺ*width of the columns for the output. */
say newV3 center('vertices',w) center('distance', w) /*ͺ*display the  1st  line of the title. */
say newV3 center('pair'    ,w) center('(weight)', w) /*ͺ*   "     "   2nd    "   "  "    "    */
say newV3 copies('β'       ,w) copies('β'       , w) /*ͺ*   "     "   3rd    "   "  "    "    */
/*ͺ* [β]  display edge distances (weight)*/
do   f=1  for v                               /*ͺ*process each of the "from" vertices. */
do t=1  for v;    if f==t  then iterate     /*ͺ*   "      "   "  "   "to"      "     */
say  newV3      center(f 'ββββΊ' t, w)        right(newV1.f.t, w % 2)
end   /*ͺ*t*/                                 /*ͺ* [β]  the distance between 2 vertices*/
end     /*ͺ*f*/                                 /*ͺ*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Floyd-Warshall-algorithm\floyd-warshall-algorithm.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
