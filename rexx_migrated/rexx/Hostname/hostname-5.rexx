/*ª* Rexx */
address command "hostname -f" with output stem hn.
do q_ = 1 to hn.0
say hn.q_
end q_
exit
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Hostname\hostname-5.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
