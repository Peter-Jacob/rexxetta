/*�*REXX program  displays  which  pins  are active of a  9  or  24  pin  RS-232  plug.   */
call rs_232  24,  127                            /*�*the value for an RS-232  24 pin plug.*/
call rs_232  24, '020304x'                       /*�* "    "    "   "   "      "  "    "  */
call rs_232   9, '10100000b'                     /*�* "    "    "   "   "      9  "    "  */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
rs_232: arg ,x;    parse arg pins,ox             /*�*X  is  uppercased  when using  ARG.  */
newV1.      = '??? unassigned pin'           /*�*assign a default for all the pins.   */
newV1.24.1  = 'PG  protective ground'
newV1.24.2  = 'TD  transmitted data'            ;     newV1.9.3 = newV1.24.2
newV1.24.3  = 'RD  received data'               ;     newV1.9.2 = newV1.24.3
newV1.24.4  = 'RTS request to send'             ;     newV1.9.7 = newV1.24.4
newV1.24.5  = 'CTS clear to send'               ;     newV1.9.8 = newV1.24.5
newV1.24.6  = 'DSR data set ready'              ;     newV1.9.6 = newV1.24.6
newV1.24.7  = 'SG  signal ground'               ;     newV1.9.5 = newV1.24.7
newV1.24.8  = 'CD  carrier detect'              ;     newV1.9.1 = newV1.24.8
newV1.24.9  = '+   positive voltage'
newV1.24.10 = '-   negative voltage'
newV1.24.12 = 'SCD secondary CD'
newV1.24.13 = 'SCS secondary CTS'
newV1.24.14 = 'STD secondary td'
newV1.24.15 = 'TC  transmit clock'
newV1.24.16 = 'SRD secondary RD'
newV1.24.17 = 'RC  receiver clock'
newV1.24.19 = 'SRS secondary RTS'
newV1.24.20 = 'DTR data terminal ready'         ;     newV1.9.4 = newV1.24.20
newV1.24.21 = 'SQD signal quality detector'
newV1.24.22 = 'RI  ring indicator'              ;     newV1.9.9 = newV1.24.22
newV1.24.23 = 'DRS data rate select'
newV1.24.24 = 'XTC external clock'

select
when right(x, 1)=='B'  then bits=    strip(x, 'T', "B")
when right(x, 1)=='X'  then bits=x2b(strip(x, 'T', "X"))
otherwise                   bits=x2b( d2x(x) )
end   /*�*select*/
say
bits=right(bits, pins, 0)                /*�*right justify pin readings (values). */
say '───────── For a'    pins    "pin RS─232 plug, with a reading of: "   ox
say
do j=1  for pins;     z=substr(bits, j, 1);         if z==0  then iterate
say right(j, 5)     'pin is "on": '     newV1.pins.j
end   /*�*j*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Memory-layout-of-a-data-structure\memory-layout-of-a-data-structure-2.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
