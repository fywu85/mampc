function [Y,Xf,Af] = nnmove_06(X,~,~)
%NNMOVE_06 neural network simulation function.
%
% Auto-generated by MATLAB, 29-Jun-2022 02:44:45.
% 
% [Y] = nnmove_06(X,~,~) takes these arguments:
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
x1_step1.xoffset = [-0.774566682739435;-8.97163988366913;-1.89093748923805;-19.2673244097423;-1.36181046680476;-32.1435885117685];
x1_step1.gain = [1.38650324557865;0.103956045709843;0.594042477847831;0.039305043131925;0.62465633780733;0.0381042747852155];
x1_step1.ymin = -1;

% Layer 1
b1 = [2.4588156978178696832;2.5783778684055458363;-1.6515624239925177363;-1.5886822137470462124;-1.7358555898219141245;0.57228940978692688368;-0.67377345822688150534;0.32915536680189649843;0.5302322478888117363;0.22336222980011144479;-0.058812882260176897742;-0.46355705133300395548;0.58262266627286329879;0.54393044272925872296;1.0677634045919608408;1.5731015682837434788;-1.4286429807061076236;1.8956099362189040569;-2.2399303354581840964;2.2675638736908090287];
IW1_1 = [-1.2682221208893718067 -0.90483492337348181422 0.62025146699603872502 -1.2658563139502854167 0.59541996003699770856 0.18250276203427248656;-0.54818321425024352234 0.39990820172981977887 -0.23947433423849112666 0.76532748061967059705 -1.4979952493252397527 0.61869004051884568529;0.4590433055258277828 0.47067029953999678371 -1.596226518733937727 -0.27159290531352275888 -1.3026790567649935149 -0.5835388872795730375;0.98660107461447155153 0.74566448526706341493 1.1677299860945837828 -1.1440971010895577553 -1.0338240438353558659 -0.70645138852160727083;0.34533748226676364013 -0.0072917650558484460588 -1.4367578137902439206 0.91707630730563916011 -1.1268144801979058656 -0.49987943127151923672;-0.98188728407375003293 -1.420042451476273504 0.43329620994861695049 0.97049568835731314653 0.0050627681261701043547 0.81200713301794680277;0.42133524794625260013 0.6757841996255727901 -1.0633568905360895052 1.1789958067814592102 0.46602953369904687175 0.81320127097341277089;0.36422795998708579202 0.76683183895215067949 -0.086515086347891290153 -0.96719771849781399631 -0.76936857300564842621 -1.6439196258152981578;-0.30082471102372454475 -0.81786982929591212077 0.34763859389977802561 -1.8137603515145150901 -0.50584674061616308194 1.320878720842433518;-0.16198414101535815735 -0.6759418416203041291 0.11208892353940513864 1.8456433910289578026 0.32967257741956562667 0.40497058569679078577;0.12695212091504218255 0.33931453141079376268 -1.0182450777309828283 -0.61960822795447623168 -0.35520350854019699938 -1.4339354913062398733;-0.35274846575217155831 -0.91675801404629564395 1.1379037718240532229 -0.74116008821906087523 0.86149907064114072952 0.26382901270940661842;0.50625027458203797348 0.89353426161761417834 0.55441244957657009884 1.3357016018404135327 0.69552286460403978108 -0.65050658836909747151;1.2380268428445471152 -0.19315989355950427542 0.8126920466860546588 -0.42468928711484132954 0.86813948963505671585 0.45952482235733005389;0.80130521095911999563 1.1571792671197564939 -0.49828299692112637542 0.3388558082070900479 0.90676360842857151034 0.49969675662599249977;0.59591893999095135737 0.74543831453730191594 -1.1140083390762616222 -1.0062539434104793568 -1.0150289819504616506 -1.1233125076800889452;-0.7765885189833173774 1.3034262402839893458 -0.93151597853114131986 -0.66266539248331124412 -0.19754417720025557736 -0.94062215659199444051;0.14805183130270321845 0.72165321197316834034 1.2242935962898182645 1.3534956778089139995 1.1924869499911210369 0.34057988213511675157;-0.6093304652431015267 0.35316628095544372323 0.97013292561541020209 -0.63345132381494251295 1.4107606255417137753 0.088071996496780824426;0.52510921636159979542 1.2265130406057702661 0.67546524897175341806 1.2459300246534601442 0.11194956173087346196 -1.4150765531373803441];

