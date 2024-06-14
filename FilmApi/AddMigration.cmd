@ECHO OFF 
:: This batch file runs Migration
TITLE Migration
ECHO Please wait... Runing migrationCommands.
ECHO ==========================
ECHO Input Migration Name
ECHO ============================
set /p id="Enter Migration Name: "
ECHO ==========================
ECHO Running Migration
ECHO ============================
dotnet ef migrations add %id% --project ..\Film.Infra --context Context
ECHO ============================
ECHO Update Database
ECHO ============================
dotnet ef database update
ECHO ============================
ECHO END
PAUSE