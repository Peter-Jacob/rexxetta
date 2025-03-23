/*ª*REXX program  generates and displays a Mandelbrot set as an ASCII art character image.*/
newV1 = '>=<;:9876543210/.-,+*)(''&%$#"!'            /*ª*the characters used in the display.  */
Xsize = 59;  minRE = -2;  maxRE = +1;     stepX = (maxRE-minRE) / Xsize
Ysize = 21;  minIM = -1;  maxIM = +1;     stepY = (maxIM-minIM) / Ysize

do y=0  for ysize;      im=minIM + stepY*y
newV2=
do x=0  for Xsize;   re=minRE + stepX*x;    zr=re;    zi=im

do n=0  for 30;  a=zr**2;   b=zi**2;    if a+b>4  then leave
zi=zr*zi*2 + im;            zr=a-b+re
end   /*ª*n*/

newV2=newV2 || substr(newV1, n+1, 1)                 /*ª*append number (as a char) to $ string*/
end       /*ª*x*/
say newV2                                          /*ª*display a line of  character  output.*/
end             /*ª*y*/                          /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Mandelbrot-set\mandelbrot-set-1.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
