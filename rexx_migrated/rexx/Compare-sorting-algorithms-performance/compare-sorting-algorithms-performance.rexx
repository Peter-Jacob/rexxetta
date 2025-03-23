/*�*REXX pgm compares various sorts for 3 types of input sequences: ones/ascending/random.*/
parse arg ranges startnewV5 seed .                   /*�*obtain optional arguments from the CL*/
if ranges=='' | ranges==","  then ranges=     5  /*�*Not Specified?  Then use the default.*/
if startnewV5=='' | startnewV5==","  then startnewV5=   250  /*�* "      "         "   "   "     "    */
if   seed=='' |   seed==","  then   seed=  1946  /*�*use a repeatable seed for RANDOM  BIF*/
if datatype(seed, 'W')  then call random ,,seed  /*�*Specified?  Then use as a RANDOM seed*/
kinds= 3;      hdr=;       newV5= startnewV5             /*�*hardcoded/fixed number of datum kinds*/
do ra=1  for ranges
hdr= hdr || center( commas(newV5) "numbers", 25)'│'  /*�*(top) header for the output title.*/
do ki=1  for kinds
call gen@@ newV5, ki
call set@;  call time 'R';  call bubble     newV5;     bubble.ra.ki= format(time("E"),,2)
call set@;  call time 'R';  call cocktail   newV5;   cocktail.ra.ki= format(time("E"),,2)
call set@;  call time 'R';  call cocktailSB newV5; cocktailSB.ra.ki= format(time("E"),,2)
call set@;  call time 'R';  call comb       newV5;       comb.ra.ki= format(time("E"),,2)
call set@;  call time 'R';  call exchange   newV5;   exchange.ra.ki= format(time("E"),,2)
call set@;  call time 'R';  call gnome      newV5;      gnome.ra.ki= format(time("E"),,2)
call set@;  call time 'R';  call heap       newV5;       heap.ra.ki= format(time("E"),,2)
call set@;  call time 'R';  call insertion  newV5;  insertion.ra.ki= format(time("E"),,2)
call set@;  call time 'R';  call merge      newV5;      merge.ra.ki= format(time("E"),,2)
call set@;  call time 'R';  call pancake    newV5;    pancake.ra.ki= format(time("E"),,2)
call set@;  call time 'R';  call quick      newV5;      quick.ra.ki= format(time("E"),,2)
call set@;  call time 'R';  call radix      newV5;      radix.ra.ki= format(time("E"),,2)
call set@;  call time 'R';  call selection  newV5;  selection.ra.ki= format(time("E"),,2)
call set@;  call time 'R';  call shell      newV5;      shell.ra.ki= format(time("E"),,2)
end   /*�*ki*/
newV5= newV5 + newV5                                                         /*�*double # elements.*/
end     /*�*ra*/
say;                             say;    say                        /*�*say blank sep line*/
say center('         ', 11     ) "│"left(hdr, length(hdr)-1)"│"     /*�*replace last char.*/
reps= ' allONES  ascend  random │'      /*�*build a title bar.*/
xreps=       copies( center(reps, length(reps)), ranges)            /*�*replicate ranges. */
creps= left(xreps, length(xreps)-1)"│"                              /*�*replace last char.*/
say center('sort type', 11     ) "│"creps;                       Lr= length(reps)
xcreps= copies( left('', Lr-1, '─')"┼", ranges)
say center(''         , 12, '─')"┼"left(xcreps, length(xcreps)-1)"����ָ"
call show 'bubble'                               /*�* ◄──── show results for bubble  sort.*/
call show 'cocktail'                             /*�* ◄────   "     "     "  cocktail   " */
call show 'cocktailSB'    /*�*+Shifting Bounds*/   /*�* ◄────   "     "     "  cocktailSB " */
call show 'comb'                                 /*�* ◄────   "     "     "  comb       " */
call show 'exchange'                             /*�* ◄────   "     "     "  exchange   " */
call show 'gnome'                                /*�* ◄────   "     "     "  gnome      " */
call show 'heap'                                 /*�* ◄────   "     "     "  heap       " */
call show 'insertion'                            /*�* ◄────   "     "     "  insertion  " */
call show 'merge'                                /*�* ◄────   "     "     "  merge      " */
call show 'pancake'                              /*�* ◄────   "     "     "  pancake    " */
call show 'quick'                                /*�* ◄────   "     "     "  quick      " */
call show 'radix'                                /*�* ◄────   "     "     "  radix      " */
call show 'selection'                            /*�* ◄────   "     "     "  shell      " */
call show 'shell'                                /*�* ◄────   "     "     "  shell      " */
say translate(center(''         , 12, '─')"┴"left(xcreps, length(xcreps)-1)"┘",  '┴', "┼")
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: parse arg newV6;  do jc=length(newV6)-3  to 1  by -3; newV6=insert(',', newV6, jc); end;  return newV6
inOrder: parse arg n; do j=1  for n-1;  k= j+1;  if newV3.j>newV3.k  then return 0; end;  return 1
set@:   newV3.=;          do a=1  for newV5;                 newV3.a= newV2.a;             end;  return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
gen@@: procedure expose newV2.; parse arg n,kind;  nn= min(n, 100000)     /*�*1e5����ֹREXX's max.*/
do j=1 for nn;      select
when kind==1  then  newV2.j= 1               /*�*all ones. */
when kind==2  then  newV2.j= j               /*�*ascending.*/
when kind==3  then  newV2.j= random(, nn)    /*�*random.   */
end   /*�*select*/
end   /*�*j*/;                                              return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show:  parse arg aa;  newV7= left(aa, 11)  "│"
do   ra=1  for ranges
do ki=1  for kinds
newV7= newV7  right( value(aa || . || ra || . || ki),  7, ' ')
end   /*�*k*/
newV7= newV7  "│"
end     /*�*r*/;       say newV7;             return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
bubble:   procedure expose newV3.;  parse arg n         /*�*N: is the number of  @  elements. */
do m=n-1  by -1  until ok;         ok=1 /*�*keep sorting  @  array until done.*/
do j=1  for m;  k=j+1;  if newV3.j<=newV3.k  then iterate    /*�*elements in order? */
newV7=newV3.j;  newV3.j=newV3.k;  newV3.k=newV7;         ok=0 /*�*swap 2 elements; flag as not done.*/
end   /*�*j*/
end     /*�*m*/;                                              return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
cocktail: procedure expose newV3.;    parse arg N;   nn= N-1     /*�*N:  is number of items.  */
do until done;   done= 1
do j=1   for nn;                jp= j+1
if newV3.j>newV3.jp  then do;  done=0;  newV7=newV3.j;  newV3.j=newV3.jp;  newV3.jp=newV7;  end
end   /*�*j*/
if done  then leave                              /*�*No swaps done?  Finished.*/
do k=nn  for nn  by -1;         kp= k+1
if newV3.k>newV3.kp  then do;  done=0;  newV7=newV3.k;  newV3.k=newV3.kp;  newV3.kp=newV7;  end
end   /*�*k*/
end       /*�*until*/;                                        return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
cocktailsb: procedure expose newV3.;    parse arg N              /*�*N:  is number of items.  */
endnewV8= N - 1;     begnewV8= 1
do while begnewV8 <= endnewV8
begnewV8newV8= endnewV8;               endnewV8newV8= begnewV8
do j=begnewV8 to endnewV8;                   jp= j + 1
if newV3.j>newV3.jp  then do;  newV7=newV3.j;  newV3.j=newV3.jp;  newV3.jp=newV7;  endnewV8newV8=j;  end
end   /*�*j*/
endnewV8= endnewV8newV8 - 1
do k=endnewV8  to begnewV8  by -1;           kp= k + 1
if newV3.k>newV3.kp  then do;  newV7=newV3.k;  newV3.k=newV3.kp;  newV3.kp=newV7;  begnewV8newV8=k;  end
end   /*�*k*/
begnewV8= begnewV8newV8 + 1
end       /*�*while*/;                                        return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
comb:  procedure expose newV3.;   parse arg n        /*�*N:  is the number of  @  elements.   */
g= n-1                                    /*�*G:  is the gap between the sort COMBs*/
do  until g<=1 & done;    done= 1   /*�*assume sort is done  (so far).       */
g= g * 0.8  % 1                     /*�*equivalent to:   g= trunc( g / 1.25) */
if g==0  then g= 1                  /*�*handle case of the gap is too small. */
do j=1  until newV8>=n;    newV8= j + g  /*�*$:     a temporary index  (pointer). */
if newV3.j>newV3.newV8  then do;   newV7= newV3.j;     newV3.j= newV3.newV8;    newV3.newV8= newV7;    done= 0;    end
end   /*�*j*/                      /*�* [↑]  swap two elements in the array.*/
end      /*�*until*/;       return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
exchange: procedure expose newV3.;  parse arg n 1 h  /*�*both  N  and  H  have the array size.*/
do while h>1;                      h= h % 2
do i=1  for n-h;       j= i;    k= h+i
do while newV3.k<newV3.j
newV7= newV3.j;  newV3.j= newV3.k;  newV3.k= newV7;  if h>=j  then leave;  j= j-h;  k= k-h
end   /*�*while @.k<@.j*/
end      /*�*i*/
end         /*�*while h>1*/;                       return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
gnome: procedure expose newV3.;  parse arg n;      k= 2               /*�*N: is number items. */
do j=3  while k<=n;                  p= k - 1           /*�*P: is previous item.*/
if newV3.p<<=newV3.k  then do;      k= j;    iterate;   end     /*�*order is OK so far. */
newV7= newV3.p;       newV3.p= newV3.k;     newV3.k= newV7                      /*�*swap two @ entries. */
k= k - 1;     if k==1  then k= j;    else j= j-1        /*�*test for 1st index. */
end    /*�*j*/;                                return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
heap:  procedure expose newV3.; arg n;  do j=n%2  by -1  to 1;   call heapS j,n;  end  /*�*j*/
do n=n  by -1  to 2;    newV7= newV3.1;    newV3.1= newV3.n;    newV3.n= newV7;   call heapS 1,n-1
end   /*�*n*/;           return       /*�* [↑]  swap two elements; and shuffle.*/

