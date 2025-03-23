/*�*REXX program adds commas (or other chars) to a  string  or a  number  within a string.*/
newV1. =
newV1.1= "pi=3.14159265358979323846264338327950288419716939937510582097494459231"
newV1.2= "The author has two Z$100000000000000 Zimbabwe notes (100 trillion)."
newV1.3= "-in Aus$+1411.8millions"
newV1.4= "===US$0017440 millions=== (in 2000 dollars)"
newV1.5= "123.e8000 is pretty big."
newV1.6= "The land area of the earth is  57268900(29% of the surface)  square miles."
newV1.7= "Ain't no numbers in this here words, nohow, no way, Jose."
newV1.8= "James was never known as  0000000007"
newV1.9= "Arthur Eddington wrote: I believe there are 15747724136275002577605653961181555468044717914527116709366231425076185631031296 protons in the universe."
newV1.10= "   $-140000±100  millions."
newV1.11= "6/9/1946 was a good year for some."

do i=1  while  newV1.i\=='';               if i\==1  then say  /*�*process each string.*/
say 'before──►'newV1.i                           /*�*show the before str.*/
if i==1  then say ' after──►'comma(newV1.i, 'blank', 5, , 6)   /*�*   p=5,  start=6.   */
if i==2  then say ' after──►'comma(newV1.i, ".")               /*�*comma=decimal point.*/
if i>2   then say ' after──►'comma(newV1.i)                    /*�*use the defaults.   */
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
comma: procedure; parse arg x,sep,period,times,start       /*�*obtain true case arguments.*/
arg  ,sepU                         /*�*   "   uppercase 2nd arg.  */
bla= ' '                                            /*�*literal to hold a  "blank".*/
sep= word(sep ',', 1)                               /*�*define comma (string/char.)*/
if sepU=='BLANK'  then sep= bla                     /*�*allow the use of  'BLANK'. */
period= word(period 3, 1)                           /*�*defined "period" to be used*/
times= word(times 999999999, 1)                     /*�*limits # changes to be made*/
start= word(start 1        , 1)                     /*�*where to start commatizing.*/
/*�* [↓]  various error tests. */
if \datatype(period, 'W')  | ,                      /*�*test for a whole number.   */
\datatype(times , 'W')  | ,                      /*�*  "   "  "   "      "      */
\datatype(start , 'W')  | ,                      /*�*  "   "  "   "      "      */
start <1                | ,                      /*�*start can't be less then 1.*/
arg() >5                      then return x      /*�*# of args can't be  >  5.  */
/*�* [↑]  some arg is invalid. */
op= period                                          /*�*save the original period.  */
period= abs(period)                                 /*�*use the absolute value.    */
n= x'.9'                                            /*�*a literal string for  end. */
digs=   123456789                                   /*�*the legal digits for start.*/
digsz=  1234567890                                  /*�* "    "      "    "   fin. */
digszp= 1234567890.                                 /*�* "    "      "    "   fin. */
/*�* [↓]  note: no zero in digs*/
if op<0  then do                                    /*�*Negative?  Treat as chars. */
beg= start                            /*�*begin at the start.        */
L= length(x)                          /*�*obtain the length of  X.   */
fin= L - verify( reverse(x), bla) + 1 /*�*find the ending of the num.*/
end                                   /*�* [↑]  find number ending.  */
else do                                    /*�*Positive?  Treat as numbers*/
beg=   verify(n, digs,  "M",start)    /*�*find beginning of number.  */
v2=max(verify(n, digszp,'M',start),1) /*�*end of the usable number.  */
fin=verify(n, digsz, , v2) -period -1 /*�*adjust the ending  (fin).  */
end                                   /*�* [↑]  find ending of number*/
newV2= 0                                                /*�*the count of changes made. */
if beg>0  &  fin>0  then                            /*�* [↓]  process  TIMES  times*/
do j=fin   to beg   by -period   while newV2<times
x= insert(sep, x, j)                  /*�*insert a comma into string.*/
newV2= newV2 + 1                              /*�*bump the count of changes. */
end   /*�*j*/                           /*�*(maybe no changes are made)*/
return x                                            /*�*return the commatized str. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Commatizing-numbers\commatizing-numbers.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
