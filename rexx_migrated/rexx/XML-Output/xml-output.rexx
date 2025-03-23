/*�*REXX program creates an HTML (XML) list of character names and corresponding remarks. */
charname.  =
charname.1 = "April"
charname.2 = "Tam O'Shanter"
charname.3 = "Emily"
do i=1  while  charname.i\==''
say 'charname'   i   '='   charname.i
end   /*�*i*/;     say
remark.  =
remark.1 = "I'm > Tam and <= Emily"
remark.2 = "When chapman billies leave the street ..."
remark.3 = "Short & shift"
do k=1  while  remark.k\==''
say '  remark'   k   '='   remark.k
end   /*�*k*/;     say
items  = 0
header = 'CharacterRemarks'
header = header'>'

do j=1  while  charname.j\==''
newV1=charname.j
if j==1  then call create '<'header
call create '    <Character name="'  ||,
char2xml(newV1)'">"'         ||,
char2xml(remark.j)'"</Character>'
end   /*�*j*/

if create.0\==0  then call create '</'header

do m=1  for create.0
say create.m                             /*�*display the  Mth  entry to terminal. */
end   /*�*m*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
char2xml: procedure;  parse arg newV2
amper = pos('&', newV2)\==0                /*�*  &   has to be treated special.     */
semi  = pos(';', newV2)\==0                /*�*  ;    "   "  "    "       "         */
newV3=0                                    /*�* [↓]  find a free/unused character···*/
if amper  then do                      /*�*          ··· and translate freely.  */
do j=0  for 255;    newV4=d2c(j);    if pos(newV4, newV2)==0   then leave
end   /*�*j*/
newV2=translate(newV2, newV4, "&");            newV3= j + 1
end
/*�* [↓]  find a free/unused character···*/
if semi   then do                      /*�*          ··· and translate freely.  */
do k=newV3  for 255;    newV4=d2c(k);    if pos(newV4, newV2)==0  then leave
end   /*�*k*/
newV2=translate(newV2, newV4, ";")
end

/*�*───── Following are most of the characters in the  DOS  (or DOS Windows)  codepage  437 ──────────*/

