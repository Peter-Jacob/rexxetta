/*ª*REXX program calculates the total area of  (possibly overlapping)  circles.           */
parse arg box dig .                              /*ª*obtain optional argument from the CL.*/
if box=='' | box==','  then box= -500            /*ª*Not specified?  Then use the default.*/
if dig=='' | dig==','  then dig=   12            /*ª* "      "         "   "   "     "    */
verbose= box<0;    box= abs(box);  boxen= box+1  /*ª*set a flag if we're in verbose mode. */
numeric digits dig                               /*ª*have enough decimal digits for points*/
/*ª* â•â•â•â•â•â•xâ•â•â•â•â•â• â•â•â•â•â•â•yâ•â•â•â•â•â• â•â•â•radiusâ•â•â•     â•â•â•â•â•â•xâ•â•â•â•â•â• â•â•â•â•â•â•yâ•â•â•â•â•â• â•â•â•radiusâ•â•â•*/
newV6=' 1.6417233788  1.6121789534 0.0848270516     -1.4944608174  1.2077959613 1.1039549836',
' 0.6110294452 -0.6907087527 0.9089162485      0.3844862411  0.2923344616 0.2375743054',
'-0.2495892950 -0.3832854473 1.0845181219      1.7813504266  1.6178237031 0.8162655711',
'-0.1985249206 -0.8343333301 0.0538864941     -1.7011985145 -0.1263820964 0.4776976918',
'-0.4319462812  1.4104420482 0.7886291537      0.2178372997 -0.9499557344 0.0357871187',
'-0.6294854565 -1.3078893852 0.7653357688      1.7952608455  0.6281269104 0.2727652452',
' 1.4168575317  1.0683357171 1.1016025378      1.4637371396  0.9463877418 1.1846214562',
'-0.5263668798  1.7315156631 1.4428514068     -1.2197352481  0.9144146579 1.0727263474',
'-0.1389358881  0.1092805780 0.7350208828      1.5293954595  0.0030278255 1.2472867347',
'-0.5258728625  1.3782633069 1.3495508831     -0.1403562064  0.2437382535 1.3804956588',
' 0.8055826339 -0.0482092025 0.3327165165     -0.6311979224  0.7184578971 0.2491045282',
' 1.4685857879 -0.8347049536 1.3670667538     -0.6855727502  1.6465021616 1.0593087096',
' 0.0152957411  0.0638919221 0.9771215985 '         /*ª*define circles with X, Y, and R.*/

circles= words(newV6) % 3                                 /*ª*figure out how many circles.    */
if verbose  then say 'There are'  circles  "circles." /*ª*display the number of circles.  */
parse var  newV6   minX minY . 1 maxX maxY .              /*ª*assign minimum & maximum values.*/

do j=1  for circles;   newV7= j * 3   -   2    /*ª*assign some circles with datum. */
newV2.j= word(newV6, newV7);      newV3.j=word(newV6, newV7 + 1)
newV4.j=word(newV6, newV7 + 2) / 1;         newV1.j= newV4.j **2
minX= min(minX, newV2.j - newV4.j);           maxX= max(maxX, newV2.j + newV4.j)
minY= min(minY, newV3.j - newV4.j);           maxY= max(maxY, newV3.j + newV4.j)
end   /*ª*j*/

do   m=1    for circles                             /*ª*sort the circles by their radii.*/
do n=m+1  to  circles                             /*ª* [â†“]  sort by  descending radii.*/
if newV4.n>newV4.m then parse  value  newV2.n newV3.n newV4.n   newV2.m newV3.m newV4.m  with,
newV2.m newV3.m newV4.m   newV2.n newV3.n newV4.n
end   /*ª*n*/                                       /*ª* [â†‘]   Is it higher?  Then swap.*/
end     /*ª*m*/

dx= (maxX-minX) / box;        dy= (maxY-minY) / box   /*ª*compute the  DX  and  DY  values*/
do z=0  for boxen;       rowDY.z= z * dy;         colDX.z= z * dx
end   /*ª*z*/
w= length(circles)                                    /*ª*W:   used for aligning output.  */
newV5= 0                                                /*ª*#in â—„â”€â”€â”€fully contained circles.*/
do     j=1  for circles                        /*ª*traipse through all the circles.*/
do k=1  for circles;   if k==j | newV4.j==0   then iterate     /*ª*skip oneself.  */
if  newV3.j+newV4.j > newV3.k+newV4.k  |  newV2.j-newV4.j < newV2.k-newV4.k |,      /*ª*is J inside K? */
newV3.j-newV4.j < newV3.k-newV4.k  |  newV2.j+newV4.j > newV2.k+newV4.k   then iterate
if verbose  then say 'Circle ' right(j,w) ' is contained in circle ' right(k,w)
newV4.j= 0;             newV5= newV5 + 1          /*ª*elide this circle; and bump #in.*/
end   /*ª*k*/
end       /*ª*j*/                                /*ª* [â†‘]  elided overlapping circle.*/

if newV5==0   then newV5= 'no'                            /*ª*use gooder English.  (humor).   */
if verbose  then do; say; say newV5 " circles are fully contained within other circles.";end
nC= 0                                                 /*ª*number of  "new"  circles.      */
do n=1  for circles;  if newV4.n==0  then iterate /*ª*skip circles with zero radii.   */
nC= nC + 1;     newV2.nC= newV2.n;      newV3.nC= newV3.n;      newV4.nC= newV4.n;    newV1.nC= newV4.n**2
end   /*ª*n*/                                    /*ª* [â†‘]  elide overlapping circles.*/
newV8= 0                                                  /*ª*count of sample points (so far).*/
do   row=0  for boxen;    y= minY + rowDY.row  /*ª*process each of the grid row.   */
do col=0  for boxen;    x= minX + colDX.col  /*ª*   "      "   "  "    "  column.*/
do k=1  for nC                             /*ª*now process each new circle.    */
if (x - newV2.k)**2 + (y - newV3.k)**2 <= newV1.k  then  do;   newV8= newV8 + 1;   leave;   end
end   /*ª*k*/
end     /*ª*col*/
end       /*ª*row*/
say                                                   /*ª*stick a fork in it, we're done. */
say 'Using ' box  " boxes (which have "  box**2  ' points)  and '  dig  " decimal digits,"
say 'the approximate area is: '    newV8 * dx * dy
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Total-circles-area\total-circles-area-2.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
