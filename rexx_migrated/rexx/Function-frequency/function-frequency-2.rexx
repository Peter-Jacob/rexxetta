/*ͺ* REXX ****************************************** Version 11.12.2015 **
* Rexx Tokenizer to find function invocations
*-----------------------------------------------------------------------
* Tokenization remembers the following for each token
* t.i       text of token
* t.i.0t    type of token: Cx/V/K/N/O/S/L
*             comment/variable/keyword/constant/operator/string/label
* t.i.0il   line of token in the input
* t.i.0ic   col of token in the input
* t.i.0prev index of token starting previous instruction
* t.i.0ol   line of token in the output
* t.i.0oc   col of token in the output
*---------------------------------------------------------------------*/
Call time 'R'
Parse Upper Arg fid '(' options
If fid='?' Then Do
Say 'Tokenike a REXX proram and list the function invocations found'
Say '  which are of the form symbol(... or ''string''(...'
Say '  (the left parenthesis must immediately follow the symbol'
Say '  or literal string.)'
Say 'Syntax:'
Say '  TKZ pgm < ( <Debug> <Tokens> >'
Exit
End
g.=0
Call init                         /*ͺ* Initialize constants etc.      */
g.0cont='01'x
g.0breakc='02'x
cnt.=0
Call readin                       /*ͺ* Read input file into l.*       */
Call tokenize                     /*ͺ* Tokenize the input             */
tk=''
Call process_tokens
g.0fun_list=wordsort(g.0fun_list)
Do While g.0fun_list>''
Parse Var g.0fun_list fun g.0fun_list
Say right(cnt.fun,3) fun
End
Say time('E') 'seconds elapsed for' t.0 'tokens in' g.0lines 'lines.'
Exit

init:
/*ͺ***********************************************************************
* Initialize constants etc.
***********************************************************************/
g.=''
g.0debug=0                        /*ͺ* set debug off by default       */

fid=strip(fid)
If fid='' Then                    /*ͺ* no file specified              */
Exit exit(12 'no input file specified')
Parse Var fid fn '.'

os=options                        /*ͺ* options specified on command   */
g.0debug=0                        /*ͺ* turn off debug output          */
g.0tokens=0                       /*ͺ* No token file                  */
Do While os<>''                   /*ͺ* process them individually      */
Parse Upper Var os o os         /*ͺ* pick one                       */
Select
When abbrev('DEBUG',o,1) Then /*ͺ* Debug specified                */
g.0debug=1                  /*ͺ* turn on debug output           */
When abbrev('TOKENS',o,1) Then /*ͺ* Write a file with tokens      */
g.0tokens=1
Otherwise                     /*ͺ* anything else                  */
Say 'Unknown option:' o     /*ͺ* tell the user and ignore it    */
End
End

If g.0debug Then Do
g.0dbg=fn'.dbg'; '@erase' g.0dbg
End
If g.0tokens Then Do
g.0tkf=fn'.tok'; '@erase' g.0tkf
End

/*ͺ***********************************************************************
* Language specifics
***********************************************************************/
g.0special='+-*/%''";:<>^\=|,()& '/*ͺ* special characters             */
/*ͺ* chars that may start a var */
g.0a='abcdefghijklmnopqrstuvwxyz'||,
'ABCDEFGHIJKLMNOPQRSTUVWXYZ@#$!?_'
g.0n='1234567890'                 /*ͺ* numeric characters             */
g.0vc=g.0a||g.0n||'.'             /*ͺ* var-character                  */
/*ͺ* multi-character operators      */
g.0opx='&& ** // << <<= <= <> == >< >= >> >>=',
'^< ^<< ^= ^== ^> ^>> \< \<< \= \== \> \>> ||'

t.=''                             /*ͺ* token list                     */
Return

