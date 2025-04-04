/*�*REXX pgm draws a Sierpinski triangle by running the  chaos game  with a million points*/
parse value  scrsize()   with  sd  sw  .         /*�*obtain the depth and width of screen.*/
sw= sw - 2                                       /*�*adjust the screen width down by two. */
sd= sd - 4                                       /*�*   "    "     "   depth   "   " four.*/
parse arg pts chr seed .                         /*�*obtain optional arguments from the CL*/
if pts=='' | pts==","  then pts= 1000000         /*�*Not specified?  Then use the default.*/
if chr=='' | chr==","  then chr= '∙'             /*�* "      "         "   "   "      "   */
if datatype(seed,'W')  then call random ,,seed   /*�*Is  specified?    "   "  RANDOM seed.*/
x= sw;       hx= x % 2;     y= sd                /*�*define the initial starting position.*/
newV1.= ' '                                          /*�*   "   all screen points as a blank. */
do pts;  newV2= random(1, 3)                 /*�* [↓]  draw a # of (million?)  points.*/
select                    /*�*?:  will be a random number: 1 ──► 3.*/
when newV2==1  then parse value          x%2          y%2   with   x  y
when newV2==2  then parse value  hx+(hx-x)%2  sd-(sd-y)%2   with   x  y
otherwise       parse value  sw-(sw-x)%2          y%2   with   x  y
end   /*�*select*/
newV1.x.y= chr                               /*�*set the    X, Y    point to a bullet.*/
end   /*�*pts*/                            /*�* [↑]  one million points ≡ overkill? */
/*�* [↓]  display the points to the term.*/
do      row=sd   to 0  by -1;   newV3=       /*�*display the points, one row at a time*/
do col=0   for sw+2                 /*�*   "     a  row (one line) of image. */
newV3= newV3 || newV1.col.row                   /*�*construct a  "    "    "    "   "    */
end   /*�*col*/                       /*�*Note: display image from top──►bottom*/
/*�* [↑]  strip trailing blanks (output).*/
say strip(newV3, 'T')                        /*�*display one row (line) of the image. */
end        /*�*row*/                       /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Chaos-game\chaos-game.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
