function [Y,Xf,Af] = nnmove_09(X,~,~)
%NNMOVE_09 neural network simulation function.
%
% Auto-generated by MATLAB, 26-Jun-2022 00:33:42.
% 
% [Y] = nnmove_09(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 6xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 2xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-2.14176009391765;-2.93543929307278;-1.8561936087052;-2.57890731985373;-1.54345157753531;-12.2663909617541];
x1_step1.gain = [0.522374734117766;0.298150665874942;0.578276914781939;0.499353559330748;0.648899015595415;0.0914060631117237];
x1_step1.ymin = -1;

% Layer 1
b1 = [3.1079375033873555267;-2.9792119664496325981;1.0343426821888284106;-1.5420946591251707414;-1.9066607313014709568;-1.997315154166151574;0.45648862939383116899;1.1533629609374935754;-0.34001060569130336919;-0.25127577854883487163;0.031741258096404510736;1.0392829335533524393;1.1357337280883967878;0.95766027484536420111;-2.1367995951831351142;-0.79567436620709219852;-1.8643131657432960857;1.3665043989231986377;1.4065430503552636132;2.6483254826653133129];
IW1_1 = [0.19699616458236809957 -1.0315153541605321941 -1.3941737927666306707 0.007903413375047303735 -0.91098450594490221199 -0.11998361990164334301;0.60421549519903572367 0.68598219940080340518 -0.0067348458897191661177 -0.61543422073630194014 -0.41646862452883742778 -0.49265385211981382874;0.09349124051707062566 0.85036792901486724094 0.81412421961131153925 0.012963442046660328746 -0.72568475874648585844 -1.5716345754942830926;-0.0063599151193337684004 0.41604485453141215601 0.81307030300232596698 -0.41979813457931441922 -0.1751729569052720703 -1.9776936707570700325;-0.084327609688009771971 0.69044961608848498535 0.40216490459864873142 -0.7475757403446120497 0.93978134660775625164 1.1036135359283560931;-0.44096521667989269089 -0.023663621503257029066 -0.45542643639129209987 -0.94588574048495854818 0.43031460783767083722 -0.15210063434739209964;-0.10173237087985943783 -0.13729024239493498039 -0.37826051201844079763 -0.33447611977555857798 0.22269995421830490745 0.28849981263173646306;-0.64464192639811657148 -0.9740865508935747652 1.5083342280586711226 1.6107064734806344486 1.2346258307161805945 1.6366526688159657166;0.57324227851835374281 0.6257281351905926714 -0.020856915181460232434 0.062313309754227781678 -1.2032030650197211852 -1.5067008864184436856;-0.24946813569629802676 -0.33577769911303634309 0.017785999338731192654 0.02036190735484312217 0.55116441989937059454 0.71332621472565393983;0.23906721636976357992 -0.36393103605901949704 -0.079785868493403230839 0.77630805402113678415 0.061557185078670050016 -1.8319249734271902952;0.73854164674251965295 1.0641803221289687365 -1.0137773775462917136 -0.54864809183367524437 -1.2594814622497612078 0.9934237425033189961;0.80259747480848853129 0.62485880011626482311 1.6019416643125026223 1.410839163653285766 0.21359275142215292109 0.95177996512908613624;0.90228806943642458904 1.1731835598261011189 -0.87676239901022279266 -0.50248297441399092378 -1.3349932805334439045 1.0563202853593054442;-0.21663790015353273644 0.13968280596935223059 -0.79687816360248042713 -1.1338857126174171075 -0.54437098617322010607 -2.2863689858448204006;-0.53835586498022636182 -0.98981848869777355748 -0.22223596517568583453 0.52359778641513321507 0.76403060450749338273 1.2198479261852217537;-1.214610844145182833 -1.438642055211276638 0.31724027827506245947 0.20540896161460814318 1.7233189101152814882 0.23583901127056916547;0.43187557856052982697 -0.38638357568860942637 0.086721677266164309827 0.75506847797600840089 -0.59982586839782414678 -0.2624127310799975743;-0.0049174403399533158504 -0.47890206183379452343 0.5771174912362145859 0.052604470173460871063 0.72122896752312792845 0.34983343167130176443;0.50592424654160261799 0.79131083809557101194 1.2742257404899326456 0.56352453619157849563 -0.51131586688006291919 -0.53395601005855186649];