heapS: procedure expose newV3.;  parse arg i,n;        newV8= newV3.i            /*�*obtain parent.*/
do  while i+i<=n;   j= i+i;   k= j+1;    if k<=n  then  if newV3.k>newV3.j  then j= k
if newV8>=newV3.j  then leave;      newV3.i= newV3.j;    i= j
end   /*�*while*/;            newV3.i= newV8;      return            /*�*define lowest.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
insertion:  procedure expose newV3.;   parse arg n
do i=2  to n;   newV8= newV3.i;       do j=i-1  by -1  to 1  while newV3.j>newV8
newV7= j + 1;        newV3.newV7= newV3.j
end   /*�*j*/
newV7= j + 1;       newV3.newV7= newV8
end   /*�*i*/;                                         return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
merge: procedure expose newV3. newV4.;   parse arg n, L;   if L==''  then do;  newV4.=;  L= 1;  end
if n==1  then return;     h= L + 1
if n==2  then do; if newV3.L>newV3.h  then do; newV7=newV3.h; newV3.h=newV3.L; newV3.L=newV7; end; return;  end
m= n % 2                                     /*�* [↑]  handle case of two items.*/
call merge  n-m, L+m                         /*�*divide items  to the left   ···*/
call merger m,   L,   1                      /*�*   "     "     "  "  right  ···*/
i= 1;                     j= L + m
do k=L  while k<j                 /*�*whilst items on right exist ···*/
if j==L+n  |  newV4.i<=newV3.j  then do;     newV3.k= newV4.i;     i= i + 1;      end
else do;     newV3.k= newV3.j;     j= j + 1;      end
end   /*�*k*/;                         return

