function [Y,Xf,Af] = nnmove_05(X,~,~)
%NNMOVE_05 neural network simulation function.
%
% Auto-generated by MATLAB, 29-Jun-2022 03:09:48.
% 
% [Y] = nnmove_05(X,~,~) takes these arguments:
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
x1_step1.xoffset = [-1.40432655203162;-3.05772726649525;-1.50337830487775;-1.32632633189706;-0.882733010962612;-9.39260604806797];
x1_step1.gain = [0.726937062841322;0.39800416843654;0.707661234476445;0.819300701824441;0.821005269415222;0.161198758900714];
x1_step1.ymin = -1;

% Layer 1
b1 = [-2.4500510252800618005;2.3306135331277406664;1.6454744087923609541;1.5269548336302092295;-0.80701432364490477411;1.5468431722932427519;0.5714780096030244172;0.3573987843289128663;0.74462288962218192712;-0.51065778541649264888;0.3548160502032546848;0.75836059111108355957;-0.31286820185802155514;0.39254486678808059308;-0.59318435941042146897;-0.95663741737818941413;2.0439370966435386201;2.1598579636259089831;-2.4317022615958654441;-2.4592861261032874509];
IW1_1 = [1.0075267501601041786 -1.2771502908993173087 -1.0622568741196494191 0.50807082238904199833 1.0439290231909121864 0.25411367733272616221;-0.82947535860902943394 -0.72591535133020423931 -0.11436091358340864932 1.244305352598626957 1.2871782089813377237 -0.19032021664528134264;-0.16738732827414645743 0.13291221146761161842 0.96480248204914587085 0.59186282657551536612 -0.37815518013825405452 -1.1350725563458667899;-0.32195635316513659951 -0.32789213878874307051 -0.14718850155634946586 -0.83313304410881983131 -1.4922351075658553121 1.4244977488108885311;0.28375475835357377719 0.076909260338280965863 -0.82301695707251010248 1.0119074857869532202 0.34568816226287796267 1.2375949829703496441;0.049364612811271302295 -0.48536837483446931829 0.5547056969148315142 -0.91217260807119382449 1.25881460547574342 1.1646429995993587969;-0.7243495156629093934 -0.18618952392457649436 0.68918340336185701656 -0.4290122612672118696 1.9050201090204661458 -0.33397209569810687446;0.53016755414246574674 0.65696921833986254846 -0.68829322427603056855 -0.12613686937210047412 -1.2026701802979180567 -1.5174136557667790015;-0.0069665551198103692343 0.08363368081727999559 -1.4244843898796264448 -0.33194558001915042134 -0.43534500329063607893 -0.76170404466031149671;0.724375600038264289 -0.23544268055030992404 0.22569346829204428584 1.0961389279680431308 0.30886943029303776109 1.0570982122667254011;-0.060961317620652016869 1.2334688610951611842 0.65100619019903360751 0.94929697884036823297 0.73387292529307879274 0.36547495910173100064;0.67352762126473508797 0.36384509108080798079 0.98653235724294352504 1.1704202502298777233 -0.18788701018057193948 1.5332543115549339685;-0.45024887320470519114 0.2741334724033250847 -0.79802238333711383866 -0.48058657474123400721 1.0870656002348813018 0.73145225490906462529;1.1562172494068783113 -0.53626499761388279897 0.090065627220454302915 1.0890497675394286148 -0.066489426602914750153 -1.0249156783202826304;-0.27632105146593255451 1.1757500166850074486 -0.195192530382871543 -1.1309497360930580445 -0.80215941358055353749 0.57005007531337559268;-0.91229460911429027803 0.91233778545123844772 0.21275148440290600482 0.34219633704717078437 -1.4037686951745917963 0.10156081098923062933;-0.14500074269757451395 -1.1966822014892737336 0.86299327413795201558 0.54659258298195512182 -0.4118359293607583016 0.98346967681397479133;0.24203917119230808352 1.1005238143248474714 -0.56909361489403587075 -1.0483459425643772978 0.93951367517232531323 1.088544013265505539;-0.93968226506049734592 -0.55552507790403504728 -0.86889096020727130121 -0.88406545021414162377 -0.55574804070867334094 -0.66323658622593439915;-0.19100543671962855186 1.1661063981844466131 -1.0392050816983222639 0.60079950655818659122 -0.83775530255691543768 -1.1686150613023194023];

