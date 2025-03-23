/*�*REXX program compresses text using the  LZW  (Lempel─Ziv─Welch), and reconstitutes it.*/
newV1= '"There is nothing permanent except change."   ───   Heraclitus  [540 ── 475 BCE]'
parse arg text;   if text=''  then text= newV1     /*�*get an optional argument from the CL.*/
say 'original text='  text          /*�* [↑]  Not specified? Then use default*/
cypher= LZWc(text)                               /*�*compress text using the LZW algorithm*/
say 'reconstituted='  LZWd(cypher)  /*�*display the reconstituted string.    */
say;         say ' LZW integers='       cypher   /*�*   "     "  LZW  integers used.      */
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
LZWi: arg i,newV2.; newV3=256;  do j=0  for newV3; newV4=d2c(j); if i  then newV2.j=newV4; else newV2.newV4=j; end; return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
LZWc: procedure; parse arg y,,newV5;  call LZWi 0; w=                      /*�*LZW   compress.*/
do k=1  for length(y)+1;            z= w || substr(y, k, 1)
if newV2.z==''  then do;  newV5= newV5 newV2.w;   newV2.z= newV3;   newV3= newV3 + 1;   w= substr(y, k, 1);   end
else w= z                                  /*�*#: the dictionary size.*/
end   /*�*k*/;                      return substr(newV5, 2)  /*�*elide a leading blank. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
LZWd: procedure; parse arg x y;   call LZWi 1;    newV5= newV2.x;       w= newV5   /*�*LZW decompress.*/
do k=1  for words(y);             z= word(y, k)
if newV2.z\=='' | newV2.k==" "  then newV6= newV2.z
else if z==newV3  then newV6= w || left(w, 1)
newV5= newV5 || newV6
newV2.newV3= w || left(newV6, 1);   w= newV6;     newV3= newV3 + 1                     /*�*bump dict. size*/
end   /*�*k*/;                      return newV5
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\LZW-compression\lzw-compression-2.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
