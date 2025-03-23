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
/*ª*β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€*/
xmlnewV1:   parse arg ,newV1                             /*ª*transkate an  XML  entity   (&xxxx;) */
xmlEntity! = '&'newV1";"
if pos(xmlEntity!, newV2)\==0  then newV2=changestr(xmlEntity!, newV2, arg(1) )
if left(newV1, 2)=='#x'  then do
xmlEntity!='&'left(newV1, 3)translate( substr(newV1, 4) )";"
newV2=changestr(xmlEntity!, newV2, arg(1) )
end
return newV2
/*ª*β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€β”€*/
xmlTranE: procedure; parse arg newV2                 /*ª*Following are most of the chars in   */
/*ª*the  DOS  (under Windows)  codepage. */
newV2=XMLnewV1('ΓΆ',"ETH")    ; newV2=XMLnewV1('Ζ’',"fnof")  ; newV2=XMLnewV1('β•',"boxH")      ; newV2=XMLnewV1('β™¥',"hearts")
newV2=XMLnewV1('ΓΆ','#x00e2') ; newV2=XMLnewV1('Γ΅',"aacute"); newV2=XMLnewV1('β•¬',"boxVH")     ; newV2=XMLnewV1('β™¦',"diams")
newV2=XMLnewV1('ΓΆ','#x00e9') ; newV2=XMLnewV1('Γ΅','#x00e1'); newV2=XMLnewV1('β•''¬ΆboxHuΆ©     » ξεχΦ²½ΨΝΜξεχΦ±¨'b#'¬ΆclubsΆ©
newV2=XMLnewV1('ΓξεχΦ²',"auml")   ; newV2=XMLnewV1('Γ­',"iacute"); newV2=XMLnewV1('β•¨',"boxhU")     ; newV2=XMLnewV1('β™ ',"spades")
newV2=XMLnewV1('ΓξεχΦ²','#x00e4') ; newV2=XMLnewV1('Γ­','#x00ed'); newV2=XMLnewV1('β•ξεχΦ²',"boxHd")     ; newV2=XMLnewV1('β™‚',"male")
newV2=XMLnewV1('Γ ',"agrave") ; newV2=XMLnewV1('Γ³',"oacute"); newV2=XMLnewV1('β•¥',"boxhD")     ; newV2=XMLnewV1('β™€',"female")
newV2=XMLnewV1('Γ ','#x00e0') ; newV2=XMLnewV1('Γ³','#x00f3'); newV2=XMLnewV1('β•™',"boxUr")     ; newV2=XMLnewV1('βΌ',"#x263c")
newV2=XMLnewV1('Γ¥',"aring")  ; newV2=XMLnewV1('ΓΊ',"uacute"); newV2=XMLnewV1('β•',"boxuR")     ; newV2=XMLnewV1('β†•',"UpDownArrow")
newV2=XMLnewV1('Γ¥','#x00e5') ; newV2=XMLnewV1('ΓΊ','#x00fa'); newV2=XMLnewV1('β•’',"boxdR")     ; newV2=XMLnewV1('Β¶',"para")
newV2=XMLnewV1('Γ''¬ΆccedilΆ© » ξεχΦ²½ΨΝΜξεχΦ±¨'C1'¬ΆntildeΆ©» ξεχΦ²½ΨΝΜξεχΦ±¨'b'¬ΆboxDrΆ©     » ξεχΦ²½ΨΝΜξεχΦ±¨'B'',"sect")
newV2=XMLnewV1('Γ''¬'£ψ°°ε·'© » ξεχΦ²½ΨΝΜξεχΦ±¨'C1'¬'£ψ°°ζ±'©» ξεχΦ²½ΨΝΜξεχΦ±¨'b+'¬ΆboxVhΆ©     » ξεχΦ²½ΨΝΜξεχΦ±¨'b'¬ΆuarrΆ©
newV2=XMLnewV1('Γª',"ecirc")  ; newV2=XMLnewV1('Γ‘',"Ntilde"); newV2=XMLnewV1('β•ª',"boxvH")     ; newV2=XMLnewV1('β†‘',"uparrow")
newV2=XMLnewV1('Γª','#x00ea') ; newV2=XMLnewV1('Γ‘','#x00d1'); newV2=XMLnewV1('β”',"boxul")     ; newV2=XMLnewV1('β†‘',"ShortUpArrow")
newV2=XMLnewV1('Γ«',"euml")   ; newV2=XMLnewV1('ΒΏ',"iquest"); newV2=XMLnewV1('β”',"boxdr")     ; newV2=XMLnewV1('β†“',"darr")
newV2=XMLnewV1('Γ«','#x00eb') ; newV2=XMLnewV1('β',"bnot")  ; newV2=XMLnewV1('β–',"block")     ; newV2=XMLnewV1('β†“',"downarrow")
newV2=XMLnewV1('Γ¨',"egrave") ; newV2=XMLnewV1('Β¬',"not")   ; newV2=XMLnewV1('β–„',"lhblk")     ; newV2=XMLnewV1('β†“',"ShortDownArrow")
newV2=XMLnewV1('Γ¨','#x00e8') ; newV2=XMLnewV1('Β½',"frac12"); newV2=XMLnewV1('β–€',"uhblk")     ; newV2=XMLnewV1('β†',"larr")
newV2=XMLnewV1('Γ―',"iuml")   ; newV2=XMLnewV1('Β½',"half")  ; newV2=XMLnewV1('Ξ±',"alpha")     ; newV2=XMLnewV1('β†',"leftarrow")
newV2=XMLnewV1('Γ―','#x00ef') ; newV2=XMLnewV1('ΒΌ',"frac14"); newV2=XMLnewV1('Γ',"beta")      ; newV2=XMLnewV1('β†',"ShortLeftArrow")
newV2=XMLnewV1('Γ®',"icirc")  ; newV2=XMLnewV1('Β΅',"iexcl") ; newV2=XMLnewV1('Γ',"szlig")     ; newV2=XMLnewV1('1c'x,"rarr")
newV2=XMLnewV1('Γ®','#x00ee') ; newV2=XMLnewV1('Β«',"laqru") ; newV2=XMLnewV1('Γ','#x00df')    ; newV2=XMLnewV1('1c'x,"rightarrow")
newV2=XMLnewV1('Γ¬',"igrave") ; newV2=XMLnewV1('Β»',"raqru") ; newV2=XMLnewV1('Ξ“',"Gamma")     ; newV2=XMLnewV1('1c'x,"ShortRightArrow")
newV2=XMLnewV1('Γ¬','#x00ec') ; newV2=XMLnewV1('β–‘',"blk12") ; newV2=XMLnewV1('Ο€',"pi")        ; newV2=XMLnewV1('!',"excl")
newV2=XMLnewV1('Γ„',"Auml")   ; newV2=XMLnewV1('β–’',"blk14") ; newV2=XMLnewV1('Ξ£',"Sigma")     ; newV2=XMLnewV1('"',"apos")
newV2=XMLnewV1('Γ„','#x00c4') ; newV2=XMLnewV1('β–“',"blk34") ; newV2=XMLnewV1('Οƒ',"sigma")     ; newV2=XMLnewV1('$',"dollar")
newV2=XMLnewV1('Γ…',"Aring")  ; newV2=XMLnewV1('β”‚',"boxv")  ; newV2=XMLnewV1('Βµ',"mu")        ; newV2=XMLnewV1("'","quot")
newV2=XMLnewV1('Γ…','#x00c5') ; newV2=XMLnewV1('β”ξεχΦ²',"boxvl") ; newV2=XMLnewV1('Ο„',"tau")       ; newV2=XMLnewV1('*',"ast")
newV2=XMLnewV1('Γ‰',"Eacute") ; newV2=XMLnewV1('β•΅',"boxvL") ; newV2=XMLnewV1('Ξ¦',"phi")       ; newV2=XMLnewV1('/',"sol")
newV2=XMLnewV1('Γ‰','#x00c9') ; newV2=XMLnewV1('β•Ά',"boxVl") ; newV2=XMLnewV1('Ξ',"Theta")     ; newV2=XMLnewV1(':',"colon")
newV2=XMLnewV1('Γ¦',"aelig")  ; newV2=XMLnewV1('β•–',"boxDl") ; newV2=XMLnewV1('Ξ΄',"delta")     ; newV2=XMLnewV1('<',"lt")
newV2=XMLnewV1('Γ¦','#x00e6') ; newV2=XMLnewV1('β••',"boxdL") ; newV2=XMLnewV1('β',"infin")     ; newV2=XMLnewV1('=',"equals")
newV2=XMLnewV1('Γ†',"AElig")  ; newV2=XMLnewV1('β•£',"boxVL") ; newV2=XMLnewV1('Ο†',"Phi")       ; newV2=XMLnewV1('>',"gt")
newV2=XMLnewV1('Γ†','#x00c6') ; newV2=XMLnewV1('β•‘',"boxV")  ; newV2=XMLnewV1('Ξµ',"epsilon")   ; newV2=XMLnewV1('?',"quest")
newV2=XMLnewV1('Γ΄',"ocirc")  ; newV2=XMLnewV1('β•—',"boxDL") ; newV2=XMLnewV1('β©',"cap")       ; newV2=XMLnewV1('_',"commat")
newV2=XMLnewV1('Γ΄','#x00f4') ; newV2=XMLnewV1('β•',"boxUL") ; newV2=XMLnewV1('β‰΅',"equiv")     ; newV2=XMLnewV1('[',"lbrack")
newV2=XMLnewV1('Γ¶',"ouml")   ; newV2=XMLnewV1('β•',"boxUl") ; newV2=XMLnewV1('Β±',"plusmn")    ; newV2=XMLnewV1('\',"bsol")
newV2=XMLnewV1('Γ¶','#x00f6') ; newV2=XMLnewV1('β•›',"boxuL") ; newV2=XMLnewV1('Β±',"pm")        ; newV2=XMLnewV1(']',"rbrack")
newV2=XMLnewV1('Γ²',"ograve") ; newV2=XMLnewV1('β”',"boxdl") ; newV2=XMLnewV1('Β±',"PlusMinus") ; newV2=XMLnewV1('^',"Hat")
newV2=XMLnewV1('Γ²','#x00f2') ; newV2=XMLnewV1('β””',"boxur") ; newV2=XMLnewV1('β‰¥',"ge")        ; newV2=XMLnewV1('`',"grave")
newV2=XMLnewV1('Γ»',"ucirc")  ; newV2=XMLnewV1('β”΄',"bottom"); newV2=XMLnewV1('β‰ξεχΦ²',"le")        ; newV2=XMLnewV1('{',"lbrace")
newV2=XMLnewV1('Γ»','#x00fb') ; newV2=XMLnewV1('β”΄',"boxhu") ; newV2=XMLnewV1('Γ·',"div")       ; newV2=XMLnewV1('{',"lcub")
newV2=XMLnewV1('ΓΉ',"ugrave") ; newV2=XMLnewV1('β”¬',"boxhd") ; newV2=XMLnewV1('Γ·',"divide")    ; newV2=XMLnewV1('|',"vert")
newV2=XMLnewV1('ΓΉ','#x00f9') ; newV2=XMLnewV1('β”',"boxvr") ; newV2=XMLnewV1('β‰',"approx")    ; newV2=XMLnewV1('|',"verbar")
newV2=XMLnewV1('ΓΏ',"yuml")   ; newV2=XMLnewV1('β”€',"boxh")  ; newV2=XMLnewV1('β™',"bull")      ; newV2=XMLnewV1('}',"rbrace")
newV2=XMLnewV1('ΓΏ','#x00ff') ; newV2=XMLnewV1('β”Ό',"boxvh") ; newV2=XMLnewV1('Β°',"deg")       ; newV2=XMLnewV1('}',"rcub")
newV2=XMLnewV1('Γ–',"Ouml")   ; newV2=XMLnewV1('β•',"boxvR") ; newV2=XMLnewV1('Β·',"middot")    ; newV2=XMLnewV1('Γ‡',"Ccedil")
newV2=XMLnewV1('Γ–','#x00d6') ; newV2=XMLnewV1('β•',"boxVr") ; newV2=XMLnewV1('Β·',"middledot") ; newV2=XMLnewV1('Γ‡','#x00c7')
newV2=XMLnewV1('Γ',"Uuml")   ; newV2=XMLnewV1('β•',"boxUR") ; newV2=XMLnewV1('Β·',"centerdot") ; newV2=XMLnewV1('ΓΌ',"uuml")
newV2=XMLnewV1('Γ','#x00dc') ; newV2=XMLnewV1('β•”',"boxDR") ; newV2=XMLnewV1('Β·',"CenterDot") ; newV2=XMLnewV1('ΓΌ','#x00fc')
newV2=XMLnewV1('ΒΆ',"cent")   ; newV2=XMLnewV1('β•©',"boxHU") ; newV2=XMLnewV1('β',"radic")     ; newV2=XMLnewV1('Γ©',"eacute")
newV2=XMLnewV1('Β£',"pound")  ; newV2=XMLnewV1('β•¦',"boxHD") ; newV2=XMLnewV1('Β²',"sup2")      ; newV2=XMLnewV1('Γ©','#x00e9')
newV2=XMLnewV1('Β¥',"yen")    ; newV2=XMLnewV1('β• ',"boxVR") ; newV2=XMLnewV1('β– ',"square ")   ; newV2=XMLnewV1('ΓΆ',"acirc")
return newV2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\XML-Input\xml-input-2.rexx was migrated on 23 Mar 2025 at 10:43:36
 * -------------------------------------------------------------------------
*/ 
