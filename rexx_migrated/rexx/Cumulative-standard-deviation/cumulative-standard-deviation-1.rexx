/*�*REXX program calculates and displays the standard deviation of a given set of numbers.*/
parse arg newV2                                      /*�*obtain optional arguments from the CL*/
if newV2=''  then  newV2= 2 4 4 4 5 5 7 9                /*�*None specified?  Then use the default*/
n= words(newV2);   newV3= 0;      newV1= 0;    L= length(n) /*�*N:  # items; $,$$:  sums to be zeroed*/
/*�* [↓]  process each number in the list*/
do j=1  for n
newV4= word(newV2, j);        newV3= newV3   +  newV4
newV1= newV1  +  newV4**2
say  '   item'  right(j, L)":"    right(newV4, 4)    '  average='    left(newV3/j, 12),
'   standard deviation='     sqrt(newV1/j  -  (newV3/j)**2)
end   /*�*j*/                           /*�* [↑]  prettify output with whitespace*/
say 'standard deviation: ' sqrt(newV1/n - (newV3/n)**2) /*�*calculate & display the std deviation*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sqrt: procedure; parse arg x; if x=0  then return 0; d=digits(); h=d+6; m.=9; numeric form
numeric digits; parse value format(x,2,1,,0) 'E0' with g 'E' newV4 .;   g=g * .5'e'newV4 % 2
do j=0  while h>9;      m.j=h;               h=h%2+1;        end  /*�*j*/
do k=j+5  to 0  by -1;  numeric digits m.k;  g=(g+x/g)*.5;   end  /*�*k*/
numeric digits d;                    return g/1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Cumulative-standard-deviation\cumulative-standard-deviation-1.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
