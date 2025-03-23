/*�*REXX program finds the   mode   (most occurring element)  of a  vector.               */
/*�*      ════════vector═══════════      ═══show vector═══    ═════show result═════       */
v= 1 8 6 0 1 9 4 6 1 9 9 9    ;   say 'vector='v;      say 'mode='mode(v);       say
v= 1 2 3 4 5 6 7 8 9 11 10    ;   say 'vector='v;      say 'mode='mode(v);       say
v= 8 8 8 2 2 2                ;   say 'vector='v;      say 'mode='mode(v);       say
v='cat kat Cat emu emu Kat'   ;   say 'vector='v;      say 'mode='mode(v);       say
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sort: procedure expose newV1.;  parse arg newV2 1 h      /*�* [↓]  this is an  exchange sort.     */
do  while h>1;                h=h%2   /*�*In REXX,   %    is an integer divide.*/
do i=1  for newV2-h;     j=i;   k=h+i   /*�* [↓]  perform exchange for elements. */
do  while newV1.k<newV1.j & h<j;  newV3=newV1.j;   newV1.j=newV1.k;   newV1.k=newV3;   j=j-h;  k=k-h;   end
end   /*�*i*/
end     /*�*while h>1*/;        return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
mode: procedure expose newV1.; parse arg x;  freq=1  /*�*function finds the  MODE  of a vector*/
newV2=words(x)                                 /*�*#:  the number of elements in vector.*/
do k=1  for newV2;  newV1.k=word(x,k);  end   /*�* ◄──── make an array from the vector.*/
call Sort  newV2                               /*�*sort the elements in the array.      */
newV4=newV1.1                                      /*�*assume the first element is the mode.*/
do j=1  for newV2;        newV3=j-freq    /*�*traipse through the elements in array*/
if newV1.j==newV1.newV3  then do; freq=freq+1 /*�*is this element the same as previous?*/
newV4=newV1.j       /*�*this element is the mode (···so far).*/
end
end   /*�*j*/
return newV4                                   /*�*return the mode of vector to invoker.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Averages-Mode\averages-mode-1.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
