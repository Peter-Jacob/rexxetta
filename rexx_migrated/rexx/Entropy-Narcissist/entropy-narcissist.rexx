/*�*REXX program calculates the   "information entropy"   for  ~this~  REXX program.      */
numeric digits length( e() ) % 2   -  length(.)  /*�*use 1/2 of the decimal digits of  E. */
newV3= 0;   newV1.= 0;   newV4=;   newV2=;   recs= sourceline() /*�*define some handy─dandy REXX vars.   */
do m=1  for recs; newV4=newV4||sourceLine(m) /*�* [↓]  obtain program source and ──► $*/
end   /*�*m*/                          /*�* [↑]  $ str won't have any meta chars*/
L=length(newV4)                                      /*�*the byte length of this REXX program.*/
do j=1  for L;  newV5= substr(newV4, j, 1)   /*�*process each character in  $  string.*/
if newV1.newV5==0  then do;  newV3= newV3 + 1        /*�*¿Character unique?  Bump char counter*/
newV2= newV2 || newV5     /*�*add this character to the  $$  list. */
end
newV1.newV5= newV1.newV5 + 1                         /*�*keep track of this character's count.*/
end   /*�*j*/                          /*�* [↑]  characters are all 8─bit bytes.*/
sum= 0                                           /*�*calculate info entropy for each char.*/
do i=1  for newV3;  newV5= substr(newV2, i, 1)  /*�*obtain a character from unique list. */
sum= sum -  newV1.newV5 / L * log2(newV1.newV5 / L)  /*�*add {negatively} the char entropies. */
end   /*�*i*/
say '    program length: '   L                   /*�*pgm length doesn't include meta chars*/
say 'program statements: '   recs                /*�*pgm statements are actually pgm lines*/
say ' unique characters: '   newV3;           say    /*�*characters are 8─bit bytes of the pgm*/
say 'The information entropy of this REXX program ──► '       format(sum,,12)
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
e: e= 2.718281828459045235360287471352662497757247093699959574966967627724076630; return e
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
log2: procedure;  parse arg x 1 ox;     ig= x>1.5;     ii= 0;         is= 1 - 2 * (ig\==1)
numeric digits digits()+5;        call e   /*�*the precision of E must be≥digits(). */
do  while  ig & ox>1.5 | \ig&ox<.5;       newV5= e;       do j=-1;   iz= ox * newV5 ** -is
if j>=0 & (ig & iz<1 | \ig&iz>.5)  then leave;    newV5= newV5 * newV5;    izz= iz;  end /*�*j*/
ox=izz;  ii=ii+is*2**j;  end /*�*while*/;   x= x * e** -ii -1;   z= 0;  newV5= -1;  p= z
do k=1;   newV5= -newV5 * x;   z= z+newV5/k;        if z=p  then leave;  p= z;    end  /*�*k*/
r= z + ii;  if arg()==2  then return r;   return r / log2(2,.)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Entropy-Narcissist\entropy-narcissist.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
