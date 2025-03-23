/*�*REXX program converts a   metric  or  old Russian length   to various other lengths.  */
numeric digits 200                      /*�*lots of digits. */
/*�*──translation───*/
/*�*tip, top        */        vershok  = 22.492971                    /*�*1.75 inch.      */
/*�*palm, quarter   */        piad     = vershok    /   4             /*�*(also) chetvert.*/
/*�*yard            */        arshin   = vershok    /  16
/*�*fathom          */        sazhen   = arshin     /   3
/*�*turn (of a plow)*/        verst    = sazhen     / 500             /*�*(also) a versta.*/
/*�*mile            */        milia    = verst      /   1.5
/*�*inch            */        diuym    = arshin     *  28
/*�*foot            */        fut      = diuym      /  12             /*�*sounds like foot*/
/*�*line            */        liniya   = diuym      *  10
/*�*point           */        tochka   = diuym      * 100

KM= 1000;           CM=100                       /*�*define a couple of metric multipliers*/
sw= linesize() -1                                /*�*get the linesize (screen width)  - 1.*/
parse arg N what newV2 newV1                            /*�*obtain the user's input from the C.L.*/
if N==''               then call  err  'no arguments specified.'
if \datatype(N, 'N')   then call  err  'units not numeric: '    N
if newV2\==''              then call  err  'too many arguments specified: '   newV2   newV1
n= n / 1                                         /*�*normalize it  (004──►4  7.──►7,  etc.*/
if what==''  then what= 'meters';   whatU= what  /*�*None specified?  Then assume meters. */
upper whatU                                      /*�*an uppercase version for ABBREV bif. */
select                  /*�* [↓]  convert the length ───► meters.*/
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
end   /*�*select*/
say centre('metric',      sw, "─")
call tell m / KM       ,   'kilometer'
call tell m            ,   'meter'
call tell m * CM       ,   'centimeter'
say centre('old Russian', sw, "─")
call tell m * milia    ,   'milia'
call tell m * verst    ,   'verst'
call tell m * sazhen   ,   'sazhen'
call tell m * arshin   ,   'arshin'
call tell m * fut      ,   'fut'
call tell m * piad     ,   'piad'
call tell m * vershok  ,   'vershok'
call tell m * diuym    ,   'diuym'
call tell m * liniya   ,   'liniya'
call tell m * tochka   ,   'tochka'              /*�* ◄─── TELL shows eight decimal digits*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
err:  say center(' error ', sw % 2, "*");   do j=1  to arg();  say arg(j);  end;   exit 13
s:    if arg(1)=1  then return arg(3);      return word( arg(2) 's', 1)       /*�*plurals.*/
tell: parse arg newV3;  numeric digits 8;  newV3= newV3 / 1;  say right(newV3, 40) arg(2)s(newV3);      return/*�*REXX program converts a   metric  or  old Russian length   to various other lengths.  */
numeric digits 200                      /*�*lots of digits. */
/*�*──translation───*/
/*�*tip, top        */        vershok  = 22.492971                    /*�*1.75 inch.      */
/*�*palm, quarter   */        piad     = vershok    /   4             /*�*(also) chetvert.*/
/*�*yard            */        arshin   = vershok    /  16
/*�*fathom          */        sazhen   = arshin     /   3
/*�*turn (of a plow)*/        verst    = sazhen     / 500             /*�*(also) a versta.*/
/*�*mile            */        milia    = verst      /   1.5
/*�*inch            */        diuym    = arshin     *  28
/*�*foot            */        fut      = diuym      /  12             /*�*sounds like foot*/
/*�*line            */        liniya   = diuym      *  10
/*�*point           */        tochka   = diuym      * 100

KM= 1000;           CM=100                       /*�*define a couple of metric multipliers*/
sw= linesize() -1                                /*�*get the linesize (screen width)  - 1.*/
parse arg N what newV2 newV1                            /*�*obtain the user's input from the C.L.*/
if N==''               then call  err  'no arguments specified.'
if \datatype(N, 'N')   then call  err  'units not numeric: '    N
if newV2\==''              then call  err  'too many arguments specified: '   newV2   newV1
n= n / 1                                         /*�*normalize it  (004──►4  7.──►7,  etc.*/
if what==''  then what= 'meters';   whatU= what  /*�*None specified?  Then assume meters. */
upper whatU                                      /*�*an uppercase version for ABBREV bif. */
select                  /*�* [↓]  convert the length ───► meters.*/
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
end   /*�*select*/
say centre('metric',      sw, "─")
call tell m / KM       ,   'kilometer'
call tell m            ,   'meter'
call tell m * CM       ,   'centimeter'
say centre('old Russian', sw, "─")
call tell m * milia    ,   'milia'
call tell m * verst    ,   'verst'
call tell m * sazhen   ,   'sazhen'
call tell m * arshin   ,   'arshin'
call tell m * fut      ,   'fut'
call tell m * piad     ,   'piad'
call tell m * vershok  ,   'vershok'
call tell m * diuym    ,   'diuym'
call tell m * liniya   ,   'liniya'
call tell m * tochka   ,   'tochka'              /*�* ◄─── TELL shows eight decimal digits*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
err:  say center(' error ', sw % 2, "*");   do j=1  to arg();  say arg(j);  end;   exit 13
s:    if arg(1)=1  then return arg(3);      return word( arg(2) 's', 1)       /*�*plurals.*/
tell: parse arg newV3;  numeric digits 8;  newV3= newV3 / 1;  say right(newV3, 40) arg(2)s(newV3);      return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Old-Russian-measure-of-length\old-russian-measure-of-length.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
