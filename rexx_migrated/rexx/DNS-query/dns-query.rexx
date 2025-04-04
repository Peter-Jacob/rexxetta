/*ͺ*REXX program displays  IPV4 and IPV6  addresses for a supplied  domain name.*/
parse arg tar .                        /*ͺ*obtain optional domain name from C.L.*/
if tar==''  then tar= 'www.kame.net'   /*ͺ*Not specified?  Then use the default.*/
tFID    = '\TEMP\DNSQUERY.$$$'         /*ͺ*define temp file to store IPV4 output*/
pingOpts= '-l 0    -n 1    -w 0'   tar /*ͺ*define options for the PING command. */
trace off                              /*ͺ*don't show PING noneβzero return code*/
/*ͺ* [β]  perform 2 versions of PING cmd.*/
do j=4  to 6  by 2                   /*ͺ*handle  IPV4  and  IPV6  addresses.  */
'PING'  (-j)  pingOpts  ">"   tFID   /*ͺ*restrict PING's output to a minimum. */
q=charin(tFID, 1, 999)               /*ͺ*read the output file from  PING  cmd.*/
parse var  q   '['   ipaddr    "]"   /*ͺ*parse  IP  address from the output.  */
say 'IPV'j "for domain name  "  tar  '  is  '  ipaddr        /*ͺ*IPVx address.*/
call lineout tFID                    /*ͺ* ββββ¬ββ  needed by some REXXes to    */
end   /*ͺ*j*/                          /*ͺ*    βββ  force (TEMP) file integrity.*/
/*ͺ*stick a fork in it,  we're all done. */
'ERASE'  tFID                          /*ͺ*clean up (delete) the temporary file.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\DNS-query\dns-query.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
