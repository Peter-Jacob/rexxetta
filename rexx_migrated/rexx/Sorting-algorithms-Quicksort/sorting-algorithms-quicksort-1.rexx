/*�*REXX program  sorts  a  stemmed array  using the   quicksort  algorithm.              */
call gen@                                        /*�*generate the elements for the array. */
call show@   'before sort'                       /*�*show  the  before   array elements.  */
call qSort       newV5                               /*�*invoke the  quicksort  subroutine.   */
call show@   ' after sort'                       /*�*show  the   after   array elements.  */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
inOrder: parse arg n; do j=1  for n-1;  k= j+1;  if newV1.j>newV1.k  then return 0; end;  return 1
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
qSort: procedure expose newV1.; a.1=1; parse arg b.1;  newV2= 1 /*�*access @.; get @. size; pivot.*/
if inOrder(b.1)  then return                     /*�*Array already in order? Return*/
do  while  newV2\==0;   L= a.newV2;    t= b.newV2;    newV2= newV2 - 1;    if t<2  then iterate
H= L + t - 1;    newV3= L  +  t % 2
if newV1.H<newV1.L  then if newV1.newV3<newV1.H  then do;  p= newV1.H;  newV1.H= newV1.L;  end
else if newV1.newV3>newV1.L  then     p= newV1.L
else do; p= newV1.newV3; newV1.newV3= newV1.L;  end
else if newV1.newV3<newV1.L  then p=newV1.L
else if newV1.newV3>newV1.H  then do; p= newV1.H; newV1.H= newV1.L;  end
else do; p= newV1.newV3; newV1.newV3= newV1.L;  end
j= L+1;                            k= h
do forever
do j=j         while j<=k & newV1.j<=p;  end    /*�*a teeny─tiny loop.*/
do k=k  by -1  while j< k & newV1.k>=p;  end    /*�*another   "    "  */
if j>=k  then leave                             /*�*segment finished? */
newV4= newV1.j;   newV1.j= newV1.k;   newV1.k= newV4                    /*�*swap J&K elements.*/
end   /*�*forever*/
newV2= newV2 + 1
k= j - 1;   newV1.L= newV1.k;   newV1.k= p
if j<=newV3  then do;  a.newV2= j;  b.newV2= H-j+1;  newV2= newV2+1;   a.newV2= L;   b.newV2= k-L;    end
else do;  a.newV2= L;  b.newV2= k-L;    newV2= newV2+1;   a.newV2= j;   b.newV2= H-j+1;  end
end          /*�*while $¬==0*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show@: w= length(newV5);       do j=1  for newV5;  say 'element'  right(j,w)  arg(1)":"  newV1.j;  end
say copies('▒', maxL + w + 22)            /*�*display a separator (between outputs)*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────*/
gen@:  newV1.=;   maxL=0                                    /*�*assign a default value for the array.*/
newV1.1  = " Rivers that form part of a (USA) state's border "                                   /*�*this value is adjusted later to include a prefix & suffix.*/
newV1.2  = '='                                                                                   /*�*this value is expanded later.  */
newV1.3  = "Perdido River                       Alabama, Florida"
newV1.4  = "Chattahoochee River                 Alabama, Georgia"
newV1.5  = "Tennessee River                     Alabama, Kentucky, Mississippi, Tennessee"
newV1.6  = "Colorado River                      Arizona, California, Nevada, Baja California (Mexico)"
newV1.7  = "Mississippi River                   Arkansas, Illinois, Iowa, Kentucky, Minnesota, Mississippi, Missouri, Tennessee, Louisiana, Wisconsin"
newV1.8  = "St. Francis River                   Arkansas, Missouri"
newV1.9  = "Poteau River                        Arkansas, Oklahoma"
newV1.10 = "Arkansas River                      Arkansas, Oklahoma"
newV1.11 = "Red River (Mississippi watershed)   Arkansas, Oklahoma, Texas"
newV1.12 = "Byram River                         Connecticut, New York"
newV1.13 = "Pawcatuck River                     Connecticut, Rhode Island and Providence Plantations"
newV1.14 = "Delaware River                      Delaware, New Jersey, New York, Pennsylvania"
newV1.15 = "Potomac River                       District of Columbia, Maryland, Virginia, West Virginia"
newV1.16 = "St. Marys River                     Florida, Georgia"
newV1.17 = "Chattooga River                     Georgia, South Carolina"
newV1.18 = "Tugaloo River                       Georgia, South Carolina"
newV1.19 = "Savannah River                      Georgia, South Carolina"
newV1.20 = "Snake River                         Idaho, Oregon, Washington"
newV1.21 = "Wabash River                        Illinois, Indiana"
newV1.22 = "Ohio River                          Illinois, Indiana, Kentucky, Ohio, West Virginia"
newV1.23 = "Great Miami River (mouth only)      Indiana, Ohio"
newV1.24 = "Des Moines River                    Iowa, Missouri"
newV1.25 = "Big Sioux River                     Iowa, South Dakota"
newV1.26 = "Missouri River                      Kansas, Iowa, Missouri, Nebraska, South Dakota"
newV1.27 = "Tug Fork River                      Kentucky, Virginia, West Virginia"
newV1.28 = "Big Sandy River                     Kentucky, West Virginia"
newV1.29 = "Pearl River                         Louisiana, Mississippi"
newV1.30 = "Sabine River                        Louisiana, Texas"
newV1.31 = "Monument Creek                      Maine, New Brunswick (Canada)"
newV1.32 = "St. Croix River                     Maine, New Brunswick (Canada)"
newV1.33 = "Piscataqua River                    Maine, New Hampshire"
newV1.34 = "St. Francis River                   Maine, Quebec (Canada)"
newV1.35 = "St. John River                      Maine, Quebec (Canada)"
newV1.36 = "Pocomoke River                      Maryland, Virginia"
newV1.37 = "Palmer River                        Massachusetts, Rhode Island and Providence Plantations"
newV1.38 = "Runnins River                       Massachusetts, Rhode Island and Providence Plantations"
newV1.39 = "Montreal River                      Michigan (upper peninsula), Wisconsin"
newV1.40 = "Detroit River                       Michigan, Ontario (Canada)"
newV1.41 = "St. Clair River                     Michigan, Ontario (Canada)"
newV1.42 = "St. Marys River                     Michigan, Ontario (Canada)"
newV1.43 = "Brule River                         Michigan, Wisconsin"
newV1.44 = "Menominee River                     Michigan, Wisconsin"
newV1.45 = "Red River of the North              Minnesota, North Dakota"
newV1.46 = "Bois de Sioux River                 Minnesota, North Dakota, South Dakota"
newV1.47 = "Pigeon River                        Minnesota, Ontario (Canada)"
newV1.48 = "Rainy River                         Minnesota, Ontario (Canada)"
newV1.49 = "St. Croix River                     Minnesota, Wisconsin"
newV1.50 = "St. Louis River                     Minnesota, Wisconsin"
newV1.51 = "Halls Stream                        New Hampshire, Canada"
newV1.52 = "Salmon Falls River                  New Hampshire, Maine"
newV1.53 = "Connecticut River                   New Hampshire, Vermont"
newV1.54 = "Arthur Kill                         New Jersey, New York (tidal strait)"
newV1.55 = "Kill Van Kull                       New Jersey, New York (tidal strait)"
newV1.56 = "Hudson River (lower part only)      New Jersey, New York"
newV1.57 = "Rio Grande                          New Mexico, Texas, Tamaulipas (Mexico), Nuevo Leon (Mexico), Coahuila de Zaragoza (Mexico), Chihuahua (Mexico)"
newV1.58 = "Niagara River                       New York, Ontario (Canada)"
newV1.59 = "St. Lawrence River                  New York, Ontario (Canada)"
newV1.60 = "Poultney River                      New York, Vermont"
newV1.61 = "Catawba River                       North Carolina, South Carolina"
newV1.62 = "Blackwater River                    North Carolina, Virginia"
newV1.63 = "Columbia River                      Oregon, Washington"
do newV5=1  until  newV1.newV5==''           /*�*find how many entries in array,  and */
maxL=max(maxL, length(newV1.newV5))      /*�*   also find the maximum width entry.*/
end   /*�*#*/;   newV5= newV5-1            /*�*adjust the highest element number.   */
newV1.1= center(newV1.1, maxL, '-')                      /*�*   "    "  header information.       */
newV1.2= copies(newV1.2, maxL)                           /*�*   "    "     "   separator.         */
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Quicksort\sorting-algorithms-quicksort-1.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
