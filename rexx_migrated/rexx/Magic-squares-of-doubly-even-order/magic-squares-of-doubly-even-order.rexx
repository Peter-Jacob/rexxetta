/*�*REXX program constructs a  magic square  of doubly even sides (a size divisible by 4).*/
n= 8;   s= n%4;   L= n%2-s+1;    w= length(n**2) /*�*size; small sq;  low middle;  # width*/
newV1.= 0;            H= n%2+s                       /*�*array default;  high middle.         */
call gen                                         /*�*generate a grid in numerical order.  */
call diag                                        /*�*mark numbers on both diagonals.      */
call corn                                        /*�*  "     "    in small corner boxen.  */
call midd                                        /*�*  "     "    in  the middle    "     */
call swap                                        /*�*swap positive numbers with highest #.*/
call show                                        /*�*display the doubly even magic square.*/
call sum                                         /*�*   "     "  magic number for square. */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
o:    parse arg newV2;             return n-newV2+1      /*�*calculate the "other" (right) column.*/
@:    parse arg x,y;           return abs(newV1.x.y)
diag:      do r=1 for n;  newV1.r.r=-@(r,r); o=o(r);  newV1.r.o=-@(r,o);  end;              return
midd:      do r=L  to H;  do c=L  to H;  newV1.r.c=-@(r,c);           end;  end;        return
gen:  newV3=0; do r=1 for n;  do c=1  for n; newV3=newV3+1;   newV1.r.c=newV3;        end;  end;        return
show: newV3=0; do r=1 for n;  newV4=; do c=1  for n; newV4=newV4 right(@(r,c),w); end;  say newV4; end; return
sum:  newV3=0; do r=1 for n;  newV3=newV3+@(r,1);  end;  say;  say 'The magic number is: '   newV3; return
maxnewV3:      do a=n for n  by -1;  do b=n  for n  by -1;  if newV1.a.b>0  then return; end;  end
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
swap:         do   r=1  for n
do c=1  for n;  if newV1.r.c<0  then iterate;  call maxnewV3  /*�*find max number.*/
parse value  -newV1.a.b  (-newV1.r.c)    with    newV1.r.c  newV1.a.b /*�*swap two values.*/
end   /*�*c*/
end     /*�*r*/;                       return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
corn:         do   r=1  for n;  if r>s & r<=n-s  then iterate   /*�*"corner boxen", size≡S*/
do c=1  for n;  if c>s & c<=n-s  then iterate;  newV1.r.c= -@(r,c)  /*�*negate*/
end   /*�*c*/
end     /*�*r*/;                       return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Magic-squares-of-doubly-even-order\magic-squares-of-doubly-even-order.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