% Layer 2
b2 = [0.5765710323905849366;-1.0379391121457339775;0.75486000976510470029;0.51048288935196373117;-0.14346357664326145342;-0.14816061899462990015;-0.06012394512854730283;1.0483848816527665537;-0.95735863119853015224;1.727908017970626986];
LW2_1 = [-0.4877277645190995492 0.5138935819070457045 -0.077545085745824804402 -0.10209523966118730365 0.070039313122997257088 0.22533098536835841075 0.48496556969094672951 0.99278760700264279127 -0.21586099100502181836 1.2858252339123330543 -0.0050616238722540948108 -0.10098342502978442659 0.011914010718729026866 0.035087630372749284424 -0.061990253541338066756 -0.10261365456652574157 -0.32714282492454410667 -0.13900811971824800217 -0.045606401292166552641 0.40587473078652502867;0.22855341035147208606 -0.50384492459749352644 0.16297847524956121656 -0.40299143941378307021 -0.39825295835395918553 0.0714960554233282225 -0.0019800205689992364869 -0.41708950565419838918 0.13516910807648407911 -0.62783900593349695196 -0.019427043731973119012 0.46622300660414212059 0.18681189349025978386 -0.38668979781787243821 0.31060806351381969881 0.11728160141596526145 0.14453898076749263635 0.034909181283091395009 0.15448285816827833639 -1.0854183140645057293;0.0074496451188331138868 0.13962068798127272307 0.27121540426734891405 -1.0514563758136041827 -0.66820446529788302126 -0.755712222145632051 -0.87005728662226600179 -0.46736162311079981757 0.7395070423912813995 -0.52827433238431042994 0.2686277754302163201 0.73544665324739522116 0.27998034521761105964 0.18381895181043428344 -0.4744759661246625293 0.20262094134026881198 -0.084084951779933053695 -0.29145075205838660848 0.21531285788115078761 -0.47969115627687397563;-0.76803391583138591603 0.0016568318766887423204 -0.46205495751760133905 0.068123530653658531664 -0.31527416635082461394 -0.23393579666352962154 -1.28448510025831375 0.060220177998918510143 -0.14689181394704439731 -0.18444522200284110824 -0.044997855698536162738 0.11249208240118473145 -0.027128690482896237329 -0.35728085270080844893 -0.45358120257862971636 -0.84972953839918341501 -0.82144820558745201833 -0.63383840067772301285 -0.66271501353293182923 -0.039390609862330568103;-0.17798858109746087952 0.25107185724621694511 -0.0062971445327890422303 0.11092678299061518865 0.058920173838770316388 0.080380346418401957265 1.0820379345840378527 -0.22520760302458886493 0.26131199405638061428 1.1662085880228083568 0.012671946227855558978 0.21965369106064971949 -0.05759244429463868109 -0.23148936154361818285 0.14174823730779245734 -0.1091793348871814423 -0.23814502531677120278 0.14830081412169762722 -0.12105648825111785249 0.061930289462155022062;0.83325496738905080463 0.83997934736163737401 -0.15845458575062887352 0.10619552401981161016 -0.18895688090869652842 -0.23431102736356776428 1.0101925309889057125 -0.30177473053492553934 -0.47834324188536264666 -1.4843091426591032977 -0.042914531182024900913 -0.31015637602483570046 0.032020171512599206187 0.28231297829213142236 -0.21980692385817671153 -0.12341005348865974334 0.59449024975176190111 -0.40117086084791786504 -0.030905584259111079648 -0.34774303757755653521;0.25398251894794321437 -0.36194624811619097171 0.057397973497271589927 -0.24236247404545546713 -0.10847837249045234886 0.36665119831252912519 -1.534313339801874454 0.49899399256177123796 -0.30055676283876703314 0.5859769409933796025 -0.0098088445512392232611 -0.26553650381399995783 0.048060370001710830956 0.33525499549614168338 0.18097680493828230408 0.21713842514836312336 0.60331239363094602002 0.042181474229680770982 0.21711352986591883618 -0.21914282272771912208;0.063559021698811515866 0.49142443372477051522 -1.2057563257914590167e-05 0.17158962094454019431 0.15146110514891847343 -0.051744841309892250503 -0.24217898422601730202 -0.055342906498505643753 0.16490894428258284776 -1.3136328205741756303 0.013879077811753633143 0.055814807619888988366 -0.077705769844105265776 -0.053096203404233738299 0.27565346309899324551 -0.013495096605762138195 -0.034566712757798274958 0.14943647203026741432 -0.046495319652353934992 0.32581118696891314679;-0.64380836392674234414 -0.34912778552650952646 -0.16059484854409544763 -0.15615271816168535546 -0.033481895425955060519 0.040155044289358635123 0.0089530009011086451876 0.84550270710150576825 -0.30854676477083126107 -1.7716136365346879522 -0.011274831016372950654 -0.25980106301057070972 -0.012339902154375448004 0.17385388520368247334 0.075251049614845397229 -0.16017755070228073544 -0.23863635937730456882 -0.20569416231926815342 -0.10923601849669667407 0.25988084092832669514;0.48397990306147475881 -0.57122851566506849252 0.13075320127630585265 -0.24354481255492368974 -0.30429472404318369527 -0.33029034159567616236 0.30478640679101581812 -0.084870625458394868823 -0.31581791821989835256 0.37290985862975306597 0.63914458268475005109 0.1264969466188685665 0.41841228085676729354 0.35049869150421258945 -0.23714076763821068106 0.46584913379946019107 0.11900706607296511474 -0.42287673682847687351 0.63796360065222845748 0.022309038558997705548];

