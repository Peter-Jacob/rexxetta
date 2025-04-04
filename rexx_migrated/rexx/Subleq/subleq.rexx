/*ͺ*REXX program  simulates  the  execution  of a   OneβInstruction Set Computer  (OISC). */
signal on halt                                   /*ͺ*enable user to  halt  the simulation.*/
parse arg newV4                                      /*ͺ*get optional low memory vals from CL.*/
newV1= '15 17 -1 17 -1 -1 16 1 -1 16 3 -1 15 15 0 0 -1'  /*ͺ*common stuff for EBCDIC & ASCII.*/
/*ͺ*EBCDIC "then" choice [β]       H   e   l   l   o  , BLANK w   o   r   l   d  !  LF*/
if newV4='' then if 6=="f6"x  then newV4=newV1 200 133 147 147 150 107 64 166 150 153 147 132 90 21 0
else newV4=newV1  72 101 108 108 111  44 32 119 111 114 108 100 33 10 0
/*ͺ* [β]  ASCII   (the "else" choice).                Line Feedβ‘LF*/
newV2.= 0                                            /*ͺ*zero all memory & instruction pointer*/
do j=0  for words(newV4);  newV2.j=word(newV4,j+1)  /*ͺ*assign memory.  OISC is zeroβindexed.*/
end   /*ͺ*j*/                             /*ͺ*obtain A, B, C memory valuesβββΊβββββ */
do newV5=0  by 3 until newV5<0;     a= @(newV5-3);    b= @(newV5-2);     c= @(newV5-1)   /*ͺ* βββββββββββ */
select                                   /*ͺ*choose an instruction state.         */
when a<0  then newV2.b= charin()             /*ͺ*  read a character from the terminal.*/
when b<0  then call charout , d2c(newV2.a)   /*ͺ* write "     "      to   "     "     */
otherwise      newV2.b= newV2.b - newV2.a            /*ͺ*put difference  βββββΊ  location  B.  */
if newV2.b<=0  then newV5= c         /*ͺ*Not positive?   Then set  #  to  C.  */
end   /*ͺ*select*/                         /*ͺ* [β]  choose one of two states.      */
end       /*ͺ*#*/                              /*ͺ*leave the DO loop if  #  is negative.*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
@:     parse arg newV3;    return newV2.newV3              /*ͺ*return  a  memory location (cell @Z).*/
halt:  say 'The OneβInstruction Set Computer simulation pgm was halted by user.';   exit 1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Subleq\subleq.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
