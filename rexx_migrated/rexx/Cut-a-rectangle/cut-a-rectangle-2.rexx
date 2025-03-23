/*�*REXX program cuts rectangles into two symmetric pieces,  the rectangles are cut along */
/*�*────────────────────────────────────────────────── unit dimensions and may be rotated.*/
numeric digits 40                                /*�*be able to handle some big integers. */
parse arg m .                                    /*�*obtain optional argument from the CL.*/
if m=='' | m==","  then m= 9                     /*�*Not specified?  Then use the default.*/
if m<0             then start= max(2, abs(m) )   /*�*<0? Then just use this size rectangle*/
else start=  2                /*�*start from two for regular invocation*/
dir.= 0;   dir.0.1= -1;   dir.1.0= -1;   dir.2.1= 1;   dir.3.0= 1    /*�*the 4 directions.*/
newV3= '# @. dir. h len next. w wp'
/*�*define the default for memoizations. */
do   y=start  to abs(m);  yOdd= y//2;  say /*�*calculate rectangles up to size  MxM.*/
do x=1  for y;    if x//2  then if yOdd  then iterate      /*�*X and Y odd?  Skip.*/
z= solve(y, x, 1);        zc= comma(z)   /*�*add commas to the result for  SOLVE. */
zca= right(zc, max(14,length(zc) ) )     /*�*align the output for better perusing.*/
say right(y, 9)   "x"    right(x, 2)     'rectangle can be cut'   zca   "way"s(z).
end   /*�*x*/
end     /*�*y*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
comma: procedure; arg newV4;  do k=length(newV4)-3  to 1  by -3; newV4=insert(',',newV4,k); end;  return newV4
s:     if arg(1)=1  then return arg(3);     return word(arg(2) 's', 1)     /*�*pluralizer.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
solve: procedure expose (newV3);  newV1.= 0                        /*�*zero rectangle coördinates.*/
parse arg h,w,recurse                               /*�*get values for some args.  */
if w==3  then do;      z= h % 2  + 2;      return 2**z  -  (z + z)  +  1
end
if h//2  then do;      t= w;    w= h;      h= t;           if h//2  then return 0
end
if w==1  then return 1
if w==2  then return h
if h==2  then return w                    /*�* [↓]   %  is REXX's integer division.*/
cy= h % 2;       cx= w % 2;     wp= w + 1 /*�*cut the  [XY]  rectangle in half.    */
len= (h+1) * wp - 1                       /*�*extend the area of the rectangle.    */
next.0= '-1';    next.1= -wp;   next.2= 1;    next.3= wp   /*�*direction & distance*/
if recurse  then newV5= 0                                      /*�*doing recursion ?   */
cywp= cy * wp                                              /*�*shortcut calculation*/
do x=cx+1  to  w-1;    t= cywp + x;      newV1.t= 1
newV2= len - t;           newV1.newV2= 1;          call walk cy - 1,  x
end   /*�*x*/
newV5= newV5 + 1
if h==w  then newV5= newV5 + newV5                    /*�*double the count of rectangle cuts.  */
else if w//2==0  then if recurse  then call solve w, h, 0
return newV5
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
walk:  procedure expose (newV3);           parse arg y,x
if y==h  then do;   newV5= newV5 + 2;   return;   end  /*�* ◄──┐      REXX short circuit.  */
if x==0  then do;   newV5= newV5 + 2;   return;   end  /*�* ◄──����ֳ        "    "      "      */
if x==w  then do;   newV5= newV5 + 2;   return;   end  /*�* ◄──����ֳ        "    "      "      */
if y==0  then do;   newV5= newV5 + 2;   return;   end  /*�* ◄──����ֳ        "    "      "      */
q= y*wp + x;      newV1.q= newV1.q + 1;     newV6= len - q /*�*    │ordered by most likely ►──┐*/
newV1.newV6= newV1.newV6 + 1                                   /*�*    └──────────────────────────┘*/
do j=0  for 4;  newV6= q + next.j    /*�*try each of the four directions.*/
if newV1.newV6==0  then do;      yn= y + dir.j.0
if yn==h  then do;   newV5= newV5 + 2;   iterate;   end
xn= x + dir.j.1
if xn==0  then do;   newV5= newV5 + 2;   iterate;   end
if xn==w  then do;   newV5= newV5 + 2;   iterate;   end
if yn==0  then do;   newV5= newV5 + 2;   iterate;   end
call walk  yn, xn
end
end   /*�*j*/
newV1.q= newV1.q - 1;                 newV6= len - q;          newV1.newV6= newV1.newV6 - 1;           return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Cut-a-rectangle\cut-a-rectangle-2.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
