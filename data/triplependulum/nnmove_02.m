function [Y,Xf,Af] = nnmove_02(X,~,~)
%NNMOVE_02 neural network simulation function.
%
% Auto-generated by MATLAB, 26-Jun-2022 14:48:04.
% 
% [Y] = nnmove_02(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 6xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 3xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-0.522948433858415;-7.90783436538401;-0.977304238895497;-18.8775838797193;-0.859436928349152;-16.9822596206392];
x1_step1.gain = [1.84068276892408;0.136776806701662;1.00946374175152;0.0533592207210521;1.16260738911953;0.0610285700634473];
x1_step1.ymin = -1;

% Layer 1
b1 = [-2.521573324601132704;-2.3260363799927348261;-1.8768765916366529911;1.9941004375722377606;-0.97292921259053244398;-1.2245897612151195322;-1.9761279833013722929;-0.39878072505299305694;0.38494557408632101847;0.027102589749663428403;0.10733866477953986351;0.12653588202403434626;0.44596257781257170327;-0.65059564229225019805;0.83257063083219551292;-1.9035893258525193872;-1.6721156360437781085;2.1712738602356962403;2.042861390997949389;-2.5205608138490975811];
IW1_1 = [0.067891792232233488802 0.83957640197041494279 1.5795503288767334116 -0.63932361280496752265 -0.95815869898310002117 0.25318689828605467351;0.34361722238135899987 -1.2681745002798368027 0.10306196907121605022 1.764949055214652951 -0.21147725918594970085 0.28732792596410033914;0.74077899356972132239 -0.02106102515056919311 1.2297661362156298015 -0.76645089461811588549 0.013815669384659903796 -1.5027435113246678799;-0.45247973908053279457 1.3488131922410659946 0.13041027309609679041 -1.1120886874742401673 -0.090845713017779550214 1.2076495732682939188;0.34123194782928795155 1.5120967935595959197 0.32018935394155118024 -1.5333864058528321461 -0.0784688712734087912 -0.52440217698320401585;0.6015180087256805086 0.4462062679721898184 0.67147790098720661067 -0.65152518569051320885 -0.97563405867896335621 -0.66339723992893107063;-0.3795202043468703379 -0.72430700392931046672 1.3826742540555616579 0.0059882643694728586448 0.53042892733428825824 -1.257189052580973021;0.15719763249243165482 1.4266011997351490947 1.0615191330799720326 -0.70172172440577906816 -0.42021437651675719316 -0.6033250661017407479;-0.82382202021414019377 0.38575935997453963955 -0.90113566946023337945 -0.96512068284481300484 -0.11589570305339925993 -0.80717867896259143379;1.2075191478966991188 0.49816697862597608681 -0.3093099687773814277 1.7590551376796057514 -0.62737985153337461064 -0.20908136347333738936;-0.44853777686772627886 -0.59221185880826443526 0.71639121211612744045 0.98517144348984397872 0.26014753503174015137 0.46509999380587480067;-0.24093164913092443569 0.40331961335020877213 0.56035348456267974893 -1.1249664107313368522 -0.71726202590467347253 -0.85662269439920701863;1.4959630093852589461 0.58792693633122095065 -0.016462259902299235248 1.0065449330248623649 0.22221018948736898091 0.95497623612619286781;-0.6430561522602240565 -1.7311880669940142852 -0.25758407283108591956 1.3804780065197523875 -0.1088441143733811789 0.16487601754899430806;0.86104895988241725302 0.011740043402583395793 0.17031211015065966796 -1.3075112212727892924 -0.95509413348812788325 -0.64300343899035272699;-0.09228290816993962864 0.85280476904905755386 0.35175376100067573537 1.2992927159862748265 -0.36400613892747835099 -1.2096689565805609501;-0.39548544499668314423 -0.084547706478182937939 0.44730878164941767494 1.2002599203123389682 0.43136461566946410207 1.5589003900046116691;0.80777258013154795702 -1.2752083402810974189 0.18044918069740423228 -0.052642033198213970813 -0.7940088253628790893 -0.87219664918289829814;0.79948121848544717594 -1.014824553208053981 -0.73044016407683298731 -1.1692421325665975917 -0.14233568318068307024 -0.044729123008153688634;-0.16546970557323323336 1.5239186890948430708 0.15547414501325487746 0.11773497472018901178 1.2988394429500356164 0.43408145343963500107];

