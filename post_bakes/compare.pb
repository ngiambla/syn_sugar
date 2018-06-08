~$[SynFull%%cln%% Synthetic Traffic Models Capturing Cache Coherent Behaviour 
Mario Badr%%lst%% Natalie Enright Jerger 
Edward S%%per%%]$~ ~$[Rogers Sr%%per%%]$~ ~$[Department of Electrical ]^[ Computer Engineering 
University of Toronto 
mario%%per%%badr@mail%%per%%utoronto%%per%%ca%%lst%% enright@ece%%per%%utoronto%%per%%ca 
Abstract 
1%%per%%]$~ ~$[Introduction 
With the shift to multi%%dsh%% ]^[ many%%dsh%%core processors%%lst%% architects 
now face a larger design space ]^[ more complex trade%%dsh%%offs 
in processor design%%per%%]$~ ~$[The design of the network as a potential 
power ]^[ performance bottleneck is becoming a critical concern%%per%%]$~ ~$[In the power%%dsh%%constrained many%%dsh%%core landscape%%lst%% NoCs 
must be carefully designed to meet communication bandwidth 
requirements%%lst%% deliver packets with low latency%%lst%% ]^[ fit within 
tight power envelopes that are shared across cores%%lst%% caches ]^[ 
interconnects%%per%%]$~ ~$[To do this well%%lst%% the designer must understand 
the traffic patterns ]^[ temporal behaviour of applications the 
NoC must support%%per%%]$~ ~$[There are a large number of parameters 
in the NoC design space that can be tuned to deliver the required performance within a given cost/power envelope%%lst%% such 
as topology%%lst%% routing algorithm%%lst%% flow control ]^[ router microarchitecture%%per%%]$~ ~$[These knobs are most commonly explored 
through software simulation%%per%%]$~ 
~$[There are a number of simulation methodologies available 
to NoC designers%%lst%% however each comes with speed/fidelity 
tradeoffs [18]%%per%%]$~ ~$[Full%%dsh%%system simulators model each hardware 
component of the overall system ]^[ can run full applications 
]^[ operating systems%%per%%]$~ ~$[As a result%%lst%% these simulators provide 
the highest degree of accuracy%%lst%% ]b[ at the expense of long 
simulation times%%per%%]$~ ~$[In contrast%%lst%% a designer can use traditional 
c 2014 IEEE 
978%%dsh%%1%%dsh%%4799%%dsh%%4394%%dsh%%4/14/$31%%per%%00 
Micro%%dsh%%­‐Level  Phase  Clustering   
Number  of  Injected  Packets   
Modern ]^[ future many%%dsh%%core systems represent complex architectures%%per%%]$~ ~$[The communication fabrics of these large systems 
heavily influence their performance ]^[ power consumption%%per%%]$~ 
~$[Current simulation methodologies ]f[ evaluating networkson%%dsh%%chip (NoCs) are ]n[ keeping pace with the increased complexity of our systems%%scn%% architects often want to explore many 
different design knobs quickly%%per%%]$~ ~$[Methodologies that capture 
workload trends with faster simulation times are highly beneficial at early stages of architectural exploration%%per%%]$~ ~$[We propose SynFull%%lst%% a synthetic traffic generation methodology that 
captures both application ]^[ cache coherence behaviour to 
rapidly evaluate NoCs%%per%%]$~ ~$[SynFull allows designers to quickly 
indulge in detailed performance simulations without the cost 
of long%%dsh%%running full%%dsh%%system simulation%%per%%]$~ ~$[By capturing a full 
range of application ]^[ coherence behaviour%%lst%% architects can 
avoid the over ]v[ underdesign of the network as may occur 
when using traditional synthetic traffic patterns such as uniform random%%per%%]$~ ~$[SynFull has errors as low as 0%%per%%3% ]^[ provides 
50× speedup on average over full%%dsh%%system simulation%%per%%]$~ 
~$[Read   
Write   
Replace   
Inv   
Macro%%dsh%%­‐Level  Phase  Clustering   
Time  (hundreds  of  cycles)   
Time  (millions  of  cycles)   
• Cluster  based  on%%cln%%     
•  Message  Types   
•  SpaDal  paEern  (src%%dsh%%­‐dst  ﬂows)   
  
Macro%%dsh%%­‐Level     
Markov  Chain   
Micro%%dsh%%­‐Level   
Markov  Chain   
Figure 1%%cln%% High level view of SynFull 
synthetic traffic patterns to quickly stress their NoC design 
]^[ reveal bottlenecks%%per%%]$~ ~$[However%%lst%% these traffic patterns do ]n[ 
realistically represent the application space ]s[ the results are 
unlikely to be representative of real workloads%%per%%]$~ ~$[Therefore%%lst%% they 
are unlikely to produce a properly provisioned network%%per%%]$~ ~$[In 
this work%%lst%% we introduce a new approach that strikes a balance 
between these tradeoffs%%lst%% providing a fast%%lst%% realistic simulation 
methodology ]f[ NoC designers%%per%%]$~ 
~$[Realistic traffic patterns will increase the accuracy of NoC 
simulations%%per%%]$~ ~$[Beyond that%%lst%% realistic traffic also provides optimization opportunities that do ]n[ exist in traditional synthetic 
traffic patterns%%per%%]$~ ~$[Many recent NoC proposals have exploited 
particular application [13%%lst%% 30] ]v[ coherence behaviour [25%%lst%% 26] 
to provide a more efficient%%lst%% higher%%dsh%%performing NoC design%%per%%]$~ ~$[As 
research continues to push the scalability of cache coherence 
protocols [15%%lst%% 28%%lst%% 50]%%lst%% shared memory CMPs continue to be 
widespread%%per%%]$~ ~$[As a result%%lst%% we focus on this class of systems%%per%%]$~ 
~$[SynFull Overview ]^[ Contributions%%per%%]$~ ~$[SynFull provides a 
novel technique ]f[ modelling real application traffic without 
the need ]f[ expensive%%lst%% detailed simulation of all levels of the 
system%%per%%]$~ ~$[We abstract away cores ]^[ caches to focus on the network%%lst%% ]^[ provide application%%dsh%%level insight to NoC designers%%lst%% 
who in turn can produce more optimized designs%%per%%]$~ ~$[Through our 
analysis%%lst%% we determine the key traffic attributes that a cachecoherent application%%dsh%%driven traffic model must capture including coherence%%dsh%%based message dependences (Sec%%per%% 4)%%lst%% application phase behaviour (Sec%%per%% 5) ]^[ injection process (Sec%%per%% 6)%%per%%]$~ 
~$[Fig%%per%% 1 shows a high%%dsh%%level overview of our approach%%per%%]$~ ~$[We observe long running (macro%%dsh%%)phases within applications as well 
as fine%%dsh%%grained variation within macro%%dsh%%phases (micro%%dsh%%phases)%%lst%% 
]^[ group them through clustering%%per%%]$~ ~$[Within these clusters%%lst%% we 
2%%per%%]$~ ~$[The Case ]f[ Coherence Traffic 
Before describing SynFull in detail%%lst%% we motivate the need ]f[ 
a new class of synthetic traffic patterns%%per%%]$~ ~$[Traffic patterns such 
as uniform random%%lst%% permutation%%lst%% tornado%%lst%% etc%%per%% are widely used 
in NoC research%%per%%]$~ ~$[Many of these are based on the communication pattern of specific applications%%per%%]$~ ~$[For example%%lst%% transpose 
traffic is based on a matrix transpose application%%lst%% ]^[ the 
shuffle permutation is derived from Fast%%dsh%%Fourier Transforms 
(FFTs) [2%%lst%% 12]%%per%%]$~ ~$[However%%lst%% these synthetic traffic patterns are 
]n[ representative of the wide range of applications that run on 
current ]^[ future CMPs%%per%%]$~ ~$[Even %%cmp_if%% these traffic patterns were 
representative%%lst%% the configuration of a cache%%dsh%%coherent system 
can mask ]v[ destroy the inherent communication pattern of the 
original algorithm due to indirections ]^[ control messages%%per%%]$~ 
~$[The arrangement of cores%%lst%% caches%%lst%% directories%%lst%% ]^[ memory 
controllers directly influences the flow of communication ]f[ 
an application%%per%%]$~ ~$[Compare a synthetic shuffle pattern with the 
FFT benchmark from SPLASH%%dsh%%2 [48]%%per%%]$~ ~$[The shuffle pattern 
is a bit permutation where the destination bits are calculated 
via the function di = si−1 mod b where b is the number of bits 
required to represent the nodes of the network [12]%%per%%]$~ ~$[FFT is run 
in full%%dsh%%system simulation1 while shuffle is run in network%%dsh%%only 
simulation%%per%%]$~ ~$[Fig%%per%% 2 shows the number of packets sent from a 
source to a destination2 %%per%%]$~ ~$[In Fig%%per%% 2b%%lst%% we see notable destination 
hot spots at nodes 0%%lst%% 2%%lst%% ]^[ 5 ]^[ source hot spots at nodes 
0 ]^[ 5%%per%%]$~ ~$[However%%lst%% Fig%%per%% 2a shows hot spots only ]f[ specific 
source%%dsh%%destination pairs%%per%%]$~ 
~$[The best NoC design ]f[ the traffic in Fig%%per%% 2a is unlikely to 
be the best NoC ]f[ the traffic in Fig%%per%% 2b%%per%%]$~ ~$[For example%%lst%% we 
can design a ring network ]f[ Fig%%per%% 2a%%lst%% ]^[ map the nodes to 
minimize hop count of shuffle on the network%%per%%]$~ ~$[The average 
injection rate of FFT is used ]f[ shuffle%%per%%]$~ ~$[Doing ]s[ yields 
∼10% improvement in average packet latency over a mesh 
1 Configuration 
details can be found in Sec%%per%% 7%%per%% 
absolute number of packets in each figure is unimportant in this 
comparison as we focus on source%%dsh%%destination traffic pairs%%per%% 
2 The 
15 
14 
13 
12 
11 
10 
9 
8 
7 
6 
5 
4 
3 
2 
1 
0 
140 
120 
100 
80 
60 
40 
20 
0 
0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 
Source 
(a) Shuffle Traffic Pattern 
Destination 
Destination 
examine the break down of message types dictated by the coherence protocol%%per%%]$~ ~$[These two steps drive a hierarchical Markov 
Chain that is used to reproduce the traffic behaviour%%per%%]$~ ~$[Our 
proposed model is independent of the network configuration 
]^[ can be applied to a wide range of NoC configurations to 
enable rapid%%lst%% accurate design space exploration%%per%%]$~ 
~$[To demonstrate the accuracy ]^[ utility of our model%%lst%% we apply our methodology to a variety of PARSEC [5] ]^[ SPLASH2 [48] benchmarks%%per%%]$~ ~$[A single full%%dsh%%system simulation run of 
each benchmark is required to create the model%%per%%]$~ ~$[We %%cmp_t%% 
use our models to synthetically generate traffic ]^[ %%cmp%% NoC performance to full%%dsh%%system simulation%%per%%]$~ ~$[Finally%%lst%% 
we demonstrate significant speedup ]f[ our methodology over 
full%%dsh%%system simulation%%scn%% this allows ]f[ rapid NoC design space 
exploration%%per%%]$~ ~$[In essence%%lst%% SynFull strives to replace full system simulation ]f[ fast%%lst%% ]y[ accurate NoC evaluation through 
richer synthetic traffic patterns%%per%% 
15 
14 
13 
12 
11 
10 
9 
8 
7 
6 
5 
4 
3 
2 
1 
0 
70000 
65000 
60000 
55000 
50000 
0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 
Source 
(b) FFT Application 
Figure 2%%cln%% Spatial behaviour ]f[ synthetic vs application traffic 
(Network A in Sec%%per%% 7) with the naive mapping (baseline) in 
Fig%%per%% 2a%%per%%]$~ ~$[However%%lst%% using the same ring network in a fullsystem simulation of the FFT benchmark results in an average 
packet latency that is over three times worse %%cmp_ta%% the baseline%%per%%]$~ 
~$[Clearly%%lst%% synthetic traffic patterns are ]n[ representative of 
the spatial behaviour exhibited by applications on a shared 
memory architecture%%per%%]$~ 
~$[The sharp contrast in Fig%%per%% 2 is due to coherence transactions 
needing to visit several nodes in a shared memory architecture 
before completing%%per%%]$~ ~$[For example%%lst%% a write request first visits a 
directory to receive ownership of a cache line%%per%%]$~ ~$[The directory 
forwards requests to the core caching the data%%lst%% ]^[ also invalidates caches who are sharing the data%%per%%]$~ ~$[Invalidated caches 
must send acknowledgements – this domino effect can significantly change an application’s spatial behaviour ]^[ should 
be correctly modelled ]f[ realistic traffic generation%%per%%]$~ 
~$[Differentiating between the types of packets visiting nodes 
is important when generating realistic traffic%%per%%]$~ ~$[Most synthetic 
workloads split traffic into two categories%%cln%% small control packets (requests) ]^[ large data packets (responses)%%per%%]$~ ~$[However%%lst%% 
there are many different packet types in a coherence protocol 
]f[ both requests ]^[ responses%%per%%]$~ ~$[By lumping these packets 
into two categories%%lst%% designers cannot explore methods that 
exploit cache coherence ]f[ better performance%%per%%]$~ ~$[For example%%lst%% 
techniques exist to reduce traffic caused by acknowledgement 
packets [27]%%per%%]$~ ~$[Similar research insight is only possible when 
detailed packet information is available in simulation%%per%%]$~ 
~$[Finally%%lst%% the traffic imposed by an application is time%%dsh%%varying%%per%%]$~ 
~$[Applications exhibit phase behaviour [38]%%scn%% spatial patterns are 
likely to change over time%%per%%]$~ ~$[Static traffic patterns ]^[ injection 
rates are ]n[ an adequate representation of real application 
traffic%%per%%]$~ ~$[The behaviour of cache coherence traffic changes with 
time ]^[ can have varying effects on NoC performance%%per%%]$~ ~$[For 
example%%lst%% phases that exhibit high data exchange will likely 
result in several invalidation packets being broadcast into the 
NoC%%per%%]$~ ~$[It is important to capture these variations in traffic to 
reveal whether ]v[ ]n[ an NoC has been correctly provisioned%%per%% 
3%%per%%]$~ ~$[SynFull Traffic Modelling Overview 
Our methodology focuses only on the design of the NoC which 
has become a first%%dsh%%class component of many%%dsh%%core architectures%%per%%]$~ 
~$[Thus%%lst%% we abstract away the cores%%lst%% caches%%lst%% directories ]^[ memory controllers%%per%%]$~ ~$[Essentially%%lst%% the performance characteristics of 
these elements are fixed ]f[ the purposes of our study%%per%%]$~ ~$[However%%lst%% SynFull can be combined with analytical ]^[ abstract 
models [10%%lst%% 22] of these components to explore an even richer 
design space with fast%%dsh%%turnaround time%%per%%]$~ ~$[Developing the network models is a critical first step%%scn%% combining our model with 
other models is left as future work%%per%%]$~ ~$[To model application 
traffic%%lst%% we focus on answering four key questions%%cln%% 
When to send a packet%%qsn%%]$~ ~$[In shared memory systems%%lst%% packets 
are injected from the application side on a cache miss%%per%%]$~ ~$[This 
packet initiates a coherence transaction to retrieve its data%%per%%]$~ 
~$[However%%lst%% some packets are injected reactively%%per%%]$~ ~$[For example%%lst%% 
a data packet would only be sent in response to a request%%per%%]$~ 
~$[Who is sending the packet%%qsn%%]$~ ~$[Not all nodes inject traffic 
uniformly ]s[ we must determine which node should inject that 
packet%%per%%]$~ ~$[For reactive packets%%lst%% the answer is clear%%scn%% the node 
reacting to the request is the source%%per%%]$~ ~$[However%%lst%% ]f[ initiating 
packets%%lst%% a model is required%%per%%]$~ 
~$[Why are they sending the packet%%qsn%%]$~ ~$[Traditional synthetic 
workloads do ]n[ concern themselves with why%%per%%]$~ ~$[For a cache 
coherence traffic generator%%lst%% the question is very important%%per%%]$~ ~$[The 
why helps determine the type of packet being sent%%lst%% ]^[ allows 
us to classify packets according to the coherence protocol%%per%%]$~ 
~$[Where is the packet going%%qsn%%]$~ ~$[The packet’s destination is 
a function of both its source ]^[ the type of packet being 
injected (the answers to the previous two questions)%%per%%]$~ ~$[Each 
source node may exhibit different sharing patterns with other 
nodes%%lst%% ]^[ those sharing patterns may be different depending 
on the coherence message being sent%%per%%]$~ 
~$[These 4 questions are answered in Sec%%per%% 4%%per%%]$~ ~$[However%%lst%% %%cmp_b%% applications exhibit phase behaviour [38]%%lst%% we must also 
capture how the answers change over time%%per%%]$~ ~$[We handle this 
by dividing application traffic into time intervals%%lst%% ]^[ grouping together time intervals that behave similarly%%per%%]$~ ~$[Then%%lst%% we 
determine answers ]f[ the When%%lst%% Who%%lst%% Why ]^[ Where questions ]f[ each group (phase)%%per%%]$~ ~$[We discuss our methodology 
]f[ grouping intervals in Sec%%per%% 5%%per%%]$~ ~$[To complete our SynFull 
methodology we need a way to transition between phases%%per%%]$~ ~$[For 
this we use a Markov Chain%%lst%% where we can determine the probability of transitioning from one phase to another based on the 
phase we are currently in%%per%%]$~ ~$[The Markov Chain model%%lst%% along 
with answers to the above 4 questions%%lst%% allow us to recreate the 
injection process associated with an application (Sec%%per%% 6)%%per%% 
4%%per%%]$~ ~$[Modelling Cache Coherence Traffic 
Focusing on the network only ]^[ ]n[ modelling application 
behaviour at the instruction level has the benefit of keeping 
our methodology generic ]^[ simple – we can apply SynFull 
to any application’s traffic data in a straightforward manner%%per%%]$~ 
~$[Although we abstract away other system components%%lst%% ]n[ all 
network messages are equal ]s[ it is important to capture different message types injected by the coherence protocol%%per%%]$~ ~$[Message 
types are a function of the cache coherence protocol%%lst%% ]b[ most 
protocols are conceptually similar in how they behave%%per%%]$~ ~$[A cache 
Table 1%%cln%% 1%%dsh%%to%%dsh%%1 Request%%dsh%%Response mappings%%per%% $ signifies cache%%per%%]$~ 
~$[Message Received 
Cache Replacement 
Forwarded Request 
Invalidation 
Data 
Source 
Cache 
Directory 
Directory 
Cache 
Reaction 
Writeback Ack%%per%%]$~ 
~$[Data 
Ack%%per%%]$~ 
~$[Unblock 
Destination 
Original Requestor ($) 
Original Requestor ($) 
Original Requestor ($) 
Directory 
miss invokes a coherence transaction from the local coherence 
controller in the form of a read ]v[ write which %%cmp_t%% results 
in a series of requests ]^[ responses [40]%%per%%]$~ ~$[In this section%%lst%% we 
explore modelling packets that initiate a coherence transaction 
separately from packets that react to received messages%%per%% 
4%%per%%1%%per%%]$~ ~$[Initiating Packets 
To model when to send initiating messages%%lst%% we collect the 
number of packets (P) injected into the network ]f[ a given 
interval spanning C cycles%%per%%]$~ ~$[Then%%lst%% when generating synthetic 
traffic%%lst%% we simply inject P packets uniformly over C cycles3 %%per%%]$~ 
~$[To answer who injects a packet%%lst%% we observe the distribution 
of packets injected across all network nodes%%per%%]$~ ~$[This distribution 
gives us the probability a particular node will inject a packet 
]^[ can capture spatial behaviour of applications [41%%lst%% 44]%%per%%]$~ ~$[The 
answer to where a packet is going can be modelled using a 
similar method with relative probabilities%%per%%]$~ ~$[Given the source 
(S) of the packet%%lst%% we determine its destination (D) using%%cln%% 
P(D | S) = 
Number o f packets sent to D f rom S 
Number o f packets sent by S 
(1) 
Finally%%lst%% to answer why a packet is injected we split P into 
Pr (total number of reads) ]^[ Pw (total number of writes)%%per%%]$~ 
~$[The distinction between reads ]^[ writes is necessary %%cmp_b%% 
they result in different reactions – writes lead to invalidations 
that are broadcast into the NoC%%scn%% these can significantly impact 
NoC performance%%per%% 
4%%per%%2%%per%%]$~ ~$[Reactive Packets 
Most responses that maintain cache coherence have a simple 
one%%dsh%%to%%dsh%%one mapping with requests%%lst%% such as an acknowledgement responding to an invalidation request%%per%%]$~ ~$[Upon receiving a 
particular message%%lst%% the protocol reacts with a predetermined 
response%%per%%]$~ ~$[Table 1 shows a simplified view of the reactive aspect of cache coherence%%per%%]$~ ~$[Most reactions are straightforward ]b[ 
some requests lead to multiple different responses%%lst%% particularly%%cln%% 
Forwarded Requests%%cln%% If the data is already cached on chip%%lst%% 
the coherence protocol forwards the request to the cache containing the data%%per%%]$~ ~$[Otherwise%%lst%% the request goes off chip to memory%%per%%]$~ 
~$[Invalidates%%cln%% When a write request arrives ]f[ a cache block 
shared by multiple readers%%lst%% those readers must be invalidated%%per%%]$~ 
~$[Next%%lst%% we explore these two situations ]^[ how to model them 
]s[ that we may realistically generate cache coherence traffic%%per%% 
4%%per%%2%%per%%1%%per%%]$~ ~$[Forwarding vs%%per%%]$~ ~$[Off%%dsh%%Chip When a read ]v[ write request 
arrives at a directory%%lst%% the requested block may be present in 
another core’s cache%%per%%]$~ ~$[In this case%%lst%% the request is forwarded to 
3 We 
also explored injecting packets using bernoulli ]^[ exponential distributions%%per%%]$~ ~$[However%%lst%% the differences in performance are negligible%%per%% 
1%%per%%00 
0%%per%%75 
0%%per%%50 
0%%per%%25 
0%%per%%00 
0%%per%%4 
variable 
Writes 
Reads 
0%%per%%2 
0%%per%%0 
1 
2 
3 
4 
5 
6 
7 
8 
9 
Directory 
10 11 12 13 14 15 16 
Figure 3%%cln%% The probability a read ]v[ write request is forwarded 
the cache holding the data%%per%%]$~ ~$[Otherwise%%lst%% an off%%dsh%%chip memory 
request occurs%%per%%]$~ ~$[Fig%%per%% 3 shows the fraction of forwarded read 
]^[ write requests broken down by directory ]f[ SPLASH%%dsh%%2’s 
FFT benchmark4 %%per%%]$~ ~$[The probability of forwarding a read ]v[ 
write changes according to which directory is being requested%%per%%]$~ 
~$[Therefore%%lst%% we model the distribution of forwarding probabilities on a per%%dsh%%directory basis%%per%%]$~ ~$[In Sec%%per%% 4%%per%%2%%per%%2%%lst%% we show that this 
has an affect on invalidations%%lst%% ]^[ different directories may 
act as hot spots in certain applications%%per%%]$~ ~$[We also note that the 
probabilities of forwarding a read ]v[ a write request are ]n[ 
equal%%per%%]$~ ~$[This distinction is critical as write requests will trigger 
invalidations to sharers which can represent a substantial burst 
of network traffic ]f[ widely%%dsh%%shared data%%per%% 
4%%per%%2%%per%%2%%per%%]$~ ~$[Invalidates On a write miss%%lst%% there is a chance that the 
cache block being requested has multiple sharers%%scn%% the number 
of sharers determines the number of invalidates that will be 
multicast into the NoC%%per%%]$~ ~$[Fig%%per%% 4 shows the per%%dsh%%directory probability of sending 0 to 15 invalidates in a 16%%dsh%%node network 
]f[ FFT%%per%%]$~ ~$[Some directories (1%%lst%% 3%%lst%% 11%%lst%% ]^[ 12) exhibit bimodal 
behaviour%%scn%% they invalidate 0 ]v[ n − 1 sharers%%per%%]$~ ~$[Referring back 
to Fig%%per%% 3%%lst%% we can see that these directories behave similarly in 
their forwarding probabilities%%per%%]$~ ~$[Other directories resemble an 
exponential distribution%%lst%% with 0 invalidates having the highest 
probability%%per%%]$~ ~$[Invalidates can significantly impact network performance%%scn%% applications that share ]^[ exchange data at a high 
rate will flood the network with many invalidates ]^[ strain 
its resources%%per%%]$~ ~$[We model the distribution of the number of 
invalidates on a per%%dsh%%directory basis to ensure our synthetically 
generated traffic has similar affects on NoC performance%%per%% 
4%%per%%3%%per%%]$~ ~$[Summary 
This section showed how we model cache coherence traffic by 
reacting to messages injected into the NoC%%per%%]$~ ~$[Read ]^[ write 
requests are forwarded with some probability to other nodes in 
the NoC%%lst%% ]^[ invalidates can be sent out with some probability 
given the directory a write request has arrived at%%per%%]$~ ~$[To react to 
messages%%lst%% read ]^[ write requests must first be injected into 
the NoC%%per%%]$~ ~$[Static injection rates are ]n[ sufficient to achieve high 
accuracy – we must also consider application phase behaviour%%per%% 
4 Our 
system configuration assumes 1 slice of the directory is located at 
each tile in a 16%%dsh%%core CMP%%per%%]$~ ~$[Addresses are interleaved across directories%%per%%]$~ 
~$[Probability 
Probability to Forward a Request 
0%%per%%6 
1%%per%%00 
0%%per%%75 
0%%per%%50 
0%%per%%25 
0%%per%%00 
1%%per%%00 
0%%per%%75 
0%%per%%50 
0%%per%%25 
0%%per%%00 
1%%per%%00 
0%%per%%75 
0%%per%%50 
0%%per%%25 
0%%per%%00 
0 
5 
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
10 
15 
0 
5 
10 
15 
0 
5 
10 
15 
0 
5 
10 
15 
Number of Invalidates 
Figure 4%%cln%% Number of sharers per write at different directories 
We explore phase behaviour in Sec%%per%% 5 ]^[ propose a model 
that captures ]^[ applies phases to generated network traffic%%per%% 
5%%per%%]$~ ~$[Traffic Phases 
Applications are well%%dsh%%known to exhibit phase behaviour [38]%%per%%]$~ 
~$[Phases can have a significant impact on the instructions 
per cycle%%lst%% miss rates%%lst%% ]^[ prediction rates of various microarchitectures%%per%%]$~ ~$[NoC traffic is also affected by application 
phases [20%%lst%% 51]%%scn%% our methodology needs to capture this phase 
behaviour %%cmp_if%% it intends to realistically generate synthetic traffic%%per%%]$~ 
~$[We propose examining traffic at two granularities%%cln%% macro 
(millions ]v[ billions of cycles) ]^[ micro (thousands to hundreds of thousands of cycles)%%per%%]$~ ~$[At the macro level%%lst%% we observe 
noticeable differences in the behaviour of an application as it 
moves from one phase to another (perhaps due to a barrier ]v[ 
the end of an outer%%dsh%%loop)%%per%%]$~ ~$[At the micro%%dsh%%level we are more likely 
to capture short bursts of network activity%%per%%]$~ ~$[Each level is divided 
into fixed%%dsh%%sized%%lst%% successive time intervals measured in cycles%%per%%]$~ 
~$[Dividing traffic into intervals allows us to analyze network 
traffic at a fine granularity%%per%%]$~ ~$[Considering the entire application 
at once captures average behaviour%%scn%% reproducing the average 
behaviour will negatively impact the design ]^[ evaluation of 
NoCs%%per%%]$~ ~$[For example%%lst%% smoothing out periods of high traffic will 
result in an NoC that becomes saturated during key application 
phases%%per%%]$~ ~$[Alternatively%%lst%% bringing low periods of communication 
up to an average will cause a designer to miss potential opportunities ]f[ power gating ]v[ DVFS in the NoC%%per%%]$~ ~$[Intervals allow 
us to capture fine%%dsh%%grain changes in traffic%%per%%]$~ ~$[However%%lst%% selecting 
a single (random) interval is ]n[ necessarily characteristic of 
the entire simulation%%per%%]$~ ~$[Yet considering all intervals will be 
difficult to model with a Markov Chain (Sec%%per%% 6) ]^[ will yield 
little simulation speedup%%per%%]$~ ~$[Therefore%%lst%% we group intervals that 
behave similarly into different traffic phases via clustering%%per%%]$~ 
~$[This section explores various alternative approaches to identifying similar behaviour between intervals through feature 
vectors (Sec%%per%% 5%%per%%1)%%per%%]$~ ~$[Each vector contains elements (features) 
that measure some aspect of traffic in that interval (e%%per%%g%%per%%%%lst%% the 
injection rate)%%per%%]$~ ~$[Vectors are %%cmp_t%% %%cmp%%d by calculating the 
distance between them%%scn%% a clustering algorithm creates groups 
of intervals whose vectors are close together (Sec%%per%% 5%%per%%2)%%per%% 
5%%per%%1%%per%%]$~ ~$[Feature Vector Design 
Defining similarity between intervals is non%%dsh%%trivial%%per%%]$~ ~$[One has to 
consider the elements of the feature vector%%lst%% its dimensionality 
]^[ scalability%%per%%]$~ ~$[In this section%%lst%% we present a subset of potential 
feature vectors that can be used to cluster intervals into traffic 
phases%%scn%% this discussion is ]n[ meant to be exhaustive ]b[ rather 
captures a range of traffic metrics ]^[ feature vector scalability%%per%%]$~ 
~$[It may be tempting to use feature vectors with many elements%%per%%]$~ ~$[There is a trade%%dsh%%off between capturing a range of 
communication attributes ]^[ the effectiveness ]^[ ease of 
clustering%%per%%]$~ ~$[Large feature vectors can suffer from the curse of 
dimensionality where the data available to populate the vector 
is insufficient ]f[ the size of the vector [4]%%per%%]$~ ~$[In addition%%lst%% having a large number of observations puts additional strain on 
the clustering algorithm%%scn%% 
some clustering algorithms have a 
 
complexity of O n3 (where n is the number of vectors)%%per%%]$~ ~$[We 
explore two different approaches to construct feature vectors%%cln%% 
1%%per%%]$~ ~$[Injection Rate%%cln%% number of packets injected in an interval 
2%%per%%]$~ ~$[Injection Flows%%cln%% number of packets injected between 
source%%dsh%%destination pairs per interval 
We also explored feature vectors that consider cache coherence message types%%per%%]$~ ~$[In this way%%lst%% intervals with dominant read 
and/or write phases are clustered together%%per%%]$~ ~$[However%%lst%% such an 
approach does ]n[ capture the spatial injection distribution of 
packets%%per%%]$~ ~$[As a result%%lst%% intervals with similar hot spots are ]n[ 
clustered together%%per%%]$~ ~$[As we show in Sec%%per%% 8%%lst%% this information is 
crucial %%cmp_if%% we expect to synthetically generate realistic traffic%%per%% 
5%%per%%1%%per%%1%%per%%]$~ ~$[Injection Rate Injection rate can be captured in different ways%%per%%]$~ ~$[Considering the injection rate of all nodes (Total 
Injection) gives simple%%lst%% one%%dsh%%dimensional feature vectors that 
allow us to differentiate between intervals that are experiencing high%%lst%% medium ]v[ low levels of communication%%per%%]$~ ~$[The 
benefit of this vector is that it is easy to create%%per%%]$~ ~$[Calculating 
the distance between vectors ]^[ applying clustering is fast 
%%cmp_b%% it is one%%dsh%%dimensional%%per%%]$~ ~$[Yet Total Injection may be 
too simple%%scn%% the total number of packets does ]n[ reveal any 
spatial characteristics of the traffic%%per%%]$~ ~$[Even when two vectors 
have similar magnitudes%%lst%% their respective intervals could exhibit different spatial behaviour%%lst%% such as hot spots%%per%%]$~ ~$[Using the 
injection rate of individual nodes alleviates some of these issues%%per%%]$~ ~$[An N%%dsh%%dimensional vector with per%%dsh%%node injection rates 
(Node Injection) captures some spatial characteristics of our 
applications%%per%% 
5%%per%%1%%per%%2%%per%%]$~ ~$[Injection Flows Node Injection helps identify injecting 
hotspots – that is%%lst%% nodes that send a lot of packets%%per%%]$~ ~$[But hot 
spots can also exist at a destination – that is%%lst%% nodes that receive 
a lot of packets%%per%%]$~ ~$[To capture the relationship between sent 
]^[ received messages%%lst%% we can use flows [20]%%per%%]$~ ~$[A flow is the 
injection rate between a source ]^[ a destination%%per%%]$~ ~$[For an Nnode network%%lst%% there are N 2 source%%dsh%%destination flow pairs%%per%%]$~ ~$[We 
construct a feature vector (Per%%dsh%%Node Flow) that captures this 
information%%per%%]$~ ~$[This vector scales quadratically with the number 
of nodes%%per%%]$~ ~$[Sufficient data has to be present in the traffic ]v[ %%cmp_e%% 
Table 2%%cln%% Different traffic feature vectors ]f[ an N %%dsh%%node network 
Feature Vector 
Total Injection 
Node Injection 
Row%%dsh%%Column 
Flow 
Per%%dsh%%Node 
Flows [20] 
# of Features 
1 
N 
N 
N2 
Description 
Total number of packets injected 
Packets injected ]f[ each network node 
Packets injected between rows ]^[ columns 
of the network 
Packets injected between each sourcedestination pair 
the feature vector falls prey to the curse of dimensionality%%per%%]$~ 
~$[We can simplify Per%%dsh%%Node Flow feature vectors by aggregating nodes into rows ]^[ columns (Row%%dsh%%Column Flow)%%per%%]$~ ~$[Each 
element of the vector corresponds to the number of packets 
sent by a row of nodes to a column of nodes%%per%%]$~ ~$[We use the words 
row ]^[ column ]f[ simplicity – the actual mapping of nodes 
in the network does ]n[ have to be grid%%dsh%%like%%per%% 
5%%per%%1%%per%%3%%per%%]$~ ~$[Summary We introduce four potential feature vectors 
to classify traffic phases%%per%%]$~ ~$[These are summarized in Table 2%%per%%]$~ 
~$[Each vector has its own pros ]^[ cons%%lst%% ]^[ some vectors are 
better suited ]f[ either a macro ]v[ micro scale%%per%%]$~ ~$[We explore the 
impact of different feature vectors in Sec%%per%% 8%%per%% 
5%%per%%2%%per%%]$~ ~$[Clustering Methods 
Feature vectors are used to cluster intervals into traffic phases%%per%%]$~ 
~$[We calculate the distance between vectors ]^[ %%cmp_t%% apply 
a clustering method%%per%%]$~ ~$[Distance calculations are affected by 
the dimensionality of the vector (i%%per%%e%%per%% number of features)%%scn%% 
%%cmp_tf%%%%lst%% feature vectors that scale poorly (Table 2) lead to 
high overhead ]^[ modelling time%%per%%]$~ ~$[In this section%%lst%% we look 
at two clustering approaches%%cln%% partitional ]^[ hierarchical ]^[ 
weigh their benefits%%per%%]$~ ~$[Ultimately%%lst%% we use different approaches 
at different granularities%%lst%% as we discuss in Sec%%per%% 6%%per%% 
5%%per%%2%%per%%1%%per%%]$~ ~$[Partitional Clustering Partitional clustering designates a feature vector that is central to each group%%scn%% we use 
Euclidean distance as a measure of closeness between vectors%%per%%]$~ ~$[Although k%%dsh%%means is the most popular%%lst%% we use k%%dsh%%medoids 
(specifically%%lst%% Partitioning%%dsh%%Around%%dsh%%Medoids ]v[ PAM)%%per%%]$~ ~$[PAM 
performs a pairwise comparison of the distances between a 
vector (V ) ]^[ every other vector in the group%%per%%]$~ ~$[Although 
slower %%cmp_ta%% k%%dsh%%means%%lst%% PAM is able to provide the central vector 
(medoid) ]f[ each group%%per%%]$~ ~$[This allows us to select the interval 
that is most representative of its traffic phase%%per%%]$~ ~$[Partitional clustering is an NP%%dsh%%hard problem%%lst%% however heuristics are available 
that keep its complexity ]^[ speed low [46]%%per%%]$~ 
~$[Partitional clustering requires the number of traffic phases 
(or clusters k) to be an input to the algorithm%%per%%]$~ ~$[Formal methods exist [34] to determine an optimum k value%%lst%% though ]n[ 
all methodologies agree on the same k%%per%%]$~ ~$[Two common methods that estimate an optimal k are Average Silhouette Width 
(ASW) [35] ]^[ the Calinksi%%dsh%%Harabasz (CH) index [6]%%per%%]$~ ~$[We 
explore the effects of k using these two methods in Sec%%per%% 8%%per%%1%%per%% 
5%%per%%2%%per%%2%%per%%]$~ ~$[Hierarchical Clustering Hierarchical clustering is an 
efficient%%lst%% deterministic approach to grouping traffic phases%%per%%]$~ 
~$[However%%lst%% it has a complexity of O(n3 ) (where n is the number 
of vectors)%%lst%% making it better suited to clustering smaller data 
sets%%per%%]$~ ~$[Hierarchical clustering creates a tree (a dendogram) of all 
feature vectors%%lst%% linking vectors together based on distance ]^[ 
a linkage criterion5 %%per%%]$~ ~$[The algorithm iteratively combines the 
two clusters that have the least impact on the sum of squares 
error%%per%%]$~ ~$[Different levels of the tree indicate which vectors belong 
to which clusters%%scn%% the tree can be cut at a user%%dsh%%defined level 
to provide the desired number of traffic phases%%per%%]$~ ~$[We use the 
L%%dsh%%method [36] to determine the appropriate number of clusters 
in hierarchical clustering%%per%% 
6%%per%%]$~ ~$[Injection Process 
In Sec%%per%% 5%%lst%% we introduce macro%%dsh%% ]^[ micro%%dsh%%level granularities 
]f[ intervals%%per%%]$~ ~$[Each macro%%dsh%%interval is further broken down into 
micro%%dsh%%intervals%%per%%]$~ ~$[Then%%lst%% we group intervals into traffic phases 
using clustering%%per%%]$~ ~$[Next%%lst%% we demonstrate how to construct a 
hierarchical Markov Chain ]f[ the macro%%dsh%% ]^[ micro%%dsh%%levels%%per%%]$~ 
~$[Fig%%per%% 1 shows an overview of our approach%%lst%% where macro%%dsh%%scale 
traffic has been decomposed into micro%%dsh%%scale intervals%%lst%% ]^[ 
two Markov Chains govern the transitions between phases%%per%%]$~ 
~$[Markov Chains are typically used to model stochastic processes%%per%%]$~ ~$[A Markov Chain is made up of a number of states%%lst%% 
with transition probabilities defined ]f[ moving from one state 
to another%%per%%]$~ ~$[In our case%%lst%% states correspond to macro%%dsh%% ]v[ microphases%%lst%% ]^[ transitioning from one phase to another allows 
us to accurately replicate the time%%dsh%%varying behaviour of an 
application’s injection process%%per%%]$~ 
~$[Macro Scale Given long application runtimes%%lst%% the number 
of intervals at the macro level ranges from hundreds to thousands%%per%%]$~ ~$[This variability ]^[ the resulting large number of vectors means hierarchical clustering is ]n[ a good fit %%cmp_b%% 
of its O(n3 ) complexity%%scn%% %%cmp_tf%% we use PAM at the macro 
scale%%per%%]$~ ~$[PAM gives us the medoid of each traffic phase – that is%%lst%% 
a single macro interval that best represents the macro phase%%per%%]$~ 
~$[Having a single macro%%dsh%%interval ]f[ each phase significantly reduces the amount of data modelled%%per%%]$~ ~$[Once we have the medoid 
]f[ each traffic phase%%lst%% we pass them to our micro model ]^[ 
analyze the traffic at a finer granularity%%per%%]$~ ~$[We create a micro 
model ]f[ each macro%%dsh%%interval selected%%per%%]$~ 
~$[Micro Scale The micro scale looks at only a small subset 
of the overall traffic%%per%%]$~ ~$[Dividing a macro%%dsh%%interval into microintervals allows us to capture the injection process at a finer 
granularity%%scn%% this is necessary to capture bursty fluctuations in 
traffic that can greatly influence network performance%%per%%]$~ ~$[Unlike 
at the macro%%dsh%%level%%lst%% we are ]n[ looking ]f[ a single representative interval per traffic phase%%per%%]$~ ~$[A single representative interval 
does ]n[ contain enough data to form an accurate micro%%dsh%%level 
model%%per%%]$~ ~$[Since we do ]n[ need a medoid%%lst%% we use hierarchical 
clustering at the micro scale%%per%%]$~ 
~$[Hierarchy We model multiple Markov Chains ]f[ our hierarchy of macro%%dsh%% ]^[ micro%%dsh%%levels%%per%%]$~ ~$[One Markov Chain governs 
transitioning between macro%%dsh%%phases%%per%%]$~ ~$[For each macro%%dsh%%phase 
we define another Markov Chain ]f[ its micro%%dsh%%phases%%per%%]$~ ~$[Fig%%per%% 1 
shows the two level hierarchy with two macro%%dsh%%phases ]^[ 
5 We 
use minimum%%dsh%%variance based on Ward’s method [47]%%per%%]$~ 
~$[Processor 
L1 Caches 
L2 Caches 
Coherence Protocol 
16 Out%%dsh%%of%%dsh%%Order cores%%lst%% 4%%dsh%%wide%%lst%% 80%%dsh%%instruction ROB 
16 Private%%lst%% 4%%dsh%%way%%lst%% 32 KB 
16 Private%%lst%% 8%%dsh%%way%%lst%% 512 KB 
Directory%%dsh%%Based MOESI (blocking) 
Network 
Topology 
Channel Width 
Virtual Channels 
Routing Alg%%per%%]$~ 
~$[Buffer Depth 
Router Pipeline 
A 
Mesh 
8 bytes 
2 per port 
XY 
B 
C 
Mesh 
Flattened Butterfly [23] 
4 bytes 
4 bytes 
2 per port 
4 per port 
Adaptive XY%%dsh%%YX 
UGAL 
8 flits 
4 stages 
Table 3%%cln%% Simulation configurations 
three micro%%dsh%%phases%%per%%]$~ ~$[An important property of Markov Chains 
is that they can reach equilibrium (π)%%per%%]$~ ~$[That is%%lst%% after infinite 
time%%lst%% the Markov Chain converges to a steady state where the 
probability of being in a given state is constant%%per%%]$~ ~$[We exploit 
this property to achieve significant speedups over full%%dsh%%system 
simulation in Sec%%per%% 10%%per%% 
7%%per%%]$~ ~$[Methodology 
We evaluate SynFull using a 16%%dsh%%core CMP with the configuration given in Table 3%%per%%]$~ ~$[Each node contains a core%%lst%% private L1 
cache%%lst%% private L2 cache ]^[ a directory%%per%%]$~ ~$[Data is collected using 
FeS2%%lst%% a full%%dsh%%system simulator [31] integrated with Booksim%%lst%% a 
cycle%%dsh%%accurate network simulator [19]%%per%%]$~ ~$[We run PARSEC [5] 
]^[ SPLASH%%dsh%%2 [48] benchmarks with the sim%%dsh%%small input 
set%%per%%]$~ ~$[All benchmarks are run to completion with the exception 
of facesim%%lst%% which was capped at three hundred million cycles%%per%%]$~ 
~$[To generate the SynFull models%%lst%% we collect traces from fullsystem simulation assuming an ideal fully%%dsh%%connected NoC 
with a fixed one cycle latency%%per%%]$~ ~$[Using an ideal network ensures 
that our model does ]n[ contain artifacts of the network%%lst%% ]^[ 
%%cmp_tf%% cannot be influenced by a certain topology%%lst%% routing 
algorithm%%lst%% etc%%per%%]$~ ~$[Thus a single model can be used to simulate 
a wide range of NoC configurations%%per%%]$~ ~$[We %%cmp%% NoC performance of our synthetically generated network traffic with 
full%%dsh%%system simulation ]^[ trace%%dsh%%based simulation using stateof%%dsh%%the%%dsh%%art packet dependency tracking based on Netrace [18]%%per%%]$~ 
~$[To demonstrate that our methodology is network agnostic%%lst%% we %%cmp%% against three different NoC configurations 
(Table 3)%%per%%]$~ ~$[That is%%lst%% we can apply SynFull to different NoC 
configurations ]^[ capture similar behaviour to what would 
have been exhibited by full%%dsh%%system simulation%%lst%% regardless of 
the network’s configuration%%per%% 
8%%per%%]$~ ~$[SynFull Exploration 
Our proposed SynFull traffic model has a number of parameters that can be changed%%per%%]$~ ~$[Initially%%lst%% it is ]n[ obvious ]v[ intuitive 
what the values of these parameters should be to accurately 
model traffic%%per%%]$~ ~$[In this section%%lst%% we explore these model parameters ]^[ discuss their affects on the generated network 
traffic%%lst%% NoC performance ]^[ model accuracy%%per%%]$~ ~$[Specifically%%lst%% 
we%%cln%% (i) Evaluate how the number of macro phases affect NoC 
performance%%scn%% (ii) Demonstrate how to adjust the amount of 
congestion at the micro level with different feature vectors%%scn%% 
ASW NI 
2 
2 
2 
ASW TI 
2 
2 
2 
CH NI 
2 
8 
2 
CH TI 
10 
7 
6 
Table 4%%cln%% Number of macro phases ]f[ different formal methods 
]^[ feature vectors 
Average%%per%%Packet%%per%%Latency 
Benchmark 
Lu 
Raytrace 
Swaptions 
40 
Simulation 
FSYS 
ASW_NI 
ASW_TI 
CH_NI 
CH_TI 
30 
20 
10 
0 
lu continguous 
]^[ (iii) Explore how the size of time intervals can change 
traffic generated by SynFull%%per%%]$~ 
~$[We look at the effects of different parameters quantitatively 
on three benchmarks%%cln%% Lu (contiguous)%%lst%% Raytrace%%lst%% ]^[ Swaptions%%per%%]$~ ~$[The domains of these benchmarks are different%%scn%% Lu is 
a high%%dsh%%performance computing application that relies heavily on barriers as its synchronization primitive%%lst%% Raytrace is a 
graphics%%dsh%%based benchmark that relies heavily on locks%%lst%% ]^[ 
Swaptions deals with financial analysis ]^[ is ]n[ very communication intensive%%per%%]$~ ~$[Once we have explored the parameters 
across these three benchmarks%%lst%% we make recommendations 
to achieve NoC performance estimates that are accurate with 
respect to full%%dsh%%system simulation results%%per%% 
8%%per%%1%%per%%]$~ ~$[Macro Phases 
Macro phases constitute the largest granularity ]f[ our model – 
a macro interval can be several hundred thousand cycles long%%per%%]$~ 
~$[The number of macro phases we need to model is a function of 
application behaviour%%per%%]$~ ~$[In order to determine this number%%lst%% we 
apply formal methods (CH ]^[ ASW) to a particular clustering 
of macro%%dsh%%intervals%%per%%]$~ ~$[Clustering is also affected by the feature 
vectors used%%per%%]$~ ~$[The number of macro phases used by SynFull 
affects the variety of traffic exhibited at the macro granularity%%per%%]$~ 
~$[We explore two feature vectors at the macro%%dsh%%level%%cln%% Total 
Injection (TI) ]^[ Node Injection (NI)%%per%%]$~ ~$[Our goal is to reduce 
the clustering overhead at the macro level %%cmp_b%% the number 
of observations can be quite large ]^[ varies by benchmark – 
TI ]^[ NI require the least processing time of all the proposed 
feature vectors%%per%%]$~ ~$[Using these two feature vectors%%lst%% we apply CH 
]^[ ASW to the clustering to determine the optimal number of 
macro%%dsh%%phases%%per%%]$~ ~$[We assume macro%%dsh%%intervals of 500,000 cycles 
]^[ micro%%dsh%%intervals of 200 cycles%%lst%% ]^[ the NI feature vector 
at the micro level%%per%%]$~ ~$[We create our model from full%%dsh%%system 
simulation with an ideal network%%lst%% ]^[ %%cmp_t%% apply the traffic to 
Network A%%per%%]$~ ~$[We %%cmp%% the resulting average packet latency 
to full%%dsh%%system simulation (FSYS)%%scn%% this metric includes the time 
a node is queued waiting to be injected into the network%%per%%]$~ 
~$[Table 4 shows the number of phases suggested by the ASW 
]^[ CH formal methods ]f[ the NI ]^[ TI feature vectors%%lst%% ]^[ 
Fig%%per%% 5 shows the results of using those parameters%%per%%]$~ ~$[There is 
little variation in average packet latency when tweaking macro 
parameters ]f[ Lu ]^[ Swaptions%%per%%]$~ ~$[Raytrace%%lst%% however%%lst%% shows 
more accuracy using the CH index%%lst%% which recommends 7 ]v[ 8 
macro phases with TI ]^[ NI%%lst%% respectively%%per%%]$~ ~$[Raytrace traffic has 
several macro intervals that deviate from the norm%%lst%% likely due 
to the several thousand locks it uses [48]%%lst%% ]^[ %%cmp_tf%% should 
be modelled with more macro phases%%per%%]$~ ~$[The locking in Raytrace 
results in an unstructured communication pattern with high 
raytrace 
swaptions 
Figure 5%%cln%% Macro%%dsh%%level sweeping of feature vectors & number 
of phases (Table 4)%%per%% 
variation%%per%%]$~ ~$[Too few macro phases would force interval outliers 
into phases where they do ]n[ belong%%per%%]$~ 
~$[The use of barriers in Lu results in distinct periods of low 
]^[ high communication%%scn%% when all threads reach a barrier there 
is a sudden burst of packets into the NoC%%per%%]$~ ~$[This communication 
pattern maps well to 2 distinct macro phases%%per%%]$~ ~$[CH+TI has 10 
macro phases which results in the highest error ]f[ SynFull%%per%%]$~ 
~$[Too many phases can lead to poor clustering quality %%cmp_b%% 
some phases will have very few%%lst%% ]v[ even a single interval%%lst%% associated with them%%per%%]$~ ~$[These phases are superfluous ]^[ negatively 
impact the Markov Chain %%cmp_b%% they will be rarely visited%%per%%]$~ 
~$[The single dimension of TI makes the clustering sensitive 
to fluctuations between macro intervals%%scn%% that is%%lst%% two highcommunication macro%%dsh%%intervals may ]n[ be clustered together 
due to a small difference in total packets%%per%%]$~ ~$[This sensitivity is 
alleviated by using more dimensions%%lst%% ]s[ that deviations in one 
element are neutralized by similarity in others%%per%%]$~ ~$[This helps 
prevent the case where we have too many phases ]f[ macro 
intervals%%scn%% thus%%lst%% we recommend NI ]f[ macro clustering ]^[ 
CH ]f[ the number of macro phases%%per%% 
8%%per%%2%%per%%]$~ ~$[Congestion at the Micro Level 
Sec%%per%% 8%%per%%1 uses Node Injection (NI) as the feature vector at 
the micro level%%per%%]$~ ~$[NI clusters micro intervals according to the 
distribution of injected packets across nodes%%per%%]$~ ~$[While this will 
cluster hot spots at source nodes%%lst%% there are situations where hot 
spots exist between source%%dsh%%destination pairs%%per%%]$~ ~$[For example%%lst%% a 
many%%dsh%%to%%dsh%%one communication pattern is ]n[ accurately captured 
by the NI vector%%per%%]$~ ~$[The Row%%dsh%%Column Flow (RCFlow) ]^[ PerNode Flow (Flow) feature vectors are better suited to capturing 
these hot spots%%lst%% allowing ]f[ the synthetically generated traffic 
to cause congestion as full%%dsh%%system simulation might%%per%%]$~ 
~$[In this section%%lst%% we use CH+NI at the macro level with 
interval sizes of 500,000 cycles%%per%%]$~ ~$[We %%cmp%% the NI feature 
vector to RCFlow ]^[ Flow with 200%%dsh%%cycle micro intervals%%per%%]$~ 
~$[We run our models on Network A ]^[ show average packet 
latency in Fig%%per%% 6%%per%%]$~ ~$[The RCFlow ]^[ Flow vectors are more 
accurate with respect to full%%dsh%%system simulation ]f[ Raytrace%%scn%% 
the locks used by Raytrace result in specific source%%dsh%%destination 
sharing that NI does ]n[ capture%%per%%]$~ ~$[Also important is that the two 
vectors did ]n[ negatively affect the accuracy ]f[ the Lu ]^[ 
Swaptions%%scn%% that is%%lst%% RCFlow ]^[ Flow did ]n[ artificially create 
congestion ]f[ benchmarks that do ]n[ exhibit that behaviour%%per%%]$~ 
~$[We are ]n[ only interested in average behaviour ]b[ in capturing the highs ]^[ lows of network traffic%%per%%]$~ ~$[Looking at packet 
Average%%per%%Packet%%per%%Latency 
Average%%per%%Packet%%per%%Latency 
40 
Simulation 
FSYS 
Flow 
RCFlow 
NI 
30 
20 
10 
0 
lu continguous 
raytrace 
swaptions 
Simulation 
FSYS 
Flow 100 250000 
Flow 200 500000 
Flow 500 1250000 
RCFlow 100 250000 
RCFlow 200 500000 
RCFlow 500 1250000 
40 
30 
20 
10 
0 
lu continguous 
Figure 6%%cln%% Micro%%dsh%%level sweep of feature vectors 
Hellinger%%per%%Distance 
50 
Feature Vector 
Cluster Algorithm 
Formal Method 
Interval Size 
Simulation 
Flow 
RCFlow 
Node 
0%%per%%06 
0%%per%%03 
0%%per%%00 
lu continguous 
raytrace 
Macro%%dsh%%Level Model 
Node Injection 
PAM 
CH Index 
500,000 
Micro%%dsh%%Level Model 
RCFlow 
Hierarchical 
L%%dsh%%Method 
200 
Table 5%%cln%% Final SynFull Configuration 
swaptions 
Figure 7%%cln%% Hellinger distance comparing packet latency distributions of synthetic simulations to full system%%per%%]$~ ~$[Lower is better%%per%% 
latency distributions%%lst%% we can see the number of packets that 
achieve a wide range of latencies while in the network%%scn%% this 
distribution gives insight into the congestion the network has 
experienced%%per%%]$~ ~$[The Hellinger Distance defines the similarity 
between two distributions%%per%%]$~ ~$[The Hellinger Distance is defined 
in Equation 2%%lst%% where P ]^[ Q are two discrete distributions (in 
our case%%lst%% packet latency distributions)%%lst%% ]^[ pi ]^[ qi are the 
ith element of P ]^[ Q%%lst%% respectively%%per%% 
v 
u 
1 u k √ 
√ 
H(P%%lst%% Q) = √ t ∑ ( pi − qi )2 
2 i=1 
swaptions 
Figure 8%%cln%% NoC performance ]f[ different interval sizes%%per%% 
0%%per%%12 
0%%per%%09 
raytrace 
(2) 
Fig%%per%% 7 shows the Hellinger Distance ]f[ our synthetic traffic 
latency distributions %%cmp%%d to full%%dsh%%system simulation%%per%%]$~ ~$[The 
lower the distance%%lst%% the more similar the latency distributions 
are%%per%%]$~ ~$[We can see that%%lst%% although the error in average packet 
latency is less ]f[ Raytrace with the Flow vector (Fig%%per%% 7)%%lst%% the 
distribution of packet latencies is ]n[ as close to full system 
as RCFlow%%per%%]$~ ~$[This is %%cmp_b%% the Flow vector causes more high 
latency packets %%cmp_ta%% full%%dsh%%system simulation%%lst%% driving up the average packet latency with more congestion %%cmp_ta%% necessary%%per%%]$~ ~$[In 
all cases%%lst%% RCFlow is more similar to the desired packet latency 
distribution exhibited by full%%dsh%%system simulation%%lst%% ]^[ its error 
in average packet latency is comparable to Flow%%per%%]$~ ~$[Therefore%%lst%% 
we recommend RCFlow ]f[ micro clustering%%per%% 
8%%per%%3%%per%%]$~ ~$[Time Interval Size 
So far we have used 500,000 cycles per macro interval ]^[ 
200 cycles per micro interval%%per%%]$~ ~$[This results in 500%%lst%% 000/200 = 
2%%lst%% 500 micro intervals (observations) per macro interval%%lst%% which 
is low enough to keep hierarchical clustering time reasonable%%per%%]$~ 
~$[Now%%lst%% we sweep the macro ]^[ micro interval sizes together ]s[ 
that they always result in 2,500 observations%%per%%]$~ ~$[We use CH+NI 
at the macro level%%lst%% ]^[ %%cmp%% the RCFlow ]^[ Flow feature 
vectors at the micro level with various interval sizes%%per%%]$~ 
~$[Fig%%per%% 8 shows the average packet latency ]f[ SynFull traffic 
with different interval sizes%%per%%]$~ ~$[There is ]n[ a clear cut interval 
size that is best ]f[ every application%%per%%]$~ ~$[RCFlow works best with 
a micro%%dsh%%interval size of 100 cycles ]f[ Raytrace%%lst%% ]b[ performs 
worse ]f[ Lu%%per%%]$~ ~$[Applications may exhibit different periodic 
behaviour at the micro level depending on their algorithm ]v[ 
an application may ]n[ have periodic behaviour at all%%per%%]$~ ~$[When 
using large interval sizes of 500 cycles ]v[ more%%lst%% we risk ]n[ 
capturing bursty application traffic %%cmp_b%% deviations in injection rate get averaged out across the interval%%per%%]$~ ~$[For applications 
without bursty traffic%%lst%% large interval sizes work well %%cmp_b%% 
the standard deviation of packets injected over time is low%%per%%]$~ 
~$[Choosing a universal interval size ]f[ all applications may 
lead to slightly less accurate SynFull results ]f[ a subset of 
benchmarks%%per%%]$~ ~$[In future work%%lst%% we will investigate automatically 
determining the interval size based on application traffic%%per%% 
8%%per%%4%%per%%]$~ ~$[Parameter Recommendations 
Based on the results presented in this section%%lst%% we make some 
recommendations regarding model parameters used in SynFull%%per%%]$~ 
~$[Changing the feature vector at the macro level does ]n[ have a 
significant effect on network performance%%per%%]$~ ~$[However%%lst%% in terms 
of the clustering quality (recall TI vs%%per%%]$~ ~$[NI ]f[ Lu’s barriers)%%lst%% 
using the NI feature vector with the CH index yields the best 
results%%per%%]$~ ~$[For feature vectors at the micro level%%lst%% it is important to 
select a vector that adequately captures hotspots%%per%%]$~ ~$[Both RCFlow 
]^[ Flow feature vectors show good results%%lst%% however RCFlow 
scales better with the number of nodes being simulated ]^[ 
takes significantly less time to model (typically%%lst%% an RCFlow 
model takes a few minutes to generate whereas a Flow model 
can take over 20)%%per%%]$~ ~$[Finally%%lst%% the interval sizes of the macro 
]^[ micro levels can greatly influence traffic generated by 
SynFull%%per%%]$~ ~$[For the rest of this paper%%lst%% we will use 200 cycles at 
the micro%%dsh%%level ]^[ 500%%lst%% 000 cycles at the macro%%dsh%%level%%per%% 
9%%per%%]$~ ~$[Results 
We evaluate SynFull with PARSEC ]^[ SPLASH%%dsh%%2 benchmarks on the three network configurations introduced in Table 3%%per%%]$~ ~$[We %%cmp%% SynFull against full%%dsh%%system simulation ]^[ 
trace simulation with packet dependences%%per%%]$~ ~$[For SynFull%%lst%% we 
use the recommendations in Sec%%per%% 8%%per%%4 summarized in Table 5%%per%%]$~ 
~$[Initially ]f[ both SynFull ]^[ trace simulations%%lst%% the number of 
cycles simulated is equal to the number of cycles required to 
150 
Trace%%per%%Dependency 
Network A 
SynFull 
Network B 
Network C 
100 
50 
ac Ba 
ks rn 
e 
Bo cho s 
dy les 
t 
C ra 
ho c 
k 
Fa lesk 
ce y 
si 
Fl 
m 
ui 
lu lu_ dan FF 
_n co im T 
on nt a 
co igu te 
nt ou 
ig 
R uo s 
ad u 
io s 
s 
R ity 
R ad 
a 
Sw ytr ix 
ap ace 
W 
at 
t 
er V ion 
_ o s 
W ns lre 
q 
at u nd 
er a 
_s re 
ge pa d 
oM tia 
e l 
Bl B an 
ac a 
r 
ks n 
e 
Bo cho s 
dy les 
C tra 
ho c 
k 
Fa lesk 
ce y 
si 
Fl 
m 
ui 
lu lu_ dan FF 
_n co im T 
on nt a 
co igu te 
nt ou 
ig 
R uo s 
ad u 
io s 
s 
R ity 
R ad 
ay ix 
Sw tr 
ap ace 
W 
at 
t 
er V ion 
_ o s 
W ns lre 
at qu nd 
er a 
_s re 
ge pa d 
oM tia 
e l 
Bl B an 
ac a 
ks rn 
e 
Bo cho s 
dy les 
C tra 
ho c 
k 
Fa lesk 
ce y 
si 
Fl 
m 
ui 
lu lu_ dan FF 
_n co im T 
on nt a 
co igu te 
nt ou 
ig 
R uo s 
ad u 
io s 
s 
R ity 
R ad 
ay ix 
Sw tr 
ap ace 
W 
at 
t 
er V ion 
_n olr s 
W s e 
at qu nd 
er a 
_s re 
ge pa d 
oM tia 
ea l 
n 
0 
Bl 
Average%%per%%Packet%%per%%Latency 
FSYS 
Figure 9%%cln%% NoC performance%%per%%]$~ ~$[Bars that reach the top of the y%%dsh%%axis (e%%per%%g%%per%%]$~ ~$[FFT) are truncated ]s[ that other results may be seen more clearly%%per%% 
0%%per%%8 
Network A 
Network B 
SynFull 
Network C 
0%%per%%6 
0%%per%%4 
0%%per%%2 
0%%per%%0 
bl b 
ac a 
ks rne 
c s 
bo ho 
dy les 
ch trac 
ol k 
e 
fa sky 
ce 
si 
flu 
m 
id 
an f 
im ft 
at 
lu e 
_ 
lu cb 
_ 
ra nc 
di b 
os 
it 
r y 
ra adi 
y 
sw tra x 
ap ce 
w 
ti 
at 
er vo ons 
_n lr 
w sq en 
at u d 
er ar 
_s ed 
pa 
ti 
bl b al 
ac a 
ks rne 
c s 
bo ho 
dy les 
ch trac 
ol k 
e 
fa sky 
ce 
si 
flu 
m 
id 
an f 
im ft 
at 
lu e 
_ 
lu cb 
_ 
ra nc 
di b 
os 
it 
r y 
ra adi 
sw ytra x 
ap ce 
w 
ti 
at 
er vo ons 
_ l 
w nsq ren 
at u d 
er ar 
_s ed 
pa 
ti 
bl b al 
ac a 
ks rne 
c s 
bo ho 
dy les 
ch trac 
ol k 
e 
fa sky 
ce 
si 
flu 
m 
id 
an f 
im ft 
at 
lu e 
_c 
lu b 
_ 
ra nc 
di b 
os 
it 
r y 
ra adi 
y 
sw tra x 
ap ce 
w 
ti 
at 
er vo ons 
_n lr 
w sq en 
at u d 
er ar 
_s ed 
pa 
tia 
l 
Hellinger%%per%%Distance 
Trace%%per%%Dependency 
Figure 10%%cln%% Comparing similarity of packet latency distributions with full%%dsh%%system simulation 
complete a full%%dsh%%system simulation of the benchmark with an 
ideal network%%per%%]$~ ~$[Later%%lst%% we explore early simulation termination 
due to the Markov Chain reaching steady%%dsh%%state%%per%%]$~ 
~$[Incorporating packet dependences into trace simulation improves the fidelity of traditional trace%%dsh%%based simulation on 
NoCs [18]%%per%%]$~ ~$[Traditionally%%lst%% packets from a trace are injected 
into the network with no regard ]f[ when they arrive at their 
destinations%%per%%]$~ ~$[This is unrealistic due to the reactive nature of 
some packets%%lst%% as explained in Sec%%per%% 4%%per%%]$~ ~$[Dependence tracking 
aims to capture the reactive nature of packets%%lst%% ]^[ only inject 
them when their requesting packet has arrived%%scn%% the injection 
of dependent packets is triggered by another packet’s arrival%%lst%% 
rather %%cmp_ta%% the timestamp of the original trace%%per%%]$~ 
~$[We %%cmp%% average packet latency across simulation 
methodologies (Fig%%per%% 9)%%per%%]$~ ~$[SynFull does very well on NoCs 
A ]^[ C%%lst%% with a geometric mean error of 8%%per%%9% ]^[ 9%%per%%5% 
across all benchmarks%%per%%]$~ ~$[NoCs A ]^[ C are reasonably wellprovisioned%%scn%% most applications do ]n[ experience significant 
contention on these networks%%per%%]$~ ~$[SynFull achieves accurate average packet latency both ]f[ applications that do ]n[ stress the 
network (e%%per%%g%%per%%]$~ ~$[Cholesky Radix%%lst%% Radiosity%%lst%% Swaptions)%%lst%% ]^[ applications that do stress the network (e%%per%%g%%per%%]$~ ~$[Barnes%%lst%% Bodytrack%%lst%% 
Fluidanimate)%%per%%]$~ ~$[Network throughput has similar accuracy%%lst%% with 
geometric mean errors of 11%%per%%78% ]^[ 12%%per%%42% ]f[ NoCs A 
]^[ C%%per%%]$~ ~$[Running an ideal network trace with dependences does 
]n[ fair as well (geometric mean packet latency error of 18% 
]^[ 12%%per%%8% ]f[ NoCs A ]^[ C) %%cmp_b%% dependences are ]n[ 
tracked at the application level%%per%%]$~ ~$[While reactive packets are 
throttled correctly waiting on the arrival of predecessor pack%%dsh%% 
ets%%lst%% independent packets continue to be injected according to 
their timestamp%%per%%]$~ ~$[For most applications%%lst%% especially FFT ]^[ 
Radix%%lst%% this has a significant impact on NoC performance%%per%%]$~ 
~$[NoC B is the least provisioned of the 3 networks%%per%%]$~ ~$[As a 
result%%lst%% discrepancies in initiating packet injections are more 
pronounced ]f[ both SynFull (16%%per%%1% packet latency error ]^[ 
a 16%%per%%11% throughput error) ]^[ Traces (30%%per%%2% packet latency 
error)%%per%%]$~ ~$[Traces with dependences have significant error even ]f[ 
applications with low communication requirements (e%%per%%g%%per%%]$~ ~$[Radiosity)%%lst%% while SynFull is capable of reproducing similar NoC 
performance ]f[ benchmarks of this type%%per%%]$~ ~$[Some applications 
running on NoC B have significant error ]f[ both SynFull ]^[ 
Traces%%per%%]$~ ~$[In particular%%lst%% Radix ]^[ FFT (excluded from geoMean 
calculations) run off the chart%%per%%]$~ ~$[These are special cases where 
the application has macro%%dsh%%level intervals with very high injection rates that dwarf the injection rate across the rest of the 
application%%per%%]$~ ~$[For example%%lst%% running FFT on an ideal network%%lst%% 
there is a spike of several macro%%dsh%%intervals during the middle 
of simulation with an order of magnitude larger injection rate 
%%cmp_ta%% other intervals%%per%%]$~ ~$[When running FFT in full%%dsh%%system simulation on the considerably less provisioned NoC B%%lst%% the spike is 
longer ]b[ with a much lower (less %%cmp_ta%% 50%) injection rate%%per%%]$~ 
~$[This is due to application%%dsh%%level dependences ]^[ the core’s reorder buffer throttling instruction issue which in turn throttles 
network injection%%per%%]$~ ~$[However%%lst%% this is an extreme case ]^[ one 
]n[ typically found in many of the applications we consider%%scn%% 
we are investigating techniques to adapt our model to these 
scenarios%%per%%]$~ 
~$[We discussed the importance of packet latency distributions 
● 
FSYS 
SynFull 
Average Packet Latency 
Buffer Size 
Channel Width 
80 
60 
● 
● 
40 
● 
● 
● 
● 
4 
8 
12 
16 
● 
4 
8 
● 
12 
16 
Number of Flits (Buffer Size) ]v[ Bytes (Channel Width) 
Figure 11%%cln%% Two case studies of packet latency trends across 
all workloads 
in Sec%%per%% 8%%per%%2%%lst%% ]^[ use the Hellinger Distance to %%cmp%% distributions to full%%dsh%%system simulation%%per%%]$~ ~$[Fig%%per%% 10 shows packet 
latency distribution Hellinger Distance ]f[ SynFull ]^[ Traces 
%%cmp%%d to full%%dsh%%system simulation%%per%%]$~ ~$[Consistent with the average packet latency error%%lst%% SynFull modelling FFT (NoC B) has 
a large Hellinger Distance which indicates that the resulting 
distribution does ]n[ resemble the latency distribution seen in 
full%%dsh%%system simulation%%per%%]$~ ~$[Outside of FFT%%lst%% our technique fares 
well ]f[ PARSEC ]^[ SPLASH%%dsh%%2 applications%%per%%]$~ ~$[Applications 
with low communication requirements typically have the lowest Hellinger Distance %%cmp_b%% both SynFull ]^[ full%%dsh%%system 
simulation do ]n[ have a large tail in the distribution%%per%%]$~ ~$[For 
applications with more bursty behaviour%%lst%% Hellinger Distances 
are greater ]b[ still comparable%%per%%]$~ 
~$[Traces that perform well in average packet latency on NoCs 
A ]^[ C perform better %%cmp_ta%% SynFull in Hellinger Distance 
(e%%per%%g%%per%%]$~ ~$[Cholesky%%lst%% Lu%%lst%% Radiosity)%%per%%]$~ ~$[These applications have low 
communication requirements%%per%%]$~ ~$[As a result%%lst%% the issue of independent messages flooding the network is minimized on 
a well%%dsh%%provisioned network%%lst%% ]^[ the trace faithfully reproduces application traffic%%per%%]$~ ~$[Due to the randomness associated 
with Markov Chains%%lst%% SynFull phases do ]n[ exactly coincide 
the way a trace would%%per%%]$~ ~$[As a result%%lst%% we have slightly higher 
Hellinger Distances%%lst%% ]b[ the results are still comparable%%per%%]$~ ~$[However%%lst%% when comparing applications across all domains%%lst%% SynFull 
is the clear winner%%per%% 
9%%per%%1%%per%%]$~ ~$[Capturing Trends 
While absolute error values are useful%%lst%% designers expect a 
methodology to accurately capture the relationship between 
networks designs%%per%%]$~ ~$[That is%%lst%% %%cmp_if%% one network performs better %%cmp_ta%% 
another in full%%dsh%%system simulation%%lst%% %%cmp_t%% the trend should be the 
same when using SynFull%%per%%]$~ ~$[Here we demonstrate that the relationship is captured with more intuitive trends%%per%%]$~ ~$[Specifically%%lst%% 
we perform two separate sweeps on channel width ]^[ virtual 
channel buffer size%%per%%]$~ ~$[In the first sweep%%lst%% we look at networks 
with 16%%lst%% 8%%lst%% 4%%lst%% ]^[ 2 byte channel widths%%per%%]$~ ~$[In the second sweep%%lst%% 
we look at networks with 16%%lst%% 8%%lst%% 4%%lst%% ]^[ 2 flits per buffer%%per%%]$~ ~$[Intuitively%%lst%% larger channel widths ]^[ buffer sizes would lead to 
better performance %%cmp_ta%% smaller ones%%per%%]$~ ~$[Indeed%%lst%% this is the case 
as shown in Fig%%per%% 11%%scn%% results are averaged across all workloads%%per%%]$~ 
~$[Packets are subdivided into flits based on the channel width%%per%%]$~ 
~$[Our simulations use 8%%dsh%%byte control packets ]^[ 72%%dsh%%byte data 
packets%%per%%]$~ ~$[From Fig%%per%% 11 (right) we see that there is ]n[ much 
difference in performance between an 8 ]^[ 16 byte channel 
width%%per%%]$~ ~$[This is %%cmp_b%% a 16 byte channel width only improves 
transmission of data packets%%lst%% since 8 bytes is all that is needed 
]f[ a control packet%%per%%]$~ ~$[As the channel width decreases%%lst%% ]s[ too 
does performance due to the increased serialization latency of 
all packets%%per%%]$~ ~$[Buffer depth also affects performance%%per%%]$~ ~$[Smaller 
buffers increases the latency of packets %%cmp_b%% flits have to 
wait until space becomes available before proceeding towards 
their destination%%per%%]$~ ~$[In this case study%%lst%% Fig%%per%% 11 (left) shows that 
SynFull captures the relationship almost perfectly%%per%%]$~ 
~$[Overall%%lst%% SynFull is a superior approach to trace dependences 
in terms of fidelity%%per%%]$~ ~$[SynFull is less prone to error across a variety of applications ]^[ stresses an NoC in the same way 
an application would in full%%dsh%%system simulation%%per%%]$~ ~$[SynFull also 
captures the same trends found through full%%dsh%%system simulation%%per%%]$~ 
~$[High accuracy is an important attribute of SynFull%%scn%% independent of its accuracy relative to full%%dsh%%system simulation%%lst%% SynFull 
provides a meaningful collection of synthetic traffic models 
that capture a diverse range of application ]^[ cache coherence behaviour making SynFull an invaluable tool in a NoC 
designer’s arsenal%%per%%]$~ ~$[In Sec%%per%% 10%%lst%% we explore the speed of SynFull 
relative to full%%dsh%%system simulation%%lst%% ]^[ how it can be further 
accelerated using a special property of Markov Chains%%per%% 
10%%per%%]$~ ~$[Exploiting Markov Chains ]f[ Speedup 
Simply running SynFull ]f[ the same number of cycles as 
full%%dsh%%system simulation results in significant speed up – this 
is %%cmp_b%% SynFull itself does ]n[ require much processing 
time%%per%%]$~ ~$[The NoC simulator is the limiting factor%%lst%% ]b[ is still substantially faster %%cmp_ta%% a full%%dsh%%system simulator%%per%%]$~ ~$[We can further 
improve the simulation time of SynFull by exploiting the stationary distribution of Markov Chains%%per%%]$~ ~$[An important property 
of Markov Chains is that they can reach equilibrium%%per%%]$~ ~$[That is%%lst%% 
after infinite time%%lst%% the Markov Chain converges to a steady 
state where the probability of being in a given state is constant%%per%%]$~ 
~$[In SynFull%%lst%% when the macro%%dsh%%level Markov Chain has converged to its equilibrium%%lst%% we exit the simulation prematurely%%per%%]$~ 
~$[This implies that all traffic phases have been simulated ]f[ an 
adequate time%%lst%% ]^[ our simulation has reached its steady state%%per%%]$~ 
~$[We cannot apply the same methodology to trace%%dsh%%based simulation %%cmp_b%% it follows the same progression as full%%dsh%%system 
simulation%%per%%]$~ ~$[If we exit a trace prematurely%%lst%% we may miss out on 
a large period of bursty communication ]v[ low communication%%lst%% 
both of which would give very different overall NoC performance results%%per%%]$~ ~$[For example%%lst%% %%cmp_if%% trace simulation of FFT were to 
exit early%%lst%% it would ]n[ reach the large spike of macro intervals%%lst%% 
leading NoC researchers to draw incorrect conclusions%%per%%]$~ 
~$[Fig%%per%% 12 shows the average speedup of traces%%lst%% SynFull%%lst%% ]^[ 
with SynFull exiting simulation at steady%%dsh%%state (SynFull_SS)%%per%%]$~ 
~$[The numbers are calculated by averaging the total runtime of 
simulations across each of the three network configurations (A%%lst%% 
B%%lst%% ]^[ C) ]f[ each application%%per%%]$~ ~$[Without steady%%dsh%%state%%lst%% SynFull 
Speed Up 
150 
100 
50 
Synthetic 
Synthetic_SS 
Trace%%per%%Dependency 
bla b 
ck arn 
sc es 
bo hol 
dy es 
ch trac 
ole k 
fa sky 
ce 
sim 
flu 
ida 
nim fft 
a 
lu_ te 
lu_ cb 
ra nc 
dio b 
sit 
r y 
ra adix 
y 
sw tra 
ap ce 
wa 
t 
te vo ions 
r_ 
lr 
wa nsq end 
te ua 
r_ re 
sp d 
at 
ial 
0 
Figure 12%%cln%% The average speedup over full system simulation 
]^[ Trace Dependency speed%%dsh%%ups are very similar since they 
simulate the same number of cycles%%per%%]$~ ~$[The simulation bottleneck 
here is the NoC itself ]^[ ]n[ the methodology ]f[ driving 
traffic%%per%%]$~ ~$[With steady state%%lst%% we achieve substantial speedup%%scn%% 
speedup is as high as ∼150× ]^[ over 50× on average%%per%%]$~ 
~$[SynFull models two Markov Chains%%scn%% however%%lst%% we only exit 
when steady state is reached at the macro level%%per%%]$~ ~$[We could 
potentially end a macro%%dsh%%interval early by observing steady 
state at the micro level%%per%%]$~ ~$[However%%lst%% this would result in different 
length macro intervals%%lst%% which could negatively affect performance accuracy%%per%%]$~ ~$[For example%%lst%% imagine a low injection macro 
interval reaches steady state very early while a high injection 
macro interval does not%%per%%]$~ ~$[There would be a disproportionate 
amount of high injection to low injection%%lst%% negatively impacting the accuracy of our model%%per%%]$~ ~$[By only observing steady state 
at the macro%%dsh%%level Markov Chain%%lst%% we achieve similar error 
%%cmp%%d to running SynFull to completion%%scn%% a full run of SynFull has a geometric mean error of 8%%per%%9%%%lst%% 16%%per%%1%%%lst%% ]^[ 9%%per%%5% 
across networks A%%lst%% B%%lst%% ]^[ C%%lst%% while SynFull with steady state 
yields errors of 10%%per%%5%%%lst%% 17%%per%%1%%%lst%% ]^[ 9%%per%%1%%%per%% 
11%%per%%]$~ ~$[Related Work 
Simulation acceleration%%per%%]$~ ~$[There has been considerable work 
done to improve simulation time%%per%%]$~ ~$[FPGA%%dsh%%based acceleration 
has been proposed [11%%lst%% 43]%%per%%]$~ ~$[FIST implements an FPGA%%dsh%%based 
network simulator that can simulate mesh networks with significant speed up over software simulation [32]%%per%%]$~ ~$[User%%dsh%%level simulators exist as an alternative to full%%dsh%%system simulation ]f[ exploring thousands of cores [7%%lst%% 29]%%per%%]$~ ~$[ZSim exploits parallel simulation with out%%dsh%%of%%dsh%%order core models [37]%%per%%]$~ ~$[Sampling ]f[ microarchitectural simulation has been widely explored [38%%lst%% 39%%lst%% 49] 
]^[ has received renewed attention ]f[ multi%%dsh%%threaded ]^[ 
multi%%dsh%%core processors [1%%lst%% 8]%%per%%]$~ ~$[Zhang et al%%per%% leverage SimPoints 
]f[ network traffic ]s[ that they may speed up simulations ]f[ 
parallel applications [51]%%per%%]$~ ~$[Hornet [33] focuses on parallelizing 
a NoC simulation%%per%%]$~ ~$[Simulators such as Hornet [33]%%lst%% ZSim [37] 
]^[ Slacksim [9] are great tools ]b[ designers should still 
prune the design space to a few candidates prior to using such 
detailed simulators%%scn%% SynFull bridges the gap between existing 
synthetic models ]^[ detailed full%%dsh%%system simulation%%per%%]$~ 
~$[Workload modelling%%per%%]$~ ~$[Cloning can mimic workload behaviour by creating a reduced representation of the code [3%%lst%% 
21]%%per%%]$~ ~$[Much of this work focuses on cloning cache behaviour%%scn%% 
SynFull can be viewed as creating clones of cache coherence behaviour to stimulate the network%%per%%]$~ ~$[Creation of syn%%dsh%% 
thetic benchmarks ]f[ multi%%dsh%%threaded applications has been 
explored [17]%%scn%% this work generates instruction streams that execute in simulation ]v[ on real hardware%%per%%]$~ ~$[Our work differs as we 
reproduce communication patterns ]^[ coherence behaviour 
while abstracting away the processor ]^[ instruction execution%%per%%]$~ 
~$[MinneSPEC [24] provides reduced input sets that effectively 
match the reference input ]f[ SPEC2000%%scn%% rather %%cmp_ta%% focus on 
input set ]v[ instruction generation%%lst%% we provide a reduced set 
of traffic based on the steady state of a Markov Chain%%per%%]$~ 
~$[Workload Design ]^[ Synthetic Traffic%%per%%]$~ ~$[Synthetic workloads have been a focus of research long before NoCs 
emerged [16%%lst%% 42]%%per%%]$~ ~$[Statistical profiles can be used to generate synthetic traces ]f[ microarchitectural performance analysis [14]%%per%%]$~ ~$[Methods ]f[ synthetic trace generation at the chip 
level have also been proposed [44%%lst%% 45]%%scn%% Soteriou et al%%per%% propose a 3%%dsh%%tuple statistical model that leverages self%%dsh%%similarity 
to create bursty synthetic traffic [41]%%per%%]$~ ~$[To our knowledge%%lst%% there 
has been no work done to synthetically generate network traffic that includes cache coherence%%per%%]$~ ~$[The benefits of such an 
approach allows us to remove the necessity ]f[ full%%dsh%%system 
simulation while still allowing works that exploit coherence 
traffic%%per%%]$~ ~$[In addition%%lst%% most statistical models do ]n[ %%cmp%% 
generated traffic with full%%dsh%%system simulations%%lst%% ignoring performance metrics such as packet latency%%per%% 
12%%per%%]$~ ~$[Conclusion 
Full%%dsh%%system simulation is a long ]^[ tedious process%%scn%% as a 
result%%lst%% it limits the range of designs that can be explored in a 
tractable amount of time%%per%%]$~ ~$[We propose a novel methodology 
to accelerate NoC simulation%%per%%]$~ ~$[SynFull enables the creation 
of synthetic traffic models that mimic the full range of cache 
coherence behaviour ]^[ the resulting traffic that is injected 
into the network%%per%%]$~ ~$[We accurately capture spatial variation in 
traffic patterns within ]^[ across applications%%per%%]$~ ~$[Furthermore%%lst%% 
burstiness is captured in our model%%per%%]$~ ~$[These two attributes 
lead to a model that produces accurate network traffic%%per%%]$~ ~$[We 
attain an overall accuracy of 10%%per%%5% across 3 configurations 
]f[ all benchmarks relative to full%%dsh%%system simulation%%per%%]$~ ~$[Furthermore%%lst%% our technique uses the steady%%dsh%%state behaviour of 
Markov chains to speedup simulation by up to 150×%%per%%]$~ ~$[SynFull 
is a powerful ]^[ robust tool that will enable faster exploration 
of a rich design space in NoCs%%per%%]$~ ~$[SynFull can be downloaded at 
www%%per%%eecg%%per%%toronto%%per%%edu/~enright/downloads%%per%%html 
Acknowledgements 
This research was funded by a gift from Intel%%per%%]$~ ~$[Additional support was provided by the Canadian Foundation ]f[ Innovation 
]^[ the Ontario Research Fund%%per%%]$~ ~$[We %%cmp_ta%%k Mike Kishinevsky 
]^[ Umit Ogras ]f[ their invaluable feedback ]^[ insight while 
developing SynFull%%per%%]$~ ~$[We further %%cmp_ta%%k Emily Blem%%lst%% Andreas 
Moshovos%%lst%% Jason Anderson%%lst%% the members of the Enright Jerger 
research group ]^[ the anonymous reviewers ]f[ their thoughtful ]^[ detailed feedback on this work%%per%%]$~ 
~$[References 
[1] E%%per%%]$~ ~$[Ardestani ]^[ J%%per%%]$~ ~$[Renau%%lst%% “ESESC%%cln%% A fast multicore simulator using 
time%%dsh%%based sampling,” in Proc%%per%% of Intl%%per%%]$~ ~$[Symposium on High Performance Computer Architecture%%lst%% 2013%%per%% 
[2] J%%per%%]$~ ~$[H%%per%%]$~ ~$[Bahn ]^[ N%%per%%]$~ ~$[Bagherzadeh%%lst%% “A generic traffic model ]f[ on%%dsh%%chip 
interconnection networks,” Network on Chip Architectures%%lst%% p%%per%% 22%%lst%% 2008%%per%% 
[3] G%%per%%]$~ ~$[Balakrishnan ]^[ Y%%per%%]$~ ~$[Solihin%%lst%% “WEST%%cln%% Cloning data cache behavior 
using stochastic traces,” in Proc%%per%% of Intl%%per%%]$~ ~$[Symposium High Performance 
Computer Architecture%%lst%% 2012%%per%% 
[4] R%%per%%]$~ ~$[Bellman%%lst%% Adaptive Control Processes%%cln%% A Guided Tour%%lst%% ser%%per%%]$~ ~$[A Rand 
Corporation Research Study Series%%per%%]$~ ~$[Princeton University Press%%lst%% 1961%%per%% 
[5] C%%per%%]$~ ~$[Bienia%%lst%% “Benchmarking modern multiprocessors,” Ph%%per%%D%%per%% dissertation%%lst%% 
Princeton University%%lst%% January 2011%%per%% 
[6] T%%per%%]$~ ~$[Caliński ]^[ J%%per%%]$~ ~$[Harabasz%%lst%% “A dendrite method ]f[ cluster analysis,” 
Comm in Statistics%%dsh%%theory ]^[ Methods%%lst%% vol%%per%% 3%%lst%% no%%per%% 1%%lst%% pp%%per%% 1–27%%lst%% 1974%%per%% 
[7] T%%per%%]$~ ~$[E%%per%%]$~ ~$[Carlson%%lst%% W%%per%%]$~ ~$[Heirman%%lst%% ]^[ L%%per%%]$~ ~$[Eeckhout%%lst%% “Sniper%%cln%% exploring the 
level of abstraction ]f[ scalable ]^[ accurate parallel multi%%dsh%%core simulation,” in Proc of Supercomputing (SC)%%lst%% 2011%%lst%% p%%per%% 52%%per%% 
[8] T%%per%%]$~ ~$[E%%per%%]$~ ~$[Carlson%%lst%% W%%per%%]$~ ~$[Heirman%%lst%% ]^[ L%%per%%]$~ ~$[Eeckhout%%lst%% “Sampled simulation of 
multi%%dsh%%threaded applications,” in Intl%%per%%]$~ ~$[Symp%%per%%]$~ ~$[Performance Analysis of 
Systems ]^[ Software%%lst%% Apr%%per%% 2013%%per%% 
[9] J%%per%%]$~ ~$[Chen%%lst%% L%%per%%]$~ ~$[K%%per%%]$~ ~$[Dabbiru%%lst%% D%%per%%]$~ ~$[Wong%%lst%% M%%per%%]$~ ~$[Annavaram%%lst%% ]^[ M%%per%%]$~ ~$[Dubois%%lst%% 
“Adaptive ]^[ speculative slack simulations of CMPs on CMPs,” in 
Proc%%per%% of Intl%%per%%]$~ ~$[Symposium on Microarchitecture%%lst%% 2010%%per%% 
[10] X%%per%%]$~ ~$[E%%per%%]$~ ~$[Chen ]^[ T%%per%%]$~ ~$[M%%per%%]$~ ~$[Aamodt%%lst%% “Hybrid analytical modeling of pending cache hits%%lst%% data prefetching ]^[ MSHRs,” ACM Transactions on 
Architecture ]^[ Code Optimization%%lst%% vol%%per%% 8%%lst%% no%%per%% 3%%lst%% October 2011%%per%% 
[11] D%%per%%]$~ ~$[Chiou%%lst%% D%%per%%]$~ ~$[Sunwoo%%lst%% J%%per%%]$~ ~$[Kim%%lst%% N%%per%%]$~ ~$[A%%per%%]$~ ~$[Patil%%lst%% W%%per%%]$~ ~$[Reinhart%%lst%% D%%per%%]$~ ~$[E%%per%%]$~ ~$[Johnson%%lst%% 
J%%per%%]$~ ~$[Keefe%%lst%% ]^[ H%%per%%]$~ ~$[Angepat%%lst%% “FPGA%%dsh%%accelerated simulation technologies 
(fast)%%cln%% Fast%%lst%% full%%dsh%%system%%lst%% cycle%%dsh%%accurate simulators,” in Proc of the 
International Symposium on Microarchitecture%%lst%% 2007%%lst%% pp%%per%% 249–261%%per%% 
[12] W%%per%%]$~ ~$[J%%per%%]$~ ~$[Dally ]^[ B%%per%%]$~ ~$[P%%per%%]$~ ~$[Towles%%lst%% Principles ]^[ practices of interconnection networks%%per%%]$~ ~$[Morgan Kaufmann%%lst%% 2003%%per%% 
[13] R%%per%%]$~ ~$[Das%%lst%% O%%per%%]$~ ~$[Mutlu%%lst%% T%%per%%]$~ ~$[Moscibroda%%lst%% ]^[ C%%per%%]$~ ~$[R%%per%%]$~ ~$[Das%%lst%% “Aergia%%cln%% exploting 
packet latency slack in on%%dsh%%chip networks,” in Proc%%per%% of Intl%%per%%]$~ ~$[Symposium 
on Computer Architecture%%lst%% 2010%%per%% 
[14] L%%per%%]$~ ~$[Eeckhout%%lst%% K%%per%%]$~ ~$[De Bosschere%%lst%% ]^[ H%%per%%]$~ ~$[Neefs%%lst%% “Performance analysis through synthetic trace generation,” in Intl%%per%%]$~ ~$[Symp%%per%%]$~ ~$[Performance 
Analysis of Systems ]^[ Software%%lst%% 2000%%lst%% pp%%per%% 1–6%%per%% 
[15] M%%per%%]$~ ~$[Ferdman%%lst%% P%%per%%]$~ ~$[Lotfi%%dsh%%Kamran%%lst%% K%%per%%]$~ ~$[Balet%%lst%% ]^[ B%%per%%]$~ ~$[Falsafi%%lst%% “Cuckoo directory%%cln%% A scalable directory ]f[ many%%dsh%%core systems,” in Intl Symp on 
High Performance Computer Architecture%%lst%% 2011%%lst%% pp%%per%% 169–180%%per%% 
[16] D%%per%%]$~ ~$[Ferrari%%lst%% On the foundations of artificial workload design%%per%%]$~ ~$[ACM%%lst%% 
1984%%lst%% vol%%per%% 12%%lst%% no%%per%% 3%%per%% 
[17] K%%per%%]$~ ~$[Ganesan ]^[ L%%per%%]$~ ~$[John%%lst%% “Automatic generation of miniaturized synthetic proxies ]f[ target applications to efficiently design multicore 
processors,” IEEE Trans%%per%% on Computers%%lst%% vol%%per%% 99%%lst%% 2013%%per%% 
[18] J%%per%%]$~ ~$[Hestness%%lst%% B%%per%%]$~ ~$[Grot%%lst%% ]^[ S%%per%%]$~ ~$[W%%per%%]$~ ~$[Keckler%%lst%% “Netrace%%cln%% dependency%%dsh%%driven 
trace%%dsh%%based network%%dsh%%on%%dsh%%chip simulation,” in Proc%%per%% of the 3rd International Workshop on Network on Chip Architectures%%lst%% 2010%%lst%% pp%%per%% 31–36%%per%% 
[19] N%%per%%]$~ ~$[Jiang%%lst%% D%%per%%]$~ ~$[U%%per%%]$~ ~$[Becker%%lst%% G%%per%%]$~ ~$[Michelogiannakis%%lst%% J%%per%%]$~ ~$[Balfour%%lst%% B%%per%%]$~ ~$[Towles%%lst%% 
J%%per%%]$~ ~$[Kim%%lst%% ]^[ W%%per%%]$~ ~$[J%%per%%]$~ ~$[Dally%%lst%% “A detailed ]^[ flexible cycle%%dsh%%accurate networkon%%dsh%%chip simulator,” in Intl%%per%%]$~ ~$[Symp%%per%%]$~ ~$[Performance Analysis of Systems ]^[ 
Software%%lst%% 2013%%per%% 
[20] Y%%per%%]$~ ~$[Jin%%lst%% E%%per%%]$~ ~$[J%%per%%]$~ ~$[Kim%%lst%% ]^[ T%%per%%]$~ ~$[Pinkston%%lst%% “Communication%%dsh%%aware globallycoordinated on%%dsh%%chip networks,” IEEE Transactions on Parallel ]^[ 
Distributed Systems%%lst%% vol%%per%% 23%%lst%% no%%per%% 2%%lst%% pp%%per%% 242 –254%%lst%% Feb%%per%% 2012%%per%% 
[21] A%%per%%]$~ ~$[Joshi%%lst%% L%%per%%]$~ ~$[Eeckhout%%lst%% R%%per%%]$~ ~$[Bell%%lst%% ]^[ L%%per%%]$~ ~$[John%%lst%% “Cloning%%cln%% A technique 
]f[ disseminating proprietary applications at benchmarks,” in Proc%%per%% of 
IEEE Intl Symposium Workload Characterization%%lst%% 2006%%per%% 
[22] T%%per%%]$~ ~$[Karkhanis ]^[ J%%per%%]$~ ~$[E%%per%%]$~ ~$[Smith%%lst%% “A first%%dsh%%order superscalar processor 
model,” in Proc of the Intl Symp on Computer Architecture%%lst%% 2004%%per%% 
[23] J%%per%%]$~ ~$[Kim%%lst%% J%%per%%]$~ ~$[Balfour%%lst%% ]^[ W%%per%%]$~ ~$[Dally%%lst%% “Flattened Butterfly Topology ]f[ 
On%%dsh%%Chip Networks,” in Proc of the International Symposium on Microarchitecture%%lst%% 2007%%lst%% pp%%per%% 172–182%%per%% 
[24] A%%per%%]$~ ~$[KleinOsowski ]^[ D%%per%%]$~ ~$[J%%per%%]$~ ~$[Lilja%%lst%% “MinneSPEC%%cln%% A new SPEC benchmark workload ]f[ simulation%%dsh%%based computer architecture research,” 
Computer Architecture Letters%%lst%% vol%%per%% 1%%lst%% June 2002%%per%% 
[25] T%%per%%]$~ ~$[Krishna%%lst%% L%%per%%%%dsh%%S%%per%%]$~ ~$[Peh%%lst%% B%%per%%]$~ ~$[Beckmann%%lst%% ]^[ S%%per%%]$~ ~$[K%%per%%]$~ ~$[Reinhardt%%lst%% “Towards 
the ideal on%%dsh%%chip fabric ]f[ 1%%dsh%%to%%dsh%%many ]^[ many%%dsh%%to%%dsh%%1 communication,” 
in Proc%%per%% of the International Symposium on Microarchitecture%%lst%% 2011%%per%% 
[26] M%%per%%]$~ ~$[Lodde%%lst%% J%%per%%]$~ ~$[Flich%%lst%% ]^[ M%%per%%]$~ ~$[E%%per%%]$~ ~$[Acacio%%lst%% “Heterogeneous NoC design ]f[ 
efficient broadcast%%dsh%%based coherence protocol support,” in International 
Symposium on Networks on Chip%%lst%% 2012%%per%% 
[27] S%%per%%]$~ ~$[Ma%%lst%% N%%per%%]$~ ~$[Enright Jerger%%lst%% ]^[ Z%%per%%]$~ ~$[Wang%%lst%% “Supporting efficient collective communication in NoCs,” in Proc of Intl%%per%%]$~ ~$[Symposium on High 
Performance Computer Architecture%%lst%% 2012%%lst%% pp%%per%% 165–177%%per%% 
[28] M%%per%%]$~ ~$[Martin%%lst%% M%%per%%]$~ ~$[Hill%%lst%% ]^[ D%%per%%]$~ ~$[Sorin%%lst%% “Why on%%dsh%%chip cache coherence is 
here to stay,” Comm of the ACM%%lst%% vol%%per%% 55%%lst%% no%%per%% 7%%lst%% pp%%per%% 78–89%%lst%% 2012%%per%% 
[29] J%%per%%]$~ ~$[Miller%%lst%% H%%per%%]$~ ~$[Kasture%%lst%% G%%per%%]$~ ~$[Kurian%%lst%% C%%per%%]$~ ~$[Gruenwald%%lst%% N%%per%%]$~ ~$[Beckmann%%lst%% C%%per%%]$~ ~$[Celio%%lst%% 
J%%per%%]$~ ~$[Eastep%%lst%% ]^[ A%%per%%]$~ ~$[Agarwal%%lst%% “Graphite%%cln%% A distributed parallel simulator 
]f[ multicores,” in Proc%%per%% of Intl%%per%%]$~ ~$[Symposium on High Performance 
Computer Architecture%%lst%% Jan%%per%% 2010%%lst%% pp%%per%% 1 –12%%per%% 
[30] A%%per%%]$~ ~$[Mishra%%lst%% O%%per%%]$~ ~$[Mutlu%%lst%% ]^[ C%%per%%]$~ ~$[Das%%lst%% “A heterogeneous multiple networkon%%dsh%%chip design%%cln%% An application%%dsh%%aware approach,” in Proc%%per%% of the Design 
Automation Conference%%lst%% 2013%%per%% 
[31] N%%per%%]$~ ~$[Neelakantam%%lst%% C%%per%%]$~ ~$[Blundell%%lst%% J%%per%%]$~ ~$[Devietti%%lst%% M%%per%%]$~ ~$[M%%per%%]$~ ~$[Martin%%lst%% ]^[ C%%per%%]$~ ~$[Zilles%%lst%% 
“FeS2%%cln%% A Full%%dsh%%system Execution%%dsh%%driven Simulator ]f[ x86,” Poster 
presented at ASPLOS%%lst%% 2008%%per%% 
[32] M%%per%%]$~ ~$[Papamichael%%lst%% J%%per%%]$~ ~$[Hoe%%lst%% ]^[ O%%per%%]$~ ~$[Mutlu%%lst%% “FIST%%cln%% A fast%%lst%% lightweight%%lst%% 
FPGA%%dsh%%friendly packet latency estimator ]f[ NoC modeling in fullsystem simulations,” in Intl Symp on Networks on Chip%%lst%% 2011%%per%% 
[33] P%%per%%]$~ ~$[Ren%%lst%% M%%per%%]$~ ~$[Lis%%lst%% M%%per%%]$~ ~$[H%%per%%]$~ ~$[Cho%%lst%% K%%per%%]$~ ~$[S%%per%%]$~ ~$[Shim%%lst%% C%%per%%]$~ ~$[W%%per%%]$~ ~$[Fletcher%%lst%% O%%per%%]$~ ~$[Khan%%lst%% 
N%%per%%]$~ ~$[Zheng%%lst%% ]^[ S%%per%%]$~ ~$[Devadas%%lst%% “HORNET%%cln%% A cycle%%dsh%%level multicore simulator,” IEEE Trans%%per%%]$~ ~$[Comput%%dsh%%Aided Design Integr%%per%%]$~ ~$[Circuits Syst%%per%%%%lst%% vol%%per%% 31%%lst%% 
no%%per%% 6%%lst%% 2012%%per%% 
[34] A%%per%%]$~ ~$[Reynolds%%lst%% G%%per%%]$~ ~$[Richards%%lst%% B%%per%%]$~ ~$[De La Iglesia%%lst%% ]^[ V%%per%%]$~ ~$[Rayward%%dsh%%Smith%%lst%% 
“Clustering rules%%cln%% a comparison of partitioning ]^[ hierarchical clustering algorithms,” Journal of Mathematical Modelling ]^[ Algorithms%%lst%% 
vol%%per%% 5%%lst%% no%%per%% 4%%lst%% pp%%per%% 475–504%%lst%% 2006%%per%% 
[35] P%%per%%]$~ ~$[J%%per%%]$~ ~$[Rousseeuw%%lst%% “Silhouettes%%cln%% a graphical aid to the interpretation ]^[ 
validation of cluster analysis,” Journal of computational ]^[ applied 
mathematics%%lst%% vol%%per%% 20%%lst%% pp%%per%% 53–65%%lst%% 1987%%per%% 
[36] S%%per%%]$~ ~$[Salvador ]^[ P%%per%%]$~ ~$[Chan%%lst%% “Determining the number of clusters/segments 
in hierarchical clustering/segmentation algorithms,” in Int%%per%%]$~ ~$[Conf%%per%% on 
Tools with Artificial Intelligence%%lst%% 2004%%lst%% pp%%per%% 576–584%%per%% 
[37] D%%per%%]$~ ~$[Sanchez ]^[ C%%per%%]$~ ~$[Kozyrakis%%lst%% “ZSim%%cln%% Fast ]^[ accurate microarchitectural simulation of thousand%%dsh%%core systems,” in Proc%%per%% of the International 
Symposium on Computer Architecture%%lst%% 2013%%per%% 
[38] T%%per%%]$~ ~$[Sherwood%%lst%% E%%per%%]$~ ~$[Perelman%%lst%% ]^[ B%%per%%]$~ ~$[Calder%%lst%% “Basic block distribution 
analysis to find periodic behavior ]^[ simulation points in applications,” 
in Parallel Architecture ]^[ Compilation Techniques%%lst%% 2001%%lst%% pp%%per%% 3–14%%per%% 
[39] T%%per%%]$~ ~$[Sherwood%%lst%% E%%per%%]$~ ~$[Perelman%%lst%% G%%per%%]$~ ~$[Hamerly%%lst%% ]^[ B%%per%%]$~ ~$[Calder%%lst%% “Automatically 
characterizing large scale program behavior,” in Proc%%per%% of Architecture 
Support ]f[ Programming Languages ]^[ Operating Systems%%lst%% 2002%%lst%% 
pp%%per%% 45–57%%per%% 
[40] D%%per%%]$~ ~$[J%%per%%]$~ ~$[Sorin%%lst%% M%%per%%]$~ ~$[D%%per%%]$~ ~$[Hill%%lst%% ]^[ D%%per%%]$~ ~$[A%%per%%]$~ ~$[Wood%%lst%% “A primer on memory consistency ]^[ cache coherence,” Synthesis Lectures on Computer Architecture%%lst%% vol%%per%% 6%%lst%% no%%per%% 3%%lst%% pp%%per%% 1–212%%lst%% 2011%%per%% 
[41] V%%per%%]$~ ~$[Soteriou%%lst%% H%%per%%]$~ ~$[Wang%%lst%% ]^[ L%%per%%%%dsh%%S%%per%%]$~ ~$[Peh%%lst%% “A statistical traffic model ]f[ 
on%%dsh%%chip interconnection networks,” in MASCOTS%%lst%% 2006%%lst%% pp%%per%% 104–116%%per%% 
[42] K%%per%%]$~ ~$[Sreenivasan ]^[ A%%per%%]$~ ~$[Kleinman%%lst%% “On the construction of a representative synthetic workload,” Comm of the ACM%%lst%% vol%%per%% 17%%lst%% no%%per%% 3%%lst%% pp%%per%% 
127–133%%lst%% 1974%%per%% 
[43] Z%%per%%]$~ ~$[Tan%%lst%% A%%per%%]$~ ~$[Waterman%%lst%% H%%per%%]$~ ~$[Cook%%lst%% S%%per%%]$~ ~$[Bird%%lst%% K%%per%%]$~ ~$[Asanovic%%lst%% ]^[ D%%per%%]$~ ~$[Patterson%%lst%% 
“A case ]f[ FAME%%cln%% FPGA architecture model execution,” in Proc%%per%% of 
Intl Symposium on Computer Architecture%%lst%% 2010%%per%% 
[44] L%%per%%]$~ ~$[Tedesco%%lst%% A%%per%%]$~ ~$[Mello%%lst%% L%%per%%]$~ ~$[Giacomet%%lst%% N%%per%%]$~ ~$[Calazans%%lst%% ]^[ F%%per%%]$~ ~$[Moraes%%lst%% “Application driven traffic modeling ]f[ NoCs,” in Proc of the 19th Symp 
on Integrated Circuits ]^[ Systems Design%%per%%]$~ ~$[ACM%%lst%% 2006%%lst%% pp%%per%% 62–67%%per%% 
[45] G%%per%%]$~ ~$[V%%per%%]$~ ~$[Varatkar ]^[ R%%per%%]$~ ~$[Marculescu%%lst%% “On%%dsh%%chip traffic modeling ]^[ 
synthesis ]f[ MPEG%%dsh%%2 video applications,” IEEE Trans on Very Large 
Scale Integration Systems%%lst%% vol%%per%% 12%%lst%% no%%per%% 1%%lst%% pp%%per%% 108–119%%lst%% 2004%%per%% 
[46] T%%per%%]$~ ~$[Velmurugan ]^[ T%%per%%]$~ ~$[San%%cmp_ta%%am%%lst%% “Computational complexity between 
k%%dsh%%means ]^[ k%%dsh%%medoids clustering algorithms ]f[ normal ]^[ uniform 
distributions of data points,” Journal of Computer Science%%lst%% vol%%per%% 6%%lst%% no%%per%% 3%%lst%% 
p%%per%% 363%%lst%% 2010%%per%% 
[47] J%%per%%]$~ ~$[H%%per%%]$~ ~$[Ward Jr%%lst%% “Hierarchical grouping to optimize an objective function,” 
J%%per%%]$~ ~$[Amer%%per%%]$~ ~$[Statist%%per%%]$~ ~$[Assoc%%per%%%%lst%% vol%%per%% 58%%lst%% no%%per%% 301%%lst%% pp%%per%% 236–244%%lst%% 1963%%per%% 
[48] S%%per%%]$~ ~$[C%%per%%]$~ ~$[Woo%%lst%% M%%per%%]$~ ~$[Ohara%%lst%% E%%per%%]$~ ~$[Torrie%%lst%% J%%per%%]$~ ~$[P%%per%%]$~ ~$[Singh%%lst%% ]^[ A%%per%%]$~ ~$[Gupta%%lst%% “The 
SPLASH%%dsh%%2 programs%%cln%% Characterization ]^[ methodological considerations,” in Intl Symp on Computer Architecture%%lst%% 1995%%lst%% pp%%per%% 24–36%%per%% 
[49] R%%per%%]$~ ~$[E%%per%%]$~ ~$[Wunderlich%%lst%% T%%per%%]$~ ~$[F%%per%%]$~ ~$[Wenisch%%lst%% B%%per%%]$~ ~$[Falsafi%%lst%% ]^[ J%%per%%]$~ ~$[C%%per%%]$~ ~$[Hoe%%lst%% “SMARTS%%cln%% 
accelerating microarchitecture simulation via rigorous statistical sampling,” in Proc%%per%% of Intl Symposium on Computer Architecture%%lst%% 2003%%per%% 
[50] J%%per%%]$~ ~$[Zebchuk%%lst%% V%%per%%]$~ ~$[Srinivasan%%lst%% M%%per%%]$~ ~$[K%%per%%]$~ ~$[Qureshi%%lst%% ]^[ A%%per%%]$~ ~$[Moshovos%%lst%% “A tagless 
coherence directory,” in Intl Symp on Microarchitecture%%lst%% 2009%%per%% 
[51] Y%%per%%]$~ ~$[Zhang%%lst%% B%%per%%]$~ ~$[Ozisikyilmaz%%lst%% G%%per%%]$~ ~$[Memik%%lst%% J%%per%%]$~ ~$[Kim%%lst%% ]^[ A%%per%%]$~ ~$[Choudhary%%lst%% 
“Analyzing the impact of on%%dsh%%chip network traffic on program phases ]f[ 
CMPs,” in Intl Symp on Performance Analysis of Systems ]^[ Software%%lst%% 
2009%%lst%% pp%%per%% 218–226%%per%% 
