/*ª*REXX pgm shows a network device's manufacturer based on the Media Access Control addr.*/
win_command         = 'getmac'                   /*ª*name of the Microsoft Windows command*/
win_command_options = '/v /fo list'              /*ª*options  of     "        "       "   */
newV1= 'Network Adapter:'                           /*ª*search keywords for Network Adapter. */
newV2= 'Physical Address:'                          /*ª*   "       "     "  Physical Address.*/
upper newV1 newV2                                      /*ª*uppercase in case for capitol letters*/
newV3.=;            newV3.0= 0                           /*ª*justâ”€inâ”€case values for the keywords.*/
rc= 0                                            /*ª*  "   "   "  value for the returnCode*/
address system win_command win_command_options   with   output stem newV3.  /*ª*issue command.*/
if rc\==0  then do                               /*ª*display an error if not successful.  */
say
say '***error*** from command: '     win_command     win_command_options
say 'Return code was: '    rc
say
exit rc
end
MACaddr=.                                        /*ª*justâ”€inâ”€case value for the keyword.  */
maker=.                                          /*ª*  "   "   "    "    "   "     "      */
do j=1  for newV3.0;  newV4= newV3.j;  upper newV4    /*ª*parse each of the possible responses.*/
if left(newV4, length(newV1))=newV1  then maker=   subword(newV3.j, 3)   /*ª*is this the one?*/
if left(newV4, length(newV2))=newV2  then MACaddr= word(newV3.j, 3)      /*ª* "   "   "   "  */
end   /*ª*k*/
/*ª* [â†‘]  Now, display good or bad stuff.*/
if maker=. | MACaddr==.  then say 'MAC address manufacturer not found.'
else say 'manufacturer for MAC address  '  MACaddr "  is  " maker
exit 0                                           /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\MAC-vendor-lookup\mac-vendor-lookup.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
