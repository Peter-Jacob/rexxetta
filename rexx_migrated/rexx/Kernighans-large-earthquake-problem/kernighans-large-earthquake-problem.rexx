/*ª*REXX program to read a file containing a list of earthquakes:   date, site, magnitude.*/
parse arg iFID mMag .                            /*ª*obtain optional arguments from the CL*/
if iFID=='' | iFID==","  then iFID= 'earthquakes.dat' /*ª*Not specified?  Then use default*/
if mMag=='' | mMag==","  then mMag= 6                 /*ª* "      "         "   "     "   */
newV1=0                                              /*ª*# of earthquakes that meet criteria. */
do j=0  while lines(iFID)\==0                 /*ª*read all lines in the input file.    */
if j==0  then say 'Reading from file: ' iFID  /*ª*show the name of the file being read.*/
parse value linein(iFID) with date site mag . /*ª*parse three words from an input line.*/
if mag<=mMag  then iterate                    /*ª*Is the quake too small?  Then skip it*/
newV1= newV1 + 1;     if j==0  then say               /*ª*bump the number of qualifying quakes.*/
if newV1==1  then say center('date', 20, "â•")     '=magnitude='     center("site", 20, 'â•')
say               center(date, 20)      center(mag/1, 11)   '  '        site
end   /*ª*j*/                                   /*ª*stick a fork in it,  we're all done. */
say
say
if j\==0  then say j  'records read from file: ' iFID
say
if j==0  then say er 'file    '          iFID           "   is empty or not found."
else say newV1  ' earthquakes listed whose magnitude is  â‰¥ ' mMag
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Kernighans-large-earthquake-problem\kernighans-large-earthquake-problem.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
