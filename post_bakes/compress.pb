~$[workshop track %%dsh%% iclr 2018 
quantization error %%#%% %%#%% metric %%#%% dynamic 
precision scaling %%#%% neural net training 
ian taras & dylan malone stuart 
department %%#%% electrical ]^[ computer engineering 
university %%#%% toronto 
toronto%%lst%% on%%lst%% canada 
{tarasian%%lst%% malones2}@ece%%per%%utoronto%%per%%ca 
1 
introduction 
%%#%% %%#%% %%#%% established %%#%% neural networks%%lst%% %%#%% ordinarily trained using 32%%dsh%%bit single precision 
oating %%#%% representation%%lst%% %%#%% achieve desirable accuracy %%#%% inference %%#%% reduced precision 
weights ]^[ activations (judd et al%%per%%%%lst%% 2015) (mishra et al%%per%%%%lst%% 2017) (courbariaux et al%%per%%%%lst%% 2015) (hubara 
et al%%per%%%%lst%% 2016)%%per%%]$~ ~$[these reduced precision networks %%#%% amenable %%#%% acceleration %%#%% custom hardware 
platforms %%#%% %%#%% %%#%% advantage %%#%% lower bit%%dsh%%widths %%#%% order %%#%% speed %%#%% computation (na & 
mukhopadhyay%%lst%% 2016) (gupta et al%%per%%%%lst%% 2015)%%per%%]$~ ~$[reduced precision strategies %%#%% ]n[ typically applied 
%%#%% back%%dsh%%propagation whilst training%%lst%% %%#%% %%#%% %%#%% lead %%#%% heavily reduced accuracy ]v[ %%#%% non%%dsh%% 
convergence%%per%%]$~ 
~$[recent %%#%% %%#%% shown %%#%% dynamic precision scaling%%lst%% %%#%% technique %%#%% %%#%% %%#%% numerical precision 
%%#%% %%#%% training %%#%% varied on%%dsh%%the%%dsh%%y %%#%% training progresses%%lst%% %%#%% achieve computational speedups 
(on custom hardware) %%#%% hampering accuracy (na & mukhopadhyay%%lst%% 2016) (courbariaux 
et al%%per%%%%lst%% 2014)%%per%%]$~ ~$[dps %%#%% feedback %%#%% %%#%% training process %%#%% decide %%#%% %%#%% appropriate number 
representation%%per%%]$~ ~$[for example%%lst%% na & mukhopadhyay (2016) suggest starting %%#%% reduced precision%%lst%% 
]^[ increasing precision dramatically whenever training %%#%% numerically unstable%%lst%% ]v[ %%#%% 
training loss stagnates%%per%%]$~ 
~$[in %%#%% paper%%lst%% %%#%% %%#%% %%#%% novel dps algorithm %%#%% %%#%% %%#%% stochastic xed%%dsh%%point rounding method 
suggested %%#%% gupta et al%%per%% (2015)%%lst%% %%#%% dynamic bit%%dsh%%width representation %%#%% %%#%% na & mukhopadhyay 
(2016)%%lst%% ]^[ %%#%% algorithm %%#%% leverages information %%#%% %%#%% quantization error encountered %%#%% 
rounding %%#%% %%#%% heuristic ]f[ scaling %%#%% number %%#%% fractional bits utilized%%per%% 
2 fixed %%#%% representation and quantization/rounding 
fixed %%#%% numbers %%#%% represented %%#%% %%#%% fractional portion appended %%#%% %%#%% integer portion%%lst%% %%#%% %%#%% 
implied radix %%#%% %%#%% between%%per%%]$~ ~$[we allow %%#%% xed %%#%% representation %%#%% %%#%% arbitrary bit%%dsh%%width 
]f[ %%#%% %%#%% integer ]^[ fractional parts%%lst%% ]^[ represent %%#%% bit%%dsh%%width %%#%% %%#%% integer %%#%% %%#%% il ]^[ 
%%#%% bit%%dsh%%width %%#%% %%#%% fractional %%#%% %%#%% %%#%% l%%per%%]$~ ~$[we denote %%#%% %%#%% xed %%#%% representation%%lst%% %%cmp_t%%%%lst%% %%#%% 
(cid:104)il%%lst%% %%#%% l(cid:105)%%per%%]$~ ~$[dps modies il ]^[ %%#%% l on%%dsh%%the%%dsh%%y %%#%% training%%per%%]$~ 
~$[inspired %%#%% gupta et al%%per%% (2015)%%lst%% %%#%% %%#%% stochastic rounding %%#%% quantization %%#%% oating %%#%% 
values %%#%% (cid:104)il%%lst%% %%#%% l(cid:105)%%lst%% %%#%% %%#%% implements %%#%% unbiased rounding%%per%% 
1 
workshop track %%dsh%% iclr 2018 
%%#%% algorithm employs %%#%% dynamic bit%%dsh%%width%%lst%% dynamic radix scheme %%#%% %%#%% il ]^[ %%#%% l %%#%% 
free %%#%% vary independently%%per%%]$~ ~$[note %%#%% %%#%% %%#%% alternative xed bit%%dsh%%width scheme%%lst%% il ]^[ %%#%% l %%#%% 
inter%%dsh%%dependent %%#%% increasing %%#%% necessitates %%#%% decrease %%#%% %%#%% other%%per%% 
3 dynamic precision scaling algorithm 
%%#%% %%#%% formally introduce %%#%% novel dps algorithm %%#%% leverages average % quantization error 
%%#%% %%#%% metric ]f[ scaling fractional bits%%per%%]$~ ~$[quantization error %%#%% calculated %%#%% %%#%% per%%dsh%%value basis %%#%% %%#%% 
equation 1%%per%%]$~ ~$[quantization error % %%#%% accumulated ]^[ averaged %%#%% %%#%% round operations %%#%% %%#%% %%#%% 
metric %%#%% %%#%% scaling %%#%% l%%per%%]$~ 
~$[e% %%#%% 
|xout xin| 
xin 
100 
(1) 
table 1 frames %%#%% %%#%% %%#%% relation %%#%% prior %%#%% %%#%% %%#%% area%%per%%]$~ 
~$[algorithm 1 dynamic precision scaling %%#%% quantization error 
input%%cln%% current integer length%%cln%% il%%lst%% current fractional length%%cln%% fl 
overow rate%%cln%% %%#%% 
average % quantization error%%cln%% %%#%% 
maximum overow rate%%cln%% %%#%% max 
maximum average quantization error%%cln%% %%#%% max 
begin 
%%cmp_if%% %%#%% %%#%% %%#%% max%%cln%% 
output%%cln%% (cid:104)il%%lst%% %%#%% l(cid:105) ]f[ %%#%% %%#%% attribute (weights%%lst%% gradients%%lst%% ]v[ activations)%%per%% 
1%%cln%% 
2%%cln%% 
3%%cln%% 
4%%cln%% 
5%%cln%% 
6%%cln%% 
7%%cln%% 
8%%cln%% 
9%%cln%% 
10%%cln%% 
il il %%#%% 1 
il il 1 
%%#%% l %%#%% l %%#%% 1 
%%#%% l %%#%% l 1 
%%cmp_if%% %%#%% %%#%% %%#%% max%%cln%% 
%%#%% 
%%cmp_e%% 
%%cmp_e%% 
table 1%%cln%% summary %%#%% related %%#%% 
authors 
fixed %%#%% format 
(bit width%%lst%% radix) 
scaling 
rounding 
(na & mukhopadhyay%%lst%% 2016) 
(dynamic%%lst%% dynamic) convergence/ 
(courbariaux et al%%per%%%%lst%% 2014) 
(gupta et al%%per%%%%lst%% 2015) 
essam et al%%per%% (2017) 
(koster et al%%per%%%%lst%% 2017) 
(fixed%%lst%% dynamic) 
(fixed%%lst%% fixed) 
(fixed%%lst%% dynamic) 
(fixed%%lst%% dynamic) 
training based 
nearest 
overow based nearest 
none 
overow based 
predictive 
max%%dsh%%value 
stochastic 
stochastic 
n/a 
precision 
granularity 
per%%dsh%%layer 
per%%dsh%%layer 
global 
global 
per%%dsh%%tensor 
(dynamic%%lst%% dynamic) overow ]^[ 
quantization 
error based 
stochastic 
global 
ours 
4 experiments 
%%#%% order %%#%% perform evaluations%%lst%% %%#%% emulate %%#%% dynamic xed %%#%% representation %%#%% using custom 
caffe layers %%#%% quantize/round %%#%% native oating %%#%% values %%#%% values %%#%% %%#%% legal %%#%% %%#%% xed 
%%#%% format%%per%%]$~ ~$[in %%#%% study%%lst%% %%#%% consider training %%#%% neural network using stochastic gradient descent 
%%#%% dynamically scaled precision ]f[ weights%%lst%% activations%%lst%% ]^[ gradients %%#%% %%#%% %%#%% forward 
2 
workshop track %%dsh%% iclr 2018 
(inference) ]^[ backward pass%%per%%]$~ ~$[as %%#%% na & mukhopadhyay (2016)%%lst%% %%#%% quantize weights%%lst%% biases%%lst%% 
activations%%lst%% ]^[ gradients %%#%% %%#%% appropriate pass %%#%% %%#%% network%%lst%% ]^[ update %%#%% precision 
on%%dsh%%the%%dsh%%y %%#%% training %%#%% %%#%% iteration%%per%%]$~ 
~$[we train lenet%%dsh%%5 %%#%% %%#%% mnist dataset using caffe ]^[ %%#%% custom rounding layers ]^[ dps 
algorithm (lecun et al%%per%%%%lst%% 1998)%%per%%]$~ ~$[we %%#%% %%#%% batch size %%#%% 64%%lst%% ]^[ train ]f[ 10,000 iterations%%per%%]$~ ~$[we %%#%% %%#%% 
initial learning rate %%#%% 0%%per%%01%%lst%% momentum %%#%% 0%%per%%9%%lst%% %%#%% weight decay factor %%#%% 0%%per%%0005%%lst%% ]^[ scale %%#%% learning 
rate using lr %%#%% lrinit (1 %%#%% iter)pow%%lst%% %%#%% %%#%% 0%%per%%0001 ]^[ pow %%#%% 0%%per%%75%%per%%]$~ ~$[we update il ]^[ fl 
%%#%% %%#%% iteration%%lst%% ]^[ %%#%% emax %%#%% rmax %%#%% 0%%per%%01%%%per%%]$~ 
~$[we %%cmp%% %%#%% results %%#%% %%#%% baseline network trained %%#%% %%#%% %%#%% dataset %%#%% %%#%% %%#%% hyperparame%%dsh%% 
ters%%lst%% ]b[ using full%%dsh%%precision oating %%#%% ]f[ %%#%% attributes%%per%%]$~ ~$[we %%#%% %%cmp%% %%#%% %%#%% non%%dsh%%dynamic 
xed %%#%% representation %%#%% %%#%% 13 bits ]f[ weights ]^[ activations%%lst%% ]^[ %%#%% gradients %%#%% 32 bits%%per%% 
(a) test error 
(b) log %%#%% training loss 
figure 1%%cln%% comparison %%#%% training %%#%% dynamic precision scaling vs%%per%% %%#%% baseline (oating point) vs%%per%% 
xed %%#%% reduced precision (13 bit weights ]^[ activations)%%per%%]$~ 
~$[our results reveal %%#%% %%#%% %%#%% achieve accuracy on%%dsh%%par %%#%% 
%%#%% baseline%%lst%% whilst drastically reducing %%#%% bit%%dsh%%width %%#%% 
]f[ %%#%% weights ]^[ activations%%per%%]$~ ~$[our dynamic precision 
scaling algorithm %%#%% general%%lst%% however%%lst%% doesnt reduce %%#%% 
gradient bit%%dsh%%width %%#%% much%%lst%% %%#%% %%#%% requires %%#%% %%#%% 
precision %%#%% order ]f[ training %%#%% converge%%per%%]$~ ~$[the training loss 
using dps is%%lst%% %%#%% general%%lst%% larger %%cmp_ta%% %%#%% training loss %%#%% %%#%% 
baseline model %%#%% hurting accuracy%%lst%% suggesting %%#%% 
%%#%% reduced precision %%#%% act %%#%% %%#%% regularization technique 
%%#%% training %%#%% %%#%% validation via experimentation 
%%#%% larger networks ]^[ %%#%% complex datasets%%per%%]$~ ~$[note %%#%% 
naively reducing %%#%% bit%%dsh%%width %%#%% weights ]^[ activations 
%%#%% %%#%% xed 13%%dsh%%bits %%#%% %%#%% dynamic precision scaling results 
%%#%% %%#%% training process failing %%#%% converge%%per%%]$~ ~$[with dynamic 
precision scaling%%lst%% however%%lst%% 13%%dsh%%bit weights ]^[ activations 
%%#%% sufcient %%#%% %%#%% %%#%% training process%%per%% 
5 discussion 
figure 2%%cln%% moving average bitwidths dur%%dsh%% 
ing training using dps%%per%%]$~ 
~$[we introduce %%#%% dynamic precision scaling algorithm %%#%% %%#%% quantization error %%#%% %%#%% metric ]f[ 
scaling dynamic bit%%dsh%%width xed %%#%% values %%#%% neural network training%%per%%]$~ ~$[combining %%#%% %%#%% 
stochastic rounding%%lst%% %%#%% achieve greatly reduced bit%%dsh%%width %%#%% training%%lst%% whilst remaining %%#%% %%#%% 
fraction %%#%% %%#%% % %%#%% sota accuracy %%#%% %%#%% mnist dataset%%per%%]$~ ~$[this avenue %%#%% algorithmic work%%lst%% %%#%% 
paired %%#%% emerging hardware ]f[ training%%lst%% %%#%% %%#%% potential %%#%% greatly increase %%#%% productivity %%#%% 
engineers ]^[ machine learning researchers alike %%#%% decreasing training time%%per%% 
3 
workshop track %%dsh%% iclr 2018 
references 
m%%per%%]$~ ~$[courbariaux%%lst%% y%%per%%]$~ ~$[bengio%%lst%% ]^[ j%%per%%%%dsh%%p%%per%%]$~ ~$[david%%per%%]$~ ~$[binaryconnect%%cln%% training deep neural networks %%#%% 
binary weights %%#%% propagations%%per%%]$~ ~$[arxiv e%%dsh%%prints%%lst%% november 2015%%per%%]$~ 
~$[matthieu courbariaux%%lst%% yoshua bengio%%lst%% ]^[ jean%%dsh%%pierre david%%per%%]$~ ~$[low precision arithmetic ]f[ deep 
learning%%per%%]$~ ~$[corr%%lst%% abs/1412%%per%%7024%%lst%% 2014%%per%%]$~ ~$[url http://arxiv%%per%%org/abs/1412%%per%%7024%%per%%]$~ 
~$[m%%per%%]$~ ~$[essam%%lst%% t%%per%%]$~ ~$[b%%per%%]$~ ~$[tang%%lst%% e%%per%%]$~ ~$[t%%per%%]$~ ~$[w%%per%%]$~ ~$[ho%%lst%% ]^[ h%%per%%]$~ ~$[chen%%per%%]$~ ~$[dynamic %%#%% stochastic rounding algorithm ]f[ 
limited precision arithmetic %%#%% deep belief network training%%per%%]$~ ~$[in 2017 8th international ieee/embs 
conference %%#%% neural engineering (ner)%%lst%% pp%%per%% 629632%%lst%% %%#%% 2017%%per%% doi%%cln%% 10%%per%%1109/ner%%per%%2017%%per%% 
8008430%%per%%]$~ 
~$[suyog gupta%%lst%% ankur agrawal%%lst%% kailash gopalakrishnan%%lst%% ]^[ pritish narayanan%%per%%]$~ ~$[deep learning %%#%% 
limited numerical precision%%per%%]$~ ~$[corr%%lst%% abs/1502%%per%%02551%%lst%% 2015%%per%%]$~ 
~$[itay hubara%%lst%% matthieu courbariaux%%lst%% daniel soudry%%lst%% ran el%%dsh%%yaniv%%lst%% ]^[ yoshua bengio%%per%%]$~ ~$[binarized neu%%dsh%% 
ral networks%%per%%]$~ ~$[in d%%per%%]$~ ~$[d%%per%%]$~ ~$[lee%%lst%% m%%per%%]$~ ~$[sugiyama%%lst%% u%%per%%]$~ ~$[v%%per%%]$~ ~$[luxburg%%lst%% i%%per%%]$~ ~$[guyon%%lst%% ]^[ r%%per%%]$~ ~$[garnett (eds%%per%%)%%lst%% advances 
%%#%% neural information processing systems 29%%lst%% pp%%per%% 41074115%%per%%]$~ ~$[curran associates%%lst%% inc%%per%%%%lst%% 2016%%per%%]$~ ~$[url 
http://papers%%per%%nips%%per%%cc/paper/6573%%dsh%%binarized%%dsh%%neural%%dsh%%networks%%per%%pdf%%per%%]$~ 
~$[patrick judd%%lst%% jorge albericio%%lst%% tayler hetherington%%lst%% tor aamodt%%lst%% natalie enright jerger%%lst%% raquel 
urtasun%%lst%% ]^[ andreas moshovos%%per%%]$~ ~$[reduced%%dsh%%precision strategies ]f[ bounded memory %%#%% deep 
neural nets%%lst%% arxiv:1511%%per%%05236v4 [cs%%per%%lg] %%per%% arxiv%%per%%org%%lst%% 2015%%per%%]$~ 
~$[urs koster%%lst%% tristan webb%%lst%% xin wang%%lst%% marcel nassar%%lst%% arjun %%#%% bansal%%lst%% william constable%%lst%% oguz 
elibol%%lst%% stewart hall%%lst%% luke hornof%%lst%% amir khosrowshahi%%lst%% carey kloss%%lst%% ruby %%#%% pai%%lst%% ]^[ naveen 
rao%%per%%]$~ ~$[flexpoint%%cln%% %%#%% adaptive numerical format ]f[ efcient training %%#%% deep neural networks%%per%%]$~ ~$[in 
i%%per%%]$~ ~$[guyon%%lst%% u%%per%%]$~ ~$[v%%per%%]$~ ~$[luxburg%%lst%% s%%per%%]$~ ~$[bengio%%lst%% h%%per%%]$~ ~$[wallach%%lst%% r%%per%%]$~ ~$[fergus%%lst%% s%%per%%]$~ ~$[vishwana%%cmp_ta%%%%lst%% ]^[ r%%per%%]$~ ~$[garnett (eds%%per%%)%%lst%% 
advances %%#%% neural information processing systems 30%%lst%% pp%%per%% 17401750%%per%%]$~ ~$[curran associates%%lst%% inc%%per%%%%lst%% 
2017%%per%%]$~ 
~$[y%%per%%]$~ ~$[lecun%%lst%% l%%per%%]$~ ~$[bottou%%lst%% y%%per%%]$~ ~$[bengio%%lst%% ]^[ p%%per%%]$~ ~$[haffner%%per%%]$~ ~$[gradient%%dsh%%based learning applied %%#%% document 
recognition%%per%%]$~ ~$[proceedings %%#%% %%#%% ieee%%lst%% 86(11):22782324%%lst%% nov 1998%%per%%]$~ ~$[issn 0018%%dsh%%9219%%per%% doi%%cln%% 
10%%per%%1109/5%%per%%726791%%per%%]$~ 
~$[asit k%%per%%]$~ ~$[mishra%%lst%% eriko nurvitadhi%%lst%% jeffrey j%%per%%]$~ ~$[cook%%lst%% ]^[ debbie marr%%per%%]$~ ~$[wrpn%%cln%% wide reduced%%dsh%%precision 
networks%%per%%]$~ ~$[corr%%lst%% abs/1709%%per%%01134%%lst%% 2017%%per%%]$~ ~$[url http://arxiv%%per%%org/abs/1709%%per%%01134%%per%%]$~ 
~$[taesik na ]^[ saibal mukhopadhyay%%per%%]$~ ~$[speeding %%#%% convolutional neural network training %%#%% 
dynamic precision scaling ]^[ exible multiplier%%dsh%%accumulator%%per%%]$~ ~$[in proceedings %%#%% %%#%% 2016 in%%dsh%% 
ternational symposium %%#%% low power electronics ]^[ design%%lst%% islped 16%%lst%% pp%%per%% 5863%%lst%% %%#%% 
york%%lst%% ny%%lst%% usa%%lst%% 2016%%per%%]$~ ~$[acm%%per%%]$~ ~$[isbn 978%%dsh%%1%%dsh%%4503%%dsh%%4185%%dsh%%1%%per%% doi%%cln%% 10%%per%%1145/2934583%%per%%2934625%%per%%]$~ ~$[url 
http://doi%%per%%acm%%per%%org/10%%per%%1145/2934583%%per%%2934625%%per%% 
4 
