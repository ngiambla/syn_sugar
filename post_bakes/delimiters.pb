~$[SynFull%%cln%% Synthetic Trafﬁc Models Capturing Cache Coherent Behaviour 
Edward S%%per%%]$~ ~$[Rogers Sr%%per%%]$~ ~$[Department of Electrical ]^[ Computer Engineering 
Mario Badr%%lst%% Natalie Enright Jerger 
University of Toronto 
mario%%per%%badr@mail%%per%%utoronto%%per%%ca%%lst%% enright@ece%%per%%utoronto%%per%%ca 
Abstract 
Modern ]^[ future many%%dsh%%core systems represent complex ar%%dsh%% 
chitectures%%per%%]$~ ~$[The communication fabrics of these large systems 
heavily inﬂuence their performance ]^[ power consumption%%per%%]$~ 
~$[Current simulation methodologies ]f[ evaluating networks%%dsh%% 
on%%dsh%%chip (NoCs) are ]n[ keeping pace with the increased com%%dsh%% 
plexity of our systems%%scn%% architects often want to explore many 
different design knobs quickly%%per%%]$~ ~$[Methodologies that capture 
workload trends with faster simulation times are highly ben%%dsh%% 
eﬁcial at early stages of architectural exploration%%per%%]$~ ~$[We pro%%dsh%% 
pose SynFull%%lst%% a synthetic trafﬁc generation methodology that 
captures both application ]^[ cache coherence behaviour to 
rapidly evaluate NoCs%%per%%]$~ ~$[SynFull allows designers to quickly 
indulge in detailed performance simulations without the cost 
of long%%dsh%%running full%%dsh%%system simulation%%per%%]$~ ~$[By capturing a full 
range of application ]^[ coherence behaviour%%lst%% architects can 
avoid the over ]v[ underdesign of the network as may occur 
when using traditional synthetic trafﬁc patterns such as uni%%dsh%% 
form random%%per%%]$~ ~$[SynFull has errors as low as 0%%per%%3% ]^[ provides 
50× speedup on average over full%%dsh%%system simulation%%per%% 
1%%per%%]$~ ~$[Introduction 
With the shift to multi%%dsh%% ]^[ many%%dsh%%core processors%%lst%% architects 
now face a larger design space ]^[ more complex trade%%dsh%%offs 
in processor design%%per%%]$~ ~$[The design of the network as a potential 
power ]^[ performance bottleneck is becoming a critical con%%dsh%% 
cern%%per%%]$~ ~$[In the power%%dsh%%constrained many%%dsh%%core landscape%%lst%% NoCs 
must be carefully designed to meet communication bandwidth 
requirements%%lst%% deliver packets with low latency%%lst%% ]^[ ﬁt within 
tight power envelopes that are shared across cores%%lst%% caches ]^[ 
interconnects%%per%%]$~ ~$[To do this well%%lst%% the designer must understand 
the trafﬁc patterns ]^[ temporal behaviour of applications the 
NoC must support%%per%%]$~ ~$[There are a large number of parameters 
in the NoC design space that can be tuned to deliver the re%%dsh%% 
quired performance within a given cost/power envelope%%lst%% such 
as topology%%lst%% routing algorithm%%lst%% ﬂow control ]^[ router mi%%dsh%% 
croarchitecture%%per%%]$~ ~$[These knobs are most commonly explored 
through software simulation%%per%%]$~ 
~$[There are a number of simulation methodologies available 
to NoC designers%%lst%% however each comes with speed/ﬁdelity 
tradeoffs [18]%%per%%]$~ ~$[Full%%dsh%%system simulators model each hardware 
component of the overall system ]^[ can run full applications 
]^[ operating systems%%per%%]$~ ~$[As a result%%lst%% these simulators provide 
the highest degree of accuracy%%lst%% ]b[ at the expense of long 
simulation times%%per%%]$~ ~$[In contrast%%lst%% a designer can use traditional 
978%%dsh%%1%%dsh%%4799%%dsh%%4394%%dsh%%4/14/$31%%per%%00 c(cid:13) 2014 IEEE 
Figure 1%%cln%% High level view of SynFull 
synthetic trafﬁc patterns to quickly stress their NoC design 
]^[ reveal bottlenecks%%per%%]$~ ~$[However%%lst%% these trafﬁc patterns do ]n[ 
realistically represent the application space ]s[ the results are 
unlikely to be representative of real workloads%%per%%]$~ ~$[Therefore%%lst%% they 
are unlikely to produce a properly provisioned network%%per%%]$~ ~$[In 
this work%%lst%% we introduce a new approach that strikes a balance 
between these tradeoffs%%lst%% providing a fast%%lst%% realistic simulation 
methodology ]f[ NoC designers%%per%%]$~ 
~$[Realistic trafﬁc patterns will increase the accuracy of NoC 
simulations%%per%%]$~ ~$[Beyond that%%lst%% realistic trafﬁc also provides opti%%dsh%% 
mization opportunities that do ]n[ exist in traditional synthetic 
trafﬁc patterns%%per%%]$~ ~$[Many recent NoC proposals have exploited 
particular application [13%%lst%% 30] ]v[ coherence behaviour [25%%lst%% 26] 
to provide a more efﬁcient%%lst%% higher%%dsh%%performing NoC design%%per%%]$~ ~$[As 
research continues to push the scalability of cache coherence 
protocols [15%%lst%% 28%%lst%% 50]%%lst%% shared memory CMPs continue to be 
widespread%%per%%]$~ ~$[As a result%%lst%% we focus on this class of systems%%per%%]$~ 
~$[SynFull Overview ]^[ Contributions%%per%%]$~ ~$[SynFull provides a 
novel technique ]f[ modelling real application trafﬁc without 
the need ]f[ expensive%%lst%% detailed simulation of all levels of the 
system%%per%%]$~ ~$[We abstract away cores ]^[ caches to focus on the net%%dsh%% 
work%%lst%% ]^[ provide application%%dsh%%level insight to NoC designers%%lst%% 
who in turn can produce more optimized designs%%per%%]$~ ~$[Through our 
analysis%%lst%% we determine the key trafﬁc attributes that a cache%%dsh%% 
coherent application%%dsh%%driven trafﬁc model must capture includ%%dsh%% 
ing coherence%%dsh%%based message dependences (Sec%%per%% 4)%%lst%% applica%%dsh%% 
tion phase behaviour (Sec%%per%% 5) ]^[ injection process (Sec%%per%% 6)%%per%%]$~ 
~$[Fig%%per%% 1 shows a high%%dsh%%level overview of our approach%%per%%]$~ ~$[We ob%%dsh%% 
serve long running (macro%%dsh%%)phases within applications as well 
as ﬁne%%dsh%%grained variation within macro%%dsh%%phases (micro%%dsh%%phases)%%lst%% 
]^[ group them through clustering%%per%%]$~ ~$[Within these clusters%%lst%% we 
Number 
 of 
 Injected 
 Packets 
 Time 
 (millions 
 of 
 cycles) 
 Macro%%dsh%%­‐Level 
 Phase 
 Clustering 
 Time 
 (hundreds 
 of 
 cycles) 
 Micro%%dsh%%­‐Level 
 Phase 
 Clustering 
 Read 
 Write 
 Replace 
 Inv 
 • Cluster 
 based 
 on%%cln%% 
  
 • Message 
 Types 
 • SpaDal 
 paEern 
 (src%%dsh%%­‐dst 
 ﬂows) 
  
 Micro%%dsh%%­‐Level 
 Markov 
 Chain 
 Macro%%dsh%%­‐Level 
  
 Markov 
 Chain 
  examine the break down of message types dictated by the co%%dsh%% 
herence protocol%%per%%]$~ ~$[These two steps drive a hierarchical Markov 
Chain that is used to reproduce the trafﬁc behaviour%%per%%]$~ ~$[Our 
proposed model is independent of the network conﬁguration 
]^[ can be applied to a wide range of NoC conﬁgurations to 
enable rapid%%lst%% accurate design space exploration%%per%%]$~ 
~$[To demonstrate the accuracy ]^[ utility of our model%%lst%% we ap%%dsh%% 
ply our methodology to a variety of PARSEC [5] ]^[ SPLASH%%dsh%% 
2 [48] benchmarks%%per%%]$~ ~$[A single full%%dsh%%system simulation run of 
each benchmark is required to create the model%%per%%]$~ ~$[We then 
use our models to synthetically generate trafﬁc ]^[ com%%dsh%% 
pare NoC performance to full%%dsh%%system simulation%%per%%]$~ ~$[Finally%%lst%% 
we demonstrate signiﬁcant speedup ]f[ our methodology over 
full%%dsh%%system simulation%%scn%% this allows ]f[ rapid NoC design space 
exploration%%per%%]$~ ~$[In essence%%lst%% SynFull strives to replace full sys%%dsh%% 
tem simulation ]f[ fast%%lst%% ]y[ accurate NoC evaluation through 
richer synthetic trafﬁc patterns%%per%% 
2%%per%%]$~ ~$[The Case ]f[ Coherence Trafﬁc 
Before describing SynFull in detail%%lst%% we motivate the need ]f[ 
a new class of synthetic trafﬁc patterns%%per%%]$~ ~$[Trafﬁc patterns such 
as uniform random%%lst%% permutation%%lst%% tornado%%lst%% etc%%per%% are widely used 
in NoC research%%per%%]$~ ~$[Many of these are based on the communica%%dsh%% 
tion pattern of speciﬁc applications%%per%%]$~ ~$[For example%%lst%% transpose 
trafﬁc is based on a matrix transpose application%%lst%% ]^[ the 
shufﬂe permutation is derived from Fast%%dsh%%Fourier Transforms 
(FFTs) [2%%lst%% 12]%%per%%]$~ ~$[However%%lst%% these synthetic trafﬁc patterns are 
]n[ representative of the wide range of applications that run on 
current ]^[ future CMPs%%per%%]$~ ~$[Even if these trafﬁc patterns were 
representative%%lst%% the conﬁguration of a cache%%dsh%%coherent system 
can mask ]v[ destroy the inherent communication pattern of the 
original algorithm due to indirections ]^[ control messages%%per%%]$~ 
~$[The arrangement of cores%%lst%% caches%%lst%% directories%%lst%% ]^[ memory 
controllers directly inﬂuences the ﬂow of communication ]f[ 
an application%%per%%]$~ ~$[Compare a synthetic shufﬂe pattern with the 
FFT benchmark from SPLASH%%dsh%%2 [48]%%per%%]$~ ~$[The shufﬂe pattern 
is a bit permutation where the destination bits are calculated 
via the function di = si−1 mod b where b is the number of bits 
required to represent the nodes of the network [12]%%per%%]$~ ~$[FFT is run 
in full%%dsh%%system simulation1 while shufﬂe is run in network%%dsh%%only 
simulation%%per%%]$~ ~$[Fig%%per%% 2 shows the number of packets sent from a 
source to a destination2%%per%%]$~ ~$[In Fig%%per%% 2b%%lst%% we see notable destination 
hot spots at nodes 0%%lst%% 2%%lst%% ]^[ 5 ]^[ source hot spots at nodes 
0 ]^[ 5%%per%%]$~ ~$[However%%lst%% Fig%%per%% 2a shows hot spots only ]f[ speciﬁc 
source%%dsh%%destination pairs%%per%%]$~ 
~$[The best NoC design ]f[ the trafﬁc in Fig%%per%% 2a is unlikely to 
be the best NoC ]f[ the trafﬁc in Fig%%per%% 2b%%per%%]$~ ~$[For example%%lst%% we 
can design a ring network ]f[ Fig%%per%% 2a%%lst%% ]^[ map the nodes to 
minimize hop count of shufﬂe on the network%%per%%]$~ ~$[The average 
injection rate of FFT is used ]f[ shufﬂe%%per%%]$~ ~$[Doing ]s[ yields 
∼10% improvement in average packet latency over a mesh 
1Conﬁguration details can be found in Sec%%per%% 7%%per%% 
2The absolute number of packets in each ﬁgure is unimportant in this 
comparison as we focus on source%%dsh%%destination trafﬁc pairs%%per%% 
(a) Shufﬂe Trafﬁc Pattern 
(b) FFT Application 
Figure 2%%cln%% Spatial behaviour ]f[ synthetic vs application trafﬁc 
(Network A in Sec%%per%% 7) with the naive mapping (baseline) in 
Fig%%per%% 2a%%per%%]$~ ~$[However%%lst%% using the same ring network in a full%%dsh%% 
system simulation of the FFT benchmark results in an average 
packet latency that is over three times worse than the baseline%%per%%]$~ 
~$[Clearly%%lst%% synthetic trafﬁc patterns are ]n[ representative of 
the spatial behaviour exhibited by applications on a shared 
memory architecture%%per%%]$~ 
~$[The sharp contrast in Fig%%per%% 2 is due to coherence transactions 
needing to visit several nodes in a shared memory architecture 
before completing%%per%%]$~ ~$[For example%%lst%% a write request ﬁrst visits a 
directory to receive ownership of a cache line%%per%%]$~ ~$[The directory 
forwards requests to the core caching the data%%lst%% ]^[ also in%%dsh%% 
validates caches who are sharing the data%%per%%]$~ ~$[Invalidated caches 
must send acknowledgements – this domino effect can signiﬁ%%dsh%% 
cantly change an application’s spatial behaviour ]^[ should 
be correctly modelled ]f[ realistic trafﬁc generation%%per%%]$~ 
~$[Differentiating between the types of packets visiting nodes 
is important when generating realistic trafﬁc%%per%%]$~ ~$[Most synthetic 
workloads split trafﬁc into two categories%%cln%% small control pack%%dsh%% 
ets (requests) ]^[ large data packets (responses)%%per%%]$~ ~$[However%%lst%% 
there are many different packet types in a coherence protocol 
]f[ both requests ]^[ responses%%per%%]$~ ~$[By lumping these packets 
into two categories%%lst%% designers cannot explore methods that 
exploit cache coherence ]f[ better performance%%per%%]$~ ~$[For example%%lst%% 
techniques exist to reduce trafﬁc caused by acknowledgement 
packets [27]%%per%%]$~ ~$[Similar research insight is only possible when 
detailed packet information is available in simulation%%per%%]$~ 
~$[Finally%%lst%% the trafﬁc imposed by an application is time%%dsh%%varying%%per%%]$~ 
~$[Applications exhibit phase behaviour [38]%%scn%% spatial patterns are 
likely to change over time%%per%%]$~ ~$[Static trafﬁc patterns ]^[ injection 
rates are ]n[ an adequate representation of real application 
trafﬁc%%per%%]$~ ~$[The behaviour of cache coherence trafﬁc changes with 
time ]^[ can have varying effects on NoC performance%%per%%]$~ ~$[For 
example%%lst%% phases that exhibit high data exchange will likely 
result in several invalidation packets being broadcast into the 
NoC%%per%%]$~ ~$[It is important to capture these variations in trafﬁc to 
reveal whether ]v[ ]n[ an NoC has been correctly provisioned%%per%% 
3%%per%%]$~ ~$[SynFull Trafﬁc Modelling Overview 
Our methodology focuses only on the design of the NoC which 
has become a ﬁrst%%dsh%%class component of many%%dsh%%core architectures%%per%%]$~ 
~$[Thus%%lst%% we abstract away the cores%%lst%% caches%%lst%% directories ]^[ mem%%dsh%% 
ory controllers%%per%%]$~ ~$[Essentially%%lst%% the performance characteristics of 
SourceDestination01234567891011121314150123456789101112131415020406080100120140SourceDestination012345678910111213141501234567891011121314155000055000600006500070000 these elements are ﬁxed ]f[ the purposes of our study%%per%%]$~ ~$[How%%dsh%% 
ever%%lst%% SynFull can be combined with analytical ]^[ abstract 
models [10%%lst%% 22] of these components to explore an even richer 
design space with fast%%dsh%%turnaround time%%per%%]$~ ~$[Developing the net%%dsh%% 
work models is a critical ﬁrst step%%scn%% combining our model with 
other models is left as future work%%per%%]$~ ~$[To model application 
trafﬁc%%lst%% we focus on answering four key questions%%cln%% 
When to send a packet%%qsn%%]$~ ~$[In shared memory systems%%lst%% packets 
are injected from the application side on a cache miss%%per%%]$~ ~$[This 
packet initiates a coherence transaction to retrieve its data%%per%%]$~ 
~$[However%%lst%% some packets are injected reactively%%per%%]$~ ~$[For example%%lst%% 
a data packet would only be sent in response to a request%%per%%]$~ 
~$[Who is sending the packet%%qsn%%]$~ ~$[Not all nodes inject trafﬁc 
uniformly ]s[ we must determine which node should inject that 
packet%%per%%]$~ ~$[For reactive packets%%lst%% the answer is clear%%scn%% the node 
reacting to the request is the source%%per%%]$~ ~$[However%%lst%% ]f[ initiating 
packets%%lst%% a model is required%%per%%]$~ 
~$[Why are they sending the packet%%qsn%%]$~ ~$[Traditional synthetic 
workloads do ]n[ concern themselves with why%%per%%]$~ ~$[For a cache 
coherence trafﬁc generator%%lst%% the question is very important%%per%%]$~ ~$[The 
why helps determine the type of packet being sent%%lst%% ]^[ allows 
us to classify packets according to the coherence protocol%%per%%]$~ 
~$[Where is the packet going%%qsn%%]$~ 
~$[The packet’s destination is 
a function of both its source ]^[ the type of packet being 
injected (the answers to the previous two questions)%%per%%]$~ ~$[Each 
source node may exhibit different sharing patterns with other 
nodes%%lst%% ]^[ those sharing patterns may be different depending 
on the coherence message being sent%%per%%]$~ 
~$[These 4 questions are answered in Sec%%per%% 4%%per%%]$~ ~$[However%%lst%% be%%dsh%% 
cause applications exhibit phase behaviour [38]%%lst%% we must also 
capture how the answers change over time%%per%%]$~ ~$[We handle this 
by dividing application trafﬁc into time intervals%%lst%% ]^[ group%%dsh%% 
ing together time intervals that behave similarly%%per%%]$~ ~$[Then%%lst%% we 
determine answers ]f[ the When%%lst%% Who%%lst%% Why ]^[ Where ques%%dsh%% 
tions ]f[ each group (phase)%%per%%]$~ ~$[We discuss our methodology 
]f[ grouping intervals in Sec%%per%% 5%%per%%]$~ ~$[To complete our SynFull 
methodology we need a way to transition between phases%%per%%]$~ ~$[For 
this we use a Markov Chain%%lst%% where we can determine the prob%%dsh%% 
ability of transitioning from one phase to another based on the 
phase we are currently in%%per%%]$~ ~$[The Markov Chain model%%lst%% along 
with answers to the above 4 questions%%lst%% allow us to recreate the 
injection process associated with an application (Sec%%per%% 6)%%per%% 
4%%per%%]$~ ~$[Modelling Cache Coherence Trafﬁc 
Focusing on the network only ]^[ ]n[ modelling application 
behaviour at the instruction level has the benefit of keeping 
our methodology generic ]^[ simple – we can apply SynFull 
to any application’s traffic data in a straightforward manner%%per%%]$~ 
~$[Although we abstract away other system components%%lst%% ]n[ all 
network messages are equal ]s[ it is important to capture differ%%dsh%% 
ent message types injected by the coherence protocol%%per%%]$~ ~$[Message 
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
controller in the form of a read ]v[ write which then results 
in a series of requests ]^[ responses [40]%%per%%]$~ ~$[In this section%%lst%% we 
explore modelling packets that initiate a coherence transaction 
separately from packets that react to received messages%%per%% 
4%%per%%1%%per%%]$~ ~$[Initiating Packets 
To model when to send initiating messages%%lst%% we collect the 
number of packets (P) injected into the network ]f[ a given 
interval spanning C cycles%%per%%]$~ ~$[Then%%lst%% when generating synthetic 
trafﬁc%%lst%% we simply inject P packets uniformly over C cycles3%%per%%]$~ 
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
~$[The distinction between reads ]^[ writes is necessary because 
they result in different reactions – writes lead to invalidations 
that are broadcast into the NoC%%scn%% these can signiﬁcantly impact 
NoC performance%%per%% 
4%%per%%2%%per%%]$~ ~$[Reactive Packets 
Most responses that maintain cache coherence have a simple 
one%%dsh%%to%%dsh%%one mapping with requests%%lst%% such as an acknowledge%%dsh%% 
ment responding to an invalidation request%%per%%]$~ ~$[Upon receiving a 
particular message%%lst%% the protocol reacts with a predetermined 
response%%per%%]$~ ~$[Table 1 shows a simplified view of the reactive as%%dsh%% 
pect of cache coherence%%per%%]$~ ~$[Most reactions are straightforward ]b[ 
some requests lead to multiple different responses%%lst%% particularly%%cln%% 
Forwarded Requests%%cln%% If the data is already cached on chip%%lst%% 
the coherence protocol forwards the request to the cache contain%%dsh%% 
ing the data%%per%%]$~ ~$[Otherwise%%lst%% the request goes off chip to memory%%per%%]$~ 
~$[Invalidates%%cln%% When a write request arrives ]f[ a cache block 
shared by multiple readers%%lst%% those readers must be invalidated%%per%%]$~ 
~$[Next%%lst%% we explore these two situations ]^[ how to model them 
]s[ that we may realistically generate cache coherence trafﬁc%%per%% 
4%%per%%2%%per%%1%%per%%]$~ ~$[Forwarding vs%%per%%]$~ ~$[Off%%dsh%%Chip When a read ]v[ write request 
arrives at a directory%%lst%% the requested block may be present in 
another core’s cache%%per%%]$~ ~$[In this case%%lst%% the request is forwarded to 
3We also explored injecting packets using bernoulli ]^[ exponential distri%%dsh%% 
butions%%per%%]$~ ~$[However%%lst%% the differences in performance are negligible%%per%%]$~ 
~$[Figure 3%%cln%% The probability a read ]v[ write request is forwarded 
the cache holding the data%%per%%]$~ ~$[Otherwise%%lst%% an off%%dsh%%chip memory 
request occurs%%per%%]$~ ~$[Fig%%per%% 3 shows the fraction of forwarded read 
]^[ write requests broken down by directory ]f[ SPLASH%%dsh%%2’s 
FFT benchmark4%%per%%]$~ ~$[The probability of forwarding a read ]v[ 
write changes according to which directory is being requested%%per%%]$~ 
~$[Therefore%%lst%% we model the distribution of forwarding probabili%%dsh%% 
ties on a per%%dsh%%directory basis%%per%%]$~ ~$[In Sec%%per%% 4%%per%%2%%per%%2%%lst%% we show that this 
has an affect on invalidations%%lst%% ]^[ different directories may 
act as hot spots in certain applications%%per%%]$~ ~$[We also note that the 
probabilities of forwarding a read ]v[ a write request are ]n[ 
equal%%per%%]$~ ~$[This distinction is critical as write requests will trigger 
invalidations to sharers which can represent a substantial burst 
of network trafﬁc ]f[ widely%%dsh%%shared data%%per%% 
4%%per%%2%%per%%2%%per%%]$~ ~$[Invalidates On a write miss%%lst%% there is a chance that the 
cache block being requested has multiple sharers%%scn%% the number 
of sharers determines the number of invalidates that will be 
multicast into the NoC%%per%%]$~ ~$[Fig%%per%% 4 shows the per%%dsh%%directory prob%%dsh%% 
ability of sending 0 to 15 invalidates in a 16%%dsh%%node network 
]f[ FFT%%per%%]$~ ~$[Some directories (1%%lst%% 3%%lst%% 11%%lst%% ]^[ 12) exhibit bimodal 
behaviour%%scn%% they invalidate 0 ]v[ n− 1 sharers%%per%%]$~ ~$[Referring back 
to Fig%%per%% 3%%lst%% we can see that these directories behave similarly in 
their forwarding probabilities%%per%%]$~ ~$[Other directories resemble an 
exponential distribution%%lst%% with 0 invalidates having the highest 
probability%%per%%]$~ ~$[Invalidates can signiﬁcantly impact network per%%dsh%% 
formance%%scn%% applications that share ]^[ exchange data at a high 
rate will ﬂood the network with many invalidates ]^[ strain 
its resources%%per%%]$~ ~$[We model the distribution of the number of 
invalidates on a per%%dsh%%directory basis to ensure our synthetically 
generated trafﬁc has similar affects on NoC performance%%per%% 
4%%per%%3%%per%%]$~ ~$[Summary 
This section showed how we model cache coherence trafﬁc by 
reacting to messages injected into the NoC%%per%%]$~ ~$[Read ]^[ write 
requests are forwarded with some probability to other nodes in 
the NoC%%lst%% ]^[ invalidates can be sent out with some probability 
given the directory a write request has arrived at%%per%%]$~ ~$[To react to 
messages%%lst%% read ]^[ write requests must ﬁrst be injected into 
the NoC%%per%%]$~ ~$[Static injection rates are ]n[ sufﬁcient to achieve high 
accuracy – we must also consider application phase behaviour%%per%% 
4Our system conﬁguration assumes 1 slice of the directory is located at 
each tile in a 16%%dsh%%core CMP%%per%%]$~ ~$[Addresses are interleaved across directories%%per%%]$~ 
~$[Figure 4%%cln%% Number of sharers per write at different directories 
We explore phase behaviour in Sec%%per%% 5 ]^[ propose a model 
that captures ]^[ applies phases to generated network trafﬁc%%per%% 
5%%per%%]$~ ~$[Trafﬁc Phases 
Applications are well%%dsh%%known to exhibit phase behaviour [38]%%per%%]$~ 
~$[Phases can have a signiﬁcant impact on the instructions 
per cycle%%lst%% miss rates%%lst%% ]^[ prediction rates of various mi%%dsh%% 
croarchitectures%%per%%]$~ ~$[NoC trafﬁc is also affected by application 
phases [20%%lst%% 51]%%scn%% our methodology needs to capture this phase 
behaviour if it intends to realistically generate synthetic trafﬁc%%per%%]$~ 
~$[We propose examining traffic at two granularities%%cln%% macro 
(millions ]v[ billions of cycles) ]^[ micro (thousands to hun%%dsh%% 
dreds of thousands of cycles)%%per%%]$~ ~$[At the macro level%%lst%% we observe 
noticeable differences in the behaviour of an application as it 
moves from one phase to another (perhaps due to a barrier ]v[ 
the end of an outer%%dsh%%loop)%%per%%]$~ ~$[At the micro%%dsh%%level we are more likely 
to capture short bursts of network activity%%per%%]$~ ~$[Each level is divided 
into fixed%%dsh%%sized%%lst%% successive time intervals measured in cycles%%per%%]$~ 
~$[Dividing trafﬁc into intervals allows us to analyze network 
trafﬁc at a ﬁne granularity%%per%%]$~ ~$[Considering the entire application 
at once captures average behaviour%%scn%% reproducing the average 
behaviour will negatively impact the design ]^[ evaluation of 
NoCs%%per%%]$~ ~$[For example%%lst%% smoothing out periods of high trafﬁc will 
result in an NoC that becomes saturated during key application 
phases%%per%%]$~ ~$[Alternatively%%lst%% bringing low periods of communication 
up to an average will cause a designer to miss potential oppor%%dsh%% 
tunities ]f[ power gating ]v[ DVFS in the NoC%%per%%]$~ ~$[Intervals allow 
us to capture ﬁne%%dsh%%grain changes in trafﬁc%%per%%]$~ ~$[However%%lst%% selecting 
a single (random) interval is ]n[ necessarily characteristic of 
the entire simulation%%per%%]$~ ~$[Yet considering all intervals will be 
difﬁcult to model with a Markov Chain (Sec%%per%% 6) ]^[ will yield 
little simulation speedup%%per%%]$~ ~$[Therefore%%lst%% we group intervals that 
behave similarly into different trafﬁc phases via clustering%%per%%]$~ 
~$[This section explores various alternative approaches to iden%%dsh%% 
tifying similar behaviour between intervals through feature 
vectors (Sec%%per%% 5%%per%%1)%%per%%]$~ ~$[Each vector contains elements (features) 
that measure some aspect of trafﬁc in that interval (e%%per%%g%%per%%%%lst%% the 
injection rate)%%per%%]$~ ~$[Vectors are then compared by calculating the 
distance between them%%scn%% a clustering algorithm creates groups 
of intervals whose vectors are close together (Sec%%per%% 5%%per%%2)%%per%% 
0%%per%%00%%per%%20%%per%%40%%per%%612345678910111213141516DirectoryProbability to Forward a RequestvariableWritesReads 1 2 3 4 5 6 7 8 9101112131415160%%per%%000%%per%%250%%per%%500%%per%%751%%per%%000%%per%%000%%per%%250%%per%%500%%per%%751%%per%%000%%per%%000%%per%%250%%per%%500%%per%%751%%per%%000%%per%%000%%per%%250%%per%%500%%per%%751%%per%%00051015051015051015051015Number of InvalidatesProbability 5%%per%%1%%per%%]$~ ~$[Feature Vector Design 
Deﬁning similarity between intervals is non%%dsh%%trivial%%per%%]$~ ~$[One has to 
consider the elements of the feature vector%%lst%% its dimensionality 
]^[ scalability%%per%%]$~ ~$[In this section%%lst%% we present a subset of potential 
feature vectors that can be used to cluster intervals into trafﬁc 
phases%%scn%% this discussion is ]n[ meant to be exhaustive ]b[ rather 
captures a range of trafﬁc metrics ]^[ feature vector scalability%%per%%]$~ 
~$[It may be tempting to use feature vectors with many el%%dsh%% 
ements%%per%%]$~ ~$[There is a trade%%dsh%%off between capturing a range of 
communication attributes ]^[ the effectiveness ]^[ ease of 
clustering%%per%%]$~ ~$[Large feature vectors can suffer from the curse of 
dimensionality where the data available to populate the vector 
is insufﬁcient ]f[ the size of the vector [4]%%per%%]$~ ~$[In addition%%lst%% hav%%dsh%% 
ing a large number of observations puts additional strain on 
the clustering algorithm%%scn%% some clustering algorithms have a 
complexity of O(cid:0)n3(cid:1) (where n is the number of vectors)%%per%%]$~ ~$[We 
explore two different approaches to construct feature vectors%%cln%% 
1%%per%%]$~ ~$[Injection Rate%%cln%% number of packets injected in an interval 
2%%per%%]$~ ~$[Injection Flows%%cln%% number of packets injected between 
source%%dsh%%destination pairs per interval 
We also explored feature vectors that consider cache coher%%dsh%% 
ence message types%%per%%]$~ ~$[In this way%%lst%% intervals with dominant read 
and/or write phases are clustered together%%per%%]$~ ~$[However%%lst%% such an 
approach does ]n[ capture the spatial injection distribution of 
packets%%per%%]$~ ~$[As a result%%lst%% intervals with similar hot spots are ]n[ 
clustered together%%per%%]$~ ~$[As we show in Sec%%per%% 8%%lst%% this information is 
crucial if we expect to synthetically generate realistic trafﬁc%%per%% 
5%%per%%1%%per%%1%%per%%]$~ ~$[Injection Rate Injection rate can be captured in differ%%dsh%% 
ent ways%%per%%]$~ ~$[Considering the injection rate of all nodes (Total 
Injection) gives simple%%lst%% one%%dsh%%dimensional feature vectors that 
allow us to differentiate between intervals that are experi%%dsh%% 
encing high%%lst%% medium ]v[ low levels of communication%%per%%]$~ ~$[The 
beneﬁt of this vector is that it is easy to create%%per%%]$~ ~$[Calculating 
the distance between vectors ]^[ applying clustering is fast 
because it is one%%dsh%%dimensional%%per%%]$~ ~$[Yet Total Injection may be 
too simple%%scn%% the total number of packets does ]n[ reveal any 
spatial characteristics of the trafﬁc%%per%%]$~ ~$[Even when two vectors 
have similar magnitudes%%lst%% their respective intervals could ex%%dsh%% 
hibit different spatial behaviour%%lst%% such as hot spots%%per%%]$~ ~$[Using the 
injection rate of individual nodes alleviates some of these is%%dsh%% 
sues%%per%%]$~ ~$[An N%%dsh%%dimensional vector with per%%dsh%%node injection rates 
(Node Injection) captures some spatial characteristics of our 
applications%%per%% 
5%%per%%1%%per%%2%%per%%]$~ ~$[Injection Flows Node Injection helps identify injecting 
hotspots – that is%%lst%% nodes that send a lot of packets%%per%%]$~ ~$[But hot 
spots can also exist at a destination – that is%%lst%% nodes that receive 
a lot of packets%%per%%]$~ ~$[To capture the relationship between sent 
]^[ received messages%%lst%% we can use ﬂows [20]%%per%%]$~ ~$[A ﬂow is the 
injection rate between a source ]^[ a destination%%per%%]$~ ~$[For an N%%dsh%% 
node network%%lst%% there are N2 source%%dsh%%destination ﬂow pairs%%per%%]$~ ~$[We 
construct a feature vector (Per%%dsh%%Node Flow) that captures this 
information%%per%%]$~ ~$[This vector scales quadratically with the number 
of nodes%%per%%]$~ ~$[Sufﬁcient data has to be present in the trafﬁc ]v[ else 
Table 2%%cln%% Different trafﬁc feature vectors ]f[ an N%%dsh%%node network 
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
Packets 
destination pair 
injected between each source%%dsh%% 
the feature vector falls prey to the curse of dimensionality%%per%%]$~ 
~$[We can simplify Per%%dsh%%Node Flow feature vectors by aggregat%%dsh%% 
ing nodes into rows ]^[ columns (Row%%dsh%%Column Flow)%%per%%]$~ ~$[Each 
element of the vector corresponds to the number of packets 
sent by a row of nodes to a column of nodes%%per%%]$~ ~$[We use the words 
row ]^[ column ]f[ simplicity – the actual mapping of nodes 
in the network does ]n[ have to be grid%%dsh%%like%%per%% 
5%%per%%1%%per%%3%%per%%]$~ ~$[Summary We introduce four potential feature vectors 
to classify trafﬁc phases%%per%%]$~ ~$[These are summarized in Table 2%%per%%]$~ 
~$[Each vector has its own pros ]^[ cons%%lst%% ]^[ some vectors are 
better suited ]f[ either a macro ]v[ micro scale%%per%%]$~ ~$[We explore the 
impact of different feature vectors in Sec%%per%% 8%%per%% 
5%%per%%2%%per%%]$~ ~$[Clustering Methods 
Feature vectors are used to cluster intervals into trafﬁc phases%%per%%]$~ 
~$[We calculate the distance between vectors ]^[ then apply 
a clustering method%%per%%]$~ ~$[Distance calculations are affected by 
the dimensionality of the vector (i%%per%%e%%per%% number of features)%%scn%% 
therefore%%lst%% feature vectors that scale poorly (Table 2) lead to 
high overhead ]^[ modelling time%%per%%]$~ ~$[In this section%%lst%% we look 
at two clustering approaches%%cln%% partitional ]^[ hierarchical ]^[ 
weigh their beneﬁts%%per%%]$~ ~$[Ultimately%%lst%% we use different approaches 
at different granularities%%lst%% as we discuss in Sec%%per%% 6%%per%% 
5%%per%%2%%per%%1%%per%%]$~ ~$[Partitional Clustering Partitional clustering desig%%dsh%% 
nates a feature vector that is central to each group%%scn%% we use 
Euclidean distance as a measure of closeness between vec%%dsh%% 
tors%%per%%]$~ ~$[Although k%%dsh%%means is the most popular%%lst%% we use k%%dsh%%medoids 
(speciﬁcally%%lst%% Partitioning%%dsh%%Around%%dsh%%Medoids ]v[ PAM)%%per%%]$~ ~$[PAM 
performs a pairwise comparison of the distances between a 
vector (V ) ]^[ every other vector in the group%%per%%]$~ ~$[Although 
slower than k%%dsh%%means%%lst%% PAM is able to provide the central vector 
(medoid) ]f[ each group%%per%%]$~ ~$[This allows us to select the interval 
that is most representative of its trafﬁc phase%%per%%]$~ ~$[Partitional clus%%dsh%% 
tering is an NP%%dsh%%hard problem%%lst%% however heuristics are available 
that keep its complexity ]^[ speed low [46]%%per%%]$~ 
~$[Partitional clustering requires the number of trafﬁc phases 
(or clusters k) to be an input to the algorithm%%per%%]$~ ~$[Formal meth%%dsh%% 
ods exist [34] to determine an optimum k value%%lst%% though ]n[ 
all methodologies agree on the same k%%per%%]$~ ~$[Two common meth%%dsh%% 
ods that estimate an optimal k are Average Silhouette Width 
(ASW) [35] ]^[ the Calinksi%%dsh%%Harabasz (CH) index [6]%%per%%]$~ ~$[We 
explore the effects of k using these two methods in Sec%%per%% 8%%per%%1%%per%% 
5%%per%%2%%per%%2%%per%%]$~ ~$[Hierarchical Clustering Hierarchical clustering is an 
efﬁcient%%lst%% deterministic approach to grouping trafﬁc phases%%per%%]$~ 
~$[However%%lst%% it has a complexity of O(n3) (where n is the number 
of vectors)%%lst%% making it better suited to clustering smaller data 
sets%%per%%]$~ ~$[Hierarchical clustering creates a tree (a dendogram) of all 
feature vectors%%lst%% linking vectors together based on distance ]^[ 
a linkage criterion5%%per%%]$~ ~$[The algorithm iteratively combines the 
two clusters that have the least impact on the sum of squares 
error%%per%%]$~ ~$[Different levels of the tree indicate which vectors belong 
to which clusters%%scn%% the tree can be cut at a user%%dsh%%deﬁned level 
to provide the desired number of trafﬁc phases%%per%%]$~ ~$[We use the 
L%%dsh%%method [36] to determine the appropriate number of clusters 
in hierarchical clustering%%per%% 
6%%per%%]$~ ~$[Injection Process 
In Sec%%per%% 5%%lst%% we introduce macro%%dsh%% ]^[ micro%%dsh%%level granularities 
]f[ intervals%%per%%]$~ ~$[Each macro%%dsh%%interval is further broken down into 
micro%%dsh%%intervals%%per%%]$~ ~$[Then%%lst%% we group intervals into trafﬁc phases 
using clustering%%per%%]$~ ~$[Next%%lst%% we demonstrate how to construct a 
hierarchical Markov Chain ]f[ the macro%%dsh%% ]^[ micro%%dsh%%levels%%per%%]$~ 
~$[Fig%%per%% 1 shows an overview of our approach%%lst%% where macro%%dsh%%scale 
trafﬁc has been decomposed into micro%%dsh%%scale intervals%%lst%% ]^[ 
two Markov Chains govern the transitions between phases%%per%%]$~ 
~$[Markov Chains are typically used to model stochastic pro%%dsh%% 
cesses%%per%%]$~ ~$[A Markov Chain is made up of a number of states%%lst%% 
with transition probabilities deﬁned ]f[ moving from one state 
to another%%per%%]$~ ~$[In our case%%lst%% states correspond to macro%%dsh%% ]v[ micro%%dsh%% 
phases%%lst%% ]^[ transitioning from one phase to another allows 
us to accurately replicate the time%%dsh%%varying behaviour of an 
application’s injection process%%per%%]$~ 
~$[Macro Scale Given long application runtimes%%lst%% the number 
of intervals at the macro level ranges from hundreds to thou%%dsh%% 
sands%%per%%]$~ ~$[This variability ]^[ the resulting large number of vec%%dsh%% 
tors means hierarchical clustering is ]n[ a good ﬁt because 
of its O(n3) complexity%%scn%% therefore we use PAM at the macro 
scale%%per%%]$~ ~$[PAM gives us the medoid of each trafﬁc phase – that is%%lst%% 
a single macro interval that best represents the macro phase%%per%%]$~ 
~$[Having a single macro%%dsh%%interval ]f[ each phase signiﬁcantly re%%dsh%% 
duces the amount of data modelled%%per%%]$~ ~$[Once we have the medoid 
]f[ each trafﬁc phase%%lst%% we pass them to our micro model ]^[ 
analyze the trafﬁc at a ﬁner granularity%%per%%]$~ ~$[We create a micro 
model ]f[ each macro%%dsh%%interval selected%%per%%]$~ 
~$[Micro Scale The micro scale looks at only a small subset 
of the overall trafﬁc%%per%%]$~ ~$[Dividing a macro%%dsh%%interval into micro%%dsh%% 
intervals allows us to capture the injection process at a ﬁner 
granularity%%scn%% this is necessary to capture bursty ﬂuctuations in 
trafﬁc that can greatly inﬂuence network performance%%per%%]$~ ~$[Unlike 
at the macro%%dsh%%level%%lst%% we are ]n[ looking ]f[ a single representa%%dsh%% 
tive interval per trafﬁc phase%%per%%]$~ ~$[A single representative interval 
does ]n[ contain enough data to form an accurate micro%%dsh%%level 
model%%per%%]$~ ~$[Since we do ]n[ need a medoid%%lst%% we use hierarchical 
clustering at the micro scale%%per%%]$~ 
~$[Hierarchy We model multiple Markov Chains ]f[ our hierar%%dsh%% 
chy of macro%%dsh%% ]^[ micro%%dsh%%levels%%per%%]$~ ~$[One Markov Chain governs 
transitioning between macro%%dsh%%phases%%per%%]$~ ~$[For each macro%%dsh%%phase 
we deﬁne another Markov Chain ]f[ its micro%%dsh%%phases%%per%%]$~ ~$[Fig%%per%% 1 
shows the two level hierarchy with two macro%%dsh%%phases ]^[ 
5We use minimum%%dsh%%variance based on Ward’s method [47]%%per%%]$~ 
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
Mesh 
4 bytes 
2 per port 
Adaptive XY%%dsh%%YX 
8 ﬂits 
4 stages 
Flattened Butterﬂy [23] 
C 
4 bytes 
4 per port 
UGAL 
Table 3%%cln%% Simulation conﬁgurations 
three micro%%dsh%%phases%%per%%]$~ ~$[An important property of Markov Chains 
is that they can reach equilibrium (π)%%per%%]$~ ~$[That is%%lst%% after inﬁnite 
time%%lst%% the Markov Chain converges to a steady state where the 
probability of being in a given state is constant%%per%%]$~ ~$[We exploit 
this property to achieve signiﬁcant speedups over full%%dsh%%system 
simulation in Sec%%per%% 10%%per%% 
7%%per%%]$~ ~$[Methodology 
We evaluate SynFull using a 16%%dsh%%core CMP with the conﬁgura%%dsh%% 
tion given in Table 3%%per%%]$~ ~$[Each node contains a core%%lst%% private L1 
cache%%lst%% private L2 cache ]^[ a directory%%per%%]$~ ~$[Data is collected using 
FeS2%%lst%% a full%%dsh%%system simulator [31] integrated with Booksim%%lst%% a 
cycle%%dsh%%accurate network simulator [19]%%per%%]$~ ~$[We run PARSEC [5] 
]^[ SPLASH%%dsh%%2 [48] benchmarks with the sim%%dsh%%small input 
set%%per%%]$~ ~$[All benchmarks are run to completion with the exception 
of facesim%%lst%% which was capped at three hundred million cycles%%per%%]$~ 
~$[To generate the SynFull models%%lst%% we collect traces from full%%dsh%% 
system simulation assuming an ideal fully%%dsh%%connected NoC 
with a ﬁxed one cycle latency%%per%%]$~ ~$[Using an ideal network ensures 
that our model does ]n[ contain artifacts of the network%%lst%% ]^[ 
therefore cannot be inﬂuenced by a certain topology%%lst%% routing 
algorithm%%lst%% etc%%per%%]$~ ~$[Thus a single model can be used to simulate 
a wide range of NoC conﬁgurations%%per%%]$~ ~$[We compare NoC per%%dsh%% 
formance of our synthetically generated network trafﬁc with 
full%%dsh%%system simulation ]^[ trace%%dsh%%based simulation using state%%dsh%% 
of%%dsh%%the%%dsh%%art packet dependency tracking based on Netrace [18]%%per%%]$~ 
~$[To demonstrate that our methodology is network agnos%%dsh%% 
tic%%lst%% we compare against three different NoC conﬁgurations 
(Table 3)%%per%%]$~ ~$[That is%%lst%% we can apply SynFull to different NoC 
conﬁgurations ]^[ capture similar behaviour to what would 
have been exhibited by full%%dsh%%system simulation%%lst%% regardless of 
the network’s conﬁguration%%per%% 
8%%per%%]$~ ~$[SynFull Exploration 
Our proposed SynFull trafﬁc model has a number of parame%%dsh%% 
ters that can be changed%%per%%]$~ ~$[Initially%%lst%% it is ]n[ obvious ]v[ intuitive 
what the values of these parameters should be to accurately 
model trafﬁc%%per%%]$~ 
~$[In this section%%lst%% we explore these model pa%%dsh%% 
rameters ]^[ discuss their affects on the generated network 
trafﬁc%%lst%% NoC performance ]^[ model accuracy%%per%%]$~ ~$[Speciﬁcally%%lst%% 
we%%cln%% (i) Evaluate how the number of macro phases affect NoC 
performance%%scn%% (ii) Demonstrate how to adjust the amount of 
congestion at the micro level with different feature vectors%%scn%% 
Benchmark 
Lu 
Raytrace 
Swaptions 
ASW NI 
ASW TI 
CH NI 
CH TI 
2 
2 
2 
2 
2 
2 
2 
8 
2 
10 
7 
6 
Table 4%%cln%% Number of macro phases ]f[ different formal methods 
]^[ feature vectors 
]^[ (iii) Explore how the size of time intervals can change 
trafﬁc generated by SynFull%%per%%]$~ 
~$[We look at the effects of different parameters quantitatively 
on three benchmarks%%cln%% Lu (contiguous)%%lst%% Raytrace%%lst%% ]^[ Swap%%dsh%% 
tions%%per%%]$~ ~$[The domains of these benchmarks are different%%scn%% Lu is 
a high%%dsh%%performance computing application that relies heav%%dsh%% 
ily on barriers as its synchronization primitive%%lst%% Raytrace is a 
graphics%%dsh%%based benchmark that relies heavily on locks%%lst%% ]^[ 
Swaptions deals with ﬁnancial analysis ]^[ is ]n[ very com%%dsh%% 
munication intensive%%per%%]$~ ~$[Once we have explored the parameters 
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
affects the variety of trafﬁc exhibited at the macro granularity%%per%%]$~ 
~$[We explore two feature vectors at the macro%%dsh%%level%%cln%% Total 
Injection (TI) ]^[ Node Injection (NI)%%per%%]$~ ~$[Our goal is to reduce 
the clustering overhead at the macro level because the number 
of observations can be quite large ]^[ varies by benchmark – 
TI ]^[ NI require the least processing time of all the proposed 
feature vectors%%per%%]$~ ~$[Using these two feature vectors%%lst%% we apply CH 
]^[ ASW to the clustering to determine the optimal number of 
macro%%dsh%%phases%%per%%]$~ ~$[We assume macro%%dsh%%intervals of 500,000 cycles 
]^[ micro%%dsh%%intervals of 200 cycles%%lst%% ]^[ the NI feature vector 
at the micro level%%per%%]$~ ~$[We create our model from full%%dsh%%system 
simulation with an ideal network%%lst%% ]^[ then apply the trafﬁc to 
Network A%%per%%]$~ ~$[We compare the resulting average packet latency 
to full%%dsh%%system simulation (FSYS)%%scn%% this metric includes the time 
a node is queued waiting to be injected into the network%%per%%]$~ 
~$[Table 4 shows the number of phases suggested by the ASW 
]^[ CH formal methods ]f[ the NI ]^[ TI feature vectors%%lst%% ]^[ 
Fig%%per%% 5 shows the results of using those parameters%%per%%]$~ ~$[There is 
little variation in average packet latency when tweaking macro 
parameters ]f[ Lu ]^[ Swaptions%%per%%]$~ ~$[Raytrace%%lst%% however%%lst%% shows 
more accuracy using the CH index%%lst%% which recommends 7 ]v[ 8 
macro phases with TI ]^[ NI%%lst%% respectively%%per%%]$~ ~$[Raytrace trafﬁc has 
several macro intervals that deviate from the norm%%lst%% likely due 
to the several thousand locks it uses [48]%%lst%% ]^[ therefore should 
be modelled with more macro phases%%per%%]$~ ~$[The locking in Raytrace 
results in an unstructured communication pattern with high 
Figure 5%%cln%% Macro%%dsh%%level sweeping of feature vectors & number 
of phases (Table 4)%%per%% 
variation%%per%%]$~ ~$[Too few macro phases would force interval outliers 
into phases where they do ]n[ belong%%per%%]$~ 
~$[The use of barriers in Lu results in distinct periods of low 
]^[ high communication%%scn%% when all threads reach a barrier there 
is a sudden burst of packets into the NoC%%per%%]$~ ~$[This communication 
pattern maps well to 2 distinct macro phases%%per%%]$~ ~$[CH+TI has 10 
macro phases which results in the highest error ]f[ SynFull%%per%%]$~ 
~$[Too many phases can lead to poor clustering quality because 
some phases will have very few%%lst%% ]v[ even a single interval%%lst%% asso%%dsh%% 
ciated with them%%per%%]$~ ~$[These phases are superﬂuous ]^[ negatively 
impact the Markov Chain because they will be rarely visited%%per%%]$~ 
~$[The single dimension of TI makes the clustering sensitive 
to ﬂuctuations between macro intervals%%scn%% that is%%lst%% two high%%dsh%% 
communication macro%%dsh%%intervals may ]n[ be clustered together 
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
by the NI vector%%per%%]$~ ~$[The Row%%dsh%%Column Flow (RCFlow) ]^[ Per%%dsh%% 
Node Flow (Flow) feature vectors are better suited to capturing 
these hot spots%%lst%% allowing ]f[ the synthetically generated trafﬁc 
to cause congestion as full%%dsh%%system simulation might%%per%%]$~ 
~$[In this section%%lst%% we use CH+NI at the macro level with 
interval sizes of 500,000 cycles%%per%%]$~ ~$[We compare the NI feature 
vector to RCFlow ]^[ Flow with 200%%dsh%%cycle micro intervals%%per%%]$~ 
~$[We run our models on Network A ]^[ show average packet 
latency in Fig%%per%% 6%%per%%]$~ ~$[The RCFlow ]^[ Flow vectors are more 
accurate with respect to full%%dsh%%system simulation ]f[ Raytrace%%scn%% 
the locks used by Raytrace result in speciﬁc source%%dsh%%destination 
sharing that NI does ]n[ capture%%per%%]$~ ~$[Also important is that the two 
vectors did ]n[ negatively affect the accuracy ]f[ the Lu ]^[ 
Swaptions%%scn%% that is%%lst%% RCFlow ]^[ Flow did ]n[ artiﬁcially create 
congestion ]f[ benchmarks that do ]n[ exhibit that behaviour%%per%%]$~ 
~$[We are ]n[ only interested in average behaviour ]b[ in cap%%dsh%% 
turing the highs ]^[ lows of network trafﬁc%%per%%]$~ ~$[Looking at packet 
010203040lu continguousraytraceswaptionsAverage%%per%%Packet%%per%%LatencySimulationFSYSASW_NIASW_TICH_NICH_TI Figure 6%%cln%% Micro%%dsh%%level sweep of feature vectors 
Figure 8%%cln%% NoC performance ]f[ different interval sizes%%per%%]$~ 
~$[Figure 7%%cln%% Hellinger distance comparing packet latency distribu%%dsh%% 
tions of synthetic simulations to full system%%per%%]$~ ~$[Lower is better%%per%% 
latency distributions%%lst%% we can see the number of packets that 
achieve a wide range of latencies while in the network%%scn%% this 
distribution gives insight into the congestion the network has 
experienced%%per%%]$~ ~$[The Hellinger Distance deﬁnes the similarity 
between two distributions%%per%%]$~ ~$[The Hellinger Distance is deﬁned 
in Equation 2%%lst%% where P ]^[ Q are two discrete distributions (in 
our case%%lst%% packet latency distributions)%%lst%% ]^[ pi ]^[ qi are the 
ith element of P ]^[ Q%%lst%% respectively%%per%% 
(cid:118)(cid:117)(cid:117)(cid:116) k 
∑ 
i=1 
H(P,Q) = 
1√ 
2 
√ 
( 
pi −√ 
qi)2 
(2) 
Fig%%per%% 7 shows the Hellinger Distance ]f[ our synthetic trafﬁc 
latency distributions compared to full%%dsh%%system simulation%%per%%]$~ ~$[The 
lower the distance%%lst%% the more similar the latency distributions 
are%%per%%]$~ ~$[We can see that%%lst%% although the error in average packet 
latency is less ]f[ Raytrace with the Flow vector (Fig%%per%% 7)%%lst%% the 
distribution of packet latencies is ]n[ as close to full system 
as RCFlow%%per%%]$~ ~$[This is because the Flow vector causes more high 
latency packets than full%%dsh%%system simulation%%lst%% driving up the av%%dsh%% 
erage packet latency with more congestion than necessary%%per%%]$~ ~$[In 
all cases%%lst%% RCFlow is more similar to the desired packet latency 
distribution exhibited by full%%dsh%%system simulation%%lst%% ]^[ its error 
in average packet latency is comparable to Flow%%per%%]$~ ~$[Therefore%%lst%% 
we recommend RCFlow ]f[ micro clustering%%per%% 
8%%per%%3%%per%%]$~ ~$[Time Interval Size 
So far we have used 500,000 cycles per macro interval ]^[ 
200 cycles per micro interval%%per%%]$~ ~$[This results in 500,000/200 = 
2,500 micro intervals (observations) per macro interval%%lst%% which 
is low enough to keep hierarchical clustering time reasonable%%per%%]$~ 
~$[Now%%lst%% we sweep the macro ]^[ micro interval sizes together ]s[ 
that they always result in 2,500 observations%%per%%]$~ ~$[We use CH+NI 
at the macro level%%lst%% ]^[ compare the RCFlow ]^[ Flow feature 
vectors at the micro level with various interval sizes%%per%%]$~ 
~$[Fig%%per%% 8 shows the average packet latency ]f[ SynFull trafﬁc 
with different interval sizes%%per%%]$~ ~$[There is ]n[ a clear cut interval 
size that is best ]f[ every application%%per%%]$~ ~$[RCFlow works best with 
Feature Vector 
Cluster Algorithm 
Formal Method 
Interval Size 
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
Table 5%%cln%% Final SynFull Conﬁguration 
a micro%%dsh%%interval size of 100 cycles ]f[ Raytrace%%lst%% ]b[ performs 
worse ]f[ Lu%%per%%]$~ ~$[Applications may exhibit different periodic 
behaviour at the micro level depending on their algorithm ]v[ 
an application may ]n[ have periodic behaviour at all%%per%%]$~ ~$[When 
using large interval sizes of 500 cycles ]v[ more%%lst%% we risk ]n[ 
capturing bursty application trafﬁc because deviations in injec%%dsh%% 
tion rate get averaged out across the interval%%per%%]$~ ~$[For applications 
without bursty trafﬁc%%lst%% large interval sizes work well because 
the standard deviation of packets injected over time is low%%per%%]$~ 
~$[Choosing a universal interval size ]f[ all applications may 
lead to slightly less accurate SynFull results ]f[ a subset of 
benchmarks%%per%%]$~ ~$[In future work%%lst%% we will investigate automatically 
determining the interval size based on application trafﬁc%%per%% 
8%%per%%4%%per%%]$~ ~$[Parameter Recommendations 
Based on the results presented in this section%%lst%% we make some 
recommendations regarding model parameters used in SynFull%%per%%]$~ 
~$[Changing the feature vector at the macro level does ]n[ have a 
signiﬁcant effect on network performance%%per%%]$~ ~$[However%%lst%% in terms 
of the clustering quality (recall TI vs%%per%%]$~ ~$[NI ]f[ Lu’s barriers)%%lst%% 
using the NI feature vector with the CH index yields the best 
results%%per%%]$~ ~$[For feature vectors at the micro level%%lst%% it is important to 
select a vector that adequately captures hotspots%%per%%]$~ ~$[Both RCFlow 
]^[ Flow feature vectors show good results%%lst%% however RCFlow 
scales better with the number of nodes being simulated ]^[ 
takes signiﬁcantly less time to model (typically%%lst%% an RCFlow 
model takes a few minutes to generate whereas a Flow model 
can take over 20)%%per%%]$~ ~$[Finally%%lst%% the interval sizes of the macro 
]^[ micro levels can greatly inﬂuence trafﬁc generated by 
SynFull%%per%%]$~ ~$[For the rest of this paper%%lst%% we will use 200 cycles at 
the micro%%dsh%%level ]^[ 500,000 cycles at the macro%%dsh%%level%%per%% 
9%%per%%]$~ ~$[Results 
We evaluate SynFull with PARSEC ]^[ SPLASH%%dsh%%2 bench%%dsh%% 
marks on the three network conﬁgurations introduced in Ta%%dsh%% 
ble 3%%per%%]$~ ~$[We compare SynFull against full%%dsh%%system simulation ]^[ 
trace simulation with packet dependences%%per%%]$~ ~$[For SynFull%%lst%% we 
use the recommendations in Sec%%per%% 8%%per%%4 summarized in Table 5%%per%%]$~ 
~$[Initially ]f[ both SynFull ]^[ trace simulations%%lst%% the number of 
cycles simulated is equal to the number of cycles required to 
010203040lu continguousraytraceswaptionsAverage%%per%%Packet%%per%%LatencySimulationFSYSFlowRCFlowNI0%%per%%000%%per%%030%%per%%060%%per%%090%%per%%12lu continguousraytraceswaptionsHellinger%%per%%DistanceSimulationFlowRCFlowNode01020304050lu continguousraytraceswaptionsAverage%%per%%Packet%%per%%LatencySimulationFSYSFlow 100 250000Flow 200 500000Flow 500 1250000RCFlow 100 250000RCFlow 200 500000RCFlow 500 1250000 Figure 9%%cln%% NoC performance%%per%%]$~ ~$[Bars that reach the top of the y%%dsh%%axis (e%%per%%g%%per%%]$~ ~$[FFT) are truncated ]s[ that other results may be seen more clearly%%per%%]$~ 
~$[Figure 10%%cln%% Comparing similarity of packet latency distributions with full%%dsh%%system simulation 
complete a full%%dsh%%system simulation of the benchmark with an 
ideal network%%per%%]$~ ~$[Later%%lst%% we explore early simulation termination 
due to the Markov Chain reaching steady%%dsh%%state%%per%% 
ets%%lst%% independent packets continue to be injected according to 
their timestamp%%per%%]$~ ~$[For most applications%%lst%% especially FFT ]^[ 
Radix%%lst%% this has a signiﬁcant impact on NoC performance%%per%%]$~ 
~$[Incorporating packet dependences into trace simulation im%%dsh%% 
proves the ﬁdelity of traditional trace%%dsh%%based simulation on 
NoCs [18]%%per%%]$~ ~$[Traditionally%%lst%% packets from a trace are injected 
into the network with no regard ]f[ when they arrive at their 
destinations%%per%%]$~ ~$[This is unrealistic due to the reactive nature of 
some packets%%lst%% as explained in Sec%%per%% 4%%per%%]$~ ~$[Dependence tracking 
aims to capture the reactive nature of packets%%lst%% ]^[ only inject 
them when their requesting packet has arrived%%scn%% the injection 
of dependent packets is triggered by another packet’s arrival%%lst%% 
rather than the timestamp of the original trace%%per%%]$~ 
~$[We compare average packet latency across simulation 
methodologies (Fig%%per%% 9)%%per%%]$~ ~$[SynFull does very well on NoCs 
A ]^[ C%%lst%% with a geometric mean error of 8%%per%%9% ]^[ 9%%per%%5% 
across all benchmarks%%per%%]$~ ~$[NoCs A ]^[ C are reasonably well%%dsh%% 
provisioned%%scn%% most applications do ]n[ experience signiﬁcant 
contention on these networks%%per%%]$~ ~$[SynFull achieves accurate aver%%dsh%% 
age packet latency both ]f[ applications that do ]n[ stress the 
network (e%%per%%g%%per%%]$~ ~$[Cholesky Radix%%lst%% Radiosity%%lst%% Swaptions)%%lst%% ]^[ ap%%dsh%% 
plications that do stress the network (e%%per%%g%%per%%]$~ ~$[Barnes%%lst%% Bodytrack%%lst%% 
Fluidanimate)%%per%%]$~ ~$[Network throughput has similar accuracy%%lst%% with 
geometric mean errors of 11%%per%%78% ]^[ 12%%per%%42% ]f[ NoCs A 
]^[ C%%per%%]$~ ~$[Running an ideal network trace with dependences does 
]n[ fair as well (geometric mean packet latency error of 18% 
]^[ 12%%per%%8% ]f[ NoCs A ]^[ C) because dependences are ]n[ 
tracked at the application level%%per%%]$~ ~$[While reactive packets are 
throttled correctly waiting on the arrival of predecessor pack%%dsh%% 
NoC B is the least provisioned of the 3 networks%%per%%]$~ ~$[As a 
result%%lst%% discrepancies in initiating packet injections are more 
pronounced ]f[ both SynFull (16%%per%%1% packet latency error ]^[ 
a 16%%per%%11% throughput error) ]^[ Traces (30%%per%%2% packet latency 
error)%%per%%]$~ ~$[Traces with dependences have signiﬁcant error even ]f[ 
applications with low communication requirements (e%%per%%g%%per%%]$~ ~$[Ra%%dsh%% 
diosity)%%lst%% while SynFull is capable of reproducing similar NoC 
performance ]f[ benchmarks of this type%%per%%]$~ ~$[Some applications 
running on NoC B have signiﬁcant error ]f[ both SynFull ]^[ 
Traces%%per%%]$~ ~$[In particular%%lst%% Radix ]^[ FFT (excluded from geoMean 
calculations) run off the chart%%per%%]$~ ~$[These are special cases where 
the application has macro%%dsh%%level intervals with very high injec%%dsh%% 
tion rates that dwarf the injection rate across the rest of the 
application%%per%%]$~ ~$[For example%%lst%% running FFT on an ideal network%%lst%% 
there is a spike of several macro%%dsh%%intervals during the middle 
of simulation with an order of magnitude larger injection rate 
than other intervals%%per%%]$~ ~$[When running FFT in full%%dsh%%system simula%%dsh%% 
tion on the considerably less provisioned NoC B%%lst%% the spike is 
longer ]b[ with a much lower (less than 50%) injection rate%%per%%]$~ 
~$[This is due to application%%dsh%%level dependences ]^[ the core’s re%%dsh%% 
order buffer throttling instruction issue which in turn throttles 
network injection%%per%%]$~ ~$[However%%lst%% this is an extreme case ]^[ one 
]n[ typically found in many of the applications we consider%%scn%% 
we are investigating techniques to adapt our model to these 
scenarios%%per%%]$~ 
~$[We discussed the importance of packet latency distributions 
Network ANetwork BNetwork C050100150BarnesBlackscholesBodytrackCholeskyFacesimFFTFluidanimatelu_contiguouslu_noncontiguousRadiosityRadixRaytraceSwaptionsVolrendWater_nsquaredWater_spatialgeoMeanBarnesBlackscholesBodytrackCholeskyFacesimFFTFluidanimatelu_contiguouslu_noncontiguousRadiosityRadixRaytraceSwaptionsVolrendWater_nsquaredWater_spatialgeoMeanBarnesBlackscholesBodytrackCholeskyFacesimFFTFluidanimatelu_contiguouslu_noncontiguousRadiosityRadixRaytraceSwaptionsVolrendWater_nsquaredWater_spatialgeoMeanAverage%%per%%Packet%%per%%LatencyFSYSTrace%%per%%DependencySynFullNetwork ANetwork BNetwork C0%%per%%00%%per%%20%%per%%40%%per%%60%%per%%8barnesblackscholesbodytrackcholeskyfacesimfftfluidanimatelu_cblu_ncbradiosityradixraytraceswaptionsvolrendwater_nsquaredwater_spatialbarnesblackscholesbodytrackcholeskyfacesimfftfluidanimatelu_cblu_ncbradiosityradixraytraceswaptionsvolrendwater_nsquaredwater_spatialbarnesblackscholesbodytrackcholeskyfacesimfftfluidanimatelu_cblu_ncbradiosityradixraytraceswaptionsvolrendwater_nsquaredwater_spatialHellinger%%per%%DistanceTrace%%per%%DependencySynFull Our simulations use 8%%dsh%%byte control packets ]^[ 72%%dsh%%byte data 
packets%%per%%]$~ ~$[From Fig%%per%% 11 (right) we see that there is ]n[ much 
difference in performance between an 8 ]^[ 16 byte channel 
width%%per%%]$~ ~$[This is because a 16 byte channel width only improves 
transmission of data packets%%lst%% since 8 bytes is all that is needed 
]f[ a control packet%%per%%]$~ ~$[As the channel width decreases%%lst%% ]s[ too 
does performance due to the increased serialization latency of 
all packets%%per%%]$~ ~$[Buffer depth also affects performance%%per%%]$~ ~$[Smaller 
buffers increases the latency of packets because ﬂits have to 
wait until space becomes available before proceeding towards 
their destination%%per%%]$~ ~$[In this case study%%lst%% Fig%%per%% 11 (left) shows that 
SynFull captures the relationship almost perfectly%%per%%]$~ 
~$[Overall%%lst%% SynFull is a superior approach to trace dependences 
in terms of ﬁdelity%%per%%]$~ ~$[SynFull is less prone to error across a va%%dsh%% 
riety of applications ]^[ stresses an NoC in the same way 
an application would in full%%dsh%%system simulation%%per%%]$~ ~$[SynFull also 
captures the same trends found through full%%dsh%%system simulation%%per%%]$~ 
~$[High accuracy is an important attribute of SynFull%%scn%% indepen%%dsh%% 
dent of its accuracy relative to full%%dsh%%system simulation%%lst%% SynFull 
provides a meaningful collection of synthetic trafﬁc models 
that capture a diverse range of application ]^[ cache coher%%dsh%% 
ence behaviour making SynFull an invaluable tool in a NoC 
designer’s arsenal%%per%%]$~ ~$[In Sec%%per%% 10%%lst%% we explore the speed of SynFull 
relative to full%%dsh%%system simulation%%lst%% ]^[ how it can be further 
accelerated using a special property of Markov Chains%%per%% 
10%%per%%]$~ ~$[Exploiting Markov Chains ]f[ Speedup 
Simply running SynFull ]f[ the same number of cycles as 
full%%dsh%%system simulation results in signiﬁcant speed up – this 
is because SynFull itself does ]n[ require much processing 
time%%per%%]$~ ~$[The NoC simulator is the limiting factor%%lst%% ]b[ is still sub%%dsh%% 
stantially faster than a full%%dsh%%system simulator%%per%%]$~ ~$[We can further 
improve the simulation time of SynFull by exploiting the sta%%dsh%% 
tionary distribution of Markov Chains%%per%%]$~ ~$[An important property 
of Markov Chains is that they can reach equilibrium%%per%%]$~ ~$[That is%%lst%% 
after inﬁnite time%%lst%% the Markov Chain converges to a steady 
state where the probability of being in a given state is constant%%per%%]$~ 
~$[In SynFull%%lst%% when the macro%%dsh%%level Markov Chain has con%%dsh%% 
verged to its equilibrium%%lst%% we exit the simulation prematurely%%per%%]$~ 
~$[This implies that all trafﬁc phases have been simulated ]f[ an 
adequate time%%lst%% ]^[ our simulation has reached its steady state%%per%%]$~ 
~$[We cannot apply the same methodology to trace%%dsh%%based simu%%dsh%% 
lation because it follows the same progression as full%%dsh%%system 
simulation%%per%%]$~ ~$[If we exit a trace prematurely%%lst%% we may miss out on 
a large period of bursty communication ]v[ low communication%%lst%% 
both of which would give very different overall NoC perfor%%dsh%% 
mance results%%per%%]$~ ~$[For example%%lst%% if trace simulation of FFT were to 
exit early%%lst%% it would ]n[ reach the large spike of macro intervals%%lst%% 
leading NoC researchers to draw incorrect conclusions%%per%%]$~ 
~$[Fig%%per%% 12 shows the average speedup of traces%%lst%% SynFull%%lst%% ]^[ 
with SynFull exiting simulation at steady%%dsh%%state (SynFull_SS)%%per%%]$~ 
~$[The numbers are calculated by averaging the total runtime of 
simulations across each of the three network conﬁgurations (A%%lst%% 
B%%lst%% ]^[ C) ]f[ each application%%per%%]$~ ~$[Without steady%%dsh%%state%%lst%% SynFull 
Figure 11%%cln%% Two case studies of packet latency trends across 
all workloads 
in Sec%%per%% 8%%per%%2%%lst%% ]^[ use the Hellinger Distance to compare dis%%dsh%% 
tributions to full%%dsh%%system simulation%%per%%]$~ ~$[Fig%%per%% 10 shows packet 
latency distribution Hellinger Distance ]f[ SynFull ]^[ Traces 
compared to full%%dsh%%system simulation%%per%%]$~ ~$[Consistent with the aver%%dsh%% 
age packet latency error%%lst%% SynFull modelling FFT (NoC B) has 
a large Hellinger Distance which indicates that the resulting 
distribution does ]n[ resemble the latency distribution seen in 
full%%dsh%%system simulation%%per%%]$~ ~$[Outside of FFT%%lst%% our technique fares 
well ]f[ PARSEC ]^[ SPLASH%%dsh%%2 applications%%per%%]$~ ~$[Applications 
with low communication requirements typically have the low%%dsh%% 
est Hellinger Distance because both SynFull ]^[ full%%dsh%%system 
simulation do ]n[ have a large tail in the distribution%%per%%]$~ ~$[For 
applications with more bursty behaviour%%lst%% Hellinger Distances 
are greater ]b[ still comparable%%per%%]$~ 
~$[Traces that perform well in average packet latency on NoCs 
A ]^[ C perform better than SynFull in Hellinger Distance 
(e%%per%%g%%per%%]$~ ~$[Cholesky%%lst%% Lu%%lst%% Radiosity)%%per%%]$~ ~$[These applications have low 
communication requirements%%per%%]$~ ~$[As a result%%lst%% the issue of in%%dsh%% 
dependent messages ﬂooding the network is minimized on 
a well%%dsh%%provisioned network%%lst%% ]^[ the trace faithfully repro%%dsh%% 
duces application trafﬁc%%per%%]$~ ~$[Due to the randomness associated 
with Markov Chains%%lst%% SynFull phases do ]n[ exactly coincide 
the way a trace would%%per%%]$~ ~$[As a result%%lst%% we have slightly higher 
Hellinger Distances%%lst%% ]b[ the results are still comparable%%per%%]$~ ~$[How%%dsh%% 
ever%%lst%% when comparing applications across all domains%%lst%% SynFull 
is the clear winner%%per%% 
9%%per%%1%%per%%]$~ ~$[Capturing Trends 
While absolute error values are useful%%lst%% designers expect a 
methodology to accurately capture the relationship between 
networks designs%%per%%]$~ ~$[That is%%lst%% if one network performs better than 
another in full%%dsh%%system simulation%%lst%% then the trend should be the 
same when using SynFull%%per%%]$~ ~$[Here we demonstrate that the rela%%dsh%% 
tionship is captured with more intuitive trends%%per%%]$~ ~$[Speciﬁcally%%lst%% 
we perform two separate sweeps on channel width ]^[ virtual 
channel buffer size%%per%%]$~ ~$[In the ﬁrst sweep%%lst%% we look at networks 
with 16%%lst%% 8%%lst%% 4%%lst%% ]^[ 2 byte channel widths%%per%%]$~ ~$[In the second sweep%%lst%% 
we look at networks with 16%%lst%% 8%%lst%% 4%%lst%% ]^[ 2 ﬂits per buffer%%per%%]$~ ~$[Intu%%dsh%% 
itively%%lst%% larger channel widths ]^[ buffer sizes would lead to 
better performance than smaller ones%%per%%]$~ ~$[Indeed%%lst%% this is the case 
as shown in Fig%%per%% 11%%scn%% results are averaged across all workloads%%per%%]$~ 
~$[Packets are subdivided into ﬂits based on the channel width%%per%% 
llllllllBuffer SizeChannel Width406080481216481216Number of Flits (Buffer Size) ]v[ Bytes (Channel Width)Average Packet LatencylFSYSSynFull Figure 12%%cln%% The average speedup over full system simulation 
]^[ Trace Dependency speed%%dsh%%ups are very similar since they 
simulate the same number of cycles%%per%%]$~ ~$[The simulation bottleneck 
here is the NoC itself ]^[ ]n[ the methodology ]f[ driving 
trafﬁc%%per%%]$~ ~$[With steady state%%lst%% we achieve substantial speedup%%scn%% 
speedup is as high as ∼150× ]^[ over 50× on average%%per%%]$~ 
~$[SynFull models two Markov Chains%%scn%% however%%lst%% we only exit 
when steady state is reached at the macro level%%per%%]$~ ~$[We could 
potentially end a macro%%dsh%%interval early by observing steady 
state at the micro level%%per%%]$~ ~$[However%%lst%% this would result in different 
length macro intervals%%lst%% which could negatively affect perfor%%dsh%% 
mance accuracy%%per%%]$~ ~$[For example%%lst%% imagine a low injection macro 
interval reaches steady state very early while a high injection 
macro interval does not%%per%%]$~ ~$[There would be a disproportionate 
amount of high injection to low injection%%lst%% negatively impact%%dsh%% 
ing the accuracy of our model%%per%%]$~ ~$[By only observing steady state 
at the macro%%dsh%%level Markov Chain%%lst%% we achieve similar error 
compared to running SynFull to completion%%scn%% a full run of Syn%%dsh%% 
Full has a geometric mean error of 8%%per%%9%%%lst%% 16%%per%%1%%%lst%% ]^[ 9%%per%%5% 
across networks A%%lst%% B%%lst%% ]^[ C%%lst%% while SynFull with steady state 
yields errors of 10%%per%%5%%%lst%% 17%%per%%1%%%lst%% ]^[ 9%%per%%1%%%per%% 
11%%per%%]$~ ~$[Related Work 
Simulation acceleration%%per%%]$~ ~$[There has been considerable work 
done to improve simulation time%%per%%]$~ ~$[FPGA%%dsh%%based acceleration 
has been proposed [11%%lst%% 43]%%per%%]$~ ~$[FIST implements an FPGA%%dsh%%based 
network simulator that can simulate mesh networks with signif%%dsh%% 
icant speed up over software simulation [32]%%per%%]$~ ~$[User%%dsh%%level simu%%dsh%% 
lators exist as an alternative to full%%dsh%%system simulation ]f[ ex%%dsh%% 
ploring thousands of cores [7%%lst%% 29]%%per%%]$~ ~$[ZSim exploits parallel simu%%dsh%% 
lation with out%%dsh%%of%%dsh%%order core models [37]%%per%%]$~ ~$[Sampling ]f[ micro%%dsh%% 
architectural simulation has been widely explored [38%%lst%% 39%%lst%% 49] 
]^[ has received renewed attention ]f[ multi%%dsh%%threaded ]^[ 
multi%%dsh%%core processors [1%%lst%% 8]%%per%%]$~ ~$[Zhang et al%%per%% leverage SimPoints 
]f[ network trafﬁc ]s[ that they may speed up simulations ]f[ 
parallel applications [51]%%per%%]$~ ~$[Hornet [33] focuses on parallelizing 
a NoC simulation%%per%%]$~ ~$[Simulators such as Hornet [33]%%lst%% ZSim [37] 
]^[ Slacksim [9] are great tools ]b[ designers should still 
prune the design space to a few candidates prior to using such 
detailed simulators%%scn%% SynFull bridges the gap between existing 
synthetic models ]^[ detailed full%%dsh%%system simulation%%per%%]$~ 
~$[Workload modelling%%per%%]$~ 
~$[Cloning can mimic workload be%%dsh%% 
haviour by creating a reduced representation of the code [3%%lst%% 
21]%%per%%]$~ ~$[Much of this work focuses on cloning cache behaviour%%scn%% 
SynFull can be viewed as creating clones of cache coher%%dsh%% 
ence behaviour to stimulate the network%%per%%]$~ ~$[Creation of syn%%dsh%% 
thetic benchmarks ]f[ multi%%dsh%%threaded applications has been 
explored [17]%%scn%% this work generates instruction streams that exe%%dsh%% 
cute in simulation ]v[ on real hardware%%per%%]$~ ~$[Our work differs as we 
reproduce communication patterns ]^[ coherence behaviour 
while abstracting away the processor ]^[ instruction execution%%per%%]$~ 
~$[MinneSPEC [24] provides reduced input sets that effectively 
match the reference input ]f[ SPEC2000%%scn%% rather than focus on 
input set ]v[ instruction generation%%lst%% we provide a reduced set 
of trafﬁc based on the steady state of a Markov Chain%%per%%]$~ 
~$[Workload Design ]^[ Synthetic Trafﬁc%%per%%]$~ ~$[Synthetic work%%dsh%% 
loads have been a focus of research long before NoCs 
emerged [16%%lst%% 42]%%per%%]$~ ~$[Statistical proﬁles can be used to gener%%dsh%% 
ate synthetic traces ]f[ microarchitectural performance anal%%dsh%% 
ysis [14]%%per%%]$~ ~$[Methods ]f[ synthetic trace generation at the chip 
level have also been proposed [44%%lst%% 45]%%scn%% Soteriou et al%%per%% pro%%dsh%% 
pose a 3%%dsh%%tuple statistical model that leverages self%%dsh%%similarity 
to create bursty synthetic trafﬁc [41]%%per%%]$~ ~$[To our knowledge%%lst%% there 
has been no work done to synthetically generate network traf%%dsh%% 
ﬁc that includes cache coherence%%per%%]$~ ~$[The beneﬁts of such an 
approach allows us to remove the necessity ]f[ full%%dsh%%system 
simulation while still allowing works that exploit coherence 
trafﬁc%%per%%]$~ ~$[In addition%%lst%% most statistical models do ]n[ compare 
generated trafﬁc with full%%dsh%%system simulations%%lst%% ignoring perfor%%dsh%% 
mance metrics such as packet latency%%per%% 
12%%per%%]$~ ~$[Conclusion 
Full%%dsh%%system simulation is a long ]^[ tedious process%%scn%% as a 
result%%lst%% it limits the range of designs that can be explored in a 
tractable amount of time%%per%%]$~ ~$[We propose a novel methodology 
to accelerate NoC simulation%%per%%]$~ ~$[SynFull enables the creation 
of synthetic trafﬁc models that mimic the full range of cache 
coherence behaviour ]^[ the resulting trafﬁc that is injected 
into the network%%per%%]$~ ~$[We accurately capture spatial variation in 
trafﬁc patterns within ]^[ across applications%%per%%]$~ ~$[Furthermore%%lst%% 
burstiness is captured in our model%%per%%]$~ ~$[These two attributes 
lead to a model that produces accurate network trafﬁc%%per%%]$~ ~$[We 
attain an overall accuracy of 10%%per%%5% across 3 conﬁgurations 
]f[ all benchmarks relative to full%%dsh%%system simulation%%per%%]$~ ~$[Fur%%dsh%% 
thermore%%lst%% our technique uses the steady%%dsh%%state behaviour of 
Markov chains to speedup simulation by up to 150×%%per%%]$~ ~$[SynFull 
is a powerful ]^[ robust tool that will enable faster exploration 
of a rich design space in NoCs%%per%%]$~ ~$[SynFull can be downloaded at 
www%%per%%eecg%%per%%toronto%%per%%edu/~enright/downloads%%per%%html 
Acknowledgements 
This research was funded by a gift from Intel%%per%%]$~ ~$[Additional sup%%dsh%% 
port was provided by the Canadian Foundation ]f[ Innovation 
]^[ the Ontario Research Fund%%per%%]$~ ~$[We thank Mike Kishinevsky 
]^[ Umit Ogras ]f[ their invaluable feedback ]^[ insight while 
developing SynFull%%per%%]$~ ~$[We further thank Emily Blem%%lst%% Andreas 
Moshovos%%lst%% Jason Anderson%%lst%% the members of the Enright Jerger 
research group ]^[ the anonymous reviewers ]f[ their thought%%dsh%% 
ful ]^[ detailed feedback on this work%%per%% 
050100150barnesblackscholesbodytrackcholeskyfacesimfftfluidanimatelu_cblu_ncbradiosityradixraytraceswaptionsvolrendwater_nsquaredwater_spatialSpeed UpSyntheticSynthetic_SSTrace%%per%%Dependency References 
[1] E%%per%%]$~ ~$[Ardestani ]^[ J%%per%%]$~ ~$[Renau%%lst%% “ESESC%%cln%% A fast multicore simulator using 
time%%dsh%%based sampling,” in Proc%%per%% of Intl%%per%%]$~ ~$[Symposium on High Perfor%%dsh%% 
mance Computer Architecture%%lst%% 2013%%per%% 
[2] J%%per%%]$~ ~$[H%%per%%]$~ ~$[Bahn ]^[ N%%per%%]$~ ~$[Bagherzadeh%%lst%% “A generic trafﬁc model ]f[ on%%dsh%%chip 
interconnection networks,” Network on Chip Architectures%%lst%% p%%per%% 22%%lst%% 2008%%per%% 
[3] G%%per%%]$~ ~$[Balakrishnan ]^[ Y%%per%%]$~ ~$[Solihin%%lst%% “WEST%%cln%% Cloning data cache behavior 
using stochastic traces,” in Proc%%per%% of Intl%%per%%]$~ ~$[Symposium High Performance 
Computer Architecture%%lst%% 2012%%per%% 
[4] R%%per%%]$~ ~$[Bellman%%lst%% Adaptive Control Processes%%cln%% A Guided Tour%%lst%% ser%%per%%]$~ ~$[A Rand 
Corporation Research Study Series%%per%%]$~ ~$[Princeton University Press%%lst%% 1961%%per%% 
[5] C%%per%%]$~ ~$[Bienia%%lst%% “Benchmarking modern multiprocessors,” Ph%%per%%D%%per%% dissertation%%lst%% 
Princeton University%%lst%% January 2011%%per%% 
[6] T%%per%%]$~ ~$[Cali´nski ]^[ J%%per%%]$~ ~$[Harabasz%%lst%% “A dendrite method ]f[ cluster analysis,” 
Comm in Statistics%%dsh%%theory ]^[ Methods%%lst%% vol%%per%% 3%%lst%% no%%per%% 1%%lst%% pp%%per%% 1–27%%lst%% 1974%%per%% 
[7] T%%per%%]$~ ~$[E%%per%%]$~ ~$[Carlson%%lst%% W%%per%%]$~ ~$[Heirman%%lst%% ]^[ L%%per%%]$~ ~$[Eeckhout%%lst%% “Sniper%%cln%% exploring the 
level of abstraction ]f[ scalable ]^[ accurate parallel multi%%dsh%%core simu%%dsh%% 
lation,” in Proc of Supercomputing (SC)%%lst%% 2011%%lst%% p%%per%% 52%%per%% 
[8] T%%per%%]$~ ~$[E%%per%%]$~ ~$[Carlson%%lst%% W%%per%%]$~ ~$[Heirman%%lst%% ]^[ L%%per%%]$~ ~$[Eeckhout%%lst%% “Sampled simulation of 
multi%%dsh%%threaded applications,” in Intl%%per%%]$~ ~$[Symp%%per%%]$~ ~$[Performance Analysis of 
Systems ]^[ Software%%lst%% Apr%%per%% 2013%%per%% 
[9] J%%per%%]$~ ~$[Chen%%lst%% L%%per%%]$~ ~$[K%%per%%]$~ ~$[Dabbiru%%lst%% D%%per%%]$~ ~$[Wong%%lst%% M%%per%%]$~ ~$[Annavaram%%lst%% ]^[ M%%per%%]$~ ~$[Dubois%%lst%% 
“Adaptive ]^[ speculative slack simulations of CMPs on CMPs,” in 
Proc%%per%% of Intl%%per%%]$~ ~$[Symposium on Microarchitecture%%lst%% 2010%%per%% 
[10] X%%per%%]$~ ~$[E%%per%%]$~ ~$[Chen ]^[ T%%per%%]$~ ~$[M%%per%%]$~ ~$[Aamodt%%lst%% “Hybrid analytical modeling of pend%%dsh%% 
ing cache hits%%lst%% data prefetching ]^[ MSHRs,” ACM Transactions on 
Architecture ]^[ Code Optimization%%lst%% vol%%per%% 8%%lst%% no%%per%% 3%%lst%% October 2011%%per%% 
[11] D%%per%%]$~ ~$[Chiou%%lst%% D%%per%%]$~ ~$[Sunwoo%%lst%% J%%per%%]$~ ~$[Kim%%lst%% N%%per%%]$~ ~$[A%%per%%]$~ ~$[Patil%%lst%% W%%per%%]$~ ~$[Reinhart%%lst%% D%%per%%]$~ ~$[E%%per%%]$~ ~$[Johnson%%lst%% 
J%%per%%]$~ ~$[Keefe%%lst%% ]^[ H%%per%%]$~ ~$[Angepat%%lst%% “FPGA%%dsh%%accelerated simulation technologies 
(fast)%%cln%% Fast%%lst%% full%%dsh%%system%%lst%% cycle%%dsh%%accurate simulators,” in Proc of the 
International Symposium on Microarchitecture%%lst%% 2007%%lst%% pp%%per%% 249–261%%per%% 
[12] W%%per%%]$~ ~$[J%%per%%]$~ ~$[Dally ]^[ B%%per%%]$~ ~$[P%%per%%]$~ ~$[Towles%%lst%% Principles ]^[ practices of interconnec%%dsh%% 
tion networks%%per%%]$~ ~$[Morgan Kaufmann%%lst%% 2003%%per%% 
[13] R%%per%%]$~ ~$[Das%%lst%% O%%per%%]$~ ~$[Mutlu%%lst%% T%%per%%]$~ ~$[Moscibroda%%lst%% ]^[ C%%per%%]$~ ~$[R%%per%%]$~ ~$[Das%%lst%% “Aergia%%cln%% exploting 
packet latency slack in on%%dsh%%chip networks,” in Proc%%per%% of Intl%%per%%]$~ ~$[Symposium 
on Computer Architecture%%lst%% 2010%%per%% 
[14] L%%per%%]$~ ~$[Eeckhout%%lst%% K%%per%%]$~ ~$[De Bosschere%%lst%% ]^[ H%%per%%]$~ ~$[Neefs%%lst%% “Performance analy%%dsh%% 
sis through synthetic trace generation,” in Intl%%per%%]$~ ~$[Symp%%per%%]$~ ~$[Performance 
Analysis of Systems ]^[ Software%%lst%% 2000%%lst%% pp%%per%% 1–6%%per%% 
[15] M%%per%%]$~ ~$[Ferdman%%lst%% P%%per%%]$~ ~$[Lotﬁ%%dsh%%Kamran%%lst%% K%%per%%]$~ ~$[Balet%%lst%% ]^[ B%%per%%]$~ ~$[Falsaﬁ%%lst%% “Cuckoo di%%dsh%% 
rectory%%cln%% A scalable directory ]f[ many%%dsh%%core systems,” in Intl Symp on 
High Performance Computer Architecture%%lst%% 2011%%lst%% pp%%per%% 169–180%%per%% 
[16] D%%per%%]$~ ~$[Ferrari%%lst%% On the foundations of artiﬁcial workload design%%per%%]$~ ~$[ACM%%lst%% 
1984%%lst%% vol%%per%% 12%%lst%% no%%per%% 3%%per%% 
[17] K%%per%%]$~ ~$[Ganesan ]^[ L%%per%%]$~ ~$[John%%lst%% “Automatic generation of miniaturized syn%%dsh%% 
thetic proxies ]f[ target applications to efﬁciently design multicore 
processors,” IEEE Trans%%per%% on Computers%%lst%% vol%%per%% 99%%lst%% 2013%%per%% 
[18] J%%per%%]$~ ~$[Hestness%%lst%% B%%per%%]$~ ~$[Grot%%lst%% ]^[ S%%per%%]$~ ~$[W%%per%%]$~ ~$[Keckler%%lst%% “Netrace%%cln%% dependency%%dsh%%driven 
trace%%dsh%%based network%%dsh%%on%%dsh%%chip simulation,” in Proc%%per%% of the 3rd Interna%%dsh%% 
tional Workshop on Network on Chip Architectures%%lst%% 2010%%lst%% pp%%per%% 31–36%%per%% 
[19] N%%per%%]$~ ~$[Jiang%%lst%% D%%per%%]$~ ~$[U%%per%%]$~ ~$[Becker%%lst%% G%%per%%]$~ ~$[Michelogiannakis%%lst%% J%%per%%]$~ ~$[Balfour%%lst%% B%%per%%]$~ ~$[Towles%%lst%% 
J%%per%%]$~ ~$[Kim%%lst%% ]^[ W%%per%%]$~ ~$[J%%per%%]$~ ~$[Dally%%lst%% “A detailed ]^[ ﬂexible cycle%%dsh%%accurate network%%dsh%% 
on%%dsh%%chip simulator,” in Intl%%per%%]$~ ~$[Symp%%per%%]$~ ~$[Performance Analysis of Systems ]^[ 
Software%%lst%% 2013%%per%% 
[20] Y%%per%%]$~ ~$[Jin%%lst%% E%%per%%]$~ ~$[J%%per%%]$~ ~$[Kim%%lst%% ]^[ T%%per%%]$~ ~$[Pinkston%%lst%% “Communication%%dsh%%aware globally%%dsh%% 
coordinated on%%dsh%%chip networks,” IEEE Transactions on Parallel ]^[ 
Distributed Systems%%lst%% vol%%per%% 23%%lst%% no%%per%% 2%%lst%% pp%%per%% 242 –254%%lst%% Feb%%per%% 2012%%per%% 
[21] A%%per%%]$~ ~$[Joshi%%lst%% L%%per%%]$~ ~$[Eeckhout%%lst%% R%%per%%]$~ ~$[Bell%%lst%% ]^[ L%%per%%]$~ ~$[John%%lst%% “Cloning%%cln%% A technique 
]f[ disseminating proprietary applications at benchmarks,” in Proc%%per%% of 
IEEE Intl Symposium Workload Characterization%%lst%% 2006%%per%% 
[22] T%%per%%]$~ ~$[Karkhanis ]^[ J%%per%%]$~ ~$[E%%per%%]$~ ~$[Smith%%lst%% “A ﬁrst%%dsh%%order superscalar processor 
model,” in Proc of the Intl Symp on Computer Architecture%%lst%% 2004%%per%% 
[23] J%%per%%]$~ ~$[Kim%%lst%% J%%per%%]$~ ~$[Balfour%%lst%% ]^[ W%%per%%]$~ ~$[Dally%%lst%% “Flattened Butterﬂy Topology ]f[ 
On%%dsh%%Chip Networks,” in Proc of the International Symposium on Mi%%dsh%% 
croarchitecture%%lst%% 2007%%lst%% pp%%per%% 172–182%%per%% 
[24] A%%per%%]$~ ~$[KleinOsowski ]^[ D%%per%%]$~ ~$[J%%per%%]$~ ~$[Lilja%%lst%% “MinneSPEC%%cln%% A new SPEC bench%%dsh%% 
mark workload ]f[ simulation%%dsh%%based computer architecture research,” 
Computer Architecture Letters%%lst%% vol%%per%% 1%%lst%% June 2002%%per%% 
[25] T%%per%%]$~ ~$[Krishna%%lst%% L%%per%%%%dsh%%S%%per%%]$~ ~$[Peh%%lst%% B%%per%%]$~ ~$[Beckmann%%lst%% ]^[ S%%per%%]$~ ~$[K%%per%%]$~ ~$[Reinhardt%%lst%% “Towards 
the ideal on%%dsh%%chip fabric ]f[ 1%%dsh%%to%%dsh%%many ]^[ many%%dsh%%to%%dsh%%1 communication,” 
in Proc%%per%% of the International Symposium on Microarchitecture%%lst%% 2011%%per%% 
[26] M%%per%%]$~ ~$[Lodde%%lst%% J%%per%%]$~ ~$[Flich%%lst%% ]^[ M%%per%%]$~ ~$[E%%per%%]$~ ~$[Acacio%%lst%% “Heterogeneous NoC design ]f[ 
efﬁcient broadcast%%dsh%%based coherence protocol support,” in International 
Symposium on Networks on Chip%%lst%% 2012%%per%% 
[27] S%%per%%]$~ ~$[Ma%%lst%% N%%per%%]$~ ~$[Enright Jerger%%lst%% ]^[ Z%%per%%]$~ ~$[Wang%%lst%% “Supporting efﬁcient collec%%dsh%% 
tive communication in NoCs,” in Proc of Intl%%per%%]$~ ~$[Symposium on High 
Performance Computer Architecture%%lst%% 2012%%lst%% pp%%per%% 165–177%%per%% 
[28] M%%per%%]$~ ~$[Martin%%lst%% M%%per%%]$~ ~$[Hill%%lst%% ]^[ D%%per%%]$~ ~$[Sorin%%lst%% “Why on%%dsh%%chip cache coherence is 
here to stay,” Comm of the ACM%%lst%% vol%%per%% 55%%lst%% no%%per%% 7%%lst%% pp%%per%% 78–89%%lst%% 2012%%per%% 
[29] J%%per%%]$~ ~$[Miller%%lst%% H%%per%%]$~ ~$[Kasture%%lst%% G%%per%%]$~ ~$[Kurian%%lst%% C%%per%%]$~ ~$[Gruenwald%%lst%% N%%per%%]$~ ~$[Beckmann%%lst%% C%%per%%]$~ ~$[Celio%%lst%% 
J%%per%%]$~ ~$[Eastep%%lst%% ]^[ A%%per%%]$~ ~$[Agarwal%%lst%% “Graphite%%cln%% A distributed parallel simulator 
]f[ multicores,” in Proc%%per%% of Intl%%per%%]$~ ~$[Symposium on High Performance 
Computer Architecture%%lst%% Jan%%per%% 2010%%lst%% pp%%per%% 1 –12%%per%% 
[30] A%%per%%]$~ ~$[Mishra%%lst%% O%%per%%]$~ ~$[Mutlu%%lst%% ]^[ C%%per%%]$~ ~$[Das%%lst%% “A heterogeneous multiple network%%dsh%% 
on%%dsh%%chip design%%cln%% An application%%dsh%%aware approach,” in Proc%%per%% of the Design 
Automation Conference%%lst%% 2013%%per%% 
[31] N%%per%%]$~ ~$[Neelakantam%%lst%% C%%per%%]$~ ~$[Blundell%%lst%% J%%per%%]$~ ~$[Devietti%%lst%% M%%per%%]$~ ~$[M%%per%%]$~ ~$[Martin%%lst%% ]^[ C%%per%%]$~ ~$[Zilles%%lst%% 
“FeS2%%cln%% A Full%%dsh%%system Execution%%dsh%%driven Simulator ]f[ x86,” Poster 
presented at ASPLOS%%lst%% 2008%%per%% 
[32] M%%per%%]$~ ~$[Papamichael%%lst%% J%%per%%]$~ ~$[Hoe%%lst%% ]^[ O%%per%%]$~ ~$[Mutlu%%lst%% “FIST%%cln%% A fast%%lst%% lightweight%%lst%% 
FPGA%%dsh%%friendly packet latency estimator ]f[ NoC modeling in full%%dsh%% 
system simulations,” in Intl Symp on Networks on Chip%%lst%% 2011%%per%% 
[33] P%%per%%]$~ ~$[Ren%%lst%% M%%per%%]$~ ~$[Lis%%lst%% M%%per%%]$~ ~$[H%%per%%]$~ ~$[Cho%%lst%% K%%per%%]$~ ~$[S%%per%%]$~ ~$[Shim%%lst%% C%%per%%]$~ ~$[W%%per%%]$~ ~$[Fletcher%%lst%% O%%per%%]$~ ~$[Khan%%lst%% 
N%%per%%]$~ ~$[Zheng%%lst%% ]^[ S%%per%%]$~ ~$[Devadas%%lst%% “HORNET%%cln%% A cycle%%dsh%%level multicore simula%%dsh%% 
tor,” IEEE Trans%%per%%]$~ ~$[Comput%%dsh%%Aided Design Integr%%per%%]$~ ~$[Circuits Syst%%per%%%%lst%% vol%%per%% 31%%lst%% 
no%%per%% 6%%lst%% 2012%%per%% 
[34] A%%per%%]$~ ~$[Reynolds%%lst%% G%%per%%]$~ ~$[Richards%%lst%% B%%per%%]$~ ~$[De La Iglesia%%lst%% ]^[ V%%per%%]$~ ~$[Rayward%%dsh%%Smith%%lst%% 
“Clustering rules%%cln%% a comparison of partitioning ]^[ hierarchical cluster%%dsh%% 
ing algorithms,” Journal of Mathematical Modelling ]^[ Algorithms%%lst%% 
vol%%per%% 5%%lst%% no%%per%% 4%%lst%% pp%%per%% 475–504%%lst%% 2006%%per%% 
[35] P%%per%%]$~ ~$[J%%per%%]$~ ~$[Rousseeuw%%lst%% “Silhouettes%%cln%% a graphical aid to the interpretation ]^[ 
validation of cluster analysis,” Journal of computational ]^[ applied 
mathematics%%lst%% vol%%per%% 20%%lst%% pp%%per%% 53–65%%lst%% 1987%%per%% 
[36] S%%per%%]$~ ~$[Salvador ]^[ P%%per%%]$~ ~$[Chan%%lst%% “Determining the number of clusters/segments 
in hierarchical clustering/segmentation algorithms,” in Int%%per%%]$~ ~$[Conf%%per%% on 
Tools with Artiﬁcial Intelligence%%lst%% 2004%%lst%% pp%%per%% 576–584%%per%% 
[37] D%%per%%]$~ ~$[Sanchez ]^[ C%%per%%]$~ ~$[Kozyrakis%%lst%% “ZSim%%cln%% Fast ]^[ accurate microarchitec%%dsh%% 
tural simulation of thousand%%dsh%%core systems,” in Proc%%per%% of the International 
Symposium on Computer Architecture%%lst%% 2013%%per%% 
[38] T%%per%%]$~ ~$[Sherwood%%lst%% E%%per%%]$~ ~$[Perelman%%lst%% ]^[ B%%per%%]$~ ~$[Calder%%lst%% “Basic block distribution 
analysis to ﬁnd periodic behavior ]^[ simulation points in applications,” 
in Parallel Architecture ]^[ Compilation Techniques%%lst%% 2001%%lst%% pp%%per%% 3–14%%per%% 
[39] T%%per%%]$~ ~$[Sherwood%%lst%% E%%per%%]$~ ~$[Perelman%%lst%% G%%per%%]$~ ~$[Hamerly%%lst%% ]^[ B%%per%%]$~ ~$[Calder%%lst%% “Automatically 
characterizing large scale program behavior,” in Proc%%per%% of Architecture 
Support ]f[ Programming Languages ]^[ Operating Systems%%lst%% 2002%%lst%% 
pp%%per%% 45–57%%per%% 
[40] D%%per%%]$~ ~$[J%%per%%]$~ ~$[Sorin%%lst%% M%%per%%]$~ ~$[D%%per%%]$~ ~$[Hill%%lst%% ]^[ D%%per%%]$~ ~$[A%%per%%]$~ ~$[Wood%%lst%% “A primer on memory consis%%dsh%% 
tency ]^[ cache coherence,” Synthesis Lectures on Computer Architec%%dsh%% 
ture%%lst%% vol%%per%% 6%%lst%% no%%per%% 3%%lst%% pp%%per%% 1–212%%lst%% 2011%%per%% 
[41] V%%per%%]$~ ~$[Soteriou%%lst%% H%%per%%]$~ ~$[Wang%%lst%% ]^[ L%%per%%%%dsh%%S%%per%%]$~ ~$[Peh%%lst%% “A statistical trafﬁc model ]f[ 
on%%dsh%%chip interconnection networks,” in MASCOTS%%lst%% 2006%%lst%% pp%%per%% 104–116%%per%% 
[42] K%%per%%]$~ ~$[Sreenivasan ]^[ A%%per%%]$~ ~$[Kleinman%%lst%% “On the construction of a repre%%dsh%% 
sentative synthetic workload,” Comm of the ACM%%lst%% vol%%per%% 17%%lst%% no%%per%% 3%%lst%% pp%%per%% 
127–133%%lst%% 1974%%per%% 
[43] Z%%per%%]$~ ~$[Tan%%lst%% A%%per%%]$~ ~$[Waterman%%lst%% H%%per%%]$~ ~$[Cook%%lst%% S%%per%%]$~ ~$[Bird%%lst%% K%%per%%]$~ ~$[Asanovic%%lst%% ]^[ D%%per%%]$~ ~$[Patterson%%lst%% 
“A case ]f[ FAME%%cln%% FPGA architecture model execution,” in Proc%%per%% of 
Intl Symposium on Computer Architecture%%lst%% 2010%%per%% 
[44] L%%per%%]$~ ~$[Tedesco%%lst%% A%%per%%]$~ ~$[Mello%%lst%% L%%per%%]$~ ~$[Giacomet%%lst%% N%%per%%]$~ ~$[Calazans%%lst%% ]^[ F%%per%%]$~ ~$[Moraes%%lst%% “Ap%%dsh%% 
plication driven trafﬁc modeling ]f[ NoCs,” in Proc of the 19th Symp 
on Integrated Circuits ]^[ Systems Design%%per%%]$~ ~$[ACM%%lst%% 2006%%lst%% pp%%per%% 62–67%%per%% 
[45] G%%per%%]$~ ~$[V%%per%%]$~ ~$[Varatkar ]^[ R%%per%%]$~ ~$[Marculescu%%lst%% “On%%dsh%%chip trafﬁc modeling ]^[ 
synthesis ]f[ MPEG%%dsh%%2 video applications,” IEEE Trans on Very Large 
Scale Integration Systems%%lst%% vol%%per%% 12%%lst%% no%%per%% 1%%lst%% pp%%per%% 108–119%%lst%% 2004%%per%% 
[46] T%%per%%]$~ ~$[Velmurugan ]^[ T%%per%%]$~ ~$[Santhanam%%lst%% “Computational complexity between 
k%%dsh%%means ]^[ k%%dsh%%medoids clustering algorithms ]f[ normal ]^[ uniform 
distributions of data points,” Journal of Computer Science%%lst%% vol%%per%% 6%%lst%% no%%per%% 3%%lst%% 
p%%per%% 363%%lst%% 2010%%per%% 
[47] J%%per%%]$~ ~$[H%%per%%]$~ ~$[Ward Jr%%lst%% “Hierarchical grouping to optimize an objective function,” 
J%%per%%]$~ ~$[Amer%%per%%]$~ ~$[Statist%%per%%]$~ ~$[Assoc%%per%%%%lst%% vol%%per%% 58%%lst%% no%%per%% 301%%lst%% pp%%per%% 236–244%%lst%% 1963%%per%% 
[48] S%%per%%]$~ ~$[C%%per%%]$~ ~$[Woo%%lst%% M%%per%%]$~ ~$[Ohara%%lst%% E%%per%%]$~ ~$[Torrie%%lst%% J%%per%%]$~ ~$[P%%per%%]$~ ~$[Singh%%lst%% ]^[ A%%per%%]$~ ~$[Gupta%%lst%% “The 
SPLASH%%dsh%%2 programs%%cln%% Characterization ]^[ methodological considera%%dsh%% 
tions,” in Intl Symp on Computer Architecture%%lst%% 1995%%lst%% pp%%per%% 24–36%%per%% 
[49] R%%per%%]$~ ~$[E%%per%%]$~ ~$[Wunderlich%%lst%% T%%per%%]$~ ~$[F%%per%%]$~ ~$[Wenisch%%lst%% B%%per%%]$~ ~$[Falsaﬁ%%lst%% ]^[ J%%per%%]$~ ~$[C%%per%%]$~ ~$[Hoe%%lst%% “SMARTS%%cln%% 
accelerating microarchitecture simulation via rigorous statistical sam%%dsh%% 
pling,” in Proc%%per%% of Intl Symposium on Computer Architecture%%lst%% 2003%%per%% 
[50] J%%per%%]$~ ~$[Zebchuk%%lst%% V%%per%%]$~ ~$[Srinivasan%%lst%% M%%per%%]$~ ~$[K%%per%%]$~ ~$[Qureshi%%lst%% ]^[ A%%per%%]$~ ~$[Moshovos%%lst%% “A tagless 
coherence directory,” in Intl Symp on Microarchitecture%%lst%% 2009%%per%% 
[51] Y%%per%%]$~ ~$[Zhang%%lst%% B%%per%%]$~ ~$[Ozisikyilmaz%%lst%% G%%per%%]$~ ~$[Memik%%lst%% J%%per%%]$~ ~$[Kim%%lst%% ]^[ A%%per%%]$~ ~$[Choudhary%%lst%% 
“Analyzing the impact of on%%dsh%%chip network trafﬁc on program phases ]f[ 
CMPs,” in Intl Symp on Performance Analysis of Systems ]^[ Software%%lst%% 
2009%%lst%% pp%%per%% 218–226%%per%% 
