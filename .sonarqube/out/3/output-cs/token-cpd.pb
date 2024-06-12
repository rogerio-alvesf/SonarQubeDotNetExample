´
5C:\Projects\SonarQubeDotNetExample\FilmApi\Startup.cs
	namespace

 	
FilmApi


 
{ 
[ #
ExcludeFromCodeCoverage 
] 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services 
.  
AddCustomDataContext )
() *
Configuration* 7
)7 8
;8 9
services 
. 
AddHostedService %
<% &
MigrationWorker& 5
>5 6
(6 7
)7 8
;8 9
services 
. 
AddControllers #
(# $
)$ %
;% &
services 
. 
AddSwaggerGen "
(" #
c# $
=>% '
{ 
c 
. 

SwaggerDoc 
( 
$str !
,! "
new# &
OpenApiInfo' 2
{3 4
Title5 :
=; <
$str= F
,F G
VersionH O
=P Q
$strR V
}W X
)X Y
;Y Z
} 
) 
; 
}   	
public## 
void## 
	Configure## 
(## 
IApplicationBuilder## 1
app##2 5
,##5 6
IWebHostEnvironment##7 J
env##K N
)##N O
{$$ 	
if%% 
(%% 
env%% 
.%% 
IsDevelopment%% !
(%%! "
)%%" #
)%%# $
{&& 
app'' 
.'' %
UseDeveloperExceptionPage'' -
(''- .
)''. /
;''/ 0
app(( 
.(( 

UseSwagger(( 
((( 
)((  
;((  !
app)) 
.)) 
UseSwaggerUI))  
())  !
c))! "
=>))# %
c))& '
.))' (
SwaggerEndpoint))( 7
())7 8
$str))8 R
,))R S
$str))T `
)))` a
)))a b
;))b c
}** 
app,, 
.,, 
UseHttpsRedirection,, #
(,,# $
),,$ %
;,,% &
app.. 
... 

UseRouting.. 
(.. 
).. 
;.. 
app00 
.00 
UseAuthorization00  
(00  !
)00! "
;00" #
app22 
.22 
UseEndpoints22 
(22 
	endpoints22 &
=>22' )
{33 
	endpoints44 
.44 
MapControllers44 (
(44( )
)44) *
;44* +
}55 
)55 
;55 
}66 	
}77 
}88 µ
5C:\Projects\SonarQubeDotNetExample\FilmApi\Program.cs
	namespace 	
FilmApi
 
{ 
[ #
ExcludeFromCodeCoverage 
] 
public 

class 
Program 
{		 
	protected

 
Program

 
(

 
)

 
{ 	
} 	
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} Ã
=C:\Projects\SonarQubeDotNetExample\FilmApi\MigrationWorker.cs
	namespace 	
FilmApi
 
{ 
[ #
ExcludeFromCodeCoverage 
] 
public 

class 
MigrationWorker  
:! "
IHostedService# 1
{ 
readonly 
IServiceProvider !
provider" *
;* +
public 
MigrationWorker 
( 
IServiceProvider /
provider0 8
)8 9
{ 	
this 
. 
provider 
= 
provider $
;$ %
} 	
public 
async 
Task 

StartAsync $
($ %
CancellationToken% 6
cancellationToken7 H
)H I
{ 	
using 
var 
scope 
= 
provider &
.& '
CreateScope' 2
(2 3
)3 4
;4 5
using 
var 
context 
= 
scope  %
.% &
ServiceProvider& 5
.5 6
GetRequiredService6 H
<H I
ContextI P
>P Q
(Q R
)R S
;S T
await 
context 
. 
Database "
." #
MigrateAsync# /
(/ 0
CancellationToken0 A
.A B
NoneB F
)F G
;G H
} 	
public 
Task 
	StopAsync 
( 
CancellationToken /
cancellationToken0 A
)A B
{   	
return!! 
Task!! 
.!! 
CompletedTask!! %
;!!% &
}"" 	
}## 
}$$ Ñ
MC:\Projects\SonarQubeDotNetExample\FilmApi\Configuration\DataConfiguration.cs
	namespace 	
FilmApi
 
. 
Configuration 
{ 
[		 #
ExcludeFromCodeCoverage		 
]		 
public

 

static

 
class

 
DataConfiguration

 )
{ 
public 
static 
IServiceCollection ( 
AddCustomDataContext) =
(= >
this 
IServiceCollection #
services$ ,
,, -
IConfiguration 
configuration (
) 	
{ 	
string 
securityConnection %
=& '
configuration( 5
.5 6
GetConnectionString6 I
(I J
$strJ ]
)] ^
;^ _
services 
. 
	AddScoped 
( 
(  
provider  (
)( )
=>* ,
{ 
return 
new #
DbContextOptionsBuilder 2
<2 3
Context3 :
>: ;
(; <
)< =
. 
UseSqlServer 
( 
securityConnection 0
)0 1
. 
Options 
; 
} 
) 
; 
services 
. 
AddDbContext !
<! "
Context" )
>) *
(* +
)+ ,
;, -
return 
services 
; 
} 	
}   
}!! 