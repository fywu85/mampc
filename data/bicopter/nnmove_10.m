function [Y,Xf,Af] = nnmove_10(X,~,~)
%NNMOVE_10 neural network simulation function.
%
% Auto-generated by MATLAB, 29-Jun-2022 03:11:24.
% 
% [Y] = nnmove_10(X,~,~) takes these arguments:
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
x1_step1.xoffset = [-1.40432655203162;-3.05772726649525;-1.50337830487775;-1.46639144081691;-1.16707092234658;-9.39260604806797];
x1_step1.gain = [0.701215936936036;0.342040821094694;0.707661234476445;0.774842031884718;0.735192523401183;0.127145748685667];
x1_step1.ymin = -1;

% Layer 1
b1 = [-2.6821893793263305028;1.7086590406317045954;1.7787018961869482947;-1.1656510731911626788;1.2908791306840305957;0.73089222772036843701;-0.97277933805782923482;0.40048918564344704318;0.40194090387937503328;0.20657276380752070954;-0.13366458531166952595;-0.33470279213159331855;0.29860291460758964233;-0.75078027618804588084;-1.4590117117358458732;0.85299133473650923243;-1.7712404163064565665;1.928071211808705554;2.131807287404448914;2.7433447669089727761];
IW1_1 = [1.2776627318459166105 0.28672499510088594876 0.59038234990492133303 -0.16241160504852664159 1.4550396025324541238 1.0537518480272918264;-0.2830896550639890874 -0.23702198978277555508 0.73361162396337042946 -0.86419658331268744966 1.4892944735616502339 -0.72049601781200312001;0.45806807264712706695 0.63605813693050961 -0.95860976638999806365 -0.62383635213001797926 -1.1286634107456425813 -1.1439864149132912274;0.52670207391400958308 0.87411758001505202031 -0.1679714909721832794 1.0399395540304896546 -0.85706500484869185819 0.32189693882821202031;-0.40086095458538717473 -0.55557264879978707217 -1.1882767270450824704 -0.93782224153079407625 0.51287027039635257886 0.44594596625172894244;-0.64000821255581397118 -1.0789486940233090628 -1.1942485244485492313 -0.87283131766135313434 0.73951739741133892814 -0.079534138811961502258;0.45636995119693479772 0.28410661510552137621 -0.28856939519779178926 -1.3469501835700943282 0.82921234153301126568 -1.132480626624502662;-0.44711382895778967184 -0.73399542276451301692 0.43909674805332638003 0.86069392323367022168 -0.09896601020725347142 -0.054976614023389186459;-0.68456345282617170334 0.65041512632661369064 1.2080778283565400955 -0.45236303036538427769 0.11292575545261746006 1.0170363501440526921;-0.24818414230189989045 -0.36029055307254681528 0.4016463335878916463 0.24626309550894578959 0.7193840340818157264 0.76953712540489271898;-1.1602978855488399468 -0.19431976942077147652 0.42648867995084444038 0.71579913784595250448 1.1247435286620119932 -0.80441678185320986127;0.24514714282195729234 0.68655176923823002522 0.43577248033026871887 0.60322233205132513856 -1.0849798025322843209 0.41429813340730919924;0.2736403197635204898 0.43562743104993845167 0.40032523327422975257 0.19564081589933648986 -0.47798844373136245567 -0.48327596317967214112;-0.49835523560255207132 -0.81526338361106998054 0.45206480513818286804 0.85488001476228803188 0.027534310492845114754 0.14917360191040682227;-0.74654905370479274218 -1.2359777627807084777 0.48542862548996157379 -0.38884321858709586239 0.51626056334737990827 -0.84964699377571206718;0.23394525752491868165 -1.1314442104434063729 -0.76417277536307337549 0.74437563315619215132 0.60677055257928502741 0.9778774685161750746;-0.54401131952289172311 -0.00089391304179359764009 1.5619902503920994885 0.40526725304497146496 0.29447153002535703115 0.43519971068923146706;-0.53342820600514706531 -1.2198858648280859196 -0.26527528186288718004 0.49860507807533932523 0.30424273839617843596 -1.2975450760599049893;1.0299542881633620972 1.7161132427948688761 0.87595341897285372568 -0.35276826732662702746 -0.86833522145607189291 0.19375775957651072967;0.21695669626785596407 1.2165719547910123222 0.55624913118057361938 0.57428438286008776092 0.27266393321578008546 -1.3567226801323053476];

