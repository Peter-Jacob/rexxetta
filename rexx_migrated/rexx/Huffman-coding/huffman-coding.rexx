/*ª* REXX ---------------------------------------------------------------
* 27.12.2013 Walter Pachl
* 29.12.2013 -"- changed for test of s=xrange('00'x,'ff'x)
* 14.03.2018 -"- use format instead of right to diagnose size poblems
* Stem m contains eventually the following node data
* m.i.0id Node id
* m.i.0c  character
* m.i.0o  number of occurrences
* m.i.0l  left child
* m.i.0r  right child
* m.i.0f  father
* m.i.0d  digit (0 or 1)
* m.i.0t  1=a terminal node 0=an intermediate or the top node
*--------------------------------------------------------------------*/
Parse Arg s
If s='' Then
s='this is an example for huffman encoding'
Say 'We encode this string:'
Say s
debug=0
o.=0
c.=0
codel.=0
code.=''
father.=0
cl=''                                  /*ª* list of characters         */
do i=1 To length(s)
Call memorize substr(s,i,1)
End
If debug Then Do
Do i=1 To c.0
c=c.i
Say i c o.c
End
End
n.=0
Do i=1 To c.0
c=c.i
n.i.0c=c
n.i.0o=o.c
n.i.0id=i
Call dbg i n.i.0id n.i.0c n.i.0o
End
n=c.0                                  /*ª* number of nodes            */
m.=0
Do i=1 To n                            /*ª* construct initial array    */
Do j=1 To m.0                        /*ª* sorted by occurrences      */
If m.j.0o>n.i.0o Then
Leave
End
Do k=m.0 To j By -1
k1=k+1
m.k1.0id=m.k.0id
m.k1.0c =m.k.0c
m.k1.0o =m.k.0o
m.k1.0t =m.k.0t
End
m.j.0id=i
m.j.0c =n.i.0c
m.j.0o =n.i.0o
m.j.0t =1
m.0=m.0+1
End
If debug Then
Call show

Do While pairs()>1    /*ª* while there are at least 2 fatherless nodes */
Call mknode         /*ª* create and fill a new father node           */
If debug Then
Call show
End

Call show
c.=0
Do i=1 To m.0       /*ª* now we loop over all lines representing nodes */
If m.i.0t Then Do   /*ª* for each terminal node                 */
code=m.i.0d       /*ª* its digit is the last code digit            */
node=m.i.0id      /*ª* its id                                      */
Do fi=1 To 1000   /*ª* actually Forever                            */
fid=father.node           /*ª* id of father                      */
If fid<>0 Then Do         /*ª* father exists                     */
fidz=zeile(fid)         /*ª* line that contains the father     */
code=m.fidz.0d||code    /*ª* prepend the digit                 */
node=fid                /*ª* look for next father              */
End
Else                      /*ª* no father (we reached the top     */
Leave
End
If length(code)>1 Then      /*ª* more than one character in input  */
code=substr(code,2)       /*ª* remove the the top node's 0       */
call dbg m.i.0c '->' code   /*ª* character is encoded this way     */
char=m.i.0c
code.char=code
z=codel.0+1
codel.z=code
codel.0=z
char.code=char
End
End

Call show_char2code  /*ª* show used characters and corresponding codes */

codes.=0               /*ª* now we build the array of codes/characters */
Do j=1 To codel.0
z=codes.0+1
code=codel.j
codes.z=code
chars.z=char.code
codes.0=z
Call dbg codes.z '----->' chars.z
End

sc=''                  /*ª* here we ecnode the string                  */
Do i=1 To length(s)    /*ª* loop over input                            */
c=substr(s,i,1)      /*ª* a character                                */
sc=sc||code.c        /*ª* append the corresponding code              */
End
Say 'Length of encoded string:' length(sc)
Do i=1 To length(sc) by 70
Say substr(sc,i,70)
End

