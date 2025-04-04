/*ͺ*REXX program  converts  temperatures  for a number (8)  of  temperature scales.       */
numeric digits 120                               /*ͺ*be able to support some huge numbers.*/
parse arg tList                                  /*ͺ*get the specified temperature list.  */

do  until  tList=''                            /*ͺ*process the list of temperatures.    */
parse  var tList  x  ','  tList                /*ͺ*temps are separated by commas.       */
x= translate(x, '((', "[{")                    /*ͺ*support other grouping symbols.      */
x= space(x);      parse var x z '('            /*ͺ*handle any comments  (if any).       */
parse upper  var  z  z   ' TO '  newV1 .           /*ͺ*separate the  TO  option from number.*/
if newV1==''  then newV1= 'ALL';   all= newV1=='ALL'       /*ͺ*allow specification of "TO" opt*/
if z==''     then call serr "no arguments were specified."                 /*ͺ*oops-ay. */
newV2= verify(z, '+-.0123456789')                  /*ͺ*list of valid numeral/number thingys.*/
n= z
if newV2\==0  then do
if newV2==1  then call serr 'illegal temperature:'   z
n= left(z,  newV2 - 1)              /*ͺ*pick off the number  (hopefully).    */
u= strip( substr(z, newV2) )        /*ͺ*pick off the  temperature  unit.     */
end
else u= 'k'                          /*ͺ*assume kelvin as per task requirement*/

if \datatype(n, 'N')  then call serr 'illegal number:'    n
if \all  then do                               /*ͺ*is there is a     TO  Ξ±Ξ±Ξ±     scale? */
call name newV1                      /*ͺ*process the   TO   abbreviation.     */
newV1= sn                           /*ͺ*assign the full name to     !        */
end                              /*ͺ*!: now contains temperature full name*/
call name u                                    /*ͺ*allow alternate scale (miss)spellings*/

select                                     /*ͺ*convert βββΊ Β°Fahrenheit temperatures.*/
when sn=='CELSIUS'          then F= n       *  9/5   +  32
when sn=='DELISLE'          then F= 212 -(n *  6/5)
when sn=='FAHRENHEIT'       then F= n
when sn=='KELVIN'           then F= n       *  9/5   - 459.67
when sn=='NEWTON'           then F= n       * 60/11  +  32
when sn=='RANKINE'          then F= n                - 459.67    /*ͺ*a single  R  is taken as Rankine.*/
when sn=='REAUMUR'          then F= n       *  9/4   +  32
when sn=='ROMER'            then F= (n-7.5) * 27/4   +  32
otherwise              call serr  'illegal temperature scale: '    u
end   /*ͺ*select*/

K = (F + 459.67)  *  5/9                       /*ͺ*compute temperature to  kelvins.     */
say right(' ' x, 79, "β")                      /*ͺ*show the original value, scale, sep. */
if all | newV1=='CELSIUS'           then say $(   ( F   -  32     )   *  5/9           )    'Celsius'
if all | newV1=='DELISLE'           then say $(   ( 212 -  F      )   *  5/6           )    'Delisle'
if all | newV1=='FAHRENHEIT'        then say $(     F                                  )    'Fahrenheit'
if all | newV1=='KELVIN'            then say $(        K                               )    'kelvin's(K)
if all | newV1=='NEWTON'            then say $(   ( F   -  32     )   *  11/60         )    'Newton'
if all | newV1=='RANKINE'           then say $(     F   + 459.67                       )    'Rankine'
if all | newV1=='REAUMUR'           then say $(   ( F   -  32     )   *  4/9           )    'Reaumur'
if all | newV1=='ROMER'             then say $(   ( F   -  32     )   *  4/27    + 7.5 )    'Romer'
end   /*ͺ*until*/

exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
s:    if arg(1)==1  then return arg(3);     return word( arg(2) 's',  1)
serr: say;   say '***error!***';    say;    say arg(1);    say;   exit 13
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
$:    procedure;           showDig= 8            /*ͺ*only show  eight  significant digits.*/
newV2= format( arg(1), , showDig) / 1          /*ͺ*format number 8 digs past dec, point.*/
p= pos(., newV2);        L= length(newV2)          /*ͺ*find position of the decimal point.  */
/*ͺ* [β]  align integers with FP numbers.*/
if p==0  then newV2= newV2 || left('', 5+showDig+1)    /*ͺ*the number has no decimal point. */
else newV2= newV2 || left('', 5+showDig-L+p)  /*ͺ* "     "    "   a    "      "    */
return right(newV2, 50)                        /*ͺ*return the re-formatted number (arg).*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
name: parse arg y                                       /*ͺ*abbreviations  βββΊ  shortname.*/
yU= translate(y, 'eE', "Γ©Γ");       upper yU      /*ͺ*uppercase the temperature unit*/
if left(yU, 7)=='DEGREES'  then yU= substr(yU, 8) /*ͺ*redundant "degrees" after  #? */
if left(yU, 6)=='DEGREE'   then yU= substr(yU, 7) /*ͺ*   "      "degree"    "    "  */
yU= strip(yU)                                     /*ͺ*elide blanks at front and back*/
newV2= length(yU)                                     /*ͺ*obtain the    yU    length.   */
if right(yU,1)=='S' & newV2>1  then yU= left(yU, newV2-1) /*ͺ*elide trailing plural, if any.*/

