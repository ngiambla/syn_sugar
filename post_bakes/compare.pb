~$[Workshop track %%dsh%% ICLR 2018 
QUANTIZATION ERROR AS A METRIC FOR DYNAMIC 
PRECISION SCALING IN NEURAL NET TRAINING 
Ian Taras & Dylan Malone Stuart 
Department of Electrical ]^[ Computer Engineering 
University of Toronto 
Toronto%%lst%% ON%%lst%% Canada 
{tarasian%%lst%% malones2}@ece%%per%%utoronto%%per%%ca 
1 
INTRODUCTION 
It is well established that neural networks%%lst%% though ordinarily trained using 32%%dsh%%bit single precision 
oating point representation%%lst%% can achieve desirable accuracy during inference with reduced precision 
weights ]^[ activations (Judd et al%%per%%%%lst%% 2015) (Mishra et al%%per%%%%lst%% 2017) (Courbariaux et al%%per%%%%lst%% 2015) (Hubara 
et al%%per%%%%lst%% 2016)%%per%%]$~ ~$[These reduced precision networks are amenable to acceleration on custom hardware 
platforms which can take advantage of lower bit%%dsh%%widths in order to speed up computation (Na & 
Mukhopadhyay%%lst%% 2016) (Gupta et al%%per%%%%lst%% 2015)%%per%%]$~ ~$[Reduced precision strategies are ]n[ typically applied 
during back%%dsh%%propagation whilst training%%lst%% as this can lead to heavily reduced accuracy ]v[ even non%%dsh%% 
convergence%%per%%]$~ 
~$[Recent work has shown that dynamic precision scaling%%lst%% a technique in which the numerical precision 
used during training is varied on%%dsh%%the%%dsh%%y as training progresses%%lst%% can achieve computational speedups 
(on custom hardware) without hampering accuracy (Na & Mukhopadhyay%%lst%% 2016) (Courbariaux 
et al%%per%%%%lst%% 2014)%%per%%]$~ ~$[DPS uses feedback from the training process to decide on an appropriate number 
representation%%per%%]$~ ~$[For example%%lst%% Na & Mukhopadhyay (2016) suggest starting with reduced precision%%lst%% 
]^[ increasing precision dramatically whenever training becomes numerically unstable%%lst%% ]v[ when 
training loss stagnates%%per%%]$~ 
~$[In this paper%%lst%% we present a novel DPS algorithm that uses the stochastic xed%%dsh%%point rounding method 
suggested by Gupta et al%%per%% (2015)%%lst%% the dynamic bit%%dsh%%width representation used by Na & Mukhopadhyay 
(2016)%%lst%% ]^[ an algorithm that leverages information on the quantization error encountered during 
rounding as a heuristic ]f[ scaling the number of fractional bits utilized%%per%% 
2 FIXED POINT REPRESENTATION AND QUANTIZATION/ROUNDING 
Fixed point numbers are represented by a fractional portion appended to an integer portion%%lst%% with an 
implied radix point in between%%per%%]$~ ~$[We allow our xed point representation to use arbitrary bit%%dsh%%width 
]f[ both the integer ]^[ fractional parts%%lst%% ]^[ represent the bit%%dsh%%width of the integer part as IL ]^[ 
the bit%%dsh%%width of the fractional part as F L%%per%%]$~ ~$[We denote a given xed point representation%%lst%% %%cmp_t%%%%lst%% as 
(cid:104)IL%%lst%% F L(cid:105)%%per%%]$~ ~$[DPS modies IL ]^[ F L on%%dsh%%the%%dsh%%y during training%%per%%]$~ 
~$[Inspired by Gupta et al%%per%% (2015)%%lst%% we use stochastic rounding during quantization of oating point 
values to (cid:104)IL%%lst%% F L(cid:105)%%lst%% as it implements an unbiased rounding%%per%% 
1 
Workshop track %%dsh%% ICLR 2018 
Our algorithm employs a dynamic bit%%dsh%%width%%lst%% dynamic radix scheme in which IL ]^[ F L are 
free to vary independently%%per%%]$~ ~$[Note that with the alternative xed bit%%dsh%%width scheme%%lst%% IL ]^[ F L are 
inter%%dsh%%dependent as increasing one necessitates a decrease in the other%%per%% 
3 DYNAMIC PRECISION SCALING ALGORITHM 
Here we formally introduce our novel DPS algorithm which leverages average % quantization error 
as a metric ]f[ scaling fractional bits%%per%%]$~ ~$[Quantization error is calculated on a per%%dsh%%value basis as in 
Equation 1%%per%%]$~ ~$[Quantization error % is accumulated ]^[ averaged over all round operations this is the 
metric used when scaling F L%%per%%]$~ 
~$[E% = 
|xout xin| 
xin 
100 
(1) 
Table 1 frames this work in relation to prior work in the area%%per%%]$~ 
~$[Algorithm 1 Dynamic Precision Scaling with Quantization Error 
Input%%cln%% Current Integer Length%%cln%% IL%%lst%% Current Fractional Length%%cln%% FL 
Overow Rate%%cln%% R 
Average % Quantization Error%%cln%% E 
Maximum Overow Rate%%cln%% R max 
Maximum Average Quantization Error%%cln%% E max 
Begin 
%%cmp_if%% R > R max%%cln%% 
Output%%cln%% (cid:104)IL%%lst%% F L(cid:105) ]f[ the given attribute (Weights%%lst%% Gradients%%lst%% ]v[ Activations)%%per%% 
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
IL IL + 1 
IL IL 1 
F L F L + 1 
F L F L 1 
%%cmp_if%% E > E max%%cln%% 
End 
%%cmp_e%% 
%%cmp_e%% 
Table 1%%cln%% Summary of related work 
Authors 
Fixed point format 
(bit width%%lst%% radix) 
Scaling 
Rounding 
(Na & Mukhopadhyay%%lst%% 2016) 
(Dynamic%%lst%% Dynamic) Convergence/ 
(Courbariaux et al%%per%%%%lst%% 2014) 
(Gupta et al%%per%%%%lst%% 2015) 
Essam et al%%per%% (2017) 
(Koster et al%%per%%%%lst%% 2017) 
(Fixed%%lst%% Dynamic) 
(Fixed%%lst%% Fixed) 
(Fixed%%lst%% Dynamic) 
(Fixed%%lst%% Dynamic) 
Training Based 
Nearest 
Overow Based Nearest 
None 
Overow Based 
Predictive 
Max%%dsh%%Value 
Stochastic 
Stochastic 
N/A 
Precision 
Granularity 
Per%%dsh%%Layer 
Per%%dsh%%Layer 
Global 
Global 
Per%%dsh%%Tensor 
(Dynamic%%lst%% Dynamic) Overow ]^[ 
Quantization 
Error Based 
Stochastic 
Global 
Ours 
4 EXPERIMENTS 
In order to perform evaluations%%lst%% we emulate a dynamic xed point representation by using custom 
Caffe layers that quantize/round the native oating point values to values that are legal in our xed 
point format%%per%%]$~ ~$[In our study%%lst%% we consider training a neural network using stochastic gradient descent 
with dynamically scaled precision ]f[ weights%%lst%% activations%%lst%% ]^[ gradients during both the forward 
2 
Workshop track %%dsh%% ICLR 2018 
(inference) ]^[ backward pass%%per%%]$~ ~$[As per Na & Mukhopadhyay (2016)%%lst%% we quantize weights%%lst%% biases%%lst%% 
activations%%lst%% ]^[ gradients at the appropriate pass through the network%%lst%% ]^[ update the precision 
on%%dsh%%the%%dsh%%y during training on each iteration%%per%%]$~ 
~$[We train LeNet%%dsh%%5 on the MNIST dataset using Caffe ]^[ our custom rounding layers ]^[ DPS 
algorithm (Lecun et al%%per%%%%lst%% 1998)%%per%%]$~ ~$[We use a batch size of 64%%lst%% ]^[ train ]f[ 10,000 iterations%%per%%]$~ ~$[We use an 
initial learning rate of 0%%per%%01%%lst%% momentum of 0%%per%%9%%lst%% a weight decay factor of 0%%per%%0005%%lst%% ]^[ scale the learning 
rate using lr = lrinit (1 + iter)pow%%lst%% where = 0%%per%%0001 ]^[ pow = 0%%per%%75%%per%%]$~ ~$[We update IL ]^[ FL 
once each iteration%%lst%% ]^[ use Emax = Rmax = 0%%per%%01%%%per%%]$~ 
~$[We %%cmp%% our results to a baseline network trained on the same dataset with the same hyperparame%%dsh%% 
ters%%lst%% ]b[ using full%%dsh%%precision oating point ]f[ all attributes%%per%%]$~ ~$[We also %%cmp%% against a non%%dsh%%dynamic 
xed point representation that uses 13 bits ]f[ weights ]^[ activations%%lst%% ]^[ keeps gradients at 32 bits%%per%% 
(a) Test Error 
(b) Log of Training Loss 
Figure 1%%cln%% Comparison of training with Dynamic Precision Scaling vs%%per%% the baseline (oating point) vs%%per%% 
xed point reduced precision (13 bit weights ]^[ activations)%%per%%]$~ 
~$[Our results reveal that we can achieve accuracy on%%dsh%%par with 
the baseline%%lst%% whilst drastically reducing the bit%%dsh%%width used 
]f[ both weights ]^[ activations%%per%%]$~ ~$[Our dynamic precision 
scaling algorithm in general%%lst%% however%%lst%% doesnt reduce the 
gradient bit%%dsh%%width very much%%lst%% as this requires the most 
precision in order ]f[ training to converge%%per%%]$~ ~$[The training loss 
using DPS is%%lst%% in general%%lst%% larger %%cmp_ta%% the training loss of the 
baseline model without hurting accuracy%%lst%% suggesting that 
the reduced precision may act as a regularization technique 
during training this needs validation via experimentation 
on larger networks ]^[ more complex datasets%%per%%]$~ ~$[Note that 
naively reducing the bit%%dsh%%width of weights ]^[ activations 
to a xed 13%%dsh%%bits with no dynamic precision scaling results 
in the training process failing to converge%%per%%]$~ ~$[With dynamic 
precision scaling%%lst%% however%%lst%% 13%%dsh%%bit weights ]^[ activations 
are sufcient early in the training process%%per%% 
5 DISCUSSION 
Figure 2%%cln%% Moving average bitwidths dur%%dsh%% 
ing training using DPS%%per%%]$~ 
~$[We introduce a dynamic precision scaling algorithm that uses quantization error as a metric ]f[ 
scaling dynamic bit%%dsh%%width xed point values during neural network training%%per%%]$~ ~$[Combining this with 
stochastic rounding%%lst%% we achieve greatly reduced bit%%dsh%%width during training%%lst%% whilst remaining within a 
fraction of a % of SOTA accuracy on the MNIST dataset%%per%%]$~ ~$[This avenue of algorithmic work%%lst%% when 
paired with emerging hardware ]f[ training%%lst%% has the potential to greatly increase the productivity of 
engineers ]^[ machine learning researchers alike by decreasing training time%%per%% 
3 
Workshop track %%dsh%% ICLR 2018 
REFERENCES 
M%%per%%]$~ ~$[Courbariaux%%lst%% Y%%per%%]$~ ~$[Bengio%%lst%% ]^[ J%%per%%%%dsh%%P%%per%%]$~ ~$[David%%per%%]$~ ~$[BinaryConnect%%cln%% Training Deep Neural Networks with 
binary weights during propagations%%per%%]$~ ~$[ArXiv e%%dsh%%prints%%lst%% November 2015%%per%%]$~ 
~$[Matthieu Courbariaux%%lst%% Yoshua Bengio%%lst%% ]^[ Jean%%dsh%%Pierre David%%per%%]$~ ~$[Low precision arithmetic ]f[ deep 
learning%%per%%]$~ ~$[CoRR%%lst%% abs/1412%%per%%7024%%lst%% 2014%%per%%]$~ ~$[URL http://arxiv%%per%%org/abs/1412%%per%%7024%%per%%]$~ 
~$[M%%per%%]$~ ~$[Essam%%lst%% T%%per%%]$~ ~$[B%%per%%]$~ ~$[Tang%%lst%% E%%per%%]$~ ~$[T%%per%%]$~ ~$[W%%per%%]$~ ~$[Ho%%lst%% ]^[ H%%per%%]$~ ~$[Chen%%per%%]$~ ~$[Dynamic point stochastic rounding algorithm ]f[ 
limited precision arithmetic in deep belief network training%%per%%]$~ ~$[In 2017 8th International IEEE/EMBS 
Conference on Neural Engineering (NER)%%lst%% pp%%per%% 629632%%lst%% May 2017%%per%% doi%%cln%% 10%%per%%1109/NER%%per%%2017%%per%% 
8008430%%per%%]$~ 
~$[Suyog Gupta%%lst%% Ankur Agrawal%%lst%% Kailash Gopalakrishnan%%lst%% ]^[ Pritish Narayanan%%per%%]$~ ~$[Deep learning with 
limited numerical precision%%per%%]$~ ~$[CoRR%%lst%% abs/1502%%per%%02551%%lst%% 2015%%per%%]$~ 
~$[Itay Hubara%%lst%% Matthieu Courbariaux%%lst%% Daniel Soudry%%lst%% Ran El%%dsh%%Yaniv%%lst%% ]^[ Yoshua Bengio%%per%%]$~ ~$[Binarized neu%%dsh%% 
ral networks%%per%%]$~ ~$[In D%%per%%]$~ ~$[D%%per%%]$~ ~$[Lee%%lst%% M%%per%%]$~ ~$[Sugiyama%%lst%% U%%per%%]$~ ~$[V%%per%%]$~ ~$[Luxburg%%lst%% I%%per%%]$~ ~$[Guyon%%lst%% ]^[ R%%per%%]$~ ~$[Garnett (eds%%per%%)%%lst%% Advances 
in Neural Information Processing Systems 29%%lst%% pp%%per%% 41074115%%per%%]$~ ~$[Curran Associates%%lst%% Inc%%per%%%%lst%% 2016%%per%%]$~ ~$[URL 
http://papers%%per%%nips%%per%%cc/paper/6573%%dsh%%binarized%%dsh%%neural%%dsh%%networks%%per%%pdf%%per%%]$~ 
~$[Patrick Judd%%lst%% Jorge Albericio%%lst%% Tayler Hetherington%%lst%% Tor Aamodt%%lst%% Natalie Enright Jerger%%lst%% Raquel 
Urtasun%%lst%% ]^[ Andreas Moshovos%%per%%]$~ ~$[Reduced%%dsh%%Precision Strategies ]f[ Bounded Memory in Deep 
Neural Nets%%lst%% arXiv:1511%%per%%05236v4 [cs%%per%%LG] %%per%% arXiv%%per%%org%%lst%% 2015%%per%%]$~ 
~$[Urs Koster%%lst%% Tristan Webb%%lst%% Xin Wang%%lst%% Marcel Nassar%%lst%% Arjun K Bansal%%lst%% William Constable%%lst%% Oguz 
Elibol%%lst%% Stewart Hall%%lst%% Luke Hornof%%lst%% Amir Khosrowshahi%%lst%% Carey Kloss%%lst%% Ruby J Pai%%lst%% ]^[ Naveen 
Rao%%per%%]$~ ~$[Flexpoint%%cln%% An adaptive numerical format ]f[ efcient training of deep neural networks%%per%%]$~ ~$[In 
I%%per%%]$~ ~$[Guyon%%lst%% U%%per%%]$~ ~$[V%%per%%]$~ ~$[Luxburg%%lst%% S%%per%%]$~ ~$[Bengio%%lst%% H%%per%%]$~ ~$[Wallach%%lst%% R%%per%%]$~ ~$[Fergus%%lst%% S%%per%%]$~ ~$[Vishwana%%cmp_ta%%%%lst%% ]^[ R%%per%%]$~ ~$[Garnett (eds%%per%%)%%lst%% 
Advances in Neural Information Processing Systems 30%%lst%% pp%%per%% 17401750%%per%%]$~ ~$[Curran Associates%%lst%% Inc%%per%%%%lst%% 
2017%%per%%]$~ 
~$[Y%%per%%]$~ ~$[Lecun%%lst%% L%%per%%]$~ ~$[Bottou%%lst%% Y%%per%%]$~ ~$[Bengio%%lst%% ]^[ P%%per%%]$~ ~$[Haffner%%per%%]$~ ~$[Gradient%%dsh%%based learning applied to document 
recognition%%per%%]$~ ~$[Proceedings of the IEEE%%lst%% 86(11):22782324%%lst%% Nov 1998%%per%%]$~ ~$[ISSN 0018%%dsh%%9219%%per%% doi%%cln%% 
10%%per%%1109/5%%per%%726791%%per%%]$~ 
~$[Asit K%%per%%]$~ ~$[Mishra%%lst%% Eriko Nurvitadhi%%lst%% Jeffrey J%%per%%]$~ ~$[Cook%%lst%% ]^[ Debbie Marr%%per%%]$~ ~$[WRPN%%cln%% wide reduced%%dsh%%precision 
networks%%per%%]$~ ~$[CoRR%%lst%% abs/1709%%per%%01134%%lst%% 2017%%per%%]$~ ~$[URL http://arxiv%%per%%org/abs/1709%%per%%01134%%per%%]$~ 
~$[Taesik Na ]^[ Saibal Mukhopadhyay%%per%%]$~ ~$[Speeding up convolutional neural network training with 
dynamic precision scaling ]^[ exible multiplier%%dsh%%accumulator%%per%%]$~ ~$[In Proceedings of the 2016 In%%dsh%% 
ternational Symposium on Low Power Electronics ]^[ Design%%lst%% ISLPED 16%%lst%% pp%%per%% 5863%%lst%% New 
York%%lst%% NY%%lst%% USA%%lst%% 2016%%per%%]$~ ~$[ACM%%per%%]$~ ~$[ISBN 978%%dsh%%1%%dsh%%4503%%dsh%%4185%%dsh%%1%%per%% doi%%cln%% 10%%per%%1145/2934583%%per%%2934625%%per%%]$~ ~$[URL 
http://doi%%per%%acm%%per%%org/10%%per%%1145/2934583%%per%%2934625%%per%% 
4 
