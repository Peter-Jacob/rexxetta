/*ª*REXX program constructs a  magic square  of doubly even sides (a size divisible by 4).*/
n= 8;   s= n%4;   L= n%2-s+1;    w= length(n**2) /*ª*size; small sq;  low middle;  # width*/
newV1.= 0;            H= n%2+s                       /*ª*array default;  high middle.         */
call gen                                         /*ª*generate a grid in numerical order.  */
call diag                                        /*ª*mark numbers on both diagonals.      */
call corn                                        /*ª*  "     "    in small corner boxen.  */
call midd                                        /*ª*  "     "    in  the middle    "     */
call swap                                        /*ª*swap positive numbers with highest #.*/
call show                                        /*ª*display the doubly even magic square.*/
call sum                                         /*ª*   "     "  magic number for square. */
exit                                             /*ª*stick a fork in it,  we're all done. */
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
o:    parse arg newV2;             return n-newV2+1      /*ª*calculate the "other" (right) column.*/
@:    parse arg x,y;           return abs(newV1.x.y)
diag:      do r=1 for n;  newV1.r.r=-@(r,r); o=o(r);  newV1.r.o=-@(r,o);  end;              return
midd:      do r=L  to H;  do c=L  to H;  newV1.r.c=-@(r,c);           end;  end;        return
gen:  newV3=0; do r=1 for n;  do c=1  for n; newV3=newV3+1;   newV1.r.c=newV3;        end;  end;        return
show: newV3=0; do r=1 for n;  newV4=; do c=1  for n; newV4=newV4 right(@(r,c),w); end;  say newV4; end; return
sum:  newV3=0; do r=1 for n;  newV3=newV3+@(r,1);  end;  say;  say 'The magic number is: '   newV3; return
maxnewV3:      do a=n for n  by -1;  do b=n  for n  by -1;  if newV1.a.b>0  then return; end;  end
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
swap:         do   r=1  for n
do c=1  for n;  if newV1.r.c<0  then iterate;  call maxnewV3  /*ª*find max number.*/
parse value  -newV1.a.b  (-newV1.r.c)    with    newV1.r.c  newV1.a.b /*ª*swap two values.*/
end   /*ª*c*/
end     /*ª*r*/;                       return
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
corn:         do   r=1  for n;  if r>s & r<=n-s  then iterate   /*ª*"corner boxen", sizeâ¡S*/
do c=1  for n;  if c>s & c<=n-s  then iterate;  newV1.r.c= -@(r,c)  /*ª*negate*/
end   /*ª*c*/
end     /*ª*r*/;                       return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Magic-squares-of-doubly-even-order\magic-squares-of-doubly-even-order.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
