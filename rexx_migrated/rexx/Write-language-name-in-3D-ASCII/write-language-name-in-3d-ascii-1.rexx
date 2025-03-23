/*ª*REXX program that displays a  "REXX"  3D  "ASCII art"  as a  logo.  */
signal newV1.                  /*ª* Uses left-hand shadows, slightly raised view.
0=5~2?A?2?A?
@)E)3@)B)1)2)8()2)1)2)8()2)
@]~")2@]0`)0@)%)6{)%)0@)%)6{)%)
#E)1#A@0}2)4;2(1}2)4;2(
#3??3@0#2??@1}2)2;2(3}2)2;2(
#2@5@)@2@0#2@A}2)0;2(5}2)0;2(
#2@?"@)@2@0#2@?7}2){2(7}2){2(
#2@6)@2@0#2@3)7}2)(2(9}2)(2(
#2@??@2@0#2@?_)7}5(B}5(
#F@0#8@8}3(D}3(
#3%3?(1#3?_@7;3)C;3)
#2@0}2)5#2@C;5)A;5)
#2@1}2)4#2@B;2()2)8;2()2)
#2@2}2)3#2@?"4;2(}2)6;2(}2)
#2@3}2)2#2@5)2;2(1}2)4;2(1}2)
#2@4}2)1#2@?%)0;2(3}2)2;2(3}2)
0]@2@5}2)1]@A@0)[2(5}2)1)[2(5}2)
1)@%@6}%)1)@`@1V%(7}%)1V%(7}%)
*/;newV1.:a=sigL+1;signal newV1.newV1.;newV1.newV1.:u='_';do j=a to sigl-1
newV2=sourceline(j);newV2=newV2('(',"/");newV2=newV2('[',"//");newV2=newV2('{',"///")
newV2=newV2(';',"////");newV2=newV2(')',"\");newV2=newV2(']',"\\");newV2=newV2('}',"\\\");newV2=newV2('"',"__")
newV2=newV2('%',"___");newV2=newV2('?',left('',4,u));newV2=newV2('`',left('',11,u));newV2=newV2('~',left('',
,13,u));newV2=newV2('=',left('',16,u));newV2=newV2('#','|\\|');newV2=translate(newV2,"|"u,'@"')
do k=0 for 16;x=d2x(k,1);newV2=newV2(x,left('',k+1));end;say ' 'newV2;end;exit;newV2:return,
changestr(arg(1),newV2,arg(2))
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Write-language-name-in-3D-ASCII\write-language-name-in-3d-ascii-1.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
