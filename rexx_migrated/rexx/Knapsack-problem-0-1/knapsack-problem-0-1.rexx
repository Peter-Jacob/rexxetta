/*�*REXX program solves a  knapsack problem  (22  {+1}  items with a weight restriction). */
maxWeight=400                                    /*�*the maximum weight for the knapsack. */
say 'maximum weight allowed for a knapsack:'  commas(maxWeight);          say
call gen@                                        /*�*generate the   @   array of choices. */
call sortD                                       /*�*  sort    "    "     "    "    "     */
call build                                       /*�*build some associative arrays from @.*/
call findBest                                    /*�*go ye forth and find the best choises*/
call results                                     /*�*display the best choices for knapsack*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
build:    do j=1  for obj; parse var newV2.j x w v . /*�*construct a list of knapsack choices.*/
if w>maxWeight  then iterate           /*�*Is weight greater than max?   Ignore.*/
totW=totW + w;        totV=totV + v    /*�*add the totals (for output alignment)*/
maxL=max(maxL, length(x) )             /*�*determine maximum width for an item. */
newV8=newV8+1;  i.newV8=x;  w.newV8=w;  v.newV8=v          /*�*bump the number of items (choices).  */
end   /*�*j*/                            /*�* [↑]  build indexable arrays of items*/
maxL= maxL + maxL%4 + 4                    /*�*extend width of name for shown table.*/
maxW= max(maxW, length( commas(totW) ) )   /*�*find the maximum width for  weight.  */
maxV= max(maxV, length( commas(totV) ) )   /*�*  "   "     "      "    "   value.   */
call hdr 'potential knapsack items'        /*�*display a header for list of choices.*/
do j=1  for obj; parse var newV2.j i w v . /*�*show all the choices in a nice format*/
if w<=maxWeight  then call show i,w,v  /*�*Is weight within limits?  Then show. */
end   /*�*j*/                            /*�* [↑]  display the list of choices.   */
newV9=0
say;  say 'number of allowable items: '  newV8
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: procedure;  parse arg newV10;   n=newV10'.9';    newV8=123456789;     b=verify(n, newV8, "M")
e=verify(n, newV8'0', , verify(n, newV8"0.", 'M')) - 4;         comma=','
do j=e  to b  by -3;   newV10=insert(comma, newV10, j);   end  /*�*j*/;            return newV10
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
findBest:                                m=maxWeight   /*�*items are in decreasing weight.*/
do j1 =0          for newV8+1;                                 w1 =    w.j1 ; z1 =    v.j1
do j2 =j1 +(j1 >0) to newV8; if w.j2 +w1 >m  then iterate j1 ; w2 =w1 +w.j2 ; z2 =z1 +v.j2
do j3 =j2 +(j2 >0) to newV8; if w.j3 +w2 >m  then iterate j2 ; w3 =w2 +w.j3 ; z3 =z2 +v.j3
do j4 =j3 +(j3 >0) to newV8; if w.j4 +w3 >m  then iterate j3 ; w4 =w3 +w.j4 ; z4 =z3 +v.j4
do j5 =j4 +(j4 >0) to newV8; if w.j5 +w4 >m  then iterate j4 ; w5 =w4 +w.j5 ; z5 =z4 +v.j5
do j6 =j5 +(j5 >0) to newV8; if w.j6 +w5 >m  then iterate j5 ; w6 =w5 +w.j6 ; z6 =z5 +v.j6
do j7 =j6 +(j6 >0) to newV8; if w.j7 +w6 >m  then iterate j6 ; w7 =w6 +w.j7 ; z7 =z6 +v.j7
do j8 =j7 +(j7 >0) to newV8; if w.j8 +w7 >m  then iterate j7 ; w8 =w7 +w.j8 ; z8 =z7 +v.j8
do j9 =j8 +(j8 >0) to newV8; if w.j9 +w8 >m  then iterate j8 ; w9 =w8 +w.j9 ; z9 =z8 +v.j9
do j10=j9 +(j9 >0) to newV8; if w.j10+w9 >m  then iterate j9 ; w10=w9 +w.j10; z10=z9 +v.j10
do j11=j10+(j10>0) to newV8; if w.j11+w10>m  then iterate j10; w11=w10+w.j11; z11=z10+v.j11
do j12=j11+(j11>0) to newV8; if w.j12+w11>m  then iterate j11; w12=w11+w.j12; z12=z11+v.j12
do j13=j12+(j12>0) to newV8; if w.j13+w12>m  then iterate j12; w13=w12+w.j13; z13=z12+v.j13
do j14=j13+(j13>0) to newV8; if w.j14+w13>m  then iterate j13; w14=w13+w.j14; z14=z13+v.j14
do j15=j14+(j14>0) to newV8; if w.j15+w14>m  then iterate j14; w15=w14+w.j15; z15=z14+v.j15
do j16=j15+(j15>0) to newV8; if w.j16+w15>m  then iterate j15; w16=w15+w.j16; z16=z15+v.j16
do j17=j16+(j16>0) to newV8; if w.j17+w16>m  then iterate j16; w17=w16+w.j17; z17=z16+v.j17
do j18=j17+(j17>0) to newV8; if w.j18+w17>m  then iterate j17; w18=w17+w.j18; z18=z17+v.j18
do j19=j18+(j18>0) to newV8; if w.j19+w18>m  then iterate j18; w19=w18+w.j19; z19=z18+v.j19
do j20=j19+(j19>0) to newV8; if w.j20+w19>m  then iterate j19; w20=w19+w.j20; z20=z19+v.j20
do j21=j20+(j20>0) to newV8; if w.j21+w20>m  then iterate j20; w21=w20+w.j21; z21=z20+v.j21
do j22=j21+(j21>0) to newV8; if w.j22+w21>m  then iterate j21; w22=w21+w.j22; z22=z21+v.j22
if z22>newV9  then do;  newV11=;  newV9=z22;    do j=1  for 22;  newV11=newV11 value("J"j);  end /*�*j*/;    end
end;end;end;end;end;end;end;end;end;end;end;end;end;end;end;end;end;end;end;end;end;end
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
gen@:          newV2.  =                           ;     newV2.12= 'camera                 32  30'
newV2.1 = 'map               9 150' ;     newV2.13= 'T-shirt                24  15'
newV2.2 = 'compass          13  35' ;     newV2.14= 'trousers               48  10'
newV2.3 = 'water           153 200' ;     newV2.15= 'umbrella               73  40'
newV2.4 = 'sandwich         50 160' ;     newV2.16= 'waterproof_trousers    42  70'
newV2.5 = 'glucose          15  60' ;     newV2.17= 'waterproof_overclothes 43  75'
newV2.6 = 'tin              68  45' ;     newV2.18= 'note-case              22  80'
newV2.7 = 'banana           27  60' ;     newV2.19= 'sunglasses              7  20'
newV2.8 = 'apple            39  40' ;     newV2.20= 'towel                  18  12'
newV2.9 = 'cheese           23  30' ;     newV2.21= 'socks                   4  50'
newV2.10= 'beer             52  10' ;     newV2.22= 'book                   30  10'
newV2.11= 'suntan_cream     11  70' ;     newV2.23= 'anvil              100000   1'
maxL = length('potential knapsack items')  /*�*maximum width for the table items.   */
maxW = length('weight')                    /*�*   "      "    "   "    "   weights. */
maxV = length('value')                     /*�*   "      "    "   "    "   values.  */
newV8=0;  i.=;  w.=0;  v.=0;  totW=0;  totV=0  /*�*initialize some REX variables stuff. */
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
hdr:    say;  call show center(arg(1),maxL),center('weight',maxW),center("value",maxV)
hdr2:         call show copies('═',maxL),copies('═',maxW),copies('═',maxV);       return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
results:          do newV8;  newV11=strip( space(newV11), "L", 0);  end  /*�*h*/  /*�*elide leading zeroes*/
bestC=newV11;    bestW=0;         totP=words(bestC);     say;    call hdr 'best choice'
do j=1  for totP;  newV10=word(bestC, j);      newV3=w.newV10;      newV4=v.newV10
do k=j+1  to totP;     newV5=word(bestC, k);   if i.newV10\==i.newV5 then leave
j=j+1;  w.newV10=w.newV10 + newV3;  v.newV10=v.newV10 + newV4
end    /*�*k*/
call show i.newV10, w.newV10, v.newV10;   bestW=bestW + w.newV10
end        /*�*j*/
call hdr2                   ;   say;                newV1= 'best total knapsack'
call show newV1  'weight' ,   bestW    /*�*display a nicely formatted winner wt.*/
call show newV1  'value'  ,,  newV9        /*�*     "  "    "       "     winner val*/
call show newV1  'items'  ,,, totP     /*�*     "  "    "       "     pieces.   */
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show:   parse arg newV6,newV3,newV4,newV7;  say translate( left(newV6,maxL,'─'), , "_") ,
right(commas(newV3),maxW) right(commas(newV4),maxV) newV7;   return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sortD:     do j=1  while newV2.j\==''; y=word(newV2.j,2) /*�*process each of the knapsack choices.*/
do k=j+1  while newV2.k\==''         /*�*find a possible heavier knapsack item*/
newV11=word(newV2.k,2);  if newV11>y  then do; newV10=newV2.k; newV2.k=newV2.j; newV2.j=newV10; y=newV11; end  /*�*swap*/
end   /*�*k*/
end        /*�*j*/                      /*�* [↑]  sort choices by decreasing wt. */
obj=j-1;                   return        /*�*decrement  J  for the  DO  loop index*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Knapsack-problem-0-1\knapsack-problem-0-1.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
