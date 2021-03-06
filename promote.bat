@echo off

set DO_DATA_ONLY=
set /P DO_DATA_ONLY=Promote data only y/n [n]?: %=%
if "%DO_DATA_ONLY%" EQU "" set DO_DATA_ONLY=n

echo.
if "%DO_DATA_ONLY%" EQU "n" echo Sending app.zip to ftp... 
del app.zip
if "%DO_DATA_ONLY%" EQU "n" zip -rq app.zip app lib public utils
if "%DO_DATA_ONLY%" EQU "y" zip -rq app.zip notes
call ftp_put app.zip

echo.
echo Sending coll_db.zip to ftp... 
mysql     -u root collections_development < utils\collections_development_drop_views.sql
mysqldump -u root --databases collections_development > db\collections_development.sql
mysql     -u root collections_development < utils\collections_development_views.sql
zip coll_db.zip db\collections_development.sql
call ftp_put coll_db.zip

echo.
echo Done.
