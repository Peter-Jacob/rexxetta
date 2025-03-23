/*ª* REXX ***************************************************************
* Split comments
* This program ignores comment delimiters within literal strings
* such as, e.g., in b = "--' O'Connor's widow --";
* it does not (yet) take care of -- comments (ignore rest of line)
* also it does not take care of say 667/*ª*yuppers*/77 (REXX specialty)
*   courtesy GS discussion!
* 12.07.2013 Walter Pachl
**********************************************************************/
fid='in.txt'                           /*ª* input text                 */
oic='oc.txt'; 'erase' oic              /*ª* will contain comments      */
oip='op.txt'; 'erase' oip              /*ª* will contain program parts */
oim='om.txt'; 'erase' oim              /*ª* oc.txt merged with op.txt  */
cmt=0                                  /*ª* comment nesting            */
str=''                                 /*ª* ' or " when in a string    */
Do ri=1 By 1 While lines(fid)>0        /*ª* loop over input            */
l=linein(fid)                        /*ª* an input line              */
oc=''                                /*ª* initialize line for oc.txt */
op=''                                /*ª* initialize line for op.txt */
i=1                                  /*ª* start at first character   */
Do While i<=length(l)                /*ª* loop through input line    */
If cmt=0 Then Do                   /*ª* we are not in a comment    */
If str<>'' Then Do               /*ª* we are in a string         */
If substr(l,i,1)=str Then Do   /*ª* string character           */
If substr(l,i+1,1)=str Then Do /*ª* another one              */
Call app 'P',substr(l,i,2) /*ª* add '' or "" to op         */
i=i+2                      /*ª* increase input pointer     */
Iterate                    /*ª* proceed in input line      */
End
Else Do                      /*ª* end of literal string      */
Call app 'P',substr(l,i,1) /*ª* add ' or " to op           */
str=' '                    /*ª* no longer in string        */
i=i+1                      /*ª* increase input pointer     */
Iterate                    /*ª* proceed in input line      */
End
End
End
End
Select
When str='' &,                   /*ª* not in a string            */
substr(l,i,2)='/*ª*§ Ôèåî Äï  /*ª óôáòô ïæ ãïííåîô           */
cmt=cmt+1                      /*ª* increase commenr nesting   */
Call app 'C','/*ª*'              /*ª* copy to oc                 */
i=i+2                          /*ª* increase input pointer     */
End
When cmt=0 Then Do               /*ª* not in a comment           */
If str=' ' Then Do             /*ª* not in a string            */
If pos(substr(l,i,1),'''"')>0 Then /*ª* string delimiter     */
str=substr(l,i,1)          /*ª* remember that              */
End
Call app 'P',substr(l,i,1)     /*ª* copy to op                 */
i=i+1                          /*ª* increase input pointer     */
End
When substr(l,i,2)='*/' Then Do  /*ª* end of comment             */
cmt=cmt-1                      /*ª* decrement nesting depth    */
Call app 'C','*/'              /*ª* copy to oc                 */
i=i+2                          /*ª* increase input pointer     */
End
Otherwise Do                     /*ª* any other character        */
Call app 'C',substr(l,i,1)     /*ª* copy to oc                 */
i=i+1                          /*ª* increase input pointer     */
End
End
End
Call oc                              /*ª* Write line oc              */
Call op                              /*ª* Write line op              */
End
Call lineout oic                       /*ª* Close File oic             */
Call lineout oip                       /*ª* Close File oip             */

Do ri=1 To ri-1                        /*ª* merge program with comments*/
op=linein(oip)
oc=linein(oic)
Do i=1 To length(oc)
If substr(oc,i,1)<>'' Then
op=overlay(substr(oc,i,1),op,i,1)
End
Call lineout oim,op
End
Call lineout oic
Call lineout oip
Call lineout oim
Exit

app: Parse Arg which,string
/*ª* add str to oc or op                                               */
/*ª* and corresponding blanks to the other (op or oc)                  */
If which='C' Then Do
oc=oc||string
op=op||copies(' ',length(string))
End
Else Do
op=op||string
oc=oc||copies(' ',length(string))
End
Return

oc: Return lineout(oic,oc)
op: Return lineout(oip,op)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Strip-block-comments\strip-block-comments.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