% Layer 2
b2 = [-1.5805825799481416638;-0.8766213493954946312;0.22892825111573378294;-0.35763932597684411352;-0.40266351225739271946;-0.19834280508988455516;0.17626272114128241353;0.80496696893726704669;1.3208695565446242348;-1.4230859116039689116];
LW2_1 = [0.52117848524505350216 0.092545562288697494346 0.40925653210561879769 0.42374921515042368592 -0.13398515126165042033 -0.061035650503061339434 -0.16957803051440695219 -0.58251569988812279544 0.52965109484211214674 0.20117182231533389802 -0.28623503576256109637 0.18715317004642978427 -0.72280390244915782016 0.027901052197577047576 0.42528219922946058906 -0.41506677014070419984 0.25873161258938193185 -0.4453750314098286478 -0.075903284617429039871 -0.36357307386324483334;0.15345038204431282747 0.20612694591616226303 -0.61766842912736807936 -0.091702301569587932328 0.26770290978496041889 -0.15763388731823169131 0.43199563826665526856 0.30409753975932479753 0.098712290975417199546 -0.27280045244616912825 -0.12284162895692200823 -0.17323356892296729037 -0.38333015594988523178 0.023185141512159338634 -0.84736367312307070421 0.1024414690435710984 -0.25237654897743727611 0.2206604256617765436 -0.47914601671209494649 0.34286114630646519208;-0.36542255806575896226 -0.098626365112034639071 -1.0538825164337217721 -0.011817754734990937662 -0.099742492654731923496 0.21145236003908723932 -0.11137375186581933983 -0.21342670475348582415 -0.028805786184543078626 0.37437919197211305677 -0.035608414316829144208 0.034621753477522720921 0.59730535960699870923 0.045024396093805908736 0.058912079118750258766 0.029483744099837484731 -0.15543583555377554761 0.017381442858219950387 0.27266751054416443756 0.44491036062645550331;0.17799067530766790601 -0.14898455971861851443 0.22100163555648671965 0.04642178005528452972 0.029669082990592350602 0.19841779772399048554 -0.16391681269162283741 0.00011055688665778063361 0.11069681998065496187 -0.34072171614781532334 -0.054248679568023351616 -0.20030788847637212569 0.5697301956696896319 0.13608478370746576736 -0.40249551928561383418 -0.15585469367255080919 0.20715071209936319896 -0.18113365123383004529 0.21305304558032570061 0.31336038952129241508;0.59545425573033106126 0.083587621811161985641 -0.83541960754193667071 -0.65774764284432385431 -0.28246930738138015249 0.64070914778094545383 0.31718697469382794996 -0.26221805505027212524 -0.18707167516367406712 -0.16548910572163302857 0.20407742053346977773 -0.070545691069958990638 -0.60703681909218076829 0.037600296031066113289 -0.1611547387252279806 0.044285727193960511272 0.32837334176809945818 0.29204933093741292094 -0.12349308005202297434 -0.11781847847885522362;-0.17833031582005390292 0.094904875393867382805 -0.57431041095480939163 0.1697000757708493901 0.52550884738408354391 -0.26778835281744001184 -0.49552983905513992013 0.68066091346173163146 0.2794121111758755549 0.17450503347219753492 -0.11657455193585507247 -0.64953471190369882482 0.25632312502512977215 0.45016178354548941343 0.38311336852968880251 0.025628511437068457468 -0.46540499253519529432 0.23576515194804870124 0.66913974396394204636 0.65274878073116249233;0.15120698742052440799 -0.10144512100037679503 -0.089754780295124417244 0.099749957098032235314 0.069024482675649020957 0.030226688843143539182 -0.14711104471084768264 -0.010243235611923678235 0.066644438179403159284 0.28100278802610800799 -0.020853998554816451788 -0.12503599144066501747 -0.42420975211145911521 0.011161696303439964592 -0.16657242263992519393 -0.17512307682091748928 0.068211029069606618491 -0.11817095511302731781 0.094838210766652220052 -0.16420195674476770198;0.53042917567093961217 0.21639704406938573 0.5582991771335703568 -0.16128881025499555713 0.28806108968319033004 -0.17243545359500672687 0.28623198607146160821 0.31429717591876249472 0.0093927515079361683509 -0.043387630286679551572 0.044528284943990928402 -0.073816083869542040152 -0.48323053070696714295 -0.0014521367090906838783 0.22080853600158523165 0.22705034728640430264 0.1513016232593005217 -0.084974407239570795558 -0.35490266180681306896 0.056083175185857231382;0.366595524298181763 0.0081831299036417472909 0.098244726257873504771 -0.044935078795961536091 -0.12186007068554113864 0.098033541612783853259 0.02623424273087560793 0.20230038978442096975 0.091403910666293344822 -0.18601407136007280796 -0.06955752018327611419 -0.45747129431426009072 0.42370333510994617754 0.022677140261508414026 0.8424435145580728701 -0.0097350163337254474322 -0.35065698090871766368 0.031096841795795537172 -0.18495303358181316988 -0.46738475124220635326;-0.42162134215074353882 -0.028315990486866556702 -0.11006564567754581474 -0.041018270785754602781 0.095758128186335347842 0.11752598173762547618 -0.013308280846110472073 -0.25706528318864246829 -0.048804583955736995093 -0.4639499645694128982 -0.014376583627336021742 0.10934751853482974071 0.071442145108904536732 -0.061735575455968173808 -0.018846843539263229833 0.093533831512001064379 -0.11764086531551794235 0.092879245826315723344 0.20142666503882336593 0.47148468569873519529];

