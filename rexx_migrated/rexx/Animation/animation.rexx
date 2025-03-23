/*ª*REXX prg displays a text string (in one direction), and reverses when a key is pressed*/
parse upper version newV3 newV1 .;     newV2= 'REXX/PERSONAL'==newV3  |  'REXX/PC'==newV3
if \newV2  then do
say
say '***error***  This REXX program requires REXX/PERSONAL or REXX/PC.'
say
exit 1
end
parse arg newV4                                      /*ª*obtain optional text message from CL.*/
if newV4=''  then newV4= 'Hello World!'                  /*ª*Not specified?  Then use the default.*/
if right(newV4, 1)\==' '  then newV4= newV4' '               /*ª*ensure msg text has a trailing blank.*/
signal on halt                                   /*ª*handle a HALT if user quits this way.*/
way = 0                                          /*ª*default direction for marquee display*/
y =
do  until y=='Q';  'CLS'                 /*ª*if user presses  Q  or  q, then quit.*/
call lineout ,newV4;   call delay .2         /*ª*display output; delay 1/5 of a second*/
y= inKey('Nowait');  upper y             /*ª*maybe get a pressed key; uppercase it*/
if y\==''  then way= \way                /*ª*change the direction of the marquee. */
if way  then newV4= substr(newV4, 2)left(newV4, 1)   /*ª*display marquee in a direction or Â·Â·Â·*/
else newV4=  right(newV4, 1)substr(newV4, 1, length(newV4) - 1)        /*ª* Â·Â·Â· the otherÂ·*/
end   /*ª*until*/
halt:                                            /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Animation\animation.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
