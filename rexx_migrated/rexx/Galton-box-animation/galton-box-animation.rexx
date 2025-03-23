/*�*REXX pgm simulates Sir Francis Galton's box, aka: Galton Board, quincunx, bean machine*/
trace off                                        /*�*suppress any messages for negative RC*/
if newV31all(arg())  then exit                        /*�*Any documentation was wanted?   Done.*/
signal on halt                                   /*�*allow the user to  halt  the program.*/
parse arg rows balls freeze seed .               /*�*obtain optional arguments from the CL*/
if rows ==''  |  rows==","   then   rows=   0    /*�*Not specified?  Then use the default.*/
if balls==''  | balls==","   then  balls= 100    /*�* "      "         "   "   "     "    */
if freeze=='' | freeze==","  then freeze=   0    /*�* "      "         "   "   "     "    */
if datatype(seed, 'W')   then call random ,,seed /*�*Was a seed specified?  Then use seed.*/
pin  = '·';              ball = '☼'              /*�*define chars for a  pin  and a  ball.*/
parse value  scrsize()   with   sd  sw  .        /*�*obtain the terminal depth and width. */
if sd==0  then sd= 40                            /*�*Not defined by the OS?  Use a default*/
if sw==0  then sw= 80                            /*�* "     "     "  "   "    "  "    "   */
sd= sd - 3                                       /*�*define the usable       screen depth.*/
sw= sw - 1;  if sw//2  then sw= sw - 1           /*�*   "    "    "     odd     "   width.*/
if rows==0  then rows= (sw - 2 ) % 3             /*�*pins are on the first third of screen*/
call gen                                         /*�*gen a triangle of pins with some rows*/
do step=1;  call drop;  call show     /*�*show animation 'til run out of balls.*/
end   /*�*step*/                        /*�* [↑]  the dropping/showing   "   "   */
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
gen: newV26.=;  do r=0  by 2  to rows;     newV27=         /*�*build a triangle of pins for the box.*/
do pins=1  for r%2;   newV27= newV27  pin  /*�*build a row of pins to be displayed. */
end   /*�*pins*/
newV26.r= center( strip(newV27, 'T'), sw)       /*�*an easy method to build a triangle.  */
end     /*�*r*/;     newV28= 0;       return /*�*#:   is the number of balls dropped. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
drop: static= 1                                  /*�*used to indicate all balls are static*/
do c=sd-1  by -1  for sd-1;    n= c + 1  /*�*D:  current row;   N:  the next row. */
x= pos(ball, newV26.c);             y= x - 1  /*�*X:  position of a ball on the C line.*/
if x==0  then iterate                    /*�*No balls here?  Then nothing to drop.*/
do forever;   y= pos(ball, newV26.c, y+1)   /*�*drop most balls down to the next row.*/
if y==0  then iterate c                /*�*down with this row, go look at next. */
z= substr(newV26.n, y, 1)                   /*�*another ball is blocking this fall.  */
if z==' '  then do;  newV26.n= overlay(ball, newV26.n, y)   /*�*drop a ball straight down.*/
newV26.c= overlay(' ' , newV26.c, y)   /*�*make current ball a ghost.*/
static= 0                    /*�*indicate balls are moving.*/
iterate                      /*�*go keep looking for balls.*/
end
if z==pin  then do;  newV29= random(,999);   d= -1     /*�*assume falling to the left*/
if newV29//2  then d=  1     /*�*if odd random#, fall right*/
if substr(newV26.n, y+d, 1)\==' '  then iterate /*�*blocked fall*/
newV26.n= overlay(ball, newV26.n, y+d)
newV26.c= overlay(' ' , newV26.c, y  )
static= 0                    /*�*indicate balls are moving.*/
iterate                      /*�*go keep looking for balls.*/
end
end   /*�*forever*/
end     /*�*c*/                  /*�* [↓]   step//2    is used to avoid collisions. */
/*�* [↓]  drop a new ball ?   */
if newV28<balls & step//2  then do;    newV26.1= center(ball, sw+1);      newV28 = newV28 + 1;        end
else if static  then exit 2      /*�*insure balls are static.  */
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show: newV9;    do LR=sd  by -1  until newV26.LR\==''                 /*�*LR:  last row of data.*/
end   /*�*LR*/;                 ss= 'step' step    /*�* [↓]   display a row. */
do r=1  for LR; newV30= strip(newV26.r, 'T');  if r==2  then newV30= overlay(ss, newV30, sw-12); say newV30
end   /*�*r*/;   if step==freeze  then do;   say 'press ENTER ···';    pull;   end
return
/*�*══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════*/
halt:  say '***warning***  REXX program'   newV22    "execution halted by user.";      exit 1
newV31all:  newV31newV31=newV31;newV31=space(newV31);upper newV31;call newV13;newV21=right(newV31var('OS'),2)=='NT';newV9=word('CLS VMFCLEAR CLRSCREEN',1+newV31cms+newV17*2);if arg(1)\==1 then return 0;if wordpos(newV31,'? ?SAMPLES ?AUTHOR ?FLOW')==0 then return 0;newV7=']$H';call '$H' newV22 newV31;newV7=;return 1
newV31cal:  if symbol('!CALL')\=="VAR"  then newV7=;                                  return newV7
newV10:  newV10='ENVIRONMENT';    if newV11=='MSDOS' | newV6 | newV25 | newV15  then newV10= 'SYSTEM';    if newV16  then newV10= 'OS2'newV10;    newV2=  2=='f2'x;    if newV20  then newV10= 'DOS';                     return
newV13:  parse upper source newV11 newV12 newV13 . 1 . . newV22 newV23 newV24 .;  call newV11;   if newV19  then do;  newV30= lastpos('\', newV22);  newV24= left(newV22, newV30);  newV22= substr(newV22, newV30+1);  parse var newV22 newV22 '.' newV23;  end;  return word(0 newV22 newV23 newV24, 1 + ('0'arg(1) ) )
newV31rex:  parse upper version newV14 newV3 newV1 .; newV6= 'BY'==newV3; newV8= 'KEXX'==newV14; newV4= 'REXX/PERSONAL'==newV14 | 'REXX/PC'==newV14; newV25= 'REXX-R4'==newV14; newV5= 'REXX-REGINA'==left(newV14, 11); newV15= 'REXX-ROO'==newV14; call newV10;  return
newV11:  newV31cms= newV11=='CMS';  newV16= newV11=='OS2';  newV17= newV11=='TSO' | newV11=='MVS';  newV18= newV11=='VSE';  newV19= pos('DOS', newV11)\==0 | pos('WIN', newV11)\==0 | newV11=='CMD';  newV20= left(newV11, 6)=='DOSCRX';  call newV31rex;  return
newV31var:  call newV13;  if newV8  then return space( dosenv( arg(1) ) );              return space( value( arg(1), , newV10) )
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Galton-box-animation\galton-box-animation.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