% Layer 3
b3 = [2.1791975997025865297;1.7440296256710705602;1.7578460389488803628;1.3535301335956921864;-1.1882747733862966122;0.81779293265912023081;-0.58862749271040049059;0.050947065072817307452;-0.19001060551132334386;0.57550250210656406225;-0.26243404197755593188;0.19520340099401556344;-0.68952422064034102345;0.64872155172401946288;1.3032345445910618054;0.8769875389726525805;1.2587453899651590561;1.454907030578859839;-1.8501146911789327909;-1.70850879384476384];
LW3_2 = [0.015584137820960115503 -0.31309532923622879208 -0.6392792160577078775 0.23877997677607437632 0.1898179499398076342 0.44666351414426425093 -2.3255563780922905437 0.93127345281290141443 0.97157964151643405604 -0.20668129221788544836;0.025145999780327842749 -0.62594135771520864608 -0.71641158834120233223 1.4307758203522187301 -0.067024042503792152781 0.20634730311320118035 0.71767132369427677485 0.59088969259127166467 -0.21156569510920203436 0.61245635013741728248;-0.44099954182569911509 1.4629523130753920857 1.1126309559699743001 -0.019861728343409795761 0.21887364914375576075 0.73004400133774360881 0.24978250029966772572 0.49234558901225350391 -0.51130012765931287522 0.16196011903020826606;-0.98714906804930380169 0.01756581743450954386 0.51762269040587738367 0.62911761630820683955 -0.34614252872369188907 0.36700045908169798281 -1.0240678673891232542 0.32282849622550241486 -1.1660216823023878963 0.89040846373156612437;0.66699689503504222543 -0.48886624814768481206 -1.0311538601748282407 0.031592649052058489889 -0.75424094613643710705 0.29657371233645141162 -0.74606373423658045585 0.3563630622226452993 -0.98398525760482746794 0.45196275633620813794;-0.34481465039573783171 0.5693095441481660357 -0.052019831848798998852 0.41312361130620561811 -0.66490350580878243569 -0.10449474297136675249 -0.0017010905868477957728 0.0003506791697763466352 0.016338418372078739732 0.39998019399962536635;-1.1580634390632540409 0.30179370710107694675 0.00069050817238970976265 0.45764508965490030556 0.58820805355349348176 -0.41895057022150389292 -1.3357298933750105796 -1.4462500458471092557 0.55591932268684729479 0.29649009755344968298;-0.17694856819220189381 -0.79021101472642130137 0.23470565570561324753 -1.3694318747719596008 0.51888650209686471015 0.20022285756154462044 1.1398693373548485219 0.23997387791471885832 0.82726871241182398098 -0.7658047987400438128;1.0068517843446149751 0.4049873315733950041 -0.82152800617562882213 0.7454844910805028535 -0.43937465928678209881 0.0068936384178337299644 -0.18192464677404049378 -1.4099406510700538409 0.91977859587956078968 0.34225524637976767472;-0.39574919222855986511 0.090161526976605108064 -0.17835543951807689145 -0.16461691414234275177 0.40608189451535575687 0.37566575659732387438 -0.15772863448264190511 0.033092038239994826798 0.65035567859645682098 0.14822765826032768821;-0.53194254650946770635 -0.22984929665437253687 -0.64565378599155287542 0.376863743336105117 -0.77875878155166333716 -0.65932282502355932241 -0.44896903428374446143 -0.96737391546665219 0.82264274640494061686 -0.53159303168893545788;1.3458423727789345925 0.017754880349069215167 -0.18628655903647484138 -0.46737100380702295555 -1.6412825819547733897 0.54958640777599310212 -0.49718576921602997132 0.24632520983482147914 -0.11197975612155446068 -0.69786245454999284998;-0.47910721720992033301 0.30537906236852541131 -0.02468883683105524765 0.24181016512210082303 -1.1057731591182338171 0.086679562115809613565 0.12704976894701686119 0.39252670198152306291 0.14337959660243196347 -0.11054232642576573842;0.0014280765490789697029 0.64340120970863623473 -0.27747776211212060726 0.43480563413552725249 -0.1571083732239260955 0.45944584641287816718 0.090572446018891819564 -0.53008278052505986011 -0.26478204725085091598 1.0167022048109033427;0.4944693100557258636 0.51968615022517938851 0.21873044056247184508 0.1080060617394587863 -0.6988336540752990711 -0.012162770528514273843 -0.72168894483157353115 1.0258501694615367317 0.51052845515090661266 -0.070798117320336279024;0.56377864600388449823 -0.55892275791757306536 0.41558430112133698531 -0.4707536255352676724 -0.19824171304977258878 -0.17703808256439623747 0.35825674724975925534 1.3342204289674395312 -0.20497605604139437774 -0.9777833317388584522;0.73963764773698559285 1.2539745499836361109 -0.18151853839175607908 -0.4165912729120383462 -1.0644672888948698564 -1.7388308373578833521 0.22435330872397626911 -0.15317970452212004151 -0.48771904262067172775 -0.1789263495838832041;0.67336178822343573103 0.60148981369285614562 0.87747686638412569771 0.28985447631658073364 0.80199693466135590914 -0.91556995894176040895 0.76975144215641977397 1.1130351995740590532 0.52378375269129995306 0.31932083879563932793;-0.427211552972664943 -0.6634592188641205146 0.44663789655628899355 0.82069419408543708983 -0.38780048351000118156 1.0075371462386717436 -0.59092220432447650769 -0.7650937502465927631 0.11477790812779462004 -0.88490016110069813493;-1.3935225024012072303 0.51552614631724702488 0.43398830782869624034 0.50454525395370619645 0.27427218214931792239 -1.0496687586398989467 0.54923477710448476152 0.82933699095535462487 -0.81995643544568141969 -0.73010320742555512297];

