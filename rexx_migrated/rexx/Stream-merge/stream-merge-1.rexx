/*ª* REXX ***************************************************************
* Merge 1.txt ... n.txt into all.txt
* 1.txt 2.txt 3.txt 4.txt
* 1     19    1999  2e3
* 17    33    2999  3000
* 8     500   3999              RC task STREAM MERGE
**********************************************************************/
done.=0                         /*ª* done.i=1 indicates file exhausted */
p.=''                                  /*ª* for test of sort error     */
Do i=1 By 1                            /*ª* check files for existence  */
f.i=i'.txt'
If lines(f.i)=0 Then Leave
Call get i                           /*ª* and read first line of each*/
End
n=i-1                                  /*ª* we have n input files      */
done.0=n                               /*ª* and all must be used       */
say n 'Input files'
oid='all.txt'
If lines(oid)>0 Then Do                /*ª* output file exists         */
Call lineout oid
Do Until wordpos(answer,'Y N')>0
Say 'file' oid 'exists. May it be replaced?'
Pull answer
End
If answer='Y' Then
'erase' oid
Else Do
Say 'Ok, we give up'
Exit
End
End
say oid 'is the output file'           /*ª* we'll create it now        */
Do Until done.0=0
imin=0                               /*ª* index of next source       */
Do i=1 To n
If done.i=0 Then Do                /*ª* file i still in use        */
If imin=0 Then Do                /*ª* it's the first in this loop*/
imin=i                         /*ª* next source                */
min=x.i                        /*ª* element to be used         */
End
Else Do                          /*ª* not the first              */
If x.i<<min Then Do            /*ª* avoid numerical comparison */
imin=i                       /*ª* next source                */
min=x.i                      /*ª* element to be used         */
End
End
End
End
If imin<>0 Then Do                   /*ª* found next source          */
Call o x.imin                      /*ª* use its element            */
Call get imin                      /*ª* get next element           */
/*ª* or set done.imin           */
End
Else                                 /*ª* no more elements           */
Call lineout oid                   /*ª* close output file          */
End
'type' oid
Exit

get: Procedure Expose f. x. p. done.
/*ª*********************************************************************
* Get next element from file ii or set done.ii=1 if file is exhausted
*********************************************************************/
Parse Arg ii
If lines(f.ii)=0 Then Do             /*ª* file ii is exhausted      */
done.ii=1                          /*ª* mark it as done           */
done.0=done.0-1                    /*ª* reduce number of files tbd*/
End
Else Do                              /*ª* there's more in file ii   */
x.ii=linein(f.ii)                  /*ª* get next element (line)   */
If x.ii<<p.ii Then Do              /*ª* smaller than previous     */
Say 'Input file' f.ii 'is not sorted ascendingly'
Say p.ii 'precedes' x.ii         /*ª* tell the user             */
Exit                             /*ª* and give up               */
End
p.ii=x.ii                          /*ª* remember the element      */
End
Return

o: Return lineout(oid,arg(1))
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Stream-merge\stream-merge-1.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
