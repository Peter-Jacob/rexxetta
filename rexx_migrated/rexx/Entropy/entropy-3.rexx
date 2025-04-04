/*ͺ*REXX program calculates the   information entropy   for a specified character string. */
numeric digits length( e() ) % 2   -  length(.)  /*ͺ*use 1/2 of the decimal digits of  E. */
parse arg newV3;   if newV3=''  then newV3= 1223334444       /*ͺ*obtain the optional input from the CL*/
newV4=0;           newV1.= 0;        L= length(newV3)        /*ͺ*define handy-dandy REXX variables.   */
newV2=                                              /*ͺ*initialize the   $$   list.          */
do j=1  for L;        newV5= substr(newV3, j, 1)  /*ͺ*process each character in  $  string.*/
if newV1.newV5==0  then do;   newV4= newV4 + 1            /*ͺ*Unique?  Yes, bump character counter.*/
newV2= newV2 || newV5         /*ͺ*add this character to the  $$  list. */
end
newV1.newV5= newV1.newV5 + 1                              /*ͺ*keep track of this character's count.*/
end   /*ͺ*j*/
sum= 0                                           /*ͺ*calculate info entropy for each char.*/
do i=1  for newV4;        newV5= substr(newV2, i, 1) /*ͺ*obtain a character from unique list. */
sum= sum  -   newV1.newV5/L * log2(newV1.newV5/L)         /*ͺ*add (negatively) the char entropies. */
end   /*ͺ*i*/
say ' input string: '   newV3
say 'string length: '   L
say ' unique chars: '   newV4;          say
say 'the information entropy of the string βββΊ '         format(sum,,12)          " bits."
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
e: e= 2.718281828459045235360287471352662497757247093699959574966967627724076630; return e
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
log2: procedure;  parse arg x 1 ox;     ig= x>1.5;     ii= 0;         is= 1 - 2 * (ig\==1)
numeric digits digits()+5;        call e   /*ͺ*the precision of E must beβ₯digits(). */
do  while  ig & ox>1.5 | \ig&ox<.5;       newV5= e;       do j=-1;   iz= ox * newV5 ** -is
if j>=0 & (ig & iz<1 | \ig&iz>.5)  then leave;    newV5= newV5 * newV5;    izz= iz;  end /*ͺ*j*/
ox=izz;  ii=ii+is*2**j;  end /*ͺ*while*/;   x= x * e** -ii -1;   z= 0;  newV5= -1;  p= z
do k=1;   newV5= -newV5 * x;   z= z+newV5/k;        if z=p  then leave;  p= z;    end  /*ͺ*k*/
r= z + ii;               if arg()==2  then return r;         return r / log2(2, .)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Entropy\entropy-3.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