% Layer 2
b2 = [1.5757520716937447602;-1.0399102806295157375;0.65530575795362122626;-0.60847216971775308636;0.30713542836269003278;-0.091307588319364654805;0.52459238744187031145;0.91130379321625754052;-1.2908243994992585346;1.4280096002131765776];
LW2_1 = [-0.44841132612581996453 -0.50152318023424546922 0.27154823773678971044 -0.039575592723993718858 0.44356067650944402958 0.43596447813995109488 -0.34796180581339292148 -0.15375423039729360641 -0.2180816467574197004 0.055175369386336201027 -0.46354260085933823854 0.19704169382606054328 -0.22706659244612550919 -0.049976193714590839978 0.13895281328105568708 -0.16675558797219569573 0.11140012992242237511 0.61040835183971708933 -0.42792466377430904423 0.81641642356110222245;-0.12236043870993101867 0.70115705476384537764 -0.44443246707248312832 0.090105584092664114948 0.49800842454264232506 -0.13846460712853006503 0.050787300519725984971 0.015751158881694267422 0.18489498759271963402 0.64474597765891317191 -0.55640593563366425034 -0.068359454786571724472 -0.1148934219103892318 0.010694918587907595309 -0.14464364666813905869 -0.71727364790394088079 -0.246528145431235024 -0.34482450907278283658 -0.49604114410888144882 0.15803894062693391032;-0.046701626826598063857 -0.3906009497999627933 -0.16238329884932928282 -0.0014321962640347915899 0.38659343807663837378 0.36840501913694029268 -0.16740520431009231483 -0.19104108558748633673 -0.29078882696362878812 0.33345501954733852701 0.019708457176316397652 0.047562316885412937728 0.10975140065575997306 0.072464918264151023664 -0.17052181974450558721 -0.0088963501556284466792 -0.19315160212006310392 -0.15445380861659185889 -0.17484425454925961452 -0.074070168021323212759;0.42995298294390693616 -0.30454345143564859333 -0.037325254369375927832 -0.29795744307465027445 0.34713970552214068466 0.44708903746940303892 0.13771754032703373283 -0.35101853531626958649 -0.64422870168168155924 0.4410028569750199523 -0.30642462761378286284 0.29223885984096709123 -0.37479888281444023734 0.079320611518300498943 0.21487271174189831457 -0.13821595724182925147 0.25565634562409811359 -0.53640136193893883654 0.4643462814629010782 -0.25918835017506236529;-0.34285993972154604759 -0.12086179600611074436 -0.28458618281020714447 -0.42374075569716190826 0.40642029811033153486 0.4980379043041071041 -0.33824116817799837476 1.0617910973278397169 0.28381174664393304941 0.71220040050049304714 -0.18665525116418624219 -0.34707763514751938105 0.58270160849099472689 0.11783685159229959072 0.39315833544064532346 -0.4008434240610947441 -0.17324108281348177263 0.48367341645520978144 -0.28575562016739380899 -0.050933553352831333061;-0.37822224829308498384 0.28663757818787688469 -0.064928501740308397494 0.046833806733582034054 0.34852995921732943252 -0.17814721334469077463 0.23345000998754444899 -0.098029657857036628377 0.35898591732280837885 -0.037094571508807912263 0.22816541640325105345 -0.20461014439890723438 -0.24966180832540529888 0.22502315679738507659 -0.18117849510892505838 0.42220449804290716145 -0.0046950874240827104866 -0.43934303150312353781 -0.14057852436380513517 0.4304464896122228712;0.043747208409692192599 -0.48607409692758757336 -0.20067318757075899849 0.32286679613974761383 -0.070746648427524830294 -0.09450762707719558009 -0.51273195675084703993 0.21400776163651949457 -0.1194090371079125773 0.21306952242960405797 0.0040753984769476905847 -0.37349361349238219265 -0.015360161470261809308 0.27619835098340606017 -0.1255406946511504751 0.71316561726018257161 -0.59742672160166587769 -0.32854019210142260121 0.42355039105083075457 0.53404751009210460477;0.53226071481053693901 -0.48449992715210171701 0.18636680394828020191 0.3330073341923038277 -0.52500637470549349484 0.14633233475953866254 -0.31191122099584983607 -0.26123401748772179243 0.2114815043766305469 -0.098717745908620285755 0.13169657209426469113 -0.22591182342313789744 0.5162773848100246088 0.44577039181127159351 0.55285249023283156156 -0.43448233264321489688 -0.53661908386410783756 0.065853402399135591017 -0.38379875724099510315 -0.26823967448883528908;-0.63960053834321428656 0.23117086514579868184 -0.53575503445647232326 -0.2076587972467899279 -0.048756376618593208483 -0.21482575589841174102 0.17954532928241170864 -0.31394557063077832559 -0.17190246131271699759 -0.065040296145846776543 -0.30228707605391336166 0.19387361728320773313 0.053049285162138450078 0.25250732968374783871 0.44281220814789878926 -0.16614838673101159361 0.44006007353953457972 -0.092440233713932132287 -0.44478007487187021241 0.19280147063589922474;0.54129416957662890297 -0.45951226241904452596 -0.064344710729161216922 0.3569453154719427479 0.22785602286565392882 0.0031987736758416832061 0.083570475786047510036 -0.41001428566107972484 0.56870174524824623763 0.15373645387838807963 0.67314414471508954296 0.023110736472328773095 -0.2713208976366210945 -0.79978185311771532451 0.91928197176386960976 0.078653074339072315269 -0.28234567851559971841 0.33139073834966498167 0.62285663327738804984 0.4322769397882614828];

