/*�*REXX program implements Langton's ant walk and displays the ant's path (finite field).*/
parse arg dir char seed .                        /*�*obtain optional arguments from the CL*/
if datatype(seed, 'W')   then call random ,,seed /*�*Integer? Then use it as a RANDOM SEED*/
if  dir=='' |  dir==","  then dir= random(1, 4)  /*�*ant is facing a random direction,    */
if char=='' | char==","  then char= '#'          /*�*binary colors:   0≡white,  1≡black.  */
parse value scrSize() with sd          sw .      /*�*obtain the terminal's depth and width*/
sd= sd -6;  sw= sw -1 /*�*adjust for     "      useble area.   */
xHome= 1000000;      yHome= 1000000           /*�*initially in the middle of nowhere.  */
x= xHome;            y= yHome                    /*�*start ant's walk in middle of nowhere*/
newV1.= 1  ;  newV1.0= 4 ;   newV1.2= 2 ;   newV1.3= 3;   newV1.4= 4 /*�* 1≡north   2≡east   3≡south   4≡west.*/
minX= x;  minY= y;   maxX= x;   maxY= y          /*�*initialize the min/max values for X,Y*/
newV2.= 0                                            /*�*the universe  (walk field)  is white.*/
do newV3=1  until (maxX-minY>sw)|(maxY-minY>sd) /*�*is the path out─of─bounds for screen?*/
black= newV2.x.y;                 newV2.x.y= \newV2.x.y /*�*invert (flip)  ant's cell color code.*/
if black  then dir= dir - 1                 /*�*if cell color was black,  turn  left.*/
else dir= dir + 1                 /*�* "   "    "    "  white,  turn right.*/
dir= newV1.dir                                  /*�*$ array handles/adjusts under & over.*/
select                            /*�*ant walks the direction it's facing. */
when dir==1  then y= y + 1        /*�*is ant walking north?  Then go up.   */
when dir==2  then x= x + 1        /*�* "  "     "     east?    "  "  right.*/
when dir==3  then y= y - 1        /*�* "  "     "    south?    "  "  down. */
when dir==4  then x= x - 1        /*�* "  "     "     west?    "  "  left. */
end   /*�*select*/                  /*�*the  DIRection  is always normalized.*/
minX= min(minX, x);    maxX= max(maxX, x)   /*�*find the minimum and maximum of  X.  */
minY= min(minY, y);    maxY= max(maxY, y)   /*�*  "   "     "     "     "     "  Y.  */
end   /*�*steps*/                             /*�* [↑]  ant walks  hither and thither. */
/*�*finished walking, it's out-of-bounds.*/
say center(" Langton's ant walked "     newV3     ' steps ', sw, "─")
newV2.xHome.yHome= '█'                               /*�*show the ant's initial starting point*/
newV2.x.y=         '∙'                               /*�*show where the ant went out─of─bounds*/
/*�* [↓]  show Langton's ant's trail.    */
do    y=maxY  to minY  by -1;  newV4=           /*�*display a single  row  of cells.     */
do x=minX  to maxX;         newV4=newV4 || newV2.x.y /*�*build a cell row for the display.    */
end   /*�*x*/                              /*�* [↓]  strip trailing blanks from line*/
newV4= strip( translate(newV4, char, 10),  'T')     /*�*color the cells:   black  or  white. */
if newV4\==''  then say newV4                       /*�*display line (strip trailing blanks).*/
end      /*�*y*/                              /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Langtons-ant\langtons-ant-1.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
