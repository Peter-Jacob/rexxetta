/*�*REXX program  creates and displays any sized  identity matrix  (centered, with title).*/
do k=3  to 6                          /*�* [↓]  build and display a sq. matrix.*/
call identnewV3mat  k                     /*�*build & display a KxK square matrix. */
end   /*�*k*/                           /*�* [↑]  use general─purpose display sub*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
identnewV3mat: procedure;  parse arg n; newV1=
do    r=1  for n                   /*�*build identity matrix, by row and col*/
do c=1  for n;     newV1= newV1 (r==c)  /*�*append  zero  or  one  (if on diag). */
end   /*�*c*/
end      /*�*r*/
call showMat  'identity matrix of size'   n,   newV1
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
showMat: procedure; parse arg hdr,x;  newV2=words(x) /*�*#  is the number of matrix elements. */
dp= 0                                   /*�*DP:  max width of decimal fractions. */
w= 0                                    /*�*W:   max width of integer part.      */
do n=1  until n*n>=newV2;  newV3= word(x,n)      /*�*determine the matrix order. */
parse var newV3 y '.' f;   w= max(w, length(y));      dp= max(dp, length(f) )
end   /*�*n*/                     /*�* [↑]  idiomatically find the widths. */
w= w +1
say;  say center(hdr, max(length(hdr)+8, (w+1)*newV2%n), '─');  say
newV2= 0                                                            /*�*#: element #.*/
do   row=1  for n;     newV3= left('', n+w)                 /*�*indentation. */
do col=1  for n;     newV2= newV2 + 1                         /*�*bump element.*/
newV3=newV3 right(format(word(x, newV2), , dp)/1, w)
end   /*�*col*/                 /*�* [↑]  division by unity normalizes #.*/
say newV3                           /*�*display a single line of the matrix. */
end     /*�*row*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Identity-matrix\identity-matrix-1.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
