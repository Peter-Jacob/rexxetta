/*ͺ*REXX program converts a   metric  or  old Russian length   to various other lengths.  */
numeric digits 200                      /*ͺ*lots of digits. */
/*ͺ*ββtranslationβββ*/
/*ͺ*tip, top        */        vershok  = 22.492971                    /*ͺ*1.75 inch.      */
/*ͺ*palm, quarter   */        piad     = vershok    /   4             /*ͺ*(also) chetvert.*/
/*ͺ*yard            */        arshin   = vershok    /  16
/*ͺ*fathom          */        sazhen   = arshin     /   3
/*ͺ*turn (of a plow)*/        verst    = sazhen     / 500             /*ͺ*(also) a versta.*/
/*ͺ*mile            */        milia    = verst      /   1.5
/*ͺ*inch            */        diuym    = arshin     *  28
/*ͺ*foot            */        fut      = diuym      /  12             /*ͺ*sounds like foot*/
/*ͺ*line            */        liniya   = diuym      *  10
/*ͺ*point           */        tochka   = diuym      * 100

KM= 1000;           CM=100                       /*ͺ*define a couple of metric multipliers*/
sw= linesize() -1                                /*ͺ*get the linesize (screen width)  - 1.*/
parse arg N what newV2 newV1                            /*ͺ*obtain the user's input from the C.L.*/
if N==''               then call  err  'no arguments specified.'
if \datatype(N, 'N')   then call  err  'units not numeric: '    N
if newV2\==''              then call  err  'too many arguments specified: '   newV2   newV1
n= n / 1                                         /*ͺ*normalize it  (004βββΊ4  7.βββΊ7,  etc.*/
if what==''  then what= 'meters';   whatU= what  /*ͺ*None specified?  Then assume meters. */
upper whatU                                      /*ͺ*an uppercase version for ABBREV bif. */
select                  /*ͺ* [β]  convert the length ββββΊ meters.*/
when abbrev('METRES'     , whatU    )  |,
abbrev('METERS'     , whatU    )       then  m= N
when abbrev('KILOMETRES' , whatU, 2 )  |,
abbrev('KILOMETERS' , whatU, 2 )  |,
abbrev('KMS'        , whatU,   )       then  m= N * KM
when abbrev('CENTIMETRES', whatU, 2 )  |,
abbrev('CENTIMETERS', whatU, 2 )  |,
abbrev('CMS'        , whatU, 2 )       then  m= N / CM
when abbrev('ARSHINS'    , whatU    )       then  m= N / arshin
when abbrev('DIUYM'      , whatU    )       then  m= N / diuym
when abbrev('FUT'        , whatU    )       then  m= N / fut
when abbrev('LINIYA'     , whatU    )       then  m= N / liniya
when abbrev('PIADS'      , whatU    )  |,
abbrev('CHETVERTS'  , whatU, 2 )       then  m= N / piad
when abbrev('SAZHENS'    , whatU    )       then  m= N / sazhen
when abbrev('TOCHKA'     , whatU    )       then  m= N / tochka
when abbrev('VERSHOKS'   , whatU, 5 )       then  m= N / vershok
when abbrev('VERSTAS'    , whatU, 5 )  |,
abbrev('VERSTS'     , whatU, 2 )       then  m= N / verst
when abbrev('MILIA'      , whatU, 2 )       then  m= N / milia
otherwise     call err   'invalid measure name: '        what
end   /*ͺ*select*/
say centre('metric',      sw, "β")
call tell m / KM       ,   'kilometer'
call tell m            ,   'meter'
call tell m * CM       ,   'centimeter'
say centre('old Russian', sw, "β")
call tell m * milia    ,   'milia'
call tell m * verst    ,   'verst'
call tell m * sazhen   ,   'sazhen'
call tell m * arshin   ,   'arshin'
call tell m * fut      ,   'fut'
call tell m * piad     ,   'piad'
call tell m * vershok  ,   'vershok'
call tell m * diuym    ,   'diuym'
call tell m * liniya   ,   'liniya'
call tell m * tochka   ,   'tochka'              /*ͺ* ββββ TELL shows eight decimal digits*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
err:  say center(' error ', sw % 2, "*");   do j=1  to arg();  say arg(j);  end;   exit 13
s:    if arg(1)=1  then return arg(3);      return word( arg(2) 's', 1)       /*ͺ*plurals.*/
tell: parse arg newV3;  numeric digits 8;  newV3= newV3 / 1;  say right(newV3, 40) arg(2)s(newV3);      return/*ͺ*REXX program converts a   metric  or  old Russian length   to various other lengths.  */
numeric digits 200                      /*ͺ*lots of digits. */
/*ͺ*ββtranslationβββ*/
/*ͺ*tip, top        */        vershok  = 22.492971                    /*ͺ*1.75 inch.      */
/*ͺ*palm, quarter   */        piad     = vershok    /   4             /*ͺ*(also) chetvert.*/
/*ͺ*yard            */        arshin   = vershok    /  16
/*ͺ*fathom          */        sazhen   = arshin     /   3
/*ͺ*turn (of a plow)*/        verst    = sazhen     / 500             /*ͺ*(also) a versta.*/
/*ͺ*mile            */        milia    = verst      /   1.5
/*ͺ*inch            */        diuym    = arshin     *  28
/*ͺ*foot            */        fut      = diuym      /  12             /*ͺ*sounds like foot*/
/*ͺ*line            */        liniya   = diuym      *  10
/*ͺ*point           */        tochka   = diuym      * 100

