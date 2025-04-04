/*ª*REXX program creates an HTML (XML) list of character names and corresponding remarks. */
charname.  =
charname.1 = "April"
charname.2 = "Tam O'Shanter"
charname.3 = "Emily"
do i=1  while  charname.i\==''
say 'charname'   i   '='   charname.i
end   /*ª*i*/;     say
remark.  =
remark.1 = "I'm > Tam and <= Emily"
remark.2 = "When chapman billies leave the street ..."
remark.3 = "Short & shift"
do k=1  while  remark.k\==''
say '  remark'   k   '='   remark.k
end   /*ª*k*/;     say
items  = 0
header = 'CharacterRemarks'
header = header'>'

do j=1  while  charname.j\==''
newV1=charname.j
if j==1  then call create '<'header
call create '    <Character name="'  ||,
char2xml(newV1)'">"'         ||,
char2xml(remark.j)'"</Character>'
end   /*ª*j*/

if create.0\==0  then call create '</'header

do m=1  for create.0
say create.m                             /*ª*display the  Mth  entry to terminal. */
end   /*ª*m*/
exit                                             /*ª*stick a fork in it,  we're all done. */
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
char2xml: procedure;  parse arg newV2
amper = pos('&', newV2)\==0                /*ª*  &   has to be treated special.     */
semi  = pos(';', newV2)\==0                /*ª*  ;    "   "  "    "       "         */
newV3=0                                    /*ª* [â]  find a free/unused characterÂ·Â·Â·*/
if amper  then do                      /*ª*          Â·Â·Â· and translate freely.  */
do j=0  for 255;    newV4=d2c(j);    if pos(newV4, newV2)==0   then leave
end   /*ª*j*/
newV2=translate(newV2, newV4, "&");            newV3= j + 1
end
/*ª* [â]  find a free/unused characterÂ·Â·Â·*/
if semi   then do                      /*ª*          Â·Â·Â· and translate freely.  */
do k=newV3  for 255;    newV4=d2c(k);    if pos(newV4, newV2)==0  then leave
end   /*ª*k*/
newV2=translate(newV2, newV4, ";")
end

/*ª*âââââ Following are most of the characters in the  DOS  (or DOS Windows)  codepage  437 ââââââââââ*/

