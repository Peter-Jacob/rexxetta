/*ª*REXX pgm displays if a filename has a known extension  (as per a list of extensions). */
newV3= 'zip rar 7z gz archive A## tar.bz2';  upper newV3 /*ª*a list of "allowable" file extensions*/
parse arg fn                                     /*ª*obtain optional argument from the CL.*/
newV1.=                                              /*ª*define the default for the  @. array.*/
if fn\=''  then       newV1.1 =  strip(fn)           /*ª*A filename specified?   Then use it. */
else do;   newV1.1 = "MyData.a##"         /*ª*No    "        "        Else use list*/
newV1.2 = "MyData.tar.Gz"
newV1.3 = "MyData.gzip"
newV1.4 = "MyData.7z.backup"
newV1.5 = "MyData..."
newV1.6 = "MyData"
newV1.7 = "MyData_v1.0.tar.bz2"
newV1.8 = "MyData_v1.0.bz2"
end
newV4= words(newV3)

do j=1  while newV1.j\=='';   newV2= newV1.j;   upper newV2  /*ª*traipse through @ file extension list*/
do k=1  for newV4  until right(newV2, L)==x       /*ª*Search $ list, is extension in list? */
x= . || word(newV3, k);  L=length(x)           /*ª*construct the extension of the file. */
end   /*ª*k*/                                /*ª* [â†“]  display file, and a nay or yea.*/
say  right(newV1.j, 40)     ' '      right( word( "false true",  1 + (k<=newV4) ),  5)
end       /*ª*j*/                                /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\File-extension-is-in-extensions-list\file-extension-is-in-extensions-list.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