% Layer 2
b2 = [1.6576515315057354094;-0.82599738204818173859;-0.99506480556083620748;0.65728365026295720863;0.31503570962083898843;-0.30855487711142409735;-0.27881860739882857736;0.97306879400080648068;-1.2984406337938285692;-1.5415024467483871007];
LW2_1 = [-0.23002345701374657394 -0.25768218728185293687 0.40912097443825834464 -0.48038032958407245188 0.14183801901644754739 0.36063279902025602297 0.18245536567778375403 0.53671686138299246061 0.49223424107386481996 -0.67494538991551722429 -0.50662380528492567677 0.2247955474736618442 0.2834747753023004746 0.10647286046155632344 -0.32658800084793299101 0.3364521351549405459 0.35012497764633154773 -0.48039002409307007824 -0.086802720184144879778 0.19387357946518207763;0.17484236456883511801 0.22048267788823894264 -0.1550187574624120046 -0.055798588630338236127 -0.61675759614894953842 -0.093559548236037404223 -0.18684398553710196422 -0.16527332951302506348 0.16801172941064632105 0.0022887465580620561245 0.10742624598945625658 0.34209432044254606264 0.082411683883947900453 0.46914475651400322498 -0.10175014975449186982 -0.078695844056911060105 0.28572003230999243328 0.063946053474663921978 -0.18099603327770041883 -0.64449235741998778249;0.20751647283223859097 -0.14328290677228502914 0.70639999653367036014 -0.48256501297309772891 0.26176148055325726416 0.21786324223106554032 0.45272414428225971061 0.056025522908599495464 -0.45935456152001657992 -0.043375960999991539091 -0.37364373679590062727 -0.44726038461902317689 0.49609892673827271636 0.28142164216675841226 -0.12340250754339152084 -0.38930473321490771665 0.28371629010328497378 0.62301990596364231756 0.17754422544868123102 0.09001057695604401665;-0.47572766233308327877 0.2567096973078445421 -0.038233810803942946954 -0.012418053485392559557 0.4518172379561600227 0.40716580433923132976 0.37704374114162103604 -0.12735208394693325884 -0.10481651114634880917 0.24788046144070793875 -0.44674504017616828433 -0.26068723759772982618 -0.41552917984241988236 -0.023329983948819778272 0.10958940534742006578 -0.017749969577904752688 -0.50214139623151687886 -0.22963666776767399647 0.54364211315072941133 -0.40568445472395991969;0.11362548986208381718 -0.69443447346365194672 0.098423000292391746302 0.00030390848223644199985 -0.065706477166021640124 -0.12891111323943241218 -0.47739512124209443344 -0.19154717727168293906 0.027638242885540606486 -0.22545388280085623678 -0.14639221361927676202 0.12201193387565426041 0.2197627755519069026 -0.20258461599873606174 -0.23592385542716587388 0.090391404335145489335 1.0098135840013908737 0.30222973727067803384 0.10060078829468530048 0.22052272235908820797;-0.23447124188299844905 0.47627146543332254947 -0.7363485685302719741 -0.0071801653581515054864 0.56136130806211259614 -0.18346085278741508517 -0.10022259947400444235 -0.11082015009816433004 0.5732588209064399809 0.3927052745306360837 -0.13304728614524102825 -0.39886759314089481609 0.24793099045280558856 -0.23805779046571343138 0.3766261719827003196 -0.34239862128681591846 0.55515373379001253795 0.054994852468680389956 0.88170933153799613269 -0.18546057694805490046;-0.17244773775472810318 0.37162662981599603462 0.042590618453546599809 0.21570864985559698446 -0.6780968603362679259 0.0091525647360111775375 0.050919755911174931218 0.20518487313584474196 -0.13933026656159988588 0.053604757637625760625 0.91802864460517785705 -0.41091041496955443835 -0.25488931536459619176 0.12723554389895713745 0.13396153760953957712 -0.31737027345595475447 0.21025054935482223595 0.14454075062833848797 -0.50903355446736209267 0.48342911112622749537;0.17207979500592637812 -0.41099887153050046473 -0.30257551970696711097 -0.41218996498332582945 -0.2550674580357967236 0.011491007935464288628 -0.46023315948652315788 0.24775667944839924184 -0.077827957555937354872 0.12697914874684690378 1.2792795004030310668 -0.19099917535544205793 0.057425778418378883861 0.047374325543721826359 -0.48392664479706515301 0.35179942180819734343 0.091882325891593064071 -0.16794120017618485718 0.085864937055252665843 -0.43113384628953405064;-0.37711680517169199334 0.2376299680470925213 -0.18478280174531194757 -0.18954095771531029313 0.66121281988160174325 -0.36400094163486085286 0.62778994688508071853 -0.020410793551625082409 0.10900908527151734195 0.39776075768029284241 0.28007578759652751454 0.40640282782534553618 -0.29336526374305105236 0.3994052393907255305 -0.025324927863903508307 -0.20818204081287067231 -0.044939971184630576884 -0.35577513729224669037 -0.64458434190787983198 -0.40503791620406093266;-0.29935112637084021481 -0.10456318809638415201 -0.72029557260693299892 0.18522895178679696371 0.35184639587740385025 -0.012676972317309569138 -0.28247511634053534824 0.46261939338586288706 -0.30949623166239448313 0.38713464767725441762 -0.6147501410892282081 0.46974759799364862456 -0.48107920648714269651 0.31539807055825597182 -0.32672384540948645748 -0.18304264161397110211 -0.2775724982624016568 -0.58463734420759738697 -0.58426733911090555917 0.20475869672483090755];

