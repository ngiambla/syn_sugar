~$[synfull%%cln%% synthetic trafﬁc models capturing cache coherent behaviour 
edward s%%per%%]$~ ~$[rogers sr%%per%%]$~ ~$[department %%#%% electrical ]^[ computer engineering 
mario badr%%lst%% natalie enright jerger 
university %%#%% toronto 
mario%%per%%badr@mail%%per%%utoronto%%per%%ca%%lst%% enright@ece%%per%%utoronto%%per%%ca 
abstract 
modern ]^[ future many%%dsh%%core systems represent complex ar%%dsh%% 
chitectures%%per%%]$~ ~$[the communication fabrics %%#%% %%#%% large systems 
heavily inﬂuence %%#%% performance ]^[ power consumption%%per%%]$~ 
~$[current simulation methodologies ]f[ evaluating networks%%dsh%% 
on%%dsh%%chip (nocs) %%#%% ]n[ keeping pace %%#%% %%#%% increased com%%dsh%% 
plexity %%#%% %%#%% systems%%scn%% architects %%#%% %%#%% %%#%% explore %%#%% 
%%#%% design knobs quickly%%per%%]$~ ~$[methodologies %%#%% capture 
workload trends %%#%% faster simulation times %%#%% highly ben%%dsh%% 
eﬁcial %%#%% %%#%% stages %%#%% architectural exploration%%per%%]$~ ~$[we pro%%dsh%% 
pose synfull%%lst%% %%#%% synthetic trafﬁc generation methodology %%#%% 
captures %%#%% application ]^[ cache coherence behaviour %%#%% 
rapidly evaluate nocs%%per%%]$~ ~$[synfull allows designers %%#%% quickly 
indulge %%#%% detailed performance simulations %%#%% %%#%% cost 
%%#%% long%%dsh%%running full%%dsh%%system simulation%%per%%]$~ ~$[by capturing %%#%% %%#%% 
range %%#%% application ]^[ coherence behaviour%%lst%% architects %%#%% 
avoid %%#%% %%#%% ]v[ underdesign %%#%% %%#%% network %%#%% %%#%% occur 
%%#%% using traditional synthetic trafﬁc patterns %%#%% %%#%% uni%%dsh%% 
form random%%per%%]$~ ~$[synfull %%#%% errors %%#%% low %%#%% 0%%per%%3% ]^[ provides 
50× speedup %%#%% average %%#%% full%%dsh%%system simulation%%per%% 
1%%per%%]$~ ~$[introduction 
%%#%% %%#%% shift %%#%% multi%%dsh%% ]^[ many%%dsh%%core processors%%lst%% architects 
%%#%% %%#%% %%#%% larger design space ]^[ %%#%% complex trade%%dsh%%offs 
%%#%% processor design%%per%%]$~ ~$[the design %%#%% %%#%% network %%#%% %%#%% potential 
power ]^[ performance bottleneck %%#%% becoming %%#%% critical con%%dsh%% 
cern%%per%%]$~ ~$[in %%#%% power%%dsh%%constrained many%%dsh%%core landscape%%lst%% nocs 
%%#%% %%#%% carefully designed %%#%% meet communication bandwidth 
requirements%%lst%% deliver packets %%#%% low latency%%lst%% ]^[ ﬁt %%#%% 
tight power envelopes %%#%% %%#%% shared %%#%% cores%%lst%% caches ]^[ 
interconnects%%per%%]$~ ~$[to %%#%% %%#%% well%%lst%% %%#%% designer %%#%% understand 
%%#%% trafﬁc patterns ]^[ temporal behaviour %%#%% applications %%#%% 
noc %%#%% support%%per%%]$~ ~$[there %%#%% %%#%% large number %%#%% parameters 
%%#%% %%#%% noc design space %%#%% %%#%% %%#%% tuned %%#%% deliver %%#%% re%%dsh%% 
quired performance %%#%% %%#%% %%#%% cost/power envelope%%lst%% %%#%% 
%%#%% topology%%lst%% routing algorithm%%lst%% ﬂow control ]^[ router mi%%dsh%% 
croarchitecture%%per%%]$~ ~$[these knobs %%#%% %%#%% commonly explored 
%%#%% software simulation%%per%%]$~ 
~$[there %%#%% %%#%% number %%#%% simulation methodologies available 
%%#%% noc designers%%lst%% %%#%% %%#%% comes %%#%% speed/ﬁdelity 
tradeoffs [18]%%per%%]$~ ~$[full%%dsh%%system simulators model %%#%% hardware 
component %%#%% %%#%% overall system ]^[ %%#%% run %%#%% applications 
]^[ operating systems%%per%%]$~ ~$[as %%#%% result%%lst%% %%#%% simulators provide 
%%#%% %%#%% degree %%#%% accuracy%%lst%% ]b[ %%#%% %%#%% expense %%#%% %%#%% 
simulation times%%per%%]$~ ~$[in contrast%%lst%% %%#%% designer %%#%% %%#%% traditional 
978%%dsh%%1%%dsh%%4799%%dsh%%4394%%dsh%%4/14/$31%%per%%00 c(cid:13) 2014 ieee 
figure 1%%cln%% %%#%% level view %%#%% synfull 
synthetic trafﬁc patterns %%#%% quickly stress %%#%% noc design 
]^[ reveal bottlenecks%%per%%]$~ ~$[however%%lst%% %%#%% trafﬁc patterns %%#%% ]n[ 
realistically represent %%#%% application space ]s[ %%#%% results %%#%% 
unlikely %%#%% %%#%% representative %%#%% real workloads%%per%%]$~ ~$[therefore%%lst%% %%#%% 
%%#%% unlikely %%#%% produce %%#%% properly provisioned network%%per%%]$~ ~$[in 
%%#%% work%%lst%% %%#%% introduce %%#%% %%#%% approach %%#%% strikes %%#%% balance 
%%#%% %%#%% tradeoffs%%lst%% providing %%#%% fast%%lst%% realistic simulation 
methodology ]f[ noc designers%%per%%]$~ 
~$[realistic trafﬁc patterns %%#%% increase %%#%% accuracy %%#%% noc 
simulations%%per%%]$~ ~$[beyond that%%lst%% realistic trafﬁc %%#%% provides opti%%dsh%% 
mization opportunities %%#%% %%#%% ]n[ exist %%#%% traditional synthetic 
trafﬁc patterns%%per%%]$~ ~$[many recent noc proposals %%#%% exploited 
particular application [13%%lst%% 30] ]v[ coherence behaviour [25%%lst%% 26] 
%%#%% provide %%#%% %%#%% efﬁcient%%lst%% higher%%dsh%%performing noc design%%per%%]$~ ~$[as 
research continues %%#%% push %%#%% scalability %%#%% cache coherence 
protocols [15%%lst%% 28%%lst%% 50]%%lst%% shared memory cmps continue %%#%% %%#%% 
widespread%%per%%]$~ ~$[as %%#%% result%%lst%% %%#%% focus %%#%% %%#%% class %%#%% systems%%per%%]$~ 
~$[synfull overview ]^[ contributions%%per%%]$~ ~$[synfull provides %%#%% 
novel technique ]f[ modelling real application trafﬁc %%#%% 
%%#%% %%#%% ]f[ expensive%%lst%% detailed simulation %%#%% %%#%% levels %%#%% %%#%% 
system%%per%%]$~ ~$[we abstract %%#%% cores ]^[ caches %%#%% focus %%#%% %%#%% net%%dsh%% 
work%%lst%% ]^[ provide application%%dsh%%level insight %%#%% noc designers%%lst%% 
%%#%% %%#%% %%#%% %%#%% produce %%#%% optimized designs%%per%%]$~ ~$[through %%#%% 
analysis%%lst%% %%#%% determine %%#%% key trafﬁc attributes %%#%% %%#%% cache%%dsh%% 
coherent application%%dsh%%driven trafﬁc model %%#%% capture includ%%dsh%% 
ing coherence%%dsh%%based message dependences (sec%%per%% 4)%%lst%% applica%%dsh%% 
tion phase behaviour (sec%%per%% 5) ]^[ injection process (sec%%per%% 6)%%per%%]$~ 
~$[fig%%per%% 1 %%#%% %%#%% high%%dsh%%level overview %%#%% %%#%% approach%%per%%]$~ ~$[we ob%%dsh%% 
serve %%#%% running (macro%%dsh%%)phases %%#%% applications %%#%% %%#%% 
%%#%% ﬁne%%dsh%%grained variation %%#%% macro%%dsh%%phases (micro%%dsh%%phases)%%lst%% 
]^[ %%#%% %%#%% %%#%% clustering%%per%%]$~ ~$[within %%#%% clusters%%lst%% %%#%% 
number 
 of 
 injected 
 packets 
 time 
 (millions 
 of 
 cycles) 
 macro%%dsh%%­‐level 
 phase 
 clustering 
 time 
 (hundreds 
 of 
 cycles) 
 micro%%dsh%%­‐level 
 phase 
 clustering 
 read 
 write 
 replace 
 inv 
 • cluster 
 based 
 on%%cln%% 
  
 • message 
 types 
 • spadal 
 paeern 
 (src%%dsh%%­‐dst 
 ﬂows) 
  
 micro%%dsh%%­‐level 
 markov 
 chain 
 macro%%dsh%%­‐level 
  
 markov 
 chain 
  examine %%#%% break %%#%% %%#%% message types dictated %%#%% %%#%% co%%dsh%% 
herence protocol%%per%%]$~ ~$[these %%#%% steps drive %%#%% hierarchical markov 
chain %%#%% %%#%% %%#%% %%#%% reproduce %%#%% trafﬁc behaviour%%per%%]$~ ~$[our 
proposed model %%#%% independent %%#%% %%#%% network conﬁguration 
]^[ %%#%% %%#%% applied %%#%% %%#%% wide range %%#%% noc conﬁgurations %%#%% 
enable rapid%%lst%% accurate design space exploration%%per%%]$~ 
~$[to demonstrate %%#%% accuracy ]^[ utility %%#%% %%#%% model%%lst%% %%#%% ap%%dsh%% 
ply %%#%% methodology %%#%% %%#%% variety %%#%% parsec [5] ]^[ splash%%dsh%% 
2 [48] benchmarks%%per%%]$~ ~$[a single full%%dsh%%system simulation run %%#%% 
%%#%% benchmark %%#%% required %%#%% create %%#%% model%%per%%]$~ ~$[we %%cmp%% 
%%#%% %%#%% models %%#%% synthetically generate trafﬁc ]^[ com%%dsh%% 
pare noc performance %%#%% full%%dsh%%system simulation%%per%%]$~ ~$[finally%%lst%% 
%%#%% demonstrate signiﬁcant speedup ]f[ %%#%% methodology %%#%% 
full%%dsh%%system simulation%%scn%% %%#%% allows ]f[ rapid noc design space 
exploration%%per%%]$~ ~$[in essence%%lst%% synfull strives %%#%% replace %%#%% sys%%dsh%% 
tem simulation ]f[ fast%%lst%% ]y[ accurate noc evaluation %%#%% 
richer synthetic trafﬁc patterns%%per%% 
2%%per%%]$~ ~$[the %%#%% ]f[ coherence trafﬁc 
%%#%% describing synfull %%#%% detail%%lst%% %%#%% motivate %%#%% %%#%% ]f[ 
%%#%% %%#%% class %%#%% synthetic trafﬁc patterns%%per%%]$~ ~$[trafﬁc patterns %%#%% 
%%#%% uniform random%%lst%% permutation%%lst%% tornado%%lst%% etc%%per%% %%#%% widely %%#%% 
%%#%% noc research%%per%%]$~ ~$[many %%#%% %%#%% %%#%% based %%#%% %%#%% communica%%dsh%% 
tion pattern %%#%% speciﬁc applications%%per%%]$~ ~$[for example%%lst%% transpose 
trafﬁc %%#%% based %%#%% %%#%% matrix transpose application%%lst%% ]^[ %%#%% 
shufﬂe permutation %%#%% derived %%#%% fast%%dsh%%fourier transforms 
(ffts) [2%%lst%% 12]%%per%%]$~ ~$[however%%lst%% %%#%% synthetic trafﬁc patterns %%#%% 
]n[ representative %%#%% %%#%% wide range %%#%% applications %%#%% run %%#%% 
current ]^[ future cmps%%per%%]$~ ~$[even %%cmp%% %%#%% trafﬁc patterns %%#%% 
representative%%lst%% %%#%% conﬁguration %%#%% %%#%% cache%%dsh%%coherent system 
%%#%% mask ]v[ destroy %%#%% inherent communication pattern %%#%% %%#%% 
original algorithm due %%#%% indirections ]^[ control messages%%per%%]$~ 
~$[the arrangement %%#%% cores%%lst%% caches%%lst%% directories%%lst%% ]^[ memory 
controllers directly inﬂuences %%#%% ﬂow %%#%% communication ]f[ 
%%#%% application%%per%%]$~ ~$[compare %%#%% synthetic shufﬂe pattern %%#%% %%#%% 
fft benchmark %%#%% splash%%dsh%%2 [48]%%per%%]$~ ~$[the shufﬂe pattern 
%%#%% %%#%% bit permutation %%#%% %%#%% destination bits %%#%% calculated 
via %%#%% function di = si−1 mod %%#%% %%#%% %%#%% %%#%% %%#%% number %%#%% bits 
required %%#%% represent %%#%% nodes %%#%% %%#%% network [12]%%per%%]$~ ~$[fft %%#%% run 
%%#%% full%%dsh%%system simulation1 %%#%% shufﬂe %%#%% run %%#%% network%%dsh%%only 
simulation%%per%%]$~ ~$[fig%%per%% 2 %%#%% %%#%% number %%#%% packets sent %%#%% %%#%% 
source %%#%% %%#%% destination2%%per%%]$~ ~$[in fig%%per%% 2b%%lst%% %%#%% %%#%% notable destination 
hot spots %%#%% nodes 0%%lst%% 2%%lst%% ]^[ 5 ]^[ source hot spots %%#%% nodes 
0 ]^[ 5%%per%%]$~ ~$[however%%lst%% fig%%per%% 2a %%#%% hot spots %%#%% ]f[ speciﬁc 
source%%dsh%%destination pairs%%per%%]$~ 
~$[the %%#%% noc design ]f[ %%#%% trafﬁc %%#%% fig%%per%% 2a %%#%% unlikely %%#%% 
%%#%% %%#%% %%#%% noc ]f[ %%#%% trafﬁc %%#%% fig%%per%% 2b%%per%%]$~ ~$[for example%%lst%% %%#%% 
%%#%% design %%#%% ring network ]f[ fig%%per%% 2a%%lst%% ]^[ map %%#%% nodes %%#%% 
minimize hop count %%#%% shufﬂe %%#%% %%#%% network%%per%%]$~ ~$[the average 
injection rate %%#%% fft %%#%% %%#%% ]f[ shufﬂe%%per%%]$~ ~$[doing ]s[ yields 
∼10% improvement %%#%% average packet latency %%#%% %%#%% mesh 
1conﬁguration details %%#%% %%#%% found %%#%% sec%%per%% 7%%per%% 
2the absolute number %%#%% packets %%#%% %%#%% ﬁgure %%#%% unimportant %%#%% %%#%% 
comparison %%#%% %%#%% focus %%#%% source%%dsh%%destination trafﬁc pairs%%per%% 
(a) shufﬂe trafﬁc pattern 
(b) fft application 
figure 2%%cln%% spatial behaviour ]f[ synthetic vs application trafﬁc 
(network %%#%% %%#%% sec%%per%% 7) %%#%% %%#%% naive mapping (baseline) %%#%% 
fig%%per%% 2a%%per%%]$~ ~$[however%%lst%% using %%#%% %%#%% ring network %%#%% %%#%% full%%dsh%% 
system simulation %%#%% %%#%% fft benchmark results %%#%% %%#%% average 
packet latency %%#%% %%#%% %%#%% %%#%% times worse %%cmp%% %%#%% baseline%%per%%]$~ 
~$[clearly%%lst%% synthetic trafﬁc patterns %%#%% ]n[ representative %%#%% 
%%#%% spatial behaviour exhibited %%#%% applications %%#%% %%#%% shared 
memory architecture%%per%%]$~ 
~$[the sharp contrast %%#%% fig%%per%% 2 %%#%% due %%#%% coherence transactions 
%%#%% %%#%% visit %%#%% nodes %%#%% %%#%% shared memory architecture 
%%#%% completing%%per%%]$~ ~$[for example%%lst%% %%#%% write request ﬁrst visits %%#%% 
directory %%#%% receive ownership %%#%% %%#%% cache line%%per%%]$~ ~$[the directory 
forwards requests %%#%% %%#%% core caching %%#%% data%%lst%% ]^[ %%#%% in%%dsh%% 
validates caches %%#%% %%#%% sharing %%#%% data%%per%%]$~ ~$[invalidated caches 
%%#%% send acknowledgements – %%#%% domino effect %%#%% signiﬁ%%dsh%% 
cantly change %%#%% application’s spatial behaviour ]^[ %%#%% 
%%#%% correctly modelled ]f[ realistic trafﬁc generation%%per%%]$~ 
~$[differentiating %%#%% %%#%% types %%#%% packets visiting nodes 
%%#%% %%#%% %%#%% generating realistic trafﬁc%%per%%]$~ ~$[most synthetic 
workloads split trafﬁc %%#%% %%#%% categories%%cln%% %%#%% control pack%%dsh%% 
ets (requests) ]^[ large data packets (responses)%%per%%]$~ ~$[however%%lst%% 
%%#%% %%#%% %%#%% %%#%% packet types %%#%% %%#%% coherence protocol 
]f[ %%#%% requests ]^[ responses%%per%%]$~ ~$[by lumping %%#%% packets 
%%#%% %%#%% categories%%lst%% designers %%#%% explore methods %%#%% 
exploit cache coherence ]f[ %%#%% performance%%per%%]$~ ~$[for example%%lst%% 
techniques exist %%#%% reduce trafﬁc caused %%#%% acknowledgement 
packets [27]%%per%%]$~ ~$[similar research insight %%#%% %%#%% %%#%% %%#%% 
detailed packet information %%#%% available %%#%% simulation%%per%%]$~ 
~$[finally%%lst%% %%#%% trafﬁc imposed %%#%% %%#%% application %%#%% time%%dsh%%varying%%per%%]$~ 
~$[applications exhibit phase behaviour [38]%%scn%% spatial patterns %%#%% 
%%#%% %%#%% change %%#%% time%%per%%]$~ ~$[static trafﬁc patterns ]^[ injection 
rates %%#%% ]n[ %%#%% adequate representation %%#%% real application 
trafﬁc%%per%%]$~ ~$[the behaviour %%#%% cache coherence trafﬁc changes %%#%% 
time ]^[ %%#%% %%#%% varying effects %%#%% noc performance%%per%%]$~ ~$[for 
example%%lst%% phases %%#%% exhibit %%#%% data exchange %%#%% %%#%% 
result %%#%% %%#%% invalidation packets %%#%% broadcast %%#%% %%#%% 
noc%%per%%]$~ ~$[it %%#%% %%#%% %%#%% capture %%#%% variations %%#%% trafﬁc %%#%% 
reveal %%#%% ]v[ ]n[ %%#%% noc %%#%% %%#%% correctly provisioned%%per%% 
3%%per%%]$~ ~$[synfull trafﬁc modelling overview 
%%#%% methodology focuses %%#%% %%#%% %%#%% design %%#%% %%#%% noc %%#%% 
%%#%% %%#%% %%#%% ﬁrst%%dsh%%class component %%#%% many%%dsh%%core architectures%%per%%]$~ 
~$[thus%%lst%% %%#%% abstract %%#%% %%#%% cores%%lst%% caches%%lst%% directories ]^[ mem%%dsh%% 
ory controllers%%per%%]$~ ~$[essentially%%lst%% %%#%% performance characteristics %%#%% 
sourcedestination01234567891011121314150123456789101112131415020406080100120140sourcedestination012345678910111213141501234567891011121314155000055000600006500070000 %%#%% elements %%#%% ﬁxed ]f[ %%#%% purposes %%#%% %%#%% study%%per%%]$~ ~$[how%%dsh%% 
ever%%lst%% synfull %%#%% %%#%% combined %%#%% analytical ]^[ abstract 
models [10%%lst%% 22] %%#%% %%#%% components %%#%% explore %%#%% %%#%% richer 
design space %%#%% fast%%dsh%%turnaround time%%per%%]$~ ~$[developing %%#%% net%%dsh%% 
%%#%% models %%#%% %%#%% critical ﬁrst step%%scn%% combining %%#%% model %%#%% 
%%#%% models %%#%% left %%#%% future work%%per%%]$~ ~$[to model application 
trafﬁc%%lst%% %%#%% focus %%#%% answering %%#%% key questions%%cln%% 
%%#%% %%#%% send %%#%% packet%%qsn%%]$~ ~$[in shared memory systems%%lst%% packets 
%%#%% injected %%#%% %%#%% application %%#%% %%#%% %%#%% cache miss%%per%%]$~ ~$[this 
packet initiates %%#%% coherence transaction %%#%% retrieve %%#%% data%%per%%]$~ 
~$[however%%lst%% %%#%% packets %%#%% injected reactively%%per%%]$~ ~$[for example%%lst%% 
%%#%% data packet %%#%% %%#%% %%#%% sent %%#%% response %%#%% %%#%% request%%per%%]$~ 
~$[who %%#%% sending %%#%% packet%%qsn%%]$~ ~$[not %%#%% nodes inject trafﬁc 
uniformly ]s[ %%#%% %%#%% determine %%#%% node %%#%% inject %%#%% 
packet%%per%%]$~ ~$[for reactive packets%%lst%% %%#%% answer %%#%% clear%%scn%% %%#%% node 
reacting %%#%% %%#%% request %%#%% %%#%% source%%per%%]$~ ~$[however%%lst%% ]f[ initiating 
packets%%lst%% %%#%% model %%#%% required%%per%%]$~ 
~$[why %%#%% %%#%% sending %%#%% packet%%qsn%%]$~ ~$[traditional synthetic 
workloads %%#%% ]n[ concern themselves %%#%% why%%per%%]$~ ~$[for %%#%% cache 
coherence trafﬁc generator%%lst%% %%#%% question %%#%% %%#%% important%%per%%]$~ ~$[the 
%%#%% helps determine %%#%% type %%#%% packet %%#%% sent%%lst%% ]^[ allows 
%%#%% %%#%% classify packets according %%#%% %%#%% coherence protocol%%per%%]$~ 
~$[where %%#%% %%#%% packet going%%qsn%%]$~ 
~$[the packet’s destination %%#%% 
%%#%% function %%#%% %%#%% %%#%% source ]^[ %%#%% type %%#%% packet %%#%% 
injected (the answers %%#%% %%#%% previous %%#%% questions)%%per%%]$~ ~$[each 
source node %%#%% exhibit %%#%% sharing patterns %%#%% %%#%% 
nodes%%lst%% ]^[ %%#%% sharing patterns %%#%% %%#%% %%#%% depending 
%%#%% %%#%% coherence message %%#%% sent%%per%%]$~ 
~$[these 4 questions %%#%% answered %%#%% sec%%per%% 4%%per%%]$~ ~$[however%%lst%% be%%dsh%% 
cause applications exhibit phase behaviour [38]%%lst%% %%#%% %%#%% %%#%% 
capture %%#%% %%#%% answers change %%#%% time%%per%%]$~ ~$[we handle %%#%% 
%%#%% dividing application trafﬁc %%#%% time intervals%%lst%% ]^[ group%%dsh%% 
ing %%#%% time intervals %%#%% behave similarly%%per%%]$~ ~$[then%%lst%% %%#%% 
determine answers ]f[ %%#%% when%%lst%% who%%lst%% %%#%% ]^[ %%#%% ques%%dsh%% 
tions ]f[ %%#%% %%#%% (phase)%%per%%]$~ ~$[we discuss %%#%% methodology 
]f[ %%#%% intervals %%#%% sec%%per%% 5%%per%%]$~ ~$[to complete %%#%% synfull 
methodology %%#%% %%#%% %%#%% %%#%% %%#%% transition %%#%% phases%%per%%]$~ ~$[for 
%%#%% %%#%% %%#%% %%#%% markov chain%%lst%% %%#%% %%#%% %%#%% determine %%#%% prob%%dsh%% 
ability %%#%% transitioning %%#%% %%#%% phase %%#%% %%#%% based %%#%% %%#%% 
phase %%#%% %%#%% currently in%%per%%]$~ ~$[the markov chain model%%lst%% %%#%% 
%%#%% answers %%#%% %%#%% %%#%% 4 questions%%lst%% allow %%#%% %%#%% recreate %%#%% 
injection process associated %%#%% %%#%% application (sec%%per%% 6)%%per%% 
4%%per%%]$~ ~$[modelling cache coherence trafﬁc 
focusing %%#%% %%#%% network %%#%% ]^[ ]n[ modelling application 
behaviour %%#%% %%#%% instruction level %%#%% %%#%% benefit %%#%% keeping 
%%#%% methodology generic ]^[ simple – %%#%% %%#%% apply synfull 
%%#%% %%#%% application’s traffic data %%#%% %%#%% straightforward manner%%per%%]$~ 
~$[although %%#%% abstract %%#%% %%#%% system components%%lst%% ]n[ %%#%% 
network messages %%#%% equal ]s[ %%#%% %%#%% %%#%% %%#%% capture differ%%dsh%% 
ent message types injected %%#%% %%#%% coherence protocol%%per%%]$~ ~$[message 
types %%#%% %%#%% function %%#%% %%#%% cache coherence protocol%%lst%% ]b[ %%#%% 
protocols %%#%% conceptually similar %%#%% %%#%% %%#%% behave%%per%%]$~ ~$[a cache 
table 1%%cln%% 1%%dsh%%to%%dsh%%1 request%%dsh%%response mappings%%per%% $ signifies cache%%per%%]$~ 
~$[message received 
cache replacement 
forwarded request 
invalidation 
data 
source 
cache 
directory 
directory 
cache 
reaction 
writeback ack%%per%%]$~ 
~$[data 
ack%%per%%]$~ 
~$[unblock 
destination 
original requestor ($) 
original requestor ($) 
original requestor ($) 
directory 
miss invokes %%#%% coherence transaction %%#%% %%#%% local coherence 
controller %%#%% %%#%% form %%#%% %%#%% read ]v[ write %%#%% %%cmp%% results 
%%#%% %%#%% series %%#%% requests ]^[ responses [40]%%per%%]$~ ~$[in %%#%% section%%lst%% %%#%% 
explore modelling packets %%#%% initiate %%#%% coherence transaction 
separately %%#%% packets %%#%% react %%#%% received messages%%per%% 
4%%per%%1%%per%%]$~ ~$[initiating packets 
%%#%% model %%#%% %%#%% send initiating messages%%lst%% %%#%% collect %%#%% 
number %%#%% packets (p) injected %%#%% %%#%% network ]f[ %%#%% %%#%% 
interval spanning %%#%% cycles%%per%%]$~ ~$[then%%lst%% %%#%% generating synthetic 
trafﬁc%%lst%% %%#%% simply inject %%#%% packets uniformly %%#%% %%#%% cycles3%%per%%]$~ 
~$[to answer %%#%% injects %%#%% packet%%lst%% %%#%% observe %%#%% distribution 
%%#%% packets injected %%#%% %%#%% network nodes%%per%%]$~ ~$[this distribution 
%%#%% %%#%% %%#%% probability %%#%% particular node %%#%% inject %%#%% packet 
]^[ %%#%% capture spatial behaviour %%#%% applications [41%%lst%% 44]%%per%%]$~ ~$[the 
answer %%#%% %%#%% %%#%% packet %%#%% %%#%% %%#%% %%#%% modelled using %%#%% 
similar method %%#%% relative probabilities%%per%%]$~ ~$[given %%#%% source 
(s) %%#%% %%#%% packet%%lst%% %%#%% determine %%#%% destination (d) using%%cln%% 
p(d | s) = 
number %%#%% %%#%% packets sent %%#%% %%#%% %%#%% rom %%#%% 
number %%#%% %%#%% packets sent %%#%% %%#%% 
(1) 
finally%%lst%% %%#%% answer %%#%% %%#%% packet %%#%% injected %%#%% split %%#%% %%#%% 
pr (total number %%#%% reads) ]^[ pw (total number %%#%% writes)%%per%%]$~ 
~$[the distinction %%#%% reads ]^[ writes %%#%% necessary %%cmp%% 
%%#%% result %%#%% %%#%% reactions – writes lead %%#%% invalidations 
%%#%% %%#%% broadcast %%#%% %%#%% noc%%scn%% %%#%% %%#%% signiﬁcantly impact 
noc performance%%per%% 
4%%per%%2%%per%%]$~ ~$[reactive packets 
%%#%% responses %%#%% maintain cache coherence %%#%% %%#%% simple 
one%%dsh%%to%%dsh%%one mapping %%#%% requests%%lst%% %%#%% %%#%% %%#%% acknowledge%%dsh%% 
ment responding %%#%% %%#%% invalidation request%%per%%]$~ ~$[upon receiving %%#%% 
particular message%%lst%% %%#%% protocol reacts %%#%% %%#%% predetermined 
response%%per%%]$~ ~$[table 1 %%#%% %%#%% simplified view %%#%% %%#%% reactive as%%dsh%% 
pect %%#%% cache coherence%%per%%]$~ ~$[most reactions %%#%% straightforward ]b[ 
%%#%% requests lead %%#%% multiple %%#%% responses%%lst%% particularly%%cln%% 
forwarded requests%%cln%% %%#%% %%#%% data %%#%% %%#%% cached %%#%% chip%%lst%% 
%%#%% coherence protocol forwards %%#%% request %%#%% %%#%% cache contain%%dsh%% 
ing %%#%% data%%per%%]$~ ~$[otherwise%%lst%% %%#%% request goes %%#%% chip %%#%% memory%%per%%]$~ 
~$[invalidates%%cln%% %%#%% %%#%% write request arrives ]f[ %%#%% cache block 
shared %%#%% multiple readers%%lst%% %%#%% readers %%#%% %%#%% invalidated%%per%%]$~ 
~$[next%%lst%% %%#%% explore %%#%% %%#%% situations ]^[ %%#%% %%#%% model %%#%% 
]s[ %%#%% %%#%% %%#%% realistically generate cache coherence trafﬁc%%per%% 
4%%per%%2%%per%%1%%per%%]$~ ~$[forwarding vs%%per%%]$~ ~$[off%%dsh%%chip %%#%% %%#%% read ]v[ write request 
arrives %%#%% %%#%% directory%%lst%% %%#%% requested block %%#%% %%#%% %%#%% %%#%% 
%%#%% core’s cache%%per%%]$~ ~$[in %%#%% case%%lst%% %%#%% request %%#%% forwarded %%#%% 
3we %%#%% explored injecting packets using bernoulli ]^[ exponential distri%%dsh%% 
butions%%per%%]$~ ~$[however%%lst%% %%#%% differences %%#%% performance %%#%% negligible%%per%%]$~ 
~$[figure 3%%cln%% %%#%% probability %%#%% read ]v[ write request %%#%% forwarded 
%%#%% cache holding %%#%% data%%per%%]$~ ~$[otherwise%%lst%% %%#%% off%%dsh%%chip memory 
request occurs%%per%%]$~ ~$[fig%%per%% 3 %%#%% %%#%% fraction %%#%% forwarded read 
]^[ write requests broken %%#%% %%#%% directory ]f[ splash%%dsh%%2’s 
fft benchmark4%%per%%]$~ ~$[the probability %%#%% forwarding %%#%% read ]v[ 
write changes according %%#%% %%#%% directory %%#%% %%#%% requested%%per%%]$~ 
~$[therefore%%lst%% %%#%% model %%#%% distribution %%#%% forwarding probabili%%dsh%% 
ties %%#%% %%#%% per%%dsh%%directory basis%%per%%]$~ ~$[in sec%%per%% 4%%per%%2%%per%%2%%lst%% %%#%% %%#%% %%#%% %%#%% 
%%#%% %%#%% affect %%#%% invalidations%%lst%% ]^[ %%#%% directories %%#%% 
act %%#%% hot spots %%#%% %%#%% applications%%per%%]$~ ~$[we %%#%% note %%#%% %%#%% 
probabilities %%#%% forwarding %%#%% read ]v[ %%#%% write request %%#%% ]n[ 
equal%%per%%]$~ ~$[this distinction %%#%% critical %%#%% write requests %%#%% trigger 
invalidations %%#%% sharers %%#%% %%#%% represent %%#%% substantial burst 
%%#%% network trafﬁc ]f[ widely%%dsh%%shared data%%per%% 
4%%per%%2%%per%%2%%per%%]$~ ~$[invalidates %%#%% %%#%% write miss%%lst%% %%#%% %%#%% %%#%% chance %%#%% %%#%% 
cache block %%#%% requested %%#%% multiple sharers%%scn%% %%#%% number 
%%#%% sharers determines %%#%% number %%#%% invalidates %%#%% %%#%% %%#%% 
multicast %%#%% %%#%% noc%%per%%]$~ ~$[fig%%per%% 4 %%#%% %%#%% per%%dsh%%directory prob%%dsh%% 
ability %%#%% sending 0 %%#%% 15 invalidates %%#%% %%#%% 16%%dsh%%node network 
]f[ fft%%per%%]$~ ~$[some directories (1%%lst%% 3%%lst%% 11%%lst%% ]^[ 12) exhibit bimodal 
behaviour%%scn%% %%#%% invalidate 0 ]v[ n− 1 sharers%%per%%]$~ ~$[referring %%#%% 
%%#%% fig%%per%% 3%%lst%% %%#%% %%#%% %%#%% %%#%% %%#%% directories behave similarly %%#%% 
%%#%% forwarding probabilities%%per%%]$~ ~$[other directories resemble %%#%% 
exponential distribution%%lst%% %%#%% 0 invalidates %%#%% %%#%% %%#%% 
probability%%per%%]$~ ~$[invalidates %%#%% signiﬁcantly impact network per%%dsh%% 
formance%%scn%% applications %%#%% share ]^[ exchange data %%#%% %%#%% %%#%% 
rate %%#%% ﬂood %%#%% network %%#%% %%#%% invalidates ]^[ strain 
%%#%% resources%%per%%]$~ ~$[we model %%#%% distribution %%#%% %%#%% number %%#%% 
invalidates %%#%% %%#%% per%%dsh%%directory basis %%#%% ensure %%#%% synthetically 
generated trafﬁc %%#%% similar affects %%#%% noc performance%%per%% 
4%%per%%3%%per%%]$~ ~$[summary 
%%#%% section %%#%% %%#%% %%#%% model cache coherence trafﬁc %%#%% 
reacting %%#%% messages injected %%#%% %%#%% noc%%per%%]$~ ~$[read ]^[ write 
requests %%#%% forwarded %%#%% %%#%% probability %%#%% %%#%% nodes %%#%% 
%%#%% noc%%lst%% ]^[ invalidates %%#%% %%#%% sent %%#%% %%#%% %%#%% probability 
%%#%% %%#%% directory %%#%% write request %%#%% arrived at%%per%%]$~ ~$[to react %%#%% 
messages%%lst%% read ]^[ write requests %%#%% ﬁrst %%#%% injected %%#%% 
%%#%% noc%%per%%]$~ ~$[static injection rates %%#%% ]n[ sufﬁcient %%#%% achieve %%#%% 
accuracy – %%#%% %%#%% %%#%% consider application phase behaviour%%per%% 
4our system conﬁguration assumes 1 slice %%#%% %%#%% directory %%#%% located %%#%% 
%%#%% tile %%#%% %%#%% 16%%dsh%%core cmp%%per%%]$~ ~$[addresses %%#%% interleaved %%#%% directories%%per%%]$~ 
~$[figure 4%%cln%% number %%#%% sharers %%#%% write %%#%% %%#%% directories 
%%#%% explore phase behaviour %%#%% sec%%per%% 5 ]^[ propose %%#%% model 
%%#%% captures ]^[ applies phases %%#%% generated network trafﬁc%%per%% 
5%%per%%]$~ ~$[trafﬁc phases 
applications %%#%% well%%dsh%%known %%#%% exhibit phase behaviour [38]%%per%%]$~ 
~$[phases %%#%% %%#%% %%#%% signiﬁcant impact %%#%% %%#%% instructions 
%%#%% cycle%%lst%% miss rates%%lst%% ]^[ prediction rates %%#%% various mi%%dsh%% 
croarchitectures%%per%%]$~ ~$[noc trafﬁc %%#%% %%#%% affected %%#%% application 
phases [20%%lst%% 51]%%scn%% %%#%% methodology %%#%% %%#%% capture %%#%% phase 
behaviour %%cmp%% %%#%% intends %%#%% realistically generate synthetic trafﬁc%%per%%]$~ 
~$[we propose examining traffic %%#%% %%#%% granularities%%cln%% macro 
(millions ]v[ billions %%#%% cycles) ]^[ micro (thousands %%#%% hun%%dsh%% 
dreds %%#%% thousands %%#%% cycles)%%per%%]$~ ~$[at %%#%% macro level%%lst%% %%#%% observe 
noticeable differences %%#%% %%#%% behaviour %%#%% %%#%% application %%#%% %%#%% 
moves %%#%% %%#%% phase %%#%% %%#%% (perhaps due %%#%% %%#%% barrier ]v[ 
%%#%% %%#%% %%#%% %%#%% outer%%dsh%%loop)%%per%%]$~ ~$[at %%#%% micro%%dsh%%level %%#%% %%#%% %%#%% %%#%% 
%%#%% capture short bursts %%#%% network activity%%per%%]$~ ~$[each level %%#%% divided 
%%#%% fixed%%dsh%%sized%%lst%% successive time intervals measured %%#%% cycles%%per%%]$~ 
~$[dividing trafﬁc %%#%% intervals allows %%#%% %%#%% analyze network 
trafﬁc %%#%% %%#%% ﬁne granularity%%per%%]$~ ~$[considering %%#%% entire application 
%%#%% %%#%% captures average behaviour%%scn%% reproducing %%#%% average 
behaviour %%#%% negatively impact %%#%% design ]^[ evaluation %%#%% 
nocs%%per%%]$~ ~$[for example%%lst%% smoothing %%#%% periods %%#%% %%#%% trafﬁc %%#%% 
result %%#%% %%#%% noc %%#%% %%#%% saturated %%#%% key application 
phases%%per%%]$~ ~$[alternatively%%lst%% bringing low periods %%#%% communication 
%%#%% %%#%% %%#%% average %%#%% cause %%#%% designer %%#%% miss potential oppor%%dsh%% 
tunities ]f[ power gating ]v[ dvfs %%#%% %%#%% noc%%per%%]$~ ~$[intervals allow 
%%#%% %%#%% capture ﬁne%%dsh%%grain changes %%#%% trafﬁc%%per%%]$~ ~$[however%%lst%% selecting 
%%#%% single (random) interval %%#%% ]n[ necessarily characteristic %%#%% 
%%#%% entire simulation%%per%%]$~ ~$[yet considering %%#%% intervals %%#%% %%#%% 
difﬁcult %%#%% model %%#%% %%#%% markov chain (sec%%per%% 6) ]^[ %%#%% yield 
little simulation speedup%%per%%]$~ ~$[therefore%%lst%% %%#%% %%#%% intervals %%#%% 
behave similarly %%#%% %%#%% trafﬁc phases via clustering%%per%%]$~ 
~$[this section explores various alternative approaches %%#%% iden%%dsh%% 
tifying similar behaviour %%#%% intervals %%#%% feature 
vectors (sec%%per%% 5%%per%%1)%%per%%]$~ ~$[each vector contains elements (features) 
%%#%% measure %%#%% aspect %%#%% trafﬁc %%#%% %%#%% interval (e%%per%%g%%per%%%%lst%% %%#%% 
injection rate)%%per%%]$~ ~$[vectors %%#%% %%cmp%% %%cmp%%d %%#%% calculating %%#%% 
distance %%#%% them%%scn%% %%#%% clustering algorithm creates %%#%% 
%%#%% intervals %%#%% vectors %%#%% close %%#%% (sec%%per%% 5%%per%%2)%%per%% 
0%%per%%00%%per%%20%%per%%40%%per%%612345678910111213141516directoryprobability %%#%% forward %%#%% requestvariablewritesreads 1 2 3 4 5 6 7 8 9101112131415160%%per%%000%%per%%250%%per%%500%%per%%751%%per%%000%%per%%000%%per%%250%%per%%500%%per%%751%%per%%000%%per%%000%%per%%250%%per%%500%%per%%751%%per%%000%%per%%000%%per%%250%%per%%500%%per%%751%%per%%00051015051015051015051015number %%#%% invalidatesprobability 5%%per%%1%%per%%]$~ ~$[feature vector design 
deﬁning similarity %%#%% intervals %%#%% non%%dsh%%trivial%%per%%]$~ ~$[one %%#%% %%#%% 
consider %%#%% elements %%#%% %%#%% feature vector%%lst%% %%#%% dimensionality 
]^[ scalability%%per%%]$~ ~$[in %%#%% section%%lst%% %%#%% %%#%% %%#%% subset %%#%% potential 
feature vectors %%#%% %%#%% %%#%% %%#%% %%#%% cluster intervals %%#%% trafﬁc 
phases%%scn%% %%#%% discussion %%#%% ]n[ meant %%#%% %%#%% exhaustive ]b[ %%#%% 
captures %%#%% range %%#%% trafﬁc metrics ]^[ feature vector scalability%%per%%]$~ 
~$[it %%#%% %%#%% tempting %%#%% %%#%% feature vectors %%#%% %%#%% el%%dsh%% 
ements%%per%%]$~ ~$[there %%#%% %%#%% trade%%dsh%%off %%#%% capturing %%#%% range %%#%% 
communication attributes ]^[ %%#%% effectiveness ]^[ ease %%#%% 
clustering%%per%%]$~ ~$[large feature vectors %%#%% suffer %%#%% %%#%% curse %%#%% 
dimensionality %%#%% %%#%% data available %%#%% populate %%#%% vector 
%%#%% insufﬁcient ]f[ %%#%% size %%#%% %%#%% vector [4]%%per%%]$~ ~$[in addition%%lst%% hav%%dsh%% 
ing %%#%% large number %%#%% observations %%#%% additional strain %%#%% 
%%#%% clustering algorithm%%scn%% %%#%% clustering algorithms %%#%% %%#%% 
complexity %%#%% o(cid:0)n3(cid:1) (where %%#%% %%#%% %%#%% number %%#%% vectors)%%per%%]$~ ~$[we 
explore %%#%% %%#%% approaches %%#%% construct feature vectors%%cln%% 
1%%per%%]$~ ~$[injection rate%%cln%% number %%#%% packets injected %%#%% %%#%% interval 
2%%per%%]$~ ~$[injection flows%%cln%% number %%#%% packets injected %%#%% 
source%%dsh%%destination pairs %%#%% interval 
%%#%% %%#%% explored feature vectors %%#%% consider cache coher%%dsh%% 
ence message types%%per%%]$~ ~$[in %%#%% way%%lst%% intervals %%#%% dominant read 
and/or write phases %%#%% clustered together%%per%%]$~ ~$[however%%lst%% %%#%% %%#%% 
approach %%#%% ]n[ capture %%#%% spatial injection distribution %%#%% 
packets%%per%%]$~ ~$[as %%#%% result%%lst%% intervals %%#%% similar hot spots %%#%% ]n[ 
clustered together%%per%%]$~ ~$[as %%#%% %%#%% %%#%% sec%%per%% 8%%lst%% %%#%% information %%#%% 
crucial %%cmp%% %%#%% expect %%#%% synthetically generate realistic trafﬁc%%per%% 
5%%per%%1%%per%%1%%per%%]$~ ~$[injection rate injection rate %%#%% %%#%% captured %%#%% differ%%dsh%% 
ent ways%%per%%]$~ ~$[considering %%#%% injection rate %%#%% %%#%% nodes (total 
injection) %%#%% simple%%lst%% one%%dsh%%dimensional feature vectors %%#%% 
allow %%#%% %%#%% differentiate %%#%% intervals %%#%% %%#%% experi%%dsh%% 
encing high%%lst%% medium ]v[ low levels %%#%% communication%%per%%]$~ ~$[the 
beneﬁt %%#%% %%#%% vector %%#%% %%#%% %%#%% %%#%% easy %%#%% create%%per%%]$~ ~$[calculating 
%%#%% distance %%#%% vectors ]^[ applying clustering %%#%% fast 
%%cmp%% %%#%% %%#%% one%%dsh%%dimensional%%per%%]$~ ~$[yet total injection %%#%% %%#%% 
%%#%% simple%%scn%% %%#%% total number %%#%% packets %%#%% ]n[ reveal %%#%% 
spatial characteristics %%#%% %%#%% trafﬁc%%per%%]$~ ~$[even %%#%% %%#%% vectors 
%%#%% similar magnitudes%%lst%% %%#%% respective intervals %%#%% ex%%dsh%% 
hibit %%#%% spatial behaviour%%lst%% %%#%% %%#%% hot spots%%per%%]$~ ~$[using %%#%% 
injection rate %%#%% individual nodes alleviates %%#%% %%#%% %%#%% is%%dsh%% 
sues%%per%%]$~ ~$[an n%%dsh%%dimensional vector %%#%% per%%dsh%%node injection rates 
(node injection) captures %%#%% spatial characteristics %%#%% %%#%% 
applications%%per%% 
5%%per%%1%%per%%2%%per%%]$~ ~$[injection flows node injection helps identify injecting 
hotspots – %%#%% is%%lst%% nodes %%#%% send %%#%% lot %%#%% packets%%per%%]$~ ~$[but hot 
spots %%#%% %%#%% exist %%#%% %%#%% destination – %%#%% is%%lst%% nodes %%#%% receive 
%%#%% lot %%#%% packets%%per%%]$~ ~$[to capture %%#%% relationship %%#%% sent 
]^[ received messages%%lst%% %%#%% %%#%% %%#%% ﬂows [20]%%per%%]$~ ~$[a ﬂow %%#%% %%#%% 
injection rate %%#%% %%#%% source ]^[ %%#%% destination%%per%%]$~ ~$[for %%#%% n%%dsh%% 
node network%%lst%% %%#%% %%#%% n2 source%%dsh%%destination ﬂow pairs%%per%%]$~ ~$[we 
construct %%#%% feature vector (per%%dsh%%node flow) %%#%% captures %%#%% 
information%%per%%]$~ ~$[this vector scales quadratically %%#%% %%#%% number 
%%#%% nodes%%per%%]$~ ~$[sufﬁcient data %%#%% %%#%% %%#%% %%#%% %%#%% %%#%% trafﬁc ]v[ %%cmp%% 
table 2%%cln%% %%#%% trafﬁc feature vectors ]f[ %%#%% n%%dsh%%node network 
feature vector 
total injection 
node injection 
row%%dsh%%column 
flow 
per%%dsh%%node 
flows [20] 
# %%#%% features 
1 
%%#%% 
%%#%% 
n2 
description 
total number %%#%% packets injected 
packets injected ]f[ %%#%% network node 
packets injected %%#%% rows ]^[ columns 
%%#%% %%#%% network 
packets 
destination pair 
injected %%#%% %%#%% source%%dsh%% 
%%#%% feature vector falls prey %%#%% %%#%% curse %%#%% dimensionality%%per%%]$~ 
~$[we %%#%% simplify per%%dsh%%node flow feature vectors %%#%% aggregat%%dsh%% 
ing nodes %%#%% rows ]^[ columns (row%%dsh%%column flow)%%per%%]$~ ~$[each 
element %%#%% %%#%% vector corresponds %%#%% %%#%% number %%#%% packets 
sent %%#%% %%#%% row %%#%% nodes %%#%% %%#%% column %%#%% nodes%%per%%]$~ ~$[we %%#%% %%#%% words 
row ]^[ column ]f[ simplicity – %%#%% actual mapping %%#%% nodes 
%%#%% %%#%% network %%#%% ]n[ %%#%% %%#%% %%#%% grid%%dsh%%like%%per%% 
5%%per%%1%%per%%3%%per%%]$~ ~$[summary %%#%% introduce %%#%% potential feature vectors 
%%#%% classify trafﬁc phases%%per%%]$~ ~$[these %%#%% summarized %%#%% table 2%%per%%]$~ 
~$[each vector %%#%% %%#%% own pros ]^[ cons%%lst%% ]^[ %%#%% vectors %%#%% 
%%#%% suited ]f[ %%#%% %%#%% macro ]v[ micro scale%%per%%]$~ ~$[we explore %%#%% 
impact %%#%% %%#%% feature vectors %%#%% sec%%per%% 8%%per%% 
5%%per%%2%%per%%]$~ ~$[clustering methods 
feature vectors %%#%% %%#%% %%#%% cluster intervals %%#%% trafﬁc phases%%per%%]$~ 
~$[we calculate %%#%% distance %%#%% vectors ]^[ %%cmp%% apply 
%%#%% clustering method%%per%%]$~ ~$[distance calculations %%#%% affected %%#%% 
%%#%% dimensionality %%#%% %%#%% vector (i%%per%%e%%per%% number %%#%% features)%%scn%% 
%%cmp%%%%lst%% feature vectors %%#%% scale poorly (table 2) lead %%#%% 
%%#%% overhead ]^[ modelling time%%per%%]$~ ~$[in %%#%% section%%lst%% %%#%% look 
%%#%% %%#%% clustering approaches%%cln%% partitional ]^[ hierarchical ]^[ 
weigh %%#%% beneﬁts%%per%%]$~ ~$[ultimately%%lst%% %%#%% %%#%% %%#%% approaches 
%%#%% %%#%% granularities%%lst%% %%#%% %%#%% discuss %%#%% sec%%per%% 6%%per%% 
5%%per%%2%%per%%1%%per%%]$~ ~$[partitional clustering partitional clustering desig%%dsh%% 
nates %%#%% feature vector %%#%% %%#%% central %%#%% %%#%% group%%scn%% %%#%% %%#%% 
euclidean distance %%#%% %%#%% measure %%#%% closeness %%#%% vec%%dsh%% 
tors%%per%%]$~ ~$[although k%%dsh%%means %%#%% %%#%% %%#%% popular%%lst%% %%#%% %%#%% k%%dsh%%medoids 
(speciﬁcally%%lst%% partitioning%%dsh%%around%%dsh%%medoids ]v[ pam)%%per%%]$~ ~$[pam 
performs %%#%% pairwise comparison %%#%% %%#%% distances %%#%% %%#%% 
vector (v ) ]^[ %%#%% %%#%% vector %%#%% %%#%% group%%per%%]$~ ~$[although 
slower %%cmp%% k%%dsh%%means%%lst%% pam %%#%% able %%#%% provide %%#%% central vector 
(medoid) ]f[ %%#%% group%%per%%]$~ ~$[this allows %%#%% %%#%% select %%#%% interval 
%%#%% %%#%% %%#%% representative %%#%% %%#%% trafﬁc phase%%per%%]$~ ~$[partitional clus%%dsh%% 
tering %%#%% %%#%% np%%dsh%%hard problem%%lst%% %%#%% heuristics %%#%% available 
%%#%% %%#%% %%#%% complexity ]^[ speed low [46]%%per%%]$~ 
~$[partitional clustering requires %%#%% number %%#%% trafﬁc phases 
(or clusters k) %%#%% %%#%% %%#%% input %%#%% %%#%% algorithm%%per%%]$~ ~$[formal meth%%dsh%% 
ods exist [34] %%#%% determine %%#%% optimum %%#%% value%%lst%% %%#%% ]n[ 
%%#%% methodologies agree %%#%% %%#%% %%#%% k%%per%%]$~ ~$[two common meth%%dsh%% 
ods %%#%% estimate %%#%% optimal %%#%% %%#%% average silhouette width 
(asw) [35] ]^[ %%#%% calinksi%%dsh%%harabasz (ch) index [6]%%per%%]$~ ~$[we 
explore %%#%% effects %%#%% %%#%% using %%#%% %%#%% methods %%#%% sec%%per%% 8%%per%%1%%per%% 
5%%per%%2%%per%%2%%per%%]$~ ~$[hierarchical clustering hierarchical clustering %%#%% %%#%% 
efﬁcient%%lst%% deterministic approach %%#%% %%#%% trafﬁc phases%%per%%]$~ 
~$[however%%lst%% %%#%% %%#%% %%#%% complexity %%#%% o(n3) (where %%#%% %%#%% %%#%% number 
%%#%% vectors)%%lst%% %%#%% %%#%% %%#%% suited %%#%% clustering %%#%% data 
sets%%per%%]$~ ~$[hierarchical clustering creates %%#%% tree (a dendogram) %%#%% %%#%% 
feature vectors%%lst%% linking vectors %%#%% based %%#%% distance ]^[ 
%%#%% linkage criterion5%%per%%]$~ ~$[the algorithm iteratively combines %%#%% 
%%#%% clusters %%#%% %%#%% %%#%% least impact %%#%% %%#%% sum %%#%% squares 
error%%per%%]$~ ~$[different levels %%#%% %%#%% tree indicate %%#%% vectors belong 
%%#%% %%#%% clusters%%scn%% %%#%% tree %%#%% %%#%% cut %%#%% %%#%% user%%dsh%%deﬁned level 
%%#%% provide %%#%% desired number %%#%% trafﬁc phases%%per%%]$~ ~$[we %%#%% %%#%% 
l%%dsh%%method [36] %%#%% determine %%#%% appropriate number %%#%% clusters 
%%#%% hierarchical clustering%%per%% 
6%%per%%]$~ ~$[injection process 
%%#%% sec%%per%% 5%%lst%% %%#%% introduce macro%%dsh%% ]^[ micro%%dsh%%level granularities 
]f[ intervals%%per%%]$~ ~$[each macro%%dsh%%interval %%#%% %%#%% broken %%#%% %%#%% 
micro%%dsh%%intervals%%per%%]$~ ~$[then%%lst%% %%#%% %%#%% intervals %%#%% trafﬁc phases 
using clustering%%per%%]$~ ~$[next%%lst%% %%#%% demonstrate %%#%% %%#%% construct %%#%% 
hierarchical markov chain ]f[ %%#%% macro%%dsh%% ]^[ micro%%dsh%%levels%%per%%]$~ 
~$[fig%%per%% 1 %%#%% %%#%% overview %%#%% %%#%% approach%%lst%% %%#%% macro%%dsh%%scale 
trafﬁc %%#%% %%#%% decomposed %%#%% micro%%dsh%%scale intervals%%lst%% ]^[ 
%%#%% markov chains govern %%#%% transitions %%#%% phases%%per%%]$~ 
~$[markov chains %%#%% typically %%#%% %%#%% model stochastic pro%%dsh%% 
cesses%%per%%]$~ ~$[a markov chain %%#%% %%#%% %%#%% %%#%% %%#%% number %%#%% states%%lst%% 
%%#%% transition probabilities deﬁned ]f[ moving %%#%% %%#%% state 
%%#%% another%%per%%]$~ ~$[in %%#%% case%%lst%% states correspond %%#%% macro%%dsh%% ]v[ micro%%dsh%% 
phases%%lst%% ]^[ transitioning %%#%% %%#%% phase %%#%% %%#%% allows 
%%#%% %%#%% accurately replicate %%#%% time%%dsh%%varying behaviour %%#%% %%#%% 
application’s injection process%%per%%]$~ 
~$[macro scale %%#%% %%#%% application runtimes%%lst%% %%#%% number 
%%#%% intervals %%#%% %%#%% macro level ranges %%#%% hundreds %%#%% thou%%dsh%% 
sands%%per%%]$~ ~$[this variability ]^[ %%#%% resulting large number %%#%% vec%%dsh%% 
tors means hierarchical clustering %%#%% ]n[ %%#%% %%#%% ﬁt %%cmp%% 
%%#%% %%#%% o(n3) complexity%%scn%% %%cmp%% %%#%% %%#%% pam %%#%% %%#%% macro 
scale%%per%%]$~ ~$[pam %%#%% %%#%% %%#%% medoid %%#%% %%#%% trafﬁc phase – %%#%% is%%lst%% 
%%#%% single macro interval %%#%% %%#%% represents %%#%% macro phase%%per%%]$~ 
~$[having %%#%% single macro%%dsh%%interval ]f[ %%#%% phase signiﬁcantly re%%dsh%% 
duces %%#%% amount %%#%% data modelled%%per%%]$~ ~$[once %%#%% %%#%% %%#%% medoid 
]f[ %%#%% trafﬁc phase%%lst%% %%#%% pass %%#%% %%#%% %%#%% micro model ]^[ 
analyze %%#%% trafﬁc %%#%% %%#%% ﬁner granularity%%per%%]$~ ~$[we create %%#%% micro 
model ]f[ %%#%% macro%%dsh%%interval selected%%per%%]$~ 
~$[micro scale %%#%% micro scale looks %%#%% %%#%% %%#%% %%#%% subset 
%%#%% %%#%% overall trafﬁc%%per%%]$~ ~$[dividing %%#%% macro%%dsh%%interval %%#%% micro%%dsh%% 
intervals allows %%#%% %%#%% capture %%#%% injection process %%#%% %%#%% ﬁner 
granularity%%scn%% %%#%% %%#%% necessary %%#%% capture bursty ﬂuctuations %%#%% 
trafﬁc %%#%% %%#%% greatly inﬂuence network performance%%per%%]$~ ~$[unlike 
%%#%% %%#%% macro%%dsh%%level%%lst%% %%#%% %%#%% ]n[ looking ]f[ %%#%% single representa%%dsh%% 
tive interval %%#%% trafﬁc phase%%per%%]$~ ~$[a single representative interval 
%%#%% ]n[ contain %%#%% data %%#%% form %%#%% accurate micro%%dsh%%level 
model%%per%%]$~ ~$[since %%#%% %%#%% ]n[ %%#%% %%#%% medoid%%lst%% %%#%% %%#%% hierarchical 
clustering %%#%% %%#%% micro scale%%per%%]$~ 
~$[hierarchy %%#%% model multiple markov chains ]f[ %%#%% hierar%%dsh%% 
chy %%#%% macro%%dsh%% ]^[ micro%%dsh%%levels%%per%%]$~ ~$[one markov chain governs 
transitioning %%#%% macro%%dsh%%phases%%per%%]$~ ~$[for %%#%% macro%%dsh%%phase 
%%#%% deﬁne %%#%% markov chain ]f[ %%#%% micro%%dsh%%phases%%per%%]$~ ~$[fig%%per%% 1 
%%#%% %%#%% %%#%% level hierarchy %%#%% %%#%% macro%%dsh%%phases ]^[ 
5we %%#%% minimum%%dsh%%variance based %%#%% ward’s method [47]%%per%%]$~ 
~$[processor 
l1 caches 
l2 caches 
coherence protocol 
16 out%%dsh%%of%%dsh%%order cores%%lst%% 4%%dsh%%wide%%lst%% 80%%dsh%%instruction rob 
16 private%%lst%% 4%%dsh%%way%%lst%% 32 kb 
16 private%%lst%% 8%%dsh%%way%%lst%% 512 kb 
directory%%dsh%%based moesi (blocking) 
network 
topology 
channel width 
virtual channels 
routing alg%%per%%]$~ 
~$[buffer depth 
router pipeline 
%%#%% 
mesh 
8 bytes 
2 %%#%% port 
xy 
%%#%% 
mesh 
4 bytes 
2 %%#%% port 
adaptive xy%%dsh%%yx 
8 ﬂits 
4 stages 
flattened butterﬂy [23] 
%%#%% 
4 bytes 
4 %%#%% port 
ugal 
table 3%%cln%% simulation conﬁgurations 
%%#%% micro%%dsh%%phases%%per%%]$~ ~$[an %%#%% property %%#%% markov chains 
%%#%% %%#%% %%#%% %%#%% reach equilibrium (π)%%per%%]$~ ~$[that is%%lst%% %%#%% inﬁnite 
time%%lst%% %%#%% markov chain converges %%#%% %%#%% steady state %%#%% %%#%% 
probability %%#%% %%#%% %%#%% %%#%% %%#%% state %%#%% constant%%per%%]$~ ~$[we exploit 
%%#%% property %%#%% achieve signiﬁcant speedups %%#%% full%%dsh%%system 
simulation %%#%% sec%%per%% 10%%per%% 
7%%per%%]$~ ~$[methodology 
%%#%% evaluate synfull using %%#%% 16%%dsh%%core cmp %%#%% %%#%% conﬁgura%%dsh%% 
tion %%#%% %%#%% table 3%%per%%]$~ ~$[each node contains %%#%% core%%lst%% private l1 
cache%%lst%% private l2 cache ]^[ %%#%% directory%%per%%]$~ ~$[data %%#%% collected using 
fes2%%lst%% %%#%% full%%dsh%%system simulator [31] integrated %%#%% booksim%%lst%% %%#%% 
cycle%%dsh%%accurate network simulator [19]%%per%%]$~ ~$[we run parsec [5] 
]^[ splash%%dsh%%2 [48] benchmarks %%#%% %%#%% sim%%dsh%%small input 
set%%per%%]$~ ~$[all benchmarks %%#%% run %%#%% completion %%#%% %%#%% exception 
%%#%% facesim%%lst%% %%#%% %%#%% capped %%#%% %%#%% hundred million cycles%%per%%]$~ 
~$[to generate %%#%% synfull models%%lst%% %%#%% collect traces %%#%% full%%dsh%% 
system simulation assuming %%#%% ideal fully%%dsh%%connected noc 
%%#%% %%#%% ﬁxed %%#%% cycle latency%%per%%]$~ ~$[using %%#%% ideal network ensures 
%%#%% %%#%% model %%#%% ]n[ contain artifacts %%#%% %%#%% network%%lst%% ]^[ 
%%cmp%% %%#%% %%#%% inﬂuenced %%#%% %%#%% %%#%% topology%%lst%% routing 
algorithm%%lst%% etc%%per%%]$~ ~$[thus %%#%% single model %%#%% %%#%% %%#%% %%#%% simulate 
%%#%% wide range %%#%% noc conﬁgurations%%per%%]$~ ~$[we %%cmp%% noc per%%dsh%% 
formance %%#%% %%#%% synthetically generated network trafﬁc %%#%% 
full%%dsh%%system simulation ]^[ trace%%dsh%%based simulation using state%%dsh%% 
of%%dsh%%the%%dsh%%art packet dependency tracking based %%#%% netrace [18]%%per%%]$~ 
~$[to demonstrate %%#%% %%#%% methodology %%#%% network agnos%%dsh%% 
tic%%lst%% %%#%% %%cmp%% %%#%% %%#%% %%#%% noc conﬁgurations 
(table 3)%%per%%]$~ ~$[that is%%lst%% %%#%% %%#%% apply synfull %%#%% %%#%% noc 
conﬁgurations ]^[ capture similar behaviour %%#%% %%#%% %%#%% 
%%#%% %%#%% exhibited %%#%% full%%dsh%%system simulation%%lst%% regardless %%#%% 
%%#%% network’s conﬁguration%%per%% 
8%%per%%]$~ ~$[synfull exploration 
%%#%% proposed synfull trafﬁc model %%#%% %%#%% number %%#%% parame%%dsh%% 
ters %%#%% %%#%% %%#%% changed%%per%%]$~ ~$[initially%%lst%% %%#%% %%#%% ]n[ obvious ]v[ intuitive 
%%#%% %%#%% values %%#%% %%#%% parameters %%#%% %%#%% %%#%% accurately 
model trafﬁc%%per%%]$~ 
~$[in %%#%% section%%lst%% %%#%% explore %%#%% model pa%%dsh%% 
rameters ]^[ discuss %%#%% affects %%#%% %%#%% generated network 
trafﬁc%%lst%% noc performance ]^[ model accuracy%%per%%]$~ ~$[speciﬁcally%%lst%% 
we%%cln%% (i) evaluate %%#%% %%#%% number %%#%% macro phases affect noc 
performance%%scn%% (ii) demonstrate %%#%% %%#%% adjust %%#%% amount %%#%% 
congestion %%#%% %%#%% micro level %%#%% %%#%% feature vectors%%scn%% 
benchmark 
lu 
raytrace 
swaptions 
asw ni 
asw ti 
ch ni 
ch ti 
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
table 4%%cln%% number %%#%% macro phases ]f[ %%#%% formal methods 
]^[ feature vectors 
]^[ (iii) explore %%#%% %%#%% size %%#%% time intervals %%#%% change 
trafﬁc generated %%#%% synfull%%per%%]$~ 
~$[we look %%#%% %%#%% effects %%#%% %%#%% parameters quantitatively 
%%#%% %%#%% benchmarks%%cln%% lu (contiguous)%%lst%% raytrace%%lst%% ]^[ swap%%dsh%% 
tions%%per%%]$~ ~$[the domains %%#%% %%#%% benchmarks %%#%% different%%scn%% lu %%#%% 
%%#%% high%%dsh%%performance computing application %%#%% relies heav%%dsh%% 
ily %%#%% barriers %%#%% %%#%% synchronization primitive%%lst%% raytrace %%#%% %%#%% 
graphics%%dsh%%based benchmark %%#%% relies heavily %%#%% locks%%lst%% ]^[ 
swaptions deals %%#%% ﬁnancial analysis ]^[ %%#%% ]n[ %%#%% com%%dsh%% 
munication intensive%%per%%]$~ ~$[once %%#%% %%#%% explored %%#%% parameters 
%%#%% %%#%% %%#%% benchmarks%%lst%% %%#%% %%#%% recommendations 
%%#%% achieve noc performance estimates %%#%% %%#%% accurate %%#%% 
respect %%#%% full%%dsh%%system simulation results%%per%% 
8%%per%%1%%per%%]$~ ~$[macro phases 
macro phases constitute %%#%% largest granularity ]f[ %%#%% model – 
%%#%% macro interval %%#%% %%#%% %%#%% hundred thousand cycles long%%per%%]$~ 
~$[the number %%#%% macro phases %%#%% %%#%% %%#%% model %%#%% %%#%% function %%#%% 
application behaviour%%per%%]$~ ~$[in order %%#%% determine %%#%% number%%lst%% %%#%% 
apply formal methods (ch ]^[ asw) %%#%% %%#%% particular clustering 
%%#%% macro%%dsh%%intervals%%per%%]$~ ~$[clustering %%#%% %%#%% affected %%#%% %%#%% feature 
vectors used%%per%%]$~ ~$[the number %%#%% macro phases %%#%% %%#%% synfull 
affects %%#%% variety %%#%% trafﬁc exhibited %%#%% %%#%% macro granularity%%per%%]$~ 
~$[we explore %%#%% feature vectors %%#%% %%#%% macro%%dsh%%level%%cln%% total 
injection (ti) ]^[ node injection (ni)%%per%%]$~ ~$[our goal %%#%% %%#%% reduce 
%%#%% clustering overhead %%#%% %%#%% macro level %%cmp%% %%#%% number 
%%#%% observations %%#%% %%#%% %%#%% large ]^[ varies %%#%% benchmark – 
ti ]^[ ni require %%#%% least processing time %%#%% %%#%% %%#%% proposed 
feature vectors%%per%%]$~ ~$[using %%#%% %%#%% feature vectors%%lst%% %%#%% apply ch 
]^[ asw %%#%% %%#%% clustering %%#%% determine %%#%% optimal number %%#%% 
macro%%dsh%%phases%%per%%]$~ ~$[we assume macro%%dsh%%intervals %%#%% 500,000 cycles 
]^[ micro%%dsh%%intervals %%#%% 200 cycles%%lst%% ]^[ %%#%% ni feature vector 
%%#%% %%#%% micro level%%per%%]$~ ~$[we create %%#%% model %%#%% full%%dsh%%system 
simulation %%#%% %%#%% ideal network%%lst%% ]^[ %%cmp%% apply %%#%% trafﬁc %%#%% 
network a%%per%%]$~ ~$[we %%cmp%% %%#%% resulting average packet latency 
%%#%% full%%dsh%%system simulation (fsys)%%scn%% %%#%% metric includes %%#%% time 
%%#%% node %%#%% queued waiting %%#%% %%#%% injected %%#%% %%#%% network%%per%%]$~ 
~$[table 4 %%#%% %%#%% number %%#%% phases suggested %%#%% %%#%% asw 
]^[ ch formal methods ]f[ %%#%% ni ]^[ ti feature vectors%%lst%% ]^[ 
fig%%per%% 5 %%#%% %%#%% results %%#%% using %%#%% parameters%%per%%]$~ ~$[there %%#%% 
little variation %%#%% average packet latency %%#%% tweaking macro 
parameters ]f[ lu ]^[ swaptions%%per%%]$~ ~$[raytrace%%lst%% however%%lst%% %%#%% 
%%#%% accuracy using %%#%% ch index%%lst%% %%#%% recommends 7 ]v[ 8 
macro phases %%#%% ti ]^[ ni%%lst%% respectively%%per%%]$~ ~$[raytrace trafﬁc %%#%% 
%%#%% macro intervals %%#%% deviate %%#%% %%#%% norm%%lst%% %%#%% due 
%%#%% %%#%% %%#%% thousand locks %%#%% %%#%% [48]%%lst%% ]^[ %%cmp%% %%#%% 
%%#%% modelled %%#%% %%#%% macro phases%%per%%]$~ ~$[the locking %%#%% raytrace 
results %%#%% %%#%% unstructured communication pattern %%#%% %%#%% 
figure 5%%cln%% macro%%dsh%%level sweeping %%#%% feature vectors & number 
%%#%% phases (table 4)%%per%% 
variation%%per%%]$~ ~$[too %%#%% macro phases %%#%% force interval outliers 
%%#%% phases %%#%% %%#%% %%#%% ]n[ belong%%per%%]$~ 
~$[the %%#%% %%#%% barriers %%#%% lu results %%#%% distinct periods %%#%% low 
]^[ %%#%% communication%%scn%% %%#%% %%#%% threads reach %%#%% barrier %%#%% 
%%#%% %%#%% sudden burst %%#%% packets %%#%% %%#%% noc%%per%%]$~ ~$[this communication 
pattern maps %%#%% %%#%% 2 distinct macro phases%%per%%]$~ ~$[ch+ti %%#%% 10 
macro phases %%#%% results %%#%% %%#%% %%#%% error ]f[ synfull%%per%%]$~ 
~$[too %%#%% phases %%#%% lead %%#%% poor clustering quality %%cmp%% 
%%#%% phases %%#%% %%#%% %%#%% few%%lst%% ]v[ %%#%% %%#%% single interval%%lst%% asso%%dsh%% 
ciated %%#%% them%%per%%]$~ ~$[these phases %%#%% superﬂuous ]^[ negatively 
impact %%#%% markov chain %%cmp%% %%#%% %%#%% %%#%% rarely visited%%per%%]$~ 
~$[the single dimension %%#%% ti makes %%#%% clustering sensitive 
%%#%% ﬂuctuations %%#%% macro intervals%%scn%% %%#%% is%%lst%% %%#%% high%%dsh%% 
communication macro%%dsh%%intervals %%#%% ]n[ %%#%% clustered %%#%% 
due %%#%% %%#%% %%#%% difference %%#%% total packets%%per%%]$~ ~$[this sensitivity %%#%% 
alleviated %%#%% using %%#%% dimensions%%lst%% ]s[ %%#%% deviations %%#%% %%#%% 
element %%#%% neutralized %%#%% similarity %%#%% others%%per%%]$~ ~$[this helps 
prevent %%#%% %%#%% %%#%% %%#%% %%#%% %%#%% %%#%% phases ]f[ macro 
intervals%%scn%% thus%%lst%% %%#%% recommend ni ]f[ macro clustering ]^[ 
ch ]f[ %%#%% number %%#%% macro phases%%per%% 
8%%per%%2%%per%%]$~ ~$[congestion %%#%% %%#%% micro level 
sec%%per%% 8%%per%%1 %%#%% node injection (ni) %%#%% %%#%% feature vector %%#%% 
%%#%% micro level%%per%%]$~ ~$[ni clusters micro intervals according %%#%% %%#%% 
distribution %%#%% injected packets %%#%% nodes%%per%%]$~ ~$[while %%#%% %%#%% 
cluster hot spots %%#%% source nodes%%lst%% %%#%% %%#%% situations %%#%% hot 
spots exist %%#%% source%%dsh%%destination pairs%%per%%]$~ ~$[for example%%lst%% %%#%% 
many%%dsh%%to%%dsh%%one communication pattern %%#%% ]n[ accurately captured 
%%#%% %%#%% ni vector%%per%%]$~ ~$[the row%%dsh%%column flow (rcflow) ]^[ per%%dsh%% 
node flow (flow) feature vectors %%#%% %%#%% suited %%#%% capturing 
%%#%% hot spots%%lst%% allowing ]f[ %%#%% synthetically generated trafﬁc 
%%#%% cause congestion %%#%% full%%dsh%%system simulation might%%per%%]$~ 
~$[in %%#%% section%%lst%% %%#%% %%#%% ch+ni %%#%% %%#%% macro level %%#%% 
interval sizes %%#%% 500,000 cycles%%per%%]$~ ~$[we %%cmp%% %%#%% ni feature 
vector %%#%% rcflow ]^[ flow %%#%% 200%%dsh%%cycle micro intervals%%per%%]$~ 
~$[we run %%#%% models %%#%% network %%#%% ]^[ %%#%% average packet 
latency %%#%% fig%%per%% 6%%per%%]$~ ~$[the rcflow ]^[ flow vectors %%#%% %%#%% 
accurate %%#%% respect %%#%% full%%dsh%%system simulation ]f[ raytrace%%scn%% 
%%#%% locks %%#%% %%#%% raytrace result %%#%% speciﬁc source%%dsh%%destination 
sharing %%#%% ni %%#%% ]n[ capture%%per%%]$~ ~$[also %%#%% %%#%% %%#%% %%#%% %%#%% 
vectors %%#%% ]n[ negatively affect %%#%% accuracy ]f[ %%#%% lu ]^[ 
swaptions%%scn%% %%#%% is%%lst%% rcflow ]^[ flow %%#%% ]n[ artiﬁcially create 
congestion ]f[ benchmarks %%#%% %%#%% ]n[ exhibit %%#%% behaviour%%per%%]$~ 
~$[we %%#%% ]n[ %%#%% %%#%% %%#%% average behaviour ]b[ %%#%% cap%%dsh%% 
turing %%#%% highs ]^[ lows %%#%% network trafﬁc%%per%%]$~ ~$[looking %%#%% packet 
010203040lu continguousraytraceswaptionsaverage%%per%%packet%%per%%latencysimulationfsysasw_niasw_tich_nich_ti figure 6%%cln%% micro%%dsh%%level sweep %%#%% feature vectors 
figure 8%%cln%% noc performance ]f[ %%#%% interval sizes%%per%%]$~ 
~$[figure 7%%cln%% hellinger distance comparing packet latency distribu%%dsh%% 
tions %%#%% synthetic simulations %%#%% %%#%% system%%per%%]$~ ~$[lower %%#%% better%%per%% 
latency distributions%%lst%% %%#%% %%#%% %%#%% %%#%% number %%#%% packets %%#%% 
achieve %%#%% wide range %%#%% latencies %%#%% %%#%% %%#%% network%%scn%% %%#%% 
distribution %%#%% insight %%#%% %%#%% congestion %%#%% network %%#%% 
experienced%%per%%]$~ ~$[the hellinger distance deﬁnes %%#%% similarity 
%%#%% %%#%% distributions%%per%%]$~ ~$[the hellinger distance %%#%% deﬁned 
%%#%% equation 2%%lst%% %%#%% %%#%% ]^[ %%#%% %%#%% %%#%% discrete distributions (in 
%%#%% case%%lst%% packet latency distributions)%%lst%% ]^[ pi ]^[ qi %%#%% %%#%% 
ith element %%#%% %%#%% ]^[ q%%lst%% respectively%%per%% 
(cid:118)(cid:117)(cid:117)(cid:116) %%#%% 
∑ 
i=1 
h(p,q) = 
1√ 
2 
√ 
( 
pi −√ 
qi)2 
(2) 
fig%%per%% 7 %%#%% %%#%% hellinger distance ]f[ %%#%% synthetic trafﬁc 
latency distributions %%cmp%%d %%#%% full%%dsh%%system simulation%%per%%]$~ ~$[the 
lower %%#%% distance%%lst%% %%#%% %%#%% similar %%#%% latency distributions 
are%%per%%]$~ ~$[we %%#%% %%#%% that%%lst%% %%#%% %%#%% error %%#%% average packet 
latency %%#%% less ]f[ raytrace %%#%% %%#%% flow vector (fig%%per%% 7)%%lst%% %%#%% 
distribution %%#%% packet latencies %%#%% ]n[ %%#%% close %%#%% %%#%% system 
%%#%% rcflow%%per%%]$~ ~$[this %%#%% %%cmp%% %%#%% flow vector causes %%#%% %%#%% 
latency packets %%cmp%% full%%dsh%%system simulation%%lst%% driving %%#%% %%#%% av%%dsh%% 
erage packet latency %%#%% %%#%% congestion %%cmp%% necessary%%per%%]$~ ~$[in 
%%#%% cases%%lst%% rcflow %%#%% %%#%% similar %%#%% %%#%% desired packet latency 
distribution exhibited %%#%% full%%dsh%%system simulation%%lst%% ]^[ %%#%% error 
%%#%% average packet latency %%#%% comparable %%#%% flow%%per%%]$~ ~$[therefore%%lst%% 
%%#%% recommend rcflow ]f[ micro clustering%%per%% 
8%%per%%3%%per%%]$~ ~$[time interval size 
%%#%% %%#%% %%#%% %%#%% %%#%% 500,000 cycles %%#%% macro interval ]^[ 
200 cycles %%#%% micro interval%%per%%]$~ ~$[this results %%#%% 500,000/200 = 
2,500 micro intervals (observations) %%#%% macro interval%%lst%% %%#%% 
%%#%% low %%#%% %%#%% %%#%% hierarchical clustering time reasonable%%per%%]$~ 
~$[now%%lst%% %%#%% sweep %%#%% macro ]^[ micro interval sizes %%#%% ]s[ 
%%#%% %%#%% %%#%% result %%#%% 2,500 observations%%per%%]$~ ~$[we %%#%% ch+ni 
%%#%% %%#%% macro level%%lst%% ]^[ %%cmp%% %%#%% rcflow ]^[ flow feature 
vectors %%#%% %%#%% micro level %%#%% various interval sizes%%per%%]$~ 
~$[fig%%per%% 8 %%#%% %%#%% average packet latency ]f[ synfull trafﬁc 
%%#%% %%#%% interval sizes%%per%%]$~ ~$[there %%#%% ]n[ %%#%% %%#%% cut interval 
size %%#%% %%#%% %%#%% ]f[ %%#%% application%%per%%]$~ ~$[rcflow %%#%% %%#%% %%#%% 
feature vector 
cluster algorithm 
formal method 
interval size 
macro%%dsh%%level model 
node injection 
pam 
ch index 
500,000 
micro%%dsh%%level model 
rcflow 
hierarchical 
l%%dsh%%method 
200 
table 5%%cln%% final synfull conﬁguration 
%%#%% micro%%dsh%%interval size %%#%% 100 cycles ]f[ raytrace%%lst%% ]b[ performs 
worse ]f[ lu%%per%%]$~ ~$[applications %%#%% exhibit %%#%% periodic 
behaviour %%#%% %%#%% micro level depending %%#%% %%#%% algorithm ]v[ 
%%#%% application %%#%% ]n[ %%#%% periodic behaviour %%#%% all%%per%%]$~ ~$[when 
using large interval sizes %%#%% 500 cycles ]v[ more%%lst%% %%#%% risk ]n[ 
capturing bursty application trafﬁc %%cmp%% deviations %%#%% injec%%dsh%% 
tion rate %%#%% averaged %%#%% %%#%% %%#%% interval%%per%%]$~ ~$[for applications 
%%#%% bursty trafﬁc%%lst%% large interval sizes %%#%% %%#%% %%cmp%% 
%%#%% standard deviation %%#%% packets injected %%#%% time %%#%% low%%per%%]$~ 
~$[choosing %%#%% universal interval size ]f[ %%#%% applications %%#%% 
lead %%#%% slightly less accurate synfull results ]f[ %%#%% subset %%#%% 
benchmarks%%per%%]$~ ~$[in future work%%lst%% %%#%% %%#%% investigate automatically 
determining %%#%% interval size based %%#%% application trafﬁc%%per%% 
8%%per%%4%%per%%]$~ ~$[parameter recommendations 
based %%#%% %%#%% results %%#%% %%#%% %%#%% section%%lst%% %%#%% %%#%% %%#%% 
recommendations regarding model parameters %%#%% %%#%% synfull%%per%%]$~ 
~$[changing %%#%% feature vector %%#%% %%#%% macro level %%#%% ]n[ %%#%% %%#%% 
signiﬁcant effect %%#%% network performance%%per%%]$~ ~$[however%%lst%% %%#%% terms 
%%#%% %%#%% clustering quality (recall ti vs%%per%%]$~ ~$[ni ]f[ lu’s barriers)%%lst%% 
using %%#%% ni feature vector %%#%% %%#%% ch index yields %%#%% %%#%% 
results%%per%%]$~ ~$[for feature vectors %%#%% %%#%% micro level%%lst%% %%#%% %%#%% %%#%% %%#%% 
select %%#%% vector %%#%% adequately captures hotspots%%per%%]$~ ~$[both rcflow 
]^[ flow feature vectors %%#%% %%#%% results%%lst%% %%#%% rcflow 
scales %%#%% %%#%% %%#%% number %%#%% nodes %%#%% simulated ]^[ 
takes signiﬁcantly less time %%#%% model (typically%%lst%% %%#%% rcflow 
model takes %%#%% %%#%% minutes %%#%% generate whereas %%#%% flow model 
%%#%% %%#%% %%#%% 20)%%per%%]$~ ~$[finally%%lst%% %%#%% interval sizes %%#%% %%#%% macro 
]^[ micro levels %%#%% greatly inﬂuence trafﬁc generated %%#%% 
synfull%%per%%]$~ ~$[for %%#%% rest %%#%% %%#%% paper%%lst%% %%#%% %%#%% %%#%% 200 cycles %%#%% 
%%#%% micro%%dsh%%level ]^[ 500,000 cycles %%#%% %%#%% macro%%dsh%%level%%per%% 
9%%per%%]$~ ~$[results 
%%#%% evaluate synfull %%#%% parsec ]^[ splash%%dsh%%2 bench%%dsh%% 
marks %%#%% %%#%% %%#%% network conﬁgurations introduced %%#%% ta%%dsh%% 
ble 3%%per%%]$~ ~$[we %%cmp%% synfull %%#%% full%%dsh%%system simulation ]^[ 
trace simulation %%#%% packet dependences%%per%%]$~ ~$[for synfull%%lst%% %%#%% 
%%#%% %%#%% recommendations %%#%% sec%%per%% 8%%per%%4 summarized %%#%% table 5%%per%%]$~ 
~$[initially ]f[ %%#%% synfull ]^[ trace simulations%%lst%% %%#%% number %%#%% 
cycles simulated %%#%% equal %%#%% %%#%% number %%#%% cycles required %%#%% 
010203040lu continguousraytraceswaptionsaverage%%per%%packet%%per%%latencysimulationfsysflowrcflowni0%%per%%000%%per%%030%%per%%060%%per%%090%%per%%12lu continguousraytraceswaptionshellinger%%per%%distancesimulationflowrcflownode01020304050lu continguousraytraceswaptionsaverage%%per%%packet%%per%%latencysimulationfsysflow 100 250000flow 200 500000flow 500 1250000rcflow 100 250000rcflow 200 500000rcflow 500 1250000 figure 9%%cln%% noc performance%%per%%]$~ ~$[bars %%#%% reach %%#%% top %%#%% %%#%% y%%dsh%%axis (e%%per%%g%%per%%]$~ ~$[fft) %%#%% truncated ]s[ %%#%% %%#%% results %%#%% %%#%% seen %%#%% clearly%%per%%]$~ 
~$[figure 10%%cln%% comparing similarity %%#%% packet latency distributions %%#%% full%%dsh%%system simulation 
complete %%#%% full%%dsh%%system simulation %%#%% %%#%% benchmark %%#%% %%#%% 
ideal network%%per%%]$~ ~$[later%%lst%% %%#%% explore %%#%% simulation termination 
due %%#%% %%#%% markov chain reaching steady%%dsh%%state%%per%% 
ets%%lst%% independent packets continue %%#%% %%#%% injected according %%#%% 
%%#%% timestamp%%per%%]$~ ~$[for %%#%% applications%%lst%% especially fft ]^[ 
radix%%lst%% %%#%% %%#%% %%#%% signiﬁcant impact %%#%% noc performance%%per%%]$~ 
~$[incorporating packet dependences %%#%% trace simulation im%%dsh%% 
proves %%#%% ﬁdelity %%#%% traditional trace%%dsh%%based simulation %%#%% 
nocs [18]%%per%%]$~ ~$[traditionally%%lst%% packets %%#%% %%#%% trace %%#%% injected 
%%#%% %%#%% network %%#%% %%#%% regard ]f[ %%#%% %%#%% arrive %%#%% %%#%% 
destinations%%per%%]$~ ~$[this %%#%% unrealistic due %%#%% %%#%% reactive nature %%#%% 
%%#%% packets%%lst%% %%#%% explained %%#%% sec%%per%% 4%%per%%]$~ ~$[dependence tracking 
aims %%#%% capture %%#%% reactive nature %%#%% packets%%lst%% ]^[ %%#%% inject 
%%#%% %%#%% %%#%% requesting packet %%#%% arrived%%scn%% %%#%% injection 
%%#%% dependent packets %%#%% triggered %%#%% %%#%% packet’s arrival%%lst%% 
%%#%% %%cmp%% %%#%% timestamp %%#%% %%#%% original trace%%per%%]$~ 
~$[we %%cmp%% average packet latency %%#%% simulation 
methodologies (fig%%per%% 9)%%per%%]$~ ~$[synfull %%#%% %%#%% %%#%% %%#%% nocs 
%%#%% ]^[ c%%lst%% %%#%% %%#%% geometric mean error %%#%% 8%%per%%9% ]^[ 9%%per%%5% 
%%#%% %%#%% benchmarks%%per%%]$~ ~$[nocs %%#%% ]^[ %%#%% %%#%% reasonably well%%dsh%% 
provisioned%%scn%% %%#%% applications %%#%% ]n[ experience signiﬁcant 
contention %%#%% %%#%% networks%%per%%]$~ ~$[synfull achieves accurate aver%%dsh%% 
age packet latency %%#%% ]f[ applications %%#%% %%#%% ]n[ stress %%#%% 
network (e%%per%%g%%per%%]$~ ~$[cholesky radix%%lst%% radiosity%%lst%% swaptions)%%lst%% ]^[ ap%%dsh%% 
plications %%#%% %%#%% stress %%#%% network (e%%per%%g%%per%%]$~ ~$[barnes%%lst%% bodytrack%%lst%% 
fluidanimate)%%per%%]$~ ~$[network throughput %%#%% similar accuracy%%lst%% %%#%% 
geometric mean errors %%#%% 11%%per%%78% ]^[ 12%%per%%42% ]f[ nocs %%#%% 
]^[ c%%per%%]$~ ~$[running %%#%% ideal network trace %%#%% dependences %%#%% 
]n[ fair %%#%% %%#%% (geometric mean packet latency error %%#%% 18% 
]^[ 12%%per%%8% ]f[ nocs %%#%% ]^[ c) %%cmp%% dependences %%#%% ]n[ 
tracked %%#%% %%#%% application level%%per%%]$~ ~$[while reactive packets %%#%% 
throttled correctly waiting %%#%% %%#%% arrival %%#%% predecessor pack%%dsh%% 
noc %%#%% %%#%% %%#%% least provisioned %%#%% %%#%% 3 networks%%per%%]$~ ~$[as %%#%% 
result%%lst%% discrepancies %%#%% initiating packet injections %%#%% %%#%% 
pronounced ]f[ %%#%% synfull (16%%per%%1% packet latency error ]^[ 
%%#%% 16%%per%%11% throughput error) ]^[ traces (30%%per%%2% packet latency 
error)%%per%%]$~ ~$[traces %%#%% dependences %%#%% signiﬁcant error %%#%% ]f[ 
applications %%#%% low communication requirements (e%%per%%g%%per%%]$~ ~$[ra%%dsh%% 
diosity)%%lst%% %%#%% synfull %%#%% capable %%#%% reproducing similar noc 
performance ]f[ benchmarks %%#%% %%#%% type%%per%%]$~ ~$[some applications 
running %%#%% noc %%#%% %%#%% signiﬁcant error ]f[ %%#%% synfull ]^[ 
traces%%per%%]$~ ~$[in particular%%lst%% radix ]^[ fft (excluded %%#%% geomean 
calculations) run %%#%% %%#%% chart%%per%%]$~ ~$[these %%#%% special %%#%% %%#%% 
%%#%% application %%#%% macro%%dsh%%level intervals %%#%% %%#%% %%#%% injec%%dsh%% 
tion rates %%#%% dwarf %%#%% injection rate %%#%% %%#%% rest %%#%% %%#%% 
application%%per%%]$~ ~$[for example%%lst%% running fft %%#%% %%#%% ideal network%%lst%% 
%%#%% %%#%% %%#%% spike %%#%% %%#%% macro%%dsh%%intervals %%#%% %%#%% middle 
%%#%% simulation %%#%% %%#%% order %%#%% magnitude larger injection rate 
%%cmp%% %%#%% intervals%%per%%]$~ ~$[when running fft %%#%% full%%dsh%%system simula%%dsh%% 
tion %%#%% %%#%% considerably less provisioned noc b%%lst%% %%#%% spike %%#%% 
%%#%% ]b[ %%#%% %%#%% %%#%% lower (less %%cmp%% 50%) injection rate%%per%%]$~ 
~$[this %%#%% due %%#%% application%%dsh%%level dependences ]^[ %%#%% core’s re%%dsh%% 
order buffer throttling instruction issue %%#%% %%#%% %%#%% throttles 
network injection%%per%%]$~ ~$[however%%lst%% %%#%% %%#%% %%#%% extreme %%#%% ]^[ %%#%% 
]n[ typically found %%#%% %%#%% %%#%% %%#%% applications %%#%% consider%%scn%% 
%%#%% %%#%% investigating techniques %%#%% adapt %%#%% model %%#%% %%#%% 
scenarios%%per%%]$~ 
~$[we discussed %%#%% importance %%#%% packet latency distributions 
network anetwork bnetwork c050100150barnesblackscholesbodytrackcholeskyfacesimfftfluidanimatelu_contiguouslu_noncontiguousradiosityradixraytraceswaptionsvolrendwater_nsquaredwater_spatialgeomeanbarnesblackscholesbodytrackcholeskyfacesimfftfluidanimatelu_contiguouslu_noncontiguousradiosityradixraytraceswaptionsvolrendwater_nsquaredwater_spatialgeomeanbarnesblackscholesbodytrackcholeskyfacesimfftfluidanimatelu_contiguouslu_noncontiguousradiosityradixraytraceswaptionsvolrendwater_nsquaredwater_spatialgeomeanaverage%%per%%packet%%per%%latencyfsystrace%%per%%dependencysynfullnetwork anetwork bnetwork c0%%per%%00%%per%%20%%per%%40%%per%%60%%per%%8barnesblackscholesbodytrackcholeskyfacesimfftfluidanimatelu_cblu_ncbradiosityradixraytraceswaptionsvolrendwater_nsquaredwater_spatialbarnesblackscholesbodytrackcholeskyfacesimfftfluidanimatelu_cblu_ncbradiosityradixraytraceswaptionsvolrendwater_nsquaredwater_spatialbarnesblackscholesbodytrackcholeskyfacesimfftfluidanimatelu_cblu_ncbradiosityradixraytraceswaptionsvolrendwater_nsquaredwater_spatialhellinger%%per%%distancetrace%%per%%dependencysynfull %%#%% simulations %%#%% 8%%dsh%%byte control packets ]^[ 72%%dsh%%byte data 
packets%%per%%]$~ ~$[from fig%%per%% 11 (right) %%#%% %%#%% %%#%% %%#%% %%#%% ]n[ %%#%% 
difference %%#%% performance %%#%% %%#%% 8 ]^[ 16 byte channel 
width%%per%%]$~ ~$[this %%#%% %%cmp%% %%#%% 16 byte channel width %%#%% improves 
transmission %%#%% data packets%%lst%% %%#%% 8 bytes %%#%% %%#%% %%#%% %%#%% %%#%% 
]f[ %%#%% control packet%%per%%]$~ ~$[as %%#%% channel width decreases%%lst%% ]s[ %%#%% 
%%#%% performance due %%#%% %%#%% increased serialization latency %%#%% 
%%#%% packets%%per%%]$~ ~$[buffer depth %%#%% affects performance%%per%%]$~ ~$[smaller 
buffers increases %%#%% latency %%#%% packets %%cmp%% ﬂits %%#%% %%#%% 
wait %%#%% space %%#%% available %%#%% proceeding towards 
%%#%% destination%%per%%]$~ ~$[in %%#%% %%#%% study%%lst%% fig%%per%% 11 (left) %%#%% %%#%% 
synfull captures %%#%% relationship %%#%% perfectly%%per%%]$~ 
~$[overall%%lst%% synfull %%#%% %%#%% superior approach %%#%% trace dependences 
%%#%% terms %%#%% ﬁdelity%%per%%]$~ ~$[synfull %%#%% less prone %%#%% error %%#%% %%#%% va%%dsh%% 
riety %%#%% applications ]^[ stresses %%#%% noc %%#%% %%#%% %%#%% %%#%% 
%%#%% application %%#%% %%#%% full%%dsh%%system simulation%%per%%]$~ ~$[synfull %%#%% 
captures %%#%% %%#%% trends found %%#%% full%%dsh%%system simulation%%per%%]$~ 
~$[high accuracy %%#%% %%#%% %%#%% attribute %%#%% synfull%%scn%% indepen%%dsh%% 
dent %%#%% %%#%% accuracy relative %%#%% full%%dsh%%system simulation%%lst%% synfull 
provides %%#%% meaningful collection %%#%% synthetic trafﬁc models 
%%#%% capture %%#%% diverse range %%#%% application ]^[ cache coher%%dsh%% 
ence behaviour %%#%% synfull %%#%% invaluable tool %%#%% %%#%% noc 
designer’s arsenal%%per%%]$~ ~$[in sec%%per%% 10%%lst%% %%#%% explore %%#%% speed %%#%% synfull 
relative %%#%% full%%dsh%%system simulation%%lst%% ]^[ %%#%% %%#%% %%#%% %%#%% %%#%% 
accelerated using %%#%% special property %%#%% markov chains%%per%% 
10%%per%%]$~ ~$[exploiting markov chains ]f[ speedup 
simply running synfull ]f[ %%#%% %%#%% number %%#%% cycles %%#%% 
full%%dsh%%system simulation results %%#%% signiﬁcant speed %%#%% – %%#%% 
%%#%% %%cmp%% synfull %%#%% %%#%% ]n[ require %%#%% processing 
time%%per%%]$~ ~$[the noc simulator %%#%% %%#%% limiting factor%%lst%% ]b[ %%#%% %%#%% sub%%dsh%% 
stantially faster %%cmp%% %%#%% full%%dsh%%system simulator%%per%%]$~ ~$[we %%#%% %%#%% 
improve %%#%% simulation time %%#%% synfull %%#%% exploiting %%#%% sta%%dsh%% 
tionary distribution %%#%% markov chains%%per%%]$~ ~$[an %%#%% property 
%%#%% markov chains %%#%% %%#%% %%#%% %%#%% reach equilibrium%%per%%]$~ ~$[that is%%lst%% 
%%#%% inﬁnite time%%lst%% %%#%% markov chain converges %%#%% %%#%% steady 
state %%#%% %%#%% probability %%#%% %%#%% %%#%% %%#%% %%#%% state %%#%% constant%%per%%]$~ 
~$[in synfull%%lst%% %%#%% %%#%% macro%%dsh%%level markov chain %%#%% con%%dsh%% 
verged %%#%% %%#%% equilibrium%%lst%% %%#%% exit %%#%% simulation prematurely%%per%%]$~ 
~$[this implies %%#%% %%#%% trafﬁc phases %%#%% %%#%% simulated ]f[ %%#%% 
adequate time%%lst%% ]^[ %%#%% simulation %%#%% reached %%#%% steady state%%per%%]$~ 
~$[we %%#%% apply %%#%% %%#%% methodology %%#%% trace%%dsh%%based simu%%dsh%% 
lation %%cmp%% %%#%% follows %%#%% %%#%% progression %%#%% full%%dsh%%system 
simulation%%per%%]$~ ~$[if %%#%% exit %%#%% trace prematurely%%lst%% %%#%% %%#%% miss %%#%% %%#%% 
%%#%% large period %%#%% bursty communication ]v[ low communication%%lst%% 
%%#%% %%#%% %%#%% %%#%% %%#%% %%#%% %%#%% overall noc perfor%%dsh%% 
mance results%%per%%]$~ ~$[for example%%lst%% %%cmp%% trace simulation %%#%% fft %%#%% %%#%% 
exit early%%lst%% %%#%% %%#%% ]n[ reach %%#%% large spike %%#%% macro intervals%%lst%% 
leading noc researchers %%#%% draw incorrect conclusions%%per%%]$~ 
~$[fig%%per%% 12 %%#%% %%#%% average speedup %%#%% traces%%lst%% synfull%%lst%% ]^[ 
%%#%% synfull exiting simulation %%#%% steady%%dsh%%state (synfull_ss)%%per%%]$~ 
~$[the numbers %%#%% calculated %%#%% averaging %%#%% total runtime %%#%% 
simulations %%#%% %%#%% %%#%% %%#%% %%#%% network conﬁgurations (a%%lst%% 
b%%lst%% ]^[ c) ]f[ %%#%% application%%per%%]$~ ~$[without steady%%dsh%%state%%lst%% synfull 
figure 11%%cln%% %%#%% %%#%% studies %%#%% packet latency trends %%#%% 
%%#%% workloads 
%%#%% sec%%per%% 8%%per%%2%%lst%% ]^[ %%#%% %%#%% hellinger distance %%#%% %%cmp%% dis%%dsh%% 
tributions %%#%% full%%dsh%%system simulation%%per%%]$~ ~$[fig%%per%% 10 %%#%% packet 
latency distribution hellinger distance ]f[ synfull ]^[ traces 
%%cmp%%d %%#%% full%%dsh%%system simulation%%per%%]$~ ~$[consistent %%#%% %%#%% aver%%dsh%% 
age packet latency error%%lst%% synfull modelling fft (noc b) %%#%% 
%%#%% large hellinger distance %%#%% indicates %%#%% %%#%% resulting 
distribution %%#%% ]n[ resemble %%#%% latency distribution seen %%#%% 
full%%dsh%%system simulation%%per%%]$~ ~$[outside %%#%% fft%%lst%% %%#%% technique fares 
%%#%% ]f[ parsec ]^[ splash%%dsh%%2 applications%%per%%]$~ ~$[applications 
%%#%% low communication requirements typically %%#%% %%#%% low%%dsh%% 
est hellinger distance %%cmp%% %%#%% synfull ]^[ full%%dsh%%system 
simulation %%#%% ]n[ %%#%% %%#%% large tail %%#%% %%#%% distribution%%per%%]$~ ~$[for 
applications %%#%% %%#%% bursty behaviour%%lst%% hellinger distances 
%%#%% %%#%% ]b[ %%#%% comparable%%per%%]$~ 
~$[traces %%#%% perform %%#%% %%#%% average packet latency %%#%% nocs 
%%#%% ]^[ %%#%% perform %%#%% %%cmp%% synfull %%#%% hellinger distance 
(e%%per%%g%%per%%]$~ ~$[cholesky%%lst%% lu%%lst%% radiosity)%%per%%]$~ ~$[these applications %%#%% low 
communication requirements%%per%%]$~ ~$[as %%#%% result%%lst%% %%#%% issue %%#%% in%%dsh%% 
dependent messages ﬂooding %%#%% network %%#%% minimized %%#%% 
%%#%% well%%dsh%%provisioned network%%lst%% ]^[ %%#%% trace faithfully repro%%dsh%% 
duces application trafﬁc%%per%%]$~ ~$[due %%#%% %%#%% randomness associated 
%%#%% markov chains%%lst%% synfull phases %%#%% ]n[ exactly coincide 
%%#%% %%#%% %%#%% trace would%%per%%]$~ ~$[as %%#%% result%%lst%% %%#%% %%#%% slightly %%#%% 
hellinger distances%%lst%% ]b[ %%#%% results %%#%% %%#%% comparable%%per%%]$~ ~$[how%%dsh%% 
ever%%lst%% %%#%% comparing applications %%#%% %%#%% domains%%lst%% synfull 
%%#%% %%#%% %%#%% winner%%per%% 
9%%per%%1%%per%%]$~ ~$[capturing trends 
%%#%% absolute error values %%#%% useful%%lst%% designers expect %%#%% 
methodology %%#%% accurately capture %%#%% relationship %%#%% 
networks designs%%per%%]$~ ~$[that is%%lst%% %%cmp%% %%#%% network performs %%#%% %%cmp%% 
%%#%% %%#%% full%%dsh%%system simulation%%lst%% %%cmp%% %%#%% trend %%#%% %%#%% %%#%% 
%%#%% %%#%% using synfull%%per%%]$~ ~$[here %%#%% demonstrate %%#%% %%#%% rela%%dsh%% 
tionship %%#%% captured %%#%% %%#%% intuitive trends%%per%%]$~ ~$[speciﬁcally%%lst%% 
%%#%% perform %%#%% separate sweeps %%#%% channel width ]^[ virtual 
channel buffer size%%per%%]$~ ~$[in %%#%% ﬁrst sweep%%lst%% %%#%% look %%#%% networks 
%%#%% 16%%lst%% 8%%lst%% 4%%lst%% ]^[ 2 byte channel widths%%per%%]$~ ~$[in %%#%% %%#%% sweep%%lst%% 
%%#%% look %%#%% networks %%#%% 16%%lst%% 8%%lst%% 4%%lst%% ]^[ 2 ﬂits %%#%% buffer%%per%%]$~ ~$[intu%%dsh%% 
itively%%lst%% larger channel widths ]^[ buffer sizes %%#%% lead %%#%% 
%%#%% performance %%cmp%% %%#%% ones%%per%%]$~ ~$[indeed%%lst%% %%#%% %%#%% %%#%% %%#%% 
%%#%% shown %%#%% fig%%per%% 11%%scn%% results %%#%% averaged %%#%% %%#%% workloads%%per%%]$~ 
~$[packets %%#%% subdivided %%#%% ﬂits based %%#%% %%#%% channel width%%per%% 
llllllllbuffer sizechannel width406080481216481216number %%#%% flits (buffer size) ]v[ bytes (channel width)average packet latencylfsyssynfull figure 12%%cln%% %%#%% average speedup %%#%% %%#%% system simulation 
]^[ trace dependency speed%%dsh%%ups %%#%% %%#%% similar %%#%% %%#%% 
simulate %%#%% %%#%% number %%#%% cycles%%per%%]$~ ~$[the simulation bottleneck 
%%#%% %%#%% %%#%% noc %%#%% ]^[ ]n[ %%#%% methodology ]f[ driving 
trafﬁc%%per%%]$~ ~$[with steady state%%lst%% %%#%% achieve substantial speedup%%scn%% 
speedup %%#%% %%#%% %%#%% %%#%% ∼150× ]^[ %%#%% 50× %%#%% average%%per%%]$~ 
~$[synfull models %%#%% markov chains%%scn%% however%%lst%% %%#%% %%#%% exit 
%%#%% steady state %%#%% reached %%#%% %%#%% macro level%%per%%]$~ ~$[we %%#%% 
potentially %%#%% %%#%% macro%%dsh%%interval %%#%% %%#%% observing steady 
state %%#%% %%#%% micro level%%per%%]$~ ~$[however%%lst%% %%#%% %%#%% result %%#%% %%#%% 
length macro intervals%%lst%% %%#%% %%#%% negatively affect perfor%%dsh%% 
mance accuracy%%per%%]$~ ~$[for example%%lst%% imagine %%#%% low injection macro 
interval reaches steady state %%#%% %%#%% %%#%% %%#%% %%#%% injection 
macro interval %%#%% not%%per%%]$~ ~$[there %%#%% %%#%% %%#%% disproportionate 
amount %%#%% %%#%% injection %%#%% low injection%%lst%% negatively impact%%dsh%% 
ing %%#%% accuracy %%#%% %%#%% model%%per%%]$~ ~$[by %%#%% observing steady state 
%%#%% %%#%% macro%%dsh%%level markov chain%%lst%% %%#%% achieve similar error 
%%cmp%%d %%#%% running synfull %%#%% completion%%scn%% %%#%% %%#%% run %%#%% syn%%dsh%% 
%%#%% %%#%% %%#%% geometric mean error %%#%% 8%%per%%9%%%lst%% 16%%per%%1%%%lst%% ]^[ 9%%per%%5% 
%%#%% networks a%%lst%% b%%lst%% ]^[ c%%lst%% %%#%% synfull %%#%% steady state 
yields errors %%#%% 10%%per%%5%%%lst%% 17%%per%%1%%%lst%% ]^[ 9%%per%%1%%%per%% 
11%%per%%]$~ ~$[related %%#%% 
simulation acceleration%%per%%]$~ ~$[there %%#%% %%#%% considerable %%#%% 
%%#%% %%#%% improve simulation time%%per%%]$~ ~$[fpga%%dsh%%based acceleration 
%%#%% %%#%% proposed [11%%lst%% 43]%%per%%]$~ ~$[fist implements %%#%% fpga%%dsh%%based 
network simulator %%#%% %%#%% simulate mesh networks %%#%% signif%%dsh%% 
icant speed %%#%% %%#%% software simulation [32]%%per%%]$~ ~$[user%%dsh%%level simu%%dsh%% 
lators exist %%#%% %%#%% alternative %%#%% full%%dsh%%system simulation ]f[ ex%%dsh%% 
ploring thousands %%#%% cores [7%%lst%% 29]%%per%%]$~ ~$[zsim exploits parallel simu%%dsh%% 
lation %%#%% out%%dsh%%of%%dsh%%order core models [37]%%per%%]$~ ~$[sampling ]f[ micro%%dsh%% 
architectural simulation %%#%% %%#%% widely explored [38%%lst%% 39%%lst%% 49] 
]^[ %%#%% received renewed attention ]f[ multi%%dsh%%threaded ]^[ 
multi%%dsh%%core processors [1%%lst%% 8]%%per%%]$~ ~$[zhang et al%%per%% leverage simpoints 
]f[ network trafﬁc ]s[ %%#%% %%#%% %%#%% speed %%#%% simulations ]f[ 
parallel applications [51]%%per%%]$~ ~$[hornet [33] focuses %%#%% parallelizing 
%%#%% noc simulation%%per%%]$~ ~$[simulators %%#%% %%#%% hornet [33]%%lst%% zsim [37] 
]^[ slacksim [9] %%#%% %%#%% tools ]b[ designers %%#%% %%#%% 
prune %%#%% design space %%#%% %%#%% %%#%% candidates prior %%#%% using %%#%% 
detailed simulators%%scn%% synfull bridges %%#%% gap %%#%% existing 
synthetic models ]^[ detailed full%%dsh%%system simulation%%per%%]$~ 
~$[workload modelling%%per%%]$~ 
~$[cloning %%#%% mimic workload be%%dsh%% 
haviour %%#%% creating %%#%% reduced representation %%#%% %%#%% code [3%%lst%% 
21]%%per%%]$~ ~$[much %%#%% %%#%% %%#%% focuses %%#%% cloning cache behaviour%%scn%% 
synfull %%#%% %%#%% viewed %%#%% creating clones %%#%% cache coher%%dsh%% 
ence behaviour %%#%% stimulate %%#%% network%%per%%]$~ ~$[creation %%#%% syn%%dsh%% 
thetic benchmarks ]f[ multi%%dsh%%threaded applications %%#%% %%#%% 
explored [17]%%scn%% %%#%% %%#%% generates instruction streams %%#%% exe%%dsh%% 
cute %%#%% simulation ]v[ %%#%% real hardware%%per%%]$~ ~$[our %%#%% differs %%#%% %%#%% 
reproduce communication patterns ]^[ coherence behaviour 
%%#%% abstracting %%#%% %%#%% processor ]^[ instruction execution%%per%%]$~ 
~$[minnespec [24] provides reduced input sets %%#%% effectively 
match %%#%% reference input ]f[ spec2000%%scn%% %%#%% %%cmp%% focus %%#%% 
input set ]v[ instruction generation%%lst%% %%#%% provide %%#%% reduced set 
%%#%% trafﬁc based %%#%% %%#%% steady state %%#%% %%#%% markov chain%%per%%]$~ 
~$[workload design ]^[ synthetic trafﬁc%%per%%]$~ ~$[synthetic work%%dsh%% 
loads %%#%% %%#%% %%#%% focus %%#%% research %%#%% %%#%% nocs 
emerged [16%%lst%% 42]%%per%%]$~ ~$[statistical proﬁles %%#%% %%#%% %%#%% %%#%% gener%%dsh%% 
ate synthetic traces ]f[ microarchitectural performance anal%%dsh%% 
ysis [14]%%per%%]$~ ~$[methods ]f[ synthetic trace generation %%#%% %%#%% chip 
level %%#%% %%#%% %%#%% proposed [44%%lst%% 45]%%scn%% soteriou et al%%per%% pro%%dsh%% 
pose %%#%% 3%%dsh%%tuple statistical model %%#%% leverages self%%dsh%%similarity 
%%#%% create bursty synthetic trafﬁc [41]%%per%%]$~ ~$[to %%#%% knowledge%%lst%% %%#%% 
%%#%% %%#%% %%#%% %%#%% %%#%% %%#%% synthetically generate network traf%%dsh%% 
ﬁc %%#%% includes cache coherence%%per%%]$~ ~$[the beneﬁts %%#%% %%#%% %%#%% 
approach allows %%#%% %%#%% remove %%#%% necessity ]f[ full%%dsh%%system 
simulation %%#%% %%#%% allowing %%#%% %%#%% exploit coherence 
trafﬁc%%per%%]$~ ~$[in addition%%lst%% %%#%% statistical models %%#%% ]n[ %%cmp%% 
generated trafﬁc %%#%% full%%dsh%%system simulations%%lst%% ignoring perfor%%dsh%% 
mance metrics %%#%% %%#%% packet latency%%per%% 
12%%per%%]$~ ~$[conclusion 
full%%dsh%%system simulation %%#%% %%#%% %%#%% ]^[ tedious process%%scn%% %%#%% %%#%% 
result%%lst%% %%#%% limits %%#%% range %%#%% designs %%#%% %%#%% %%#%% explored %%#%% %%#%% 
tractable amount %%#%% time%%per%%]$~ ~$[we propose %%#%% novel methodology 
%%#%% accelerate noc simulation%%per%%]$~ ~$[synfull enables %%#%% creation 
%%#%% synthetic trafﬁc models %%#%% mimic %%#%% %%#%% range %%#%% cache 
coherence behaviour ]^[ %%#%% resulting trafﬁc %%#%% %%#%% injected 
%%#%% %%#%% network%%per%%]$~ ~$[we accurately capture spatial variation %%#%% 
trafﬁc patterns %%#%% ]^[ %%#%% applications%%per%%]$~ ~$[furthermore%%lst%% 
burstiness %%#%% captured %%#%% %%#%% model%%per%%]$~ ~$[these %%#%% attributes 
lead %%#%% %%#%% model %%#%% produces accurate network trafﬁc%%per%%]$~ ~$[we 
attain %%#%% overall accuracy %%#%% 10%%per%%5% %%#%% 3 conﬁgurations 
]f[ %%#%% benchmarks relative %%#%% full%%dsh%%system simulation%%per%%]$~ ~$[fur%%dsh%% 
thermore%%lst%% %%#%% technique %%#%% %%#%% steady%%dsh%%state behaviour %%#%% 
markov chains %%#%% speedup simulation %%#%% %%#%% %%#%% 150×%%per%%]$~ ~$[synfull 
%%#%% %%#%% powerful ]^[ robust tool %%#%% %%#%% enable faster exploration 
%%#%% %%#%% rich design space %%#%% nocs%%per%%]$~ ~$[synfull %%#%% %%#%% downloaded %%#%% 
www%%per%%eecg%%per%%toronto%%per%%edu/~enright/downloads%%per%%html 
acknowledgements 
%%#%% research %%#%% funded %%#%% %%#%% gift %%#%% intel%%per%%]$~ ~$[additional sup%%dsh%% 
port %%#%% provided %%#%% %%#%% canadian foundation ]f[ innovation 
]^[ %%#%% ontario research fund%%per%%]$~ ~$[we %%cmp%%k mike kishinevsky 
]^[ umit ogras ]f[ %%#%% invaluable feedback ]^[ insight %%#%% 
developing synfull%%per%%]$~ ~$[we %%#%% %%cmp%%k emily blem%%lst%% andreas 
moshovos%%lst%% jason anderson%%lst%% %%#%% %%#%% %%#%% %%#%% enright jerger 
research %%#%% ]^[ %%#%% anonymous reviewers ]f[ %%#%% thought%%dsh%% 
ful ]^[ detailed feedback %%#%% %%#%% work%%per%% 
050100150barnesblackscholesbodytrackcholeskyfacesimfftfluidanimatelu_cblu_ncbradiosityradixraytraceswaptionsvolrendwater_nsquaredwater_spatialspeed upsyntheticsynthetic_sstrace%%per%%dependency references 
[1] e%%per%%]$~ ~$[ardestani ]^[ j%%per%%]$~ ~$[renau%%lst%% “esesc%%cln%% %%#%% fast multicore simulator using 
time%%dsh%%based sampling,” %%#%% proc%%per%% %%#%% intl%%per%%]$~ ~$[symposium %%#%% %%#%% perfor%%dsh%% 
mance computer architecture%%lst%% 2013%%per%% 
[2] j%%per%%]$~ ~$[h%%per%%]$~ ~$[bahn ]^[ n%%per%%]$~ ~$[bagherzadeh%%lst%% “a generic trafﬁc model ]f[ on%%dsh%%chip 
interconnection networks,” network %%#%% chip architectures%%lst%% p%%per%% 22%%lst%% 2008%%per%% 
[3] g%%per%%]$~ ~$[balakrishnan ]^[ y%%per%%]$~ ~$[solihin%%lst%% “west%%cln%% cloning data cache behavior 
using stochastic traces,” %%#%% proc%%per%% %%#%% intl%%per%%]$~ ~$[symposium %%#%% performance 
computer architecture%%lst%% 2012%%per%% 
[4] r%%per%%]$~ ~$[bellman%%lst%% adaptive control processes%%cln%% %%#%% guided tour%%lst%% ser%%per%%]$~ ~$[a rand 
corporation research study series%%per%%]$~ ~$[princeton university press%%lst%% 1961%%per%% 
[5] c%%per%%]$~ ~$[bienia%%lst%% “benchmarking modern multiprocessors,” ph%%per%%d%%per%% dissertation%%lst%% 
princeton university%%lst%% january 2011%%per%% 
[6] t%%per%%]$~ ~$[cali´nski ]^[ j%%per%%]$~ ~$[harabasz%%lst%% “a dendrite method ]f[ cluster analysis,” 
comm %%#%% statistics%%dsh%%theory ]^[ methods%%lst%% vol%%per%% 3%%lst%% no%%per%% 1%%lst%% pp%%per%% 1–27%%lst%% 1974%%per%% 
[7] t%%per%%]$~ ~$[e%%per%%]$~ ~$[carlson%%lst%% w%%per%%]$~ ~$[heirman%%lst%% ]^[ l%%per%%]$~ ~$[eeckhout%%lst%% “sniper%%cln%% exploring %%#%% 
level %%#%% abstraction ]f[ scalable ]^[ accurate parallel multi%%dsh%%core simu%%dsh%% 
lation,” %%#%% proc %%#%% supercomputing (sc)%%lst%% 2011%%lst%% p%%per%% 52%%per%% 
[8] t%%per%%]$~ ~$[e%%per%%]$~ ~$[carlson%%lst%% w%%per%%]$~ ~$[heirman%%lst%% ]^[ l%%per%%]$~ ~$[eeckhout%%lst%% “sampled simulation %%#%% 
multi%%dsh%%threaded applications,” %%#%% intl%%per%%]$~ ~$[symp%%per%%]$~ ~$[performance analysis %%#%% 
systems ]^[ software%%lst%% apr%%per%% 2013%%per%% 
[9] j%%per%%]$~ ~$[chen%%lst%% l%%per%%]$~ ~$[k%%per%%]$~ ~$[dabbiru%%lst%% d%%per%%]$~ ~$[wong%%lst%% m%%per%%]$~ ~$[annavaram%%lst%% ]^[ m%%per%%]$~ ~$[dubois%%lst%% 
“adaptive ]^[ speculative slack simulations %%#%% cmps %%#%% cmps,” %%#%% 
proc%%per%% %%#%% intl%%per%%]$~ ~$[symposium %%#%% microarchitecture%%lst%% 2010%%per%% 
[10] x%%per%%]$~ ~$[e%%per%%]$~ ~$[chen ]^[ t%%per%%]$~ ~$[m%%per%%]$~ ~$[aamodt%%lst%% “hybrid analytical modeling %%#%% pend%%dsh%% 
ing cache hits%%lst%% data prefetching ]^[ mshrs,” acm transactions %%#%% 
architecture ]^[ code optimization%%lst%% vol%%per%% 8%%lst%% no%%per%% 3%%lst%% october 2011%%per%% 
[11] d%%per%%]$~ ~$[chiou%%lst%% d%%per%%]$~ ~$[sunwoo%%lst%% j%%per%%]$~ ~$[kim%%lst%% n%%per%%]$~ ~$[a%%per%%]$~ ~$[patil%%lst%% w%%per%%]$~ ~$[reinhart%%lst%% d%%per%%]$~ ~$[e%%per%%]$~ ~$[johnson%%lst%% 
j%%per%%]$~ ~$[keefe%%lst%% ]^[ h%%per%%]$~ ~$[angepat%%lst%% “fpga%%dsh%%accelerated simulation technologies 
(fast)%%cln%% fast%%lst%% full%%dsh%%system%%lst%% cycle%%dsh%%accurate simulators,” %%#%% proc %%#%% %%#%% 
international symposium %%#%% microarchitecture%%lst%% 2007%%lst%% pp%%per%% 249–261%%per%% 
[12] w%%per%%]$~ ~$[j%%per%%]$~ ~$[dally ]^[ b%%per%%]$~ ~$[p%%per%%]$~ ~$[towles%%lst%% principles ]^[ practices %%#%% interconnec%%dsh%% 
tion networks%%per%%]$~ ~$[morgan kaufmann%%lst%% 2003%%per%% 
[13] r%%per%%]$~ ~$[das%%lst%% o%%per%%]$~ ~$[mutlu%%lst%% t%%per%%]$~ ~$[moscibroda%%lst%% ]^[ c%%per%%]$~ ~$[r%%per%%]$~ ~$[das%%lst%% “aergia%%cln%% exploting 
packet latency slack %%#%% on%%dsh%%chip networks,” %%#%% proc%%per%% %%#%% intl%%per%%]$~ ~$[symposium 
%%#%% computer architecture%%lst%% 2010%%per%% 
[14] l%%per%%]$~ ~$[eeckhout%%lst%% k%%per%%]$~ ~$[de bosschere%%lst%% ]^[ h%%per%%]$~ ~$[neefs%%lst%% “performance analy%%dsh%% 
sis %%#%% synthetic trace generation,” %%#%% intl%%per%%]$~ ~$[symp%%per%%]$~ ~$[performance 
analysis %%#%% systems ]^[ software%%lst%% 2000%%lst%% pp%%per%% 1–6%%per%% 
[15] m%%per%%]$~ ~$[ferdman%%lst%% p%%per%%]$~ ~$[lotﬁ%%dsh%%kamran%%lst%% k%%per%%]$~ ~$[balet%%lst%% ]^[ b%%per%%]$~ ~$[falsaﬁ%%lst%% “cuckoo di%%dsh%% 
rectory%%cln%% %%#%% scalable directory ]f[ many%%dsh%%core systems,” %%#%% intl symp %%#%% 
%%#%% performance computer architecture%%lst%% 2011%%lst%% pp%%per%% 169–180%%per%% 
[16] d%%per%%]$~ ~$[ferrari%%lst%% %%#%% %%#%% foundations %%#%% artiﬁcial workload design%%per%%]$~ ~$[acm%%lst%% 
1984%%lst%% vol%%per%% 12%%lst%% no%%per%% 3%%per%% 
[17] k%%per%%]$~ ~$[ganesan ]^[ l%%per%%]$~ ~$[john%%lst%% “automatic generation %%#%% miniaturized syn%%dsh%% 
thetic proxies ]f[ target applications %%#%% efﬁciently design multicore 
processors,” ieee trans%%per%% %%#%% computers%%lst%% vol%%per%% 99%%lst%% 2013%%per%% 
[18] j%%per%%]$~ ~$[hestness%%lst%% b%%per%%]$~ ~$[grot%%lst%% ]^[ s%%per%%]$~ ~$[w%%per%%]$~ ~$[keckler%%lst%% “netrace%%cln%% dependency%%dsh%%driven 
trace%%dsh%%based network%%dsh%%on%%dsh%%chip simulation,” %%#%% proc%%per%% %%#%% %%#%% 3rd interna%%dsh%% 
tional workshop %%#%% network %%#%% chip architectures%%lst%% 2010%%lst%% pp%%per%% 31–36%%per%% 
[19] n%%per%%]$~ ~$[jiang%%lst%% d%%per%%]$~ ~$[u%%per%%]$~ ~$[becker%%lst%% g%%per%%]$~ ~$[michelogiannakis%%lst%% j%%per%%]$~ ~$[balfour%%lst%% b%%per%%]$~ ~$[towles%%lst%% 
j%%per%%]$~ ~$[kim%%lst%% ]^[ w%%per%%]$~ ~$[j%%per%%]$~ ~$[dally%%lst%% “a detailed ]^[ ﬂexible cycle%%dsh%%accurate network%%dsh%% 
on%%dsh%%chip simulator,” %%#%% intl%%per%%]$~ ~$[symp%%per%%]$~ ~$[performance analysis %%#%% systems ]^[ 
software%%lst%% 2013%%per%% 
[20] y%%per%%]$~ ~$[jin%%lst%% e%%per%%]$~ ~$[j%%per%%]$~ ~$[kim%%lst%% ]^[ t%%per%%]$~ ~$[pinkston%%lst%% “communication%%dsh%%aware globally%%dsh%% 
coordinated on%%dsh%%chip networks,” ieee transactions %%#%% parallel ]^[ 
distributed systems%%lst%% vol%%per%% 23%%lst%% no%%per%% 2%%lst%% pp%%per%% 242 –254%%lst%% feb%%per%% 2012%%per%% 
[21] a%%per%%]$~ ~$[joshi%%lst%% l%%per%%]$~ ~$[eeckhout%%lst%% r%%per%%]$~ ~$[bell%%lst%% ]^[ l%%per%%]$~ ~$[john%%lst%% “cloning%%cln%% %%#%% technique 
]f[ disseminating proprietary applications %%#%% benchmarks,” %%#%% proc%%per%% %%#%% 
ieee intl symposium workload characterization%%lst%% 2006%%per%% 
[22] t%%per%%]$~ ~$[karkhanis ]^[ j%%per%%]$~ ~$[e%%per%%]$~ ~$[smith%%lst%% “a ﬁrst%%dsh%%order superscalar processor 
model,” %%#%% proc %%#%% %%#%% intl symp %%#%% computer architecture%%lst%% 2004%%per%% 
[23] j%%per%%]$~ ~$[kim%%lst%% j%%per%%]$~ ~$[balfour%%lst%% ]^[ w%%per%%]$~ ~$[dally%%lst%% “flattened butterﬂy topology ]f[ 
on%%dsh%%chip networks,” %%#%% proc %%#%% %%#%% international symposium %%#%% mi%%dsh%% 
croarchitecture%%lst%% 2007%%lst%% pp%%per%% 172–182%%per%% 
[24] a%%per%%]$~ ~$[kleinosowski ]^[ d%%per%%]$~ ~$[j%%per%%]$~ ~$[lilja%%lst%% “minnespec%%cln%% %%#%% %%#%% spec bench%%dsh%% 
mark workload ]f[ simulation%%dsh%%based computer architecture research,” 
computer architecture letters%%lst%% vol%%per%% 1%%lst%% june 2002%%per%% 
[25] t%%per%%]$~ ~$[krishna%%lst%% l%%per%%%%dsh%%s%%per%%]$~ ~$[peh%%lst%% b%%per%%]$~ ~$[beckmann%%lst%% ]^[ s%%per%%]$~ ~$[k%%per%%]$~ ~$[reinhardt%%lst%% “towards 
%%#%% ideal on%%dsh%%chip fabric ]f[ 1%%dsh%%to%%dsh%%many ]^[ many%%dsh%%to%%dsh%%1 communication,” 
%%#%% proc%%per%% %%#%% %%#%% international symposium %%#%% microarchitecture%%lst%% 2011%%per%% 
[26] m%%per%%]$~ ~$[lodde%%lst%% j%%per%%]$~ ~$[flich%%lst%% ]^[ m%%per%%]$~ ~$[e%%per%%]$~ ~$[acacio%%lst%% “heterogeneous noc design ]f[ 
efﬁcient broadcast%%dsh%%based coherence protocol support,” %%#%% international 
symposium %%#%% networks %%#%% chip%%lst%% 2012%%per%% 
[27] s%%per%%]$~ ~$[ma%%lst%% n%%per%%]$~ ~$[enright jerger%%lst%% ]^[ z%%per%%]$~ ~$[wang%%lst%% “supporting efﬁcient collec%%dsh%% 
tive communication %%#%% nocs,” %%#%% proc %%#%% intl%%per%%]$~ ~$[symposium %%#%% %%#%% 
performance computer architecture%%lst%% 2012%%lst%% pp%%per%% 165–177%%per%% 
[28] m%%per%%]$~ ~$[martin%%lst%% m%%per%%]$~ ~$[hill%%lst%% ]^[ d%%per%%]$~ ~$[sorin%%lst%% “why on%%dsh%%chip cache coherence %%#%% 
%%#%% %%#%% stay,” comm %%#%% %%#%% acm%%lst%% vol%%per%% 55%%lst%% no%%per%% 7%%lst%% pp%%per%% 78–89%%lst%% 2012%%per%% 
[29] j%%per%%]$~ ~$[miller%%lst%% h%%per%%]$~ ~$[kasture%%lst%% g%%per%%]$~ ~$[kurian%%lst%% c%%per%%]$~ ~$[gruenwald%%lst%% n%%per%%]$~ ~$[beckmann%%lst%% c%%per%%]$~ ~$[celio%%lst%% 
j%%per%%]$~ ~$[eastep%%lst%% ]^[ a%%per%%]$~ ~$[agarwal%%lst%% “graphite%%cln%% %%#%% distributed parallel simulator 
]f[ multicores,” %%#%% proc%%per%% %%#%% intl%%per%%]$~ ~$[symposium %%#%% %%#%% performance 
computer architecture%%lst%% jan%%per%% 2010%%lst%% pp%%per%% 1 –12%%per%% 
[30] a%%per%%]$~ ~$[mishra%%lst%% o%%per%%]$~ ~$[mutlu%%lst%% ]^[ c%%per%%]$~ ~$[das%%lst%% “a heterogeneous multiple network%%dsh%% 
on%%dsh%%chip design%%cln%% %%#%% application%%dsh%%aware approach,” %%#%% proc%%per%% %%#%% %%#%% design 
automation conference%%lst%% 2013%%per%% 
[31] n%%per%%]$~ ~$[neelakantam%%lst%% c%%per%%]$~ ~$[blundell%%lst%% j%%per%%]$~ ~$[devietti%%lst%% m%%per%%]$~ ~$[m%%per%%]$~ ~$[martin%%lst%% ]^[ c%%per%%]$~ ~$[zilles%%lst%% 
“fes2%%cln%% %%#%% full%%dsh%%system execution%%dsh%%driven simulator ]f[ x86,” poster 
%%#%% %%#%% asplos%%lst%% 2008%%per%% 
[32] m%%per%%]$~ ~$[papamichael%%lst%% j%%per%%]$~ ~$[hoe%%lst%% ]^[ o%%per%%]$~ ~$[mutlu%%lst%% “fist%%cln%% %%#%% fast%%lst%% lightweight%%lst%% 
fpga%%dsh%%friendly packet latency estimator ]f[ noc modeling %%#%% full%%dsh%% 
system simulations,” %%#%% intl symp %%#%% networks %%#%% chip%%lst%% 2011%%per%% 
[33] p%%per%%]$~ ~$[ren%%lst%% m%%per%%]$~ ~$[lis%%lst%% m%%per%%]$~ ~$[h%%per%%]$~ ~$[cho%%lst%% k%%per%%]$~ ~$[s%%per%%]$~ ~$[shim%%lst%% c%%per%%]$~ ~$[w%%per%%]$~ ~$[fletcher%%lst%% o%%per%%]$~ ~$[khan%%lst%% 
n%%per%%]$~ ~$[zheng%%lst%% ]^[ s%%per%%]$~ ~$[devadas%%lst%% “hornet%%cln%% %%#%% cycle%%dsh%%level multicore simula%%dsh%% 
tor,” ieee trans%%per%%]$~ ~$[comput%%dsh%%aided design integr%%per%%]$~ ~$[circuits syst%%per%%%%lst%% vol%%per%% 31%%lst%% 
no%%per%% 6%%lst%% 2012%%per%% 
[34] a%%per%%]$~ ~$[reynolds%%lst%% g%%per%%]$~ ~$[richards%%lst%% b%%per%%]$~ ~$[de la iglesia%%lst%% ]^[ v%%per%%]$~ ~$[rayward%%dsh%%smith%%lst%% 
“clustering rules%%cln%% %%#%% comparison %%#%% partitioning ]^[ hierarchical cluster%%dsh%% 
ing algorithms,” journal %%#%% mathematical modelling ]^[ algorithms%%lst%% 
vol%%per%% 5%%lst%% no%%per%% 4%%lst%% pp%%per%% 475–504%%lst%% 2006%%per%% 
[35] p%%per%%]$~ ~$[j%%per%%]$~ ~$[rousseeuw%%lst%% “silhouettes%%cln%% %%#%% graphical aid %%#%% %%#%% interpretation ]^[ 
validation %%#%% cluster analysis,” journal %%#%% computational ]^[ applied 
mathematics%%lst%% vol%%per%% 20%%lst%% pp%%per%% 53–65%%lst%% 1987%%per%% 
[36] s%%per%%]$~ ~$[salvador ]^[ p%%per%%]$~ ~$[chan%%lst%% “determining %%#%% number %%#%% clusters/segments 
%%#%% hierarchical clustering/segmentation algorithms,” %%#%% int%%per%%]$~ ~$[conf%%per%% %%#%% 
tools %%#%% artiﬁcial intelligence%%lst%% 2004%%lst%% pp%%per%% 576–584%%per%% 
[37] d%%per%%]$~ ~$[sanchez ]^[ c%%per%%]$~ ~$[kozyrakis%%lst%% “zsim%%cln%% fast ]^[ accurate microarchitec%%dsh%% 
tural simulation %%#%% thousand%%dsh%%core systems,” %%#%% proc%%per%% %%#%% %%#%% international 
symposium %%#%% computer architecture%%lst%% 2013%%per%% 
[38] t%%per%%]$~ ~$[sherwood%%lst%% e%%per%%]$~ ~$[perelman%%lst%% ]^[ b%%per%%]$~ ~$[calder%%lst%% “basic block distribution 
analysis %%#%% ﬁnd periodic behavior ]^[ simulation %%#%% %%#%% applications,” 
%%#%% parallel architecture ]^[ compilation techniques%%lst%% 2001%%lst%% pp%%per%% 3–14%%per%% 
[39] t%%per%%]$~ ~$[sherwood%%lst%% e%%per%%]$~ ~$[perelman%%lst%% g%%per%%]$~ ~$[hamerly%%lst%% ]^[ b%%per%%]$~ ~$[calder%%lst%% “automatically 
characterizing large scale program behavior,” %%#%% proc%%per%% %%#%% architecture 
support ]f[ programming languages ]^[ operating systems%%lst%% 2002%%lst%% 
pp%%per%% 45–57%%per%% 
[40] d%%per%%]$~ ~$[j%%per%%]$~ ~$[sorin%%lst%% m%%per%%]$~ ~$[d%%per%%]$~ ~$[hill%%lst%% ]^[ d%%per%%]$~ ~$[a%%per%%]$~ ~$[wood%%lst%% “a primer %%#%% memory consis%%dsh%% 
tency ]^[ cache coherence,” synthesis lectures %%#%% computer architec%%dsh%% 
ture%%lst%% vol%%per%% 6%%lst%% no%%per%% 3%%lst%% pp%%per%% 1–212%%lst%% 2011%%per%% 
[41] v%%per%%]$~ ~$[soteriou%%lst%% h%%per%%]$~ ~$[wang%%lst%% ]^[ l%%per%%%%dsh%%s%%per%%]$~ ~$[peh%%lst%% “a statistical trafﬁc model ]f[ 
on%%dsh%%chip interconnection networks,” %%#%% mascots%%lst%% 2006%%lst%% pp%%per%% 104–116%%per%% 
[42] k%%per%%]$~ ~$[sreenivasan ]^[ a%%per%%]$~ ~$[kleinman%%lst%% “on %%#%% construction %%#%% %%#%% repre%%dsh%% 
sentative synthetic workload,” comm %%#%% %%#%% acm%%lst%% vol%%per%% 17%%lst%% no%%per%% 3%%lst%% pp%%per%% 
127–133%%lst%% 1974%%per%% 
[43] z%%per%%]$~ ~$[tan%%lst%% a%%per%%]$~ ~$[waterman%%lst%% h%%per%%]$~ ~$[cook%%lst%% s%%per%%]$~ ~$[bird%%lst%% k%%per%%]$~ ~$[asanovic%%lst%% ]^[ d%%per%%]$~ ~$[patterson%%lst%% 
“a %%#%% ]f[ fame%%cln%% fpga architecture model execution,” %%#%% proc%%per%% %%#%% 
intl symposium %%#%% computer architecture%%lst%% 2010%%per%% 
[44] l%%per%%]$~ ~$[tedesco%%lst%% a%%per%%]$~ ~$[mello%%lst%% l%%per%%]$~ ~$[giacomet%%lst%% n%%per%%]$~ ~$[calazans%%lst%% ]^[ f%%per%%]$~ ~$[moraes%%lst%% “ap%%dsh%% 
plication driven trafﬁc modeling ]f[ nocs,” %%#%% proc %%#%% %%#%% 19th symp 
%%#%% integrated circuits ]^[ systems design%%per%%]$~ ~$[acm%%lst%% 2006%%lst%% pp%%per%% 62–67%%per%% 
[45] g%%per%%]$~ ~$[v%%per%%]$~ ~$[varatkar ]^[ r%%per%%]$~ ~$[marculescu%%lst%% “on%%dsh%%chip trafﬁc modeling ]^[ 
synthesis ]f[ mpeg%%dsh%%2 video applications,” ieee trans %%#%% %%#%% large 
scale integration systems%%lst%% vol%%per%% 12%%lst%% no%%per%% 1%%lst%% pp%%per%% 108–119%%lst%% 2004%%per%% 
[46] t%%per%%]$~ ~$[velmurugan ]^[ t%%per%%]$~ ~$[san%%cmp%%am%%lst%% “computational complexity %%#%% 
k%%dsh%%means ]^[ k%%dsh%%medoids clustering algorithms ]f[ normal ]^[ uniform 
distributions %%#%% data points,” journal %%#%% computer science%%lst%% vol%%per%% 6%%lst%% no%%per%% 3%%lst%% 
p%%per%% 363%%lst%% 2010%%per%% 
[47] j%%per%%]$~ ~$[h%%per%%]$~ ~$[ward jr%%lst%% “hierarchical %%#%% %%#%% optimize %%#%% objective function,” 
j%%per%%]$~ ~$[amer%%per%%]$~ ~$[statist%%per%%]$~ ~$[assoc%%per%%%%lst%% vol%%per%% 58%%lst%% no%%per%% 301%%lst%% pp%%per%% 236–244%%lst%% 1963%%per%% 
[48] s%%per%%]$~ ~$[c%%per%%]$~ ~$[woo%%lst%% m%%per%%]$~ ~$[ohara%%lst%% e%%per%%]$~ ~$[torrie%%lst%% j%%per%%]$~ ~$[p%%per%%]$~ ~$[singh%%lst%% ]^[ a%%per%%]$~ ~$[gupta%%lst%% “the 
splash%%dsh%%2 programs%%cln%% characterization ]^[ methodological considera%%dsh%% 
tions,” %%#%% intl symp %%#%% computer architecture%%lst%% 1995%%lst%% pp%%per%% 24–36%%per%% 
[49] r%%per%%]$~ ~$[e%%per%%]$~ ~$[wunderlich%%lst%% t%%per%%]$~ ~$[f%%per%%]$~ ~$[wenisch%%lst%% b%%per%%]$~ ~$[falsaﬁ%%lst%% ]^[ j%%per%%]$~ ~$[c%%per%%]$~ ~$[hoe%%lst%% “smarts%%cln%% 
accelerating microarchitecture simulation via rigorous statistical sam%%dsh%% 
pling,” %%#%% proc%%per%% %%#%% intl symposium %%#%% computer architecture%%lst%% 2003%%per%% 
[50] j%%per%%]$~ ~$[zebchuk%%lst%% v%%per%%]$~ ~$[srinivasan%%lst%% m%%per%%]$~ ~$[k%%per%%]$~ ~$[qureshi%%lst%% ]^[ a%%per%%]$~ ~$[moshovos%%lst%% “a tagless 
coherence directory,” %%#%% intl symp %%#%% microarchitecture%%lst%% 2009%%per%% 
[51] y%%per%%]$~ ~$[zhang%%lst%% b%%per%%]$~ ~$[ozisikyilmaz%%lst%% g%%per%%]$~ ~$[memik%%lst%% j%%per%%]$~ ~$[kim%%lst%% ]^[ a%%per%%]$~ ~$[choudhary%%lst%% 
“analyzing %%#%% impact %%#%% on%%dsh%%chip network trafﬁc %%#%% program phases ]f[ 
cmps,” %%#%% intl symp %%#%% performance analysis %%#%% systems ]^[ software%%lst%% 
2009%%lst%% pp%%per%% 218–226%%per%% 
