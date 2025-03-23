/*ª*REXX program   reads  and  displays  a  count  of words a file.  Word case is ignored.*/
Call time 'R'
abc='abcdefghijklmnopqrstuvwxyz'
abcABC=abc||translate(abc)
parse arg fID_top                                /*ª*obtain optional arguments from the CL*/
Parse Var fid_top fid ',' top
if fID=='' then fID= 'mis.TXT'                   /*ª* Use default if not specified        */
if top=='' then top= 10                          /*ª* Use default if not specified        */
occ.=0                                           /*ª* occurrences of word (stem) in file  */
wn=0
Do While lines(fid)>0                            /*ª*loop whilst there are lines in file. */
line=linein(fID)
line=translate(line,abc||abc,abcABC||xrange('00'x,'ff'x)) /*ª*use only lowercase letters*/
Do While line<>''
Parse Var line word line                       /*ª* take a word                         */
If occ.word=0 Then Do                          /*ª* not yet in word list                */
wn=wn+1
word.wn=word
End
occ.word=occ.word+1
End
End
Say 'We found' wn 'different words'
say right('word',40) ' rank   count '            /*ª* header                              */
say right('----',40) '------ -------'            /*ª* separator.                          */
tops=0
Do Until tops>=top | tops>=wn                    /*ª*process enough words to satisfy  TOP.*/
max_occ=0
tl=''                                          /*ª*initialize (possibly) a list of words*/
Do wi=1 To wn                                  /*ª*process the list of words in the file*/
word=word.wi                                 /*ª* take a word from the list           */
Select
When occ.word>max_occ Then Do              /*ª* most occurrences so far             */
tl=word                                  /*ª* candidate for output                */
max_occ=occ.word                         /*ª* current maximum occurrences         */
End
When occ.word=max_occ Then Do              /*ª* tied                                */
tl=tl word                               /*ª* add to output candidate             */
End
Otherwise                                  /*ª* no candidate (yet)                  */
Nop
End
End
do d=1 for words(tl)
word=word(tl,d)
say right(word,40) right(tops+1,4) right(occ.word,8)
occ.word=0                                /*ª*nullify this word count for next time*/
End
tops=tops+words(tl)                         /*ª*correctly handle the tied rankings.  */
end
Say time('E') 'seconds elapsed'
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Word-frequency\word-frequency-2.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
