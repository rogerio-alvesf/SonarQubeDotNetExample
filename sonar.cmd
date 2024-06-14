@ECHO OFF 
:: This batch file runs sonarqube
TITLE SonarQube
ECHO Please wait... Runing sonarqube Commands.
ECHO ==========================
ECHO Sonar START
ECHO ============================
dotnet sonarscanner begin /k:"SonarQubeDotNetExample" ^
    /d:sonar.host.url="http://localhost:9000" ^
    /d:sonar.login="sqp_95b4593ff7dcad961ebedd9510e628dee1a661fc" ^
    /d:sonar.cs.opencover.reportsPaths="Film.Test/TestResults/coverage.opencover.xml" ^
    /d:sonar.exclusions="**/appsettings.test.json,**/appsettings.Development.json,**/Film.Infra/Migrations/**"
ECHO ============================
ECHO BUILD
ECHO ============================
dotnet build
ECHO ============================
ECHO TESTE
ECHO ============================
dotnet test Film.Test/Film.Test.csproj /p:CollectCoverage=true /p:CoverletOutput=TestResults/ /p:CoverletOutputFormat=opencove /p:CoverletOutput="Film.Test/TestResults/coverage.opencover.xml"
ECHO ============================
ECHO END
ECHO ============================
dotnet sonarscanner end /d:sonar.login="sqp_95b4593ff7dcad961ebedd9510e628dee1a661fc"
PAUSE