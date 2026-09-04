@echo off
cd C:\Users\Abhishek Shandilya\world-db-sql-queries

REM Example query
mysql -u root -p world -e "SELECT Name, Population FROM Country ORDER BY Population DESC LIMIT 1;" >> assignment.txt

echo Queries appended to assignment.txt
pause
