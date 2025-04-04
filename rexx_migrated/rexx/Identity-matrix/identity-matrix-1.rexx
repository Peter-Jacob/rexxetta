/*ͺ*REXX program  creates and displays any sized  identity matrix  (centered, with title).*/
do k=3  to 6                          /*ͺ* [β]  build and display a sq. matrix.*/
call identnewV3mat  k                     /*ͺ*build & display a KxK square matrix. */
end   /*ͺ*k*/                           /*ͺ* [β]  use generalβpurpose display sub*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
identnewV3mat: procedure;  parse arg n; newV1=
do    r=1  for n                   /*ͺ*build identity matrix, by row and col*/
do c=1  for n;     newV1= newV1 (r==c)  /*ͺ*append  zero  or  one  (if on diag). */
end   /*ͺ*c*/
end      /*ͺ*r*/
call showMat  'identity matrix of size'   n,   newV1
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
showMat: procedure; parse arg hdr,x;  newV2=words(x) /*ͺ*#  is the number of matrix elements. */
dp= 0                                   /*ͺ*DP:  max width of decimal fractions. */
w= 0                                    /*ͺ*W:   max width of integer part.      */
do n=1  until n*n>=newV2;  newV3= word(x,n)      /*ͺ*determine the matrix order. */
parse var newV3 y '.' f;   w= max(w, length(y));      dp= max(dp, length(f) )
end   /*ͺ*n*/                     /*ͺ* [β]  idiomatically find the widths. */
w= w +1
say;  say center(hdr, max(length(hdr)+8, (w+1)*newV2%n), 'β');  say
newV2= 0                                                            /*ͺ*#: element #.*/
do   row=1  for n;     newV3= left('', n+w)                 /*ͺ*indentation. */
do col=1  for n;     newV2= newV2 + 1                         /*ͺ*bump element.*/
newV3=newV3 right(format(word(x, newV2), , dp)/1, w)
end   /*ͺ*col*/                 /*ͺ* [β]  division by unity normalizes #.*/
say newV3                           /*ͺ*display a single line of the matrix. */
end     /*ͺ*row*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Identity-matrix\identity-matrix-1.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