readin:
/*ͺ***********************************************************************
* Read the file to be formatted
***********************************************************************/
lc=''
i=0
g.0lines=0
Do While lines(fid)<>0
li=linein(fid)
g.0lines=g.0lines+1
If i>0 Then
lc=strip(l.i,'T')
If right(lc,1)=',' Then Do
l.i=left(lc,length(lc)-1) li
End
Else Do
i=i+1
l.i=li
End
End
l.0=i
Call lineout fid
t=l.0+1
l.t=g.0eof                        /*ͺ* add a stopper at program end   */
l.0=t                             /*ͺ* adjust number of lines         */
g.0il=t                           /*ͺ* remember end of program        */
Return

tokenize:
/*ͺ***********************************************************************
* First perform tokenization
* Input:  l.*  Program text
* Output: t.*  Token list
*         t.0t.i token type CA CB CC C comment begin/middle/end
*                           S          string
*                           O          operator (special character)
*                           V          variable symbol
*                           N          constant
*                           X          end of text
* Note: special characters are treated as separate tokens
***********************************************************************/
li=0                              /*ͺ* line index                     */
ti=0                              /*ͺ* token index                    */
Do While li<l.0                   /*ͺ* as long as there is more input */
li=li+1                         /*ͺ* index of next line             */
l=l.li                          /*ͺ* next line to be processed      */
g.0newline=1
g.0cc=0                         /*ͺ* current column                 */
Call dsp l.li                   /*ͺ* debug output                   */
If l='' Then                    /*ͺ* empty line                     */
Call addtoken '/*ͺ*--*/','C'    /*ͺ* preserve with special token    */
Do While l<>''                  /*ͺ* work through the line          */
nbc=verify(l,' ')             /*ͺ* first non-blank column         */
g.0cc=g.0cc+nbc               /*ͺ* advance to this                */
If g.0newline='' Then Do
If t.ti.0ic='' Then
t.ti.0ic=0
If g.0cc=t.ti.0ic+length(t.ti) Then Do
tj=ti+1
t.tj.0ad=1
End
End
l=substr(l,nbc)               /*ͺ* and continue with rest of line */
Parse Var l c +1 l 1 c2 +2    /*ͺ* get character(s)               */
g.0tb=g.0cc                   /*ͺ* remember where token starts    */
Select                        /*ͺ* take a decision                */
When c2='/*ͺ*§ Τθεξ           /*ͺ γοννεξτ σταςτσ θεςε            */
Call comment              /*ͺ* process comment                */
When pos(c,'''"')>0 Then    /*ͺ* literal string starts here     */
Call string c             /*ͺ* process literal string         */
Otherwise                   /*ͺ* neither comment nor literal    */
Call token                /*ͺ* get other token                */
End                         /*ͺ* cmt, string, or token done     */
End                           /*ͺ* end of loop over line          */
End                             /*ͺ* end of loop over program       */
t.0=ti                            /*ͺ* store number of tokens         */
Call dsp ti 'tokens' l.0 'lines'
Return
comment:
/*ͺ***********************************************************************
* Parse a comment
* Nested comments are supported
***********************************************************************/
cbeg=t.ti.0il
l=substr(l,2)                     /*ͺ* continue after slash-asterisk  */
g.0cc=g.0cc+1                     /*ͺ* update current char position   */
t='/*ͺ*'                            /*ͺ* token so far                   */
incmt=1                           /*ͺ* indicate "within a comment"    */
Do Until incmt=0                  /*ͺ* loop until done                */
bc=pos('/*ͺ*',l)                  /*ͺ* next begin comment, if any     */
ec=pos('*/',l)                  /*ͺ* next end   comment, if any     */
Select                          /*ͺ* decide                         */
When bc>0 &,                  /*ͺ* begin-comment found            */
(ec=0 | bc<ec) Then Do   /*ͺ* and no end-comment or later    */
t=t||left(l,bc+1)           /*ͺ* add this all to token          */
incmt=incmt+1               /*ͺ* increment comment nest-depth   */
l=substr(l,bc+2)            /*ͺ* continue after slash-asterisk  */
g.0cc=g.0cc+bc+1            /*ͺ* update current char position   */
End
When ec>0 Then Do             /*ͺ* end-comment found              */
t=t||left(l,ec+1)           /*ͺ* add all to token               */
incmt=incmt-1               /*ͺ* decrement nesting              */
l=substr(l,ec+2)            /*ͺ* continue after asterisk-slash  */
g.0cc=g.0cc+ec+1            /*ͺ* update current char position   */
End
Otherwise Do                  /*ͺ* no further comment bracket     */
Call addtoken t||l,ct()     /*ͺ* rest of line to token          */
li=li+1                     /*ͺ* proceed to next line           */
l=l.li                      /*ͺ* contents of next line          */
g.0newline=1
If l=g.0eof Then Do
Say 'Comment started in line' cbeg 'is not closed before EOF'
Exit err(58)
End
g.0cc=0                     /*ͺ* current char (none)            */
g.0tb=1                     /*ͺ* token (comment) starts here    */
End
End
End
Call addtoken t,ct()             /*ͺ* last (or only) comment token    */
If pos('*debug*',t)>0 Then g.0debug=1
Return

ct:
/*ͺ***********************************************************************
* Comment type
***********************************************************************/
If incmt>0 Then Do                /*ͺ* within a comment               */
If t.ti.0t='CA' |,              /*ͺ* prev. token was start or cont  */
t.ti.0t='CB' Then Return 'CB'  /*ͺ* this is continuation         */
Else Return 'CA'  /*ͺ* this is start                */
End
Else Do                           /*ͺ* comment is over                */
If t.ti.0t='CA' |,              /*ͺ* prev. token was start or cont  */
t.ti.0t='CB' Then Return 'CC'  /*ͺ* this is final part           */
Else Return 'C'   /*ͺ* this is just a comment       */
End
string:
/*ͺ***********************************************************************
* Parse a string
* take care of '111'B and '123'X
***********************************************************************/
Parse Arg delim                  /*ͺ* string delimiter found          */
t=delim                          /*ͺ* star building the token         */
instr=1                          /*ͺ* note we are within a string     */
g.0ss=li
Do Until instr=0                 /*ͺ* continue until it is over       */
se=pos(delim,l)                /*ͺ* ending delimiter                */
If se>0 Then Do                /*ͺ* found                           */
If substr(l,se+1,1)=delim Then Do /*ͺ* but it is doubled          */
t=t||left(l,se+1)          /*ͺ* so add all so far to token      */
l=substr(l,se+2)           /*ͺ* and take rest of line           */
g.0cc=g.0cc+se+1           /*ͺ* and set current character pos   */
End
Else Do                      /*ͺ* not another one                 */
instr=0                    /*ͺ* string is done                  */
t=t||left(l,se)            /*ͺ* add the string data to token    */
l=substr(l,se+1)           /*ͺ* take the rest of the line       */
g.0cc=g.0cc+se             /*ͺ* and set current character pos   */
If pos(translate(left(l,1)),'BX')>0 Then
If pos(substr(l,2,1),g.0vc)=0 Then Do
t=t||left(l,1)         /*ͺ* add the char to the token       */
l=substr(l,2)          /*ͺ* take the rest of the line       */
g.0cc=g.0cc+1          /*ͺ* and set current character pos   */
End
End
End
Else Do                        /*ͺ* not found                       */
Call addtoken t||l,'S'       /*ͺ* store the token                 */
g.0lasttoken=''              /*ͺ* reset this switch               */
li=li+1                      /*ͺ* go on to the next line          */
If li>l.0 Then               /*ͺ* there is no next line           */
Exit err(60,'string starting in line' g.0ss,
'does not end before end of file')
Else
Say 'string starting at line' g.0ss 'extended over line boundary'
l=l.li                       /*ͺ* take contents of the next line  */
g.0cc=1                      /*ͺ* current char position           */
g.0tb=1                      /*ͺ* ??                              */
End
End
Call addtoken t,'S'              /*ͺ* store the token                 */
Return
token:
/*ͺ***********************************************************************
* Parse a token
***********************************************************************/
IF c=g.0comma & l='' Then Do
t=g.0cont
type='O'                        /*ͺ* O (for operator - not quite...)*/
End
Else Do
If pos(c,g.0special)>0 Then Do  /*ͺ* a special character            */
t=c                           /*ͺ* take it as is                  */
type='O'                      /*ͺ* O (for operator - not quite...)*/
End
Else Do                         /*ͺ* some other character           */
nsp=verify(l,g.0special,'M')  /*ͺ* find delimiting character      */
If nsp>0 Then Do              /*ͺ* some character found           */
t=c||left(l,nsp-1)          /*ͺ* take all up to this character  */
l=substr(l,nsp)             /*ͺ* and continue from there        */
End
Else Do                       /*ͺ* none found                     */
t=c||l                      /*ͺ* add rest of line to token      */
l=''                        /*ͺ* and all is used up             */
End
g.0cc=g.0cc+length(t)-1       /*ͺ* adjust current char position   */
If pos(right(t,1),'eE')>0 &,  /*ͺ* consider nxxxE+nn case         */
pos(left(l,1),'+-')>0 Then Do
If pos(left(t,1),'.1234567890')>0 Then /*ͺ* start . or digit    */
If pos(substr(l,2,1),'1234567890')>0 Then Do /*ͺ* dig after+- */
nsp=verify(substr(l,2),g.0special,'M')+1 /*ͺ* find end      */
If nsp>1 Then           /*ͺ* delimiting character found     */
exp=substr(l,2,nsp-2)   /*ͺ* exponent (if numeric)        */
Else
exp=substr(l,2)
If verify(exp,'0123456789')=0 Then Do
t=t||left(l,1)||exp
l=substr(l,length(exp)+2)
g.0cc=g.0cc+length(exp)+2
End
End
End
Select
When isvar(t) Then          /*ͺ* token qualifies as variable    */
type='V'
When isconst(t) Then        /*ͺ* token is a constant symbol     */
type='N'
When t=g.0eof   Then        /*ͺ* token is end of file indication*/
type='X'
Otherwise Do                /*ͺ* anything else is an error      */
Say 'li='li
Say l
Say 'token error'
Trace ?R
Exit err(62,'token' t 'is neither variable nor constant')
End
End
If left(l,1)='(' Then
type=type||'F'
End
End
Call addtoken t,type              /*ͺ* store the token                */
Return
addtoken:
/*ͺ***********************************************************************
* Add a token to the token list
***********************************************************************/
Parse Arg t,type                  /*ͺ* token and its type             */
If type='O' Then Do               /*ͺ* operator (special character)   */
If pos(t,'><=&|/*ͺ*')>0 Then Do   /*ͺ* char for composite operator    */
If wordpos(t.ti||t,g.0opx)>0 Then Do  /*ͺ*  composite operator    */
t.ti=t.ti||t                /*ͺ* use concatenation              */
/*ͺ* does not handle =/*ͺ**/=         */
t=''                        /*ͺ* we are done                    */
Return
End
End
End

If type='CC' & t='*/' Then Do     /*ͺ* The special case for SPA       */
Return
End

ti=ti+1                           /*ͺ* increment index                */
t.ti=t                            /*ͺ* store token's value            */
t.ti.0t=left(type,1)              /*ͺ*  and its type                  */
t.ti.0nl=g.0newline               /*ͺ* token starts a new line        */
g.0newline=''                     /*ͺ* reset new line switch          */
If t.ti.0t='C' Then Do
t.ti.0t=type
If left(t.ti,3)='/*ͺ* ' &,
right(t.ti,3)=' */' Then
t.ti='/*ͺ*' strip(substr(t.ti,4,length(t.ti)-6)) '*/'
End
t.ti.0f=substr(type,2,1)          /*ͺ* 'F' if possibly a function     */
Call setpos ti li g.0tb           /*ͺ*    and its position            */
If left(type,1)='C' Then          /*ͺ* ??? */
If left(t.ti,2)<>'/*ͺ*' Then Do
ts=strip(t.ti,'L')
t.ti.0oc=t.ti.0oc+length(t.ti)-length(ts)
t.ti=ts
End
If t.ti.0ol='' Then t.ti.0ol=li
If t.ti.0oc='' Then t.ti.0oc=0
t.ti.0il=t.ti.0ol                 /*ͺ*    and its position            */
t.ti.0ic=t.ti.0oc                 /*ͺ*    and its position            */
Call dsp ti t.ti t.ti.0il'/'t.ti.0ic '->' t.ti.0ol'/'t.ti.0oc
t=''                              /*ͺ* reset token variable           */
Return

lookback:
/*ͺ***********************************************************************
* Look back if...
***********************************************************************/
Do i_=ti To 1 By -1
Select
When left(t.i_.0t,1)='C' Then Nop
When t.i_.0used<>1 &,
(t.i_=g.0comma |,
t.i_=g.0cont)  Then Do
t.i_.0used=1
t.i_=g.0cont
Return '0'
End
Otherwise
Return '1'
End
End
Return '1'

isvar:
/*ͺ***********************************************************************
* Determine if a string qualifies as variable name
***********************************************************************/
Parse Arg a_ +1 b_
res=(pos(a_,g.0a)>0) &,
(verify(b_,g.0a||g.0n||'.')=0)
Return res

isconst:
/*ͺ***********************************************************************
* Determine if a string qualifies as constant
***********************************************************************/
Parse Arg a_
res=(verify(a_,g.0a||g.0n||'.+-')=0) /*ͺ* ??? */
Return res

setpos:
Parse Arg seti sol soc
setz='setpos:' t.seti t.seti.0ol'/'t.seti.0oc '-->',
sol'/'soc '('sigl')'
Call dsp setz
t.seti.0ol=sol
t.seti.0oc=soc
Return

process_tokens:
/*ͺ***********************************************************************
* Process the token list
***********************************************************************/
Do i=1 To t.0
If g.0tokens Then
Call lineout g.0tkf,right(i,4) right(t.i.0il,3)'.'left(t.i.0ic,3),
right(t.i.0ol,3)'.'left(t.i.0oc,3),
left(t.i.0t,2) left(t.i,25)
If t.i='(' Then Do
j=i-1
If t.j.0ol=t.i.0il & ,
t.j.0oc+length(t.j)=t.i.0ic &,
pos(t.j.0t,'VS')>0 Then
Call store_f t.j
End
End
If g.0tokens Then
Call lineout g.0tkf
Return

store_f:
Parse Arg funct
If wordpos(funct,g.0fun_list)=0 then
g.0fun_list=g.0fun_list funct
cnt.funct=cnt.funct+1
Return

dsp:
/*ͺ***********************************************************************
* Record (and display) a debug line
***********************************************************************/
Parse Arg ol_.1
If g.0debug>0 Then
Call lineout g.0dbg,ol_.1
If g.0debug>1 Then
Say ol_.1
Return

wordsort: Procedure
/*ͺ**********************************************************************
* Sort the list of words supplied as argument. Return the sorted list
**********************************************************************/
Parse Arg wl
wa.=''
wa.0=0
Do While wl<>''
Parse Var wl w wl
Do i=1 To wa.0
If wa.i>w Then Leave
End
If i<=wa.0 Then Do
Do j=wa.0 To i By -1
ii=j+1
wa.ii=wa.j
End
End
wa.i=w
wa.0=wa.0+1
End
swl=''
Do i=1 To wa.0
swl=swl wa.i
End
Return strip(swl)

err:
/*ͺ***********************************************************************
* Diagnostic error exit
***********************************************************************/
Parse Arg errnum, errtxt
Say 'err:' errnum  errtxt
If t.ti.0il>g.0il Then
Say 'Error' arg(1) 'at end of file'
Else Do
Say 'Error' arg(1) 'around line' t.ti.0il', column' t.ti.0ic
_=t.ti.0il
Say l._
Say copies(' ',t.ti.0ic-1)'|'
End
If errtxt<>'' Then Say '  'errtxt
Exit 12
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Function-frequency\function-frequency-2.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
