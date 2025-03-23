/*ª*REXX program implements Langton's ant walk and displays the ant's path (finite field).*/
parse arg dir char seed .                        /*ª*obtain optional arguments from the CL*/
if datatype(seed, 'W')   then call random ,,seed /*ª*Integer? Then use it as a RANDOM SEED*/
if  dir=='' |  dir==","  then dir= random(1, 4)  /*ª*ant is facing a random direction,    */
if char=='' | char==","  then char= '#'          /*ª*binary colors:   0â‰¡white,  1â‰¡black.  */
parse value scrSize() with sd          sw .      /*ª*obtain the terminal's depth and width*/
sd= sd -6;  sw= sw -1 /*ª*adjust for     "      useble area.   */
xHome= 1000000;      yHome= 1000000           /*ª*initially in the middle of nowhere.  */
x= xHome;            y= yHome                    /*ª*start ant's walk in middle of nowhere*/
newV1.= 1  ;  newV1.0= 4 ;   newV1.2= 2 ;   newV1.3= 3;   newV1.4= 4 /*ª* 1â‰¡north   2â‰¡east   3â‰¡south   4â‰¡west.*/
minX= x;  minY= y;   maxX= x;   maxY= y          /*ª*initialize the min/max values for X,Y*/
newV2.= 0                                            /*ª*the universe  (walk field)  is white.*/
do newV3=1  until (maxX-minY>sw)|(maxY-minY>sd) /*ª*is the path outâ”€ofâ”€bounds for screen?*/
black= newV2.x.y;                 newV2.x.y= \newV2.x.y /*ª*invert (flip)  ant's cell color code.*/
if black  then dir= dir - 1                 /*ª*if cell color was black,  turn  left.*/
else dir= dir + 1                 /*ª* "   "    "    "  white,  turn right.*/
dir= newV1.dir                                  /*ª*$ array handles/adjusts under & over.*/
select                            /*ª*ant walks the direction it's facing. */
when dir==1  then y= y + 1        /*ª*is ant walking north?  Then go up.   */
when dir==2  then x= x + 1        /*ª* "  "     "     east?    "  "  right.*/
when dir==3  then y= y - 1        /*ª* "  "     "    south?    "  "  down. */
when dir==4  then x= x - 1        /*ª* "  "     "     west?    "  "  left. */
end   /*ª*select*/                  /*ª*the  DIRection  is always normalized.*/
minX= min(minX, x);    maxX= max(maxX, x)   /*ª*find the minimum and maximum of  X.  */
minY= min(minY, y);    maxY= max(maxY, y)   /*ª*  "   "     "     "     "     "  Y.  */
end   /*ª*steps*/                             /*ª* [â†‘]  ant walks  hither and thither. */
/*ª*finished walking, it's out-of-bounds.*/
say center(" Langton's ant walked "     newV3     ' steps ', sw, "â”€")
newV2.xHome.yHome= 'â–ˆ'                               /*ª*show the ant's initial starting point*/
newV2.x.y=         'âˆ™'                               /*ª*show where the ant went outâ”€ofâ”€bounds*/
/*ª* [â†“]  show Langton's ant's trail.    */
do    y=maxY  to minY  by -1;  newV4=           /*ª*display a single  row  of cells.     */
do x=minX  to maxX;         newV4=newV4 || newV2.x.y /*ª*build a cell row for the display.    */
end   /*ª*x*/                              /*ª* [â†“]  strip trailing blanks from line*/
newV4= strip( translate(newV4, char, 10),  'T')     /*ª*color the cells:   black  or  white. */
if newV4\==''  then say newV4                       /*ª*display line (strip trailing blanks).*/
end      /*ª*y*/                              /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Langtons-ant\langtons-ant-1.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
