/*ͺ*REXX pgm calculates world cup standings based on the number of games won by the teams.*/
parse arg teams win .                            /*ͺ*obtain optional argument from the CL.*/
if teams=='' | teams==","  then teams= 4         /*ͺ*Not specified?  Then use the default.*/
if   win=='' |   win==","  then   win= 3         /*ͺ* "      "         "   "   "     "    */
sets= 0;                           gs=           /*ͺ*the number of sets  (so far).        */
do   j=1   for teams
do k=j+1  to teams;   sets= sets + 1  /*ͺ*bump the number of game sets.        */
games.sets= j || k;   gs= gs  j || k  /*ͺ*generate the game combinations.      */
end   /*ͺ*j*/
end     /*ͺ*k*/
z= 1;                  setLimit= copies(2, sets) /*ͺ*Z:   max length of any number shown. */
say teams  ' teams, '  sets   " game sets: "  gs /*ͺ*display what's being used for calcs. */
results = copies(0, sets);                 say   /*ͺ*start with left-most teams all losing*/
points. = 0                                      /*ͺ*zero all the team's point.           */
do until \nextResult(results);       newV1.= 0
do j=1  for sets;                  r= substr( results, j, 1)
parse var  games.j    A  +1  B                  /*ͺ*get the  A  and  B teams*/
if r==0  then      newV1.B= newV1.B + win               /*ͺ*win for rightβmost team.*/
if r==1  then do;  newV1.A= newV1.A + 1;  newV1.B= newV1.B + 1; end  /*ͺ*draw for both teams*/
if r==2  then      newV1.A= newV1.A + win               /*ͺ*win for leftβmost team. */
end       /*ͺ*j*/
call sort teams
do  t=1  for teams;  tm= t - 1;                             newV4= newV1.t
points.tm.newV4 = points.tm.newV4 + 1;  z= max(z, length( points.tm.newV4) )
end   /*ͺ*t*/
end               /*ͺ*until*/
newV2.=
do j=0  for teams+6;  do k=0  for teams;   newV2.k= newV2.k || right( points.k.j, z)'β ';  end
end   /*ͺ*j*/
say                                                  /*ͺ* [β]  build grid line for the box*/
L= length(newV2.1) -2;     newV3= translate( translate( left(newV2.1, L), , 0123456789),   'β', " ")
say left('', 15)       center("points", L)           /*ͺ*display the boxed title.         */
say left('', 15)  "β"translate(newV3, 'ββ€', "ββ")'β'    /*ͺ*display the bottom sep for title.*/
p= 0
do m=teams-1  by -1  for teams;   p = p + 1     /*ͺ*bump the  place  holder (counter)*/
say right('('th(p) "place)", 14)  " β"left(newV2.m, L)'β'
if m>0  then say right('               ', 14)  " β"translate(newV3, 'βΌ', "β")'β’'
end   /*ͺ*m*/
say left('', 15)  "β"translate( newV3, 'ββ''¬ ’ββ’©'b'   ―ͺ*display the bottom sep for title.ͺ―
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
nextResult: if results==setLimit  then return 0  /*ͺ* [β]  do arithmetic in base three.   */
res= 0;      do k=1  for sets;      res= res * 3    +   substr( results, k, 1)
end   /*ͺ*k*/
results=;                           res= res + 1
do sets;      results= res // 3   ||   results;      res= res % 3
end   /*ͺ*sets*/;                    return 1
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
sort: procedure expose newV1.; arg #;  do   j=1   for #-1  /*ͺ*a bubble sort, ascending order.*/
do k=j+1  to #    /*ͺ*swap two elements out of order.*/
if newV1.k<newV1.j  then parse value  newV1.j newV1.k  with  newV1.k newV1.j
end   /*ͺ*k*/
end     /*ͺ*j*/;           return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
th: arg th; return (th/1) || word('th st nd rd', 1 +(th//10) *(th//100%10\==1)*(th//10<4))
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\World-Cup-group-stage\world-cup-group-stage-2.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
