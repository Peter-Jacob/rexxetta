/*ͺ*REXX program implements & demonstrates a substitution cipher for the records in a file*/
parse arg fid.1 fid.2 fid.3 fid.4 .              /*ͺ*obtain optional arguments from the CL*/
if fid.1==''  then fid.1= "CIPHER.IN"            /*ͺ*Not specified?  Then use the default.*/
if fid.2==''  then fid.2= "CIPHER.OUT"           /*ͺ* "      "         "   "   "     "    */
if fid.3==''  then fid.3= "CIPHER.KEY"           /*ͺ* "      "         "   "   "     "    */
if fid.4==''  then fid.4= "CIPHER.ORI"           /*ͺ* "      "         "   "   "     "    */
say '    input file: '   fid.1                   /*ͺ*display the fileID used for  input.  */
say '   output file: '   fid.2                   /*ͺ*   "     "     "     "   "  output.  */
say '   cipher file: '   fid.3                   /*ͺ*   "     "     "     "   " cipher-key*/
say 'decrypted file: '   fid.4                   /*ͺ*   "     "     "     "   "  decrypted*/
call closer                                      /*ͺ*close all files in case they're open.*/
do c=1  while lines(fid.3)\==0        /*ͺ*read (hopefully 2 records) from key. */
newV3.c= space( linein(fid.3), 0)         /*ͺ*assign input record to an  @.  array.*/
end   /*ͺ*c*/
c= c - 1                                         /*ͺ*adjust the number of records (for DO)*/
if c==0                       then call ser fid.3,  'not found or is empty.'
if c>2                        then call ser fid.3,  'has too many records  (>2).'
if c<2                        then call ser fid.3,  'has too few records   (<2).'
if length(newV3.1)\==length(newV3.2)  then call ser fid.3,  'has unequal length records.'
call encrypt  fid.1, fid.2                       /*ͺ*encrypt the input file  ββββΊ  output.*/
newV4=newV3.1;    newV3.1=newV3.2;   newV3.2=newV4                       /*ͺ*switch the cipher keys for decryption*/
call encrypt  fid.2, fid.4                       /*ͺ*decrypt the output file ββββΊ decrypt.*/
call show     'cipher file ('fid.3")" , fid.3    /*ͺ*display the cipherβkey file.         */
call show      'input file ('fid.1")" , fid.1    /*ͺ*   "     "     input     "           */
call show     'output file ('fid.2")" , fid.2    /*ͺ*   "     "    output     "           */
call show ' decrypted file ('fid.4")" , fid.4    /*ͺ*   "     "   decrypted   "           */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
closer:  do f=1  for 4;   call lineout fid.f;    end  /*ͺ*f*/;            say;      return
ser:     say  '***error!***  file '     arg(1)" "    arg(2);                      exit
show:    say;   say center( arg(1), 79, 'β');        "TYPE"  arg(2);              return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
encrypt: parse arg newV2,newV1                      /*ͺ* [β] effectively deletes @out file by*/
call lineout newV1,,1                    /*ͺ*setting pointer to rec#1 for the file*/
do j=0  while lines(newV2)\==0       /*ͺ*read the input file*/
call lineout newV1, translate( linein(newV2), newV3.2, newV3.1)
end   /*ͺ*j*/
if j==0  then call ser newV2, 'is empty.' /*ͺ*was the file not found or was empty? */
say newV2  ' records processed: '   j     /*ͺ*show the number of records processed.*/
call closer                             /*ͺ*close all the files to be neat & safe*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Substitution-cipher\substitution-cipher.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
