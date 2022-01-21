íJ
L/home/manuel/sources/MangoRestaurant/Mango.Web/Controllers/HomeController.cs
	namespace 	
Mango
 
. 
Web 
. 
Controllers 
;  
public 
class 
HomeController 
: 

Controller (
{ 
private 
readonly 
ILogger 
< 
HomeController +
>+ ,
_logger- 4
;4 5
private 
readonly 
IProductService $
_productService% 4
;4 5
private 
readonly 
ICartService !
_cartService" .
;. /
public 

HomeController 
( 
ILogger !
<! "
HomeController" 0
>0 1
logger2 8
,8 9
IProductService: I
productServiceJ X
,X Y
ICartServiceZ f
cartServiceg r
)r s
{ 
_logger 
= 
logger 
; 
_productService 
= 
productService (
;( )
_cartService 
= 
cartService "
;" #
} 
public 

async 
Task 
< 
IActionResult #
># $
Index% *
(* +
)+ ,
{ 
List 
< 

ProductDto 
> 
? 
list 
=  
new! $
($ %
)% &
;& '
var 
response 
= 
await 
_productService ,
., -
GetAllProductsAsync- @
<@ A
ResponseDtoA L
>L M
(M N
$strN P
)P Q
;Q R
if 

( 
response 
. 
	IsSuccess 
) 
{ 	
list   
=   
JsonConvert   
.   
DeserializeObject   0
<  0 1
List  1 5
<  5 6

ProductDto  6 @
>  @ A
>  A B
(  B C
Convert  C J
.  J K
ToString  K S
(  S T
response  T \
.  \ ]
Result  ] c
)  c d
??  e g
string  h n
.  n o
Empty  o t
)  t u
;  u v
}!! 	
return## 
View## 
(## 
list## 
)## 
;## 
}$$ 
[&& 
	Authorize&& 
]&& 
public'' 

async'' 
Task'' 
<'' 
IActionResult'' #
>''# $
Details''% ,
('', -
int''- 0
	productId''1 :
)'': ;
{(( 

ProductDto)) 
model)) 
=)) 
new)) 
()) 
)))  
;))  !
var** 
response** 
=** 
await** 
_productService** ,
.**, -
GetProductByIdAsync**- @
<**@ A
ResponseDto**A L
>**L M
(**M N
	productId**N W
,**W X
$str**Y [
)**[ \
;**\ ]
if++ 

(++ 
response++ 
.++ 
	IsSuccess++ 
)++ 
{,, 	
model-- 
=-- 
JsonConvert-- 
.--  
DeserializeObject--  1
<--1 2

ProductDto--2 <
>--< =
(--= >
Convert--> E
.--E F
ToString--F N
(--N O
response--O W
.--W X
Result--X ^
)--^ _
)--_ `
;--` a
}--b c
return// 
View// 
(// 
model// 
)// 
;// 
}00 
[22 
HttpPost22 
]22 
[33 

ActionName33 
(33 
$str33 
)33 
]33 
[44 
	Authorize44 
]44 
public55 

