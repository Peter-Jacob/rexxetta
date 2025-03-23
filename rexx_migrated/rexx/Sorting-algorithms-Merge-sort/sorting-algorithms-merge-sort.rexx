/*�*REXX pgm sorts a stemmed array (numbers and/or chars) using the  merge─sort algorithm.*/
call init                                        /*�*sinfully initialize the   @   array. */
call show      'before sort'                     /*�*show the   "before"  array elements. */
say copies('▒', 75)  /*�*display a separator line to the term.*/
call merge          newV3                            /*�*invoke the  merge sort  for the array*/
call show      ' after sort'                     /*�*show the    "after"  array elements. */
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
init: newV1.=;    newV1.1= '---The seven deadly sins---'  ;    newV1.4= "avarice"  ;   newV1.7= 'gluttony'
newV1.2= '==========================='  ;    newV1.5= "wrath"    ;   newV1.8= 'sloth'
newV1.3= 'pride'                        ;    newV1.6= "envy"     ;   newV1.9= 'lust'
do newV3=1  until newV1.newV3==''; end;   newV3= newV3-1;   return      /*�*#:  # of entries in @ array.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show: do j=1  for newV3; say right('element',20) right(j,length(newV3)) arg(1)":" newV1.j; end; return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
merge: procedure expose newV1. newV2.;   parse arg n, L;   if L==''  then do;  newV2.=;  L= 1;  end
if n==1  then return;     h= L + 1
if n==2  then do; if newV1.L>newV1.h  then do; newV4=newV1.h; newV1.h=newV1.L; newV1.L=newV4; end; return;  end
m= n % 2                                     /*�* [↑]  handle case of two items.*/
call merge  n-m, L+m                         /*�*divide items  to the left   ···*/
call merger m,   L,   1                      /*�*   "     "     "  "  right  ···*/
i= 1;                     j= L + m
do k=L  while k<j                 /*�*whilst items on right exist ···*/
if j==L+n  |  newV2.i<=newV1.j  then do;     newV1.k= newV2.i;     i= i + 1;      end
else do;     newV1.k= newV1.j;     j= j + 1;      end
end   /*�*k*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
merger: procedure expose newV1. newV2.;  parse arg n,L,T
if n==1  then do;  newV2.T= newV1.L;                                       return;  end
if n==2  then do;  h= L + 1;   q= T + 1;  newV2.q= newV1.L;    newV2.T= newV1.h;   return;  end
m= n % 2                                    /*�* [↑]  handle case of two items.*/
call merge  m,   L                          /*�*divide items  to the left   ···*/
call merger n-m, L+m, m+T                   /*�*   "     "     "  "  right  ···*/
i= L;                     j= m + T
do k=T  while k<j                 /*�*whilst items on left exist  ···*/
if j==T+n  |  newV1.i<=newV2.j  then do;     newV2.k= newV1.i;     i= i + 1;      end
else do;     newV2.k= newV2.j;     j= j + 1;      end
end   /*�*k*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Merge-sort\sorting-algorithms-merge-sort.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
