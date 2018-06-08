SynFull: Synthetic Traffic Models Capturing Cache Coherent Behaviour 
Mario Badr, Natalie Enright Jerger 
Edward S. Rogers Sr. Department of Electrical ]^[ Computer Engineering 
University of Toronto 
mario.badr@mail.utoronto.ca, enright@ece.utoronto.ca 
Abstract 
1. Introduction 
With the shift to multi- ]^[ many-core processors, architects 
now face a larger design space ]^[ more complex trade-offs 
in processor design. The design of the network as a potential 
power ]^[ performance bottleneck is becoming a critical concern. In the power-constrained many-core landscape, NoCs 
must be carefully designed to meet communication bandwidth 
requirements, deliver packets with low latency, ]^[ fit within 
tight power envelopes that are shared across cores, caches ]^[ 
interconnects. To do this well, the designer must understand 
the traffic patterns ]^[ temporal behaviour of applications the 
NoC must support. There are a large number of parameters 
in the NoC design space that can be tuned to deliver the required performance within a given cost/power envelope, such 
as topology, routing algorithm, flow control ]^[ router microarchitecture. These knobs are most commonly explored 
through software simulation. 
There are a number of simulation methodologies available 
to NoC designers, however each comes with speed/fidelity 
tradeoffs [18]. Full-system simulators model each hardware 
component of the overall system ]^[ can run full applications 
]^[ operating systems. As a result, these simulators provide 
the highest degree of accuracy, ]b[ at the expense of long 
simulation times. In contrast, a designer can use traditional 
c 2014 IEEE 
978-1-4799-4394-4/14/$31.00 
Micro-­‐Level  Phase  Clustering   
Number  of  Injected  Packets   
Modern ]^[ future many-core systems represent complex architectures. The communication fabrics of these large systems 
heavily influence their performance ]^[ power consumption. 
Current simulation methodologies ]f[ evaluating networkson-chip (NoCs) are ]n[ keeping pace with the increased complexity of our systems; architects often want to explore many 
different design knobs quickly. Methodologies that capture 
workload trends with faster simulation times are highly beneficial at early stages of architectural exploration. We propose SynFull, a synthetic traffic generation methodology that 
captures both application ]^[ cache coherence behaviour to 
rapidly evaluate NoCs. SynFull allows designers to quickly 
indulge in detailed performance simulations without the cost 
of long-running full-system simulation. By capturing a full 
range of application ]^[ coherence behaviour, architects can 
avoid the over ]v[ underdesign of the network as may occur 
when using traditional synthetic traffic patterns such as uniform random. SynFull has errors as low as 0.3% ]^[ provides 
50× speedup on average over full-system simulation. 
Read   
Write   
Replace   
Inv   
Macro-­‐Level  Phase  Clustering   
Time  (hundreds  of  cycles)   
Time  (millions  of  cycles)   
• Cluster  based  on:     
•  Message  Types   
•  SpaDal  paEern  (src-­‐dst  ﬂows)   
  
Macro-­‐Level     
Markov  Chain   
Micro-­‐Level   
Markov  Chain   
Figure 1: High level view of SynFull 
synthetic traffic patterns to quickly stress their NoC design 
]^[ reveal bottlenecks. However, these traffic patterns do ]n[ 
realistically represent the application space ]s[ the results are 
unlikely to be representative of real workloads. Therefore, they 
are unlikely to produce a properly provisioned network. In 
this work, we introduce a new approach that strikes a balance 
between these tradeoffs, providing a fast, realistic simulation 
methodology ]f[ NoC designers. 
Realistic traffic patterns will increase the accuracy of NoC 
simulations. Beyond that, realistic traffic also provides optimization opportunities that do ]n[ exist in traditional synthetic 
traffic patterns. Many recent NoC proposals have exploited 
particular application [13, 30] ]v[ coherence behaviour [25, 26] 
to provide a more efficient, higher-performing NoC design. As 
research continues to push the scalability of cache coherence 
protocols [15, 28, 50], shared memory CMPs continue to be 
widespread. As a result, we focus on this class of systems. 
SynFull Overview ]^[ Contributions. SynFull provides a 
novel technique ]f[ modelling real application traffic without 
the need ]f[ expensive, detailed simulation of all levels of the 
system. We abstract away cores ]^[ caches to focus on the network, ]^[ provide application-level insight to NoC designers, 
who in turn can produce more optimized designs. Through our 
analysis, we determine the key traffic attributes that a cachecoherent application-driven traffic model must capture including coherence-based message dependences (Sec. 4), application phase behaviour (Sec. 5) ]^[ injection process (Sec. 6). 
Fig. 1 shows a high-level overview of our approach. We observe long running (macro-)phases within applications as well 
as fine-grained variation within macro-phases (micro-phases), 
]^[ group them through clustering. Within these clusters, we 
2. The Case ]f[ Coherence Traffic 
Before describing SynFull in detail, we motivate the need ]f[ 
a new class of synthetic traffic patterns. Traffic patterns such 
as uniform random, permutation, tornado, etc. are widely used 
in NoC research. Many of these are based on the communication pattern of specific applications. For example, transpose 
traffic is based on a matrix transpose application, ]^[ the 
shuffle permutation is derived from Fast-Fourier Transforms 
(FFTs) [2, 12]. However, these synthetic traffic patterns are 
]n[ representative of the wide range of applications that run on 
current ]^[ future CMPs. Even if these traffic patterns were 
representative, the configuration of a cache-coherent system 
can mask ]v[ destroy the inherent communication pattern of the 
original algorithm due to indirections ]^[ control messages. 
The arrangement of cores, caches, directories, ]^[ memory 
controllers directly influences the flow of communication ]f[ 
an application. Compare a synthetic shuffle pattern with the 
FFT benchmark from SPLASH-2 [48]. The shuffle pattern 
is a bit permutation where the destination bits are calculated 
via the function di = si−1 mod b where b is the number of bits 
required to represent the nodes of the network [12]. FFT is run 
in full-system simulation1 while shuffle is run in network-only 
simulation. Fig. 2 shows the number of packets sent from a 
source to a destination2 . In Fig. 2b, we see notable destination 
hot spots at nodes 0, 2, ]^[ 5 ]^[ source hot spots at nodes 
0 ]^[ 5. However, Fig. 2a shows hot spots only ]f[ specific 
source-destination pairs. 
The best NoC design ]f[ the traffic in Fig. 2a is unlikely to 
be the best NoC ]f[ the traffic in Fig. 2b. For example, we 
can design a ring network ]f[ Fig. 2a, ]^[ map the nodes to 
minimize hop count of shuffle on the network. The average 
injection rate of FFT is used ]f[ shuffle. Doing ]s[ yields 
∼10% improvement in average packet latency over a mesh 
1 Configuration 
details can be found in Sec. 7. 
absolute number of packets in each figure is unimportant in this 
comparison as we focus on source-destination traffic pairs. 
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
examine the break down of message types dictated by the coherence protocol. These two steps drive a hierarchical Markov 
Chain that is used to reproduce the traffic behaviour. Our 
proposed model is independent of the network configuration 
]^[ can be applied to a wide range of NoC configurations to 
enable rapid, accurate design space exploration. 
To demonstrate the accuracy ]^[ utility of our model, we apply our methodology to a variety of PARSEC [5] ]^[ SPLASH2 [48] benchmarks. A single full-system simulation run of 
each benchmark is required to create the model. We then 
use our models to synthetically generate traffic ]^[ compare NoC performance to full-system simulation. Finally, 
we demonstrate significant speedup ]f[ our methodology over 
full-system simulation; this allows ]f[ rapid NoC design space 
exploration. In essence, SynFull strives to replace full system simulation ]f[ fast, ]y[ accurate NoC evaluation through 
richer synthetic traffic patterns. 
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
Figure 2: Spatial behaviour ]f[ synthetic vs application traffic 
(Network A in Sec. 7) with the naive mapping (baseline) in 
Fig. 2a. However, using the same ring network in a fullsystem simulation of the FFT benchmark results in an average 
packet latency that is over three times worse than the baseline. 
Clearly, synthetic traffic patterns are ]n[ representative of 
the spatial behaviour exhibited by applications on a shared 
memory architecture. 
The sharp contrast in Fig. 2 is due to coherence transactions 
needing to visit several nodes in a shared memory architecture 
before completing. For example, a write request first visits a 
directory to receive ownership of a cache line. The directory 
forwards requests to the core caching the data, ]^[ also invalidates caches who are sharing the data. Invalidated caches 
must send acknowledgements – this domino effect can significantly change an application’s spatial behaviour ]^[ should 
be correctly modelled ]f[ realistic traffic generation. 
Differentiating between the types of packets visiting nodes 
is important when generating realistic traffic. Most synthetic 
workloads split traffic into two categories: small control packets (requests) ]^[ large data packets (responses). However, 
there are many different packet types in a coherence protocol 
]f[ both requests ]^[ responses. By lumping these packets 
into two categories, designers cannot explore methods that 
exploit cache coherence ]f[ better performance. For example, 
techniques exist to reduce traffic caused by acknowledgement 
packets [27]. Similar research insight is only possible when 
detailed packet information is available in simulation. 
Finally, the traffic imposed by an application is time-varying. 
Applications exhibit phase behaviour [38]; spatial patterns are 
likely to change over time. Static traffic patterns ]^[ injection 
rates are ]n[ an adequate representation of real application 
traffic. The behaviour of cache coherence traffic changes with 
time ]^[ can have varying effects on NoC performance. For 
example, phases that exhibit high data exchange will likely 
result in several invalidation packets being broadcast into the 
NoC. It is important to capture these variations in traffic to 
reveal whether ]v[ ]n[ an NoC has been correctly provisioned. 
3. SynFull Traffic Modelling Overview 
Our methodology focuses only on the design of the NoC which 
has become a first-class component of many-core architectures. 
Thus, we abstract away the cores, caches, directories ]^[ memory controllers. Essentially, the performance characteristics of 
these elements are fixed ]f[ the purposes of our study. However, SynFull can be combined with analytical ]^[ abstract 
models [10, 22] of these components to explore an even richer 
design space with fast-turnaround time. Developing the network models is a critical first step; combining our model with 
other models is left as future work. To model application 
traffic, we focus on answering four key questions: 
When to send a packet? In shared memory systems, packets 
are injected from the application side on a cache miss. This 
packet initiates a coherence transaction to retrieve its data. 
However, some packets are injected reactively. For example, 
a data packet would only be sent in response to a request. 
Who is sending the packet? Not all nodes inject traffic 
uniformly ]s[ we must determine which node should inject that 
packet. For reactive packets, the answer is clear; the node 
reacting to the request is the source. However, ]f[ initiating 
packets, a model is required. 
Why are they sending the packet? Traditional synthetic 
workloads do ]n[ concern themselves with why. For a cache 
coherence traffic generator, the question is very important. The 
why helps determine the type of packet being sent, ]^[ allows 
us to classify packets according to the coherence protocol. 
Where is the packet going? The packet’s destination is 
a function of both its source ]^[ the type of packet being 
injected (the answers to the previous two questions). Each 
source node may exhibit different sharing patterns with other 
nodes, ]^[ those sharing patterns may be different depending 
on the coherence message being sent. 
These 4 questions are answered in Sec. 4. However, because applications exhibit phase behaviour [38], we must also 
capture how the answers change over time. We handle this 
by dividing application traffic into time intervals, ]^[ grouping together time intervals that behave similarly. Then, we 
determine answers ]f[ the When, Who, Why ]^[ Where questions ]f[ each group (phase). We discuss our methodology 
]f[ grouping intervals in Sec. 5. To complete our SynFull 
methodology we need a way to transition between phases. For 
this we use a Markov Chain, where we can determine the probability of transitioning from one phase to another based on the 
phase we are currently in. The Markov Chain model, along 
with answers to the above 4 questions, allow us to recreate the 
injection process associated with an application (Sec. 6). 
4. Modelling Cache Coherence Traffic 
Focusing on the network only ]^[ ]n[ modelling application 
behaviour at the instruction level has the benefit of keeping 
our methodology generic ]^[ simple – we can apply SynFull 
to any application’s traffic data in a straightforward manner. 
Although we abstract away other system components, ]n[ all 
network messages are equal ]s[ it is important to capture different message types injected by the coherence protocol. Message 
types are a function of the cache coherence protocol, ]b[ most 
protocols are conceptually similar in how they behave. A cache 
Table 1: 1-to-1 Request-Response mappings. $ signifies cache. 
Message Received 
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
Writeback Ack. 
Data 
Ack. 
Unblock 
Destination 
Original Requestor ($) 
Original Requestor ($) 
Original Requestor ($) 
Directory 
miss invokes a coherence transaction from the local coherence 
controller in the form of a read ]v[ write which then results 
in a series of requests ]^[ responses [40]. In this section, we 
explore modelling packets that initiate a coherence transaction 
separately from packets that react to received messages. 
4.1. Initiating Packets 
To model when to send initiating messages, we collect the 
number of packets (P) injected into the network ]f[ a given 
interval spanning C cycles. Then, when generating synthetic 
traffic, we simply inject P packets uniformly over C cycles3 . 
To answer who injects a packet, we observe the distribution 
of packets injected across all network nodes. This distribution 
gives us the probability a particular node will inject a packet 
]^[ can capture spatial behaviour of applications [41, 44]. The 
answer to where a packet is going can be modelled using a 
similar method with relative probabilities. Given the source 
(S) of the packet, we determine its destination (D) using: 
P(D | S) = 
Number o f packets sent to D f rom S 
Number o f packets sent by S 
(1) 
Finally, to answer why a packet is injected we split P into 
Pr (total number of reads) ]^[ Pw (total number of writes). 
The distinction between reads ]^[ writes is necessary because 
they result in different reactions – writes lead to invalidations 
that are broadcast into the NoC; these can significantly impact 
NoC performance. 
4.2. Reactive Packets 
Most responses that maintain cache coherence have a simple 
one-to-one mapping with requests, such as an acknowledgement responding to an invalidation request. Upon receiving a 
particular message, the protocol reacts with a predetermined 
response. Table 1 shows a simplified view of the reactive aspect of cache coherence. Most reactions are straightforward ]b[ 
some requests lead to multiple different responses, particularly: 
Forwarded Requests: If the data is already cached on chip, 
the coherence protocol forwards the request to the cache containing the data. Otherwise, the request goes off chip to memory. 
Invalidates: When a write request arrives ]f[ a cache block 
shared by multiple readers, those readers must be invalidated. 
Next, we explore these two situations ]^[ how to model them 
]s[ that we may realistically generate cache coherence traffic. 
4.2.1. Forwarding vs. Off-Chip When a read ]v[ write request 
arrives at a directory, the requested block may be present in 
another core’s cache. In this case, the request is forwarded to 
3 We 
also explored injecting packets using bernoulli ]^[ exponential distributions. However, the differences in performance are negligible. 
1.00 
0.75 
0.50 
0.25 
0.00 
0.4 
variable 
Writes 
Reads 
0.2 
0.0 
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
Figure 3: The probability a read ]v[ write request is forwarded 
the cache holding the data. Otherwise, an off-chip memory 
request occurs. Fig. 3 shows the fraction of forwarded read 
]^[ write requests broken down by directory ]f[ SPLASH-2’s 
FFT benchmark4 . The probability of forwarding a read ]v[ 
write changes according to which directory is being requested. 
Therefore, we model the distribution of forwarding probabilities on a per-directory basis. In Sec. 4.2.2, we show that this 
has an affect on invalidations, ]^[ different directories may 
act as hot spots in certain applications. We also note that the 
probabilities of forwarding a read ]v[ a write request are ]n[ 
equal. This distinction is critical as write requests will trigger 
invalidations to sharers which can represent a substantial burst 
of network traffic ]f[ widely-shared data. 
4.2.2. Invalidates On a write miss, there is a chance that the 
cache block being requested has multiple sharers; the number 
of sharers determines the number of invalidates that will be 
multicast into the NoC. Fig. 4 shows the per-directory probability of sending 0 to 15 invalidates in a 16-node network 
]f[ FFT. Some directories (1, 3, 11, ]^[ 12) exhibit bimodal 
behaviour; they invalidate 0 ]v[ n − 1 sharers. Referring back 
to Fig. 3, we can see that these directories behave similarly in 
their forwarding probabilities. Other directories resemble an 
exponential distribution, with 0 invalidates having the highest 
probability. Invalidates can significantly impact network performance; applications that share ]^[ exchange data at a high 
rate will flood the network with many invalidates ]^[ strain 
its resources. We model the distribution of the number of 
invalidates on a per-directory basis to ensure our synthetically 
generated traffic has similar affects on NoC performance. 
4.3. Summary 
This section showed how we model cache coherence traffic by 
reacting to messages injected into the NoC. Read ]^[ write 
requests are forwarded with some probability to other nodes in 
the NoC, ]^[ invalidates can be sent out with some probability 
given the directory a write request has arrived at. To react to 
messages, read ]^[ write requests must first be injected into 
the NoC. Static injection rates are ]n[ sufficient to achieve high 
accuracy – we must also consider application phase behaviour. 
4 Our 
system configuration assumes 1 slice of the directory is located at 
each tile in a 16-core CMP. Addresses are interleaved across directories. 
Probability 
Probability to Forward a Request 
0.6 
1.00 
0.75 
0.50 
0.25 
0.00 
1.00 
0.75 
0.50 
0.25 
0.00 
1.00 
0.75 
0.50 
0.25 
0.00 
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
Figure 4: Number of sharers per write at different directories 
We explore phase behaviour in Sec. 5 ]^[ propose a model 
that captures ]^[ applies phases to generated network traffic. 
5. Traffic Phases 
Applications are well-known to exhibit phase behaviour [38]. 
Phases can have a significant impact on the instructions 
per cycle, miss rates, ]^[ prediction rates of various microarchitectures. NoC traffic is also affected by application 
phases [20, 51]; our methodology needs to capture this phase 
behaviour if it intends to realistically generate synthetic traffic. 
We propose examining traffic at two granularities: macro 
(millions ]v[ billions of cycles) ]^[ micro (thousands to hundreds of thousands of cycles). At the macro level, we observe 
noticeable differences in the behaviour of an application as it 
moves from one phase to another (perhaps due to a barrier ]v[ 
the end of an outer-loop). At the micro-level we are more likely 
to capture short bursts of network activity. Each level is divided 
into fixed-sized, successive time intervals measured in cycles. 
Dividing traffic into intervals allows us to analyze network 
traffic at a fine granularity. Considering the entire application 
at once captures average behaviour; reproducing the average 
behaviour will negatively impact the design ]^[ evaluation of 
NoCs. For example, smoothing out periods of high traffic will 
result in an NoC that becomes saturated during key application 
phases. Alternatively, bringing low periods of communication 
up to an average will cause a designer to miss potential opportunities ]f[ power gating ]v[ DVFS in the NoC. Intervals allow 
us to capture fine-grain changes in traffic. However, selecting 
a single (random) interval is ]n[ necessarily characteristic of 
the entire simulation. Yet considering all intervals will be 
difficult to model with a Markov Chain (Sec. 6) ]^[ will yield 
little simulation speedup. Therefore, we group intervals that 
behave similarly into different traffic phases via clustering. 
This section explores various alternative approaches to identifying similar behaviour between intervals through feature 
vectors (Sec. 5.1). Each vector contains elements (features) 
that measure some aspect of traffic in that interval (e.g., the 
injection rate). Vectors are then compared by calculating the 
distance between them; a clustering algorithm creates groups 
of intervals whose vectors are close together (Sec. 5.2). 
5.1. Feature Vector Design 
Defining similarity between intervals is non-trivial. One has to 
consider the elements of the feature vector, its dimensionality 
]^[ scalability. In this section, we present a subset of potential 
feature vectors that can be used to cluster intervals into traffic 
phases; this discussion is ]n[ meant to be exhaustive ]b[ rather 
captures a range of traffic metrics ]^[ feature vector scalability. 
It may be tempting to use feature vectors with many elements. There is a trade-off between capturing a range of 
communication attributes ]^[ the effectiveness ]^[ ease of 
clustering. Large feature vectors can suffer from the curse of 
dimensionality where the data available to populate the vector 
is insufficient ]f[ the size of the vector [4]. In addition, having a large number of observations puts additional strain on 
the clustering algorithm; 
some clustering algorithms have a 
 
complexity of O n3 (where n is the number of vectors). We 
explore two different approaches to construct feature vectors: 
1. Injection Rate: number of packets injected in an interval 
2. Injection Flows: number of packets injected between 
source-destination pairs per interval 
We also explored feature vectors that consider cache coherence message types. In this way, intervals with dominant read 
and/or write phases are clustered together. However, such an 
approach does ]n[ capture the spatial injection distribution of 
packets. As a result, intervals with similar hot spots are ]n[ 
clustered together. As we show in Sec. 8, this information is 
crucial if we expect to synthetically generate realistic traffic. 
5.1.1. Injection Rate Injection rate can be captured in different ways. Considering the injection rate of all nodes (Total 
Injection) gives simple, one-dimensional feature vectors that 
allow us to differentiate between intervals that are experiencing high, medium ]v[ low levels of communication. The 
benefit of this vector is that it is easy to create. Calculating 
the distance between vectors ]^[ applying clustering is fast 
because it is one-dimensional. Yet Total Injection may be 
too simple; the total number of packets does ]n[ reveal any 
spatial characteristics of the traffic. Even when two vectors 
have similar magnitudes, their respective intervals could exhibit different spatial behaviour, such as hot spots. Using the 
injection rate of individual nodes alleviates some of these issues. An N-dimensional vector with per-node injection rates 
(Node Injection) captures some spatial characteristics of our 
applications. 
5.1.2. Injection Flows Node Injection helps identify injecting 
hotspots – that is, nodes that send a lot of packets. But hot 
spots can also exist at a destination – that is, nodes that receive 
a lot of packets. To capture the relationship between sent 
]^[ received messages, we can use flows [20]. A flow is the 
injection rate between a source ]^[ a destination. For an Nnode network, there are N 2 source-destination flow pairs. We 
construct a feature vector (Per-Node Flow) that captures this 
information. This vector scales quadratically with the number 
of nodes. Sufficient data has to be present in the traffic ]v[ else 
Table 2: Different traffic feature vectors ]f[ an N -node network 
Feature Vector 
Total Injection 
Node Injection 
Row-Column 
Flow 
Per-Node 
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
the feature vector falls prey to the curse of dimensionality. 
We can simplify Per-Node Flow feature vectors by aggregating nodes into rows ]^[ columns (Row-Column Flow). Each 
element of the vector corresponds to the number of packets 
sent by a row of nodes to a column of nodes. We use the words 
row ]^[ column ]f[ simplicity – the actual mapping of nodes 
in the network does ]n[ have to be grid-like. 
5.1.3. Summary We introduce four potential feature vectors 
to classify traffic phases. These are summarized in Table 2. 
Each vector has its own pros ]^[ cons, ]^[ some vectors are 
better suited ]f[ either a macro ]v[ micro scale. We explore the 
impact of different feature vectors in Sec. 8. 
5.2. Clustering Methods 
Feature vectors are used to cluster intervals into traffic phases. 
We calculate the distance between vectors ]^[ then apply 
a clustering method. Distance calculations are affected by 
the dimensionality of the vector (i.e. number of features); 
therefore, feature vectors that scale poorly (Table 2) lead to 
high overhead ]^[ modelling time. In this section, we look 
at two clustering approaches: partitional ]^[ hierarchical ]^[ 
weigh their benefits. Ultimately, we use different approaches 
at different granularities, as we discuss in Sec. 6. 
5.2.1. Partitional Clustering Partitional clustering designates a feature vector that is central to each group; we use 
Euclidean distance as a measure of closeness between vectors. Although k-means is the most popular, we use k-medoids 
(specifically, Partitioning-Around-Medoids ]v[ PAM). PAM 
performs a pairwise comparison of the distances between a 
vector (V ) ]^[ every other vector in the group. Although 
slower than k-means, PAM is able to provide the central vector 
(medoid) ]f[ each group. This allows us to select the interval 
that is most representative of its traffic phase. Partitional clustering is an NP-hard problem, however heuristics are available 
that keep its complexity ]^[ speed low [46]. 
Partitional clustering requires the number of traffic phases 
(or clusters k) to be an input to the algorithm. Formal methods exist [34] to determine an optimum k value, though ]n[ 
all methodologies agree on the same k. Two common methods that estimate an optimal k are Average Silhouette Width 
(ASW) [35] ]^[ the Calinksi-Harabasz (CH) index [6]. We 
explore the effects of k using these two methods in Sec. 8.1. 
5.2.2. Hierarchical Clustering Hierarchical clustering is an 
efficient, deterministic approach to grouping traffic phases. 
However, it has a complexity of O(n3 ) (where n is the number 
of vectors), making it better suited to clustering smaller data 
sets. Hierarchical clustering creates a tree (a dendogram) of all 
feature vectors, linking vectors together based on distance ]^[ 
a linkage criterion5 . The algorithm iteratively combines the 
two clusters that have the least impact on the sum of squares 
error. Different levels of the tree indicate which vectors belong 
to which clusters; the tree can be cut at a user-defined level 
to provide the desired number of traffic phases. We use the 
L-method [36] to determine the appropriate number of clusters 
in hierarchical clustering. 
6. Injection Process 
In Sec. 5, we introduce macro- ]^[ micro-level granularities 
]f[ intervals. Each macro-interval is further broken down into 
micro-intervals. Then, we group intervals into traffic phases 
using clustering. Next, we demonstrate how to construct a 
hierarchical Markov Chain ]f[ the macro- ]^[ micro-levels. 
Fig. 1 shows an overview of our approach, where macro-scale 
traffic has been decomposed into micro-scale intervals, ]^[ 
two Markov Chains govern the transitions between phases. 
Markov Chains are typically used to model stochastic processes. A Markov Chain is made up of a number of states, 
with transition probabilities defined ]f[ moving from one state 
to another. In our case, states correspond to macro- ]v[ microphases, ]^[ transitioning from one phase to another allows 
us to accurately replicate the time-varying behaviour of an 
application’s injection process. 
Macro Scale Given long application runtimes, the number 
of intervals at the macro level ranges from hundreds to thousands. This variability ]^[ the resulting large number of vectors means hierarchical clustering is ]n[ a good fit because 
of its O(n3 ) complexity; therefore we use PAM at the macro 
scale. PAM gives us the medoid of each traffic phase – that is, 
a single macro interval that best represents the macro phase. 
Having a single macro-interval ]f[ each phase significantly reduces the amount of data modelled. Once we have the medoid 
]f[ each traffic phase, we pass them to our micro model ]^[ 
analyze the traffic at a finer granularity. We create a micro 
model ]f[ each macro-interval selected. 
Micro Scale The micro scale looks at only a small subset 
of the overall traffic. Dividing a macro-interval into microintervals allows us to capture the injection process at a finer 
granularity; this is necessary to capture bursty fluctuations in 
traffic that can greatly influence network performance. Unlike 
at the macro-level, we are ]n[ looking ]f[ a single representative interval per traffic phase. A single representative interval 
does ]n[ contain enough data to form an accurate micro-level 
model. Since we do ]n[ need a medoid, we use hierarchical 
clustering at the micro scale. 
Hierarchy We model multiple Markov Chains ]f[ our hierarchy of macro- ]^[ micro-levels. One Markov Chain governs 
transitioning between macro-phases. For each macro-phase 
we define another Markov Chain ]f[ its micro-phases. Fig. 1 
shows the two level hierarchy with two macro-phases ]^[ 
5 We 
use minimum-variance based on Ward’s method [47]. 
Processor 
L1 Caches 
L2 Caches 
Coherence Protocol 
16 Out-of-Order cores, 4-wide, 80-instruction ROB 
16 Private, 4-way, 32 KB 
16 Private, 8-way, 512 KB 
Directory-Based MOESI (blocking) 
Network 
Topology 
Channel Width 
Virtual Channels 
Routing Alg. 
Buffer Depth 
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
Adaptive XY-YX 
UGAL 
8 flits 
4 stages 
Table 3: Simulation configurations 
three micro-phases. An important property of Markov Chains 
is that they can reach equilibrium (π). That is, after infinite 
time, the Markov Chain converges to a steady state where the 
probability of being in a given state is constant. We exploit 
this property to achieve significant speedups over full-system 
simulation in Sec. 10. 
7. Methodology 
We evaluate SynFull using a 16-core CMP with the configuration given in Table 3. Each node contains a core, private L1 
cache, private L2 cache ]^[ a directory. Data is collected using 
FeS2, a full-system simulator [31] integrated with Booksim, a 
cycle-accurate network simulator [19]. We run PARSEC [5] 
]^[ SPLASH-2 [48] benchmarks with the sim-small input 
set. All benchmarks are run to completion with the exception 
of facesim, which was capped at three hundred million cycles. 
To generate the SynFull models, we collect traces from fullsystem simulation assuming an ideal fully-connected NoC 
with a fixed one cycle latency. Using an ideal network ensures 
that our model does ]n[ contain artifacts of the network, ]^[ 
therefore cannot be influenced by a certain topology, routing 
algorithm, etc. Thus a single model can be used to simulate 
a wide range of NoC configurations. We compare NoC performance of our synthetically generated network traffic with 
full-system simulation ]^[ trace-based simulation using stateof-the-art packet dependency tracking based on Netrace [18]. 
To demonstrate that our methodology is network agnostic, we compare against three different NoC configurations 
(Table 3). That is, we can apply SynFull to different NoC 
configurations ]^[ capture similar behaviour to what would 
have been exhibited by full-system simulation, regardless of 
the network’s configuration. 
8. SynFull Exploration 
Our proposed SynFull traffic model has a number of parameters that can be changed. Initially, it is ]n[ obvious ]v[ intuitive 
what the values of these parameters should be to accurately 
model traffic. In this section, we explore these model parameters ]^[ discuss their affects on the generated network 
traffic, NoC performance ]^[ model accuracy. Specifically, 
we: (i) Evaluate how the number of macro phases affect NoC 
performance; (ii) Demonstrate how to adjust the amount of 
congestion at the micro level with different feature vectors; 
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
Table 4: Number of macro phases ]f[ different formal methods 
]^[ feature vectors 
Average.Packet.Latency 
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
traffic generated by SynFull. 
We look at the effects of different parameters quantitatively 
on three benchmarks: Lu (contiguous), Raytrace, ]^[ Swaptions. The domains of these benchmarks are different; Lu is 
a high-performance computing application that relies heavily on barriers as its synchronization primitive, Raytrace is a 
graphics-based benchmark that relies heavily on locks, ]^[ 
Swaptions deals with financial analysis ]^[ is ]n[ very communication intensive. Once we have explored the parameters 
across these three benchmarks, we make recommendations 
to achieve NoC performance estimates that are accurate with 
respect to full-system simulation results. 
8.1. Macro Phases 
Macro phases constitute the largest granularity ]f[ our model – 
a macro interval can be several hundred thousand cycles long. 
The number of macro phases we need to model is a function of 
application behaviour. In order to determine this number, we 
apply formal methods (CH ]^[ ASW) to a particular clustering 
of macro-intervals. Clustering is also affected by the feature 
vectors used. The number of macro phases used by SynFull 
affects the variety of traffic exhibited at the macro granularity. 
We explore two feature vectors at the macro-level: Total 
Injection (TI) ]^[ Node Injection (NI). Our goal is to reduce 
the clustering overhead at the macro level because the number 
of observations can be quite large ]^[ varies by benchmark – 
TI ]^[ NI require the least processing time of all the proposed 
feature vectors. Using these two feature vectors, we apply CH 
]^[ ASW to the clustering to determine the optimal number of 
macro-phases. We assume macro-intervals of 500,000 cycles 
]^[ micro-intervals of 200 cycles, ]^[ the NI feature vector 
at the micro level. We create our model from full-system 
simulation with an ideal network, ]^[ then apply the traffic to 
Network A. We compare the resulting average packet latency 
to full-system simulation (FSYS); this metric includes the time 
a node is queued waiting to be injected into the network. 
Table 4 shows the number of phases suggested by the ASW 
]^[ CH formal methods ]f[ the NI ]^[ TI feature vectors, ]^[ 
Fig. 5 shows the results of using those parameters. There is 
little variation in average packet latency when tweaking macro 
parameters ]f[ Lu ]^[ Swaptions. Raytrace, however, shows 
more accuracy using the CH index, which recommends 7 ]v[ 8 
macro phases with TI ]^[ NI, respectively. Raytrace traffic has 
several macro intervals that deviate from the norm, likely due 
to the several thousand locks it uses [48], ]^[ therefore should 
be modelled with more macro phases. The locking in Raytrace 
results in an unstructured communication pattern with high 
raytrace 
swaptions 
Figure 5: Macro-level sweeping of feature vectors & number 
of phases (Table 4). 
variation. Too few macro phases would force interval outliers 
into phases where they do ]n[ belong. 
The use of barriers in Lu results in distinct periods of low 
]^[ high communication; when all threads reach a barrier there 
is a sudden burst of packets into the NoC. This communication 
pattern maps well to 2 distinct macro phases. CH+TI has 10 
macro phases which results in the highest error ]f[ SynFull. 
Too many phases can lead to poor clustering quality because 
some phases will have very few, ]v[ even a single interval, associated with them. These phases are superfluous ]^[ negatively 
impact the Markov Chain because they will be rarely visited. 
The single dimension of TI makes the clustering sensitive 
to fluctuations between macro intervals; that is, two highcommunication macro-intervals may ]n[ be clustered together 
due to a small difference in total packets. This sensitivity is 
alleviated by using more dimensions, ]s[ that deviations in one 
element are neutralized by similarity in others. This helps 
prevent the case where we have too many phases ]f[ macro 
intervals; thus, we recommend NI ]f[ macro clustering ]^[ 
CH ]f[ the number of macro phases. 
8.2. Congestion at the Micro Level 
Sec. 8.1 uses Node Injection (NI) as the feature vector at 
the micro level. NI clusters micro intervals according to the 
distribution of injected packets across nodes. While this will 
cluster hot spots at source nodes, there are situations where hot 
spots exist between source-destination pairs. For example, a 
many-to-one communication pattern is ]n[ accurately captured 
by the NI vector. The Row-Column Flow (RCFlow) ]^[ PerNode Flow (Flow) feature vectors are better suited to capturing 
these hot spots, allowing ]f[ the synthetically generated traffic 
to cause congestion as full-system simulation might. 
In this section, we use CH+NI at the macro level with 
interval sizes of 500,000 cycles. We compare the NI feature 
vector to RCFlow ]^[ Flow with 200-cycle micro intervals. 
We run our models on Network A ]^[ show average packet 
latency in Fig. 6. The RCFlow ]^[ Flow vectors are more 
accurate with respect to full-system simulation ]f[ Raytrace; 
the locks used by Raytrace result in specific source-destination 
sharing that NI does ]n[ capture. Also important is that the two 
vectors did ]n[ negatively affect the accuracy ]f[ the Lu ]^[ 
Swaptions; that is, RCFlow ]^[ Flow did ]n[ artificially create 
congestion ]f[ benchmarks that do ]n[ exhibit that behaviour. 
We are ]n[ only interested in average behaviour ]b[ in capturing the highs ]^[ lows of network traffic. Looking at packet 
Average.Packet.Latency 
Average.Packet.Latency 
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
Figure 6: Micro-level sweep of feature vectors 
Hellinger.Distance 
50 
Feature Vector 
Cluster Algorithm 
Formal Method 
Interval Size 
Simulation 
Flow 
RCFlow 
Node 
0.06 
0.03 
0.00 
lu continguous 
raytrace 
Macro-Level Model 
Node Injection 
PAM 
CH Index 
500,000 
Micro-Level Model 
RCFlow 
Hierarchical 
L-Method 
200 
Table 5: Final SynFull Configuration 
swaptions 
Figure 7: Hellinger distance comparing packet latency distributions of synthetic simulations to full system. Lower is better. 
latency distributions, we can see the number of packets that 
achieve a wide range of latencies while in the network; this 
distribution gives insight into the congestion the network has 
experienced. The Hellinger Distance defines the similarity 
between two distributions. The Hellinger Distance is defined 
in Equation 2, where P ]^[ Q are two discrete distributions (in 
our case, packet latency distributions), ]^[ pi ]^[ qi are the 
ith element of P ]^[ Q, respectively. 
v 
u 
1 u k √ 
√ 
H(P, Q) = √ t ∑ ( pi − qi )2 
2 i=1 
swaptions 
Figure 8: NoC performance ]f[ different interval sizes. 
0.12 
0.09 
raytrace 
(2) 
Fig. 7 shows the Hellinger Distance ]f[ our synthetic traffic 
latency distributions compared to full-system simulation. The 
lower the distance, the more similar the latency distributions 
are. We can see that, although the error in average packet 
latency is less ]f[ Raytrace with the Flow vector (Fig. 7), the 
distribution of packet latencies is ]n[ as close to full system 
as RCFlow. This is because the Flow vector causes more high 
latency packets than full-system simulation, driving up the average packet latency with more congestion than necessary. In 
all cases, RCFlow is more similar to the desired packet latency 
distribution exhibited by full-system simulation, ]^[ its error 
in average packet latency is comparable to Flow. Therefore, 
we recommend RCFlow ]f[ micro clustering. 
8.3. Time Interval Size 
So far we have used 500,000 cycles per macro interval ]^[ 
200 cycles per micro interval. This results in 500, 000/200 = 
2, 500 micro intervals (observations) per macro interval, which 
is low enough to keep hierarchical clustering time reasonable. 
Now, we sweep the macro ]^[ micro interval sizes together ]s[ 
that they always result in 2,500 observations. We use CH+NI 
at the macro level, ]^[ compare the RCFlow ]^[ Flow feature 
vectors at the micro level with various interval sizes. 
Fig. 8 shows the average packet latency ]f[ SynFull traffic 
with different interval sizes. There is ]n[ a clear cut interval 
size that is best ]f[ every application. RCFlow works best with 
a micro-interval size of 100 cycles ]f[ Raytrace, ]b[ performs 
worse ]f[ Lu. Applications may exhibit different periodic 
behaviour at the micro level depending on their algorithm ]v[ 
an application may ]n[ have periodic behaviour at all. When 
using large interval sizes of 500 cycles ]v[ more, we risk ]n[ 
capturing bursty application traffic because deviations in injection rate get averaged out across the interval. For applications 
without bursty traffic, large interval sizes work well because 
the standard deviation of packets injected over time is low. 
Choosing a universal interval size ]f[ all applications may 
lead to slightly less accurate SynFull results ]f[ a subset of 
benchmarks. In future work, we will investigate automatically 
determining the interval size based on application traffic. 
8.4. Parameter Recommendations 
Based on the results presented in this section, we make some 
recommendations regarding model parameters used in SynFull. 
Changing the feature vector at the macro level does ]n[ have a 
significant effect on network performance. However, in terms 
of the clustering quality (recall TI vs. NI ]f[ Lu’s barriers), 
using the NI feature vector with the CH index yields the best 
results. For feature vectors at the micro level, it is important to 
select a vector that adequately captures hotspots. Both RCFlow 
]^[ Flow feature vectors show good results, however RCFlow 
scales better with the number of nodes being simulated ]^[ 
takes significantly less time to model (typically, an RCFlow 
model takes a few minutes to generate whereas a Flow model 
can take over 20). Finally, the interval sizes of the macro 
]^[ micro levels can greatly influence traffic generated by 
SynFull. For the rest of this paper, we will use 200 cycles at 
the micro-level ]^[ 500, 000 cycles at the macro-level. 
9. Results 
We evaluate SynFull with PARSEC ]^[ SPLASH-2 benchmarks on the three network configurations introduced in Table 3. We compare SynFull against full-system simulation ]^[ 
trace simulation with packet dependences. For SynFull, we 
use the recommendations in Sec. 8.4 summarized in Table 5. 
Initially ]f[ both SynFull ]^[ trace simulations, the number of 
cycles simulated is equal to the number of cycles required to 
150 
Trace.Dependency 
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
Average.Packet.Latency 
FSYS 
Figure 9: NoC performance. Bars that reach the top of the y-axis (e.g. FFT) are truncated ]s[ that other results may be seen more clearly. 
0.8 
Network A 
Network B 
SynFull 
Network C 
0.6 
0.4 
0.2 
0.0 
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
Hellinger.Distance 
Trace.Dependency 
Figure 10: Comparing similarity of packet latency distributions with full-system simulation 
complete a full-system simulation of the benchmark with an 
ideal network. Later, we explore early simulation termination 
due to the Markov Chain reaching steady-state. 
Incorporating packet dependences into trace simulation improves the fidelity of traditional trace-based simulation on 
NoCs [18]. Traditionally, packets from a trace are injected 
into the network with no regard ]f[ when they arrive at their 
destinations. This is unrealistic due to the reactive nature of 
some packets, as explained in Sec. 4. Dependence tracking 
aims to capture the reactive nature of packets, ]^[ only inject 
them when their requesting packet has arrived; the injection 
of dependent packets is triggered by another packet’s arrival, 
rather than the timestamp of the original trace. 
We compare average packet latency across simulation 
methodologies (Fig. 9). SynFull does very well on NoCs 
A ]^[ C, with a geometric mean error of 8.9% ]^[ 9.5% 
across all benchmarks. NoCs A ]^[ C are reasonably wellprovisioned; most applications do ]n[ experience significant 
contention on these networks. SynFull achieves accurate average packet latency both ]f[ applications that do ]n[ stress the 
network (e.g. Cholesky Radix, Radiosity, Swaptions), ]^[ applications that do stress the network (e.g. Barnes, Bodytrack, 
Fluidanimate). Network throughput has similar accuracy, with 
geometric mean errors of 11.78% ]^[ 12.42% ]f[ NoCs A 
]^[ C. Running an ideal network trace with dependences does 
]n[ fair as well (geometric mean packet latency error of 18% 
]^[ 12.8% ]f[ NoCs A ]^[ C) because dependences are ]n[ 
tracked at the application level. While reactive packets are 
throttled correctly waiting on the arrival of predecessor pack- 
ets, independent packets continue to be injected according to 
their timestamp. For most applications, especially FFT ]^[ 
Radix, this has a significant impact on NoC performance. 
NoC B is the least provisioned of the 3 networks. As a 
result, discrepancies in initiating packet injections are more 
pronounced ]f[ both SynFull (16.1% packet latency error ]^[ 
a 16.11% throughput error) ]^[ Traces (30.2% packet latency 
error). Traces with dependences have significant error even ]f[ 
applications with low communication requirements (e.g. Radiosity), while SynFull is capable of reproducing similar NoC 
performance ]f[ benchmarks of this type. Some applications 
running on NoC B have significant error ]f[ both SynFull ]^[ 
Traces. In particular, Radix ]^[ FFT (excluded from geoMean 
calculations) run off the chart. These are special cases where 
the application has macro-level intervals with very high injection rates that dwarf the injection rate across the rest of the 
application. For example, running FFT on an ideal network, 
there is a spike of several macro-intervals during the middle 
of simulation with an order of magnitude larger injection rate 
than other intervals. When running FFT in full-system simulation on the considerably less provisioned NoC B, the spike is 
longer ]b[ with a much lower (less than 50%) injection rate. 
This is due to application-level dependences ]^[ the core’s reorder buffer throttling instruction issue which in turn throttles 
network injection. However, this is an extreme case ]^[ one 
]n[ typically found in many of the applications we consider; 
we are investigating techniques to adapt our model to these 
scenarios. 
We discussed the importance of packet latency distributions 
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
Figure 11: Two case studies of packet latency trends across 
all workloads 
in Sec. 8.2, ]^[ use the Hellinger Distance to compare distributions to full-system simulation. Fig. 10 shows packet 
latency distribution Hellinger Distance ]f[ SynFull ]^[ Traces 
compared to full-system simulation. Consistent with the average packet latency error, SynFull modelling FFT (NoC B) has 
a large Hellinger Distance which indicates that the resulting 
distribution does ]n[ resemble the latency distribution seen in 
full-system simulation. Outside of FFT, our technique fares 
well ]f[ PARSEC ]^[ SPLASH-2 applications. Applications 
with low communication requirements typically have the lowest Hellinger Distance because both SynFull ]^[ full-system 
simulation do ]n[ have a large tail in the distribution. For 
applications with more bursty behaviour, Hellinger Distances 
are greater ]b[ still comparable. 
Traces that perform well in average packet latency on NoCs 
A ]^[ C perform better than SynFull in Hellinger Distance 
(e.g. Cholesky, Lu, Radiosity). These applications have low 
communication requirements. As a result, the issue of independent messages flooding the network is minimized on 
a well-provisioned network, ]^[ the trace faithfully reproduces application traffic. Due to the randomness associated 
with Markov Chains, SynFull phases do ]n[ exactly coincide 
the way a trace would. As a result, we have slightly higher 
Hellinger Distances, ]b[ the results are still comparable. However, when comparing applications across all domains, SynFull 
is the clear winner. 
9.1. Capturing Trends 
While absolute error values are useful, designers expect a 
methodology to accurately capture the relationship between 
networks designs. That is, if one network performs better than 
another in full-system simulation, then the trend should be the 
same when using SynFull. Here we demonstrate that the relationship is captured with more intuitive trends. Specifically, 
we perform two separate sweeps on channel width ]^[ virtual 
channel buffer size. In the first sweep, we look at networks 
with 16, 8, 4, ]^[ 2 byte channel widths. In the second sweep, 
we look at networks with 16, 8, 4, ]^[ 2 flits per buffer. Intuitively, larger channel widths ]^[ buffer sizes would lead to 
better performance than smaller ones. Indeed, this is the case 
as shown in Fig. 11; results are averaged across all workloads. 
Packets are subdivided into flits based on the channel width. 
Our simulations use 8-byte control packets ]^[ 72-byte data 
packets. From Fig. 11 (right) we see that there is ]n[ much 
difference in performance between an 8 ]^[ 16 byte channel 
width. This is because a 16 byte channel width only improves 
transmission of data packets, since 8 bytes is all that is needed 
]f[ a control packet. As the channel width decreases, ]s[ too 
does performance due to the increased serialization latency of 
all packets. Buffer depth also affects performance. Smaller 
buffers increases the latency of packets because flits have to 
wait until space becomes available before proceeding towards 
their destination. In this case study, Fig. 11 (left) shows that 
SynFull captures the relationship almost perfectly. 
Overall, SynFull is a superior approach to trace dependences 
in terms of fidelity. SynFull is less prone to error across a variety of applications ]^[ stresses an NoC in the same way 
an application would in full-system simulation. SynFull also 
captures the same trends found through full-system simulation. 
High accuracy is an important attribute of SynFull; independent of its accuracy relative to full-system simulation, SynFull 
provides a meaningful collection of synthetic traffic models 
that capture a diverse range of application ]^[ cache coherence behaviour making SynFull an invaluable tool in a NoC 
designer’s arsenal. In Sec. 10, we explore the speed of SynFull 
relative to full-system simulation, ]^[ how it can be further 
accelerated using a special property of Markov Chains. 
10. Exploiting Markov Chains ]f[ Speedup 
Simply running SynFull ]f[ the same number of cycles as 
full-system simulation results in significant speed up – this 
is because SynFull itself does ]n[ require much processing 
time. The NoC simulator is the limiting factor, ]b[ is still substantially faster than a full-system simulator. We can further 
improve the simulation time of SynFull by exploiting the stationary distribution of Markov Chains. An important property 
of Markov Chains is that they can reach equilibrium. That is, 
after infinite time, the Markov Chain converges to a steady 
state where the probability of being in a given state is constant. 
In SynFull, when the macro-level Markov Chain has converged to its equilibrium, we exit the simulation prematurely. 
This implies that all traffic phases have been simulated ]f[ an 
adequate time, ]^[ our simulation has reached its steady state. 
We cannot apply the same methodology to trace-based simulation because it follows the same progression as full-system 
simulation. If we exit a trace prematurely, we may miss out on 
a large period of bursty communication ]v[ low communication, 
both of which would give very different overall NoC performance results. For example, if trace simulation of FFT were to 
exit early, it would ]n[ reach the large spike of macro intervals, 
leading NoC researchers to draw incorrect conclusions. 
Fig. 12 shows the average speedup of traces, SynFull, ]^[ 
with SynFull exiting simulation at steady-state (SynFull_SS). 
The numbers are calculated by averaging the total runtime of 
simulations across each of the three network configurations (A, 
B, ]^[ C) ]f[ each application. Without steady-state, SynFull 
Speed Up 
150 
100 
50 
Synthetic 
Synthetic_SS 
Trace.Dependency 
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
Figure 12: The average speedup over full system simulation 
]^[ Trace Dependency speed-ups are very similar since they 
simulate the same number of cycles. The simulation bottleneck 
here is the NoC itself ]^[ ]n[ the methodology ]f[ driving 
traffic. With steady state, we achieve substantial speedup; 
speedup is as high as ∼150× ]^[ over 50× on average. 
SynFull models two Markov Chains; however, we only exit 
when steady state is reached at the macro level. We could 
potentially end a macro-interval early by observing steady 
state at the micro level. However, this would result in different 
length macro intervals, which could negatively affect performance accuracy. For example, imagine a low injection macro 
interval reaches steady state very early while a high injection 
macro interval does not. There would be a disproportionate 
amount of high injection to low injection, negatively impacting the accuracy of our model. By only observing steady state 
at the macro-level Markov Chain, we achieve similar error 
compared to running SynFull to completion; a full run of SynFull has a geometric mean error of 8.9%, 16.1%, ]^[ 9.5% 
across networks A, B, ]^[ C, while SynFull with steady state 
yields errors of 10.5%, 17.1%, ]^[ 9.1%. 
11. Related Work 
Simulation acceleration. There has been considerable work 
done to improve simulation time. FPGA-based acceleration 
has been proposed [11, 43]. FIST implements an FPGA-based 
network simulator that can simulate mesh networks with significant speed up over software simulation [32]. User-level simulators exist as an alternative to full-system simulation ]f[ exploring thousands of cores [7, 29]. ZSim exploits parallel simulation with out-of-order core models [37]. Sampling ]f[ microarchitectural simulation has been widely explored [38, 39, 49] 
]^[ has received renewed attention ]f[ multi-threaded ]^[ 
multi-core processors [1, 8]. Zhang et al. leverage SimPoints 
]f[ network traffic ]s[ that they may speed up simulations ]f[ 
parallel applications [51]. Hornet [33] focuses on parallelizing 
a NoC simulation. Simulators such as Hornet [33], ZSim [37] 
]^[ Slacksim [9] are great tools ]b[ designers should still 
prune the design space to a few candidates prior to using such 
detailed simulators; SynFull bridges the gap between existing 
synthetic models ]^[ detailed full-system simulation. 
Workload modelling. Cloning can mimic workload behaviour by creating a reduced representation of the code [3, 
21]. Much of this work focuses on cloning cache behaviour; 
SynFull can be viewed as creating clones of cache coherence behaviour to stimulate the network. Creation of syn- 
thetic benchmarks ]f[ multi-threaded applications has been 
explored [17]; this work generates instruction streams that execute in simulation ]v[ on real hardware. Our work differs as we 
reproduce communication patterns ]^[ coherence behaviour 
while abstracting away the processor ]^[ instruction execution. 
MinneSPEC [24] provides reduced input sets that effectively 
match the reference input ]f[ SPEC2000; rather than focus on 
input set ]v[ instruction generation, we provide a reduced set 
of traffic based on the steady state of a Markov Chain. 
Workload Design ]^[ Synthetic Traffic. Synthetic workloads have been a focus of research long before NoCs 
emerged [16, 42]. Statistical profiles can be used to generate synthetic traces ]f[ microarchitectural performance analysis [14]. Methods ]f[ synthetic trace generation at the chip 
level have also been proposed [44, 45]; Soteriou et al. propose a 3-tuple statistical model that leverages self-similarity 
to create bursty synthetic traffic [41]. To our knowledge, there 
has been no work done to synthetically generate network traffic that includes cache coherence. The benefits of such an 
approach allows us to remove the necessity ]f[ full-system 
simulation while still allowing works that exploit coherence 
traffic. In addition, most statistical models do ]n[ compare 
generated traffic with full-system simulations, ignoring performance metrics such as packet latency. 
12. Conclusion 
Full-system simulation is a long ]^[ tedious process; as a 
result, it limits the range of designs that can be explored in a 
tractable amount of time. We propose a novel methodology 
to accelerate NoC simulation. SynFull enables the creation 
of synthetic traffic models that mimic the full range of cache 
coherence behaviour ]^[ the resulting traffic that is injected 
into the network. We accurately capture spatial variation in 
traffic patterns within ]^[ across applications. Furthermore, 
burstiness is captured in our model. These two attributes 
lead to a model that produces accurate network traffic. We 
attain an overall accuracy of 10.5% across 3 configurations 
]f[ all benchmarks relative to full-system simulation. Furthermore, our technique uses the steady-state behaviour of 
Markov chains to speedup simulation by up to 150×. SynFull 
is a powerful ]^[ robust tool that will enable faster exploration 
of a rich design space in NoCs. SynFull can be downloaded at 
www.eecg.toronto.edu/~enright/downloads.html 
Acknowledgements 
This research was funded by a gift from Intel. Additional support was provided by the Canadian Foundation ]f[ Innovation 
]^[ the Ontario Research Fund. We thank Mike Kishinevsky 
]^[ Umit Ogras ]f[ their invaluable feedback ]^[ insight while 
developing SynFull. We further thank Emily Blem, Andreas 
Moshovos, Jason Anderson, the members of the Enright Jerger 
research group ]^[ the anonymous reviewers ]f[ their thoughtful ]^[ detailed feedback on this work. 
References 
[1] E. Ardestani ]^[ J. Renau, “ESESC: A fast multicore simulator using 
time-based sampling,” in Proc. of Intl. Symposium on High Performance Computer Architecture, 2013. 
[2] J. H. Bahn ]^[ N. Bagherzadeh, “A generic traffic model ]f[ on-chip 
interconnection networks,” Network on Chip Architectures, p. 22, 2008. 
[3] G. Balakrishnan ]^[ Y. Solihin, “WEST: Cloning data cache behavior 
using stochastic traces,” in Proc. of Intl. Symposium High Performance 
Computer Architecture, 2012. 
[4] R. Bellman, Adaptive Control Processes: A Guided Tour, ser. A Rand 
Corporation Research Study Series. Princeton University Press, 1961. 
[5] C. Bienia, “Benchmarking modern multiprocessors,” Ph.D. dissertation, 
Princeton University, January 2011. 
[6] T. Caliński ]^[ J. Harabasz, “A dendrite method ]f[ cluster analysis,” 
Comm in Statistics-theory ]^[ Methods, vol. 3, no. 1, pp. 1–27, 1974. 
[7] T. E. Carlson, W. Heirman, ]^[ L. Eeckhout, “Sniper: exploring the 
level of abstraction ]f[ scalable ]^[ accurate parallel multi-core simulation,” in Proc of Supercomputing (SC), 2011, p. 52. 
[8] T. E. Carlson, W. Heirman, ]^[ L. Eeckhout, “Sampled simulation of 
multi-threaded applications,” in Intl. Symp. Performance Analysis of 
Systems ]^[ Software, Apr. 2013. 
[9] J. Chen, L. K. Dabbiru, D. Wong, M. Annavaram, ]^[ M. Dubois, 
“Adaptive ]^[ speculative slack simulations of CMPs on CMPs,” in 
Proc. of Intl. Symposium on Microarchitecture, 2010. 
[10] X. E. Chen ]^[ T. M. Aamodt, “Hybrid analytical modeling of pending cache hits, data prefetching ]^[ MSHRs,” ACM Transactions on 
Architecture ]^[ Code Optimization, vol. 8, no. 3, October 2011. 
[11] D. Chiou, D. Sunwoo, J. Kim, N. A. Patil, W. Reinhart, D. E. Johnson, 
J. Keefe, ]^[ H. Angepat, “FPGA-accelerated simulation technologies 
(fast): Fast, full-system, cycle-accurate simulators,” in Proc of the 
International Symposium on Microarchitecture, 2007, pp. 249–261. 
[12] W. J. Dally ]^[ B. P. Towles, Principles ]^[ practices of interconnection networks. Morgan Kaufmann, 2003. 
[13] R. Das, O. Mutlu, T. Moscibroda, ]^[ C. R. Das, “Aergia: exploting 
packet latency slack in on-chip networks,” in Proc. of Intl. Symposium 
on Computer Architecture, 2010. 
[14] L. Eeckhout, K. De Bosschere, ]^[ H. Neefs, “Performance analysis through synthetic trace generation,” in Intl. Symp. Performance 
Analysis of Systems ]^[ Software, 2000, pp. 1–6. 
[15] M. Ferdman, P. Lotfi-Kamran, K. Balet, ]^[ B. Falsafi, “Cuckoo directory: A scalable directory ]f[ many-core systems,” in Intl Symp on 
High Performance Computer Architecture, 2011, pp. 169–180. 
[16] D. Ferrari, On the foundations of artificial workload design. ACM, 
1984, vol. 12, no. 3. 
[17] K. Ganesan ]^[ L. John, “Automatic generation of miniaturized synthetic proxies ]f[ target applications to efficiently design multicore 
processors,” IEEE Trans. on Computers, vol. 99, 2013. 
[18] J. Hestness, B. Grot, ]^[ S. W. Keckler, “Netrace: dependency-driven 
trace-based network-on-chip simulation,” in Proc. of the 3rd International Workshop on Network on Chip Architectures, 2010, pp. 31–36. 
[19] N. Jiang, D. U. Becker, G. Michelogiannakis, J. Balfour, B. Towles, 
J. Kim, ]^[ W. J. Dally, “A detailed ]^[ flexible cycle-accurate networkon-chip simulator,” in Intl. Symp. Performance Analysis of Systems ]^[ 
Software, 2013. 
[20] Y. Jin, E. J. Kim, ]^[ T. Pinkston, “Communication-aware globallycoordinated on-chip networks,” IEEE Transactions on Parallel ]^[ 
Distributed Systems, vol. 23, no. 2, pp. 242 –254, Feb. 2012. 
[21] A. Joshi, L. Eeckhout, R. Bell, ]^[ L. John, “Cloning: A technique 
]f[ disseminating proprietary applications at benchmarks,” in Proc. of 
IEEE Intl Symposium Workload Characterization, 2006. 
[22] T. Karkhanis ]^[ J. E. Smith, “A first-order superscalar processor 
model,” in Proc of the Intl Symp on Computer Architecture, 2004. 
[23] J. Kim, J. Balfour, ]^[ W. Dally, “Flattened Butterfly Topology ]f[ 
On-Chip Networks,” in Proc of the International Symposium on Microarchitecture, 2007, pp. 172–182. 
[24] A. KleinOsowski ]^[ D. J. Lilja, “MinneSPEC: A new SPEC benchmark workload ]f[ simulation-based computer architecture research,” 
Computer Architecture Letters, vol. 1, June 2002. 
[25] T. Krishna, L.-S. Peh, B. Beckmann, ]^[ S. K. Reinhardt, “Towards 
the ideal on-chip fabric ]f[ 1-to-many ]^[ many-to-1 communication,” 
in Proc. of the International Symposium on Microarchitecture, 2011. 
[26] M. Lodde, J. Flich, ]^[ M. E. Acacio, “Heterogeneous NoC design ]f[ 
efficient broadcast-based coherence protocol support,” in International 
Symposium on Networks on Chip, 2012. 
[27] S. Ma, N. Enright Jerger, ]^[ Z. Wang, “Supporting efficient collective communication in NoCs,” in Proc of Intl. Symposium on High 
Performance Computer Architecture, 2012, pp. 165–177. 
[28] M. Martin, M. Hill, ]^[ D. Sorin, “Why on-chip cache coherence is 
here to stay,” Comm of the ACM, vol. 55, no. 7, pp. 78–89, 2012. 
[29] J. Miller, H. Kasture, G. Kurian, C. Gruenwald, N. Beckmann, C. Celio, 
J. Eastep, ]^[ A. Agarwal, “Graphite: A distributed parallel simulator 
]f[ multicores,” in Proc. of Intl. Symposium on High Performance 
Computer Architecture, Jan. 2010, pp. 1 –12. 
[30] A. Mishra, O. Mutlu, ]^[ C. Das, “A heterogeneous multiple networkon-chip design: An application-aware approach,” in Proc. of the Design 
Automation Conference, 2013. 
[31] N. Neelakantam, C. Blundell, J. Devietti, M. M. Martin, ]^[ C. Zilles, 
“FeS2: A Full-system Execution-driven Simulator ]f[ x86,” Poster 
presented at ASPLOS, 2008. 
[32] M. Papamichael, J. Hoe, ]^[ O. Mutlu, “FIST: A fast, lightweight, 
FPGA-friendly packet latency estimator ]f[ NoC modeling in fullsystem simulations,” in Intl Symp on Networks on Chip, 2011. 
[33] P. Ren, M. Lis, M. H. Cho, K. S. Shim, C. W. Fletcher, O. Khan, 
N. Zheng, ]^[ S. Devadas, “HORNET: A cycle-level multicore simulator,” IEEE Trans. Comput-Aided Design Integr. Circuits Syst., vol. 31, 
no. 6, 2012. 
[34] A. Reynolds, G. Richards, B. De La Iglesia, ]^[ V. Rayward-Smith, 
“Clustering rules: a comparison of partitioning ]^[ hierarchical clustering algorithms,” Journal of Mathematical Modelling ]^[ Algorithms, 
vol. 5, no. 4, pp. 475–504, 2006. 
[35] P. J. Rousseeuw, “Silhouettes: a graphical aid to the interpretation ]^[ 
validation of cluster analysis,” Journal of computational ]^[ applied 
mathematics, vol. 20, pp. 53–65, 1987. 
[36] S. Salvador ]^[ P. Chan, “Determining the number of clusters/segments 
in hierarchical clustering/segmentation algorithms,” in Int. Conf. on 
Tools with Artificial Intelligence, 2004, pp. 576–584. 
[37] D. Sanchez ]^[ C. Kozyrakis, “ZSim: Fast ]^[ accurate microarchitectural simulation of thousand-core systems,” in Proc. of the International 
Symposium on Computer Architecture, 2013. 
[38] T. Sherwood, E. Perelman, ]^[ B. Calder, “Basic block distribution 
analysis to find periodic behavior ]^[ simulation points in applications,” 
in Parallel Architecture ]^[ Compilation Techniques, 2001, pp. 3–14. 
[39] T. Sherwood, E. Perelman, G. Hamerly, ]^[ B. Calder, “Automatically 
characterizing large scale program behavior,” in Proc. of Architecture 
Support ]f[ Programming Languages ]^[ Operating Systems, 2002, 
pp. 45–57. 
[40] D. J. Sorin, M. D. Hill, ]^[ D. A. Wood, “A primer on memory consistency ]^[ cache coherence,” Synthesis Lectures on Computer Architecture, vol. 6, no. 3, pp. 1–212, 2011. 
[41] V. Soteriou, H. Wang, ]^[ L.-S. Peh, “A statistical traffic model ]f[ 
on-chip interconnection networks,” in MASCOTS, 2006, pp. 104–116. 
[42] K. Sreenivasan ]^[ A. Kleinman, “On the construction of a representative synthetic workload,” Comm of the ACM, vol. 17, no. 3, pp. 
127–133, 1974. 
[43] Z. Tan, A. Waterman, H. Cook, S. Bird, K. Asanovic, ]^[ D. Patterson, 
“A case ]f[ FAME: FPGA architecture model execution,” in Proc. of 
Intl Symposium on Computer Architecture, 2010. 
[44] L. Tedesco, A. Mello, L. Giacomet, N. Calazans, ]^[ F. Moraes, “Application driven traffic modeling ]f[ NoCs,” in Proc of the 19th Symp 
on Integrated Circuits ]^[ Systems Design. ACM, 2006, pp. 62–67. 
[45] G. V. Varatkar ]^[ R. Marculescu, “On-chip traffic modeling ]^[ 
synthesis ]f[ MPEG-2 video applications,” IEEE Trans on Very Large 
Scale Integration Systems, vol. 12, no. 1, pp. 108–119, 2004. 
[46] T. Velmurugan ]^[ T. Santhanam, “Computational complexity between 
k-means ]^[ k-medoids clustering algorithms ]f[ normal ]^[ uniform 
distributions of data points,” Journal of Computer Science, vol. 6, no. 3, 
p. 363, 2010. 
[47] J. H. Ward Jr, “Hierarchical grouping to optimize an objective function,” 
J. Amer. Statist. Assoc., vol. 58, no. 301, pp. 236–244, 1963. 
[48] S. C. Woo, M. Ohara, E. Torrie, J. P. Singh, ]^[ A. Gupta, “The 
SPLASH-2 programs: Characterization ]^[ methodological considerations,” in Intl Symp on Computer Architecture, 1995, pp. 24–36. 
[49] R. E. Wunderlich, T. F. Wenisch, B. Falsafi, ]^[ J. C. Hoe, “SMARTS: 
accelerating microarchitecture simulation via rigorous statistical sampling,” in Proc. of Intl Symposium on Computer Architecture, 2003. 
[50] J. Zebchuk, V. Srinivasan, M. K. Qureshi, ]^[ A. Moshovos, “A tagless 
coherence directory,” in Intl Symp on Microarchitecture, 2009. 
[51] Y. Zhang, B. Ozisikyilmaz, G. Memik, J. Kim, ]^[ A. Choudhary, 
“Analyzing the impact of on-chip network traffic on program phases ]f[ 
CMPs,” in Intl Symp on Performance Analysis of Systems ]^[ Software, 
2009, pp. 218–226. 