merger: procedure expose newV3. newV4.;  parse arg n,L,T
if n==1  then do;  newV4.T= newV3.L;                                       return;  end
if n==2  then do;  h= L + 1;   q= T + 1;  newV4.q= newV3.L;    newV4.T= newV3.h;   return;  end
m= n % 2                                    /*�* [↑]  handle case of two items.*/
call merge  m,   L                          /*�*divide items  to the left   ···*/
call merger n-m, L+m, m+T                   /*�*   "     "     "  "  right  ···*/
i= L;                     j= m + T
do k=T  while k<j                 /*�*whilst items on left exist  ···*/
if j==T+n  |  newV3.i<=newV4.j  then do;     newV4.k= newV3.i;     i= i + 1;      end
else do;     newV4.k= newV4.j;     j= j + 1;      end
end   /*�*k*/;                         return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
pancake: procedure expose newV3.;   parse arg n .;               if inOrder(n)  then return
do n=n  by -1  for n-1
newV9= newV3.1;   newV6= 1;                do j=2  to n;    if newV3.j<=newV9  then iterate
newV9= newV3.j;          newV6= j
end   /*�*j*/
call panFlip newV6;   call panFlip n
end   /*�*n*/;                                               return

panFlip: parse arg y;  do i=1  for (y+1)%2; yi=y-i+1; newV7=newV3.i; newV3.i=newV3.yi; newV3.yi=newV7; end; return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
quick: procedure expose newV3.; a.1=1; parse arg b.1; newV8= 1 /*�*access @.; get #; define pivot.*/
if inOrder(b.1)  then return
do  while  newV8\==0;     L= a.newV8;    t= b.newV8;     newV8= newV8-1;   if t<2  then iterate
H= L+t-1;             newV6= L+t%2
if newV3.H<newV3.L  then if newV3.newV6<newV3.H  then do;  p=newV3.H;  newV3.H=newV3.L;  end
else if newV3.newV6>newV3.L  then p=newV3.L
else do;  p=newV3.newV6;  newV3.newV6=newV3.L;  end
else if newV3.newV6<newV3.L  then p=newV3.L
else if newV3.newV6>newV3.H  then do;  p=newV3.H;  newV3.H=newV3.L;  end
else do;  p=newV3.newV6;  newV3.newV6=newV3.L;  end
j= L+1;                           k=h
do forever
do j=j         while j<k & newV3.j<=p;  end     /*�*a tinie─tiny loop.*/
do k=k  by -1  while j<k & newV3.k>=p;  end     /*�*another   "    "  */
if j>=k  then leave                             /*�*segment finished? */
newV7= newV3.j;       newV3.j= newV3.k;             newV3.k= newV7      /*�*swap J&K elements.*/
end   /*�*forever*/
newV8= newV8+1;            k= j-1;   newV3.L= newV3.k;     newV3.k= p
if j<=newV6  then do;  a.newV8= j;   b.newV8= H-j+1;   newV8= newV8+1;  a.newV8= L;  b.newV8= k-L;    end
else do;  a.newV8= L;   b.newV8= k-L;     newV8= newV8+1;  a.newV8= j;  b.newV8= H-j+1;  end
end          /*�*while $¬==0*/;              return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
radix:   procedure expose newV3.;  parse arg size,w;   mote= c2d(' ');    newV5= 1;   newV4.newV5.newV7n= size
newV4.newV5.newV7b= 1;                     if w==''  then w= 8
newV4.newV5.newV7i= 1;  do i=1  for size;  y=newV3.i;  newV3.i= right(abs(y), w, 0);  if y<0  then newV3.i= '-'newV3.i
end  /*�*i*/                                            /*�* [↑]  negative case.*/

