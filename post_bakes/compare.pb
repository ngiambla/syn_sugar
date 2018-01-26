~$[Synthesizable FPGA Fabrics Targetable by the 
Verilog%%dsh%%to%%dsh%%Routing (VTR) CAD Flow 
Jin Hee Kim ]^[ Jason H%%per%%]$~ ~$[Anderson 
Dept%%per%% of Electrical ]^[ Computer Engineering 
University of Toronto%%lst%% Toronto%%lst%% ON%%lst%% Canada 
Email%%cln%% {kimjin14,janders}@ece%%per%%utoronto%%per%%ca 
Abstract—We consider implementing FPGAs using a standard 
cell design methodology%%lst%% ]^[ present a framework ]f[ the 
automated generation of synthesizable FPGA fabrics%%per%%]$~ ~$[The opensource Verilog%%dsh%%to%%dsh%%Routing (VTR) FPGA architecture evaluation 
framework [1] is extended to generate synthesizable Verilog ]f[ its 
in%%dsh%%memory FPGA architectural device model%%per%%]$~ ~$[The Verilog can be 
synthesized into standard cells%%lst%% placed ]^[ routed using an ASIC 
design flow%%per%%]$~ ~$[A second extension to VTR generates a configuration 
bitstream ]f[ the FPGA%%scn%% that is%%lst%% the bitstream configures the 
FPGA to realize a user%%dsh%%provided placed ]^[ routed design%%per%%]$~ ~$[The 
proposed framework ]^[ methodology opens the door to silicon 
implementation of a wide range of VTR%%dsh%%modelled FPGA fabrics%%per%%]$~ 
~$[In an experimental study%%lst%% area ]^[ timing%%dsh%%optimized FPGA 
implementations in 65nm TSMC standard cells are %%cmp%%d 
with a 65nm Altera commercial FPGA%%per%%]$~ 
~$[I%%per%%]$~ 
~$[I NTRODUCTION 
Standard cell design methodologies are prevalent in the 
design of modern digital ICs%%lst%% owing to the high costs associated with manual layout ]^[ increasingly complicated design 
rules in deep sub%%dsh%%100nm technologies%%per%%]$~ ~$[Entire processors [2] 
]^[ other digital blocks such as PLLs [3] are nowadays mainly 
synthesized from RTL%%lst%% as opposed to hand designed at a lower 
level of abstraction%%per%%]$~ ~$[Field%%dsh%%programmable gate arrays (FPGAs) 
are one of the few remaining classes of digital IC incorporating 
a considerable amount of custom layout%%per%%]$~ ~$[The core logic ]^[ 
interconnect tiles in commercial FPGAs are laid out manually%%lst%% 
motivated by intense pressure to optimize area%%lst%% delay ]^[ 
power in the underlying circuitry%%lst%% as such tiles are stamped 
out hundreds%%dsh%%to%%dsh%%thousands of times on each die%%per%%]$~ ~$[In this paper%%lst%% 
we consider implementing FPGAs in standard cells ]^[ assess 
the gap between a synthesized standard cell ]^[ a full custom 
commercial FPGA implementation%%per%%]$~ 
~$[To realize a standard cell FPGA implementation%%lst%% we have 
developed a synthesizable FPGA fabric generator within the 
open%%dsh%%source Verilog%%dsh%%to%%dsh%%Routing (VTR) [1] toolsuite from the 
University of Toronto%%per%%]$~ ~$[VTR is capable of modelling ]^[ 
mapping circuits into a wide variety of different FPGA architectures%%per%%]$~ ~$[Our generator produces synthesizable Verilog ]f[ 
VTR’s in%%dsh%%memory FPGA device model%%per%%]$~ ~$[As such%%lst%% our generator 
is ]n[ locked into a single FPGA architecture%%lst%% ]b[ rather%%lst%% is 
able to produce Verilog ]f[ a spectrum of different FPGAs%%lst%% ]f[ 
example%%lst%% with different numbers of look%%dsh%%up%%dsh%%tables (LUTs) per 
logic block%%lst%% different numbers of tracks per routing channel%%lst%% 
]v[ even different switch block connectivities%%per%%]$~ ~$[In addition to 
producing synthesizable Verilog%%lst%% we have also extended VTR 
to produce a configuration bitstream ]f[ a user design implemented within the synthesizable FPGA%%per%%]$~ ~$[While the conventional 
approach used by commercial vendors involves adding CAD 
support ]f[ each new FPGA device%%scn%% in our case%%lst%% we have built 
“silicon support” ]f[ an existing ]^[ well established FPGA 
architecture/CAD evaluation toolsuite – VTR%%per%%]$~ 
~$[In addition to the advantages associated with synthesis 
vs%%per%% custom layout%%lst%% the proposed synthesizable FPGA fabric 
generator offers a number of benefits%%per%%]$~ ~$[First%%lst%% it enables VTRmodelled FPGAs to be realized in silicon%%lst%% democratizing 
access to FPGA technology%%per%%]$~ ~$[Specifically%%lst%% our VTR%%dsh%%based approach circumvents a major impediment to the development 
of new FPGAs%%lst%% namely%%lst%% the complexity ]^[ cost associated 
with building CAD tools that can map user circuits into them%%per%%]$~ 
~$[Second%%lst%% the synthesizable FPGAs can be easily ported to 
new process technologies%%lst%% by re%%dsh%%synthesizing using a new cell 
library%%per%%]$~ ~$[Third%%lst%% the FPGA fabrics we generate are straightforward to incorporate into an SoC%%scn%% the FPGA module can be 
instantiated within the surrounding circuitry%%lst%% ]^[ the layout 
shape/aspect ratio of the FPGA tiles can be tailored according 
to the overall SoC floorplan%%per%%]$~ 
~$[We synthesize FPGA fabrics into TSMC 65nm standard 
cells%%per%%]$~ ~$[Through constraints supplied to the ASIC design tools 
(Synopsys Design Compiler ]^[ Cadence Encounter)%%lst%% we 
produce area%%dsh%%optimized%%lst%% timing%%dsh%%optimized ]^[ balanced FPGA 
fabric implementations%%per%%]$~ ~$[In an experimental study%%lst%% we supply 
VTR with an architecture model closely resembling Altera’s 
Stratix III device%%lst%% ]^[ %%cmp%% the area ]^[ delay of the 
synthesized standard cell FPGA with Stratix III%%lst%% which is also 
implemented in 65nm%%per%%]$~ ~$[The contributions of this paper are%%cln%% 
1) 
2) 
3) 
An FPGA fabric generator%%lst%% built within VTR%%lst%% capable 
of producing synthesizable Verilog RTL ]f[ a variety 
of architectures%%per%%]$~ 
~$[A configuration bitstream generator ]f[ the synthesizable FPGAs%%per%%]$~ 
~$[An area/performance comparison between several 
synthesized standard cell FPGAs and%%lst%% to the authors’ 
knowledge%%lst%% the first published study comparing a 
full%%dsh%%custom commercial FPGA with a synthesized 
standard cell FPGA%%per%%]$~ 
~$[The remainder of this paper is organized as follows%%cln%% Section II describes related work ]^[ provides background ]f[ the 
subsequent sections%%per%%]$~ ~$[The VTR%%dsh%%based synthesizable fabric ]^[ 
bitstream generation is introduced in Section III%%per%%]$~ ~$[Section IV 
describes the ASIC flow we used to produce a standard cell 
implementation%%per%%]$~ ~$[The experimental study appears in Section V%%per%%]$~ 
~$[Conclusions ]^[ future work are offered in Section VI%%per%%]$~ 
~$[II%%per%%]$~ 
~$[BACKGROUND AND R ELATED W ORK 
A%%per%%]$~ ~$[Verilog%%dsh%%to%%dsh%%Routing (VTR) 
VTR [1] is an open%%dsh%%source FPGA architecture evaluation/CAD framework from the University of Toronto%%lst%% comprising of RTL synthesis%%lst%% logic synthesis%%lst%% packing%%lst%% placement%%lst%% 
routing ]^[ timing/power analysis%%lst%% as shown in Fig%%per%% 1%%per%%]$~ ~$[The 
inputs to VTR are%%cln%% 1) a description of an FPGA architecture%%lst%% 
]^[ 2) an application benchmark ]f[ implementation in the 
*&+,%%dsh%%%%per%%/)011%%dsh%%,#%%dqt%%2%%per%%%%sqt%%) 
3,+#4,5) 
<%%dsh%%%%dqt%%=%%per%%+%%dqt%%2%%per%%%%sqt%%) 
>?%%sqt%%59&;,;)@)A&#9)B%%dqt%%1) 
6780) 
0+#9,5&#54+&) 
:&;#+,12%%per%%%%sqt%%) 
6,%%dsh%%&) 
VTR permits heterogeneity%%lst%% where columns of blocks may be 
of different types%%scn%% ]f[ example%%lst%% LUT%%dsh%%based soft logic blocks%%lst%% 
DSP blocks%%lst%% ]^[ memories%%per%%]$~ ~$[Within each of these types%%lst%% an 
architect has a wide range of choices%%per%%]$~ ~$[For example%%lst%% with soft 
logic blocks%%lst%% one can vary the # of LUTs/block%%lst%% whether 
the LUTs are fracturable [5] vs%%per%% non%%dsh%%fracturable%%lst%% the richness 
of the internal local crossbar%%lst%% the number of FFs%%lst%% ]^[ ]s[ 
on%%per%%]$~ ~$[VTR also supports the notion of modes%%lst%% which represent 
mutually exclusive ways in which a block may function%%per%%]$~ ~$[For 
example%%lst%% a fracturable LUT may operate in single%%dsh%%output mode 
(implementing a single logic function) ]v[ dual%%dsh%%output mode 
(implementing two logic functions)%%per%% 
!%%dqt%%#$%&&% 
%%sqt%%()% 
7%%dqt%%#$,%%sqt%%/) 
!%%dqt%%#$%&%%sqt%%() 
7%%dsh%%%%dqt%%#&C&%%sqt%%5) 
*+,% 
D%%per%%42%%sqt%%/) 
A,C,%%sqt%%/)@)0+&%%dqt%%)<;2C%%dqt%%2%%per%%%%sqt%%) 
C%%per%%]$~ ~$[Related Work 
E4%%dqt%%%%dsh%%,5?)%%per%%F)D&;4%%dsh%%5;) 
Fig%%per%% 1%%per%%]$~ 
~$[Verilog%%dsh%%to%%dsh%%Routing flow%%per%% 
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
Fig%%per%% 2%%per%%]$~ 
~$[FPGA architectural components%%per%%]$~ 
~$[FPGA%%per%%]$~ ~$[The architectural description is written in humanreadable XML%%lst%% ]^[ through this%%lst%% an architect can specify both 
the interconnect ]^[ logic architecture of the target FPGA%%per%%]$~ 
~$[VTR’s internal CAD algorithms are “generic” in the sense 
that specific architectural details are ]n[ hard%%dsh%%coded into the 
algorithms themselves – the algorithms are designed to do a 
reasonably good job implementing the application benchmark 
in a range of architectures%%per%%]$~ ~$[Note that prior to the current 
work%%lst%% the VTR flow terminated at the routing stage%%scn%% it was ]n[ 
possible to realize a silicon implementation of a VTR%%dsh%%modelled 
architecture%%per%%]$~ ~$[Our work extends VTR to produce synthesizable 
Verilog ]f[ VTR’s in%%dsh%%memory architectural device model%%lst%% as 
well as a bitstream ]f[ the application benchmark implemented 
in the device%%per%%]$~ 
~$[B%%per%%]$~ ~$[FPGA Architecture 
VTR is able to model island%%dsh%%style FPGAs [4]%%lst%% a two 
dimensional array of logic blocks with horizontal ]^[ vertical 
routing channels%%lst%% surrounded by a ring of I/Os%%per%%]$~ ~$[The key 
architectural components necessary to understand this paper 
are shown in Fig%%per%% 2%%per%%]$~ ~$[Switch blocks allow horizontal ]^[ vertical 
routing tracks to be programmably connected with one another%%scn%% 
connection blocks allow logic block pins to connect to adjacent 
routing tracks%%per%%]$~ ~$[Logic blocks generally contain one ]v[ more 
look%%dsh%%up%%dsh%%tables (LUTs) ]^[ flip%%dsh%%flops (FFs)%%lst%% ]^[ an internal 
crossbar ]f[ making local connections%%per%%]$~ 
~$[With respect to routing%%lst%% VTR allows one to change the 
number of tracks per channel%%lst%% wire directionality%%lst%% the wire 
segment lengths ]^[ relative frequency of wires of a given 
length%%lst%% the connectivity between horizontal ]^[ vertical wires%%lst%% 
]^[ the way wires connect to logic block pins%%per%%]$~ ~$[For logic%%lst%% 
Several recent works bear similarity to our own in that 
they propose to synthesize FPGA fabrics targetable by VTR%%per%%]$~ 
~$[Chaudhuri et al%%per%% [6] focuses on embedding a reconfigurable 
FPGA in a system%%dsh%%on%%dsh%%chip (SoC)%%lst%% ]^[ enhance the area ]^[ 
performance through floorplanning [7]%%per%%]$~ ~$[Liu [8] studies the impact of the FPGA architectural parameters on the synthesized 
components of the FPGA%%per%%]$~ ~$[In both of these works%%lst%% there is little 
detail on the issues that arise from using ASIC design tools%%per%%]$~ 
~$[Moreover%%lst%% none of these works show a suite of benchmark 
designs being verified as functional within the synthesized 
fabric%%lst%% nor do they %%cmp%% the synthesized standard cell 
implementation with a commercial FPGA%%per%%]$~ 
~$[In another work%%lst%% Aken’Ova [9] investigated island%%dsh%%style 
FPGAs ]^[ improved area ]^[ delay gap by using “tactical 
cells” [10] ]^[ floorplanning [11]%%per%%]$~ ~$[The author thoroughly 
describes architecture changes ]^[ solutions to overcome ASIC 
design flow problems%%per%%]$~ ~$[However%%lst%% there is little discussion on the 
generation of the architecture ]^[ bitstream%%per%%]$~ 
~$[Other work has focussed on standard cell implementations 
of application%%dsh%%specific FPGA architectures%%per%%]$~ ~$[An early work 
by Phillips ]^[ Hauck [12] synthesized the reconfigurablepipelined datapath (RaPiD) [13] architecture using standard 
cells%%per%%]$~ ~$[The authors observe that customizing the architecture 
]f[ domain%%dsh%%specific applications%%lst%% as well as including some 
FPGA%%dsh%%specific standard cells into the library improves area 
]^[ performance%%per%%]$~ ~$[Kafafi et al%%per%% [14] synthesizes a combinational 
]^[ directional architecture ]^[ reports a large area difference 
relative to a custom%%dsh%%layout design%%per%%]$~ ~$[In work by Wilton et 
al%%per%% [15]%%lst%% the authors synthesize a datapath%%dsh%%oriented FPGA 
fabric with a directional routing architecture%%per%%]$~ ~$[Unlike these 
past works%%lst%% which deal with non%%dsh%%standard FPGA architectures%%lst%% 
we focus on architectures that resemble today’s commercial 
FPGAs ]^[ that are already supported by the VTR framework%%per%%]$~ 
~$[III%%per%%]$~ 
~$[A RCHITECTURE AND B ITSTREAM G ENERATION 
VPR [16] is the portion of the VTR flow that performs 
packing%%lst%% placement ]^[ routing%%per%%]$~ ~$[From the user%%dsh%%supplied architectural description%%lst%% VPR builds an in%%dsh%%memory representation 
of the entire FPGA device%%lst%% including all logic ]^[ interconnect%%per%%]$~ 
~$[The packing%%lst%% placement ]^[ routing steps in VPR implement 
the application benchmark in the in%%dsh%%memory FPGA device 
model%%per%%]$~ ~$[Our synthesizable Verilog generator is built within 
VPR ]^[ executes at the end of the routing step%%per%%]$~ ~$[Essentially%%lst%% 
our generator code “walks” the in%%dsh%%memory device model to 
produce synthesizable Verilog%%lst%% ]^[ likewise%%lst%% by examining 
the application benchmark’s implementation in the device%%lst%% we 
produce a configuration bitstream ]f[ the FPGA%%per%%]$~ ~$[We elaborate 
on these steps below%%per%% 
;5&E8>) 
7%%dqt%%%%sqt%%$84#) 
7%%dqt%%4+68,) 
9+4%%sqt%%:+$) 
!%%dqt%%#$%%%dqt%%&%%sqt%%() 
*%%dqt%%#+,&) 
%%dsh%%34+,+&562) 
C) 
7/;);!<) 
5&E) 
=+$#$4%%dqt%%5>) 
0%%dqt%%&%%dqt%%45$84) 
Fig%%per%% 4%%per%%]$~ 
~$[Fig%%per%% 3%%per%% 
%%per%%/01) 
%%per%%5%4+%%sqt%%);!<) 
D8E%%dqt%%6F+>) 
*%%dqt%%#+,&) 
%%dsh%%%%per%%/012) 
=+$#$4%%dqt%%5>) 
?&+@56+A%%dqt%%)%%sqt%%8&B,:45@8&)%%sqt%%%%dqt%%66#) 
Synthesizable FPGA verification flow%%per%%]$~ 
~$[MUX inference within a logic block%%per%%]$~ 
~$[A%%per%%]$~ ~$[Generating Synthesizable Verilog 
As a first step%%lst%% we hand%%dsh%%wrote Verilog ]f[ two FPGA 
primitives%%cln%% a FF%%lst%% ]^[ a Stratix III%%dsh%%like fracturable LUT (see 
Section V)%%per%%]$~ ~$[Subsequently%%lst%% we automatically generate Verilog 
]f[ the entire FPGA device%%lst%% a structural netlist of these 
primitives%%lst%% as well as other primitives which are generated by 
our generator code%%cln%% multiplexers (MUXs) of any size%%lst%% LUTs 
with any number of inputs%%per%%]$~ ~$[The generation must handle the 
following%%cln%% logic blocks%%lst%% intra%%dsh%%logic block routing%%lst%% inter%%dsh%%logic 
block routing%%lst%% ]^[ configuration cell memory%%per%%]$~ 
~$[Logic Blocks%%cln%% Logic blocks in VPR are represented in 
memory as a tree%%scn%% the tree root represents the entire logic block%%lst%% 
nodes at intermediate levels of the tree represent levels of 
hierarchy in the block%%lst%% ]^[ the leaves represent the primitives 
(LUTs ]^[ FFs)%%per%%]$~ ~$[We generate the Verilog ]f[ each logic block 
by first traversing to the leaf nodes%%per%%]$~ ~$[We %%cmp%% move up the tree 
and%%lst%% as we visit each node in the hierarchy%%lst%% its child nodes 
are defined ]^[ instantiated in the output Verilog%%per%%]$~ ~$[The Verilog 
generated ]f[ a logic block has the same hierarchy specified 
by the architect in the architecture file%%per%%]$~ 
~$[Intra%%dsh%%Logic Block Routing%%cln%% Routing within a logic block is 
stored in memory as a graph%%lst%% where nodes represent pins (on 
primitives ]v[ on intermediate levels of hierarchy) ]^[ directed 
edges represent connections between pins%%per%%]$~ ~$[For a given pin%%lst%% 
%%cmp%% there is more %%cmp%% one incoming edge%%lst%% a routing MUX 
is inferred%%per%%]$~ ~$[The select inputs to the MUX will be driven by 
configuration cells (discussed below)%%per%%]$~ ~$[Fig%%per%% 3 highlights examples of routing MUX inference within a logic block%%per%%]$~ ~$[Crossbars 
with varying degrees of connectivity can be generated%%lst%% since 
VPR only creates edges in its in%%dsh%%memory model ]f[ those 
connections that exist%%per%%]$~ 
~$[Inter%%dsh%%Logic Block Routing%%cln%% Routing that connects the logic 
blocks is likewise represented in memory as a graph%%per%%]$~ ~$[In this 
case%%lst%% the nodes represent the wire segments ]^[ pins%%per%%]$~ ~$[Edges 
represent programmable connections between such conductors%%per%%]$~ 
~$[As above%%lst%% where there exists more %%cmp%% one edge to a node%%lst%% 
MUXs are inferred%%per%%]$~ ~$[These MUXs correspond to the connectivity within switch blocks ]^[ connection blocks (Fig%%per%% 2)%%per%%]$~ ~$[VPR 
does ]n[ model the inter%%dsh%%logic block routing hierarchically 
– there is no notion of switch block ]v[ connection block 
within VPR’s in%%dsh%%memory model%%per%%]$~ ~$[Consequently%%lst%% each MUX is 
instantiated in our Verilog without hierarchy%%per%%]$~ 
~$[Configuration Cells%%cln%% As MUXs that implement programmable connectivity are being instantiated%%lst%% configuration 
cells that drive their select inputs must also be instantiated ]^[ 
attached accordingly%%per%%]$~ ~$[We use “fully encoded” MUXs%%lst%% meaning%%lst%% 
a 4%%dsh%%to%%dsh%%1 MUX will have two configuration bits%%per%%]$~ ~$[Other styles of 
MUX (e%%per%%g%%per%% flattened MUXs that use more configuration cells 
]^[ have fewer levels from input%%dsh%%to%%dsh%%output) are left to consider 
in future work%%per%%]$~ ~$[We use a FF to implement each configuration 
cell%%per%%]$~ ~$[Then%%lst%% the cells are connected in a chain%%lst%% like a shift 
register%%per%%]$~ ~$[Similarly%%lst%% ]f[ the LUTs in logic blocks%%lst%% we instantiate 
configuration cells to hold the LUT’s truth table contents%%per%%]$~ 
~$[B%%per%%]$~ ~$[Bitstream Generation 
The configuration bitstream is an ordered sequence of 
0’s ]^[ 1’s that configures the FPGA according to the implementation of the application benchmark%%per%%]$~ ~$[Since the configuration cells are connected together in a chain%%lst%% the 0/1 
values shifted in ]f[ the benchmark’s implementation must 
align exactly with the ordering of cells in the chain%%per%%]$~ ~$[Thus%%lst%% to 
create the configuration bitstream ]f[ a design%%lst%% our generator 
walks the device model in precisely the same order as is 
used to generate the synthesizable Verilog%%per%%]$~ ~$[The in%%dsh%%memory 
implementation of the benchmark is used to assign 0/1 values 
in the bitstream%%per%%]$~ ~$[For example%%lst%% consider a 4%%dsh%%to%%dsh%%1 interconnect 
MUX whose inputs are numbered 0%%lst%% 1%%lst%% 2%%lst%% 3%%per%%]$~ ~$[The path selected 
through the MUX will be controlled by two configuration 
cells%%per%%]$~ ~$[Assuming that VPR has routed a signal through input 
#1%%lst%% the two configuration cell values in the stream will be 
01%%per%%]$~ ~$[Regarding bitstream generation%%lst%% there were two challenges 
worth highlighting discussed below%%per%%]$~ 
~$[Input ]^[ Output Equivalence%%cln%% VPR supports input ]^[ 
output pin equivalence (essentially “pin swapping”)%%per%%]$~ ~$[This 
means that as we generate the bitstream%%lst%% we have to account 
]f[ any change in the ordering of the inputs ]v[ outputs that may 
have occurred during routing%%per%%]$~ ~$[For example%%lst%% consider a MUX 
within the intra%%dsh%%logic block crossbar%%per%%]$~ ~$[At the packing stage%%lst%% 
VPR may have used the ith input to the MUX ]f[ a logic 
signal%%scn%% however%%lst%% the VPR router may end up instead using the 
j th input ]f[ the signal (e%%per%%g%%per%% ]f[ timing/routability reasons)%%per%%]$~ 
~$[During bitstream generation%%lst%% we account ]f[ such changes by 
examining the routing paths actually used by nets ]^[ do ]n[ 
rely on the packed (pre%%dsh%%routed) netlist%%per%%]$~ 
~$[Fracturable LUTs%%cln%% When LUTs are ]n[ fracturable%%lst%% we 
may assume that unused inputs are grounded ]^[ we configure 
the LUT truth table accordingly%%per%%]$~ ~$[However%%lst%% with fracturable 
LUTs%%lst%% we must account ]f[ inputs that are shared between the 
LUTs%%per%%]$~ ~$[For example%%lst%% fracturable LUTs in Altera commercial 
devices have 8 inputs%%lst%% where two inputs are shared between 
the two LUTs%%per%%]$~ ~$[When one of the shared inputs is used in the 
first LUT%%lst%% ]b[ unused in the second LUT%%lst%% we can no longer 
assume that input to be grounded when we specify the truth 
table ]f[ the second LUT%%per%%]$~ ~$[The truth table ]f[ the second LUT 
must be set in such a way that the unused input is a “don’t 
care”%%cln%% the LUT function must be correct regardless of whether 
the unused input is a 0 ]v[ a 1%%per%%]$~ ~$[This involves replicating the 
truth table contents ]f[ both possible logic states of the unused 
input%%per%%]$~ 
~$[C%%per%%]$~ ~$[Functional Correctness 
Fig%%per%% 4 shows the verification flow%%per%%]$~ ~$[We developed a testbench wherein the original application benchmark RTL is 
simulated in ModelSim with random vectors%%per%%]$~ ~$[Within the same 
testbench%%lst%% the FPGA device RTL%%lst%% configured with the generated bitstream%%lst%% is simulated with the same random vectors%%per%%]$~ 
~$[Output values are checked ]f[ equality with each vector 
applied%%per%%]$~ ~$[Note that this verification flow was used to check 
correctness at all stages of the standard cell implementation%%cln%% 
RTL generated by our VPR generator%%lst%% post%%dsh%%technology mapping with Synopsys (discussed below)%%lst%% ]^[ post%%dsh%%layout with 
Cadence (also discussed below)%%per%%]$~ 
~$[D%%per%%]$~ ~$[Supported Architectures 
Presently%%lst%% our tool is able to generate synthesizable Verilog 
]f[ FPGAs comprised of LUT/FF%%dsh%%based logic blocks%%lst%% interconnect ]^[ I/Os%%per%%]$~ ~$[Support ]f[ other types of blocks%%lst%% such as 
DSP ]v[ RAM blocks%%lst%% is left as future work%%per%%]$~ ~$[We support LUTs 
that are either fracturable ]v[ non%%dsh%%fracturable%%per%%]$~ ~$[In fact%%lst%% LUT 
fracturability is the only form of VTR “modes” supported by 
our tool%%per%%]$~ ~$[The modes feature in VTR allows an architect to describe mutually exclusive functionality ]f[ a given block%%per%%]$~ ~$[The 
specification of modes does ]n[ contain information regarding 
how such functionality should be implemented in hardware%%lst%% 
nor is it obvious how it could be inferred automatically by a 
tool such as ours%%per%%]$~ 
~$[Aside from these limitations%%lst%% our tool supports Verilog/bitstream generation ]f[ all VTR%%dsh%%targetable architectures 
– made possible by the approach described above%%lst%% which 
walks VTR’s in%%dsh%%memory device model%%per%%]$~ ~$[For example%%lst%% we 
are able to handle%%cln%% any # of LUTs/logic block%%lst%% any switch 
block/connection block connectivity%%lst%% wire segments of various 
lengths%%lst%% fully ]v[ partially populated crossbars within logic 
blocks%%per%%]$~ 
~$[IV%%per%%]$~ 
~$[S TANDARD C ELL ASIC I MPLEMENTATION 
We use an ASIC design flow to synthesize%%lst%% place%%lst%% route%%lst%% 
]^[ analyze the circuit%%lst%% as summarized in Fig%%per%% 5%%per%%]$~ ~$[We used 
Synopsys Design Compiler to synthesize the FPGA to standard 
cells%%per%%]$~ ~$[Cadence Encounter is used ]f[ placement ]^[ routing%%per%%]$~ 
~$[Synopsys PrimeTime is used ]f[ timing analysis%%per%%]$~ 
~$[A%%per%%]$~ ~$[Synthesis to Standard Cells 
We evaluated several different synthesis strategies%%cln%% topdown%%lst%% “uniquify”%%lst%% ]v[ bottom%%dsh%%up%%per%%]$~ ~$[The top%%dsh%%down method is a 
push%%dsh%%button approach where there entire design is synthesized 
in “one shot”%%per%%]$~ ~$[However%%lst%% since it processes the whole design at 
once%%lst%% it is too run%%dsh%%time ]^[ memory intensive to be a viable 
approach ]f[ a large design%%per%%]$~ ~$[In fact%%lst%% ]f[ a 20 × 20 FPGA with 
300 tracks per channel%%lst%% Design Compiler could ]n[ successfully synthesize using the top%%dsh%%down approach%%per%%]$~ ~$[The uniquify 
approach allows one to break up the design ]^[ compile 
each instance separately%%per%%]$~ ~$[This approach worked%%lst%% however%%lst%% it is 
again run%%dsh%%time intensive%%lst%% as each instance of the same Verilog 
module (e%%per%%g%%per%% a 6%%dsh%%LUT) is compiled individually%%per%%]$~ ~$[We %%cmp%% 
chose the bottom%%dsh%%up approach%%lst%% in which each required Verilog 
module is synthesized just once%%lst%% ]^[ the synthesized instances 
are stitched together to compose the overall synthesized design%%per%%]$~ 
~$[While the bottom%%dsh%%up method produces a more regular 
implementation ]^[ brings run%%dsh%%time benefits%%lst%% its weakness is 
that each type of module is synthesized in isolation%%scn%% i%%per%%e%%per%% outside 
of the context of the other modules it connects to when 
instantiated in the overall FPGA%%per%%]$~ ~$[For example%%lst%% consider that 
]f[ a length%%dsh%%16 wire%%lst%% it may be truncated at the edge of the 
FPGA%%lst%% depending on the location from which it is driven%%per%%]$~ 
~$[Length%%dsh%%16 wires truncated at different points will all exhibit 
different load capacitances%%lst%% ]^[ it is undesirable to synthesize 
a separate/different driver to be used ]f[ each variant of 
Fig%%per%% 5%%per%%]$~ 
~$[ASIC design flow%%per%% 
truncated length%%dsh%%16 wire%%per%%]$~ ~$[Thus%%lst%% to handle these issues that arise 
from routing MUXs driving various%%dsh%%length wires%%lst%% we did the 
following%%cln%% 1) we synthesize a single MUX of each size%%scn%% 2) 
we insert a fixed%%dsh%%size buffer1 on the output of each MUX to 
create a consistent load on the MUX output%%scn%% ]^[ 3) we insert a 
fixed%%dsh%%size buffer every 2 tiles on inter%%dsh%%logic block interconnect 
wires%%lst%% ensuring a roughly uniform load ]f[ each buffer%%per%%]$~ 
~$[Design Compiler accepts area ]^[ timing constraints%%lst%% 
permitting one to trade%%dsh%%off performance vs%%per%% area ]f[ a single RTL design by changing constraints%%per%%]$~ ~$[In our experimental study (Section V)%%lst%% we have synthesized area%%dsh%%optimized%%lst%% 
timing%%dsh%%optimized ]^[ balanced FPGAs%%per%%]$~ ~$[Optimizing ]f[ area is 
straightforward%%cln%% we direct Design Compiler to achieve a target 
area of 0%%per%%]$~ ~$[Optimizing ]f[ timing is more involved%%lst%% owing to 
the fact that FPGAs contain many combinational loops before 
being programmed%%per%%]$~ ~$[Such loops are problematic ]f[ timing 
analysis%%lst%% ]^[ they must be “broken” prior to timing%%dsh%%constrained 
synthesis%%per%%]$~ ~$[The loops exist within both inter%%dsh%% ]^[ intra%%dsh%%logic 
block routing%%lst%% ]^[ combinations of these%%per%%]$~ ~$[Fig%%per%% 6 ]^[ Fig%%per%% 7 
show examples of combinational loops ]^[ how we break 
such loops (via generated constraints provided to Synopsys)%%per%%]$~ ~$[In 
essence%%lst%% after breaking such loops ]^[ by using the bottom%%dsh%%up 
synthesis approach%%lst%% we are able to produce a timing%%dsh%%optimized 
implementation of each module%%scn%% however%%lst%% all possible timing 
paths through the overall FPGA (i%%per%%e%%per%% across modules) are ]n[ 
optimized globally%%per%%]$~ ~$[Nevertheless%%lst%% results in the next section 
demonstrate significantly improved performance in the timingoptimized implementations%%per%%]$~ ~$[Note that timing constraints are 
only applied to paths through which logic signals may propagate in an application implementation%%per%%]$~ ~$[We do ]n[ apply timing 
constraints to the configuration cells%%lst%% ]v[ paths to/from such 
cells%%per%%]$~ ~$[The content of such cells only changes when the device 
is configured%%scn%% %%cmp%%%%lst%% they are ]n[ performance critical%%per%%]$~ 
~$[B%%per%%]$~ ~$[Place ]^[ Route 
Placement ]^[ routing proceeds in a flat manner%%lst%% allowing 
optimization across the module boundaries%%per%%]$~ ~$[To help the placer%%lst%% 
we guide our design using floorplanning%%per%%]$~ ~$[By default%%lst%% we set 
floorplanning constraints assuming a chip aspect ratio of 1 
(square die) ]^[ 85% utilization (as Kuon ]^[ Rose discussed [17])%%per%%]$~ ~$[Note that total cell area is known after synthesis 
to standard cells%%lst%% making it possible to define a die size with 
any given utilization ratio%%per%% 
1 The Cadence Encounter router also has capabilities ]f[ automatic buffer 
insertion (command optDesign)%%lst%% however%%lst%% %%cmp%% of the size of the design 
being placed ]^[ routed%%lst%% the router%%dsh%%based buffer insertion repeatedly crashed 
on our server%%per%%]$~ ~$[We %%cmp%% opted to insert buffers during synthesis%%per%%]$~ 
~$[Fig%%per%% 8%%per%%]$~ 
~$[Fig%%per%% 6%%per%%]$~ 
~$[Combinational loop in inter%%dsh%%logic block routing%%per%%]$~ 
~$[Fig%%per%% 7%%per%%]$~ 
~$[Combinational loop in logic block%%per%%]$~ 
~$[We found that floorplanning was mandatory to ensure that 
the physical layout of logic ]^[ routing tiles%%lst%% in terms of 
ordering in the horizontal ]^[ vertical dimensions%%lst%% matched 
with that assumed by VPR%%per%%]$~ ~$[Without this%%lst%% Encounter produced 
layouts where%%lst%% ]f[ example%%lst%% logic blocks that VPR saw as 
adjacent%%lst%% were actually placed far apart in the layout%%per%%]$~ ~$[Fig%%per%% 8 
is an example of how configuration cells will drift towards 
each other due to their connectivity ]^[ how two logic blocks 
that are intended to be adjacent to one another can get 
separated%%per%%]$~ ~$[For floorplanning the individual modules%%lst%% we evenly 
divide up the chip ]^[ constrain our logic blocks ]^[ the 
connection MUXs connected to these logic blocks in the 
appropriate areas%%per%%]$~ ~$[On top of this grid%%lst%% we overlay another 
grid to floorplan the switch MUXs in the appropriate areas%%per%%]$~ 
~$[The Cadence placer allows one to control the rigidity of the 
floorplanning constraints%%lst%% specifically%%lst%% whether cells are allow 
to enter/exit each floorplanning region%%per%%]$~ ~$[We set this to the most 
flexible scheme possible%%lst%% where the floorplanning constraints 
are used as a guide to the placer%%lst%% ]b[ cells may exit/enter the 
specified regions%%per%%]$~ ~$[All of the floorplanning TCL commands are 
automatically generated at the same time Verilog description 
of the FPGA is generated%%per%%]$~ 
~$[Once the designs have been placed ]^[ routed%%lst%% parasitic 
capacitances are extracted ]f[ use by PrimeTime to obtain accurate post%%dsh%%layout timing analysis%%per%%]$~ ~$[Also%%lst%% at this point%%lst%% a GDSII 
file can be written that contains all the mask information%%per%%]$~ 
~$[C%%per%%]$~ ~$[Timing Analysis 
Synopsys PrimeTime is used ]f[ post%%dsh%%layout timing analysis of%%cln%% 1) specific paths within the implementation%%lst%% ]v[ 2) 
Floorplanned (left) ]^[ unfloorplanned (right) layouts%%per%% 
an application benchmark programmed on the FPGA%%per%%]$~ ~$[PrimeTime accepts as input the design%%lst%% annotated with parasitic 
capacitance information%%lst%% as well as an SDC (Synopsys design 
constraints) file%%per%%]$~ ~$[The SDC file specifies which timing paths 
should be ignored%%per%%]$~ ~$[For 1)%%lst%% we ignore all paths ]b[ the specific 
paths we wish to analyze (see next section) ]^[ run timing 
analysis to obtain their delay%%per%%]$~ ~$[For 2) finding the critical path of 
an application benchmark implemented within the fabric%%lst%% the 
process is more involved%%per%%]$~ ~$[Commercial FPGA vendors provide 
static timing analysis tools that analyze the performance ]f[ 
user designs implemented in their FPGAs%%lst%% using delay models 
of the underlying fabric%%per%%]$~ ~$[To mimic the behavior of such 
tools ]f[ an application implemented within our synthesized 
fabric%%lst%% we devised the following approach%%cln%% during bitstream 
generation (Section III%%dsh%%B)%%lst%% we have precise knowledge about 
which FPGA resources are used vs%%per%% unused%%per%%]$~ ~$[For each unused 
resource%%lst%% we automatically generate an SDC constraint to 
disable timing analysis through the resource%%per%%]$~ ~$[When PrimeTime 
is invoked to analyze performance of the FPGA device configured with the application bitstream%%lst%% PrimeTime “sees” only 
those paths in the used part of the FPGA (which should be 
free of combinational loops%%lst%% assuming well%%dsh%%designed circuits)%%per%%]$~ 
~$[The critical path reported by PrimeTime is %%cmp%% analogous to 
that reported by the timing analysis tools of commercial FPGA 
vendors%%per%%]$~ ~$[It is important to note that once the FPGA device has 
been synthesized%%lst%% placed ]^[ routed%%lst%% timing analysis can be 
done ]f[ any application benchmark by providing PrimeTime 
with the bitstream ]^[ SDC file ]f[ that benchmark%%per%%]$~ ~$[Meaning%%lst%% 
it is ]n[ necessary to synthesize%%lst%% place ]^[ route the FPGA 
device on an individual benchmark%%dsh%%by%%dsh%%benchmark basis%%per%%]$~ 
~$[A challenge we had to deal with regarding PrimeTime arose 
due to our bottom%%dsh%%up synthesis strategy ]^[ the delay model of 
the standard cells%%per%%]$~ ~$[PrimeTime reported warnings (RC%%dsh%%009) that 
in some cases%%lst%% timing results may be inaccurate as cell drive 
resistance was too small in comparison with the impedance 
of the driven network%%per%%]$~ ~$[Recall that in the bottom%%dsh%%up synthesis 
style%%lst%% in some cases%%lst%% Synopsys technology mapping must select 
cells of a certain size without global context/knowledge of the 
total RC load driven by such cells%%per%%]$~ ~$[This mainly occurred ]f[ 
large cells driving long interconnect wires%%lst%% ]^[ we were able 
to eliminate all warnings through the buffer insertion discussed 
previously%%per%%]$~ 
~$[V%%per%%]$~ 
~$[E XPERIMENTAL S TUDY 
Table I summarizes the parameters of the FPGA architecture we synthesized into commercial TSMC 65nm standard cells%%per%%]$~ ~$[The architecture is designed to resemble Altera’s 
Stratix III FPGA%%lst%% which is also fabricated in TSMC’s 65nm 
process%%lst%% allowing us to make a (roughly) apples%%dsh%%to%%dsh%%apples 
comparison%%per%%]$~ ~$[The architectural parameters are from a recently 
Parameters 
FPGA dimensions 
K%%lst%% LUT size 
N%%lst%% # of LUTs/logic block 
Crossbar connectivity 
L%%lst%% Wire length 
W%%lst%% Channel width 
F cin Input connectivity 
F cout Output connectivity 
TABLE I%%per%%]$~ 
~$[Values 
20 x 20 
6 
10 
50% 
4 (87%)%%lst%% 16 (13%) 
300 
0%%per%%055 
0%%per%%1 
FPGA A RCHITECTURE PARAMETERS %%per%% 
published Stratix IV architecture capture by Murray et al%%per%% [18]%%lst%% 
where authors attempted to model Stratix IV within VTR2 %%per%%]$~ 
~$[Our synthesized FPGA has dimensions of 20 × 20 logic 
blocks%%lst%% with 10 fracturable LUTs/block%%per%%]$~ ~$[There are 300 routing 
tracks/channel%%lst%% where 87% of tracks span 4 tiles%%lst%% ]^[ 13% span 
16 tiles%%per%%]$~ ~$[F cin /F cout refer to the fraction of adjacent tracks a 
logic block input/output pin may programmably connect to%%per%%]$~ 
~$[Within the logic block%%lst%% the crossbar is 50% populated%%per%%]$~ ~$[We 
are using fracturable 6%%dsh%%LUTs with 8 inputs%%lst%% which implies 2shared inputs in dual%%dsh%%output mode%%lst%% similar to the extensive 
architecture described in [19]%%per%%]$~ ~$[Such LUTs can implement any 
single function of up to 6 variables%%lst%% ]v[ any two functions that 
together%%lst%% use no more %%cmp%% 8 unique variables%%per%%]$~ ~$[We reinforce 
that although in this study we focus on a particular synthesized 
fabric comparable with Stratix III%%lst%% our generator is able to 
automatically produce RTL ]f[ a variety of VTR%%dsh%%supported 
architectures%%per%%]$~ 
~$[We synthesized three variants of the architecture described 
above%%cln%% area%%dsh%%optimized%%lst%% timing%%dsh%%optimized ]^[ balanced%%per%%]$~ ~$[For 
area%%dsh%%optimized%%lst%% we directed Synopsys to minimize area ]^[ 
imposed no timing constraints%%per%%]$~ ~$[For the timing%%dsh%%optimized%%lst%% we 
conversely directed Synopsys to minimize delay%%lst%% ]^[ imposed 
no area constraints%%per%%]$~ ~$[For the balanced%%lst%% we took the mid%%dsh%%point 
of the achieved delays between the area ]^[ timing%%dsh%%optimized 
]^[ set these as the target delays ]f[ Synopsys%%per%%]$~ ~$[Fig%%per%% 9 shows 
one of the synthesized FPGA fabric layouts%%per%%]$~ 
~$[In a first set of experiments%%lst%% we examine the area ]^[ 
performance (of specific paths) of the synthesized FPGA 
]^[ %%cmp%% with analogous area ]^[ performance data ]f[ 
Stratix III%%per%%]$~ ~$[This first set of experiments is thus agnostic to 
any particular application design being implemented within 
the fabric – it is a fabric%%dsh%%to%%dsh%%fabric comparison%%per%%]$~ ~$[In a second set 
of experiments%%lst%% we %%cmp%% the performance of application 
benchmark designs implemented on our fabric to those same 
designs implemented on Stratix III%%per%%]$~ 
~$[We consider various combinational ]^[ sequential benchmarks from the MCNC benchmark suite [20]%%per%%]$~ ~$[Since we are 
using the full VTR flow%%lst%% we omitted some designs from 
the 20 largest MCNC benchmarks where VTR swept away 
unconnected nodes (as these circuits caused problems ]f[ our 
verification flow which relied on I/O matching)%%per%%]$~ ~$[In addition to 
the MCNC circuits%%lst%% we added a finite state machine (FSM) that 
detects a pattern%%lst%% ]^[ also an adder connected to a shift register%%per%%]$~ 
~$[These latter two circuits were used mainly ]f[ debugging 
purposes%%per%%]$~ ~$[We use the MCNC circuits in this initial study%%lst%% 
as these can be simulated with random vectors ]^[ verified 
with the flow in Fig%%per%% 4%%per%%]$~ ~$[Other benchmark suites%%lst%% such as the 
VTR suite%%lst%% contain DSP blocks ]^[ RAMs%%lst%% ]^[ are more 
challenging to simulate/verify%%lst%% owing to the circuits having 
reset/control inputs%%per%% 
2 While Stratix IV is on a more advanced process %%cmp%% Stratix III%%lst%% the soft 
logic block ]^[ routing architectures are similar%%per%%]$~ 
~$[Fig%%per%% 9%%per%%]$~ 
~$[Synthesized FPGA%%per%%]$~ 
~$[A%%per%%]$~ ~$[Area Analysis 
We %%cmp%% the tile area of our synthesized FPGA to 
Altera’s Stratix III%%per%%]$~ ~$[The tile area of our FPGA was obtained 
by dividing total die area by the number of logic blocks 
(20 × 20 = 400)%%per%%]$~ ~$[Table II summarizes the tile area of the 
three architectures%%per%%]$~ ~$[Stratix III LAB tile area is reported to be 
0%%per%%0221mm2 by [21]%%per%%]$~ ~$[The area%%dsh%%optimized fabric resulted in the 
smallest tile area of 0%%per%%0316mm2 %%lst%% which is 1%%per%%5× bigger %%cmp%% 
Stratix III%%per%%]$~ ~$[As expected%%lst%% the timing%%dsh%%optimized ]^[ balanced 
fabrics were larger%%cln%% 2%%per%%9× ]^[ 1%%per%%9× bigger %%cmp%% Stratix III%%lst%% respectively%%per%%]$~ ~$[We were encouraged by the area of the synthesized 
fabrics%%lst%% especially the area%%dsh%%optimized%%lst%% which is relatively close 
to Stratix III%%per%%]$~ 
~$[A number of factors contribute to the area difference 
vs%%per%%]$~ ~$[Stratix III%%per%%]$~ ~$[First%%lst%% there are architectural differences%%per%%]$~ ~$[For 
example%%lst%% our architecture does ]n[ support carry%%dsh%%chains nor 
are our MUXs fully%%dsh%%decoded%%per%%]$~ ~$[Second%%lst%% our implementation uses 
only those standard cells in the TSMC library%%per%%]$~ ~$[In commercial 
FPGAs%%lst%% pass%%dsh%%transistors ]v[ transmission gates are commonly 
used to implement MUXs ]^[ LUTs%%scn%% however%%lst%% we use full 
CMOS implementations of these primitives%%per%%]$~ ~$[Likewise%%lst%% we are 
also using FFs ]f[ the configuration cells rather %%cmp%% SRAM 
cells (as we expect is done in a commercial device)%%per%%]$~ ~$[Perhaps 
most importantly%%lst%% the Stratix III LAB is custom laid%%dsh%%out%%per%%]$~ 
~$[Delving further into the area results%%lst%% Fig%%per%% 10 shows the 
breakdown of area into logic%%lst%% inter%%dsh%% ]^[ intra%%dsh%%logic block routing%%lst%% ]^[ configuration ]f[ each fabric type%%per%%]$~ ~$[In area%%dsh%%optimized 
design%%lst%% configuration cells built of costly FFs in our case%%lst%% 
occupy a large portion of the area%%cln%% 42% of the total%%per%%]$~ ~$[It is 
likewise ]n[ surprising that routing comprises 50% of the fabric 
area%%lst%% since we are using standard cell%%dsh%%based MUXs%%lst%% instead of 
pass%%dsh%%transistor%%dsh%%style MUXs%%per%%]$~ 
~$[In the timing%%dsh%%optimized FPGA fabric%%lst%% we observe that 
configuration cells are reduced to 21% of the total area%%per%%]$~ ~$[This 
is %%cmp%% the configuration area is kept constant by applying 
no timing constraints to the configuration cells (they are ]n[ 
performance critical)%%per%%]$~ ~$[Routing area has increased to 67% of the 
area ]^[ logic area increased to 13%%%per%%]$~ ~$[Remember that in the 
timing%%dsh%%optimized fabric%%lst%% we inserted extra buffers on the interlogic block wires%%per%%]$~ ~$[However%%lst%% buffer area is ]n[ appreciable%%cln%% 2% 
of the total%%per%%]$~ 
~$[FPGA Fabric 
Area%%dsh%%Optimized 
Timing%%dsh%%Optimized 
Balanced 
TABLE II%%per%% 
# of Std%%per%%]$~ 
~$[Cells 
3,577,520 
7,521,616 
5,298,588 
Total Area 
(mm2 ) 
12%%per%%65 
25%%per%%72 
16%%per%%89 
Tile Area 
(mm2 ) 
0%%per%%0316 
0%%per%%0643 
0%%per%%0422 
FPGA Fabric 
Area%%dsh%%Optimized 
Timing%%dsh%%Optimized 
Balanced 
Stratix III 
TABLE III%%per%%]$~ 
~$[A REA OF SYNTHESIZED FPGA%%per%%]$~ 
~$[Fig%%per%% 11%%per%%]$~ 
~$[Fig%%per%% 10%%per%%]$~ 
~$[Area breakdown%%per%%]$~ 
~$[In the balanced FPGA fabric%%lst%% both timing ]^[ area constraints were applied%%lst%% however%%lst%% we give a more relaxed timing 
constraint to the routing circuitry to save area%%per%%]$~ ~$[This leads to 
logic taking up 31% (logic + config ]f[ logic) ]^[ routing 
taking up 69% (routing + config ]f[ routing + buffers) of the 
total area%%per%%]$~ ~$[Note that in the balanced fabric%%lst%% we keep the LUTs 
timing constraint aggressive%%lst%% since the LUT takes up a small 
portion of the total area%%per%%]$~ 
~$[B%%per%%]$~ ~$[Timing Analysis 
We first examine the delay of commonly%%dsh%%used paths in 
the synthesized fabrics ]^[ Stratix III (application%%dsh%%agnostic 
analysis)%%per%%]$~ ~$[Specifically%%lst%% we looked at the following three paths%%cln%% 
1) 
2) 
3) 
L0 %%cln%% FF → crossbar → LUT → FF (within a logic 
block)%%per%%]$~ 
~$[L4 %%cln%% FF → length%%dsh%%4 wire → crossbar → LUT → FF 
(a path of length 4)%%per%%]$~ 
~$[L16 %%cln%% FF → length%%dsh%%16 wire → crossbar → LUT → 
FF (a path of length 16)%%per%%]$~ 
~$[Table III is a summary of average delay of these paths 
in 6 different areas of the FPGAs (in the four corners of 
the fabric%%lst%% ]^[ also on the middle of the left/right sides)%%per%%]$~ 
~$[In the synthesized fabrics%%lst%% we manually selected the 6 paths 
by creating an SDC file that reports the delay ]f[ each%%per%%]$~ ~$[In 
doing so%%lst%% we are assured that our analysis reflects the use 
of a length%%dsh%%4 ]v[ length%%dsh%%16 wire%%lst%% accordingly%%per%%]$~ ~$[For the Altera 
Stratix III delays%%lst%% we use Altera’s LogicLock feature to place 
two connected flip%%dsh%%flops 4 ]v[ 16 logic blocks away from one 
another%%lst%% ]^[ %%cmp%% use Altera’s TimeQuest tool ascertain the 
path delay%%per%%]$~ ~$[For our fabrics%%lst%% within the logic blocks%%lst%% we apply 
an SDC constraint ]s[ that we measure the path corresponding 
to the fastest LUT input%%scn%% this is to be comparable to Altera%%lst%% 
L0 (ns) 
3%%per%%71 
1%%per%%79 
1%%per%%34 
0%%per%%73 
L4 (ns) 
7%%per%%38 
2%%per%%90 
3%%per%%73 
1%%per%%03 
L16 (ns) 
17%%per%%31 
4%%per%%92 
7%%per%%32 
1%%per%%54 
A RCHITECTURE D ELAY%%per%%]$~ 
~$[Delay breakdown%%per%% 
since Quartus uses the input that results in the smallest delay%%per%%]$~ 
~$[Note that ]f[ the timing results in this paper%%lst%% we use the slowest 
speedgrade ]f[ Stratix III%%lst%% ]^[ %%cmp%% with slowest%%dsh%%processcorner analysis ]f[ our fabric%%per%%]$~ 
~$[Comparing our timing%%dsh%%optimized implementation to 
Stratix III%%lst%% the delay is 2%%per%%3× to 3%%per%%5× slower%%lst%% with the gap 
being larger ]f[ longer wire lengths%%per%%]$~ ~$[The balanced fabric is 
1%%per%%8× to 4%%per%%7× slower%%lst%% ]^[ the area%%dsh%%optimized fabric is 5× to 
11%%per%%2× slower %%cmp%% Stratix III%%per%%]$~ ~$[We believe the reason that the 
delay gap vs%%per%%]$~ ~$[Stratix III grows with wire length is related to 
the difficulty in handling long wires in the ASIC toolflow%%per%%]$~ 
~$[The relative results between the synthesized fabrics are as 
expected%%cln%% the area%%dsh%%optimized fabric is overall slower %%cmp%% the 
balanced design%%lst%% ]^[ the balanced design is slower %%cmp%% the 
timing%%dsh%%optimized fabric%%lst%% except ]f[ the L0 path%%per%%]$~ ~$[L0 reflects 
timing within a logic block%%scn%% the inter%%dsh%%logic block routing 
MUXs are ]n[ included in the delay%%per%%]$~ ~$[The slightly lower delay 
in the balanced design may be due to the heuristic nature of 
ASIC mapping%%lst%% placement%%lst%% ]^[ routing tools%%per%%]$~ ~$[It may also be 
%%cmp%% in our fabric (unlike Stratix III)%%lst%% one MUX drives 
the output of a logic block to both feedback ]^[ inter%%dsh%%logic 
block routing paths%%per%%]$~ ~$[That output MUX is timing optimized in 
our balanced fabric implementation%%lst%% ]y[ it sees a smaller load 
%%cmp%% in the timing%%dsh%%optimized fabric implementation%%per%%]$~ ~$[Similar 
to the area analysis%%lst%% Fig%%per%% 11 shows a delay breakdown ]f[ 
the three types of paths ]f[ all architectures%%per%%]$~ ~$[The L4 ]^[ L16 
fabric delays are dominated by routing delay%%per%%]$~ ~$[This confirms 
that we need to use optimizations such as buffering to reduce 
the routing delay%%per%%]$~ 
~$[In the second part of the performance study%%lst%% we looked 
at how benchmark circuits perform on the synthesized FPGA 
vs%%per%%]$~ ~$[Stratix III%%per%%]$~ ~$[The same Verilog file is passed to each tool 
]f[ implementing the circuits on the FPGAs%%per%%]$~ ~$[We use the SDC 
file generated with the bitstream to “program” our synthesized 
FPGA as discussed in Section IV%%dsh%%C%%per%%]$~ ~$[Note that the results of 
this experiment are ]n[ solely reflective of the fabric speed%%lst%% ]b[ 
also of the differences in architectures%%lst%% ]^[ in the CAD tools 
supporting the architectures%%cln%% open%%dsh%%source VTR vs%%per%%]$~ ~$[Altera’s 
Benchmark 
Circuits 
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
Geo%%per%%]$~ ~$[Mean 
TABLE IV%%per%%]$~ 
~$[AreaOptimized 
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
TimingOptimized 
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
Balanced 
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
Stratix 
III 
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
Altera’s%%lst%% especially considering Stratix III is custom laid%%dsh%%out 
]^[ undoubtedly highly optimized%%per%%]$~ ~$[To our knowledge%%lst%% this 
work represents the first comparison of a standard cell FPGA 
implementation to a commercial FPGA%%per%%]$~ ~$[The proposed VTRbased synthesizable FPGA generator opens the door to actual 
silicon implementation of FPGAs targetable by an established 
CAD tool%%per%%]$~ 
~$[In the future%%lst%% we would like to assess power consumption%%lst%% 
]^[ extend architecture ]^[ bitstream generation to accept 
all architectures supported by VTR%%lst%% including those with 
DSP blocks ]^[ memories%%per%%]$~ ~$[Further work is also needed to 
support designs with multiple clocks%%per%%]$~ ~$[Finally%%lst%% we would like 
to explore the utility of adding custom library cells that are 
specifically tailored ]f[ FPGAs%%lst%% particularly ]f[ efficient MUX 
]^[ configuration cell implementations%%per%%]$~ 
~$[R EFERENCES 
[1] 
[2] 
C RITICAL PATH D ELAY (nS ) OF D ESIGNS ON FPGA%%per%% 
[3] 
Quartus II%%per%%]$~ ~$[Table IV lists the critical path delays reported by 
the tools%%per%%]$~ ~$[The reported critical path delays do ]n[ include clock 
skew nor I/O cell delays (only core logic ]^[ routing)%%per%%]$~ 
~$[In combinational designs (top part of table)%%lst%% both designs 
were given input%%dsh%%to%%dsh%%output delay constraints%%per%%]$~ ~$[On average%%lst%% there 
is a ∼3%%per%%8× increase in delay between the timing%%dsh%%optimized 
]^[ Stratix III FPGAs (see geo%%per%% mean row at bottom of 
table)%%per%%]$~ ~$[The delay gap between the two FPGAs increased 
from our architecture delay study above%%lst%% likely due to the 
weaknesses of the open%%dsh%%source VTR flow vs%%per%%]$~ ~$[Quartus II%%per%%]$~ ~$[In 
the sequential designs (bottom part of table)%%lst%% the critical path 
delays reported include register%%dsh%%to%%dsh%%register ]^[ I/O paths%%per%%]$~ ~$[Most 
circuits show similar increase in delay as the combinational 
designs%%scn%% however%%lst%% the dsip ]^[ fsm benchmarks showed smaller 
increases of 1%%per%%5× to 2×%%per%%]$~ ~$[The critical paths of these circuits 
have fewer logic levels %%cmp%%d to the other designs%%per%%]$~ 
~$[It is worthwhile to mention that one of the key advantages 
of a synthesizable FPGA fabric that is it permits the type of 
exploration done here%%cln%% the ability to realize fabrics with different area/delay trade%%dsh%%offs from a single RTL source%%lst%% simply 
by changing constraints provided to the ASIC tools%%per%%]$~ ~$[Such an 
exploration is highly costly %%cmp%% manual layout is required ]f[ 
each fabric%%per%% 
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
VI%%per%%]$~ 
~$[C ONCLUSIONS AND F UTURE W ORK 
In this work%%lst%% we propose to automatically generate synthesizable FPGA fabrics within the open%%dsh%%source FPGA CAD 
tool%%lst%% VTR%%per%%]$~ ~$[The fabrics we generate are %%cmp%% synthesized%%lst%% 
placed ]^[ routed using a standard ASIC design flow into a 
commercial standard cell library%%per%%]$~ ~$[We synthesized 3 variants 
of an FPGA fabric (modelled on Altera’s Stratix III) into 
65nm TSMC standard cells%%cln%% timing%%dsh%%optimized%%lst%% area%%dsh%%optimized%%lst%% 
]^[ balanced%%per%%]$~ ~$[We %%cmp%%d the tile area of our smallest 
FPGA fabric (area%%dsh%%optimized) with Altera’s Stratix III ]^[ 
found our fabric used 1%%per%%5× more area%%per%%]$~ ~$[Our timing%%dsh%%optimized 
fabric required 3× more area %%cmp%% Stratix III%%per%%]$~ ~$[With respect 
to performance%%lst%% the critical paths of designs implemented in 
our timing%%dsh%%optimized fabric are ∼3%%per%%8× longer%%lst%% on average%%lst%% 
%%cmp%% in Stratix III%%scn%% however%%lst%% in some benchmarks the delay 
gap was as low as 1%%per%%5×%%per%%]$~ ~$[Overall%%lst%% we are encouraged by 
the silicon area ]^[ performance of our fabric relative to 
[15] 
[16] 
[17] 
[18] 
[19] 
[20] 
[21] 
J%%per%%]$~ ~$[Rose et al%%per%%%%lst%% “The VTR Project%%cln%% Architecture ]^[ CAD ]f[ FPGAs 
from Verilog to Routing,” in FPGA%%per%%]$~ ~$[ACM%%lst%% pp%%per%% 77–86%%per%%]$~ 
~$[E%%per%%]$~ ~$[Fluhr et al%%per%%%%lst%% “Power8%%cln%% A 12%%dsh%%core server%%dsh%%class processor in 22nm SOI 
with 7%%per%%6tb/s off%%dsh%%chip bandwidth,” in ISSCC%%per%%]$~ ~$[IEEE%%lst%% 2014%%lst%% pp%%per%% 96–97%%per%%]$~ 
~$[W%%per%%]$~ ~$[Deng et al%%per%%%%lst%% “A Fully Synthesizable All%%dsh%%Digital PLL With Interpolative Phase Coupled Oscillator%%lst%% Current%%dsh%%Output DAC%%lst%% ]^[ FineResolution Digital Varactor Using Gated Edge Injection Technique,” 
JSSC%%lst%% vol%%per%% 50%%lst%% no%%per%% 1%%lst%% pp%%per%% 68–80%%lst%% Jan 2015%%per%%]$~ 
~$[V%%per%%]$~ ~$[Betz et al%%per%%%%lst%% Architecture ]^[ CAD ]f[ Deep%%dsh%%Submicron FPGAs%%per%%]$~ 
~$[Kluwer Academic Publishers%%lst%% 1999%%per%% 
“Stratix III ALM Logic Structure’s 8%%dsh%%Input Fracturable 
LUT,” Altera Corp%%per%%%%lst%% Tech%%per%%]$~ ~$[Rep%%per%%%%lst%% 2015%%per%% [Online]%%per%%]$~ ~$[Available%%cln%% 
https://www%%per%%altera%%per%%com/products/fpga/features/st3%%dsh%%logic%%dsh%%structure%%per%%html 
S%%per%%]$~ ~$[Chaudhuri et al%%per%%%%lst%% “An 8x8 run%%dsh%%time reconfigurable FPGA embedded 
in a SoC,” in DAC%%per%%]$~ ~$[ACM/IEEE%%lst%% 2008%%lst%% pp%%per%% 120–125%%per%% 
——%%lst%% “Efficient modeling ]^[ floorplanning of embedded%%dsh%%FPGA fabric,” in FPL%%per%%]$~ ~$[IEEE%%lst%% 2007%%lst%% pp%%per%% 665–669%%per%%]$~ 
~$[H%%per%%]$~ ~$[J%%per%%]$~ ~$[Liu%%lst%% “Archipelago – An Open Source FPGA with Toolflow 
Support,” Master’s thesis%%lst%% University of California at Berkeley%%lst%% 2014%%per%%]$~ 
~$[V%%per%%]$~ ~$[Aken’Ova%%lst%% “Bridging the gap between soft ]^[ hard eFPGA design,” 
Master’s thesis%%lst%% University of British Columbia%%lst%% 2005%%per%%]$~ 
~$[V%%per%%]$~ ~$[Aken’Ova et al%%per%%%%lst%% “An improved “soft” eFPGA design ]^[ implementation strategy,” in IEEE CICC%%lst%% 2005%%lst%% pp%%per%% 179–182%%per%%]$~ 
~$[V%%per%%]$~ ~$[Aken’Ova ]^[ R%%per%%]$~ ~$[Saleh%%lst%% “A “soft++” eFPGA physical design 
approach with case studies in 180nm ]^[ 90nm,” in ISVLSI%%per%%]$~ ~$[IEEE%%lst%% 
2006%%per%%]$~ 
~$[S%%per%%]$~ ~$[Phillips ]^[ S%%per%%]$~ ~$[Hauck%%lst%% “Automatic layout of domain%%dsh%%specific reconfigurable subsystems ]f[ system%%dsh%%on%%dsh%%a%%dsh%%chip,” in FPGA%%per%%]$~ ~$[ACM%%lst%% 2002%%lst%% 
pp%%per%% 165–173%%per%%]$~ 
~$[C%%per%%]$~ ~$[Ebeling et al%%per%%%%lst%% “RaPiD Reconfigurable pipelined datapath,” in Fieldprogrammable logic smart applications%%lst%% new paradigms ]^[ compilers%%lst%% 
1996%%lst%% pp%%per%% 126–135%%per%%]$~ 
~$[N%%per%%]$~ ~$[Kafafi et al%%per%%%%lst%% “Architectures ]^[ algorithms ]f[ synthesizable embedded programmable logic cores,” in FPGA%%per%%]$~ ~$[ACM%%lst%% 2003%%lst%% pp%%per%% 3–11%%per%%]$~ 
~$[S%%per%%]$~ ~$[Wilton et al%%per%%%%lst%% “A synthesizable datapath%%dsh%%oriented embedded FPGA 
fabric,” in FPGA%%per%%]$~ ~$[ACM%%lst%% 2007%%lst%% pp%%per%% 33–41%%per%%]$~ 
~$[V%%per%%]$~ ~$[Betz ]^[ J%%per%%]$~ ~$[Rose%%lst%% “VPR%%cln%% A new packing%%lst%% placement ]^[ routing tool 
]f[ FPGA research,” in FPL%%lst%% 1997%%lst%% pp%%per%% 213–222%%per%%]$~ 
~$[I%%per%%]$~ ~$[Kuon ]^[ J%%per%%]$~ ~$[Rose%%lst%% “Measuring the gap between FPGAs ]^[ ASICs,” 
Trans%%per%% on CAD%%lst%% vol%%per%% 26%%lst%% no%%per%% 2%%lst%% pp%%per%% 203–215%%lst%% 2007%%per%%]$~ 
~$[K%%per%%]$~ ~$[E%%per%%]$~ ~$[Murray et al%%per%%%%lst%% “Titan%%cln%% Enabling large ]^[ complex benchmarks 
in academic CAD,” in FPL%%per%%]$~ ~$[IEEE%%lst%% 2013%%per%%]$~ 
~$[J%%per%%]$~ ~$[Luu%%lst%% “Architecture%%dsh%%Aware Packing ]^[ CAD Infrastructure ]f[ FieldProgrammable Gate Arrays,” Ph%%per%%D%%per%% dissertation%%lst%% University of Toronto%%lst%% 
2014%%per%%]$~ 
~$[S%%per%%]$~ ~$[Yang%%lst%% Logic Synthesis ]^[ Optimization Benchmarks User Guide 
Version 3%%per%%0%%per%%]$~ ~$[Microelectronics Center of North Carolina%%lst%% 1991%%per%%]$~ 
~$[H%%per%%]$~ ~$[Wong et al%%per%%%%lst%% “Comparing FPGA vs%%per%% custom CMOS ]^[ the impact 
on processor microarchitecture,” in FPGA%%per%%]$~ ~$[ACM%%lst%% 2011%%lst%% pp%%per%% 5–14%%per%% 
