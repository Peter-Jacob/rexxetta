/*�*REXX program  simulates  the  execution  of a   One─Instruction Set Computer  (OISC). */
signal on halt                                   /*�*enable user to  halt  the simulation.*/
parse arg newV4                                      /*�*get optional low memory vals from CL.*/
newV1= '15 17 -1 17 -1 -1 16 1 -1 16 3 -1 15 15 0 0 -1'  /*�*common stuff for EBCDIC & ASCII.*/
/*�*EBCDIC "then" choice [↓]       H   e   l   l   o  , BLANK w   o   r   l   d  !  LF*/
if newV4='' then if 6=="f6"x  then newV4=newV1 200 133 147 147 150 107 64 166 150 153 147 132 90 21 0
else newV4=newV1  72 101 108 108 111  44 32 119 111 114 108 100 33 10 0
/*�* [↑]  ASCII   (the "else" choice).                Line Feed≡LF*/
newV2.= 0                                            /*�*zero all memory & instruction pointer*/
do j=0  for words(newV4);  newV2.j=word(newV4,j+1)  /*�*assign memory.  OISC is zero─indexed.*/
end   /*�*j*/                             /*�*obtain A, B, C memory values──►────┐ */
do newV5=0  by 3 until newV5<0;     a= @(newV5-3);    b= @(newV5-2);     c= @(newV5-1)   /*�* ◄─────────┘ */
select                                   /*�*choose an instruction state.         */
when a<0  then newV2.b= charin()             /*�*  read a character from the terminal.*/
when b<0  then call charout , d2c(newV2.a)   /*�* write "     "      to   "     "     */
otherwise      newV2.b= newV2.b - newV2.a            /*�*put difference  ────►  location  B.  */
if newV2.b<=0  then newV5= c         /*�*Not positive?   Then set  #  to  C.  */
end   /*�*select*/                         /*�* [↑]  choose one of two states.      */
end       /*�*#*/                              /*�*leave the DO loop if  #  is negative.*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
@:     parse arg newV3;    return newV2.newV3              /*�*return  a  memory location (cell @Z).*/
halt:  say 'The One─Instruction Set Computer simulation pgm was halted by user.';   exit 1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Subleq\subleq.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
