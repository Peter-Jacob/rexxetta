/*�*REXX program solves a  knapsack problem  (22 items + repeats, with weight restriction.*/
call @gen                                        /*�*generate items and initializations.  */
call @sort                                       /*�*sort items by decreasing their weight*/
call build                                       /*�*build a list of choices (objects).   */
call showOBJ                                     /*�*display the list of choices (objects)*/
call findBest                                    /*�*examine and find the possible choices*/
call showBest                                    /*�*display best choice  (weight, value).*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
@gen: newV8.=;        newV8.1  = 'map                       9  150'
newV8.2  = 'compass                  13   35'
newV8.3  = 'water                   153  200   2'
newV8.4  = 'sandwich                 50   60   2'
newV8.5  = 'glucose                  15   60   2'
newV8.6  = 'tin                      68   45   3'
newV8.7  = 'banana                   27   60   3'
newV8.8  = 'apple                    39   40   3'
newV8.9  = 'cheese                   23   30'
newV8.10 = 'beer                     52   10   3'
newV8.11 = 'suntan_cream             11   70'
newV8.12 = 'camera                   32   30'
newV8.13 = 'T-shirt                  24   15   2'
newV8.14 = 'trousers                 48   10   2'
newV8.15 = 'umbrella                 73   40'
newV8.16 = 'waterproof_trousers      42   70'
newV8.17 = 'waterproof_overclothes   43   75'
newV8.18 = 'note-case                22   80'
newV8.19 = 'sunglasses                7   20'
newV8.20 = 'towel                    18   12   2'
newV8.21 = 'socks                     4   50'
newV8.22 = 'book                     30   10   2'
highQ = 0                                    /*�*maximum quantity specified (if any). */
maxL = length('knapsack items')             /*�* "     "    width for the table names*/
maxW = length('weight')                     /*�* "     "      "    "    "   weights. */
maxV = length('value')                      /*�* "     "      "    "    "   values.  */
maxQ = length('pieces')                     /*�* "     "      "    "    "   quantity.*/
maxWeight=400                               /*�*the maximum weight for the knapsack. */
items= 0;   i.=;    w.=0;    v.=0;   q.=0   /*�*initialize some stuff and things.    */
Tw= 0;   Tv=0;   Tq=0;    m=maxWeight    /*�*     "     more   "    "     "       */
say;  say 'maximum weight allowed for a knapsack: '   commas(maxWeight);     say
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
@sort:        do j=1  while newV8.j\==''             /*�*process each choice and sort the item*/
newV8.j=space(newV8.j);   newV6=word(newV8.j, 2) /*�*choose first item (arbitrary).       */
do k=j+1  while newV8.k\==''       /*�*find a possible heavier item.        */
newV7=word(newV8.k, 2)
if newV7>newV6  then do;  newV12=newV8.k;  newV8.k=newV8.j;  newV8.j=newV12;  newV6=newV7;  end   /*�*swap*/
end   /*�*k*/
end       /*�*j*/                    /*�* [↑]  minimizes the # of combinations*/
obj=j-1                                    /*�*adjust for the   DO   loop index.    */
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
build:        do j=1  for obj                    /*�*build a list of choices (objects).   */
parse var  newV8.j  item  w  v  q  .   /*�*parse the original choice for table. */
if w>maxWeight  then iterate       /*�*Is the weight > maximum?  Then ignore*/
Tw=Tw+w;  Tv=Tv+v;   Tq=Tq+1       /*�*add the totals up  (for alignment).  */
maxL=max(maxL, length(item))       /*�*find the maximum width for an item.  */
if q==''  then q=1
highQ=max(highQ, q)
items=items+1                      /*�*bump the item counter.               */
i.items=item;  w.items=w;  v.items=v;  q.items=q
do k=2  to q  ;  items=items+1 /*�*bump the item counter  (each piece). */
i.items=item;  w.items=w;  v.items=v;  q.items=q
Tw=Tw+w;    Tv=Tv+v;    Tq=Tq+1
end   /*�*k*/
end       /*�*j*/
maxW = max(maxW, length( commas(Tw) ) )    /*�*find the maximum width for weight.   */
maxV = max(maxV, length( commas(Tv) ) )    /*�*  "   "     "      "    "  value.    */
maxQ = max(maxQ, length( commas(Tq) ) )    /*�*  "   "     "      "    "  quantity. */
maxL = maxL + maxL %4 + 4                  /*�*extend the width of name for table.  */
return                                     /*�* [↑]    %  is REXX integer division. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: procedure;  parse arg newV12;   n=newV12'.9';   newV13=123456789;    b=verify(n, newV13, "M");   x=','
e=verify(n, newV13'0', , verify(n, newV13"0.", 'M') ) - 4     /*�* [↓]  add commas to number*/
do j=e  to b  by -3;    newV12=insert(x, newV12, j);  end  /*�*j*/;                return newV12
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
hdr:  parse arg newV2, newV12;         if highq\==1  then newV12=center('pieces', maxq)
call show center(newV2,  maxL), center('weight', maxW), center('value',  maxV), ,
center(newV12     ,  maxQ);                          call hdr2;        return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
hdr2: newV12=maxQ;   x='═';          if highq==1  then newV12=0
call show copies(x, maxL), copies(x, maxW), copies(x, maxV), copies(x, newV12);  return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
jnewV14:   parse arg newV12,newV14;  newV15=value('Z'newV12);    do k=1  for newV12;  newV14=newV14 value('J'k);  end;    return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show: parse arg newV5, newV1, newV3, newV4
say translate(left(newV5, maxL,'─'), ,'_')  right(commas(newV1), maxW),
right(commas(newV3 ), maxV)            right(commas(newV4 ), maxQ);   return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
showOBJ: call hdr 'item';     do j=1  for obj             /*�*show the formatted choices. */
parse var  newV8.j  item weight value q .
if highq==1  then  q=
else  if q==''  then q=1
call show  item, weight, value, q
end   /*�*j*/
say;    say  'number of   unique   named items: '    obj
say  'number of items (including reps): '  items;    say;        return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
showBest:                     do words(newV14);  newV14=strip(space(newV14), "L", 0);  end   /*�*words(?)*/
bestC=newV14;   bestW=0;   bestV=newV15;   highQ=0;   totP=words(bestC);   say
call hdr 'best choice'
do j=1  to totP         /*�*J  is modified within  DO  loop.*/
newV12=word(bestC, j);     newV9=w.newV12;     newV10=v.newV12;     q=1
if newV12==0  then iterate
do k=j+1  to totP;  newV11=word(bestC, k)  /*�*get a choice.*/
if i.newV12\==i.newV11  then leave              /*�*not equal ?  */
j=j+1;       w.newV12=w.newV12+newV9;       v.newV12=v.newV12+newV10;         q=q+1
end   /*�*k*/
call show  i.newV12,  w.newV12,  v.newV12,  q;            bestW=bestw+w.newV12
end       /*�*j*/
call hdr2;    say
call show 'best weight'   ,     bestW        /*�*show a nicely formatted winnerW.*/
call show 'best value'    , ,   bestV        /*�*  "  "    "       "     winnerV.*/
call show 'knapsack items', , , totP         /*�*  "  "    "       "     pieces. */
return
/*�*─────────────────────────────────────────────────────────────────────────────────────────────────────────*/
findBest:      h=items;      newV15=0
do j1 =0  for h+1;                                       w1=    w.j1 ; z1=    v.j1 ;if  z1>newV15 then call jnewV14  1
do j2 =j1 +(j1 >0) to h;if w.j2 +w1 >m then iterate  j1; w2=w1 +w.j2 ; z2=z1 +v.j2 ;if  z2>newV15 then call jnewV14  2
do j3 =j2 +(j2 >0) to h;if w.j3 +w2 >m then iterate  j2; w3=w2 +w.j3 ; z3=z2 +v.j3 ;if  z3>newV15 then call jnewV14  3
do j4 =j3 +(j3 >0) to h;if w.j4 +w3 >m then iterate  j3; w4=w3 +w.j4 ; z4=z3 +v.j4 ;if  z4>newV15 then call jnewV14  4
do j5 =j4 +(j4 >0) to h;if w.j5 +w4 >m then iterate  j4; w5=w4 +w.j5 ; z5=z4 +v.j5 ;if  z5>newV15 then call jnewV14  5
do j6 =j5 +(j5 >0) to h;if w.j6 +w5 >m then iterate  j5; w6=w5 +w.j6 ; z6=z5 +v.j6 ;if  z6>newV15 then call jnewV14  6
do j7 =j6 +(j6 >0) to h;if w.j7 +w6 >m then iterate  j6; w7=w6 +w.j7 ; z7=z6 +v.j7 ;if  z7>newV15 then call jnewV14  7
do j8 =j7 +(j7 >0) to h;if w.j8 +w7 >m then iterate  j7; w8=w7 +w.j8 ; z8=z7 +v.j8 ;if  z8>newV15 then call jnewV14  8
do j9 =j8 +(j8 >0) to h;if w.j9 +w8 >m then iterate  j8; w9=w8 +w.j9 ; z9=z8 +v.j9 ;if  z9>newV15 then call jnewV14  9
do j10=j9 +(j9 >0) to h;if w.j10+w9 >m then iterate  j9;w10=w9 +w.j10;z10=z9 +v.j10;if z10>newV15 then call jnewV14 10
do j11=j10+(j10>0) to h;if w.j11+w10>m then iterate j10;w11=w10+w.j11;z11=z10+v.j11;if z11>newV15 then call jnewV14 11
do j12=j11+(j11>0) to h;if w.j12+w11>m then iterate j11;w12=w11+w.j12;z12=z11+v.j12;if z12>newV15 then call jnewV14 12
do j13=j12+(j12>0) to h;if w.j13+w12>m then iterate j12;w13=w12+w.j13;z13=z12+v.j13;if z13>newV15 then call jnewV14 13
do j14=j13+(j13>0) to h;if w.j14+w13>m then iterate j13;w14=w13+w.j14;z14=z13+v.j14;if z14>newV15 then call jnewV14 14
do j15=j14+(j14>0) to h;if w.j15+w14>m then iterate j14;w15=w14+w.j15;z15=z14+v.j15;if z15>newV15 then call jnewV14 15
do j16=j15+(j15>0) to h;if w.j16+w15>m then iterate j15;w16=w15+w.j16;z16=z15+v.j16;if z16>newV15 then call jnewV14 16
do j17=j16+(j16>0) to h;if w.j17+w16>m then iterate j16;w17=w16+w.j17;z17=z16+v.j17;if z17>newV15 then call jnewV14 17
do j18=j17+(j17>0) to h;if w.j18+w17>m then iterate j17;w18=w17+w.j18;z18=z17+v.j18;if z18>newV15 then call jnewV14 18
do j19=j18+(j18>0) to h;if w.j19+w18>m then iterate j18;w19=w18+w.j19;z19=z18+v.j19;if z19>newV15 then call jnewV14 19
do j20=j19+(j19>0) to h;if w.j20+w19>m then iterate j19;w20=w19+w.j20;z20=z19+v.j20;if z20>newV15 then call jnewV14 20
do j21=j20+(j20>0) to h;if w.j21+w20>m then iterate j20;w21=w20+w.j21;z21=z20+v.j21;if z21>newV15 then call jnewV14 21
do j22=j21+(j21>0) to h;if w.j22+w21>m then iterate j21;w22=w21+w.j22;z22=z21+v.j22;if z22>newV15 then call jnewV14 22
do j23=j22+(j22>0) to h;if w.j23+w22>m then iterate j22;w23=w22+w.j23;z23=z22+v.j23;if z23>newV15 then call jnewV14 23
do j24=j23+(j23>0) to h;if w.j24+w23>m then iterate j23;w24=w23+w.j24;z24=z23+v.j24;if z24>newV15 then call jnewV14 24
do j25=j24+(j24>0) to h;if w.j25+w24>m then iterate j24;w25=w24+w.j25;z25=z24+v.j25;if z25>newV15 then call jnewV14 25
do j26=j25+(j25>0) to h;if w.j26+w25>m then iterate j25;w26=w25+w.j26;z26=z25+v.j26;if z26>newV15 then call jnewV14 26
do j27=j26+(j26>0) to h;if w.j27+w26>m then iterate j26;w27=w26+w.j27;z27=z26+v.j27;if z27>newV15 then call jnewV14 27
do j28=j27+(j27>0) to h;if w.j28+w27>m then iterate j27;w28=w27+w.j28;z28=z27+v.j28;if z28>newV15 then call jnewV14 28
do j29=j28+(j28>0) to h;if w.j29+w28>m then iterate j28;w29=w28+w.j29;z29=z28+v.j29;if z29>newV15 then call jnewV14 29
do j30=j29+(j29>0) to h;if w.j30+w29>m then iterate j29;w30=w29+w.j30;z30=z29+v.j30;if z30>newV15 then call jnewV14 30
do j31=j30+(j30>0) to h;if w.j31+w30>m then iterate j30;w31=w30+w.j31;z31=z30+v.j31;if z31>newV15 then call jnewV14 31
do j32=j31+(j31>0) to h;if w.j32+w31>m then iterate j31;w32=w31+w.j32;z32=z31+v.j32;if z32>newV15 then call jnewV14 32
do j33=j32+(j32>0) to h;if w.j33+w32>m then iterate j32;w33=w32+w.j33;z33=z32+v.j33;if z33>newV15 then call jnewV14 33
do j34=j33+(j33>0) to h;if w.j34+w33>m then iterate j33;w34=w33+w.j34;z34=z33+v.j34;if z34>newV15 then call jnewV14 34
do j35=j34+(j34>0) to h;if w.j35+w34>m then iterate j34;w35=w34+w.j35;z35=z34+v.j35;if z35>newV15 then call jnewV14 35
do j36=j35+(j35>0) to h;if w.j36+w35>m then iterate j35;w36=w35+w.j36;z36=z35+v.j36;if z36>newV15 then call jnewV14 36
do j37=j36+(j36>0) to h;if w.j37+w36>m then iterate j36;w37=w36+w.j37;z37=z36+v.j37;if z37>newV15 then call jnewV14 37
end;end;end;end;end;end;end;end;end;end;end;end;end;end;end;end;end;end;end;end;end;end;end;end;end;end;end
end;end;end;end;end;end;end;end;end;end;        return      /*�* [↑]  there is one END for each DO loop.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Knapsack-problem-Bounded\knapsack-problem-bounded.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
