/*�*REXX program animates and displays Brownian motion of dust in a field (with one seed).*/
mote     = '·'                                   /*�*character for a loose mote (of dust).*/
hole     = ' '                                   /*�*    "      "  an empty spot in field.*/
seedPos  = 0                                     /*�*if =0,  then use middle of the field.*/
/*�* " -1,    "   "   a random placement.*/
/*�*otherwise, place the seed at seedPos.*/
/*�*use RANDSEED for RANDOM repeatability*/
parse arg sd sw motes tree randSeed .            /*�*obtain optional arguments from the CL*/
if    sd=='' | sd==","     then sd= 0            /*�*Not specified?  Then use the default.*/
if    sw=='' | sw==","     then sw= 0            /*�* "      "         "   "   "      "   */
if motes=='' | motes==","  then  motes= '18%'    /*�*The  %  dust motes in the field,     */
/*�* [↑]  either a #  ─or─  a # with a %.*/
if  tree=='' | tree==mote  then tree= "*"        /*�*the character used to show the tree. */
if length(tree)==2         then tree=x2c(tree)   /*�*tree character was specified in hex. */
if datatype(randSeed,'W')  then call random ,,randSeed    /*�*if an integer, use the seed.*/
/*�* [↑]  set the first  random  number. */
if sd==0 | sw==0 then newV2= scrsize()               /*�*Note: not all REXXes have SCRSIZE BIF*/
if sd==0         then sd= word(newV2, 1)  -  2       /*�*adjust usable  depth  for the border.*/
if sw==0         then sw= word(newV2, 2)  -  1       /*�*   "      "    width   "   "     "   */
seedAt= seedPos             /*�*assume a seed position (initial pos).*/
if seedPos== 0  then seedAt= (sw % 2)   (sd % 2) /*�*if it's a zero,  start in the middle.*/
if seedPos==-1  then seedAt= random(1, sw)       random(1,sd) /*�*if negative, use random.*/
parse  var  seedAt    xs  ys  .                  /*�*obtain the  X and Y  seed coördinates*/
/*�* [↓]  if right─most ≡ '%', then use %*/
if right(motes, 1)=='%'  then motes= sd * sw * strip(motes, , '%')    %  100
newV1.= hole                                         /*�*create the Brownian field, all empty.*/
do j=1  for motes                       /*�*sprinkle a  # of dust motes randomly.*/
rx= random(1, sw);   ry= random(1, sd);     newV1.rx.ry= mote
end   /*�*j*/                             /*�* [↑]  place a mote at random in field*/
/*�*plant a seed from which the tree will grow from*/
newV1.xs.ys= tree                          /*�*dust motes that affix themselves to the tree.  */
call show;  loX= 1;  hiX= sw                     /*�*show field before we mess it up again*/
loY= 1;  hiY= sd                     /*�*used to optimize the  mote searching.*/
/*�*▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ soooo, this is Brownian motion.*/
do Brownian=1  until \motion;  call show       /*�*show Brownion motion until no motion.*/
minx= loX;  maxX= hiX;    loX= sw;  hiX= 1     /*�*as the tree grows, the search for the*/
minY= loY;  maxY= hiY;    loY= sd;  hiy= 1     /*�*dust motes gets faster due to croping*/
call BM                                        /*�*invoke the Brownian movement routine.*/
if loX>1 & hiX<sw & loY>1 & hiY<sd  then iterate /*�*Need cropping? No, then keep moving*/
call crop                                      /*�*delete motes (moved off petri field).*/
end   /*�*Brownian*/      /*�*▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
crop:       do yc=-1  to sd+1  by sd+2;    do xc=-1  to sw+1;  newV1.xc.yc= hole;  end  /*�*xc*/
end     /*�*yc*/
do xc=-1  to sw+1  by sw+2;         do yc=-1  to sd+1;  newV1.xc.yc= hole;  end  /*�*yc*/
end      /*�*xc*/;                                     return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show: 'CLS';    motion= 0;   do     ys=sd  for sd  by -1;   aRow=
do xs=1   for sw;          aRow= aRow  ||  newV1.xs.ys
end   /*�*xs*/
say aRow
end       /*�*ys*/;              return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
BM: do x  =minX  to maxX;    xm= x - 1;       xp= x + 1     /*�*two handy─dandy values.   */
do y=minY  to maxY;    if newV1.x.y\==mote  then iterate  /*�*Not a mote:  keep looking.*/
if x<loX  then loX=x;  if x>hiX  then hiX= x          /*�*faster than hiX=max(X,hiX)*/
if y<loY  then loY=y;  if y>hiY  then hiY= y          /*�*   "     "  hiY=max(y,hiY)*/
if newV1.xm.y ==tree  then do; newV1.x.y= tree; iterate; end  /*�*there a neighbor of tree? */
if newV1.xp.y ==tree  then do; newV1.x.y= tree; iterate; end  /*�*  "   "     "     "   "   */
ym= y - 1
if newV1.x.ym ==tree  then do; newV1.x.y= tree; iterate; end  /*�*  "   "     "     "   "   */
if newV1.xm.ym==tree  then do; newV1.x.y= tree; iterate; end  /*�*  "   "     "     "   "   */
if newV1.xp.ym==tree  then do; newV1.x.y= tree; iterate; end  /*�*  "   "     "     "   "   */
yp = y + 1
if newV1.x.yp ==tree  then do; newV1.x.y= tree; iterate; end  /*�*  "   "     "     "   "   */
if newV1.xm.yp==tree  then do; newV1.x.y= tree; iterate; end  /*�*  "   "     "     "   "   */
if newV1.xp.yp==tree  then do; newV1.x.y= tree; iterate; end  /*�*  "   "     "     "   "   */
motion= 1                                  /*�* [↓]  Brownian motion is coming.     */
xb= x + random(1, 3)  - 2                  /*�*     apply Brownian motion for  X.   */
yb= y + random(1, 3)  - 2                  /*�*       "       "       "    "   Y.   */
if newV1.xb.yb\==hole  then iterate            /*�*can the mote actually move to there ?*/
newV1.x.y= hole                                /*�*"empty out"  the old mote position.  */
newV1.xb.yb= mote                              /*�*move the mote  (or possibly not).    */
if xb<loX  then loX= max(1, xb);   if xb>hiX  then hiX= min(sw, xb)
if yb<loY  then loY= max(1, yb);   if yb>hiY  then hiY= min(sd, yb)
end   /*�*y*/                                /*�* [↑]  limit mote's movement to field.*/
end     /*�*x*/;            return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Brownian-tree\brownian-tree.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