KM= 1000;           CM=100                       /*ͺ*define a couple of metric multipliers*/
sw= linesize() -1                                /*ͺ*get the linesize (screen width)  - 1.*/
parse arg N what newV2 newV1                            /*ͺ*obtain the user's input from the C.L.*/
if N==''               then call  err  'no arguments specified.'
if \datatype(N, 'N')   then call  err  'units not numeric: '    N
if newV2\==''              then call  err  'too many arguments specified: '   newV2   newV1
n= n / 1                                         /*ͺ*normalize it  (004βββΊ4  7.βββΊ7,  etc.*/
if what==''  then what= 'meters';   whatU= what  /*ͺ*None specified?  Then assume meters. */
upper whatU                                      /*ͺ*an uppercase version for ABBREV bif. */
select                  /*ͺ* [β]  convert the length ββββΊ meters.*/
when abbrev('METRES'     , whatU    )  |,
abbrev('METERS'     , whatU    )       then  m= N
when abbrev('KILOMETRES' , whatU, 2 )  |,
abbrev('KILOMETERS' , whatU, 2 )  |,
abbrev('KMS'        , whatU,   )       then  m= N * KM
when abbrev('CENTIMETRES', whatU, 2 )  |,
abbrev('CENTIMETERS', whatU, 2 )  |,
abbrev('CMS'        , whatU, 2 )       then  m= N / CM
when abbrev('ARSHINS'    , whatU    )       then  m= N / arshin
when abbrev('DIUYM'      , whatU    )       then  m= N / diuym
when abbrev('FUT'        , whatU    )       then  m= N / fut
when abbrev('LINIYA'     , whatU    )       then  m= N / liniya
when abbrev('PIADS'      , whatU    )  |,
abbrev('CHETVERTS'  , whatU, 2 )       then  m= N / piad
when abbrev('SAZHENS'    , whatU    )       then  m= N / sazhen
when abbrev('TOCHKA'     , whatU    )       then  m= N / tochka
when abbrev('VERSHOKS'   , whatU, 5 )       then  m= N / vershok
when abbrev('VERSTAS'    , whatU, 5 )  |,
abbrev('VERSTS'     , whatU, 2 )       then  m= N / verst
when abbrev('MILIA'      , whatU, 2 )       then  m= N / milia
otherwise     call err   'invalid measure name: '        what
end   /*ͺ*select*/
say centre('metric',      sw, "β")
call tell m / KM       ,   'kilometer'
call tell m            ,   'meter'
call tell m * CM       ,   'centimeter'
say centre('old Russian', sw, "β")
call tell m * milia    ,   'milia'
call tell m * verst    ,   'verst'
call tell m * sazhen   ,   'sazhen'
call tell m * arshin   ,   'arshin'
call tell m * fut      ,   'fut'
call tell m * piad     ,   'piad'
call tell m * vershok  ,   'vershok'
call tell m * diuym    ,   'diuym'
call tell m * liniya   ,   'liniya'
call tell m * tochka   ,   'tochka'              /*ͺ* ββββ TELL shows eight decimal digits*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
err:  say center(' error ', sw % 2, "*");   do j=1  to arg();  say arg(j);  end;   exit 13
s:    if arg(1)=1  then return arg(3);      return word( arg(2) 's', 1)       /*ͺ*plurals.*/
tell: parse arg newV3;  numeric digits 8;  newV3= newV3 / 1;  say right(newV3, 40) arg(2)s(newV3);      return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Old-Russian-measure-of-length\old-russian-measure-of-length.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
