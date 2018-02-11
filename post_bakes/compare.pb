~$[High%%dsh%%Level Synthesis of FPGA Circuits with 
Multiple Clock Domains 
Author names removed ]f[ blind review%%per%%]$~ 
~$[Abstract—We consider the high%%dsh%%level synthesis of circuits with 
multiple clock domains in a bid to raise circuit performance%%per%%]$~ 
~$[A profiling%%dsh%%based approach is used to select time%%dsh%%intensive subcircuits within a larger circuit to operate on separate clock 
domains%%per%%]$~ ~$[This isolates the critical paths of the sub%%dsh%%circuits from 
the larger circuit%%lst%% allowing the sub%%dsh%%circuits to be clocked at 
the highest%%dsh%%possible speed%%per%%]$~ ~$[The open%%dsh%%source LegUp high%%dsh%%level 
synthesis tool (HLS) [1] is modified to automatically insert 
clock%%dsh%%domain%%dsh%%crossing circuitry ]f[ signals crossing between two 
domains%%per%%]$~ ~$[The scheduling ]^[ binding phases of HLS were 
changed to reflect the impact of multiple clock domains on 
memory%%per%%]$~ ~$[Namely%%lst%% the block RAMs in FPGAs are dual%%dsh%%port%%lst%% 
where each port can operate on a different domain%%lst%% implying 
that sub%%dsh%%circuits on different domains can access shared memory 
provided the domains of the memory ports are consistent with 
the sub%%dsh%%circuit domains%%per%%]$~ ~$[In an experimental study%%lst%% apply multiclock domain HLS to the CHStone benchmark suite [2] ]^[ 
demonstrate average wall%%dsh%%clock time improvements of 33%%%per%%]$~ 
~$[To understand how performance may be impacted through 
the use of multiple clock domains%%lst%% consider a larger circuit 
having two sub%%dsh%%circuits%%cln%% one ]f[ performing the computational 
work%%lst%% ]^[ a second ]f[ other tasks%%lst%% such as setup%%lst%% I/O%%lst%% etc%%per%%]$~ 
~$[Assume that 90% of the execution cycles are consumed by the 
first sub%%dsh%%circuit%%lst%% ]^[ during that time%%lst%% the second sub%%dsh%%circuit 
lies idle%%per%%]$~ ~$[In such a scenario%%lst%% to minimize overall wall%%dsh%%clock 
time%%lst%% it is desirable to make the clock period of the first subcircuit (where the majority of cycles are spent) as short as 
possible%%per%%]$~ ~$[In a single%%dsh%%clock design%%lst%% the critical path of the overall 
circuit may reside in the second sub%%dsh%%circuit%%lst%% thereby slowing 
down everything%%per%%]$~ ~$[However%%lst%% by clocking the two sub%%dsh%%circuits 
on independent domains%%lst%% we are assured that the speed of the 
first sub%%dsh%%circuit is optimized in isolation%%scn%% that is%%lst%% its speed is 
]n[ defined by the critical path in the second sub%%dsh%%circuit%%per%%]$~ 
~$[I%%per%%]$~ ~$[I NTRODUCTION 
Deployment of multiple clock domains does ]n[ come 
without a cost%%per%%]$~ ~$[Clock%%dsh%%domain%%dsh%%crossing circuitry must be 
incorporated when different domains “talk” to one another 
to avoid metastability (i%%per%%e%%per%% when a register output oscillates 
between the high ]^[ low states ]f[ a certain period of 
time)%%lst%% ]^[ such circuitry imposes latency overheads ]f[ such 
communication%%lst%% as well as an area overhead%%per%%]$~ ~$[Moreover%%lst%% the use 
of multiple domains complicates CAD tasks%%lst%% particularly static 
timing analysis%%per%%]$~ ~$[However%%lst%% despite these costs%%lst%% it is important 
to note that in the FPGA context%%lst%% modern devices already 
contain sophisticated circuitry ]f[ the generation%%lst%% ]^[ lowskew distribution/routing of multiple different clocks within a 
single user design%%per%%]$~ ~$[This work leverages the presence of such 
already%%dsh%%existing circuitry from the HLS perspective%%per%%]$~ 
~$[High%%dsh%%level synthesis (HLS) allows software design methodologies to be applied ]f[ hardware design%%lst%% lowering nonrecurring engineering (NRE) costs ]^[ reducing the time%%dsh%%tomarket ]f[ the production of electronic products%%per%%]$~ ~$[For hardware 
engineers%%lst%% HLS allows design ]^[ verification to proceed more 
rapidly%%lst%% at a higher level of abstraction %%cmp%% traditional RTL%%per%%]$~ ~$[For 
software engineers%%lst%% HLS enables the speed ]^[ energy benefits 
of hardware to be accessed by those without hardware%%dsh%%design 
skills%%per%%]$~ ~$[The difficulty of traditional approaches to hardware 
design%%lst%% as well as a labor market where software engineers 
outnumber hardware engineers by a 10%%dsh%%to%%dsh%%1 margin [3]%%lst%% are key 
drivers ]f[ the emphasis on HLS by the largest FPGA vendors%%per%%]$~ 
~$[Despite its rising popularity%%lst%% however%%lst%% a long%%dsh%%standing weakness 
of HLS is that in certain cases%%lst%% the quality (performance%%lst%% power%%lst%% 
We modified the open%%dsh%%source LegUp HLS tool [1] from the 
area) of the circuit produced are inferior to manual hardware University of Toronto to generate multi%%dsh%%clock domain circuits%%per%% 
design%%per%%]$~ ~$[In this paper%%lst%% we improve the performance of HLS%%dsh%% In our new flow%%lst%% the user specifies%%lst%% in a Tcl configuration 
generated circuits by borrowing ]^[ incorporating into HLS a file%%lst%% which functions are to be clocked on specific domains%%per%% 
technique from traditional sequential circuit design – the use The scheduling ]^[ binding steps of HLS were modified 
of multiple clock domains%%per%% 
to recognize clock domain restrictions on memory ports – 
Multiple%%dsh%%clock domain design refers to the use of multiple memories in FPGAs are dual port%%lst%% where each port may be 
clocks of different frequencies within a single larger design%%per%% clocked independently%%per%%]$~ ~$[In the binding context%%lst%% ]f[ example%%lst%% this 
For example%%lst%% one of two sub%%dsh%%circuits within a larger circuit restriction implies that circuitry operating at a specific frequency 
may be clocked at 100MHz%%lst%% ]^[ the second sub%%dsh%%circuit clocked must access memory through a port operating at that same 
at 200MHz%%per%%]$~ ~$[The use of multiple clocks offers two potential frequency%%per%%]$~ ~$[The Verilog generation step of LegUp was altered to 
benefits%%cln%% 1) improved performance%%lst%% ]^[ 2) reduced power%%per%%]$~ ~$[We automatically insert clock%%dsh%%domain%%dsh%%crossing logic ]^[ FSM stall 
focus on the former benefit in this paper%%scn%% however%%lst%% prior work logic%%per%%]$~ ~$[In an experimental study%%lst%% we demonstrate performance 
has focused on the latter benefit [4]%%lst%% with power saved by benefits over single clock designs using the CHStone HLS 
reducing the total clock routing capacitance toggling at a single benchmark suite [2]%%per%%]$~ ~$[To the authors’ knowledge%%lst%% this work is 
(high) frequency%%lst%% ]^[ the ability to independently gate clock the first application of automated multiple%%dsh%%clock%%dsh%%domain circuit 
domains ]f[ idle sub%%dsh%%circuits%%per%% 
generation in HLS ]f[ FPGAs%%per%% 
the scope of this paper%%per%%]$~ ~$[However%%lst%% in our work%%lst%% we make use of 
two of the circuits from [10]%%lst%% called a two flip%%dsh%%flop synchronizer 
]^[ an enable%%dsh%%based synchronizer%%per%%]$~ ~$[We elaborate on these in 
detail in Section III%%per%%]$~ 
~$[Top Module 
Global Memory 
Port A 
Port B 
start 
start 
Arguments[i] 
Arguments[i] 
Module A 
Module C 
return value 
return value 
finish 
finish 
A%%per%%]$~ ~$[LegUp HLS 
LegUp is an HLS tool that converts a C program into a 
hardware circuit specified in Verilog RTL%%per%%]$~ ~$[The tool is built 
within the open%%dsh%%source LLVM compiler [11]%%per%%]$~ ~$[After program 
Module B 
Module D 
parsing%%lst%% conversion to the compiler’s internal representation%%lst%% 
]^[ compiler optimization passes%%lst%% LegUp HLS commences%%per%%]$~ 
~$[Local shared 
Local shared 
The typical HLS steps are allocation%%lst%% scheduling%%lst%% binding%%lst%% 
memory 
memory 
]^[ finally%%lst%% generation of the RTL%%per%%]$~ ~$[Allocation pertains to the 
constraints on the design%%cln%% the amount of hardware resources of 
Fig%%per%% 1%%per%%]$~ ~$[Top%%dsh%%level circuit structure of LegUp%%dsh%%generated circuit%%per%% 
each type that are permitted ]f[ use in the synthesized circuit%%lst%% as 
well as the desired performance ]^[ other criteria%%per%%]$~ ~$[Scheduling 
assigns the computations in the software program into time 
II%%per%%]$~ ~$[BACKGROUND AND R ELATED W ORK 
steps%%lst%% each corresponding to states of a finite%%dsh%%state machine 
(FSM)%%per%%]$~ ~$[Thus%%lst%% scheduling plays the key role of deciding which 
Multiple clock architectures%%lst%% as implemented on FPGAs%%lst%% computation executes at what time%%lst%% thereby defining the control 
have been studied over the past two decades%%per%%]$~ ~$[Prior work FSM%%per%%]$~ ~$[Binding selects%%lst%% ]f[ each computation in the software%%lst%% 
includes multiple%%dsh%%clock architectures within Globally Asyn%%dsh%% the specific hardware resource on which the computation will 
chronous ]^[ Locally Synchronous (GALS) systems proposed be performed%%per%%]$~ ~$[Finally%%lst%% the in%%dsh%%memory synthesized circuit is 
in [5]%%per%%]$~ ~$[GALS systems consist of multiple local synchronous written out in Verilog%%per%%]$~ ~$[For this research%%lst%% changes were necessary 
modules that communicate asynchronously via a 4%%dsh%%phase throughout the LegUp flow%%lst%% as described below%%per%% 
handshake protocol%%per%%]$~ ~$[The 4%%dsh%%phase handshake protocol introduces 
In the most%%dsh%%recent version of LegUp HLS%%lst%% the generated 
considerable delays to transfer data between synchronous 
circuit has a “flat” topology%%lst%% as described in [12]%%lst%% an illustration 
modules%%per%%]$~ ~$[A study by Jiang et al%%per%% [6] proposed a computational 
of which appears in Fig%%per%% 1%%per%%]$~ ~$[Observe that all modules%%lst%% memories 
model%%lst%% called a GAS BLOCK%%lst%% to facilitate the design of GALS(global ]^[ shared local)%%lst%% as well as the interconnect reside 
based embedded systems%%per%% 
at a single level of the hierarchy%%per%%]$~ ~$[The rationale ]f[ this 
Another direction is that of latency%%dsh%%insensitive systems flat implementation is to permit the sharing of resources 
(LIS) [7] ]f[ the implementation of multiple%%dsh%%clock designs%%per%%]$~ ~$[LIS%%dsh%% among the computational modules%%lst%% e%%per%%g%%per%% memories ]v[ large 
based systems wrap circuit sub%%dsh%%modules within synchronizing computational blocks%%lst%% such as floating%%dsh%%point units ]v[ dividers%%per%% 
wrappers that impose an area overhead%%per%%]$~ ~$[The synchronizing The flat hierarchy has implications ]f[ multi%%dsh%%clock HLS in this 
wrappers are used to both insulate individual sub%%dsh%%modules research%%lst%% particularly insertion of the CDC circuits between 
from one another ]^[ also%%lst%% to permit communication between communicating modules on different clock domains%%per%% 
modules%%per%%]$~ ~$[An extension of LIS%%lst%% combined with GALS%%dsh%%based 
design%%lst%% was proposed by Singh et al%%per%% [8] to support multi%%dsh%%clock 
III%%per%%]$~ ~$[M ULTIPLE C LOCK %%dsh%%D OMAIN HLS 
architectures%%per%%]$~ ~$[Agiwal ]^[ Singh [9] applies LIS concepts to 
multi%%dsh%%clock design%%lst%% with handling ]f[ metastability ]^[ data A%%per%%]$~ ~$[Overview 
incoherency%%per%%]$~ ~$[Regarding multi%%dsh%%clock%%dsh%%domain HLS ]f[ FPGAs%%lst%% 
At a high level%%lst%% the high%%dsh%%level synthesis of circuits with 
there appears to be little prior work aside from [4]%%lst%% which multiple clock domains works as follows%%cln%% the user designates 
focused on power benefits rather %%cmp%% performance%%per%% 
which C functions are to be placed on separate clock domains in 
A key element in the design of digital circuits with multiple LegUp’s Tcl configuration file%%per%%]$~ ~$[LegUp HLS synthesizes each C 
clock domains is clock%%dsh%%domain crossing (CDC) circuitry – function into a separate Verilog module%%per%%]$~ ~$[In scenarios where a 
special circuit structures that provide communication between function calls another function%%lst%% ]^[ the two functions reside on 
two different clock domains%%per%%]$~ ~$[The purpose of such circuitry is to different clock domains%%lst%% clock%%dsh%%domain%%dsh%%crossing (CDC) circuitry 
ensure the integrity of the data transmitted between the domains%%per%% must be inserted between the corresponding generated Verilog 
When data from a first clock domain is transmitted%%lst%% e%%per%%g%%per%% from modules%%per%%]$~ ~$[We modified the Verilog generation step of LegUp 
a flip%%dsh%%flop Q output%%lst%% to a flip%%dsh%%flop clocked by a second domain%%lst%% HLS to automatically insert the CDC circuits in the appropriate 
the potential exists ]f[ metastability in the receiving flip%%dsh%%flop%%lst%% locations%%lst%% as well as to insert necessary stall logic to mitigate 
depending on the timing relationship between the two clocks%%per%% metastability (elaborated upon below)%%per%%]$~ ~$[The Verilog generation 
The CDC circuitry eliminates the chance of metastability%%lst%% was also modified to automatically instantiate PLLs ]f[ clock 
providing clean data transfer between domains%%per%%]$~ ~$[A paper by generation%%cln%% one PLL ]f[ each domain%%per%%]$~ ~$[In this study%%lst%% we target 
Luo et al%%per%% [10] surveys the design ]^[ verification of a variety the Altera/Intel Cyclone V 45nm FPGA%%scn%% the PLLs instantiated 
of CDC circuits%%per%%]$~ ~$[A complete review of CDC circuits is beyond are specific to Cyclone V%%per%%]$~ 
~$[Interconnect 
start 
start 
Arguments[i] 
Arguments[i] 
return value 
return value 
finish 
finish 
Port A 
Port B 
Port A 
Port B 
Clock Domain 1 
Stall 
Clock Domain 2 
Start C 
Stall 
Module B 
B 
Module 
Module 
ModuleAB 
Return value C 
Stall 
Start C 
Stall 
Finish C 
Arguments C[j] 
Finish C 
Arguments C[j] 
Stall 
logic 
2 
1 
Return value C 
4 
3 
Enable 
Finish 
Start 
Stall 
Module 
Module C 
C 
Clock Domain 3 
Arguments[j] 
Return value 
Fig%%per%% 2%%per%%]$~ ~$[Clock%%dsh%%domain%%dsh%%crossing circuitry ]f[ start ]^[ finish signals%%per%%]$~ ~$[Arguments/return value are showed as abstract bold lines%%per%%]$~ 
~$[In addition%%lst%% changes to the scheduling ]^[ binding steps of 
LegUp HLS were required to support multiple domains%%per%%]$~ ~$[Such 
changes are required ]f[ cases in which sub%%dsh%%circuits on separate 
clock domains access a shared resource%%lst%% such as a block RAM%%per%%]$~ 
~$[We elaborate on the CDC circuitry ]^[ the scheduling/binding 
changes in the subsections below%%per%%]$~ 
~$[B%%per%%]$~ ~$[Clock%%dsh%%Domain%%dsh%%Crossing (CDC) Circuitry 
To support the synthesis of multiple clocks%%lst%% we modify 
LegUp’s existing communication interface between modules%%per%%]$~ 
~$[The communication interface in a LegUp%%dsh%%generated circuit 
contains two main interfaces%%lst%% a master interface ]^[ a slave 
interface%%per%%]$~ ~$[The master interface initiates a transfer by setting 
the arguments to the slave interface ]^[ asserting a start 
control signal%%per%%]$~ ~$[The slave responds to the transfer%%lst%% performs 
its computation%%lst%% ]^[ after execution%%lst%% sets a return value ]^[ 
asserts a finish control signal%%per%%]$~ ~$[Note that a slave interface 
may have multiple master interfaces connected to it%%per%%]$~ ~$[This 
situation arises when a function in the original C program 
has more %%cmp%% one call point%%per%%]$~ ~$[Additionally%%lst%% a master interface 
may be connected to multiple slave interfaces – a scenario 
that arises when one function calls multiple different child 
functions%%per%%]$~ ~$[The interconnect between the master interfaces ]^[ 
the slave interfaces is generated in the top%%dsh%%level of the hierarchy%%lst%% 
as mentioned above in Section II%%per%%]$~ ~$[We realize the passing of 
arguments%%lst%% the return value ]^[ the control signals from one 
clock domain to another by inserting CDC circuitry in the 
LegUp RTL generation phase%%lst%% making use of a two flip%%dsh%%flop 
synchronizer ]^[ an enable%%dsh%%based synchronizer%%per%%]$~ 
~$[The two flip%%dsh%%flop synchronizer is a simple%%lst%% safe method 
]f[ passing logic signals between clock domains%%lst%% ]^[ is the 
recommended approach ]f[ CDC in Altera FPGAs [13]%%per%%]$~ ~$[The 
concept behind the two flip%%dsh%%flop synchronizer is that a first 
register samples the asynchronous input signal ]^[ %%cmp%% waits 
]f[ a clock cycle to allow any metastable state that could occur 
to resolve itself%%per%%]$~ ~$[Then%%lst%% the first register samples the input again 
]^[ passes it to the second register%%lst%% with the intent being that 
the second register is stable ]^[ ready to pass the signal into 
the receiving clock domain%%per%%]$~ ~$[To realize a reliable two flip%%dsh%%flop 
synchronizer%%lst%% the settling window ]f[ metastability T (the time 
slack available ]f[ a metastable signal to be resolved) should 
be set to a full clock cycle%%per%%]$~ ~$[The reliability of a two flip%%dsh%%flop 
synchronizer is often expressed in terms of the mean time 
before failure (MTBF) [14]%%cln%% 
T 
MT BF = 
eτ 
Tw fR fS 
(1) 
where τ is the settling time constant of the flip%%dsh%%flop%%lst%% fR 
is the receiving clock frequency%%lst%% ]^[ fS is the sending clock 
frequency%%per%%]$~ ~$[TW is the time window at which metastability could 
occur%%per%%]$~ ~$[TW is defined by the setup ]^[ hold%%dsh%%time parameters of 
a flip%%dsh%%flop%%per%%]$~ ~$[As τ ]^[ Tw are flip%%dsh%%flop parameters%%lst%% they depend 
on the FPGA used ]^[ the operating conditions%%per%%]$~ ~$[However%%lst%% 
optimization could be carried out on T%%lst%% as it depends on the 
design%%per%%]$~ ~$[In our case%%lst%% achieving a desirable (high) MTBF is 
straightforward%%lst%% as T is a full clock cycle%%lst%% which is lengthy in 
comparison to the time required ]f[ flip%%dsh%%flop stability after a 
metastable event%%per%%]$~ ~$[Typical τ values are in the tens of ps [14]%%lst%% 
]^[ with a clock period in ns (e%%per%%g%%per%% 200MHz → T = 5ns)%%lst%% the 
ratio of T /τ ≈ 102 %%lst%% which implies the numerator in the MTBF 
2 
equation ≈ e10 – an enormous quanity%%per%%]$~ 
~$[Clock Domain 1 
Clock Domain 2 
Start c 
Start c 
Arguments c [i] 
Arguments c [i] 
en 
Module A 
en 
CDC circuit 
in Fig%%per%% 2 
Return Value c 
Finish c 
en 
Finish c 
Finish 
Return Value 
Module C 
Start 
Clock Domain 3 
Arguments [i] 
0 
en 
en 
en 
Module B 
Return Value c 
Fig%%per%% 3%%per%%]$~ ~$[CDC ]f[ arguments ]^[ return values%%per%%]$~ 
~$[We modified LegUp to instantiate the two flip%%dsh%%flop synchroFig%%per%% 2 shows an example of LegUp%%dsh%%synthesized circuitry 
nizer when passing the control signals start ]^[ finish ]f[ the start ]^[ finish between two master interfaces of 
between modules in different clock domains%%per%%]$~ ~$[However%%lst%% issues modules%%lst%% A ]^[ B%%lst%% ]^[ a slave interface C%%per%%]$~ ~$[The two flip%%dsh%%flop 
arose surrounding the cycle latencies required ]f[ transmitting synchronizers are highlighted at labels 1 ]^[ 2 ]f[ the passing of 
the control signals%%per%%]$~ ~$[The latency ]f[ transmitting the finish the start ]^[ finish control signals%%lst%% respectively%%lst%% between 
signal is ]n[ an issue%%lst%% as a parent (calling) module assumes the module A master interface ]^[ module C slave interface%%per%%]$~ ~$[Labels 
slave is busy as long as finish is set to low%%per%%]$~ ~$[This implies 3 ]^[ 4 highlight the synchronizers ]f[ data transmission 
that a master interface would ]n[ invoke a slave interface between modules B ]^[ C%%per%% 
unless the slave’s finish is set to high%%per%%]$~ ~$[However%%lst%% the latency 
As the arguments ]^[ return value of the interfaces are 
]f[ transmitting the start signal required special attention%%per%%]$~ 
~$[Specifically%%lst%% %%cmp%% a start signal is issued by a master interface ]^[ multiple%%dsh%%bit%%dsh%%wide data%%lst%% they cannot be crossed by using a 
the slave’s finish signal is ]n[ set to low on the same clock cycle%%lst%% simple CDC technique%%per%%]$~ ~$[The individual bits in wide words may 
another master interface could invoke the same slave while arrive at different times in the receiving clock domain due to 
the first start signal is partway in transmission from one clock imbalanced circuit delays%%per%%]$~ ~$[Consequently%%lst%% the potential exists 
domain to another%%per%%]$~ ~$[To handle the start signal latency issues%%lst%% ]f[ the individual bits to be sampled at different edges of the 
FSM stall logic was added to the LegUp%%dsh%%generated hardware%%per%% receiving clock%%per%%]$~ ~$[To handle this%%lst%% we incorporate the enable%%dsh%%based 
The added FSM logic stalls the entire circuit when start synchronizer concept into our CDC circuit%%per%%]$~ ~$[Specifically%%lst%% we 
signal is asserted by a master interface%%per%%]$~ ~$[The stall continues register multi%%dsh%%bit%%dsh%%wide data ]f[ multiple cycles in the sending 
until the finish signal from the slave is set to low ]^[ passed clock domain until the receiving clock domain is ready to 
to all the master interfaces of the slave interface%%per%%]$~ ~$[The stall sample it%%per%%]$~ ~$[The receiving clock domain samples the wide data 
signal remains low until a specific delay has elapsed%%per%%]$~ ~$[The when it receives an enable control signal that has been passed 
delay is imposed by a chain of flip%%dsh%%flops (a shift register) in from the sending clock domain%%per%% 
the slave clock domain%%per%%]$~ ~$[The length of the chain depends on 
Since the LegUp master interface passes the arguments along 
the ratio of the slave clock frequency ]^[ the fastest master 
clock frequency%%lst%% as shown in (2)%%lst%% where fm0 %%lst%% fm1 to fmn refer with the start signal%%lst%% we used the start signal as an enable 
to the frequencies of the master interfaces%%lst%% ]^[ fs represents ]f[ the sampling of the arguments in the slave interface clock 
the frequency of the slave interface%%per%%]$~ ~$[The multiplication of the domain%%per%%]$~ ~$[As ]f[ the return value%%lst%% we used the finish control 
frequency ratio by two in (2) is to accommodate the passing signal as the enable ]f[ the sampling at the master interface%%per%% 
back of the finish signal through the two flip%%dsh%%flops at the master While Fig%%per%% 2 pertained to handling of start ]^[ finish 
interface%%per%%]$~ ~$[The addition of 3 is to apply a delay ]f[ the flip%%dsh%%flops signals%%lst%% Fig%%per%% 3 shows an analogous figure ]f[ CDC of arguments 
]^[ return values%%per%%]$~ ~$[In the top%%dsh%%left corner of the figure%%lst%% ]f[ 
at the slave interface%%per%% 
example%%lst%% observe that the start driven by module A in clock 
domain 1 is used as a register enable ]f[ the arguments passed 
max( fm0 %%lst%% fm1 %%lst%% %%per%%%%per%%%%per%% fmn ) 
Number o f FFs = 3 + d 
e × 2 (2) to module C in clock domain 3%%per%% 
f 
s 
Local shared 
memory Clk 2 
Clk 1 
Port A 
Port B 
Local Port 
Module A 
Clock Domain 1 
Global Memory 
Local shared 
memory Clk 3 
Clk 2 
Clk 3 
Clk 2 
Port A 
Port B 
Port A 
Local Port Global Port 
Global Port Local Port 
Global Port Local Port 
Module B 
Module C 
Module D 
Clock Domain 2 
Port B 
Clock Domain 3 
Fig%%per%% 4%%per%%]$~ ~$[Clock%%dsh%%domain%%dsh%%crossing memory interfacing%%per%% 
relate to how memories are accessed in the presence of multiple 
We now describe the changes we made to scheduling ]^[ clock domains%%per%%]$~ ~$[Regarding scheduling%%lst%% the LegUp HLS tool 
binding%%lst%% which are tied to how memories are synthesized by schedules the computations in an input C program on a functionby%%dsh%%function basis%%per%%]$~ ~$[In single%%dsh%%domain designs%%lst%% it is possible to 
LegUp%%per%%]$~ 
~$[When an input C program contains arrays%%lst%% the arrays are schedule two memory accesses (loads/stores) per cycle to each 
synthesized by LegUp HLS into memories on the FPGA%%per%% memory in the FPGA%%lst%% thereby leveraging the dual%%dsh%%point RAMs 
LegUp generates three different types of memory structures in the fabric%%per%%]$~ ~$[In multiple%%dsh%%clock circuits%%lst%% when two functions%%lst%% 
which are%%cln%% 1) A global memory controller ]^[ memories%%lst%% 2) on different clock domains%%lst%% access the same memory%%lst%% the two 
shared%%dsh%%local memories%%lst%% ]^[ 3) local memories%%per%%]$~ ~$[The global ports of the memory must also be on clock domains aligned 
]^[ shared local memories are instantiated at the top level with the two domains of the accessing functions%%per%%]$~ ~$[With just 
entity as shown in Fig%%per%% 1%%per%%]$~ ~$[Local memories are ]f[ arrays one port on each unique clock domain%%lst%% the scheduler can no 
that are accessed by a single function in the input program%%scn%% longer schedule two accesses per cycle to the memory – at 
thus%%lst%% they are instantiated within the function’s corresponding most one access per clock cycle is permitted ]f[ each domain%%per%% 
hardware module%%per%%]$~ ~$[Shared%%dsh%%local memories contain arrays that We altered the scheduler to reflect this constraint%%per%%]$~ ~$[Namely%%lst%% 
are accessed by a list of known functions – such memories ]f[ shared%%dsh%%local memories ]v[ global memories (defined above) 
are accessed by multiple known hardware modules%%per%%]$~ ~$[Global that are accessed by functions on different clock domains%%lst%% the 
memory is ]f[ arrays accessed by an unknown list of functions%%per%% scheduler permits at most one access per cycle per domain%%per%%]$~ 
~$[Note that ]f[ memories accessed by solely one function%%lst%% ]v[ 
The designation of arrays into the three categories of memories 
that 
are accessed by multiple functions on the same domain%%lst%% 
is based on a “points%%dsh%%to” analysis (alias analysis) in the LLVM 
the 
single%%dsh%%port 
restriction is unnecessary%%per%%]$~ ~$[In such cases%%lst%% two 
compiler whose results are used by LegUp HLS%%per%%]$~ ~$[Further details 
accesses 
per 
cycle 
are permitted%%lst%% which is the default LegUp 
are in [12]%%per%%]$~ 
~$[HLS 
behavior%%per%%]$~ 
~$[Given the possibility that modules from different clock 
With regard to binding%%lst%% one of its tasks is to match memory 
domains may access the same memory%%lst%% we changed such 
operations 
(loads/stores) to memory ports%%per%%]$~ ~$[In LegUp HLS%%lst%% 
memories from single%%dsh%%clock dual port to dual%%dsh%%clock dual port%%per%% 
binding 
is 
formulated 
as a weighted%%dsh%%bipartite graph matching 
This imposes a constraint that at most two modules from 
problem 
instance 
[15]%%lst%% 
with one of the objectives being 
different domains may access the same memory%%per%%]$~ ~$[If a user 
to 
balance 
memory 
accesses 
among the ports%%lst%% judiciously 
specifies three modules as having different domains in the 
managing 
the 
sizes 
of 
the 
input 
multiplexers feeding the ports%%per%%]$~ 
~$[Tcl configuration file%%lst%% ]^[ those three modules all access the 
In 
the 
multiple%%dsh%%clock 
case%%lst%% 
however%%lst%% 
]f[ memories on two clock 
same memory%%lst%% the situation is infeasible%%lst%% ]s[ multi%%dsh%%clock LegUp 
domains%%lst%% 
the 
binding 
step 
must 
adhere 
to the specific domain 
reports an error ]^[ terminates%%per%% 
of 
each 
port 
]^[ 
the 
accessing 
function%%per%%]$~ 
~$[That is%%lst%% ]f[ a function 
Fig%%per%% 4 illustrates global memory ]^[ shared%%dsh%%local memories 
on 
a 
particular 
domain 
that 
accesses 
a 
dual%%dsh%%clock memory%%lst%% 
being accessed by multiple clock domains%%per%%]$~ ~$[Observe that Module 
there 
is 
no 
choice 
when 
binding 
ports%%cln%% 
memory 
accesses in the 
A ]^[ B communicate with one another%%lst%% ]^[ both access a 
function 
must 
be 
bound 
to 
the 
port 
on 
the 
same 
clock domain 
local shared memory (top left of figure)%%per%%]$~ ~$[In this case%%lst%% port A of 
as 
the 
function%%per%% 
the memory operates at clock domain 1%%scn%% port B of the memory 
operates at clock domain 2%%per%%]$~ ~$[In the top%%dsh%%center of the figure%%lst%% 
IV%%per%%]$~ ~$[C LOCK D OMAIN A SSIGNMENT AND F REQUENCY 
we observe that the global memory ports A ]^[ B operate 
S ELECTION 
on clock domains 2 ]^[ 3%%lst%% respectively%%lst%% ]^[ are accessed by 
We evaluate the proposed multi%%dsh%%clock%%dsh%%domain HLS using the 
modules B%%lst%% C%%lst%% ]^[ D%%per%%]$~ 
~$[To support multiple%%dsh%%clock synthesis%%lst%% changes were required CHStone HLS benchmark suite [2] ]^[ target the Altera/Intel 
to both the scheduling ]^[ binding steps of HLS%%per%%]$~ ~$[The changes Cyclone V FPGA%%per%%]$~ 
~$[C%%per%%]$~ ~$[Scheduling ]^[ Binding 
TABLE I 
P ERFORMANCE RESULTS FOR ONE CLOCK DOMAIN VERSUS TWO CLOCK DOMAINS %%per%%]$~ 
~$[Inline Option 
Inlined 
Not Inlined 
Benchmark 
adpcm 
aes 
blowfish 
dfadd 
dfsin 
jpeg 
motion 
sha 
Geomean 
adpcm 
aes 
blowfish 
dfadd 
dfdiv 
dfmul 
dfsin 
gsm 
jpeg 
motion 
sha 
Geomean 
One Clock 
FMax (MHz) 
Time (µs) 
103 
141%%per%%8 
150 
62%%per%%4 
156 
1141%%per%%5 
146 
6%%per%%1 
51 
1316%%per%%3 
97 
12699%%per%%2 
114 
55%%per%%6 
190 
1280%%per%%5 
304%%per%%4 
121 
239%%per%%4 
144 
87%%per%%6 
156 
1375%%per%%9 
148 
24%%per%%1 
130 
28%%per%%2 
158 
8%%per%%9 
121 
1103%%per%%5 
137 
57%%per%%0 
115 
12125%%per%%1 
158 
41%%per%%4 
187 
1360%%per%%9 
182%%per%%5 
FMax (MHz) 
112%%lst%% 140 
143%%lst%% 189 
155%%lst%% 197 
139%%lst%% 195 
120%%lst%% 197 
93%%lst%% 113 
117%%lst%% 163 
202%%lst%% 205 
136%%lst%% 
160%%lst%% 
146%%lst%% 
149%%lst%% 
146%%lst%% 
149%%lst%% 
138%%lst%% 
136%%lst%% 
104%%lst%% 
161%%lst%% 
180%%lst%% 
159 
169 
181 
196 
152 
173 
145 
223 
146 
263 
205 
Two Clock 
Average Time (µs) 
100%%per%%4%%lst%% 50%%per%%3 
5%%per%%2%%lst%% 51%%per%%4 
785%%per%%5%%lst%% 437%%per%%9 
5%%per%%94%%lst%% 1%%per%%18 
506%%per%%38%%lst%% 74%%per%%4 
2557%%per%%6%%lst%% 8724%%per%%2 
0%%per%%63%%lst%% 38%%per%%82 
114%%per%%2%%lst%% 1103%%per%%2 
198%%per%%2%%lst%% 44%%per%%6 
42%%per%%7%%lst%% 40%%per%%9 
431%%per%%9%%lst%% 72%%per%%0 
17%%per%%8%%lst%% 7%%per%%2 
24%%per%%7%%lst%% 2%%per%%46 
3%%per%%0%%lst%% 7%%per%%5 
635%%per%%2%%lst%% 377%%per%%1 
52%%per%%6%%lst%% 4%%per%%4 
7996%%per%%0%%lst%% 3738%%per%%4 
2%%per%%56%%lst%% 23%%per%%38 
178%%per%%4%%lst%% 1108%%per%%9 
Time (µs) 
150%%per%%4 
56%%per%%6 
1223%%per%%4 
7%%per%%1 
580%%per%%8 
11281%%per%%7 
39%%per%%2 
1217%%per%%6 
263%%per%%4 
242%%per%%8 
83%%per%%6 
1468%%per%%5 
25%%per%%0 
27%%per%%2 
10%%per%%5 
1012%%per%%4 
57%%per%%0 
11734%%per%%4 
25%%per%%9 
1287%%per%%3 
175%%per%%3 
Ratio 
Time (µs) 
1 (0%%per%%94) 
1%%per%%10 
1 (0%%per%%93) 
1 (0%%per%%86) 
2%%per%%27 
1%%per%%13 
1%%per%%42 
1%%per%%05 
1%%per%%33 
1 (0%%per%%99) 
1%%per%%05 
1 (0%%per%%94) 
1 (0%%per%%96) 
1%%per%%04 
1 (0%%per%%85) 
1%%per%%09 
1%%per%%00 
1%%per%%03 
1%%per%%60 
1%%per%%06 
1%%per%%13 
For multi%%dsh%%clock HLS%%lst%% a natural question that arises is%%cln%% how HLS commences%%per%%]$~ ~$[To explore this%%lst%% we synthesized two variants 
does one decide which functions (and consequent synthesized of each CHStone benchmark%%cln%% 1) a no%%dsh%%inline version where we 
circuits) should be on which clock domain%%qsn%%]$~ ~$[Considering first disabled inlining by the LLVM compiler%%lst%% 2) using the normal 
the two%%dsh%%domain case%%lst%% we took the following approach%%cln%% ]f[ each inlining that occurs with %%dsh%%O3 compiler optimization%%per%%]$~ ~$[Note %%dsh%%O3 
benchmark circuit%%lst%% we first profiled the single%%dsh%%clock%%dsh%%domain optimization was performed in both cases%%scn%% the only difference 
version of the circuit%%lst%% ]^[ extracted the number of clock cycles between the two variants is that inlining is disabled in the first 
spent in each function%%per%%]$~ ~$[The function consuming the most cycles variant%%per%%]$~ 
~$[Table I shows the speed%%dsh%%performance results ]f[ single ]^[ 
was placed on a first clock domain%%lst%% with the balance of the 
circuit on a second clock domain%%per%%]$~ ~$[This simple approach was two%%dsh%%clock domain HLS%%per%%]$~ ~$[The top part of the table shows results 
used ]f[ the adpcm%%lst%% aes ]^[ motion CHStone circuits%%per%%]$~ ~$[For ]f[ normal %%dsh%%O3 optimization with inlining enabled%%scn%% the bottom 
the other circuits%%lst%% we observed that this approach produced poor part of the table shows results ]f[ the scenario when inlining 
performance results%%lst%% primarily owing to the overheads of cross%%dsh%% is disabled%%per%%]$~ ~$[Column 2 lists the benchmark name%%per%%]$~ ~$[Columns 3 
domain%%dsh%%crossing%%per%%]$~ ~$[Therefore%%lst%% ]f[ these circuits%%lst%% we examined ]^[ 4 give the FMax ]^[ wall%%dsh%%clock time ]f[ the single%%dsh%%clock 
the call graph of the program%%lst%% ]^[ placed all child functions of implementation (experimental baseline)%%per%%]$~ ~$[Wall%%dsh%%clock time is the 
the most cycle%%dsh%%consuming parent function on the same clock total time needed ]f[ circuit execution%%lst%% which is 1/FMax × 
domain as the parent%%per%%]$~ ~$[We took a similar approach in the three%%dsh%% Cycles in the single%%dsh%%clock case%%lst%% where Cycles is the total cycle 
clock%%dsh%%domain case%%cln%% we put the most compute%%dsh%%intensive function latency%%per%%]$~ ~$[Columns 5%%lst%% 6 ]^[ 7 pertain to synthesized designs 
on a first domain%%lst%% the second most compute%%dsh%%intensive function with two clock domains%%per%%]$~ ~$[Column 5 gives the two Fmax values%%scn%% 
column 6 gives the wall%%dsh%%clock time spent in each domain%%scn%% 
on a second domain%%lst%% ]^[ the balance on a third domain%%per%% 
column 7 shows the overall total wall%%dsh%%clock time%%per%%]$~ ~$[Finally%%lst%% 
V%%per%%]$~ ~$[E XPERIMENTAL S TUDY 
column 8 gives the ratio of the single%%dsh%%clock to dual%%dsh%%clock 
We %%cmp%% multi%%dsh%%clock designs to single%%dsh%%clock designs%%lst%% wall%%dsh%%clock time%%per%%]$~ ~$[Ratios larger %%cmp%% 1 indicate a “win” ]f[ 
]^[ report both circuit performance%%lst%% as well as the area impact%%per%% dual%%dsh%%clock%%per%%]$~ ~$[Numbers in parentheses represent degradations in 
The CHStone benchmarks used have built%%dsh%%in input vectors%%lst%% wall%%dsh%%clock time ]f[ the dual%%dsh%%clock case%%per%%]$~ ~$[In such cases%%lst%% which 
]^[ golden output vectors%%lst%% ]^[ incorporate “self%%dsh%%checking” ]f[ are mentioned further below%%lst%% one would simply opt ]f[ the 
correctness%%per%%]$~ ~$[We verified the multi%%dsh%%domain circuits functioned single%%dsh%%clock design%%lst%% ]^[ %%cmp%%%%lst%% we use 1 as the ratio ]f[ these 
correctly in two ways%%cln%% 1) using ModelSim simulation ]^[ 2) in the mean%%dsh%%ratio calculations%%per%% 
by execution in hardware using the Cyclone V FPGA on the 
Looking first at the top%%dsh%%half of Table I%%lst%% we see that 5 of 
DE1%%dsh%%SoC board%%per%% 
the 8 benchmarks benefit from two clock domains%%lst%% with the 
As mentioned above%%lst%% our multi%%dsh%%clock approach operates at average improvement being 33% (right%%dsh%%most column)%%per%%]$~ ~$[The 
the function level of granularity – the synthesized hardware ]f[ largest improvement was observed ]f[ dfsin%%lst%% which suffered 
an entire C function must operate on a single unique domain%%per%% from a long inter%%dsh%%module critical path in the single%%dsh%%clock case%%lst%% 
Consequently%%lst%% our approach is sensitive to which functions that was broken in the two%%dsh%%clock case by the instantiated CDC 
remain “intact” (i%%per%%e%%per%% functions that were ]n[ inlined) at the time circuitry%%per%%]$~ ~$[Modest performance degradations are observed ]f[ 
TABLE II 
A REA RESULTS FOR ONE CLOCK DOMAIN VERSUS TWO CLOCK DOMAINS %%per%%]$~ 
~$[Inline Option 
Inlined 
Not Inlined 
Benchmark 
adpcm 
aes 
blowfish 
dfadd 
dfsin 
jpeg 
motion 
sha 
Geomean 
adpcm 
aes 
blowfish 
dfadd 
dfdiv 
dfmul 
dfsin 
gsm 
jpeg 
motion 
sha 
Geomean 
One Clock 
Logic utilization 
Total registers 
6,079 
11,094 
4,028 
6,864 
2,635 
5,336 
3,378 
3,993 
10,385 
16,674 
13,007 
18,102 
6,136 
9,764 
1,413 
2,444 
4,741 
7,646 
7,117 
11,333 
3,448 
5,705 
2,887 
5,850 
4,824 
9,078 
7,395 
13,644 
3,283 
5,954 
12,806 
24,247 
4,058 
6,963 
7,918 
11,313 
1,600 
2,406 
2,253 
3,880 
4,411 
7,612 
three of the benchmarks%%per%%]$~ ~$[The degradations are a result of 
the cycle%%dsh%%count overhead of clock%%dsh%%domain%%dsh%%crossing%%lst%% which is 
particularly onerous in cases where a module on one domain 
is repeatedly invoked by a module on the second domain%%lst%% ]^[ 
where each invocation of the first module consumes relatively 
few clock cycles%%per%%]$~ ~$[Degradations are also caused by lengthier 
schedules in the two%%dsh%%clock case resulting from reduced memoryaccess parallelism in which shared/global memories%%lst%% accessed 
by two domains%%lst%% have solely a single port ]f[ each domain%%per%%]$~ 
~$[The bottom half of the table gives results ]f[ the case of 
inlining disabled%%per%%]$~ ~$[The improvements in performance here are 
more modest%%lst%% as the functions are smaller (no inlining) ]^[ 
each executes ]f[ fewer clock cycles%%per%%]$~ ~$[This implies that the 
fraction of total time required ]f[ clock%%dsh%%domain%%dsh%%crossing is 
larger %%cmp%% in the inlined case%%lst%% increasing CDC overheads ]^[ 
reducing the benefit of multi%%dsh%%clock synthesis%%per%%]$~ ~$[The average wallclock time improvement in this case is 13%%%per%%]$~ ~$[Note that with the 
inlined case (top%%dsh%%half of the table)%%lst%% there are fewer benchmarks 
listed%%lst%% owing to inlining reducing the eliminated benchmarks 
to a single function (and %%cmp%% a single domain)%%per%%]$~ 
~$[We also considered three%%dsh%%clock%%dsh%%domain implementations (not 
shown here ]f[ brevity)%%lst%% ]^[ found that aside from the jpeg 
benchmark%%lst%% no additional improvements were achieved above 
the two%%dsh%%clock case%%per%% jpeg is the largest circuit in the suite%%lst%% ]^[ 
we found it contained large enough sub%%dsh%%circuits to benefit from 
additional clocks%%per%%]$~ ~$[We expect that larger benchmarks%%lst%% containing 
significant number of large sub%%dsh%%modules%%lst%% would stand to benefit 
from three (or more) domains%%per%%]$~ 
~$[Table II shows the impact on circuit area%%lst%% including logic 
utilization (Cyclone V ALMs)%%lst%% as well as register count%%per%%]$~ ~$[CDC 
causes no area impact on other block types (DSP blocks%%lst%% block 
RAMs)%%per%%]$~ ~$[Looking at the two right%%dsh%%most columns%%lst%% we see the area 
impact on ALMs to range from 0%%dsh%%6%%%lst%% on average%%lst%% depending 
on whether inlining is used%%per%%]$~ ~$[In some cases%%lst%% circuit area actually 
Two Clock 
Logic utilization 
Total registers 
6,310 
11,456 
4,245 
7,547 
2,791 
5,636 
3,539 
4,610 
9,234 
17,979 
13,393 
19,452 
6,235 
10,060 
1,345 
2,671 
4,789 
8,211 
7,483 
12,137 
3,629 
6,830 
3,554 
6,939 
5,409 
10,304 
8,806 
17,062 
4,307 
7,987 
14,134 
27,001 
4,096 
6,926 
8,228 
11,837 
1,693 
2,645 
2,373 
4,118 
4,886 
8,618 
Ratio 
Logic utilization 
Total registers 
1 (0%%per%%96) 
1 (0%%per%%97) 
0%%per%%95 
0%%per%%91 
1 (0%%per%%94) 
1 (0%%per%%95) 
1 (0%%per%%95) 
1 (0%%per%%87) 
1%%per%%12 
0%%per%%93 
0%%per%%97 
0%%per%%93 
0%%per%%98 
0%%per%%97 
1%%per%%05 
0%%per%%92 
1%%per%%00 
0%%per%%93 
1 (0%%per%%95) 
1 (0%%per%%93) 
0%%per%%95 
0%%per%%84 
1 (0%%per%%81) 
1 (0%%per%%84) 
1 (0%%per%%89) 
1 (0%%per%%88) 
0%%per%%84 
0%%per%%80 
1 (0%%per%%76) 
1 (0%%per%%75) 
0%%per%%91 
0%%per%%90 
0%%per%%99 
1%%per%%01 
0%%per%%96 
0%%per%%96 
0%%per%%95 
0%%per%%91 
0%%per%%95 
0%%per%%94 
0%%per%%94 
0%%per%%91 
reduced (ratios > 1)%%lst%% which we attribute to the heuristic nature 
of the synthesis%%lst%% placement ]^[ routing tools%%per%%]$~ ~$[Register%%dsh%%count 
overhead ranges from 7%%dsh%%9%%%lst%% on average%%per%%]$~ ~$[We believe the area 
overheads shown will be acceptable to users interested in the 
highest%%dsh%%possible performance ]f[ their designs%%per%%]$~ 
~$[Overall%%lst%% we consider the performance results (up to 33% 
wall%%dsh%%clock time improvement%%lst%% on average) to be encouraging 
]f[ several reasons%%cln%% 1) the CHStone benchmarks were ]n[ 
designed with multi%%dsh%%clock domain synthesis in mind%%lst%% ]^[ 2) 
we used the existing function boundaries in the benchmarks 
]f[ clock%%dsh%%domain assignment%%lst%% rather %%cmp%% altering the programs 
to isolate their critical paths in separate functions on unique 
domains%%per%%]$~ ~$[We leave the latter ]f[ future work%%per%%]$~ 
~$[VI%%per%%]$~ ~$[C ONCLUSIONS AND F UTURE W ORK 
We considered the high%%dsh%%level synthesis of circuits with 
multiple clock domains with the objective of improving 
performance%%per%%]$~ ~$[The open%%dsh%%source LegUp HLS tool was modified 
to accept user constraints designating C functions onto specific 
clock domains%%per%%]$~ ~$[Changes were made to the scheduling ]^[ 
binding steps of HLS%%lst%% to ensure proper handling of hardware 
resources accessed by sub%%dsh%%circuits on different domains%%per%%]$~ ~$[As 
well%%lst%% the Verilog generation step of LegUp was changed 
to automatically insert clock%%dsh%%domain%%dsh%%crossing circuitry%%lst%% as 
appropriate%%lst%% ]^[ instantiate PLLs ]f[ clock synthesis%%per%%]$~ ~$[On the 
CHStone benchmark suite%%lst%% average performance gains of 13% 
]^[ 33% were observed%%lst%% depending on the approach applied 
]f[ function inlining%%per%%]$~ 
~$[As this is a first study on multi%%dsh%%clock HLS ]f[ FPGAs%%lst%% there 
are ample avenues ]f[ future research%%per%%]$~ ~$[An important one is 
to evaluate the power consequences of using multiple clocks%%per%%]$~ 
~$[While each individual clock may switch less capacitance%%lst%% we 
believe that overall%%lst%% cumulative power consumption will be 
worse in multi%%dsh%%domain designs%%per%%]$~ ~$[On the power front%%lst%% it may also 
be fruitful to consider the gating of clocks on a domain%%dsh%%bydomain basis to reduce power consumption%%per%%]$~ ~$[A second direction%%lst%% 
at the compiler level%%lst%% relates to inlining ]^[ exlining in a bid 
to achieve higher performance gains with multiple domains%%per%%]$~ 
~$[Specifically%%lst%% we would like to examine the idea of exlining 
the time%%dsh%%critical loops in programs into separate functions%%lst%% to 
be placed on independent domains%%lst%% as well as develop more 
intelligent decision making around which functions to inline 
to minimize CDC overheads%%per%%]$~ 
~$[R EFERENCES 
[1] A%%per%%]$~ ~$[Canis%%lst%% J%%per%%]$~ ~$[Choi%%lst%% M%%per%%]$~ ~$[Aldham%%lst%% V%%per%%]$~ ~$[Zhang%%lst%% A%%per%%]$~ ~$[Kammoona%%lst%% J%%per%%]$~ ~$[H%%per%%]$~ ~$[Anderson%%lst%% 
S%%per%%]$~ ~$[Brown%%lst%% ]^[ T%%per%%]$~ ~$[Czajkowski%%lst%% “LegUp%%cln%% high%%dsh%%level synthesis ]f[ FPGAbased processor/accelerator systems,” in ACM FPGA%%lst%% 2011%%lst%% pp%%per%% 33–36%%per%% 
[2] Y%%per%%]$~ ~$[Hara%%lst%% H%%per%%]$~ ~$[Tomiyama%%lst%% S%%per%%]$~ ~$[Honda%%lst%% ]^[ H%%per%%]$~ ~$[Takada%%lst%% “Proposal ]^[ 
quantitative analysis of the chstone benchmark program suite ]f[ practical 
c%%dsh%%based high%%dsh%%level synthesis,” J%%per%%]$~ ~$[Information Processing%%lst%% vol%%per%% 17%%lst%% pp%%per%% 242– 
254%%lst%% 2009%%per%% 
[3] “United States bureau of labor statistics,” https://www%%per%%bls%%per%%gov/%%per%% 
[4] G%%per%%]$~ ~$[Lhairech%%dsh%%Lebreton%%lst%% P%%per%%]$~ ~$[Coussy%%lst%% ]^[ E%%per%%]$~ ~$[Martin%%lst%% “Hierarchical ]^[ 
multiple%%dsh%%clock domain high%%dsh%%level synthesis ]f[ low%%dsh%%power design on 
FPGA,” in FPL%%lst%% 2010%%lst%% pp%%per%% 464–468%%per%% 
[5] D%%per%%]$~ ~$[M%%per%%]$~ ~$[Chapiro%%lst%% “Globally%%dsh%%asynchronous locally%%dsh%%synchronous systems%%per%%” 
STANFORD UNIV CA DEPT OF COMPUTER SCIENCE%%lst%% Tech%%per%%]$~ ~$[Rep%%per%%%%lst%% 
1984%%per%% 
[6] Y%%per%%]$~ ~$[Jiang%%lst%% H%%per%%]$~ ~$[Zhang%%lst%% H%%per%%]$~ ~$[Zhang%%lst%% H%%per%%]$~ ~$[Liu%%lst%% X%%per%%]$~ ~$[Song%%lst%% M%%per%%]$~ ~$[Gu%%lst%% ]^[ J%%per%%]$~ ~$[Sun%%lst%% 
“Design of mixed synchronous/asynchronous systems with multiple 
clocks,” IEEE Transactions on Parallel ]^[ Distributed Systems%%lst%% vol%%per%% 26%%lst%% 
no%%per%% 8%%lst%% pp%%per%% 2220–2232%%lst%% 2015%%per%% 
[7] L%%per%%]$~ ~$[P%%per%%]$~ ~$[Carloni%%lst%% K%%per%%]$~ ~$[L%%per%%]$~ ~$[McMillan%%lst%% ]^[ A%%per%%]$~ ~$[L%%per%%]$~ ~$[Sangiovanni%%dsh%%Vincentelli%%lst%% “Theory 
of latency%%dsh%%insensitive design,” IEEE Transactions on computer%%dsh%%aided 
design of integrated circuits ]^[ systems%%lst%% vol%%per%% 20%%lst%% no%%per%% 9%%lst%% pp%%per%% 1059–1076%%lst%% 
2001%%per%% 
[8] M%%per%%]$~ ~$[Singh ]^[ M%%per%%]$~ ~$[Theobald%%lst%% “Generalized latency%%dsh%%insensitive systems ]f[ 
single%%dsh%%clock ]^[ multi%%dsh%%clock architectures,” in IEEE/ACM DATE%%lst%% vol%%per%% 2%%lst%% 
2004%%lst%% pp%%per%% 1008–1013%%per%% 
[9] A%%per%%]$~ ~$[Agiwal ]^[ M%%per%%]$~ ~$[Singh%%lst%% “Multi%%dsh%%clock latency%%dsh%%insensitive architecture ]^[ 
wrapper synthesis,” Electronic Notes in Theoretical Computer Science%%lst%% 
vol%%per%% 146%%lst%% no%%per%% 2%%lst%% pp%%per%% 5–28%%lst%% 2006%%per%% 
[10] L%%per%%]$~ ~$[Luo%%lst%% H%%per%%]$~ ~$[He%%lst%% Q%%per%%]$~ ~$[Dou%%lst%% ]^[ W%%per%%]$~ ~$[Xu%%lst%% “Design ]^[ verification of multiclock domain synchronizers,” in IEEE Int’l Conf%%per%% on Intelligent System 
Design ]^[ Engineering Application (ISDEA)%%lst%% vol%%per%% 1%%lst%% 2010%%lst%% pp%%per%% 544–547%%per%% 
[11] C%%per%%]$~ ~$[Lattner ]^[ V%%per%%]$~ ~$[S%%per%%]$~ ~$[Adve%%lst%% “LLVM%%cln%% A compilation framework ]f[ lifelong 
program analysis & transformation,” in IEEE/ACM SGO%%lst%% 2004%%lst%% pp%%per%% 75– 
88%%per%% 
[12] J%%per%%]$~ ~$[Choi%%lst%% S%%per%%]$~ ~$[Brown%%lst%% ]^[ J%%per%%]$~ ~$[Anderson%%lst%% “Resource ]^[ memory management 
techniques ]f[ the high%%dsh%%level synthesis of software threads into parallel 
FPGA hardware,” in IEEE FPT%%lst%% 2015%%lst%% pp%%per%% 152–159%%per%% 
[13] “Understanding metastability in Altera FPGAs,” https://www%%per%%altera%%per%%com/ 
en US/pdfs/literature/wp/wp%%dsh%%01082%%dsh%%quartus%%dsh%%ii%%dsh%%metastability%%per%%pdf%%per%% 
[14] C%%per%%]$~ ~$[Dike ]^[ E%%per%%]$~ ~$[Burton%%lst%% “Miller ]^[ noise effects in a synchronizing flipflop,” IEEE Journal of Solid%%dsh%%State Circuits%%lst%% vol%%per%% 34%%lst%% no%%per%% 6%%lst%% pp%%per%% 849–855%%lst%% 
1999%%per%% 
[15] C%%per%%%%dsh%%Y%%per%%]$~ ~$[Huang%%lst%% Y%%per%%%%dsh%%S%%per%%]$~ ~$[Chen%%lst%% Y%%per%%%%dsh%%L%%per%%]$~ ~$[Lin%%lst%% ]^[ Y%%per%%%%dsh%%C%%per%%]$~ ~$[Hsu%%lst%% “Data path allocation 
based on bipartite weighted matching,” in IEEE/ACM DAC%%lst%% 1991%%lst%% pp%%per%% 
499–504%%per%% 