% Layer 3
b3 = [-1.9208134289189842114;-1.7201289562306909531;1.5731468589139459002;-1.4484018027609930623;1.0797980735981469458;-0.82282560404007099031;0.58294717454085343;0.48595478050735269049;-0.30009253226116139324;0.14986465095566728345;-0.066649405839280376207;-0.2650527364460941171;0.45114016435491177681;0.67256820791437921248;-0.8686789757913410126;-1.3088107103677923959;1.3608401470082163165;1.5793338718526275244;-1.8653073192075642073;-1.8284459630076306258];
LW3_2 = [0.29635276388170589401 0.33997167541935247037 0.1335526554561375645 -0.38275936479904543175 0.60175259227540045526 -0.75887343329846967954 -1.0214815417864855362 -0.57501143302511159572 0.7522840794609618742 -0.57151500990628467669;0.88806808762135625024 0.46038907014042351751 -0.72316244812772856321 0.57624927031550554624 -0.25996713860131764884 0.56951432480226438226 -0.50339154557394161227 -0.40681373296187334221 -0.74971518000683401439 -0.5577363811216108358;-0.53825026199352699052 -0.51661111857104202727 -1.0647858718565281766 0.15755414890754471102 -0.050173314644383654182 -0.078327163778634328883 0.33663196128792771677 -0.22342012565807123359 1.1816194956012493478 0.72512174873375456752;0.67993977725199794548 1.0176258620906974972 -0.1675198081098905889 0.8354166811851567731 0.2501537285955224843 -0.36347087675841760479 0.0018658112186227928178 0.13025502143891995455 0.78403364737893055381 -0.83945387033203733296;-0.17778397286603883631 -0.71775087842146811923 0.6561466118671147596 -0.45794476195607120017 0.30429385661767816007 -0.46130868943010316929 -0.31472122833061155767 -0.62472799805592793554 0.71827122764897277651 -0.32646900225662056627;-0.061225720385998529116 -0.083629012316224118906 -0.4577828369498020411 0.62329514583964684693 -0.18413016947377289223 -0.56560750447150742737 0.18486809756445640729 0.59058851291162517416 -0.69870385515497668294 1.5904837736546812987;-1.0039147514331256961 0.0496072663634279723 0.76551058677408745368 -0.028226264238128313117 0.96095886056317170176 0.41836416342900711873 0.19630558765239508601 0.70478293930061652883 0.17065412017957934387 -0.70272545039342337869;-0.97299313985888735701 0.58133382946795619794 0.53622991748943904522 -0.75978486165881964354 0.54003322383924201588 0.085711994746340058882 0.26122416493076133781 0.48754593182524130768 0.40938972940244028331 -0.29946083239198445503;0.77477119808238892329 1.3118063579202359215 -0.062715776940325748678 -0.079862547567974812024 1.0010645544598282264 -0.25946016202410909779 -1.0883271281410402676 -0.41609578720905948668 -0.59777541953623691828 0.56054123853325943383;-0.51940265999566670452 0.69686356946329119921 -0.04875056212075208617 0.32014278756811359594 0.67221984989140060041 -0.6585380540655774162 0.079907451176150542937 0.012568856462115651079 -0.94463743096483943074 -0.84486274564442231938;-0.10228724921678720994 0.28331371888525463953 -0.97959407383723462459 0.68549197836346653645 -0.29987419034830825604 -0.55025563887450545941 0.57691653961362543424 -0.7230483824428355355 -0.43239033691522982261 -0.8120406565304650881;0.026324610337697069984 0.16901122976114052454 0.50705569630176283713 0.80315043860836377032 0.41304310554692641455 -0.2953698636790321741 0.23540505727213353881 -0.94653627729772649158 -0.64453749578490981964 0.42943653607294679508;0.58245609003038678608 0.6492855227721334721 0.50000303918954847049 0.41050223222609572016 0.76732068123428154305 0.5087104686072994042 0.53428348778323164758 0.84018880614276791885 -0.74472746394376909684 -0.094083919400831092505;0.34010441304296290532 0.25941042247567575041 -0.64618304519821467835 -0.69846609553716731966 -0.75484644190563465749 -0.64798446631626793746 -0.42419694815927927456 0.90899150713622667297 -0.70257120294449937337 0.034552237953739198262;-0.75115267360992521439 -0.14437156835750888928 -0.22804687856035196769 -0.67239489354455383996 -0.59088999072839942794 0.70622804427754770629 -0.25080681099122370536 0.96639075708426525058 0.20175439431610836527 -0.94492628835887093608;-0.63339163892184757731 -0.55299815142903185894 0.35609005866214971103 -0.29847607921899810268 -0.68999759799465831822 -0.10736172556876470707 -0.85805182668503277021 0.69658465865336527401 0.74609232933688163225 -0.32162806596685067362;0.54038261630437112171 0.027561704108360281923 -0.10573983781602726284 -0.72397260854333156388 -0.49702537378762395859 -0.14033178859324821341 -0.95355592623802121199 -0.32337445977789558427 1.0666645261230394137 0.82503249078499230063;0.6451612689253246602 -0.7157829581622793258 0.86852280786971869375 0.12161858090302783697 0.77485543531954603758 -0.49632458793145528553 -0.78785167243630349621 -0.22416452943760084571 0.32755431568111142981 -0.32028708617135442926;-0.90190027162911279301 0.27158974166690036389 0.16735697117812511903 -0.96442176002505097809 -0.64000227256011055221 -0.59061208245997054433 0.36504243671906344559 0.26478026339465993155 -0.3085671390457043195 -0.46907003707113364976;-0.75781810584059394742 -0.82593910466711240037 -0.89549986408855852815 -0.98263244408449035294 0.036036531224104703663 -0.040260680839649468088 -0.29597319326820858976 -0.027956731183211826208 0.50485677575139564777 0.53906294668450205343];