% Layer 3
b3 = [-1.8176721916491240805;-1.7609061896029978289;-1.5409531849363182765;1.3507330057946140833;-1.1852484210941676146;-1.0373781133096182661;0.64104173897967575702;0.29537865712966027143;-0.21692568295992048499;-0.27262707699267629824;0.12197456492832675634;0.40430418962436753816;0.34356786168825387273;-0.63886526510505847742;0.98935805868247861383;-1.2719611249976570111;-1.1510593436794769318;1.5306492215933933387;1.575674885694661409;1.9538628029445892498];
LW3_2 = [0.46672327598380414226 -0.010448820359267238511 -0.76604137512149284017 -1.0120100361771331432 -0.30383385969166210039 -0.55677319604729313962 -0.00077724396004473007317 0.2069145373773662866 -1.0028725683351933373 0.56403076640924110219;0.80377367772516095101 0.54763941558470885518 -0.37043523769438274629 0.34976500753716499581 0.73551115955600887553 0.70954599032778620238 0.8726222874492164383 0.49384401883805129074 -0.25770497709272993658 0.25470375421596375132;0.7127611714071122595 0.53789954956498498007 -0.5655855085434734475 -0.86659644801856783314 -0.74297101091597417266 0.88264642054556630146 -0.44399444120863734708 0.016416145813373889117 -0.22260486845785770749 -0.090243018074047109955;-0.84266338802528506502 0.067458084618193400739 -0.33744804437181979972 0.60818302787246325547 -0.83934175581435777058 -0.16667522144750038238 -0.20350999153157497967 -0.38231143626600183616 1.1168789456050336462 -0.43813307085279046271;0.26752210596607689519 -0.91684297973154504913 0.51101193017958645992 0.20952261377250658292 0.45521604502067486431 -0.58082937426903136213 0.56390543896995670714 0.75530676083860415204 0.71001167847667834288 0.73740834714288572282;0.63166567088912306538 -0.8647766708301094507 -0.04846819727956167001 -0.36123574428431803884 -0.78630630991043048983 0.80312109955196087085 -0.1863539418480503751 -0.11817124481946868209 0.096980745377485716441 -0.058043618466717163129;-0.48131635737601635716 0.018985653443167813115 -0.94213897827146719788 0.69314816852019955906 0.81707893105066375927 0.48097264714481907655 0.18652089304009616955 0.93039865638300056627 -0.26938669885123783798 -0.59176993459104199058;-0.69077188591746152557 0.068173997868026928182 -1.0504221785900362818 0.34174213190659585848 -0.43000910931965558026 -0.29023107550160204271 -0.2899500650969238924 0.25650943898582329039 -0.042358231730795378733 -1.0619350461023113752;0.19041191286186631704 0.95282902721770590393 -0.17377820103254171258 -0.26507557826555566693 -0.49368883014968600875 -0.77817352809534334757 0.83471344432847660588 0.53562225491166870484 -0.3252680533355200021 0.079696956989135925298;0.50498762996490897947 -0.53535102072288520692 0.35794623577897438649 -0.64624241683632166477 -0.091616122832602120418 0.47930969111694371465 0.8868066383168264899 -0.0081766487750817521546 0.68515391325706309633 -0.23237583878463802245;0.54277234700536547418 -0.26496342947949408364 0.8497310427970123925 -0.34421345410958831268 -0.87248079411770651515 -0.49478635629729966761 -0.68027867512125494986 0.62765597551633423024 -0.18408315171002720412 -0.27833241640702593989;0.32463991901237643223 -0.025602175730608113524 -0.41827779616653298911 0.10981727221464449018 0.30598726109687568453 0.7389776203409660349 -0.84233597687846317736 -0.7366507876907787411 -0.028030871976279264635 0.90284997297729807642;0.69408948918895951863 -0.090157665451245261323 1.0798162227033574201 0.7171713909806542997 0.90952477489628957841 0.24069884033493674225 -0.51330575950123757956 -0.31638118667079673241 0.058667482926564727685 -0.016344385769373956374;-0.98710604981143779124 -0.53498051406035751487 -0.10464172552530509597 -1.0264844058609432498 0.32269742827437897237 0.23354530102492512822 -0.43039835868139691977 0.5036645646010313726 -0.27593671366555549973 1.0638067501313690499;0.42638327823087773805 0.48596405528292702103 0.10304327978919454456 0.53922624714834621606 0.51399608840284316535 -0.79883983079354559109 -0.50912189823726927695 0.110089963727779655 0.24728893838784099524 -0.16568106332264534442;-0.5083530022240403401 -0.23072683212110087214 -0.51170435657258783735 0.8458838227705708368 -0.04470278828017280881 -0.68515182697790111277 -1.0532814141909321304 -0.44165452890530559893 -0.069828676260926342279 0.52469818439923898712;-0.53734680745272311864 -0.50927436040664753047 1.0009224353741519309 0.4078110640539324705 0.086155306068047166068 -0.72375553737120101871 0.36697394051722836972 0.63921488706388240875 -0.19867017809956594165 0.91210056717106657853;0.11226935474520403913 0.65936051719452370978 0.31418107939602862855 -5.6364191691763419235e-05 0.70501261565630235495 0.65264179085005469272 0.94262593827464791207 0.24908154132994336782 -0.32926170202450943947 0.32530494250738445361;0.9515806085426984362 0.0044466810054136244809 -0.82846394129597422662 -0.4789686517473623617 -0.074286700791728194071 -0.14037725545260609783 0.032762416731135730885 0.036180803016632366587 0.42290154432118132188 -0.35560611905279737588;0.58646676013840859376 -0.547072411836546868 -0.059784022543592073295 0.32681587908321563241 -1.3845338748709281607 0.18687505535415641078 0.57061150702654350741 -0.78070688140103328134 0.31159848868928841092 0.20012021168964336248];

% Layer 4
b4 = [-0.58928427832080243487;0.5423402845735639799];
LW4_3 = [-0.36100285621455979745 -0.2042147084207338037 -0.20254146668312020263 0.43592039006171767745 0.56190304589471151697 0.11001860942454635972 0.28200027085814827199 0.55003665181204985934 0.11041798842587573215 -0.11484400695369195722 -0.42612809096682829901 1.1414617223367922172 -0.78455762545469576175 -0.25300650769708316057 0.25541493211683707898 0.23358694541257571387 0.84376055765240554063 -0.1623361907023613826 0.41168602099554646445 0.66903524762067256848;0.60984017572883120195 0.74824473716080752705 -0.67943223393051421777 0.21935415174789854587 0.090259385142310619154 -0.71843238619071436712 -0.31832087262490982305 0.67546341861071224066 0.60797816421835759737 0.71265833687042423605 -0.29426898616519298058 0.37642373336893752978 -0.73445875947378291837 0.18766176233242445881 -0.38960725622763242582 -0.6084839667655130846 0.68339532453714191274 0.56797353271892103699 -0.311446679467013543 -0.32074417087057566222];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [0.220818796095924;0.178851631325753];
y1_step1.xoffset = [0.0999999999999996;0.31416652584394];

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