% Layer 4
b4 = [0.90805179789263656964;-0.18735410685809969489];
LW4_3 = [0.14120122940654858401 -0.7507677073598241213 1.2588741983716031925 0.56490868813941075288 -0.26495822446336841915 -0.11845602261044793635 1.1144722727456048972 -0.186268555314011236 -0.20982098268031834642 1.3205949623197872356 0.97421700401053290541 1.2013688136478528623 -0.48720957267666337165 -0.3369714490089192882 -0.43700412922831699536 0.11499949345868258621 -0.15039630352620469989 -0.82735596721858228886 -0.64519500106877702983 0.44416365575758404161;0.039978259019421730214 -0.35553181332809308257 -0.11793493358892943867 0.8202002674579738084 -0.26669273652576169775 -1.0015567329747228076 0.50090101667346165204 -0.091452989415751737012 -0.032079752912630578321 0.36235476016191814352 -0.093793616307546207045 0.55200533850101118905 -0.73590701335859542986 0.38116946766426651472 -0.41748841923934176812 -0.79247427219860289149 -0.074046616916459931379 -0.46666914868233361213 -0.34766673994193619812 -0.84035600799590726151];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [0.220818796095921;0.153261663239194];
y1_step1.xoffset = [0.0999999999999996;0.651751060429343];

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
