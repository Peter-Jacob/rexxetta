/*�*REXX program  computes the   forward difference   of a  list of numbers.              */
numeric digits 100                               /*�*ensure enough accuracy (decimal digs)*/
parse arg e ',' N                                /*�*get a list:  ε1 ε2 ε3 ε4 ··· , order */
if e==''  then e=90 47 58 29 22 32 55 5 55 73    /*�*Not specified?  Then use the default.*/
newV3=words(e)                                       /*�*#  is the number of elements in list.*/
/*�* [↓]  assign list numbers to @ array.*/
do i=1  for newV3;  newV1.i=word(e, i)/1;  end /*�*i*/  /*�*process each number one at a time.   */
/*�* [↓]  process the optional order.    */
if N==''  then parse value 0 newV3 newV3 with bot top N  /*�*define the default  order  range.    */
else parse var N bot 1 top             /*�*Not specified?  Then use only 1 order*/
say right(newV3  'numbers:', 44)  e                  /*�*display the header title   and  ···  */
say left('', 44)copies('─', length(e)+2)         /*�*   "     "     "   fence.            */
/*�* [↓]  where da rubber meets da road. */
do o=bot  to top;        do r=1  for newV3;  newV2.r=newV1.r;     end /*�*r*/;        newV4=
do j=1  for o; d=newV2.j;  do k=j+1  to newV3; parse value newV2.k newV2.k-d with d newV2.k; end /*�*k*/
end   /*�*j*/
do i=o+1  to newV3; newV4=newV4 newV2.i/1;   end /*�*i*/
if newV4==''  then newV4=' [null]'
say right(o, 7)th(o)'─order forward difference vector ='     newV4
end     /*�*o*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
th: procedure; x=abs(arg(1)); return word('th st nd rd',1+x//10*(x//100%10\==1)*(x//10<4))
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Forward-difference\forward-difference-1.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