% Layer 4
b4 = [-0.081575817921462012716;-0.95478467391476995463;-0.40777187857310365215];
LW4_3 = [-0.42315835869991563767 -0.72116564033794683386 -0.37887322172250065266 0.91018922912414268467 0.51098311775486560116 -0.68989830808081331615 0.56445117052924020928 -0.41661604199249485658 0.93350541223196370488 0.053619051418305266332 -0.60917844337358595386 1.1004981353990777038 -0.61811917079959344257 0.58414319898556921196 0.8198515470120447679 -0.53885390443679426209 -0.048383145472577687718 0.20386607861184954937 0.18929683563278942859 -0.58748719668795612581;0.26006055314617049223 0.47966502102179842115 0.054830671017572121806 0.7233384401855050827 -0.60792097025498836871 0.8944677862781810207 0.25614688386663886366 -0.61527792020469307399 -0.84152973762326210849 -0.42219586317925283936 -0.4648397469488346756 -0.483318854134733078 0.32067867593269977489 -0.13821152995110241868 0.45506690034044283699 -0.34932392338395190645 0.52512900781521920646 0.60079367140680439707 -0.7834582664215455905 0.49510230930086501777;-0.060620027489064143289 0.091794721771200391003 0.6951831003312083368 0.50504076547366094641 -0.73305943707118192965 -0.41114598093931936651 -0.37825757639576917946 -0.64906041004091641344 -0.91226882744479853571 -0.13757521956116661177 -0.60149087736074802191 0.44903709938890684628 0.86935721686295008848 0.207656674831873167 -0.022650899076178229036 -1.0338683413227620633 -0.82950675309576171745 0.57154596785139266668 0.34383488164611480942 0.3887496947107201839];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [1;1.52477853558493;3.68857865666406];
y1_step1.xoffset = [-1;-0.649268524470734;-0.26781918172868];

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