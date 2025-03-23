/*�*REXX program performs the Cholesky decomposition on a square matrix & displays results*/
niner =  '25  15  -5' ,                          /*�*define a  3x3  matrix with elements. */
'15  18   0' ,
'-5   0  11'
call Cholesky niner
hexer =  18  22  54  42,                         /*�*define a  4x4  matrix with elements. */
22  70  86  62,
54  86 174 134,
42  62 134 106
call Cholesky hexer
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Cholesky: procedure;  parse arg mat;   say;   say;   call tell 'input array',mat
do    r=1  for ord
do c=1  for r; newV3=0;  do i=1  for c-1;  newV3= newV3  +  newV1.r.i * newV1.c.i;  end /*�*i*/
if r=c  then newV1.r.r= sqrt(newV1.r.r - newV3)
else newV1.r.c= 1 / newV1.c.c * (newV2.r.c - newV3)
end   /*�*c*/
end      /*�*r*/
call tell  'Cholesky factor',,newV1.,'─'
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
err:   say;   say;   say '***error***!';      say;    say arg(1);   say;   say;    exit 13
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
tell:  parse arg hdr,x,y,sep;   newV4=0;          if sep==''  then sep= '═'
dPlaces= 5                                /*�*# dec. places past the decimal point.*/
width  =10                                /*�*field width used to display elements.*/
if y==''  then newV1.=0
else do row=1  for ord;  do col=1  for ord;  x=x newV1.row.col;  end;   end
w=words(x)
do ord=1  until ord**2>=w;  end   /*�*a fast way to find the matrix's order*/
say
if ord**2\==w  then call err  "matrix elements don't form a square matrix."
say center(hdr, ((width + 1) * w) % ord,  sep)
say
do   row=1  for ord;         z=
do col=1  for ord;         newV4= newV4 + 1
newV2.row.col= word(x, newV4)
if col<=row  then  newV1.row.col= newV2.row.col
z=z  right( format(newV2.row.col, , dPlaces) / 1,   width)
end   /*�*col*/                   /*�*       ↑↑↑                           */
say z                             /*�*       └┴┴──◄──normalization for zero*/
end        /*�*row*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sqrt:  procedure; parse arg x;  if x=0  then return 0;  d=digits(); numeric digits;  h=d+6
numeric form; m.=9; parse value format(x,2,1,,0) 'E0' with g 'E' newV5 .; g=g*.5'e'newV5 %2
do j=0  while h>9;      m.j=h;              h=h%2+1;       end  /*�*j*/
do k=j+5  to 0  by -1;  numeric digits m.k; g=(g+x/g)*.5;  end  /*�*k*/; return g/1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Cholesky-decomposition\cholesky-decomposition.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
