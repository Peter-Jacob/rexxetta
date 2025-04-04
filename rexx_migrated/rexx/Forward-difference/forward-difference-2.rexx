/*ͺ*REXX program  computes the   forward difference   of a  list of numbers.              */
numeric digits 100                               /*ͺ*ensure enough accuracy (decimal digs)*/
parse arg e ',' N                                /*ͺ*get a list:  Ξ΅1 Ξ΅2 Ξ΅3 Ξ΅4 Β·Β·Β· , order */
if e==''  then e=90 47 58 29 22 32 55 5 55 73    /*ͺ*Not specified?  Then use the default.*/
newV3=words(e)                                       /*ͺ*#  is the number of elements in list.*/
/*ͺ* [β]  verify list items are numeric. */
do i=1  for newV3;        newV4=word(e, i)            /*ͺ*process each number one at a time.   */
if \datatype(newV4, 'N')  then call ser    newV4    "isn't a valid number";    newV1.i=newV4/1
end   /*ͺ*i*/                                   /*ͺ* [β]  removes superfluous stuff.     */
/*ͺ* [β]  process the optional order.    */
if N==''  then parse value 0 newV3 newV3 with bot top N  /*ͺ*define the default  order  range.    */
else parse var N bot 1 top             /*ͺ*Not specified?  Then use only 1 order*/
if newV3==0   then call ser     "no numbers were specified."
if N<0    then call ser  N  "(order) can't be negative."
if N>newV3    then call ser  N  "(order) can't be greater than"  newV3
say right(newV3  'numbers:', 44)  e                  /*ͺ*display the header (title)  and Β·Β·Β·  */
say left('', 44)copies('β', length(e)+2)         /*ͺ*display the header fence.            */
/*ͺ* [β]  where da rubber meets da road. */
do o=bot  to top;        do r=1  for newV3;  newV2.r=newV1.r;     end /*ͺ*r*/;        newV5=
do j=1  for o; d=newV2.j;  do k=j+1  to newV3; parse value newV2.k newV2.k-d with d newV2.k; end /*ͺ*k*/
end   /*ͺ*j*/
do i=o+1  to newV3; newV5=newV5 newV2.i/1;   end /*ͺ*i*/
if newV5==''  then newV5=' [null]'
say right(o, 7)th(o)'βorder forward difference vector ='     newV5
end     /*ͺ*o*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
ser:           say;           say '***error***';      say arg(1);     say;         exit 13
th: procedure; x=abs(arg(1)); return word('th st nd rd',1+x//10*(x//100%10\==1)*(x//10<4))
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Forward-difference\forward-difference-2.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