% Layer 2
b2 = [-1.3915185496386246466;-1.1867355741066882846;-0.94477680287739562726;0.49894370899682588538;-0.011963283957135365659;0.11621123880485555169;-0.58652954732071538313;0.74508892490517297791;1.0704673855572732766;1.274570952056875317];
LW2_1 = [0.010067459311281654055 0.21225147200691588112 -0.13868701775949848765 -0.43235859061958170635 0.031921507620831027219 -0.71556470366025604068 -0.053195595156737759956 0.25905850329643981267 -0.31423804854448028623 -0.013058678116040476486 0.12563142241718980308 -0.14482481058222498871 0.025795693119408845406 0.18603331866511210735 -0.28130679278327275217 -0.042746336493920143729 0.71553869303995210061 0.37548128239899380976 -0.076197032855634672099 -0.49170099598021194121;0.63209916787215969514 0.42021907368048783127 0.27812713541363054404 0.32745517880381003195 0.027303906920651516144 0.26293665846355895876 0.23727102338643710211 -0.77552851946079293111 0.14006239469730338842 -0.13402365431263763007 -0.091303201689713286981 -0.090779910701011809482 -0.19336527053826557676 -0.59388443242443722525 -0.39368317615910414231 0.05485080763223404432 -0.24561837683271420252 -0.32215033267749909607 -0.32887888825214012245 -0.32529917351550907689;0.26523777742781423639 0.32834235030820796419 0.56582010306656660426 0.099191333580341892184 0.27156978874825560277 0.55353656902356851433 -0.16688817439225486772 0.11099183289584384215 -0.47199638076113170637 0.46560808846691287277 -0.21521174735300105385 0.19782335029440717422 0.40828922635847053613 -0.11471020349644173164 0.06496878362942690166 0.11850326021640267271 -0.0059118547162700712735 -0.41903999875974901057 0.39969305068965804706 0.75787483718213399797;-0.37729505105720140268 -0.48721703963827922568 0.41891187258795314907 0.45525237979007887601 -0.072964713899874494851 -0.026366059227786918517 0.28714936542311991774 -0.66425166996359341631 -0.74360166302960117868 -0.12911821467045517253 0.13458691599205296896 -0.10075478112198624214 -0.27490085129107627582 0.026064921324816529152 0.0083779966466292331989 0.039807963206051032168 0.16492714191396373735 0.039148125591168064785 -0.42474096295904412157 -0.029154546199471800122;0.46514873155662966875 0.25543111607956792142 -0.25749372804638587242 -0.32136685689619665096 0.44189357120457689598 0.11315206357223728251 0.0082611224430147699171 0.58678309294937713858 0.24269948752013018045 -0.022031203279839133707 -0.18921609494623856107 -0.35614811397510770519 -0.42862565649036499238 0.60200763830822601186 0.66830690271729853436 0.21759766363724047933 0.41535773931597941289 0.56916274165328428758 0.088632622920286688317 -0.30171917684977900276;0.18663458317284878363 0.79709880638158037147 -0.43870994387746709009 -0.0099731749267307091139 -0.15619192638027867837 0.14983353302374266547 0.17335105178975868112 -0.17458886855925179193 0.2744643366637039561 0.2388947555085082497 -0.12986335590192871203 -0.42266215482373992174 0.15025686555308534476 0.2972933881572461523 -0.21811572070996890216 -0.101579331889383076 0.69707521936222949233 -0.20898172655588342916 0.23256258424224210413 -0.4713355490680755655;-0.32408359525782787225 -0.4986769985201027211 -0.34260429139526615838 0.44691308562822784634 -0.07588918001287370263 -0.14397528328768224859 0.40521301133874865208 -0.13799285997201751752 -0.0016751966181451627674 0.41750680390120398222 0.63273120751210643053 0.18454151079001435143 0.042500147051949321853 -0.56211236333998249037 -0.3903756654607627441 -0.32478323309155149312 -0.25129742292739254417 0.23226307298357212749 0.31661598967971393837 0.52698341923385882968;0.34778662752840322492 -0.003047743548471366741 0.075643116978892283031 -0.77100431028818905421 0.19856610533048754674 0.42289185090031783387 -0.30814881862173743032 -0.076128758532344201204 -0.010548527996334364221 0.48534210292607415926 -0.047158615310181388469 0.10269961586575265811 0.26239823976199683209 0.14529649662698407298 -0.069038245773328635324 -0.09453895967309572379 0.028148478745350837688 -0.095306675326110701363 -0.58641026185626354827 -0.32781196624510000603;0.023899452746581562046 -0.2505173089173332035 0.49248932961027042099 0.23053233723932753385 0.32686611449028912801 -0.31014647589902649694 -0.12060972849261285267 0.40476081742910641204 0.024375588066675245302 0.32627968592146344706 -0.25853029220816908795 0.2549650048950645731 -0.07266423350015438487 -0.098365135413524845687 0.15652974401263561322 0.22317465629088995005 -0.24740386653969573261 -0.50081959316755020328 -0.34429583495777849045 0.59436933626282650867;0.62340396262218378265 -0.41325768230594328578 -0.32508929174939604767 0.2686982557052036702 0.061729658760067217249 -0.14997642073588773881 -0.056880918868981979186 -0.75287545665576161014 0.51537908896373896273 -0.052027956580126190345 0.018725394708752840511 -0.048371448402052673321 0.11513481520185367413 0.14797960349567493288 0.1152164110793808538 -0.06202489629408267785 -0.31878853256592798449 0.5094161118226596674 -0.18917585075513720927 0.25764524467840255184];

