/*�*REXX program uses Floyd─Warshall algorithm to find shortest distance between vertices.*/
v= 4             /*�*███       {1}       ███*/     /*�*number of vertices in weighted graph.*/
newV1.= 99999999     /*�*███    4 /   \ -2   ███*/     /*�*the default distance  (edge weight). */
newV1.1.3= -2        /*�*███     /  3  \     ███*/     /*�*the distance (weight) for an edge.   */
newV1.2.1=  4        /*�*███  {2} ────► {3}  ███*/     /*�* "     "         "     "   "   "     */
newV1.2.3=  3        /*�*███     \     /     ███*/     /*�* "     "         "     "   "   "     */
newV1.3.4=  2        /*�*███   -1 \   / 2    ███*/     /*�* "     "         "     "   "   "     */
newV1.4.2= -1        /*�*███       {4}       ███*/     /*�* "     "         "     "   "   "     */

do     k=1  for v
do   i=1  for v
do j=1  for v;  newV2= newV1.i.k + newV1.k.j /*�*add two nodes together.              */
if newV1.i.j>newV2  then newV1.i.j= newV2        /*�*use a new distance (weight) for edge.*/
end   /*�*j*/
end     /*�*i*/
end       /*�*k*/
w= 12;                     newV3= left('', 20)       /*�*width of the columns for the output. */
say newV3 center('vertices',w) center('distance', w) /*�*display the  1st  line of the title. */
say newV3 center('pair'    ,w) center('(weight)', w) /*�*   "     "   2nd    "   "  "    "    */
say newV3 copies('═'       ,w) copies('═'       , w) /*�*   "     "   3rd    "   "  "    "    */
/*�* [↓]  display edge distances (weight)*/
do   f=1  for v                               /*�*process each of the "from" vertices. */
do t=1  for v;    if f==t  then iterate     /*�*   "      "   "  "   "to"      "     */
say  newV3      center(f '───►' t, w)        right(newV1.f.t, w % 2)
end   /*�*t*/                                 /*�* [↑]  the distance between 2 vertices*/
end     /*�*f*/                                 /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Floyd-Warshall-algorithm\floyd-warshall-algorithm.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
