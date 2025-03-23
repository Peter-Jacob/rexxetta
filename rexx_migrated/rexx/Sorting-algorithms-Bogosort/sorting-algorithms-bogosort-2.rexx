/*�*REXX program performs a type of  bogo sort  on numbers in an array.   */
newV1.1 =   0  ;     newV1.11=    -64  ;     newV1.21=     4096  ;    newV1.31=    6291456
newV1.2 =   0  ;     newV1.12=     64  ;     newV1.22=    40960  ;    newV1.32=    5242880
newV1.3 =   1  ;     newV1.13=    256  ;     newV1.23=    16384  ;    newV1.33=  -15728640
newV1.4 =   2  ;     newV1.14=      0  ;     newV1.24=  -114688  ;    newV1.34=  -27262976
newV1.5 =   0  ;     newV1.15=   -768  ;     newV1.25=  -131072  ;    newV1.35=   29360128
newV1.6 =  -4  ;     newV1.16=   -512  ;     newV1.26=   262144  ;    newV1.36=  104857600
newV1.7 =   0  ;     newV1.17=   2048  ;     newV1.27=   589824  ;    newV1.37=  -16777216
newV1.8 =  16  ;     newV1.18=   3072  ;     newV1.28=  -393216  ;    newV1.38= -335544320
newV1.9 =  16  ;     newV1.19=  -4096  ;     newV1.29= -2097152  ;    newV1.39= -184549376
newV1.10= -32  ;     newV1.20= -12288  ;     newV1.30=  -262144  ;    newV1.40=  905969664
/*�* [↑]   @.1  is really the 0th Berstel number*/
newV2=40                      /*�*we have a list of two score Berstel numbers.*/
call tell 'before bogo sort'

do bogo=1

do j=1  for newV2;   newV3=newV1.j             /*�*?  is the next number in array.*/

do k=j+1  to newV2
if newV1.k>=newV3  then iterate          /*�*is this # in order?  Get next. */
/*�*get 2 unique random #s for swap*/
do  until a\==b;  a=random(j, k);     b=random(j, k);    end

parse value newV1.a newV1.b  with  newV1.b newV1.a    /*�*swap 2 random #s in array.*/
iterate bogo                     /*�*go and try another bogo sort.  */
end   /*�*k*/
end     /*�*j*/

leave                                /*�*we're finished with bogo sort. */
end       /*�*bogo*/                   /*�* [↓]  show the # of bogo sorts.*/

say 'number of bogo sorts performed =' bogo
call tell ' after bogo sort'
exit                                   /*�*stick a fork in it, we're done.*/
/*�*──────────────────────────────────TELL subroutine─────────────────────*/
tell:  say;  say center(arg(1), 50, '─')
do t=1  for newV2
say arg(1)  'element'right(t, length(newV2))'='right(newV1.t, 18)
end   /*�*t*/
say
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Bogosort\sorting-algorithms-bogosort-2.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
