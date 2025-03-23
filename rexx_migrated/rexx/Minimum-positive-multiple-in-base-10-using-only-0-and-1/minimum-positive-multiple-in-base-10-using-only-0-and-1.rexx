/*�*REXX pgm finds minimum pos. integer that's a product of N that only has the digs 0 & 1*/
numeric digits 30;  w= length( commas( copies(1, digits())))   /*�*for formatting numbers.*/
parse arg list
if list==''  then list= 1..10  95..105 297
say center(' N ', 9, "─")      center(' B10 ', w, "─")      center(' multiplier ', w, "─")

do i=1  for words(list)
z= word(list, i);                      LO= z;    HI= z
if pos(.., z)\==0  then parse var  z   LO  '..'  HI

do n=LO  to HI;                             m= B10(n)
say right(commas(n), 9)      right(commas(n*m), w)         left(commas(m), w)
end   /*�*n*/
end      /*�*i*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: parse arg newV1;  do c=length(newV1)-3  to 1  by -3; newV1= insert(',', newV1, c); end;   return newV1
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
B10: parse arg newV2;  inc= 1;                         start= 1;               L= length(newV2)
select
when verify(newV2, 10)==0  then return 1
when verify(newV2,  9)==0  then do;                start=
do k= 1  for 8
start= start || copies(k, L)
end   /*�*k*/
end
when newV2//2==0           then do;  start=5;  inc=  5;  end
when right(z, 1)==7    then do;  start=3;  inc= 10;  end
otherwise nop
end   /*�*select*/
q= length(start)
if q>digits()  then numeric digits q
do m=start  by  inc  until verify(p, 10)==0;   p= newV2 * m
end   /*�*m*/
return m
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Minimum-positive-multiple-in-base-10-using-only-0-and-1\minimum-positive-multiple-in-base-10-using-only-0-and-1.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
