/*�*REXX program calculates  N  terms of the fairshare sequence for some group of peoples.*/
parse arg n g                                    /*�*obtain optional arguments from the CL*/
if n=='' | n==","  then n= 25                    /*�*Not specified?  Then use the default.*/
if g=''  | g=","   then g=  2 3 5 11             /*�* "      "         "   "   "     "    */
/*�* [↑]  a list of a number of peoples. */
do p=1  for words(g);        r= word(g, p)  /*�*traipse through the bases specfiied. */
newV2= 'base' right(r, 2)': '                   /*�*construct start of the 1─line output.*/
do j=0  for n;   newV2= newV2 right( sumDigs( base(j, r))  //  r, 2)','
end   /*�*j*/                              /*�* [↑] append # (base R) mod R──►$ list*/
say strip(newV2, , ",")                         /*�*elide trailing comma from the $ list.*/
end      /*�*p*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
base: parse arg newV3,b,,y;          newV4= 0123456789abcdefghijklmnopqrstuvwxyz;  newV1= substr(newV4,2)
do while newV3>=b; y= substr(newV4, newV3//b + 1, 1)y; newV3= newV3%b; end;  return substr(newV4, newV3+1, 1)y
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sumDigs: parse arg x; newV5=0; do i=1 for length(x); newV5= newV5+pos(substr(x,i,1),newV1); end; return newV5
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Fairshare-between-two-and-more\fairshare-between-two-and-more.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
