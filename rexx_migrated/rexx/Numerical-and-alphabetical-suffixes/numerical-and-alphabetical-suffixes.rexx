/*ͺ*REXX pgm converts numbers (with commas) with suffix multipliersβββΊpure decimal numbers*/
numeric digits 2000                              /*ͺ*allow the usage of ginormous numbers.*/
newV1.=; newV1.1= '2greatGRo   24Gros  288Doz  1,728pairs  172.8SCOre'
newV1.2= '1,567      +1.567k    0.1567e-2m'
newV1.3= '25.123kK    25.123m   2.5123e-00002G'
newV1.4= '25.123kiKI  25.123Mi  2.5123e-00002Gi  +.25123E-7Ei'
newV1.5= '-.25123e-34Vikki      2e-77gooGols'
newV1.6=  9newV4   9newV4newV4   9newV4newV4newV4   9newV4newV4newV4newV4   9newV4newV4newV4newV4newV4   9newV4newV4newV4newV4newV4newV4   9newV4newV4newV4newV4newV4newV4newV4   9newV4newV4newV4newV4newV4newV4newV4newV4   9newV4newV4newV4newV4newV4newV4newV4newV4newV4

parse arg x                                      /*ͺ*obtain optional arguments from the CL*/
if x\==''  then do;    newV1.2=;     newV1.1=x           /*ͺ*use the number(s) specified on the CL*/
end                              /*ͺ*allow user to specify their own list.*/
/*ͺ* [β]  handle a list or multiple lists*/
do  n=1  while newV1.n\=='';     newV2=              /*ͺ*process each of the numbers in lists.*/
say 'numbers= '      newV1.n                     /*ͺ*echo the original arg to the terminal*/

do j=1  for words(newV1.n);  y= word(newV1.n, j) /*ͺ*obtain a single number from the input*/
newV2= newV2  ' 'commas( num(y) )                /*ͺ*process a number; add result to list.*/
end   /*ͺ*j*/                              /*ͺ* [β]  add commas to number if needed.*/
/*ͺ* [β]  add extra blank betweenst nums.*/
say ' result= '      strip(newV2);   say         /*ͺ*echo the result(s) to the terminal.  */
end       /*ͺ*n*/                              /*ͺ* [β]  elide the  pre-pended  blank.  */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
isInt:  return datatype( arg(1), 'Whole')        /*ͺ*return 1 if arg is an integer,  or 0 */
isNum:  return datatype( arg(1), 'Number')       /*ͺ*   "   "  "  "   " a  number.    " " */
p:      return word( arg(1), 1)                  /*ͺ*pick 1st argument  or  2nd argument. */
ser:    say;   say '***error*** '  arg(1);           say;            exit 13
shorten:procedure; parse arg a,n;      return left(a,  max(0, length(a) - p(n 1) ) )
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
newV2factnewV4: procedure; parse arg x newV3 .;    L= length(x);    n= L - length(strip(x, 'T', "!") )
if n<=-n | newV3\=='' | arg()\==1  then return x;   z= left(x, L - n)
if z<0 | \isInt(z)             then return x;   return newV2fact(z, n)
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
newV2fact:  procedure; parse arg x newV3 .;  arg ,n newV4 .;     n= p(n 1);    if \isInt(n)  then n= 0
if x<-n | \isInt(x) |n<1 | newV3||newV4\=='' |arg()>2  then return x||copies("!",max(1,n))
s= x // n;   if s==0  then s= n          /*ͺ*compute where to start multiplying.  */
newV4= 1                                     /*ͺ*the initial factorial product so far.*/
do j=s  to x  by n;   newV4= newV4*j  /*ͺ*perform the actual factorial product.*/
end   /*ͺ*j*/                   /*ͺ*{operator  //  is REXX's Γ· remainder}*/
return newV4                                 /*ͺ* [β]  handles any level of factorial.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
newV2sfxa:  parse arg u,s 1 c,m;   upper u c         /*ͺ*get original version & upper version.*/
if pos( left(s, 2), u)\==0  then do j=length(s)   to compare(s, c)-1   by -1
if right(u, j) \== left(c, j)  then iterate
newV3= left(u, length(u) - j)        /*ͺ*get the num.*/
if isNum(newV3)  then return m * newV3   /*ͺ*good suffix.*/
leave                            /*ͺ*return as is*/
end
return arg(1)                            /*ͺ* [β]  handles an alphabetic suffixes.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
newV2sfxnewV4:  parse arg y;                     if right(y, 1)=='!'  then y= newV2factnewV4(y)
if \isNum(y)  then y=newV2sfxz();    if isNum(y)  then return y;       return newV2sfxm(y)
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
newV2sfxm:  parse arg z 1 w;     upper w;    newV5= 'KMGTPEZYXWVU';                       b= 1000
if right(w, 1)=='I'  then do;    z= shorten(z);      w= z;    upper w;    b= 1024
end
newV3= pos( right(w, 1), newV5);         if newV3==0      then return arg(1)
n= shorten(z);  r= num(n, , 1);  if isNum(r)  then return r * b**newV3
return arg(1)                            /*ͺ* [β]  handles metric or binary suffix*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
newV2sfxz:  return newV2sfxa( newV2sfxa( newV2sfxa( newV2sfxa( newV2sfxa( newV2sfxa(y, 'PAIRs', 2),   'DOZens', 12), ,
'SCores', 20),   'GREATGRoss',  1728),     'GRoss', 144),     'GOOGOLs', 1e100)
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas: procedure;  parse arg newV3;    n= newV3'.9';      newV6= 123456789;      b= verify(n, newV6, "M")
e= verify(n, newV6'0', ,   verify(n, newV6"0.", 'M') )  -  4         /*ͺ* [β]  add commas.*/
do j=e  to b  by -3;   newV3= insert(',', newV3, j);     end  /*ͺ*j*/;           return newV3
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
num:    procedure; parse arg x .,,q;         if x==''  then return x
if  isNum(x)  then return  x/1;      x= space( translate(x, , ','), 0)
if \isNum(x)  then x= newV2sfxnewV4(x);      if isNum(x)  then return x/1
if q==1  then return x
if q==''  then call ser "argument isn't numeric or doesn't have a legal suffix:" x
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Numerical-and-alphabetical-suffixes\numerical-and-alphabetical-suffixes.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
