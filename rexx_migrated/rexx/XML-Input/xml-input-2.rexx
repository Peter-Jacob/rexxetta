/*ª*REXX program  extracts  student names  from an  XML  string(s).                       */
g.=
g.1 = '<Students>                                                             '
g.2 = '  <Student Name="April" Gender="F"  DateOfBirth="1989-01-02" />        '
g.3 = '  <Student Name="Bob" Gender="M"   DateOfBirth="1990-03-04" />         '
g.4 = '  <Student Name="Chad" Gender="M"   DateOfBirth="1991-05-06" />        '
g.5 = '  <Student Name="Dave" Gender="M"  DateOfBirth="1992-07-08">           '
g.6 = '    <Pet Type="dog" Name="Rover" / >                                   '
g.7 = '  </Student>                                                           '
g.8 = '  <Student DateOfBirth="1993-09-10" Gender="F" Name="&#x00c9;mily" />  '
g.9 = '</Students>                                                            '

do j=1  while g.j\==''
g.j=space(g.j)
parse  var   g.j   'Name="'   studname   '"'
if studname==''  then iterate
if pos('&', studname)\==0  then studname=xmlTranE(studname)
say studname
end   /*ª*j*/
exit                                             /*ª*stick a fork in it,  we're all done. */
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
xmlnewV1:   parse arg ,newV1                             /*ª*transkate an  XML  entity   (&xxxx;) */
xmlEntity! = '&'newV1";"
if pos(xmlEntity!, newV2)\==0  then newV2=changestr(xmlEntity!, newV2, arg(1) )
if left(newV1, 2)=='#x'  then do
xmlEntity!='&'left(newV1, 3)translate( substr(newV1, 4) )";"
newV2=changestr(xmlEntity!, newV2, arg(1) )
end
return newV2
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
xmlTranE: procedure; parse arg newV2                 /*ª*Following are most of the chars in   */
/*ª*the  DOS  (under Windows)  codepage. */
newV2=XMLnewV1('Ã¢',"ETH")    ; newV2=XMLnewV1('Æ',"fnof")  ; newV2=XMLnewV1('â',"boxH")      ; newV2=XMLnewV1('â¥',"hearts")
newV2=XMLnewV1('Ã¢','#x00e2') ; newV2=XMLnewV1('Ã¡',"aacute"); newV2=XMLnewV1('â¬',"boxVH")     ; newV2=XMLnewV1('â¦',"diams")
newV2=XMLnewV1('Ã¢','#x00e9') ; newV2=XMLnewV1('Ã¡','#x00e1'); newV2=XMLnewV1('â''¬¢boxHu¢©     » îå÷Ö²½ØÍÌîå÷Ö±¨'b#'¬¢clubs¢©
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
newV2=XMLnewV1('Ã«',"euml")   ; newV2=XMLnewV1('Â¿',"iquest"); newV2=XMLnewV1('â',"boxdr")     ; newV2=XMLnewV1('â',"darr")
newV2=XMLnewV1('Ã«','#x00eb') ; newV2=XMLnewV1('â',"bnot")  ; newV2=XMLnewV1('â',"block")     ; newV2=XMLnewV1('â',"downarrow")
newV2=XMLnewV1('Ã¨',"egrave") ; newV2=XMLnewV1('Â¬',"not")   ; newV2=XMLnewV1('â',"lhblk")     ; newV2=XMLnewV1('â',"ShortDownArrow")
newV2=XMLnewV1('Ã¨','#x00e8') ; newV2=XMLnewV1('Â½',"frac12"); newV2=XMLnewV1('â',"uhblk")     ; newV2=XMLnewV1('â',"larr")
newV2=XMLnewV1('Ã¯',"iuml")   ; newV2=XMLnewV1('Â½',"half")  ; newV2=XMLnewV1('Î±',"alpha")     ; newV2=XMLnewV1('â',"leftarrow")
newV2=XMLnewV1('Ã¯','#x00ef') ; newV2=XMLnewV1('Â¼',"frac14"); newV2=XMLnewV1('Ã',"beta")      ; newV2=XMLnewV1('â',"ShortLeftArrow")
newV2=XMLnewV1('Ã®',"icirc")  ; newV2=XMLnewV1('Â¡',"iexcl") ; newV2=XMLnewV1('Ã',"szlig")     ; newV2=XMLnewV1('1c'x,"rarr")
newV2=XMLnewV1('Ã®','#x00ee') ; newV2=XMLnewV1('Â«',"laqru") ; newV2=XMLnewV1('Ã','#x00df')    ; newV2=XMLnewV1('1c'x,"rightarrow")
newV2=XMLnewV1('Ã¬',"igrave") ; newV2=XMLnewV1('Â»',"raqru") ; newV2=XMLnewV1('Î',"Gamma")     ; newV2=XMLnewV1('1c'x,"ShortRightArrow")
newV2=XMLnewV1('Ã¬','#x00ec') ; newV2=XMLnewV1('â',"blk12") ; newV2=XMLnewV1('Ï',"pi")        ; newV2=XMLnewV1('!',"excl")
newV2=XMLnewV1('Ã',"Auml")   ; newV2=XMLnewV1('â',"blk14") ; newV2=XMLnewV1('Î£',"Sigma")     ; newV2=XMLnewV1('"',"apos")
newV2=XMLnewV1('Ã','#x00c4') ; newV2=XMLnewV1('â',"blk34") ; newV2=XMLnewV1('Ï',"sigma")     ; newV2=XMLnewV1('$',"dollar")
newV2=XMLnewV1('Ã',"Aring")  ; newV2=XMLnewV1('â',"boxv")  ; newV2=XMLnewV1('Âµ',"mu")        ; newV2=XMLnewV1("'","quot")
newV2=XMLnewV1('Ã','#x00c5') ; newV2=XMLnewV1('âîå÷Ö²',"boxvl") ; newV2=XMLnewV1('Ï',"tau")       ; newV2=XMLnewV1('*',"ast")
newV2=XMLnewV1('Ã',"Eacute") ; newV2=XMLnewV1('â¡',"boxvL") ; newV2=XMLnewV1('Î¦',"phi")       ; newV2=XMLnewV1('/',"sol")
newV2=XMLnewV1('Ã','#x00c9') ; newV2=XMLnewV1('â¢',"boxVl") ; newV2=XMLnewV1('Î',"Theta")     ; newV2=XMLnewV1(':',"colon")
newV2=XMLnewV1('Ã¦',"aelig")  ; newV2=XMLnewV1('â',"boxDl") ; newV2=XMLnewV1('Î´',"delta")     ; newV2=XMLnewV1('<',"lt")
newV2=XMLnewV1('Ã¦','#x00e6') ; newV2=XMLnewV1('â',"boxdL") ; newV2=XMLnewV1('â',"infin")     ; newV2=XMLnewV1('=',"equals")
newV2=XMLnewV1('Ã',"AElig")  ; newV2=XMLnewV1('â£',"boxVL") ; newV2=XMLnewV1('Ï',"Phi")       ; newV2=XMLnewV1('>',"gt")
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
newV2=XMLnewV1('Ã¿',"yuml")   ; newV2=XMLnewV1('â',"boxh")  ; newV2=XMLnewV1('â',"bull")      ; newV2=XMLnewV1('}',"rbrace")
newV2=XMLnewV1('Ã¿','#x00ff') ; newV2=XMLnewV1('â¼',"boxvh") ; newV2=XMLnewV1('Â°',"deg")       ; newV2=XMLnewV1('}',"rcub")
newV2=XMLnewV1('Ã',"Ouml")   ; newV2=XMLnewV1('â',"boxvR") ; newV2=XMLnewV1('Â·',"middot")    ; newV2=XMLnewV1('Ã',"Ccedil")
newV2=XMLnewV1('Ã','#x00d6') ; newV2=XMLnewV1('â',"boxVr") ; newV2=XMLnewV1('Â·',"middledot") ; newV2=XMLnewV1('Ã','#x00c7')
newV2=XMLnewV1('Ã',"Uuml")   ; newV2=XMLnewV1('â',"boxUR") ; newV2=XMLnewV1('Â·',"centerdot") ; newV2=XMLnewV1('Ã¼',"uuml")
newV2=XMLnewV1('Ã','#x00dc') ; newV2=XMLnewV1('â',"boxDR") ; newV2=XMLnewV1('Â·',"CenterDot") ; newV2=XMLnewV1('Ã¼','#x00fc')
newV2=XMLnewV1('Â¢',"cent")   ; newV2=XMLnewV1('â©',"boxHU") ; newV2=XMLnewV1('â',"radic")     ; newV2=XMLnewV1('Ã©',"eacute")
newV2=XMLnewV1('Â£',"pound")  ; newV2=XMLnewV1('â¦',"boxHD") ; newV2=XMLnewV1('Â²',"sup2")      ; newV2=XMLnewV1('Ã©','#x00e9')
newV2=XMLnewV1('Â¥',"yen")    ; newV2=XMLnewV1('â ',"boxVR") ; newV2=XMLnewV1('â ',"square ")   ; newV2=XMLnewV1('Ã¢',"acirc")
return newV2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\XML-Input\xml-input-2.rexx was migrated on 23 Mar 2025 at 10:43:36
 * -------------------------------------------------------------------------
*/ 
