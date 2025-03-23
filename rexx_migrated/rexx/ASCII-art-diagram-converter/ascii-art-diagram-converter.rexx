/*�*REXX program  interprets  an  ASCII art diagram  for  names  and  their bit length(s).*/
numeric digits 100                               /*�*be able to handle large numbers.     */
er= '***error*** illegal input txt'              /*�*a literal used for error messages.   */
parse arg iFID test .                            /*�*obtain optional input─FID & test─data*/
if iFID=='' | iFID==","  then iFID= 'ASCIIART.TXT'               /*�*use the default iFID.*/
if test=='' | test==","  then test= 'cafe8050800000808080000a'   /*�* "   "     "    data.*/
w= 0;         wb= 0;      newV1.= 0;     newV8=          /*�*W   (max width name),  bits,  names. */
newV2.= 0;        newV2.0= 1                             /*�*!.α   is structure bit position.     */
/*�* [↓]  read the input text file (iFID)*/
do j=1  while lines(iFID)\==0;     q= linein(iFID);             say  '■■■■■text►'q
q= strip(q);          if q==''  then iterate /*�*strip leading and trailing blanks.   */
newV3= left(q, 1);       newV4= right(q, 1)        /*�*get extreme left and right characters*/
/*�* [↓]  is this record an "in-between"?*/
if newV3=='+'  then do;  if verify(q, '+-')\==0  then say er    "(invalid grid):"     q
iterate                /*�*skip this record, it's a single "+". */
end
if newV3\=='|'  |  newV4\=="|"   then do;   say er  '(boundary): '   q;   iterate
end
do  until q=='|';  parse var  q    '|'  x  "|"  -1  q   /*�*parse record for names.*/
n= strip(x);       w= max(w, length(n) );   if n==''  then leave     /*�*is N null?*/
if words(n)\==1         then do;  say er '(invalid name): '  n;     iterate j
end          /*�* [↑]  add more name validations.     */
newV5= newV8;     nn= n;  upper newV5 n             /*�*$$ and N  could be a mixed─case name.*/
if wordpos(nn, newV5)\==0  then do;  say er '(dup name):'       n;     iterate j
end
newV8= newV8 n                                    /*�*add the   N   (name)  to the $ list. */
newV9= words(newV8);     newV1.newV9= (length(x) + 1) % 3 /*�*assign the number of bits for  N.    */
wb= max(wb, newV1.newV9)                          /*�*max # of bits; # names prev. to this.*/
prev= newV9 - 1;     newV2.newV9= newV2.prev + newV1.prev     /*�*number of names previous to this name*/
end   /*�*until*/
end      /*�*j*/
say
if j==1  then do;   say er   '   (file not found): '     iFID;            exit 12
end
do k=1  for words(newV8)
say right( word(newV8, k), w)right(newV1.k, 4)        "bits,  bit position:"right(newV2.k, 5)
end   /*�*k*/
say                                              /*�* [↓]  Any (hex) data to test?        */
L= length(test);      if L==0  then exit         /*�*stick a fork in it,  we're all done. */
bits= x2b(test)                                  /*�*convert test data to a bit string.   */
wm= length( x2d( b2x( copies(1, wb) ) ) )  +  1  /*�*used for displaying max width numbers*/
say 'test (hex)='    test                 "    length="   L          'hexadecimal digits.'
say
do r=1  by 8+8  to L*4;   newV6= substr(bits, r, 8, 0);    newV7= substr(bits, r+8, 8, 0)
say 'test (bit)='    newV6   newV7   "   hex="    lower( b2x(newV6) )     lower( b2x(newV7) )
end   /*�*r*/
say
do m=1  for words(newV8)                      /*�*show some hexadecimal strings──►term.*/
newV10= lower( b2x( substr( bits, newV2.m, newV1.m) )) /*�*show the hex string in lowercase.    */
say right( word(newV8, m), w+2)     '  decimal='right( x2d(newV10), wm)      "      hex="  newV10
end   /*�*m*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
lower: l= 'abcdefghijklmnopqrstuvwxyz';  u=l;  upper u;    return translate( arg(1), l, u)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\ASCII-art-diagram-converter\ascii-art-diagram-converter.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
