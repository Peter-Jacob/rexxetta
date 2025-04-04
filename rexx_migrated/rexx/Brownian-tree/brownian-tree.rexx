/*ͺ*REXX program animates and displays Brownian motion of dust in a field (with one seed).*/
mote     = 'Β·'                                   /*ͺ*character for a loose mote (of dust).*/
hole     = ' '                                   /*ͺ*    "      "  an empty spot in field.*/
seedPos  = 0                                     /*ͺ*if =0,  then use middle of the field.*/
/*ͺ* " -1,    "   "   a random placement.*/
/*ͺ*otherwise, place the seed at seedPos.*/
/*ͺ*use RANDSEED for RANDOM repeatability*/
parse arg sd sw motes tree randSeed .            /*ͺ*obtain optional arguments from the CL*/
if    sd=='' | sd==","     then sd= 0            /*ͺ*Not specified?  Then use the default.*/
if    sw=='' | sw==","     then sw= 0            /*ͺ* "      "         "   "   "      "   */
if motes=='' | motes==","  then  motes= '18%'    /*ͺ*The  %  dust motes in the field,     */
/*ͺ* [β]  either a #  βorβ  a # with a %.*/
if  tree=='' | tree==mote  then tree= "*"        /*ͺ*the character used to show the tree. */
if length(tree)==2         then tree=x2c(tree)   /*ͺ*tree character was specified in hex. */
if datatype(randSeed,'W')  then call random ,,randSeed    /*ͺ*if an integer, use the seed.*/
/*ͺ* [β]  set the first  random  number. */
if sd==0 | sw==0 then newV2= scrsize()               /*ͺ*Note: not all REXXes have SCRSIZE BIF*/
if sd==0         then sd= word(newV2, 1)  -  2       /*ͺ*adjust usable  depth  for the border.*/
if sw==0         then sw= word(newV2, 2)  -  1       /*ͺ*   "      "    width   "   "     "   */
seedAt= seedPos             /*ͺ*assume a seed position (initial pos).*/
if seedPos== 0  then seedAt= (sw % 2)   (sd % 2) /*ͺ*if it's a zero,  start in the middle.*/
if seedPos==-1  then seedAt= random(1, sw)       random(1,sd) /*ͺ*if negative, use random.*/
parse  var  seedAt    xs  ys  .                  /*ͺ*obtain the  X and Y  seed coΓΆrdinates*/
/*ͺ* [β]  if rightβmost β‘ '%', then use %*/
if right(motes, 1)=='%'  then motes= sd * sw * strip(motes, , '%')    %  100
newV1.= hole                                         /*ͺ*create the Brownian field, all empty.*/
do j=1  for motes                       /*ͺ*sprinkle a  # of dust motes randomly.*/
rx= random(1, sw);   ry= random(1, sd);     newV1.rx.ry= mote
end   /*ͺ*j*/                             /*ͺ* [β]  place a mote at random in field*/
/*ͺ*plant a seed from which the tree will grow from*/
newV1.xs.ys= tree                          /*ͺ*dust motes that affix themselves to the tree.  */
call show;  loX= 1;  hiX= sw                     /*ͺ*show field before we mess it up again*/
loY= 1;  hiY= sd                     /*ͺ*used to optimize the  mote searching.*/
/*ͺ*βββββββββββββββββββββββββββββββββββββββββββββββββ soooo, this is Brownian motion.*/
do Brownian=1  until \motion;  call show       /*ͺ*show Brownion motion until no motion.*/
minx= loX;  maxX= hiX;    loX= sw;  hiX= 1     /*ͺ*as the tree grows, the search for the*/
minY= loY;  maxY= hiY;    loY= sd;  hiy= 1     /*ͺ*dust motes gets faster due to croping*/
call BM                                        /*ͺ*invoke the Brownian movement routine.*/
if loX>1 & hiX<sw & loY>1 & hiY<sd  then iterate /*ͺ*Need cropping? No, then keep moving*/
call crop                                      /*ͺ*delete motes (moved off petri field).*/
end   /*ͺ*Brownian*/      /*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
crop:       do yc=-1  to sd+1  by sd+2;    do xc=-1  to sw+1;  newV1.xc.yc= hole;  end  /*ͺ*xc*/
end     /*ͺ*yc*/
do xc=-1  to sw+1  by sw+2;         do yc=-1  to sd+1;  newV1.xc.yc= hole;  end  /*ͺ*yc*/
end      /*ͺ*xc*/;                                     return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
show: 'CLS';    motion= 0;   do     ys=sd  for sd  by -1;   aRow=
do xs=1   for sw;          aRow= aRow  ||  newV1.xs.ys
end   /*ͺ*xs*/
say aRow
end       /*ͺ*ys*/;              return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
BM: do x  =minX  to maxX;    xm= x - 1;       xp= x + 1     /*ͺ*two handyβdandy values.   */
do y=minY  to maxY;    if newV1.x.y\==mote  then iterate  /*ͺ*Not a mote:  keep looking.*/
if x<loX  then loX=x;  if x>hiX  then hiX= x          /*ͺ*faster than hiX=max(X,hiX)*/
if y<loY  then loY=y;  if y>hiY  then hiY= y          /*ͺ*   "     "  hiY=max(y,hiY)*/
if newV1.xm.y ==tree  then do; newV1.x.y= tree; iterate; end  /*ͺ*there a neighbor of tree? */
if newV1.xp.y ==tree  then do; newV1.x.y= tree; iterate; end  /*ͺ*  "   "     "     "   "   */
ym= y - 1
if newV1.x.ym ==tree  then do; newV1.x.y= tree; iterate; end  /*ͺ*  "   "     "     "   "   */
if newV1.xm.ym==tree  then do; newV1.x.y= tree; iterate; end  /*ͺ*  "   "     "     "   "   */
if newV1.xp.ym==tree  then do; newV1.x.y= tree; iterate; end  /*ͺ*  "   "     "     "   "   */
yp = y + 1
if newV1.x.yp ==tree  then do; newV1.x.y= tree; iterate; end  /*ͺ*  "   "     "     "   "   */
if newV1.xm.yp==tree  then do; newV1.x.y= tree; iterate; end  /*ͺ*  "   "     "     "   "   */
if newV1.xp.yp==tree  then do; newV1.x.y= tree; iterate; end  /*ͺ*  "   "     "     "   "   */
motion= 1                                  /*ͺ* [β]  Brownian motion is coming.     */
xb= x + random(1, 3)  - 2                  /*ͺ*     apply Brownian motion for  X.   */
yb= y + random(1, 3)  - 2                  /*ͺ*       "       "       "    "   Y.   */
if newV1.xb.yb\==hole  then iterate            /*ͺ*can the mote actually move to there ?*/
newV1.x.y= hole                                /*ͺ*"empty out"  the old mote position.  */
newV1.xb.yb= mote                              /*ͺ*move the mote  (or possibly not).    */
if xb<loX  then loX= max(1, xb);   if xb>hiX  then hiX= min(sw, xb)
if yb<loY  then loY= max(1, yb);   if yb>hiY  then hiY= min(sd, yb)
end   /*ͺ*y*/                                /*ͺ* [β]  limit mote's movement to field.*/
end     /*ͺ*x*/;            return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Brownian-tree\brownian-tree.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