select                                     /*ͺ*abbreviations  βββΊ  shortname.*/
when abbrev('CENTIGRADE' , yU)    |,
abbrev('CENTRIGRADE', yU)    |,                     /*ͺ* 50% misspelled.*/
abbrev('CETIGRADE'  , yU)    |,                     /*ͺ* 50% misspelled.*/
abbrev('CENTINGRADE', yU)    |,
abbrev('CENTESIMAL' , yU)    |,
abbrev('CELCIU'     , yU)    |,                     /*ͺ* 82% misspelled.*/
abbrev('CELCIOU'    , yU)    |,                     /*ͺ*  4% misspelled.*/
abbrev('CELCUI'     , yU)    |,                     /*ͺ*  4% misspelled.*/
abbrev('CELSUI'     , yU)    |,                     /*ͺ*  2% misspelled.*/
abbrev('CELCEU'     , yU)    |,                     /*ͺ*  2% misspelled.*/
abbrev('CELCU'      , yU)    |,                     /*ͺ*  2% misspelled.*/
abbrev('CELISU'     , yU)    |,                     /*ͺ*  1% misspelled.*/
abbrev('CELSU'      , yU)    |,                     /*ͺ*  1% misspelled.*/
abbrev('CELSIU'     , yU)       then sn= 'CELSIUS'
when abbrev('DELISLE'    , yU,2)     then sn= 'DELISLE'
when abbrev('FARENHEIT'  , yU)    |,                     /*ͺ* 39% misspelled.*/
abbrev('FARENHEIGHT', yU)    |,                     /*ͺ* 15% misspelled.*/
abbrev('FARENHITE'  , yU)    |,                     /*ͺ*  6% misspelled.*/
abbrev('FARENHIET'  , yU)    |,                     /*ͺ*  3% misspelled.*/
abbrev('FARHENHEIT' , yU)    |,                     /*ͺ*  3% misspelled.*/
abbrev('FARINHEIGHT', yU)    |,                     /*ͺ*  2% misspelled.*/
abbrev('FARENHIGHT' , yU)    |,                     /*ͺ*  2% misspelled.*/
abbrev('FAHRENHIET' , yU)    |,                     /*ͺ*  2% misspelled.*/
abbrev('FERENHEIGHT', yU)    |,                     /*ͺ*  2% misspelled.*/
abbrev('FEHRENHEIT' , yU)    |,                     /*ͺ*  2% misspelled.*/
abbrev('FERENHEIT'  , yU)    |,                     /*ͺ*  2% misspelled.*/
abbrev('FERINHEIGHT', yU)    |,                     /*ͺ*  1% misspelled.*/
abbrev('FARIENHEIT' , yU)    |,                     /*ͺ*  1% misspelled.*/
abbrev('FARINHEIT'  , yU)    |,                     /*ͺ*  1% misspelled.*/
abbrev('FARANHITE'  , yU)    |,                     /*ͺ*  1% misspelled.*/
abbrev('FAHRENHEIT' , yU)       then sn= 'FAHRENHEIT'
when abbrev('KALVIN'     , yU)    |,                     /*ͺ* 27% misspelled.*/
abbrev('KERLIN'     , yU)    |,                     /*ͺ* 18% misspelled.*/
abbrev('KEVEN'      , yU)    |,                     /*ͺ*  9% misspelled.*/
abbrev('KELVIN'     , yU)       then sn= 'KELVIN'
when abbrev('NEUTON'     , yU)    |,                     /*ͺ*100% misspelled.*/
abbrev('NEWTON'     , yU)       then sn= 'NEWTON'
when abbrev('RANKINE'    , yU, 1)    then sn= 'RANKINE'
when abbrev('REAUMUR'    , yU, 2)    then sn= 'REAUMUR'
when abbrev('ROEMER'     , yU, 2) |,
abbrev('ROMER'      , yU, 2)    then sn= 'ROMER'
otherwise                call serr  'illegal temperature scale:'   y
end   /*ͺ*select*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Temperature-conversion\temperature-conversion.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