sr=''                  /*ª* now decode the string                      */
Do si=1 To 999 While sc<>''
Do i=codes.0 To 1 By -1              /*ª* loop over codes            */
cl=length(codes.i)                 /*ª* length of code             */
If left(sc,cl)==codes.i Then Do    /*ª* found on top of string     */
sr=sr||chars.i                   /*ª* append character to result */
sc=substr(sc,cl+1)               /*ª* cut off the used code      */
Leave                            /*ª* this was one character     */
End
End
End
Say 'Input ="'s'"'
Say 'result="'sr'"'

Exit

show:
/*ª*---------------------------------------------------------------------
* show all lines representing node data
*--------------------------------------------------------------------*/
Say '  i   pp  id   c   f   l r d'
Do i=1 To m.0
Say format(i,3) format(m.i.0o,4) format(m.i.0id,3),
format(m.i.0f,3) format(m.i.0l,3) format(m.i.0r,3) m.i.0d m.i.0t
End
Call dbg copies('-',21)
Return

pairs: Procedure Expose m.
/*ª*---------------------------------------------------------------------
* return number of fatherless nodes
*--------------------------------------------------------------------*/
res=0
Do i=1 To m.0
If m.i.0f=0 Then
res=res+1
End
Return res

mknode:
/*ª*---------------------------------------------------------------------
* construct and store a new intermediate or the top node
*--------------------------------------------------------------------*/
new.=0
ni=m.0+1                 /*ª* the next node id                         */
Do i=1 To m.0            /*ª* loop over node lines                     */
If m.i.0f=0 Then Do    /*ª* a fatherless node                        */
z=m.i.0id            /*ª* its id                                   */
If new.0l=0 Then Do  /*ª* new node has no left child               */
new.0l=z           /*ª* make this the lect child                 */
new.0o=m.i.0o      /*ª* occurrences                              */
m.i.0f=ni          /*ª* store father info                        */
m.i.0d='0'         /*ª* digit 0 to be used                       */
father.z=ni        /*ª* remember z's father (redundant)          */
End
Else Do              /*ª* New node has already left child          */
new.0r=z           /*ª* make this the right child                */
new.0o=new.0o+m.i.0o  /*ª* add in the occurrences                */
m.i.0f=ni          /*ª* store father info                        */
m.i.0d=1           /*ª* digit 1 to be used                       */
father.z=ni        /*ª* remember z's father (redundant)          */
Leave
End
End
End
Do i=1 To m.0            /*ª* Insert new node according to occurrences */
If m.i.0o>=new.0o Then Do
Do k=m.0 To i By -1
k1=k+1
m.k1.0id=m.k.0id
m.k1.0o =m.k.0o
m.k1.0c =m.k.0c
m.k1.0l =m.k.0l
m.k1.0r =m.k.0r
m.k1.0f =m.k.0f
m.k1.0d =m.k.0d
m.k1.0t =m.k.0t
End
Leave
End
End
m.i.0id=ni
m.i.0c ='*'
m.i.0o =new.0o
m.i.0l =new.0l
m.i.0r =new.0r
m.i.0t =0
father.ni=0
m.0=ni
Return

zeile:
/*ª*---------------------------------------------------------------------
* find and return line number containing node-id
*--------------------------------------------------------------------*/
do fidz=1 To m.0
If m.fidz.0id=arg(1) Then
Return fidz
End
Call dbg arg(1) 'not found'
Pull .

dbg:
/*ª*---------------------------------------------------------------------
* Show text if debug is enabled
*--------------------------------------------------------------------*/
If debug=1 Then
Say arg(1)
Return


memorize: Procedure Expose c. o.
/*ª*---------------------------------------------------------------------
* store characters and corresponding occurrences
*--------------------------------------------------------------------*/
Parse Arg c
If o.c=0 Then Do
z=c.0+1
c.z=c
c.0=z
End
o.c=o.c+1
Return

show_char2code:
/*ª*---------------------------------------------------------------------
* show used characters and corresponding codes
*--------------------------------------------------------------------*/
cl=xrange('00'x,'ff'x)
Say 'char --> code'
Do While cl<>''
Parse Var cl c +1 cl
If code.c<>'' Then
Say '   'c '-->' code.c
End
Return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Huffman-coding\huffman-coding.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
