~$[Efficient Software—Based Fault Isolation 
Robert VVahbe 
Steven Lucco 
Thomas E%%per%%]$~ ~$[Anderson 
Susan L%%per%%]$~ ~$[Graham 
Computer Science Division 
University of California 
Berkeley%%lst%% CA 94720 
Abstract 
One way to provide fault isolation among cooperating 
software modules is to place each in its own address 
space%%per%%]$~ ~$[However%%lst%% for tightly—coupled modules%%lst%% this so— 
lution incurs prohibitive context switch overhead%%per%%]$~ ~$[In 
this paper%%lst%% we present a software approach to imple— 
menting fault isolation within a single address space%%per%%]$~ 
~$[Our approach has two parts%%per%%]$~ ~$[First%%lst%% we load the code 
]^[ data for a distrusted module into its own fault do%%dsh%% 
main%%lst%% a logically separate portion of the application’s 
address space%%per%%]$~ ~$[Second%%lst%% we modify the object code of a 
distrusted module to prevent it from writing ]v[ jump%%dsh%% 
ing to an address outside its fault domain%%per%%]$~ ~$[Both these 
software operations are portable ]^[ programming lan— 
guage independent%%per%%]$~ 
~$[Our approach poses a tradeoff relative to hardware 
fault isolation%%cln%% substantially faster communication be— 
tween fault domains%%lst%% at a cost of slightly increased 
execution time for distrusted modules We demon— 
strate that for frequently communicating modules%%lst%% im~ 
plementing fault isolation in software rather than hard%%dsh%% 
ware can substantially improve end%%dsh%%to—end application 
performance%%per%%]$~ 
~$[This work was supported in part by the National Sci— 
ence Foundation (CDA%%dsh%%8722788)%%lst%% Defense Advanced Research 
Projects Agency (DARPA) under grant MDA972—92%%dsh%%J%%dsh%%1028 ]^[ 
contracts DABT63%%dsh%%92%%sqt%%C%%dsh%%0026 ]^[ N00600%%dsh%%93—C—2481%%lst%% the Digi%%dsh%% 
tal Equipment Corporation (the Systems Research Center ]^[ 
the External Research Program)%%lst%% ]^[ the AT&T Foundation%%per%%]$~ 
~$[Anderson was also supported by a National Science Foundation 
Young Investigator Award%%per%%]$~ ~$[The content of the paper does not 
necessarily reﬂect the position ]v[ the policy of the Government 
]^[ no ofﬁcial endorsement should be inferred%%per%%]$~ 
~$[Email%%cln%% {rwahbe %%lst%% lucco%%lst%% tea%%lst%% graham}@cs %%per%%berkeley%%per%%edu 
Permission to copy Without fee all ]v[ part of (his material IS 
granted provided that Hie cvpies are %%dqt%%0‘ made 0! distributed for 
direct commercial advantage%%per%% the ACM copyright notice ]^[ the 
mile of the publicaiion ]^[ MS data appear%%lst%% ]^[ notice IS given 
that copying is by permissmn of (he Assomalion for Computing 
Machinery%%per%%]$~ ~$[To copy otherWise%%per%% ]v[ to republish%%lst%% requires a fee 
and/or specnfic permissron%%per%%]$~ 
~$[SIGOPS %%sqt%%93/12/93/N%%per%%C%%per%%%%lst%% USA 
31993 ACM 0%%dsh%%83791%%dsh%%632%%dsh%%8/93/0012%%per%%%%per%%%%per%%$L50 
1 Introduction 
Application programs often achieve extensibility by 
incorporating independently developed software mod— 
ules%%per%%]$~ ~$[However%%lst%% faults in extension code can render a 
software system unreliable%%lst%% ]v[ even dangerous%%lst%% since 
such faults could corrupt permanent data%%per%%]$~ ~$[To in— 
crease the reliability of these applications%%lst%% an operat— 
ing system can provide services that prevent faults in 
distrusted modules from corrupting application data%%per%%]$~ 
~$[Such fault isolation services also facilitate software de%%dsh%% 
velopment by helping to identify sources of system fail— 
ure%%per%%]$~ 
~$[For example%%lst%% the POSTGRES database manager in— 
cludes an extensible type system [St087]%%per%%]$~ ~$[Using this 
facility%%lst%% POSTGRES queries can refer to general—purpose 
code that deﬁnes constructors%%lst%% destructors%%lst%% ]^[ pred— 
icates for user—deﬁned data types such as geometric 
objects%%per%%]$~ ~$[Without fault isolation%%lst%% any query that uses 
extension code could interfere with an unrelated query 
]v[ corrupt the database%%per%%]$~ 
~$[Similarly%%lst%% recent operating system research has fo— 
cused on making it easier for third party vendors 
to enhance parts of the operating system%%per%%]$~ ~$[An ex 
ample is micro%%dsh%%kernel design%%scn%% parts of the operat— 
ing system are implemented as user—level servers that 
can be easily modiﬁed ]v[ replaced%%per%%]$~ ~$[More gener— 
ally%%lst%% several systems have added extension code into 
the operating system%%lst%% for example%%lst%% the BSD network 
packet ﬁlter [MRA87%%lst%% MJQ3]7 application—speciﬁc vir%%dsh%% 
tual memory management [HC92]%%per%% ]^[ Active Mes— 
sages [VCGSQQ]%%per%%]$~ ~$[Among industry systems%%lst%% Microsoft’s 
Object Linking ]^[ Embedding system [Cla92] can 
link together independently developed software mod— 
tiles%%per%%]$~ ~$[Also%%lst%% the Quark Xprese desktop publishing sys%%dsh%% 
tem [Dy592] is structured to support incorporation of 
general—purpose third party code%%per%%]$~ ~$[As with POSTGRES%%lst%% 
faults in extension modules can render any of these 
systems unreliable%%per%% %%per%%]$~ 
~$[One way to provide fault isolation among cooperat— 
ing software modules is to place each in its own address 
space%%per%%]$~ ~$[Using Remote Procedure Call (RFC) [BN84]%%lst%% 
modules in separate address spaces can call into each 
other through a normal procedure call interface%%per%%]$~ ~$[Hard%%dsh%% 
ware page tables prevent the code in one address space 
from corrupting the contents of another%%per%%]$~ 
~$[Unfortunately%%lst%% there is a high performance cost 
to providing fault isolation through separate address 
spaces%%per%%]$~ ~$[Transferring control across protection bound— 
aries is expensive%%lst%% ]^[ does not necessarily scale 
with improvements in a processor’s integer perforv 
mance [ALBL91]%%per%%]$~ ~$[A cross—address%%dsh%%space RPC requires 
at least%%cln%% a trap into the operating system kernel%%lst%% copy— 
ing each argument from the caller to the callee%%lst%% sav~ 
ing ]^[ restoring registers%%lst%% switching hardware ad— 
dress spaces (on many machines%%lst%% ﬂushing the transla— 
tion lookaside buffer)%%lst%% ]^[ a trap back to user level%%per%%]$~ 
~$[These operations must be repeated upon RPC re— 
turn%%per%%]$~ ~$[The execution time overhead of an RPC%%lst%% even 
with a highly optimized implementation%%lst%% will often 
be two to three orders of magnitude greater than 
the execution time overhead of a normal procedure 
call [BALL90%%lst%% ALBL91]%%per%%]$~ 
~$[The goal of our work is to make fault isolation cheap 
enough that system developers can ignore its perfor— 
mance effect in choosing which modules to place in 
separate fault domains%%per%%]$~ ~$[In many cases where fault iso 
lation would be useful%%lst%% cross%%dsh%%domain procedure calls 
are frequent yet involve only a moderate amount of 
computation per call%%per%%]$~ ~$[In this situation it is imprac%%dsh%% 
tical to isolate each logically separate module within 
its own address space%%lst%% because of the cost of crossing 
hardware protection boundaries%%per%%]$~ 
~$[We propose a%%per%% software approach to implementing 
fault isolation within a single address space%%per%%]$~ ~$[Our ap— 
proach has two parts%%per%%]$~ ~$[First%%lst%% we load the code ]^[ data 
for a%%per%% distrusted module into its own fault domain%%lst%% a 
logically separate portion of the application’s address 
space%%per%%]$~ ~$[A fault domain%%lst%% in addition to comprising a cori— 
tiguous region of memory within an address space%%lst%% has 
a unique identiﬁer which is used to control its access to 
process resources such as ﬁle descriptors%%per%%]$~ ~$[Second%%lst%% we 
modify the object code of a distrusted module to pre— 
vent it from writing ]v[ jumping to an address outside 
its fault domain%%per%%]$~ ~$[Program modules isolated in sepa— 
rate software—enforced fault domains can not modify 
each other’s data ]v[ execute each other’s code except 
through an explicit cross%%dsh%%fault%%dsh%%domain RPC interface%%per%%]$~ 
~$[We have identiﬁed several programming%%dsh%%language%%dsh%% 
independent transformation strategies that can render 
object code unable to escape its own code ]^[ data 
segments%%per%%]$~ ~$[In this paper%%lst%% we concentrate on a sim— 
204 
ple transformation technique%%lst%% called sandboxing%%lst%% that 
only slightly increases the execution time of the mod%%dsh%% 
iﬁed object code%%per%%]$~ ~$[We also investigate techniques that 
provide more debugging information ]b[ which incur 
greater execution time overhead%%per%%]$~ 
~$[Our approach poses a tradeoff relative to hardware— 
based fault isolation%%per%%]$~ ~$[Because we eliminate the need to 
cross hardware boundaries%%lst%% we can offer substantially 
lower%%dsh%%cost RPC between fault domains%%per%%]$~ ~$[A safe RPC in 
our prototype implementation takes roughly 1%%per%%1 us on a 
DECstation 5000/240 ]^[ roughly 0%%per%%8,us on a DEC Al%%dsh%% 
pha 400%%lst%% more than an order of magnitude faster than 
any existing RFC system%%per%%]$~ ~$[This reduction in RFC time 
comes at a cost of slightly increased distrusted module 
execution time%%per%%]$~ ~$[On a test suite including the the C 
SPE092 benchmarks%%lst%% sandboxing incurs an average of 
4% execution time overhead on both the DECstation 
]^[ the Alpha%%per%%]$~ 
~$[Software—enforced fault isolation may seem to be 
counter%%dsh%%intuitive%%cln%% we are slowing down the common 
case (normal execution) to speed up the uncommon 
case (crossrdomain communication)%%per%%]$~ ~$[But for fre%%dsh%% 
quently communicating fault domains%%lst%% our approach 
can offer substantially better end—to—end performance%%per%%]$~ 
~$[To demonstrate this%%lst%% we applied software—enforced 
fault isolation to the POSTGRES database system run%%dsh%% 
ning the Sequoia 2000 benchmark%%per%%]$~ ~$[The benchmark 
makes use of the POSTGRES extensible data%%per%% type sys— 
tem to deﬁne geometric operators%%per%%]$~ ~$[For this bench— 
mark%%lst%% the software approach reduced fault isolation 
overhead by more than a factor of three on a DECsta— 
tion 5000/240%%per%%]$~ 
~$[A software approach also provides a tradeoif be 
tween performance ]^[ level of distrust%%per%%]$~ ~$[If some mod— 
ules in a%%per%% program are trusted while others are dis%%dsh%% 
trusted (as may be the ease with extension code)%%lst%% only 
the distrusted modules incur any execution time over%%dsh%% 
head%%per%%]$~ ~$[Code in trusted domains can run at full speed%%per%%]$~ 
~$[Similarly%%lst%% it is possible to use our techniques to im%%dsh%% 
plement full security%%lst%% preventing distrusted code from 
even reading data outside of its domain%%lst%% at a cost of 
higher execution time overhead%%per%%]$~ ~$[We quantify this ef» 
fect in Section 5%%per%%]$~ 
~$[The remainder of the paper is organized as follows%%per%%]$~ 
~$[Section 2 provides some examples of systems that re%%dsh%% 
quire frequent communication between fault domains%%per%%]$~ 
~$[Section 3 outlines how we modify object code to pre— 
vent it from generating illegal addresses%%per%%]$~ ~$[Section 4 
describes how we implement low latency cross—faultv 
domain RPC%%per%%]$~ ~$[Section 5 presents performance results 
for our prototype%%lst%% ]^[ ﬁnally Section 6 discusses some 
related work%%per%% 
2 Background 
In this section%%lst%% we characterize in more detail the 
type of application that can beneﬁt from software— 
enforced fault isolation%%per%%]$~ ~$[We defer further description 
of the POSTGRES extensible type system until Section 
5%%lst%% which gives performance measurements for this ap— 
plication%%per%%]$~ 
~$[The operating systems community has focused con%%dsh%% 
siderable attention on supporting kernel extensibil%%dsh%% 
ity%%per%%]$~ ~$[For example%%lst%% the UNIX vnode interface is de%%dsh%% 
signed to make it easy to add a new ﬁle system into 
UNIX [Kle86]%%per%%]$~ ~$[Unfortunately%%lst%% it is too expensive to 
forward every ﬁle system operation to user level%%lst%% so 
typically new ﬁle system implementations are added 
directly into the kernel%%per%% (The Andrew ﬁle system is 
largely implemented at user level%%lst%% ]b[ it maintains a 
kernel cache for performance [HKM%%sqt%%l%%sqt%%BSH Epoch’s ter— 
tiary storage ﬁle system [Web93] is one example of op— 
erating system kernel code developed by a third party 
vendor%%per%%]$~ 
~$[Another example is user—programmable high perfor— 
mance I/O systems%%per%%]$~ ~$[If data is arriving on an I/O 
channel at a high enough rate%%lst%% performance will be 
degraded substantially if control has to be transferred 
to user level to manipulate the incoming data [FP93]%%per%%]$~ 
~$[Similarly%%lst%% Active Messages provide high performance 
message handling in distributed—memory multiproces%%dsh%% 
sors [VCG8921%%per%%]$~ ~$[Typically%%lst%% the message handlers are 
application%%dsh%%speciﬁc%%lst%% ]b[ unless the network controller 
can be accessed from user level [Thi92]%%lst%% the message 
handlers must be compiled into the kernel for reason— 
able performance%%per%%]$~ 
~$[A user%%dsh%%level example is the Quark Xpress desktop 
publishing system%%per%%]$~ ~$[One can purchase third party soft%%dsh%% 
ware that will extend this system to perform func~ 
tions unforeseen by its original designers [DysQQ]%%per%%]$~ ~$[At 
the same time%%lst%% this extensibility has caused Quark a 
number of problems%%per%%]$~ ~$[Because of the lack of efﬁcient 
fault domains on the personal computers where Quark 
Xpress runs%%lst%% extension modules can corrupt Quark’s 
internal data structures Hence%%lst%% bugs in third party 
code can make the Quark system appear unreliable%%lst%% 
because end—users do not distinguish among sources of 
system failure%%per%%]$~ 
~$[All these examples share two characteristics%%per%%]$~ ~$[First%%lst%% 
using hardware fault isolation would result in a signif%%dsh%% 
icant portion of the overall execution time being spent 
in operating system context switch code%%per%%]$~ ~$[Second%%lst%% only 
a small amount of code is distrusted%%scn%% most of the exe%%dsh%% 
cution time is spent in trusted code%%per%%]$~ ~$[In this situation%%lst%% 
software fault isolation is likely to be more efﬁcient 
than hardware fault isolation because it sharply re— 
duces the time spent crossing fault domain boundaries%%lst%% 
while only slightly increasing the time spent executing 
205 
the distrusted part of the application%%per%%]$~ ~$[Section 5 quan%%dsh%% 
tiﬁes this trade%%dsh%%off between domain—crossing overhead 
]^[ application execution time overhead%%lst%% ]^[ demon 
strates that even if domain—crossing overhead repre— 
sents a modest proportion of the total application ex— 
ecution time%%lst%% software—enforced fault isolation is cost 
effective%%per%% 
3 Software%%dsh%%Enforced Fault Iso%%dsh%% 
lation 
In this section%%lst%% we outline several software encapsula— 
tion techniques for transforming a distrusted module 
so that it can not escape its fault domain%%per%%]$~ ~$[We ﬁrst 
describe a technique that allows users to pinpoint the 
location of faults within a software module%%per%%]$~ ~$[Next%%lst%% we 
introduce a technique%%lst%% called sandboxing%%lst%% that can iso%%dsh%% 
late a distrusted module while only slightly increasing 
its execution time%%per%%]$~ ~$[Section 5 provides a performance 
analysis of this techinique%%per%%]$~ ~$[Finally%%lst%% we present a soft%%dsh%% 
ware encapsulation technique that allows cooperating 
fault domains to share memory%%per%%]$~ ~$[The remainder of 
this discussion assumes we are operating on a RISC 
load /storc architecture%%lst%% although our techniques could 
be extended to handle CISCs%%per%%]$~ ~$[Section 4 describes 
how we implement safe ]^[ efficient cross—fault—domain 
RPC%%per%%]$~ 
~$[We divide an application’s virtual address space into 
segments%%lst%% aligned so that all virtual addresses within 
a segment share a unique pattern of upper bits%%lst%% called 
the segment identiﬁer%%per%%]$~ ~$[A fault domain consists of two 
segments%%lst%% one for a distrusted module’s code%%lst%% the other 
for its static data%%lst%% heap ]^[ stack%%per%%]$~ ~$[The speciﬁc seg%%dsh%% 
ment addresses are determined at load time%%per%%]$~ 
~$[Software encapsulation transforms a distrusted 
module‘s object code so that it can jump only to tar%%dsh%% 
gets in its code segment%%lst%% ]^[ write only to addresses 
within its data segment%%per%%]$~ ~$[Hence%%lst%% all legal jump tar— 
gets in the distrusted module have the same upper bit 
pattern (segment identiﬁer)%%scn%% similarly%%lst%% all legal data 
addresses generated by the distrusted module share 
the same segment identiﬁer%%per%%]$~ ~$[Separate code ]^[ data 
segments are necessary to prevent a module from mod— 
ifying its code segmentl%%per%%]$~ ~$[It is possible for an address 
with the correct segment identiﬁer to be illegal%%lst%% for in%%dsh%% 
stance if it refers to an unmapped page%%per%%]$~ ~$[This is caught 
by the normal operating system page fault mechanism%%per%% 
3%%per%%1 
An unsafe mstmctzan is any instruction that jumps to 
]v[ stores to an address that can not be statically ver— 
Segment Matching 
10111%%dqt%% system supports dynamic linking through a special 
interface%%per%% 
iﬁed to be within the correct segment%%per%%]$~ ~$[Most control 
transfer instructions%%lst%% such as program‘counter‘relative 
branches%%lst%% can be statically veriﬁed%%per%%]$~ ~$[Stores to static 
variables often use an immediate addressing mode ]^[ 
can be statically veriﬁed%%per%%]$~ ~$[However%%lst%% jumps through reg— 
isters%%lst%% most commonly used to implement procedure 
returns%%lst%% ]^[ stores that use a register to hold their 
target address%%lst%% can not be statically veriﬁed%%per%%]$~ 
~$[A straightforward approach to preventing the use of 
illegal addresses is to insert checking code before eve 
ery unsafe instruction%%per%%]$~ ~$[The checking code determines 
whether the unsafe instruction’s target address has the 
correct segment identiﬁer%%per%%]$~ ~$[If the check fails%%lst%% the in%%dsh%% 
serted code will trap to a system error routine outside 
the distrusted module’s fault domain%%per%%]$~ ~$[We call this 
software encapsulation technique segment matching%%per%%]$~ 
~$[On typical RISC architectures%%lst%% segment matching 
requires four instructions%%per%%]$~ ~$[Figure 1 lists a pseudo—code 
fragment for segment matching%%per%%]$~ ~$[The ﬁrst instruction 
in this fragment moves the store target address into 
a dedzcated register%%per%%]$~ ~$[Dedicated registers are used only 
by inserted code ]^[ are never modiﬁed by code in 
the distrusted module%%per%%]$~ ~$[They are necessary because 
code elsewhere in the distrusted module may arrange 
to jump directly to the unsafe store instruction%%lst%% by%%dsh%% 
passing the inserted check%%per%%]$~ ~$[Hence%%lst%% we transform all 
unsafe store ]^[ jump instructions to use a dedicated 
register%%per%%]$~ 
~$[All the software encapsulation techniques presented 
in this paper require dedicated registersz%%per%%]$~ ~$[Segment 
matching requires four dedicated registers%%cln%% one to hold 
addresses in the code segment%%lst%% one to hold addresses 
in the data segment%%lst%% one to hold the segment shift 
amount%%lst%% ]^[ one to hold the segment identiﬁer%%per%%]$~ 
~$[Using dedicated registers may have an impact on 
the execution time of the distrusted module%%per%%]$~ ~$[However%%lst%% 
since most modern RISC architectures%%lst%% including the 
MIPS ]^[ Alpha%%lst%% have at least 32 registers%%lst%% we can 
retarget the compiler to use a smaller register set with 
minimal performance impact%%per%%]$~ ~$[For example7 Section 5 
shows that%%lst%% on the DECstation 5000/240%%lst%% reducing by 
ﬁve registers the register set available to a C compiler 
(gee) did not have a signiﬁcant effect on the average 
execution time of the SPEC92 benchmarks%%per%% 
3%%per%%2 Address Sandboxing 
The segment matching technique has the advantage 
that it can pinpoint the offending instruction%%per%%]$~ ~$[This 
capability is useful during software development%%per%%]$~ ~$[We 
can reduce runtime overhead still further%%lst%% at the cost 
of providing no information about the source of faults%%per%% 
2 For architectures with lenitccl register sets%%lst%% such as the 
80386 [Int86]%%lst%% it is possible to encapsulate a module using no re%%dsh%% 
served registers by restricting control ﬂow within a fault domain%%per%% 
206 
dedicated—reg <2 target address 
lilove target address into dedicated register%%per%% 
scratch%%dsh%%reg <= (dedicated—reg>>shift~reg) 
Right—shift address to get segment identiﬁer%%per%% 
scratch—reg is not a dedicated register%%per%% 
shift%%dsh%%reg is a dedicated register%%per%% 
compare scratch—reg ]^[ segment—reg 
segment%%dsh%%reg is a dedicated register%%per%% 
trap if not equal 
Trap if store address is outside of segment%%per%% 
store instruction uses dedicated%%dsh%%reg 
Figure 1%%cln%% Assembly pseudo code for segment matching%%per%% 
dedicated—reg c target%%dsh%%reghand—mask—reg 
Use dedicated register and—mask%%dsh%%reg 
to clear segment identiﬁer bits%%per%% 
dedicated—reg <2 dedicated%%dsh%%regl segment—reg 
Use dedicated register segment%%dsh%%reg 
to set segment identiﬁer bits%%per%% 
store instruction uses dedicated%%dsh%%reg 
Figure 2%%cln%% Assembly pseudo code to sandbox address 
in target—reg%%per%%]$~ 
~$[Before each unsafe instruction we simply insert code 
that sets the upper bits of the target address to the 
correct segment identifier%%per%%]$~ ~$[We call this sandborzn g the 
address%%per%%]$~ ~$[Sandboxing does not catch illegal addresses%%scn%% 
it merely prevents them from affecting any fault do— 
main other than the one generating the address%%per%%]$~ 
~$[Address sandboxing requires insertion of two arith%%dsh%% 
metic instructions before each unsafe store ]v[ jump 
instruction%%per%%]$~ ~$[The ﬁrst inserted instruction clears the 
segment identifier bits ]^[ stores the result in a ded— 
icated register%%per%%]$~ ~$[The second instruction sets the seg— 
ment identiﬁer to the correct value%%per%%]$~ ~$[Figure 2 lists the 
pseudo‘code to perform this operation%%per%%]$~ ~$[As with seg%%dsh%% 
ment matching%%lst%% we modify the unsafe store ]v[ jump 
instruction to use the dedicated register%%per%%]$~ ~$[Since we are 
using a dedicated register%%lst%% the distrusted module code 
can not produce an illegal address even by jumping 
to the second instruction in the sandboxing sequence%%scn%% 
since the upper bits of the dedicated register will al— 
ready contain the correct segment identiﬁer%%lst%% this sec%%dsh%% 
ond instruction will have no effect%%per%%]$~ ~$[Section 3%%per%%6 presents 
a simple algorithm that can verify that an object code 
module has been correctly sandboxed%%per%%]$~ 
~$[Address sandboxing requires ﬁve dedicated registers%%per%%]$~ 
~$[One register is used to hold the segment mask%%lst%% two 
registers are used to hold the code ]^[ data segment 
<——reg+oﬂ%%sqt%%sel j 
«— reg 
Guard Zones S eg ment 
Figure 3%%cln%% A segment with guard zones%%per%%]$~ ~$[The size of 
the guard zones covers the range of possible immediate 
offsets in register—plus%%dsh%%offset addressing modes%%per%% 
identiﬁers%%lst%% ]^[ two are used to hold the sandboxed 
code ]^[ data addresses%%per%% 
3%%per%%3 Optimizations 
The overhead of software encapsulation can be re%%dsh%% 
duced by using conventional compiler optimizations%%per%%]$~ 
~$[Our current prototype applies loop invariant code mo— 
tion ]^[ instruction scheduling optimizations [ASU86%%lst%% 
ACD74]%%per%%]$~ ~$[In addition to these conventional techniques%%lst%% 
we employ a number of optimizations specialized to 
software encapsulation%%per%%]$~ 
~$[We can reduce the overhead of software encapsulae 
tion mechanisms by avoiding arithmetic that computes 
target addresses%%per%%]$~ ~$[For example%%lst%% many RISC architec— 
tures include a register%%dsh%%plus—oﬁset instruction mode%%lst%% 
where the offset is an immediate constant in some lim— 
ited range%%per%%]$~ ~$[On the MIPS architecture such offsets are 
limited to the range %%dsh%%64K to +64K%%per%%]$~ ~$[Consider the 
store instruction store value,oﬁset(reg)%%lst%% whose 
address offset (reg) uses the register—plus—olfsct ad~ 
dressing mode%%per%%]$~ ~$[Sandboxing this instruction requires 
three inserted instructions%%cln%% one to sum reg+oﬁset 
into the dedicated register%%lst%% ]^[ two sandboxing in— 
structions to set the segment identiﬁer of the dedicated 
register%%per%%]$~ 
~$[Our prototype optimizes this case by sandboxing 
only the register reg%%lst%% rather than the actual target ad— 
dress reg+oﬁset%%lst%% thereby saving an instruction%%per%%]$~ ~$[To 
support this optimization%%lst%% the prototype establishes 
guard zones at the top ]^[ bottom of each segment%%per%%]$~ 
~$[To create the guard zones%%lst%% virtual memory pages ad— 
jacent to the segment are unmapped (see Figure 3)%%lst%% 
We also reduce runtime overhead by treating the 
MIPS stack pointer as a dedicated register%%per%%]$~ ~$[We avoid 
sandboxing the uses of the stack pointer by sandboxing 
207 
this register whenever it is set%%per%%]$~ ~$[Since uses of the stack 
pointer to form addresses are much more plentiful than 
changes to it%%lst%% this optimization signiﬁcantly improves 
performance%%per%%]$~ 
~$[Further%%lst%% we can avoid sandboxing the stack pointer 
after it is modiﬁed by a small constant offset as long as 
the modiﬁed stack pointer is used as part of a load ]v[ 
store address before the next control transfer instruc» 
tion%%per%%]$~ ~$[If the modiﬁed stack pointer has moved into a 
guard zone%%lst%% the load ]v[ store instruction using it will 
cause a hardware address fault%%per%%]$~ ~$[On the DEC Alpha 
processor%%lst%% we apply these optimizations to both the 
frame pointer ]^[ the stack pointer%%per%%]$~ 
~$[There are a number of further optimizations that 
could reduce sandboxing overhead%%per%%]$~ ~$[For example%%lst%% 
the transformation tool could remove sandboxing se— 
quences from loops%%lst%% in cases where a store target ad%%dsh%% 
dress changes by only a small constant oifset during 
each loop iteration%%per%%]$~ ~$[Our prototype does not yet imple— 
ment these optimizations%%per%% 
3%%per%%4 Process Resources 
Because multiple fault domains share the same virtual 
address space%%lst%% the fault domain implementation must 
prevent distrusted modules from corrupting resources 
that are allocated on a per—addressspace basis%%per%%]$~ ~$[For 
example%%lst%% if a fault domain is allowed to make system 
calls%%lst%% it can close ]v[ delete ﬁles needed by other code 
executing in the address space%%lst%% potentially causing the 
application as a whole to crash%%per%%]$~ 
~$[One solution is to modify the operating system to 
know about fault domains%%per%%]$~ ~$[On a system call ]v[ page 
fault%%lst%% the kernel can use the program counter to deter%%dsh%% 
mine the currently executing fault domain%%lst%% ]^[ restrict 
resources accordingly%%per%%]$~ 
~$[To keep our prototype portable%%lst%% we implemented 
an alternative approach%%per%%]$~ ~$[In addition to placing each 
distrusted module in a separate fault domain%%lst%% we re— 
quire distrusted modules to access system resources 
only through cross%%dsh%%fault%%dsh%%domain RPC%%per%%]$~ ~$[We reserve a 
fault domain to hold trusted arbitration code that de— 
termines whether a particular system call performed 
by some other fault domain is safe%%per%%]$~ ~$[If a distrusted 
module’s object code performs a direct system call%%lst%% we 
transform this call into the appropriate RPC call%%per%%]$~ ~$[In 
the case of an extensible application%%lst%% the trusted por%%dsh%% 
tion of the%%per%% application can make system calls directly 
]^[ shares a fault domain with the arbitration code%%per%% 
3%%per%%5 Data Sharing 
Hardware fault isolation mechanisms can support data 
sharing among virtual address spaces by manipulate 
ing page table entries%%per%%]$~ ~$[Fault domains share an ad— 
dress space%%lst%% ]^[ hence a set of page table entries%%lst%% 
so they can not use a standard shared memory im— 
plementation%%per%%]$~ ~$[Read%%dsh%%only sharing is straightforward%%scn%% 
since our software encapsulation techniques do not al%%dsh%% 
ter load instructions%%lst%% fault domains can read any mem— 
ory mapped in the application’s address space 3%%per%%]$~ 
~$[If the object code in a particular distrusted mod— 
ule has been sandboxed%%lst%% then it can share read%%dsh%%write 
memory with other fault domains through a technique 
we call lazy pointer swizzling%%per%%]$~ ~$[Lazy pointer swizzling 
provides a mechanism for fault domains to share ar— 
bitrarily many read‘write memory regions with no ad%%dsh%% 
ditional runtirne overhead%%per%%]$~ ~$[To support this technique%%lst%% 
we modify the hardware page tables to map the shared 
memory region into every address space segment that 
needs access%%scn%% the region is mapped at the same offset 
in each segment%%per%%]$~ ~$[In other words%%lst%% we alias the shared 
region into multiple locations in the virtual address 
space%%lst%% ]b[ each aliased location has exactly the same 
low order address bits%%per%%]$~ ~$[As with hardware shared mem%%dsh%% 
ory schemes%%lst%% each shared region must have a different 
segment offset%%per%%]$~ 
~$[To avoid incorrect shared pointer comparisons in 
sandboxed code%%lst%% the shared memory creation inter— 
face must ensure that each shared object is given a 
unique address%%per%%]$~ ~$[As the distrusted object code ac%%dsh%% 
cesses shared memory%%lst%% the sandboxing code automati%%dsh%% 
cally translates shared addresses into the correspond 
ing addresses within the fault domain’s data segment%%per%%]$~ 
~$[This translation works exactly like hardware transla~ 
tion%%scn%% the low bits of the address remain the same%%lst%% ]^[ 
the high bits are set to the data segment identiﬁer%%per%%]$~ 
~$[Under operating systems that do not allow virtual 
address aliasing%%lst%% we can implement shared regions by 
introducing a new software encapsulation technique%%cln%% 
shared segment matching%%per%%]$~ ~$[To implement sharing%%lst%% we 
use a dedicated register to hold a bitmap%%per%%]$~ ~$[The bitmap 
indicates which segments the fault domain can access%%per%%]$~ 
~$[For each unsafe instruction checked%%lst%% shared segment 
matching requires one more%%per%% instruction than segment 
matching%%per%% 
3%%per%%6 Implementation ]^[ Veriﬁcation 
We have identiﬁed two strategies for implementing 
software encapsulation%%per%%]$~ ~$[One approach uses a compiler 
to emit encapsulated object code for a distrusted mod%%dsh%% 
ule%%scn%% the integrity of this code is then veriﬁed when the 
module is loaded into a fault domain%%per%%]$~ ~$[Alternatively%%lst%% 
the system can encapsulate the distrusted module by 
directly modifying its object code at load time%%per%% 
a\«Ve have implemented versions of these techniques that per 
form general protection by encapsulating load instructions as 
well as store ]^[ jump instructions%%per%%]$~ ~$[We discuss the performance 
of these variants in Section 5%%per%%]$~ 
~$[Our current prototype uses the first approach%%per%%]$~ ~$[We 
modiﬁed a version of the gcc compiler to perform soft— 
ware encapsulation%%per%%]$~ ~$[Note that While our current imple%%dsh%% 
mentation is language dependent%%lst%% our techniques are 
language independent%%per%%]$~ 
~$[We built a veriﬁer for the MIPS instruction set 
that works for both sandboxing ]^[ segment match%%dsh%% 
ing%%per%%]$~ ~$[The main challenge in veriﬁcation is that%%lst%% in the 
presence of indirect jumps%%lst%% execution may begin on 
any instruction in the code segment%%per%%]$~ ~$[To address this 
situation%%lst%% the veriﬁer uses a property of our software 
encapsulation techniques%%cln%% all unsafe stores ]^[ jumps 
use a dedicated register to form their target address%%per%%]$~ 
~$[The veriﬁer divides the program into sequences of in— 
structions called unsafe regions%%per%%]$~ ~$[An unsafe store re%%dsh%% 
gion begins with any modiﬁcation to a dedicated store 
register%%per%%]$~ ~$[An unsafe jump region begins with any mod%%dsh%% 
iﬁcation to a dedicated jump register%%per%%]$~ ~$[If the ﬁrst in— 
struction in a unsafe store ]v[ jump region is executed%%lst%% 
all subsequent instructions are guaranteed to be exe%%dsh%% 
cuted%%per%%]$~ ~$[An unsafe store region ends when one of the 
following hold%%cln%% the next instruction is a store which 
uses a dedicated register to form its target address%%lst%% 
the next instruction is a control transfer instruction%%lst%% 
the next instruction is not guaranteed to be executed%%lst%% 
]v[ there are no more instructions in the code segment%%per%%]$~ 
~$[A similar deﬁnition is used for unsafe jump regions%%per%%]$~ 
~$[The veriﬁer analyzes each unsafe store ]v[ jump re%%cln%% 
gion to insure that any dedicated register modiﬁed in 
the region is valid upon exit of the region%%per%%]$~ ~$[For ex— 
ample%%lst%% a load to a dedicated register begins an unsafe 
region%%per%%]$~ ~$[If the region appropriately sandboxes the ded— 
icated register%%lst%% the unsafe region is deemed safe%%per%% if an 
unsafe region can not be veriﬁed%%lst%% the code is rejected%%per%%]$~ 
~$[By incorporating software encapsulation into an ex— 
isting compiler%%lst%% we are able to take advantage of com— 
piler infrastructure for code optimization%%per%%]$~ ~$[However%%lst%% 
this approach has two disadvantages%%per%%]$~ ~$[First%%lst%% most mod%%dsh%% 
iﬁed compilers will support only one programming lan— 
guage (gcc supports C%%lst%% C++%%lst%% ]^[ Pascal)%%per%%]$~ ~$[Second%%lst%% the 
compiler ]^[ veriﬁer must be synchronized with re— 
spect to the particular encapsulation technique being 
employed%%per%%]$~ 
~$[An alternative%%lst%% called bmary patchzng%%lst%% alleviates 
these problems%%per%%]$~ ~$[When the fault domain is loaded%%lst%% the 
system can encapsulate the module by directly modi%%dsh%% 
fying the object code%%per%%]$~ ~$[Unfortunately%%lst%% practical ]^[ r07 
bust binary patching%%lst%% resulting in efﬁcient code%%lst%% is not 
currently possible [LB92]%%per%%]$~ ~$[Tools which translate one 
binary format to another have been built%%lst%% ]b[ these 
tools rely on compiler—speciﬁc idioms to distinguish 
code from data ]^[ use processor emulation to han%%dsh%% 
dle unknown indirect jumps[SCK”93]%%per%%]$~ ~$[For software 
encapsulation%%lst%% the main challenge is to transform the 
code so that it uses a subset of the registers%%lst%% leav— 
208 
Trusted 
Caller Domain 
Unlru sted 
Calico Domain 
call Add 
Jump Table 
Figure 4%%cln%% Major components of a crossefault—domain 
RFC%%per%% 
ing registers available for dedicated use%%per%%]$~ ~$[To solve this 
problem%%lst%% we are working on a binary patching proto%%dsh%% 
type that uses simple extensions to current object ﬁle 
formats%%per%%]$~ ~$[The extensions store control ﬂow ]^[ register 
usage information that is sufﬁcient to support software 
encapsulation%%per%% 
4 Low Latency Cross Fault Do— 
main Communication 
The purpose of this work is to reduce the cost of fault 
isolation for cooperating ]b[ distrustful software mod— 
ules%%per%%]$~ ~$[In the last section%%lst%% we presented one half of our 
solution%%cln%% efficient software encapsulation%%per%%]$~ ~$[In this sec%%dsh%% 
tion%%lst%% we describe the other half%%cln%% fast communication 
across fault domains%%per%%]$~ 
~$[Figure 4 illustrates the major components ofa cross— 
fault~domain RFC between a trusted ]^[ distrusted 
fault domain%%per%%]$~ ~$[This section concentrates on three as— 
pects of fault domain crossing%%per%%]$~ ~$[First%%lst%% we describe 
a simple mechanism which allows a fault domain to 
safely call a trusted stub routine outside its domain%%scn%% 
that stub routine then safely calls into the destination 
domain%%per%%]$~ ~$[Second%%lst%% we discuss how arguments are effi— 
ciently passed among fault domains%%per%%]$~ ~$[Third%%lst%% we detail 
how registers ]^[ other machine state are managed on 
cross—fault—domain RPCs to insure fault isolation%%per%%]$~ ~$[The 
protocol for exporting ]^[ naming procedures among 
fault domains is independent of our techniques%%per%%]$~ 
~$[The only way for control to escape a%%per%% fault domain 
is via a jump table%%per%%]$~ ~$[Each jump table entry is a con— 
trol transfer instruction whose target address is a legal 
entry point outside the domain%%per%%]$~ ~$[By using instructions 
whose target address is an immediate encoded in the 
instruction%%lst%% the jump table does not rely on the use of 
a dedicated register%%per%%]$~ ~$[Because the table is kept in the 
(readvonly) code segment%%lst%% it can only be modified by 
a trusted module%%per%%]$~ 
~$[For each pair of fault domains a customized call ]^[ 
return stub is created for each exported procedure%%per%%]$~ 
~$[Currently%%lst%% the stubs are generated by hand rather than 
using a stub generator [JRTSS]%%per%%]$~ ~$[The stubs run unpro— 
tected outside of both the caller ]^[ callee domain%%per%%]$~ 
~$[The stubs are responsible for copying cross%%dsh%%domain 
arguments between domains ]^[ managing machine 
state%%per%%]$~ 
~$[Because the stubs are trusted%%lst%% we are able to copy 
call arguments directly to the target domain%%per%%]$~ ~$[Tra— 
ditional RPC implementations across address spaces 
typically perform three copies to transfer data%%per%%]$~ ~$[The 
arguments are marshalled into a message%%lst%% the kernel 
copies the message to the target address space%%lst%% ]^[ 
ﬁnally the callee must de%%dsh%%marshall the arguments%%per%%]$~ ~$[By 
having the caller ]^[ callee communicate via a shared 
buffer%%lst%% LRPC also uses only a single copy to pass data 
between domains [BALLQI]%%per%%]$~ 
~$[The stubs are also responsible for managing machine 
state%%per%%]$~ ~$[On each cross—domain call any registers that are 
both used in the future by the caller ]^[ potentially 
modiﬁed by the callee must be protected%%per%%]$~ ~$[Only regis— 
ters that are designated by architectural convention to 
bc preserved across procedure calls are saved%%per%%]$~ ~$[As an 
optimization%%lst%% if the callee domain contains no instruc— 
tions that modify a preserved register we can avoid 
saving it%%per%%]$~ ~$[Karger uses a trusted linker to perform this 
kind of optimization between address spaces [KarSQ]%%per%%]$~ 
~$[In addition to saving ]^[ restoring registers%%lst%% the stubs 
must switch the execution stack%%lst%% establish the correct 
register context for the software encapsulation tech%%dsh%% 
nique being used%%lst%% ]^[ validate all dedicated registers%%per%%]$~ 
~$[Our system must also be robust in the presence of 
fatal errors%%lst%% for example%%lst%% an addressing violation7 while 
executing in a fault domain%%per%%]$~ ~$[Our current implementa— 
tion uses the UNIX signal facility to catch these errors%%scn%% 
it then terminates the outstanding call ]^[ notiﬁes the 
caller’s fault domain%%per%%]$~ ~$[If the application uses the same 
operating system thread for all fault domains%%lst%% there 
must be a way to terminate a call that is taking too 
long%%lst%% for example%%lst%% because of an inﬁnite loop%%per%%]$~ ~$[Trusted 
modules may use a timer facility to interrupt execu— 
tion periodically ]^[ determine if a call needs to be 
terminated%%per%% 
5 Performance Results 
To evaluate the performance of software%%dsh%%enforced fault%%per%% 
domains%%lst%% we implemented ]^[ measured a prototype 
of our system on a 40MHz DECstation 5000/240 (DEC— 
MIPS) ]^[ a lﬁONIliz Alpha 400 (DEC—ALPHA)%%per%%]$~ 
~$[We consider three questions%%per%%]$~ ~$[First%%lst%% how much over 
209 
head does software encapsulation incur%%qsn%%]$~ ~$[Second%%lst%% how 
fast is a crossrfault—domain RFC%%qsn%%]$~ ~$[Third%%lst%% what is the 
performance impact of using software enforced fault 
isolation on an end%%dsh%%user application%%qsn%%]$~ ~$[We discuss each 
of these questions in turn%%per%% 
5%%per%%1 Encapsulation Overhead 
We measured the execution time overhead of sand%%dsh%% 
boxing a wide range of C programs%%lst%% including the C 
SPE092 benchmarks ]^[ several of the Splash bench%%dsh%% 
marks [AssQl%%lst%% SWGQl]%%per%%]$~ ~$[We treated each benchmark 
as if it were a distrusted module%%lst%% sandboxing all of 
its code%%per%%]$~ ~$[Column 1 of Table 1 reports overhead on 
the DEC—MIPS%%lst%% column 6 reports overhead on the DEC— 
ALPHA%%per%%]$~ ~$[Columns 2 ]^[ 7 report the overhead of using 
our technique to provide general protection by sand« 
boxing load instructions as well as store ]^[ jump 
instructions“%%per%%]$~ ~$[As detailed in Section 3%%lst%% sandboxing 
requires 5 dedicated registers%%per%%]$~ ~$[Column 3 reports the 
overhead of removing these registers from possible use 
by the compiler%%per%%]$~ ~$[All overheads are computed as the 
additional execution time divided by the original pro~ 
gram‘s execution time%%per%%]$~ 
~$[On the DECeMiPS%%lst%% we used the program measure— 
ment tools pixie ]^[ qpt to calculate the number 
of additional instructions executed due to sandbox~ 
ing [Dig%%lst%% BL92]%%per%%]$~ ~$[Column 4 of Table 1 reports this 
data as a percentage of original program instruction 
counts%%per%%]$~ 
~$[The data in Table 1 appears to contain a num— 
ber of anomalies For some%%per%% of the benchmark pro%%dsh%% 
grams%%lst%% for example%%lst%% 056%%per%%ear 011 the DECAMIPS ]^[ 
026 %%per%% compress on the DEC—ALPHA%%lst%% sandboxing reduced 
execution time%%per%% in a number of cases the overhead is 
surprisingly low%%per%%]$~ 
~$[To identify the source of these variations we de~ 
veloped an analytical model for execution overhead%%per%%]$~ 
~$[The model predicts overhead based on the number 
of additional instructions executed due to sandbox 
ing (s—znstructzons)%%lst%% ]^[ the number of saved ﬂoat~ 
ing point interlock cycles (interlocks)%%per%%]$~ ~$[Sandboxing in» 
creases the available instructionlevel parallelism%%lst%% aL 
lowing the number of ﬂoating—point interlocks to be 
substantially reduced The integer pipeline does not 
provide interlocking%%scn%% instead%%lst%% delay slots are explicitly 
ﬁlled with nop instructions by the compiler ]v[ assem~ 
bler%%per%%]$~ ~$[Hence%%lst%% scheduling ell%%sqt%%ects among integer instruc~ 
tions will be accurately reﬂected by the count of in~ 
structions added (s—mstructzons)%%per%%]$~ ~$[The expected overs 
head is computed as%%cln%% 
(s—msz‘mchons — interlacksﬂcycles—per—sccond 
original%%dsh%%erecutwn%%dsh%% lune%%dsh%%seconds 
4Loads in the libraries%%lst%% such as the standard C library%%lst%% were 
not sandboxed%%per%%]$~ 
~$[The model provides an effective way to separate known 
sources of overhead from second order effects%%per%%]$~ ~$[Col%%dsh%% 
umn 5 of Table 1 are the predicted overheads%%per%%]$~ 
~$[As can be seen from Table 1%%lst%% the model is%%lst%% on aver 
age%%lst%% eﬁective at predicting sandboxing overhead%%per%%]$~ ~$[The 
differences between measured ]^[ expected overheads 
are normally distributed with mean 0%%per%%7% ]^[ standard 
deviation of 2%%per%%6%%%per%%]$~ ~$[The difference between the means 
Ofthe measured ]^[ expected overheads is not statisti%%dsh%% 
cally signiﬁcant%%per%%]$~ ~$[This experiment demonstrates that%%lst%% 
by combining instruction count overhead ]^[ ﬂoating 
point interlock measurements%%lst%% we can accurately pres 
dict average execution time overhead%%per%%]$~ ~$[If we assume 
that the model is also accurate at predicting the over— 
head of individual benchmarks%%lst%% we can conclude that 
there is a second order effect creating the observed 
anomalies in measured overhead%%lst%% 
We can discount eﬁective instruction cache size ]^[ 
virtual memory paging as sources for the observed ex~ 
ecution time variance%%per%%]$~ ~$[Because sandboxing adds in%%dsh%% 
structions%%lst%% the effective size of the instruction cache is 
reduced%%per%%]$~ ~$[While this might account for measured over%%dsh%% 
heads higher than predicted%%lst%% it does not account for 
the opposite effect%%per%%]$~ ~$[Because all of our benchmarks are 
compute bound%%lst%% it is unlikely that the variations are 
due to virtual memory paging%%per%%]$~ 
~$[The DEC<MIPS has a physically indexed%%lst%% physically 
tagged%%lst%% direct mapped data cache%%per%%]$~ ~$[In our experiments 
sandboxing did not affect the size%%lst%% contents%%lst%% ]v[ starting 
Virtual address of the data segment%%per%%]$~ ~$[For both original 
]^[ sandboxed versions of the benchmark programs%%lst%% 
successive runs showed insigniﬁcant variation%%per%%]$~ ~$[Though 
difﬁcult to quantify%%lst%% we do not believe that data cache 
alignment was an important source of variation in our 
experiments%%per%% 
\Ve conjecture that the observed variations are 
caused by instruction cache mappzng conﬂicts%%per%%]$~ ~$[Soft— 
ware encapsulation changes the mapping of instruc~ 
tions to cache lines%%lst%% hence changing the number of in— 
struction cache conﬂicts%%per%%]$~ ~$[A number of researchers have 
investigated minimizing instruction cache conﬂicts to 
reduce execution time [McF89%%lst%% PHQO%%lst%% Sam88]%%per%%]$~ ~$[One 
researcher reported a 20% performance gain by sim— 
ply ehanging the order in which the object ﬁles were%%per%% 
linked [PHQO]%%per%%]$~ ~$[Samples ]^[ Hilﬁnger report signif— 
icantly improved instruction cache miss rates by re— 
arranging only 3% to 8% of an application’s basic 
blocks [SarnSS]%%per%%]$~ 
~$[Beyond this effect%%lst%% there were statistically signiﬁcant 
differences among programs%%per%%]$~ ~$[On average%%lst%% programs 
which contained a signiﬁcant percentage of ﬂoating 
point operations incurred less overhead%%per%%]$~ ~$[On the DEC— 
MIPS the mean overhead for ﬂoating point intensive 
benchmarks is 2%%per%%5%%%lst%% compared to a mean of 5%%per%%6% for 
the remaining benchmarks%%per%%]$~ ~$[All of our benchmarks are 
210 
DEC%%dsh%%MIPS DEC%%dsh%%ALPHA 
Fault Protection Reserved Instruction Fault Fault Protection 
Benchmark Isolation Overhead Register Count Isolation Isolation Overhead 
Overhead Overhead Overhead Overhead Overhead 
(predicted) 
052%%per%% alvinn FP 1%%per%%4% 33%%per%%4% —0%%per%%3% 19%%per%%4% 0%%per%%2% 8%%per%%1% 35%%per%%5% 
bps FP 5%%per%%6% 15%%per%%5% %%dsh%%0%%per%%1% 8%%per%%9% 5%%per%%7% 4%%per%%7% 20%%per%%3% 
cholesky FP 0%%per%%0% 22%%per%%7% 0%%per%%5% 6%%per%%5% 4%%per%%5% 0%%per%%0% 9%%per%%3% 
026 %%per%% compress INT 3%%per%%3% 13%%per%%3% 0%%per%%0% 10%%per%%9% 4%%per%%4% 4%%per%%3% 0%%per%%0% 
056%%per%%ear FP —1%%per%%2% 19%%per%%1% 0%%per%%2% 12%%per%%4% 2%%per%%2% 3%%per%%7% 18%%per%%3% 
023 %%per%% eqntott INT 2%%per%%9% 34%%per%%4% 1%%per%%0% 2%%per%%7% 2%%per%%2% 2%%per%%3% 17%%per%%4% 
008 %%per%% espresso INT 12%%per%%4% 27%%per%%0% —1%%per%%6% 11%%per%%8% 10%%per%%5% 13%%per%%3% 33%%per%%6% 
001 %%per%%gcc1%%per%%35 INT 3%%per%%1% 18%%per%%7% %%dsh%%9%%per%%4% 17%%per%%0% 8%%per%%9% NA NA 
022%%per%%11 INT 5%%per%%1% 23%%per%%4% 0%%per%%3% 14%%per%%9% 11%%per%%4% 5%%per%%4% 16%%per%%2% 
locus INT 8%%per%%7% 30%%per%%4% 4%%per%%3% 10%%per%%3% 8%%per%%6% 4%%per%%3% 8%%per%%7% 
mp3d FP 10%%per%%7% 10%%per%%7% 0%%per%%0% 13%%per%%3% 8%%per%%7% 0%%per%%0% 6%%per%%7% 
psgrind INT 10%%per%%4% 19%%per%%5% 1%%per%%3% 12%%per%%1% 9%%per%%9% 8%%per%%0% 36%%per%%0% 
ch PF 05% 27%%per%%0% 2%%per%%0% 8%%per%%8% 1%%per%%2% %%dsh%%0%%per%%8% 12%%per%%1% 
072 %%per%% sc INT 5%%per%%6% 11%%per%%2% 7%%per%%0% 8%%per%%0% 3%%per%%8% NA NA 
tracker INT %%dsh%%0%%per%%8% 10%%per%%5% 0%%per%%4% 3%%per%%9% 2%%per%%1% 10%%per%%9% 19%%per%%9% 
water FP 0%%per%%7% 7%%per%%4% 0%%per%%3% 6%%per%%7% 1%%per%%5% 4%%per%%3% 12%%per%%3% 
| Average I 4%%per%%3% | 21%%per%%8% | 0%%per%%4% | 10%%per%%5% | 5%%per%%0% I 4%%per%%3% | 17%%per%%6% ‘I 
Table 1%%cln%% Sandboxing overheads for DEC—MIPS ]^[ DEC—ALPHA platforms%%per%%]$~ ~$[The benchmarks 001%%per%%gcc1%%per%%35 ]^[ 
072%%per%%sc are dependent on a pointer size of 32 bits ]^[ do not compile on the DEC%%dsh%%ALPHA%%per%%]$~ ~$[The predicted fault 
isolation overhead for cholesky is negative due to conservative interlocking on the MIPS ﬂoatingvpoint unit%%per%% 
compute intensive%%per%%]$~ ~$[Programs that perform signiﬁcant 
amounts of I/O will incur less overhead%%per%% 
5%%per%%2 Fault Domain Crossing 
We now turn to the cost of cross—fault—domain RPC%%per%%]$~ 
~$[Our RPC mechanism spends most of its time saving 
]^[ restoring registers%%per%%]$~ ~$[As detailed in Section 4%%lst%% only 
registers that are designated by the architecture to be 
preserved across procedure calls need to be saved%%per%%]$~ ~$[In 
addition%%lst%% if no instructions in the callee fault domain 
modify a preserved register then it does not need to be 
saved%%per%%]$~ ~$[Table 2 reports the times for three versions of 
a NULL cross—fault—domain RPC%%per%%]$~ ~$[Column 1 lists the 
crossing times when all data registers are caller saved%%per%%]$~ 
~$[Column 2 lists the crossing times when the preserved 
integer registers are saved%%per%%]$~ ~$[Finally%%lst%% the times listed in 
Column 3 include saving all preserved ﬂoating point 
registers%%per%%]$~ ~$[In many cases crossing times could be further 
reduced by statically partitioning the registers between 
domains%%per%%]$~ 
~$[For comparison%%lst%% we measured two other calling 
mechanisms%%per%%]$~ ~$[First%%lst%% we measured the time to perform a 
C procedure call that takes no arguments ]^[ returns 
no value%%per%%]$~ ~$[Second%%lst%% we sent a single byte between two 
address spaces using the pipe abstraction provided by 
211 
the native operating system ]^[ measured the round%%dsh%% 
trip time%%per%%]$~ ~$[These times are reported in the last two 
columns of Table 2%%per%%]$~ ~$[On these platforms%%lst%% the cost 
of cross—address—space calls is roughly three orders of 
magnitude more expensive than local procedure calls%%per%%]$~ 
~$[Operating systems with highly optimized RPC im— 
plementations have reduced the cost of cross%%dsh%%address%%dsh%% 
space RPC to within roughly two orders of magni— 
tude of local procedure calls%%per%%]$~ ~$[On Mach 3%%per%%0%%lst%% cross— 
address%%dsh%%space RPC on a 25Mhz DECstation 5000/200 
is 314 times more expensive than a local procedure 
call [BerQBl%%per%%]$~ ~$[The Spring operating system%%lst%% running on 
a 40Mhz SPARCstationQ%%lst%% delivers cross—address—space 
RPC that is 73 times more expensive than a local leaf 
procedure call [HK93]%%per%%]$~ ~$[Software enforced fault isola« 
tion is able to reduce the relative cost of cross%%dsh%%fault%%dsh%% 
domain RPC by an order of magnitude over these sys%%dsh%% 
tems%%per%% 
5%%per%%3 Using Fault Domains in POSTGRES 
To capture the effect of our system on application 
performance%%lst%% we added software enforced fault do 
mains to the POSTGRES database management system%%lst%% 
]^[ measured POSTGRES running the Sequoia 2000 
benchmark [SFGMQ3]%%per%%]$~ ~$[The Sequoia %%sqt%%2000 benchmark 
Cross FaultADomain RFC 
Platform Caller Save Save C Pipes 
Save Integer Integer+Float Procedure 
Registers Registers Registers Call 
DEC~MIPS 1%%per%%11ps 1%%per%%81ps 2%%per%%83m 0%%per%%10/4s 204%%per%%72ns 
DEC—ALPHA 0175/15 1%%per%%35/5 lSOns 0%%per%%06ps 227%%per%%88ps 
Table ‘2%%cln%% Cross%%dsh%%faultrdomain crossing times%%per%%]$~ 
~$[Sequoia 2000 Untrusted Software—Enforced Number DEC—MIPS—PIPE 
Query Function Manager Fault Isolation Cross—Domain Overhead 
Overhead Overhead Calls (predicted) 
Query 6 1%%per%%4% 1%%per%%7% 60989 18%%per%%6% 
Query 7 5%%per%%0% 1%%per%%8% 121986 386% 
Query 8 9%%per%%0% 2%%per%%7% 121978 312% 
Query 10 9%%per%%6% 5%%per%%7% 1427024 31%%per%%9% 
Table 3%%cln%% Fault isolation overhead for POSTGRES running Sequoia 2000 benchmark%%per%% 
contains queries typical of those used by earth scien— 
tists in studying the climate%%per%%]$~ ~$[To support these kinds 
of non~traditional queries%%lst%% POSTGRES provides a%%per%% user 
extensible type system%%per%%]$~ ~$[Currently%%lst%% userrdeﬁned types 
are written in conventional programming languages%%lst%% 
such as C%%lst%% ]^[ dynamically loaded into the database 
manager%%per%%]$~ ~$[This has long been recognized to be a serious 
safety problem[St088]%%per%%]$~ 
~$[Four of the eleven queries in the Sequoia 2000 bench%%dsh%% 
mark make use of user—deﬁned polygon data types%%per%%]$~ ~$[We 
measured these four queries using both unprotected 
dynamic linking ]^[ software—enforced fault isolation%%per%%]$~ 
~$[Since the POSTGRES code is trusted%%lst%% we only sand— 
boxed the dynamically loaded user code%%per%%]$~ ~$[For this 
experiment%%lst%% our cross%%dsh%%fault—domain RFC mechanism 
saved the preserved integer registers (the variant cor%%dsh%% 
responding to Column 2 in Table 2)%%per%%]$~ ~$[In addition%%lst%% we 
instrumented the code to count the number of cross%%dsh%% 
fault%%dsh%%domain RFCs so that we could estimate the per 
formance of fault isolation based on separate address 
spaces%%per%%]$~ 
~$[Table 3 presents the results%%lst%% Untrusted user—deﬁned 
functions in POSTGRES use a separate calling mecha%%dsh%% 
nism from built—in functions%%per%%]$~ ~$[Column 1 lists the over— 
head of the untrustcd function manager Without soft%%dsh%% 
ware enforced fault domains%%per%%]$~ ~$[All reported overheads in 
Table 3 are relative to original POSTGRES using the un— 
trusted function manager%%per%%]$~ ~$[Column 2 reports the mea~ 
sured overhead of software enforced fault domains%%per%%]$~ ~$[Us— 
ing the number of cross—domain calls listed in Column 3 
]^[ tho DEC*MIPS—I‘IPE time reported in Table 2%%lst%% Col— 
umn 4 lists the estimated overhead using conventional 
hardware address spaces%%per%% 
212 
5%%per%%4 Analysis 
For the POSTGRES experiment software encapsulation 
provided substantial savings over using native operat%%dsh%% 
ing system services ]^[ hardware address spaces%%per%%]$~ ~$[In 
general%%lst%% the savings provided by our techniques over 
hardware—based mechanisms is a function of the per— 
centage of time spent in distrusted code (Q)%%lst%% the per%%dsh%% 
centage of time spent crossing among fault domains 
(2‘6)%%lst%% the overhead of encapsulation (h)%%lst%% ]^[ the ratio%%lst%% 
r%%lst%% of our fault domain crossing time to the crossing 
time of the competing hardware%%dsh%%based RPC mecha— 
nism%%per%% 
savings = (1 — 7°)t‘C %%dsh%%— htd 
Figure 5 graphically depicts these trade—offs%%per%%]$~ ~$[The X 
axis gives the percentage of time an application spends 
crossing among fault domains%%per%%]$~ ~$[The Y axis reports the 
relative cost of software enforced fault%%dsh%%domain cross— 
ing over hardware address spaces%%per%%]$~ ~$[Assuming that the 
execution time overhead of encapsulated code is 4%%per%%3%%%lst%% 
the shaded region illustrates when software enforced 
fault isolation is the better performance alternative%%per%%]$~ 
~$[Softwarevenforccd fault isolation becomes increas— 
ingly attractive as applications achieve higher degrees 
of fault isolation (see Figure 5)%%per%%]$~ ~$[For example%%lst%% if an ap%%dsh%% 
plication spends 30% of its time crossing fault domains%%lst%% 
our RPC mechanism need only perform 10% better 
than its competitor%%lst%% Applications that currently spend 
as little as 10% of their time crossing require only a 
39% improvement in fault domain crossing time As 
reported in Section 52%%lst%% our crossing time for the DEC%%dsh%% 
MIPS is Hons ]^[ for the DEC—ALPHA UTE/is%%per%%]$~ ~$[Hence%%lst%% 
Crossing Time Relative to 
Existing RFC 
:9 HP :9 e9 
ementage of Execution Time Spent Crossing 
Figure 5%%cln%% The shaded region represents when soft~ 
ware enforced fault isolation provides the better per— 
formance alternative%%per%%]$~ ~$[The X axis represents per 
centage of time spent crossing among fault domains 
(16)%%per%%]$~ ~$[The Y axis represents the relative RPC crossing 
speed (7‘)%%per%%]$~ ~$[The curve represents the break even point%%cln%% 
(1—7%%sqt%%)t,%%scn%% = htd%%per%%]$~ ~$[In this graph%%lst%% h = 0%%per%%043 (encapsulation 
overhead on the DEC~MIPS ]^[ DEC%%dsh%%ALPHA)%%per%% 
for this latter example%%lst%% a hardware address space cross— 
ing time of 1%%per%%80m on the DEC—MIPS ]^[ 1%%per%%23/15 on the 
DEC~ALPHA would provide better performance than 
software fault domains%%per%%]$~ ~$[As far as we know%%lst%% no pro— 
duction ]v[ experimental system currently provides this 
level of performance%%per%%]$~ 
~$[Further%%lst%% Figure 5 assumes that the entire applica%%dsh%% 
tion was encapsulated%%per%%]$~ ~$[For many applications%%lst%% such as 
POSTGRES%%lst%% this assumption is conservative%%per%%]$~ ~$[Figure 6 
transforms the previous ﬁgure%%lst%% assuming that 50% of 
total execution is spent in distrusted extension code%%per%%]$~ 
~$[Figures 5 ]^[ 6 illustrate that software enforced 
fault isolation is the best choice whenever crossing 
overhead is a significant proportion of an applica%%dsh%% 
tion’s execution time%%per%%]$~ ~$[Figure 7 demonstrates that 
overhead due to software enforced fault isolation re— 
mains small regardless of application behavior%%per%%]$~ ~$[Fig— 
ure 7 plots overhead as a function of crossing behavior 
]^[ crossing cost%%per%%]$~ ~$[Crossing times typical of vendor%%dsh%% 
supplied ]^[ highly optimized hardware—based RPC 
mechanisms are shown%%per%%]$~ ~$[The graph illustrates the rel— 
ative performance stability of the software solution%%per%%]$~ 
~$[This stability%%dqt%% allows system developers to ignore the 
performance effect of fault isolation in choosing which 
modules to place in separate fault domains%%per%% 
6 Related Work 
Many systems have considered ways of optimizing 
RPC performance [vaT88%%lst%% TASS%%lst%% Bla90%%per%%]$~ ~$[SB90%%lst%% HK93%%lst%% 
BALL90%%lst%% BALL91]%%per%%]$~ ~$[Traditional RFC systems based 
100% 
90% 
80% 
70% 
60% 
40% 
Crossing Time Relative 10 
Existing RPC 
u%%per%% 
§ 
Percentage of Execution Time Spent Crossing 
Figure 6%%cln%% The shaded region represents when soft~ 
ware enforced fault isolation provides the better per%%dsh%% 
formance alternative%%per%%]$~ ~$[The X axis represents per%%dsh%% 
centage of time spent crossing among fault domains 
(136)%%per%%]$~ ~$[The Y axis represents the relative RPC crossing 
speed (%%sqt%%r%%sqt%%)%%per%%]$~ ~$[The curve represents the break even point%%cln%% 
(l—r)tc = htd%%per%%]$~ ~$[In this graph%%lst%% h = 0%%per%%043 (encapsulation 
overhead on the DEC—MIPS ]^[ DEC—ALPHA)%%per%% 
100% %%per%% 
a%%dqt%% Ultrix 4%%per%%2 Context Switch 
8 
d3 80% — _ 
E 
a%%per%%]$~ 
~$[U} 
0 
g 60% e _ 
%%sqt%%E—< 
E 
g 40% e — 
é DECstation 5000 
3 Hardware Minimum 
00 
20% — _ 
t 
*%%dsh%% Software 
a? 
0% l 
0 1O 20 
# Crossings/Millcsecond 
Figure 7%%cln%% Percentage of time spent in crossing code 
versus number of fault domain crossings per millisec%%dsh%% 
ond on the DECeMIPS%%per%%]$~ ~$[The hardware minimum cross— 
ing number is taken from a crossvarchitectural study 
of context switch times [ALBL91]%%per%%]$~ ~$[The Ultrix 4%%per%%2 con%%dsh%% 
text switch time is as reported in the last column of 
Table 2%%per%% 
213 
on hardware fault isolation are ultimately limited by 
the minimal hardware cost of taking two kernel traps 
]^[ two hardware context switches%%per%%]$~ ~$[LRPC was one 
of the ﬁrst RPC systems to approach this limit%%lst%% ]^[ 
our prototype uses a number of the techniques found 
in LRPC ]^[ later systems%%cln%% the same thread runs in 
both the caller ]^[ the callee domain%%lst%% the stubs are 
kept as simple as possible%%lst%% ]^[ the crossing code jumps 
directly to the called procedure%%lst%% avoiding a dispatch 
in the callee domain%%per%%]$~ ~$[Unlike these systems%%lst%% software— 
based fault isolation avoids hardware context switches%%lst%% 
substantially reducing crossing costs%%per%%]$~ 
~$[Address space identiﬁer tags can be used to reduce 
hardware context switch times%%per%%]$~ ~$[Tags allow more than 
one address space to share the TLB%%scn%% otherwise the 
TLB must be ﬂushed on each context switch%%per%%]$~ ~$[It was 
estimated that 25% of the cost of an LRPC on the 
Fireﬂy (which does not have tags) was due to TLB 
misses[BALL90]%%per%%]$~ ~$[Address space tags do not%%lst%% however%%lst%% 
reduce the cost of register management ]v[ system calls%%lst%% 
operations which are not scaling with integer perfor%%dsh%% 
mance[ALBL91]%%per%%]$~ ~$[An important advantage of software— 
based Jfault isolation is that it does not rely on specialv 
ized architectural features such as address space tags%%per%%]$~ 
~$[Restrictive programming languages can also be used 
to provide fault isolation%%per%%]$~ ~$[Pilot requires all kernel%%lst%% 
user%%lst%% ]^[ library code to be written in Mesa%%lst%% 3 strongly 
typed language%%scn%% all code then shares a single address 
space [RDII+80]%%per%%]$~ ~$[The main disadvantage of relying on 
strong typing is that it severely restricts the choice 
of programming languages%%lst%% ruling out conventional 
languages like C%%lst%% C++%%lst%% ]^[ assembly%%per%%]$~ ~$[Even with 
strongly—typed languages such as Ada ]^[ Modula—3%%lst%% 
programmers often find they need to use loopholes in 
the type system%%lst%% undercutting fault isolation%%per%%]$~ ~$[In con— 
trast%%lst%% our techniques are language independent%%per%%]$~ 
~$[Deutsch ]^[ Grant built a system that allowed 
user—deﬁned measurement modules to be dynamically 
loaded into the operating system ]^[ executed directly 
on the processor [DG71]%%per%%]$~ ~$[The module format was a 
stylized native object code designed to make it easier 
to statically verify that the code did not violate pro— 
tection boundaries%%per%%]$~ 
~$[An interpreter can also provide failure isolation%%per%%]$~ ~$[For 
example%%per%% the BSD UNIX network packet ﬁlter utility 
deﬁnes a language which is interpreted by the operat%%dsh%% 
ing system network driver%%per%%]$~ ~$[The interpreter insulates 
the operating system from possible faults in the cus— 
tomization code%%per%%]$~ ~$[Our approach allows code written in 
any programming language to be safely encapsulated 
(or rejected if it is not safe)%%lst%% ]^[ then executed at near 
full speed by the operating system%%per%%]$~ 
~$[Anonymous RFC exploits 64%%dsh%%bit address spaces to 
provide low latency RFC ]^[ probabilistic fault iso— 
lation [YBA93]%%per%%]$~ ~$[Logically independent domains are 
214 
placed at random locations in the same hardware ad» 
dress spacer Calls between domains are anonymous%%lst%% 
that is%%lst%% they do not reveal the location of the caller 
]v[ the callee to either side%%per%%]$~ ~$[This provides probabilis— 
tic protection %%lst%% it is unlikely that any domain will 
be able to discover the location of any other domain 
by malicious ]v[ accidental memory probes%%per%%]$~ ~$[To pre» 
serve anonymity%%lst%% a cross domain call must trap to pro%%dsh%% 
tected code in the kernel%%scn%% however%%lst%% no hardware con~ 
text switch is needed%%per%% 
7 Summary 
We have described a software%%dsh%%based mechanism for 
portable%%lst%% programming language independent fault 
isolation among cooperating software modules%%per%%]$~ ~$[By 
providing fault isolation within a single address space%%lst%% 
this approach delivers crossefaultrdomain communica 
tion that is more than an order of magnitude faster 
than any RPC mechanism to date%%per%%]$~ 
~$[To prevent distrusted modules from escaping their 
own fault domain%%lst%% we use a software encapsulation 
technique%%lst%% called sandboxing%%lst%% that incurs about 4% 
Despite this overhead in 
executing distrusted code%%lst%% software—based fault isola%%dsh%% 
tion Will often yield the best overall application per%%dsh%% 
formance%%per%%]$~ ~$[Extensive kernel optimizations can reduce 
the overhead of hardware%%dsh%%based RPC to within a fac%%dsh%% 
tor of ten over our software—based alternative%%per%%]$~ ~$[Even 
in this situation%%lst%% software—based fault isolation will be 
the better performance choice whenever the overhead 
of using hardware—based RPC is greater than 5%%%per%% 
execution time overhead%%per%% 
8 Acknowledgements 
We thank Brian Bershad%%lst%% Mike Burrows%%lst%% John Hen%%dsh%% 
nessy%%lst%% Peter Kessler%%lst%% Butler Lampson%%lst%% Ed Lazowska%%lst%% 
Dave Patterson%%lst%% John Ousterhout%%lst%% Oliver Sharp%%lst%% 
Richard Sites%%lst%% Alan Smith ]^[ Mike Stonebraker for 
their helpful comments on the paper%%per%%]$~ ~$[Jim Larus pro%%dsh%% 
vided us with the proﬁling tool qpt%%per%%]$~ ~$[We also thank 
Mike Olson ]^[ Paul Aoki for helping us with POST— 
GRES%%per%%]$~ 
~$[References 
[ACD74] TL%%per%%]$~ ~$[Adam%%lst%% KM%%per%%]$~ ~$[Chandy%%lst%% ]^[ JR%%per%%]$~ ~$[Dickson%%per%%]$~ 
~$[A comparison of list schedules for parallel pro%%dsh%% 
cessing systems%%per%%]$~ ~$[Communications of the ACM%%lst%% 
17(12):685—690%%lst%% December 197/1%%per%% 
[ALBUM] Thomas Anderson%%lst%% Henry Levy%%lst%% Brian Ber— 
shad%%lst%% ]^[ Edward Lazowska%%per%%]$~ ~$[The Interaction 
of Architecture ]^[ Operating System Design%%per%% 
[A5591] 
[ASUSG] 
[BALLQO] 
[BALL91] 
[Ber93] 
[BL92] 
[BlaQO] 
[1m 84] 
[Cla92] 
[DG71] 
[Dis] 
[Dys92] 
[FP93] 
[H092] 
111 Proceedings of the 4th International Confer%%dsh%% 
ence on Architectural Supportfor Programming 
Languages ]^[ Operating Systems%%lst%% pages 108— 
120%%lst%% April 1991%%per%%]$~ 
~$[Administrator%%cln%% National Computer Graphics 
Association%%per%%]$~ ~$[SPEC Newsletter%%lst%% 3(4)%%lst%% December 
1991%%per%%]$~ 
~$[Alfred V%%per%%]$~ ~$[Aho%%lst%% Ravi Sethi%%lst%% ]^[ Jeffrey D%%per%%]$~ ~$[Ull%%dsh%% 
man%%per%%]$~ ~$[Compilers%%lst%% Principles%%lst%% Techniques%%lst%% ]^[ 
Tools%%per%%]$~ ~$[Addison—Wesley Publishing Company%%lst%% 
1986%%per%%]$~ 
~$[Brian Bershad%%lst%% Thomas Anderson%%lst%% Edward La%%dsh%% 
zowska%%lst%% ]^[ Henry Levy%%per%%]$~ ~$[Lightweight Remote 
Procedure Call%%per%%]$~ ~$[ACM Transactions on Com%%dsh%% 
puter Systems%%lst%% 8(1)%%lst%% February 1990%%per%%]$~ 
~$[Brian Bershad%%lst%% Thomas Anderson%%lst%% Edward La~ 
zowska%%lst%% ]^[ Henry Levy%%per%%]$~ ~$[User%%dsh%%Level Interpre%%dsh%% 
cess Communication for Shared~Memory Mul%%dsh%% 
tiprocessors%%per%%]$~ ~$[ACM Transactions on Computer 
Systems%%lst%% 9(2)%%lst%% May 1991%%per%%]$~ 
~$[Brian Bershad%%lst%% August 1993%%per%%]$~ ~$[Private Commu— 
nication%%per%%]$~ 
~$[Thomas Ball ]^[ James R%%per%%]$~ ~$[Larus%%per%%]$~ ~$[Optimally 
proﬁling ]^[ tracing%%per%%]$~ ~$[In Proceedings of the 
Conference on Principles of Programming Lan%%dsh%% 
guages%%lst%% pages 59‘70%%lst%% 1992%%per%%]$~ 
~$[David Black%%per%%]$~ ~$[Scheduling Support for ConcuI~ 
rency ]^[ Parallelism in the Mach Operating 
System%%per%%]$~ ~$[IEEE Computer%%lst%% 23(5):35 43%%lst%% May 
1990%%per%%]$~ 
~$[Andrew Birrell ]^[ Bruce Nelson%%per%%]$~ ~$[Implement%%dsh%% 
ing Remote Procedure Calls%%per%%]$~ ~$[ACM Transac%%dsh%% 
tions on Computer Systems%%lst%% 2(1):?19‘59%%lst%% Febru‘ 
ary 1984%%per%% 
%%per%%1%%per%%D%%per%%]$~ ~$[Clark%%per%% lVindow Programmer’ Guide To 
OLE/DUE%%lst%% Prentice—Hall%%lst%% 1992%%per%%]$~ 
~$[L%%per%%]$~ ~$[P%%per%%]$~ ~$[Deutsch ]^[ C%%per%%]$~ ~$[A%%per%%]$~ ~$[Grant%%per%%]$~ ~$[A ﬂexible mea~ 
surement tool for software systems%%per%%]$~ ~$[In IFIP 
Congress%%lst%% 1971%%per%%]$~ 
~$[Digital Equipment Corporation%%per%%]$~ ~$[Ultriz 114%%per%%2 
Pixie Manual Page%%per%%]$~ 
~$[Peter Dyson%%per%%]$~ ~$[Xtensions for Xpress%%cln%% Modular 
Software for Custom Systems%%per%%]$~ ~$[Seybold Report 
on Desktop Publishing%%lst%% 6(10):1—‘%%per%%’%%per%%1%%lst%% June 1992%%per%%]$~ 
~$[Kevin Fall ]^[ Joseph Pasquale%%per%%]$~ ~$[Exploiting in— 
kernel data paths to improve I/O throughput 
]^[ CPU 3%%per%% vailability%%per%%]$~ ~$[In Proceedings of the 
1993 Winter USENIX Conference%%lst%% pages 327— 
333%%lst%% January 1993%%per%%]$~ 
~$[Keiran Harty ]^[ 
David Cheriton%%per%%]$~ ~$[Application—controlled physi%%dsh%% 
cal memory using external page—cache manage— 
ment%%per%%]$~ ~$[In Proceedings of the 5th International 
Conference on Architectural Support for Pro%%dsh%% 
gramming Languages ]^[ Operating Systems%%lst%% 
October 1992%%per%% 
215 
[11K93] 
[HKM+88] 
[Int86] 
[JRTSS] 
[K ar89] 
[K1886] 
[LB92] 
[McF89] 
[MJ93] 
[M RA87] 
[P1190] 
[RDH+ 80] 
Graham Hamilton ]^[ Panos Kougiouris%%per%%]$~ ~$[The 
Spring nucleus%%cln%% A microkernel for objects%%per%%]$~ ~$[In 
Proceedings of the Summer USENIX Confer%%dsh%% 
cncc%%lst%% pages 1477159%%lst%% June 1993%%per%%]$~ 
~$[J%%per%%]$~ ~$[Howard%%lst%% M%%per%%]$~ ~$[Kazar%%lst%% S%%per%%]$~ ~$[Menees%%lst%% D%%per%%]$~ ~$[Nichols%%lst%% 
M%%per%%]$~ ~$[Satyanarayanan%%lst%% R%%per%%]$~ ~$[Sidebotham%%lst%% ]^[ 
M%%per%%]$~ ~$[West%%per%%]$~ ~$[Scale ]^[ Performance in 3%%per%%]$~ ~$[Dis%%dsh%% 
tributed File System%%per%%]$~ ~$[ACM Transactions on 
Computer Systems%%lst%% 6(1):51—82%%lst%% February 1988%%per%%]$~ 
~$[Intel Corporation%%lst%% California%%per%%]$~ 
~$[Intel 80386 Programmer’s Reference Manual%%lst%% 
1986%%per%%]$~ 
~$[Michael B%%per%%]$~ ~$[Jones%%lst%% Richard F%%per%%]$~ ~$[Rashid%%lst%% ]^[ 
Mary R%%per%%]$~ ~$[Thompson%%per%%]$~ ~$[Matchmaker%%cln%% An in%%dsh%% 
terface speciﬁcation language for distributed 
processing%%per%%]$~ ~$[In Proceedings of the 12th ACM 
SIGACT%%dsh%%SIGPLAN Symposium on Principles 
of Programming Languages%%lst%% pages 225435%%lst%% 
January 1985%%per%%]$~ 
~$[Santa Clara%%lst%% 
Paul A%%per%%]$~ ~$[Karger%%per%%]$~ ~$[Using Registers to Optimize 
Cross—Domain Call Performance%%per%%]$~ ~$[In Proceed%%dsh%% 
ings of the 3rd International Conference on 
Architectural Support for Programming Lan%%dsh%% 
guages ]^[ Operating Systems%%lst%% pages 1947204%%per%%]$~ 
~$[April 3~6 1989%%per%%]$~ 
~$[Steven R%%per%%]$~ ~$[Kleiman%%per%%]$~ ~$[Vnodes%%cln%% An Architecture 
for Multiple File System Types in SUN UNIX%%per%%]$~ 
~$[In Proceedings of the 1986 Summer USENIX 
Conference%%lst%% pages 238—247%%lst%% 1986%%per%%]$~ 
~$[James R%%per%%]$~ ~$[Larus ]^[ Thomas Ball%%per%%]$~ ~$[Rewrit%%dsh%% 
ing executable ﬁles to measure program be— 
havior%%per%%]$~ ~$[Technical Report 1083%%lst%% University of 
Wisconsin%%dsh%%Madison%%lst%% March 1992%%per%%]$~ 
~$[Scott McFarling%%per%%]$~ ~$[Program optimization for 
instruction caches%%per%%]$~ ~$[In Proceedings of the In%%cln%% 
ternational Conference on Architectural Sup— 
port for Programming Languages ]^[ Operat%%dsh%% 
ing Systems%%lst%% pages 183—191%%lst%% April 1989%%per%%]$~ 
~$[Steven McCanne ]^[ Van lacobsen%%per%%]$~ ~$[The 
BSD Packet Filter%%cln%% A New Architecture for 
User—Level Packet Capture%%per%%]$~ ~$[In Proceedings of 
the 1993 Winter USENIX Conference%%lst%% January 
1993%%per%% 
l%%per%%]$~ ~$[C%%per%%]$~ ~$[Mogul%%lst%% R%%per%%]$~ ~$[F%%per%%]$~ ~$[Rashid%%lst%% ]^[ M%%per%%]$~ ~$[J%%per%%]$~ ~$[Ac%%dsh%% 
cetta%%per%%]$~ ~$[The packet ﬁlter%%cln%% An cﬂicient mecha— 
nism for user—level network code%%per%%]$~ ~$[In Proceed%%dsh%% 
ings of the Symposium on Operating System 
Principles%%lst%% pages 39—51%%lst%% November 1987%%per%%]$~ 
~$[Karl Pettis ]^[ Robert C%%per%%]$~ ~$[Hansen%%per%%]$~ ~$[Proﬁle 
guided code positioning%%per%%]$~ ~$[In Proceedings of 
the Conference on Programming Language De%%dsh%% 
sign ]^[ Implementation%%lst%% pages 16—27%%lst%% White 
Plains%%lst%% New York%%lst%% June 1990%%per%%]$~ ~$[Appeared as 
SIGPLAN NOTICES 25(6)%%per%%]$~ 
~$[David D%%per%%]$~ ~$[Redell%%lst%% Yogen K%%per%%]$~ ~$[Dalal%%lst%% Thomas R%%per%%]$~ 
~$[Horsley%%lst%% Hugh C%%per%%]$~ ~$[Lauer%%lst%% William C%%per%%]$~ ~$[Lynch%%lst%% 
[Sam88] 
[5390] 
[501693] 
[SFGMQS] 
[St087] 
[St088] 
[SWG91] 
[TAss] 
[Thiﬁz] 
[VCGSQZ] 
[VVSTSB] 
[Web93] 
[YBA93] 
Paul R%%per%%]$~ ~$[McJones%%lst%% Hal G%%per%%]$~ ~$[Murray%%lst%% ]^[ 
Stephen C%%per%%]$~ ~$[Purcell%%per%%]$~ ~$[Pilot%%cln%% An Operating Sys%%dsh%% 
tem for a Personal Computer%%per%%]$~ ~$[Communications 
of the A01”%%lst%% 23(2):81~92%%lst%% February 1980%%per%%]$~ 
~$[A%%per%%]$~ ~$[Dain Samples%%per%%]$~ ~$[Code reorganization for in 
struction caches%%per%%]$~ ~$[Technical Report UCB/CSD 
88/447%%per%%]$~ ~$[University of California%%lst%% Berkeley%%lst%% 0C%%lst%% 
tober 1988%%per%%]$~ 
~$[Michael Schroeder ]^[ Michael Burrows%%per%%]$~ ~$[Per%%dsh%% 
formance of Fireﬂy RPC%%per%%]$~ ~$[ACM I‘mnsac» 
tions on Computer Systems%%lst%% 8(1):1—17%%lst%% Febru%%dsh%% 
ary 1990%%per%%]$~ 
~$[Richard L%%per%%]$~ ~$[Sites%%lst%% Anton Chernoff%%lst%% Matthew B%%per%%]$~ 
~$[Kirk%%lst%% Maurice P%%per%%]$~ ~$[Marks%%lst%% ]^[ Scott G%%per%%]$~ ~$[Robin%%dsh%% 
son%%per%%]$~ ~$[Binary translation%%per%%]$~ ~$[Communications of 
the ACM%%lst%% 36(2):69—81%%lst%% February 1993%%per%%]$~ 
~$[M%%per%%]$~ ~$[Stonebral%%dsh%%zer%%lst%% J%%per%%]$~ ~$[Frew%%lst%% K%%per%%]$~ ~$[Gardels%%lst%% ]^[ 
%%per%%I%%per%%]$~ ~$[Meridith%%per%%]$~ ~$[The Sequoia 2000 Benchmark%%per%%]$~ 
~$[In Proceedings of the ACM SIGMOD Inter%%dsh%% 
national Conference on Management of Data%%lst%% 
May 1993%%per%%]$~ 
~$[Michael Stonebraker%%per%%]$~ ~$[Extensibility in POST~ 
GRES%%per%%]$~ ~$[IEEE Database Engineering%%lst%% Septem%%dsh%% 
ber 1987%%per%%]$~ 
~$[Michael Stonebraker%%per%%]$~ ~$[Inclusion of new types in 
relational data base systems%%per%%]$~ ~$[In Michael Stone%%dsh%% 
braker%%lst%% editor%%lst%% Readings in Database Systems%%lst%% 
pages 480—487%%per%%]$~ ~$[Morgan Kaufmann Publishers%%lst%% 
Inc%%per%%%%lst%% 1988%%per%%]$~ 
~$[J%%per%%]$~ ~$[P%%per%%]$~ ~$[Singh%%lst%% W%%per%%]$~ ~$[Weber%%lst%% ]^[ A%%per%%]$~ ~$[Gupta%%per%%]$~ 
~$[Splash%%cln%% Stanford parallel applications for 
shared—memory%%per%%]$~ ~$[Technical Report CSL—TR—Sl— 
469%%lst%% Stanford%%lst%% 1991%%per%%]$~ 
~$[Shin—Yuan Tzou ]^[ David P%%per%%]$~ ~$[Anderson%%per%%]$~ ~$[A 
Performance Evaluation of the DASH Message%%dsh%% 
Passing System%%per%%]$~ ~$[Technical Report UCB/CSD 
88/452%%lst%% Computer Science Division%%lst%% University 
of California%%lst%% Berkeley%%lst%% October 1988%%per%%]$~ 
~$[Thinking Machines Corporation%%per%%]$~ ~$[CM—5 Net%%dsh%% 
work Interface Programmer’s Guide%%lst%% 1992%%per%%]$~ 
~$[T%%per%% von Eicken%%lst%% I)%%per%%]$~ ~$[Culler%%lst%% S%%per%%]$~ ~$[Goldstein%%lst%% ]^[ 
K%%per%%]$~ ~$[Schauser%%per%%]$~ ~$[Active Messages%%cln%% A Mechanism 
for Integrated Communication ]^[ Computa— 
tion%%per%%]$~ ~$[In Proceedings of the 19th Annual Sym%%dsh%% 
posium on Computer Architecture%%lst%% 1992%%per%%]$~ 
~$[Robbert van Renesse%%lst%% Hans van Staveren%%lst%% ]^[ 
Andrew S%%per%%]$~ ~$[Tanenbaum%%per%%]$~ ~$[Performance of the 
World’s Fastest Distributed Operating System%%per%%]$~ 
~$[Operating Systemic Review%%lst%% 22(1):25734%%lst%% Octo— 
ber 1988%%per%%]$~ 
~$[Neil Webber%%per%%]$~ ~$[Operating System Support for 
Portable Filesystem Extensions%%per%%]$~ ~$[In Proceed%%dsh%% 
ings of the 1993 Winter USENIX Conference%%lst%% 
January 1993%%per%%]$~ 
~$[Curtis Yarvin%%per%%]$~ ~$[Richard Bnkowski%%lst%% ]^[ Thomas 
Anderson%%per%%]$~ ~$[Anonymous RFC%%cln%% LOW Latency 
216 
Protection in a 64—Bit Address Space%%per%%]$~ ~$[In Pro%%dsh%% 
ceedings of the Summer USENIX Conference%%lst%% 
June 1993%%per%% 
