@ECHO OFF 
:: This batch file runs sonarqube
TITLE SonarQube
ECHO Please wait... Runing sonarqube Commands.
ECHO ==========================
ECHO Sonar START
ECHO ============================
dotnet sonarscanner begin /k:"SonarQubeDotNetExample" /d:sonar.host.url="http://localhost:9000" /d:sonar.login="sqp_b73ad207ce6cf127927125fe9fe376d9759f44b2" /d:sonar.cs.opencover.reportsPaths=Film.Test\coverage.opencover.xml
ECHO ============================
ECHO BUILD
ECHO ============================
dotnet build
ECHO ============================
ECHO TESTE
ECHO ============================
dotnet test /p:CollectCoverage=true /p:CoverletOutputFormat=opencover 
ECHO ============================
ECHO END
ECHO ============================
dotnet sonarscanner end /d:sonar.login="sqp_b73ad207ce6cf127927125fe9fe376d9759f44b2"
PAUSE