/*�*REXX program determines the  least costly path  between  two vertices  given a list.  */
newV4.= copies(9, digits() )                         /*�*edge cost:  indicates doesn't exist. */
xList= '!. @. $. beg fin bestP best$ xx yy'      /*�*common  EXPOSEd  variables for subs. */
newV2=  'abcdefghijklmnopqrstuvwxyz'              /*�*list of all the possible vertices.   */
verts= 0;  edges= 0                              /*�*the number of vertices and also edges*/
do newV7=1  for length(newV2);              newV8= substr(newV2, newV7, 1)
call value translate(newV8), newV7;      newV3.newV7= newV8
end   /*�*#*/
call defnewV9  a  b   7                              /*�*define an  edge  and  its  cost.     */
call defnewV9  a  c   9                              /*�*   "    "    "    "    "     "       */
call defnewV9  a  f  14                              /*�*   "    "    "    "    "     "       */
call defnewV9  b  c  10                              /*�*   "    "    "    "    "     "       */
call defnewV9  b  d  15                              /*�*   "    "    "    "    "     "       */
call defnewV9  c  d  11                              /*�*   "    "    "    "    "     "       */
call defnewV9  c  f   2                              /*�*   "    "    "    "    "     "       */
call defnewV9  d  e   6                              /*�*   "    "    "    "    "     "       */
call defnewV9  e  f   9                              /*�*   "    "    "    "    "     "       */
beg= a;    fin= e                                /*�*the  BEGin  and  FINish  vertexes.   */
say;       say 'number of    edges = '   edges
say 'number of vertices = '   verts                 "    ["left(newV2, verts)"]"
bestnewV9= newV4.;    bestP=
say;                         do jv=2  to verts;    call paths verts, jv;       end  /*�*jv*/
newV1= right('cost =', 16)
if bestP==newV4.  then say 'no path found.'
else say 'best path ='   translate(bestP, newV2, 123456789)   newV1   bestnewV9
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
apath: parse arg pathx 1 p1 2 p2 3;             Lp= length(pathx);              newV9= newV4.p1.p2
if newV9>=bestnewV9  then return
pv= p2;                      do ka=3  to Lp;   newV8= substr(pathx, ka, 1)
if newV4.pv.newV8>=bestnewV9  then return
newV9= newV9 + newV4.pv.newV8;    if newV9>=bestnewV9  then return;      pv= newV8
end   /*�*ka*/
bestnewV9= newV9;    bestP= pathx
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
defnewV9:  parse arg xx yy newV9 .;         if newV4.xx.yy<newV9  &  newV4.yy.xx<newV9  |  xx==yy  then return
edges= edges + 1;            verts= verts  +  (newV4.xx\==0)  +  (newV4.yy\==0)
newV4.xx= 0;        newV4.yy= 0;     newV4.xx.yy= newV9
say left('', 40)     "cost of    "     newV3.xx     '───►'     newV3.yy     "   is "    newV9
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
paths: procedure expose (xList);    parse arg xx, yy, newV5.
do kp=1  for xx;     newV8= kp;   newV6.kp= newV8;   end   /*�*build a path list.*/
call .path 1
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
.path: procedure expose (xList);    parse arg newV10, newV8
if newV10>yy  then do;            if newV5.1\==beg | newV5.yy\==fin  then return
do newV7=1  for yy;  newV8= newV8 || newV5.newV7;  end  /*�*#*/;             call apath newV8
end
else do qq=1  for xx                    /*�*build vertex paths recursively*/
do kp=1  for newV10-1;  if newV5.kp==newV6.qq  then iterate qq;  end  /*�*kp*/
newV5.newV10= newV6.qq;     call .path newV10+1      /*�*recursive call for next path. */
end   /*�*qq*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Dijkstras-algorithm\dijkstras-algorithm.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
