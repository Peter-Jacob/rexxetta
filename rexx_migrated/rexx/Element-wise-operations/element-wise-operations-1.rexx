/*�*REXX program  multiplies two matrices together, displays the  matrices and the result.*/
m= (1 2 3)  (4 5 6)  (7 8 9)
w= words(m);                   do rows=1;       if rows*rows>=w  then leave
end   /*�*rows*/
cols= rows
call showMat  M, 'M matrix'
answer= matAdd(m, 2  );   call showMat answer, 'M matrix, added 2'
answer= matSub(m, 7  );   call showMat answer, 'M matrix, subtracted 7'
answer= matMul(m, 2.5);   call showMat answer, 'M matrix, multiplied by 2½'
answer= matPow(m, 3  );   call showMat answer, 'M matrix, cubed'
answer= matDiv(m, 4  );   call showMat answer, 'M matrix, divided by 4'
answer= matIdv(m, 2  );   call showMat answer, 'M matrix, integer halved'
answer= matMod(m, 3  );   call showMat answer, 'M matrix, modulus 3'
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
matAdd:   parse arg newV2,newV3;  call matnewV3;   do j=1  for w;  newV1.j= newV1.j+newV3;     end;  return matnewV2()
matSub:   parse arg newV2,newV3;  call matnewV3;   do j=1  for w;  newV1.j= newV1.j-newV3;     end;  return matnewV2()
matMul:   parse arg newV2,newV3;  call matnewV3;   do j=1  for w;  newV1.j= newV1.j*newV3;     end;  return matnewV2()
matDiv:   parse arg newV2,newV3;  call matnewV3;   do j=1  for w;  newV1.j= newV1.j/newV3;     end;  return matnewV2()
matIdv:   parse arg newV2,newV3;  call matnewV3;   do j=1  for w;  newV1.j= newV1.j%newV3;     end;  return matnewV2()
matPow:   parse arg newV2,newV3;  call matnewV3;   do j=1  for w;  newV1.j= newV1.j**newV3;    end;  return matnewV2()
matMod:   parse arg newV2,newV3;  call matnewV3;   do j=1  for w;  newV1.j= newV1.j//newV3;    end;  return matnewV2()
matnewV3:     w= words(newV2);                 do j=1  for w;  newV1.j= word(newV2,j); end;  return
matnewV2:     newV2= newV1.1;                      do j=2   to w;  newV2=newV2 newV1.j;        end;  return newV2
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
showMat:  parse arg newV2, hdr;                    L= 0;                                 say
do j=1  for w;  L= max(L, length( word(newV2,j) ) ); end
say  center(hdr, max( length(hdr)+4, cols * (L+1)+4), "─")
n= 0
do     r=1  for rows;           newV4=
do c=1  for cols;  n= n+1;  newV4= newV4 right( word(newV2, n), L);   end; say newV4
end
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Element-wise-operations\element-wise-operations-1.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
