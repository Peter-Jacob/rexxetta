/*�*REXX program calculates and displays the amount of rainwater collected between towers.*/
call tower  1  5  3  7  2
call tower  5  3  7  2  6  4  5  9  1  2
call tower  2  6  3  5  2  8  1  4  2  2  5  3  5  7  4  1
call tower  5  5  5  5
call tower  5  6  7  8
call tower  8  7  7  6
call tower  6  7 10  7  6
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
tower: procedure; arg y;  newV1=words(y); t.=0; L.=0 /*�*the T. array holds the tower heights.*/
do j=1  for newV1;    t.j= word(y, j)    /*�*construct the towers,                */
newV2= j-1;           L.j= max(t.newV2, L.newV2) /*�*    "      "  left─most tallest tower*/
end   /*�*j*/
R.=0
do b=newV1  by -1  for newV1;  newV2= b+1; R.b= max(t.newV2, R.newV2) /*�*right─most tallest tower*/
end   /*�*b*/
w.=0                                                       /*�*rainwater collected.*/
do f=1  for newV1;  if t.f>=L.f | t.f>=R.f  then iterate  /*�*rain between towers?*/
w.f= min(L.f, R.f) - t.f;     w.00= w.00 + w.f        /*�*rainwater collected.*/
end   /*�*f*/
say right(w.00, 9) 'units of rainwater collected for: '  y /*�*display water units.*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Water-collected-between-towers\water-collected-between-towers-2.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