newV2=XMLnewV1('â',"ETH")    ; newV2=XMLnewV1('ƒ',"fnof")  ; newV2=XMLnewV1('═',"boxH")      ; newV2=XMLnewV1('♥',"hearts")
newV2=XMLnewV1('â','#x00e2') ; newV2=XMLnewV1('á',"aacute"); newV2=XMLnewV1('╬',"boxVH")     ; newV2=XMLnewV1('♦',"diams")
newV2=XMLnewV1('â','#x00e9') ; newV2=XMLnewV1('á','#x00e1'); newV2=XMLnewV1('�''��boxHu������������ֲ�������ֱ�'bnewV3'��clubs��
newV2=XMLnewV1('����ֲ',"auml")   ; newV2=XMLnewV1('í',"iacute"); newV2=XMLnewV1('╨',"boxhU")     ; newV2=XMLnewV1('♠',"spades")
newV2=XMLnewV1('����ֲ','#x00e4') ; newV2=XMLnewV1('í','#x00ed'); newV2=XMLnewV1('����ֲ',"boxHd")     ; newV2=XMLnewV1('♂',"male")
newV2=XMLnewV1('à',"agrave") ; newV2=XMLnewV1('ó',"oacute"); newV2=XMLnewV1('╥',"boxhD")     ; newV2=XMLnewV1('♀',"female")
newV2=XMLnewV1('à','#x00e0') ; newV2=XMLnewV1('ó','#x00f3'); newV2=XMLnewV1('╙',"boxUr")     ; newV2=XMLnewV1('☼',"#x263c")
newV2=XMLnewV1('å',"aring")  ; newV2=XMLnewV1('ú',"uacute"); newV2=XMLnewV1('╘',"boxuR")     ; newV2=XMLnewV1('↕',"UpDownArrow")
newV2=XMLnewV1('å','#x00e5') ; newV2=XMLnewV1('ú','#x00fa'); newV2=XMLnewV1('╒',"boxdR")     ; newV2=XMLnewV1('¶',"para")
newV2=XMLnewV1('�''��ccedil��������ֲ�������ֱ�'C1'��ntilde�������ֲ�������ֱ�'b'��boxDr������������ֲ�������ֱ�'B'',"sect")
newV2=XMLnewV1('�''�'�����'�������ֲ�������ֱ�'C1'�'�����'������ֲ�������ֱ�'b+'��boxVh������������ֲ�������ֱ�'b'��uarr��
newV2=XMLnewV1('ê',"ecirc")  ; newV2=XMLnewV1('Ñ',"Ntilde"); newV2=XMLnewV1('╪',"boxvH")     ; newV2=XMLnewV1('↑',"uparrow")
newV2=XMLnewV1('ê','#x00ea') ; newV2=XMLnewV1('Ñ','#x00d1'); newV2=XMLnewV1('┘',"boxul")     ; newV2=XMLnewV1('↑',"ShortUpArrow")
newV2=XMLnewV1('ë',"euml")   ; newV2=XMLnewV1('����ִ',"iquest"); newV2=XMLnewV1('┌',"boxdr")     ; newV2=XMLnewV1('↓',"darr")
newV2=XMLnewV1('ë','#x00eb') ; newV2=XMLnewV1('⌐',"bnot")  ; newV2=XMLnewV1('█',"block")     ; newV2=XMLnewV1('↓',"downarrow")
newV2=XMLnewV1('è',"egrave") ; newV2=XMLnewV1('¬',"not")   ; newV2=XMLnewV1('▄',"lhblk")     ; newV2=XMLnewV1('↓',"ShortDownArrow")
newV2=XMLnewV1('è','#x00e8') ; newV2=XMLnewV1('½',"frac12"); newV2=XMLnewV1('▀',"uhblk")     ; newV2=XMLnewV1('←',"larr")
newV2=XMLnewV1('ï',"iuml")   ; newV2=XMLnewV1('½',"half")  ; newV2=XMLnewV1('α',"alpha")     ; newV2=XMLnewV1('←',"leftarrow")
newV2=XMLnewV1('ï','#x00ef') ; newV2=XMLnewV1('¼',"frac14"); newV2=XMLnewV1('ß',"beta")      ; newV2=XMLnewV1('←',"ShortLeftArrow")
newV2=XMLnewV1('î',"icirc")  ; newV2=XMLnewV1('¡',"iexcl") ; newV2=XMLnewV1('ß',"szlig")     ; newV2=XMLnewV1('1c'x,"rarr")
newV2=XMLnewV1('î','#x00ee') ; newV2=XMLnewV1('«',"laqru") ; newV2=XMLnewV1('ß','#x00df')    ; newV2=XMLnewV1('1c'x,"rightarrow")
newV2=XMLnewV1('ì',"igrave") ; newV2=XMLnewV1('»',"raqru") ; newV2=XMLnewV1('Γ',"Gamma")     ; newV2=XMLnewV1('1c'x,"ShortRightArrow")
newV2=XMLnewV1('ì','#x00ec') ; newV2=XMLnewV1('░',"blk12") ; newV2=XMLnewV1('π',"pi")        ; newV2=XMLnewV1('!',"excl")
newV2=XMLnewV1('Ä',"Auml")   ; newV2=XMLnewV1('▒',"blk14") ; newV2=XMLnewV1('����ֳ',"Sigma")     ; newV2=XMLnewV1('"',"apos")
newV2=XMLnewV1('Ä','#x00c4') ; newV2=XMLnewV1('▓',"blk34") ; newV2=XMLnewV1('σ',"sigma")     ; newV2=XMLnewV1('$',"dollar")
newV2=XMLnewV1('Å',"Aring")  ; newV2=XMLnewV1('│',"boxv")  ; newV2=XMLnewV1('µ',"mu")        ; newV2=XMLnewV1("'","quot")
newV2=XMLnewV1('Å','#x00c5') ; newV2=XMLnewV1('����ֲ',"boxvl") ; newV2=XMLnewV1('τ',"tau")       ; newV2=XMLnewV1('*',"ast")
newV2=XMLnewV1('É',"Eacute") ; newV2=XMLnewV1('╡',"boxvL") ; newV2=XMLnewV1('Φ',"phi")       ; newV2=XMLnewV1('/',"sol")
newV2=XMLnewV1('É','#x00c9') ; newV2=XMLnewV1('╢',"boxVl") ; newV2=XMLnewV1('Θ',"Theta")     ; newV2=XMLnewV1(':',"colon")
newV2=XMLnewV1('æ',"aelig")  ; newV2=XMLnewV1('╖',"boxDl") ; newV2=XMLnewV1('δ',"delta")     ; newV2=XMLnewV1('<',"lt")
newV2=XMLnewV1('æ','#x00e6') ; newV2=XMLnewV1('╕',"boxdL") ; newV2=XMLnewV1('∞',"infin")     ; newV2=XMLnewV1('=',"equals")
newV2=XMLnewV1('Æ',"AElig")  ; newV2=XMLnewV1('����ֳ',"boxVL") ; newV2=XMLnewV1('φ',"Phi")       ; newV2=XMLnewV1('>',"gt")
newV2=XMLnewV1('Æ','#x00c6') ; newV2=XMLnewV1('║',"boxV")  ; newV2=XMLnewV1('ε',"epsilon")   ; newV2=XMLnewV1('?',"quest")
newV2=XMLnewV1('ô',"ocirc")  ; newV2=XMLnewV1('╗',"boxDL") ; newV2=XMLnewV1('∩',"cap")       ; newV2=XMLnewV1('_',"commat")
newV2=XMLnewV1('ô','#x00f4') ; newV2=XMLnewV1('╝',"boxUL") ; newV2=XMLnewV1('≡',"equiv")     ; newV2=XMLnewV1('[',"lbrack")
newV2=XMLnewV1('ö',"ouml")   ; newV2=XMLnewV1('╜',"boxUl") ; newV2=XMLnewV1('±',"plusmn")    ; newV2=XMLnewV1('\',"bsol")
newV2=XMLnewV1('ö','#x00f6') ; newV2=XMLnewV1('╛',"boxuL") ; newV2=XMLnewV1('±',"pm")        ; newV2=XMLnewV1(']',"rbrack")
newV2=XMLnewV1('ò',"ograve") ; newV2=XMLnewV1('┐',"boxdl") ; newV2=XMLnewV1('±',"PlusMinus") ; newV2=XMLnewV1('^',"Hat")
newV2=XMLnewV1('ò','#x00f2') ; newV2=XMLnewV1('└',"boxur") ; newV2=XMLnewV1('≥',"ge")        ; newV2=XMLnewV1('`',"grave")
newV2=XMLnewV1('û',"ucirc")  ; newV2=XMLnewV1('┴',"bottom"); newV2=XMLnewV1('����ֲ',"le")        ; newV2=XMLnewV1('{',"lbrace")
newV2=XMLnewV1('û','#x00fb') ; newV2=XMLnewV1('┴',"boxhu") ; newV2=XMLnewV1('÷',"div")       ; newV2=XMLnewV1('{',"lcub")
newV2=XMLnewV1('ù',"ugrave") ; newV2=XMLnewV1('┬',"boxhd") ; newV2=XMLnewV1('÷',"divide")    ; newV2=XMLnewV1('|',"vert")
newV2=XMLnewV1('ù','#x00f9') ; newV2=XMLnewV1('├',"boxvr") ; newV2=XMLnewV1('≈',"approx")    ; newV2=XMLnewV1('|',"verbar")
newV2=XMLnewV1('����ִ',"yuml")   ; newV2=XMLnewV1('─',"boxh")  ; newV2=XMLnewV1('∙',"bull")      ; newV2=XMLnewV1('}',"rbrace")
newV2=XMLnewV1('����ִ','#x00ff') ; newV2=XMLnewV1('┼',"boxvh") ; newV2=XMLnewV1('°',"deg")       ; newV2=XMLnewV1('}',"rcub")
newV2=XMLnewV1('Ö',"Ouml")   ; newV2=XMLnewV1('╞',"boxvR") ; newV2=XMLnewV1('·',"middot")    ; newV2=XMLnewV1('Ç',"Ccedil")
newV2=XMLnewV1('Ö','#x00d6') ; newV2=XMLnewV1('╟',"boxVr") ; newV2=XMLnewV1('·',"middledot") ; newV2=XMLnewV1('Ç','#x00c7')
newV2=XMLnewV1('Ü',"Uuml")   ; newV2=XMLnewV1('╚',"boxUR") ; newV2=XMLnewV1('·',"centerdot") ; newV2=XMLnewV1('ü',"uuml")
newV2=XMLnewV1('Ü','#x00dc') ; newV2=XMLnewV1('╔',"boxDR") ; newV2=XMLnewV1('·',"CenterDot") ; newV2=XMLnewV1('ü','#x00fc')
newV2=XMLnewV1('¢',"cent")   ; newV2=XMLnewV1('╩',"boxHU") ; newV2=XMLnewV1('√',"radic")     ; newV2=XMLnewV1('é',"eacute")
newV2=XMLnewV1('����ֳ',"pound")  ; newV2=XMLnewV1('╦',"boxHD") ; newV2=XMLnewV1('²',"sup2")      ; newV2=XMLnewV1('é','#x00e9')
newV2=XMLnewV1('¥',"yen")    ; newV2=XMLnewV1('╠',"boxVR") ; newV2=XMLnewV1('■',"square ")   ; newV2=XMLnewV1('â',"acirc")

if amper  then newV2=xmlnewV1(newV4,  "amp")       /*�*Was there an ampersand?  Translate it*/
if semi   then newV2=xmlnewV1(newV4newV4, "semi")      /*�* "   "     " semicolon?      "      "*/
return newV2
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
create:          items= items + 1                /*�*bump the count of items in the list. */
create.items= arg(1)                   /*�*add item to the  CREATE  list.       */
create.0    = items                    /*�*indicate how many items in the list. */
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
xmlnewV1:     parse arg newV1                            /*�*make an XML entity    (&xxxx;)       */
if pos(newV1, newV2)\==0  then return changestr(newV1, newV2, "&"arg(2)";")
return newV2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\XML-Output\xml-output.rexx was migrated on 23 Mar 2025 at 10:43:36
 * -------------------------------------------------------------------------
*/ 