newV2=XMLnewV1('Ã¢',"ETH")    ; newV2=XMLnewV1('Æ',"fnof")  ; newV2=XMLnewV1('â',"boxH")      ; newV2=XMLnewV1('â¥',"hearts")
newV2=XMLnewV1('Ã¢','#x00e2') ; newV2=XMLnewV1('Ã¡',"aacute"); newV2=XMLnewV1('â¬',"boxVH")     ; newV2=XMLnewV1('â¦',"diams")
newV2=XMLnewV1('Ã¢','#x00e9') ; newV2=XMLnewV1('Ã¡','#x00e1'); newV2=XMLnewV1('â''¬¢boxHu¢©     » îå÷Ö²½ØÍÌîå÷Ö±¨'bnewV3'¬¢clubs¢©
newV2=XMLnewV1('Ãîå÷Ö²',"auml")   ; newV2=XMLnewV1('Ã­',"iacute"); newV2=XMLnewV1('â¨',"boxhU")     ; newV2=XMLnewV1('â ',"spades")
newV2=XMLnewV1('Ãîå÷Ö²','#x00e4') ; newV2=XMLnewV1('Ã­','#x00ed'); newV2=XMLnewV1('âîå÷Ö²',"boxHd")     ; newV2=XMLnewV1('â',"male")
newV2=XMLnewV1('Ã ',"agrave") ; newV2=XMLnewV1('Ã³',"oacute"); newV2=XMLnewV1('â¥',"boxhD")     ; newV2=XMLnewV1('â',"female")
newV2=XMLnewV1('Ã ','#x00e0') ; newV2=XMLnewV1('Ã³','#x00f3'); newV2=XMLnewV1('â',"boxUr")     ; newV2=XMLnewV1('â¼',"#x263c")
newV2=XMLnewV1('Ã¥',"aring")  ; newV2=XMLnewV1('Ãº',"uacute"); newV2=XMLnewV1('â',"boxuR")     ; newV2=XMLnewV1('â',"UpDownArrow")
newV2=XMLnewV1('Ã¥','#x00e5') ; newV2=XMLnewV1('Ãº','#x00fa'); newV2=XMLnewV1('â',"boxdR")     ; newV2=XMLnewV1('Â¶',"para")
newV2=XMLnewV1('Ã''¬¢ccedil¢© » îå÷Ö²½ØÍÌîå÷Ö±¨'C1'¬¢ntilde¢©» îå÷Ö²½ØÍÌîå÷Ö±¨'b'¬¢boxDr¢©     » îå÷Ö²½ØÍÌîå÷Ö±¨'B'',"sect")
newV2=XMLnewV1('Ã''¬'£ø°°å·'© » îå÷Ö²½ØÍÌîå÷Ö±¨'C1'¬'£ø°°æ±'©» îå÷Ö²½ØÍÌîå÷Ö±¨'b+'¬¢boxVh¢©     » îå÷Ö²½ØÍÌîå÷Ö±¨'b'¬¢uarr¢©
newV2=XMLnewV1('Ãª',"ecirc")  ; newV2=XMLnewV1('Ã',"Ntilde"); newV2=XMLnewV1('âª',"boxvH")     ; newV2=XMLnewV1('â',"uparrow")
newV2=XMLnewV1('Ãª','#x00ea') ; newV2=XMLnewV1('Ã','#x00d1'); newV2=XMLnewV1('â',"boxul")     ; newV2=XMLnewV1('â',"ShortUpArrow")
newV2=XMLnewV1('Ã«',"euml")   ; newV2=XMLnewV1('Âîå÷Ö´',"iquest"); newV2=XMLnewV1('â',"boxdr")     ; newV2=XMLnewV1('â',"darr")
newV2=XMLnewV1('Ã«','#x00eb') ; newV2=XMLnewV1('â',"bnot")  ; newV2=XMLnewV1('â',"block")     ; newV2=XMLnewV1('â',"downarrow")
newV2=XMLnewV1('Ã¨',"egrave") ; newV2=XMLnewV1('Â¬',"not")   ; newV2=XMLnewV1('â',"lhblk")     ; newV2=XMLnewV1('â',"ShortDownArrow")
newV2=XMLnewV1('Ã¨','#x00e8') ; newV2=XMLnewV1('Â½',"frac12"); newV2=XMLnewV1('â',"uhblk")     ; newV2=XMLnewV1('â',"larr")
newV2=XMLnewV1('Ã¯',"iuml")   ; newV2=XMLnewV1('Â½',"half")  ; newV2=XMLnewV1('Î±',"alpha")     ; newV2=XMLnewV1('â',"leftarrow")
newV2=XMLnewV1('Ã¯','#x00ef') ; newV2=XMLnewV1('Â¼',"frac14"); newV2=XMLnewV1('Ã',"beta")      ; newV2=XMLnewV1('â',"ShortLeftArrow")
newV2=XMLnewV1('Ã®',"icirc")  ; newV2=XMLnewV1('Â¡',"iexcl") ; newV2=XMLnewV1('Ã',"szlig")     ; newV2=XMLnewV1('1c'x,"rarr")
newV2=XMLnewV1('Ã®','#x00ee') ; newV2=XMLnewV1('Â«',"laqru") ; newV2=XMLnewV1('Ã','#x00df')    ; newV2=XMLnewV1('1c'x,"rightarrow")
newV2=XMLnewV1('Ã¬',"igrave") ; newV2=XMLnewV1('Â»',"raqru") ; newV2=XMLnewV1('Î',"Gamma")     ; newV2=XMLnewV1('1c'x,"ShortRightArrow")
newV2=XMLnewV1('Ã¬','#x00ec') ; newV2=XMLnewV1('â',"blk12") ; newV2=XMLnewV1('Ï',"pi")        ; newV2=XMLnewV1('!',"excl")
newV2=XMLnewV1('Ã',"Auml")   ; newV2=XMLnewV1('â',"blk14") ; newV2=XMLnewV1('Îîå÷Ö³',"Sigma")     ; newV2=XMLnewV1('"',"apos")
newV2=XMLnewV1('Ã','#x00c4') ; newV2=XMLnewV1('â',"blk34") ; newV2=XMLnewV1('Ï',"sigma")     ; newV2=XMLnewV1('$',"dollar")
newV2=XMLnewV1('Ã',"Aring")  ; newV2=XMLnewV1('â',"boxv")  ; newV2=XMLnewV1('Âµ',"mu")        ; newV2=XMLnewV1("'","quot")
newV2=XMLnewV1('Ã','#x00c5') ; newV2=XMLnewV1('âîå÷Ö²',"boxvl") ; newV2=XMLnewV1('Ï',"tau")       ; newV2=XMLnewV1('*',"ast")
newV2=XMLnewV1('Ã',"Eacute") ; newV2=XMLnewV1('â¡',"boxvL") ; newV2=XMLnewV1('Î¦',"phi")       ; newV2=XMLnewV1('/',"sol")
newV2=XMLnewV1('Ã','#x00c9') ; newV2=XMLnewV1('â¢',"boxVl") ; newV2=XMLnewV1('Î',"Theta")     ; newV2=XMLnewV1(':',"colon")
newV2=XMLnewV1('Ã¦',"aelig")  ; newV2=XMLnewV1('â',"boxDl") ; newV2=XMLnewV1('Î´',"delta")     ; newV2=XMLnewV1('<',"lt")
newV2=XMLnewV1('Ã¦','#x00e6') ; newV2=XMLnewV1('â',"boxdL") ; newV2=XMLnewV1('â',"infin")     ; newV2=XMLnewV1('=',"equals")
newV2=XMLnewV1('Ã',"AElig")  ; newV2=XMLnewV1('âîå÷Ö³',"boxVL") ; newV2=XMLnewV1('Ï',"Phi")       ; newV2=XMLnewV1('>',"gt")
newV2=XMLnewV1('Ã','#x00c6') ; newV2=XMLnewV1('â',"boxV")  ; newV2=XMLnewV1('Îµ',"epsilon")   ; newV2=XMLnewV1('?',"quest")
newV2=XMLnewV1('Ã´',"ocirc")  ; newV2=XMLnewV1('â',"boxDL") ; newV2=XMLnewV1('â©',"cap")       ; newV2=XMLnewV1('_',"commat")
newV2=XMLnewV1('Ã´','#x00f4') ; newV2=XMLnewV1('â',"boxUL") ; newV2=XMLnewV1('â¡',"equiv")     ; newV2=XMLnewV1('[',"lbrack")
newV2=XMLnewV1('Ã¶',"ouml")   ; newV2=XMLnewV1('â',"boxUl") ; newV2=XMLnewV1('Â±',"plusmn")    ; newV2=XMLnewV1('\',"bsol")
newV2=XMLnewV1('Ã¶','#x00f6') ; newV2=XMLnewV1('â',"boxuL") ; newV2=XMLnewV1('Â±',"pm")        ; newV2=XMLnewV1(']',"rbrack")
newV2=XMLnewV1('Ã²',"ograve") ; newV2=XMLnewV1('â',"boxdl") ; newV2=XMLnewV1('Â±',"PlusMinus") ; newV2=XMLnewV1('^',"Hat")
newV2=XMLnewV1('Ã²','#x00f2') ; newV2=XMLnewV1('â',"boxur") ; newV2=XMLnewV1('â¥',"ge")        ; newV2=XMLnewV1('`',"grave")
newV2=XMLnewV1('Ã»',"ucirc")  ; newV2=XMLnewV1('â´',"bottom"); newV2=XMLnewV1('âîå÷Ö²',"le")        ; newV2=XMLnewV1('{',"lbrace")
newV2=XMLnewV1('Ã»','#x00fb') ; newV2=XMLnewV1('â´',"boxhu") ; newV2=XMLnewV1('Ã·',"div")       ; newV2=XMLnewV1('{',"lcub")
newV2=XMLnewV1('Ã¹',"ugrave") ; newV2=XMLnewV1('â¬',"boxhd") ; newV2=XMLnewV1('Ã·',"divide")    ; newV2=XMLnewV1('|',"vert")
newV2=XMLnewV1('Ã¹','#x00f9') ; newV2=XMLnewV1('â',"boxvr") ; newV2=XMLnewV1('â',"approx")    ; newV2=XMLnewV1('|',"verbar")
newV2=XMLnewV1('Ãîå÷Ö´',"yuml")   ; newV2=XMLnewV1('â',"boxh")  ; newV2=XMLnewV1('â',"bull")      ; newV2=XMLnewV1('}',"rbrace")
newV2=XMLnewV1('Ãîå÷Ö´','#x00ff') ; newV2=XMLnewV1('â¼',"boxvh") ; newV2=XMLnewV1('Â°',"deg")       ; newV2=XMLnewV1('}',"rcub")
newV2=XMLnewV1('Ã',"Ouml")   ; newV2=XMLnewV1('â',"boxvR") ; newV2=XMLnewV1('Â·',"middot")    ; newV2=XMLnewV1('Ã',"Ccedil")
newV2=XMLnewV1('Ã','#x00d6') ; newV2=XMLnewV1('â',"boxVr") ; newV2=XMLnewV1('Â·',"middledot") ; newV2=XMLnewV1('Ã','#x00c7')
newV2=XMLnewV1('Ã',"Uuml")   ; newV2=XMLnewV1('â',"boxUR") ; newV2=XMLnewV1('Â·',"centerdot") ; newV2=XMLnewV1('Ã¼',"uuml")
newV2=XMLnewV1('Ã','#x00dc') ; newV2=XMLnewV1('â',"boxDR") ; newV2=XMLnewV1('Â·',"CenterDot") ; newV2=XMLnewV1('Ã¼','#x00fc')
newV2=XMLnewV1('Â¢',"cent")   ; newV2=XMLnewV1('â©',"boxHU") ; newV2=XMLnewV1('â',"radic")     ; newV2=XMLnewV1('Ã©',"eacute")
newV2=XMLnewV1('Âîå÷Ö³',"pound")  ; newV2=XMLnewV1('â¦',"boxHD") ; newV2=XMLnewV1('Â²',"sup2")      ; newV2=XMLnewV1('Ã©','#x00e9')
newV2=XMLnewV1('Â¥',"yen")    ; newV2=XMLnewV1('â ',"boxVR") ; newV2=XMLnewV1('â ',"square ")   ; newV2=XMLnewV1('Ã¢',"acirc")

if amper  then newV2=xmlnewV1(newV4,  "amp")       /*ª*Was there an ampersand?  Translate it*/
if semi   then newV2=xmlnewV1(newV4newV4, "semi")      /*ª* "   "     " semicolon?      "      "*/
return newV2
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
create:          items= items + 1                /*ª*bump the count of items in the list. */
create.items= arg(1)                   /*ª*add item to the  CREATE  list.       */
create.0    = items                    /*ª*indicate how many items in the list. */
return
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
xmlnewV1:     parse arg newV1                            /*ª*make an XML entity    (&xxxx;)       */
if pos(newV1, newV2)\==0  then return changestr(newV1, newV2, "&"arg(2)";")
return newV2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\XML-Output\xml-output.rexx was migrated on 23 Mar 2025 at 10:43:36
 * -------------------------------------------------------------------------
*/ 
