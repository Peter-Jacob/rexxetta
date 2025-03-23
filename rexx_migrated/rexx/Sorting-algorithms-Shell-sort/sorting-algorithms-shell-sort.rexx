/*�*REXX program  sorts  a  stemmed array  using the  shell sort  (shellsort) algorithm.  */
call gen                                         /*�*generate the array elements.         */
call show           'before sort'                /*�*display the  before  array elements. */
say copies('▒', 75)             /*�*displat a separator line  (a fence). */
call shellSort       newV2                           /*�*invoke the  shell  sort.             */
call show           ' after sort'                /*�*display the   after  array elements. */
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
gen: newV1.=                                         /*�*assign a default value to stem array.*/
newV1.1= '3 character abbreviations for states of the USA'         /*�*predates ZIP code.*/
newV1.2= '==============================================='
newV1.3= 'RHO  Rhode Island and Providence Plantations'     ;  newV1.36= 'NMX  New Mexico'
newV1.4= 'CAL  California'    ;   newV1.20= "NEV  Nevada"       ;  newV1.37= 'IND  Indiana'
newV1.5= 'KAN  Kansas'        ;   newV1.21= "TEX  Texas"        ;  newV1.38= 'MOE  Missouri'
newV1.6= 'MAS  Massachusetts' ;   newV1.22= "VGI  Virginia"     ;  newV1.39= 'COL  Colorado'
newV1.7= 'WAS  Washington'    ;   newV1.23= "OHI  Ohio"         ;  newV1.40= 'CON  Connecticut'
newV1.8= 'HAW  Hawaii'        ;   newV1.24= "NHM  New Hampshire";  newV1.41= 'MON  Montana'
newV1.9= 'NCR  North Carolina';   newV1.25= "MAE  Maine"        ;  newV1.42= 'LOU  Louisiana'
newV1.10= 'SCR  South Carolina';   newV1.26= "MIC  Michigan"     ;  newV1.43= 'IOW  Iowa'
newV1.11= 'IDA  Idaho'         ;   newV1.27= "MIN  Minnesota"    ;  newV1.44= 'ORE  Oregon'
newV1.12= 'NDK  North Dakota'  ;   newV1.28= "MIS  Mississippi"  ;  newV1.45= 'ARK  Arkansas'
newV1.13= 'SDK  South Dakota'  ;   newV1.29= "WIS  Wisconsin"    ;  newV1.46= 'ARZ  Arizona'
newV1.14= 'NEB  Nebraska'      ;   newV1.30= "OKA  Oklahoma"     ;  newV1.47= 'UTH  Utah'
newV1.15= 'DEL  Delaware'      ;   newV1.31= "ALA  Alabama"      ;  newV1.48= 'KTY  Kentucky'
newV1.16= 'PEN  Pennsylvania'  ;   newV1.32= "FLA  Florida"      ;  newV1.49= 'WVG  West Virginia'
newV1.17= 'TEN  Tennessee'     ;   newV1.33= "MLD  Maryland"     ;  newV1.50= 'NWJ  New Jersey'
newV1.18= 'GEO  Georgia'       ;   newV1.34= "ALK  Alaska"       ;  newV1.51= 'NYK  New York'
newV1.19= 'VER  Vermont'       ;   newV1.35= "ILL  Illinois"     ;  newV1.52= 'WYO  Wyoming'
do newV2=1  until newV1.newV2=='';  end;  newV2= newV2-1    /*�*determine number of entries in array.*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
shellSort: procedure expose newV1.;   parse arg n    /*�*obtain the  n  from the argument list*/
i= n % 2                              /*�*%   is integer division in REXX.     */
do  while i\==0
do j=i+1  to n;    k= j;      p= k - i      /*�*P: previous item*/
newV3= newV1.j
do  while k>=i+1 & newV1.p>newV3;    newV1.k= newV1.p;   k= k-i;   p= k-i
end   /*�*while*/
newV1.k= newV3
end          /*�*j*/
if i==2  then i= 1
else i= i * 5 % 11
end                 /*�*while*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show:   do j=1  for newV2;  say 'element'  right(j, length(newV2) ) arg(1)": "  newV1.j;  end;  return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Shell-sort\sorting-algorithms-shell-sort.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