async55 
Task55 
<55 
IActionResult55 #
>55# $
DetailsPost55% 0
(550 1

ProductDto551 ;

productDto55< F
)55F G
{66 
CartDto77 
cartDto77 
=77 
new77 
(77 
)77 
{88 	

CartHeader99 
=99 
new99 
CartHeaderDto99 *
(99* +
)99+ ,
{:: 
UserId;; 
=;; 
User;; 
.;; 
FindFirstValue;; ,
(;;, -

ClaimTypes;;- 7
.;;7 8
NameIdentifier;;8 F
);;F G
}<< 
}== 	
;==	 

CartDetailsDto?? 
cartDetails?? "
=??# $
new??% (
CartDetailsDto??) 7
(??7 8
)??8 9
{@@ 	
CountAA 
=AA 

productDtoAA 
.AA 
CountAA $
,AA$ %
	ProductIdBB 
=BB 

productDtoBB "
.BB" #
	ProductIdBB# ,
}CC 	
;CC	 

varEE 
respEE 
=EE 
awaitEE 
_productServiceEE (
.EE( )
GetProductByIdAsyncEE) <
<EE< =
ResponseDtoEE= H
>EEH I
(EEI J

productDtoEEJ T
.EET U
	ProductIdEEU ^
,EE^ _
$strEE` b
)EEb c
;EEc d
ifFF 

(FF 
respFF 
!=FF 
nullFF 
&&FF 
respFF  
.FF  !
	IsSuccessFF! *
)FF* +
{GG 	
cartDetailsHH 
.HH 
ProductHH 
=HH  !
JsonConvertHH" -
.HH- .
DeserializeObjectHH. ?
<HH? @

ProductDtoHH@ J
>HHJ K
(HHK L
ConvertHHL S
.HHS T
ToStringHHT \
(HH\ ]
respHH] a
.HHa b
ResultHHb h
)HHh i
)HHi j
;HHj k
}II 	
ListKK 
<KK 
CartDetailsDtoKK 
>KK 
cartDetailsDtosKK ,
=KK- .
newKK/ 2
(KK2 3
)KK3 4
;KK4 5
cartDetailsDtosLL 
.LL 
AddLL 
(LL 
cartDetailsLL '
)LL' (
;LL( )
cartDtoMM 
.MM 
CartDetailsMM 
=MM 
cartDetailsDtosMM -
;MM- .
varOO 
accessTokenOO 
=OO 
awaitOO 
HttpContextOO  +
.OO+ ,
GetTokenAsyncOO, 9
(OO9 :
$strOO: H
)OOH I
;OOI J
varPP 
addToCartRespPP 
=PP 
awaitPP !
_cartServicePP" .
.PP. /
AddToCartAsyncPP/ =
<PP= >
ResponseDtoPP> I
>PPI J
(PPJ K
cartDtoPPK R
,PPR S
accessTokenPPT _
)PP_ `
;PP` a
ifQQ 

(QQ 
addToCartRespQQ 
!=QQ 
nullQQ !
&&QQ" $
addToCartRespQQ% 2
.QQ2 3
	IsSuccessQQ3 <
)QQ< =
{RR 	
returnSS 
RedirectToActionSS #
(SS# $
nameofSS$ *
(SS* +
IndexSS+ 0
)SS0 1
)SS1 2
;SS2 3
}TT 	
returnWW 
ViewWW 
(WW 

productDtoWW 
)WW 
;WW  
}XX 
[ZZ 
	AuthorizeZZ 
]ZZ 
public[[ 

async[[ 
Task[[ 
<[[ 
IActionResult[[ #
>[[# $
Login[[% *
([[* +
)[[+ ,
{\\ 
var]] 
accessToken]] 
=]] 
await]] 
HttpContext]]  +
.]]+ ,
GetTokenAsync]], 9
(]]9 :
$str]]: H
)]]H I
;]]I J
return^^ 
RedirectToAction^^ 
(^^  
nameof^^  &
(^^& '
Index^^' ,
)^^, -
)^^- .
;^^. /
}__ 
public`` 

IActionResult`` 
Logout`` 
(``  
)``  !
{aa 
returnbb 
SignOutbb 
(bb 
$strbb  
,bb  !
$strbb" (
)bb( )
;bb) *
}cc 
publicee 

IActionResultee 
Privacyee  
(ee  !
)ee! "
{ff 
returngg 
Viewgg 
(gg 
)gg 
;gg 
}hh 
[jj 
ResponseCachejj 
(jj 
Durationjj 
=jj 
$numjj 
,jj  
Locationjj! )
=jj* +!
ResponseCacheLocationjj, A
.jjA B
NonejjB F
,jjF G
NoStorejjH O
=jjP Q
truejjR V
)jjV W
]jjW X
publickk 

IActionResultkk 
Errorkk 
(kk 
)kk  
{ll 
returnmm 
Viewmm 
(mm 
newmm 
ErrorViewModelmm &
{mm' (
	RequestIdmm) 2
=mm3 4
Activitymm5 =
.mm= >
Currentmm> E
?mmE F
.mmF G
IdmmG I
??mmJ L
HttpContextmmM X
.mmX Y
TraceIdentifiermmY h
}mmi j
)mmj k
;mmk l
}nn 
}oo ªN
O/home/manuel/sources/MangoRestaurant/Mango.Web/Controllers/ProductController.cs
	namespace 	
Mango
 
. 
Web 
. 
Controllers 
;  
public

 
class

 
ProductController

 
:

  

Controller

! +
{ 
private 
readonly 
IProductService $
_productService% 4
;4 5
public 

ProductController 
( 
IProductService ,
productService- ;
); <
{ 
_productService 
= 
productService (
;( )
} 
public 

async 
Task 
< 
IActionResult #
># $
ProductIndex% 1
(1 2
)2 3
{ 
List 
< 

ProductDto 
> 
list 
= 
new  #
(# $
)$ %
;% &
var 
accessToken 
= 
await 
HttpContext  +
.+ ,
GetTokenAsync, 9
(9 :
$str: H
)H I
;I J
var 
response 
= 
await 
_productService ,
., -
GetAllProductsAsync- @
<@ A
ResponseDtoA L
>L M
(M N
accessTokenN Y
)Y Z
;Z [
if 

( 
response 
!= 
null 
&& 
response  (
.( )
	IsSuccess) 2
)2 3
{ 	
list 
= 
JsonConvert 
. 
DeserializeObject 0
<0 1
List1 5
<5 6

ProductDto6 @
>@ A
>A B
(B C
ConvertC J
.J K
ToStringK S
(S T
responseT \
.\ ]
Result] c
)c d
)d e
;e f
} 	
return 
View 
( 
list 
) 
; 
} 
public   

async   
Task   
<   
IActionResult   #
>  # $
ProductCreate  % 2
(  2 3
)  3 4
{!! 
return"" 
View"" 
("" 
)"" 
;"" 
}## 
[$$ 
HttpPost$$ 
]$$ 
[%% $
ValidateAntiForgeryToken%% 
]%% 
public&& 

async&& 
Task&& 
<&& 
IActionResult&& #
>&&# $
ProductCreate&&% 2
(&&2 3

ProductDto&&3 =
model&&> C
)&&C D
{'' 
if(( 

((( 

ModelState(( 
.(( 
IsValid(( 
)(( 
{)) 	
var** 
accessToken** 
=** 
await** #
HttpContext**$ /
.**/ 0
GetTokenAsync**0 =
(**= >
$str**> L
)**L M
;**M N
var++ 
response++ 
=++ 
await++  
_productService++! 0
.++0 1
CreateProductAsync++1 C
<++C D
ResponseDto++D O
>++O P
(++P Q
model++Q V
,++V W
accessToken++X c
)++c d
;++d e
if,, 
(,, 
response,, 
!=,, 
null,,  
&&,,! #
response,,$ ,
.,,, -
	IsSuccess,,- 6
),,6 7
{-- 
return.. 
RedirectToAction.. '
(..' (
nameof..( .
(... /
ProductIndex../ ;
)..; <
)..< =
;..= >
}// 
}00 	
return11 
View11 
(11 
model11 
)11 
;11 
}22 
public44 

async44 
Task44 
<44 
IActionResult44 #
>44# $
ProductEdit44% 0
(440 1
int441 4
	productId445 >
)44> ?
{55 
var66 
accessToken66 
=66 
await66 
HttpContext66  +
.66+ ,
GetTokenAsync66, 9
(669 :
$str66: H
)66H I
;66I J
var77 
response77 
=77 
await77 
_productService77 ,
.77, -
GetProductByIdAsync77- @
<77@ A
ResponseDto77A L
>77L M
(77M N
	productId77N W
,77W X
accessToken77Y d
)77d e
;77e f
if88 

(88 
response88 
!=88 
null88 
&&88 
response88  (
.88( )
	IsSuccess88) 2
)882 3
{99 	

ProductDto:: 
model:: 
=:: 
JsonConvert:: *
.::* +
DeserializeObject::+ <
<::< =

ProductDto::= G
>::G H
(::H I
Convert::I P
.::P Q
ToString::Q Y
(::Y Z
response::Z b
.::b c
Result::c i
)::i j
)::j k
;::k l
return;; 
View;; 
(;; 
model;; 
);; 
;;; 
}<< 	
return== 
NotFound== 
(== 
)== 
;== 
}>> 
[?? 
HttpPost?? 
]?? 
[@@ $
ValidateAntiForgeryToken@@ 
]@@ 
publicAA 

asyncAA 
TaskAA 
<AA 
IActionResultAA #
>AA# $
ProductEditAA% 0
(AA0 1

ProductDtoAA1 ;
modelAA< A
)AAA B
{BB 
ifCC 

(CC 

ModelStateCC 
.CC 
IsValidCC 
)CC 
{DD 	
varEE 
accessTokenEE 
=EE 
awaitEE #
HttpContextEE$ /
.EE/ 0
GetTokenAsyncEE0 =
(EE= >
$strEE> L
)EEL M
;EEM N
varFF 
responseFF 
=FF 
awaitFF  
_productServiceFF! 0
.FF0 1
UpdateProductAsyncFF1 C
<FFC D
ResponseDtoFFD O
>FFO P
(FFP Q
modelFFQ V
,FFV W
accessTokenFFX c
)FFc d
;FFd e
ifGG 
(GG 
responseGG 
!=GG 
nullGG  
&&GG! #
responseGG$ ,
.GG, -
	IsSuccessGG- 6
)GG6 7
{HH 
returnII 
RedirectToActionII '
(II' (
nameofII( .
(II. /
ProductIndexII/ ;
)II; <
)II< =
;II= >
}JJ 
}KK 	
returnLL 
ViewLL 
(LL 
modelLL 
)LL 
;LL 
}MM 
[OO 
	AuthorizeOO 
]OO 
publicPP 

asyncPP 
TaskPP 
<PP 
IActionResultPP #
>PP# $
ProductDeletePP% 2
(PP2 3
intPP3 6
	productIdPP7 @
)PP@ A
{QQ 
varRR 
accessTokenRR 
=RR 
awaitRR 
HttpContextRR  +
.RR+ ,
GetTokenAsyncRR, 9
(RR9 :
$strRR: H
)RRH I
;RRI J
varSS 
responseSS 
=SS 
awaitSS 
_productServiceSS ,
.SS, -
GetProductByIdAsyncSS- @
<SS@ A
ResponseDtoSSA L
>SSL M
(SSM N
	productIdSSN W
,SSW X
accessTokenSSY d
)SSd e
;SSe f
ifTT 

(TT 
responseTT 
!=TT 
nullTT 
&&TT 
responseTT  (
.TT( )
	IsSuccessTT) 2
)TT2 3
{UU 	

ProductDtoVV 
modelVV 
=VV 
JsonConvertVV *
.VV* +
DeserializeObjectVV+ <
<VV< =

ProductDtoVV= G
>VVG H
(VVH I
ConvertVVI P
.VVP Q
ToStringVVQ Y
(VVY Z
responseVVZ b
.VVb c
ResultVVc i
)VVi j
)VVj k
;VVk l
returnWW 
ViewWW 
(WW 
modelWW 
)WW 
;WW 
}XX 	
returnYY 
NotFoundYY 
(YY 
)YY 
;YY 
}ZZ 
[\\ 
HttpPost\\ 
]\\ 
[]] 
	Authorize]] 
]]] 
[^^ $
ValidateAntiForgeryToken^^ 
]^^ 
public__ 

async__ 
Task__ 
<__ 
IActionResult__ #
>__# $
ProductDelete__% 2
(__2 3

ProductDto__3 =
model__> C
)__C D
{`` 
varaa 
accessTokenaa 
=aa 
awaitaa 
HttpContextaa  +
.aa+ ,
GetTokenAsyncaa, 9
(aa9 :
$straa: H
)aaH I
;aaI J
varbb 
responsebb 
=bb 
awaitbb 
_productServicebb ,
.bb, -
DeleteProductAsyncbb- ?
<bb? @
ResponseDtobb@ K
>bbK L
(bbL M
modelbbM R
.bbR S
	ProductIdbbS \
,bb\ ]
accessTokenbb^ i
)bbi j
;bbj k
ifcc 

(cc 
responsecc 
.cc 
	IsSuccesscc 
)cc 
{dd 	
returnee 
RedirectToActionee #
(ee# $
nameofee$ *
(ee* +
ProductIndexee+ 7
)ee7 8
)ee8 9
;ee9 :
}ff 	
returngg 
Viewgg 
(gg 
modelgg 
)gg 
;gg 
}hh 
}ii ‘
C/home/manuel/sources/MangoRestaurant/Mango.Web/Models/ApiRequest.cs
	namespace 	
Mango
 
. 
Web 
. 
Models 
; 
public 
class 

ApiRequest 
{ 
public 

SD 
. 
ApiType 
ApiType 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
SD. 0
.0 1
ApiType1 8
.8 9
GET9 <
;< =
public 

string 
Url 
{ 
get 
; 
set  
;  !
}" #
public 

object 
Data 
{ 
get 
; 
set !
;! "
}# $
public 

string 
AccessToken 
{ 
get  #
;# $
set% (
;( )
}* +
}		 ÷	
G/home/manuel/sources/MangoRestaurant/Mango.Web/Models/CartDetailsDto.cs
	namespace 	
Mango
 
. 
Web 
. 
Models 
; 
public 
class 
CartDetailsDto 
{ 
public 

int 
CartDetailsId 
{ 
get "
;" #
set$ '
;' (
}) *
public 

int 
CartHeaderId 
{ 
get !
;! "
set# &
;& '
}( )
public 

virtual 
CartHeaderDto  

CartHeader! +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public

 

int

 
	ProductId

 
{

 
get

 
;

 
set

  #
;

# $
}

% &
public 

virtual 

ProductDto 
Product %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 

int 
Count 
{ 
get 
; 
set 
;  
}! "
} “
@/home/manuel/sources/MangoRestaurant/Mango.Web/Models/CartDto.cs
	namespace 	
Mango
 
. 
Web 
. 
Models 
; 
public 
class 
CartDto 
{ 
public 

CartHeaderDto 

CartHeader #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 

IEnumerable 
< 
CartDetailsDto %
>% &
CartDetails' 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
} 
F/home/manuel/sources/MangoRestaurant/Mango.Web/Models/CartHeaderDto.cs
	namespace 	
Mango
 
. 
Web 
. 
Models 
; 
public 
class 
CartHeaderDto 
{ 
public 

int 
CartHeaderId 
{ 
get !
;! "
set# &
;& '
}( )
public 

string 
UserId 
{ 
get 
; 
set  #
;# $
}% &
public 

string 

CouponCode 
{ 
get "
;" #
set$ '
;' (
}) *
public 

double 

OrderTotal 
{ 
get "
;" #
set$ '
;' (
}) *
}		 ¬
G/home/manuel/sources/MangoRestaurant/Mango.Web/Models/ErrorViewModel.cs
	namespace 	
Mango
 
. 
Web 
. 
Models 
; 
public 
class 
ErrorViewModel 
{ 
public 

string 
? 
	RequestId 
{ 
get "
;" #
set$ '
;' (
}) *
public 

bool 
ShowRequestId 
=>  
!! "
string" (
.( )
IsNullOrEmpty) 6
(6 7
	RequestId7 @
)@ A
;A B
} ÿ
C/home/manuel/sources/MangoRestaurant/Mango.Web/Models/ProductDto.cs
	namespace 	
Mango
 
. 
Web 
. 
Models 
; 
public 
class 

ProductDto 
{ 
public 


ProductDto 
( 
) 
{ 
Count		 
=		 
$num		 
;		 
}

 
public 

int 
	ProductId 
{ 
get 
; 
set  #
;# $
}% &
public 

string 
Name 
{ 
get 
; 
set !
;! "
}# $
public 

double 
Price 
{ 
get 
; 
set "
;" #
}$ %
public 

string 
Description 
{ 
get  #
;# $
set% (
;( )
}* +
public 

string 
CategoryName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 

string 
ImageUrl 
{ 
get  
;  !
set" %
;% &
}' (
[ 
Range 

(
 
$num 
, 
$num 
) 
] 
public 

int 
Count 
{ 
get 
; 
set 
;  
}! "
} ¡
D/home/manuel/sources/MangoRestaurant/Mango.Web/Models/ResponseDto.cs
	namespace 	
Mango
 
. 
Web 
. 
Models 
; 
public 
class 
ResponseDto 
{ 
public 

bool 
	IsSuccess 
{ 
get 
;  
set! $
;$ %
}& '
=( )
true* .
;. /
public 

object 
Result 
{ 
get 
; 
set  #
;# $
}% &
public 

string 
DisplayMessages !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
$str2 4
;4 5
public 

List 
< 
string 
> 
ErrorMessages %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
}		 Œ-
9/home/manuel/sources/MangoRestaurant/Mango.Web/Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder		 
.		 
Services		 
.		 
AddHttpClient		 
<		 
IProductService		 .
,		. /
ProductService		0 >
>		> ?
(		? @
)		@ A
;		A B
builder

 
.

 
Services

 
.

 
AddHttpClient

 
<

 
ICartService

 +
,

+ ,
CartService

- 8
>

8 9
(

9 :
)

: ;
;

; <
SD 
. 
ProductAPIBase 
= 
builder 
. 
Configuration )
[) *
$str* B
]B C
;C D
SD 
. 
ShoppingCartAPIBase 
= 
builder  
.  !
Configuration! .
[. /
$str/ L
]L M
;M N
builder 
. 
Services 
. 
	AddScoped 
< 
IProductService *
,* +
ProductService, :
>: ;
(; <
)< =
;= >
builder 
. 
Services 
. 
	AddScoped 
< 
ICartService '
,' (
CartService) 4
>4 5
(5 6
)6 7
;7 8
builder 
. 
Services 
. #
AddControllersWithViews (
(( )
)) *
;* +
builder 
. 
Services 
. 
AddAuthentication "
(" #
options# *
=>+ -
{ 
options 
. 
DefaultScheme 
= 
$str  )
;) *
options 
. "
DefaultChallengeScheme &
=' (
$str) /
;/ 0
} 
) 
. 
	AddCookie 
( 
$str 
, 
c 
=> 
c  
.  !
ExpireTimeSpan! /
=0 1
TimeSpan2 :
.: ;
FromMinutes; F
(F G
$numG I
)I J
)J K
. 
AddOpenIdConnect 
( 
$str 
, 
options %
=>& (
{ 
options 
. 
	Authority 
= 
builder #
.# $
Configuration$ 1
[1 2
$str2 K
]K L
;L M
options 
. )
GetClaimsFromUserInfoEndpoint -
=. /
true0 4
;4 5
options 
. 
ClientId 
= 
$str "
;" #
options 
. 
ClientSecret 
= 
$str '
;' (
options 
. 
ResponseType 
= 
$str %
;% &
if$$ 

($$ 
builder$$ 
.$$ 
Environment$$ 
.$$  
IsDevelopment$$  -
($$- .
)$$. /
)$$/ 0
{%% 	
}'' 	
options(( 
.(( 
ClaimActions(( 
.(( 
MapUniqueJsonKey(( -
(((- .
$str((. 3
,((3 4
$str((5 :
)((: ;
;((; <
options** 
.** %
TokenValidationParameters** )
.**) *
NameClaimType*** 7
=**8 9
$str**: @
;**@ A
options++ 
.++ %
TokenValidationParameters++ )
.++) *
RoleClaimType++* 7
=++8 9
$str++: @
;++@ A
options,, 
.,, 
Scope,, 
.,, 
Add,, 
(,, 
$str,, !
),,! "
;,," #
options-- 
.-- 

SaveTokens-- 
=-- 
true-- !
;--! "
}.. 
).. 
;.. 
var00 
app00 
=00 	
builder00
 
.00 
Build00 
(00 
)00 
;00 
if33 
(33 
!33 
app33 
.33 	
Environment33	 
.33 
IsDevelopment33 "
(33" #
)33# $
)33$ %
{44 
app55 
.55 
UseExceptionHandler55 
(55 
$str55 )
)55) *
;55* +
app77 
.77 
UseHsts77 
(77 
)77 
;77 
}88 
app:: 
.:: 
UseHttpsRedirection:: 
(:: 
):: 
;:: 
app;; 
.;; 
UseStaticFiles;; 
(;; 
);; 
;;; 
app== 
.== 

UseRouting== 
(== 
)== 
;== 
app>> 
.>> 
UseAuthentication>> 
(>> 
)>> 
;>> 
app?? 
.?? 
UseAuthorization?? 
(?? 
)?? 
;?? 
appAA 
.AA 
MapControllerRouteAA 
(AA 
nameBB 
:BB 	
$strBB
 
,BB 
patternCC 
:CC 
$strCC 5
)CC5 6
;CC6 7
appEE 
.EE 
RunEE 
(EE 
)EE 	
;EE	 
¯
4/home/manuel/sources/MangoRestaurant/Mango.Web/SD.cs
	namespace 	
Mango
 
. 
Web 
; 
public 
static 
class 
SD 
{ 
public 

static 
string 
ProductAPIBase '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 

static 
string 
ShoppingCartAPIBase ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 

enum 
ApiType 
{		 
GET

 
,

 
POST 
, 
PUT 
, 
DELETE 
} 
} ¦6
F/home/manuel/sources/MangoRestaurant/Mango.Web/Services/BaseService.cs
	namespace 	
Mango
 
. 
Web 
. 
Services 
; 
public		 
class		 
BaseService		 
:		 
IBaseService		 &
{

 
public 

ResponseDto 
responseModel $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 

IHttpClientFactory 

httpClient (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 

BaseService 
( 
IHttpClientFactory )

httpClient* 4
)4 5
{ 
this 
. 
responseModel 
= 
new  
ResponseDto! ,
(, -
)- .
;. /
this 
. 

httpClient 
= 

httpClient $
;$ %
} 
public 

async 
Task 
< 
T 
> 
	SendAsync "
<" #
T# $
>$ %
(% &

ApiRequest& 0

apiRequest1 ;
); <
{ 
try 
{ 	
var 
client 
= 

httpClient #
.# $
CreateClient$ 0
(0 1
$str1 ;
); <
;< =
HttpRequestMessage 
message &
=' (
new) ,
HttpRequestMessage- ?
(? @
)@ A
;A B
message 
. 
Headers 
. 
Add 
(  
$str  (
,( )
$str* <
)< =
;= >
message 
. 

RequestUri 
=  
new! $
Uri% (
(( )

apiRequest) 3
.3 4
Url4 7
)7 8
;8 9
client 
. !
DefaultRequestHeaders (
.( )
Clear) .
(. /
)/ 0
;0 1
if 
( 

apiRequest 
. 
Data 
!=  "
null# '
)' (
{ 
message 
. 
Content 
=  !
new" %
StringContent& 3
(3 4
JsonConvert4 ?
.? @
SerializeObject@ O
(O P

apiRequestP Z
.Z [
Data[ _
)_ `
,` a
Encoding   
.   
UTF8   !
,  ! "
$str  # 5
)  5 6
;  6 7
}!! 
if## 
(## 
!## 
string## 
.## 
IsNullOrEmpty## %
(##% &

apiRequest##& 0
.##0 1
AccessToken##1 <
)##< =
)##= >
{$$ 
client%% 
.%% !
DefaultRequestHeaders%% ,
.%%, -
Authorization%%- :
=%%; <
new&& %
AuthenticationHeaderValue&& 1
(&&1 2
$str&&2 :
,&&: ;

apiRequest&&< F
.&&F G
AccessToken&&G R
)&&R S
;&&S T
}'' 
HttpResponseMessage)) 
apiResponse))  +
=)), -
null)). 2
;))2 3
switch** 
(** 

apiRequest** 
.** 
ApiType** &
)**& '
{++ 
case,, 
SD,, 
.,, 
ApiType,, 
.,,  
POST,,  $
:,,$ %
message-- 
.-- 
Method-- "
=--# $

HttpMethod--% /
.--/ 0
Post--0 4
;--4 5
break.. 
;.. 
case// 
SD// 
.// 
ApiType// 
.//  
PUT//  #
://# $
message00 
.00 
Method00 "
=00# $

HttpMethod00% /
.00/ 0
Put000 3
;003 4
break11 
;11 
case22 
SD22 
.22 
ApiType22 
.22  
DELETE22  &
:22& '
message33 
.33 
Method33 "
=33# $

HttpMethod33% /
.33/ 0
Delete330 6
;336 7
break44 
;44 
default55 
:55 
message66 
.66 
Method66 "
=66# $

HttpMethod66% /
.66/ 0
Get660 3
;663 4
break77 
;77 
}88 
apiResponse:: 
=:: 
await:: 
client::  &
.::& '
	SendAsync::' 0
(::0 1
message::1 8
)::8 9
;::9 :
var;; 

apiContent;; 
=;; 
await;; "
apiResponse;;# .
.;;. /
Content;;/ 6
.;;6 7
ReadAsStringAsync;;7 H
(;;H I
);;I J
;;;J K
var<< 
apiResponseDto<< 
=<<  
JsonConvert<<! ,
.<<, -
DeserializeObject<<- >
<<<> ?
T<<? @
><<@ A
(<<A B

apiContent<<B L
)<<L M
;<<M N
return== 
apiResponseDto== !
;==! "
}>> 	
catch?? 
(?? 
	Exception?? 
e?? 
)?? 
{@@ 	
varAA 
dtoAA 
=AA 
newAA 
ResponseDtoAA %
{BB 
DisplayMessagesCC 
=CC  !
$strCC" )
,CC) *
ErrorMessagesDD 
=DD 
newDD  #
ListDD$ (
<DD( )
stringDD) /
>DD/ 0
{DD1 2
ConvertDD3 :
.DD: ;
ToStringDD; C
(DDC D
eDDD E
.DDE F
MessageDDF M
)DDM N
}DDO P
,DDP Q
	IsSuccessEE 
=EE 
falseEE !
}FF 
;FF 
varGG 
resGG 
=GG 
JsonConvertGG !
.GG! "
SerializeObjectGG" 1
(GG1 2
dtoGG2 5
)GG5 6
;GG6 7
varHH 
apiResponseDtoHH 
=HH  
JsonConvertHH! ,
.HH, -
DeserializeObjectHH- >
<HH> ?
THH? @
>HH@ A
(HHA B
resHHB E
)HHE F
;HHF G
returnII 
apiResponseDtoII !
;II! "
}JJ 	
}KK 
publicMM 

voidMM 
DisposeMM 
(MM 
)MM 
{NN 
GCOO 

.OO
 
SuppressFinalizeOO 
(OO 
trueOO  
)OO  !
;OO! "
}PP 
}RR Ÿ'
F/home/manuel/sources/MangoRestaurant/Mango.Web/Services/CartService.cs
	namespace 	
Mango
 
. 
Web 
. 
Services 
; 
public 
class 
CartService 
: 
BaseService %
,% &
ICartService' 3
{ 
private 
readonly 
IHttpClientFactory '
_clientFactory( 6
;6 7
public

 

CartService

 
(

 
IHttpClientFactory

 )
clientFactory

* 7
)

7 8
:

8 9
base

: >
(

> ?
clientFactory

? L
)

L M
{ 
_clientFactory 
= 
clientFactory &
;& '
} 
public 

async 
Task 
< 
T 
>  
GetCartByUserIdAsync -
<- .
T. /
>/ 0
(0 1
string1 7
userId8 >
,> ?
string@ F
tokenG L
=M N
nullO S
)S T
{ 
return 
await 
this 
. 
	SendAsync #
<# $
T$ %
>% &
(& '
new' *

ApiRequest+ 5
(5 6
)6 7
{ 	
ApiType 
= 
SD 
. 
ApiType  
.  !
GET! $
,$ %
Url 
= 
SD 
. 
ShoppingCartAPIBase (
+) *
$str+ ?
+@ A
userIdB H
,H I
AccessToken 
= 
token 
} 	
)	 

;
 
} 
public 

async 
Task 
< 
T 
> 
AddToCartAsync '
<' (
T( )
>) *
(* +
CartDto+ 2
cartDto3 :
,: ;
string< B
tokenC H
=I J
nullK O
)O P
{ 
return 
await 
this 
. 
	SendAsync #
<# $
T$ %
>% &
(& '
new' *

ApiRequest+ 5
(5 6
)6 7
{ 	
ApiType 
= 
SD 
. 
ApiType  
.  !
POST! %
,% &
Data 
= 
cartDto 
, 
Url 
= 
SD 
. 
ShoppingCartAPIBase (
+) *
$str+ >
,> ?
AccessToken   
=   
token   
}!! 	
)!!	 

;!!
 
}"" 
public$$ 

async$$ 
Task$$ 
<$$ 
T$$ 
>$$ 
UpdateCartAsync$$ (
<$$( )
T$$) *
>$$* +
($$+ ,
CartDto$$, 3
cartDto$$4 ;
,$$; <
string$$= C
token$$D I
=$$J K
null$$L P
)$$P Q
{%% 
return&& 
await&& 
this&& 
.&& 
	SendAsync&& #
<&&# $
T&&$ %
>&&% &
(&&& '
new&&' *

ApiRequest&&+ 5
(&&5 6
)&&6 7
{'' 	
ApiType(( 
=(( 
SD(( 
.(( 
ApiType((  
.((  !
POST((! %
,((% &
Data)) 
=)) 
cartDto)) 
,)) 
Url** 
=** 
SD** 
.** 
ShoppingCartAPIBase** (
+**) *
$str**+ A
,**A B
AccessToken++ 
=++ 
token++ 
},, 	
),,	 

;,,
 
}-- 
public// 

async// 
Task// 
<// 
T// 
>// 
RemoveFromCartAsync// ,
<//, -
T//- .
>//. /
(/// 0
int//0 3
cartId//4 :
,//: ;
string//< B
token//C H
=//I J
null//K O
)//O P
{00 
return11 
await11 
this11 
.11 
	SendAsync11 #
<11# $
T11$ %
>11% &
(11& '
new11' *

ApiRequest11+ 5
(115 6
)116 7
{22 	
ApiType33 
=33 
SD33 
.33 
ApiType33  
.33  !
POST33! %
,33% &
Data44 
=44 
cartId44 
,44 
Url55 
=55 
SD55 
.55 
ShoppingCartAPIBase55 (
+55) *
$str55+ A
,55A B
AccessToken66 
=66 
token66 
}77 	
)77	 

;77
 
}88 
}99 ì
Q/home/manuel/sources/MangoRestaurant/Mango.Web/Services/IServices/IBaseService.cs
	namespace 	
Mango
 
. 
Web 
. 
Services 
. 
	IServices &
;& '
public 
	interface 
IBaseService 
: 
IDisposable *
{ 
ResponseDto 
responseModel 
{ 
get  #
;# $
set% (
;( )
}* +
Task 
< 	
T	 

>
 
	SendAsync 
< 
T 
> 
( 

ApiRequest #

apiRequest$ .
). /
;/ 0
}

 ¯
Q/home/manuel/sources/MangoRestaurant/Mango.Web/Services/IServices/ICartService.cs
	namespace 	
Mango
 
. 
Web 
. 
Services 
. 
	IServices &
;& '
public 
	interface 
ICartService 
{ 
Task 
< 	
T	 

>
  
GetCartByUserIdAsync  
<  !
T! "
>" #
(# $
string$ *
userId+ 1
,1 2
string3 9
token: ?
=@ A
nullB F
)F G
;G H
Task 
< 	
T	 

>
 
AddToCartAsync 
< 
T 
> 
( 
CartDto %
cartDto& -
,- .
string/ 5
token6 ;
=< =
null> B
)B C
;C D
Task		 
<		 	
T			 

>		
 
UpdateCartAsync		 
<		 
T		 
>		 
(		 
CartDto		 &
cartDto		' .
,		. /
string		0 6
token		7 <
=		= >
null		? C
)		C D
;		D E
Task

 
<

 	
T

	 

>


 
RemoveFromCartAsync

 
<

  
T

  !
>

! "
(

" #
int

# &
cartId

' -
,

- .
string

/ 5
token

6 ;
=

< =
null

> B
)

B C
;

C D
} Á
T/home/manuel/sources/MangoRestaurant/Mango.Web/Services/IServices/IProductService.cs
	namespace 	
Mango
 
. 
Web 
. 
Services 
. 
	IServices &
;& '
public 
	interface 
IProductService  
:  !
IBaseService" .
{ 
Task 
< 	
T	 

>
 
GetAllProductsAsync 
<  
T  !
>! "
(" #
string# )
token* /
)/ 0
;0 1
Task 
< 	
T	 

>
 
GetProductByIdAsync 
<  
T  !
>! "
(" #
int# &
id' )
,) *
string+ 1
token2 7
)7 8
;8 9
Task		 
<		 	
T			 

>		
 
CreateProductAsync		 
<		 
T		  
>		  !
(		! "

ProductDto		" ,

productDto		- 7
,		7 8
string		9 ?
token		@ E
)		E F
;		F G
Task

 
<

 	
T

	 

>


 
UpdateProductAsync

 
<

 
T

  
>

  !
(

! "

ProductDto

" ,

productDto

- 7
,

7 8
string

9 ?
token

@ E
)

E F
;

F G
Task 
< 	
T	 

>
 
DeleteProductAsync 
< 
T  
>  !
(! "
int" %
id& (
,( )
string* 0
token1 6
)6 7
;7 8
} £.
I/home/manuel/sources/MangoRestaurant/Mango.Web/Services/ProductService.cs
	namespace 	
Mango
 
. 
Web 
. 
Services 
; 
public 
class 
ProductService 
: 
BaseService (
,( )
IProductService* 9
{ 
private 
readonly 
IHttpClientFactory '
_clientFactory( 6
;6 7
public

 

ProductService

 
(

 
IHttpClientFactory

 ,
clientFactory

- :
)

: ;
:

; <
base

= A
(

A B
clientFactory

B O
)

O P
{ 
_clientFactory 
= 
clientFactory &
;& '
} 
public 

async 
Task 
< 
T 
> 
GetAllProductsAsync ,
<, -
T- .
>. /
(/ 0
string0 6
token7 <
)< =
{ 
var 
apiR 
= 
new 

ApiRequest !
(! "
)" #
{ 	
ApiType 
= 
SD 
. 
ApiType  
.  !
GET! $
,$ %
Url 
= 
SD 
. 
ProductAPIBase #
+$ %
$str& 6
,6 7
AccessToken 
= 
token 
} 	
;	 

var 
result 
= 
await 
this 
.  
	SendAsync  )
<) *
T* +
>+ ,
(, -
apiR- 1
)1 2
;2 3
return 
result 
; 
} 
public 

async 
Task 
< 
T 
> 
GetProductByIdAsync ,
<, -
T- .
>. /
(/ 0
int0 3
id4 6
,6 7
string8 >
token? D
)D E
{ 
return 
await 
this 
. 
	SendAsync #
<# $
T$ %
>% &
(& '
new' *

ApiRequest+ 5
(5 6
)6 7
{ 	
ApiType   
=   
SD   
.   
ApiType    
.    !
GET  ! $
,  $ %
Url!! 
=!! 
SD!! 
.!! 
ProductAPIBase!! #
+!!$ %
$str!!& 6
+!!7 8
id!!9 ;
,!!; <
AccessToken"" 
="" 
token"" 
}## 	
)##	 

;##
 
}$$ 
public&& 

async&& 
Task&& 
<&& 
T&& 
>&& 
CreateProductAsync&& +
<&&+ ,
T&&, -
>&&- .
(&&. /

ProductDto&&/ 9

productDto&&: D
,&&D E
string&&F L
token&&M R
)&&R S
{'' 
return(( 
await(( 
this(( 
.(( 
	SendAsync(( #
<((# $
T(($ %
>((% &
(((& '
new((' *

ApiRequest((+ 5
(((5 6
)((6 7
{)) 	
ApiType** 
=** 
SD** 
.** 
ApiType**  
.**  !
POST**! %
,**% &
Data++ 
=++ 

productDto++ 
,++ 
Url,, 
=,, 
SD,, 
.,, 
ProductAPIBase,, #
+,,$ %
$str,,& 5
,,,5 6
AccessToken-- 
=-- 
token-- 
}.. 	
)..	 

;..
 
}// 
public11 

async11 
Task11 
<11 
T11 
>11 
UpdateProductAsync11 +
<11+ ,
T11, -
>11- .
(11. /

ProductDto11/ 9

productDto11: D
,11D E
string11F L
token11M R
)11R S
{22 
return33 
await33 
this33 
.33 
	SendAsync33 #
<33# $
T33$ %
>33% &
(33& '
new33' *

ApiRequest33+ 5
(335 6
)336 7
{44 	
ApiType55 
=55 
SD55 
.55 
ApiType55  
.55  !
PUT55! $
,55$ %
Data66 
=66 

productDto66 
,66 
Url77 
=77 
SD77 
.77 
ProductAPIBase77 #
+77$ %
$str77& 5
,775 6
AccessToken88 
=88 
token88 
}99 	
)99	 

;99
 
}:: 
public<< 

async<< 
Task<< 
<<< 
T<< 
><< 
DeleteProductAsync<< +
<<<+ ,
T<<, -
><<- .
(<<. /
int<</ 2
id<<3 5
,<<5 6
string<<7 =
token<<> C
)<<C D
{== 
return>> 
await>> 
this>> 
.>> 
	SendAsync>> #
<>># $
T>>$ %
>>>% &
(>>& '
new>>' *

ApiRequest>>+ 5
(>>5 6
)>>6 7
{?? 	
ApiType@@ 
=@@ 
SD@@ 
.@@ 
ApiType@@  
.@@  !
DELETE@@! '
,@@' (
UrlAA 
=AA 
SDAA 
.AA 
ProductAPIBaseAA #
+AA$ %
$strAA& 6
+AA7 8
idAA9 ;
,AA; <
AccessTokenBB 
=BB 
tokenBB 
}CC 	
)CC	 

;CC
 
}DD 
}EE 