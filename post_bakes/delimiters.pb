~$[Automated Generation of Banked Memory 
Architectures in the High%%dsh%%Level Synthesis of 
Multi%%dsh%%Threaded Software 
Yu Ting Chen ]^[ Jason H%%per%%]$~ ~$[Anderson 
Department of Electrical ]^[ Computer Engineering%%lst%% University of Toronto%%lst%% Toronto%%lst%% Ontario 
Email%%cln%% joyuting%%per%%chen@mail%%per%%utoronto%%per%%ca%%lst%% janders@ece%%per%%toronto%%per%%edu 
Abstract—Some modern high%%dsh%%level synthesis (HLS) tools [1] 
permit the synthesis of multi%%dsh%%threaded software into parallel 
hardware%%lst%% where concurrent software threads are realized as concurrently operating hardware units%%per%%]$~ ~$[A common performance bottleneck in any parallel implementation (whether it be hardware 
]v[ software) is memory bandwidth – parallel threads demand 
concurrent access to memory resulting in contention which hurts 
performance%%per%%]$~ ~$[FPGAs contain an abundance of independently 
accessible memories offering high internal memory bandwidth%%per%%]$~ 
~$[We describe an approach ]f[ leveraging such bandwidth in 
the context of synthesizing parallel software into hardware%%per%%]$~ 
~$[Our approach applies trace%%dsh%%based proﬁling to determine how 
a program’s arrays should be automatically partitioned into subarrays%%lst%% which are then implemented in separate on%%dsh%%chip RAM 
blocks within the target FPGA%%per%%]$~ ~$[The partitioning is accomplished 
in a way that requires a single HLS execution ]^[ logic simulation ]f[ trace extraction%%per%%]$~ ~$[The end result is that each thread%%lst%% 
when implemented in hardware%%lst%% has exclusive access to its own 
memories to the extent possible%%lst%% signiﬁcantly reducing contention 
]^[ arbitration ]^[ thus raising performance%%per%%]$~ 
~$[Keywords—High%%dsh%%Level Synthesis%%lst%% memory architecture%%lst%% multithreaded HLS%%per%%]$~ 
~$[I%%per%%]$~ 
~$[I NTRODUCTION 
High%%dsh%%level synthesis (HLS) is becoming a prevalent design 
methodology ]f[ FPGAs [5]%%lst%% [11] with the introduction of 
tools such as Vivado HLS from Xilinx [15] ]^[ Altera’s 
OpenCL SDK [8]%%per%%]$~ ~$[HLS is an active area of research with 
signiﬁcant effort being put towards closing the performance%%lst%% 
power ]^[ area gap between HLS%%dsh%%generated hardware ]^[ 
human%%dsh%%expert%%dsh%%designed hardware%%per%%]$~ ~$[In any hardware computing 
system%%lst%% memory is a frequently occurring culprit ]f[ limited 
performance%%scn%% that is%%lst%% memory bandwidth ]^[ contention ]f[ 
memory among multiple accessors are common roots of limited computational throughput%%per%%]$~ ~$[Processors%%lst%% ]^[ the software 
programs that run on them%%lst%% are typically based on the assumption of a single uniﬁed memory address space%%per%%]$~ ~$[FPGAs%%lst%% on the 
other hand%%lst%% contain many small memories%%lst%% distributed spatially%%lst%% 
that can each be accessed concurrently%%per%%]$~ ~$[The 3 approaches ]f[ 
increasing memory bandwidth are i) memory replication%%lst%% ii) 
implementing multi%%dsh%%ported memories ]^[ iii) memory banking 
through partitioning%%per%%]$~ ~$[Memory replication may incur a high 
area cost ]^[ would require a synchronization mechanism 
across multiple copies of the same memory unless the data is 
read%%dsh%%only%%per%%]$~ ~$[Increasing the number of memory ports is expensive 
]^[ may ]n[ be possible on the FPGA since the block RAMs 
have limited port conﬁgurations%%per%%]$~ ~$[In this article%%lst%% we consider 
automated generation of banked on%%dsh%%chip memory architectures 
in the high%%dsh%%level synthesis of parallel software programs into 
parallel FPGA hardware%%lst%% with the goal of reducing memory 
contention ]^[ raising bandwidth%%per%%]$~ 
~$[One of the primary aims in pursuing a hardware implementation vs%%per%% a software implementation is to exploit spatial 
parallelism in the hardware%%per%%]$~ ~$[Towards this%%lst%% some modern highlevel synthesis (HLS) tools%%lst%% such as the LegUp HLS framework 
from the University of Toronto%%lst%% provide spatial exploitation 
capability at the software%%dsh%%speciﬁcation stage by supporting 
the synthesis of parallel software (threads) into parallel hardware [2]%%per%%]$~ ~$[The parallel software threads in multi%%dsh%%threaded C 
programs written using the Pthreads ]v[ OpenMP standards%%lst%% 
are realized as concurrently operating units in hardware%%per%%]$~ ~$[In 
this work%%lst%% we are concerned with the synthesis of memory 
architectures ]f[ such spatially parallel implementations%%lst%% where 
concurrently operating hardware units may vie ]f[ access to 
the same memory ports at the same time%%per%%]$~ ~$[We seek to alleviate such contention through automated synthesis of banked 
architectures such that hardware units have (partially) exclusive 
access to particular ports to the extent possible%%per%%]$~ 
~$[We implement our work in the LegUp HLS framework 
within its Pthreads/OpenMP parallel ﬂow%%per%%]$~ ~$[We ﬁrst augmented 
LegUp with user%%dsh%%constraint%%dsh%%driven array partitioning%%lst%% similar 
to that available in Xilinx’s Vivado HLS tool%%per%%]$~ ~$[Based on usersupplied directives%%lst%% the new functionality permits arrays to 
be partitioned in a variety of different ways by the compiler%%lst%% 
where each partition is then implemented in separate RAMs 
within the FPGA implementation%%per%%]$~ ~$[However%%lst%% two issues exist 
with the constraint%%dsh%%driven approach%%cln%% 1) it can be difﬁcult to 
know which style of array partitioning is best ]f[ a given array 
as it depends on the memory access patterns of the parallel 
program ]^[ also the architecture of the target FPGA%%lst%% ]^[ 
2) specifying array partitioning directives is non%%dsh%%standard%%lst%% ]^[ 
we believe it to be particularly difﬁcult ]f[ software engineers 
with no knowledge of FPGA hardware%%per%%]$~ 
~$[In light of these two issues%%lst%% we propose a memory%%dsh%%trace 
proﬁling%%dsh%%based approach that automatically determines array 
partitionings to realize banked memory architectures offering 
low memory contention ]^[ high bandwidth ]f[ parallel spatial 
hardware as produced by LegUp’s Pthreads/OpenMP ﬂow%%per%%]$~ 
~$[An advantage of the proposed approach is that it requires a 
single HLS execution ]^[ hardware simulation of the generated 
hardware to extract a memory access trace%%lst%% as opposed to 
more exhaustive approaches requiring many synthesis/simulation runs%%per%%]$~ ~$[Speciﬁcally%%lst%% we have developed a memory%%dsh%%trace 
simulator that permits rapid evaluation of various memory 
partitioning schemes (banking architectures) using a single 
execution trace of the hardware with unpartitioned arrays 
through modeling contention ]^[ arbitration%%per%%]$~ 
~$[The key contributions of this paper are%%cln%% 
• 
• 
• 
• 
Infrastructure ]f[ array partitioning implemented in 
the open%%dsh%%source LegUp%%dsh%%HLS framework%%per%%]$~ 
~$[An automated trace%%dsh%%based array partition scheme detection approach using a lightweight memory simulator with the overall goal of reducing execution 
cycles in HLS%%dsh%%generated hardware ]f[ multi%%dsh%%threaded 
software%%per%%]$~ 
~$[Automated arbiter insertion ]^[ support ]f[ cases 
where “exact” thread%%dsh%%driven partitioning is ]n[ possible%%lst%% ]f[ example%%lst%% ]f[ scenarios wherein two threads 
occasionally access the same RAM%%per%%]$~ 
~$[An experimental study demonstrating the efﬁcacy of 
the automated partitioning technique in comparison 
with a brute%%dsh%%force approach%%per%%]$~ 
~$[II%%per%%]$~ 
~$[BACKGROUND 
A%%per%%]$~ ~$[LegUp HLS Tool 
The LegUp HLS tool is implemented within the opensource LLVM compiler [9]%%per%%]$~ ~$[Within LLVM%%lst%% the program is 
represented in the compiler’s intermediate representation (IR)%%lst%% 
which resembles RISC assembly code%%lst%% being composed of 
simple instructions such as multiply%%lst%% add%%lst%% branch%%lst%% jump%%lst%% etc%%per%%]$~ 
~$[Prior to LegUp HLS%%lst%% the program’s IR is subjected to LLVM’s 
compiler optimization passes%%lst%% such as dead%%dsh%%code elimination%%lst%% 
loop rotation%%lst%% ]^[ common sub%%dsh%%expression elimination%%per%%]$~ ~$[LegUp 
takes the optimized IR as input ]^[ performs the traditional 
HLS stages [6] of resource allocation%%lst%% scheduling%%lst%% binding 
]^[ Verilog generation%%per%%]$~ ~$[In this work%%lst%% array partitioning ]f[ 
the purposes of banked memory architecture synthesis is 
implemented as a generic LLVM optimization pass%%per%%]$~ ~$[As will 
be detailed below%%lst%% the original arrays in the IR are broken 
into pieces ]^[ array accesses are steered to the appropriate 
sub%%dsh%%array%%per%%]$~ 
~$[B%%per%%]$~ ~$[Synthesis of Parallel Software to Hardware 
In LegUp’s Pthreads synthesis ﬂow%%lst%% multi%%dsh%%threaded software is synthesized into parallel hardware whose behaviour 
closely matches the software semantics%%per%%]$~ ~$[Each software thread 
is synthesized into an instance of a hardware unit%%per%%]$~ ~$[Pthreads 
library function calls in the original C program are replaced 
with LegUp%%dsh%%speciﬁc wrapper functions that cause speciﬁc 
hardware structures to be produced in the RTL generation 
phase%%per%%]$~ ~$[For example%%lst%% calls to pthread_create are translated into FSM functionality that invokes a hardware unit 
corresponding to a software thread%%per%%]$~ ~$[Support is provided ]f[ 
common thread synchronization approaches including mutexs 
(for critical sections) ]^[ barriers%%per%%]$~ ~$[Ultimately%%lst%% the Pthreads 
ﬂow permits a wide range of spatial parallel implementations 
to be realized through software changes alone%%per%%]$~ ~$[The interested 
reader is referred to [2]%%lst%% [3] ]f[ complete details%%per%%]$~ ~$[Our work 
here seeks to alleviate a speciﬁc (and common) performance 
bottleneck in such parallel hardware%%lst%% namely%%lst%% when multiple 
parallel hardware units contend ]f[ memory%%per%%]$~ 
~$[C%%per%%]$~ ~$[LegUp’s Memory Architecture 
LegUp HLS implements each array structure in a separate 
logical RAM%%per%%]$~ ~$[Depending on its size%%lst%% the logical RAM may be 
implemented in multiple physical block RAMs in the FPGA 
implementation (e%%per%%g%%per%% when the array size exceeds the SRAM 
block size in the FPGA fabric)%%per%%]$~ ~$[For RAMs that may be accessed concurrently by parallel hardware%%lst%% LegUp automatically 
inserts arbitration circuitry%%per%%]$~ ~$[The arbiter permits single%%dsh%%cycle 
access in the absence of contention%%per%%]$~ ~$[Under contention%%lst%% it is 
resolved in a round%%dsh%%robin style%%lst%% in which case a hardware unit 
will stall until it is granted access%%lst%% degrading performance%%per%%]$~ 
~$[Such degradation is particularly common in the Pthreads 
synthesis ﬂow%%per%%]$~ 
~$[Consider%%lst%% ]f[ example%%lst%% parallelized vector addition%%lst%% Z = 
A + B%%lst%% where Z%%lst%% A%%lst%% B are n%%dsh%%element arrays%%per%%]$~ ~$[In a typical 
multi%%dsh%%threaded implementation%%lst%% each thread would operate on 
a portion of the original arrays%%per%%]$~ ~$[With t threads implemented as 
t parallel hardware units there would be signiﬁcant contention 
on the ports of RAMs holding the arrays%%lst%% even if the RAMs 
were in dual%%dsh%%port mode%%per%%]$~ 
~$[LegUp uses “points%%dsh%%to” analysis in LLVM to designate arrays as either local%%lst%% shared%%dsh%%local ]v[ global [3]%%per%%]$~ ~$[Local arrays are 
accessed by a single function in the C code%%per%%]$~ ~$[Shared%%dsh%%local arrays 
are accessed by a limited number of functions%%lst%% as determined 
statically at compile time%%per%%]$~ ~$[For arrays designated as global%%lst%% 
the points%%dsh%%to analysis was unable to statically determine the 
accessors%%per%%]$~ ~$[In hardware%%lst%% such arrays are implemented behind 
a global memory controller that uses a unique tag ]f[ each 
array to steer accesses to the correct SRAM block containing 
the array [1]%%per%%]$~ ~$[For this work%%lst%% we focus on shared%%dsh%%local arrays 
since global memory requests cannot be parallelized due to the 
memory controller ]^[ local memory will be scheduled such 
as to avoid port contentions%%per%%]$~ 
~$[III%%per%%]$~ 
~$[R ELATED W ORK 
A number of recent works have considered memory banking in HLS%%per%%]$~ ~$[Below we highlight those we believe are most relevant to the present research%%per%%]$~ ~$[However%%lst%% an important distinction 
of our work is the focus on the memory architecture synthesis 
in the multi%%dsh%%thread HLS context%%per%%]$~ ~$[Our technique speciﬁcally 
targets the synthesis of banked architectures that result in 
reduced contention among the hardware implementation of 
parallel software%%per%%]$~ ~$[To the authors’ knowledge%%lst%% no prior work 
has considered this scenario%%per%%]$~ 
~$[As with the present work%%lst%% a recent work by Zhou et 
al%%per%% [16] applied a trace%%dsh%%based approach to memory banking ]^[ employed a conﬂict%%dsh%%graph%%dsh%%based approach to map 
memory addresses to banks%%lst%% with emphasis on multiplexer 
size minimization%%per%%]$~ ~$[Formal techniques were used to verify the 
mapping was indeed conﬂict free%%per%%]$~ ~$[As opposed to our approach%%lst%% 
which chooses an architecture from the trace%%lst%% [16] requires 
the number of banks as an input to the algorithm%%lst%% ]^[ solely 
handles the conﬂict%%dsh%%free cases (there is no arbitration)%%per%%]$~ 
~$[Other works include [4] which applies mathematical techniques to the memory partitioning problem%%per%%]$~ ~$[A polyhedral 
model is used to represent memory access patterns in loops 
]^[ legal code transformations%%lst%% ]^[ an integer lattice approach 
is used ]f[ memory partitioning%%lst%% where the objective is to%%cln%% 1) 
minimize contention%%lst%% ]^[ 2) reduce “waste” (unused portions 
of the partitions)%%per%% [10] targets accesses of multi%%dsh%%dimensional arrays in loop bodies ]^[ proposed a closed%%dsh%%form linear mapping 
from array accesses to bank indices to achieve zero conﬂicts 
(and II=1 ]f[ loop pipelining)%%scn%% subsequent optimizations then 
B%%per%%]$~ ~$[Partitioning Implementation 
(a) Complete 
(b) Block 
(c) Cyclic 
(d) Block Cyclic 
Fig%%per%% 1%%cln%% Partitioning schemes applied to 10×10 matrix in the 
row dimension%%per%% 
reduce the bank count ]^[ space wastage%%per%% [13] ]^[ [12] show 
static analyses which look ]f[ hyperplanes in memory accesses 
in loop bodies%%per%%]$~ ~$[The hyperplanes are described by a vector 
]^[ a linear transformation translates between accesses to the 
original multi%%dsh%%dimensional array into accesses in the newly 
partitioned banks%%per%%]$~ ~$[However%%lst%% [7] shows that the hyperplane 
solution does ]n[ always work due to a phenomenon known 
as bank switching%%lst%% wherein the output of one bank may 
be required by multiple hardware accessors%%per%%]$~ ~$[Again%%lst%% these 
works are ]n[ centered on multi%%dsh%%threaded software%%lst%% ]b[ rather%%lst%% 
partitioning of arrays accessed multiple times in a loop body%%per%%]$~ 
~$[The application of geometric (e%%per%%g%%per%% polyhedral) representations of memory accesses in a loop body to the memory 
architecture synthesis problem are ]n[ directly transferable to 
the related problem in the multi%%dsh%%thread memory contention 
context%%per%%]$~ ~$[The static approaches presented focus on ﬁnding 
conﬂict%%dsh%%free mappings%%lst%% however%%lst%% our approach allows ]f[ nonperfect partitions%%per%%]$~ 
~$[IV%%per%%]$~ 
~$[A RRAY PARTITIONING I MPLEMENTATION 
Memory partitioning was implemented as a compiler pass 
in LLVM%%lst%% where the input is the original IR ]^[ the produced 
IR is changed such that memory accesses to the affected arrays 
are modiﬁed to access from the sub%%dsh%%arrays%%per%%]$~ ~$[The pass takes 
advantage of the predicated load/store operations supported by 
LegUp%%per%%]$~ ~$[Predicated loads/stores differ from regular load/store 
instructions in that the memory enable signal is no longer only 
FSM%%dsh%%state dependent%%lst%% ]b[ also dependent on a precomputed 
predicate signal%%per%%]$~ ~$[Predicates are typically the true/false outcome 
of a comparison%%per%%]$~ ~$[Leveraging the predicated load/store%%lst%% the 
array partitioning pass can%%lst%% ]f[ each memory access to a 
partitioned array%%lst%% create multiple predicated memory instructions ]f[ each newly created partition%%lst%% where the predicate 
is a compare instruction of the original index%%per%%]$~ ~$[The compare 
instruction (icmp eq) will evaluate to true only ]f[ one of 
these instructions at run%%dsh%%time%%per%%]$~ ~$[Therefore%%lst%% the array partitioning 
transformation does ]n[ require extra memory bandwidth%%per%%]$~ 
~$[It is worthwhile to explain the detailed behavior surrounding predicated memory accesses%%lst%% arbitration%%lst%% ]^[ partitioning%%per%%]$~ 
~$[Consider a four%%dsh%%thread program%%lst%% where initially all threads 
access a single array%%per%%]$~ ~$[When synthesized to hardware%%lst%% contention ]^[ delays due to arbitration may arise because the 
array%%lst%% implemented as a logical RAM in the FPGA%%lst%% has four 
accessors ]^[ at most two ports%%per%%]$~ 
~$[To resolve the contention%%lst%% assume the array is partitioned 
into four pieces%%lst%% where each thread accesses the partitions in a 
near%%dsh%%exclusive fashion%%lst%% ]f[ example%%lst%% each thread accesses one 
partition 95% of the time%%lst%% ]b[ 5% of the time accesses one 
of the other three partitions%%per%%]$~ ~$[In such a scenario%%lst%% the hardware 
implementation of each thread does indeed issue a predicated 
access to all four partitions%%scn%% however%%lst%% it is only the access ]f[ 
which the predicate is true that is sent to the arbiter%%per%%]$~ ~$[That 
is%%lst%% the accesses associated with false predicates do ]n[ create 
contention in our implementation%%per%%]$~ 
~$[A%%per%%]$~ ~$[Available Partitioning Schemes 
There are 4 supported partitioning schemes ]f[ multidimensional arrays%%cln%% complete%%lst%% block%%lst%% cyclic%%lst%% ]^[ block cyclic 
shown in Fig%%per%% 1%%per%%]$~ ~$[These are similar to the schemes that are 
supported by Vivado HLS%%per%%]$~ ~$[In the complete scheme%%lst%% each array 
element is designated to a separate partition%%per%%]$~ ~$[In the block 
scheme%%lst%% partitions represent contiguous pieces of the original 
array%%per%%]$~ ~$[The cyclic scheme is an interleaved approach%%lst%% where 
array elements a ﬁxed distance apart are allocated to the same 
partition%%per%%]$~ ~$[Block cyclic combines the block ]^[ cyclic schemes%%per%%]$~ 
~$[Partitioning is available in any single dimension of a multidimensional array%%per%%]$~ ~$[For the purposes of this work%%lst%% our focus is 
on globally declared data structures – i%%per%%e%%per%% those which are ]n[ 
locally scoped ]^[ therefore%%lst%% can be shared between multiple 
functions ]v[ threads of the same function%%per%%]$~ 
~$[The speciﬁc partitioning scheme is based on several terms%%cln%% 
• 
• 
• 
Number of Partitions (n)%%cln%% Number of total partitions 
to be created%%per%%]$~ 
~$[Block Size (b)%%cln%% Size of contiguous elements in the 
dimension of partitioning that constitute the partition%%per%%]$~ 
~$[Size (S)%%cln%% Number of elements of the multidimensional array in the dimension of the partitioning%%per%%]$~ 
~$[C%%per%%]$~ ~$[Limit to Power%%dsh%%of%%dsh%%2 Partitions 
In order to access a memory location in the newly partitioned memory scheme%%lst%% the new access will require both 
the new partition number%%lst%% as well as a new index into the 
partition where memory location now resides%%per%%]$~ ~$[The equation to 
determine the new partition number%%lst%% pd %%lst%% is%%cln%% 
pd = id / b % n 
(1) 
where id is the index of the access in the dimension of 
partitioning%%lst%% d%%scn%% b is the block size ]^[ n is the number of 
partitions%%per%%]$~ 
~$[The equation to compute the new index%%lst%% new id %%lst%% into the 
partition is%%cln%% 
new id = (id % b) + id / (b × n) × b 
(2) 
The indices into the other dimensions of the array remain 
unchanged since the other dimensions were ]n[ partitioned%%per%%]$~ 
~$[The above equations hold ]f[ the general case of block 
cyclic partitioning%%per%%]$~ ~$[They can be simpliﬁed in the case of 
complete%%lst%% block%%lst%% ]^[ cyclic%%per%%]$~ ~$[For example%%lst%% notice that in the 
case of complete partitioning%%lst%% b is 1 ]^[ n is S%%lst%% the size of the 
Scheme 
Complete 
Block 
Number Partitions 
Ncmp = {n|n = S} 
Nb = {n|1 < n < S} 
Nc = {n|1 < n < S%%lst%% n ∈ 
{2i |i ∈ N}} 
Nbc = {n|1 < n < S%%lst%% n ∈ 
{2i |i ∈ N}} 
Cyclic 
Block 
Cyclic 
Block Size 
Bcmp = {b|b = 1} 
Bb = {b|1 < b < S%%lst%% b ∈ 
{2i |i ∈ N}} 
Bc = {b|b = 1} 
Cycle 
0 
1 
2 
3 
4 
Bbc = {b|1 < b < S%%lst%% b ∈ 
{2i |i ∈ N}} 
TABLE I%%cln%% Partition conﬁguration set of allowable value ranges 
]f[ number of partition%%lst%% ]^[ block size parameters%%per%% 
array in dimension d of complete partitioning%%per%%]$~ ~$[Therefore%%lst%% the 
equation to determine the new partition number is simply%%lst%% 
p d = id 
(3) 
]^[ the new index is simply equal to 0%%per%%]$~ 
~$[Observe that the above equations heavily rely on the division ]^[ modulo operators%%per%%]$~ ~$[These operations are potentially 
costly from both the performance ]^[ area perspectives in 
LegUp%%dsh%%generated hardware%%per%%]$~ ~$[For example%%lst%% in the division/modulo module LegUp instantiates%%lst%% the number of cycles 
required is proportional to the bitwidths of the division/modulo 
operands%%per%%]$~ ~$[This implies that the cycle%%dsh%%count penalty incurred to 
compute partition number ]^[ index can override any cyclecount reduction afforded by partitioning in the ﬁrst place%%per%%]$~ 
~$[Consequently%%lst%% we limit the solution space such that the 
division operations can be substituted by right shift operations 
]^[ the modulo operations can be substituted by bit%%dsh%%wise 
logical%%dsh%%AND operations%%lst%% which are both trivial in hardware%%per%%]$~ 
~$[Table I shows the values of n ]^[ b that each partitioning 
scheme allows%%per%%]$~ ~$[There is only one possible setting ]f[ complete 
partitioning%%per%%]$~ ~$[In block partitioning%%lst%% we can have any integer 
value greater than 1 ]^[ less than S number of partitions ]^[ 
our block size must be a power of 2 value greater than 1 ]^[ 
less than S%%lst%% where S is the size of the array in the dimension 
of partitioning%%per%%]$~ ~$[In cyclic partitioning%%lst%% we need a power of 2 
number of partitions which is greater than 1 ]^[ less than S 
]^[ a block size of 1%%per%%]$~ ~$[In block cyclic partitioning%%lst%% we must 
have a number of partitions ]^[ block size which are both 
power%%dsh%%of%%dsh%%2 integers greater than 1 ]^[ less than S%%per%%]$~ ~$[Section V%%dsh%%D 
presents the solution space ]f[ a general multi%%dsh%%dimensional 
array%%per%%]$~ 
~$[V%%per%%]$~ 
~$[AUTOMATIC A RRAY PARTITIONING 
A%%per%%]$~ ~$[Overview 
At a high level%%lst%% the automated array partitioning is implemented as follows%%cln%% First%%lst%% the multi%%dsh%%threaded software program%%lst%% 
without any partitioning applied%%lst%% is synthesized to hardware 
using LegUp HLS%%per%%]$~ ~$[The generated RTL is then simulated with 
ModelSim under typical input vectors%%lst%% ]^[ a memory access 
trace is extracted%%lst%% where%%lst%% ]f[ each array/memory access%%lst%% the 
address ]^[ the ID of the thread making the access is tracked%%per%%]$~ 
~$[Following the trace generation%%lst%% the trace itself%%lst%% as well as 
a hypothetical array partitioning scheme are inputted to our 
memory simulator%%lst%% which%%lst%% ]f[ the proposed scheme%%lst%% estimates 
its performance beneﬁts%%per%%]$~ ~$[With the single HLS execution ]^[ 
trace generation%%lst%% we are able to assess the consequences of 
various partitioning schemes%%per%%]$~ ~$[And%%lst%% by simulating a variety of 
different partitioning schemes%%lst%% an optimal memory banking 
architecture can be determined%%per%%]$~ ~$[We elaborate on the steps in 
the subsections below%%per%%]$~ 
~$[Thread 0 
access 0 
access 1 
access 1 
Thread 1 
access 3 
access 3 
access 4 
access 4 
access 2 
(a) Thread access schedule 
Thread 0 
access 0 
Thread 1 
access 3 
distance%%cln%% 1 
access 1 
distance%%cln%% 1 
access 4 
distance%%cln%% 2 
access 2 
(b) Memory access chain 
Fig%%per%% 2%%cln%% Memory access schedule of 2 threaded execution to 
memory access chain%%per%%]$~ 
~$[B%%per%%]$~ ~$[Memory Trace Collection 
We modiﬁed the RTL%%dsh%%generation of the LegUp HLS tool 
to produce the relevant trace data in ModelSim simulation%%per%%]$~ 
~$[Speciﬁcally%%lst%% a $display statement is inserted whenever a 
request is made to a shared memory since it can be easily 
detected through the request_in vector of the associated 
arbiter%%per%%]$~ ~$[The information attached to each shared memory 
request is the cycle of the initial request%%lst%% the speciﬁc block 
RAM being requested%%lst%% the port name%%lst%% the function trying to 
access the RAM%%lst%% the instance number in the case of multithreaded functions%%lst%% ]^[ the address of the request to be used 
later ]f[ determining possible partition schemes%%per%%]$~ 
~$[C%%per%%]$~ ~$[Memory Partitioning Simulator 
The memory simulator is a program which aims to model 
the arbitration of requests to a particular port of a speciﬁc block 
RAM%%per%%]$~ ~$[The program is written using Python%%per%%]$~ ~$[The simulator 
will%%lst%% based on any partitioning scheme ]^[ an input memory 
trace collected during the unpartitioned execution%%lst%% determine 
the number of port contentions that will occur%%lst%% as well as 
the cycle number in which the last memory request will be 
serviced%%per%%]$~ 
~$[The program ﬁrst creates a representation of the unpartitioned execution memory accesses as a chain of nodes in 
which each node represents a memory access ]^[ the edge 
weights between the nodes represent the distance%%lst%% i%%per%%e%%per%% the 
intrinsic number of cycles between accesses%%per%%]$~ ~$[The distance may 
]n[ be the same as the number of cycles between accesses 
in an execution trace since the trace captures cycles lost to 
contention%%per%%]$~ ~$[Fig%%per%% 2 shows a series of scheduled accesses ]f[ 
a program running 2 threads%%lst%% as well as the memory access 
chains that are created from the memory trace%%per%%]$~ ~$[The boxed 
accesses represent the requests granted in that cycle%%lst%% while the 
unboxed accesses represent the accesses which stalled due to 
contention%%per%%]$~ ~$[As seen here%%lst%% the cycle difference between when 
access 0 is granted ]^[ when access 1 is granted is 2%%per%%]$~ ~$[However%%lst%% 
the distance will measure 1 cycle%%lst%% because the distance captures 
the number of cycles between accesses in the absence of 
contention%%per%%]$~ 
~$[Once the memory access chain is gathered%%lst%% the simulator 
will “execute” the trace%%lst%% where the memory accesses are 
scheduled according to the partitioning scheme under test%%lst%% 
since we know the order of all memory accesses by each 
requester%%lst%% as well as the speciﬁc addresses being accessed%%lst%% 
which can tell us which partition the access would belong to%%per%%]$~ 
~$[The simulator has an in%%dsh%%memory model of the round%%dsh%%robin 
arbiter instantiated by LegUp ]^[ therefore%%lst%% it is able to assess 
cycles lost to contention%%lst%% i%%per%%e%%per%% a requester waiting ]f[ a “grant” 
from the arbiter%%per%%]$~ 
~$[Listing 1 shows pseudocode ]f[ simulating the scheduling 
of a memory access trace ]f[ a particular array partitioning 
conﬁguration%%lst%% partitionConfig%%per%%]$~ ~$[Our approach bears similarity to event%%dsh%%driven logic simulation%%per%%]$~ ~$[Here%%lst%% setQ is a set of 
queues%%cln%% one ]f[ each arbiter in the partitioning scheme being 
simulated%%per%%]$~ ~$[Each queue stores the pending memory requests 
]f[ a port on a memory bank%%per%%]$~ ~$[Initially%%lst%% all arbiter queues are 
initialized to empty%%per%%]$~ 
~$[Listing 1%%cln%% Algorithm ]f[ simulating a memory partitioning 
scheme 
1 
2 
3 
4 
5 
6 
7 
8 
9 
10 
11 
12 
13 
14 
15 
16 
17 
18 
19 
setQ %%cln%% c u r r e n t pending a c c e s s e s f o r each a r b i t e r 
T %%cln%% memory t r a c e 
f o r each Q in setQ { 
Q = {} 
} 
cycle = f i r s t access cycle in T 
w h i l e ( ! done ) { 
done = T r u e 
f o r each Q in setQ { 
p o p u l a t e Q (Q%%lst%% p a r t i t i o n C o n f i g %%lst%% c y c l e %%lst%% T ) 
e x e c u t e C y c l e (Q) 
} 
c y c l e ++ 
f o r each Q in setQ { 
i f Q ! empty | | a c c e s s e s i n T { 
done = F a l s e 
} 
} 
} 
We commence simulation at the cycle of the ﬁrst memory 
access (line 6) ]^[ enter the while loop (line 7)%%per%%]$~ ~$[For 
each arbiter present in the design (line 9)%%lst%% as speciﬁed by 
partitionConfig%%lst%% we use the present cycle%%lst%% as well as the 
trace T to populate the queue with active requests (line 10)%%per%%]$~ 
~$[The populateQ function (not shown) takes accesses from 
the trace T which occur at time cycle%%lst%% ]^[ ]f[ each such 
access%%lst%% uses knowledge about the partitioning scheme to create 
a request in a speciﬁc queue%%per%%]$~ ~$[Then%%lst%% the executeCycle 
function (line 11) uses an internal arbiter model to determine 
the request in each queue which will receive the grant%%scn%% this 
request is removed from the queue%%per%%]$~ ~$[This process continues 
until there are no more requests outstanding in any arbiterrequest queues ]^[ when the trace is empty (line 15)%%per%%]$~ ~$[Upon 
termination%%lst%% the cycle variable holds the cycle index of 
the last%%dsh%%serviced memory request%%per%%]$~ ~$[Partitioning schemes which 
reduce this quantity are generally desirable%%per%%]$~ 
~$[D%%per%%]$~ ~$[Finding the Optimal Solution 
We take a brute%%dsh%%force approach to ﬁnding the optimal partitioning solution%%per%%]$~ ~$[This means we iterate through all the possible 
partitioning schemes1 %%lst%% while predicting the number of cycles 
needed in order to complete all the memory accesses collected 
in the trace%%lst%% as well as the number of cycles associated with 
stalls due to memory contention%%per%%]$~ 
~$[To provide insight on the size of the solution space%%lst%% the 
total number of partitioning schemes that may be applied to 
one multi%%dsh%%dimensional array is%%cln%% 
N U Mtotal = N U Mb + N U Mc + N U Mcmp + N U Mbc (4) 
where N U Mb %%lst%% N U Mc %%lst%% N U Mcmp %%lst%% ]^[ N U Mbc represent the 
number of solutions ]f[ block%%lst%% cyclic%%lst%% complete%%lst%% ]^[ block 
1 We ignore schemes that are trivially non%%dsh%%optimal ]^[ that warrant no 
further analysis%%lst%% e%%per%%g%%per%% where the number of partitions far exceeds the number 
of threads%%per%% 
cyclic partitioning%%lst%% respectively%%per%%]$~ ~$[We note that%%cln%% 
N U Mcmp = D 
(5) 
where D is the number of dimensions of the multi%%dsh%%dimensional 
array%%scn%% that is%%lst%% ]f[ each array dimension%%lst%% there is a single 
complete partitioning%%per%%]$~ ~$[We also need to deﬁne a function Φ 
that ﬁnds the largest power%%dsh%%of%%dsh%%2 number less than the input%%per%%]$~ 
~$[With reference to the variables in Table I%%lst%% we have%%cln%% 
N U Mb = |Bb | = 
D−1 
 
log2 (Φ(Sd )) 
(6) 
d=0 
where Sd is the number of elements in dimension d%%per%%]$~ ~$[The 
solution%%dsh%%set size ]f[ block partitioning is equal to the cardinality of the set of allowed values ]f[ the block size (in each 
dimension we have the option to choose any power%%dsh%%of%%dsh%%2%%dsh%%sized 
block size)%%per%%]$~ ~$[For cyclic%%cln%% 
N U Mc = |Nc | = 
D−1 
 
log2 (Φ(Sd )) 
(7) 
d=0 
Likewise%%lst%% the solution%%dsh%%set size ]f[ cyclic partitioning is equal 
to the cardinality of the set of allowed values ]f[ the number 
of partitions%%per%%]$~ ~$[For block%%dsh%%cyclic partitioning%%cln%% 
N U Mbc = 
D−1 
 log2 (Φ(S 
d ))−1 
d=0 
log2 (Φ(Sd )) − i 
(8) 
i=1 
The outer sum is over all dimensions%%per%%]$~ ~$[The inner sum is 
the solution space size ]f[ each dimension%%per%%]$~ ~$[The inner sum 
index i deﬁnes the legal block sizes ]f[ block cyclic partitioning%%cln%% the block sizes are 2i %%lst%% ]^[ therefore range from 21 to 
2log2 (Φ(Sd ))−1 in powers%%dsh%%of%%dsh%%2%%per%%]$~ ~$[The reason that block sizes of 
20 = 1 ]^[ 2log2 (Φ(Sd )) are excluded from the sum bounds is 
that these solutions are standard cyclic%%lst%% ]^[ block partitioning%%lst%% 
respectively (already counted above in the N U Mc ]^[ N U Mb 
terms)%%per%%]$~ ~$[For each legal block size%%lst%% log2 (Φ(Sd )) − i counts 
the number of ways the block size can be assigned to banks 
(number of partitions)%%per%%]$~ 
~$[Consider the simple case of a 2%%dsh%%dimensional array of 
33 × 16 elements%%lst%% D in this case is 2%%lst%% S0 is 16 ]^[ S1 is 
33%%per%%]$~ ~$[Let us take a look at the row dimension (1)%%lst%% |Pb | = 5%%lst%% 
|Pc | = 5%%lst%% ]^[ |Pbc | = 10%%per%%]$~ ~$[If we elaborate the block cyclic set 
we get |Pbc | = 4 + 3 + 2 + 1%%lst%% where each term corresponds 
to the number of solutions ]f[ when the block size is 2%%lst%% 4%%lst%% 8%%lst%% 
]^[ 16%%lst%% respectively%%per%%]$~ 
~$[The above represents the solution%%dsh%%set size ]f[ a single array%%per%%]$~ 
~$[When there are multiple arrays within the same program%%lst%% 
the exploration space becomes a Cartesian product of all 
the possible partitioning schemes of each array%%lst%% which may 
become very large even ]f[ modestly sized arrays%%per%%]$~ ~$[The bruteforced approach ]f[ enumerating partitioning possibilities does 
]n[ scale well with the size of the solution space nor with the 
memory trace size%%per%%]$~ ~$[In future work%%lst%% a pruning approach can be 
used to remove partitioning possibilities when they are known 
to perform worse than other schemes%%per%%]$~ ~$[Large memory traces 
will take longer time to process%%lst%% to deal with this issue%%lst%% we 
can use a sampling approach%%lst%% where smaller trace portions 
can be gathered at various intervals in order to get a small ]b[ 
representative version of the memory trace%%per%% 
where partition type is one of the following ∗%%lst%% b%%lst%% c%%lst%% bc which 
stands ]f[ complete%%lst%% block%%lst%% cyclic%%lst%% ]v[ block cyclic%%per%%]$~ ~$[For example%%lst%% if we wanted to partition a M × N matrix into 2 blocks%%lst%% 
where the ﬁrst block contains the elements in all the rows ]f[ 
columns in range 0 to N/2 − 1 ]^[ the second block contains 
the elements in all the rows ]f[ columns in range N/2 to N −1%%lst%% 
then the partitioning scheme would be 0b2 which stands ]f[ 
block partition into 2 blocks in the column dimension%%per%% 
matrixadd area comparison 
3 
wall%%dsh%%clock time 
Fmax 
ALMs 
RAMs 
area%%dsh%%delay product 
2 
1 
c1 
6 
2 
0 
0b 
dimension of partitionpartition typen[ b] 
As a representative example%%lst%% we examine the matrixadd 
benchmark in detail ]^[ assess its performance versus area 
trade%%dsh%%offs%%per%% 
6 
c1 
6 
4 
0c 
16 
In the performance evaluation of our array partitioning 
pass%%lst%% we run each benchmark with 8 threads across all partitioning schemes%%lst%% where the number of partitions does ]n[ 
exceed 16%%per%%]$~ ~$[The notation used ]f[ the partitioning schemes ]f[ 
the rest of the paper is as follows%%cln%% 
C%%per%%]$~ ~$[Partitioning Performance vs%%per%%]$~ ~$[Area 
1b 
1 
B%%per%%]$~ ~$[Partitioning Performance Results 
From Table II we observe that generally multiple partitioning schemes may yield the same cycle count%%per%%]$~ ~$[However%%lst%% 
we know intuitively that partitioning schemes requiring more 
partitions will yield designs with lower clock frequencies ]^[ 
more area since higher numbers of partitions means more 
arbitration logic%%per%%]$~ ~$[We will discuss area versus performance 
trade%%dsh%%offs in the following section%%per%% 
1b 
Matrixadd performs the summation of the elements of a 
128×128 input integer matrix%%lst%% where each thread is responsible 
]f[ the summation of a chunk of rows%%per%%]$~ ~$[Histogram reads a 
32768 element input array ]^[ counts the number elements 
which belong to a certain value range into a local array%%per%%]$~ 
~$[Matrixmult performs matrix multiplication on two 32×32 input 
matrices – matrixA ]^[ matrixB%%lst%% where each thread is 
responsible ]f[ computing the results of a chunk of rows%%per%%]$~ 
~$[Matrixmult (cyclic) is a variation on the matrixmult benchmark%%lst%% 
where each thread is responsible ]f[ computing the output ]f[ 
each row in a cyclic manner%%lst%% where thread 0 will compute 
the outputs of row 0%%lst%% 8%%lst%% 16%%lst%% etc%%per%%]$~ ~$[Additionally%%lst%% matrixmult was 
modiﬁed such that each thread accesses matrixB with an 
offset to a different set of columns to allow ]f[ parallelization 
of accesses to columns%%per%%]$~ ~$[Matrixtrans performs matrix transpose 
on a 128×128 input matrix%%lst%% where each thread transposes 
each row of the input ]f[ a contiguous slice of columns 
into the output%%per%%]$~ ~$[For example%%lst%% thread 0 is responsible ]f[ 
transposing ]f[ all rows between columns 0 %%dsh%% 15 ]f[ the input 
matrix%%per%%]$~ ~$[Matrixtrans (block cyclic) is a variant on matrixtrans 
benchmark%%lst%% where each thread transposes a chunk of rows of 
the input ]f[ all columns into the output in a block cyclic 
manner%%per%%]$~ ~$[For example%%lst%% thread 0 is responsible ]f[ transposing 
rows 0%%dsh%%3%%lst%% 32%%dsh%%35%%lst%% 64%%dsh%%67%%lst%% ]^[ 96%%dsh%%99 ]f[ all columns of the input 
matrix%%per%%]$~ ~$[Los (line of sight) consists of a 64×64 obstacle map 
in which each pixel can take on the values of either 1 ]v[ 0%%lst%% 
where 1 represents an obstacle ]^[ 0 represents unoccupied 
space ]^[ a human is assumed to be situated in the middle of 
the obstacle map%%per%%]$~ ~$[The threads will sweep through the obstacle 
map at each map coordinate ]^[ steps in the direction of the 
human located at the center to determine whether there is an 
obstacle between the beginning location ]^[ the human%%per%%]$~ ~$[If 
there is%%lst%% then that coordinate location is ]n[ within the line of 
sight of the human ]^[ thus will be marked as 0 on the output 
map%%lst%% otherwise it will be marked 1%%per%%]$~ ~$[This benchmark is input 
dependent ]^[ is ]n[ intuitive in terms of which partitioning 
scheme is the most optimal%%per%% 
0b 
c8 
1b 2 
c8 
8 
1b 
8 
The evaluation of array partitioning on circuit performance%%lst%% as well as the accuracy of the memory simulator 
were performed using 8 multi%%dsh%%threaded benchmarks%%cln%% matrixadd%%lst%% histogram%%lst%% matrixmult%%lst%% matrixmult (cyclic)%%lst%% matrixtrans%%lst%% 
matrixtrans (block cyclic)%%lst%% substring%%lst%% ]^[ los%%per%% 
16 
1b 
4 
A%%per%%]$~ ~$[Benchmark Description 
First%%lst%% we present the execution cycles reduction results in 
Table II%%per%%]$~ ~$[The second column shows the cycle count ]f[ the 
baseline unpartitioned case ]f[ the parallel kernel region only 
(not including error checking)%%scn%% the third column shows the 
cycle count of the partitioned cases leading to the lowest cycle 
count also ]f[ the parallel kernel region%%scn%% the fourth column 
shows the cycle of the last memory access to the arrays 
under partitioning%%lst%% which will be useful ]f[ comparison in 
Section VI%%dsh%%D%%scn%% the ﬁfth column shows the cycle count speedup 
of the partitioned over the unpartitioned case%%scn%% ]^[ column 
six shows the partitioning scheme(s) that lead to the best 
cycle count%%per%%]$~ ~$[In matrixmult%%lst%% matrixmult (cyclic)%%lst%% matrixtrans%%lst%% 
]^[ matrixtrans (block cyclic) the benchmarks each contain 2 
matrices%%lst%% ]^[ both can be partitioned%%per%%]$~ ~$[The results presented 
show the partitioning schemes leading to the best cycle execution ]f[ the matrix matrixA in matrixmult ]^[ matrixmult 
(cyclic)%%lst%% ]^[ ]f[ the matrix input_array in matrixtrans 
]^[ matrixtrans (block cyclic)%%per%%]$~ ~$[Since the access patterns ]f[ 
the 2 matrices in these 4 benchmarks are transposed of each 
other%%lst%% i%%per%%e%%per%% ]f[ matrixmult matrixA is accessed row by row 
while matrixB is accessed column by column%%lst%% the partition 
scheme which leads to the best cycles execution in one matrix 
can simply be applied to the other matrix in the opposite 
dimension%%per%%]$~ ~$[This means%%lst%% the partitioning scheme leading to 
one of the lowest cycle count ]f[ matrixadd is 0b16 ]f[ 
matrixA ]^[ 1b16 ]f[ matrixB%%per%%]$~ ~$[The geomean speedup of 
all 8 benchmarks is 2%%per%%21×%%per%% 
1b 
c4 
E XPERIMENTAL R ESULTS 
Normalized Performance ]^[ Area 
VI%%per%%]$~ 
~$[Fig%%per%% 3%%cln%% Area ]^[ wall%%dsh%%clock time variations among “best” 
performing matrixadd partitions%%per%%]$~ 
~$[Fig%%per%% 3 shows the relative wall%%dsh%%clock time%%lst%% Fmax%%lst%% ALMs 
]^[ RAM usage%%lst%% ]^[ area%%dsh%%delay products of the 9 partitioning 
schemes leading to the best cycle count found through ModelSim simulation%%per%%]$~ ~$[All values are normalized to the unpartitioned 
design results%%per%%]$~ ~$[The area%%dsh%%delay product is calculated using the 
relative area%%dsh%%scaling factors presented in [14]%%per%%]$~ ~$[The scaling 
benchmark 
matrixadd 
histogram 
matrixmult 
matrixmult (cyclic) 
matrixtrans 
matrixtrans (blockcyclic) 
parallel region cycles 
16396 
4157 
33077 
24013 
32839 
16799 
32837 
16794 
16395 
6423 
16482 
6348 
substring 
los 
16396 
83217 
last memory cycle 
4163 
23987 
16793 
16789 
6419 
6344 
speedup 
3%%per%%94 
1%%per%%38 
1%%per%%95 
1%%per%%95 
2%%per%%55 
2%%per%%60 
4117 
79537 
3%%per%%98 
1%%per%%05 
4120 
79543 
partition schemes 
1b4%%lst%% 1b8%%lst%% 1b16%%lst%% 0c16%%lst%% 0bc8 2%%lst%% 0bc16 2%%lst%% 1bc4 16%%lst%% 1bc8 8%%lst%% 1bc16 4 
0b8%%lst%% 0b16 
0b16%%lst%% 1b4%%lst%% 1b8%%lst%% 1b16%%lst%% 0c8%%lst%% 0c16%%lst%% 1c16%%lst%% 0bc4 2%%lst%% 0bc8 2%%lst%% 1bc4 4%%lst%% 1bc8 2 
0b16%%lst%% 1b16%%lst%% 0c8%%lst%% 0c16%%lst%% 1c4%%lst%% 1c8%%lst%% 1c16%%lst%% 0bc4 2%%lst%% 0bc8 2%%lst%% 1bc4 2%%lst%% 1bc8 2 
0b4%%lst%% 0b8%%lst%% 0b16%%lst%% 0c8%%lst%% 0c16%%lst%% 0bc4 2%%lst%% 0bc8 2%%lst%% 0bc8 4%%lst%% 0bc8 8%%lst%% 0bc16 2%%lst%% 0bc16 4 
0c8%%lst%% 0c16%%lst%% 1c16%%lst%% 1b16%%lst%% 0bc4 2%%lst%% 0bc8 2%%lst%% 0bc16 2%%lst%% 1bc4 4%%lst%% 1bc4 8%%lst%% 1bc8 2%%lst%% 
1bc8 4%%lst%% 1bc8 8%%lst%% 1bc16 2%%lst%% 1bc16 4 
0c4%%lst%% 0c8%%lst%% 0c16%%lst%% 0b8%%lst%% 0b16%%lst%% 0bc8 2%%lst%% 0bc8 1024%%lst%% 0bc16 2%%lst%% 0bc16 512 
1bc16 2 
TABLE II%%cln%% Baseline unpartitioned versus best partition scheme(s) execution cycles%%per%% 
matrixadd performance 
however%%lst%% the clock frequency reduces between 8 partitions to 
16 partitions from 90%%per%%39 MHz to 78%%per%%55 MHz%%lst%% while the ALM%%lst%% 
register%%lst%% ]^[ RAM usage all increase as we expect%%per%% 
183%%per%%26 
16,376 
cycles 
16,396 14,720 
contentions 
Wall%%dsh%%clock Time[μs] 
89%%per%%48 
D%%per%%]$~ ~$[Evaluation of the Memory Simulator 
·104 
7,681 
55%%per%%97 
5,119 
1 2 
4 
52%%per%%92 
45%%per%%99 
4,157 
1%%per%%5 
4,157 
0 
8 
number of partitions 
16 
0 
(a) Performance result comparing total execution cycles of benchmark 
as well as the number of resulting contentions ]^[ wall%%dsh%%clock time 
computed using the Fmax achieved%%per%%]$~ 
~$[Predicted cycle 
8,214 
1 
0%%per%%5 
0%%per%%5 
matrixadd area 
68 68 
1 2 
1%%per%%5 
5,253 
3,821 
ALMs 
registers 
RAMs 
Fmax[MHz] 
4 
·104 
·104 
78%%per%%55 
4,918 
2,845 
2,689 
1%%per%%5 
(a) matrixadd benchmark 
8,478 
60 
90%%per%%39 
6,127 
8 
number of partitions 
16 
(b) Area result comparing total number of ALMs%%lst%% registers%%lst%% block 
RAMs%%lst%% as well as the Fmax achieved after static timing analysis%%per%%]$~ 
~$[Fig%%per%% 4%%cln%% Performance ]^[ area comparison ]f[ matrixadd benchmark with block cyclic partitioning across different numbers 
of partitions with block size 2%%per%% 
factor ]f[ the ALUT (half%%dsh%%ALM) is presented as 0%%per%%05 in [14]%%lst%% 
which we multiply by 2 to estimate the area of a full ALM%%per%%]$~ ~$[The 
scaling factor ]f[ an M9K RAM block is given as 2%%per%%87 in [14]%%lst%% 
which we multiply by 1%%per%%1 to estimate the area of an M10K 
RAM%%per%%]$~ ~$[Notice that even among these “optimal” partitionings%%lst%% 
the normalized area%%dsh%%delay product ﬂuctuates between 0%%per%%31 to 
0%%per%%63%%per%%]$~ ~$[The main cause of this is due to the high area cost of 
partitioning in some of these schemes%%per%%]$~ 
~$[It is also important to observe that partitioning leads to 
diminishing returns in terms of cycle count%%lst%% ]b[ may incur 
signiﬁcant area costs%%per%%]$~ ~$[Fig%%per%% 4a ]^[ Fig%%per%% 4b show the performance 
]^[ area of the matrixadd benchmark respectively under blockcyclic partitioning in the column dimension (0) ]f[ various 
numbers of partitions ]^[ a block size of 2%%per%%]$~ ~$[Observe that the 
execution cycles reaches a minimum ]f[ 8 ]^[ 16 partitions%%lst%% 
Predicted cycle 
4,325 
4,029 
4 
8,442 
68 
68 
91%%per%%8 91%%per%%46 
89%%per%%47 
1 
Actual cycle 
1 
0%%per%%5 
0%%per%%5 
1 
Actual cycle 
1%%per%%5 
·104 
(b) substring benchmark 
Fig%%per%% 5%%cln%% Memory simulator predicted versus actual cycle of last 
memory access%%per%%]$~ 
~$[The goal of the memory simulator is to accurately predict 
the schedule of memory accesses of the circuit under various 
partitioning schemes from a memory access trace gathered 
from an unpartitioned implementation of the circuit under 
a representative input%%per%%]$~ ~$[The size of the exploration space is 
described in Section V%%dsh%%D%%per%%]$~ ~$[In this evaluation%%lst%% we perform a 
prediction of the execution cycle count under all possible 
partition schemes where the number of partitions does ]n[ 
exceed 16 ]^[ compare the results to the results from Table II 
in Section VI%%dsh%%B to see if i) the optimal partitioning schemes 
were detected ]^[ if ii) the predicted cycle of last memory 
access reported by the memory simulator matches the actual 
cycle from ModelSim simulation%%per%%]$~ 
~$[Table III shows the predicted ]^[ actual cycle of last 
memory access of the partitioned arrays%%lst%% the absolute percent%%dsh%% 
benchmark 
actual cycle of last 
memory access 
4163 
23987 
16799 
16789 
6419 
6344 
% error 
matrixadd 
histogram 
matrixmult 
matrixmult (cyclic) 
matrixtrans 
matrixtrans (blockcyclic) 
predicted cycle of 
last memory access 
4163 
23987 
16793 
16789 
6420 
6345 
substring 
los 
4117 
79537 
4117 
79537 
16%%per%%52 
0 
0 
0%%per%%004 
0%%per%%03 
0%%per%%16 
0%%per%%01 
0%%per%%01 
partitioning schemes 
1b4%%lst%% 1b8%%lst%% 1b16%%lst%% 0c16%%lst%% 0bc8 2%%lst%% 0bc16 2%%lst%% 1bc4 16%%lst%% 1bc8 8%%lst%% 1bc16 4 
0b8%%lst%% 0b16 
0b16%%lst%% 1b4%%lst%% 1b8%%lst%% 1b16%%lst%% 0c8%%lst%% 0c16%%lst%% 1c16%%lst%% 0bc4 2%%lst%% 0bc8 2%%lst%% 1bc4 4%%lst%% 1bc8 2 
0b16%%lst%% 1b16%%lst%% 0c8%%lst%% 0c16%%lst%% 1c4%%lst%% 1c8%%lst%% 1c16%%lst%% 0bc4 2%%lst%% 0bc8 2%%lst%% 1bc4 2%%lst%% 1bc8 2 
0b4%%lst%% 0b8%%lst%% 0b16%%lst%% 0c8%%lst%% 0c16%%lst%% 0bc4 2%%lst%% 0bc8 2%%lst%% 0bc8 4%%lst%% 0bc8 8%%lst%% 0bc16 2%%lst%% 0bc16 4 
0c8%%lst%% 0c16%%lst%% 1c16%%lst%% 1b16%%lst%% 0bc4 2%%lst%% 0bc8 2%%lst%% 0bc16 2%%lst%% 1bc4 4%%lst%% 1bc4 8%%lst%% 1bc8 2%%lst%% 
1bc8 4%%lst%% 1bc8 8%%lst%% 1bc16 2%%lst%% 1bc16 4 
0c8%%lst%% 0c16%%lst%% 0b8%%lst%% 0b16%%lst%% 0bc8 2%%lst%% 0bc8 1024%%lst%% 0bc16 2%%lst%% 0bc16 512 (missing%%cln%% 0c4) 
1bc16 2 
TABLE III%%cln%% Memory simulator evaluation ]f[ 16 partitions ]^[ under%%per%% 
age error ]f[ all cases of partitioning%%lst%% where the number of 
partitions is equal ]v[ less than 16%%lst%% as well as the partition 
schemes predicted by the memory simulator to have the lowest 
last cycle of memory access%%per%%]$~ ~$[Fig%%per%% 5a shows the accuracy of 
the memory simulator ]f[ the matrixadd benchmark%%lst%% where 
the horizontal axis plots the actual cycle of the last memory 
access to the arrays of interest ]^[ the vertical axis plots the 
predicted cycle of last memory access%%per%%]$~ ~$[The closer to the red 
line the data falls%%lst%% the more accurate the prediction%%per%%]$~ ~$[Fig%%per%% 5b 
shows the accuracy of the memory simulator ]f[ the substring 
benchmark%%per%%]$~ ~$[The absolute percentage error ]f[ the substring 
benchmark is 16%%per%%52%%%per%%]$~ ~$[The source of error was determined to 
be differences in scheduling due to different port bindings ]f[ 
memory accesses between the original unpartitioned case%%lst%% from 
which we extract the memory access chain%%lst%% ]^[ the memory 
port binding during the HLS of the partitioned case%%per%%]$~ 
~$[For 7 of the 8 test cases%%lst%% the memory simulator was able to 
accurately predict the partitioning schemes which lead to the 
lowest execution cycles%%per%%]$~ ~$[In the case of substring%%lst%% the memory 
simulator missed 1 of the 9 best partitioning schemes%%per%%]$~ ~$[These 
results are encouraging since looking from the variety of best 
partitioning schemes%%lst%% we see that many of these schemes are 
non%%dsh%%intuitive%%per%%]$~ ~$[This means that it is hard ]f[ a designer to 
realize that the partitioning scheme 1bc4 16 ]f[ the benchmark 
matrixadd leads to one of the best solutions%%per%%]$~ ~$[As seen from 
the area comparison in Fig%%per%% 3%%lst%% this solution actually leads to 
the lowest normalized area%%dsh%%delay product%%per%%]$~ ~$[This is where the 
memory simulator%%dsh%%driven automatic memory partitioning tool 
becomes a useful tool in detecting multiple good solutions to 
prune the exploration space ]f[ the hardware/software designer%%per%%]$~ 
~$[VII%%per%%]$~ 
~$[C ONCLUSION 
Memory access is often a performance bottleneck in computer hardware%%per%%]$~ ~$[In this paper%%lst%% we considered memory architecture synthesis in the HLS context%%lst%% speciﬁcally in the synthesis 
of parallel hardware from parallel multi%%dsh%%threaded software%%per%%]$~ ~$[We 
implemented ﬂexible array partitioning as an LLVM compiler 
pass within the LegUp HLS framework%%per%%]$~ ~$[The array partitions 
are implemented as separate logical RAMs (banks) in the 
hardware%%lst%% with arbiters inserted to manage concurrent accesses 
among threads%%per%%]$~ ~$[With the banked architecture synthesis%%lst%% the 
geomean speed up of the parallel execution cycles is 2%%per%%21×%%lst%% 
across 8 benchmarks%%per%%]$~ 
~$[As it is onerous ]f[ one to select an array partitioning ]^[ 
specify it using specialized compiler pragmas%%lst%% we devised an 
automatic memory partitioning tool that uses a cycle accurate 
memory simulator%%lst%% which%%lst%% with an accurate model of memory 
access arbitration can predict with an average absolute percent 
error of 2%%per%%09% the last memory cycle of access of our 8 
multi%%dsh%%threaded benchmarks%%per%%]$~ ~$[The simulator can be applied to 
automatically select the best partitioning ]f[ an array%%per%%]$~ 
~$[Future work will look at the interdependency of memory 
bank architecture synthesis ]^[ the memory port binding step 
of the HLS ﬂow%%lst%% as well as how selective multi%%dsh%%pumping of 
memories may be combined with the proposed partitioning 
techniques%%per%%]$~ ~$[The brute%%dsh%%force partitioning scheme enumeration 
approach can also be swapped ]f[ a smarter pruning approach 
in order to make programs with multiple arrays tractable in 
this trace%%dsh%%based solution%%per%%]$~ 
~$[R EFERENCES 
[1] 
[2] 
[3] 
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
[15] 
[16] 
A%%per%%]$~ ~$[Canis%%lst%% J%%per%%]$~ ~$[Choi%%lst%% M%%per%%]$~ ~$[Aldham%%lst%% V%%per%%]$~ ~$[Zhang%%lst%% A%%per%%]$~ ~$[Kammoona%%lst%% T%%per%%]$~ ~$[Czajkowski%%lst%% 
S%%per%%]$~ ~$[D%%per%%]$~ ~$[Brown%%lst%% ]^[ J%%per%%]$~ ~$[H%%per%%]$~ ~$[Anderson%%per%%]$~ ~$[LegUp%%cln%% An open%%dsh%%source high%%dsh%%level 
synthesis tool ]f[ FPGA%%dsh%%based processor/accelerator systems%%per%%]$~ ~$[ACM 
Trans%%per%%]$~ ~$[Embed%%per%%]$~ ~$[Comput%%per%%]$~ ~$[Syst%%per%%%%lst%% 13(2)%%lst%% 2013%%per%%]$~ 
~$[J%%per%%]$~ ~$[Choi%%lst%% J%%per%%]$~ ~$[Anderson%%lst%% ]^[ S%%per%%]$~ ~$[Brown%%per%%]$~ ~$[From software threads to parallel 
hardware in FPGA high%%dsh%%level synthesis%%per%%]$~ ~$[In IEEE FPT%%lst%% pages 270–279%%lst%% 
2013%%per%%]$~ 
~$[J%%per%%]$~ ~$[Choi%%lst%% S%%per%%]$~ ~$[Brown%%lst%% ]^[ J%%per%%]$~ ~$[Anderson%%per%%]$~ ~$[Resource ]^[ memory management 
techniques ]f[ the high%%dsh%%level synthesis of software threads into parallel 
FPGA hardware%%per%%]$~ ~$[In IEEE FPT%%lst%% pages 152–159%%lst%% 2015%%per%%]$~ 
~$[A%%per%%]$~ ~$[Cilardo ]^[ L%%per%%]$~ ~$[Gallo%%per%%]$~ ~$[Improving multibank memory access parallelism with lattice%%dsh%%based partitioning%%per%%]$~ ~$[ACM Trans%%per%%]$~ ~$[Archit%%per%%]$~ ~$[Code Optim%%per%%%%lst%% 
11(4)%%lst%% Jan%%per%% 2015%%per%%]$~ 
~$[J%%per%%]$~ ~$[Cong%%lst%% B%%per%%]$~ ~$[Liu%%lst%% S%%per%%]$~ ~$[Neuendorffer%%lst%% J%%per%%]$~ ~$[Noguera%%lst%% K%%per%%]$~ ~$[A%%per%%]$~ ~$[Vissers%%lst%% ]^[ 
Z%%per%%]$~ ~$[Zhang%%per%%]$~ ~$[High%%dsh%%level synthesis ]f[ fpgas%%cln%% From prototyping to deployment%%per%%]$~ ~$[IEEE Trans%%per%% on CAD%%lst%% 30(4):473–491%%lst%% 2011%%per%%]$~ 
~$[P%%per%%]$~ ~$[Coussy%%lst%% D%%per%%]$~ ~$[D%%per%%]$~ ~$[Gajski%%lst%% M%%per%%]$~ ~$[Meredith%%lst%% ]^[ A%%per%%]$~ ~$[Takach%%per%%]$~ ~$[An introduction 
to high%%dsh%%level synthesis%%per%%]$~ ~$[IEEE Design Test of Computers%%lst%% 26(4):8–17%%lst%% 
2009%%per%%]$~ 
~$[L%%per%%]$~ ~$[Gallo%%lst%% A%%per%%]$~ ~$[Cilardo%%lst%% D%%per%%]$~ ~$[Thomas%%lst%% S%%per%%]$~ ~$[Bayliss%%lst%% ]^[ G%%per%%]$~ ~$[A%%per%%]$~ ~$[Constantinides%%per%%]$~ 
~$[Area implications of memory partitioning ]f[ high%%dsh%%level synthesis on 
FPGAs%%per%%]$~ ~$[In FPL%%lst%% 2014%%per%%]$~ 
~$[Intel Corp%%per%%]$~ ~$[Intel Corp%%per%%]$~ ~$[Intel FPGA SDK ]f[ OpenCL%%per%% https://www%%per%% 
altera%%per%%com/products/design%%dsh%%software/embedded%%dsh%%software%%dsh%%developers/ 
opencl/overview%%per%%html%%per%%]$~ 
~$[C%%per%%]$~ ~$[Lattner ]^[ V%%per%%]$~ ~$[S%%per%%]$~ ~$[Adve%%per%%]$~ ~$[LLVM%%cln%% A compilation framework ]f[ 
lifelong program analysis & transformation%%per%%]$~ ~$[In IEEE/ACM CGO%%lst%% pages 
75–88%%lst%% 2004%%per%%]$~ 
~$[C%%per%%]$~ ~$[Meng%%lst%% S%%per%%]$~ ~$[Yin%%lst%% P%%per%%]$~ ~$[Ouyang%%lst%% L%%per%%]$~ ~$[Liu%%lst%% ]^[ S%%per%%]$~ ~$[Wei%%per%%]$~ ~$[Efﬁcient memory 
partitioning ]f[ parallel data access in multidimensional arrays%%per%%]$~ ~$[In 
IEEE/ACM DAC%%lst%% 2015%%per%%]$~ 
~$[R%%per%%]$~ ~$[Nane%%lst%% V%%per%%]$~ ~$[M%%per%%]$~ ~$[Sima%%lst%% C%%per%%]$~ ~$[Pilato%%lst%% J%%per%%]$~ ~$[Choi%%lst%% B%%per%%]$~ ~$[Fort%%lst%% A%%per%%]$~ ~$[Canis%%lst%% Y%%per%%]$~ ~$[T%%per%%]$~ ~$[Chen%%lst%% 
H%%per%%]$~ ~$[Hsiao%%lst%% S%%per%%]$~ ~$[Brown%%lst%% F%%per%%]$~ ~$[Ferrandi%%lst%% J%%per%%]$~ ~$[Anderson%%lst%% ]^[ K%%per%%]$~ ~$[Bertels%%per%%]$~ ~$[A survey 
]^[ evaluation of FPGA high%%dsh%%level synthesis tools%%per%%]$~ ~$[IEEE Trans%%per%% on 
CAD%%lst%% 35(10):1591–1604%%lst%% 2016%%per%%]$~ 
~$[Y%%per%%]$~ ~$[Wang%%lst%% P%%per%%]$~ ~$[Li%%lst%% ]^[ J%%per%%]$~ ~$[Cong%%per%%]$~ ~$[Theory ]^[ algorithm ]f[ generalized 
memory partitioning in high%%dsh%%level synthesis%%per%%]$~ ~$[In ACM FPGA%%lst%% pages 
199–208%%lst%% 2014%%per%%]$~ 
~$[Y%%per%%]$~ ~$[Wang%%lst%% P%%per%%]$~ ~$[Li%%lst%% P%%per%%]$~ ~$[Zhang%%lst%% C%%per%%]$~ ~$[Zhang%%lst%% ]^[ J%%per%%]$~ ~$[Cong%%per%%]$~ ~$[Memory partitioning 
]f[ multidimensional arrays in high%%dsh%%level synthesis%%per%%]$~ ~$[In ACM/IEEE DAC%%lst%% 
2013%%per%%]$~ 
~$[H%%per%%]$~ ~$[Wong%%lst%% V%%per%%]$~ ~$[Betz%%lst%% ]^[ J%%per%%]$~ ~$[Rose%%per%%]$~ ~$[Comparing fpga vs%%per%% custom cmos ]^[ 
the impact on processor microarchitecture%%per%%]$~ ~$[In Proceedings of the 19th 
ACM/SIGDA International Symposium on Field Programmable Gate 
Arrays%%lst%% FPGA ’11%%lst%% pages 5–14%%lst%% New York%%lst%% NY%%lst%% USA%%lst%% 2011%%per%%]$~ ~$[ACM%%per%%]$~ 
~$[Xilinx Inc%%per%%]$~ ~$[Vivado HLS%%per%% https://www%%per%%xilinx%%per%%com/products/design%%dsh%%tools/ 
vivado/integration%%per%%html%%lst%% 2017%%per%%]$~ 
~$[Y%%per%%]$~ ~$[Zhou%%lst%% K%%per%%]$~ ~$[M%%per%%]$~ ~$[Al%%dsh%%Hawaj%%lst%% ]^[ Z%%per%%]$~ ~$[Zhang%%per%%]$~ ~$[A new approach to automatic 
memory banking using trace%%dsh%%based address mining%%per%%]$~ ~$[In ACM FPGA%%lst%% 
pages 179–188%%lst%% 2017%%per%% 