% Layer 3
b3 = [1.846789996367633746;1.7571258604559238936;-1.5025047279611314366;-1.3119792998249233396;-0.74358380421293224227;-0.86970666952540742756;0.24253937112939880083;0.27609565645082256857;0.2854014719454219251;-0.20590937079271598442;-0.24210317220332888688;0.050958861855452800005;-0.5946448967645406869;0.67228883746731926685;0.97772127692693699963;-1.0607238420541655888;-1.4188047069843792158;1.5273496913957127497;1.3370502734529283728;1.9571006873028835571];
LW3_2 = [-0.02250897177238716379 0.90263490688859504552 -1.0546445345763946211 0.079345611480764910439 0.31569987747403316369 -0.035624375378334377507 0.286926409959000428 -1.1135937253607066655 -0.29205126022661120899 -0.56087165698989682738;-0.30671559600481212993 0.42633032672734710866 -0.065610941583580925651 -0.17038285738021685667 0.13660812601330282745 0.85512225164361765906 -0.9564554408078456138 -0.68259548832689109776 -0.16085675588129602631 0.94922065442930247947;0.45259390266452531604 0.1498559394919369292 -0.52508607136082274813 -0.46471656069265687705 -1.0187757590115549267 -0.89090263941267189285 -0.11555465251082848444 -0.86646797461548152874 0.53398142067823228807 -0.06658384583095146303;0.66559976100532969312 0.50389224161423495918 0.5877015482933679591 -0.29963557552626507441 -1.0311159353512759917 0.12591646114261889622 -0.88464669631933745553 0.42802360506075037838 0.35096623409407617933 0.4446665440699591465;0.43454008726737880508 -0.0069907996644259264019 0.40256268194576394492 -0.11814928044731386192 -0.5730156926010312457 0.99879557670528595903 0.7720467961803463286 -0.30548550048968275972 -0.44777657795980230215 0.75879882809021159673;0.41526238438321910751 1.0366180606257586749 0.10154443956757089329 -0.18193657092348597404 0.049965434375173319037 1.1131396572176661675 0.43408202229856279741 0.82056043372973863637 -0.41777308707840526969 -0.72686133544837117082;-0.57400822367687009962 -0.50478593872506516416 -0.085096103643202622435 -0.96125372530037955787 -0.29701298947328658162 0.35098613456463201299 -0.47404121582306268934 -0.46975062005123591202 0.38366486518546077944 0.30083844941109866289;0.069746706722076806662 0.33326730629499129455 -0.15632920846833225914 -0.24313142845290819372 0.041965931736092920712 0.13685089255229596072 0.37550357618368579438 0.38118499233473018828 -0.78375748741351469739 1.1005110412590153324;-0.68208753965263813068 -0.76384218041307261338 -0.46540901440320303628 0.67681921177239445786 0.48524492138746250225 0.0684613682817145075 -0.34536187643242344247 -0.7903245139878914971 -0.76784721167180414181 0.31303252163437816913;-0.48680369997682892969 0.84042392563832823971 0.53353690742777526435 -0.44595296985178056737 0.39239328873600165526 0.59161791857504608672 -0.54282674895918248126 -0.46009915070048151842 0.3816862091824377301 0.13478637592190284566;-0.11550005061383199212 1.1008080474785968406 0.70020307648368496078 0.91171649210304417377 -0.68164809849093566108 -0.14907281531798047269 -0.63566133885517406288 -0.088188487803804962994 -0.31646933962863826872 -0.17409427167750013421;0.58472958477193426319 -0.97703246231091123164 -0.63778747059070572956 -1.093272469260669677 -0.84244372016896806876 0.44344317571626928887 0.11614196791531264386 -0.29851615706976175613 0.30643010411420201766 -0.21926572306640923493;-0.15026688922521094782 -0.96511885487264381656 -0.71480713956328834069 -0.74735501419090322184 -0.5755484156198731327 0.32008507033566396816 0.62771594916493023142 0.10499566376415274405 0.6913935907286757887 0.48891965939946080422;0.68048889523399547219 -0.12409133595906565728 -0.69045394407925575475 -0.76986429439255466001 0.27495497604048346751 0.64953041698003521898 0.44638652630596387105 -0.0042168700671062807686 0.31612763108910790777 -0.50457549656979538977;0.69812366933267000491 -0.27077748806447604624 -0.89640124307065760512 0.69219227029843444221 0.36355251359491902452 -0.36831291277679523155 -0.2146136673643217474 -0.10807386886283476546 0.90829766478055173895 -0.76186604407693514496;0.33973884004905291478 -1.1055711866536828136 0.6378112088229480614 -0.031489260911054847702 -0.045893897312943882083 0.50849245742549231686 -0.51713912322175970004 0.94033710287660809968 -0.43599765440475207745 0.47403691303939782253;-0.12059673787044968007 -0.0067375524377544697766 -0.87370483025293710355 0.11552785530577526496 -0.94927133309236488845 -0.91363596608485198036 -0.060848651131500453015 0.2827042120335485631 -0.12065117525141644261 -0.72907400008908818112;0.12937948168876697852 0.43121063338710408086 0.31824777761763689554 -0.47252329989658159448 -1.0708711034566023024 0.35347934445225831501 -0.13594819700481500235 -0.39870617457395030048 0.97695147700088003084 0.21904839234150749738;0.78606209669624593772 -0.013890501269690939262 0.13873364258290638018 -1.1435289488252105006 0.33714500419062576331 -0.75635117905854742926 -0.78682252466005875302 0.87493532991953004707 -0.40402716623540263496 0.76749576385471363071;0.49870933293671249054 -0.43842152917850080174 -0.5487703063490125821 0.64104143947498615219 0.22630110239491629809 -0.87413527541539315369 0.34017740523291500887 1.0140340530708302769 -0.44445502499584305101 -0.45681227411843283726];

% Layer 4
b4 = [-0.71559963382052660386;0.21468157888329547633];
LW4_3 = [0.32490906323884449769 0.45219590637361162244 0.38974571609367297809 -0.22667075778614589887 -0.33836430141914541903 0.042803082311458406917 0.49924057596045701146 -0.040953272266927846779 0.63157933833596602291 0.41893525030787809316 0.011544350562265602231 0.48622471652557747168 0.38065834318710323192 -0.45929001954582199252 -0.50263626412376072317 -0.13983185607297790587 -0.16010010875617550208 -0.87707732632029988817 -0.086363516488233663115 0.62532778568096258898;0.058415493698942867751 0.1821010352827085732 0.13181037065792652885 0.019424825158601690539 0.023500932484400837569 0.24637808198486241262 0.5048394435901372157 0.57332094516642984061 0.5255663600988851325 0.32175634297327015965 -0.13915906232401761833 -0.010896698993985702575 0.122765725440019971 -0.083196008058405282459 -1.0342634228490379389 -0.23664318040455817327 -0.049119001816480926947 -0.017207849203562230328 0.35695450618847635038 -0.41675249726504637326];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [0.223240001976496;0.228777186864254];
y1_step1.xoffset = [0.198232152425045;2.75448934286387];

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
