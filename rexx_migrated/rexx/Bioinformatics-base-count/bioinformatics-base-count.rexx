/*ª*REXX program finds the number of each base in a DNA  string          */
/*ª*                                         (along with a total).       */
Parse Arg dna .
If dna==''|dna==',' Then
dna='cgtaaaaaattacaacgtcctttggctatctcttaaactcctgctaaatg',
'ctcgtgctttccaattatgtaagcgttccgagacggggtggtcgattctg',
'aggacaaaggtcaagatggagcgcatcgaacgcaataaggatcatttgat',
'gggacgtttcgtcgacaaagtcttgtttcgagagtaacggctaccgtctt',
'cgattctgcttataacactatgttcttatgaaatggatgttctgagttgg',
'tcagtcccaatgtgcggggtttcttttagtacgtcgggagtggtattata',
'tttaatttttctatatagcgatctgtatttaagcaattcatttaggttat',
'cgccgcgatgctcggttcggaccgccaagcatctggctccactgctagtg',
'tcctaaatttgaatggcaaacacaaataagatttagcaattcgtgtagac',
'gaccggggacttgcatgatgggagcagctttgttaaactacgaacgtaat'
dna=translate(space(dna,0))          /*ª* elide blanks from DNA; uppercas*/
Say '--------length of the DNA string: ' length(dna)
count.=0                          /*ª* initialize the count for all bases*/
w=1                               /*ª* the maximum width of a base count */
names=''                          /*ª* list of all names                 */
Do j=1 To length(dna)             /*ª* traipse through the  DNA  string  */
name=substr(dna,j,1)            /*ª* obtain a base name from the DNA   */
If pos(name,names)==0 Then
names=names||name             /*ª* if not found, add it to the list  */
count.name=count.name+1         /*ª* bump the count of this base.      */
w=max(w,length(count.name))     /*ª* compute the maximum number width  */
End
Say
Do k=0 To 255
z=d2c(k)                        /*ª* traipse through all possibilities */
If pos(z,names)>0 Then Do
Say '     base ' z ' has a basecount of: ' right(count.z,w)
count.tot=count.tot+count.z   /*ª* add to a grand total to verify    */
End
End
Say
Say '--------total for all basecounts:' right(count.tot,w+1)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Bioinformatics-base-count\bioinformatics-base-count.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
