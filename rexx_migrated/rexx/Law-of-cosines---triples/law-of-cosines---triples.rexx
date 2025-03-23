/*�*REXX pgm finds integer sided triangles that satisfy Law of cosines for 60º, 90º, 120º.*/
parse arg os1 os2 os3 os4 .                      /*�*obtain optional arguments from the CL*/
if os1=='' | os1==","  then os1= 13; s1=abs(os1) /*�*Not specified?  Then use the default.*/
if os2=='' | os2==","  then os2= 13; s2=abs(os2) /*�* "      "         "   "   "     "    */
if os3=='' | os3==","  then os3= 13; s3=abs(os3) /*�* "      "         "   "   "     "    */
if os4=='' | os4==","  then os4= -0; s4=abs(os4) /*�* "      "         "   "   "     "    */
newV2.=                                              /*�*@:  array holds squares, max of sides*/
do j=1  for max(s1, s2, s3, s4);  newV2.j= j * j    /*�*use memoization.*/
end   /*�*j*/
if s1>0  then call s1                            /*�*handle the triangle case for   120º. */
if s2>0  then call s2                            /*�*handle the triangle case for    90º. */
if s3>0  then call s3                            /*�*handle the triangle case for    60º. */
if s4>0  then call s4                            /*�*handle the case for unique sides.    */
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: parse arg newV3;  do jc=length(newV3)-3  to 1  by -3; newV3=insert(',', newV3, jc); end;  return newV3
dAng: w= length(s); ang= ' 'd"º " uq' ';  ss= s * s;  newV1= " solutions found for"; return
foot: say right(commas(#) newV1 ang  "(sides up to" commas(arg(1) +0)')', 65);  say; return
head: #= 0;  parse arg d,uq,s;  newV4= ',';   call dAng;      say center(ang, 65, '═'); return
show: #=#+1; arg p; if p>0  then say '     ('right(a,w)newV4 right(b,w)newV4 right(c,w)")"; return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
s1:   call head 120,,s1                          /*�*────────── 120º:  a² + b² + ab  ≡ c² */
do     a=1    for s1;         ap1= a + 1
do   b=ap1  for s1-ap1+1;   x= newV2.a + newV2.b + a*b;     if x>ss  then iterate a
do c=b+1  for s1-b+1  until newV2.c>x
if x==newV2.c  then do;  call show os1;  iterate b;  end
end   /*�*c*/
end     /*�*b*/
end       /*�*a*/
call foot s1;                        return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
s2:   call head  90,,s2                          /*�*────────── 90º:   a² + b²       ≡ c² */
do     a=1    for s2;         ap1= a + 1
do   b=ap1  for s2-ap1+1;   x= newV2.a + newV2.b;           if x>ss  then iterate a
do c=b+1  for s2-b+2  until newV2.c>x
if x==newV2.c  then do;  call show os2;  iterate b;  end
end   /*�*c*/
end     /*�*b*/
end       /*�*a*/
call foot s2;                        return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
s3:   call head  60,,s3                          /*�*────────── 60º:   a² + b² ─ ab  ≡ c² */
do     a=1   for s3;          s3ma= s3 - a + 1
do   b=a   for s3ma;        x= newV2.a + newV2.b - a*b;     if x>ss  then iterate a
do c=a   for s3ma  until newV2.c>x
if x==newV2.c  then do;  call show os3;  iterate b;  end
end   /*�*c*/
end     /*�*b*/
end       /*�*a*/
call foot s2;                        return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
s4:   call head  60, 'unique', os4               /*�*────────── 60º:  a² + b² ─ ab   ≡ c² */
do     a=1    for s4;         ap1= a + 1;    s4map1= s4 - ap1 + 1
do   b=ap1  for s4map1;     x= newV2.a + newV2.b - a*b;     if x>ss  then iterate a
do c=ap1  for s4map1  until newV2.c>x
if x==newV2.c  then do;  call show os4;  iterate b;  end
end   /*�*c*/
end     /*�*b*/
end       /*�*a*/
call foot s4;                        return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Law-of-cosines---triples\law-of-cosines---triples.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
