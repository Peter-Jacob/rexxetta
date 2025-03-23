/*�*REXX program sorts  an  integer array   @.   [the first element starts at index zero].*/
parse arg N .                                    /*�*obtain an optional argument from C.L.*/
if N=='' | N==","  then N=19                     /*�*Not specified?  Then use the default.*/
call gen@                                        /*�*generate a type of scattered array.  */
call show    'before sort'                       /*�*show the   before   array elements.  */
say copies('▒', wN+wV+ 50)                       /*�*show a separator line (between shows)*/
call stoogeSort  0, N                            /*�*invoke the  Stooge Sort.             */
call show    ' after sort'                       /*�*show the    after   array elements.  */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
gen@: wV= 0;   do k=0  to N;      newV1.k= k*2 + k*-1**k;     if newV1.k//7==0  then newV1.k= -100 - k
wV= max(wV, length(newV1.k) );  end;        wN=length(N);                return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show: do j=0 to N; say right('element',22) right(j,wN) arg(1)":" right(newV1.j,wV); end;return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
stoogeSort: procedure expose newV1.;  parse arg i,j                  /*�*sort from  I ───► J. */
if newV1.j<newV1.i  then parse value newV1.i newV1.j  with  newV1.j newV1.i  /*�*swap  @.i  with  @.j */
if j-i>1    then do;   t=(j-i+1) % 3                 /*�*%:  integer division.*/
call stoogeSort  i  ,  j-t    /*�*invoke recursively.  */
call stoogeSort  i+t,  j      /*�*   "        "        */
call stoogeSort  i  ,  j-t    /*�*   "        "        */
end
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Stooge-sort\sorting-algorithms-stooge-sort.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