% Layer 3
b3 = [1.979277226524128297;-1.6216297838032602829;1.5947884304360169239;1.4295212363818292634;1.1107496641828613626;-0.94654379418366285659;0.65206648443241832513;-0.54127239334832544237;-0.046504569271976575751;-0.03297067158614599286;-0.086006409473668540833;-0.3882499588695744186;0.53234940178411682687;-0.69759571965041400343;-0.70455747188303785578;-1.1254625563899522955;-1.2612362967939314551;-1.4779750201452575009;1.8054713945556528643;-1.8892175187318713814];
LW3_2 = [-0.87178246150505445122 -0.52269236106157079824 -0.81614130147560282058 -0.60481035174039443625 -0.10776302696460517139 -0.30310993744365882785 -0.24340351735349011197 0.65019099597316221129 0.88095795948558019983 0.30320377168797724154;0.16983078440800417064 -0.35664361640339348192 -0.17645809484904734221 0.989352090816405072 0.80186037079517169524 0.47854387714980695101 -0.48668556847878313709 -0.86011499077344644171 0.77179709183955214069 -0.4073681686597806495;-0.56990789896956040028 0.11804070675729881612 -0.48413975610981274666 0.87520188974331836196 -0.70044584632042050654 0.44377315521662941133 -0.70695410850929485402 0.30313443441944853962 0.46656444083682874213 -0.74376320030464349031;-0.48169004949525534576 -0.25649524254713662597 -0.75873934615066518372 0.13223182693887630679 0.14971463602813483984 0.26335706385924179118 1.16110065776011262 0.0064245032884924476238 0.48018851327413197838 0.39369571706952904977;-0.061748035757942985879 -0.35247859124527675112 -1.0000133061152249869 0.58898345342758950949 0.68854403646074158196 0.42934055768856416169 0.6197088592094600612 0.11930993798153309571 0.8624292460182464426 -0.57990069206732464124;0.84984666164767896923 0.29451713130198264867 1.080404289291960751 -0.48755841700532531746 -0.74610101873568857034 -0.074268485281880430859 -0.74064219415247700695 0.30108414111672582303 0.028391122472479889821 0.5942865803813358605;-0.71542748138464784535 -0.2295790322838352493 0.76216470186503626483 0.54478683114552473032 -0.47304394606865890482 -0.42212104725781013359 0.38337903255752187048 -0.8875746131646734538 -0.45417377918285817273 0.86235986160233590869;0.03558515420436551141 0.63636683166259766509 -0.86687944390747850854 0.39254600231476977079 0.15753157112899757175 0.80400061864175276227 0.75875893150488094019 0.15231246353074290312 -0.97861306166916961491 -0.36753991576140077058;0.34404508816326589971 0.95546565177702935667 0.15252037473512772281 0.18458854507893099339 -0.045350647288146979375 -0.6128768659167592725 0.81185745834281364264 0.79510117058291651659 -0.95305752148079692088 -0.79721053827659016378;0.45876668576142337619 -0.48432359088613180509 0.66878960976967294361 0.57747081574415426442 0.3454773952006696125 1.0320496635411779973 0.50966669490899052519 0.2954066642078860272 0.040253498097896758812 -0.86119441653050865515;-0.39735495643421520073 -0.81297277872000284216 1.130328031981354675 -0.11913842707417186817 0.68191427908379820266 0.42660981731084107738 -0.32759465663004005975 -0.21013581974548620201 -0.12839085987527690258 1.0958324517661377495;-1.0568750138033184971 -0.11819286625796263102 -0.24546569001213727756 -0.78825826164414114494 -0.14781662518175250898 0.36864824853392608173 0.8492424370693645308 -0.24205033193541974912 1.0839126781199976968 0.39749149670470396156;0.47223797653760929416 -0.69826529055460262452 0.0010469639301846377956 0.19954195111774322702 0.20099509806638071741 0.66923416145172953673 0.092472349801163242211 0.57452434661794637982 0.89276976850351064119 -0.9482603125278482592;-0.32205247155156613292 0.55678026482519848983 0.56553660377231051992 0.08238620252207871919 -0.0079360462408048677851 0.3469022865419463808 1.1854977297639071043 0.076018084611144731699 0.70366642178741412028 -0.8531135857120781818;0.10570845294815182924 -0.58490897591701951352 -0.020097477092566561063 -0.24572841343946691395 -0.025277028599988989044 0.197056922935616885 0.65437725055785045392 0.48182818905039714874 0.58642076447389746008 -1.2236123771818463446;-0.60375454745101631016 0.47206715901576690175 -0.37247084540922803519 0.53484338752018434349 0.73024607733182633762 -0.13435250872362894392 0.9470764518553949074 -0.2929761831322879595 -0.29678566065287381726 0.67090320825208604738;0.52450980965160798331 0.59627060026129419246 -0.28659765347938481739 -0.93347321106423475356 0.95576803182312919382 0.61380157403047708176 -0.1033660395151388689 -0.50720705210327055035 -0.101028495081084288 0.86779199917442129131;-0.43158624036415482728 0.15232949898130293542 -0.09222043872476987092 -0.65546694616155454227 0.56074245110995379893 -1.0874786195754384543 0.023911489139762216738 0.64294091047651702464 0.71812337381108271028 -0.84110295414673486025;0.85288716213292359303 0.36249646170712490623 -0.8970101979415353588 0.51420121852751732305 0.79250163632704351269 -0.52888404282097789544 -0.43377892754967195543 0.67024091062477320069 0.087499156126550362012 0.11501101048538343863;-0.12345193924850515754 -0.64282406890564858237 -0.59193058726037528494 -0.18020069625150250681 -0.86057362200591658308 -0.5130250481028548748 0.42864432854120176897 -0.8423243322817044465 0.40151059628365304288 0.83912017865197607858];

