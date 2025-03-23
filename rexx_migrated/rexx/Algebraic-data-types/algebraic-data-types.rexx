/*�*REXX pgm builds a red/black tree (with verification & validation), balanced as needed.*/
parse arg nodes '/' insert                       /*�*obtain optional arguments from the CL*/
if  nodes=''  then nodes =  13.8.17  8.1.11  17.15.25  1.6  25.22.27   /*�*default nodes. */
if insert=''  then insert=  22.44    44.66                             /*�*   "   inserts.*/
top= .                                           /*�*define the default for the  TOP  var.*/
call Dnodes nodes                                /*�*define nodes, balance them as added. */
call Dnodes insert                               /*�*insert   "       "      "   " needed.*/
call Lnodes                                      /*�*list the nodes  (with indentations). */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
err:    say;              say '***error***: '   arg(1);         say;              exit 13
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Dnodes: arg $d;   do j=1  for words($d);   t= word($d, j)     /*�*color: encoded into L.  */
parse var  t   p   '.'   a   "."   b   '.'   x   1  .  .  .  xx
call Vnodes p a b
if x\==''   then call err "too many nodes specified: "   xx
if p\==top  then if newV2.p==.  then call err "node isn't defined: "  p
if p ==top  then do;  newV1.p=1;  L.1=p;  end   /*�*assign the top node.    */
newV2.p= a b;   n= newV1.p + 1                      /*�*assign node; bump level.*/
if a\==''   then do;  newV1.a= n;    newV2.a=;    maxL= max(maxL, newV1.a);    end
if b\==''   then do;  newV1.b= n;    newV2.b=;    maxL= max(maxL, newV1.b);    end
L.n= space(L.n a b)                         /*�*append to the level list*/
end   /*�*j*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Lnodes:           do L=1  for  maxL;  w= length(maxL);  rb= word('(red) (black)', 1+L//2)
say "level:"   right(L, w)   left('', L+L)   " ───► "   rb    ' '   L.L
end   /*�*lev*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Vnodes: arg $v;   do v=1  for words($v);      y= word($v, v)
if \datatype(y, 'W')   then call err "node isn't a whole number: "   y
y= y / 1                                /*�*normalize Y int.: no LZ, dot*/
if top==.  then do;  LO=y;  top=y;    HI=y;   L.=;   newV2.=;  maxL=1;   end
LO= min(LO, y);  HI= max(HI, y)
if newV2.y\==.  &  newV2.y\==''  then call err "node is already defined: "   y
end   /*�*v*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Algebraic-data-types\algebraic-data-types.rexx was migrated on 23 Mar 2025 at 10:43:04
 * -------------------------------------------------------------------------
*/ 
