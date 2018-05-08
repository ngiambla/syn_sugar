~$[a 
software platforms ]f[ smart cities%%cln%% 
concepts%%lst%% requirements%%lst%% challenges%%lst%% ]^[ %%#%% uni ed reference 
architecture 
eduardo felipe zambom santana%%lst%% university %%#%% %%#%% ao paulo 
ana paula chaves%%lst%% federal technological university %%#%% paran %%#%% 
marco aurelio gerosa%%lst%% university %%#%% %%#%% ao paulo 
fabio kon%%lst%% university %%#%% %%#%% ao paulo 
dejan s%%per%%]$~ ~$[milojicic%%lst%% hewlett packard labs palo alto 
%%#%% cities smarter help improve city services ]^[ increase citizens quality %%#%% life%%per%%]$~ ~$[information ]^[ com%%dsh%% 
munication technologies (ict) %%#%% fundamental ]f[ progressing towards smarter city environments%%per%%]$~ ~$[smart 
city software platforms potentially support %%#%% development ]^[ integration %%#%% smart city applications%%per%%]$~ 
~$[however%%lst%% %%#%% ict community %%#%% overcome current signi cant technological ]^[ scienti %%#%% challenges 
%%#%% %%#%% platforms %%#%% %%#%% widely used%%per%%]$~ ~$[this paper surveys %%#%% state%%dsh%%of%%dsh%%the%%dsh%%art %%#%% software platforms 
]f[ smart cities%%per%%]$~ ~$[we analyzed 23 projects %%#%% respect %%#%% %%#%% %%#%% %%#%% enabling technologies%%lst%% %%#%% %%#%% %%#%% 
functional ]^[ non%%dsh%%functional requirements%%lst%% classifying %%#%% %%#%% %%#%% categories%%cln%% cyber%%dsh%%physical systems%%lst%% 
internet %%#%% things%%lst%% %%#%% data%%lst%% ]^[ cloud computing%%per%%]$~ ~$[based %%#%% %%#%% results%%lst%% %%#%% derived %%#%% reference architec%%dsh%% 
ture %%#%% guide %%#%% development %%#%% next%%dsh%%generation software platforms ]f[ smart cities%%per%%]$~ ~$[finally%%lst%% %%#%% enumer%%dsh%% 
ated %%#%% %%#%% frequently cited %%#%% research challenges%%lst%% ]^[ discussed future opportunities%%per%%]$~ ~$[this survey 
%%#%% %%#%% references ]f[ helping application developers%%lst%% city managers%%lst%% system operators%%lst%% end%%dsh%%users%%lst%% 
]^[ smart city researchers %%#%% %%#%% project%%lst%% investment%%lst%% ]^[ research decisions%%per%%]$~ 
~$[general terms%%cln%% digital cities%%lst%% internet %%#%% things%%lst%% %%#%% data%%lst%% cloud computing%%lst%% cyber%%dsh%%physical systems%%lst%% 
middleware%%lst%% infrastructure 
additional key words ]^[ phrases%%cln%% wireless sensor networks%%lst%% software platforms%%lst%% middleware%%lst%% infrastruc%%dsh%% 
ture 
1%%per%%]$~ ~$[introduction 
%%#%% 2009%%lst%% %%#%% %%#%% %%#%% world %%#%% population lives %%#%% cities [united nations 2009]%%per%%]$~ ~$[cur%%dsh%% 
rent resources ]^[ infrastructure %%#%% hardly %%#%% %%#%% cope %%#%% %%#%% increasing de%%dsh%% 
mand %%#%% population growth ]^[ geographic concentration generates [caragliu et al%%per%% 
2011]%%per%%]$~ ~$[making cities smarter %%#%% help optimize resource ]^[ infrastructure utilization 
%%#%% increased sustainability%%per%%]$~ ~$[one approach involves creatively combining %%#%% large 
amounts %%#%% data generated %%#%% multiple city sources (such %%#%% sensor networks%%lst%% traf %%#%% 
systems%%lst%% user devices%%lst%% ]^[ social networks) %%#%% create integrated services ]^[ appli%%dsh%% 
cations%%lst%% improving city services%%lst%% ]^[ %%#%% %%#%% %%#%% %%#%% city resources%%per%%]$~ ~$[however%%lst%% 
ef ciently ]^[ effectively using %%#%% %%#%% data sources %%#%% %%#%% challenge%%per%%]$~ 
~$[initiatives ]f[ developing smart city systems %%#%% %%#%% proposed %%#%% %%#%% wide range 
%%#%% city services%%lst%% %%#%% %%#%% transportation [djahel et al%%per%% 2014]%%lst%% traf %%#%% control [barba et al%%per%% 
2012]%%lst%% air pollution [vakali et al%%per%% 2014]%%lst%% waste management [perera et al%%per%% 2014]%%lst%% health 
care [hussain et al%%per%% 2015]%%lst%% public safety [galache et al%%per%% 2014]%%lst%% water [p erez%%dsh%%gonz alez 
]^[ %%#%% az%%dsh%%d az 2015]%%lst%% energy [yamamoto et al%%per%% 2014]%%lst%% ]^[ emergency management 
[asimakopoulou ]^[ bessis 2011]%%per%%]$~ ~$[however%%lst%% %%#%% %%#%% %%#%% solutions focus %%#%% %%#%% spe%%dsh%% 
ci %%#%% domain%%lst%% target %%#%% speci %%#%% problem%%lst%% ]^[ %%#%% developed %%#%% scratch%%lst%% %%#%% little 
software reuse%%per%%]$~ ~$[they %%#%% ]n[ interoperate%%lst%% leading %%#%% duplication %%#%% work%%lst%% incompatible 
solutions%%lst%% ]^[ non%%dsh%%optimized resource use%%per%%]$~ 
~$[integrating %%#%% %%#%% %%#%% domains %%#%% %%#%% complete ]^[ consistent solution require ba%%dsh%% 
sic services %%#%% %%#%% underlying software infrastructure%%per%%]$~ ~$[such basic services %%#%% %%#%% 
provided %%#%% %%#%% novel%%lst%% comprehensive software platform%%lst%% %%#%% %%#%% include facilities 
]f[ application development%%lst%% integration%%lst%% deployment%%lst%% ]^[ management%%lst%% easing %%#%% 
7 
1 
0 
2 
l 
%%#%% 
%%#%% 
4 
2 
] 
%%#%% 
%%#%% 
%%per%% 
%%#%% 
%%#%% 
[ 
3 
%%#%% 
9 
8 
0 
8 
0 
%%per%% 
9 
0 
6 
1 
%%cln%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
a:2 
santana%%lst%% e%%per%%]$~ ~$[f%%per%%]$~ ~$[z%%per%% et al%%per%% 
construction %%#%% sophisticated smart cities applications%%per%%]$~ ~$[we de ne %%#%% software platform 
]f[ smart cities %%#%% 
%%#%% integrated middleware environment %%#%% supports software developers %%#%% 
designing%%lst%% implementing%%lst%% deploying%%lst%% ]^[ managing applications ]f[ smart cities%%per%%]$~ 
~$[many challenging issues %%#%% %%#%% %%#%% %%#%% addressed %%#%% %%#%% highly effective software 
platform ]f[ smart cities %%#%% %%#%% created%%lst%% including%%cln%% enabling interoperability %%#%% 
%%#%% city %%#%% multiple systems%%lst%% guaranteeing citizens privacy%%lst%% managing large amounts %%#%% 
data%%lst%% supporting %%#%% required scalability%%lst%% ]^[ dealing %%#%% %%#%% large variety %%#%% sensors%%per%%]$~ 
~$[in %%#%% research described %%#%% %%#%% paper%%lst%% %%#%% evaluated initiatives ]f[ developing soft%%dsh%% 
ware platforms ]f[ smart cities%%lst%% aiming %%#%% comprehensively analyze relevant func%%dsh%% 
tional ]^[ non%%dsh%%functional requirements%%lst%% according %%#%% %%#%% literature%%per%%]$~ ~$[based %%#%% %%#%% anal%%dsh%% 
ysis%%lst%% %%#%% derived %%#%% reference architecture %%#%% addresses %%#%% requirements%%per%%]$~ ~$[with %%#%% 
survey%%lst%% %%#%% intend %%#%% clarify %%#%% aspects %%#%% %%#%% design%%lst%% development%%lst%% ]^[ man%%dsh%% 
agement %%#%% smart cities platforms%%per%%]$~ ~$[to %%#%% so%%lst%% %%#%% examined 23 smart cities software 
platforms%%lst%% aiming %%#%% answer %%#%% following %%#%% research question%%cln%% 
%%#%% %%#%% required ]f[ %%#%% development %%#%% %%#%% software platform ]f[ enabling %%#%% 
construction %%#%% scalable integrated smart city applications%%qsn%%]$~ 
~$[we investigated %%#%% %%#%% speci %%#%% research questions%%cln%% 
rq1:%%per%%]$~ ~$[what %%#%% %%#%% enabling technologies %%#%% %%#%% state%%dsh%%of%%dsh%%the%%dsh%%art software plat%%dsh%% 
forms ]f[ smart cities%%qsn%%]$~ 
~$[rq2:%%per%%]$~ ~$[what %%#%% %%#%% requirements %%#%% %%#%% software platform ]f[ smart cities %%#%% 
meet%%qsn%%]$~ 
~$[rq3:%%per%%]$~ ~$[what %%#%% %%#%% main challenges ]^[ %%#%% research problems %%#%% %%#%% develop%%dsh%% 
ment %%#%% %%#%% generation robust software platforms ]f[ smart cities%%qsn%%]$~ 
~$[to answer research question rq1%%lst%% %%#%% identi ed %%#%% %%#%% common enabling technolo%%dsh%% 
gies employed %%#%% platforms ]f[ smart cities%%per%%]$~ ~$[as described %%#%% section 2%%per%%2%%lst%% %%#%% %%#%% 
%%#%% %%#%% %%#%% main categories%%cln%% internet %%#%% %%#%% (iot) [atzori et al%%per%% 2010]%%lst%% applied 
%%#%% control sensors ]^[ actuators responsible ]f[ retrieving information %%#%% %%#%% city%%scn%% 
%%#%% data [mayer%%dsh%%sch onberger ]^[ cukier 2013]%%lst%% %%#%% support storage ]^[ processing 
%%#%% %%#%% data collected %%#%% %%#%% city%%scn%% cloud computing [armbrust et al%%per%% 2010]%%lst%% %%#%% pro%%dsh%% 
vide elasticity %%#%% %%#%% services ]^[ data storage%%scn%% ]^[ cyber%%dsh%%physical systems [white 
et al%%per%% 2010]%%lst%% %%#%% enable %%#%% interaction %%#%% systems %%#%% %%#%% city environment%%per%%]$~ ~$[to answer 
rq2%%lst%% %%#%% identi ed %%#%% %%#%% common functional ]^[ non%%dsh%%functional requirements ]f[ 
developing %%#%% platform ]f[ smart cities%%lst%% %%#%% described %%#%% section 3%%per%%3%%per%%]$~ ~$[finally%%lst%% %%#%% answer 
rq3%%lst%% %%#%% explored %%#%% main challenges researchers identi ed %%#%% developing software 
platforms ]f[ smart cities%%lst%% %%#%% discussed %%#%% section 4%%per%%]$~ 
~$[combining %%#%% results %%#%% %%#%% %%#%% research questions%%lst%% %%#%% derived %%#%% reference archi%%dsh%% 
tecture%%per%%]$~ ~$[this architecture %%#%% components ]f[ implementing %%#%% software platform 
]f[ smart cities%%lst%% based %%#%% %%#%% %%#%% common enabling technologies%%lst%% %%#%% requirements%%lst%% 
]^[ challenges surveyed %%#%% %%#%% research%%per%%]$~ ~$[we %%#%% discuss %%#%% critical implications %%#%% 
platforms ]f[ smart cities %%#%% %%#%% section 6%%per%%]$~ 
~$[the remainder %%#%% %%#%% paper %%#%% organized %%#%% follows%%per%%]$~ ~$[section 2 %%#%% %%#%% de nition 
%%#%% smart cities ]^[ introduces %%#%% %%#%% enabling technologies ]f[ platforms ]f[ smart 
cities%%per%%]$~ ~$[section 3 %%#%% %%#%% platforms%%lst%% architectures%%lst%% ]^[ implemented systems ]f[ 
smart cities%%lst%% %%#%% according %%#%% %%#%% enabling technologies %%#%% %%#%% platform uses%%per%%]$~ 
~$[section 4 %%#%% %%#%% challenges ]^[ %%#%% research problems %%#%% %%#%% development %%#%% %%#%% 
platform ]f[ smart cities%%per%%]$~ ~$[in section 5%%lst%% %%#%% %%#%% %%#%% reference architecture ]f[ soft%%dsh%% 
ware platforms ]f[ smart cities%%per%%]$~ ~$[in section 6%%lst%% %%#%% discuss %%#%% relationship %%#%% %%#%% 
software platforms ]f[ smart cities 
a:3 
requirements ]^[ %%#%% enabling technologies %%#%% %%#%% %%#%% %%#%% implications ]f[ %%#%% de%%dsh%% 
velopment %%#%% software platforms ]f[ smart cities%%per%%]$~ ~$[section 7 %%#%% %%#%% related %%#%% 
and%%lst%% nally%%lst%% section 8 %%#%% %%#%% conclusions%%per%% 
2%%per%%]$~ ~$[main concepts 
%%#%% %%#%% introduce %%#%% main concepts %%#%% %%#%% %%#%% discussions %%#%% %%#%% survey%%per%%]$~ ~$[we 
rst %%#%% de nitions %%#%% smart cities and%%lst%% %%cmp_t%%%%lst%% discuss %%#%% %%#%% adopted enabling 
technologies ]f[ %%#%% development %%#%% software platforms ]f[ smart cities%%per%% 
2%%per%%1%%per%%]$~ ~$[smart cities 
%%#%% term smart city %%#%% %%#%% %%#%% de nitions%%per%%]$~ ~$[some exceed %%#%% software con%%dsh%% 
text%%lst%% focusing %%#%% %%#%% social ]v[ business aspects%%per%%]$~ ~$[regarding software systems%%lst%% %%#%% 
authors de ne %%#%% smart city %%#%% %%#%% integration %%#%% social%%lst%% physical%%lst%% ]^[ %%#%% infrastruc%%dsh%% 
ture %%#%% improve %%#%% quality %%#%% city services [caragliu et al%%per%% 2011%%scn%% hollands 2008]%%per%%]$~ ~$[other 
authors focus %%#%% %%#%% set %%#%% information ]^[ communication technology (ict) tools %%#%% 
%%#%% create %%#%% integrated smart city environment [hollands 2008%%scn%% washburn et al%%per%% 2009%%scn%% 
hall et al%%per%% 2000]%%per%%]$~ 
~$[gif nger et al%%per%% [gif nger et al%%per%% 2007] assert %%#%% %%#%% smart city %%#%% six main dimen%%dsh%% 
sions%%cln%% smart economy%%lst%% smart people%%lst%% smart governance%%lst%% smart mobility%%lst%% smart environ%%dsh%% 
ment%%lst%% ]^[ smart living%%per%%]$~ ~$[many authors adopt %%#%% de nition [hernndez%%dsh%%mu noz et al%%per%% 
2011%%scn%% papa et al%%per%% 2013] ]^[ %%#%% %%#%% %%#%% benchmarks %%#%% produce %%#%% ranking %%#%% %%#%% 
smartest city using %%#%% dimensions1%%per%%]$~ 
~$[in %%#%% de nition %%#%% smart cities%%lst%% washburn et al%%per%% [washburn et al%%per%% 2009] ]^[ hall 
et al%%per%% [hall et al%%per%% 2000] emphasize integrating software services ]^[ applications %%#%% 
improve regular city services ]^[ %%#%% lives %%#%% %%#%% citizens%%per%%]$~ ~$[following %%#%% idea%%lst%% kanter 
]^[ litow [kanter ]^[ litow 2009] declare %%#%% creating independent software ]f[ 
%%#%% city domain %%#%% ]n[ suf cient ]f[ creating %%#%% environment ]f[ smart cities%%per%%]$~ ~$[they 
contend %%#%% %%#%% city sub%%dsh%%systems (such %%#%% transport%%lst%% education%%lst%% energy%%lst%% ]^[ water) 
%%#%% %%#%% linked %%#%% %%#%% network %%#%% %%#%% organic %%#%% %%#%% provide integration %%#%% %%#%% city 
subsystems%%per%%]$~ ~$[caragliu et al%%per%% [caragliu et al%%per%% 2011] de nition %%#%% smart cities highlights 
%%#%% signi cant bene %%#%% %%#%% sustainability ]^[ management %%#%% natural resources%%per%%]$~ 
~$[we %%#%% aligned %%#%% %%#%% vision %%#%% %%#%% city %%#%% %%#%% %%#%% integrated environment 
%%#%% facilitate %%#%% interoperability %%#%% %%#%% city %%#%% sub%%dsh%%systems%%per%%]$~ ~$[based %%#%% that%%lst%% %%#%% %%#%% 
view%%cln%% 
%%#%% smart city %%#%% %%#%% city %%#%% %%#%% %%#%% social%%lst%% business%%lst%% ]^[ technological aspects %%#%% 
supported %%#%% information ]^[ communication technologies %%#%% improve %%#%% experience 
%%#%% %%#%% citizen %%#%% %%#%% city%%per%%]$~ ~$[to achieve that%%lst%% %%#%% city provides public ]^[ private 
services %%#%% operate %%#%% %%#%% integrated%%lst%% affordable%%lst%% ]^[ sustainable way%%per%%]$~ 
~$[to %%#%% %%#%% city smarter%%lst%% %%#%% %%#%% desirable %%#%% integrate services ]^[ applications %%#%% %%#%% 
uni ed technological infrastructure%%per%%]$~ ~$[a sensible %%#%% %%#%% %%#%% %%#%% %%#%% reality %%#%% %%#%% 
%%#%% well%%dsh%%designed software platform providing %%#%% necessary infrastructure ]f[ dealing 
%%#%% large volumes %%#%% data%%lst%% %%#%% wide variety %%#%% devices ]^[ applications%%lst%% system interop%%dsh%% 
erability%%lst%% ]^[ %%#%% problems related %%#%% smart city environments%%per%%]$~ 
~$[there %%#%% multiple smart city initiatives %%#%% %%#%% variety %%#%% countries %%#%% %%#%% world%%lst%% 
%%#%% %%#%% maturity levels ]^[ applications %%#%% %%#%% domains%%per%%]$~ ~$[most %%#%% %%#%% ini%%dsh%% 
tiatives %%#%% %%#%% europe [caragliu et al%%per%% 2011%%scn%% manville et al%%per%% 2014]%%lst%% %%#%% usa2%%lst%% japan%%lst%% 
]^[ south korea [liu ]^[ peng 2013]%%per%%]$~ ~$[isolated initiatives exist %%#%% countries %%#%% %%#%% 
brazil [fortes et al%%per%% 2014] ]^[ %%#%% united arab emirates [janajreh et al%%per%% 2013]%%per%%]$~ ~$[figure 
1smarts cities %%#%% europe %%dsh%% http://www%%per%%smart%%dsh%%cities%%per%%eu 
210 smartest cities %%#%% usa %%dsh%% http://www%%per%%fastcoexist%%per%%com/3021592/the%%dsh%%10%%dsh%%smartest%%dsh%%cities%%dsh%%in%%dsh%%north%%dsh%%america 
a:4 
santana%%lst%% e%%per%%]$~ ~$[f%%per%%]$~ ~$[z%%per%% et al%%per%% 
1 %%#%% %%#%% map %%#%% cities %%#%% %%#%% %%#%% least %%#%% smart city project included %%#%% %%#%% 
survey%%per%%]$~ ~$[the map %%#%% %%#%% %%#%% %%#%% %%#%% projects %%#%% located %%#%% developed countries%%lst%% %%#%% 
%%#%% %%#%% developing countries%%lst%% ]^[ none %%#%% underdeveloped countries%%lst%% %%#%% %%#%% %%#%% ]f[ 
improvements %%#%% urban quality %%#%% life %%#%% %%#%% pressing%%per%%]$~ 
~$[fig%%per%% 1%%per%%]$~ ~$[smart cities initiatives covered %%#%% %%#%% survey%%per%% 
2%%per%%2%%per%%]$~ ~$[enabling technologies 
%%#%% answer %%#%% question %%#%% %%#%% %%#%% main enabling technologies %%#%% %%#%% state%%dsh%%of%%dsh%% 
the%%dsh%%art software platforms ]f[ smart cities? %%lst%% %%#%% %%#%% %%#%% %%#%% common enabling 
technologies %%#%% %%#%% found %%#%% %%#%% literature review%%per%%]$~ ~$[we observed %%#%% main technolo%%dsh%% 
gies %%#%% %%#%% software platforms ]f[ smart cities%%cln%% cyber%%dsh%%physical systems%%lst%% internet %%#%% 
things%%lst%% %%#%% data%%lst%% ]^[ cloud computing%%per%%]$~ ~$[in %%#%% section%%lst%% %%#%% %%#%% %%#%% overview ]^[ re%%dsh%% 
late %%#%% %%#%% smart city research%%per%%]$~ ~$[these technologies %%#%% %%#%% later %%#%% %%#%% paper %%#%% 
%%#%% %%#%% analyzed platforms ]^[ help %%#%% understand %%#%% %%#%% requirements %%#%% %%#%% 
platforms %%#%% address%%per%%]$~ 
~$[figure 2 %%#%% %%#%% overview %%#%% %%#%% %%#%% enabling technologies %%#%% %%#%% found %%#%% %%#%% 
survey ]^[ examples %%#%% %%#%% %%#%% contribute %%#%% %%#%% platform ]f[ smart cities%%per%% 
2%%per%%2%%per%%1%%per%%]$~ ~$[cyber%%dsh%%physical systems%%per%%]$~ ~$[cyber%%dsh%%physical systems (cps) %%#%% %%#%% characterized %%#%% 
%%#%% %%#%% %%#%% computation ]^[ communication technologies %%#%% improve %%#%% features %%#%% 
physical systems%%per%%]$~ ~$[wan et al%%per%% [wan et al%%per%% 2010] de ne cps %%#%% integration %%#%% computation 
%%#%% physical processes%%per%%]$~ ~$[the authors suggest %%#%% %%#%% %%#%% local ]^[ remote computational 
models %%#%% networked embedded computers %%#%% monitor ]^[ control physical processes%%per%%]$~ 
~$[many real%%dsh%%world applications %%#%% leverage cps [white et al%%per%% 2010]%%lst%% %%#%% %%#%% 
smart cities%%lst%% power grid control systems%%lst%% ]^[ electronic medical devices%%per%%]$~ ~$[however%%lst%% 
%%#%% authors [wan et al%%per%% 2010] claim %%#%% existing ict solutions %%#%% ]n[ support appli%%dsh%% 
cations %%#%% dynamically changing physical contexts%%per%%]$~ ~$[thus%%lst%% applying cps %%#%% intro%%dsh%% 
duce %%#%% requirement %%#%% smart city applications%%per%%]$~ ~$[according %%#%% gurgen et al%%per%% [gurgen 
et al%%per%% 2013]%%lst%% cps enables applications %%#%% %%#%% aware %%#%% %%#%% changes %%#%% %%#%% physical 
context adapting %%#%% execution according %%#%% it%%per%%]$~ 
~$[an example %%#%% %%#%% cyber%%dsh%%physical system related %%#%% smart cities %%#%% wreckwatch 
[white et al%%per%% 2010]%%lst%% %%#%% application ]f[ detecting traf %%#%% accidents%%per%%]$~ ~$[this application %%#%% 
developed ]f[ smart phones%%scn%% %%#%% reads %%#%% device %%#%% accelerometer ]^[ gps getting %%#%% 
driver %%#%% current speed ]^[ acceleration%%per%%]$~ ~$[in %%#%% %%#%% %%#%% strong deceleration%%lst%% %%#%% data %%#%% 
software platforms ]f[ smart cities 
a:5 
fig%%per%% 2%%per%%]$~ ~$[platforms ]f[ smart cities enabling technologies 
analysed using %%#%% accident prediction model ]^[ %%cmp_if%% %%#%% indicates %%#%% accident%%lst%% %%#%% appli%%dsh%% 
cation generates %%#%% alert %%#%% %%#%% centralized server%%per%% 
2%%per%%2%%per%%2%%per%%]$~ ~$[internet %%#%% things%%per%%]$~ ~$[coetzee ]^[ eksteen [coetzee ]^[ eksteen 2011] de ne iot 
%%#%% situations %%#%% objects %%#%% %%#%% %%#%% %%#%% internet%%per%%]$~ ~$[according %%#%% %%#%% authors%%lst%% %%#%% 
objects %%#%% %%#%% %%#%% uniquely identi ed%%lst%% %%#%% recognized position ]^[ status%%lst%% ]^[ acces%%dsh%% 
sible %%#%% %%#%% network%%per%%]$~ ~$[gubbi et al%%per%% (2013) [gubbi et al%%per%% 2013] de ne %%#%% components 
%%#%% %%#%% iot environment%%cln%% %%#%% hardware%%lst%% %%#%% includes sensors%%lst%% actuators%%lst%% ]^[ embed%%dsh%% 
ded communication hardware%%scn%% %%#%% middleware%%lst%% %%#%% processes ]^[ stores data received 
%%#%% %%#%% hardware%%scn%% ]^[ %%#%% presentation layer%%lst%% %%#%% %%#%% users access%%lst%% manipulate%%lst%% ]^[ 
visualize data extracted %%#%% %%#%% hardware%%per%%]$~ ~$[in %%#%% sense%%lst%% %%#%% %%#%% %%#%% similar %%#%% %%#%% 
%%#%% expect %%#%% %%#%% platform ]f[ smart cities%%per%%]$~ 
~$[the %%#%% large number %%#%% devices %%#%% %%#%% collect data %%#%% cities forces platforms ]f[ 
smart cities %%#%% %%#%% iot technologies%%per%%]$~ ~$[the data collected %%#%% %%#%% devices %%#%% %%#%% 
transmitted via interconnected networks ]s[ %%#%% %%#%% %%#%% %%#%% %%#%% ]^[ processed 
%%#%% provide advanced smart city services%%per%%]$~ ~$[zanella et al%%per%% [zanella et al%%per%% 2014] %%#%% 
multiple potential %%#%% %%#%% %%#%% internet %%#%% %%#%% ]f[ smart cities%%lst%% e%%per%%g%%per%%%%lst%% monitoring 
%%#%% health %%#%% historical buildings%%lst%% detecting %%#%% load level %%#%% waste containers%%lst%% sensing 
noise %%#%% central areas %%#%% %%#%% city%%lst%% observing %%#%% conditions %%#%% traf %%#%% lights%%lst%% ]^[ analyz%%dsh%% 
ing %%#%% usage %%#%% energy %%#%% smart homes%%per%% 
2%%per%%2%%per%%3%%per%%]$~ ~$[big data%%per%%]$~ ~$[most authors consider %%#%% data %%#%% %%#%% set %%#%% techniques ]^[ tools %%#%% 
store ]^[ manipulate large data sets whereas conventional technologies%%lst%% %%#%% %%#%% rela%%dsh%% 
tional databases ]^[ sequential processing tools%%lst%% %%#%% deal %%#%% %%#%% %%#%% vast volume 
%%#%% data%%per%%]$~ ~$[there %%#%% %%#%% major characteristics %%#%% %%#%% data [chen et al%%per%% 2014%%scn%% demchenko 
et al%%per%% 2014]%%cln%% 
volume%%cln%% %%#%% scale %%#%% data generated ]^[ collected %%#%% rapidly increasing%%lst%% ]^[ %%#%% data 
tools %%#%% deal %%#%% %%#%% challenge%%per%%]$~ ~$[in smart cities%%lst%% %%#%% volume %%#%% data %%#%% %%#%% mas%%dsh%% 
sive%%lst%% coming %%#%% %%#%% data sources distributed %%#%% %%#%% city%%per%%]$~ 
~$[variety%%cln%% data %%#%% collected %%#%% %%#%% sources%%lst%% ]^[ %%#%% structured%%lst%% semi%%dsh%% 
structured%%lst%% ]v[ unstructured formats%%lst%% %%#%% %%#%% video records%%lst%% relational databases%%lst%% ]^[ 
a:6 
santana%%lst%% e%%per%%]$~ ~$[f%%per%%]$~ ~$[z%%per%% et al%%per%% 
raw texts%%lst%% respectively%%per%%]$~ ~$[this %%#%% %%#%% ]f[ smart cities%%lst%% %%#%% city data %%#%% collected 
%%#%% multiple sources%%lst%% %%#%% %%#%% surveillance cameras%%lst%% sensors%%lst%% ]^[ citizen devices%%per%%]$~ 
~$[velocity%%cln%% data processing %%#%% %%#%% fast and%%lst%% %%#%% %%#%% cases%%lst%% real%%dsh%%time%%lst%% ]v[ %%#%% %%#%% %%#%% 
useless%%per%%]$~ ~$[city infrastructure%%lst%% operators%%lst%% ]^[ managers %%#%% %%#%% respond %%#%% urban prob%%dsh%% 
lems%%lst%% %%#%% %%#%% traf %%#%% jams%%lst%% accidents%%lst%% ]^[ oods%%lst%% %%#%% short time%%per%%]$~ 
~$[veracity%%cln%% %%cmp_b%% %%#%% %%#%% large amount %%#%% data collected%%lst%% ]^[ %%#%% %%#%% %%#%% multiple data 
sources%%lst%% %%#%% %%#%% %%#%% %%#%% ensure data quality%%lst%% %%cmp_b%% errors %%#%% %%#%% data ]v[ %%#%% usage 
%%#%% unreliable sources %%#%% compromise %%#%% analysis%%per%%]$~ ~$[in cities%%lst%% incorrect gps readings%%lst%% 
malfunctioning sensors%%lst%% ]^[ malicious users %%#%% %%#%% sources %%#%% poor data%%per%%]$~ 
~$[figure 3 relates %%#%% %%#%% vs %%#%% %%#%% data %%#%% smart cities needs%%per%%]$~ 
~$[fig%%per%% 3%%per%% 4 vs %%#%% %%#%% data 
smart cities %%#%% %%#%% %%#%% data tools %%#%% support %%#%% amount %%#%% data generated 
%%#%% city devices%%per%%]$~ ~$[sensor networks regularly transmit data %%#%% city conditions%%lst%% %%#%% 
%%#%% temperature%%lst%% air quality%%lst%% ]^[ pluviometry%%per%%]$~ ~$[citizens generate data using smart%%dsh%% 
phones ]^[ social networks%%lst%% ]^[ vehicles continuously send %%#%% positions%%per%%]$~ 
~$[big data tools %%#%% %%#%% %%#%% %%#%% smart city platforms%%lst%% including%%cln%% nosql 
databases [khan et al%%per%% 2013%%scn%% bain 2014]%%lst%% %%#%% %%#%% mongodb ]^[ hbase%%scn%% parallel data 
processing tools [parkavi ]^[ vetrivelan 2013%%scn%% takahashi et al%%per%% 2012]%%lst%% %%#%% %%#%% apache 
hadoop ]^[ apache spark%%scn%% real%%dsh%%time data streams processing tools [girtelschmid et al%%per%% 
2013]%%lst%% %%#%% %%#%% apache storm%%scn%% ]^[ visualization tools [khan et al%%per%% 2013]%%lst%% %%#%% %%#%% rapid%%dsh%% 
miner%%per%%]$~ 
~$[al nuaimi et al%%per%% [al nuaimi et al%%per%% 2015] discuss potential applications %%#%% %%#%% data 
tools %%#%% smart cities%%lst%% %%#%% %%#%% recognizing traf %%#%% patterns ]^[ using historic data %%#%% 
locate %%#%% causes ]^[ avoid traf %%#%% jams%%lst%% facilitating %%#%% decisions %%#%% city governments 
using analyses %%#%% large data sets%%lst%% ]^[ predicting %%#%% %%#%% %%#%% resources%%lst%% %%#%% %%#%% electric%%dsh%% 
ity%%lst%% water%%lst%% ]^[ gas%%lst%% %%#%% %%#%% situations using historic ]^[ real%%dsh%%time data%%per%%]$~ 
~$[software platforms ]f[ smart cities 
a:7 
2%%per%%2%%per%%4%%per%%]$~ ~$[cloud computing%%per%%]$~ ~$[cloud computing offers %%#%% %%#%% large%%lst%% elastic%%lst%% ]^[ highly avail%%dsh%% 
able infrastructure ]f[ %%#%% data storage ]^[ computation%%lst%% %%#%% %%#%% essential ]f[ com%%dsh%% 
plex smart city systems%%per%%]$~ ~$[in addition%%lst%% %%#%% smart city environment %%#%% %%#%% highly dy%%dsh%% 
namic%%lst%% requiring recon gurations %%#%% %%#%% underlying infrastructure%%lst%% %%#%% %%#%% %%#%% sup%%dsh%% 
ported %%#%% cloud computing%%per%%]$~ 
~$[many authors%%lst%% %%#%% %%#%% [distefano et al%%per%% 2012%%scn%% aazam et al%%per%% 2014]%%lst%% %%#%% advocated 
combining iot ]^[ cloud computing%%lst%% coining %%#%% term cloud %%#%% %%#%% %%per%%]$~ ~$[their idea 
%%#%% %%#%% store ]^[ process %%#%% %%#%% data %%#%% %%#%% iot network %%#%% %%#%% cloud computing environ%%dsh%% 
ment%%lst%% %%#%% %%#%% currently %%#%% %%#%% %%#%% smart city projects [mitton et al%%per%% 2012%%scn%% tei ]^[ 
gurgen 2014]%%per%%]$~ 
~$[another concept related %%#%% %%#%% cloud computing environment %%#%% smart cities %%#%% soft%%dsh%% 
ware %%#%% %%#%% service (saas)%%lst%% %%#%% provides %%#%% sensor data %%#%% %%#%% cloud computing in%%dsh%% 
frastructure%%per%%]$~ ~$[the %%#%% %%#%% perera et al%%per%% [perera et al%%per%% 2014] extends %%#%% concept%%lst%% using 
%%#%% term sensing %%#%% %%#%% service %%per%%]$~ ~$[the clout platform%%lst%% %%#%% %%#%% [tei ]^[ gurgen 
2014]%%lst%% %%#%% %%#%% %%#%% concept %%#%% software services ]^[ de nes %%#%% terms city applica%%dsh%% 
tion software %%#%% %%#%% service (csaas) ]^[ city platform %%#%% %%#%% service (cpaas)%%per%%]$~ 
~$[some authors relate %%#%% %%#%% %%#%% cloud computing%%lst%% %%#%% data%%lst%% ]^[ iot [chen et al%%per%% 
2014%%scn%% aazam et al%%per%% 2014]%%lst%% %%cmp_b%% %%#%% cloud environment %%#%% %%#%% ideal infrastructure %%#%% 
store data ]^[ execute services%%per%%]$~ ~$[hence%%lst%% %%#%% data generated %%#%% %%#%% iot middleware 
%%#%% %%#%% stored ]^[ processed %%#%% %%#%% cloud environment using %%#%% data tools%%per%%]$~ ~$[this syn%%dsh%% 
ergistic combination helps %%#%% support %%#%% non%%dsh%%functional requirements %%#%% %%#%% 
scalability%%lst%% elasticity%%lst%% ]^[ security%%per%% 
3%%per%%]$~ ~$[platforms %%#%% smart cities 
%%#%% describe %%#%% various platforms ]f[ smart cities %%#%% %%#%% %%#%% literature%%per%%]$~ ~$[all 
platforms %%#%% %%#%% least %%#%% %%#%% %%#%% enabling technologies discussed %%#%% section 2%%per%%2%%per%%]$~ 
~$[to nd %%#%% studies%%lst%% %%#%% %%#%% %%#%% following query string%%cln%% %%#%% smart city ]v[ smart 
cities %%#%% ]^[ (platform ]v[ middleware ]v[ architecture)%%per%%]$~ ~$[after analyzing %%#%% query results%%lst%% 
%%#%% focused %%#%% study %%#%% 47 papers describing smart city platforms ]^[ applications%%per%%]$~ 
~$[we %%#%% ]n[ include %%#%% %%#%% search %%#%% terms %%#%% %%#%% %%#%% rarely %%#%% %%#%% describe 
%%#%% application %%#%% ict %%#%% cities%%lst%% %%#%% %%#%% knowledge city %%lst%% intelligent city %%lst%% ]^[ con%%dsh%% 
nected city %%per%%]$~ ~$[figure 4 illustrates %%#%% %%#%% %%#%% %%#%% expressions %%#%% recent %%#%% using 
google trends%%per%%]$~ 
~$[fig%%per%% 4%%per%%]$~ ~$[trends %%#%% smart city related terms 
a:8 
santana%%lst%% e%%per%%]$~ ~$[f%%per%%]$~ ~$[z%%per%% et al%%per%%]$~ 
~$[since %%#%% expression digital city %%#%% %%#%% used%%lst%% %%#%% analyzed %%#%% de nition %%#%% %%#%% 
expression ]^[ %%#%% differences %%#%% smart cities %%per%%]$~ ~$[we found that%%lst%% normally%%lst%% %%#%% de%%dsh%% 
scription %%#%% %%#%% digital city relates %%#%% %%#%% %%#%% %%#%% digital technologies %%#%% %%#%% city%%lst%% ]b[ ]n[ %%#%% 
%%#%% goal %%#%% %%#%% smart services ]^[ improving %%#%% city %%#%% overall infrastructure%%per%%]$~ ~$[in 
%%#%% digital city%%lst%% %%#%% integration %%#%% %%#%% multiple systems %%#%% ]n[ %%#%% stake%%per%%]$~ ~$[the differences 
%%#%% %%#%% %%#%% concepts %%#%% discussed %%#%% cocchia [cocchia 2014] ]^[ %%#%% yin et al%%per%% 
[yin et al%%per%% 2015]%%per%%]$~ 
~$[the %%#%% subsection describes existing platforms%%lst%% developed %%#%% research projects 
%%#%% %%#%% approaches%%per%%]$~ ~$[subsection 3%%per%%2 %%#%% systems developed using %%#%% plat%%dsh%% 
forms%%per%%]$~ ~$[finally%%lst%% %%#%% subsection 3%%per%%3%%lst%% %%#%% %%#%% %%#%% set %%#%% functional ]^[ non%%dsh%%functional 
requirements extracted %%#%% %%#%% analysis %%#%% %%#%% platforms ]^[ systems described %%#%% 
%%#%% previous subsections%%per%% 
3%%per%%1%%per%%]$~ ~$[platform categories 
%%#%% facilitate %%#%% presentation%%lst%% %%#%% divided %%#%% platforms %%#%% ve categories%%lst%% according 
%%#%% %%#%% enabling technologies %%#%% %%#%% platform uses%%per%%]$~ ~$[figure 5 %%#%% %%#%% overview 
%%#%% %%#%% platforms ]f[ smart cities %%#%% %%#%% analyzed%%per%%]$~ ~$[in %%#%% gure%%lst%% %%#%% %%#%% observe 
%%#%% %%#%% platforms %%#%% cloud computing%%per%%]$~ ~$[almost %%#%% %%#%% %%#%% %%#%% %%#%% least %%#%% %%#%% 
enabling technology%%lst%% %%#%% commonly iot ]^[ %%#%% data%%per%%]$~ 
~$[fig%%per%% 5%%per%%]$~ ~$[use %%#%% enabling technologies %%#%% smart city platforms 
3%%per%%1%%per%%1%%per%%]$~ ~$[internet %%#%% %%#%% ]^[ cloud computing%%per%%]$~ ~$[in %%#%% section%%lst%% %%#%% %%#%% %%#%% platforms 
%%#%% %%#%% %%#%% iot ]^[ cloud computing %%#%% enabling technologies%%per%%]$~ 
~$[smartsantander %%#%% %%#%% experimental infrastructure %%#%% support %%#%% development ]^[ 
deployment %%#%% smart city applications ]^[ services [sanchez et al%%per%% 2014]%%per%%]$~ ~$[the project 
%%#%% centered %%#%% santander%%lst%% spain%%lst%% %%#%% %%#%% facilities %%#%% %%#%% european cities%%per%%]$~ ~$[the 
platform processes %%#%% large variety %%#%% information%%lst%% including data %%#%% traf %%#%% condi%%dsh%% 
tions%%lst%% temperature%%lst%% co2 emissions%%lst%% humidity%%lst%% ]^[ luminosity%%per%%]$~ ~$[currently%%lst%% %%#%% project 
%%#%% implanted %%#%% %%cmp_ta%% 20,000 sensors %%#%% %%#%% city%%per%%]$~ 
~$[software platforms ]f[ smart cities 
a:9 
padova smart city [zanella et al%%per%% 2014] %%#%% iot %%#%% create %%#%% sensor network %%#%% %%#%% 
city %%#%% padova%%lst%% italy%%per%%]$~ ~$[using %%#%% %%cmp_ta%% %%#%% hundred sensors%%lst%% %%#%% platform collects 
environmental data%%lst%% %%#%% %%#%% co2 emissions ]^[ air temperature%%lst%% ]^[ monitors street 
lights%%per%%]$~ ~$[a feature highlighted %%#%% %%#%% platform %%#%% %%#%% %%#%% %%#%% common protocols ]^[ data 
formats %%#%% allow interoperability %%#%% multiple city systems%%per%%]$~ 
~$[the european platform ]f[ intelligent cities (epic) project [ballon et al%%per%% 2011] pro%%dsh%% 
poses %%#%% complete iot middleware %%#%% facilitate %%#%% %%#%% ]^[ management %%#%% %%#%% wireless 
sensor network (wsn)%%per%%]$~ ~$[this middleware aims %%#%% deal %%#%% %%#%% heterogeneity%%lst%% interop%%dsh%% 
erability%%lst%% scalability%%lst%% extensibility%%lst%% ]^[ con gurability problems %%#%% %%#%% wsn%%per%%]$~ 
~$[clout [tei ]^[ gurgen 2014] proposes %%#%% two%%dsh%%layer architecture %%#%% collect data %%#%% 
%%#%% wsn ]^[ manage %%#%% sensors ]^[ actuators %%#%% %%#%% city network [galache et al%%per%% 
2014]%%per%%]$~ ~$[the rst layer %%#%% %%#%% sensors ]^[ actuators layer%%lst%% %%#%% handles data %%#%% %%#%% 
wsn%%per%%]$~ ~$[the %%#%% layer%%lst%% %%#%% iot kernel layer%%lst%% manages ]^[ monitors %%#%% sensors ]^[ 
actuators network%%per%%]$~ 
~$[openmtc [elmangoush et al%%per%% 2013] (open machine type communications) %%#%% %%#%% 
machine%%dsh%%to%%dsh%%machine (m2m) based communication platform ]f[ smart cities%%per%%]$~ ~$[its goal 
%%#%% %%#%% enable ef cient communication %%#%% %%#%% large number %%#%% devices%%lst%% associating %%#%% 
%%#%% multiple services%%per%%]$~ ~$[to achieve this%%lst%% %%#%% platform supports standard interfaces %%#%% 
various types %%#%% devices%%lst%% data/event processing methods %%#%% achieve real%%dsh%%time perfor%%dsh%% 
mance%%lst%% ]^[ easy application development%%lst%% providing %%#%% software development kit%%per%%]$~ 
~$[the analysis %%#%% %%#%% platforms aforementioned led %%#%% %%#%% identi cation %%#%% %%#%% major 
functional requirements%%cln%% management %%#%% %%#%% wsn%%lst%% management %%#%% %%#%% data collected 
%%#%% %%#%% city%%lst%% management %%#%% services ]^[ applications%%lst%% ]^[ %%#%% infrastructure %%#%% %%#%% 
%%#%% data %%#%% %%#%% platform available %%#%% city applications%%per%%]$~ ~$[this analysis %%#%% led %%#%% %%#%% 
identi cation %%#%% ve non%%dsh%%functional requirements%%cln%% adaptation%%lst%% interoperability%%lst%% scala%%dsh%% 
bility%%lst%% extensibility%%lst%% ]^[ con gurability%%per%%]$~ 
~$[we identify %%#%% weak %%#%% %%#%% %%#%% platforms%%cln%% (1) %%#%% lack %%#%% pre%%dsh%%processing compo%%dsh%% 
nents %%#%% verify %%#%% integrity %%#%% %%#%% data collected %%#%% %%#%% city ]^[ %%#%% %%#%% transfor%%dsh%% 
mations %%#%% %%#%% data%%lst%% %%#%% %%#%% aggregations%%lst%% ]^[ (2) %%#%% %%#%% %%#%% platforms %%#%% ]n[ include 
%%#%% discussion %%#%% security concerns%%per%% 
3%%per%%1%%per%%2%%per%%]$~ ~$[internet %%#%% things%%lst%% cloud computing%%lst%% ]^[ %%#%% data%%per%%]$~ ~$[in %%#%% subsection%%lst%% %%#%% %%#%% 
platforms %%#%% %%#%% iot%%lst%% cloud computing%%lst%% ]^[ %%#%% data %%#%% enabling technologies%%per%%]$~ 
~$[openiot3 %%#%% %%#%% %%#%% source middleware ]f[ %%#%% development %%#%% iot%%dsh%%based applica%%dsh%% 
tions%%per%%]$~ ~$[it %%#%% %%#%% api %%#%% manage %%#%% wsn%%lst%% ]^[ %%#%% directory service %%#%% dynamically dis%%dsh%% 
cover %%#%% sensors deployed %%#%% %%#%% city%%scn%% %%#%% %%#%% %%#%% %%#%% layer ]f[ service de nition ]^[ 
access%%per%%]$~ ~$[big data tools %%#%% %%#%% %%#%% store ]^[ analyze %%#%% data %%#%% %%#%% platform%%per%%]$~ ~$[a 
smart city project called vital [petrolo et al%%per%% 2014] builds %%#%% %%#%% platform ]^[ %%#%% 
%%#%% term cloud %%#%% %%#%% %%#%% refer %%#%% %%#%% %%#%% %%#%% cloud computing ]^[ iot%%per%%]$~ 
~$[the concinnity project provides %%#%% platform ]f[ managing data ]^[ applications fol%%dsh%% 
lowing %%#%% paas model [wu et al%%per%% 2014]%%lst%% %%#%% %%#%% %%#%% authors built %%#%% sensor data 
applications%%per%%]$~ ~$[however%%lst%% %%#%% platform focuses %%#%% multiple data sources %%#%% %%#%% %%#%% 
wsn%%lst%% social networks%%lst%% ]^[ data %%#%% platform users%%per%%]$~ ~$[it %%#%% includes %%#%% service di%%dsh%% 
rectory %%#%% developers %%#%% nd ]^[ publish services facilitating %%#%% reuse%%per%%]$~ 
~$[openiot ]^[ concinnity%%lst%% offer developers tools %%#%% implement applications directly 
%%#%% %%#%% platform%%per%%]$~ ~$[openiot allows %%#%% mash%%dsh%%up %%#%% %%#%% services de ned %%#%% %%#%% platform 
]^[ automatically creates %%#%% visual interface ]f[ end%%dsh%%users%%per%%]$~ ~$[concinnity provides %%#%% set %%#%% 
development tools%%lst%% %%#%% %%#%% %%#%% %%#%% ow editor ]^[ engine%%lst%% %%#%% service publisher%%lst%% ]^[ %%#%% 
application editor%%per%% 
3openiot %%dsh%% https://github%%per%%com/openiotorg/openiot 
a:10 
santana%%lst%% e%%per%%]$~ ~$[f%%per%%]$~ ~$[z%%per%% et al%%per%%]$~ 
~$[sentilo [bain 2014] %%#%% platform %%#%% deals %%#%% %%#%% management %%#%% sensors ]^[ ac%%dsh%% 
tuators%%lst%% designed ]f[ smart cities %%#%% looks ]f[ openness ]^[ interoperability%%per%%]$~ ~$[sentilo 
%%#%% iot concepts %%#%% control %%#%% wsn%%lst%% ]^[ cloud computing %%#%% share data %%#%% %%#%% 
applications%%per%%]$~ ~$[big data tools %%#%% mainly %%#%% %%#%% collect ]^[ store data %%#%% sensors%%lst%% en%%dsh%% 
suring platform scalability%%per%%]$~ ~$[the sentilo project %%#%% originally designed %%#%% %%#%% deployed 
%%#%% %%#%% city %%#%% barcelona%%scn%% %%#%% %%#%% deployment%%lst%% %%#%% city released %%#%% code %%#%% %%#%% 
lgpl ]^[ eupl %%#%% source licenses%%per%%]$~ 
~$[the main functional requirements identi ed ]f[ %%#%% %%#%% %%#%% platforms were%%cln%% man%%dsh%% 
agement %%#%% %%#%% wsn%%lst%% management %%#%% data life cycle (collect%%lst%% store%%lst%% process)%%lst%% %%#%% %%#%% 
data %%#%% %%#%% platform publicly available%%lst%% %%#%% service directory ]f[ application develop%%dsh%% 
ers%%lst%% ]^[ tools ]f[ application development%%per%%]$~ ~$[as non%%dsh%%functional requirements%%lst%% %%#%% identi%%dsh%% 
ed%%cln%% interoperability ]^[ scalability%%per%%]$~ 
~$[a weak %%#%% %%#%% %%#%% platforms %%#%% %%#%% lack %%#%% streams processing tools %%#%% analyze 
real%%dsh%%time data %%#%% %%#%% city%%lst%% %%#%% %%#%% requirement ]f[ %%#%% smart city applica%%dsh%% 
tions%%per%%]$~ ~$[another problem %%#%% %%#%% %%#%% %%#%% %%#%% platforms %%#%% ]n[ support %%#%% customization 
%%#%% services %%#%% citizen data%%per%%]$~ ~$[in spite %%#%% %%#%% privacy problems%%lst%% offering context%%dsh%%aware%%lst%% 
customized services %%#%% %%#%% citizens %%#%% highly desirable%%per%% 
3%%per%%1%%per%%3%%per%%]$~ ~$[cloud computing ]^[ %%#%% data%%per%%]$~ ~$[in %%#%% subsection%%lst%% %%#%% %%#%% platforms %%#%% %%#%% 
cloud computing ]^[ %%#%% data %%#%% enabling technologies%%per%%]$~ 
~$[vilajosana et al%%per%% [vilajosana et al%%per%% 2013] %%#%% %%#%% platform ]f[ smart cities based 
%%#%% cloud computing ]^[ %%#%% data%%lst%% %%#%% main components %%#%% data management 
]^[ service hosting%%per%%]$~ ~$[it includes %%#%% %%#%% data api allowing third%%dsh%%party applications %%#%% 
access %%#%% data stored %%#%% %%#%% platform%%per%%]$~ ~$[big data tools %%#%% %%#%% %%#%% collect data streams 
]^[ analyze data%%lst%% %%#%% %%#%% prediction ]^[ inference%%per%%]$~ 
~$[scallop4sc (scalable logging platform ]f[ smart city) [takahashi et al%%per%% 2012%%scn%% 
yamamoto et al%%per%% 2014] %%#%% %%#%% data %%#%% process %%#%% large volume %%#%% data gathered %%#%% 
smart buildings%%per%%]$~ ~$[the platform %%#%% information %%#%% %%#%% building%%lst%% %%#%% %%#%% water ]^[ 
energy consumption%%lst%% temperature%%lst%% air humidity%%lst%% ]^[ %%#%% amount %%#%% garbage generated%%per%%]$~ 
~$[periodically%%lst%% %%#%% buildings send data %%#%% %%#%% platform ]f[ processing%%per%%]$~ ~$[the objective %%#%% %%#%% 
analyze smart building data%%lst%% ]f[ %%#%% %%#%% %%#%% %%#%% mapreduce algorithm%%per%%]$~ 
~$[cidap [cheng et al%%per%% 2015] %%#%% %%#%% %%#%% data analytics platform deployed %%#%% %%#%% smart%%dsh%% 
santander testbed%%per%%]$~ ~$[the platform %%#%% data collected %%#%% smartsantander ]^[ ana%%dsh%% 
lyzes %%#%% %%#%% understand %%#%% behavior %%#%% %%#%% city%%per%%]$~ ~$[the main components %%#%% %%#%% platform 
are%%cln%% %%#%% agents%%lst%% %%#%% collect data %%#%% %%#%% smartsantander platform%%scn%% %%#%% %%#%% data 
repository ]f[ storing %%#%% data%%scn%% %%#%% %%#%% data processing ]f[ intensive data processing 
]^[ analytics%%scn%% ]^[ %%#%% citymodel server%%lst%% responsible ]f[ interfacing %%#%% external appli%%dsh%% 
cations%%per%%]$~ ~$[this platform %%#%% apache spark [zaharia et al%%per%% 2010] %%#%% process %%#%% data%%per%% 
[khan et al%%per%% 2015] propose %%#%% smart city architecture based %%#%% %%#%% data %%#%% achieve 
%%#%% necessary availability ]^[ scalability required ]f[ %%#%% smart cities platform%%per%%]$~ ~$[the 
architecture %%#%% %%#%% layers%%cln%% %%#%% %%#%% collect%%lst%% analyze%%lst%% ]^[ lter data%%scn%% %%#%% %%#%% map 
]^[ aggregate data %%#%% %%#%% %%#%% semantically relevant%%scn%% ]^[ %%#%% third layer %%#%% users %%#%% 
browse ]^[ recover %%#%% data processed %%#%% %%#%% %%#%% %%#%% layers%%per%%]$~ ~$[the implementation 
%%#%% %%#%% architecture %%#%% %%#%% %%#%% source projects%%lst%% ]^[ %%#%% authors %%#%% %%#%% tools 
]f[ %%#%% layers [khan et al%%per%% 2013]%%per%%]$~ 
~$[windygrid [thornton 2013]%%lst%% %%#%% initiative %%#%% %%#%% city %%#%% chicago%%lst%% %%#%% %%#%% platform ]f[ 
smart cities%%lst%% %%#%% objective %%#%% %%#%% %%#%% real%%dsh%%time ]^[ historical data %%#%% %%#%% uni ed 
view %%#%% city operations%%per%%]$~ ~$[big data technologies%%lst%% %%#%% %%#%% %%#%% mongodb nosql database 
]^[ parallel data processors%%lst%% %%#%% %%#%% %%#%% develop %%#%% platform%%per%%]$~ 
~$[smarty [anastasi et al%%per%% 2013] %%#%% %%#%% project aimed %%#%% providing tools ]^[ services 
]f[ mobility ]^[ exible city transport systems%%per%%]$~ ~$[its software platform collects data 
%%#%% multiple sources%%lst%% %%#%% %%#%% traf %%#%% ow%%lst%% user location%%lst%% transport service delays%%lst%% ]^[ 
software platforms ]f[ smart cities 
a:11 
parking availability%%per%%]$~ ~$[a network %%#%% low%%dsh%%cost sensors collects data %%#%% %%#%% city ]^[ social 
networks %%#%% continuously monitored %%#%% %%#%% data %%#%% citizens%%per%%]$~ ~$[the platform processes 
%%#%% massive amount %%#%% data generated %%#%% %%#%% city %%#%% data mining techniques%%lst%% %%#%% 
%%#%% classi cation%%lst%% regression%%lst%% ]^[ clustering%%per%%]$~ 
~$[the platform proposed %%#%% girtelschmid et al%%per%% [girtelschmid et al%%per%% 2013] %%#%% se%%dsh%% 
mantic technologies %%#%% create %%#%% platform ]f[ smart cities%%lst%% adding exibility %%#%% system 
con guration ]^[ adaptation%%per%%]$~ ~$[however%%lst%% %%#%% overcome %%#%% performance bottlenecks nor%%dsh%% 
mally associated %%#%% ontology repositories ]^[ reasoning tools%%lst%% %%#%% authors combine 
%%#%% semantic techniques %%#%% %%#%% data processing methods%%per%%]$~ 
~$[the main functional requirements identi ed ]f[ %%#%% %%#%% %%#%% platforms were%%cln%% data 
management%%lst%% %%#%% %%#%% collecting%%lst%% analyzing%%lst%% ]^[ visualizing data%%scn%% large scale data pro%%dsh%% 
cessing%%lst%% %%#%% %%#%% batch ]^[ real%%dsh%%time processing%%scn%% ]^[ %%#%% %%#%% %%#%% semantic techniques 
combined %%#%% %%#%% data%%per%%]$~ ~$[as non%%dsh%%functional requirements%%lst%% %%#%% identi ed scalability ]^[ 
adaptation%%per%%]$~ 
~$[most %%#%% %%#%% platforms %%#%% %%#%% section %%#%% ]n[ %%#%% %%#%% iot layer%%lst%% ]^[ %%#%% ]n[ indicate %%#%% 
%%#%% data %%#%% collected %%#%% %%#%% city%%scn%% %%#%% exception %%#%% cidap%%lst%% %%#%% %%#%% %%#%% smartsan%%dsh%% 
tander testbed %%#%% %%#%% iot middleware%%per%%]$~ ~$[another drawback %%#%% %%#%% %%#%% %%#%% %%#%% platforms 
%%#%% ]n[ include %%#%% discussion %%#%% security concerns%%per%% 
3%%per%%1%%per%%4%%per%%]$~ ~$[cloud computing%%per%%]$~ ~$[in %%#%% subsection%%lst%% %%#%% %%#%% platforms %%#%% %%#%% %%#%% cloud 
computing %%#%% %%#%% enabling technology%%per%%]$~ 
~$[piro et al%%per%% [piro et al%%per%% 2014] %%#%% %%#%% two%%dsh%%layered service platform ]f[ %%#%% creation %%#%% 
smart city applications%%per%%]$~ ~$[the rst %%#%% %%#%% low%%dsh%%level layer %%#%% controls %%#%% communication 
%%#%% %%#%% city wsn devices%%per%%]$~ ~$[the %%#%% layer collects %%#%% data %%#%% %%#%% devices ]^[ 
provides services ]f[ %%#%% development %%#%% applications %%#%% %%#%% %%#%% data %%#%% %%#%% city%%per%%]$~ 
~$[u%%dsh%%city [lee ]^[ rho 2010] %%#%% %%#%% platform ]f[ %%#%% creation %%#%% smart ubiquitous cities%%per%%]$~ 
~$[the platform offers %%#%% service management features%%lst%% %%#%% %%#%% autonomic service 
discovery%%lst%% service deployment%%lst%% ]^[ context%%dsh%%aware service execution%%per%%]$~ ~$[it %%#%% offers pre%%dsh%% 
de ned services %%#%% %%#%% %%#%% inference engine%%lst%% %%#%% context%%dsh%%aware data service%%lst%% ]^[ %%#%% portal 
]f[ %%#%% management %%#%% %%#%% platform%%per%%]$~ 
~$[gambas%%lst%% %%#%% middleware ]f[ %%#%% development %%#%% smart city applications [apolinarski 
et al%%per%% 2014]%%lst%% supports data acquisition%%lst%% distribution%%lst%% ]^[ integration%%per%%]$~ ~$[the platform 
%%#%% provides %%#%% application runtime %%#%% facilitate %%#%% development ]^[ deployment 
%%#%% services using city data ]^[ %%#%% service registry%%per%%]$~ ~$[the middleware supports context%%dsh%% 
awareness%%lst%% ]s[ %%#%% smart city services %%#%% adapt %%#%% %%#%% citizen situation%%lst%% behavior%%lst%% 
]^[ intent%%per%%]$~ ~$[all communication %%#%% %%#%% platform %%#%% encrypted %%#%% ensure citizen %%#%% privacy 
]^[ security%%per%%]$~ 
~$[civitas [villanueva et al%%per%% 2013] %%#%% %%#%% middleware %%#%% support %%#%% development %%#%% smart 
cities services%%per%%]$~ ~$[it %%#%% %%#%% %%#%% facilitate %%#%% development ]^[ deployment %%#%% smart city 
applications%%lst%% ]^[ %%#%% avoid %%#%% emergence %%#%% information islands [qiu et al%%per%% 2010]%%lst%% i%%per%%e%%per%%%%lst%% 
disconnected applications %%#%% %%#%% ]n[ share relevant information%%per%%]$~ ~$[citizens connect %%#%% 
%%#%% middleware via %%#%% special device called %%#%% civitas plug%%lst%% %%#%% ensures %%#%% privacy 
]^[ %%#%% security%%per%%]$~ ~$[the middleware %%#%% %%#%% main design principles %%#%% facilitate %%#%% ap%%dsh%% 
plication integration%%cln%% %%#%% %%#%% %%#%% software object%%lst%% %%#%% promotes %%#%% consistency 
%%#%% %%#%% software design ]^[ reusability %%#%% %%#%% middleware%%scn%% ]^[ independence %%#%% %%#%% city 
layout%%lst%% meaning %%#%% city services %%#%% ]n[ %%#%% %%#%% %%#%% %%#%% city layout%%per%%]$~ 
~$[the main functional requirements identi ed ]f[ %%#%% %%#%% %%#%% platforms were%%cln%% service 
management ]^[ data management%%per%%]$~ ~$[as non%%dsh%%functional requirements%%lst%% %%#%% identi ed%%cln%% 
security%%lst%% privacy%%lst%% ]^[ context awareness%%per%%]$~ 
~$[a drawback %%#%% %%#%% platforms %%#%% %%#%% %%#%% section %%#%% %%#%% none %%#%% %%#%% %%#%% known 
frameworks %%#%% implement components%%lst%% %%#%% %%#%% %%#%% inference engine ]^[ processing 
tools%%lst%% %%#%% %%#%% %%#%% dif cult %%#%% maintenance %%#%% %%#%% platform%%per%%]$~ ~$[another problem %%#%% 
a:12 
santana%%lst%% e%%per%%]$~ ~$[f%%per%%]$~ ~$[z%%per%% et al%%per%% 
%%#%% %%#%% platforms %%#%% ]n[ describe %%#%% mechanism %%#%% allow external access %%#%% %%#%% platform 
data%%per%% 
3%%per%%1%%per%%5%%per%%]$~ ~$[cloud computing ]^[ cyber%%dsh%%physical systems%%per%%]$~ ~$[in %%#%% section%%lst%% %%#%% %%#%% platforms 
%%#%% %%#%% cloud computing ]^[ cyber%%dsh%%physical systems (cps) %%#%% enabling technolo%%dsh%% 
gies%%per%%]$~ 
~$[gurgen et al%%per%% [gurgen et al%%per%% 2013] %%#%% %%#%% middleware ]f[ smart cities auto%%dsh%% 
nomic services%%lst%% %%#%% includes %%#%% self%%dsh%% properties%%lst%% %%#%% %%#%% self%%dsh%%organization%%lst%% self%%dsh%% 
optimization%%lst%% self%%dsh%%con guration%%lst%% self%%dsh%%protection%%lst%% self%%dsh%%healing%%lst%% self%%dsh%%discovery%%lst%% ]^[ self%%dsh%% 
description%%per%%]$~ ~$[they justify using cloud computing %%#%% provide scalability%%lst%% reliability%%lst%% ]^[ 
elasticity %%#%% %%#%% platform%%per%%]$~ ~$[this platform provides application developers %%#%% %%#%% con%%dsh%% 
texts %%#%% individual users ]^[ %%#%% city%%per%%]$~ 
~$[privat et al%%per%% [privat et al%%per%% 2014] propose %%#%% cps%%dsh%%based platform%%lst%% %%#%% main 
characteristic %%#%% self%%dsh%%con guration ]^[ self%%dsh%%adaptation capabilities %%#%% smart environ%%dsh%% 
ments%%lst%% including smart cities%%per%%]$~ ~$[this platform provides %%#%% shared distributed software 
infrastructure %%#%% collects data ]^[ reacts %%#%% changes %%#%% %%#%% environment%%per%%]$~ 
~$[wan et al%%per%% [wan et al%%per%% 2012] propose %%#%% event%%dsh%%based cps platform%%lst%% %%#%% %%#%% 
%%#%% event manager %%#%% manage ]^[ generate cooperation %%#%% m2m components%%per%%]$~ 
~$[this platform provides data ]^[ services %%#%% third%%dsh%%party applications %%#%% %%#%% pub%%dsh%% 
lish/subscribe module%%per%%]$~ ~$[the platform %%#%% enables %%#%% design %%#%% event processing ows 
%%#%% manage %%#%% mission%%dsh%%critical wireless messages%%per%%]$~ 
~$[the main functional requirements identi ed ]f[ %%#%% %%#%% %%#%% platforms were%%cln%% auto%%dsh%% 
nomic reaction %%#%% changes %%#%% %%#%% city environment%%lst%% communication %%#%% city devices%%lst%% 
]^[ %%#%% publish/subscribe mechanism ]f[ applications %%#%% communicate %%#%% %%#%% platform%%per%%]$~ 
~$[as non%%dsh%%functional requirements%%lst%% %%#%% identi ed%%cln%% con gurability%%lst%% adaptation%%lst%% ]^[ context 
awareness%%per%%]$~ 
~$[the platforms %%#%% %%#%% section focus %%#%% %%#%% deployment%%lst%% con guration%%lst%% ]^[ execution 
%%#%% cps devices %%#%% %%#%% city%%lst%% ]b[ %%#%% lack %%#%% requirements%%lst%% %%#%% %%#%% %%#%% mon%%dsh%% 
itoring ]^[ publication %%#%% %%#%% data %%#%% %%#%% devices%%per%%]$~ ~$[they %%#%% %%#%% ]n[ describe %%#%% 
mechanism %%#%% verify %%#%% data collected %%#%% %%#%% city%%lst%% discarding inconsistencies%%per%% 
3%%per%%2%%per%%]$~ ~$[systems 
%%#%% %%#%% subsection%%lst%% %%#%% illustrate applications built %%#%% top %%#%% %%#%% platforms %%#%% 
%%#%% %%#%% previous section%%per%%]$~ ~$[table %%#%% %%#%% %%#%% overview %%#%% %%#%% domains %%#%% %%#%% analyzed 
systems%%per%%]$~ 
~$[the gambas middleware %%#%% %%#%% %%#%% develop %%#%% applications ]f[ %%#%% public trans%%dsh%% 
portation system %%#%% madrid%%lst%% spain%%per%%]$~ ~$[foell et al%%per%% [foell et al%%per%% 2014] %%#%% %%#%% context%%dsh%% 
aware urban bus navigator %%#%% help travelers nd %%#%% %%#%% buses ]f[ %%#%% trips%%per%%]$~ ~$[handte 
et al%%per%% [handte et al%%per%% 2014] describe %%#%% system %%#%% estimates %%#%% number %%#%% passengers 
%%#%% city buses using smartphone sensing%%per%%]$~ 
~$[sen2soc [vakali et al%%per%% 2014] %%#%% %%#%% system deployed %%#%% %%#%% smartsantander platform 
%%#%% %%#%% data streams %%#%% %%#%% city (e%%per%%g%%per%%%%lst%% sensor data) ]^[ social networks (e%%per%%g%%per%%%%lst%% twit%%dsh%% 
ter) %%#%% create smart city applications%%per%%]$~ ~$[two examples %%#%% applications are%%cln%% capturing %%#%% 
emotional state %%#%% city inhabitants%%lst%% ]^[ visualizing %%#%% air pollution %%#%% %%#%% city%%per%%]$~ ~$[also %%#%% 
smartsantander%%lst%% vlahogianni et al%%per%% [vlahogianni et al%%per%% 2014] %%#%% %%#%% application 
%%#%% predict %%#%% utilization %%#%% city parking lots%%per%%]$~ 
~$[two applications %%#%% developed using %%#%% padova smart city platform%%per%%]$~ ~$[bui ]^[ 
zorzi [bui ]^[ zorzi 2011] %%#%% %%#%% health care system %%#%% main features %%#%% 
monitoring conditions %%#%% patients%%lst%% sending %%#%% data directly %%#%% doctors%%lst%% ]^[ calling 
emergency services %%cmp_if%% %%#%% patient %%#%% %%#%% urgent problem%%per%%]$~ ~$[bressan et al%%per%% [bressan et al%%per%% 
2010] %%#%% %%#%% monitoring application %%#%% manage ]^[ collect data %%#%% %%#%% %%#%% light 
posts connected %%#%% %%#%% platform%%per%%]$~ 
~$[software platforms ]f[ smart cities 
a:13 
table i%%per%%]$~ ~$[domains %%#%% smart city systems 
l 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
4 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
l 
l 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
2 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
1 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
5 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
l 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
2 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
2 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
1 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
1 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
1 
gambas 
smartsantander 
padova smart city 
openiot 
windygrid 
clout 
scallop4sc 
number %%#%% instances 
anagnostopoulos et al%%per%% [anagnostopoulos et al%%per%% 2015] %%#%% %%#%% waste management 
system implemented using %%#%% openiot platform%%per%%]$~ ~$[it %%#%% %%#%% models %%#%% prioritize 
critical trash bins%%lst%% %%#%% %%#%% bins close %%#%% schools%%lst%% hospitals%%lst%% ]^[ gas stations%%per%%]$~ ~$[the system 
%%#%% %%#%% %%#%% %%cmp%% %%#%% %%#%% models according %%#%% %%#%% amount %%#%% co2 emitted ]^[ %%#%% 
distance traveled %%#%% trash trucks%%per%%]$~ 
~$[the windygrid platform [rutkin 2014] provides %%#%% main systems %%#%% %%#%% city %%#%% 
chicago%%cln%% situational awareness ]^[ incident monitoring%%lst%% %%#%% monitor ]^[ act %%#%% prob%%dsh%% 
lems %%#%% %%#%% occurring %%#%% %%#%% city%%scn%% historical data analyses%%lst%% %%#%% predict %%#%% behavior 
%%#%% city systems%%lst%% %%#%% %%#%% traf %%#%% ]^[ health care%%scn%% ]^[ advanced real%%dsh%%time analytics%%lst%% %%#%% 
analyze %%#%% current situation %%#%% city systems%%per%%]$~ ~$[some examples %%#%% %%#%% data %%#%% %%#%% %%#%% 
systems are%%cln%% log %%#%% emergency (911) calls%%lst%% traf %%#%% conditions%%lst%% public buildings informa%%dsh%% 
tion%%lst%% ]^[ surveillance cameras%%per%%]$~ 
~$[galache et al%%per%% [galache et al%%per%% 2014] %%#%% %%#%% systems developed using %%#%% clout 
platform%%cln%% %%#%% alert service %%#%% warn citizens %%#%% earthquakes %%#%% fujisawa%%lst%% japan%%scn%% %%#%% 
civil protection system%%lst%% %%#%% warns %%#%% population %%#%% environmental risks %%#%% %%#%% 
storms ]^[ earthquakes %%#%% genova%%lst%% italy%%scn%% %%#%% system %%#%% help elderly people nd healthy 
activities %%#%% %%#%% city %%#%% mitaka%%lst%% japan%%scn%% ]^[ %%#%% sensing application %%#%% notify people %%#%% 
events %%#%% santander%%lst%% spain%%lst%% %%#%% %%#%% cultural acts ]^[ traf %%#%% accidents%%per%%]$~ 
~$[yamamoto et al%%per%% [yamamoto et al%%per%% 2014] %%#%% %%#%% systems developed ]f[ %%#%% scal%%dsh%% 
lop4sc platform%%lst%% %%#%% %%#%% %%#%% energy management domain%%per%%]$~ ~$[the rst system offers %%#%% 
tool ]f[ %%#%% visualization %%#%% household energy consumption%%lst%% %%#%% analyzes data %%#%% 
%%#%% levels%%lst%% %%#%% %%#%% state%%lst%% city%%lst%% ]^[ neighborhood%%per%%]$~ ~$[the %%#%% system %%#%% %%#%% wasteful 
energy detection service %%#%% %%#%% available ]f[ smart homes%%per%%]$~ 
~$[the analyzed applications %%#%% %%#%% %%#%% %%#%% explored domains %%#%% %%#%% literature %%#%% 
traf c%%lst%% %%#%% applications %%#%% monitor %%#%% streets ]v[ help citizens %%#%% %%#%% %%#%% public trans%%dsh%% 
port%%lst%% ]^[ city sensing%%lst%% capturing data %%#%% %%#%% city using sensors %%#%% %%#%% air pollution 
]^[ temperature%%per%%]$~ ~$[most %%#%% %%#%% applications %%#%% developed external %%#%% %%#%% platform%%lst%% us%%dsh%% 
ing %%#%% %%#%% ]v[ %%#%% platform services%%per%% 
3%%per%%3%%per%%]$~ ~$[requirements ]f[ smart city software platforms 
%%#%% answer %%#%% %%#%% research question %%#%% %%#%% %%#%% requirements %%#%% %%#%% software 
platform ]f[ smart cities %%#%% meet? %%lst%% %%#%% %%#%% section %%#%% analyze %%#%% functional ]^[ 
non%%dsh%%functional requirements extracted %%#%% %%#%% analyzed platforms%%per%%]$~ 
~$[a:14 
santana%%lst%% e%%per%%]$~ ~$[f%%per%%]$~ ~$[z%%per%% et al%%per%%]$~ 
~$[we assume %%#%% %%#%% platform implements %%#%% requirement %%cmp_if%% %%#%% literature describing %%#%% 
explicitly states so%%lst%% ]v[ %%cmp_if%% %%#%% platform %%#%% %%#%% component ]v[ module %%#%% %%#%% ful lls 
%%#%% requirement%%per%% 
3%%per%%3%%per%%1%%per%%]$~ ~$[functional requirements%%per%%]$~ ~$[the main goal %%#%% %%#%% platform ]f[ smart cities %%#%% %%#%% fa%%dsh%% 
cilitate %%#%% development %%#%% smart city applications%%per%%]$~ ~$[towards %%#%% aim%%lst%% %%#%% %%#%% %%#%% 
analyzed platforms implement requirements ]f[ collecting data %%#%% %%#%% city%%lst%% manag%%dsh%% 
ing ]^[ sharing data%%lst%% ]^[ providing tools %%#%% facilitate %%#%% development %%#%% smart city 
applications%%per%%]$~ ~$[table ii %%#%% %%#%% overview %%#%% %%#%% functional requirements ]f[ smart 
city platforms%%lst%% %%#%% %%#%% describe %%#%% %%#%% following%%cln%% 
table ii%%per%%]$~ ~$[functional requirements ]f[ smart city platforms 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
18 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%dsh%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
l 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
7 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
9 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
13 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
l 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
16 
%%#%% 
l 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
14 
4 
l 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
3 
smartsantander 
openiot 
concinnity 
civitas 
gambas 
[khan et al%%per%% 2013] 
[girtelschmid et al%%per%% 2013] 
scallop4sc 
openmtc 
[wan et al%%per%% 2012] 
[piro et al%%per%% 2014] 
[gurgen et al%%per%% 2013] 
[vilajosana et al%%per%% 2013] 
clout 
padova smart city 
u%%dsh%%city 
sentilo 
windygrid 
epic 
[privat et al%%per%% 2014] 
smarty 
cidap 
number %%#%% instances 
data management%%cln%% %%#%% %%#%% %%#%% requirement implemented %%#%% %%#%% %%#%% %%#%% platforms 
]f[ smart cities%%lst%% %%#%% includes collection%%lst%% storage%%lst%% analysis%%lst%% ]^[ visualization %%#%% 
city data%%per%%]$~ ~$[the analyzed platforms %%#%% %%#%% techniques ]f[ %%#%% requirement%%lst%% %%#%% 
%%#%% relational databases [hernndez%%dsh%%mu noz et al%%per%% 2011%%scn%% lee ]^[ rho 2010]%%lst%% %%#%% data 
software platforms ]f[ smart cities 
a:15 
tools [thornton 2013%%scn%% cheng et al%%per%% 2015]%%lst%% ]^[ customized tools implemented %%#%% %%#%% 
platform development team [wu et al%%per%% 2014]%%per%%]$~ 
~$[applications run%%dsh%%time%%cln%% %%#%% platforms focus %%#%% managing %%#%% execution %%#%% %%#%% 
applications%%per%%]$~ ~$[the goal %%#%% %%#%% facilitate %%#%% deployment ]^[ integration %%#%% %%#%% applica%%dsh%% 
tions%%per%%]$~ ~$[some platforms provide %%#%% complete environment ]f[ developers %%#%% deploy %%#%% 
applications [apolinarski et al%%per%% 2014]%%scn%% %%#%% offer %%#%% execution run%%dsh%%time service ]f[ 
applications developed %%#%% tools %%#%% platform provides [petrolo et al%%per%% 2014%%scn%% wu et al%%per%% 
2014]%%per%%]$~ 
~$[wsn management%%cln%% %%#%% %%#%% %%#%% analyzed platforms %%#%% %%#%% wireless sensor net%%dsh%% 
%%#%% (wsn) management layer %%#%% control ]^[ monitor %%#%% devices deployed %%#%% %%#%% 
city%%per%%]$~ ~$[most %%#%% %%#%% platforms %%#%% iot concepts %%#%% organize ]^[ manage %%#%% wsn 
[hernndez%%dsh%%mu noz et al%%per%% 2011%%scn%% tei ]^[ gurgen 2014]%%per%%]$~ ~$[other platforms [bain 2014] 
%%#%% ]n[ explicitly mention this%%lst%% ]b[ indeed %%#%% %%#%% software layer %%#%% manage %%#%% city 
network devices%%per%%]$~ ~$[some platforms include features %%#%% manage %%#%% %%#%% device activities%%lst%% 
%%#%% %%#%% adding%%lst%% removing%%lst%% ]^[ monitoring %%#%% sensors ]^[ actuators%%per%%]$~ ~$[two platforms 
describe %%#%% wsn deployed %%#%% %%#%% city%%cln%% padova smart city [zanella et al%%per%% 2014]%%lst%% %%#%% 3000 
sensors%%lst%% ]^[ smartsantander [sanchez et al%%per%% 2014]%%lst%% %%#%% %%#%% %%cmp_ta%% 20000 sensors%%per%%]$~ 
~$[data processing%%cln%% %%#%% platforms %%#%% speci %%#%% processing components%%lst%% %%#%% %%#%% infer%%dsh%% 
ence engines [lee ]^[ rho 2010]%%lst%% %%#%% ow processing [wu et al%%per%% 2014]%%lst%% ]^[ %%#%% data 
processing tools [takahashi et al%%per%% 2012]%%per%%]$~ ~$[these components process large data sets%%lst%% 
]^[ %%#%% main purpose %%#%% %%#%% analyze%%lst%% verify%%lst%% aggregate%%lst%% ]^[ lter %%#%% data %%#%% %%#%% 
city%%per%%]$~ ~$[in addition%%lst%% %%#%% platforms [girtelschmid et al%%per%% 2013%%scn%% cheng et al%%per%% 2015] %%#%% 
real%%dsh%%time analyses %%#%% data streams%%per%%]$~ 
~$[external data access%%cln%% %%#%% %%#%% platforms describe %%#%% interface ]f[ external ap%%dsh%% 
plications %%#%% access %%#%% platform data%%per%%]$~ ~$[the %%#%% common approach %%#%% %%#%% api %%#%% allow 
access %%#%% %%#%% data generated %%#%% %%#%% city%%per%%]$~ ~$[some platforms %%#%% rest [hernndez%%dsh%%mu noz 
et al%%per%% 2011%%scn%% elmangoush et al%%per%% 2013]%%lst%% %%#%% %%#%% cloud computing concepts %%#%% provide 
%%#%% city data %%#%% %%#%% service [ballon et al%%per%% 2011]%%lst%% ]^[ %%#%% proposes %%#%% %%#%% data platform 
[zanella et al%%per%% 2014]%%per%%]$~ ~$[also%%lst%% %%#%% platform [gurgen et al%%per%% 2013] %%#%% %%#%% publish/subscribe 
paradigm %%#%% %%#%% %%#%% data ]^[ services available %%#%% applications%%per%%]$~ 
~$[service management%%cln%% %%#%% %%#%% %%#%% analyzed platforms adopt %%#%% service%%dsh%%oriented ar%%dsh%% 
chitecture%%lst%% %%#%% %%#%% %%#%% platform functionalities %%#%% offered %%#%% services [issarny et al%%per%% 
2011]%%per%%]$~ ~$[some %%#%% %%#%% %%#%% services %%#%% provide features %%#%% applications%%lst%% %%#%% %%#%% access 
%%#%% raw sensors data [petrolo et al%%per%% 2014] ]^[ analyzed data [zanella et al%%per%% 2014]%%lst%% ]^[ 
%%#%% ow engines [wu et al%%per%% 2014]%%per%%]$~ ~$[others enable developers %%#%% deploy services %%#%% 
%%#%% platform ]^[ %%#%% %%#%% available %%#%% %%#%% applications [apolinarski et al%%per%% 2014%%scn%% 
piro et al%%per%% 2014]%%per%%]$~ ~$[some platforms %%#%% %%#%% service compositions ]^[ choreographies 
[issarny et al%%per%% 2011] %%#%% create %%#%% services ]v[ applications [lee ]^[ rho 2010%%scn%% piro 
et al%%per%% 2014]%%per%%]$~ 
~$[software engineering tools%%cln%% %%#%% platforms provide %%#%% set %%#%% tools ]f[ %%#%% develop%%dsh%% 
ment ]^[ maintenance %%#%% services ]^[ applications%%per%%]$~ ~$[for describing ]^[ implementing 
applications%%lst%% %%#%% platforms create visual interfaces [petrolo et al%%per%% 2014]%%per%%]$~ ~$[other plat%%dsh%% 
forms provide %%#%% ow design tools [wu et al%%per%% 2014] %%#%% de ne data ]v[ service ows 
]^[ create smart city applications%%per%%]$~ ~$[moreover%%lst%% %%#%% platforms [khan et al%%per%% 2013] %%#%% 
analytics ]^[ reporting tools %%#%% facilitate %%#%% development %%#%% data visualization ]^[ 
reports%%lst%% ]^[ %%#%% platforms describe %%#%% %%#%% %%#%% %%#%% smart city application sdk [elman%%dsh%% 
goush et al%%per%% 2013%%scn%% apolinarski et al%%per%% 2014]%%per%%]$~ 
~$[de nition %%#%% %%#%% city model%%cln%% %%#%% platforms provide %%#%% model %%#%% %%#%% city %%#%% facilitate 
%%#%% manipulation ]^[ understanding %%#%% %%#%% platform data%%lst%% ]^[ %%#%% facilitate %%#%% inte%%dsh%% 
gration %%#%% %%#%% collected data%%per%%]$~ ~$[for example%%lst%% %%#%% cheng et al%%per%% [cheng et al%%per%% 2015]%%lst%% %%#%% city 
model %%#%% %%#%% %%#%% allow queries %%#%% %%#%% data %%#%% %%#%% city sensor network%%per%%]$~ ~$[privat et al%%per%% 
[privat et al%%per%% 2014] %%#%% %%#%% nite%%dsh%%state model %%#%% represent %%#%% %%#%% city data ows%%per%%]$~ 
~$[a:16 
santana%%lst%% e%%per%%]$~ ~$[f%%per%%]$~ ~$[z%%per%% et al%%per%%]$~ 
~$[based %%#%% %%#%% functional requirements aforementioned%%lst%% %%#%% %%#%% observe %%#%% %%#%% main 
platforms activities aim %%#%% control %%#%% city data life cycle%%cln%% (1) collecting %%#%% data %%#%% %%#%% 
wsn%%lst%% (2) managing %%#%% data %%#%% %%#%% platform%%lst%% (3) processing %%#%% data using city models%%lst%% 
]^[ (4) sharing %%#%% raw ]^[ processed data allowing external access%%per%%]$~ ~$[these activities 
%%#%% highly related %%#%% %%#%% enabling technologies%%lst%% %%#%% %%#%% iot %%#%% %%#%% wsn manage%%dsh%% 
ment%%lst%% data management ]^[ processing %%#%% %%#%% data%%lst%% ]^[ service management %%#%% 
cloud computing%%per%% 
3%%per%%3%%per%%2%%per%%]$~ ~$[non%%dsh%%functional requirements%%per%%]$~ ~$[most %%#%% %%#%% non%%dsh%%functional requirements %%#%% smart 
city platforms %%#%% related %%#%% large%%lst%% heterogeneous distributed systems%%lst%% %%#%% %%#%% scala%%dsh%% 
bility%%lst%% adaptation%%lst%% ]^[ interoperability%%per%%]$~ ~$[other non%%dsh%%functional requirements %%#%% related 
%%#%% %%#%% manipulation %%#%% critical ]^[ personal data %%#%% citizens%%lst%% %%#%% %%#%% security ]^[ 
privacy%%per%%]$~ ~$[table iii %%#%% %%#%% overview %%#%% %%#%% non%%dsh%%functional requirements ]f[ smart 
city platforms%%lst%% %%#%% %%#%% describe %%#%% %%#%% following%%per%%]$~ 
~$[table iii%%per%%]$~ ~$[non%%dsh%%functional requirements ]f[ smart city platforms 
%%#%% 
%%#%% 
%%#%% 
l 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
13 
%%#%% 
%%#%% 
%%#%% 
l 
%%#%% 
%%#%% 
%%#%% 
l 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
8 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
10 
5 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
7 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
l 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
4 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
5 
%%#%% 
%%#%% 
%%#%% 
l 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
%%#%% 
5 
smartsantander 
openiot 
concinnity 
civitas 
gambas 
[khan et al%%per%% 2013] 
[girtelschmid et al%%per%% 2013] 
scallop4sc 
openmtc 
[wan et al%%per%% 2012] 
[piro et al%%per%% 2014] 
[gurgen et al%%per%% 2013] 
[vilajosana et al%%per%% 2013] 
clout 
padova smart city 
u%%dsh%%city 
sentilo 
windygrid 
epic 
[privat et al%%per%% 2014] 
smarty 
cidap 
number %%#%% instances 
interoperability%%cln%% %%#%% devices%%lst%% systems%%lst%% applications%%lst%% ]^[ platforms compose 
%%#%% smart city environment%%lst%% ]^[ %%#%% %%#%% components %%#%% operate %%#%% %%#%% integrated 
software platforms ]f[ smart cities 
a:17 
fashion%%scn%% ]f[ example%%lst%% sensors %%#%% multiple vendors%%lst%% systems implemented %%#%% differ%%dsh%% 
ent languages%%lst%% platforms %%#%% share data ]^[ users%%lst%% ]^[ legacy systems %%#%% %%#%% 
%%#%% communicate %%#%% %%#%% %%#%% platforms%%per%%]$~ ~$[previous %%#%% %%#%% %%#%% eld adopted %%#%% 
techniques %%#%% handle %%#%% requirement%%cln%% interoperable objects [villanueva et al%%per%% 2013]%%lst%% 
adopting generic ]^[ standard interfaces [gurgen et al%%per%% 2013]%%lst%% applying semantic 
web %%#%% integrate %%#%% platform components [girtelschmid et al%%per%% 2013]%%lst%% ]^[ using %%#%% 
naming mechanism [cheng et al%%per%% 2015] %%#%% recognize %%#%% devices ]v[ data sources%%per%%]$~ 
~$[scalability%%cln%% %%#%% amount %%#%% users%%lst%% data%%lst%% ]^[ services %%#%% %%#%% smart city platform %%#%% %%#%% 
massive%%lst%% ]^[ %%#%% increase %%#%% time%%per%%]$~ ~$[for example%%lst%% %%#%% %%#%% smartsantander testbed%%lst%% 
%%#%% %%#%% %%#%% %%cmp_ta%% 20,000 sensors%%lst%% %%#%% %%#%% city %%#%% 178,000 inhabitants collecting %%#%% 
large amount %%#%% city data [sanchez et al%%per%% 2014]%%scn%% cidap collected %%#%% %%cmp_ta%% 50 gbs %%#%% 
data %%#%% %%#%% months [cheng et al%%per%% 2015]%%per%%]$~ ~$[this non%%dsh%%functional requirement %%#%% relevant 
%%#%% %%#%% functional requirements%%lst%% %%#%% %%#%% wsn management [ballon et al%%per%% 2011]%%lst%% 
data management [takahashi et al%%per%% 2012]%%lst%% ]^[ service management [bain 2014]%%per%%]$~ 
~$[security%%cln%% malicious users %%#%% %%#%% fraudulent %%#%% %%#%% services ]^[ data provided %%#%% 
%%#%% platform%%per%%]$~ ~$[many platforms %%#%% %%#%% component ]v[ describe mechanisms %%#%% handle 
security%%lst%% avoiding attacks %%#%% %%#%% city infrastructure ]^[ information theft [piro et al%%per%% 
2014%%scn%% hernndez%%dsh%%mu noz et al%%per%% 2011%%scn%% petrolo et al%%per%% 2014]%%per%%]$~ 
~$[privacy%%cln%% %%#%% smart city platform collects ]^[ manipulates %%#%% citizen%%dsh%%sensitive 
data%%lst%% %%#%% %%#%% medical records%%lst%% user localization%%lst%% ]^[ consuming habits%%per%%]$~ ~$[the challenge 
%%#%% %%#%% %%#%% %%#%% data %%#%% hiding%%lst%% ]v[ %%#%% avoid saving identi able information%%per%%]$~ ~$[some %%#%% 
%%#%% strategies %%#%% %%#%% achieve %%#%% requirement %%#%% cryptography [apolinarski et al%%per%% 
2014]%%lst%% tokens %%#%% control %%#%% access %%#%% %%#%% data %%#%% users %%#%% manipulate [villanueva 
et al%%per%% 2013]%%lst%% ]^[ anonymization [mylonas et al%%per%% 2015]%%per%%]$~ 
~$[context awareness%%cln%% %%#%% %%#%% city ]^[ user situation %%#%% change %%#%% time%%lst%% %%#%% 
applications ]^[ services %%#%% provide %%#%% results using contextual information%%per%%]$~ 
~$[some platforms %%#%% information %%#%% users [apolinarski et al%%per%% 2014%%scn%% privat et al%%per%% 
2014]%%lst%% %%#%% %%#%% location%%lst%% activity%%lst%% ]^[ language%%per%%]$~ ~$[other platforms %%#%% information %%#%% 
%%#%% city [khan et al%%per%% 2013%%scn%% cheng et al%%per%% 2015]%%lst%% %%#%% %%#%% traf %%#%% conditions%%lst%% climate%%lst%% 
]^[ air quality%%per%%]$~ ~$[examples %%#%% context %%#%% are%%cln%% displaying %%#%% %%#%% language %%#%% %%#%% 
application %%#%% %%#%% tourist%%lst%% ]^[ changing %%#%% route %%#%% %%#%% user avoiding polluted areas%%per%%]$~ 
~$[adaptation%%cln%% related %%#%% context awareness%%lst%% %%#%% platforms adapt %%#%% behavior 
based %%#%% context %%#%% order %%#%% achieve fault%%dsh%%tolerance%%lst%% choose %%#%% closer server %%#%% improve 
ef ciency%%lst%% decide ]f[ batch ]v[ real%%dsh%%time processing%%lst%% ]^[ adapt data %%#%% multiple 
data sources%%per%%]$~ ~$[this requirement %%#%% %%#%% %%#%% %%#%% platforms %%#%% %%#%% cps %%#%% enabling 
technology [privat et al%%per%% 2014%%scn%% wan et al%%per%% 2012]%%lst%% ]b[ %%#%% concepts %%#%% %%#%% %%#%% meet 
%%#%% requirement %%#%% well%%lst%% %%#%% %%#%% semantic technologies [girtelschmid et al%%per%% 2013]%%per%%]$~ 
~$[extensibility%%cln%% %%#%% capability %%#%% add services%%lst%% components%%lst%% ]^[ applications %%#%% %%#%% 
platform %%#%% %%#%% %%#%% assure %%#%% %%#%% meets evolving system requirements ]^[ user 
needs%%per%%]$~ ~$[mun oz et al%%per%% [hernndez%%dsh%%mu noz et al%%per%% 2011] state %%#%% easy extensibility %%#%% 
valuable %%cmp_b%% %%#%% %%#%% know %%#%% services %%#%% city %%#%% need%%per%%]$~ ~$[scallop4sc [taka%%dsh%% 
hashi et al%%per%% 2012] %%#%% materialized views %%#%% developers extend %%#%% implement %%#%% 
applications%%per%%]$~ ~$[some platforms [khan et al%%per%% 2013%%scn%% bain 2014] employ %%#%% %%#%% source 
tools%%lst%% facilitating %%#%% platform %%#%% extensibility%%per%%]$~ ~$[cidap [cheng et al%%per%% 2015] offers exten%%dsh%% 
sibility %%#%% enable %%#%% %%#%% %%#%% %%#%% platform %%#%% cities %%#%% %%#%% scales%%per%%]$~ 
~$[con gurability%%cln%% %%#%% smart city platform %%#%% %%#%% con guration options ]^[ pa%%dsh%% 
rameters %%#%% de ne %%#%% behavior %%#%% execution time%%lst%% %%#%% %%#%% de ning pollution ]^[ 
congestion thresholds ]^[ %%#%% priority %%#%% services%%per%%]$~ ~$[thus%%lst%% %%#%% %%#%% %%#%% %%#%% allow 
(re)con guration %%#%% %%#%% %%#%% variables %%#%% %%#%% platform%%per%%]$~ ~$[two platforms [wan et al%%per%% 
2012%%scn%% privat et al%%per%% 2014] highlighted %%#%% importance %%#%% self%%dsh%%con gurability capacities%%lst%% 
%%cmp_b%% %%#%% %%#%% huge amount %%#%% con gurations %%#%% %%#%% %%#%% smart city platform%%per%%]$~ ~$[other 
a:18 
santana%%lst%% e%%per%%]$~ ~$[f%%per%%]$~ ~$[z%%per%% et al%%per%% 
platforms [lee ]^[ rho 2010%%scn%% kim ]^[ lee 2014] provide %%#%% portal %%#%% centralize %%#%% 
con gurations%%per%%]$~ 
~$[based %%#%% %%#%% non%%dsh%%functional requirements aforementioned%%lst%% %%#%% %%#%% observe %%#%% 
%%#%% %%#%% %%#%% %%#%% %%#%% %%#%% %%#%% %%#%% functional requirements%%cln%% %%#%% %%#%% scala%%dsh%% 
bility%%lst%% %%#%% %%#%% valuable %%#%% %%#%% wsn ]^[ data management%%scn%% security ]^[ privacy%%lst%% 
%%#%% %%#%% %%#%% %%#%% %%#%% data requirements%%scn%% extensibility%%lst%% %%#%% %%#%% required %%#%% %%#%% 
service management%%scn%% ]^[ con gurability%%lst%% %%#%% %%#%% %%#%% %%#%% %%#%% %%#%% functional re%%dsh%% 
quirements%%per%%]$~ ~$[the non%%dsh%%functional requirements %%#%% %%#%% similar %%#%% %%#%% challenges ]^[ 
%%#%% research problems %%#%% %%#%% %%#%% %%#%% %%#%% %%#%% section%%per%% 
4%%per%%]$~ ~$[challenges and %%#%% research problems 
%%#%% answer rq3 %%#%% %%#%% %%#%% %%#%% main challenges ]^[ %%#%% research problems %%#%% %%#%% 
development %%#%% %%#%% generation%%lst%% robust software platforms ]f[ smart cities? )%%lst%% %%#%% ana%%dsh%% 
lyzed %%#%% challenges %%#%% %%#%% %%#%% smart city research papers%%per%%]$~ ~$[table iv %%#%% %%#%% 
overview %%#%% %%#%% main challenges%%lst%% %%#%% %%#%% describe %%#%% %%#%% following%%per%%]$~ 
~$[table iv%%per%%]$~ ~$[overwiew %%#%% %%#%% cited challenges ]^[ %%#%% research problems 
challenge 
privacy 
data management 
description 
protecting data collected %%#%% citizens%%lst%% city%%lst%% 
]^[ enterprises%%per%%]$~ 
~$[managing %%#%% %%#%% data collected %%#%% %%#%% platform 
heterogeneity 
energy management 
communication 
scalability 
security 
lack %%#%% testbeds 
city models 
platform maintenance 
interoperability %%#%% devices 
ensuring %%#%% 
]^[ applications 
managing %%#%% electricity %%#%% %%#%% devices de%%dsh%% 
ployed %%#%% %%#%% city%%per%%]$~ 
~$[enabling communication %%#%% heteroge%%dsh%% 
neous devices%%per%%]$~ 
~$[allowing %%#%% growth %%#%% devices ]^[ users con%%dsh%% 
nected %%#%% %%#%% platform%%per%%]$~ 
~$[protecting %%#%% city data%%lst%% services%%lst%% ]^[ infras%%dsh%% 
tructure%%per%%]$~ 
~$[there %%#%% ]n[ suf cient testbeds %%#%% experiment 
smart city solutions%%per%%]$~ 
~$[de ning %%#%% model describing %%#%% city%%per%%]$~ 
~$[maintaining %%#%% city systems ]^[ infrastruc%%dsh%% 
ture%%per%%]$~ 
~$[technologies/tools 
cryptography%%lst%% anonymization%%lst%% 
]^[ access tokens 
nosql 
databases 
tools%%per%%]$~ 
~$[standards%%lst%% ontology%%lst%% ]^[ %%#%% 
city uni ed model%%per%%]$~ 
~$[relational 
processing 
]^[ 
]^[ 
m2m techniques%%per%%]$~ 
~$[distributed tools ]^[ algo%%dsh%% 
rithms ]^[ p2p applications%%per%%]$~ 
~$[cryptography%%lst%% access tokens 
]^[ devices%%per%%]$~ 
~$[simulators%%per%%]$~ 
~$[semantic web ]^[ ontologies%%per%%]$~ 
~$[monitoring ]^[ alert tools%%per%%]$~ 
~$[privacy%%cln%% %%#%% %%#%% %%#%% cited challenge %%#%% implementing %%#%% smart city platform%%scn%% %%#%% 
main reason %%#%% %%#%% hassan et al%%per%% [hassan et al%%per%% 2014] ]^[ balakrishna [balakr%%dsh%% 
ishna 2012] %%#%% %%#%% %%#%% data collected %%#%% %%#%% city includes personal%%lst%% enterprise%%lst%% ]^[ 
governmental data %%#%% %%#%% ]n[ %%#%% accessed %%#%% %%#%% unauthorized users%%per%%]$~ ~$[wan et 
al%%per%% [wan et al%%per%% 2012] discuss legal problems %%#%% using data belonging %%#%% platform users%%per%%]$~ 
~$[data management%%cln%% %%#%% authors %%#%% cite data management %%#%% %%#%% challenge%%lst%% be%%dsh%% 
cause %%#%% platform %%#%% %%#%% store ]^[ process %%#%% large amount %%#%% data ]^[ %%#%% ef cient 
]^[ scalable data storage ]^[ processing algorithms [su et al%%per%% 2011%%scn%% djahel et al%%per%% 
2014%%scn%% perera et al%%per%% 2014]%%per%%]$~ ~$[data analysis %%#%% %%#%% %%#%% challenge%%lst%% %%cmp_b%% %%#%% %%#%% hard %%#%% 
extract useful knowledge [hassan et al%%per%% 2014]%%per%%]$~ ~$[another challenge %%#%% data trustwor%%dsh%% 
thiness%%scn%% ]f[ example%%lst%% wu et al%%per%% [wu et al%%per%% 2014] claim %%#%% %%#%% large number %%#%% data 
sources %%#%% %%#%% dif cult %%#%% ensure %%#%% %%#%% %%#%% data %%#%% correct%%per%%]$~ 
~$[software platforms ]f[ smart cities 
a:19 
heterogeneity%%cln%% %%#%% %%#%% %%#%% challenge %%cmp_b%% %%#%% %%#%% differences %%#%% %%#%% devices 
%%#%% %%#%% smart city%%lst%% ]^[ %%#%% dif culty %%#%% relating data %%#%% %%#%% sources [wu et al%%per%% 
2014%%scn%% su et al%%per%% 2011%%scn%% wan et al%%per%% 2012]%%per%%]$~ ~$[naphade et al%%per%% [naphade et al%%per%% 2011] raise %%#%% 
problem %%#%% managing data %%#%% %%#%% city systems %%cmp_b%% %%#%% variations %%#%% data %%#%% 
%%#%% sources%%per%%]$~ ~$[other authors [wenge et al%%per%% 2014] state %%#%% %%#%% smart city platform 
%%#%% %%#%% de ne standards %%#%% heterogeneous devices%%lst%% systems%%lst%% ]^[ domains%%per%%]$~ 
~$[energy management%%cln%% %%#%% authors cite energy consumption %%#%% %%#%% challenge %%#%% %%#%% 
faced %%#%% %%#%% %%#%% components %%#%% %%#%% platform%%lst%% %%#%% %%#%% sensors%%lst%% actuators%%lst%% ]^[ servers 
[perera et al%%per%% 2014]%%per%%]$~ ~$[moreover%%lst%% hassan et al%%per%% [hassan et al%%per%% 2014] %%#%% %%#%% %%#%% en%%dsh%% 
ergy management %%#%% %%#%% smart city health care application %%#%% %%#%% important%%lst%% %%cmp_b%% 
applications ]v[ services %%#%% domains %%#%% %%#%% %%#%% fail due %%#%% power outages%%per%%]$~ 
~$[communication%%cln%% %%#%% %%#%% smart cities %%#%% %%#%% future %%#%% incorporate %%#%% massive 
amount %%#%% devices%%lst%% enabling communication %%#%% %%#%% devices %%#%% %%#%% %%#%% challenge%%per%%]$~ 
~$[some authors [wan et al%%per%% 2012%%scn%% hassan et al%%per%% 2014] discuss %%#%% domains %%#%% %%#%% smart 
city %%#%% depend %%#%% mission%%dsh%%critical communication %%#%% ensure reliability%%lst%% %%#%% %%#%% 
health care ]^[ public safety%%per%%]$~ ~$[in addition%%lst%% djahel et al%%per%% [djahel et al%%per%% 2014] explain 
%%#%% %%#%% communication mechanisms %%#%% required %%#%% share platform data %%#%% ap%%dsh%% 
plications%%per%%]$~ 
~$[scalability%%cln%% %%#%% %%#%% %%#%% decades%%lst%% %%#%% number %%#%% connected devices %%#%% %%#%% smart 
city %%#%% continually increase [balakrishna 2012]%%lst%% requiring %%#%% strong level %%#%% scalabil%%dsh%% 
ity %%#%% %%#%% associated software platform%%per%%]$~ ~$[moreover%%lst%% %%#%% number %%#%% users%%lst%% services%%lst%% ]^[ 
data stored %%#%% increase %%#%% population growth ]^[ %%#%% special events %%#%% %%#%% city%%per%%]$~ ~$[su 
et al%%per%% [su et al%%per%% 2011] discuss %%#%% %%#%% smart city platform %%#%% support large%%dsh%%scale%%lst%% 
ef cient services%%per%%]$~ ~$[as %%#%% example%%lst%% sinaeepourfard et al%%per%% [sinaeepourfard et al%%per%% 2016] 
estimated %%#%% %%#%% city %%#%% barcelona %%#%% %%#%% %%#%% %%cmp_ta%% 1 million sensors %%#%% cover 
%%#%% %%#%% city%%lst%% generating %%#%% %%cmp_ta%% 8 gb %%#%% data %%#%% day%%per%%]$~ 
~$[security%%cln%% unauthorized users accessing city services %%#%% permission %%#%% cause 
%%#%% lot %%#%% harm%%per%%]$~ ~$[hancke et al%%per%% [hancke et al%%per%% 2012] consider %%#%% city networks %%#%% 
%%#%% safe %%#%% cyber%%dsh%%terrorism ]^[ cyber%%dsh%%vandalism%%per%%]$~ ~$[gurgen et al%%per%% [gurgen et al%%per%% 2013] 
highlighted %%#%% importance %%#%% security %%#%% cps platforms%%lst%% %%#%% %%#%% systems control 
%%#%% %%#%% %%#%% city infrastructure%%lst%% %%#%% %%#%% malicious user %%#%% corrupt%%lst%% e%%per%%g%%per%%%%lst%% %%#%% tampering 
%%#%% traf %%#%% lights ]^[ light posts%%per%%]$~ 
~$[lack %%#%% testbed%%cln%% %%#%% lack %%#%% testbeds %%#%% cited %%#%% elmangoush et al%%per%% [elmangoush 
et al%%per%% 2013] ]^[ muoz et al%%per%%[hernndez%%dsh%%mu noz et al%%per%% 2011] %%#%% %%#%% challenge %%#%% %%#%% de%%dsh%% 
velopment %%#%% platforms ]f[ smart cities%%per%%]$~ ~$[without testbeds%%lst%% %%#%% %%#%% hard %%#%% perform tests 
]^[ experimentation %%#%% discover %%#%% real challenges %%#%% deploying %%#%% smart city 
platform %%#%% present%%per%%]$~ ~$[smart city simulators [santana et al%%per%% 2016] %%#%% %%#%% %%#%% %%#%% 
lower%%dsh%%cost alternative ]f[ experimentation%%per%%]$~ 
~$[city models%%cln%% %%#%% authors %%#%% argue %%#%% %%#%% %%#%% hard %%#%% understand %%#%% city ]^[ de%%dsh%% 
scribe %%#%% effective ]^[ ef cient model ]f[ it%%per%%]$~ ~$[for example%%lst%% wu et al%%per%% [wu et al%%per%% 2014] 
claim %%#%% %%#%% %%#%% necessary %%#%% create %%#%% useful model %%#%% %%#%% city %%#%% %%#%% intelligent 
decisions%%per%%]$~ ~$[naphade et al%%per%% [naphade et al%%per%% 2011] state %%#%% modeling %%#%% required %%#%% 
observe ]^[ understand %%#%% city activity ]^[ %%#%% avoid generating unnecessary ]^[ 
empty models%%per%%]$~ ~$[mu noz et al%%per%% [hernndez%%dsh%%mu noz et al%%per%% 2011] state %%#%% %%#%% uni ed model 
%%#%% %%#%% city %%#%% required%%lst%% ]s[ %%#%% %%#%% huge amount %%#%% heterogeneous data generated %%#%% 
%%#%% shared %%#%% applications ]^[ services%%per%%]$~ 
~$[platform maintenance%%cln%% %%#%% %%#%% state %%#%% deploying ]^[ maintaining %%#%% 
platform %%#%% %%#%% challenge%%per%%]$~ ~$[perera et al%%per%% [perera et al%%per%% 2014] discuss %%#%% dif culty %%#%% 
maintaining %%#%% middleware %%#%% manage millions ]v[ billions %%#%% devices connected %%#%% %%#%% 
platform%%per%%]$~ ~$[similarly%%lst%% wenge et al%%per%% [wenge et al%%per%% 2014] discuss %%#%% %%#%% administration 
%%#%% %%#%% platform %%#%% %%#%% %%#%% challenge%%lst%% due %%#%% %%#%% size %%#%% %%#%% %%#%% %%#%% %%#%% large number 
%%#%% devices spread %%#%% %%#%% city%%per%%]$~ ~$[hancke et al%%per%% [hancke et al%%per%% 2012] %%#%% %%#%% %%#%% 
a:20 
santana%%lst%% e%%per%%]$~ ~$[f%%per%%]$~ ~$[z%%per%% et al%%per%% 
addressing coordination issues %%#%% %%#%% sensor nodes %%#%% %%#%% %%#%% problem%%lst%% %%#%% %%cmp_b%% 
%%#%% %%#%% size %%#%% %%#%% city sensor network%%per%% 
5%%per%%]$~ ~$[reference architecture %%#%% smart city platforms 
based %%#%% %%#%% knowledge surveyed %%#%% %%#%% paper%%lst%% %%#%% %%#%% %%#%% novel%%lst%% comprehensive ref%%dsh%% 
erence architecture %%#%% guide %%#%% development %%#%% next%%dsh%%generation software platforms ]f[ 
smart cities%%per%%]$~ ~$[the platform %%#%% derived %%#%% architectures proposed %%#%% previous works%%lst%% 
%%#%% enhancements based %%#%% %%#%% requirements ]^[ challenges described %%#%% %%#%% sur%%dsh%% 
vey%%per%%]$~ ~$[first%%lst%% %%#%% describe ]^[ analyze %%#%% architecture %%#%% %%#%% platforms %%#%% %%#%% %%#%% 
literature%%cln%% cidap ]^[ openiot%%per%%]$~ ~$[then%%lst%% based %%#%% %%#%% %%#%% works%%lst%% ]^[ %%#%% %%#%% answers 
%%#%% %%#%% research questions %%#%% before%%lst%% %%#%% derived %%#%% novel reference architecture%%per%%]$~ 
~$[finally%%lst%% %%#%% %%cmp%% %%#%% proposal %%#%% %%#%% %%#%% %%#%% architectures%%per%% 
5%%per%%1%%per%%]$~ ~$[cidap 
%%#%% city data ]^[ analytics platform (cidap) %%#%% %%#%% %%#%% data based platform %%#%% aims 
%%#%% %%#%% %%#%% data collected %%#%% %%#%% city %%#%% enable context%%dsh%%awareness ]^[ intelligence 
%%#%% applications ]^[ services%%per%%]$~ ~$[this platform processes large datasets collected %%#%% %%#%% 
iot middleware%%per%%]$~ ~$[figure 6 %%#%% %%#%% architecture %%#%% %%#%% platform%%lst%% %%#%% %%#%% %%#%% 
following ve main components%%per%%]$~ 
~$[fig%%per%% 6%%per%%]$~ ~$[cidap platform [cheng et al%%per%% 2015] 
iot%%dsh%%agents connect %%#%% %%#%% iot middleware ]^[ serve %%#%% %%#%% gateway %%#%% %%#%% devices 
available %%#%% %%#%% platform%%per%%]$~ ~$[each data source %%#%% %%#%% iot middleware %%#%% mapped %%#%% %%#%% 
iot%%dsh%%agent%%per%%]$~ 
~$[iot%%dsh%%brokers act %%#%% %%#%% uni ed interface %%#%% %%#%% iot agents%%lst%% facilitating access %%#%% %%#%% 
middleware data%%per%%]$~ ~$[this component communicates %%#%% %%#%% %%#%% data repository %%#%% 
send data %%#%% %%#%% stored%%lst%% ]^[ %%#%% %%#%% citymodel server %%#%% send data %%#%% %%#%% %%#%% directly 
%%#%% applications%%per%%]$~ 
~$[software platforms ]f[ smart cities 
a:21 
%%#%% %%#%% data repository stores raw data collected %%#%% %%#%% city ]^[ processed data 
%%#%% %%#%% %%#%% data processing component%%per%%]$~ ~$[the platform %%#%% %%#%% couchdb4 nosql 
database%%lst%% %%#%% stores data %%#%% json documents%%per%%]$~ ~$[this component %%#%% %%#%% %%#%% inter%%dsh%% 
nal processing tool %%#%% makes processing simple%%lst%% %%#%% %%#%% transforming data %%#%% %%#%% 
formats%%lst%% ]v[ creating %%#%% structured views ]^[ tables %%#%% index data%%per%%]$~ 
~$[big data processing %%#%% responsible ]f[ complex ]v[ intensive processing using %%#%% 
data stored %%#%% %%#%% %%#%% data repository%%lst%% %%#%% %%#%% data aggregation ]v[ data mining%%per%%]$~ 
~$[also%%lst%% %%#%% processes historical data using batch processes%%lst%% ]v[ real%%dsh%%time data using data 
streams%%per%%]$~ ~$[this component %%#%% apache spark ]f[ %%#%% processing%%per%%]$~ 
~$[city model server %%#%% %%#%% interface %%#%% %%#%% platform %%#%% external applications%%per%%]$~ ~$[the 
citymodel api allows applications %%#%% perform simple queries%%lst%% complex queries%%lst%% ]^[ 
subscribe %%#%% speci %%#%% pieces %%#%% data %%#%% %%#%% platform%%per%%]$~ ~$[simple queries request %%#%% 
latest data %%#%% devices%%lst%% complex queries request aggregated historical data%%lst%% ]^[ 
subscription %%#%% %%#%% mechanism ]f[ applications %%#%% periodically receive data %%#%% %%#%% 
devices%%per%%]$~ 
~$[the red%%lst%% green%%lst%% ]^[ blue boxes %%#%% figure 6 highlight %%#%% concepts %%#%% %%#%% implement 
%%#%% layer %%#%% %%#%% platform%%per%%]$~ ~$[the iot connector box %%#%% components %%#%% facilitate access 
]f[ iot devices %%#%% %%#%% platform%%per%%]$~ ~$[the %%#%% data box %%#%% components %%#%% store ]^[ analyze 
%%#%% data gathered %%#%% multiple sources%%per%%]$~ ~$[finally%%lst%% %%#%% cloud computing box indicates 
%%#%% interface %%#%% %%#%% platform %%#%% external applications%%lst%% %%#%% %%#%% implemented using 
cloud services%%per%%]$~ 
~$[cidap %%#%% mainly concerned %%#%% storing ]^[ processing %%#%% large amount %%#%% data %%#%% 
%%#%% platform%%lst%% %%#%% %%#%% %%#%% %%cmp_b%% %%#%% %%#%% massive amount %%#%% data collected %%#%% %%#%% 
city%%per%%]$~ ~$[the strong %%#%% %%#%% %%#%% architecture %%#%% data storage ]^[ processing%%lst%% %%#%% real%%dsh%%time 
]^[ batch processing modules%%lst%% ]^[ %%#%% %%#%% %%#%% %%#%% associated platform %%#%% %%#%% 
tested %%#%% %%#%% smartsantander testbed%%per%%]$~ 
~$[an %%#%% limitation %%#%% cidap %%#%% %%#%% %%#%% platform %%#%% ]n[ foresee speci %%#%% ser%%dsh%% 
vices ]^[ tools ]f[ application developers%%lst%% ]^[ %%#%% ]n[ allow %%#%% deployment %%#%% %%#%% 
services %%#%% %%#%% platform%%lst%% %%#%% %%#%% extensibility dif cult%%per%%]$~ 
~$[the red%%lst%% green%%lst%% ]^[ blue boxes %%#%% %%#%% gure highlight %%#%% concepts %%#%% %%#%% implement 
%%#%% layer %%#%% %%#%% platform%%per%%]$~ ~$[the iot connector box %%#%% components %%#%% facilitate %%#%% 
access %%#%% iot devices %%#%% %%#%% platform%%per%%]$~ ~$[the %%#%% data box %%#%% components %%#%% store ]^[ 
analyze %%#%% data gathered %%#%% multiple sources%%per%%]$~ ~$[finally%%lst%% %%#%% cloud computing box 
indicates %%#%% interface %%#%% %%#%% platform %%#%% external applications %%#%% %%#%% implemented 
using cloud services%%per%%]$~ 
~$[cidap %%#%% mainly concerned %%#%% storing ]^[ processing %%#%% large amount %%#%% data %%#%% 
%%#%% platform%%per%%]$~ ~$[it %%#%% %%#%% %%cmp_b%% %%#%% %%#%% huge amount %%#%% data collected %%#%% %%#%% city%%per%%]$~ 
~$[the strong %%#%% %%#%% %%#%% architecture %%#%% %%#%% data storage ]^[ processing%%lst%% %%#%% real%%dsh%%time 
]^[ batch processing modules%%lst%% ]^[ %%#%% %%#%% %%#%% %%#%% associated platform %%#%% %%#%% 
tested %%#%% %%#%% smartsantander testbed%%per%%]$~ 
~$[an %%#%% limitation %%#%% cidap %%#%% %%#%% %%#%% platform %%#%% ]n[ foresee speci %%#%% ser%%dsh%% 
vices ]^[ tools ]f[ application developers ]^[ %%#%% ]n[ allow %%#%% deployment %%#%% %%#%% 
services%%per%% 
5%%per%%2%%per%%]$~ ~$[openiot 
openiot %%#%% %%#%% internet %%#%% %%#%% platform %%#%% %%#%% %%#%% vital project [petrolo et al%%per%% 
2014] %%#%% create %%#%% smart city platform%%per%%]$~ ~$[figure 7 %%#%% %%#%% overview %%#%% %%#%% platform 
architecture%%lst%% %%#%% %%#%% %%#%% layers%%cln%% %%#%% physical plane%%lst%% %%#%% virtualized plane%%lst%% ]^[ 
%%#%% utility%%dsh%%app plane%%per%% 
4http://couchdb%%per%%apache%%per%%org 
a:22 
santana%%lst%% e%%per%%]$~ ~$[f%%per%%]$~ ~$[z%%per%% et al%%per%%]$~ 
~$[fig%%per%% 7%%per%%]$~ ~$[openiot platform [petrolo et al%%per%% 2014] 
%%#%% physical plane %%#%% %%#%% middleware responsible ]f[ collecting%%lst%% ltering%%lst%% combining%%lst%% 
]^[ cleaning data %%#%% sensors%%lst%% actuators%%lst%% ]^[ devices%%per%%]$~ ~$[this plane acts %%#%% %%#%% interface 
%%#%% %%#%% physical world ]^[ %%#%% openiot platform%%per%%]$~ ~$[the current version %%#%% openiot 
%%#%% %%#%% x%%dsh%%gsn middleware [calbimonte et al%%per%% 2014]%%lst%% %%#%% open%%dsh%%source middleware ]f[ 
managing%%lst%% monitoring%%lst%% ]^[ controlling iot devices%%per%%]$~ 
~$[the virtualized plane aims %%#%% store data%%lst%% execute services%%lst%% ]^[ schedule %%#%% execu%%dsh%% 
tion %%#%% %%#%% services%%per%%]$~ ~$[the main components %%#%% %%#%% virtualized plane %%#%% %%#%% following%%cln%% 
%%#%% scheduler receives requests ]f[ services ]^[ ensures %%#%% access %%#%% resources 
%%#%% %%#%% service needs%%lst%% %%#%% %%#%% data ]^[ data streams%%per%%]$~ ~$[this component %%#%% responsible 
]f[ discovering %%#%% sensors required ]f[ %%#%% service execution%%per%%]$~ 
~$[the cloud data storage %%#%% %%#%% %%#%% data %%#%% %%#%% platform%%lst%% e%%per%%g%%per%%%%lst%% data streams 
collected %%#%% %%#%% sensors ]^[ %%#%% data created %%#%% %%#%% platform%%lst%% %%#%% %%#%% user 
pro les%%lst%% service de nitions%%lst%% ]^[ registered applications%%per%%]$~ ~$[for storing data collected 
%%#%% %%#%% iot middleware%%lst%% openiot %%#%% %%#%% linked sensor middleware (lsm) [le%%dsh%% 
phuoc et al%%per%% 2012]%%per%%]$~ 
~$[the service delivery ]^[ utility manager %%#%% %%#%% primary functions%%cln%% han%%dsh%% 
dling %%#%% combination %%#%% %%#%% data collected %%#%% %%#%% iot middleware%%lst%% allowing ser%%dsh%% 
vice de nitions%%lst%% ]^[ delivering %%#%% results %%#%% requested services %%#%% %%#%% platform ]v[ %%#%% 
third%%dsh%%party applications%%per%%]$~ ~$[also%%lst%% %%#%% component %%#%% track %%#%% %%#%% usage %%#%% %%#%% services 
de ned %%#%% %%#%% platform ]f[ accounting ]^[ billing%%per%%]$~ 
~$[the utility%%dsh%%app plane%%lst%% %%#%% user interface %%#%% %%#%% platform%%lst%% %%#%% %%#%% main compo%%dsh%% 
nents%%cln%% 
request de nition enables users %%#%% de ne %%#%% applications using %%#%% services de%%dsh%% 
ployed %%#%% %%#%% platform%%lst%% including %%#%% de nition %%#%% service mash%%dsh%%ups%%per%%]$~ 
~$[request presentation executes %%#%% applications created %%#%% %%#%% request de nition 
component%%per%%]$~ ~$[when %%#%% user executes %%#%% application%%lst%% %%#%% communicates %%#%% %%#%% service 
delivery ]^[ utility manager %%#%% retrieve %%#%% results %%#%% %%#%% service executions%%per%%]$~ 
~$[software platforms ]f[ smart cities 
a:23 
con guration ]^[ monitoring allows con guration %%#%% platform parameters%%lst%% %%#%% 
%%#%% periodicity %%#%% sensor data reads ]^[ monitoring %%#%% health %%#%% %%#%% platform devices 
]^[ components%%per%%]$~ 
~$[openiot %%#%% %%#%% complete platform%%lst%% handling %%#%% %%#%% %%#%% main requirements %%#%% 
%%#%% described %%#%% %%#%% survey%%per%%]$~ ~$[the strong %%#%% %%#%% %%#%% platform %%#%% %%#%% %%#%% %%#%% %%#%% iot 
middleware %%#%% con gure ]^[ collect data %%#%% devices%%lst%% %%#%% middleware %%#%% store %%#%% 
data collected %%#%% sensors%%lst%% %%#%% development tools%%lst%% ]^[ %%#%% %%#%% %%#%% %%#%% platform %%#%% 
%%#%% source%%per%%]$~ ~$[however%%lst%% %%#%% architecture %%#%% ]n[ consider %%#%% data sources%%lst%% %%#%% %%#%% so%%dsh%% 
cial networks%%lst%% ]^[ %%#%% ]n[ provide support ]f[ pre%%dsh%%processing services relevant %%#%% 
dealing %%#%% %%#%% data%%per%% 
5%%per%%3%%per%%]$~ ~$[the uni ed reference architecture 
based %%#%% %%#%% answers %%#%% %%#%% research questions %%#%% %%#%% survey%%lst%% %%#%% 23 platforms an%%dsh%% 
alyzed%%lst%% ]^[ %%#%% %%#%% %%#%% architectures %%#%% above%%lst%% %%#%% derived %%#%% novel reference 
architecture ]f[ software platforms ]f[ smart cities%%per%%]$~ ~$[with %%#%% reference architecture%%lst%% 
%%#%% answer %%#%% %%#%% research question stated %%#%% section 1 %%#%% %%#%% %%#%% %%#%% elements 
required ]f[ %%#%% development %%#%% %%#%% highly%%dsh%%effective software platform ]f[ enabling %%#%% 
easy construction %%#%% highly%%dsh%%scalable%%lst%% integrated smart city applications? )%%per%%]$~ ~$[figure 8 
%%#%% %%#%% overview %%#%% %%#%% architecture%%per%%]$~ 
~$[fig%%per%% 8%%per%%]$~ ~$[reference architecture ]f[ smart city platforms 
a:24 
santana%%lst%% e%%per%%]$~ ~$[f%%per%%]$~ ~$[z%%per%% et al%%per%%]$~ 
~$[the lowest level component %%#%% %%#%% reference architecture %%#%% cloud ]^[ network%%dsh%% 
ing%%lst%% %%#%% %%#%% responsible ]f[ %%#%% management ]^[ communication %%#%% %%#%% city network 
nodes%%per%%]$~ ~$[this component %%#%% %%#%% identify %%#%% %%#%% devices connected %%#%% %%#%% platform%%lst%% in%%dsh%% 
cluding servers%%lst%% sensors%%lst%% actuators%%lst%% ]^[ user devices%%per%%]$~ ~$[using cloud computing concepts 
%%#%% %%#%% %%#%% ensure %%#%% fundamental non%%dsh%%functional requirements%%lst%% including scal%%dsh%% 
ability ]^[ extensibility%%per%%]$~ 
~$[just %%#%% top %%#%% %%#%% cloud ]^[ networking infrastructure%%lst%% %%#%% reference architecture 
includes %%#%% iot middleware ]^[ %%#%% service middleware%%per%%]$~ ~$[the former %%#%% %%#%% man%%dsh%% 
age %%#%% city iot network ]^[ enable %%#%% effective communication %%#%% %%#%% platform %%#%% 
%%#%% user devices%%lst%% city sensors%%lst%% ]^[ actuators%%per%%]$~ ~$[the service middleware %%#%% %%#%% manage 
%%#%% services %%#%% %%#%% platform %%#%% provide %%#%% %%#%% applications%%lst%% performing operations 
%%#%% %%#%% publishing%%lst%% enacting%%lst%% monitoring%%lst%% composing%%lst%% ]^[ choreographing %%#%% ser%%dsh%% 
vices%%per%%]$~ 
~$[the x%%dsh%%gsn middleware %%#%% %%#%% %%#%% %%#%% implement %%#%% iot middleware%%lst%% %%#%% %%#%% 
%%#%% %%#%% %%#%% %%#%% openiot project%%per%%]$~ ~$[another option %%#%% %%#%% %%#%% components %%#%% %%#%% sen%%dsh%% 
tilo platform%%lst%% %%#%% %%#%% %%#%% open%%dsh%%source%%lst%% ]^[ implement %%#%% complete iot middleware%%per%%]$~ 
~$[the choreos framework [issarny et al%%per%% 2011] %%#%% %%#%% %%#%% %%#%% implement %%#%% service 
middleware%%scn%% %%#%% project aims %%#%% enable choreographies %%#%% large%%dsh%%scale service%%dsh%%based 
software systems%%per%%]$~ 
~$[to provide %%#%% services %%#%% %%#%% citizens%%lst%% %%#%% %%#%% %%#%% ]f[ %%#%% platform %%#%% store 
%%#%% user data ]^[ preferences%%lst%% %%#%% %%#%% %%#%% role %%#%% %%#%% user management compo%%dsh%% 
nent%%per%%]$~ ~$[but%%lst%% %%#%% ensure user privacy%%lst%% %%#%% data %%#%% %%#%% properly protected%%lst%% ]^[ permission 
%%#%% store %%#%% %%#%% %%#%% acquired %%#%% %%#%% user%%per%%]$~ ~$[moreover%%lst%% %%#%% %%#%% city platform %%#%% %%#%% 
%%#%% applications%%lst%% %%#%% %%#%% %%#%% helpful %%#%% offer %%#%% single sign%%dsh%%on mechanism%%per%%]$~ 
~$[social networks %%#%% %%#%% %%#%% major role %%#%% smart cities%%per%%]$~ ~$[they %%#%% %%#%% %%#%% %%#%% retrieve 
data %%#%% city conditions%%lst%% ]^[ %%#%% %%#%% %%#%% ef cient communication channel %%#%% %%#%% 
platform ]^[ city government %%#%% %%#%% citizens%%per%%]$~ ~$[therefore%%lst%% %%#%% %%#%% %%#%% %%#%% allow %%#%% 
integration %%#%% %%#%% smart city platform %%#%% existing social networks%%per%%]$~ ~$[this %%#%% %%#%% role %%#%% 
%%#%% social network gateway%%per%%]$~ ~$[to implement %%#%% gateway%%lst%% %%#%% tools %%#%% %%#%% used%%lst%% 
%%#%% %%#%% spark streaming%%lst%% %%#%% reads data streams %%#%% twitter%%lst%% ]^[ spring social%%lst%% 
%%#%% %%#%% %%#%% java%%dsh%%based framework %%#%% facilitate %%#%% connection %%#%% social networks %%#%% 
%%#%% twitter%%lst%% facebook%%lst%% ]^[ linkedin%%per%%]$~ 
~$[big data management %%#%% %%#%% module %%#%% manage %%#%% %%#%% data %%#%% %%#%% platform%%per%%]$~ ~$[it 
%%#%% responsible ]f[ storing %%#%% data collected %%#%% %%#%% city ]^[ generated %%#%% %%#%% plat%%dsh%% 
form%%per%%]$~ ~$[to %%#%% extent%%lst%% %%#%% reference platform %%#%% %%#%% repositories%%cln%% (1) %%#%% app repos%%dsh%% 
itory %%#%% store applications%%lst%% including %%#%% source/binary code%%lst%% images%%lst%% ]^[ associated 
documents%%scn%% (2) %%#%% model repository %%#%% store %%#%% city models%%lst%% %%#%% %%#%% %%#%% traf %%#%% model%%lst%% 
sensor network model%%lst%% data model%%lst%% city maps%%lst%% ]^[ %%#%% energy distribution model%%scn%% ]^[ 
(3) %%#%% data repository %%#%% store %%#%% data collected %%#%% sensors%%lst%% citizens%%lst%% ]^[ applica%%dsh%% 
tions%%per%%]$~ ~$[because %%#%% %%#%% amount %%#%% data %%#%% %%#%% platform ]f[ smart cities generate%%lst%% nosql 
databases %%#%% %%#%% %%#%% suitable %%cmp_ta%% relational databases%%per%%]$~ 
~$[besides %%#%% data storage%%lst%% %%#%% %%#%% data management module %%#%% %%#%% responsible ]f[ 
%%#%% processing %%#%% city data%%per%%]$~ ~$[there %%#%% %%#%% types %%#%% data processing %%#%% %%#%% %%#%% %%#%% 
suitable ]f[ %%#%% situations%%cln%% stream processing%%lst%% %%#%% perform real%%dsh%%time analytics 
]^[ data%%dsh%% ow processing%%scn%% ]^[ batch processing%%lst%% %%#%% analyze large data%%dsh%%sets%%per%%]$~ ~$[more%%dsh%% 
over%%lst%% %%#%% module %%#%% %%#%% capable %%#%% performing useful pre%%dsh%%processing tasks%%lst%% %%#%% %%#%% 
data ltering%%lst%% normalization%%lst%% ]^[ transformation%%per%%]$~ 
~$[the %%#%% data module %%#%% %%#%% %%#%% machine learning component%%lst%% %%#%% facilitates 
understanding %%#%% %%#%% city %%#%% automatically building models %%#%% city processes behav%%dsh%% 
ior ]^[ %%#%% predictions %%#%% city phenomena%%per%%]$~ ~$[since %%#%% smart city %%#%% produce %%#%% 
enormous amount %%#%% data%%lst%% %%#%% data cleaning component %%#%% responsible ]f[ garbage col%%dsh%% 
software platforms ]f[ smart cities 
a:25 
lection%%lst%% deleting unneeded data%%lst%% ]^[ archiving %%#%% data %%#%% slower%%lst%% %%#%% capacity data 
stores%%per%%]$~ 
~$[to implement %%#%% %%#%% data management components%%lst%% %%#%% open%%dsh%%source tools %%#%% 
available%%per%%]$~ ~$[to %%#%% repositories%%lst%% nosql databases%%lst%% %%#%% %%#%% couchdb%%lst%% mongodb%%lst%% ]^[ 
cassandra%%lst%% %%#%% store %%#%% unstructured ]v[ semi%%dsh%%structured data%%lst%% %%#%% %%#%% sensor reads 
]^[ social networks posts%%per%%]$~ ~$[relational databases%%lst%% %%#%% %%#%% mysql ]^[ postgresql%%lst%% %%#%% 
store structured data%%lst%% %%#%% %%#%% user information ]^[ %%#%% platform con guration%%per%%]$~ 
~$[to implement %%#%% processing engines%%lst%% %%#%% tools %%#%% %%#%% available%%per%%]$~ ~$[to execute batch 
processing%%lst%% apache hadoop ]^[ apache spark %%#%% widely %%#%% %%#%% %%#%% platforms%%per%%]$~ 
~$[apache spark %%#%% provides %%#%% stream data processing tool%%lst%% likewise apache storm%%per%%]$~ 
~$[many tools offer machine learning algorithms %%#%% process large data sets %%#%% %%#%% weka5%%lst%% 
spark mlib%%lst%% ]^[ scikit%%dsh%%learn6%%per%%]$~ 
~$[relying %%#%% aforementioned middleware component%%lst%% application developers ]^[ 
smart city operators %%#%% develop ]^[ deploy smart city applications%%per%%]$~ ~$[by using %%#%% 
data ]^[ %%#%% services provided %%#%% %%#%% city%%lst%% common citizens ]^[ users %%#%% %%#%% execute%%lst%% 
]v[ %%#%% develop%%lst%% novel applications %%#%% run %%#%% top %%#%% %%#%% city %%#%% smart infrastructure%%per%%]$~ ~$[the 
applications %%#%% %%#%% %%#%% services ]^[ data %%#%% %%#%% platform%%lst%% ]b[ %%#%% generate ]^[ 
store data %%#%% %%#%% platform%%per%%]$~ ~$[the platform %%#%% provide %%#%% sdk %%#%% facilitate %%#%% devel%%dsh%% 
opment %%#%% applications%%lst%% including tools %%#%% %%#%% %%#%% integrated development environ%%dsh%% 
ment (ide)%%lst%% libraries%%lst%% ]^[ frameworks ]f[ commonly %%#%% programming languages%%lst%% 
]^[ %%#%% smart city simulator ]f[ debugging ]^[ experimenting %%#%% applications %%#%% 
real deployment%%per%%]$~ 
~$[all components %%#%% %%#%% platform %%#%% support %%#%% non%%dsh%%functional requirements%%lst%% 
%%#%% %%#%% scalability%%lst%% security%%lst%% privacy%%lst%% ]^[ interoperability%%per%%]$~ ~$[scalability %%#%% fundamental 
%%cmp_b%% %%#%% %%#%% huge amount %%#%% devices%%lst%% data%%lst%% ]^[ services %%#%% %%#%% platform%%per%%]$~ ~$[privacy ]^[ 
security %%#%% %%#%% %%cmp_b%% %%#%% platform collects%%lst%% stores%%lst%% ]^[ processes sensible 
data %%#%% %%#%% city ]^[ citizens%%per%%]$~ ~$[interoperability %%#%% allow %%#%% integrated operation 
%%#%% %%#%% types %%#%% services%%lst%% devices%%lst%% ]^[ applications%%per%%]$~ ~$[table %%#%% %%#%% options %%#%% 
implement %%#%% reference architecture using tools %%#%% %%#%% platforms described %%#%% %%#%% 
survey use%%per%%]$~ 
~$[table v%%per%%]$~ ~$[technologies %%#%% %%#%% %%#%% platforms implementation 
component 
iot middleware 
data repository 
data processing 
stream processing 
cluster management 
cloud environment 
data access 
security 
machine learning 
tools 
sentilo ]^[ x%%dsh%%gsn 
mongodb%%lst%% couchdb%%lst%% mysql%%lst%% ibm db2%%lst%% ]^[ redis 
spark ]^[ hadoop 
storm 
apache zookeeper ]^[ haddop yarn 
opennebula ]^[ microsoft azure 
rest apis ]^[ jersey 
saml protocol 
weka%%lst%% spark mlib%%lst%% ]^[ scikit learn 
5%%per%%4%%per%%]$~ ~$[comparison %%#%% architectures 
%%#%% %%#%% architecture%%lst%% %%#%% combined aspects %%#%% %%#%% platforms described %%#%% %%#%% beginning 
%%#%% %%#%% section%%per%%]$~ ~$[our %%#%% data module %%#%% similar %%#%% %%#%% %%#%% %%#%% cidap%%scn%% %%#%% foresee batch 
5weka %%dsh%% https://weka%%per%%wikispaces%%per%%com/ 
6scikit%%dsh%%learn %%dsh%% http://scikit%%dsh%%learn%%per%%org/stable/ 
a:26 
santana%%lst%% e%%per%%]$~ ~$[f%%per%%]$~ ~$[z%%per%% et al%%per%% 
]^[ real%%dsh%%time processing ]^[ %%#%% data storage components%%per%%]$~ ~$[however%%lst%% %%#%% added %%#%% idea 
%%#%% %%#%% application repository (to store data ]^[ meta%%dsh%%data associated %%#%% applications 
]s[ %%#%% %%#%% %%#%% %%#%% manage ]^[ re ect %%#%% %%#%% applications executing %%#%% %%#%% city)%%lst%% %%#%% 
%%#%% %%#%% %%#%% model repository (to store %%#%% types %%#%% models associated %%#%% various 
city%%dsh%%related phenomena %%#%% %%#%% %%#%% kinds %%#%% maps%%lst%% data ows%%lst%% user behaviors%%lst%% 
automated processes%%lst%% ]^[ more)%%per%%]$~ 
~$[similar %%#%% openiot%%lst%% %%#%% included %%#%% cloud ]^[ networking layer %%#%% manage %%#%% de%%dsh%% 
vices %%#%% collect data %%#%% %%#%% city ]^[ execute service ]^[ application components%%per%%]$~ 
~$[we %%#%% included %%#%% service middleware %%#%% support %%#%% service%%dsh%%related operations%%lst%% 
%%#%% %%#%% deployment%%lst%% management%%lst%% composition (via orchestrations ]^[ choreogra%%dsh%% 
phies)%%lst%% ]^[ enactment%%scn%% openiot %%#%% provides %%#%% service delivery component %%#%% %%#%% 
limited support ]f[ %%#%% %%#%% %%#%% operations%%per%%]$~ 
~$[we %%#%% included %%#%% components %%#%% %%#%% ]n[ %%#%% %%#%% %%#%% architectures%%lst%% ]b[ %%#%% 
considered relevant %%#%% %%#%% literature review%%per%%]$~ ~$[the rst %%#%% %%#%% social network gateway%%lst%% 
%%#%% %%#%% %%#%% %%cmp_b%% social networks connect citizens%%lst%% %%#%% city administration%%lst%% 
]^[ service providers%%lst%% ]^[ generate %%#%% lot %%#%% useful data ]f[ city applications%%per%%]$~ 
~$[although openiot provides %%#%% development tools %%#%% create applications using %%#%% 
available services%%lst%% %%#%% smart city platform %%#%% %%#%% %%#%% provide %%#%% complete software 
development toolkit%%per%%]$~ ~$[this sdk %%#%% %%#%% %%#%% aware %%#%% %%#%% %%#%% components %%#%% %%#%% platform%%lst%% 
]^[ enable %%#%% construction %%#%% sophisticated mash%%dsh%%ups based %%#%% them%%per%%]$~ ~$[for example%%lst%% %%#%% 
%%#%% allow %%#%% development %%#%% %%#%% service using data %%#%% %%#%% iot middleware%%lst%% combined 
%%#%% data %%#%% social networks%%lst%% ]^[ thereby generating %%#%% data stream %%#%% %%#%% ltered%%lst%% 
processed%%lst%% distributed %%#%% %%#%% users %%#%% %%#%% subscribed %%#%% %%#%% speci %%#%% channel and%%lst%% 
later%%lst%% summarized ]^[ stored %%#%% %%#%% long%%dsh%%term persistent storage %%#%% order %%#%% maintain 
historical records%%per%% 
6%%per%%]$~ ~$[discussion 
%%#%% %%#%% discuss %%#%% ndings %%#%% %%#%% research%%per%%]$~ ~$[section 6%%per%%1 relates %%#%% %%#%% enabling tech%%dsh%% 
nologies %%#%% %%#%% functional ]^[ non%%dsh%%functional requirements%%scn%% section 6%%per%%2 discusses 
%%#%% research challenges%%scn%% section 6%%per%%3 %%#%% %%#%% implications %%#%% %%#%% survey %%#%% smart 
city stakeholders%%lst%% %%#%% %%#%% city managers%%lst%% citizens%%lst%% ]^[ developers%%per%%]$~ ~$[finally%%lst%% section 6%%per%%4 
considers %%#%% limitations %%#%% %%#%% work%%per%% 
6%%per%%1%%per%%]$~ ~$[enabling technologies ]^[ requirements 
%%#%% survey %%#%% multiple approaches ]f[ %%#%% development %%#%% smart city plat%%dsh%% 
forms%%per%%]$~ ~$[from %%#%% study%%lst%% %%#%% highly signi cant functional requirements emerged%%cln%% man%%dsh%% 
agement %%#%% sensor ]^[ actuator networks%%scn%% management %%#%% %%#%% data collected %%#%% %%#%% 
city%%scn%% provisioning%%lst%% management%%lst%% ]^[ development %%#%% services%%scn%% ]^[ %%#%% environment ]f[ 
%%#%% development ]^[ deployment %%#%% smart city applications%%per%%]$~ ~$[these features %%#%% %%#%% 
related %%#%% %%#%% enabling technologies%%lst%% mapping %%#%% onto %%#%% major functional ]^[ non%%dsh%% 
functional requirements %%#%% smart city platforms%%per%%]$~ 
~$[technologies %%#%% %%#%% internet %%#%% %%#%% %%#%% %%#%% ]f[ managing %%#%% sensor ]^[ 
actuator networks ]^[ %%#%% challenges%%lst%% %%#%% %%#%% heterogeneity%%lst%% scalability%%lst%% ]^[ adap%%dsh%% 
tation%%per%%]$~ ~$[big data ]^[ cloud computing %%#%% %%#%% %%#%% deal %%#%% %%#%% massive amount %%#%% 
data generated %%#%% multiple data sources %%#%% %%#%% city%%lst%% %%#%% %%#%% wsn%%lst%% social networks%%lst%% 
]^[ user devices%%per%%]$~ ~$[big data tools %%#%% required ]f[ %%#%% data%%dsh%%related activities%%lst%% %%#%% 
%%#%% storing%%lst%% analyzing%%lst%% ]^[ sharing%%per%%]$~ ~$[cloud computing provides %%#%% scalable ]^[ elastic 
environment %%#%% store ]^[ process city data%%per%%]$~ 
~$[figure 9 %%#%% %%#%% relation %%#%% %%#%% implemented functional requirements %%#%% 
platforms ]^[ %%#%% enabling technologies%%per%%]$~ ~$[for example%%lst%% %%#%% %%#%% %%#%% %%#%% verify %%#%% %%#%% 
%%#%% %%#%% %%#%% data platforms handle data management ]^[ data processing%%per%%]$~ ~$[cloud com%%dsh%% 
puting platforms handle external data access ]^[ service management%%per%%]$~ 
~$[software platforms ]f[ smart cities 
a:27 
fig%%per%% 9%%per%%]$~ ~$[relationship %%#%% functional requirements ]^[ enabling technologies 
figure 10 relates %%#%% non%%dsh%%functional requirements ]^[ %%#%% enabling technologies%%per%%]$~ 
~$[we %%#%% observe %%#%% %%#%% platforms %%#%% concerned %%#%% scalability%%lst%% regardless %%#%% %%#%% 
enabling technology used%%per%%]$~ ~$[it %%#%% %%#%% %%#%% verify relationships %%#%% %%#%% non%%dsh%% 
functional requirements ]^[ %%#%% technologies%%per%%]$~ ~$[for example%%lst%% %%#%% %%#%% cps platforms han%%dsh%% 
dle con gurability%%per%%]$~ ~$[extensibility %%#%% %%#%% offered %%#%% platforms %%#%% %%#%% %%#%% data%%lst%% ]^[ 
interoperability %%#%% %%#%% platforms %%#%% %%#%% iot%%per%%]$~ 
~$[fig%%per%% 10%%per%%]$~ ~$[relationship %%#%% non%%dsh%%functional requirements ]^[ enabling technologies 
a:28 
santana%%lst%% e%%per%%]$~ ~$[f%%per%%]$~ ~$[z%%per%% et al%%per%% 
6%%per%%2%%per%%]$~ ~$[challenges ]^[ %%#%% research problems 
%%#%% %%#%% %%#%% signi cant challenges ]^[ research problems %%#%% implementing %%#%% platform 
]f[ smart cities %%#%% related %%#%% data management%%per%%]$~ ~$[the %%#%% cited problem %%#%% %%#%% litera%%dsh%% 
ture %%#%% ensuring %%#%% privacy %%#%% user data%%lst%% %%cmp_b%% %%#%% %%#%% amount %%#%% personal ]^[ critical 
data %%#%% %%#%% platform %%#%% %%#%% handle%%lst%% %%#%% %%#%% user locations ]^[ medical records%%per%%]$~ 
~$[the %%#%% %%#%% cited challenge %%#%% heterogeneity%%lst%% %%cmp_b%% %%#%% %%#%% large number %%#%% 
%%#%% systems%%lst%% services%%lst%% applications%%lst%% ]^[ devices %%#%% %%#%% platform %%#%% support%%per%%]$~ 
~$[we %%#%% surprised %%#%% %%#%% %%#%% authors cited scalability %%#%% %%#%% problem%%lst%% %%cmp_b%% %%#%% 
%%#%% %%#%% %%#%% %%#%% %%#%% challenge support %%#%% huge number %%#%% devices%%lst%% users%%lst%% data%%lst%% 
]^[ services %%#%% %%#%% large metropolis%%per%%]$~ 
~$[an %%#%% ]^[ understudied issue %%#%% %%#%% %%#%% create %%#%% generic platform %%#%% support 
%%#%% requirements %%#%% %%#%% cities%%per%%]$~ ~$[some literature focuses %%#%% %%#%% particular city%%lst%% %%#%% 
%%#%% windygrid%%lst%% smartsantander%%lst%% ]^[ padova smart city%%per%%]$~ ~$[other platforms provide solu%%dsh%% 
tions %%#%% discussing %%#%% characteristics %%#%% %%#%% cities %%#%% %%#%% %%#%% solution %%#%% 
%%#%% applied%%per%%]$~ ~$[the studies proposing generic solutions ]f[ smart cities lack %%#%% discussion 
concerning %%#%% %%#%% components %%#%% %%#%% platforms %%#%% %%#%% adapted %%#%% %%#%% cities %%#%% 
%%#%% sizes ]^[ characteristics%%per%% 
6%%per%%3%%per%%]$~ ~$[implications 
%%#%% paper %%#%% %%#%% features %%#%% software platforms ]f[ smart cities 
%%#%% handle%%per%%]$~ ~$[the results %%#%% %%#%% references ]f[ %%#%% city stakeholders%%lst%% 
%%#%% %%#%% platform developers%%lst%% application developers%%lst%% city managers%%lst%% system operators%%lst%% 
end%%dsh%%users%%lst%% ]^[ smart city researchers%%per%%]$~ ~$[in %%#%% section%%lst%% %%#%% discuss %%#%% potential impli%%dsh%% 
cations %%#%% %%#%% ndings ]f[ %%#%% stakeholders%%per%%]$~ 
~$[the enabling technologies highlight %%#%% infrastructure %%#%% %%#%% build smart cities%%per%%]$~ 
~$[city managers %%#%% %%#%% %%#%% information %%#%% improve %%#%% investment decisions%%per%%]$~ ~$[big 
data ]^[ cloud computing deal %%#%% %%#%% enormous volume %%#%% data storage ]^[ net%%dsh%% 
%%#%% infrastructure %%#%% access data ]^[ services%%per%%]$~ ~$[the city %%#%% %%#%% equipped %%#%% sen%%dsh%% 
sors%%lst%% actuators%%lst%% ]^[ internet services %%#%% %%#%% advantage %%#%% %%#%% internet %%#%% %%#%% ]^[ 
cyber%%dsh%%physical spaces%%per%%]$~ ~$[besides%%lst%% %%#%% survey %%#%% help smart city application ]^[ sys%%dsh%% 
tem developers decide %%#%% technologies %%#%% use%%per%%]$~ 
~$[the reference architecture highlights %%#%% functional ]^[ non%%dsh%%functional require%%dsh%% 
ments %%#%% platforms ]^[ applications developers %%#%% consider %%#%% developing 
software ]f[ smart cities%%per%%]$~ ~$[for platforms developers%%lst%% %%#%% survey indicates %%#%% %%#%% nec%%dsh%% 
essary %%#%% deal %%#%% %%#%% heterogeneous ]^[ distributed systems%%lst%% %%#%% %%#%% %%#%% critical ]^[ 
personal data%%lst%% %%#%% %%#%% effective ]^[ ef cient way%%per%%]$~ ~$[for application developers%%lst%% %%#%% refer%%dsh%% 
ence architecture %%#%% %%#%% kind %%#%% services ]^[ data %%#%% %%#%% %%#%% %%#%% provide %%#%% 
experiences %%#%% %%#%% end%%dsh%%users%%per%%]$~ ~$[by discussing examples %%#%% %%#%% systems%%lst%% %%#%% %%#%% %%#%% 
end%%dsh%%users%%lst%% ]v[ citizens%%lst%% %%#%% range %%#%% system domains %%#%% %%#%% %%#%% developed %%#%% facilitate 
%%#%% daily routine%%lst%% %%#%% %%#%% urban mobility%%lst%% air pollution%%lst%% ]^[ heath care%%per%%]$~ 
~$[finally%%lst%% %%#%% survey %%#%% %%#%% helps smart city researchers %%#%% discussing %%#%% main 
%%#%% research questions ]^[ challenges %%#%% %%#%% overcome %%#%% build smarter cities%%per%%]$~ ~$[these 
challenges %%#%% guide future %%#%% %%#%% %%#%% research area%%per%% 
6%%per%%4%%per%%]$~ ~$[limitations 
%%#%% %%#%% survey%%lst%% %%#%% decided %%#%% describe %%#%% %%#%% %%#%% cited enabling technologies %%#%% 
%%#%% smart city platforms%%per%%]$~ ~$[however%%lst%% %%#%% found %%#%% less employed technologies%%lst%% %%#%% %%#%% 
m2m communications ]^[ %%#%% semantic web%%per%%]$~ ~$[these non%%dsh%%cited technologies %%#%% %%#%% 
%%#%% %%#%% platforms%%lst%% ]v[ %%#%% %%#%% %%#%% solve %%#%% %%#%% problem ]b[ ]n[ %%#%% serve %%#%% %%#%% fundamen%%dsh%% 
tal architectural component %%#%% %%#%% platform%%per%%]$~ ~$[thus%%lst%% %%#%% %%#%% %%#%% key technologies 
software platforms ]f[ smart cities 
a:29 
%%#%% %%#%% %%#%% %%#%% %%#%% relevant %%#%% %%#%% future %%#%% %%#%% ]n[ ]y[ %%#%% identi ed %%#%% %%#%% 
survey%%per%%]$~ 
~$[we %%#%% %%#%% %%#%% cited paper %%#%% %%#%% research project %%#%% extract components%%lst%% re%%dsh%% 
quirements%%lst%% ]^[ features %%#%% %%#%% platforms%%per%%]$~ ~$[other papers%%lst%% ]v[ %%#%% project website%%lst%% %%#%% 
de ne %%#%% aspects%%per%%]$~ 
~$[in %%#%% research%%lst%% %%#%% classi ed %%#%% papers according %%#%% %%#%% enabling technologies %%#%% 
%%#%% %%#%% %%#%% explicitly mentioned%%per%%]$~ ~$[however%%lst%% %%#%% noticed that%%lst%% %%#%% %%#%% papers%%lst%% %%#%% 
%%#%% %%#%% %%#%% %%#%% %%#%% motivating aspect ]v[ future work%%per%%]$~ ~$[for example%%lst%% khan et al%%per%% [khan 
et al%%per%% 2013] %%#%% ]n[ explicitly mention iot %%#%% %%#%% architecture%%lst%% ]b[ %%#%% authors discuss 
%%#%% possibility %%#%% using smart hardware %%#%% %%#%% sensor networks ]v[ smart household 
appliances%%lst%% %%#%% %%#%% %%#%% organized %%#%% %%#%% iot system%%per%% 
7%%per%%]$~ ~$[related surveys 
%%#%% %%#%% literature search%%lst%% %%#%% found %%#%% papers %%#%% %%#%% surveyed platforms ]^[ appli%%dsh%% 
cations ]f[ smart cities%%per%%]$~ 
~$[da silva et al%%per%% [da silva et al%%per%% 2013] surveyed architectures %%#%% smart cities platforms%%lst%% 
analyzing %%#%% requirements handled %%#%% %%#%% platforms%%per%%]$~ ~$[however%%lst%% %%#%% analyzed %%#%% 
platforms ]^[ %%#%% ]n[ distinguish functional ]^[ non%%dsh%%functional requirements%%lst%% ]^[ 
%%#%% ]n[ address future research ]^[ %%#%% challenges %%#%% %%#%% area%%per%%]$~ 
~$[yin et al%%per%% [yin et al%%per%% 2015] conducted %%#%% survey %%#%% smart cities%%per%%]$~ ~$[although %%#%% paper 
%%#%% %%#%% platforms%%lst%% %%#%% main goal %%#%% %%#%% %%#%% %%#%% %%#%% understand %%#%% concept %%#%% 
smart cities%%lst%% identifying %%#%% enabling technologies ]^[ smart city research issues%%per%%]$~ 
~$[al nuaimi et al%%per%% [al nuaimi et al%%per%% 2015] reviewed %%#%% %%#%% %%#%% %%#%% data tools ]^[ 
concepts %%#%% applications ]f[ smart cities%%per%%]$~ ~$[the paper mainly %%#%% %%#%% relation be%%dsh%% 
tween %%#%% challenges %%#%% creating applications ]f[ smart cities ]^[ %%#%% %%#%% %%#%% %%#%% data 
tools%%per%%]$~ ~$[it %%#%% identi es smart city requirements %%#%% %%#%% data tools %%#%% address%%per%%]$~ ~$[it %%#%% 
%%#%% similarities %%#%% %%#%% work%%lst%% ]b[ %%#%% conducted %%#%% %%#%% %%#%% ]^[ comprehensive 
survey%%per%%]$~ 
~$[finally%%lst%% botta et al%%per%% [botta et al%%per%% 2015] %%#%% %%#%% study %%#%% %%#%% integration %%#%% cloud 
computing ]^[ %%#%% internet %%#%% things%%lst%% de ning %%#%% novel paradigm %%#%% cloudiot%%per%%]$~ ~$[they 
describe applications %%#%% %%#%% %%#%% paradigm%%lst%% %%#%% %%#%% health care%%lst%% transportation%%lst%% ]^[ 
smart cities%%per%%]$~ ~$[the paper %%#%% platforms %%#%% %%#%% %%#%% %%#%% concepts%%lst%% %%#%% %%#%% %%#%% 
%%#%% %%#%% %%#%% here%%lst%% %%#%% %%#%% openiot ]^[ clout%%per%%]$~ 
~$[in %%#%% work%%lst%% %%#%% studied smart city software platforms ]^[ %%#%% related ict prob%%dsh%% 
lems%%lst%% aiming %%#%% derive %%#%% major functional ]^[ non%%dsh%%functional requirements%%lst%% ]^[ %%#%% 
technical ]^[ research %%#%% challenges%%per%%]$~ ~$[besides%%lst%% %%#%% %%#%% %%#%% reference architecture 
derived %%#%% %%#%% requirements %%#%% %%#%% %%#%% %%#%% surveyed studies%%per%% 
8%%per%%]$~ ~$[conclusion 
smart city %%#%% %%#%% concept %%#%% %%#%% gained increased attention %%#%% academic%%lst%% industrial%%lst%% 
]^[ governmental circles%%per%%]$~ ~$[while %%#%% urban population %%#%% growing%%lst%% %%#%% infrastructure 
]^[ resources required %%#%% support citizens %%#%% %%#%% insuf cient%%lst%% leading %%#%% %%#%% degrada%%dsh%% 
tion %%#%% public services%%per%%]$~ ~$[information ]^[ communication technologies provide impor%%dsh%% 
tant tools %%#%% reduce %%#%% problem%%lst%% helping %%#%% improve %%#%% sustainable %%#%% %%#%% resources%%lst%% 
city services%%lst%% ]^[ %%#%% citizens quality %%#%% life%%per%%]$~ 
~$[using %%#%% software platform %%#%% %%cmp_ta%% ad hoc solutions %%#%% %%#%% %%#%% robust ]^[ sustain%%dsh%% 
able %%#%% %%#%% support %%#%% features %%#%% %%#%% %%#%% smart city environment%%per%%]$~ ~$[in %%#%% paper%%lst%% 
%%#%% surveyed %%#%% current research %%#%% smart cities platforms%%lst%% aiming %%#%% discover theirs 
%%#%% relevant requirements ]^[ %%#%% %%#%% facilitate %%#%% development%%lst%% integration%%lst%% ]^[ 
deployment %%#%% smart city applications%%per%%]$~ ~$[we analyzed 23 studies %%#%% %%#%% groups%%lst%% 
proposing multiple approaches ]f[ %%#%% development %%#%% %%#%% software platform %%#%% answer 
%%#%% %%#%% research question %%#%% %%#%% %%#%% elements required ]f[ %%#%% development 
a:30 
santana%%lst%% e%%per%%]$~ ~$[f%%per%%]$~ ~$[z%%per%% et al%%per%% 
%%#%% %%#%% highly%%dsh%%effective software platform ]f[ enabling %%#%% easy construction %%#%% highly%%dsh%% 
scalable%%lst%% integrated smart city applications%%qsn%%]$~ 
~$[based %%#%% %%#%% analyzed projects%%lst%% %%#%% derived %%#%% uni ed reference architecture sup%%dsh%% 
porting %%#%% main requirements %%#%% %%#%% build %%#%% software platform ]f[ smart cities%%per%%]$~ 
~$[thus%%lst%% %%#%% paper contributes %%#%% %%#%% state%%dsh%%of%%dsh%%the%%dsh%%art %%#%% providing %%#%% guide %%#%% help soft%%dsh%% 
ware developers ]^[ city managers determine %%#%% necessary components %%#%% handle %%#%% 
functional ]^[ non%%dsh%%functional requirements %%#%% %%#%% software platform ]f[ smart cities%%per%%]$~ 
~$[the reference architecture %%#%% based %%#%% %%#%% answers %%#%% %%#%% %%#%% research sub%%dsh%% 
questions%%per%%]$~ ~$[rq1 %%#%% %%#%% %%#%% %%#%% enabling technologies %%#%% %%#%% state%%dsh%%of%%dsh%%the%%dsh%%art software 
platforms ]f[ smart cities? %%#%% %%#%% %%#%% %%#%% %%#%% internet %%#%% things%%lst%% cloud computing%%lst%% 
%%#%% data%%lst%% ]^[ cyber%%dsh%%physical systems %%#%% %%#%% %%#%% cited enabling technologies%%per%%]$~ ~$[an%%dsh%% 
swering rq2 %%#%% %%#%% %%#%% %%#%% requirements %%#%% %%#%% software platform ]f[ smart cities 
%%#%% meet? )%%lst%% %%#%% %%#%% relate %%#%% technologies %%#%% %%#%% requirements %%#%% %%#%% soft%%dsh%% 
ware platform %%#%% handle%%per%%]$~ ~$[for example%%lst%% %%#%% %%#%% %%#%% %%#%% data platforms mention 
data management %%#%% %%#%% requirement%%lst%% %%#%% con gurability %%#%% strongly related %%#%% cps 
platforms%%per%%]$~ ~$[in %%#%% way%%lst%% %%#%% %%#%% contribution %%#%% %%#%% survey %%#%% %%#%% discuss %%#%% re%%dsh%% 
quirements %%#%% %%#%% %%#%% %%#%% implemented %%#%% using %%#%% speci %%#%% enabling technology%%per%%]$~ 
~$[in contrast%%lst%% %%#%% helps %%#%% decide %%#%% technology %%#%% %%#%% %%#%% %%#%% speci %%#%% functional ]v[ 
non%%dsh%%functional requirement %%#%% desirable%%per%%]$~ 
~$[finally%%lst%% %%#%% answer rq3 %%#%% %%#%% %%#%% %%#%% main challenges ]^[ %%#%% research problems 
%%#%% %%#%% development %%#%% %%#%% generation%%lst%% robust software platforms ]f[ smart cities? )%%lst%% 
%%#%% %%#%% %%#%% %%#%% cited challenges ]^[ %%#%% research problems%%lst%% according %%#%% %%#%% 
literature%%per%%]$~ ~$[these challenges %%#%% considered %%#%% deriving %%#%% reference architecture%%per%%]$~ 
~$[in %%#%% sense%%lst%% %%#%% %%#%% contribution %%#%% %%#%% survey%%lst%% especially ]f[ developers ]^[ 
researchers %%#%% software platforms%%lst%% %%#%% %%#%% identify %%#%% platform components %%#%% %%#%% 
%%#%% focus %%#%% future work%%per%%]$~ 
~$[this survey described %%#%% smart city initiatives%%lst%% ]b[ %%#%% %%#%% %%#%% %%#%% %%#%% %%#%% 
%%#%% initial phases%%lst%% posing multiple challenges ]^[ %%#%% problems %%#%% %%#%% %%#%% %%#%% 
addressed%%per%%]$~ ~$[a collaborative effort %%#%% research groups%%lst%% commercial companies%%lst%% ngos%%lst%% 
]^[ governments %%#%% required %%#%% tackle %%#%% multitude %%#%% scienti c%%lst%% technical%%lst%% political%%lst%% 
]^[ social problems related %%#%% %%#%% establishment %%#%% really%%dsh%%smart cities%%lst%% reaching %%#%% 
ultimate goal %%#%% improving %%#%% quality %%#%% life %%#%% %%#%% %%#%% %%#%% city %%#%% citizens%%lst%% irrespective %%#%% %%#%% 
social ]^[ nancial situation%%per%%]$~ 
~$[acknowledgments 
%%#%% publication %%#%% %%#%% result %%#%% %%#%% project promoted %%#%% %%#%% brazilian informatics law (law no%%per%% 8248 %%#%% 
1991 ]^[ subsequent updates) ]^[ %%#%% developed %%#%% %%#%% cooperation agreement 073/2016 %%#%% 
universidade de %%#%% ao paulo%%lst%% fdte%%lst%% ]^[ hewlett packard enterprise brazil%%per%%]$~ 
~$[references 
mohammad aazam%%lst%% imran khan%%lst%% aymen abdullah alsaffar%%lst%% ]^[ eui%%dsh%%nam huh%%per%% 2014%%per%%]$~ ~$[cloud %%#%% things%%cln%% 
integrating internet %%#%% %%#%% ]^[ cloud computing ]^[ %%#%% issues involved%%per%%]$~ ~$[in applied sciences ]^[ 
technology (ibcast)%%lst%% 2014 11th international bhurban conference on%%per%%]$~ ~$[ieee%%lst%% 414 419%%per%%]$~ 
~$[eiman al nuaimi%%lst%% hind al neyadi%%lst%% nader mohamed%%lst%% ]^[ jameela al%%dsh%%jaroodi%%per%% 2015%%per%%]$~ ~$[applications 
%%#%% %%#%% data %%#%% smart cities%%per%%]$~ ~$[journal %%#%% internet services ]^[ applications 6%%lst%% 1 (2015)%%lst%% 25%%per%%]$~ 
~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1186/s13174%%dsh%%015%%dsh%%0041%%dsh%%5 
theodoros anagnostopoulos%%lst%% kostas kolomvatsos%%lst%% christos anagnostopoulos%%lst%% arkady zaslavsky%%lst%% 
]f[ %%#%% priority waste 
%%#%% systems ]^[ software 110 (2015)%%lst%% 178 192%%per%% 
]^[ stathes hadjiefthymiades%%per%% 2015%%per%%]$~ ~$[assessing dynamic models 
collection %%#%% smart 
doi:http://dx%%per%%doi%%per%%org/10%%per%%1016/j%%per%%jss%%per%%2015%%per%%08%%per%%049 
cities%%per%%]$~ ~$[journal 
giuseppe anastasi%%lst%% maximiliano antonelli%%lst%% alessio bechini%%lst%% simone brienza%%lst%% eleonora %%#%% andrea%%lst%% domenico 
de guglielmo%%lst%% pietro ducange%%lst%% beatrice lazzerini%%lst%% francesco marcelloni%%lst%% ]^[ armando segatori%%per%% 2013%%per%%]$~ 
~$[software platforms ]f[ smart cities 
a:31 
urban ]^[ social sensing ]f[ sustainable mobility %%#%% smart cities%%per%%]$~ ~$[in sustainable internet ]^[ ict ]f[ 
sustainability (sustainit)%%lst%% 2013%%per%%]$~ ~$[ieee%%lst%% 1 4%%per%%]$~ 
~$[wolfgang apolinarski%%lst%% umer 
dleware ]^[ sdk ]f[ smart 
tions workshops 
doi:http://dx%%per%%doi%%per%%org/10%%per%%1109/percomw%%per%%2014%%per%%6815176 
iqbal%%lst%% ]^[ josiane xavier parreira%%per%% 2014%%per%%]$~ ~$[the gambas mid%%dsh%% 
%%#%% pervasive computing ]^[ communica%%dsh%% 
(percom workshops)%%lst%% 2014 ieee international conference on%%per%% 117 122%%per%% 
city applications%%per%%]$~ 
~$[michael armbrust%%lst%% armando fox%%lst%% rean grif th%%lst%% anthony %%#%% joseph%%lst%% randy katz%%lst%% andy konwinski%%lst%% gunho 
lee%%lst%% david patterson%%lst%% ariel rabkin%%lst%% ion stoica%%lst%% ]^[ others%%per%% 2010%%per%%]$~ ~$[a view %%#%% cloud computing%%per%%]$~ ~$[commun%%per%%]$~ 
~$[acm 53%%lst%% 4 (2010)%%lst%% 50 58%%per%%]$~ 
~$[eleana asimakopoulou ]^[ nik bessis%%per%% 2011%%per%%]$~ ~$[buildings ]^[ crowds%%cln%% forming smart cities ]f[ %%#%% effec%%dsh%% 
tive disaster management%%per%%]$~ ~$[in innovative mobile ]^[ internet services %%#%% ubiquitous computing (imis)%%lst%% 
2011 fifth international conference on%%per%% 229 234%%per%%]$~ ~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1109/imis%%per%%2011%%per%%129 
luigi atzori%%lst%% antonio iera%%lst%% ]^[ giacomo morabito%%per%% 2010%%per%%]$~ ~$[the internet %%#%% things%%cln%% %%#%% survey%%per%%]$~ ~$[computer net%%dsh%% 
%%#%% 54%%lst%% 15 (2010)%%lst%% 2787 2805%%per%%]$~ ~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1016/j%%per%%comnet%%per%%2010%%per%%05%%per%%010 
malcolm bain%%per%% 2014%%per%%]$~ ~$[sentilo %%dsh%% sensor ]^[ actuator platform ]f[ smart cities%%per%% 
(march 2014)%%per%% 
%%#%% https://joinup%%per%%ec%%per%%europa%%per%%eu/community/eupl/document/ 
20%%lst%% 
retrieved 
sentilo%%dsh%%sensor%%dsh%%and%%dsh%%actuator%%dsh%%platform%%dsh%%smart%%dsh%%cities 
february 
2015 
chitra balakrishna%%per%% 2012%%per%%]$~ ~$[enabling technologies ]f[ smart city services ]^[ applications%%per%%]$~ ~$[in %%#%% generation 
mobile applications%%lst%% services ]^[ technologies (ngmast)%%lst%% 2012 6th international conference on%%per%%]$~ ~$[ieee%%lst%% 
223 227%%per%%]$~ 
~$[pieter ballon%%lst%% julia glidden%%lst%% pavlos kranas%%lst%% andreas menychtas%%lst%% susie ruston%%lst%% ]^[ shenja van der graaf%%per%% 
2011%%per%%]$~ ~$[is %%#%% %%#%% %%#%% ]f[ %%#%% cloud platform ]f[ european smart cities?%%per%%]$~ ~$[in echallenges e%%dsh%%2011 conference 
proceedings%%lst%% iimc international information management corporation%%per%%]$~ 
~$[carolina tripp barba%%lst%% miguel angel mateos%%lst%% pablo reganas soto%%lst%% ahmad mohamad mezher%%lst%% ]^[ %%#%% aguilar 
igartua%%per%% 2012%%per%%]$~ ~$[smart city ]f[ vanets using warning messages%%lst%% traf %%#%% statistics ]^[ intelligent traf %%#%% 
lights%%per%%]$~ ~$[in intelligent vehicles symposium (iv)%%lst%% 2012 ieee%%per%%]$~ ~$[ieee%%lst%% 902 907%%per%%]$~ 
~$[alessio botta%%lst%% walter de donato%%lst%% valerio persico%%lst%% ]^[ antonio pescap e%%per%% 2015%%per%%]$~ ~$[integration %%#%% cloud computing 
]^[ internet %%#%% things%%cln%% %%#%% survey%%per%%]$~ ~$[future generation computer systems (2015)%%per%%]$~ 
~$[nicola bressan%%lst%% leonardo bazzaco%%lst%% nicola bui%%lst%% paolo casari%%lst%% lorenzo vangelista%%lst%% ]^[ michele zorzi%%per%% 2010%%per%%]$~ 
~$[the deployment %%#%% %%#%% smart monitoring system using wireless sensor ]^[ actuator networks%%per%%]$~ ~$[in 
smart grid communications (smartgridcomm)%%lst%% 2010 %%#%% ieee international conference on%%per%% 49 54%%per%%]$~ 
~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1109/smartgrid%%per%%2010%%per%%5622015 
nicola bui ]^[ michele zorzi%%per%% 2011%%per%%]$~ ~$[health care applications%%cln%% %%#%% solution based %%#%% %%#%% internet %%#%% things%%per%%]$~ ~$[in 
proceedings %%#%% %%#%% 4th international symposium %%#%% applied sciences %%#%% biomedical ]^[ communication 
technologies%%per%%]$~ ~$[acm%%lst%% 131%%per%%]$~ 
~$[jean%%dsh%%paul calbimonte%%lst%% %%#%% ane sarni%%lst%% julien eberle%%lst%% ]^[ karl aberer%%per%% 2014%%per%%]$~ ~$[xgsn%%cln%% %%#%% open%%dsh%%source se%%dsh%% 
mantic sensing middleware ]f[ %%#%% web %%#%% things%%per%%]$~ ~$[in 7th international workshop %%#%% semantic sensor 
networks%%per%%]$~ 
~$[andrea caragliu%%lst%% chiara del bo%%lst%% ]^[ peter nijkamp%%per%% 2011%%per%%]$~ ~$[smart cities %%#%% europe%%per%%]$~ ~$[journal %%#%% urban tech%%dsh%% 
nology 18%%lst%% 2 (2011)%%lst%% 65 82%%per%%]$~ 
~$[min chen%%lst%% shiwen mao%%lst%% ]^[ yunhao liu%%per%% 2014%%per%%]$~ ~$[big data%%cln%% %%#%% survey%%per%%]$~ ~$[mobile networks ]^[ applications 19%%lst%% 2 
(2014)%%lst%% 171 209%%per%%]$~ 
~$[bin cheng%%lst%% salvatore longo%%lst%% flavio cirillo%%lst%% martin bauer%%lst%% ]^[ ernoe kovacs%%per%% 2015%%per%%]$~ ~$[building %%#%% %%#%% data plat%%dsh%% 
form ]f[ smart cities%%cln%% experience ]^[ lessons %%#%% santander%%per%%]$~ ~$[in %%#%% data (bigdata congress)%%lst%% 2015 
ieee international congress on%%per%% 592 599%%per%%]$~ ~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1109/bigdatacongress%%per%%2015%%per%%91 
annalisa cocchia%%per%% 2014%%per%%]$~ ~$[smart ]^[ digital city%%cln%% %%#%% systematic literature review%%per%%]$~ ~$[in smart city%%lst%% re%%dsh%% 
nata paola dameri ]^[ camille rosenthal%%dsh%%sabroux (eds%%per%%)%%per%%]$~ ~$[springer international publishing%%lst%% 13 43%%per%%]$~ 
~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1007/978%%dsh%%3%%dsh%%319%%dsh%%06160%%dsh%%3 2 
louise coetzee ]^[ johan eksteen%%per%% 2011%%per%%]$~ ~$[the internet %%#%% %%#%% promise ]f[ %%#%% future%%qsn%%]$~ ~$[an introduction%%per%%]$~ 
~$[in ist%%dsh%%africa conference proceedings%%lst%% 2011%%per%% 1 9%%per%%]$~ 
~$[welington m%%per%% da silva%%lst%% alexandre alvaro%%lst%% gustavo h%%per%%]$~ ~$[r%%per%%]$~ ~$[p%%per%%]$~ ~$[tomas%%lst%% ricardo a%%per%%]$~ ~$[afonso%%lst%% kelvin l%%per%%]$~ ~$[dias%%lst%% ]^[ 
vinicius c%%per%%]$~ ~$[garcia%%per%% 2013%%per%%]$~ ~$[smart cities software architectures%%cln%% %%#%% survey%%per%%]$~ ~$[in proceedings %%#%% %%#%% 28th an%%dsh%% 
nual acm symposium %%#%% applied computing%%per%%]$~ ~$[acm%%lst%% 1722 1727%%per%%]$~ 
~$[yuri demchenko%%lst%% cees de laat%%lst%% ]^[ peter membrey%%per%% 2014%%per%%]$~ ~$[de ning architecture components %%#%% %%#%% %%#%% data 
ecosystem%%per%%]$~ ~$[in collaboration technologies ]^[ systems (cts)%%lst%% 2014 international conference on%%per%%]$~ ~$[ieee%%lst%% 
104 112%%per%%]$~ 
~$[salvatore distefano%%lst%% giovanni merlino%%lst%% ]^[ antonio pulia to%%per%% 2012%%per%%]$~ ~$[enabling %%#%% cloud %%#%% things%%per%%]$~ ~$[in innova%%dsh%% 
tive mobile ]^[ internet services %%#%% ubiquitous computing (imis)%%lst%% 2012 sixth international conference 
on%%per%%]$~ ~$[ieee%%lst%% 858 863%%per%%]$~ 
~$[a:32 
santana%%lst%% e%%per%%]$~ ~$[f%%per%%]$~ ~$[z%%per%% et al%%per%%]$~ 
~$[sou ene djahel%%lst%% ronan doolan%%lst%% gabriel%%dsh%%miro muntean%%lst%% ]^[ john murphy%%per%% 2014%%per%%]$~ ~$[a communications%%dsh%% 
]f[ smart cities%%cln%% challenges ]^[ 
1 1%%per%% 
oriented perspective 
innovative approaches%%per%%]$~ ~$[communications surveys tutorials%%lst%% 
doi:http://dx%%per%%doi%%per%%org/10%%per%%1109/comst%%per%%2014%%per%%2339817 
%%#%% traf %%#%% management systems 
ieee pp%%lst%% 
99 
(2014)%%lst%% 
a%%per%%]$~ ~$[elmangoush%%lst%% h%%per%%]$~ ~$[coskun%%lst%% s%%per%%]$~ ~$[wahle%%lst%% ]^[ t%%per%%]$~ ~$[magedanz%%per%% 2013%%per%%]$~ ~$[design aspects ]f[ %%#%% reference m2m communi%%dsh%% 
cation platform ]f[ smart cities%%per%%]$~ ~$[in innovations %%#%% information technology (iit)%%lst%% 2013 9th international 
conference on%%per%% 204 209%%per%%]$~ ~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1109/innovations%%per%%2013%%per%%6544419 
stefan foell%%lst%% gerd kortuem%%lst%% reza rawassizadeh%%lst%% marcus handte%%lst%% umer iqbal%%lst%% ]^[ pedro marr on%%per%% 2014%%per%%]$~ 
~$[micro%%dsh%%navigation ]f[ urban bus passengers%%cln%% using %%#%% internet %%#%% %%#%% %%#%% improve %%#%% public trans%%dsh%% 
port experience%%per%%]$~ ~$[in proceedings %%#%% %%#%% %%#%% international conference %%#%% iot %%#%% urban space (urb%%dsh%%iot 
14)%%per%%]$~ ~$[icst (institute ]f[ computer sciences%%lst%% social%%dsh%%informatics ]^[ telecommunications engineering)%%lst%% 
icst%%lst%% brussels%%lst%% belgium%%lst%% belgium%%lst%% 1 6%%per%%]$~ ~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%4108/icst%%per%%urb%%dsh%%iot%%per%%2014%%per%%257373 
mz fortes%%lst%% vh ferreira%%lst%% gg sotelo%%lst%% %%#%% cabral%%lst%% wf correia%%lst%% ]^[ olc pacheco%%per%% 2014%%per%%]$~ ~$[deployment %%#%% smart 
metering %%#%% %%#%% %%#%% uzios city%%per%%]$~ ~$[in transmission & distribution conference ]^[ exposition%%dsh%%latin america 
(pes t&d%%dsh%%la)%%lst%% 2014 ieee pes%%per%%]$~ ~$[ieee%%lst%% 1 6%%per%%]$~ 
~$[jose antonio galache%%lst%% takuro yonezawa%%lst%% levent gurgen%%lst%% daniele pavia%%lst%% marco grella%%lst%% ]^[ hiroyuki 
maeomichi%%per%% 2014%%per%%]$~ ~$[clout%%cln%% leveraging cloud computing techniques ]f[ improving management %%#%% mas%%dsh%% 
sive iot data%%per%%]$~ ~$[in service%%dsh%%oriented computing ]^[ applications (soca)%%lst%% 2014 ieee 7th international 
conference on%%per%% 324 327%%per%%]$~ ~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1109/soca%%per%%2014%%per%%47 
rudolf gif nger%%lst%% christian fertner%%lst%% hans kramar%%lst%% robert kalasek%%lst%% nata sa pichler%%dsh%%milanovic%%lst%% ]^[ evert 
meijers%%per%% 2007%%per%%]$~ ~$[smart cities%%dsh%%ranking %%#%% european medium%%dsh%%sized cities%%per%%]$~ ~$[technical report%%per%%]$~ ~$[vienna univer%%dsh%% 
sity %%#%% technology%%per%%]$~ 
~$[sylva girtelschmid%%lst%% matthias steinbauer%%lst%% vikash kumar%%lst%% anna fensel%%lst%% ]^[ gabriele kotsis%%per%% 2013%%per%%]$~ ~$[big data 
%%#%% large scale intelligent smart city installations%%per%%]$~ ~$[in proceedings %%#%% international conference %%#%% infor%%dsh%% 
mation integration ]^[ web%%dsh%%based applications &#38%%scn%% services (iiwas 13)%%per%%]$~ ~$[acm%%lst%% %%#%% york%%lst%% ny%%lst%% usa%%lst%% 
article 428%%lst%% 5 pages%%per%%]$~ ~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1145/2539150%%per%%2539224 
jayavardhana gubbi%%lst%% rajkumar buyya%%lst%% slaven marusic%%lst%% ]^[ marimuthu palaniswami%%per%% 2013%%per%%]$~ ~$[internet %%#%% 
%%#%% (iot)%%cln%% %%#%% vision%%lst%% architectural elements%%lst%% ]^[ future directions%%per%%]$~ ~$[future generation computer sys%%dsh%% 
tems 29%%lst%% 7 (2013)%%lst%% 1645 1660%%per%%]$~ 
~$[levent gurgen%%lst%% ozan gunalp%%lst%% yazid benazzouz%%lst%% ]^[ mathieu gallissot%%per%% 2013%%per%%]$~ ~$[self%%dsh%%aware cyber%%dsh%%physical 
systems ]^[ applications %%#%% smart buildings ]^[ cities%%per%%]$~ ~$[in design%%lst%% automation test %%#%% europe conference 
exhibition (date)%%lst%% 2013%%per%% 1149 1154%%per%%]$~ ~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%7873/date%%per%%2013%%per%%240 
robert e%%per%%]$~ ~$[hall%%lst%% %%#%% bowerman%%lst%% %%#%% braverman%%lst%% %%#%% taylor%%lst%% %%#%% todosow%%lst%% ]^[ %%#%% von wimmersperg%%per%% 2000%%per%%]$~ ~$[the vision 
%%#%% %%#%% smart city%%per%%]$~ ~$[in 2nd international life extension technology workshop%%lst%% paris%%per%%]$~ 
~$[gerhard p%%per%%]$~ ~$[hancke%%lst%% gerhard p%%per%%]$~ ~$[hancke jr%%per%%%%lst%% ]^[ others%%per%% 2012%%per%%]$~ ~$[the role %%#%% advanced sensing %%#%% smart cities%%per%%]$~ 
~$[sensors 13%%lst%% 1 (2012)%%lst%% 393 425%%per%%]$~ 
~$[marcus handte%%lst%% muhammad umer iqbal%%lst%% stephan wagner%%lst%% wolfgang apolinarski%%lst%% pedro jos %%#%% marr on%%lst%% eva 
maria mu noz navarro%%lst%% santiago martinez%%lst%% sara izquierdo barthelemy%%lst%% ]^[ mario gonz alez fern andez%%per%% 
2014%%per%%]$~ ~$[crowd density estimation ]f[ public transport vehicles%%per%%%%per%%]$~ ~$[in edbt/icdt workshops%%per%% 315 322%%per%%]$~ 
~$[mohammad mehedi hassan%%lst%% hanouf saad albakr%%lst%% ]^[ hmood al%%dsh%%dossari%%per%% 2014%%per%%]$~ ~$[a cloud%%dsh%%assisted internet 
%%#%% %%#%% framework ]f[ pervasive healthcare %%#%% smart city environment%%per%%]$~ ~$[in proceedings %%#%% %%#%% 1st 
international workshop %%#%% emerging multimedia applications ]^[ services ]f[ smart cities (emasc 
14)%%per%%]$~ ~$[acm%%lst%% %%#%% york%%lst%% ny%%lst%% usa%%lst%% 9 13%%per%%]$~ ~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1145/2661704%%per%%2661707 
jos m%%per%%]$~ ~$[hernndez%%dsh%%mu noz%%lst%% jess bernat vercher%%lst%% luis mu noz%%lst%% jos a%%per%%]$~ ~$[galache%%lst%% mirko presser%%lst%% luis a%%per%%]$~ ~$[hern%%dsh%% 
ndez gmez%%lst%% ]^[ jan pettersson%%per%% 2011%%per%%]$~ ~$[smart cities %%#%% %%#%% forefront %%#%% %%#%% future internet%%per%%]$~ ~$[vol%%per%% 6656%%per%% 
447 462%%per%%]$~ ~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1007/978%%dsh%%3%%dsh%%642%%dsh%%20898%%dsh%%0 32 
robert g%%per%%]$~ ~$[hollands%%per%% 2008%%per%%]$~ ~$[will %%#%% real smart city please stand up%%qsn%%]$~ ~$[intelligent%%lst%% progressive ]v[ en%%dsh%% 
trepreneurial%%qsn%%]$~ ~$[city 12%%lst%% 3 (2008)%%lst%% 303 320%%per%%]$~ 
~$[aamir hussain%%lst%% rao wenbi%%lst%% aristides lopes da silva%%lst%% muhammad nadher%%lst%% ]^[ muhammad mudhish%%per%% 2015%%per%%]$~ 
~$[health ]^[ emergency%%dsh%%care platform ]f[ %%#%% elderly ]^[ disabled people %%#%% %%#%% smart city%%per%%]$~ ~$[journal %%#%% 
systems ]^[ software 110 (2015)%%lst%% 253 263%%per%%]$~ ~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1016/j%%per%%jss%%per%%2015%%per%%08%%per%%041 
valrie issarny%%lst%% nikolaos georgantas%%lst%% sara hachem%%lst%% apostolos zarras%%lst%% panos vassiliadist%%lst%% marco autili%%lst%% 
marco aurlio gerosa%%lst%% ]^[ amiraben hamida%%per%% 2011%%per%%]$~ ~$[service%%dsh%%oriented middleware ]f[ %%#%% future inter%%dsh%% 
net%%cln%% state %%#%% %%#%% art ]^[ research directions%%per%%]$~ ~$[journal %%#%% internet services ]^[ applications 2%%lst%% 1 (2011)%%lst%% 
23 45%%per%%]$~ ~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1007/s13174%%dsh%%011%%dsh%%0021%%dsh%%3 
isam janajreh%%lst%% liu su%%lst%% ]^[ fathi alan%%per%% 2013%%per%%]$~ ~$[wind energy assessment%%cln%% masdar city %%#%% study%%per%%]$~ ~$[renewable 
energy 52 (2013)%%lst%% 8 15%%per%%]$~ 
~$[software platforms ]f[ smart cities 
a:33 
rosabeth moss kanter ]^[ stanley s%%per%%]$~ ~$[litow%%per%% 2009%%per%%]$~ ~$[informed ]^[ interconnected%%cln%% %%#%% manifesto ]f[ smarter 
cities%%per%% (march 2009)%%per%%]$~ ~$[retrieved february 20%%lst%% 2015 %%#%% http://papers%%per%%ssrn%%per%%com/sol3/papers%%per%%cfm?abstract 
id=1420236 
zaheer khan%%lst%% ashiq anjum%%lst%% ]^[ saad liaquat kiani%%per%% 2013%%per%%]$~ ~$[cloud based %%#%% data analytics ]f[ smart 
future cities%%per%%]$~ ~$[in utility ]^[ cloud computing (ucc)%%lst%% 2013 ieee/acm 6th international conference 
on%%per%% 381 386%%per%%]$~ ~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1109/ucc%%per%%2013%%per%%77 
zaheer khan%%lst%% ashiq anjum%%lst%% kamran soomro%%lst%% ]^[ muhammad atif tahir%%per%% 2015%%per%%]$~ ~$[towards cloud 
based %%#%% data analytics ]f[ smart future cities%%per%%]$~ ~$[journal %%#%% cloud computing 4%%lst%% 1 (2015)%%lst%% 1 11%%per%%]$~ 
~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1186/s13677%%dsh%%015%%dsh%%0026%%dsh%%8 
jaeho kim ]^[ jang%%dsh%%won lee%%per%% 2014%%per%%]$~ ~$[openiot%%cln%% %%#%% %%#%% service framework ]f[ %%#%% internet %%#%% things%%per%%]$~ ~$[in 
internet %%#%% %%#%% (wf%%dsh%%iot)%%lst%% 2014 ieee world forum on%%per%%]$~ ~$[ieee%%lst%% 89 93%%per%%]$~ 
~$[danh le%%dsh%%phuoc%%lst%% hoan quoc nguyen%%dsh%%mau%%lst%% josiane xavier parreira%%lst%% ]^[ manfred hauswirth%%per%% 2012%%per%%]$~ ~$[a mid%%dsh%% 
dleware framework ]f[ scalable management %%#%% linked streams%%per%%]$~ ~$[web semantics%%cln%% science%%lst%% services ]^[ 
agents %%#%% %%#%% world wide web 16 (2012)%%lst%% 42 51%%per%%]$~ 
~$[yong woo lee ]^[ seungwoo rho%%per%% 2010%%per%%]$~ ~$[u%%dsh%%city portal ]f[ smart ubiquitous middleware%%per%%]$~ ~$[in advanced com%%dsh%% 
munication technology (icact)%%lst%% 2010 %%#%% 12th international conference on%%lst%% vol%%per%% 1%%per%% 609 613%%per%%]$~ 
~$[pu liu ]^[ zhenghong peng%%per%% 2013%%per%%]$~ ~$[smart cities %%#%% china%%per%%]$~ ~$[ieee computer society 16 (2013)%%per%%]$~ 
~$[catriona manville%%lst%% gavin cochrane%%lst%% jona%%cmp_ta%% cave%%lst%% jeremy millard%%lst%% jeremy kevin pederson%%lst%% rasmus %%#%% %%#%% 
thaarup%%lst%% andrea liebe%%lst%% matthias wissner%%lst%% roel massink%%lst%% ]^[ bas kotterink%%per%% 2014%%per%%]$~ ~$[mapping smart 
cities %%#%% %%#%% eu%%per%% (2014)%%per%%]$~ 
~$[viktor mayer%%dsh%%sch onberger ]^[ kenneth cukier%%per%% 2013%%per%%]$~ ~$[big data%%cln%% %%#%% revolution %%#%% %%#%% transform %%#%% %%#%% 
live%%lst%% work%%lst%% ]^[ think%%per%%]$~ ~$[houghton mif %%#%% harcourt%%per%%]$~ 
~$[nathalie mitton%%lst%% symeon papavassiliou%%lst%% antonio pulia to%%lst%% ]^[ kishors trivedi%%per%% 2012%%per%%]$~ ~$[combining cloud ]^[ 
sensors %%#%% %%#%% smart city environment%%per%%]$~ ~$[eurasip journal %%#%% wireless communications ]^[ networking 
2012%%lst%% 1 (2012)%%per%%]$~ ~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1186/1687%%dsh%%1499%%dsh%%2012%%dsh%%247 
g%%per%%]$~ ~$[mylonas%%lst%% e%%per%%]$~ ~$[theodoridis%%lst%% ]^[ l%%per%%]$~ ~$[munoz%%per%% 2015%%per%%]$~ ~$[integrating smartphones %%#%% %%#%% smartsantander infras%%dsh%% 
tructure%%per%%]$~ ~$[internet computing%%lst%% ieee 19%%lst%% 2 (mar 2015)%%lst%% 48 56%%per%%]$~ ~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1109/mic%%per%%2015%%per%%25 
milind naphade%%lst%% guruduth banavar%%lst%% colin harrison%%lst%% jurij paraszczak%%lst%% ]^[ robert morris%%per%% 
2011%%per%%]$~ ~$[smarter cities ]^[ %%#%% innovation challenges%%per%%]$~ ~$[computer 44%%lst%% 6 (june 2011)%%lst%% 32 39%%per%%]$~ 
~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1109/mc%%per%%2011%%per%%187 
rocco papa%%lst%% carmela gargiulo%%lst%% ]^[ adriana galderisi%%per%% 2013%%per%%]$~ ~$[towards %%#%% urban planners perspective %%#%% 
smart city%%per%%]$~ ~$[tema journal %%#%% land use%%lst%% mobility ]^[ environment 6%%lst%% 01 (2013)%%lst%% 5 17%%per%%]$~ 
~$[anbu parkavi ]^[ nagarajan vetrivelan%%per%% 2013%%per%%]$~ ~$[a smart citizen information system using hadoop%%cln%% %%#%% %%#%% 
study%%per%%]$~ ~$[in computational intelligence ]^[ computing research (iccic)%%lst%% 2013 ieee international con%%dsh%% 
ference on%%per%% 1 3%%per%%]$~ ~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1109/iccic%%per%%2013%%per%%6724276 
charith perera%%lst%% arkady b%%per%%]$~ ~$[zaslavsky%%lst%% peter christen%%lst%% ]^[ dimitrios georgakopoulos%%per%% 2014%%per%%]$~ ~$[sensing %%#%% %%#%% 
service model ]f[ smart cities supported %%#%% internet %%#%% things%%per%%]$~ ~$[trans%%per%%]$~ ~$[emerging telecommunications 
technologies 25%%lst%% 1 (2014)%%lst%% 81 93%%per%%]$~ ~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1002/ett%%per%%2704 
daniel %%#%% erez%%dsh%%gonz alez ]^[ raimundo %%#%% az%%dsh%%d az%%per%% 2015%%per%%]$~ ~$[public services provided %%#%% ict %%#%% %%#%% smart city 
environment%%cln%% %%#%% %%#%% %%#%% spanish cities%%per%%]$~ ~$[journal %%#%% universal computer science 21%%lst%% 2 (2015)%%lst%% 248 267%%per%%]$~ 
~$[riccardo petrolo%%lst%% valeria loscri%%lst%% ]^[ nathalie mitton%%per%% 2014%%per%%]$~ ~$[towards %%#%% cloud %%#%% %%#%% smart city%%per%%]$~ ~$[ieee 
comsoc mmtc e%%dsh%%letter 9%%lst%% 5 (sept%%per%% 2014)%%lst%% 44 48%%per%% https://hal%%per%%inria%%per%%fr/hal%%dsh%%01080273 
giuseppe piro%%lst%% ilaria cianci%%lst%% luigi a%%per%%]$~ ~$[grieco%%lst%% gennaro boggia%%lst%% ]^[ pietro camarda%%per%% 2014%%per%%]$~ ~$[informa%%dsh%% 
tion centric services %%#%% smart cities%%per%%]$~ ~$[journal %%#%% systems ]^[ software 88%%lst%% 0 (2014)%%lst%% 169 188%%per%%]$~ 
~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1016/j%%per%%jss%%per%%2013%%per%%10%%per%%029 
gilles privat%%lst%% mengxuan zhao%%lst%% ]^[ laurent lemke%%per%% 2014%%per%%]$~ ~$[towards %%#%% shared software infrastructure ]f[ 
smart homes%%lst%% smart buildings ]^[ smart cities%%per%%]$~ ~$[in international workshop %%#%% emerging trends %%#%% 
%%#%% engineering %%#%% cyber%%dsh%%physical systems%%lst%% berlin%%per%%]$~ 
~$[junping qiu%%lst%% yanhui song%%lst%% ]^[ siluo yang%%per%% 2010%%per%%]$~ ~$[digital integrated model %%#%% government resources %%#%% 
e%%dsh%%government environment%%per%%]$~ ~$[in internet technology ]^[ applications%%lst%% 2010 international conference 
on%%per%% 1 4%%per%%]$~ ~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1109/itapp%%per%%2010%%per%%5566315 
aviva rutkin%%per%% 2014%%per%%]$~ ~$[how data %%#%% save %%#%% city%%per%%]$~ ~$[new scientist 224%%lst%% 2990 (2014)%%lst%% 24 25%%per%%]$~ 
~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1016/s0262%%dsh%%4079(14)61945%%dsh%%x 
luis sanchez%%lst%% luis muoz%%lst%% jose antonio galache%%lst%% pablo sotres%%lst%% juan r%%per%%]$~ ~$[santana%%lst%% veronica gutierrez%%lst%% ra%%dsh%% 
jiv ramdhany%%lst%% alex gluhak%%lst%% srdjan krco%%lst%% evangelos theodoridis%%lst%% ]^[ dennis %%#%% sterer%%per%% 2014%%per%%]$~ ~$[smart%%dsh%% 
santander%%cln%% iot experimentation %%#%% %%#%% smart city testbed%%per%%]$~ ~$[computer networks 61 (2014)%%lst%% 217 238%%per%%]$~ 
~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1016/j%%per%%bjp%%per%%2013%%per%%12%%per%%020 special issue %%#%% future internet testbeds %%#%% i%%per%%]$~ 
~$[a:34 
santana%%lst%% e%%per%%]$~ ~$[f%%per%%]$~ ~$[z%%per%% et al%%per%%]$~ 
~$[eduardo felipe zambom santana%%lst%% daniel mac edo bastista%%lst%% fabio kon%%lst%% ]^[ dejan %%#%% milojicic%%per%% 2016%%per%%]$~ ~$[scsimu%%dsh%% 
lator%%cln%% %%#%% %%#%% source%%lst%% scalable smart city simulator%%per%%]$~ ~$[in tools session %%#%% %%#%% 34th brazilian symposium 
%%#%% computer networks (sbrc) %%per%%]$~ ~$[salvador%%lst%% brazil%%per%%]$~ 
~$[a%%per%%]$~ ~$[sinaeepourfard%%lst%% j%%per%%]$~ ~$[garcia%%lst%% x%%per%%]$~ ~$[masip%%dsh%%bruin%%lst%% e%%per%%]$~ ~$[marn%%dsh%%tordera%%lst%% j%%per%%]$~ ~$[cirera%%lst%% g%%per%%]$~ ~$[grau%%lst%% ]^[ f%%per%%]$~ ~$[casaus%%per%% 2016%%per%%]$~ 
~$[estimating smart city sensors data generation%%per%%]$~ ~$[in 2016 mediterranean ad hoc networking workshop 
(med%%dsh%%hoc%%dsh%%net)%%per%% 1 8%%per%%]$~ ~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1109/medhocnet%%per%%2016%%per%%7528424 
kehua su%%lst%% jie li%%lst%% ]^[ hongbo fu%%per%% 2011%%per%%]$~ ~$[smart 
ics%%lst%% communications ]^[ control 
doi:http://dx%%per%%doi%%per%%org/10%%per%%1109/icecc%%per%%2011%%per%%6066743 
%%#%% electron%%dsh%% 
(icecc)%%lst%% 2011 international conference on%%per%% 1028 1031%%per%% 
city ]^[ %%#%% applications%%per%%]$~ 
~$[kohei takahashi%%lst%% shintaro yamamoto%%lst%% akihiro okushi%%lst%% shinsuke matsumoto%%lst%% ]^[ masahide nakamura%%per%% 
2012%%per%%]$~ ~$[design ]^[ implementation %%#%% service api ]f[ large%%dsh%%scale house log %%#%% smart city cloud%%per%%]$~ ~$[in cloud 
computing technology ]^[ science (cloudcom)%%lst%% 2012 ieee 4th international conference on%%per%% 815 820%%per%%]$~ 
~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1109/cloudcom%%per%%2012%%per%%6427590 
kenji tei ]^[ levent gurgen%%per%% 2014%%per%%]$~ ~$[clout%%cln%% cloud %%#%% %%#%% ]f[ empowering %%#%% citizen clout %%#%% smart cities%%per%%]$~ 
~$[in internet %%#%% %%#%% (wf%%dsh%%iot)%%lst%% 2014 ieee world forum on%%per%%]$~ ~$[ieee%%lst%% 369 370%%per%%]$~ 
~$[sean thornton%%per%% 2013%%per%%]$~ ~$[chicagos windygrid%%cln%% taking situational awareness 
%%#%% %%#%% %%#%% level%%per%% 
(march 2013)%%per%%]$~ ~$[retrieved february 20%%lst%% 2015 %%#%% http://datasmart%%per%%ash%%per%%harvard%%per%%edu/news/article/ 
chicagos%%dsh%%windygrid%%dsh%%taking%%dsh%%situational%%dsh%%awareness%%dsh%%to%%dsh%%a%%dsh%%new%%dsh%%level%%dsh%%259 
united nations%%per%% 2009%%per%%]$~ ~$[urban ]^[ rural areas 2009%%per%% (2009)%%per%% http://www%%per%%un%%per%%org/en/development/desa/ 
population/publications/urbanization/urban%%dsh%%rural%%per%%shtml 
a%%cmp_t%%a vakali%%lst%% leonidas anthopoulos%%lst%% ]^[ srdjan krco%%per%% 2014%%per%%]$~ ~$[smart cities data streams integration%%cln%% ex%%dsh%% 
perimenting %%#%% internet %%#%% %%#%% ]^[ social data flows%%per%%]$~ ~$[in proceedings %%#%% %%#%% 4th international 
conference %%#%% web intelligence%%lst%% mining ]^[ semantics (wims14) (wims 14)%%per%%]$~ ~$[acm%%lst%% %%#%% york%%lst%% ny%%lst%% 
usa%%lst%% article 60%%lst%% 5 pages%%per%%]$~ ~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1145/2611040%%per%%2611094 
ignasi vilajosana%%lst%% jordi llosa%%lst%% borja martinez%%lst%% marc domingo%%dsh%%prieto%%lst%% albert angles%%lst%% ]^[ xavier vilajosana%%per%% 
2013%%per%%]$~ ~$[bootstrapping smart cities %%#%% %%#%% self%%dsh%%sustainable model based %%#%% %%#%% data ows%%per%%]$~ ~$[communi%%dsh%% 
cations magazine%%lst%% ieee 51%%lst%% 6 (2013)%%lst%% 128 134%%per%%]$~ 
~$[flix j%%per%%]$~ ~$[villanueva%%lst%% maria j%%per%%]$~ ~$[santo mia%%lst%% david villa%%lst%% jess barba%%lst%% ]^[ juan carlos lopez%%per%% 2013%%per%%]$~ ~$[civ%%dsh%% 
itas%%cln%% %%#%% smart city middleware%%lst%% %%#%% sensors %%#%% %%#%% data%%per%%]$~ ~$[in innovative mobile ]^[ inter%%dsh%% 
net services %%#%% ubiquitous computing (imis)%%lst%% 2013 seventh international conference on%%per%% 445 450%%per%%]$~ 
~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1109/imis%%per%%2013%%per%%80 
eleni %%#%% vlahogianni%%lst%% kostanstinos kepaptsoglou%%lst%% vassileios tsetsos%%lst%% ]^[ matthew %%#%% karlaftis%%per%% 2014%%per%%]$~ ~$[ex%%dsh%% 
ploiting %%#%% sensor technologies ]f[ real%%dsh%%time parking prediction %%#%% urban areas%%per%%]$~ ~$[in transportation 
research board 93rd annual meeting compendium %%#%% papers%%per%% 14 1673%%per%%]$~ 
~$[jiafu wan%%lst%% di li%%lst%% caifeng zou%%lst%% ]^[ keliang zhou%%per%% 2012%%per%%]$~ ~$[m2m communications ]f[ smart city%%cln%% %%#%% event%%dsh%% 
based architecture%%per%%]$~ ~$[in computer ]^[ information technology (cit)%%lst%% 2012 ieee 12th international 
conference on%%per%% 895 900%%per%%]$~ ~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1109/cit%%per%%2012%%per%%188 
kaiyu wan%%lst%% danny hughes%%lst%% ka lok man%%lst%% ]^[ tomas krilavicius%%per%% 2010%%per%%]$~ ~$[composition challenges ]^[ ap%%dsh%% 
proaches ]f[ cyber physical systems%%per%%]$~ ~$[in networked embedded systems ]f[ enterprise applications (ne%%dsh%% 
sea)%%lst%% 2010 ieee international conference on%%per%% 1 7%%per%%]$~ ~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1109/nesea%%per%%2010%%per%%5678065 
doug washburn%%lst%% usman sindhu%%lst%% stephanie balaouras%%lst%% rachel a%%per%%]$~ ~$[dines%%lst%% nicholas m%%per%%]$~ ~$[hayes%%lst%% ]^[ lauren e%%per%%]$~ 
~$[nelson%%per%% 2009%%per%%]$~ ~$[helping cios understand smart city initiatives%%per%%]$~ ~$[growth 17 (2009)%%per%%]$~ 
~$[rong wenge%%lst%% xiong zhang%%lst%% dave cooper%%lst%% li chao%%lst%% ]^[ sheng hao%%per%% 2014%%per%%]$~ ~$[smart city architecture%%cln%% %%#%% tech%%dsh%% 
nology guide ]f[ implementation ]^[ design challenges%%per%%]$~ ~$[communications%%lst%% china 11%%lst%% 3 (march 2014)%%lst%% 
56 69%%per%%]$~ ~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1109/cc%%per%%2014%%per%%6825259 
jules white%%lst%% siobhan clarke%%lst%% christin groba%%lst%% brian dougherty%%lst%% chris thompson%%lst%% ]^[ douglas c%%per%%]$~ 
~$[schmidt%%per%% 2010%%per%%]$~ ~$[r&d challenges ]^[ solutions ]f[ mobile cyber%%dsh%%physical applications ]^[ sup%%dsh%% 
porting internet services%%per%%]$~ ~$[journal %%#%% internet services ]^[ applications 1%%lst%% 1 (2010)%%lst%% 45 56%%per%%]$~ 
~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1007/s13174%%dsh%%010%%dsh%%0004%%dsh%%9 
chao wu%%lst%% david birch%%lst%% dilshan silva%%lst%% chun%%dsh%%hsiang lee%%lst%% orestis tsinalis%%lst%% ]^[ yike guo%%per%% 2014%%per%%]$~ ~$[concinnity%%cln%% 
%%#%% generic platform ]f[ %%#%% sensor data applications%%per%%]$~ ~$[cloud computing%%lst%% ieee 1%%lst%% 2 (july 2014)%%lst%% 42 50%%per%%]$~ 
~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1109/mcc%%per%%2014%%per%%33 
shintaro yamamoto%%lst%% shinsuke matsumoto%%lst%% sachio saiki%%lst%% ]^[ masahide nakamura%%per%% 2014%%per%%]$~ ~$[using material%%dsh%% 
ized view %%#%% %%#%% service %%#%% scallop4sc ]f[ smart city application services%%per%%]$~ ~$[in soft computing %%#%% %%#%% 
data processing%%per%%]$~ ~$[springer%%lst%% 51 60%%per%%]$~ 
~$[chuantao yin%%lst%% zhang xiong%%lst%% hui chen%%lst%% jingyuan wang%%lst%% daven cooper%%lst%% ]^[ bertrand david%%per%% 
2015%%per%%]$~ ~$[a literature survey %%#%% smart cities%%per%%]$~ ~$[science china information sciences (2015)%%lst%% 1 18%%per%%]$~ 
~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1007/s11432%%dsh%%015%%dsh%%5397%%dsh%%4 
software platforms ]f[ smart cities 
a:35 
matei zaharia%%lst%% mosharaf chowdhury%%lst%% michael %%#%% franklin%%lst%% scott shenker%%lst%% ]^[ ion stoica%%per%% 2010%%per%%]$~ ~$[spark%%cln%% 
cluster computing %%#%% %%#%% sets%%per%%]$~ ~$[in proceedings %%#%% %%#%% 2nd usenix conference %%#%% hot topics %%#%% 
cloud computing%%lst%% vol%%per%% 10%%per%% 10%%per%%]$~ 
~$[andrea zanella%%lst%% nicola bui%%lst%% angelo castellani%%lst%% lorenzo vangelista%%lst%% ]^[ michele zorzi%%per%% 2014%%per%%]$~ ~$[in%%dsh%% 
ternet %%#%% %%#%% ]f[ smart cities%%per%%]$~ ~$[internet %%#%% %%#%% journal%%lst%% ieee 1%%lst%% 1 (feb 2014)%%lst%% 22 32%%per%%]$~ 
~$[doi:http://dx%%per%%doi%%per%%org/10%%per%%1109/jiot%%per%%2014%%per%%2306328 
