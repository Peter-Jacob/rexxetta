/*�*REXX program displays results of probabilistic choices, gen random #s per probability.*/
parse arg trials digs seed .                     /*�*obtain the optional arguments from CL*/
if trials=='' | trials==","  then trials= +1e6   /*�*Not specified?  Then use the default.*/
if   digs=='' |   digs==","  then   digs=   15   /*�* "      "         "   "   "     "    */
if datatype(seed, 'W')  then call random ,,seed  /*�*allows repeatability for RANDOM nums.*/
numeric digits digs                              /*�*use a specific number of decimal digs*/
names= 'aleph beth gimel daleth he waw zayin heth ───totals───►'   /*�*names of the cells.*/
hi= 100000                                                         /*�*max REXX RANDOM num*/
z= words(names);             newV2= z - 1            /*�*#: the number of actual/usable names.*/
newV3= 0                                             /*�*initialize sum of the probabilities. */
do n=1  for newV2;    prob.n= 1 / (n+4);     if n==newV2  then prob.n= 1759 / 27720
newV3= newV3 + prob.n;   Hprob.n= prob.n * hi /*�*spread the range of probabilities.   */
end   /*�*n*/
prob.z= newV3                                        /*�*define the value of the ───totals───.*/
newV1.= 0                                            /*�*initialize all counters in the range.*/
newV1.z= trials                                      /*�*define the last counter of  "    "   */
do j=1  for trials;    r= random(hi)  /*�*gen  TRIAL  number of random numbers.*/
do k=1  for newV2                     /*�*for each cell, compute  percentages. */
if r<=Hprob.k  then newV1.k= newV1.k + 1  /*�* "    "    "  range, bump the counter*/
end   /*�*k*/
end       /*�*j*/
newV4= '═'                                           /*�*_:  padding used by the  CENTER  BIF.*/
w= digs + 6                                      /*�*W:  display width for the percentages*/
d= 4 + max( length(trials), length('count') )    /*�* [↓]  display a formatted top header.*/
say center('name',15,newV4)  center('count',d,newV4) center('target %',w,newV4) center('actual %',w,newV4)

do cell=1  for z                            /*�*display each of the cells and totals.*/
say  ' '   left( word(names, cell), 13)             right(newV1.cell, d-2)  " " ,
left( format(   prob.cell   * 100, d),   w-2) ,
left( format( newV1.cell/trials * 100, d),   w-2)   /*�* [↓]  foot title. [↓] */
if cell==newV2  then say  center(newV4,15,newV4)   center(newV4,d,newV4)    center(newV4,w,newV4)   center(newV4,w,newV4)
end   /*�*c*/                                 /*�*stick a fork in it,  we are all done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Probabilistic-choice\probabilistic-choice.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
