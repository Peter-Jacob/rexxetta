/*�*REXX program  demonstrates  Soundex codes  from some words  or  from the command line.*/
newV3=;   newV1.=                                        /*�*set a couple of vars to "null".*/
parse arg newV1.0 .                                  /*�*allow input from command line. */
newV1.1   = "12346"         ;        newV2.1   = '0000'
newV1.4   = "4-H"           ;        newV2.4   = 'H000'
newV1.11  = "Ashcraft"      ;        newV2.11  = 'A261'
newV1.12  = "Ashcroft"      ;        newV2.12  = 'A261'
newV1.18  = "auerbach"      ;        newV2.18  = 'A612'
newV1.20  = "Baragwanath"   ;        newV2.20  = 'B625'
newV1.22  = "bar"           ;        newV2.22  = 'B600'
newV1.23  = "barre"         ;        newV2.23  = 'B600'
newV1.20  = "Baragwanath"   ;        newV2.20  = 'B625'
newV1.28  = "Burroughs"     ;        newV2.28  = 'B620'
newV1.29  = "Burrows"       ;        newV2.29  = 'B620'
newV1.30  = "C.I.A."        ;        newV2.30  = 'C000'
newV1.37  = "coöp"          ;        newV2.37  = 'C100'
newV1.43  = "D-day"         ;        newV2.43  = 'D000'
newV1.44  = "d jay"         ;        newV2.44  = 'D200'
newV1.45  = "de la Rosa"    ;        newV2.45  = 'D462'
newV1.46  = "Donnell"       ;        newV2.46  = 'D540'
newV1.47  = "Dracula"       ;        newV2.47  = 'D624'
newV1.48  = "Drakula"       ;        newV2.48  = 'D624'
newV1.49  = "Du Pont"       ;        newV2.49  = 'D153'
newV1.50  = "Ekzampul"      ;        newV2.50  = 'E251'
newV1.51  = "example"       ;        newV2.51  = 'E251'
newV1.55  = "Ellery"        ;        newV2.55  = 'E460'
newV1.59  = "Euler"         ;        newV2.59  = 'E460'
newV1.60  = "F.B.I."        ;        newV2.60  = 'F000'
newV1.70  = "Gauss"         ;        newV2.70  = 'G200'
newV1.71  = "Ghosh"         ;        newV2.71  = 'G200'
newV1.72  = "Gutierrez"     ;        newV2.72  = 'G362'
newV1.80  = "he"            ;        newV2.80  = 'H000'
newV1.81  = "Heilbronn"     ;        newV2.81  = 'H416'
newV1.84  = "Hilbert"       ;        newV2.84  = 'H416'
newV1.100 = "Jackson"       ;        newV2.100 = 'J250'
newV1.104 = "Johnny"        ;        newV2.104 = 'J500'
newV1.105 = "Jonny"         ;        newV2.105 = 'J500'
newV1.110 = "Kant"          ;        newV2.110 = 'K530'
newV1.116 = "Knuth"         ;        newV2.116 = 'K530'
newV1.120 = "Ladd"          ;        newV2.120 = 'L300'
newV1.124 = "Llyod"         ;        newV2.124 = 'L300'
newV1.125 = "Lee"           ;        newV2.125 = 'L000'
newV1.126 = "Lissajous"     ;        newV2.126 = 'L222'
newV1.128 = "Lukasiewicz"   ;        newV2.128 = 'L222'
newV1.130 = "naïve"         ;        newV2.130 = 'N100'
newV1.141 = "Miller"        ;        newV2.141 = 'M460'
newV1.143 = "Moses"         ;        newV2.143 = 'M220'
newV1.146 = "Moskowitz"     ;        newV2.146 = 'M232'
newV1.147 = "Moskovitz"     ;        newV2.147 = 'M213'
newV1.150 = "O'Conner"      ;        newV2.150 = 'O256'
newV1.151 = "O'Connor"      ;        newV2.151 = 'O256'
newV1.152 = "O'Hara"        ;        newV2.152 = 'O600'
newV1.153 = "O'Mally"       ;        newV2.153 = 'O540'
newV1.161 = "Peters"        ;        newV2.161 = 'P362'
newV1.162 = "Peterson"      ;        newV2.162 = 'P362'
newV1.165 = "Pfister"       ;        newV2.165 = 'P236'
newV1.180 = "R2-D2"         ;        newV2.180 = 'R300'
newV1.182 = "rÄ≈sumÅ∙"      ;        newV2.182 = 'R250'
newV1.184 = "Robert"        ;        newV2.184 = 'R163'
newV1.185 = "Rupert"        ;        newV2.185 = 'R163'
newV1.187 = "Rubin"         ;        newV2.187 = 'R150'
newV1.191 = "Soundex"       ;        newV2.191 = 'S532'
newV1.192 = "sownteks"      ;        newV2.192 = 'S532'
newV1.199 = "Swhgler"       ;        newV2.199 = 'S460'
newV1.202 = "'til"          ;        newV2.202 = 'T400'
newV1.208 = "Tymczak"       ;        newV2.208 = 'T522'
newV1.216 = "Uhrbach"       ;        newV2.216 = 'U612'
newV1.221 = "Van de Graaff" ;        newV2.221 = 'V532'
newV1.222 = "VanDeusen"     ;        newV2.222 = 'V532'
newV1.230 = "Washington"    ;        newV2.230 = 'W252'
newV1.233 = "Wheaton"       ;        newV2.233 = 'W350'
newV1.234 = "Williams"      ;        newV2.234 = 'W452'
newV1.236 = "Woolcock"      ;        newV2.236 = 'W422'

do k=0  for 300;     if newV1.k==''  then iterate;        newV4=soundex(newV1.k)
say word('nope [ok]', 1 +(newV4==newV2.k | k==0))   newV3   newV4   "is the Soundex for"   newV1.k
if k==0  then leave
end   /*�*k*/
exit                                                   /*�*stick a fork in it, we're done.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
soundex: procedure;     arg x                             /*�*ARG uppercases the var   X. */
oldnewV3alphabet= 'AEIOUYHWBFPVCGJKQSXZDTLMNR'
newnewV3alphabet= '@@@@@@**111122222222334556'
word=                                            /*�* [+]  exclude  non-letters. */
do i=1  for length(x);  newV3=substr(x, i, 1) /*�*obtain a character from word*/
if datatype(newV3,'M')  then word=word || newV3   /*�*Upper/lower letter?  Then OK*/
end   /*�*i*/

value=strip(left(word, 1))                       /*�*1st character is left alone.*/
word=translate(word, newnewV3alphabet, oldnewV3alphabet) /*�*define the current  word.   */
prev=translate(value,newnewV3alphabet, oldnewV3alphabet) /*�*   "    "  previous   "     */

do j=2  to length(word)                        /*�*process remainder of word.  */
newV5=substr(word, j, 1)
if newV5\==prev & datatype(newV5,'W')  then do;  value=value || newV5;  prev=newV5;  end
else if newV5=='@'  then prev=newV5
end   /*�*j*/

return left(value,4,0)                           /*�*padded value with zeroes.   */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Soundex\soundex.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
