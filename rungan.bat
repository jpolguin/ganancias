
c:
cd C:\lighttpd\sbin
echo Stopping lighty...
process.exe -k lighttpd.exe > nul
echo Starting lighty...
lighttpd.exe -f ..\etc\lighttpd.conf
echo Stopping SCGI_service...
Process.exe -k ruby.exe > nul
cd C:\home\InstantRails\rails_apps\ganancias
echo Starting SCGI_service...
scgi_service