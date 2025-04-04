/*ช*REXX program demonstrates how to  update  a configuration file  (four specific tasks).*/
parse arg iFID oFID .                            /*ช*obtain optional arguments from the CL*/
if iFID=='' | iFID==","  then iFID=      'UPDATECF.TXT'  /*ช*Not given?  Then use default.*/
if oFID=='' | oFID==","  then oFID='\TEMP\UPDATECF.$$$'  /*ช* "    "       "   "     "    */
call lineout iFID;  call lineout oFID            /*ช*close the input and the output files.*/
newV1.=0                                             /*ช*placeholder of the options detected. */
call dos  'ERASE'  oFID                          /*ช*erase a file (with no error message).*/
changed=0                                        /*ช*nothing changed in the file (so far).*/
/*ช* [โ]  read the entire  config  file. */
do rec=0  while lines(iFID)\==0                /*ช*read a record; bump the record count.*/
z=linein(iFID);          zz=space(z)           /*ช*get record;  elide extraneous blanks.*/
say 'โโโโโโโโโ record:'  z                     /*ช*echo the record just read โโโบ console*/
a=left(zz,1);  newV2=space( translate(zz, ,';') )  /*ช*_:  is used to elide multiple  ";"   */
if zz=='' | a=='#'  then do; call cpy z; iterate; end            /*ช*blank or a comment.*/
if newV2==''  then do; changed=1; iterate; end     /*ช*elide any semicolons;  empty records.*/
parse upper var z op .                         /*ช*obtain the option from the record.   */
/*ช* [โ]   option may have leading or ยทยทยท*/
if a==';'  then do;   parse upper var z 2 op .                      /*ช*trailing blanks.*/
if op='SEEDSREMOVED'  then call new space( substr(z, 2) )
call cpy z;  newV1.op=1            /*ช*write the Z record to the output file*/
iterate  /*ช*rec*/               /*ช* ยทยทยท and then go read the next record*/
end
if newV1.op  then do;  changed=1;  iterate;  end   /*ช*is the  option  already defined?     */
newV1.op=1                                         /*ช* [โ]  Yes?   Then delete it.         */
if op=='NEEDSPEELING'          then call new  ";"    z
if op=='NUMBEROFBANANAS'       then call new  op  1024
if op=='NUMBEROFSTRAWBERRIES'  then call new  op  62000
call cpy z                                     /*ช*write the Z record to the output file*/
end   /*ช*rec*/

nos='NUMBEROFSTRAWBERRIES'                  /*ช* [โ]  Does NOS option need updating? */
if \newV1.nos   then do;  call new nos 62000;  call cpy z;  end             /*ช*update option.*/
call lineout iFID;    call lineout oFID          /*ช*close the input and the output files.*/
if rec==0   then do;  say "ERROR:  input file wasn't found:"  iFID;  exit;  end
if changed  then do                              /*ช*possibly overwrite the input file.   */
call dos 'XCOPY' oFID iFID '/y /q',">nul"                     /*ช*quietly*/
say;   say center('output file', 79, "โ")                     /*ช*title. */
call dos 'TYPE'  oFID           /*ช*display content of the output file.  */
end
call dos 'ERASE'  oFID                           /*ช*erase a file (with no error message).*/
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
cpy:  call lineout oFID, arg(1);        return   /*ช*write one line of text โโโโบ oFID.    */
dos:  ''arg(1) word(arg(2) "2>nul",1);  return   /*ช*execute a  DOS  command  (quietly).  */
new:  z=arg(1);    changed=1;           return   /*ช*use new Z, indicate changed record.  */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Update-a-configuration-file\update-a-configuration-file-1.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
