/*�*REXX pgm sorts an array (names of epichoric Greek letters) using a heapsort algorithm.*/
parse arg x;                 call init           /*�*use args or default,  define @ array.*/
call show     "before sort:"                     /*�*#:    the number of elements in array*/
call heapSort       newV2;       say copies('▒', 40) /*�*sort; then after sort, show separator*/
call show     " after sort:"
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
init: newV3= 'alpha beta gamma delta digamma epsilon zeta eta theta iota kappa lambda mu nu' ,
"xi omicron pi san qoppa rho sigma tau upsilon phi chi psi omega"
if x=''  then x= newV3;                 newV2= words(x)          /*�*#: number of words in X*/
do j=1  for newV2;  newV1.j= word(x, j);  end;     return  /*�*assign letters to array*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
heapSort: procedure expose newV1.; arg n;  do j=n%2  by -1 to 1;  call shuffle  j,n; end /*�*j*/
do n=n  by -1  to 2;    newV3= newV1.1;    newV1.1= newV1.n;    newV1.n= newV3;   call heapSuff 1,n-1
end   /*�*n*/;           return        /*�* [↑]  swap two elements; and shuffle.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
heapSuff: procedure expose newV1.;  parse arg i,n;        newV4= newV1.i            /*�*obtain parent.*/
do  while i+i<=n;   j= i+i;   k= j+1;     if k<=n  then  if newV1.k>newV1.j  then j= k
if newV4>=newV1.j  then leave;      newV1.i= newV1.j;     i= j
end   /*�*while*/;            newV1.i= newV4;       return            /*�*define lowest.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show:     do s=1  for newV2;  say '    element' right(s, length(newV2)) arg(1) newV1.s;  end;   return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Heapsort\sorting-algorithms-heapsort-1.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
