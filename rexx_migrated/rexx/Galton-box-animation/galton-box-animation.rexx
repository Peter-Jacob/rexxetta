/*ช*REXX pgm simulates Sir Francis Galton's box, aka: Galton Board, quincunx, bean machine*/
trace off                                        /*ช*suppress any messages for negative RC*/
if newV31all(arg())  then exit                        /*ช*Any documentation was wanted?   Done.*/
signal on halt                                   /*ช*allow the user to  halt  the program.*/
parse arg rows balls freeze seed .               /*ช*obtain optional arguments from the CL*/
if rows ==''  |  rows==","   then   rows=   0    /*ช*Not specified?  Then use the default.*/
if balls==''  | balls==","   then  balls= 100    /*ช* "      "         "   "   "     "    */
if freeze=='' | freeze==","  then freeze=   0    /*ช* "      "         "   "   "     "    */
if datatype(seed, 'W')   then call random ,,seed /*ช*Was a seed specified?  Then use seed.*/
pin  = 'ยท';              ball = 'โผ'              /*ช*define chars for a  pin  and a  ball.*/
parse value  scrsize()   with   sd  sw  .        /*ช*obtain the terminal depth and width. */
if sd==0  then sd= 40                            /*ช*Not defined by the OS?  Use a default*/
if sw==0  then sw= 80                            /*ช* "     "     "  "   "    "  "    "   */
sd= sd - 3                                       /*ช*define the usable       screen depth.*/
sw= sw - 1;  if sw//2  then sw= sw - 1           /*ช*   "    "    "     odd     "   width.*/
if rows==0  then rows= (sw - 2 ) % 3             /*ช*pins are on the first third of screen*/
call gen                                         /*ช*gen a triangle of pins with some rows*/
do step=1;  call drop;  call show     /*ช*show animation 'til run out of balls.*/
end   /*ช*step*/                        /*ช* [โ]  the dropping/showing   "   "   */
exit 0                                           /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
gen: newV26.=;  do r=0  by 2  to rows;     newV27=         /*ช*build a triangle of pins for the box.*/
do pins=1  for r%2;   newV27= newV27  pin  /*ช*build a row of pins to be displayed. */
end   /*ช*pins*/
newV26.r= center( strip(newV27, 'T'), sw)       /*ช*an easy method to build a triangle.  */
end     /*ช*r*/;     newV28= 0;       return /*ช*#:   is the number of balls dropped. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
drop: static= 1                                  /*ช*used to indicate all balls are static*/
do c=sd-1  by -1  for sd-1;    n= c + 1  /*ช*D:  current row;   N:  the next row. */
x= pos(ball, newV26.c);             y= x - 1  /*ช*X:  position of a ball on the C line.*/
if x==0  then iterate                    /*ช*No balls here?  Then nothing to drop.*/
do forever;   y= pos(ball, newV26.c, y+1)   /*ช*drop most balls down to the next row.*/
if y==0  then iterate c                /*ช*down with this row, go look at next. */
z= substr(newV26.n, y, 1)                   /*ช*another ball is blocking this fall.  */
if z==' '  then do;  newV26.n= overlay(ball, newV26.n, y)   /*ช*drop a ball straight down.*/
newV26.c= overlay(' ' , newV26.c, y)   /*ช*make current ball a ghost.*/
static= 0                    /*ช*indicate balls are moving.*/
iterate                      /*ช*go keep looking for balls.*/
end
if z==pin  then do;  newV29= random(,999);   d= -1     /*ช*assume falling to the left*/
if newV29//2  then d=  1     /*ช*if odd random#, fall right*/
if substr(newV26.n, y+d, 1)\==' '  then iterate /*ช*blocked fall*/
newV26.n= overlay(ball, newV26.n, y+d)
newV26.c= overlay(' ' , newV26.c, y  )
static= 0                    /*ช*indicate balls are moving.*/
iterate                      /*ช*go keep looking for balls.*/
end
end   /*ช*forever*/
end     /*ช*c*/                  /*ช* [โ]   step//2    is used to avoid collisions. */
/*ช* [โ]  drop a new ball ?   */
if newV28<balls & step//2  then do;    newV26.1= center(ball, sw+1);      newV28 = newV28 + 1;        end
else if static  then exit 2      /*ช*insure balls are static.  */
return
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
show: newV9;    do LR=sd  by -1  until newV26.LR\==''                 /*ช*LR:  last row of data.*/
end   /*ช*LR*/;                 ss= 'step' step    /*ช* [โ]   display a row. */
do r=1  for LR; newV30= strip(newV26.r, 'T');  if r==2  then newV30= overlay(ss, newV30, sw-12); say newV30
end   /*ช*r*/;   if step==freeze  then do;   say 'press ENTER ยทยทยท';    pull;   end
return
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
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
