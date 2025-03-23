/*�*REXX program  performs a    permutation test   on     N + M   subjects  (volunteers): */
/*�*     ↑   ↑                           */
/*�*     │   │                           */
/*�*     │   └─────control  population.  */
/*�*     └────────treatment population.  */
n= 9                                             /*�*define the number of the control pop.*/
data= 85 88 75 66 25 29 83 39 97         68 41 10 49 16 65 32 92 28 98
w= words(data);      m= w - n                    /*�*w:  volunteers  +  control population*/
L= length(w)                                     /*�*L:  used to align some output numbers*/
say '# of volunteers & control population: '             w
say 'volunteer population given treatment: '             right(n, L)
say ' control  population given a placebo: '             right(m, L)
say
say 'treatment population efficacy % (percentages): '    subword(data, 1, n)
say ' control  population placebo  % (percentages): '    subword(data, n+1 )
say
do v=  0  for w         ;           newV1.v= word(data, v+1) ;       end
treat= 0;            do i=  0  to n-1        ;           treat= treat + newV1.i   ;       end
tot= 1;            do j=  w  to m+1  by -1 ;           tot= tot * j         ;       end
do k=w%2  to  1   by -1 ;           tot= tot / k         ;       end

GT= picker(n+m, n, 0)                            /*�*compute the GT value from PICKER func*/
LE= tot - GT                                     /*�*   "     "  LE   "   via subtraction.*/
say "<= "  format(100 * LE / tot, ,3)'%'   LE    /*�*display number with 3 decimal places.*/
say " > "  format(100 * GT / tot, ,3)'%'   GT    /*�*   "       "     "  "    "       "   */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
picker:  procedure expose newV1. treat;        parse arg it,rest,eff    /*�*get the arguments.*/
if rest==0  then return   eff > treat                      /*�*is REST = to zero?*/
if it>rest  then q= picker(it-1, rest, eff)                /*�*maybe recurse.    */
else q= 0
itP= it - 1                                                /*�*set temporary var.*/
return picker(itP,  rest - 1,  eff + newV1.itP)  +  q          /*�*recurse.          */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Permutation-test\permutation-test.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