do  while newV5\==0;  ctr.= 0;  L= 'ffff'x;   low= newV4.newV5.newV7b;   n= newV4.newV5.newV7n;   newV8= newV4.newV5.newV7i;   H=
newV5= newV5-1                                                      /*�* [↑]   is the radix. */
do j=low  for n;      parse var  newV3.j  newV1  newV7  +1;    ctr.newV7= ctr.newV7 + 1
if ctr.newV7==1 & newV7\==''  then do;  if newV7<<L  then L=newV7;    if newV7>>H  then H=newV7
end  /*�*  ↑↑                                       */
end   /*�*j*/                     /*�*  └┴─────◄───  <<   is a strict comparison.*/
newV7=                                    /*�*      ┌──◄───  >>    " "    "        "     */
if L>>H  then iterate                 /*�*◄─────┘                                    */
if L==H & ctr.newV7==0  then do; newV5= newV5+1;  newV4.newV5.newV7b= low;  newV4.newV5.newV7n= n;  newV4.newV5.newV7i= newV8+1;  iterate
end
L= c2d(L);   H= c2d(H);      newV6= ctr.newV7 + low;        top.newV7= newV6;          ts= mote
max= L
do k=L  to H;   newV7= d2c(k, 1);   c= ctr.newV7  /*�* [↓]  swap 2 item radices.*/
if c>ts  then parse value  c k  with  ts max;     newV6= newV6+c;       top.newV7= newV6
end   /*�*k*/
piv= low                                    /*�*set PIVot to the low part of the sort*/
do  while piv<low+n
it= newV3.piv
do forever;     parse var it  newV1  newV7  +1;         c= top.newV7 -1
if piv>=c  then leave;   top.newV7= c;    newV6= newV3.c;    newV3.c= it;    it= newV6
end   /*�*forever*/
top.newV7= piv;                         newV3.piv= it;        piv= piv + ctr.newV7
end   /*�*while piv<low+n */
i= max
do  until i==max;  newV7= d2c(i, 1);     i= i+1;     if i>H  then i= L;     d= ctr.newV7
if d<=mote  then do;         if d<2  then iterate;          b= top.newV7
do k=b+1  for d-1;                       q= newV3.k
do j=k-1  by -1  to b  while q<<newV3.j;  jp= j+1;   newV3.jp= newV3.j
end   /*�*j*/
jp= j+1;   newV3.jp= q
end     /*�*k*/
iterate
end
newV5= newV5+1;       newV4.newV5.newV7b= top.newV7;       newV4.newV5.newV7n= d;        newV4.newV5.newV7i= newV8 + 1
end   /*�*until i==max*/
end        /*�*while #\==0 */
newV5= 0                                             /*�* [↓↓↓]  handle neg. and pos. arrays. */
do i=size  by -1  for size;    if newV3.i>=0  then iterate;     newV5= newV5+1;      newV2.newV5= newV3.i
end   /*�*i*/
do j=1  for size;   if newV3.j>=0  then do;  newV5= newV5+1;   newV2.newV5= newV3.j;  end;    newV3.j= newV2.j+0
end   /*�*j*/                              /*�* [↑↑↑]  combine 2 lists into 1 list. */
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
selection: procedure expose newV3.;  parse arg n
do j=1  for n-1;         newV7= newV3.j;         p= j
do k=j+1  to n;      if newV3.k>=newV7  then iterate
newV7= newV3.k;              p= k      /*�*this item is out─of─order, swap later*/
end   /*�*k*/
if p==j  then iterate              /*�*if the same, the order of items is OK*/
newV7= newV3.j;     newV3.j= newV3.p;    newV3.p=      /*�*swap 2 items that're out─of─sequence.*/
end       /*�*j*/;         return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
shell: procedure expose newV3.;   parse arg N        /*�*obtain the  N  from the argument list*/
i= N % 2                                  /*�*%   is integer division in REXX.     */
do  while i\==0
do j=i+1  to N;    k= j;      p= k-i         /*�*P: previous item*/
newV7= newV3.j
do  while k>=i+1 & newV3.p>newV7;   newV3.k= newV3.p;    k= k-i;    p= k-i
end   /*�*while k≥i+1*/
newV3.k= newV7
end          /*�*j*/
if i==2  then i= 1
else i= i * 5 % 11
end                 /*�*while i¬==0*/;                  return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Compare-sorting-algorithms-performance\compare-sorting-algorithms-performance.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
