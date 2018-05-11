~$[Semantic homophily in online communication%%cln%% evidence from Twitter 
A 
SANjA S CEPANOVI C%%lst%% Aalto University 
IGOR MISHKOVSKI%%lst%% University Ss%%per%%]$~ ~$[Cyril ]^[ Methodius 
BRUNO GONC ALVES%%lst%% New York University 
NGUYEN TRUNG HIEU%%lst%% University of Tampere 
PAN HUI%%lst%% Hong Kong University of Science ]^[ Technology 
People are observed to assortatively connect on a set of traits%%per%%]$~ ~$[This phenomenon%%lst%% termed assortative mixing ]v[ sometimes 
homophily%%lst%% can be quanti ed through assortativity coef cient in social networks%%per%%]$~ ~$[Uncovering the exact causes of strong 
assortative mixing found in social networks has been a research challenge%%per%%]$~ ~$[Among the main suggested causes from sociology 
are the tendency of similar individuals to connect (often itself referred as homophily) ]^[ the social in uence among already 
connected individuals%%per%%]$~ ~$[Distinguishing between these tendencies ]^[ other plausible causes ]^[ quantifying their contribution 
to the amount of assortative mixing has been a dif cult task%%lst%% ]^[ proven ]n[ even possible from observational data%%per%%]$~ ~$[However%%lst%% 
another task of similar importance to researchers ]^[ in practice can be tackled%%lst%% as we present here%%cln%% understanding the exact 
mechanisms of interplay between these tendencies ]^[ the underlying social network structure%%per%%]$~ ~$[Namely%%lst%% in addition to the 
mentioned assortativity coef cient%%lst%% there are several other static ]^[ temporal network properties ]^[ substructures that can 
be linked to the tendencies of homophily ]^[ social in uence in the social network ]^[ we herein investigate those%%per%%]$~ 
~$[Concretely%%lst%% we tackle a computer%%dsh%%mediated communication network (based on Twitter mentions) ]^[ a particular type 
of assortative mixing that can be inferred from the semantic features of communication content that we term semantic 
homophily%%per%%]$~ ~$[Our work%%lst%% to the best of our knowledge%%lst%% is the rst to offer an in%%dsh%%depth analysis on semantic homophily in 
a communication network ]^[ the interplay between them%%per%%]$~ ~$[We quantify diverse levels of semantic homophily%%lst%% identify the 
semantic aspects that are the drivers of observed homophily%%lst%% show insights in its temporal evolution ]^[ nally%%lst%% we present its 
intricate interplay with the communication network on Twitter%%per%%]$~ ~$[By analyzing these mechanisms we increase understanding 
on what are the semantic aspects that shape ]^[ how they shape the human computer%%dsh%%mediated communication%%per%%]$~ ~$[In addition%%lst%% 
our analysis framework presented on this concrete case can be easily adapted%%lst%% extended ]^[ applied on other type of social 
networks ]^[ ]f[ different types of homophily%%per%%]$~ 
~$[Keywords%%cln%% Homophily%%lst%% Semantics%%lst%% In uence%%lst%% Semantic Relatedness%%lst%% Twitter%%lst%% Wikipedia%%lst%% Social Network Analysis%%lst%% Compu%%dsh%% 
tational Social Science 
1%%per%%]$~ ~$[INTRODUCTION 
Homophily [Lazarsfeld ]^[ Merton 1954%%scn%% McPherson et al%%per%% 2001] (sometimes referred as selection 
[Leenders 1997%%scn%% Crandall et al%%per%% 2008]) represents a tendency of individuals who are similar on some 
traits to connect to each other (become friends%%lst%% follow each other%%lst%% communicate etc%%per%%) in a social net%%dsh%% 
work%%per%%]$~ ~$[Social in uence (peer pressure) is in a way an inverse tendency ]f[ people to become similar 
on some traits ]v[ to adopt certain behavior from their social contacts%%per%%]$~ ~$[Both%%lst%% homophily ]^[ social 
in uence result in a higher correlation (assortative mixing) on certain traits between connected than 
between random users in a network%%per%%]$~ ~$[This assortative mixing property (also in some studies referred 
as social correlation [Anagnostopoulos et al%%per%% 2008]) is repeatedly con rmed in social network anal%%dsh%% 
ysis literature [Bollen et al%%per%% 2011%%scn%% De Choudhury et al%%per%% 2010%%scn%% Anagnostopoulos et al%%per%% 2008%%scn%% Aral 
]^[ Walker 2012%%scn%% Tang et al%%per%% 2013]%%per%%]$~ ~$[A question remains%%lst%% to what extent is the observed assortative 
mixing a result of an underlying homophily that shapes the formation of the network ]v[ of the social 
in uence taking place in an already formed network [Leenders 1997]%%per%%]$~ ~$[A third factor that could be 
the cause of social correlation is a common external in uence%%per%%]$~ ~$[Moreover%%lst%% a combination of these 
factors is often at play%%per%%]$~ ~$[For instance%%lst%% an external factor might have non%%dsh%%homogeneous adoption in 
the network because friends could have a higher common latent propensity ]f[ it ]^[ adopt it to a 
larger extent than non%%dsh%%friends%%per%%]$~ ~$[Distinguishing between these factors as the main causes of assorta%%dsh%% 
Author s addresses%%cln%% S%%per%%]$~ ~$[S cepanovi c%%lst%% Aalto University%%lst%% Department of Computer Science%%lst%% Espoo%%lst%% 02150%%lst%% Finland%%scn%% I%%per%%]$~ 
~$[Mishkovski%%lst%% University Ss%%per%%]$~ ~$[Cyril ]^[ Methodius%%lst%% Faculty of Computer Science%%lst%% Skopje%%lst%% 1000%%lst%% Macedonia%%scn%% H%%per%%]$~ ~$[Nguyen Trung%%lst%% 
University of Tampere%%lst%% Tampere%%lst%% 33100%%lst%% Finland%%scn%% P%%per%%]$~ ~$[Hui%%lst%% Hong Kong University of Science ]^[ Technology%%lst%% Department of 
Computer Science%%lst%% Clear Water Bay%%lst%% Kowloon%%lst%% Hong Kong%%scn%% B%%per%%]$~ ~$[Gonc alves%%lst%% New York University%%lst%% Center ]f[ Data Science%%lst%% 
New York%%lst%% 10003%%lst%% U%%per%%S%%per%%%%scn%% 
7 
1 
0 
2 
r 
a 
M 
0 
2 
] 
h 
p 
%%dsh%% 
c 
o 
s 
%%per%% 
s 
c 
i 
s 
y 
h 
p 
[ 
3 
v 
7 
0 
2 
8 
0 
%%per%% 
6 
0 
6 
1 
%%cln%% 
v 
i 
X 
r 
a 
A:2 
S%%per%%]$~ ~$[S cepanovi c et al%%per%% 
tive mixing has been a challenge%%lst%% ]^[ proven ]n[ even possible from observational data [Shalizi ]^[ 
Thomas 2011]%%per%%]$~ 
~$[Extensive research is conducted in sociology on homophily in social networks as abstractions of 
diverse groups in society (see the seminal review by McPherson et al%%per%% [McPherson et al%%per%% 2001])%%per%%]$~ 
~$[Classical paper [Lazarsfeld ]^[ Merton 1954] introduced two basic levels ]v[ dimensions of ho%%dsh%% 
mophily%%cln%% status ]^[ value homophily%%per%%]$~ ~$[Status homophily relates to any formal ]v[ perceived status 
among individuals%%per%%]$~ ~$[It includes some of the most important social dimensions%%lst%% such as race%%lst%% eth%%dsh%% 
nicity%%lst%% sex%%lst%% age%%lst%% education%%lst%% occupation ]^[ religion%%per%%]$~ ~$[Value homophily relates to our internal states 
that might shape the future behavior%%scn%% ]f[ example%%cln%% abilities (intelligence)%%lst%% aspirations%%lst%% ]^[ attitudes 
(political orientation)%%lst%% regardless of the differences in status%%per%%]$~ 
~$[In addition to individuals connecting to similar individuals%%lst%% another suggested mechanism driving 
homophily is the process of tie (link) dissolution over time that happens more often among non%%dsh%% 
similar individuals%%per%%]$~ ~$[However%%lst%% both mechanisms%%lst%% of similarity ]^[ dissimilarity are ]n[ enough to 
explain a particular clustered (community) structure found in social networks%%per%%]$~ ~$[Sociologists have pro%%dsh%% 
posed that instead of only being driven by similarity%%lst%% a tie is actually often formed around a speci c 
focus of homophily [Feld 1981]%%per%%]$~ ~$[McPherson et al%%per%% [McPherson et al%%per%% 2001] offer a nice overview 
on possible different foci%%lst%% ]^[ below we brie y discuss some of them%%per%%]$~ ~$[Geographical proximity is 
considered one of the most important foci of homophily%%lst%% simply put%%lst%% because we are more likely to 
have contacts with the people who are geographically closer to us%%per%%]$~ ~$[The ties induced by proximity 
in space are often weak%%scn%% however%%lst%% they leave more potential ]f[ stronger ties formation%%per%%]$~ ~$[It is worth 
noting that the advent of new technologies over time did ]n[ remove this pattern of geographical 
homophily ]^[ recent empirical research on online social networks nds that people online still tend 
to connect more often to geographically close people (in Twitter network [Kulshrestha et al%%per%% 2012%%scn%% 
De Choudhury 2011]%%scn%% in Microsoft IMS [Leskovec ]^[ Horvitz 2008]%%scn%% in Facebook social graph 
[Ugander et al%%per%% 2011]%%scn%% in mobile phone communication [Blondel et al%%per%% 2010])%%per%%]$~ ~$[The only study we 
found that reports no signi cant effects of geographical homophily tackles organization%%dsh%%individual 
relationship on Twitter [Sun ]^[ Rui 2017]%%per%%]$~ ~$[Another important focus that causes homophily are fam%%dsh%% 
ily ties%%per%%]$~ ~$[Family ties are an interesting focus of formation that causes people who are similar on some 
aspects ]^[ as well who are dissimilar on certain other aspects to connect%%per%%]$~ ~$[For this reason%%lst%% when 
it comes to family ties%%lst%% we nd the largest geographic%%lst%% age%%lst%% sex ]^[ educational heterophily%%scn%% ]b[ at 
the same time%%lst%% the largest race%%lst%% religious ]^[ ethnic homophily%%per%%]$~ ~$[Organizational foci turns to be the 
most important cause of ties that are ]n[ relatives nor family%%dsh%%bound%%per%%]$~ ~$[These foci include schoolmates%%lst%% 
colleagues from work ]^[ voluntary organizations%%per%%]$~ ~$[A more implicit cause of homophily shows to 
be network position%%per%%]$~ ~$[Research nding exist that holding a same position inside an organization will 
induce larger homophily between individuals than it would be the case if the ties were random 
[Lincoln ]^[ Miller 1979]%%per%%]$~ ~$[Another%%lst%% more internal%%lst%% focus ]f[ homophily lies inside perceived sim%%dsh%% 
ilarity ]^[ shared knowledge%%lst%% ]^[ it is termed cognitive processes%%per%%]$~ ~$[It is particularly notable among 
teenagers who tend to connect to those who are perceived to be more similar on some of the internal 
traits%%per%%]$~ ~$[Looking back at the described homophily traits ]^[ foci%%lst%% it is ]n[ easy to make a clear dis%%dsh%% 
tinction between the consequences of homophily ]^[ the causes ]v[ origins of it%%per%%]$~ ~$[Whether cognitive 
processes focus among teenagers causes them to become friends with similar ones%%scn%% ]v[ whether the 
friend teenagers in uence each other ]^[ hence become similar on a value homophily level? 
1%%per%%1%%per%%]$~ ~$[Terminology 
Communication network%%cln%% In this study%%lst%% the social network of interest is a computer%%dsh%%mediated 
communication [Thurlow et al%%per%% 2004] network from Twitter%%per%%]$~ ~$[It is formed of nodes representing 
Twitter users%%lst%% ]^[ the directed links representing the tweets in which they mention (reply to) each 
other%%per%%]$~ ~$[The tweet content is also included%%per%%]$~ ~$[Hence%%lst%% our network can be seen as a subtype of previously 
introduced interaction networks on Facebook [Wilson et al%%per%% 2009]%%per%%]$~ ~$[Throughout the rest of this study 
we simply use the term communication network referring to this de nition%%per%%]$~ ~$[While in general 
communication refers to exchanging of information%%lst%% we recognize the potential of Twitter mentions 
Semantic homophily in online communication%%cln%% evidence from Twitter 
A:3 
to carry two different forms of communication%%per%%]$~ ~$[In the rst form%%lst%% the source is directly addressing the 
receiver%%lst%% ]^[ in the second form%%lst%% there is a sort of authority attribution where the source comments 
to the rest of the Twitter users about the receiver (this could be a critique as well)%%per%%]$~ ~$[Communication 
intensity (CI) in our network denotes the weight on the links i%%per%%e%%per%%%%lst%% the number of mentions between 
a pair of users%%per%%]$~ 
~$[Semantic homophily%%cln%% Importantly%%lst%% in many related studies the term homophily is used with the 
meaning of assortative mixing as we introduced it here (one possible reason being described indis%%dsh%% 
tinguishability of presented phenomena)%%per%%]$~ ~$[We also use the term semantic homophily when talking 
about assortative mixing on semantic aspects of communication%%per%%]$~ ~$[In the light of introduced de ni%%dsh%% 
tions%%lst%% a more precise term to use would be semantic assortative mixing%%per%%]$~ ~$[However%%lst%% we select to talk 
about semantic homophily in order to be consistent with the related studies ]^[ also since we do ]n[ 
focus on distinguishing between homophily ]^[ social in uence%%per%%]$~ ~$[Hence%%lst%% using an umbrella term 
semantic homophily to cover both tendencies is simpler%%per%%]$~ ~$[When at some point we talk about one 
of the tendencies in particular%%lst%% we then point that out%%per%%]$~ ~$[In order to analyze semantic homophily%%lst%% we 
tackle following semantic aspects of communication%%cln%% 
semantic relatedness (SR) between the tweet contents of two users%%per%%]$~ ~$[SR is a more general metric 
compared to semantic similarity [Harispe et al%%per%% 2015] since in addition to similarity%%lst%% it includes 
also any other relation between the terms%%lst%% such as antonymes (opposite terms) [Lehrer ]^[ Lehrer 
1982] ]^[ meronymes (a term is a part of ]v[ member of the other) [Murphy 2003]%%per%%]$~ ~$[For instance%%lst%% 
the term airplane is similar to the term spacecraft%%per%%]$~ ~$[The same term is related to car%%lst%% train ]v[ wing%%lst%% 
]b[ ]n[ similar to them%%per%%]$~ ~$[SR relation between tweets of a pair of users is quanti ed by a value 
ranging from 0 (not related at all) to 1 (maximally related)%%scn%% 
sentiment of user tweet content%%per%%]$~ ~$[The sentiment value ranges from %%dsh%%1 (negative) to 1 (positive)%%scn%% 
the most important entities (people%%lst%% companies%%lst%% organizations%%lst%% cities%%lst%% geographic features etc%%per%%)%%lst%% 
concepts (abstract ideas in the text%%cln%% ]f[ example%%lst%% if an article mentions CERN ]^[ the Higgs 
boson%%lst%% it will have Large Hadron Collider as a concept even if the term is ]n[ mentioned explicitly 
in the page [An IBM Company 2016]) ]^[ taxonomy (a hierarchy that helps to classify the content 
into its most likely topic category) of user tweets content%%per%%]$~ 
~$[Communication propensity ( cp) is de ned as function of some property ]^[ represents the ex%%dsh%% 
tent to which the observed communication ]^[ its intensity diverge from what would be expected in 
a uniformly random setting with respect to that property%%per%%]$~ ~$[We investigate communication propensity 
in our network with respect to SR threshold in the network (formula is given in Section 4%%per%%1)%%per%%]$~ 
~$[Social capital%%cln%% Among a variety of de nitions from sociology [Portes 2000%%scn%% Bourdieu 2011]%%lst%% 
one that translates well to our case introduces social capital as the actual ]^[ potential resources 
that are linked to the ego s social network ]^[ relationships%%per%%]$~ ~$[Hence%%lst%% in similarity to the previ%%dsh%% 
ous study on socio%%dsh%%semantic networks [Roth ]^[ Cointet 2010]%%lst%% we de ne social capital in our 
communication network as the total number of contacts (degree in the unweighted network) ]v[ 
the total communication intensity (degree in the weighted network)%%per%%]$~ ~$[Moreover%%lst%% we can divide the 
social capital%%lst%% de ned as such%%lst%% in both cases to popularity (if we look at in%%dsh%%degree) ]^[ commu%%dsh%% 
nication activity (if looking at out%%dsh%%degree)%%per%%]$~ ~$[To sum up%%lst%% thanks to our network being directed ]^[ 
weighted%%lst%% we can introduce four types of social capital in it%%cln%% (i) popularity in terms of number of 
communication contacts ]^[ (ii) popularity in terms of communication intensity ]^[ (iii) activity in 
terms of number of contacts ]^[ (iv) activity in terms of communication intensity%%per%%]$~ 
~$[Semantic capital denotes the amount of diversity of user tweet content with respect to the intro%%dsh%% 
duced semantic attributes%%lst%% similarly as in [Roth ]^[ Cointet 2010]%%per%%]$~ 
~$[Relative status of two users can be de ned ]f[ both social ]^[ semantic capital ]^[ represents the 
difference of their respective status ranks%%per%%]$~ ~$[Finally%%lst%% ]f[ a single user we de ne status inconsistency 
[Lenski 1954%%scn%% Rogers ]^[ Bhowmik 1970] as a relative difference between his/her ranking among 
all users on social ]^[ semantic capital%%per%%]$~ ~$[Status inconsistent individuals tend to be highly ranked on 
some aspects ]^[ lowly ranked on others%%per%%]$~ ~$[This is suggested to be an attribute of individuals who 
are drivers of social change [Lenski 1954]%%per%%]$~ ~$[Status inconsistency can be de ned on a communication 
A:4 
S%%per%%]$~ ~$[S cepanovi c et al%%per%% 
link%%lst%% as well%%lst%% as a measure of inconsistency of both participating users (we give a formal de nition 
in Section 4%%per%%4)%%per%% 
1%%per%%2%%per%%]$~ ~$[Contributions 
In this study%%lst%% we offer a deeper understanding on the mechanisms of semantic homophily ]^[ how 
they are shaping the structure ]^[ properties of the underlying communication network%%per%%]$~ 
~$[While homophily has been identi ed in a diverse set of social networks%%lst%% most of the studies inves%%dsh%% 
tigated friendship%%lst%% followers ]v[ citation type of ties%%per%%]$~ ~$[Interaction ties are more suitable ]f[ inferring 
meaningful social relationships [Wilson et al%%per%% 2009]%%per%%]$~ ~$[Our analysis is on the communication ties 
formed from Twitter mentions (replies)%%lst%% that are a subtype of interaction ties%%per%%]$~ ~$[The ties in our net%%dsh%% 
work are ]n[ only formed once (such as friendship ]^[ followership)%%lst%% ]b[ they require an active 
engagement over time%%per%%]$~ ~$[The nature of the mention network is fundamentally different from fol%%dsh%% 
lower/friendship network in Twitter [Bliss et al%%per%% 2012]%%per%%]$~ ~$[For instance%%lst%% the reciprocity of the followers 
network is found to be around 22% [Kwak et al%%per%% 2010] which is lower compared to the other social 
networks%%per%%]$~ ~$[The reciprocity of our mention network is 64%%%lst%% considerably higher%%per%%]$~ ~$[When a user A fol%%dsh%% 
lows a user B it simply states some type of potential interest in what B has to say%%per%%]$~ ~$[Depending on the 
different time zones ]^[ the number of other users that A is already following s/he might ]n[ even 
get to see any of B s tweets%%per%%]$~ ~$[In the case of our communication network we can clearly point to 
interactions ]^[ information diffusion between users (when the user A mentions the user B)%%lst%% instead 
of simply speculating about it when using the friendship/follower network%%per%%]$~ ~$[While retweet network 
allows ]f[ similar information diffusion analysis%%lst%% its nature is also shown to be importantly different 
from mention network [Conover et al%%per%% 2011]%%per%%]$~ ~$[Finally%%lst%% observance of communication interruption in 
time allows us to de ne a tie dissolution (link decommission)%%per%%]$~ ~$[As discussed in [Bliss et al%%per%% 2012]%%lst%% 
considering link decommission resolves issues of analyzing social network with stale links without 
current functional role%%per%%]$~ 
~$[The focus of our work is on semantic homophily%%per%%]$~ ~$[While several other studies have tackled some 
aspects of semantic homophily%%lst%% as we discuss in the related work%%lst%% to the best of our knowledge 
this is the rst study aiming towards a comprehensive picture on the role of semantic homophily in 
communication%%per%%]$~ ~$[We offer an in%%dsh%%depth ]^[ detailed investigation of semantic homophily%%cln%% from quan%%dsh%% 
ti cation ]^[ qualitative assessment%%lst%% through temporal evolution to its interplay with community 
structure of communication network%%per%%]$~ 
~$[Fig%%per%% 1 presents the general framework ]f[ our study ]^[ lists several main contributions%%per%%]$~ ~$[For a full 
list of our contributions%%lst%% we refer the reader to Table VIII in Discussion 7%%per%%]$~ ~$[As depicted in Fig%%per%% 1%%lst%% we 
operate on experimental datasets (from Twitter ]^[ Wikipedia)%%lst%% while at the same time building on 
existing sociological ndings ]^[ theories%%per%%]$~ ~$[By testing ]f[ existence of status ]^[ value homophily%%lst%% 
we con rm that these general theories from sociology hold in a communication social network%%per%%]$~ ~$[In 
addition%%lst%% we identify the aspects of homophily that are speci c ]f[ communication%%lst%% compared to 
other types of social networks%%per%%]$~ ~$[A natural method to asses homophily in communication is through 
semantic aspects of it%%per%%]$~ 
~$[At rst we quantify diverse aspects of semantic homophily in the network%%per%%]$~ ~$[We start by uncover%%dsh%% 
ing the subtle relationship between SR among users ]^[ the intensity of their communication%%per%%]$~ ~$[Next 
we introduce measures of social ]^[ semantic status of users ]^[ show that communication net%%dsh%% 
work exhibits assortativity on those metrics%%per%%]$~ ~$[This con rms sociological theories on status level ho%%dsh%% 
mophily%%per%%]$~ ~$[We also show that such status correlation increases with strength of ties in communication%%per%%]$~ 
~$[In addition%%lst%% analysis of the interplay between two types of capital reveals large status heterogeneity 
among users%%per%%]$~ ~$[Accordingly%%lst%% we nd that status inconsistency of one ]v[ both communicating parties 
correlates with intensity of communication%%per%%]$~ 
~$[Next we focus on temporal evolution of semantic homophily%%per%%]$~ ~$[We detect temporal increase in 
average semantic relatedness among users ]^[ investigate new links formation as a possible cause%%per%%]$~ 
~$[However%%lst%% we also nd a number of links that get decommissioned in time%%per%%]$~ ~$[After comparing rel%%dsh%% 
ative statuses of users who stop communication%%lst%% we present evidence that decommission is more 
Semantic homophily in online communication%%cln%% evidence from Twitter 
A:5 
Fig%%per%% 1%%cln%% General framework ]^[ main contributions of our study%%per%%]$~ ~$[In blue frames we denote 
the evidence found in Twitter experimental data ]f[ the existing theories from sociology%%per%%]$~ ~$[During 
data analysis%%lst%% we also nd evidence pointing to some novel hypotheses%%lst%% presented in green fames%%per%%]$~ 
~$[However%%lst%% such evidence should be evaluated ]^[ con rmed in several other datasets before any 
general conclusions about semantic homophily in communication can be reached%%per%% 
due to status than to value heterophily%%per%%]$~ ~$[Finally%%lst%% the analysis on the community structure of the 
communication network (structural communities) reveals the semantic foci around which such 
communities are formed (functional communities)%%per%%]$~ ~$[In this way%%lst%% we nd evidence ]f[ Feld s theory 
of focused organization of social ties [Feld 1981] ]^[ also identify some of such foci around which 
communication ties are formed%%per%%]$~ ~$[In the end%%lst%% we delve into the mechanisms of pluralistic homophily 
(assortative mixing as a result of several foci)%%lst%% ]^[ describe speci city of users who have such a 
position in communication network%%per%%]$~ 
~$[The rest of the paper is organized as follows%%per%%]$~ ~$[Section 2 presents related research literature%%per%%]$~ ~$[In 
Section 3 we describe two Web datasets (from Twitter ]^[ Wikipedia) used ]f[ analysis%%lst%% as well 
as the framework of analysis consisting of a communication (Section 3%%per%%1) ]^[ semantic (Section 
3%%per%%2) layer%%per%%]$~ ~$[Quanti cation of different forms of homophily in our network is presented in Section 
4%%cln%% social status homophily in 4%%per%%2 ]^[ semantic status ]^[ value homophily in 4%%per%%3%%per%%]$~ ~$[Insights on the 
relationship between these forms of capital%%lst%% ]^[ relative status ]^[ status inconsistency are given in 
4%%per%%4%%per%%]$~ ~$[The relationship between semantic relatedness ]^[ communication are reported in Subsection 
4%%per%%1%%per%%]$~ ~$[Temporal aspects of semantic homophily%%lst%% from link formation ]^[ dissolution to persisting 
interactions%%lst%% are discussed in Section 5%%per%%]$~ ~$[Community structure ]^[ focused organization of social 
A:6 
S%%per%%]$~ ~$[S cepanovi c et al%%per%% 
ties are the topic in Section 6%%per%%]$~ ~$[Pluralistic homophily is also characterized in this section%%per%%]$~ ~$[The article 
concludes with a discussion ]^[ nal remarks on future research directions in Section 7%%per%% 
2%%per%%]$~ ~$[RELATED WORK 
Knowledge networks representing scienti c collaboration ]^[ blogger citations are studied in [Roth 
]^[ Cointet 2010]%%per%%]$~ ~$[This study is similar to ours in that the joint dynamics ]^[ co%%dsh%%evolution of the 
social ]^[ socio%%dsh%%semantic structures is analyzed in these knowledge networks%%per%%]$~ ~$[Our work is dif%%dsh%% 
ferent since we focus on another type of a network (communication)%%per%%]$~ ~$[Hence%%lst%% we respond in part 
to the call by Roth ]^[ Cointet [Roth ]^[ Cointet 2010] to analyze some of the epistemic patterns%%lst%% 
which they found in the scientist ]^[ blogger communities%%lst%% in other type of communities%%per%%]$~ ~$[Moreover%%lst%% 
while they only investigate social link formation%%lst%% we are also able to investigate link decommission 
(disconnection)%%lst%% thanks to the type of the network we analyze%%per%%]$~ ~$[Therefore%%lst%% our work offers an ad%%dsh%% 
ditional understanding on the temporal interplay between semantic ]^[ social structures%%per%%]$~ ~$[Another 
important difference is that we offer considerably deeper semantic aspects analysis%%per%%]$~ ~$[Compared to 
a hand%%dsh%%picked set of categories used in [Roth ]^[ Cointet 2010]%%lst%% our Wikipedia%%dsh%%based database in 
combination with Alchemy API provide us with richer insights on entities%%lst%% categories%%lst%% taxonomy 
]^[ also sentiment of communication%%per%%]$~ 
~$[A recent study on Twitter analyzes homophily on the status (de ned as the difference in the 
follower counts) ]^[ the value (tweet contents%%lst%% common followees%%lst%% location%%lst%% age etc%%per%%) levels [Sun 
]^[ Rui 2017]%%per%%]$~ ~$[There are several important differences to our work%%cln%% the focus of their study is on 
reciprocal followers network (instead of mention network in our case)%%lst%% homophily is analyzed on 
the organization%%dsh%%individual relationship (whereas we focus on individual%%dsh%%individual relationship) 
]^[ there is no focus on community analysis ]v[ temporal aspects of homophily as in our study%%per%%]$~ 
~$[However%%lst%% there are several previous studies in online settings that have analyzed the temporal 
interplay between homophily ]^[ social ties%%per%%]$~ ~$[Crandal et al%%per%% [Crandall et al%%per%% 2008] nd that the ho%%dsh%% 
mophily between two Wikipedia admin users sharply rises some time before the tie formation ]^[ 
after that continues to slowly grow%%per%%]$~ ~$[This is interpreted ]s[ that%%lst%% at rst%%lst%% homophily plays a role in the 
tie formation%%lst%% ]b[ after that%%lst%% the tie plays a role in the continuous increase of homophily%%per%%]$~ ~$[Another 
similar study on Flickr [Zeng ]^[ Wei 2013]%%lst%% nds more subtle insights%%cln%% the users who have similar 
popularity (de ned as the average number of favorites ]f[ their photos) are more likely to diverge 
in similarity after the tie formation%%scn%% while the similarity continues to grow ]f[ the users who have a 
larger popularity difference%%per%%]$~ ~$[This is explained by the tendency of users to stay unique ]^[ diverse 
in their uploaded content from equally popular users%%per%%]$~ ~$[Besides focusing on a different type of social 
ties communication%%lst%% our work extends these previous studies with the insights on interplay of 
homophily ]^[ tie (link) decommission that they have ]n[ investigated%%per%%]$~ ~$[In addition%%lst%% we also uncover 
the relationship between introduced social ]^[ semantic forms of capital ]^[ homophily around the 
time of link formation ]^[ decommission%%per%%]$~ 
~$[Signi cant homophilous foci on Facebook [Barnett ]^[ Bene eld 2015] are found to be ge%%dsh%% 
ographic proximity%%lst%% language%%lst%% civilization%%lst%% ]^[ migration%%per%%]$~ ~$[The analysis performed on 3 online 
datasets%%cln%% Last%%per%%fm%%lst%% Flickr ]^[ aNobii [Aiello et al%%per%% 2012]%%lst%% presents how homophily information can 
be used ]f[ link prediction%%per%%]$~ ~$[The authors present best accuracy in the case of aNobii (92%) when 
combining multiple features%%cln%% in%%dsh%%degree%%lst%% activity%%lst%% number of distinct tags%%lst%% assortativity of users in 
terms of topics etc%%per%%]$~ ~$[A conclusion is that the distinct language groups present in the aNobii dataset%%lst%% 
which are quite homogenous ]^[ non%%dsh%%mixing%%lst%% support the prediction accuracy%%per%%]$~ ~$[Halberstam et al%%per%% 
[Halberstam ]^[ Knight 2014] analyze communication on Twitter (comprising both retweets ]^[ 
mentions of political candidates) in similarity to us%%lst%% however%%lst%% with a different aim to understand 
information diffusion%%per%%]$~ ~$[They nd a greater degree of homophily exhibited ]^[ also more connections 
per node in larger communities%%per%%]$~ 
~$[Below we mention several other studies that have tackled homophily in online settings%%lst%% ]b[ with a 
different focus from us%%per%%]$~ ~$[A number of studies are conducted toward distinguishing between in uence 
]^[ homophily [Aral et al%%per%% 2009%%scn%% La Fond ]^[ Neville 2010%%scn%% Anagnostopoulos et al%%per%% 2008] report%%dsh%% 
Semantic homophily in online communication%%cln%% evidence from Twitter 
A:7 
Table I%%cln%% Twitter dataset ltering steps statistics 
Dataset 
original download 
English language 
users > 20 tweets 
internal replies 
mentions 
12 441 636 
2 527 990 
1 344 692 
744 821 
users 
547 368 
284 100 
29 616 
26 717 
ing different levels ]^[ proportions of the two traits in online social networks%%per%%]$~ ~$[For example%%lst%% De 
Choudhury et al%%per%% [De Choudhury et al%%per%% 2010] quanti ed the impact of various types of homophily 
on in uence on Twitter%%per%%]$~ ~$[Users were given homophilous traits based on attributes such as%%cln%% location%%lst%% 
information roles they take (generators%%lst%% mediators ]^[ receptors)%%lst%% content creation (meformer%%lst%% in%%dsh%% 
former) ]^[ activity behavior (number of tweets per period of time)%%per%%]$~ ~$[However%%lst%% it is later shown that 
in empirical settings these tendencies are indistinguishable due to confounding effects [Shalizi ]^[ 
Thomas 2011]%%per%%]$~ ~$[A couple of more recent papers tackled this research challenge in controlled exper%%dsh%% 
iments%%per%%]$~ ~$[The experiment on Facebook found that the probability ]f[ a user to share a link increases 
with the number of friends who shared the same link even without the user being exposed to their 
link shares [Bakshy et al%%per%% 2012]%%per%%]$~ ~$[Hence this controlled experiment con rmed homophily ]v[ some 
unobserved common external in uence taking place in the network%%per%% 
3%%per%%]$~ ~$[DATASETS AND FRAMEWORK FOR ANALYSIS 
3%%per%%1%%per%%]$~ ~$[Communication layer%%cln%% Twitter mention network 
Our initial dataset contains 12,441,636 mentions (tweets including @username) among 547,368 
users over the course of 6 months (May%%dsh%%Nov 2011)%%per%%]$~ ~$[All internal mentions are included%%lst%% meaning%%lst%% 
each time when a user from our dataset mentions a user from outside%%lst%% we did ]n[ keep such tweets%%lst%% 
]b[ all the mentions among the users in the dataset are present%%per%%]$~ 
~$[In order to have a well suited dataset ]f[ the intended analysis%%lst%% we perform several cleaning ]^[ 
ltering steps described below%%per%%]$~ ~$[The initial dataset includes tweets in several languages%%lst%% ]s[ we lter it 
to select only English tweets ]^[ from the users who mostly tweet in English%%per%%]$~ ~$[We use NLTK Python 
library [Bird et al%%per%% 2009] in this step%%per%%]$~ ~$[After the language ltering%%lst%% the dataset is reduced to 20% of its 
original size in terms of tweets%%lst%% while the number of users halved%%per%%]$~ ~$[For semantic analysis%%lst%% individual 
tweets are often too small ]^[ noisy%%lst%% ]s[ the next step involves ltering the remaining users based 
on their total number of tweets%%per%%]$~ ~$[Upon research ]^[ pre%%dsh%%test with the semantic knowledge database 
that we built (described in the following subsection)%%lst%% a threshold of minimum 20 tweets is selected%%per%%]$~ 
~$[After this step%%lst%% the dataset contains 29,616 users%%per%%]$~ ~$[Finally%%lst%% again keeping only the internal replies 
withing this group of users%%lst%% we end up with 26,717 users in our nal dataset ]f[ analysis (see Table 
I)%%per%%]$~ 
~$[From the nal ltered dataset we build our analysis target%%lst%% the communication network%%lst%% 
G = (V,E,W )%%per%%]$~ ~$[The nodes ui,u j V represent Twitter users%%scn%% they are connected with a directed 
edge ei j = (ui,u j) E if a user ui mentions u j%%lst%% ]^[ the edge is assigned the weight wi j = 
(ui,u j) W equal to the communication intensity (total number of such mentions)%%per%%]$~ ~$[Properties of 
the communication network are given in Table II%%per%%]$~ ~$[Finally%%lst%% at some points we will look at undi%%dsh%% 
rected and/or unweighted versions of the presented network%%per%%]$~ ~$[When we do so%%lst%% it will be pointed out%%lst%% 
otherwise%%lst%% whenever we discuss communication network it refers to the weighted ]^[ directed 
network described here%%per%% 
3%%per%%2%%per%%]$~ ~$[Semantic layers%%cln%% Semantic enrichment of communication network 
On top of the communication layer%%lst%% we extract another%%lst%% semantic layer from the Twitter data%%per%%]$~ ~$[Con%%dsh%% 
cretely%%lst%% we apply two semantic analysis procedures that enrich our communication network in 
terms of node ]^[ edge attributes%%per%%]$~ ~$[The rst procedure is based on Wikipedia semantic relatedness 
A:8 
S%%per%%]$~ ~$[S cepanovi c et al%%per%%]$~ 
~$[Table II%%cln%% Communication network statistics 
Network parameter 
Nodes 
Edges 
Avg weighted deg%%per%%]$~ 
~$[Avg clustering coeff%%per%% 
value 
26 717 
99 910 
55%%per%%75 
0%%per%%051 
Network parameter 
Max out%%dsh%%degree 
Max in%%dsh%%degree 
Diameter 
Density 
value 
1358 
3228 
29 
0%%per%%00014 
database that we build from a whole English Wikipedia dump according to the Explicit Seman%%dsh%% 
tic Relatedness (ESA) algorithm [Gabrilovich ]^[ Markovitch 2009%%scn%% Gabrilovich ]^[ Markovitch 
2007]%%per%%]$~ ~$[The second procedure employs an existing%%lst%% natural language processing API%%lst%% Alche%%dsh%% 
myAPI [An IBM Company 2016] from IBM%%per%%]$~ ~$[Wikipedia SR database provides enrichment ]f[ both%%lst%% 
edges (SR between tweets of two users) ]^[ nodes (extracted Wikipedia concepts relevant to the 
user tweets see following paragraph ]f[ details)%%per%%]$~ ~$[AlchemyAPI provides an additional set of node 
attributes%%cln%% concepts%%lst%% entities%%lst%% taxonomy ]^[ sentiment of the user tweets%%per%%]$~ ~$[We describe both proce%%dsh%% 
dures ]^[ the enrichment they provide in more detail in the following%%per%% 
3%%per%%2%%per%%1%%per%%]$~ ~$[Wikipedia Semantic Relatedness database%%per%%]$~ ~$[The semantic layer includes a network of users 
featuring semantic relatedness (SR) between their tweets collections as edge weights%%lst%% we refer to it 
as the SR network%%per%%]$~ ~$[The SR network is based on SR knowledge database built using a Wikipedia 
XML dump from April 2015 (for details see Methods 8)%%per%%]$~ ~$[In addition to SR scores%%lst%% from the 
Wikipedia SR database%%lst%% ]f[ each user we can also obtain their corresponding Wikipedia concept 
vectors CVs%%per%%]$~ ~$[CV s are formed of relevant Wikipedia concepts (articles) describing semantically user 
tweet contents%%per%%]$~ 
~$[In a somewhat computationally demanding task%%lst%% we calculate the SR scores between all the user 
pairs (not just those who communicate ]^[ are connected in communication network)%%lst%% resulting 
in a full SR network%%per%%]$~ ~$[Distribution of SR values of the full SR network is shown in Fig%%per%% 9 (right)%%per%%]$~ 
~$[During the analysis%%lst%% we also apply different thresholds (SRth) on the edge weights ]^[ obtain several 
SR sub%%dsh%%networks%%lst%% which we denote SRth networks%%per%% 
3%%per%%2%%per%%2%%per%%]$~ ~$[AlchemyAPI%%per%%]$~ ~$[AlchemyAPI [An IBM Company 2016] performs natural language process%%dsh%% 
ing (NLP) ]^[ machine learning (ML) analysis%%per%%]$~ ~$[We send individual user tweets collections ]f[ anal%%dsh%% 
ysis ]^[ AlchemyAPI returns semantic meta%%dsh%%data from the content%%per%%]$~ ~$[Not all are relevant ]f[ our study 
]b[ we utilize following%%cln%% sentiment score%%lst%% taxonomy%%lst%% concepts%%lst%% entities ]^[ keywords%%per%%]$~ ~$[Hence%%lst%% based 
on the output%%lst%% we assign a set of attributes to users%%cln%% the overall sentiment of his/her tweets (a real 
number between %%dsh%%1 ]f[ fully negative ]^[ 1 ]f[ fully positive)%%lst%% the taxonomy hierarchy representing 
topics%%lst%% concepts%%lst%% entities ]^[ keywords found relevant in the tweets%%per%%]$~ ~$[For each of the elements in the 
output%%lst%% AlchemyAPI also returns corresponding relevance score%%lst%% that we utilize to lter ]f[ most 
relevant semantic attributes%%per%%]$~ 
~$[Based on the evaluations in the literature%%lst%% we believe that AlchemyAPI is a suitable choice to 
support our work%%per%%]$~ ~$[In [Meehan et al%%per%% 2013] it was shown that the sentiment analysis obtained from 
AlchemyAPI achieved accuracy of 86% on a corpus of 5,370 tweets employed by an intelligent 
recommendation system ]f[ tourism%%per%%]$~ ~$[The AlchemyAPI s performance on a number of datasets ]^[ 
in different contexts was also shown in [Rizzo ]^[ Troncy 2011] ]^[ [Saif et al%%per%% 2012]%%lst%% where 
AlchemyAPI outperfomed Zemanta1%%lst%% OpenCalais2%%lst%% Extractiv3 ]^[ DBpedia Spotlight4 in extracting 
]^[ categorizing named entities%%per%%]$~ ~$[However%%lst%% besides the evaluations stated above%%lst%% ]^[ the benchmark 
analysis done in [Ribeiro et al%%per%% 2016]%%lst%% we might consider using sentence%%dsh%%level methods%%lst%% as VADER 
1http://blog%%per%%zemanta%%per%%com/ 
2http://www%%per%%opencalais%%per%%com/ 
3http://extractiv%%per%%com/ 
4https://github%%per%%com/dbpedia%%dsh%%spotlight/dbpedia%%dsh%%spotlight 
Semantic homophily in online communication%%cln%% evidence from Twitter 
A:9 
[Hutto ]^[ Gilbert 2014]%%lst%% SentiStrength [Thelwall 2013] ]v[ Umigon [Levallois 2013] on our Twitter 
dataset as our future work%%per%% 
4%%per%%]$~ ~$[QUANTIFYING SEMANTIC HOMOPHILY 
4%%per%%1%%per%%]$~ ~$[Semantic relatedness ]^[ communication 
We start by investigating interplay between SR ]f[ a pair of users ]^[ their CI by asking%%cln%% whether 
higher communication intensity is linked to a higher semantic relatedness%%qsn%%]$~ ~$[Fig%%per%% 2 (left) displays 
the correlation when we apply logarithmic binning to account ]f[ long%%dsh%%tailed distribution of CI(e)%%per%%]$~ 
~$[However%%lst%% we nd that user pairs exist who communicate quite intensively ]b[ have low relatedness 
of their tweet contents ]^[ also on the opposite some users with relatedness close to 1 seldom 
communicate%%per%%]$~ ~$[Our result is comparable those in the study that evaluated similar relationship in 
retweet ]^[ follower Twitter graphs [Mitzlaff et al%%per%% 2014]%%per%%]$~ ~$[Next we turn to another way of assessing 
the interplay between the two communication aspects%%per%%]$~ 
~$[Fig%%per%% 2%%cln%% Interplay between SR ]^[ communication%%cln%% (a) correlation of link SR value (SR(e)) ]^[ 
its communication intensity (CI(e))%%scn%% we apply logarithmic binning to account ]f[ long%%dsh%%tailed distri%%dsh%% 
bution of CI(e)%%scn%% average value ]^[ standard deviation are shown ]f[ each bin%%scn%% (b) communication 
propensity with respect to SR ( cp(SRth)) ]f[ different minimum communication intensity (CIth) of 
links 
We calculate communication propensity ( cp) with respect to SR threshold (SRth) as the extent 
to which observed communication ]^[ its intensity diverge from what would be expected in an 
uniformly random setting%%per%%]$~ ~$[To illustrate%%lst%% SR0%%per%%2 network has 40M links%%lst%% ]v[ 9% out of all the 
possible 438M links in full SR network%%per%%]$~ ~$[Hence%%lst%% in a uniformly random setting%%lst%% we would expect 
a similar percent of communication links in SR0%%per%%2 network%%per%%]$~ ~$[However%%lst%% we nd this percent to be 3 
times higher%%per%%]$~ ~$[Precisely%%lst%% we apply the dyadic propensity formula de ned in [Roth 2005] to calculate 
cp%%cln%% 
cp(SRth) = Lcomm(SRth)/Ltot (SRth)%%lst%% 
where Lcomm(SRth) is the number of links in communication network with SR value higher than 
the threshold ]^[ Ltot (SRth) is the number of total possible such links%%per%%]$~ ~$[We also evaluate in the same 
A:10 
S%%per%%]$~ ~$[S cepanovi c et al%%per%%]$~ 
~$[Fig%%per%% 3%%cln%% Properties of SR network in function of SRth%%cln%% (left) size of the largest connected compo%%dsh%% 
nent%%lst%% its density ]^[ overall network density%%scn%% (right) branching factor%%lst%% intermodular connectivity ]^[ 
transitivity as three ingredients ]f[ network degree assortativity [Estrada 2011] 
way existence of links with a minimum communication intensity threshold (CIth)%%per%%]$~ ~$[Fig%%per%% 2 presents 
the results%%per%%]$~ ~$[Communication propensity increases with the increase in both SR ]^[ CI thresholds%%per%%]$~ 
~$[The increase reveals presence of semantic homophily in the network with respect to SR%%per%%]$~ ~$[After both 
presented analyses%%lst%% we conclude that the correlation between SR ]^[ CI is ]n[ simple ]^[ linear%%lst%% ]b[ 
it is strongly captured by the subtle aspects of communication network%%per%%]$~ 
~$[This section we conclude with several results on the properties of the full SR network%%per%%]$~ ~$[It is impor%%dsh%% 
tant to point out that ]f[ this analysis we take the network built from the data ]f[ the whole 6 months 
period%%per%%]$~ ~$[Such results inform us about semantic relatedness metrics of a random group of people (not 
necessarily ever communicating)%%per%%]$~ ~$[Fig%%per%% 3 (left) reveals that when thresholding the SR network near 
SR value 0%%per%%25%%lst%% the largest connected component still has around 85% of the nodes ]^[ its density 
stabilizes%%lst%% even it starts to grow%%lst%% whereas the overall density in the network is signi cantly reduced%%per%%]$~ 
~$[In Fig%%per%% 3 (right) we plot the degree assortativity [Newman 2002] in SR network as a function of 
SR threshold%%per%%]$~ ~$[We detect an interesting changing pattern from positive to negative degree assortativ%%dsh%% 
ity%%per%%]$~ ~$[In order to make sure that this pattern is speci c to real%%dsh%%world SR metric%%lst%% we randomize the SR 
values on SR network in several ways ]^[ nd no pattern in such cases%%per%%]$~ ~$[Hence%%lst%% we conclude that 
a structurally important change in human SR network takes place when we consider different SR 
threshold%%per%%]$~ 
~$[Fig%%per%% 3 (right) also shows the values ]f[ branching factor%%lst%% intermodular connectivity ]^[ network 
transitivity (clustering coef cient)%%lst%% as it has been proven that they together de ne degree assorta%%dsh%% 
tivity value [Estrada 2011]%%per%%]$~ ~$[In the interval (0%%per%%15,0%%per%%35) SR network obeys highest assortativity ]^[ 
transitivity%%per%%]$~ ~$[In this way we nd lower ]^[ upper bounds ]f[ the threshold that can be used to remove 
the noise generated when building the SR knowledge database%%per%%]$~ ~$[For these values we also obtain 
the best community matching between SR network ]^[ communication network%%lst%% as described in 
Section 6%%per%%]$~ ~$[From an application point of view%%lst%% these ndings might be important to consider while 
designing other semantic relatedness ]^[ similarity metrics%%lst%% in particular when choosing a suitable 
threshold to distinguish signi cantly related ]^[ ]n[ related users%%per%% 
4%%per%%2%%per%%]$~ ~$[Forms of social capital ]^[ degree assortativity 
As we introduced earlier%%lst%% a basic measure of assortative mixing in a network is the assortativity 
coef cient [Newman 2003] ]v[ simply assortativity%%per%%]$~ ~$[This coef cient is calculated as Pearson cor%%dsh%% 
relation between the value of a property on a node ]^[ the average value of that property on its 
neighbors%%per%%]$~ ~$[Hence the assortativity value ranges from 1 in a perfectly assortative network to %%dsh%%1 in a 
Semantic homophily in online communication%%cln%% evidence from Twitter 
A:11 
perfectly dissasortative network%%per%%]$~ ~$[Any discrete ]v[ scalar attribute of nodes can be used to calculate 
this coef cient%%per%%]$~ 
~$[We start by calculating assortativity based on node degree%%lst%% an inherent node attribute of any 
network%%per%%]$~ ~$[Positive degree assortativity [Newman 2002] is suggested to be fundamental to social 
networks ]^[ to distinguish them from other types of networks [Newman ]^[ Park 2003]%%per%%]$~ 
~$[Undirected network variants%%per%%]$~ ~$[We start by looking at an undirected variant of our 
communication network%%per%%]$~ ~$[Such an abstraction provides us with social capital in terms of num%%dsh%% 
ber of contacts (unweighted) ]^[ total communication intensity (weighted network case)%%per%%]$~ ~$[When we 
look at mutual edges%%lst%% then we tackle strong communication ties%%lst%% ]^[ when including all edges%%lst%% then 
we also consider weak communication ties [Granovetter 1973]%%per%%]$~ ~$[The values of degree assortativity 
coef cient (r) in different variants of the communication network are presented in Table III%%per%%]$~ ~$[Us%%dsh%% 
ing jackknife method as in [Newman 2003] we calculate ]^[ present also the standard deviation ]f[ 
each measurement to verify statistical signi cance of the results%%per%%]$~ ~$[Below we discuss ]^[ interpret the 
cases when our networks exhibits assortativity%%per%%]$~ 
~$[Undirected unweighted network including all edges is slightly disassortative with r = 0%%per%%015%%per%%]$~ 
~$[Undirected unweighted network with only mutual edges is on the other hand highly assortative 
with r = 0%%per%%414 (similar result reported in [Bliss et al%%per%% 2012])%%per%%]$~ ~$[This result shows that the more 
strong contacts you have%%lst%% the more strong contacts they themselves tend to have%%per%%]$~ 
~$[Undirected weighted network including all edges is slightly disassortative with r = 0%%per%%014%%per%%]$~ 
~$[Undirected weighted network with only mutual edges is again highly assortative with r = 0%%per%%474%%per%%]$~ 
~$[This result shows that the stronger communication intensity you have%%lst%% the stronger communication 
intensity your contacts tend to have%%per%%]$~ 
~$[Directed network variants%%per%%]$~ ~$[In directed networks%%lst%% four types of degree assortativity can be calcu%%dsh%% 
lated%%lst%% as introduced in [Piraveenan et al%%per%% 2012]%%per%%]$~ ~$[These four types of assortativity coef cients show if 
the degree of a source node is correlated with the degree of the target nodes%%lst%% hence tackling relational 
analysis between source ]^[ receiver in communication [Rogers ]^[ Bhowmik 1970]%%per%%]$~ ~$[As shown in 
Table III the in%%dsh%%in is the only negative of the four coef cients in our network%%per%%]$~ ~$[This is in agreement 
with the ndings ]f[ assortativity in directed followers Twitter network [Myers et al%%per%% 2014]%%lst%% except 
]f[ out%%dsh%%in coef cient which is also found negative in the followers graph ]^[ it is slightly positive 
in our case%%per%%]$~ ~$[The authors (ibid%%per%%) argue that Twitter exhibits negative assortativity coef cients%%lst%% unlike 
other social networks%%lst%% because of its role as an information network%%lst%% too%%per%%]$~ ~$[Below we interpret the 
results in our network%%per%%]$~ 
~$[Looking at in%%dsh%%in coef cient%%lst%% there was no assortativity with r = 0%%per%%001 in the unweighted net%%dsh%% 
work%%per%%]$~ ~$[This value increases to r = 0%%per%%015 in the weighted network case ]^[ becomes statistically 
signi cant%%per%%]$~ ~$[It is still low ]s[ we do ]n[ interpret it%%per%%]$~ 
~$[Low positive in%%dsh%%out degree assortativity tells that%%cln%% the more popular you are the more active those 
who you contact tend to be (both in terms of number of contacts ]^[ in terms of communication 
intensity)%%per%%]$~ 
~$[Positive out%%dsh%%in degree assortativity is low (0%%per%%038) ]s[ we do ]n[ interpret it%%per%%]$~ 
~$[The highest coef cient is ]f[ out%%dsh%%out degree assortativity%%lst%% informing us that the higher the number 
of users whom you contact%%lst%% the higher the number of users they also tend to contact (or the more 
intensively you are communicating%%lst%% the more intensively those who you contact also tend to be 
communicating)%%per%%]$~ 
~$[Assortativity as a function of communication intensity%%per%%]$~ ~$[We can create an ensemble of weighted 
communication networks by thresholding the original network on different minimum edge 
weights%%per%%]$~ ~$[Then we calculate the above presented coef cients in each thresholded network%%per%%]$~ ~$[Since 
weight on the edges represents intensity of communication%%lst%% the result is degree assortativity as a 
function of the communication intensity%%lst%% as shown in Fig%%per%% 4%%per%%]$~ 
~$[A:12 
S%%per%%]$~ ~$[S cepanovi c et al%%per%%]$~ 
~$[Table III%%cln%% Degree assortativity r coef cients in the communication network%%per%%]$~ ~$[Standard deviation s 
calculated using jackknife method [Newman 2003] is also presented 
undirected networks 
r 
s 
unweighted 
weighted 
mutual edges 
0%%per%%414 
0%%per%%010 
all edges 
%%dsh%%0%%per%%015 
0%%per%%001 
mutual edges 
0%%per%%474 
0%%per%%017 
all edges 
%%dsh%%0%%per%%014 
0%%per%%001 
directed networks 
in%%dsh%%in 
in%%dsh%%out 
out%%dsh%%in 
out%%dsh%%out 
in%%dsh%%in 
in%%dsh%%out 
out%%dsh%%in 
out%%dsh%%out 
r 
%%dsh%%0%%per%%001 
0%%per%%110 
0%%per%%038 
0%%per%%389 
%%dsh%%0%%per%%015 
0%%per%%207 
0%%per%%014 
0%%per%%338 
s 
0%%per%%002 
0%%per%%013 
0%%per%%003 
0%%per%%014 
0%%per%%002 
0%%per%%020 
0%%per%%004 
0%%per%%026 
Fig%%per%% 4%%cln%% Degree assortativity as a function of communication intensity CI in the ensemble of thresh%%dsh%% 
olded communication networks%%per%% undir all is degree assortativity in undirected network including 
all edges%%scn%% undir mutual in undirected network with only reciprocal%%scn%% in(out)%%dsh%%in(out) are the four types 
of coef cients in directed networks showing the correlation between in(out)%%dsh%%degrees of source ]^[ 
receiver nodes [Piraveenan et al%%per%% 2012] 
First insight is that already with a small threshold%%lst%% the two assortativity coef cients that are in 
the original network found slightly negative (in undirected network with all edges ]^[ in directed 
network in%%dsh%%in coef cient) become positive%%per%%]$~ ~$[With the threshold larger than 20 mentions%%lst%% the networks 
are highly assortative on all the coef cients%%per%%]$~ ~$[This property exhibits one of the differences between 
often analyzed social networks based on unweighted%%lst%% once formed links (such as friendship ]^[ 
followership) ]^[ the weighted communication network that we focus on%%per%%]$~ ~$[Bliss et al%%per%% [Bliss et al%%per%% 
2012] demonstrated temporal stability of degree assortativity in mutual mention network%%lst%% while 
herein we exhibit its variability with respect to the minimum communication intensity%%per%%]$~ ~$[Coming 
back to the above mentioned negative assortativity results in the Twitter followers network [Myers 
et al%%per%% 2014]%%lst%% we argue that at higher communication intensity (requiring more time ]^[ effort than 
other interactions%%lst%% such as following) the Twitter mention network serves more of a social than 
information role%%per%%]$~ ~$[That is exhibited by the strong degree assortativity coef cients%%per%%]$~ 
~$[Semantic homophily in online communication%%cln%% evidence from Twitter 
A:13 
Fig%%per%% 5%%cln%% Semantic capital distributions 
Moreover%%lst%% looking at the higher communication intensity thresholds%%lst%% we notice two more inter%%dsh%% 
esting patterns%%per%%]$~ ~$[Two directed assortativity coef cients (in%%dsh%%in ]^[ out%%dsh%%out) start to slowly decrease%%lst%% 
while the four other coef cients asymptotically reach the maximum value 1%%per%%]$~ ~$[In our concrete net%%dsh%% 
work case%%lst%% the threshold of 239 mentions is when the four coef cients all become equal by reaching 
the value 1 ]^[ also the coef cients in%%dsh%%in ]^[ out%%dsh%%out become equal (at value 0%%per%%505)%%per%%]$~ ~$[While ]n[ 
shown in Fig%%per%% 4%%lst%% we calculated ]^[ those two coef cients continue to drop%%lst%% while the others stay at 
the maximum value as we increase the threshold further%%per%%]$~ 
~$[To conclude%%lst%% presented positive degree assortativity properties reveal presence of social status 
homophily (users with higher status tend to assortatively connect) on different forms of social capital 
in the communication network%%per%%]$~ ~$[We also nd slight amounts of social status heterophily in relation 
to weak ties ]^[ popularity%%lst%% ]b[ this heterophily quickly gives place to strong homophily when there 
is higher communication intensity in the network%%per%% 
4%%per%%3%%per%%]$~ ~$[Forms of semantic capital ]^[ attribute assortativity 
In this section%%lst%% we investigate levels of assortative mixing on semantic aspects in the 
communication network%%per%%]$~ ~$[Besides degree%%lst%% social networks are shown to exhibit assortativity on 
diverse nodes attributes [Bollen et al%%per%% 2011%%scn%% Aiello et al%%per%% 2012%%scn%% Eom ]^[ Jo 2014]%%per%%]$~ ~$[In line with such 
previous ndings%%lst%% we ask on which semantic attributes our Twitter communication network ex%%dsh%% 
hibits assortativity ]^[ to what extent%%per%%]$~ ~$[While social capital aspects presented in previous section 
reveal status homophily%%lst%% some of the semantic capital aspects in this section exhibit value ]^[ some 
status homophily%%per%%]$~ ~$[Precisely%%lst%% we look at assortativity on sentiment score ]^[ topics presence in the 
tweets%%lst%% revealing semantic value homophily%%per%%]$~ ~$[We also look at semantic capital%%lst%% ]v[ the diversity with 
regard to the number of relevant entities%%lst%% concepts ]^[ taxonomy levels found in the tweets ]^[ this 
analysis reveals semantic status homophily%%per%%]$~ ~$[Prior to looking at assortativity%%lst%% it is useful to familiar%%dsh%% 
ize ourselves with the distributions of semantic capital ]^[ sentiment values ]f[ the whole user base%%per%%]$~ 
~$[In Fig%%per%% 5 we show kernel density estimates of their distributions displaying heterogeneity of entities 
]^[ CVs diversity (see Section 3%%per%%2%%per%%1 ]^[ Methods ]f[ description of CVs)%%lst%% ]^[ sentiment values 
among users%%per%%]$~ ~$[While most of the users tend to have around 5 entities relevant to their tweet contents%%lst%% 
we also nd an important percent of users with nearly 30 such entities%%per%%]$~ ~$[Similarly ]f[ concepts%%lst%% a 
majority of users has 500 700 concepts in their CVs%%lst%% ]b[ we nd also users with with 1500 2000 
concepts%%per%%]$~ ~$[As ]f[ sentiment%%lst%% a majority of users tend to have neutral tweets sentiment%%lst%% however%%lst%% we 
also nd users on both sides of the spectrum (negative ]^[ positive sentiment scores)%%per%%]$~ ~$[Hence%%lst%% we 
conclude that there is large semantic capital heterogeneity among our users (see [Roth ]^[ Cointet 
2010] ]f[ similar result in different types of networks)%%per%%]$~ 
~$[A:14 
S%%per%%]$~ ~$[S cepanovi c et al%%per%%]$~ 
~$[Table IV%%cln%% Status ]^[ value homophily%%cln%% attributes assortativity r 
in the unweighted 
communication network%%per%%]$~ ~$[Standard deviation s calculated using jackknife method is also presented 
level 
attr Wiki CVs 
diversity 
topic 
music movies 
value homophily 
topic 
taxonomy 
diversity 
sentiment 
score 
topic 
sex 
0%%per%%151 
0%%per%%003 
0%%per%%269 
0%%per%%006 
0%%per%%136 
0%%per%%004 
0%%per%%244 
0%%per%%005 
0%%per%%136 
0%%per%%004 
0%%per%%253 
0%%per%%006 
concept 
diversity 
status homophily 
entity 
diversity 
directed network%%lst%% all edges 
0%%per%%292 
0%%per%%003 
0%%per%%315 
0%%per%%003 
undirected network%%lst%% mutual edges 
0%%per%%452 
0%%per%%005 
0%%per%%398 
0%%per%%005 
0%%per%%173 
0%%per%%003 
0%%per%%289 
0%%per%%005 
r 
s 
r 
s 
0%%per%%144 
0%%per%%003 
0%%per%%269 
0%%per%%006 
0%%per%%157 
0%%per%%003 
0%%per%%282 
0%%per%%005 
The results presented in Table IV suggest the presence of both%%lst%% value (topics of tweet%%dsh%% 
ing%%lst%% sentiment) ]^[ status (semantic capital) homophily in the unweighted versions of the 
communication network%%per%%]$~ ~$[We focus on the unweighted versions%%lst%% since we rst of all ask%%lst%% whether 
there is a tendency among the users to have contact with other users who are similar to them on some 
semantic attributes (without looking at intensity of communication)%%per%%]$~ ~$[This means that the answers 
to this question in the networks including only mutual edges will inform us about such correla%%dsh%% 
tion among strong contacts%%lst%% while looking at networks with all edges included will inform us also 
about weak contacts%%per%%]$~ ~$[Once again%%lst%% as with the degree assortativity%%lst%% we nd that mutual (reciprocal) 
communication network is importantly different compared to the network including also one%%dsh%% 
sided communication edges%%per%%]$~ ~$[Notably%%lst%% it exhibits higher levels of assortativity on all the analyzed 
attributes%%per%%]$~ 
~$[As the observed correlation levels could be induced by existing degree assortativity%%lst%% we also test 
the presence of assortativity after node attribute randomization%%per%%]$~ ~$[The assortativity value in such case 
is importantly lower%%lst%% 0%%per%%07 ]^[ ]s[ we conclude that indeed the communication network exhibits 
low to moderate levels of semantic status ]^[ value homophily%%per%%]$~ ~$[Moreover%%lst%% among analyzed semantic 
attributes%%lst%% status homophily is the largest with respect to entity diversity ]^[ value homophily with 
respect to sentiment%%per%% 
4%%per%%4%%per%%]$~ ~$[Interplay between social ]^[ semantic capital 
After establishing the presence of status ]^[ value homophily in the communication network 
on different forms of social ]^[ semantic capital%%lst%% we ask next about the relationship between these 
forms of capital%%per%%]$~ ~$[Whether the users who are richer in terms of social capital (and hence more network 
central) are also richer in terms of semantic capital (their tweets are semantically richer%%lst%% ]v[ exhibit 
more diversity on semantic aspects)%%qsn%%]$~ ~$[With this analysis%%lst%% we respond to the call by authors in [Roth 
]^[ Cointet 2010] to look ]f[ similar types of patterns as they have investigated in the bloggers ]^[ 
scientists networks%%per%%]$~ ~$[Indeed%%lst%% we also nd a wide range of possible combinations of joint values of 
social ]^[ semantic capital%%lst%% as they have reported%%per%%]$~ ~$[In the end we conclude that the observed patterns 
in the Twitter communication network resemble more of the bloggers than the scientists network 
presented in [Roth ]^[ Cointet 2010]%%per%%]$~ 
~$[Precisely%%lst%% testing ]f[ different forms of social capital against different forms of semantic capital 
reveals no signi cant ]v[ low to medium correlations between the two%%per%%]$~ ~$[For the purpose of visualiza%%dsh%% 
tion%%lst%% in Fig%%per%% 6%%lst%% we show joint distributions ]f[ entity%%lst%% concepts diversity ]^[ sentiment score on one 
side ]^[ communication intensity (of popularity ]^[ of activity) on the other%%per%%]$~ 
~$[When it comes to popularity (weighted indegree)%%lst%% we observe a wide spectrum of semantic 
diversity in terms of entities ]f[ both%%lst%% the users with low ]^[ high popularity%%per%%]$~ ~$[Most popular users 
tend to be slightly more likely to have high semantic diversity%%per%%]$~ ~$[On the other hand%%lst%% most popular users 
are likely to have quite neutral sentiment in their tweets%%per%%]$~ ~$[However%%lst%% users which are more positive ]v[ 
negative in their sentiment are likely to have modest to low popularity%%per%%]$~ 
~$[Semantic homophily in online communication%%cln%% evidence from Twitter 
A:15 
Fig%%per%% 6%%cln%% Joint distributions of social ]^[ semantic capital%%cln%% the darkness of the hexagon corresponds 
to the frequency of users with the combination of social ]^[ semantic capital values 
When it comes to intensity of communication activity (weighted outdegree)%%lst%% we observe similar 
patterns that are a bit more pronounced ]f[ the socially richest users%%per%%]$~ ~$[Basically%%lst%% most actively com%%dsh%% 
municating users are likely to have higher semantic diversity in terms of entities (however%%lst%% we still 
nd a number of users with diverse tweet contents that are ]n[ actively communicating)%%per%%]$~ ~$[Seman%%dsh%% 
tic (entity) diversity has the highest correlations with communication activity (weighted outdegree%%scn%% 
r = 0%%per%%397) presented in Fig%%per%% 6 ]^[ with weighted mutual degree (r = 0%%per%%396)%%per%%]$~ ~$[These values are simi%%dsh%% 
lar to the value found in the bloggers network ]^[ lower compared to the scientists network in [Roth 
]^[ Cointet 2010]%%per%%]$~ 
~$[Sentiment has negative correlations with both popularity ]^[ activity%%lst%% also presented in Fig%%per%% 6%%per%%]$~ 
~$[This means that with popularity ]^[ being active users tend to have a slightly more negative tweets 
sentiment%%per%%]$~ ~$[Finally%%lst%% when it comes to diversity in terms of number of concepts present in their CVs%%lst%% 
we do ]n[ nd any differences between popular ]^[ active users%%per%%]$~ ~$[The richest users in terms of both 
types of social capital tend to have an average semantic capital (between 500 ]^[ 1000)%%per%%]$~ ~$[Hence%%lst%% 
we conclude that different forms of semantic capital have different patterns of interplay with social 
capitals%%per%%]$~ 
~$[Thanks to our network being directed ]^[ weighted%%lst%% we are able to observe one additional pattern%%cln%% 
while being particularly low ]f[ popularity (indegree)%%lst%% all the correlations increase ]f[ user activ%%dsh%% 
ity (outdegree) ]^[ with communication intensity (weighted degrees)%%per%%]$~ ~$[For instance%%lst%% the correlation 
between entity diversity ]^[ (unweighted) indegree is only 0%%per%%051%%per%%]$~ ~$[In this way%%lst%% we exhibit that com%%dsh%% 
munication activity%%lst%% intensity ]^[ stronger contacts are more conductive of higher semantic capital%%lst%% 
compared to popularity ]^[ weaker contacts%%per%%]$~ 
~$[A:16 
S%%per%%]$~ ~$[S cepanovi c et al%%per%%]$~ 
~$[Fig%%per%% 7%%cln%% Status differences in communication%%cln%% Kernel density estimates ]f[ distributions of (left) 
popularity difference ]^[ (right) semantic capital difference%%per%%]$~ 
~$[Relative status of source ]^[ receiver%%per%%]$~ ~$[An additional way to investigate the interplay between 
social ]^[ semantic capitals is in terms of relative status of source ]^[ receiver in communication%%per%%]$~ 
~$[By relative status we mean the difference in status on a particular form of capital%%per%%]$~ ~$[Such de nition 
is similar to the achieved status presented in [Sun ]^[ Rui 2017]%%per%%]$~ ~$[In Fig%%per%% 7 we show distributions 
of relative social status (popularity difference) ]^[ relative semantic status (entity diversity differ%%dsh%% 
ence) between source ]^[ receiver%%per%%]$~ ~$[In particular%%lst%% the distribution ]f[ relative social status exhibits a 
dominant peak at zero (users with similar status are most likely to communicate)%%lst%% ]b[ plotting it on 
a log scale reveals two additional interesting peaks at intervals ( 100%%lst%% 10) ]^[ (10,100)%%per%%]$~ ~$[There is 
a higher likelihood ]f[ users with differences in social status belonging to these ranges to be talking 
to each other%%per%%]$~ ~$[The left peak is higher%%lst%% ]^[ this together with the negative mean value ]f[ relative 
social status informs us that source users tend to be a bit less popular%%per%%]$~ ~$[There is also a small number 
of users mentioning considerably more popular users than themselves (leftmost part of the distri%%dsh%% 
bution)%%per%%]$~ ~$[This happens to a smaller extent in the other direction%%lst%% from more popular source users%%per%%]$~ 
~$[When it comes to semantic capital%%lst%% most of communication happens between those who have close 
to equal semantic capital%%per%%]$~ 
~$[For the joint distribution of social ]^[ semantic relative statuses we nd (analyzed%%lst%% ]n[ shown 
in a graph) a wide range of combinations%%per%%]$~ ~$[There is a small positive correlation between the two%%per%%]$~ 
~$[As ]f[ the small number of users who initiate communication towards a considerably more popular 
users discussed above%%lst%% we nd that they tend to be semantically richer compared to the receiving 
users%%per%%]$~ ~$[We speculate that this semantic superiority might be a needed approach ]f[ such users to 
compensate ]f[ their lower popularity%%per%%]$~ 
~$[Status inconsistency of source ]^[ receiver%%per%%]$~ ~$[Finally%%lst%% we can tackle a sociological proposition 
that source and/or receiver status inconsistency can increase effectiveness of their communication 
[Rogers ]^[ Bhowmik 1970]%%per%%]$~ ~$[Status inconsistency (internal heterophily of an individual) is de ned 
in sociology as the relative lack of similarity in an individual s ranking on various indicators of 
social status [Lenski 1954]%%per%%]$~ ~$[Hence we introduce status inconsistency ]f[ Twitter users as a relative 
difference in their social ]^[ semantic capital ranks%%per%%]$~ ~$[We apply a similar formula to calculate status 
inconsistency (stinc) as in [Lenski 1954]%%cln%% 
(cid:26) (1 rsoc/rsem)%%lst%% 
(1 rsem/rsoc)%%lst%% 
stinc = 
if rsoc rsem 
otherwise%%scn%% 
Semantic homophily in online communication%%cln%% evidence from Twitter 
A:17 
l 
Fig%%per%% 8%%cln%% Relationship between communication intensity ]^[ link inconsistency%%cln%% (left) scatter 
plot%%scn%% (right) linear regression visualization we apply logarithmic binning to account ]f[ long%%dsh%%tailed 
distribution of CI(e)%%scn%% average value ]^[ standard deviation are shown ]f[ each bin%%per%% 
where rsoc ]^[ rsem are users ranks in terms of social ]^[ semantic capital%%lst%% respectively%%lst%% among all 
users%%per%%]$~ ~$[This de nition allows rstly to asses the amount of user status inconsistency (how close is 
abs(stinc) to 1)%%lst%% ]^[ second%%lst%% it also encodes whether he/she has higher social (stinc is positive) ]v[ 
semantic (stinc is negative) status%%per%%]$~ 
~$[While we can ]n[ measure effectiveness of communication directly using our dataset%%lst%% we al%%dsh%% 
low communication intensity to be a proxy ]f[ it%%per%%]$~ ~$[Our hypothesis in this regard is%%cln%% the higher the 
communication intensity between a source ]^[ receiver%%lst%% the higher potential ]f[ an effective com%%dsh%% 
munication%%per%%]$~ ~$[Now%%lst%% ]f[ all the directed links (ei%%lst%% j) in our communication network we de ne link 
inconsistency using above introduced status inconsistency of the source (stinc(ui)) ]^[ the receiver 
(stinc(u j)) as their product%%cln%% 
stinc(ei%%lst%% j) = stinc(ui) stinc(u j)%%per%%]$~ 
~$[This simple formula produces a higher absolute value ]f[ the links with higher total pair s inconsis%%dsh%% 
tency%%per%%]$~ ~$[The sign in this case indicates whether the source ]^[ receiver are ranked higher on the same 
sorts of capital (stinc(ei%%lst%% j) positive) ]v[ different forms of capital (stinc(ei%%lst%% j) negative)%%per%%]$~ 
~$[We indeed nd signi cant correlation between introduced link inconsistency ]^[ communication 
intensity (r = 0%%per%%27)%%per%%]$~ ~$[Results presented in Fig%%per%% 8 indicate following nding%%cln%% the communication be%%dsh%% 
tween two users tends to increase with status inconsistency of one ]v[ both of the users%%lst%% if they are 
both richer on the same form of capital%%per%%]$~ ~$[If the users are status inconsistent ]b[ being rich on differ%%dsh%% 
ent forms of capital%%lst%% then their communication intensity tends to decrease%%per%%]$~ ~$[As with other ndings 
regarding social capitals%%lst%% the described patterns are relevant ]f[ extreme cases (high ]^[ low edge 
weights)%%lst%% ]^[ there is a wide spectrum of edge inconsistency values taken by the medium%%dsh%%weight 
edges (Fig%%per%% 8%%lst%% left)%%per%% 
5%%per%%]$~ ~$[TEMPORAL EVOLUTION OF SEMANTIC HOMOPHILY 
In previous sections we performed analysis on a snapshot of Twitter network formed from the whole 
6 months dataset%%per%%]$~ ~$[In this section we investigate temporal aspects of semantic homophily by looking 
A:18 
S%%per%%]$~ ~$[S cepanovi c et al%%per%%]$~ 
~$[Fig%%per%% 9%%cln%% Cumulative SR distributions 
in 
communication network ]^[ (right) in the rest of SR network%%per%%]$~ ~$[For better visualization of the dif%%dsh%% 
ferences in distributions the y%%dsh%%axis is thresholded above 0%%per%%7%%per%%]$~ ~$[The distributions are together sharply 
rising up to around that point%%per%% 
]f[ 5 full months 
in our dataset%%cln%% 
(left) 
at different snapshots of the network ]f[ each month%%per%%]$~ ~$[First we analyze temporal change of SR values%%per%%]$~ 
~$[In Fig%%per%% 9%%lst%% cumulative distribution functions (CDF) of SR values ]f[ each full month in our dataset are 
shown ]f[ communication network ]^[ ]f[ the rest of the links in SR network%%per%%]$~ ~$[Precisely%%lst%% we con%%dsh%% 
sider all the links with mutual communication (strong ties) in communication network%%lst%% while ]f[ 
the second distribution%%lst%% we take the difference between links in SR network ]^[ all communication 
contacts (both strong ]^[ weak)%%per%%]$~ ~$[In this way we aim to distinguish between SR of user pairs affected 
by communication (and hence social in uence) ]^[ those that are less likely to be affected (no com%%dsh%% 
munication of any type occurred between them in our dataset)%%per%%]$~ ~$[Gradual increase in SR values takes 
place in both cases over time (CDF increases at higher SR values)%%per%%]$~ ~$[In addition to the visualization%%lst%% 
by applying Kolmogorov%%dsh%%Smirnov (K%%dsh%%S) test [Massey Jr 1951] we con rm the distribution change%%per%%]$~ 
~$[In particular%%lst%% we compare the distributions ]f[ June ]^[ ]f[ October%%per%%]$~ ~$[For communication network%%lst%% 
K%%dsh%%S results in p < e 24 and%%lst%% respectively%%lst%% ]f[ SR network%%lst%% in p < e 197%%lst%% hence in both cases strongly 
rejecting the hypothesis that the distributions are the same%%per%% 
5%%per%%1%%per%%]$~ ~$[External in uences evidence 
The increase in average SR in SR network (Fig%%per%% 9) among ]n[ connected pairs of users is peculiar%%per%%]$~ ~$[It 
indicates a possible external in uence taking place during the period causing all users to talk more 
on a similar (external) topic%%per%%]$~ ~$[However%%lst%% since the Twitter social network we investigate is ]n[ the 
only possible way ]f[ our users to communicate ]^[ in uence each other%%lst%% this does ]n[ allow us to 
assert whether the increase is indeed (only) due to external in uence%%per%%]$~ ~$[In any case%%lst%% we turn to our 
semantic layers to look ]f[ an evidence of common external in uences in the dataset%%per%%]$~ 
~$[Using AlchemyAPI output%%lst%% we identify overall most popular categories ]f[ topics of communi%%dsh%% 
cation in our dataset%%per%%]$~ ~$[They are displayed in Fig%%per%% 10%%per%%]$~ ~$[Arts ]^[ entertainment%%lst%% including movies%%lst%% tv 
shows%%lst%% music ]^[ humor is the dominant category%%per%%]$~ ~$[Second set of most popular categories includes 
sex (under society)%%lst%% sports ]^[ technology ]^[ computing%%per%%]$~ 
~$[Insights on common topics of communication using Wikipedia semantic relatedness database 
are consistent with those from AlchemyAPI%%per%%]$~ ~$[In Table V we present some of top 100 concepts 
Semantic homophily in online communication%%cln%% evidence from Twitter 
A:19 
Fig%%per%% 10%%cln%% Semantic taxonomy of whole communication network visualized in a bubble%%dsh%%tree%%dsh%% 
map%%cln%% highest level categories are in the center%%per%%]$~ ~$[Subcategories are represented as descendants in the 
tree%%per%%]$~ ~$[Size of bubbles corresponds to the frequency of topics under that category in our dataset%%per%% 
(Wikipedia articles) found to describe the semantics in the dataset overall%%per%%]$~ ~$[For easier comparison%%lst%% 
we display these concepts per (sub)categories identi ed using AlchemyAPI%%per%%]$~ ~$[The two seasons of 
TV series This Is England that have been aired at the time corresponding to our dataset are ranked 
2nd ]^[ 3rd%%per%%]$~ ~$[Next%%lst%% we also nd several musicians ]^[ bands%%per%%]$~ ~$[The concepts LOL ]^[ Smiley Face 
are in part a result of how ESA algorithm [Gabrilovich ]^[ Markovitch 2009%%scn%% Gabrilovich ]^[ 
Markovitch 2007] that we used to build Wikipedia SR database works%%per%%]$~ ~$[They are also in agreement 
with humor being prevalent subcategory among users in our dataset%%per%%]$~ ~$[In addition to the series This is 
England being aired at the time of our dataset%%lst%% the death of Osama bin Laden also happened during 
that period%%lst%% ]^[ we see an article about him describing the general conversation%%per%%]$~ ~$[ESA s output of 
> 300K Wikipedia concepts describing topics in our dataset results in a ne SR metrics%%lst%% as exhibited 
in detecting ne gradual temporal increase%%per%%]$~ ~$[At the same time%%lst%% from Table V we see that already the 
top 100 concepts provide insights into the concrete topics of the conversation in the dataset%%per%%]$~ 
~$[These insights%%lst%% offer evidence ]f[ some external in uence taking place in our dataset that could 
lead to global increase in SR among ]n[ connected users%%per%%]$~ ~$[Since mentioned TV series%%lst%% music ]^[ 
events are prevalent topics in the dataset%%lst%% it could mean that our users are independently watch%%dsh%% 
ing/following ]^[ commenting on them%%per%%]$~ ~$[This in turn could lead to average increase in their SR%%lst%% 
even if they never communicated%%per%%]$~ ~$[However%%lst%% once again%%lst%% we can ]n[ assert whether the increase is 
indeed (only) due to external in uence ]v[ due to some social contacts and/or peer in uence ]n[ 
detectable using our Twitter dataset%%per%%]$~ 
~$[A:20 
S%%per%%]$~ ~$[S cepanovi c et al%%per%%]$~ 
~$[Table V%%cln%% Most popular Wikipedia concepts in the dataset%%lst%% per taxonomy categories%%cln%% movies ]^[ TV 
shows%%lst%% music%%lst%% sports ]^[ humor 
Wikipedia articles in category 
Wikipedia articles in category 
Concept 
Movies ]^[ TV shows 
rank 
Music 
Concept 
rank 
This Is England 86 (TV series) 
This Is England 88 (TV series) 
Love of Life (American soap opera) 
The Dad Who Knew Too Little 
(Simpsons episode) 
2 
3 
15 
38 
Robert Smith (musician) 
10cc (English rock band) 
The Cure 
Producers 
(band) 
5 
9 
10 
16 
Wikipedia articles in category 
Sports 
Concept 
rank 
Wikipedia articles in category 
Humor 
Concept 
rank 
List of electronic sports titles 
Larry Johnson (American football) 
Alabama Crimson Tide football 
Racism in association football 
22 
67 
68 
82 
LOL 
Smiley Face 
Lolcat 
Pres%%per%%]$~ ~$[Obama on Death of 
Osama bin Laden (spoof) 
1 
4 
20 
36 
5%%per%%2%%per%%]$~ ~$[Semantic homophily%%lst%% social in uence ]^[ tie dissolution 
The increase in communication network can be due to homophily in its strict de nition%%lst%% i%%per%%e%%per%%%%lst%% new 
user pairs starting communication%%per%%]$~ ~$[Once connected they are later likely to have higher SR%%lst%% as we 
presented in Section 4%%per%%]$~ ~$[This can happen due to already connected pairs becoming more related%%lst%% i%%per%%e%%per%%%%lst%% 
social in uence%%per%%]$~ ~$[Sociology also suggests to look ]f[ link dissolution among dissimilar individuals 
[Felmlee et al%%per%% 1990%%scn%% Block ]^[ Grund 2014] as one of the reasons of average network SR increase%%per%%]$~ 
~$[We start by investigating formation ]^[ dissolution of links through time ]^[ their SR change%%per%%]$~ ~$[The 
requirement ]f[ active engagement from both source ]^[ receiver allows us to de ne communica%%dsh%% 
tion activation (link formation) ]^[ communication decommission (link dissolution) ]f[ reciprocal 
links%%per%%]$~ ~$[For each of the 69,312 reciprocal links observed during the whole period%%lst%% we de ne com%%dsh%% 
munication activation (formation) time to be the month when ]f[ the rst time both users have 
mentioned each other (in our dataset period)%%per%%]$~ ~$[Communication decommission (dissolution) time is 
given by the last month in our dataset that the users have both mentioned each other%%lst%% after which one 
]v[ both sides ceased the communication%%per%%]$~ ~$[In order to have enough data to calculate users similarity 
prior/after to links activation/decommission%%lst%% we require the month of activation/decommission to 
be between July ]^[ September%%per%%]$~ ~$[With this approach%%lst%% we nd in total 13,492 link activations ]^[ 
10,080 link decommissions in our dataset%%per%%]$~ ~$[As a rst insight%%lst%% we notice that slightly more links are 
activated than decommissioned%%per%%]$~ 
~$[Temporal change of average SR on links prior to ]^[ after the activation is shown in Fig%%per%% 11%%per%%]$~ 
~$[The SR between a user pair noticeably increases at the month of their communication activation%%per%%]$~ 
~$[Similar result has been found in other networks%%lst%% ]f[ instance among Wikipedia admins [Crandall 
et al%%per%% 2008] ]^[ ]f[ Flickr users [Zeng ]^[ Wei 2013]%%per%%]$~ ~$[The drop in average SR in the period after 
the link activation is also reported in earlier studies [Zeng ]^[ Wei 2013]%%per%%]$~ ~$[To investigate the drop 
in our case%%lst%% we look ]f[ an evidence that some interactions might ]n[ be preserved ]f[ long%%per%%]$~ ~$[This is 
one aspect where our approach is advantageous compared to the previous approaches%%lst%% that consider 
a formal edge formation (adding someone as a friend ]v[ following) ]^[ do ]n[ require an active user 
engagement afterwards%%per%%]$~ 
~$[Indeed%%lst%% we nd in total 8,166 links that are activated ]^[ then also decommissioned during 
our dataset period%%per%%]$~ ~$[The SR change ]f[ such links%%lst%% that are activated ]^[ then decommissioned%%lst%% as 
well as ]f[ those that persist in our dataset after the formation is show in Fig%%per%% 12%%per%%]$~ ~$[The average SR 
values ]f[ formed ]^[ persisting links stay high after they are formed%%per%%]$~ ~$[It is those links that will get 
Semantic homophily in online communication%%cln%% evidence from Twitter 
A:21 
Fig%%per%% 11%%cln%% Temporal SR change%%per%%]$~ ~$[Average SR on%%cln%% (top) all communication links%%lst%% (mid%%lst%% left) during 
communication activation%%lst%% (mid%%lst%% right) decommission%%lst%% ]^[ (bottom) on persisting links%%scn%% error bars 
show standard deviation values 
Fig%%per%% 12%%cln%% SR change during formation ]^[ decommission%%scn%% (left) during link formation ]^[ (right) 
during link decommission%%per%%]$~ ~$[We show the differences between the links that persist after formation 
]v[ not%%lst%% ]^[ similarly between those that were persisting in our dataset period before decommission 
]^[ those that were non%%dsh%%persisting%%per%%]$~ ~$[Error bars show standard deviation values 
decommissioned soon that contribute to lowering the average SR after formation that we see in Fig%%per%% 
11%%per%%]$~ ~$[This result displays that homophily needs to be considered together with active engagement ]^[ 
its temporal dynamics%%per%%]$~ 
~$[If observing only the persisting links that were already active ]^[ persisted during the whole 
period in our dataset%%lst%% we obtain results ]f[ their average SR change in the bottom plot in Fig%%per%% 11%%per%%]$~ 
~$[Such persisting interactions have a relatively stable average SR through time despite that the average 
SR in the whole network has increased from June until October%%per%%]$~ ~$[Also%%lst%% SR on persisting links is 
higher compared to the whole network%%per%%]$~ ~$[The stability of SR ]f[ an established communication could 
suggest a lack of in uence in our network%%per%%]$~ ~$[However%%lst%% we are careful with such an interpretation%%lst%% 
since this result might also indicate a saturation effect taking place%%per%%]$~ ~$[If looking at newly formed links 
A:22 
S%%per%%]$~ ~$[S cepanovi c et al%%per%%]$~ 
~$[Fig%%per%% 13%%cln%% Temporal status differences during formation ]^[ decommission%%cln%% (top) average relative 
social status (number of strong contacts)%%lst%% (bottom) average sum of strong contacts%%per%%]$~ ~$[Error bars show 
standard deviation values 
which persist ]^[ have high SR%%lst%% that indicates how at rst%%lst%% the users might in uence each other ]f[ 
some time%%per%%]$~ ~$[However%%lst%% their similarity is likely to stabilizes around this speci c SR value ( 0%%per%%07) ]f[ 
persisting links in our dataset%%lst%% as indicated by average SR during dissolution of previously persisting 
links in Fig%%per%% 12 (we discuss this result in more detail below)%%per%%]$~ 
~$[Fig%%per%% 11 also displays temporal change of SR on links that get decommissioned%%per%%]$~ ~$[Again%%lst%% in Fig%%per%% 
12%%lst%% we separate persisting links (during our dataset) that get decommissioned from those that have 
formed during our dataset time frame (non%%dsh%%persisting) ]^[ get decommissioned%%per%%]$~ ~$[Indeed%%lst%% we can 
notice how the persisting links have the above mentioned characteristic average SR of 0%%per%%07 which 
does ]n[ change during the actual month of decommission%%lst%% ]b[ afterwards drops signi cantly to 
0%%per%%02%%per%%]$~ ~$[The non%%dsh%%persisting links reach even higher SR during the month of decommission%%lst%% ]b[ 
before ]^[ after their SR is lower%%per%%]$~ ~$[This can indicate a sort of short%%dsh%%lived active engagement/interest 
between such pairs%%lst%% unlike more stable relationship between previously persisting links%%per%%]$~ ~$[The drop in 
average SR on the links that get decommissioned is striking%%cln%% SR becomes from 2 (on non%%dsh%%persisting) 
to 3 (on persisting) times lower after link dissolution%%per%%]$~ ~$[Sociology suggests as one possible cause 
]f[ link decommission that maintaining ties with dissimilar others might be costly [Felmlee et al%%per%% 
1990]%%per%%]$~ ~$[However%%lst%% we notice that the SR values before decommission on previously persisting links 
are ]n[ lower ]b[ around the same as on the links that stay persisting%%per%%]$~ ~$[Hence%%lst%% in terms of SR there 
is no observable dissimilarity between users with persisting communication before they will cease 
communication%%per%%]$~ ~$[We investigate other possible reasons ]f[ their link dissolution below%%per%%]$~ 
~$[Operating on the same sets of communication links as ]s[ far%%lst%% we now look at social capital of the 
communicating user pairs%%per%%]$~ ~$[As presented earlier%%lst%% different forms of social capital can be assessed%%per%%]$~ 
~$[Since herein we look at mutual communication%%lst%% it is natural to asses social capital in terms of 
Semantic homophily in online communication%%cln%% evidence from Twitter 
A:23 
numbers of strong/weak contacts%%per%%]$~ ~$[In Fig%%per%% 13%%lst%% we show relative status ]^[ total number of strong 
contacts of communicating user pairs%%per%%]$~ 
~$[Relative social status (discussed in Section 4%%per%%4) is de ned as the absolute difference between 
social capitals of source ]^[ receiver users%%per%%]$~ ~$[Looking at relative status (top row plots in Fig%%per%% 13)%%lst%% 
we rst notice the difference on persisting links compared to other types of links (and also to the 
whole network%%lst%% a result which is ]n[ displayed)%%per%%]$~ ~$[Persisting links have lower relative status%%lst%% i%%per%%e%%per%%%%lst%% users 
who are actively communicating tend to have similar social status rank%%per%%]$~ ~$[While homophily on the 
status level is ]n[ new%%lst%% herein we exhibit its underlying mechanisms in communication network%%per%%]$~ 
~$[Namely%%lst%% both types of links%%lst%% those that are newly formed ]^[ those that will get decommissioned in 
time%%lst%% have slightly%%lst%% ]b[ notably higher relative social status compared to persisting links%%per%%]$~ ~$[Hence%%lst%% we 
nd evidence that link dissolution happens due to dissimilarity in social status%%per%%]$~ ~$[Another interesting 
observation is that user pairs that start with higher relative status compared to persisting also get 
decommissioned later (while those who start around that persisting average indeed persist commu%%dsh%% 
nication later)%%per%%]$~ ~$[The results are similar ]f[ relative status in terms of weak contacts ]s[ we do ]n[ 
present them%%per%%]$~ ~$[To reiterate%%lst%% our analysis ]s[ far gives two insights about links before they get decom%%dsh%% 
missioned%%cln%% i) lack of semantic differences on previously persisting links (their SR is ]n[ lower at the 
time when link dissolution happens compared to those who consistently persist communication) ]^[ 
ii) higher status differences (also compared to persisting links)%%per%%]$~ ~$[Hence%%lst%% there is indication in Twit%%dsh%% 
ter network that persisting communication links dissolve in the presence of status level heterophily 
rather than value level heterophily%%per%%]$~ 
~$[Findings from sociology also suggest that relationships last shorter time ]^[ are more likely to 
decay ]f[ pairs of individuals with lower overall social status [Burt 2000]%%per%%]$~ ~$[To assess this hypothesis 
in our communication network%%lst%% we observe social status in terms of total number of contacts ]f[ 
user pairs who cease communication%%per%%]$~ ~$[Results in Fig%%per%% 13 (plots in bottom row) do ]n[ support such 
hypothesis ]f[ strong contact%%cln%% pairs who cease communication have around the same sum of strong 
contacts on average as the pairs who persist communication%%per%%]$~ ~$[Moreover%%lst%% in the case of weak contacts%%lst%% 
there is an opposite evidence%%cln%% pairs prior to communication cease tend to have more weak contact 
compared to average of persisting links (other results ]f[ weak contacts are similar to strong ]s[ we do 
]n[ show them)%%per%%]$~ ~$[In addition%%lst%% the increase in the sum of pair s contacts at the month of decommission 
suggests that those new contacts might affect their existing link%%per%%]$~ ~$[After the decommission the sum of 
contacts drops%%lst%% ]b[ still stays higher than would be expected after the decommission (existing link is 
counted as one strong contact ]f[ both users%%lst%% ]s[ after the decommission%%lst%% their sum of contacts would 
be expected to drop by 2)%%per%%]$~ ~$[Such evidence suggests that in some percent of the cases one ]v[ both of the 
users have established new communication links at the time of abandoning the current one between 
them%%per%%]$~ ~$[This result is supported by a level of stability on the number of persisting communication 
links per user%%per%%]$~ ~$[Namely%%lst%% most of the 5,229 users who participate in constantly persisting links in our 
dataset have between one to two persisting contacts ( = 1%%per%%2 ]^[ = 0%%per%%49)%%per%%]$~ 
~$[In summary%%lst%% presented types of interactions show the importance of considering both homophily 
]^[ in uence as dynamic interdependent tendencies [Yavas ]^[ Y ucel 2014] in temporal networks%%lst%% 
instead of looking at static snapshots%%per%%]$~ ~$[Our analysis on interaction decommission reveals similar 
results as in [Noel ]^[ Nyhan 2011] where it is showed how ]n[ accounting ]f[ homophily effect 
on tie dissolution ( unfriending ) may importantly affect social in uence estimation%%per%%]$~ ~$[Precisely%%lst%% we 
suggest that on a same communication link (interaction) at different points of time with reference 
to its activation/decommission time%%lst%% one ]v[ the other of the tendencies might be playing a stronger 
role%%per%%]$~ ~$[Our dataset time%%dsh%%frame does ]n[ allow ]f[ that%%lst%% ]b[ as a future work%%lst%% we aim to look at the 
period in which edge formations ]^[ deletions might be happening%%lst%% ]^[ whether there are some 
natural cycles in the human communication networks%%per%% 
6%%per%%]$~ ~$[COMMUNITY STRUCTURE AND SEMANTIC FOCI 
We start by investigating what are the semantics traits that shape community structures in 
communication network of Twitter users%%per%%]$~ 
~$[A:24 
S%%per%%]$~ ~$[S cepanovi c et al%%per%%]$~ 
~$[Table VI%%cln%% Largest communities in the communication network ]^[ their semantic foci 
Num of 
users 
Main 
geo%%dsh%%entities 
% positive users 
2222 
686 
636 
435 
381 
343 
343 
Nigeria 
Indonesia 
0%%per%%38 
0%%per%%87 
Philippines%%lst%% 
South 
Africa Malaysia 
0%%per%%67 
0%%per%%72 
Jamaica U%%per%%K%%per%%]$~ ~$[NY%%lst%% LA%%lst%% 
0%%per%%5 
0%%per%%59 
Miami 
0%%per%%71 
Fig%%per%% 14%%cln%% Most relevant entities found in the tweets of the two largest communities%%cln%% (left) Nige%%dsh%% 
rian ]^[ (right) Indonesian 
When dealing with representations of real%%dsh%%world networks one can distinguish between structural 
]^[ functional communities [Yang et al%%per%% 2014%%scn%% Yang ]^[ Leskovec 2015]%%per%%]$~ ~$[The connectivity pattern 
among members in the network de nes structural communities%%lst%% whereas a common function ]v[ 
a role of user groups de nes functional communities%%per%%]$~ ~$[Simply speaking%%lst%% structural communities 
can be de ned as groups of users that are more tightly connected within the group compared to the 
rest of the network%%per%%]$~ ~$[This de nition can entail modular ]v[ communities with distinct users%%lst%% ]b[ also%%lst%% 
more representative of the real%%dsh%%world%%lst%% we can think of overlapping community structure%%lst%% where 
certain nodes belong to more communities%%per%%]$~ 
~$[If we recall Feld s theory about foci of homophily [Feld 1981] that drive clustered (community) 
structure of social networks%%lst%% then foci can be seen as one such common function ]v[ role around 
which communities are formed%%per%%]$~ ~$[In our case%%lst%% we allow different semantic traits of user commu%%dsh%% 
nication to de ne semantic foci%%per%%]$~ ~$[Our initial question can be now rephrased as whether structural 
communities (both modular ]^[ overlapping) can be explained in terms of their functional roles by 
semantic foci%%per%% 
6%%per%%1%%per%%]$~ ~$[Modular communication communities 
A state of the art algorithm when it comes to detecting modular community structure is based 
on modularity metrics [Newman 2006]%%per%%]$~ ~$[We run its fast implementation [Blondel et al%%per%% 2008] on 
our commnication network ]^[ detect 2632 communities%%per%%]$~ ~$[Statistics about the largest detected 
modular communities is shown in Table VI%%per%%]$~ ~$[By applying semantic analysis on groups of users be%%dsh%% 
longing to detected communities%%lst%% we nd most relevant semantic traits of the communication in 
each community%%per%%]$~ ~$[Precisely%%lst%% we nd relevant concepts%%lst%% entities%%lst%% categories%%lst%% taxonomy tree ]^[ aver%%dsh%% 
age sentiment ]f[ each community%%per%%]$~ ~$[Then we also apply TF%%dsh%%IDF analysis on the semantic traits with 
respect to those ]f[ the whole communication network to asses whether found semantic traits are 
speci c to a community%%per%%]$~ ~$[After careful analysis%%lst%% we conclude that only the entities of conversation 
can be used to explain the modular communities%%per%%]$~ ~$[As an example%%lst%% in Fig%%per%% 14%%lst%% we present top entities 
Semantic homophily in online communication%%cln%% evidence from Twitter 
A:25 
found in tweets of the two largest communities%%per%%]$~ ~$[Thanks to those entities%%lst%% we are able to conclude 
that they represent respectively a community of users speaking about Nigeria ]^[ about Indonesia%%per%%]$~ 
~$[Importantly%%lst%% in addition to a few dialect speci c words (such as in this case dey in Nigerian ]^[ 
nih in Indonesian community)%%lst%% among most relevant entities we nd geographical entities (in ad%%dsh%% 
dition to Nigeria%%lst%% we nd entity Lagos in Nigerian ]^[ in addition to Indonesia%%lst%% we detect Jakarta 
]^[ Bali ]f[ Indonesian community)%%per%%]$~ ~$[With such analysis ]^[ additional manual inspection of the 
tweets%%lst%% we conclude that the largest modular communities are formed around geographic entities 
as foci of communication (see Table VI ]f[ the other top size communities)%%per%%]$~ ~$[To reiterate%%lst%% we con%%dsh%% 
clude that geographic entities are homophilous foci that best explain modular communities in our 
communication network%%per%%]$~ ~$[Similar result are found in different types of communication networks%%scn%% 
good predictors of cohesive communication groups in [Leskovec ]^[ Horvitz 2008%%scn%% De Choudhury 
2011] are geographic foci ]^[ several studies [Blondel et al%%per%% 2010%%scn%% Aiello et al%%per%% 2012] report lan%%dsh%% 
guage foci%%per%%]$~ ~$[As a remark%%lst%% the communities in our Twitter network may be formed due to the ethnicity 
of users ]v[ their geolocation%%lst%% while in any case%%lst%% their tweet contents contain relevant geo%%dsh%%location 
entities%%per%%]$~ 
~$[Another important nding regarding modular communities is that there is a wide diversity in their 
average sentiment%%per%%]$~ ~$[In Table VI%%lst%% we show the percent of positive users in the whole community%%per%%]$~ ~$[We 
can see it ranges from 0%%per%%38%%lst%% ]f[ a quite negative Nigerian%%lst%% to 0%%per%%87 ]f[ the most positive Indonesian 
community%%per%%]$~ ~$[The large difference in the sentiment between these two particular communities can 
be also inferred from their relevant concepts%%cln%% prevalent swear word%%dsh%%concepts in Nigeria (having 
negative sentiment)%%lst%% and%%lst%% on the other hand%%lst%% gratitude ]^[ luck being dominant in positive Indonesia%%per%%]$~ 
~$[Displaying particularity of the Indonesian community%%lst%% an earlier study found that Indonesian users 
have higher than average tweets per user ratio%%lst%% which is related to higher reciprocity%%lst%% ]^[ in turn a 
higher%%dsh%%reciprocity communities display a happier language [Poblete et al%%per%% 2011]%%per%%]$~ 
~$[If modular structural communities were ]n[ formed around foci as suggested by Feld s theory%%lst%% 
]b[ if instead they were simply a result of semantically related users connecting more often%%lst%% then we 
would expect to see similar communities when running community detection on the SR network%%per%%]$~ 
~$[We test such hypothesis by detecting communities on a several SR x networks%%per%%]$~ ~$[In order to evaluate 
how well the sets of communities from communication (P) ]^[ semantic layer (L) match%%lst%% we apply 
the procedure used in [Yang et al%%per%% 2014%%scn%% Yang ]^[ Leskovec 2012%%scn%% Yang ]^[ Leskovec 2015] to nd 
the matching score%%cln%% 
S = max 
Pj P,Li L 
F1(Li,Pj)%%lst%% 
where F1() uses F1 as a score ]f[ similarity between the two sets%%per%%]$~ ~$[Resulting S [0,1]%%lst%% where 1 
indicates perfect matching%%per%%]$~ 
~$[Best matching score we nd when running InfoMap algorithm [Rosvall ]^[ Bergstrom 2008] on 
the SR 0%%per%%2 network%%per%%]$~ ~$[The threshold x = 0%%per%%2 matches with ]^[ is explained by the analytical anal%%dsh%% 
ysis of SR network that we discussed earlier (see Section 4%%per%%1)%%per%%]$~ ~$[InfoMap is ]n[ modularity%%dsh%%based 
community detection ]^[ the rationale why it performs better on the semantic layer is because SR x 
networks are ]s[ dense%%per%%]$~ ~$[Modularity metric%%lst%% which is optimized by modularity%%dsh%%based algorithms%%lst%% eval%%dsh%% 
uates existence of dense connections among nodes within communities ]b[ sparse connections with 
nodes in different communities%%per%%]$~ ~$[Hence it can ]n[ work well on dense networks%%lst%% such as SR 0%%per%%2%%per%%]$~ 
~$[Best matching scores ]f[ biggest communities (with more than 50 users) are presented in Table 
VII%%per%%]$~ ~$[We also visualize modular communication communities ]^[ their respective SR community 
counterparts in Fig%%per%% 15%%per%%]$~ ~$[The matching scores reveal that SR communities can only to a moderate 
extent explain the communication community structure%%per%%]$~ ~$[Such conclusion%%lst%% in turn%%lst%% supports Feld s 
theory about foci of homophily%%lst%% in particular when he states that similarities need ]n[ lead to fo%%dsh%% 
cused (clustered) interaction%%lst%% ]^[ focused interaction can exist apart from similarity of individual 
characteristics [Feld 1981]%%per%%]$~ 
~$[A:26 
S%%per%%]$~ ~$[S cepanovi c et al%%per%%]$~ 
~$[Fig%%per%% 15%%cln%% Modular communication network communities%%scn%% (left) radial axis visualization in Gephi 
[Bastian et al%%per%% 2009] of communication network communities with displayed identi ed user geo%%dsh%% 
location entities in each community%%scn%% (right) SR communities produced by Infomap visualized with 
different colors on the communication network community representation%%scn%% we can see to what 
extent the largest modular communities from the communication layer overlap with those produced 
from the semantic layer 
Table VII%%cln%% Community similarity between communication ]^[ semantic layer 
P communities 
P0 %%dsh%% Philippines 
P8 %%dsh%% Nigeria 
P10 %%dsh%% Indonesia 
P11 %%dsh%% Nigeria 
P102 %%dsh%% UK 
L communities 
L326 
L2 
L159 
L2 
L211 
S 
0%%per%%41 
0%%per%%45 
0%%per%%18 
0%%per%%18 
0%%per%%13 
Semantic homophily in online communication%%cln%% evidence from Twitter 
A:27 
Fig%%per%% 16%%cln%% Overlapping communities%%cln%% (left) relationship between community size ]^[ density%%scn%% (right) 
forms of social capital as a function of node community membership%%per%%]$~ ~$[We average values ]f[ 10 ]^[ 
more community memberships%%lst%% due to data scarcity%%per%%]$~ ~$[Error bars show one standard deviation%%per%% 
6%%per%%2%%per%%]$~ ~$[Overlapping communication communities 
Next we analyze overlapping structural communities in communication network%%per%%]$~ ~$[We select the 
algorithm BigClam [Yang ]^[ Leskovec 2013] because it detects overlapping communities as the 
groups of nodes with denser links presence%%lst%% in agreement with sociological theories%%lst%% such as the 
Feld s [Yang ]^[ Leskovec 2014]%%per%%]$~ ~$[BigClam automatically detects 198 communities in our network%%lst%% 
largest in size consisting of 586 users%%per%%]$~ ~$[Community membership of a user (de ned as the number 
of communities in which it belongs)%%lst%% ranges from the minimum 1%%lst%% ]f[ a majority of users%%lst%% to the 
maximum 14%%lst%% ]f[ a small number of users%%lst%% ]^[ it exponentially decreases%%per%%]$~ ~$[Similar semantic anal%%dsh%% 
ysis as with modular communities reveals that geographic foci are again the strongest predictor of 
communities%%per%%]$~ ~$[The subtle difference%%lst%% however%%lst%% is seen in modular communities being broken apart in 
several overlapping communities%%per%%]$~ ~$[For instance%%lst%% the largest Nigerian modular community now has 7 
overlapping counterparts%%per%%]$~ ~$[Many of the nodes from one modular community will belong to several 
such counterparts%%per%%]$~ ~$[By careful analysis%%lst%% we reveal other foci%%lst%% behind the overarching geographic%%lst%% that 
drive such overlapping communities within the modular (these foci can again be geographic ]v[ not)%%per%%]$~ 
~$[For example%%lst%% withing the Nigerian group%%lst%% we nd subgroups discussing different geo%%dsh%%entities%%lst%% in 
addition to common Nigeria%%cln%% some talk about Ghana%%lst%% some about Zambia ]^[ others about London%%per%%]$~ 
~$[That ]n[ only geographic foci drive these overlapping sub%%dsh%%communities%%lst%% we can see from the case 
]f[ Malaysia where one subcommunity of 260 users has the predominant entity selamat hari raya%%lst%% 
]v[ Muslim greeting ]f[ Happy Eid%%per%%]$~ ~$[We also nd communities around specialized topics%%lst%% such as one 
of 144 users talking predominantly about NASCAR (auto racing)%%per%%]$~ ~$[Hence%%lst%% our semantic analysis of 
overlapping community structure reveals that geographic ]^[ language foci are the largest foci%%lst%% in 
terms of number of users connected%%per%%]$~ ~$[Within these foci as enablers%%lst%% we can nd other more focused 
]^[ overlapping foci%%lst%% with smaller number of users discussing more speci c topics%%per%%]$~ 
~$[Additionally%%lst%% we look into which communities are featuring most overlaps with others%%per%%]$~ ~$[To this 
purpose%%lst%% we introduce community density as the average number of community memberships ]f[ 
the nodes in the community%%per%%]$~ ~$[As presented in Fig%%per%% 16 (left)%%lst%% there is a strong positive correlation 
between the size of the community ]^[ its introduced density%%per%%]$~ ~$[Such result exhibits that the largest 
communities are those that feature most overlaps with other (sub)communities%%per%%]$~ ~$[Thinking of foci%%lst%% 
such result can be interpreted also in the following way%%per%%]$~ ~$[The largest foci are as well enablers ]f[ 
A:28 
S%%per%%]$~ ~$[S cepanovi c et al%%per%%]$~ 
~$[Fig%%per%% 17%%cln%% Pluralistic homophily ]^[ semantic capital%%cln%% (left) semantic capital%%lst%% (middle) mean neigh%%dsh%% 
borhood SR ]^[ (right) status inconsistency in function of community memberships%%per%%]$~ ~$[Error bars 
show one standard deviation%%per%% 
participating users to develop more additional foci of homophily%%per%%]$~ ~$[A related result in an analysis 
on Twitter is reported by Halberstam et al%%per%% [Halberstam ]^[ Knight 2014] who found that users 
af liated with majority political groups%%lst%% relative to the minority group%%lst%% have more connections%%lst%% ]^[ 
are more densely connected%%per%% 
6%%per%%3%%per%%]$~ ~$[Pluralistic homophily 
Pluralistic homophily results from several different foci%%per%%]$~ ~$[The users that share more communities 
(they are found in overlapping parts) have more homophilous foci in common%%lst%% i%%per%%e%%per%%%%lst%% they feature 
aspects of pluralistic homophily%%per%%]$~ ~$[Such users are more densely connected [Yang ]^[ Leskovec 2013] 
forming a network core [Yang ]^[ Leskovec 2014]%%per%%]$~ ~$[Hence we ask whether the nodes in these parts 
tend to have higher social capital%%per%%]$~ ~$[However%%lst%% we nd no correlation between community member%%dsh%% 
ship ]^[ social capital%%lst%% except that the nodes in more communities tend to be slightly more popular 
than active (see Fig%%per%% 16%%lst%% right)%%per%%]$~ ~$[Interestingly%%lst%% the same holds ]f[ semantic capital%%cln%% nodes with higher 
community membership are no more likely to be semantically rich than those belonging to less 
communities (see Fig%%per%% 17%%lst%% left)%%per%%]$~ ~$[This is a particularly surprising result%%lst%% as such nodes%%lst%% with higher 
community membership%%lst%% are tied with their friends from different communities around different 
foci%%lst%% according to the theory of focused interaction [Feld 1981]%%per%%]$~ ~$[We would expect them to be seman%%dsh%% 
tically richer%%lst%% since they talk on several additional topics%%lst%% as their community membership grows%%per%%]$~ 
~$[However%%lst%% as they are ]n[ semantically richer%%lst%% then our next assumptions is that such nodes must be 
less similar to their neighbors on average%%per%%]$~ ~$[Indeed%%lst%% this is true%%lst%% as presented in Fig%%per%% 17 (middle)%%per%%]$~ ~$[The 
correlation between similarity to an average neighbor ]^[ community membership is highly nega%%dsh%% 
tive ]^[ signi cant 0%%per%%83%%lst%% p = 0%%per%%003%%per%%]$~ ~$[A concept of opinion leaders [Rogers ]^[ Bhowmik 1970] 
de nes them as the members of the group sought by others ]f[ opinion ]^[ advice ]^[ they are said 
to posses features ]^[ conformity to the norms that make them super%%dsh%%representative ]v[ similar to 
their average follower%%per%%]$~ ~$[Hence%%lst%% the users with increased community membership in our network po%%dsh%% 
tentially represent opinion leader withing their different communities%%per%%]$~ ~$[So far we nd no correlation 
between social ]v[ semantic capital ]^[ community membership%%per%%]$~ ~$[However%%lst%% we ask what about sta%%dsh%% 
tus inconsistency%%per%%]$~ ~$[Since status inconsistency can be negative%%lst%% we correlate its median value against 
community membership (although%%lst%% similar result holds ]f[ mean value%%lst%% as well)%%per%%]$~ ~$[As presented in 
Fig%%per%% 17 (right)%%lst%% status inconsistency grows with community membership (r = 0%%per%%87 ]^[ p = 0%%per%%001)%%per%%]$~ 
~$[With this we reveal that the users in more communities do ]n[ have higher social ]v[ semantic status%%lst%% 
]b[ they can be characterized by increased status inconsistency%%per%%]$~ ~$[As mentioned in introduction%%lst%% status 
inconsistency is suggested to be an attribute of individuals who are drivers of social change [Lenski 
Semantic homophily in online communication%%cln%% evidence from Twitter 
A:29 
1954]%%per%%]$~ ~$[Therefore%%lst%% we conclude that individuals featuring pluralistic homophily in communication 
networks are likely to be the opinion leaders ]^[ drivers of social change within their communities%%per%% 
7%%per%%]$~ ~$[DISCUSSION AND CONCLUSION 
Despite the vast ]^[ growing literature ]^[ research on what interweaves people in social networks%%lst%% 
the interplay of homophily ]^[ in uence as the main factors ]f[ social correlation with the network 
is still ]n[ fully explored ]^[ understood%%per%%]$~ ~$[Our rst set of ndings quantify to what extent semantic 
homophily ]^[ social in uence affect the communication%%lst%% its propensity ]^[ intensity in online 
social networks%%lst%% though we are ]n[ trying to distinguish between these two factors%%per%%]$~ ~$[Concretely%%lst%% 
we analyze interplay of semantic relatedness ]^[ communication intensity ]^[ show that while 
their correlation is low%%lst%% their relationship is strongly captured by subtle communication network 
properties%%per%%]$~ 
~$[Next we show that several types of homophily are present in communication network%%lst%% such as 
value (topics%%lst%% sentiment) ]^[ status (social ]^[ semantic capital) homophily%%per%%]$~ ~$[Introduced social ]^[ 
semantic status metrics allow us to exhibit their growth with strength of the links (both%%lst%% in terms 
of reciprocal communication ]^[ with increase in intensity)%%per%%]$~ ~$[Assessment on how the two types of 
capital are affecting each other in communication network reveals diversity of relationships depend%%dsh%% 
ing on which exact form of the two types of capitals is considered%%per%%]$~ ~$[While popularity ]^[ semantic 
capital are positively correlated%%lst%% sentiment%%lst%% inversely%%lst%% is negatively correlated with social capital%%per%%]$~ 
~$[In any case%%lst%% we exhibit large diversity among users on the existing combinations of capitals they 
posses%%per%%]$~ ~$[Additional investigation on sociological concept of relative status reveals strong preference 
]f[ communication with users of similar status%%per%%]$~ ~$[However%%lst%% ]f[ relative social status particularly%%lst%% we 
notice pattern of less popular users initiating more communication towards higher popularity users%%per%%]$~ 
~$[We also nd evidence ]f[ sociological proposition that status inconsistency of one ]v[ both of the 
parties increases communication effectiveness%%per%%]$~ ~$[Moreover%%lst%% our data suggest a new hypothesis%%cln%% this 
proposition holds only when both users are higher on the same status type%%lst%% otherwise%%lst%% communica%%dsh%% 
tion intensity decreases compared to average%%per%%]$~ 
~$[Using temporal communication network we show that the tendencies of homophily ]^[ in uence 
are dynamic ]^[ change their role ]^[ magnitude in time%%per%%]$~ ~$[In addition to con rming previous nding 
in other types of networks that similarity of users sharply grows before their link formation%%lst%% we also 
explain in part the following decrease in similarity as a result of link decommission%%per%%]$~ ~$[A novel in%%dsh%% 
sight we make is that relative difference in social status is a stronger predictor ]f[ link decommission 
compared to differences on a value homophily level%%per%%]$~ 
~$[We analyze modular ]^[ overlapping community structure of the communication layer ]^[ nd 
evidence ]f[ Feld s theory about focused organization of social ties%%per%%]$~ ~$[Comparison of best matching 
between community structure in communication ]^[ in semantic layer shows that cohesive commu%%dsh%% 
nities cannot be explained only by semantic relatedness of users%%lst%% instead there need to be a foci of 
homophily present around which communities are formed%%per%%]$~ ~$[Further analyses reveal that geographic 
foci are the largest predictor ]f[ both modular ]^[ overlapping communities%%per%%]$~ ~$[However%%lst%% in the case 
of overlapping community structure%%lst%% we nd that such large foci also give space ]f[ smaller ]b[ 
stronger foci around which sub%%dsh%%communities within are formed%%per%%]$~ ~$[Precisely%%lst%% larger foci tend to create 
denser communities (i%%per%%e%%per%%%%lst%% those with more overlapping parts within)%%per%%]$~ ~$[Explanation from sociology is 
a tendency of people who are connected around one foci to nd ]v[ create new foci to strengthen the 
interaction%%per%%]$~ 
~$[Finally%%lst%% we also exhibit that pluralistic homophily does ]n[ correlate with social ]v[ semantic cap%%dsh%% 
ital%%scn%% instead the users who are connected with others around several different foci tend to have lower 
average similarity to those neighbors%%lst%% while at the same time being increasingly status inconsistent%%per%%]$~ 
~$[A:30 
S%%per%%]$~ ~$[S cepanovi c et al%%per%%]$~ 
~$[Table VIII%%cln%% Summary of our contributions%%cln%% ]f[ each theory ]v[ question from sociology that de ned 
the analysis we describe found evidence and/or some novel hypotheses ]v[ open questions that arise 
from the analysis%%per%%]$~ 
~$[Experimental evidence 
Novel hypotheses/open questions 
Sociology%%scn%% 
theory ]^[ 
questions 
Semantic 
homophily 
Status level 
homophily 
Value level 
homophily 
Semantic 
homophily 
evolution 
Heterophilous 
links 
dissolution 
Quanti cation 
Comm%%per%% propensity ( cp) ]^[ intensity 
(CI) increase with SR%%per%% 
(Un)directed degree assortativity%%scn%% 
increases with tie strength ]^[ CI%%per%% = 
On higher CI%%lst%% Twitter is more a 
social than information network%%per%%]$~ 
~$[Attribute assortativity on semantic 
aspects of comm%%per%%%%lst%% such as topics%%lst%% 
sentiment%%lst%% semantic diversity%%per%%]$~ 
~$[Temporal evolution 
Average increase through time in SR 
among communicating users%%per%%]$~ 
~$[The increase is driven by semantic homophily 
]^[ social in uence%%per%%]$~ 
~$[Dissolution more due to social status ]^[ 
less due to semantic value heterophily%%per%%]$~ 
~$[Persisting pairs having more weak 
contacts are increasingly likely 
to stop communicating%%per%%]$~ 
~$[CI increases with status inconsistency%%lst%% 
when both users are high on the same 
status dimension%%scn%% otherwise CI decreases%%per%% 
in%%dsh%%in ]^[ out%%dsh%%out deg%%per%% assortativity 
coef cients obey a different pattern 
to others with increase in CI%%per%%]$~ 
~$[Tendency of users with a particular 
popularity difference to interact%%per%%]$~ 
~$[Semantic diversity ]^[ negative 
sentiment increase with comm%%per%% activity%%per%%]$~ 
~$[Average increase through time in SR 
among users who never communicated%%per%%]$~ 
~$[The increase is driven by external in uence%%per%%]$~ 
~$[At the time of a link dissolution%%lst%% 
one ]v[ both of the participating users 
are likely to have found a new contact 
that will replace the one being 
disconnected%%per%%]$~ 
~$[High correlation between size of a 
community ]^[ its density of overlap%%per%%]$~ 
~$[Pluralistic homophily is ]n[ explained 
by social ]v[ semantic capital%%per%%]$~ 
~$[On the other hand%%lst%% individuals 
exhibiting pluralistic homophily 
are increasingly status inconsistent%%per%%]$~ 
~$[Theory of 
focused 
interaction 
Pluralistic 
homophily 
Community foci 
Semantic similarity in terms of SR 
only moderately explains structural 
communities%%per%%]$~ ~$[Modular communities 
explained by geolocation entities as 
comm%%per%% foci%%per%%]$~ 
~$[Overlapping communities 
formed around other foci enabled 
by overarching geolocation foci%%per%% 
7%%per%%1%%per%%]$~ ~$[Limitations 
A limitation of our work posed by the restricted dataset is that we are ]n[ considering the entire 
Twitter channel ]f[ information ow%%lst%% as there are also considerable amount of information owing 
along the retweet network%%lst%% which is ]n[ taken into consideration in this work%%per%%]$~ ~$[Besides this%%lst%% the men%%dsh%% 
tion mechanism in Twitter can be sometimes biased towards speci c target audiences ]f[ speci c 
information [Tang et al%%per%% 2015]%%per%%]$~ 
~$[Semantic homophily in online communication%%cln%% evidence from Twitter 
A:31 
Another limitation is that our results are solely about computer%%dsh%%mediated communication ]^[ we 
do ]n[ tackle the impact of Internet (online medium) on social interaction%%per%%]$~ 
~$[Further investigation is needed on the in uence of the threshold ]f[ semantic relatedness on the 
semantic homophily%%lst%% as we show in this work that the semantic layer became disassortative after 
threshold equal to 0%%per%%6%%per%%]$~ ~$[Additional ]^[ improved sentiment analysis is needed to understand how the 
social reinforcement in uences communication between users ]^[ if there exists happiness paradox 
while people communicate in social network%%per%% 
8%%per%%]$~ ~$[METHODS 
In this section we describe how we build Wikipedia%%dsh%%based semantic database using an English pages 
dump (52GB in size%%lst%% uncompressed)%%per%%]$~ ~$[The rst step is to take the article texts as the algorithm builds 
on the large amount of knowledge they provide%%per%%]$~ ~$[We then apply an open%%dsh%%source script wikiextractor 
[Giuseppe Attardi 2015] to pre%%dsh%%process ]^[ clean the texts%%per%%]$~ ~$[The ESA algorithm is based on the TF%%dsh%% 
IDF (term frequency %%dsh%% inverse document frequency) [Baeza%%dsh%%Yates et al%%per%% 1999] scores of words in 
different articles in the Wikipedia corpus%%per%%]$~ ~$[As a result a word w1 is mapped to the concept vector 
CV (w1) = {(C1 
j represent Wikipedia concepts ]^[ V 1 
j 
are TF%%dsh%%IDF scores ]f[ the word w1 in those articles ]^[ are calculated as follows%%cln%% 
3 )%%lst%% %%per%%%%per%%%%per%%%%lst%% (C1 
M1)}%%per%%]$~ ~$[C1 
1 )%%lst%% (C1 
2 )%%lst%% (C1 
M1,V 1 
2,V 1 
1,V 1 
3,V 1 
j = T F IDF = (1 + log( f1%%lst%% j)) log( 
V 1 
N 
nt 
)%%lst%% 
(1) 
where T F is the log%%dsh%%normalized raw frequency ( f1%%lst%% j) of the word w1 in article j%%lst%% ]^[ IDF is the 
inverse document frequency%%lst%% N is the number of articles%%lst%% ]^[ nt is the number of articles in which 
the word w1 is present%%per%%]$~ 
~$[The algorithm was implemented in Python with application of the scikit%%dsh%%learn machine learning 
library [Pedregosa et al%%per%% 2011] ]^[ the resulting database was stored in a MongoDB collection%%per%%]$~ 
~$[Since some of the concept vectors might have tens of thousands of terms%%scn%% prior to storing%%lst%% we apply 
the pruning process [Gabrilovich ]^[ Markovitch 2009] that ]f[ each word keeps only important 
CV elements%%per%%]$~ ~$[The algorithm implementation needs tuning several parameters%%lst%% ]^[ in this process 
we also consult some of the existing implementations of the ESA algorithm%%per%%]$~ ~$[Our implementation of 
ESA is open%%dsh%%source ]^[ published on Github [Scepanovic 2016]%%per%% 
8%%per%%0%%per%%1%%per%%]$~ ~$[Word Semantic Relatedness%%per%%]$~ ~$[The semantic relatedness (SR) between words is ]n[ mea%%dsh%% 
sured directly%%lst%% ]b[ it is rather determined through a set of concepts highly related to them 
[Gabrilovich ]^[ Markovitch 2009%%scn%% Hieu et al%%per%% 2013]%%per%%]$~ ~$[Let us assume that the SR between words 
w1 ]^[ w2 is requested%%per%%]$~ ~$[The word SR calculation follows the two steps below%%per%% 
1,V 1 
2 )%%lst%% (C1 
1 )%%lst%% (C2 
Determining the corresponding CVs derived from Wikipedia ]f[ the words w1 ]^[ 
w2%%per%%]$~ ~$[The CVs are based on concepts (or articles) of Wikipedia which are related to 
the words%%per%%]$~ ~$[Let us assume that w1 
(tf%%dsh%%idf) vector%%cln%% CV (w1) = 
is mapped to concept 
{(C1 
M1)} ]^[ w2 is mapped to concept (tf%%dsh%%idf) vector%%cln%% 
1 )%%lst%% (C1 
%%per%%%%per%%%%per%%%%lst%% (C1 
M2)}%%per%%]$~ ~$[These are the sets of Wikipedia con%%dsh%% 
CV (w2) = {(C2 
3,V 2 
cepts%%lst%% C1 
j ]^[ V 2 
j ]^[ C2 
j %%lst%% 
respectively%%per%%]$~ ~$[In the following%%lst%% we will assume that N is the number of common concepts in CV (w1) 
]^[ CV (w2)%%per%% 
2,V 1 
1,V 2 
j %%lst%% which are related to the word w1 ]^[ w2 ]^[ their TF%%dsh%%IDF scores%%lst%% V 1 
M1,V 1 
3 )%%lst%% %%per%%%%per%%%%per%%%%lst%% (C2 
3,V 1 
3 )%%lst%% 
2 )%%lst%% (C2 
2,V 2 
Calculating the SR between words using cosine similarity between obtained CVs%%per%%]$~ ~$[For mea%%dsh%% 
suring the degree of semantic relatedness%%lst%% cosine similarity between the CV s ]f[ two words w1 
]^[ w2 is calculated%%per%%]$~ ~$[This measure gives the cosine of the angle between the two vectors CV (w1) 
M2,V 2 
A:32 
S%%per%%]$~ ~$[S cepanovi c et al%%per%% 
]^[ CV (w2)%%per%%]$~ ~$[The cosine measure can be re%%dsh%%formulated ]f[ our purpose as follows%%cln%% 
SR(w1,w2) = cos(CV (w1),CV (w2)) = 
%%lst%% 
(2) 
(cid:113) 
M1 
k=1 
N 
i=1V 1 
(cid:0)V 1 
k 
(cid:1)2 (cid:113) 
i V 2 
i 
M2 
l=1 
(cid:1)2 
(cid:0)V 2 
l 
where i iterates over the common concepts%%per%%]$~ 
~$[The SR(w1,w2) values range from 0 (i%%per%%e%%per%%%%lst%% no semantic relatedness) to 1 (i%%per%%e%%per%%%%lst%% perfect semantic relat%%dsh%% 
edness) as the TF%%dsh%%IDF weights can ]n[ be negative%%per%% 
1 V 1 
M%%lst%% (v1 
1 V 1 
1 ,v2 
1)%%lst%% (t2 
2%%lst%% (v1 
1 V 1 
1 ) = {(C1 
2 ))%%lst%% (C1 
3%%lst%% (v1 
3 )) %%lst%% %%per%%%%per%%%%per%%%%lst%% (C1 
2 ,v1 
2)%%lst%% (t1 
3)%%lst%% %%per%%%%per%%%%per%%%%lst%% (t2 
3 ,v1 
n ,v2 
1 ,v1 
2)%%lst%% (t2 
1)%%lst%% (t1 
3 ,v2 
8%%per%%0%%per%%2%%per%%]$~ ~$[Document Semantic Relatedness%%per%%]$~ ~$[The semantic relatedness (SR) between documents is 
measured through the SR of the words found in the documents%%per%%]$~ ~$[Let us assume that the SR between 
documents d1 ]^[ d2 is requested%%per%%]$~ ~$[The document SR calculation follows the three steps below%%per%%]$~ 
~$[Analyzing documents using the term frequency (TF) approach which nds the frequency of 
words in the document%%per%%]$~ ~$[The result of this step is a list of important words with their correspond%%dsh%% 
ing TF scores%%per%%]$~ ~$[Let us assume that%%cln%% 
d1 is analyzed to term (tf) vector%%cln%% T (d1) = {(t1 
d2 to term (tf) vector%%cln%% T (d2) = {(t2 
2 ,v2 
Determining the corresponding CVs derived from Wikipedia ]f[ the documents d1 ]^[ d2%%per%%]$~ 
~$[For each term in the lists T (d1) ]^[ T (d2) we derive their individual CV s (as described ]f[ words in 
1 
Section 8%%per%%0%%per%%1)%%per%%]$~ ~$[For instance%%lst%% the t1 
1%%lst%% (v1 
M))}%%per%%]$~ ~$[The other terms in T (d1) can be 
V 1 
1 ))%%lst%% (C1 
represented in a similar way%%per%%]$~ ~$[When summarizing the CV s ]f[ one document%%lst%% the CV ]f[ each term 
is multiplied with its TF score in the document (found in the previous step)%%per%%]$~ ~$[If the terms in T (d1) 
have the same concepts in their CV s%%lst%% we sum the weighted TF%%dsh%%IDF scores of those concepts%%per%%]$~ 
~$[After this process we obtain CV (d1)%%lst%% the list of Wikipedia concepts ]^[ TF%%dsh%%IDF scores which 
are related to all the terms in T (d1)%%per%%]$~ ~$[Similarly%%lst%% ]f[ d2 the list of relevant Wikipedia concepts ]^[ 
TF%%dsh%%IDF scores is found in CV (d2)%%per%% 
1 term is mapped to concept (tf%%dsh%%idf) vector%%cln%% CV (t1 
m)}%%lst%% 
3)%%lst%% %%per%%%%per%%%%per%%%%lst%% (t1 
m,v1 
n)}%%lst%% ]^[ m < n%%per%%]$~ 
~$[Calculating the SR between documents using cosine similarity between obtained CVs%%per%%]$~ ~$[Fi%%dsh%% 
nally%%lst%% we obtain the SR(d1,d2) between documents by calculating the cosine similarity of CV (d1) 
]^[ CV (d2) (see Eq%%per%% 2)%%per%% 
8%%per%%0%%per%%3%%per%%]$~ ~$[SR database evaluation%%per%%]$~ ~$[The English version of Wikipedia used includes over 2%%per%%5 million 
articles%%per%%]$~ ~$[Since many of the articles are highly specialized%%lst%% ]^[ due to the described pruning process%%lst%% 
we nd only around 15% of those articles (387,992) relevant ]f[ our tweets corpus%%per%%]$~ ~$[In a similar 
manner as in the original paper [Gabrilovich ]^[ Markovitch 2009]%%lst%% we evaluate the quality of the 
SR database that we built against available datasets with human judgment ]f[ word pairs relatedness%%per%%]$~ 
~$[We use several such datasets available online%%lst%% as one of the most comprehensive current resources 
[Faruqui ]^[ Dyer 2014]%%per%%]$~ ~$[The results of the evaluation are presented in Table IX%%per%%]$~ ~$[We do ]n[ provide 
herein a comparison with the existing implementations%%lst%% since ]n[ all of them provide their evaluation 
on the same datasets with human judgments%%lst%% ]^[ since a previous study comparing them has shown 
that some of these results are incompatible [Cramer 2008]%%per%%]$~ ~$[However%%lst%% our evaluation scores are 
comparable to the original implementation [Gabrilovich ]^[ Markovitch 2009] ]^[ to the ESA 
implementations available online%%per%%]$~ 
~$[ACKNOWLEDGMENTS 
S%%per%%]$~ ~$[S%%per%% research was partially nanced by CIVIS EU FP7 project (FP7%%dsh%% SMARTCITIES%%dsh%%2013)%%per%%]$~ ~$[I%%per%%M%%per%% work was partially %%dsh%% 
nanced by the Faculty of Computer Science ]^[ Engineering at the University Ss%%per%%]$~ ~$[Cyril ]^[ Methodius %%per%%]$~ ~$[S%%per%%]$~ ~$[S%%per%% ]^[ I%%per%%M%%per%% 
also gratefully acknowledge the CyberTrust research project ]f[ their support%%per%%]$~ ~$[B%%per%%G%%per%% thanks the Moore ]^[ Sloan Foundations 
Semantic homophily in online communication%%cln%% evidence from Twitter 
A:33 
Table IX%%cln%% SR knowledge database evaluation 
Human judgments dataset 
WordSim%%dsh%%353 
Miller ]^[ Charles 
Word pair similarity%%lst%% MTurk 
Rubenstein ]^[ Goodenough 
MEN dataset of word pair sim%%per%%]$~ 
~$[Average 
Spearman s rank Pearson s correlation 
0%%per%%51 
0%%per%%79 
0%%per%%53 
0%%per%%81 
0%%per%%73 
0%%per%%67 
0%%per%%45 
0%%per%%82 
0%%per%%45 
0%%per%%74 
0%%per%%44 
0%%per%%58 
]f[ support as part of the Moore%%dsh%%Sloan Data Science Environment at New York University%%per%%]$~ ~$[P%%per%%H%%per%% thanks General Research 
Fund 26211515 from the Research Grants Council of Hong Kong%%per%%]$~ ~$[S%%per%%]$~ ~$[S%%per%% thanks A%%per%%]$~ ~$[Ukkonen ]f[ the help with the SR database 
implementation%%per%%]$~ ~$[S%%per%%]$~ ~$[S%%per%% also acknowledges collaboration with P%%per%%]$~ ~$[T%%per%%]$~ ~$[Trung during his MSc thesis project when we performed a 
similar type of SR analysis on Twitter data%%per%%]$~ ~$[The authors also thank A%%per%%]$~ ~$[Gionis ]f[ the helpful discussion ]^[ ]f[ reviewing the 
manuscript%%per%%]$~ 
~$[REFERENCES 
Luca Maria Aiello%%lst%% Alain Barrat%%lst%% Rossano Schifanella%%lst%% Ciro Cattuto%%lst%% Benjamin Markines%%lst%% ]^[ Filippo Menczer%%per%% 2012%%per%%]$~ ~$[Friend%%dsh%% 
ship prediction ]^[ homophily in social media%%per%%]$~ ~$[ACM Transactions on the Web (TWEB) 6%%lst%% 2 (2012)%%lst%% 9%%per%%]$~ 
~$[An IBM Company%%per%% 2016%%per%%]$~ ~$[AlchemyAPI ]^[ IBM Watson%%per%% (January 2016)%%per%% http://www%%per%%alchemyapi%%per%%com/api 
Aris Anagnostopoulos%%lst%% Ravi Kumar%%lst%% ]^[ Mohammad Mahdian%%per%% 2008%%per%%]$~ ~$[In uence ]^[ correlation in social networks%%per%%]$~ ~$[In Pro%%dsh%% 
ceedings of the 14th ACM SIGKDD international conference on Knowledge discovery ]^[ data mining%%per%%]$~ ~$[ACM%%lst%% 7 15%%per%%]$~ 
~$[Sinan Aral%%lst%% Lev Muchnik%%lst%% ]^[ Arun Sundararajan%%per%% 2009%%per%%]$~ ~$[Distinguishing in uence%%dsh%%based contagion from homophily%%dsh%%driven 
diffusion in dynamic networks%%per%%]$~ ~$[Proceedings of the National Academy of Sciences 106%%lst%% 51 (2009)%%lst%% 21544 21549%%per%%]$~ 
~$[Sinan Aral ]^[ Dylan Walker%%per%% 2012%%per%%]$~ ~$[Identifying in uential ]^[ susceptible members of social networks%%per%%]$~ ~$[Science 337%%lst%% 6092 
(2012)%%lst%% 337 341%%per%%]$~ 
~$[Ricardo Baeza%%dsh%%Yates%%lst%% Berthier Ribeiro%%dsh%%Neto%%lst%% ]^[ others%%per%% 1999%%per%%]$~ ~$[Modern information retrieval%%per%%]$~ ~$[Vol%%per%% 463%%per%%]$~ ~$[ACM press New 
York%%per%%]$~ 
~$[Eytan Bakshy%%lst%% Itamar Rosenn%%lst%% Cameron Marlow%%lst%% ]^[ Lada Adamic%%per%% 2012%%per%%]$~ ~$[The role of social networks in information diffu%%dsh%% 
sion%%per%%]$~ ~$[In Proceedings of the 21st international conference on World Wide Web%%per%%]$~ ~$[ACM%%lst%% 519 528%%per%%]$~ 
~$[George A Barnett ]^[ Grace A Bene eld%%per%% 2015%%per%%]$~ ~$[Predicting international Facebook ties through cultural homophily ]^[ other 
factors%%per%%]$~ ~$[New Media & Society (2015)%%lst%% 1461444815604421%%per%%]$~ 
~$[Mathieu Bastian%%lst%% Sebastien Heymann%%lst%% ]^[ Mathieu Jacomy%%per%% 2009%%per%%]$~ ~$[Gephi%%cln%% An Open Source Software ]f[ Exploring ]^[ 
Manipulating Networks%%per%% (2009)%%per%% http://www%%per%%aaai%%per%%org/ocs/index%%per%%php/ICWSM/09/paper/view/154 
Steven Bird%%lst%% Ewan Klein%%lst%% ]^[ Edward Loper%%per%% 2009%%per%%]$~ ~$[Natural language processing with Python%%per%%]$~ ~$[O Reilly Media%%lst%% Inc%%per%% %%per%%]$~ 
~$[Catherine A Bliss%%lst%% Isabel M Kloumann%%lst%% Kameron Decker Harris%%lst%% Christopher M Danforth%%lst%% ]^[ Peter Sheridan Dodds%%per%% 2012%%per%%]$~ 
~$[Twitter reciprocal reply networks exhibit assortativity with respect to happiness%%per%%]$~ ~$[Journal of Computational Science 3%%lst%% 5 
(2012)%%lst%% 388 397%%per%%]$~ 
~$[Per Block ]^[ Thomas Grund%%per%% 2014%%per%%]$~ ~$[Multidimensional homophily in friendship networks%%per%%]$~ ~$[Network Science 2%%lst%% 02 (2014)%%lst%% 
189 212%%per%%]$~ 
~$[A:34 
S%%per%%]$~ ~$[S cepanovi c et al%%per%%]$~ 
~$[Vincent Blondel%%lst%% Gautier Krings%%lst%% Isabelle Thomas%%lst%% ]^[ others%%per%% 2010%%per%%]$~ ~$[Regions ]^[ borders of mobile telephony in Belgium 
]^[ in the Brussels metropolitan zone%%per%%]$~ ~$[Brussels Studies (2010)%%per%%]$~ 
~$[Vincent D Blondel%%lst%% Jean%%dsh%%Loup Guillaume%%lst%% Renaud Lambiotte%%lst%% ]^[ Etienne Lefebvre%%per%% 2008%%per%%]$~ ~$[Fast unfolding of communities 
in large networks%%per%%]$~ ~$[Journal of statistical mechanics%%cln%% theory ]^[ experiment 2008%%lst%% 10 (2008)%%lst%% P10008%%per%%]$~ 
~$[Johan Bollen%%lst%% Bruno Gonc alves%%lst%% Guangchen Ruan%%lst%% ]^[ Huina Mao%%per%% 2011%%per%%]$~ ~$[Happiness is assortative in online social networks%%per%%]$~ 
~$[Arti cial life 17%%lst%% 3 (2011)%%lst%% 237 251%%per%%]$~ 
~$[Pierre Bourdieu%%per%% 2011%%per%%]$~ ~$[The forms of capital%%per%%(1986)%%per%%]$~ ~$[Cultural theory%%cln%% An anthology (2011)%%lst%% 81 93%%per%%]$~ 
~$[Ronald S Burt%%per%% 2000%%per%%]$~ ~$[Decay functions%%per%%]$~ ~$[Social networks 22%%lst%% 1 (2000)%%lst%% 1 28%%per%%]$~ 
~$[Michael Conover%%lst%% Jacob Ratkiewicz%%lst%% Matthew R Francisco%%lst%% Bruno Gonc alves%%lst%% Filippo Menczer%%lst%% ]^[ Alessandro Flammini%%per%% 
2011%%per%%]$~ ~$[Political polarization on twitter%%per%%]$~ ~$[ICWSM 133 (2011)%%lst%% 89 96%%per%%]$~ 
~$[Irene Cramer%%per%% 2008%%per%%]$~ ~$[How well do semantic relatedness measures perform?%%cln%% a meta%%dsh%%study%%per%%]$~ ~$[In Proceedings of the 2008 Con%%dsh%% 
ference on Semantics in Text Processing%%per%%]$~ ~$[Association ]f[ Computational Linguistics%%lst%% 59 70%%per%%]$~ 
~$[David Crandall%%lst%% Dan Cosley%%lst%% Daniel Huttenlocher%%lst%% Jon Kleinberg%%lst%% ]^[ Siddharth Suri%%per%% 2008%%per%%]$~ ~$[Feedback effects between sim%%dsh%% 
ilarity ]^[ social in uence in online communities%%per%%]$~ ~$[In Proceedings of the 14th ACM SIGKDD international conference 
on Knowledge discovery ]^[ data mining%%per%%]$~ ~$[ACM%%lst%% 160 168%%per%%]$~ 
~$[Munmun De Choudhury%%per%% 2011%%per%%]$~ ~$[Tie Formation on Twitter%%cln%% Homophily ]^[ Structure of Egocentric Networks%%per%% 2011 IEEE 
Third Int l Conference on Privacy%%lst%% Security%%lst%% Risk ]^[ Trust ]^[ 2011 IEEE Third Int l Conference on Social Computing 
(Oct%%per%% 2011)%%lst%% 465 470%%per%%]$~ ~$[DOI:http://dx%%per%%doi%%per%%org/10%%per%%1109/PASSAT/SocialCom%%per%%2011%%per%%177 
Munmun De Choudhury%%lst%% Hari Sundaram%%lst%% Ajita John%%lst%% Doree Duncan Seligmann%%lst%% ]^[ Aisling Kelliher%%per%% 2010%%per%%]$~ ~$[Birds of 
a Feather %%cln%% Does User Homophily Impact Information Diffusion in Social Media? arXiv preprint arXiv:1006%%per%%1702 
(2010)%%per%%]$~ 
~$[Young%%dsh%%Ho Eom ]^[ Hang%%dsh%%Hyun Jo%%per%% 2014%%per%%]$~ ~$[Generalized friendship paradox in complex networks%%cln%% The case of scienti c 
collaboration%%per%%]$~ ~$[Scienti c reports 4 (2014)%%per%%]$~ 
~$[Ernesto Estrada%%per%% 2011%%per%%]$~ ~$[Combinatorial study of degree assortativity in networks%%per%%]$~ ~$[Physical Review E 84%%lst%% 4 (2011)%%lst%% 047101%%per%%]$~ 
~$[Manaal Faruqui ]^[ Chris Dyer%%per%% 2014%%per%%]$~ ~$[Community Evaluation ]^[ Exchange of Word Vectors at wordvectors%%per%%org%%per%%]$~ ~$[In Pro%%dsh%% 
ceedings of the 52nd Annual Meeting of the Association ]f[ Computational Linguistics%%cln%% System Demonstrations%%per%%]$~ ~$[Asso%%dsh%% 
ciation ]f[ Computational Linguistics%%lst%% Baltimore%%lst%% USA%%per%%]$~ 
~$[Scott L Feld%%per%% 1981%%per%%]$~ ~$[The focused organization of social ties%%per%%]$~ ~$[American journal of sociology (1981)%%lst%% 1015 1035%%per%%]$~ 
~$[Diane Felmlee%%lst%% Susan Sprecher%%lst%% ]^[ Edward Bassin%%per%% 1990%%per%%]$~ ~$[The dissolution of intimate relationships%%cln%% A hazard model%%per%%]$~ ~$[Social 
Psychology Quarterly (1990)%%lst%% 13 30%%per%%]$~ 
~$[Evgeniy Gabrilovich ]^[ Shaul Markovitch%%per%% 2007%%per%%]$~ ~$[Computing semantic relatedness using wikipedia%%dsh%%based explicit semantic 
analysis%%per%%%%per%%]$~ ~$[In IJCAI%%lst%% Vol%%per%% 7%%per%% 1606 1611%%per%%]$~ 
~$[Evgeniy Gabrilovich ]^[ Shaul Markovitch%%per%% 2009%%per%%]$~ ~$[Wikipedia%%dsh%%based semantic interpretation ]f[ natural language processing%%per%%]$~ 
~$[Journal of Arti cial Intelligence Research (2009)%%lst%% 443 498%%per%%]$~ 
~$[Giuseppe Attardi%%per%% 2015%%per%%]$~ ~$[Wikipedia Extractor%%per%% (April 2015)%%per%% https://github%%per%%com/attardi/wikiextractor 
Mark S Granovetter%%per%% 1973%%per%%]$~ ~$[The strength of weak ties%%per%%]$~ ~$[American journal of sociology 78%%lst%% 6 (1973)%%lst%% 1360 1380%%per%%]$~ 
~$[Yosh Halberstam ]^[ Brian Knight%%per%% 2014%%per%%]$~ ~$[Homophily%%lst%% group size%%lst%% ]^[ the diffusion of political information in social net%%dsh%% 
works%%cln%% Evidence from twitter%%per%%]$~ ~$[Technical Report%%per%%]$~ ~$[National Bureau of Economic Research%%per%%]$~ 
~$[Semantic homophily in online communication%%cln%% evidence from Twitter 
A:35 
Sebastien Harispe%%lst%% Sylvie Ranwez%%lst%% Stefan Janaqi%%lst%% ]^[ Jacky Montmain%%per%% 2015%%per%%]$~ ~$[Semantic similarity from natural language 
]^[ ontology analysis%%per%%]$~ ~$[Synthesis Lectures on Human Language Technologies 8%%lst%% 1 (2015)%%lst%% 1 254%%per%%]$~ 
~$[Nguyen Trung Hieu%%lst%% Mario Di Francesco%%lst%% ]^[ Antti Yl a%%dsh%%J a aski%%per%% 2013%%per%%]$~ ~$[Extracting knowledge from wikipedia articles through 
distributed semantic analysis%%per%%]$~ ~$[In Proceedings of the 13th International Conference on Knowledge Management ]^[ 
Knowledge Technologies%%per%%]$~ ~$[ACM%%lst%% 6%%per%%]$~ 
~$[Clayton J Hutto ]^[ Eric Gilbert%%per%% 2014%%per%%]$~ ~$[Vader%%cln%% A parsimonious rule%%dsh%%based model ]f[ sentiment analysis of social media text%%per%%]$~ 
~$[In Eighth International AAAI Conference on Weblogs ]^[ Social Media%%per%%]$~ 
~$[Juhi Kulshrestha%%lst%% Farshad Kooti%%lst%% Ashkan Nikravesh%%lst%% ]^[ P Krishna Gummadi%%per%% 2012%%per%%]$~ ~$[Geographic Dissection of the Twitter 
Network%%per%%%%per%%]$~ ~$[In ICWSM%%per%%]$~ 
~$[Haewoon Kwak%%lst%% Changhyun Lee%%lst%% Hosung Park%%lst%% ]^[ Sue Moon%%per%% 2010%%per%%]$~ ~$[What is Twitter%%lst%% a social network ]v[ a news media?%%per%%]$~ 
~$[In Proceedings of the 19th international conference on World wide web%%per%%]$~ ~$[ACM%%lst%% 591 600%%per%%]$~ 
~$[Timothy La Fond ]^[ Jennifer Neville%%per%% 2010%%per%%]$~ ~$[Randomization tests ]f[ distinguishing social in uence ]^[ homophily effects%%per%%]$~ 
~$[In Proceedings of the 19th international conference on World wide web%%per%%]$~ ~$[ACM%%lst%% 601 610%%per%%]$~ 
~$[Paul F Lazarsfeld ]^[ Robert K Merton%%per%% 1954%%per%%]$~ ~$[Friendship as a social process%%cln%% A substantive ]^[ methodological analysis%%per%%]$~ 
~$[Freedom ]^[ control in modern society 18 (1954)%%lst%% 18 66%%per%%]$~ 
~$[RTAJ Leenders%%per%% 1997%%per%%]$~ ~$[Longitudinal behavior of network structure ]^[ actor attributes%%cln%% modeling interdependence of conta%%dsh%% 
gion ]^[ selection%%per%%]$~ ~$[Evolution of social networks 1 (1997)%%per%%]$~ 
~$[Adrienne Lehrer ]^[ Keith Lehrer%%per%% 1982%%per%%]$~ ~$[Antonymy%%per%%]$~ ~$[Linguistics ]^[ philosophy 5%%lst%% 4 (1982)%%lst%% 483 501%%per%%]$~ 
~$[Gerhard E Lenski%%per%% 1954%%per%%]$~ ~$[Status crystallization%%cln%% a non%%dsh%%vertical dimension of social status%%per%%]$~ ~$[American sociological review 19%%lst%% 4 
(1954)%%lst%% 405 413%%per%%]$~ 
~$[Jure Leskovec ]^[ Eric Horvitz%%per%% 2008%%per%%]$~ ~$[Planetary%%dsh%%scale views on a large instant%%dsh%%messaging network%%per%%]$~ ~$[In Proceedings of the 
17th international conference on World Wide Web%%per%%]$~ ~$[ACM%%lst%% 915 924%%per%%]$~ 
~$[Clement Levallois%%per%% 2013%%per%%]$~ ~$[Umigon%%cln%% sentiment analysis ]f[ tweets based on terms lists ]^[ heuristics%%per%%]$~ ~$[In Second Joint Confer%%dsh%% 
ence on Lexical ]^[ Computational Semantics (* SEM)%%lst%% Vol%%per%% 2%%per%% 414 417%%per%%]$~ 
~$[James R Lincoln ]^[ Jon Miller%%per%% 1979%%per%%]$~ ~$[Work ]^[ friendship ties in organizations%%cln%% A comparative analysis of relation net%%dsh%% 
works%%per%%]$~ ~$[Administrative science quarterly (1979)%%lst%% 181 199%%per%%]$~ 
~$[Frank J Massey Jr%%per%% 1951%%per%%]$~ ~$[The Kolmogorov%%dsh%%Smirnov test ]f[ goodness of t%%per%%]$~ ~$[Journal of the American statistical Association 
46%%lst%% 253 (1951)%%lst%% 68 78%%per%%]$~ 
~$[M McPherson%%lst%% L Smith%%dsh%%Lovin%%lst%% ]^[ JM Cook%%per%% 2001%%per%%]$~ ~$[Birds of a feather%%cln%% Homophily in social networks%%per%%]$~ ~$[Annual review of 
sociology 27%%lst%% 2001 (2001)%%lst%% 415 444%%per%% http://www%%per%%jstor%%per%%org/stable/10%%per%%2307/2678628 
Kevin Meehan%%lst%% Tom Lunney%%lst%% Kevin Curran%%lst%% ]^[ Aiden McCaughey%%per%% 2013%%per%%]$~ ~$[Context%%dsh%%aware intelligent recommendation system 
]f[ tourism%%per%%]$~ ~$[In Pervasive Computing ]^[ Communications Workshops (PERCOM Workshops)%%lst%% 2013 IEEE International 
Conference on%%per%%]$~ ~$[IEEE%%lst%% 328 331%%per%%]$~ 
~$[Folke Mitzlaff%%lst%% Martin Atzmueller%%lst%% Andreas Hotho%%lst%% ]^[ Gerd Stumme%%per%% 2014%%per%%]$~ ~$[The social distributional hypothesis%%cln%% a prag%%dsh%% 
matic proxy ]f[ homophily in online social networks%%per%%]$~ ~$[Social Network Analysis ]^[ Mining 4%%lst%% 1 (2014)%%lst%% 1 14%%per%%]$~ 
~$[M Lynne Murphy%%per%% 2003%%per%%]$~ ~$[Semantic relations ]^[ the lexicon%%cln%% antonymy%%lst%% synonymy ]^[ other paradigms%%per%%]$~ ~$[Cambridge Univer%%dsh%% 
sity Press%%per%%]$~ 
~$[Seth A Myers%%lst%% Aneesh Sharma%%lst%% Pankaj Gupta%%lst%% ]^[ Jimmy Lin%%per%% 2014%%per%%]$~ ~$[Information network ]v[ social network?%%cln%% the structure 
of the twitter follow graph%%per%%]$~ ~$[In Proceedings of the 23rd International Conference on World Wide Web%%per%%]$~ ~$[ACM%%lst%% 493 498%%per%%]$~ 
~$[A:36 
S%%per%%]$~ ~$[S cepanovi c et al%%per%%]$~ 
~$[Mark EJ Newman%%per%% 2003%%per%%]$~ ~$[Mixing patterns in networks%%per%%]$~ ~$[Physical Review E 67%%lst%% 2 (2003)%%lst%% 026126%%per%%]$~ 
~$[Mark EJ Newman%%per%% 2006%%per%%]$~ ~$[Modularity ]^[ community structure in networks%%per%%]$~ ~$[Proceedings of the national academy of sciences 
103%%lst%% 23 (2006)%%lst%% 8577 8582%%per%%]$~ 
~$[Mark EJ Newman ]^[ Juyong Park%%per%% 2003%%per%%]$~ ~$[Why social networks are different from other types of networks%%per%%]$~ ~$[Physical Review 
E 68%%lst%% 3 (2003)%%lst%% 036122%%per%%]$~ 
~$[M%%per%%]$~ ~$[E%%per%%]$~ ~$[J%%per%%]$~ ~$[Newman%%per%% 2002%%per%%]$~ ~$[Assortative Mixing in Networks%%per%%]$~ ~$[Phys%%per%%]$~ ~$[Rev%%per%%]$~ ~$[Lett%%per%% 89 (Oct 2002)%%lst%% 208701%%per%%]$~ ~$[Issue 20%%per%%]$~ 
~$[DOI:http://dx%%per%%doi%%per%%org/10%%per%%1103/PhysRevLett%%per%%89%%per%%208701 
Hans Noel ]^[ Brendan Nyhan%%per%% 2011%%per%%]$~ ~$[The unfriending problem%%cln%% The consequences of homophily in friendship retention ]f[ 
causal estimates of social in uence%%per%%]$~ ~$[Social Networks 33%%lst%% 3 (2011)%%lst%% 211 218%%per%%]$~ 
~$[F%%per%%]$~ ~$[Pedregosa%%lst%% G%%per%%]$~ ~$[Varoquaux%%lst%% A%%per%%]$~ ~$[Gramfort%%lst%% V%%per%%]$~ ~$[Michel%%lst%% B%%per%%]$~ ~$[Thirion%%lst%% O%%per%%]$~ ~$[Grisel%%lst%% M%%per%%]$~ ~$[Blondel%%lst%% P%%per%%]$~ ~$[Prettenhofer%%lst%% R%%per%%]$~ ~$[Weiss%%lst%% V%%per%%]$~ 
~$[Dubourg%%lst%% J%%per%%]$~ ~$[Vanderplas%%lst%% A%%per%%]$~ ~$[Passos%%lst%% D%%per%%]$~ ~$[Cournapeau%%lst%% M%%per%%]$~ ~$[Brucher%%lst%% M%%per%%]$~ ~$[Perrot%%lst%% ]^[ E%%per%%]$~ ~$[Duchesnay%%per%% 2011%%per%%]$~ ~$[Scikit%%dsh%%learn%%cln%% 
Machine Learning in Python%%per%%]$~ ~$[Journal of Machine Learning Research 12 (2011)%%lst%% 2825 2830%%per%%]$~ 
~$[Mahendra Piraveenan%%lst%% Mikhail Prokopenko%%lst%% ]^[ Albert Zomaya%%per%% 2012%%per%%]$~ ~$[Assortative mixing in directed biological networks%%per%%]$~ 
~$[IEEE/ACM Transactions on Computational Biology ]^[ Bioinformatics (TCBB) 9%%lst%% 1 (2012)%%lst%% 66 78%%per%%]$~ 
~$[Barbara Poblete%%lst%% Ruth Garcia%%lst%% Marcelo Mendoza%%lst%% ]^[ Alejandro Jaimes%%per%% 2011%%per%%]$~ ~$[Do all birds tweet the same?%%cln%% characterizing 
twitter around the world%%per%%]$~ ~$[In Proceedings of the 20th ACM international conference on Information ]^[ knowledge 
management%%per%%]$~ ~$[ACM%%lst%% 1025 1030%%per%%]$~ 
~$[Alejandro Portes%%per%% 2000%%per%%]$~ ~$[Social capital%%cln%% Its origins ]^[ applications in modern sociology%%per%%]$~ ~$[LESSER%%lst%% Eric L%%per%%]$~ ~$[Knowledge ]^[ 
Social Capital%%per%%]$~ ~$[Boston%%cln%% Butterworth%%dsh%%Heinemann (2000)%%lst%% 43 67%%per%%]$~ 
~$[Filipe N Ribeiro%%lst%% Matheus Ara ujo%%lst%% Pollyanna Gonc alves%%lst%% Marcos Andr e Gonc alves%%lst%% ]^[ Fabr cio Benevenuto%%per%% 2016%%per%%]$~ 
~$[SentiBench%%dsh%%a benchmark comparison of state%%dsh%%of%%dsh%%the%%dsh%%practice sentiment analysis methods%%per%%]$~ ~$[EPJ Data Science 5%%lst%% 1 (2016)%%lst%% 
1 29%%per%%]$~ 
~$[Giuseppe Rizzo ]^[ Rapha el Troncy%%per%% 2011%%per%%]$~ ~$[Nerd%%cln%% evaluating named entity recognition tools in the web of data%%per%% (2011)%%per%%]$~ 
~$[Everett M Rogers ]^[ Dilip K Bhowmik%%per%% 1970%%per%%]$~ ~$[Homophily%%dsh%%heterophily%%cln%% Relational concepts ]f[ communication research%%per%%]$~ 
~$[Public opinion quarterly 34%%lst%% 4 (1970)%%lst%% 523 538%%per%%]$~ 
~$[Martin Rosvall ]^[ Carl T Bergstrom%%per%% 2008%%per%%]$~ ~$[Maps of random walks on complex networks reveal community structure%%per%%]$~ 
~$[Proceedings of the National Academy of Sciences 105%%lst%% 4 (2008)%%lst%% 1118 1123%%per%%]$~ 
~$[Camille Roth%%per%% 2005%%per%%]$~ ~$[Generalized preferential attachment%%cln%% Towards realistic socio%%dsh%%semantic network models%%per%%]$~ ~$[In ISWC 4th 
Intl Semantic Web Conference%%lst%% Workshop on Semantic Network Analysis%%lst%% Vol%%per%% 171%%per%% 1613 0073%%per%%]$~ 
~$[Camille Roth ]^[ Jean%%dsh%%Philippe Cointet%%per%% 2010%%per%%]$~ ~$[Social ]^[ semantic coevolution in knowledge networks%%per%%]$~ ~$[Social Networks 32%%lst%% 
1 (2010)%%lst%% 16 29%%per%%]$~ 
~$[Hassan Saif%%lst%% Yulan He%%lst%% ]^[ Harith Alani%%per%% 2012%%per%%]$~ ~$[Semantic sentiment analysis of twitter%%per%%]$~ ~$[In International Semantic Web 
Conference%%per%%]$~ ~$[Springer%%lst%% 508 524%%per%%]$~ 
~$[Sanja Scepanovic%%per%% 2016%%per%%]$~ 
~$[DOI:http://dx%%per%%doi%%per%%org/{10%%per%%5281/zenodo%%per%%49750} 
Implementation of ESA algorithm ]f[ 
a Wikipedia SR database%%per%% 
(April 2016)%%per%%]$~ 
~$[Cosma Rohilla Shalizi ]^[ Andrew C Thomas%%per%% 2011%%per%%]$~ ~$[Homophily ]^[ contagion are generically confounded in observational 
social network studies%%per%%]$~ ~$[Sociological Methods & Research 40%%lst%% 2 (2011)%%lst%% 211 239%%per%%]$~ 
~$[Shujing Sun ]^[ Huaxia Rui%%per%% 2017%%per%%]$~ ~$[Link Formation on Twitter%%cln%% The Role of Achieved Status ]^[ Value Homophily%%per%%]$~ ~$[In 
Proceedings of the 50th Hawaii International Conference on System Sciences%%per%%]$~ 
~$[Semantic homophily in online communication%%cln%% evidence from Twitter 
A:37 
Jiliang Tang%%lst%% Huiji Gao%%lst%% Xia Hu%%lst%% ]^[ Huan Liu%%per%% 2013%%per%%]$~ ~$[Exploiting homophily effect ]f[ trust prediction%%per%%]$~ ~$[In Proceedings of the 
sixth ACM international conference on Web search ]^[ data mining%%per%%]$~ ~$[ACM%%lst%% 53 62%%per%%]$~ 
~$[Liyang Tang%%lst%% Zhiwei Ni%%lst%% Hui Xiong%%lst%% ]^[ Hengshu Zhu%%per%% 2015%%per%%]$~ ~$[Locating targets through mention in Twitter%%per%%]$~ ~$[World Wide Web 
18%%lst%% 4 (2015)%%lst%% 1019 1049%%per%%]$~ 
~$[Mike Thelwall%%per%% 2013%%per%%]$~ ~$[Heart ]^[ soul%%cln%% Sentiment strength detection in the social web with sentistrength%%per%%]$~ ~$[Proceedings of the 
CyberEmotions (2013)%%lst%% 1 14%%per%%]$~ 
~$[Crispin Thurlow%%lst%% Laura Lengel%%lst%% ]^[ Alice Tomic%%per%% 2004%%per%%]$~ ~$[Computer mediated communication%%per%%]$~ ~$[Sage%%per%%]$~ 
~$[Johan Ugander%%lst%% Brian Karrer%%lst%% Lars Backstrom%%lst%% ]^[ Cameron Marlow%%per%% 2011%%per%%]$~ ~$[The anatomy of the facebook social graph%%per%% 
arXiv preprint arXiv%%cln%% %%per%% %%per%% %%per%% (Nov%%per%% 2011)%%lst%% 17%%per%% http://arxiv%%per%%org/abs/1111%%per%%4503 
Christo Wilson%%lst%% Bryce Boe%%lst%% Alessandra Sala%%lst%% Krishna PN Puttaswamy%%lst%% ]^[ Ben Y Zhao%%per%% 2009%%per%%]$~ ~$[User interactions in social 
networks ]^[ their implications%%per%%]$~ ~$[In Proceedings of the 4th ACM European conference on Computer systems%%per%%]$~ ~$[Acm%%lst%% 
205 218%%per%%]$~ 
~$[Jaewon Yang ]^[ Jure Leskovec%%per%% 2012%%per%%]$~ ~$[Community%%dsh%%af liation graph model ]f[ overlapping network community detection%%per%%]$~ 
~$[In Data Mining (ICDM)%%lst%% 2012 IEEE 12th International Conference on%%per%%]$~ ~$[IEEE%%lst%% 1170 1175%%per%%]$~ 
~$[Jaewon Yang ]^[ Jure Leskovec%%per%% 2013%%per%%]$~ ~$[Overlapping community detection at scale%%cln%% a nonnegative matrix factorization ap%%dsh%% 
proach%%per%%]$~ ~$[In Proceedings of the sixth ACM international conference on Web search ]^[ data mining%%per%%]$~ ~$[ACM%%lst%% 587 596%%per%%]$~ 
~$[Jaewon Yang ]^[ Jure Leskovec%%per%% 2014%%per%%]$~ ~$[Overlapping communities explain core periphery organization of networks%%per%%]$~ ~$[Proc%%per%%]$~ 
~$[IEEE 102%%lst%% 12 (2014)%%lst%% 1892 1902%%per%%]$~ 
~$[Jaewon Yang ]^[ Jure Leskovec%%per%% 2015%%per%%]$~ ~$[De ning ]^[ evaluating network communities based on ground%%dsh%%truth%%per%%]$~ ~$[Knowledge 
]^[ Information Systems 42%%lst%% 1 (2015)%%lst%% 181 213%%per%%]$~ 
~$[Jaewon Yang%%lst%% Julian McAuley%%lst%% ]^[ Jure Leskovec%%per%% 2014%%per%%]$~ ~$[Detecting cohesive ]^[ 2%%dsh%%mode communities indirected ]^[ undi%%dsh%% 
rected networks%%per%%]$~ ~$[In Proceedings of the 7th ACM international conference on Web search ]^[ data mining%%per%%]$~ ~$[ACM%%lst%% 
323 332%%per%%]$~ 
~$[Mustafa Yavas ]^[ G onenc Y ucel%%per%% 2014%%per%%]$~ ~$[Impact of homophily on diffusion dynamics over social networks%%per%%]$~ ~$[Social Science 
Computer Review (2014)%%lst%% 0894439313512464%%per%%]$~ 
~$[Xiaohua Zeng ]^[ Liyuan Wei%%per%% 2013%%per%%]$~ ~$[Social ties ]^[ user content generation%%cln%% Evidence from Flickr%%per%%]$~ ~$[Information Systems 
Research 24%%lst%% 1 (2013)%%lst%% 71 87%%per%% 
