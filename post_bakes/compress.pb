~$[synthesizable fpga fabrics targetable %%#%% %%#%% 
verilog%%dsh%%to%%dsh%%routing (vtr) cad flow 
jin hee kim ]^[ jason h%%per%%]$~ ~$[anderson 
dept%%per%% %%#%% electrical ]^[ computer engineering 
university %%#%% toronto%%lst%% toronto%%lst%% on%%lst%% canada 
email%%cln%% {kimjin14,janders}@ece%%per%%utoronto%%per%%ca 
abstract—we consider implementing fpgas using %%#%% standard 
cell design methodology%%lst%% ]^[ %%#%% %%#%% framework ]f[ %%#%% 
automated generation %%#%% synthesizable fpga fabrics%%per%%]$~ ~$[the opensource verilog%%dsh%%to%%dsh%%routing (vtr) fpga architecture evaluation 
framework [1] %%#%% extended %%#%% generate synthesizable verilog ]f[ %%#%% 
in%%dsh%%memory fpga architectural device model%%per%%]$~ ~$[the verilog %%#%% %%#%% 
synthesized %%#%% standard cells%%lst%% placed ]^[ routed using %%#%% asic 
design flow%%per%%]$~ ~$[a %%#%% extension %%#%% vtr generates %%#%% configuration 
bitstream ]f[ %%#%% fpga%%scn%% %%#%% is%%lst%% %%#%% bitstream configures %%#%% 
fpga %%#%% realize %%#%% user%%dsh%%provided placed ]^[ routed design%%per%%]$~ ~$[the 
proposed framework ]^[ methodology %%#%% %%#%% door %%#%% silicon 
implementation %%#%% %%#%% wide range %%#%% vtr%%dsh%%modelled fpga fabrics%%per%%]$~ 
~$[in %%#%% experimental study%%lst%% area ]^[ timing%%dsh%%optimized fpga 
implementations %%#%% 65nm tsmc standard cells %%#%% %%cmp%%d 
%%#%% %%#%% 65nm altera commercial fpga%%per%%]$~ 
~$[i%%per%%]$~ 
~$[i ntroduction 
standard cell design methodologies %%#%% prevalent %%#%% %%#%% 
design %%#%% modern digital ics%%lst%% owing %%#%% %%#%% %%#%% costs associated %%#%% manual layout ]^[ increasingly complicated design 
rules %%#%% deep sub%%dsh%%100nm technologies%%per%%]$~ ~$[entire processors [2] 
]^[ %%#%% digital blocks %%#%% %%#%% plls [3] %%#%% nowadays mainly 
synthesized %%#%% rtl%%lst%% %%#%% opposed %%#%% hand designed %%#%% %%#%% lower 
level %%#%% abstraction%%per%%]$~ ~$[field%%dsh%%programmable gate arrays (fpgas) 
%%#%% %%#%% %%#%% %%#%% %%#%% remaining classes %%#%% digital ic incorporating 
%%#%% considerable amount %%#%% custom layout%%per%%]$~ ~$[the core logic ]^[ 
interconnect tiles %%#%% commercial fpgas %%#%% laid %%#%% manually%%lst%% 
motivated %%#%% intense pressure %%#%% optimize area%%lst%% delay ]^[ 
power %%#%% %%#%% underlying circuitry%%lst%% %%#%% %%#%% tiles %%#%% stamped 
%%#%% hundreds%%dsh%%to%%dsh%%thousands %%#%% times %%#%% %%#%% die%%per%%]$~ ~$[in %%#%% paper%%lst%% 
%%#%% consider implementing fpgas %%#%% standard cells ]^[ assess 
%%#%% gap %%#%% %%#%% synthesized standard cell ]^[ %%#%% %%#%% custom 
commercial fpga implementation%%per%%]$~ 
~$[to realize %%#%% standard cell fpga implementation%%lst%% %%#%% %%#%% 
developed %%#%% synthesizable fpga fabric generator %%#%% %%#%% 
open%%dsh%%source verilog%%dsh%%to%%dsh%%routing (vtr) [1] toolsuite %%#%% %%#%% 
university %%#%% toronto%%per%%]$~ ~$[vtr %%#%% capable %%#%% modelling ]^[ 
mapping circuits %%#%% %%#%% wide variety %%#%% %%#%% fpga architectures%%per%%]$~ ~$[our generator produces synthesizable verilog ]f[ 
vtr’s in%%dsh%%memory fpga device model%%per%%]$~ ~$[as such%%lst%% %%#%% generator 
%%#%% ]n[ locked %%#%% %%#%% single fpga architecture%%lst%% ]b[ rather%%lst%% %%#%% 
able %%#%% produce verilog ]f[ %%#%% spectrum %%#%% %%#%% fpgas%%lst%% ]f[ 
example%%lst%% %%#%% %%#%% numbers %%#%% look%%dsh%%up%%dsh%%tables (luts) %%#%% 
logic block%%lst%% %%#%% numbers %%#%% tracks %%#%% routing channel%%lst%% 
]v[ %%#%% %%#%% switch block connectivities%%per%%]$~ ~$[in addition %%#%% 
producing synthesizable verilog%%lst%% %%#%% %%#%% %%#%% extended vtr 
%%#%% produce %%#%% configuration bitstream ]f[ %%#%% user design implemented %%#%% %%#%% synthesizable fpga%%per%%]$~ ~$[while %%#%% conventional 
approach %%#%% %%#%% commercial vendors involves adding cad 
support ]f[ %%#%% %%#%% fpga device%%scn%% %%#%% %%#%% case%%lst%% %%#%% %%#%% built 
“silicon support” ]f[ %%#%% existing ]^[ %%#%% established fpga 
architecture/cad evaluation toolsuite – vtr%%per%%]$~ 
~$[in addition %%#%% %%#%% advantages associated %%#%% synthesis 
vs%%per%% custom layout%%lst%% %%#%% proposed synthesizable fpga fabric 
generator offers %%#%% number %%#%% benefits%%per%%]$~ ~$[first%%lst%% %%#%% enables vtrmodelled fpgas %%#%% %%#%% realized %%#%% silicon%%lst%% democratizing 
access %%#%% fpga technology%%per%%]$~ ~$[specifically%%lst%% %%#%% vtr%%dsh%%based approach circumvents %%#%% major impediment %%#%% %%#%% development 
%%#%% %%#%% fpgas%%lst%% namely%%lst%% %%#%% complexity ]^[ cost associated 
%%#%% building cad tools %%#%% %%#%% map user circuits %%#%% them%%per%%]$~ 
~$[second%%lst%% %%#%% synthesizable fpgas %%#%% %%#%% easily ported %%#%% 
%%#%% process technologies%%lst%% %%#%% re%%dsh%%synthesizing using %%#%% %%#%% cell 
library%%per%%]$~ ~$[third%%lst%% %%#%% fpga fabrics %%#%% generate %%#%% straightforward %%#%% incorporate %%#%% %%#%% soc%%scn%% %%#%% fpga module %%#%% %%#%% 
instantiated %%#%% %%#%% surrounding circuitry%%lst%% ]^[ %%#%% layout 
shape/aspect ratio %%#%% %%#%% fpga tiles %%#%% %%#%% tailored according 
%%#%% %%#%% overall soc floorplan%%per%%]$~ 
~$[we synthesize fpga fabrics %%#%% tsmc 65nm standard 
cells%%per%%]$~ ~$[through constraints supplied %%#%% %%#%% asic design tools 
(synopsys design compiler ]^[ cadence encounter)%%lst%% %%#%% 
produce area%%dsh%%optimized%%lst%% timing%%dsh%%optimized ]^[ balanced fpga 
fabric implementations%%per%%]$~ ~$[in %%#%% experimental study%%lst%% %%#%% supply 
vtr %%#%% %%#%% architecture model closely resembling altera’s 
stratix iii device%%lst%% ]^[ %%cmp%% %%#%% area ]^[ delay %%#%% %%#%% 
synthesized standard cell fpga %%#%% stratix iii%%lst%% %%#%% %%#%% %%#%% 
implemented %%#%% 65nm%%per%%]$~ ~$[the contributions %%#%% %%#%% paper are%%cln%% 
1) 
2) 
3) 
%%#%% fpga fabric generator%%lst%% built %%#%% vtr%%lst%% capable 
%%#%% producing synthesizable verilog rtl ]f[ %%#%% variety 
%%#%% architectures%%per%%]$~ 
~$[a configuration bitstream generator ]f[ %%#%% synthesizable fpgas%%per%%]$~ 
~$[an area/performance comparison %%#%% %%#%% 
synthesized standard cell fpgas and%%lst%% %%#%% %%#%% authors’ 
knowledge%%lst%% %%#%% %%#%% published study comparing %%#%% 
full%%dsh%%custom commercial fpga %%#%% %%#%% synthesized 
standard cell fpga%%per%%]$~ 
~$[the remainder %%#%% %%#%% paper %%#%% organized %%#%% follows%%cln%% section ii describes related %%#%% ]^[ provides background ]f[ %%#%% 
subsequent sections%%per%%]$~ ~$[the vtr%%dsh%%based synthesizable fabric ]^[ 
bitstream generation %%#%% introduced %%#%% section iii%%per%%]$~ ~$[section iv 
describes %%#%% asic flow %%#%% %%#%% %%#%% produce %%#%% standard cell 
implementation%%per%%]$~ ~$[the experimental study appears %%#%% section v%%per%%]$~ 
~$[conclusions ]^[ future %%#%% %%#%% offered %%#%% section vi%%per%%]$~ 
~$[ii%%per%%]$~ 
~$[background and %%#%% elated %%#%% ork 
a%%per%%]$~ ~$[verilog%%dsh%%to%%dsh%%routing (vtr) 
vtr [1] %%#%% %%#%% open%%dsh%%source fpga architecture evaluation/cad framework %%#%% %%#%% university %%#%% toronto%%lst%% comprising %%#%% rtl synthesis%%lst%% logic synthesis%%lst%% packing%%lst%% placement%%lst%% 
routing ]^[ timing/power analysis%%lst%% %%#%% shown %%#%% fig%%per%% 1%%per%%]$~ ~$[the 
inputs %%#%% vtr are%%cln%% 1) %%#%% description %%#%% %%#%% fpga architecture%%lst%% 
]^[ 2) %%#%% application benchmark ]f[ implementation %%#%% %%#%% 
*&+,%%dsh%%%%per%%/)011%%dsh%%,#%%dqt%%2%%per%%%%sqt%%) 
3,+#4,5) 
<%%dsh%%%%dqt%%=%%per%%+%%dqt%%2%%per%%%%sqt%%) 
>?%%sqt%%59&;,;)@)a&#9)b%%dqt%%1) 
6780) 
0+#9,5&#54+&) 
:&;#+,12%%per%%%%sqt%%) 
6,%%dsh%%&) 
vtr permits heterogeneity%%lst%% %%#%% columns %%#%% blocks %%#%% %%#%% 
%%#%% %%#%% types%%scn%% ]f[ example%%lst%% lut%%dsh%%based soft logic blocks%%lst%% 
dsp blocks%%lst%% ]^[ memories%%per%%]$~ ~$[within %%#%% %%#%% %%#%% types%%lst%% %%#%% 
architect %%#%% %%#%% wide range %%#%% choices%%per%%]$~ ~$[for example%%lst%% %%#%% soft 
logic blocks%%lst%% %%#%% %%#%% vary %%#%% # %%#%% luts/block%%lst%% %%#%% 
%%#%% luts %%#%% fracturable [5] vs%%per%% non%%dsh%%fracturable%%lst%% %%#%% richness 
%%#%% %%#%% internal local crossbar%%lst%% %%#%% number %%#%% ffs%%lst%% ]^[ ]s[ 
on%%per%%]$~ ~$[vtr %%#%% supports %%#%% notion %%#%% modes%%lst%% %%#%% represent 
mutually exclusive %%#%% %%#%% %%#%% %%#%% block %%#%% function%%per%%]$~ ~$[for 
example%%lst%% %%#%% fracturable lut %%#%% operate %%#%% single%%dsh%%output mode 
(implementing %%#%% single logic function) ]v[ dual%%dsh%%output mode 
(implementing %%#%% logic functions)%%per%% 
!%%dqt%%#$%&&% 
%%sqt%%()% 
7%%dqt%%#$,%%sqt%%/) 
!%%dqt%%#$%&%%sqt%%() 
7%%dsh%%%%dqt%%#&c&%%sqt%%5) 
*+,% 
d%%per%%42%%sqt%%/) 
a,c,%%sqt%%/)@)0+&%%dqt%%)<;2c%%dqt%%2%%per%%%%sqt%%) 
c%%per%%]$~ ~$[related %%#%% 
e4%%dqt%%%%dsh%%,5?)%%per%%f)d&;4%%dsh%%5;) 
fig%%per%% 1%%per%%]$~ 
~$[verilog%%dsh%%to%%dsh%%routing flow%%per%% 
*+& 
*+& 
*+& 
*+& 
!%%dqt%%#$%& 
%%sqt%%(%%dqt%%%)& 
!%%dqt%%#$%& 
%%sqt%%(%%dqt%%%)& 
!%%dqt%%#$%& 
%%sqt%%(%%dqt%%%)& 
*+& 
!%%dqt%%#$%& 
%%sqt%%(%%dqt%%%)& 
!%%dqt%%#$%& 
%%sqt%%(%%dqt%%%)& 
!%%dqt%%#$%& 
%%sqt%%(%%dqt%%%)& 
%%dsh%%%%per%%!/0& 
11& 
*+& 
67$8%9&3(%%dqt%%%)& 
%%dsh%%%%per%%!/0& 
11& 
*+& 
2345& 
,& 
*+& 
!%%dqt%%#$%& 
%%sqt%%(%%dqt%%%)& 
*+& 
!%%dqt%%#$%& 
%%sqt%%(%%dqt%%%)& 
%%dsh%%%%per%%!/0& 
*+& 
*+& 
!%%dqt%%#$%& 
%%sqt%%(%%dqt%%%)& 
11& 
!%%dqt%%#$%&3(%%dqt%%%)& 
*+& 
:%%dqt%%;;<%=%%dqt%%;&3(%%dqt%%%)& 
fig%%per%% 2%%per%%]$~ 
~$[fpga architectural components%%per%%]$~ 
~$[fpga%%per%%]$~ ~$[the architectural description %%#%% written %%#%% humanreadable xml%%lst%% ]^[ %%#%% this%%lst%% %%#%% architect %%#%% specify %%#%% 
%%#%% interconnect ]^[ logic architecture %%#%% %%#%% target fpga%%per%%]$~ 
~$[vtr’s internal cad algorithms %%#%% “generic” %%#%% %%#%% sense 
%%#%% specific architectural details %%#%% ]n[ hard%%dsh%%coded %%#%% %%#%% 
algorithms themselves – %%#%% algorithms %%#%% designed %%#%% %%#%% %%#%% 
reasonably %%#%% job implementing %%#%% application benchmark 
%%#%% %%#%% range %%#%% architectures%%per%%]$~ ~$[note %%#%% prior %%#%% %%#%% current 
work%%lst%% %%#%% vtr flow terminated %%#%% %%#%% routing stage%%scn%% %%#%% %%#%% ]n[ 
%%#%% %%#%% realize %%#%% silicon implementation %%#%% %%#%% vtr%%dsh%%modelled 
architecture%%per%%]$~ ~$[our %%#%% extends vtr %%#%% produce synthesizable 
verilog ]f[ vtr’s in%%dsh%%memory architectural device model%%lst%% %%#%% 
%%#%% %%#%% %%#%% bitstream ]f[ %%#%% application benchmark implemented 
%%#%% %%#%% device%%per%%]$~ 
~$[b%%per%%]$~ ~$[fpga architecture 
vtr %%#%% able %%#%% model island%%dsh%%style fpgas [4]%%lst%% %%#%% %%#%% 
dimensional array %%#%% logic blocks %%#%% horizontal ]^[ vertical 
routing channels%%lst%% surrounded %%#%% %%#%% ring %%#%% i/os%%per%%]$~ ~$[the key 
architectural components necessary %%#%% understand %%#%% paper 
%%#%% shown %%#%% fig%%per%% 2%%per%%]$~ ~$[switch blocks allow horizontal ]^[ vertical 
routing tracks %%#%% %%#%% programmably connected %%#%% %%#%% another%%scn%% 
connection blocks allow logic block pins %%#%% connect %%#%% adjacent 
routing tracks%%per%%]$~ ~$[logic blocks %%#%% contain %%#%% ]v[ %%#%% 
look%%dsh%%up%%dsh%%tables (luts) ]^[ flip%%dsh%%flops (ffs)%%lst%% ]^[ %%#%% internal 
crossbar ]f[ %%#%% local connections%%per%%]$~ 
~$[with respect %%#%% routing%%lst%% vtr allows %%#%% %%#%% change %%#%% 
number %%#%% tracks %%#%% channel%%lst%% wire directionality%%lst%% %%#%% wire 
segment lengths ]^[ relative frequency %%#%% wires %%#%% %%#%% %%#%% 
length%%lst%% %%#%% connectivity %%#%% horizontal ]^[ vertical wires%%lst%% 
]^[ %%#%% %%#%% wires connect %%#%% logic block pins%%per%%]$~ ~$[for logic%%lst%% 
%%#%% recent %%#%% bear similarity %%#%% %%#%% own %%#%% %%#%% 
%%#%% propose %%#%% synthesize fpga fabrics targetable %%#%% vtr%%per%%]$~ 
~$[chaudhuri et al%%per%% [6] focuses %%#%% embedding %%#%% reconfigurable 
fpga %%#%% %%#%% system%%dsh%%on%%dsh%%chip (soc)%%lst%% ]^[ enhance %%#%% area ]^[ 
performance %%#%% floorplanning [7]%%per%%]$~ ~$[liu [8] studies %%#%% impact %%#%% %%#%% fpga architectural parameters %%#%% %%#%% synthesized 
components %%#%% %%#%% fpga%%per%%]$~ ~$[in %%#%% %%#%% %%#%% works%%lst%% %%#%% %%#%% little 
detail %%#%% %%#%% issues %%#%% arise %%#%% using asic design tools%%per%%]$~ 
~$[moreover%%lst%% none %%#%% %%#%% %%#%% %%#%% %%#%% suite %%#%% benchmark 
designs %%#%% verified %%#%% functional %%#%% %%#%% synthesized 
fabric%%lst%% nor %%#%% %%#%% %%cmp%% %%#%% synthesized standard cell 
implementation %%#%% %%#%% commercial fpga%%per%%]$~ 
~$[in %%#%% work%%lst%% aken’ova [9] investigated island%%dsh%%style 
fpgas ]^[ improved area ]^[ delay gap %%#%% using “tactical 
cells” [10] ]^[ floorplanning [11]%%per%%]$~ ~$[the author thoroughly 
describes architecture changes ]^[ solutions %%#%% overcome asic 
design flow problems%%per%%]$~ ~$[however%%lst%% %%#%% %%#%% little discussion %%#%% %%#%% 
generation %%#%% %%#%% architecture ]^[ bitstream%%per%%]$~ 
~$[other %%#%% %%#%% focussed %%#%% standard cell implementations 
%%#%% application%%dsh%%specific fpga architectures%%per%%]$~ ~$[an %%#%% %%#%% 
%%#%% phillips ]^[ hauck [12] synthesized %%#%% reconfigurablepipelined datapath (rapid) [13] architecture using standard 
cells%%per%%]$~ ~$[the authors observe %%#%% customizing %%#%% architecture 
]f[ domain%%dsh%%specific applications%%lst%% %%#%% %%#%% %%#%% including %%#%% 
fpga%%dsh%%specific standard cells %%#%% %%#%% library improves area 
]^[ performance%%per%%]$~ ~$[kafafi et al%%per%% [14] synthesizes %%#%% combinational 
]^[ directional architecture ]^[ reports %%#%% large area difference 
relative %%#%% %%#%% custom%%dsh%%layout design%%per%%]$~ ~$[in %%#%% %%#%% wilton et 
al%%per%% [15]%%lst%% %%#%% authors synthesize %%#%% datapath%%dsh%%oriented fpga 
fabric %%#%% %%#%% directional routing architecture%%per%%]$~ ~$[unlike %%#%% 
past works%%lst%% %%#%% deal %%#%% non%%dsh%%standard fpga architectures%%lst%% 
%%#%% focus %%#%% architectures %%#%% resemble today’s commercial 
fpgas ]^[ %%#%% %%#%% %%#%% supported %%#%% %%#%% vtr framework%%per%%]$~ 
~$[iii%%per%%]$~ 
~$[a rchitecture and %%#%% itstream %%#%% eneration 
vpr [16] %%#%% %%#%% portion %%#%% %%#%% vtr flow %%#%% performs 
packing%%lst%% placement ]^[ routing%%per%%]$~ ~$[from %%#%% user%%dsh%%supplied architectural description%%lst%% vpr builds %%#%% in%%dsh%%memory representation 
%%#%% %%#%% entire fpga device%%lst%% including %%#%% logic ]^[ interconnect%%per%%]$~ 
~$[the packing%%lst%% placement ]^[ routing steps %%#%% vpr implement 
%%#%% application benchmark %%#%% %%#%% in%%dsh%%memory fpga device 
model%%per%%]$~ ~$[our synthesizable verilog generator %%#%% built %%#%% 
vpr ]^[ executes %%#%% %%#%% %%#%% %%#%% %%#%% routing step%%per%%]$~ ~$[essentially%%lst%% 
%%#%% generator code “walks” %%#%% in%%dsh%%memory device model %%#%% 
produce synthesizable verilog%%lst%% ]^[ likewise%%lst%% %%#%% examining 
%%#%% application benchmark’s implementation %%#%% %%#%% device%%lst%% %%#%% 
produce %%#%% configuration bitstream ]f[ %%#%% fpga%%per%%]$~ ~$[we elaborate 
%%#%% %%#%% steps below%%per%% 
;5&e8>) 
7%%dqt%%%%sqt%%$84#) 
7%%dqt%%4+68,) 
9+4%%sqt%%:+$) 
!%%dqt%%#$%%%dqt%%&%%sqt%%() 
*%%dqt%%#+,&) 
%%dsh%%34+,+&562) 
c) 
7/;);!<) 
5&e) 
=+$#$4%%dqt%%5>) 
0%%dqt%%&%%dqt%%45$84) 
fig%%per%% 4%%per%%]$~ 
~$[fig%%per%% 3%%per%% 
%%per%%/01) 
%%per%%5%4+%%sqt%%);!<) 
d8e%%dqt%%6f+>) 
*%%dqt%%#+,&) 
%%dsh%%%%per%%/012) 
=+$#$4%%dqt%%5>) 
?&+@56+a%%dqt%%)%%sqt%%8&b,:45@8&)%%sqt%%%%dqt%%66#) 
synthesizable fpga verification flow%%per%%]$~ 
~$[mux inference %%#%% %%#%% logic block%%per%%]$~ 
~$[a%%per%%]$~ ~$[generating synthesizable verilog 
%%#%% %%#%% %%#%% step%%lst%% %%#%% hand%%dsh%%wrote verilog ]f[ %%#%% fpga 
primitives%%cln%% %%#%% ff%%lst%% ]^[ %%#%% stratix iii%%dsh%%like fracturable lut (see 
section v)%%per%%]$~ ~$[subsequently%%lst%% %%#%% automatically generate verilog 
]f[ %%#%% entire fpga device%%lst%% %%#%% structural netlist %%#%% %%#%% 
primitives%%lst%% %%#%% %%#%% %%#%% %%#%% primitives %%#%% %%#%% generated %%#%% 
%%#%% generator code%%cln%% multiplexers (muxs) %%#%% %%#%% size%%lst%% luts 
%%#%% %%#%% number %%#%% inputs%%per%%]$~ ~$[the generation %%#%% handle %%#%% 
following%%cln%% logic blocks%%lst%% intra%%dsh%%logic block routing%%lst%% inter%%dsh%%logic 
block routing%%lst%% ]^[ configuration cell memory%%per%%]$~ 
~$[logic blocks%%cln%% logic blocks %%#%% vpr %%#%% represented %%#%% 
memory %%#%% %%#%% tree%%scn%% %%#%% tree root represents %%#%% entire logic block%%lst%% 
nodes %%#%% intermediate levels %%#%% %%#%% tree represent levels %%#%% 
hierarchy %%#%% %%#%% block%%lst%% ]^[ %%#%% leaves represent %%#%% primitives 
(luts ]^[ ffs)%%per%%]$~ ~$[we generate %%#%% verilog ]f[ %%#%% logic block 
%%#%% %%#%% traversing %%#%% %%#%% leaf nodes%%per%%]$~ ~$[we %%cmp%% move %%#%% %%#%% tree 
and%%lst%% %%#%% %%#%% visit %%#%% node %%#%% %%#%% hierarchy%%lst%% %%#%% child nodes 
%%#%% defined ]^[ instantiated %%#%% %%#%% output verilog%%per%%]$~ ~$[the verilog 
generated ]f[ %%#%% logic block %%#%% %%#%% %%#%% hierarchy specified 
%%#%% %%#%% architect %%#%% %%#%% architecture file%%per%%]$~ 
~$[intra%%dsh%%logic block routing%%cln%% routing %%#%% %%#%% logic block %%#%% 
stored %%#%% memory %%#%% %%#%% graph%%lst%% %%#%% nodes represent pins (on 
primitives ]v[ %%#%% intermediate levels %%#%% hierarchy) ]^[ directed 
edges represent connections %%#%% pins%%per%%]$~ ~$[for %%#%% %%#%% pin%%lst%% 
%%cmp%% %%#%% %%#%% %%#%% %%cmp%% %%#%% incoming edge%%lst%% %%#%% routing mux 
%%#%% inferred%%per%%]$~ ~$[the select inputs %%#%% %%#%% mux %%#%% %%#%% driven %%#%% 
configuration cells (discussed below)%%per%%]$~ ~$[fig%%per%% 3 highlights examples %%#%% routing mux inference %%#%% %%#%% logic block%%per%%]$~ ~$[crossbars 
%%#%% varying degrees %%#%% connectivity %%#%% %%#%% generated%%lst%% %%#%% 
vpr %%#%% creates edges %%#%% %%#%% in%%dsh%%memory model ]f[ %%#%% 
connections %%#%% exist%%per%%]$~ 
~$[inter%%dsh%%logic block routing%%cln%% routing %%#%% connects %%#%% logic 
blocks %%#%% likewise represented %%#%% memory %%#%% %%#%% graph%%per%%]$~ ~$[in %%#%% 
case%%lst%% %%#%% nodes represent %%#%% wire segments ]^[ pins%%per%%]$~ ~$[edges 
represent programmable connections %%#%% %%#%% conductors%%per%%]$~ 
~$[as above%%lst%% %%#%% %%#%% exists %%#%% %%cmp%% %%#%% edge %%#%% %%#%% node%%lst%% 
muxs %%#%% inferred%%per%%]$~ ~$[these muxs correspond %%#%% %%#%% connectivity %%#%% switch blocks ]^[ connection blocks (fig%%per%% 2)%%per%%]$~ ~$[vpr 
%%#%% ]n[ model %%#%% inter%%dsh%%logic block routing hierarchically 
– %%#%% %%#%% %%#%% notion %%#%% switch block ]v[ connection block 
%%#%% vpr’s in%%dsh%%memory model%%per%%]$~ ~$[consequently%%lst%% %%#%% mux %%#%% 
instantiated %%#%% %%#%% verilog %%#%% hierarchy%%per%%]$~ 
~$[configuration cells%%cln%% %%#%% muxs %%#%% implement programmable connectivity %%#%% %%#%% instantiated%%lst%% configuration 
cells %%#%% drive %%#%% select inputs %%#%% %%#%% %%#%% instantiated ]^[ 
attached accordingly%%per%%]$~ ~$[we %%#%% “fully encoded” muxs%%lst%% meaning%%lst%% 
%%#%% 4%%dsh%%to%%dsh%%1 mux %%#%% %%#%% %%#%% configuration bits%%per%%]$~ ~$[other styles %%#%% 
mux (e%%per%%g%%per%% flattened muxs %%#%% %%#%% %%#%% configuration cells 
]^[ %%#%% fewer levels %%#%% input%%dsh%%to%%dsh%%output) %%#%% left %%#%% consider 
%%#%% future work%%per%%]$~ ~$[we %%#%% %%#%% ff %%#%% implement %%#%% configuration 
cell%%per%%]$~ ~$[then%%lst%% %%#%% cells %%#%% connected %%#%% %%#%% chain%%lst%% %%#%% %%#%% shift 
register%%per%%]$~ ~$[similarly%%lst%% ]f[ %%#%% luts %%#%% logic blocks%%lst%% %%#%% instantiate 
configuration cells %%#%% hold %%#%% lut’s truth table contents%%per%%]$~ 
~$[b%%per%%]$~ ~$[bitstream generation 
%%#%% configuration bitstream %%#%% %%#%% ordered sequence %%#%% 
0’s ]^[ 1’s %%#%% configures %%#%% fpga according %%#%% %%#%% implementation %%#%% %%#%% application benchmark%%per%%]$~ ~$[since %%#%% configuration cells %%#%% connected %%#%% %%#%% %%#%% chain%%lst%% %%#%% 0/1 
values shifted %%#%% ]f[ %%#%% benchmark’s implementation %%#%% 
align exactly %%#%% %%#%% ordering %%#%% cells %%#%% %%#%% chain%%per%%]$~ ~$[thus%%lst%% %%#%% 
create %%#%% configuration bitstream ]f[ %%#%% design%%lst%% %%#%% generator 
walks %%#%% device model %%#%% precisely %%#%% %%#%% order %%#%% %%#%% 
%%#%% %%#%% generate %%#%% synthesizable verilog%%per%%]$~ ~$[the in%%dsh%%memory 
implementation %%#%% %%#%% benchmark %%#%% %%#%% %%#%% assign 0/1 values 
%%#%% %%#%% bitstream%%per%%]$~ ~$[for example%%lst%% consider %%#%% 4%%dsh%%to%%dsh%%1 interconnect 
mux %%#%% inputs %%#%% numbered 0%%lst%% 1%%lst%% 2%%lst%% 3%%per%%]$~ ~$[the path selected 
%%#%% %%#%% mux %%#%% %%#%% controlled %%#%% %%#%% configuration 
cells%%per%%]$~ ~$[assuming %%#%% vpr %%#%% routed %%#%% signal %%#%% input 
#1%%lst%% %%#%% %%#%% configuration cell values %%#%% %%#%% stream %%#%% %%#%% 
01%%per%%]$~ ~$[regarding bitstream generation%%lst%% %%#%% %%#%% %%#%% challenges 
worth highlighting discussed below%%per%%]$~ 
~$[input ]^[ output equivalence%%cln%% vpr supports input ]^[ 
output pin equivalence (essentially “pin swapping”)%%per%%]$~ ~$[this 
means %%#%% %%#%% %%#%% generate %%#%% bitstream%%lst%% %%#%% %%#%% %%#%% account 
]f[ %%#%% change %%#%% %%#%% ordering %%#%% %%#%% inputs ]v[ outputs %%#%% %%#%% 
%%#%% occurred %%#%% routing%%per%%]$~ ~$[for example%%lst%% consider %%#%% mux 
%%#%% %%#%% intra%%dsh%%logic block crossbar%%per%%]$~ ~$[at %%#%% packing stage%%lst%% 
vpr %%#%% %%#%% %%#%% %%#%% ith input %%#%% %%#%% mux ]f[ %%#%% logic 
signal%%scn%% however%%lst%% %%#%% vpr router %%#%% %%#%% %%#%% instead using %%#%% 
%%#%% th input ]f[ %%#%% signal (e%%per%%g%%per%% ]f[ timing/routability reasons)%%per%%]$~ 
~$[during bitstream generation%%lst%% %%#%% account ]f[ %%#%% changes %%#%% 
examining %%#%% routing paths actually %%#%% %%#%% nets ]^[ %%#%% ]n[ 
rely %%#%% %%#%% packed (pre%%dsh%%routed) netlist%%per%%]$~ 
~$[fracturable luts%%cln%% %%#%% luts %%#%% ]n[ fracturable%%lst%% %%#%% 
%%#%% assume %%#%% unused inputs %%#%% grounded ]^[ %%#%% configure 
%%#%% lut truth table accordingly%%per%%]$~ ~$[however%%lst%% %%#%% fracturable 
luts%%lst%% %%#%% %%#%% account ]f[ inputs %%#%% %%#%% shared %%#%% %%#%% 
luts%%per%%]$~ ~$[for example%%lst%% fracturable luts %%#%% altera commercial 
devices %%#%% 8 inputs%%lst%% %%#%% %%#%% inputs %%#%% shared %%#%% 
%%#%% %%#%% luts%%per%%]$~ ~$[when %%#%% %%#%% %%#%% shared inputs %%#%% %%#%% %%#%% %%#%% 
%%#%% lut%%lst%% ]b[ unused %%#%% %%#%% %%#%% lut%%lst%% %%#%% %%#%% %%#%% %%#%% 
assume %%#%% input %%#%% %%#%% grounded %%#%% %%#%% specify %%#%% truth 
table ]f[ %%#%% %%#%% lut%%per%%]$~ ~$[the truth table ]f[ %%#%% %%#%% lut 
%%#%% %%#%% set %%#%% %%#%% %%#%% %%#%% %%#%% %%#%% unused input %%#%% %%#%% “don’t 
care”%%cln%% %%#%% lut function %%#%% %%#%% correct regardless %%#%% %%#%% 
%%#%% unused input %%#%% %%#%% 0 ]v[ %%#%% 1%%per%%]$~ ~$[this involves replicating %%#%% 
truth table contents ]f[ %%#%% %%#%% logic states %%#%% %%#%% unused 
input%%per%%]$~ 
~$[c%%per%%]$~ ~$[functional correctness 
fig%%per%% 4 %%#%% %%#%% verification flow%%per%%]$~ ~$[we developed %%#%% testbench wherein %%#%% original application benchmark rtl %%#%% 
simulated %%#%% modelsim %%#%% random vectors%%per%%]$~ ~$[within %%#%% %%#%% 
testbench%%lst%% %%#%% fpga device rtl%%lst%% configured %%#%% %%#%% generated bitstream%%lst%% %%#%% simulated %%#%% %%#%% %%#%% random vectors%%per%%]$~ 
~$[output values %%#%% checked ]f[ equality %%#%% %%#%% vector 
applied%%per%%]$~ ~$[note %%#%% %%#%% verification flow %%#%% %%#%% %%#%% check 
correctness %%#%% %%#%% stages %%#%% %%#%% standard cell implementation%%cln%% 
rtl generated %%#%% %%#%% vpr generator%%lst%% post%%dsh%%technology mapping %%#%% synopsys (discussed below)%%lst%% ]^[ post%%dsh%%layout %%#%% 
cadence (also discussed below)%%per%%]$~ 
~$[d%%per%%]$~ ~$[supported architectures 
presently%%lst%% %%#%% tool %%#%% able %%#%% generate synthesizable verilog 
]f[ fpgas comprised %%#%% lut/ff%%dsh%%based logic blocks%%lst%% interconnect ]^[ i/os%%per%%]$~ ~$[support ]f[ %%#%% types %%#%% blocks%%lst%% %%#%% %%#%% 
dsp ]v[ ram blocks%%lst%% %%#%% left %%#%% future work%%per%%]$~ ~$[we support luts 
%%#%% %%#%% %%#%% fracturable ]v[ non%%dsh%%fracturable%%per%%]$~ ~$[in fact%%lst%% lut 
fracturability %%#%% %%#%% %%#%% form %%#%% vtr “modes” supported %%#%% 
%%#%% tool%%per%%]$~ ~$[the modes feature %%#%% vtr allows %%#%% architect %%#%% describe mutually exclusive functionality ]f[ %%#%% %%#%% block%%per%%]$~ ~$[the 
specification %%#%% modes %%#%% ]n[ contain information regarding 
%%#%% %%#%% functionality %%#%% %%#%% implemented %%#%% hardware%%lst%% 
nor %%#%% %%#%% obvious %%#%% %%#%% %%#%% %%#%% inferred automatically %%#%% %%#%% 
tool %%#%% %%#%% ours%%per%%]$~ 
~$[aside %%#%% %%#%% limitations%%lst%% %%#%% tool supports verilog/bitstream generation ]f[ %%#%% vtr%%dsh%%targetable architectures 
– %%#%% %%#%% %%#%% %%#%% approach described above%%lst%% %%#%% 
walks vtr’s in%%dsh%%memory device model%%per%%]$~ ~$[for example%%lst%% %%#%% 
%%#%% able %%#%% handle%%cln%% %%#%% # %%#%% luts/logic block%%lst%% %%#%% switch 
block/connection block connectivity%%lst%% wire segments %%#%% various 
lengths%%lst%% %%#%% ]v[ partially populated crossbars %%#%% logic 
blocks%%per%%]$~ 
~$[iv%%per%%]$~ 
~$[s tandard %%#%% ell asic %%#%% mplementation 
%%#%% %%#%% %%#%% asic design flow %%#%% synthesize%%lst%% place%%lst%% route%%lst%% 
]^[ analyze %%#%% circuit%%lst%% %%#%% summarized %%#%% fig%%per%% 5%%per%%]$~ ~$[we %%#%% 
synopsys design compiler %%#%% synthesize %%#%% fpga %%#%% standard 
cells%%per%%]$~ ~$[cadence encounter %%#%% %%#%% ]f[ placement ]^[ routing%%per%%]$~ 
~$[synopsys primetime %%#%% %%#%% ]f[ timing analysis%%per%%]$~ 
~$[a%%per%%]$~ ~$[synthesis %%#%% standard cells 
%%#%% evaluated %%#%% %%#%% synthesis strategies%%cln%% topdown%%lst%% “uniquify”%%lst%% ]v[ bottom%%dsh%%up%%per%%]$~ ~$[the top%%dsh%%down method %%#%% %%#%% 
push%%dsh%%button approach %%#%% %%#%% entire design %%#%% synthesized 
%%#%% “one shot”%%per%%]$~ ~$[however%%lst%% %%#%% %%#%% processes %%#%% %%#%% design %%#%% 
once%%lst%% %%#%% %%#%% %%#%% run%%dsh%%time ]^[ memory intensive %%#%% %%#%% %%#%% viable 
approach ]f[ %%#%% large design%%per%%]$~ ~$[in fact%%lst%% ]f[ %%#%% 20 × 20 fpga %%#%% 
300 tracks %%#%% channel%%lst%% design compiler %%#%% ]n[ successfully synthesize using %%#%% top%%dsh%%down approach%%per%%]$~ ~$[the uniquify 
approach allows %%#%% %%#%% break %%#%% %%#%% design ]^[ compile 
%%#%% instance separately%%per%%]$~ ~$[this approach worked%%lst%% however%%lst%% %%#%% %%#%% 
%%#%% run%%dsh%%time intensive%%lst%% %%#%% %%#%% instance %%#%% %%#%% %%#%% verilog 
module (e%%per%%g%%per%% %%#%% 6%%dsh%%lut) %%#%% compiled individually%%per%%]$~ ~$[we %%cmp%% 
chose %%#%% bottom%%dsh%%up approach%%lst%% %%#%% %%#%% %%#%% required verilog 
module %%#%% synthesized %%#%% once%%lst%% ]^[ %%#%% synthesized instances 
%%#%% stitched %%#%% %%#%% compose %%#%% overall synthesized design%%per%%]$~ 
~$[while %%#%% bottom%%dsh%%up method produces %%#%% %%#%% regular 
implementation ]^[ brings run%%dsh%%time benefits%%lst%% %%#%% weakness %%#%% 
%%#%% %%#%% type %%#%% module %%#%% synthesized %%#%% isolation%%scn%% i%%per%%e%%per%% outside 
%%#%% %%#%% context %%#%% %%#%% %%#%% modules %%#%% connects %%#%% %%#%% 
instantiated %%#%% %%#%% overall fpga%%per%%]$~ ~$[for example%%lst%% consider %%#%% 
]f[ %%#%% length%%dsh%%16 wire%%lst%% %%#%% %%#%% %%#%% truncated %%#%% %%#%% edge %%#%% %%#%% 
fpga%%lst%% depending %%#%% %%#%% location %%#%% %%#%% %%#%% %%#%% driven%%per%%]$~ 
~$[length%%dsh%%16 wires truncated %%#%% %%#%% %%#%% %%#%% %%#%% exhibit 
%%#%% load capacitances%%lst%% ]^[ %%#%% %%#%% undesirable %%#%% synthesize 
%%#%% separate/different driver %%#%% %%#%% %%#%% ]f[ %%#%% variant %%#%% 
fig%%per%% 5%%per%%]$~ 
~$[asic design flow%%per%% 
truncated length%%dsh%%16 wire%%per%%]$~ ~$[thus%%lst%% %%#%% handle %%#%% issues %%#%% arise 
%%#%% routing muxs driving various%%dsh%%length wires%%lst%% %%#%% %%#%% %%#%% 
following%%cln%% 1) %%#%% synthesize %%#%% single mux %%#%% %%#%% size%%scn%% 2) 
%%#%% insert %%#%% fixed%%dsh%%size buffer1 %%#%% %%#%% output %%#%% %%#%% mux %%#%% 
create %%#%% consistent load %%#%% %%#%% mux output%%scn%% ]^[ 3) %%#%% insert %%#%% 
fixed%%dsh%%size buffer %%#%% 2 tiles %%#%% inter%%dsh%%logic block interconnect 
wires%%lst%% ensuring %%#%% roughly uniform load ]f[ %%#%% buffer%%per%%]$~ 
~$[design compiler accepts area ]^[ timing constraints%%lst%% 
permitting %%#%% %%#%% trade%%dsh%%off performance vs%%per%% area ]f[ %%#%% single rtl design %%#%% changing constraints%%per%%]$~ ~$[in %%#%% experimental study (section v)%%lst%% %%#%% %%#%% synthesized area%%dsh%%optimized%%lst%% 
timing%%dsh%%optimized ]^[ balanced fpgas%%per%%]$~ ~$[optimizing ]f[ area %%#%% 
straightforward%%cln%% %%#%% direct design compiler %%#%% achieve %%#%% target 
area %%#%% 0%%per%%]$~ ~$[optimizing ]f[ timing %%#%% %%#%% involved%%lst%% owing %%#%% 
%%#%% %%#%% %%#%% fpgas contain %%#%% combinational loops %%#%% 
%%#%% programmed%%per%%]$~ ~$[such loops %%#%% problematic ]f[ timing 
analysis%%lst%% ]^[ %%#%% %%#%% %%#%% “broken” prior %%#%% timing%%dsh%%constrained 
synthesis%%per%%]$~ ~$[the loops exist %%#%% %%#%% inter%%dsh%% ]^[ intra%%dsh%%logic 
block routing%%lst%% ]^[ combinations %%#%% these%%per%%]$~ ~$[fig%%per%% 6 ]^[ fig%%per%% 7 
%%#%% examples %%#%% combinational loops ]^[ %%#%% %%#%% break 
%%#%% loops (via generated constraints provided %%#%% synopsys)%%per%%]$~ ~$[in 
essence%%lst%% %%#%% breaking %%#%% loops ]^[ %%#%% using %%#%% bottom%%dsh%%up 
synthesis approach%%lst%% %%#%% %%#%% able %%#%% produce %%#%% timing%%dsh%%optimized 
implementation %%#%% %%#%% module%%scn%% however%%lst%% %%#%% %%#%% timing 
paths %%#%% %%#%% overall fpga (i%%per%%e%%per%% %%#%% modules) %%#%% ]n[ 
optimized globally%%per%%]$~ ~$[nevertheless%%lst%% results %%#%% %%#%% %%#%% section 
demonstrate significantly improved performance %%#%% %%#%% timingoptimized implementations%%per%%]$~ ~$[note %%#%% timing constraints %%#%% 
%%#%% applied %%#%% paths %%#%% %%#%% logic signals %%#%% propagate %%#%% %%#%% application implementation%%per%%]$~ ~$[we %%#%% ]n[ apply timing 
constraints %%#%% %%#%% configuration cells%%lst%% ]v[ paths to/from %%#%% 
cells%%per%%]$~ ~$[the content %%#%% %%#%% cells %%#%% changes %%#%% %%#%% device 
%%#%% configured%%scn%% %%cmp%%%%lst%% %%#%% %%#%% ]n[ performance critical%%per%%]$~ 
~$[b%%per%%]$~ ~$[place ]^[ route 
placement ]^[ routing proceeds %%#%% %%#%% flat manner%%lst%% allowing 
optimization %%#%% %%#%% module boundaries%%per%%]$~ ~$[to help %%#%% placer%%lst%% 
%%#%% guide %%#%% design using floorplanning%%per%%]$~ ~$[by default%%lst%% %%#%% set 
floorplanning constraints assuming %%#%% chip aspect ratio %%#%% 1 
(square die) ]^[ 85% utilization (as kuon ]^[ rose discussed [17])%%per%%]$~ ~$[note %%#%% total cell area %%#%% known %%#%% synthesis 
%%#%% standard cells%%lst%% %%#%% %%#%% %%#%% %%#%% define %%#%% die size %%#%% 
%%#%% %%#%% utilization ratio%%per%% 
1 %%#%% cadence encounter router %%#%% %%#%% capabilities ]f[ automatic buffer 
insertion (command optdesign)%%lst%% however%%lst%% %%cmp%% %%#%% %%#%% size %%#%% %%#%% design 
%%#%% placed ]^[ routed%%lst%% %%#%% router%%dsh%%based buffer insertion repeatedly crashed 
%%#%% %%#%% server%%per%%]$~ ~$[we %%cmp%% opted %%#%% insert buffers %%#%% synthesis%%per%%]$~ 
~$[fig%%per%% 8%%per%%]$~ 
~$[fig%%per%% 6%%per%%]$~ 
~$[combinational loop %%#%% inter%%dsh%%logic block routing%%per%%]$~ 
~$[fig%%per%% 7%%per%%]$~ 
~$[combinational loop %%#%% logic block%%per%%]$~ 
~$[we found %%#%% floorplanning %%#%% mandatory %%#%% ensure %%#%% 
%%#%% physical layout %%#%% logic ]^[ routing tiles%%lst%% %%#%% terms %%#%% 
ordering %%#%% %%#%% horizontal ]^[ vertical dimensions%%lst%% matched 
%%#%% %%#%% assumed %%#%% vpr%%per%%]$~ ~$[without this%%lst%% encounter produced 
layouts where%%lst%% ]f[ example%%lst%% logic blocks %%#%% vpr %%#%% %%#%% 
adjacent%%lst%% %%#%% actually placed %%#%% apart %%#%% %%#%% layout%%per%%]$~ ~$[fig%%per%% 8 
%%#%% %%#%% example %%#%% %%#%% configuration cells %%#%% drift towards 
%%#%% %%#%% due %%#%% %%#%% connectivity ]^[ %%#%% %%#%% logic blocks 
%%#%% %%#%% intended %%#%% %%#%% adjacent %%#%% %%#%% %%#%% %%#%% %%#%% 
separated%%per%%]$~ ~$[for floorplanning %%#%% individual modules%%lst%% %%#%% %%#%% 
divide %%#%% %%#%% chip ]^[ constrain %%#%% logic blocks ]^[ %%#%% 
connection muxs connected %%#%% %%#%% logic blocks %%#%% %%#%% 
appropriate areas%%per%%]$~ ~$[on top %%#%% %%#%% grid%%lst%% %%#%% overlay %%#%% 
grid %%#%% floorplan %%#%% switch muxs %%#%% %%#%% appropriate areas%%per%%]$~ 
~$[the cadence placer allows %%#%% %%#%% control %%#%% rigidity %%#%% %%#%% 
floorplanning constraints%%lst%% specifically%%lst%% %%#%% cells %%#%% allow 
%%#%% enter/exit %%#%% floorplanning region%%per%%]$~ ~$[we set %%#%% %%#%% %%#%% %%#%% 
flexible scheme possible%%lst%% %%#%% %%#%% floorplanning constraints 
%%#%% %%#%% %%#%% %%#%% guide %%#%% %%#%% placer%%lst%% ]b[ cells %%#%% exit/enter %%#%% 
specified regions%%per%%]$~ ~$[all %%#%% %%#%% floorplanning tcl commands %%#%% 
automatically generated %%#%% %%#%% %%#%% time verilog description 
%%#%% %%#%% fpga %%#%% generated%%per%%]$~ 
~$[once %%#%% designs %%#%% %%#%% placed ]^[ routed%%lst%% parasitic 
capacitances %%#%% extracted ]f[ %%#%% %%#%% primetime %%#%% obtain accurate post%%dsh%%layout timing analysis%%per%%]$~ ~$[also%%lst%% %%#%% %%#%% point%%lst%% %%#%% gdsii 
file %%#%% %%#%% written %%#%% contains %%#%% %%#%% mask information%%per%%]$~ 
~$[c%%per%%]$~ ~$[timing analysis 
synopsys primetime %%#%% %%#%% ]f[ post%%dsh%%layout timing analysis of%%cln%% 1) specific paths %%#%% %%#%% implementation%%lst%% ]v[ 2) 
floorplanned (left) ]^[ unfloorplanned (right) layouts%%per%% 
%%#%% application benchmark programmed %%#%% %%#%% fpga%%per%%]$~ ~$[primetime accepts %%#%% input %%#%% design%%lst%% annotated %%#%% parasitic 
capacitance information%%lst%% %%#%% %%#%% %%#%% %%#%% sdc (synopsys design 
constraints) file%%per%%]$~ ~$[the sdc file specifies %%#%% timing paths 
%%#%% %%#%% ignored%%per%%]$~ ~$[for 1)%%lst%% %%#%% ignore %%#%% paths ]b[ %%#%% specific 
paths %%#%% wish %%#%% analyze (see %%#%% section) ]^[ run timing 
analysis %%#%% obtain %%#%% delay%%per%%]$~ ~$[for 2) finding %%#%% critical path %%#%% 
%%#%% application benchmark implemented %%#%% %%#%% fabric%%lst%% %%#%% 
process %%#%% %%#%% involved%%per%%]$~ ~$[commercial fpga vendors provide 
static timing analysis tools %%#%% analyze %%#%% performance ]f[ 
user designs implemented %%#%% %%#%% fpgas%%lst%% using delay models 
%%#%% %%#%% underlying fabric%%per%%]$~ ~$[to mimic %%#%% behavior %%#%% %%#%% 
tools ]f[ %%#%% application implemented %%#%% %%#%% synthesized 
fabric%%lst%% %%#%% devised %%#%% following approach%%cln%% %%#%% bitstream 
generation (section iii%%dsh%%b)%%lst%% %%#%% %%#%% precise knowledge %%#%% 
%%#%% fpga resources %%#%% %%#%% vs%%per%% unused%%per%%]$~ ~$[for %%#%% unused 
resource%%lst%% %%#%% automatically generate %%#%% sdc constraint %%#%% 
disable timing analysis %%#%% %%#%% resource%%per%%]$~ ~$[when primetime 
%%#%% invoked %%#%% analyze performance %%#%% %%#%% fpga device configured %%#%% %%#%% application bitstream%%lst%% primetime “sees” %%#%% 
%%#%% paths %%#%% %%#%% %%#%% %%#%% %%#%% %%#%% fpga (which %%#%% %%#%% 
free %%#%% combinational loops%%lst%% assuming well%%dsh%%designed circuits)%%per%%]$~ 
~$[the critical path reported %%#%% primetime %%#%% %%cmp%% analogous %%#%% 
%%#%% reported %%#%% %%#%% timing analysis tools %%#%% commercial fpga 
vendors%%per%%]$~ ~$[it %%#%% %%#%% %%#%% note %%#%% %%#%% %%#%% fpga device %%#%% 
%%#%% synthesized%%lst%% placed ]^[ routed%%lst%% timing analysis %%#%% %%#%% 
%%#%% ]f[ %%#%% application benchmark %%#%% providing primetime 
%%#%% %%#%% bitstream ]^[ sdc file ]f[ %%#%% benchmark%%per%%]$~ ~$[meaning%%lst%% 
%%#%% %%#%% ]n[ necessary %%#%% synthesize%%lst%% %%#%% ]^[ route %%#%% fpga 
device %%#%% %%#%% individual benchmark%%dsh%%by%%dsh%%benchmark basis%%per%%]$~ 
~$[a challenge %%#%% %%#%% %%#%% deal %%#%% regarding primetime arose 
due %%#%% %%#%% bottom%%dsh%%up synthesis strategy ]^[ %%#%% delay model %%#%% 
%%#%% standard cells%%per%%]$~ ~$[primetime reported warnings (rc%%dsh%%009) %%#%% 
%%#%% %%#%% cases%%lst%% timing results %%#%% %%#%% inaccurate %%#%% cell drive 
resistance %%#%% %%#%% %%#%% %%#%% comparison %%#%% %%#%% impedance 
%%#%% %%#%% driven network%%per%%]$~ ~$[recall %%#%% %%#%% %%#%% bottom%%dsh%%up synthesis 
style%%lst%% %%#%% %%#%% cases%%lst%% synopsys technology mapping %%#%% select 
cells %%#%% %%#%% %%#%% size %%#%% global context/knowledge %%#%% %%#%% 
total rc load driven %%#%% %%#%% cells%%per%%]$~ ~$[this mainly occurred ]f[ 
large cells driving %%#%% interconnect wires%%lst%% ]^[ %%#%% %%#%% able 
%%#%% eliminate %%#%% warnings %%#%% %%#%% buffer insertion discussed 
previously%%per%%]$~ 
~$[v%%per%%]$~ 
~$[e xperimental %%#%% tudy 
table %%#%% summarizes %%#%% parameters %%#%% %%#%% fpga architecture %%#%% synthesized %%#%% commercial tsmc 65nm standard cells%%per%%]$~ ~$[the architecture %%#%% designed %%#%% resemble altera’s 
stratix iii fpga%%lst%% %%#%% %%#%% %%#%% fabricated %%#%% tsmc’s 65nm 
process%%lst%% allowing %%#%% %%#%% %%#%% %%#%% (roughly) apples%%dsh%%to%%dsh%%apples 
comparison%%per%%]$~ ~$[the architectural parameters %%#%% %%#%% %%#%% recently 
parameters 
fpga dimensions 
k%%lst%% lut size 
n%%lst%% # %%#%% luts/logic block 
crossbar connectivity 
l%%lst%% wire length 
w%%lst%% channel width 
%%#%% cin input connectivity 
%%#%% cout output connectivity 
table i%%per%%]$~ 
~$[values 
20 %%#%% 20 
6 
10 
50% 
4 (87%)%%lst%% 16 (13%) 
300 
0%%per%%055 
0%%per%%1 
fpga %%#%% rchitecture parameters %%per%% 
published stratix iv architecture capture %%#%% murray et al%%per%% [18]%%lst%% 
%%#%% authors attempted %%#%% model stratix iv %%#%% vtr2 %%per%%]$~ 
~$[our synthesized fpga %%#%% dimensions %%#%% 20 × 20 logic 
blocks%%lst%% %%#%% 10 fracturable luts/block%%per%%]$~ ~$[there %%#%% 300 routing 
tracks/channel%%lst%% %%#%% 87% %%#%% tracks span 4 tiles%%lst%% ]^[ 13% span 
16 tiles%%per%%]$~ ~$[f cin /f cout refer %%#%% %%#%% fraction %%#%% adjacent tracks %%#%% 
logic block input/output pin %%#%% programmably connect to%%per%%]$~ 
~$[within %%#%% logic block%%lst%% %%#%% crossbar %%#%% 50% populated%%per%%]$~ ~$[we 
%%#%% using fracturable 6%%dsh%%luts %%#%% 8 inputs%%lst%% %%#%% implies 2shared inputs %%#%% dual%%dsh%%output mode%%lst%% similar %%#%% %%#%% extensive 
architecture described %%#%% [19]%%per%%]$~ ~$[such luts %%#%% implement %%#%% 
single function %%#%% %%#%% %%#%% 6 variables%%lst%% ]v[ %%#%% %%#%% functions %%#%% 
together%%lst%% %%#%% %%#%% %%#%% %%cmp%% 8 unique variables%%per%%]$~ ~$[we reinforce 
%%#%% %%#%% %%#%% %%#%% study %%#%% focus %%#%% %%#%% particular synthesized 
fabric comparable %%#%% stratix iii%%lst%% %%#%% generator %%#%% able %%#%% 
automatically produce rtl ]f[ %%#%% variety %%#%% vtr%%dsh%%supported 
architectures%%per%%]$~ 
~$[we synthesized %%#%% variants %%#%% %%#%% architecture described 
above%%cln%% area%%dsh%%optimized%%lst%% timing%%dsh%%optimized ]^[ balanced%%per%%]$~ ~$[for 
area%%dsh%%optimized%%lst%% %%#%% directed synopsys %%#%% minimize area ]^[ 
imposed %%#%% timing constraints%%per%%]$~ ~$[for %%#%% timing%%dsh%%optimized%%lst%% %%#%% 
conversely directed synopsys %%#%% minimize delay%%lst%% ]^[ imposed 
%%#%% area constraints%%per%%]$~ ~$[for %%#%% balanced%%lst%% %%#%% %%#%% %%#%% mid%%dsh%%point 
%%#%% %%#%% achieved delays %%#%% %%#%% area ]^[ timing%%dsh%%optimized 
]^[ set %%#%% %%#%% %%#%% target delays ]f[ synopsys%%per%%]$~ ~$[fig%%per%% 9 %%#%% 
%%#%% %%#%% %%#%% synthesized fpga fabric layouts%%per%%]$~ 
~$[in %%#%% %%#%% set %%#%% experiments%%lst%% %%#%% examine %%#%% area ]^[ 
performance (of specific paths) %%#%% %%#%% synthesized fpga 
]^[ %%cmp%% %%#%% analogous area ]^[ performance data ]f[ 
stratix iii%%per%%]$~ ~$[this %%#%% set %%#%% experiments %%#%% %%#%% agnostic %%#%% 
%%#%% particular application design %%#%% implemented %%#%% 
%%#%% fabric – %%#%% %%#%% %%#%% fabric%%dsh%%to%%dsh%%fabric comparison%%per%%]$~ ~$[in %%#%% %%#%% set 
%%#%% experiments%%lst%% %%#%% %%cmp%% %%#%% performance %%#%% application 
benchmark designs implemented %%#%% %%#%% fabric %%#%% %%#%% %%#%% 
designs implemented %%#%% stratix iii%%per%%]$~ 
~$[we consider various combinational ]^[ sequential benchmarks %%#%% %%#%% mcnc benchmark suite [20]%%per%%]$~ ~$[since %%#%% %%#%% 
using %%#%% %%#%% vtr flow%%lst%% %%#%% omitted %%#%% designs %%#%% 
%%#%% 20 largest mcnc benchmarks %%#%% vtr swept %%#%% 
unconnected nodes (as %%#%% circuits caused problems ]f[ %%#%% 
verification flow %%#%% relied %%#%% i/o matching)%%per%%]$~ ~$[in addition %%#%% 
%%#%% mcnc circuits%%lst%% %%#%% added %%#%% finite state machine (fsm) %%#%% 
detects %%#%% pattern%%lst%% ]^[ %%#%% %%#%% adder connected %%#%% %%#%% shift register%%per%%]$~ 
~$[these latter %%#%% circuits %%#%% %%#%% mainly ]f[ debugging 
purposes%%per%%]$~ ~$[we %%#%% %%#%% mcnc circuits %%#%% %%#%% initial study%%lst%% 
%%#%% %%#%% %%#%% %%#%% simulated %%#%% random vectors ]^[ verified 
%%#%% %%#%% flow %%#%% fig%%per%% 4%%per%%]$~ ~$[other benchmark suites%%lst%% %%#%% %%#%% %%#%% 
vtr suite%%lst%% contain dsp blocks ]^[ rams%%lst%% ]^[ %%#%% %%#%% 
challenging %%#%% simulate/verify%%lst%% owing %%#%% %%#%% circuits %%#%% 
reset/control inputs%%per%% 
2 %%#%% stratix iv %%#%% %%#%% %%#%% %%#%% advanced process %%cmp%% stratix iii%%lst%% %%#%% soft 
logic block ]^[ routing architectures %%#%% similar%%per%%]$~ 
~$[fig%%per%% 9%%per%%]$~ 
~$[synthesized fpga%%per%%]$~ 
~$[a%%per%%]$~ ~$[area analysis 
%%#%% %%cmp%% %%#%% tile area %%#%% %%#%% synthesized fpga %%#%% 
altera’s stratix iii%%per%%]$~ ~$[the tile area %%#%% %%#%% fpga %%#%% obtained 
%%#%% dividing total die area %%#%% %%#%% number %%#%% logic blocks 
(20 × 20 = 400)%%per%%]$~ ~$[table ii summarizes %%#%% tile area %%#%% %%#%% 
%%#%% architectures%%per%%]$~ ~$[stratix iii lab tile area %%#%% reported %%#%% %%#%% 
0%%per%%0221mm2 %%#%% [21]%%per%%]$~ ~$[the area%%dsh%%optimized fabric resulted %%#%% %%#%% 
%%#%% tile area %%#%% 0%%per%%0316mm2 %%lst%% %%#%% %%#%% 1%%per%%5× bigger %%cmp%% 
stratix iii%%per%%]$~ ~$[as expected%%lst%% %%#%% timing%%dsh%%optimized ]^[ balanced 
fabrics %%#%% larger%%cln%% 2%%per%%9× ]^[ 1%%per%%9× bigger %%cmp%% stratix iii%%lst%% respectively%%per%%]$~ ~$[we %%#%% encouraged %%#%% %%#%% area %%#%% %%#%% synthesized 
fabrics%%lst%% especially %%#%% area%%dsh%%optimized%%lst%% %%#%% %%#%% relatively close 
%%#%% stratix iii%%per%%]$~ 
~$[a number %%#%% factors contribute %%#%% %%#%% area difference 
vs%%per%%]$~ ~$[stratix iii%%per%%]$~ ~$[first%%lst%% %%#%% %%#%% architectural differences%%per%%]$~ ~$[for 
example%%lst%% %%#%% architecture %%#%% ]n[ support carry%%dsh%%chains nor 
%%#%% %%#%% muxs fully%%dsh%%decoded%%per%%]$~ ~$[second%%lst%% %%#%% implementation %%#%% 
%%#%% %%#%% standard cells %%#%% %%#%% tsmc library%%per%%]$~ ~$[in commercial 
fpgas%%lst%% pass%%dsh%%transistors ]v[ transmission gates %%#%% commonly 
%%#%% %%#%% implement muxs ]^[ luts%%scn%% however%%lst%% %%#%% %%#%% %%#%% 
cmos implementations %%#%% %%#%% primitives%%per%%]$~ ~$[likewise%%lst%% %%#%% %%#%% 
%%#%% using ffs ]f[ %%#%% configuration cells %%#%% %%cmp%% sram 
cells (as %%#%% expect %%#%% %%#%% %%#%% %%#%% commercial device)%%per%%]$~ ~$[perhaps 
%%#%% importantly%%lst%% %%#%% stratix iii lab %%#%% custom laid%%dsh%%out%%per%%]$~ 
~$[delving %%#%% %%#%% %%#%% area results%%lst%% fig%%per%% 10 %%#%% %%#%% 
breakdown %%#%% area %%#%% logic%%lst%% inter%%dsh%% ]^[ intra%%dsh%%logic block routing%%lst%% ]^[ configuration ]f[ %%#%% fabric type%%per%%]$~ ~$[in area%%dsh%%optimized 
design%%lst%% configuration cells built %%#%% costly ffs %%#%% %%#%% case%%lst%% 
occupy %%#%% large portion %%#%% %%#%% area%%cln%% 42% %%#%% %%#%% total%%per%%]$~ ~$[it %%#%% 
likewise ]n[ surprising %%#%% routing comprises 50% %%#%% %%#%% fabric 
area%%lst%% %%#%% %%#%% %%#%% using standard cell%%dsh%%based muxs%%lst%% instead %%#%% 
pass%%dsh%%transistor%%dsh%%style muxs%%per%%]$~ 
~$[in %%#%% timing%%dsh%%optimized fpga fabric%%lst%% %%#%% observe %%#%% 
configuration cells %%#%% reduced %%#%% 21% %%#%% %%#%% total area%%per%%]$~ ~$[this 
%%#%% %%cmp%% %%#%% configuration area %%#%% kept constant %%#%% applying 
%%#%% timing constraints %%#%% %%#%% configuration cells (they %%#%% ]n[ 
performance critical)%%per%%]$~ ~$[routing area %%#%% increased %%#%% 67% %%#%% %%#%% 
area ]^[ logic area increased %%#%% 13%%%per%%]$~ ~$[remember %%#%% %%#%% %%#%% 
timing%%dsh%%optimized fabric%%lst%% %%#%% inserted extra buffers %%#%% %%#%% interlogic block wires%%per%%]$~ ~$[however%%lst%% buffer area %%#%% ]n[ appreciable%%cln%% 2% 
%%#%% %%#%% total%%per%%]$~ 
~$[fpga fabric 
area%%dsh%%optimized 
timing%%dsh%%optimized 
balanced 
table ii%%per%% 
# %%#%% std%%per%%]$~ 
~$[cells 
3,577,520 
7,521,616 
5,298,588 
total area 
(mm2 ) 
12%%per%%65 
25%%per%%72 
16%%per%%89 
tile area 
(mm2 ) 
0%%per%%0316 
0%%per%%0643 
0%%per%%0422 
fpga fabric 
area%%dsh%%optimized 
timing%%dsh%%optimized 
balanced 
stratix iii 
table iii%%per%%]$~ 
~$[a rea %%#%% synthesized fpga%%per%%]$~ 
~$[fig%%per%% 11%%per%%]$~ 
~$[fig%%per%% 10%%per%%]$~ 
~$[area breakdown%%per%%]$~ 
~$[in %%#%% balanced fpga fabric%%lst%% %%#%% timing ]^[ area constraints %%#%% applied%%lst%% however%%lst%% %%#%% %%#%% %%#%% %%#%% relaxed timing 
constraint %%#%% %%#%% routing circuitry %%#%% save area%%per%%]$~ ~$[this leads %%#%% 
logic taking %%#%% 31% (logic + config ]f[ logic) ]^[ routing 
taking %%#%% 69% (routing + config ]f[ routing + buffers) %%#%% %%#%% 
total area%%per%%]$~ ~$[note %%#%% %%#%% %%#%% balanced fabric%%lst%% %%#%% %%#%% %%#%% luts 
timing constraint aggressive%%lst%% %%#%% %%#%% lut takes %%#%% %%#%% %%#%% 
portion %%#%% %%#%% total area%%per%%]$~ 
~$[b%%per%%]$~ ~$[timing analysis 
%%#%% %%#%% examine %%#%% delay %%#%% commonly%%dsh%%used paths %%#%% 
%%#%% synthesized fabrics ]^[ stratix iii (application%%dsh%%agnostic 
analysis)%%per%%]$~ ~$[specifically%%lst%% %%#%% looked %%#%% %%#%% following %%#%% paths%%cln%% 
1) 
2) 
3) 
l0 %%cln%% ff → crossbar → lut → ff (within %%#%% logic 
block)%%per%%]$~ 
~$[l4 %%cln%% ff → length%%dsh%%4 wire → crossbar → lut → ff 
(a path %%#%% length 4)%%per%%]$~ 
~$[l16 %%cln%% ff → length%%dsh%%16 wire → crossbar → lut → 
ff (a path %%#%% length 16)%%per%%]$~ 
~$[table iii %%#%% %%#%% summary %%#%% average delay %%#%% %%#%% paths 
%%#%% 6 %%#%% areas %%#%% %%#%% fpgas (in %%#%% %%#%% corners %%#%% 
%%#%% fabric%%lst%% ]^[ %%#%% %%#%% %%#%% middle %%#%% %%#%% left/right sides)%%per%%]$~ 
~$[in %%#%% synthesized fabrics%%lst%% %%#%% manually selected %%#%% 6 paths 
%%#%% creating %%#%% sdc file %%#%% reports %%#%% delay ]f[ each%%per%%]$~ ~$[in 
doing so%%lst%% %%#%% %%#%% assured %%#%% %%#%% analysis reflects %%#%% %%#%% 
%%#%% %%#%% length%%dsh%%4 ]v[ length%%dsh%%16 wire%%lst%% accordingly%%per%%]$~ ~$[for %%#%% altera 
stratix iii delays%%lst%% %%#%% %%#%% altera’s logiclock feature %%#%% %%#%% 
%%#%% connected flip%%dsh%%flops 4 ]v[ 16 logic blocks %%#%% %%#%% %%#%% 
another%%lst%% ]^[ %%cmp%% %%#%% altera’s timequest tool ascertain %%#%% 
path delay%%per%%]$~ ~$[for %%#%% fabrics%%lst%% %%#%% %%#%% logic blocks%%lst%% %%#%% apply 
%%#%% sdc constraint ]s[ %%#%% %%#%% measure %%#%% path corresponding 
%%#%% %%#%% fastest lut input%%scn%% %%#%% %%#%% %%#%% %%#%% comparable %%#%% altera%%lst%% 
l0 (ns) 
3%%per%%71 
1%%per%%79 
1%%per%%34 
0%%per%%73 
l4 (ns) 
7%%per%%38 
2%%per%%90 
3%%per%%73 
1%%per%%03 
l16 (ns) 
17%%per%%31 
4%%per%%92 
7%%per%%32 
1%%per%%54 
%%#%% rchitecture %%#%% elay%%per%%]$~ 
~$[delay breakdown%%per%% 
%%#%% quartus %%#%% %%#%% input %%#%% results %%#%% %%#%% %%#%% delay%%per%%]$~ 
~$[note %%#%% ]f[ %%#%% timing results %%#%% %%#%% paper%%lst%% %%#%% %%#%% %%#%% slowest 
speedgrade ]f[ stratix iii%%lst%% ]^[ %%cmp%% %%#%% slowest%%dsh%%processcorner analysis ]f[ %%#%% fabric%%per%%]$~ 
~$[comparing %%#%% timing%%dsh%%optimized implementation %%#%% 
stratix iii%%lst%% %%#%% delay %%#%% 2%%per%%3× %%#%% 3%%per%%5× slower%%lst%% %%#%% %%#%% gap 
%%#%% larger ]f[ %%#%% wire lengths%%per%%]$~ ~$[the balanced fabric %%#%% 
1%%per%%8× %%#%% 4%%per%%7× slower%%lst%% ]^[ %%#%% area%%dsh%%optimized fabric %%#%% 5× %%#%% 
11%%per%%2× slower %%cmp%% stratix iii%%per%%]$~ ~$[we believe %%#%% reason %%#%% %%#%% 
delay gap vs%%per%%]$~ ~$[stratix iii grows %%#%% wire length %%#%% related %%#%% 
%%#%% difficulty %%#%% handling %%#%% wires %%#%% %%#%% asic toolflow%%per%%]$~ 
~$[the relative results %%#%% %%#%% synthesized fabrics %%#%% %%#%% 
expected%%cln%% %%#%% area%%dsh%%optimized fabric %%#%% overall slower %%cmp%% %%#%% 
balanced design%%lst%% ]^[ %%#%% balanced design %%#%% slower %%cmp%% %%#%% 
timing%%dsh%%optimized fabric%%lst%% except ]f[ %%#%% l0 path%%per%%]$~ ~$[l0 reflects 
timing %%#%% %%#%% logic block%%scn%% %%#%% inter%%dsh%%logic block routing 
muxs %%#%% ]n[ included %%#%% %%#%% delay%%per%%]$~ ~$[the slightly lower delay 
%%#%% %%#%% balanced design %%#%% %%#%% due %%#%% %%#%% heuristic nature %%#%% 
asic mapping%%lst%% placement%%lst%% ]^[ routing tools%%per%%]$~ ~$[it %%#%% %%#%% %%#%% 
%%cmp%% %%#%% %%#%% fabric (unlike stratix iii)%%lst%% %%#%% mux drives 
%%#%% output %%#%% %%#%% logic block %%#%% %%#%% feedback ]^[ inter%%dsh%%logic 
block routing paths%%per%%]$~ ~$[that output mux %%#%% timing optimized %%#%% 
%%#%% balanced fabric implementation%%lst%% ]y[ %%#%% %%#%% %%#%% %%#%% load 
%%cmp%% %%#%% %%#%% timing%%dsh%%optimized fabric implementation%%per%%]$~ ~$[similar 
%%#%% %%#%% area analysis%%lst%% fig%%per%% 11 %%#%% %%#%% delay breakdown ]f[ 
%%#%% %%#%% types %%#%% paths ]f[ %%#%% architectures%%per%%]$~ ~$[the l4 ]^[ l16 
fabric delays %%#%% dominated %%#%% routing delay%%per%%]$~ ~$[this confirms 
%%#%% %%#%% %%#%% %%#%% %%#%% optimizations %%#%% %%#%% buffering %%#%% reduce 
%%#%% routing delay%%per%%]$~ 
~$[in %%#%% %%#%% %%#%% %%#%% %%#%% performance study%%lst%% %%#%% looked 
%%#%% %%#%% benchmark circuits perform %%#%% %%#%% synthesized fpga 
vs%%per%%]$~ ~$[stratix iii%%per%%]$~ ~$[the %%#%% verilog file %%#%% passed %%#%% %%#%% tool 
]f[ implementing %%#%% circuits %%#%% %%#%% fpgas%%per%%]$~ ~$[we %%#%% %%#%% sdc 
file generated %%#%% %%#%% bitstream %%#%% “program” %%#%% synthesized 
fpga %%#%% discussed %%#%% section iv%%dsh%%c%%per%%]$~ ~$[note %%#%% %%#%% results %%#%% 
%%#%% experiment %%#%% ]n[ solely reflective %%#%% %%#%% fabric speed%%lst%% ]b[ 
%%#%% %%#%% %%#%% differences %%#%% architectures%%lst%% ]^[ %%#%% %%#%% cad tools 
supporting %%#%% architectures%%cln%% open%%dsh%%source vtr vs%%per%%]$~ ~$[altera’s 
benchmark 
circuits 
alu4 
apex4 
des 
ex1010 
ex5p 
misex3 
pdc 
seq 
spla 
diffeq 
dsip 
elliptic 
frisc 
tseng 
addshift16 
fsm 
geo%%per%%]$~ ~$[mean 
table iv%%per%%]$~ 
~$[areaoptimized 
67%%per%%80 
74%%per%%62 
68%%per%%65 
103%%per%%59 
68%%per%%68 
74%%per%%78 
111%%per%%02 
69%%per%%79 
112%%per%%73 
69%%per%%42 
35%%per%%94 
103%%per%%42 
118%%per%%72 
60%%per%%43 
37%%per%%01 
5%%per%%75 
63%%per%%13 
timingoptimized 
22%%per%%29 
23%%per%%06 
21%%per%%58 
31%%per%%36 
21%%per%%86 
22%%per%%59 
33%%per%%72 
22%%per%%66 
34%%per%%92 
23%%per%%28 
11%%per%%71 
32%%per%%45 
38%%per%%06 
20%%per%%05 
13%%per%%43 
1%%per%%71 
20%%per%%10 
balanced 
32%%per%%47 
36%%per%%08 
31%%per%%26 
48%%per%%09 
31%%per%%54 
34%%per%%32 
51%%per%%66 
32%%per%%66 
51%%per%%30 
29%%per%%74 
17%%per%%75 
44%%per%%02 
52%%per%%37 
25%%per%%92 
16%%per%%61 
2%%per%%85 
28%%per%%97 
stratix 
iii 
5%%per%%293 
5%%per%%271 
6%%per%%696 
7%%per%%248 
5%%per%%455 
5%%per%%281 
7%%per%%213 
5%%per%%742 
6%%per%%654 
4%%per%%391 
5%%per%%918 
6%%per%%909 
7%%per%%865 
4%%per%%519 
4%%per%%31 
1%%per%%113 
5%%per%%25 
altera’s%%lst%% especially considering stratix iii %%#%% custom laid%%dsh%%out 
]^[ undoubtedly highly optimized%%per%%]$~ ~$[to %%#%% knowledge%%lst%% %%#%% 
%%#%% represents %%#%% %%#%% comparison %%#%% %%#%% standard cell fpga 
implementation %%#%% %%#%% commercial fpga%%per%%]$~ ~$[the proposed vtrbased synthesizable fpga generator %%#%% %%#%% door %%#%% actual 
silicon implementation %%#%% fpgas targetable %%#%% %%#%% established 
cad tool%%per%%]$~ 
~$[in %%#%% future%%lst%% %%#%% %%#%% %%#%% %%#%% assess power consumption%%lst%% 
]^[ extend architecture ]^[ bitstream generation %%#%% accept 
%%#%% architectures supported %%#%% vtr%%lst%% including %%#%% %%#%% 
dsp blocks ]^[ memories%%per%%]$~ ~$[further %%#%% %%#%% %%#%% %%#%% %%#%% 
support designs %%#%% multiple clocks%%per%%]$~ ~$[finally%%lst%% %%#%% %%#%% %%#%% 
%%#%% explore %%#%% utility %%#%% adding custom library cells %%#%% %%#%% 
specifically tailored ]f[ fpgas%%lst%% particularly ]f[ efficient mux 
]^[ configuration cell implementations%%per%%]$~ 
~$[r eferences 
[1] 
[2] 
%%#%% ritical path %%#%% elay (ns ) %%#%% %%#%% esigns %%#%% fpga%%per%% 
[3] 
quartus ii%%per%%]$~ ~$[table iv lists %%#%% critical path delays reported %%#%% 
%%#%% tools%%per%%]$~ ~$[the reported critical path delays %%#%% ]n[ include clock 
skew nor i/o cell delays (only core logic ]^[ routing)%%per%%]$~ 
~$[in combinational designs (top %%#%% %%#%% table)%%lst%% %%#%% designs 
%%#%% %%#%% input%%dsh%%to%%dsh%%output delay constraints%%per%%]$~ ~$[on average%%lst%% %%#%% 
%%#%% %%#%% ∼3%%per%%8× increase %%#%% delay %%#%% %%#%% timing%%dsh%%optimized 
]^[ stratix iii fpgas (see geo%%per%% mean row %%#%% bottom %%#%% 
table)%%per%%]$~ ~$[the delay gap %%#%% %%#%% %%#%% fpgas increased 
%%#%% %%#%% architecture delay study above%%lst%% %%#%% due %%#%% %%#%% 
weaknesses %%#%% %%#%% open%%dsh%%source vtr flow vs%%per%%]$~ ~$[quartus ii%%per%%]$~ ~$[in 
%%#%% sequential designs (bottom %%#%% %%#%% table)%%lst%% %%#%% critical path 
delays reported include register%%dsh%%to%%dsh%%register ]^[ i/o paths%%per%%]$~ ~$[most 
circuits %%#%% similar increase %%#%% delay %%#%% %%#%% combinational 
designs%%scn%% however%%lst%% %%#%% dsip ]^[ fsm benchmarks %%#%% %%#%% 
increases %%#%% 1%%per%%5× %%#%% 2×%%per%%]$~ ~$[the critical paths %%#%% %%#%% circuits 
%%#%% fewer logic levels %%cmp%%d %%#%% %%#%% %%#%% designs%%per%%]$~ 
~$[it %%#%% worthwhile %%#%% mention %%#%% %%#%% %%#%% %%#%% key advantages 
%%#%% %%#%% synthesizable fpga fabric %%#%% %%#%% %%#%% permits %%#%% type %%#%% 
exploration %%#%% here%%cln%% %%#%% ability %%#%% realize fabrics %%#%% %%#%% area/delay trade%%dsh%%offs %%#%% %%#%% single rtl source%%lst%% simply 
%%#%% changing constraints provided %%#%% %%#%% asic tools%%per%%]$~ ~$[such %%#%% 
exploration %%#%% highly costly %%cmp%% manual layout %%#%% required ]f[ 
%%#%% fabric%%per%% 
[4] 
[5] 
[6] 
[7] 
[8] 
[9] 
[10] 
[11] 
[12] 
[13] 
[14] 
vi%%per%%]$~ 
~$[c onclusions and %%#%% uture %%#%% ork 
%%#%% %%#%% work%%lst%% %%#%% propose %%#%% automatically generate synthesizable fpga fabrics %%#%% %%#%% open%%dsh%%source fpga cad 
tool%%lst%% vtr%%per%%]$~ ~$[the fabrics %%#%% generate %%#%% %%cmp%% synthesized%%lst%% 
placed ]^[ routed using %%#%% standard asic design flow %%#%% %%#%% 
commercial standard cell library%%per%%]$~ ~$[we synthesized 3 variants 
%%#%% %%#%% fpga fabric (modelled %%#%% altera’s stratix iii) %%#%% 
65nm tsmc standard cells%%cln%% timing%%dsh%%optimized%%lst%% area%%dsh%%optimized%%lst%% 
]^[ balanced%%per%%]$~ ~$[we %%cmp%%d %%#%% tile area %%#%% %%#%% %%#%% 
fpga fabric (area%%dsh%%optimized) %%#%% altera’s stratix iii ]^[ 
found %%#%% fabric %%#%% 1%%per%%5× %%#%% area%%per%%]$~ ~$[our timing%%dsh%%optimized 
fabric required 3× %%#%% area %%cmp%% stratix iii%%per%%]$~ ~$[with respect 
%%#%% performance%%lst%% %%#%% critical paths %%#%% designs implemented %%#%% 
%%#%% timing%%dsh%%optimized fabric %%#%% ∼3%%per%%8× longer%%lst%% %%#%% average%%lst%% 
%%cmp%% %%#%% stratix iii%%scn%% however%%lst%% %%#%% %%#%% benchmarks %%#%% delay 
gap %%#%% %%#%% low %%#%% 1%%per%%5×%%per%%]$~ ~$[overall%%lst%% %%#%% %%#%% encouraged %%#%% 
%%#%% silicon area ]^[ performance %%#%% %%#%% fabric relative %%#%% 
[15] 
[16] 
[17] 
[18] 
[19] 
[20] 
[21] 
j%%per%%]$~ ~$[rose et al%%per%%%%lst%% “the vtr project%%cln%% architecture ]^[ cad ]f[ fpgas 
%%#%% verilog %%#%% routing,” %%#%% fpga%%per%%]$~ ~$[acm%%lst%% pp%%per%% 77–86%%per%%]$~ 
~$[e%%per%%]$~ ~$[fluhr et al%%per%%%%lst%% “power8%%cln%% %%#%% 12%%dsh%%core server%%dsh%%class processor %%#%% 22nm soi 
%%#%% 7%%per%%6tb/s off%%dsh%%chip bandwidth,” %%#%% isscc%%per%%]$~ ~$[ieee%%lst%% 2014%%lst%% pp%%per%% 96–97%%per%%]$~ 
~$[w%%per%%]$~ ~$[deng et al%%per%%%%lst%% “a %%#%% synthesizable all%%dsh%%digital pll %%#%% interpolative phase coupled oscillator%%lst%% current%%dsh%%output dac%%lst%% ]^[ fineresolution digital varactor using gated edge injection technique,” 
jssc%%lst%% vol%%per%% 50%%lst%% no%%per%% 1%%lst%% pp%%per%% 68–80%%lst%% jan 2015%%per%%]$~ 
~$[v%%per%%]$~ ~$[betz et al%%per%%%%lst%% architecture ]^[ cad ]f[ deep%%dsh%%submicron fpgas%%per%%]$~ 
~$[kluwer academic publishers%%lst%% 1999%%per%% 
“stratix iii alm logic structure’s 8%%dsh%%input fracturable 
lut,” altera corp%%per%%%%lst%% tech%%per%%]$~ ~$[rep%%per%%%%lst%% 2015%%per%% [online]%%per%%]$~ ~$[available%%cln%% 
https://www%%per%%altera%%per%%com/products/fpga/features/st3%%dsh%%logic%%dsh%%structure%%per%%html 
s%%per%%]$~ ~$[chaudhuri et al%%per%%%%lst%% “an 8x8 run%%dsh%%time reconfigurable fpga embedded 
%%#%% %%#%% soc,” %%#%% dac%%per%%]$~ ~$[acm/ieee%%lst%% 2008%%lst%% pp%%per%% 120–125%%per%% 
——%%lst%% “efficient modeling ]^[ floorplanning %%#%% embedded%%dsh%%fpga fabric,” %%#%% fpl%%per%%]$~ ~$[ieee%%lst%% 2007%%lst%% pp%%per%% 665–669%%per%%]$~ 
~$[h%%per%%]$~ ~$[j%%per%%]$~ ~$[liu%%lst%% “archipelago – %%#%% %%#%% source fpga %%#%% toolflow 
support,” master’s thesis%%lst%% university %%#%% california %%#%% berkeley%%lst%% 2014%%per%%]$~ 
~$[v%%per%%]$~ ~$[aken’ova%%lst%% “bridging %%#%% gap %%#%% soft ]^[ hard efpga design,” 
master’s thesis%%lst%% university %%#%% british columbia%%lst%% 2005%%per%%]$~ 
~$[v%%per%%]$~ ~$[aken’ova et al%%per%%%%lst%% “an improved “soft” efpga design ]^[ implementation strategy,” %%#%% ieee cicc%%lst%% 2005%%lst%% pp%%per%% 179–182%%per%%]$~ 
~$[v%%per%%]$~ ~$[aken’ova ]^[ r%%per%%]$~ ~$[saleh%%lst%% “a “soft++” efpga physical design 
approach %%#%% %%#%% studies %%#%% 180nm ]^[ 90nm,” %%#%% isvlsi%%per%%]$~ ~$[ieee%%lst%% 
2006%%per%%]$~ 
~$[s%%per%%]$~ ~$[phillips ]^[ s%%per%%]$~ ~$[hauck%%lst%% “automatic layout %%#%% domain%%dsh%%specific reconfigurable subsystems ]f[ system%%dsh%%on%%dsh%%a%%dsh%%chip,” %%#%% fpga%%per%%]$~ ~$[acm%%lst%% 2002%%lst%% 
pp%%per%% 165–173%%per%%]$~ 
~$[c%%per%%]$~ ~$[ebeling et al%%per%%%%lst%% “rapid reconfigurable pipelined datapath,” %%#%% fieldprogrammable logic smart applications%%lst%% %%#%% paradigms ]^[ compilers%%lst%% 
1996%%lst%% pp%%per%% 126–135%%per%%]$~ 
~$[n%%per%%]$~ ~$[kafafi et al%%per%%%%lst%% “architectures ]^[ algorithms ]f[ synthesizable embedded programmable logic cores,” %%#%% fpga%%per%%]$~ ~$[acm%%lst%% 2003%%lst%% pp%%per%% 3–11%%per%%]$~ 
~$[s%%per%%]$~ ~$[wilton et al%%per%%%%lst%% “a synthesizable datapath%%dsh%%oriented embedded fpga 
fabric,” %%#%% fpga%%per%%]$~ ~$[acm%%lst%% 2007%%lst%% pp%%per%% 33–41%%per%%]$~ 
~$[v%%per%%]$~ ~$[betz ]^[ j%%per%%]$~ ~$[rose%%lst%% “vpr%%cln%% %%#%% %%#%% packing%%lst%% placement ]^[ routing tool 
]f[ fpga research,” %%#%% fpl%%lst%% 1997%%lst%% pp%%per%% 213–222%%per%%]$~ 
~$[i%%per%%]$~ ~$[kuon ]^[ j%%per%%]$~ ~$[rose%%lst%% “measuring %%#%% gap %%#%% fpgas ]^[ asics,” 
trans%%per%% %%#%% cad%%lst%% vol%%per%% 26%%lst%% no%%per%% 2%%lst%% pp%%per%% 203–215%%lst%% 2007%%per%%]$~ 
~$[k%%per%%]$~ ~$[e%%per%%]$~ ~$[murray et al%%per%%%%lst%% “titan%%cln%% enabling large ]^[ complex benchmarks 
%%#%% academic cad,” %%#%% fpl%%per%%]$~ ~$[ieee%%lst%% 2013%%per%%]$~ 
~$[j%%per%%]$~ ~$[luu%%lst%% “architecture%%dsh%%aware packing ]^[ cad infrastructure ]f[ fieldprogrammable gate arrays,” ph%%per%%d%%per%% dissertation%%lst%% university %%#%% toronto%%lst%% 
2014%%per%%]$~ 
~$[s%%per%%]$~ ~$[yang%%lst%% logic synthesis ]^[ optimization benchmarks user guide 
version 3%%per%%0%%per%%]$~ ~$[microelectronics center %%#%% north carolina%%lst%% 1991%%per%%]$~ 
~$[h%%per%%]$~ ~$[wong et al%%per%%%%lst%% “comparing fpga vs%%per%% custom cmos ]^[ %%#%% impact 
%%#%% processor microarchitecture,” %%#%% fpga%%per%%]$~ ~$[acm%%lst%% 2011%%lst%% pp%%per%% 5–14%%per%% 
