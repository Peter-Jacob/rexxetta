/*�*REXX program  computes the   forward difference   of a  list of numbers.              */
numeric digits 100                               /*�*ensure enough accuracy (decimal digs)*/
parse arg e ',' N                                /*�*get a list:  ε1 ε2 ε3 ε4 ··· , order */
if e==''  then e=90 47 58 29 22 32 55 5 55 73    /*�*Not specified?  Then use the default.*/
newV3=words(e);    w=5                               /*�*#  is the number of elements in list.*/
/*�* [↓]  verify list items are numeric. */
do i=1  for newV3;        newV4=word(e, i)            /*�*process each number one at a time.   */
if \datatype(newV4, 'N')  then call ser    newV4    "isn't a valid number";    newV1.i=newV4/1
w=max(w, length(newV1.i))                         /*�*use the maximum length of an element.*/
end   /*�*i*/                                   /*�* [↑]  removes superfluous stuff.     */
/*�* [↓]  process the optional order.    */
if N==''  then parse value 0 newV3 newV3 with bot top N  /*�*define the default  order  range.    */
else parse var N bot 1 top             /*�*Not specified?  Then use only 1 order*/
if newV3==0   then call ser     "no numbers were specified."
if N<0    then call ser  N  "(order) can't be negative."
if N>newV3    then call ser  N  "(order) can't be greater than"  newV3
newV4=;               do k=1  for newV3;  newV4=newV4 right(newV1.k, w);  end  /*�*k*/;        newV4=substr(newV4, 2)
say right(newV3  'numbers:', 44)  newV4                  /*�*display the header title    and ···  */
say left('', 44)copies('─', w*newV3+newV3)               /*�*   "     "     "   fence.            */
/*�* [↓]  where da rubber meets da road. */
do o=bot  to top;        do r=1  for newV3;  newV2.r=newV1.r;     end /*�*r*/;        newV5=
do j=1  for o; d=newV2.j;  do k=j+1  to newV3;     parse value  newV2.k  newV2.k-d   with   d  newV2.k
w=max(w, length(newV2.k))
end   /*�*k*/
end   /*�*j*/
do i=o+1  to newV3; newV5=newV5 right(newV2.i/1, w);  end  /*�*i*/
if newV5==''  then newV5=' [null]'
say right(o, 7)th(o)'─order forward difference vector ='     newV5
end     /*�*o*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
ser:           say;           say '***error***';      say arg(1);     say;         exit 13
th: procedure; x=abs(arg(1)); return word('th st nd rd',1+x//10*(x//100%10\==1)*(x//10<4))
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Forward-difference\forward-difference-3.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
