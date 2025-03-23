/*ª*REXX pgm gens X & Y coÃ¶rdinates for a scatter plot to be used to show a Barnsley fern.*/
parse arg N FID seed .                           /*ª*obtain optional arguments from the CL*/
if   N=='' |   N==","  then   N= 100000          /*ª*Not specified?   Then use the default*/
if FID=='' | FID==","  then FID= 'BARNSLEY.DAT'  /*ª* "      "          "   "   "     "   */
if datatype(seed,'W')  then call random ,,seed   /*ª*if specified, then use random seed.  */
call lineout FID, , 1                            /*ª*just set the file ptr to the 1st line*/
x=0                                              /*ª*set the initial value for  X  coÃ¶rd. */
y=0                                              /*ª* "   "     "      "    "   Y    "    */
do newV1=1  for N                                /*ª*generate   N   number of plot points.*/
newV2=random(, 100)                              /*ª*generate a random number: 0 â‰¤ ? â‰¤ 100*/
select
when newV2==0  then do;   xx=   0           ;    yy=            .16*y         ;     end
when newV2< 8  then do;   xx=  .2 *x - .26*y;    yy=  .23*x  +  .22*y  +  1.6 ;     end
when newV2<15  then do;   xx= -.15*x + .28*y;    yy=  .26*x  +  .24*y  +   .44;     end
otherwise             xx=  .85*x + .04*y;    yy= -.04*x  +  .85*y  +  1.6
end   /*ª*select*/
x=xx;                     y=yy
if newV1==1  then  do;    minx= x;  maxx= x;        miny= y;  maxy= y
end
minx= min(minx, x);       miny= min(miny, y)
maxx= max(maxx, x);       maxy= max(maxy, y)
call lineout FID, x","y
end      /*ª*#*/                               /*ª* [â†“]  close the file (safe practice).*/
call lineout FID                                 /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Barnsley-fern\barnsley-fern.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
