/*ª*REXX program demonstrates the  moveâ”€toâ”€front  algorithm  encode/decode  symbol table. */
parse arg xxx;   if xxx=''  then xxx= 'broood bananaaa hiphophiphop'  /*ª*use the default?*/
one= 1                          /*ª*(offset) for this task's requirement.*/
do j=1  for words(xxx);    x= word(xxx, j)     /*ª*process a single word at a time.     */
newV2= 'abcdefghijklmnopqrstuvwxyz';      newV1= newV2    /*ª*symbol table: the lowercase alphabet */
newV3=                                             /*ª*set the decode string to a   null.   */
do k=1  for length(x); z= substr(x, k, 1)  /*ª*encrypt a symbol in the word.        */
newV4= pos(z, newV2);      if newV4==0  then iterate   /*ª*the symbol position in symbol table. */
newV3= newV3  (newV4 - one);   newV2= z || delstr(newV2, newV4, 1) /*ª*(reâ”€)adjust the symbol table string. */
end   /*ª*k*/                                /*ª* [â†‘]   the  moveâ”€toâ”€front  encoding. */
newV5=                                             /*ª*set the encode string to a   null.   */
do m=1  for words(newV3);  n= word(newV3, m) + one /*ª*decode the sequence table string.    */
y= substr(newV1, n, 1);   newV5= newV5  ||  y         /*ª*the decode symbol for the   N   word.*/
newV1= y || delstr(newV1, n, 1)                  /*ª*rebuild the symbol table string.     */
end   /*ª*m*/                                /*ª* [â†‘]   the  moveâ”€toâ”€front  decoding. */
say '     word: '  left(x, 20)  "encoding:"  left(newV3, 35)   word('wrong OK', 1 + (newV5==x) )
end       /*ª*j*/                                /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Move-to-front-algorithm\move-to-front-algorithm-2.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
