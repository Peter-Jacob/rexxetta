/*�*REXX program  multiplies two matrices together, displays the matrices and the result. */
m= (1 2 3)  (4 5 6)  (7 8 9)
w= words(m);                    do rows=1;     if rows*rows>=w  then leave
end  /*�*k*/;            cols= rows
call showMat  M, 'M matrix'
ans= matOp(m, '+2'   );   call showMat  ans,  "M matrix, added 2"
ans= matOp(m, '-7'   );   call showMat  ans,  "M matrix, subtracted 7"
ans= matOp(m, '*2.5' );   call showMat  ans,  "M matrix, multiplied by 2½"
ans= matOp(m, '**3'  );   call showMat  ans,  "M matrix, cubed"
ans= matOp(m, '/4'   );   call showMat  ans,  "M matrix, divided by 4"
ans= matOp(m, '%2'   );   call showMat  ans,  "M matrix, integer halved"
ans= matOp(m, '//3'  );   call showMat  ans,  "M matrix, modulus 3"
ans= matOp(m, '*3-1' );   call showMat  ans,  "M matrix, tripled, less one"
exit 0                                           /*�*stick a fork in it,  we"re all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
matOp: parse arg newV2,newV3; call matnewV3; do j=1 for w; interpret '!.'j"=!."j newV3; end; return matnewV2()
matnewV3:  w= words(newV2);              do j=1 for w; newV1.j= word(newV2,j);          end; return
matnewV2:  newV2= newV1.1;                   do j=2  to w; newV2= newV2 newV1.j;                end; return newV2
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
showMat:  parse arg newV2, hdr;                      L= 0;                               say
do j=1  for w;      L= max(L, length( word(newV2, j) ) );     end
say;         say center(hdr,max(length(hdr)+4,cols*(L+1)+4),"─")
n= 0
do r    =1  for rows;           newV4=
do c=1  for cols;  n= n+1;  newV4= newV4 right( word(newV2, n), L);  end;   say newV4
end
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Element-wise-operations\element-wise-operations-2.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
