/*�*REXX program validates a user  "word"  against a  "command table"  with abbreviations.*/
parse arg uw                                     /*�*obtain optional arguments from the CL*/
if uw=''  then uw= 'riG   rePEAT copies  put mo   rest    types   fup.    6       poweRin'
say 'user words: '   uw

newV1= 'add 1  alter 3  backup 2  bottom 1  Cappend 2  change 1  Schange  Cinsert 2  Clast 3',
'compress 4 copy 2 count 3 Coverlay 3 cursor 3  delete 3 Cdelete 2  down 1  duplicate',
'3 xEdit 1 expand 3 extract 3  find 1 Nfind 2 Nfindup 6 NfUP 3 Cfind 2 findUP 3 fUP 2',
'forward 2  get  help 1 hexType 4  input 1 powerInput 3  join 1 split 2 spltJOIN load',
'locate 1 Clocate 2 lowerCase 3 upperCase 3 Lprefix 2  macro  merge 2 modify 3 move 2',
'msg  next 1 overlay 1 parse preserve 4 purge 3 put putD query 1 quit  read recover 3',
'refresh renum 3 repeat 3 replace 1 Creplace 2 reset 3 restore 4 rgtLEFT right 2 left',
'2  save  set  shift 2  si  sort  sos  stack 3 status 4 top  transfer 3  type 1  up 1'

say 'full words: '   validate(uw)                /*�*display the result(s) to the terminal*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
validate: procedure expose newV1;  arg x;  upper newV1   /*�*ARG   capitalizes all the  X  words. */
newV2=                                     /*�*initialize the return string to null.*/
do j=1  to words(x);   newV3=word(x, j) /*�*obtain a word from the     X  list.  */
do k=1  to words(newV1); a=word(newV1, k) /*�*get a legitmate command name from  @.*/
L=word(newV1, k+1)                    /*�*··· and maybe get it's abbrev length.*/
if datatype(L, 'W')  then k=k + 1       /*�*yuppers, it's an abbrev length.*/
else L=length(a)   /*�*nope,  it can't be abbreviated.*/
if abbrev(a, newV3, L)   then do; newV2=newV2 a;  iterate j;  end  /*�*is valid abbrev?*/
end   /*�*k*/
newV2=newV2 '*error*'                       /*�*processed the whole list, not valid. */
end     /*�*j*/
return strip(newV2)                        /*�*elide the superfluous leading blank. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Abbreviations-simple\abbreviations-simple.rexx was migrated on 23 Mar 2025 at 10:43:04
 * -------------------------------------------------------------------------
*/ 