% Layer 4
b4 = [-0.0079653675270625855231;0.48769569581354793586;0.098270525036142072905];
LW4_3 = [-0.70905578594127327552 -0.69247229505561358476 -0.01069268330578564824 0.69726199006916744771 -0.59097842323355742611 0.72082991399617879491 -0.083560666745822409496 0.79450301704870773811 -0.063677196554135881423 -0.23625111460641509686 -0.82328702741374082397 0.13545830065059835667 -0.41489885062997555742 0.65383368080037795878 0.28894499894727465605 -0.061200961581723507809 -0.75897015298554548757 0.58346709714079714182 0.2308922285516885331 -0.45237973953711596575;-1.0829721046432083664 0.90461560870180568461 0.58885236719345590561 -0.035891992332218056183 0.076980305160718839885 0.68155859383707306787 -0.028112386689809226725 -0.80064931350713730573 0.26649965504542960648 0.14571708127172477987 0.76613434904283506111 -0.64981864646621334547 0.79815014733645839318 -0.80040705482132568083 -0.54154680285430289999 0.35685410037035231179 0.60916998446058923111 -0.65273799391889164578 0.42187683183268320786 0.1162193515402809435;0.086351096021416162696 0.53419944144019471111 -0.73749597651918730179 -0.50636283215068933483 0.64442195964099080463 -0.088861476869453934202 0.11966266789112137148 -0.180775722339300976 -0.26909540889515637385 -0.3457875896710437269 -0.15220922059629560241 0.55795596013696757698 -0.36369406781404267637 0.2236650484566376218 -0.69971475821105300064 -0.90314144970746712549 -0.062364551617616094392 -0.9850512339375696591 -0.023541026464421750675 -0.62334029241967203738];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [1;1.55897964794072;3.91201408308181];
y1_step1.xoffset = [-1;-0.637817647182949;-0.252411341138969];

% ===== SIMULATION ========

% Format Input Arguments
isCellX = iscell(X);
if ~isCellX
  X = {X};
end

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
  Q = size(X{1},2); % samples/series
else
  Q = 0;
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS

    % Input 1
    Xp1 = mapminmax_apply(X{1,ts},x1_step1);
    
    % Layer 1
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*Xp1);
    
    % Layer 2
    a2 = tansig_apply(repmat(b2,1,Q) + LW2_1*a1);
    
    % Layer 3
    a3 = tansig_apply(repmat(b3,1,Q) + LW3_2*a2);
    
    % Layer 4
    a4 = repmat(b4,1,Q) + LW4_3*a3;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a4,y1_step1);
end

% Final Delay States
Xf = cell(1,0);
Af = cell(4,0);

% Format Output Arguments
if ~isCellX
  Y = cell2mat(Y);
end
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
  y = bsxfun(@minus,x,settings.xoffset);
  y = bsxfun(@times,y,settings.gain);
  y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
  a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
  x = bsxfun(@minus,y,settings.ymin);
  x = bsxfun(@rdivide,x,settings.gain);
  x = bsxfun(@plus,x,settings.xoffset);
end
