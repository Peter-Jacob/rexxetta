/*ͺ*REXX program implements the TrabbβPardo-Knuth algorithm for N numbers (default is 11).*/
numeric digits 200                               /*ͺ*the number of digits precision to use*/
parse arg N .;   if N=='' | N==","  then N=11    /*ͺ*Not specified?  Then use the default.*/
maxValue= 400                                    /*ͺ*the maximum value   f(x)   can have. */
wid=  20                                    /*ͺ*  Β·Β·Β· but only show this many digits.*/
frac=   5                                    /*ͺ*  Β·Β·Β· show this # of fractional digs.*/
say '                           _____'           /*ͺ* ββββ this  SAY  displays a vinculum.*/
say 'function:        Ζ(x)  β‘  β βxβ   +   (5 * x^3)'
prompt= 'enter '      N      " numbers for the TrabbβPardoβKnuth algorithm:     (or Quit)"

do ask=0;    say;  /*ͺ*βββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
say prompt;  say;      pull $;     say                                             /*ͺ*β*/
if abbrev('QUIT',$,1)  then do;    say 'quitting.';    exit 1;   end               /*ͺ*β*/
ok=0                                                                               /*ͺ*β*/
select                  /*ͺ*validate there're N numbers.*/    /*ͺ*β*/
when $=''        then say  "no numbers entered"             /*ͺ*β*/
when words($)<N  then say  "not enough numbers entered"     /*ͺ*β*/
when words($)>N  then say  "too many numbers entered"       /*ͺ*β*/
otherwise        ok=1                                       /*ͺ*β*/
end   /*ͺ*select*/                                            /*ͺ*β*/
if \ok  then iterate                                    /*ͺ* [β]  W=max width. */    /*ͺ*β*/
w=0;                   do v=1  for N;       newV1=word($, v);   w=max(w, length(newV1) )   /*ͺ*β*/
if datatype(newV1, 'N')  then iterate          /*ͺ*numeric ?*/    /*ͺ*β*/
say newV1  "isn't numeric";   iterate ask                       /*ͺ*β*/
end   /*ͺ*v*/                                                 /*ͺ*β*/
leave                                                                              /*ͺ*β*/
end   /*ͺ*ask*/      /*ͺ*βββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/

say 'numbers entered: '    $
say
do i=N  by -1  for N;  newV2=word($, i) / 1  /*ͺ*process the numbers in reverse.      */
g =  fmt(   f( newV2 )        )              /*ͺ*invoke  function  Ζ  with arg number.*/
gw=right(  'Ζ('newV2") ",  w+7)              /*ͺ*nicely formatted  Ζ(number).         */
if g>maxValue  then say gw    "is >  "     maxValue      ' ['space(g)"]"
else say gw     "   = "     g
end   /*ͺ*i*/                              /*ͺ* [β]  display the result to terminal.*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
f:    procedure;  parse arg x;           return  sqrt( abs(x) )    +    5 * x**3
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
fmt:  z=right(translate(format(arg(1), wid, frac), 'e', "E"), wid) /*ͺ*right adjust; use e*/
if pos(.,z)\==0 then z=left(strip(strip(z,'T',0),"T",.),wid) /*ͺ*strip trailing 0 &.*/
return right(z, wid - 4*(pos('e', z)==0) )                   /*ͺ*adjust: no exponent*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
sqrt: procedure; parse arg x; if x=0  then return 0; d=digits(); m.=9; numeric form; h=d+6
numeric digits; parse value format(x,2,1,,0) 'E0'  with  g 'E' newV1 .;  g=g *.5'e'newV1 % 2
do j=0  while h>9;      m.j=h;               h=h % 2  + 1;  end  /*ͺ*j*/
do k=j+5  to 0  by -1;  numeric digits m.k;  g=(g+x/g)*.5;  end  /*ͺ*k*/;   return g
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Trabb-Pardo-Knuth-algorithm\trabb-pardo-knuth-algorithm.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
