/*ͺ*REXX program implements a   PLAYFAIR cipher   (encryption  and  decryption).          */
newV4= 'abcdefghijklmnopqrstuvwxyz';  newV2= newV4 /*ͺ*literals for  lower and upper  ABC's.*/
parse arg omit key  '('  text                    /*ͺ*TEXT  is the phrase to be used.      */
oldKey= key                                      /*ͺ*save the old key.                    */
if key =='' | key ==','    then do;       key= 'Playfair example.'
oldKey= key "   ββββusing the default."
end
if omit=='' | omit==','    then omit= 'J'        /*ͺ*the  "omitted"  character string.    */
if text=''                 then text= 'Hide the gold in the tree stump!!'     /*ͺ*default.*/
upper omit newV2                                 /*ͺ*uppercase OMIT characters & alphabet.*/
newV3= 'can''t contain the "OMIT" character: '  omit       /*ͺ*literal used in error text.*/
newV1= 'unique characters.'                    /*ͺ*a literal used below in an error msg.*/
newKey = scrub(key, 1)                           /*ͺ*scrub old cipher key  βββΊ  newKey    */
newText= scrub(text  )                           /*ͺ*  "    "     text     βββΊ  newText   */
if newText==''             then call err 'TEXT is empty or has no letters.'
if length(omit)\==1        then call err 'OMIT letter must be only one letter.'
if \datatype(omit, 'M')    then call err 'OMIT letter must be a Latin alphabet letter.'
if pos(omit, newText)\==0  then call err 'TEXT'        newV3
if pos(omit, newKey) \==0  then call err 'cipher key'  newV3
fill= space( translate(newV2, , omit),  0)       /*ͺ*elide OMIT characters from alphabet. */
xx= 'X'                                          /*ͺ*character used for double characters.*/
if omit==xx  then xx= 'Q'                        /*ͺ*    "       "   "     "       "      */
if length(newKey)<3        then call err 'cipher key is too short, must be β₯ 3' newV1
fill= space( translate(fill, , newKey), 0)       /*ͺ*remove any cipher characters.        */
grid= newKey || fill                             /*ͺ*only first  25  characters are used. */
say 'old cipher key: '  strip(oldKey)
say 'new cipher key: '  newKey
say '     omit char: '  omit
say '   double char: '  xx
say ' original text: '  strip(text)
padL= 14 + 2
call show 'cleansed', newText
newV7= 0                                             /*ͺ*number of grid characters used.      */
do row   =1  for 5                      /*ͺ*build array of individual cells.     */
do col=1  for 5;                 newV7= newV7 + 1;       newV5.row.col= substr(grid, newV7, 1)
if row==1  then            newV5.0.col= newV5.1.col
if col==5  then do;        newV5.row.6= newV5.row.1;     newV5.row.0= newV5.row.5;    end
if row==5  then do;        newV5.6.col= newV5.1.col;     newV5.0.col= newV5.5.col;    end
end   /*ͺ*col*/
end      /*ͺ*row*/
pad = left('', padL)
padX= left('', padL, "β")'Playfair'
Lxx = translate(xx, newV4, newV2)                 /*ͺ* [β]  lowercase of double character. */
LxxLxx= Lxx || Lxx                               /*ͺ* [β]  doubled version of  Lxx.       */
eText= .Playfair(newText, 1);          call show 'encrypted' , eText
pText= .Playfair(eText     );          call show 'plain'     , pText
qText= changestr(xx  || xx, pText, Lxx)          /*ͺ*change doubled doublechar βββΊ single.*/
qText= changestr(Lxx || xx, qText, LxxLxx)       /*ͺ*change  xx βββΊ lowercase dblCharacter*/
qText= space( translate( qText, , xx), 0)        /*ͺ*remove character used for "doubles". */
upper qText                                      /*ͺ*reinstate the use of upper characters*/
if length(qText)\==length(pText)  then call show 'possible',  qText
say ' original text: '  newText;       say       /*ͺ*Β·Β·Β· and also show the original text. */
if qtext==newText  then say padx 'encryptionβββΊ decryptionβββΊ encryption worked.'
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
@@:    parse arg Xrow,Xcol;                         return  newV5.Xrow.Xcol
err:   say;   say '***error!***'  arg(1);           say;    exit 13
LR:    rowL= row(left(newV6, 1)); colL= newV8; rowR= row(right(newV6,1)); colR= newV8; return length(newV6)
row:   ?= pos(arg(1), grid);      newV8= (?-1) // 5  +  1;      return  (4+?) % 5
show:  arg ,y; say; say right(arg(1) 'text: ',padL) digram(y); say pad space(y, 0); return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
.Playfair: arg T,encrypt;         i= -1;     if encrypt==1  then i= 1;          newV9=
do k=1  while  i==1;     newV8= substr(T, k, 1);     if newV8==' '  then leave
if newV8==substr(T, k+1, 1)  then T= left(T, k) || Lxx || substr(T, k + 1)
end     /*ͺ*k*/
upper T
do j=1  by 2  to length(T);     newV6= strip( substr(T, j, 2) )
if LR()==1  then newV6= newV6 || xx;  call LR /*ͺ*append X or Q char, rule 1*/
select                                                      /*ͺ*rule*/
when rowL==rowR  then newV6= @@(rowL,   colL+i)@@(rowR,   colR+i) /*ͺ*2*/
when colL==colR  then newV6= @@(rowL+i, colL  )@@(rowR+i, colR)   /*ͺ*3*/
otherwise             newV6= @@(rowL,   colR  )@@(rowR,   colL)   /*ͺ*4*/
end   /*ͺ*select*/
newV9= newV9 || newV6
end     /*ͺ*j*/
return newV9
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
digram: procedure; parse arg x,,newV9;          do j=1  by 2  to length(x)
newV9= newV9  ||  substr(x, j, 2)' '
end   /*ͺ*j*/
return strip(newV9)
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
scrub:  procedure; arg xxx,unique;    xxx= space(xxx, 0)      /*ͺ*ARG capitalizes all args*/
newV9=;            do j=1  for length(xxx);    newV8= substr(xxx, j, 1)
if unique==1  then  if  pos(newV8, newV9)\==0  then iterate  /*ͺ*is unique?*/
if datatype(newV8, 'M')  then newV9= newV9  ||  newV8  /*ͺ*only use Latin letters. */
end   /*ͺ*j*/
return newV9
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Playfair-cipher\playfair-cipher.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
