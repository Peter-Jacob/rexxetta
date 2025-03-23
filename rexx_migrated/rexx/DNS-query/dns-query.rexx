/*ª*REXX program displays  IPV4 and IPV6  addresses for a supplied  domain name.*/
parse arg tar .                        /*ª*obtain optional domain name from C.L.*/
if tar==''  then tar= 'www.kame.net'   /*ª*Not specified?  Then use the default.*/
tFID    = '\TEMP\DNSQUERY.$$$'         /*ª*define temp file to store IPV4 output*/
pingOpts= '-l 0    -n 1    -w 0'   tar /*ª*define options for the PING command. */
trace off                              /*ª*don't show PING noneâ”€zero return code*/
/*ª* [â†“]  perform 2 versions of PING cmd.*/
do j=4  to 6  by 2                   /*ª*handle  IPV4  and  IPV6  addresses.  */
'PING'  (-j)  pingOpts  ">"   tFID   /*ª*restrict PING's output to a minimum. */
q=charin(tFID, 1, 999)               /*ª*read the output file from  PING  cmd.*/
parse var  q   '['   ipaddr    "]"   /*ª*parse  IP  address from the output.  */
say 'IPV'j "for domain name  "  tar  '  is  '  ipaddr        /*ª*IPVx address.*/
call lineout tFID                    /*ª* â—„â”€â”€â”¬â”€â—„  needed by some REXXes to    */
end   /*ª*j*/                          /*ª*    â””â”€â—„  force (TEMP) file integrity.*/
/*ª*stick a fork in it,  we're all done. */
'ERASE'  tFID                          /*ª*clean up (delete) the temporary file.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\DNS-query\dns-query.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
