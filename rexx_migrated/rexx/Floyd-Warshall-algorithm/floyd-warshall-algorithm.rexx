/*ª*REXX program uses Floydâ”€Warshall algorithm to find shortest distance between vertices.*/
v= 4             /*ª*â–ˆâ–ˆâ–ˆ       {1}       â–ˆâ–ˆâ–ˆ*/     /*ª*number of vertices in weighted graph.*/
newV1.= 99999999     /*ª*â–ˆâ–ˆâ–ˆ    4 /   \ -2   â–ˆâ–ˆâ–ˆ*/     /*ª*the default distance  (edge weight). */
newV1.1.3= -2        /*ª*â–ˆâ–ˆâ–ˆ     /  3  \     â–ˆâ–ˆâ–ˆ*/     /*ª*the distance (weight) for an edge.   */
newV1.2.1=  4        /*ª*â–ˆâ–ˆâ–ˆ  {2} â”€â”€â”€â”€â–º {3}  â–ˆâ–ˆâ–ˆ*/     /*ª* "     "         "     "   "   "     */
newV1.2.3=  3        /*ª*â–ˆâ–ˆâ–ˆ     \     /     â–ˆâ–ˆâ–ˆ*/     /*ª* "     "         "     "   "   "     */
newV1.3.4=  2        /*ª*â–ˆâ–ˆâ–ˆ   -1 \   / 2    â–ˆâ–ˆâ–ˆ*/     /*ª* "     "         "     "   "   "     */
newV1.4.2= -1        /*ª*â–ˆâ–ˆâ–ˆ       {4}       â–ˆâ–ˆâ–ˆ*/     /*ª* "     "         "     "   "   "     */

do     k=1  for v
do   i=1  for v
do j=1  for v;  newV2= newV1.i.k + newV1.k.j /*ª*add two nodes together.              */
if newV1.i.j>newV2  then newV1.i.j= newV2        /*ª*use a new distance (weight) for edge.*/
end   /*ª*j*/
end     /*ª*i*/
end       /*ª*k*/
w= 12;                     newV3= left('', 20)       /*ª*width of the columns for the output. */
say newV3 center('vertices',w) center('distance', w) /*ª*display the  1st  line of the title. */
say newV3 center('pair'    ,w) center('(weight)', w) /*ª*   "     "   2nd    "   "  "    "    */
say newV3 copies('â•'       ,w) copies('â•'       , w) /*ª*   "     "   3rd    "   "  "    "    */
/*ª* [â†“]  display edge distances (weight)*/
do   f=1  for v                               /*ª*process each of the "from" vertices. */
do t=1  for v;    if f==t  then iterate     /*ª*   "      "   "  "   "to"      "     */
say  newV3      center(f 'â”€â”€â”€â–º' t, w)        right(newV1.f.t, w % 2)
end   /*ª*t*/                                 /*ª* [â†‘]  the distance between 2 vertices*/
end     /*ª*f*/                                 /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Floyd-Warshall-algorithm\floyd-warshall-algorithm.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
