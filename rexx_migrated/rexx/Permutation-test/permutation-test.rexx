/*ͺ*REXX program  performs a    permutation test   on     N + M   subjects  (volunteers): */
/*ͺ*     β   β                           */
/*ͺ*     β   β                           */
/*ͺ*     β   ββββββcontrol  population.  */
/*ͺ*     βββββββββtreatment population.  */
n= 9                                             /*ͺ*define the number of the control pop.*/
data= 85 88 75 66 25 29 83 39 97         68 41 10 49 16 65 32 92 28 98
w= words(data);      m= w - n                    /*ͺ*w:  volunteers  +  control population*/
L= length(w)                                     /*ͺ*L:  used to align some output numbers*/
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

GT= picker(n+m, n, 0)                            /*ͺ*compute the GT value from PICKER func*/
LE= tot - GT                                     /*ͺ*   "     "  LE   "   via subtraction.*/
say "<= "  format(100 * LE / tot, ,3)'%'   LE    /*ͺ*display number with 3 decimal places.*/
say " > "  format(100 * GT / tot, ,3)'%'   GT    /*ͺ*   "       "     "  "    "       "   */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
picker:  procedure expose newV1. treat;        parse arg it,rest,eff    /*ͺ*get the arguments.*/
if rest==0  then return   eff > treat                      /*ͺ*is REST = to zero?*/
if it>rest  then q= picker(it-1, rest, eff)                /*ͺ*maybe recurse.    */
else q= 0
itP= it - 1                                                /*ͺ*set temporary var.*/
return picker(itP,  rest - 1,  eff + newV1.itP)  +  q          /*ͺ*recurse.          */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Permutation-test\permutation-test.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
