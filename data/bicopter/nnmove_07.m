function [Y,Xf,Af] = nnmove_07(X,~,~)
%NNMOVE_07 neural network simulation function.
%
% Auto-generated by MATLAB, 26-Jun-2022 00:33:30.
% 
% [Y] = nnmove_07(X,~,~) takes these arguments:
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
x1_step1.xoffset = [-2.14176009391765;-2.93543929307278;-1.8561936087052;-2.57890731985373;-1.53133411450572;-12.2663909617541];
x1_step1.gain = [0.522374734117766;0.298150665874942;0.578276914781939;0.499353559330748;0.65146023471057;0.0914060631117237];
x1_step1.ymin = -1;

% Layer 1
b1 = [-2.5681095304398433576;2.0660994557599536847;1.4265624263293485985;1.3035975150062695249;-1.2721134889634029275;1.1941012564073196778;-1.6041092986823719535;-0.17804626433063894253;0.34769325740190959451;-0.21357762576349303973;0.54321778160308153982;0.94115597059780964351;0.42567446777137951663;0.29176827135440419614;-0.83488368236382226595;-1.8247597441281391273;1.8812230736841974998;-2.251460595519584551;2.2576468314151201255;-2.3974922664188973442];
IW1_1 = [1.3037504093928393711 0.95971943180542695906 -0.49479462817281549825 0.33396139505095939759 -0.98903709268737605154 -0.66468978924460409008;0.27360126551255065097 -0.37733094842387449042 1.0465229806189180195 0.77549364897929107254 -0.87455445844578461045 -1.6401720002616850813;-0.82045962679674855345 -0.43871499037434730228 0.88253291326475247214 0.53296899807104924918 0.7249791106987412137 -1.164421699006196631;-0.91176361375462233738 -0.32474324080918987034 -0.94358830849404906616 -0.39479951029086646219 0.49901734255599311529 -0.12145398800996738686;0.40750757465421144632 -0.46038222898778435876 0.55784734265500923733 0.62245075127215154787 0.34541414073060527912 -0.51518423517821743118;-0.44918370538877944176 -0.78704180811006085872 1.1830214960809637414 1.1736899995794400908 1.3187587559702511619 1.479343691899815294;-0.012853055860298234075 0.88043186331110068199 -0.31785973475351508855 -1.3043524145668645708 0.62902326187081081255 -1.2624286035864420441;0.57026214153226195691 -0.88505323681833192317 0.071857626099379234841 0.03864368347882701088 -0.30212697288685197439 0.45054721489429921943;-0.54090560662369480127 -0.10986009588321925257 0.54700249899325514846 0.4685172202959930754 0.13315033294604422531 0.070855752169129870843;0.39712289051558047337 0.39631737638298597526 -0.11009316259404061666 -0.069246799662797328678 -0.65200117624577447195 -0.89725223289490252387;0.68796162816428108044 -0.20525274249981642627 -0.69007604469494909782 0.26969194225336928783 -0.12222521765142084493 -1.0189528705332047132;0.92632306004655551313 -0.64974986737069184706 -0.069738115267831482513 0.51395011162781889524 0.55259281132586479668 0.11212494841719290728;0.006913812197908991361 -1.6959210247597900079 -0.77533204448857151458 0.44110061007269502076 1.0372819511760253963 0.72577539720512895816;0.56177011123525988356 0.2577889381907749744 0.85164488688474249134 0.7119266350295120338 -0.32189696362030328913 -0.24787276507999772557;-1.0091201838656287393 0.90139260845666979716 0.99156676089677420194 0.50987232596312637156 -0.45369980260041120612 -0.1078268936163929298;-0.65541760123846570796 0.90003338764558604712 -0.2522624482783993316 0.52448631510110199638 0.41167552904552523474 1.2911274108964385654;0.60231144439308481608 -0.94297526173486556633 -1.5578338844885180059 -0.42948888098472676189 1.2827876855444693138 -0.28394846346184088315;-1.3251672164080003924 0.45790713807955640835 1.2285819164077196319 0.036619699226660716584 -0.15192265755692779816 -0.85433770231695727038;0.31879491575285490157 -0.86480637742566712767 -0.5581108998454458181 -0.81705334794763240236 1.3176213287563500742 1.0136996377588993745;-0.55045026820420084324 -0.36085055989481706895 -0.07296337192158647289 0.14096860388035867273 1.6481163163541701078 0.96027394436531876565];

% Layer 2
b2 = [1.6572568822529358812;-1.5605744932052638685;-0.94792830896813407016;0.58600839327924647559;-0.17406735323578659269;-0.31333145247996435634;0.9122924819535830343;-0.87363054440151532987;-1.1411494840651368321;-1.6853716854267026815];
LW2_1 = [-0.48989543106393662608 0.068655600388546927926 0.22597833692055821486 0.038359240551650131135 -0.20669762137413358327 -0.098644762573579361509 -0.52084005436297065028 -0.24655802611673199864 -0.36733863386605136725 0.63072789010840601964 -0.081599778116077339996 -0.42456406987237660378 -0.56516052223408008715 0.32150706530093070556 0.18121105243163840304 0.072443538646231639411 -0.091470935093497393598 -0.0097224014178478399689 -0.050971945601129234338 0.29626776639635044042;0.33379556783925851127 -0.13353012493056073962 0.0076302735856215745877 -0.058029809805772533671 0.099658148412716543452 1.3533505053375192162 -0.090506829110975073327 0.090456080229490712363 0.17053974081234563043 -0.89884660519390324751 0.25614335482990702175 -0.011942499347591967879 -0.091346192124886274599 0.232909647707172901 0.1424389417527972268 -0.014273161135780641426 0.18186640991370664477 -0.17488392455797518998 -0.36074642307097332106 -0.0011373821948429368566;0.53468437230601650878 0.072106568049791305852 -0.14645684949177908973 0.16868316666249494329 -0.44362344322955032938 0.26877448726794195277 0.0080101937511967650357 0.0091159292461428995114 -0.092587293077378396422 -0.17718735672889490695 0.64479111930484378501 -0.46965136000958790374 -0.24740264015004170828 -0.086433016375132412645 0.43605611146445433235 0.071949770522469244649 0.45247522979509746666 0.063152856020049330521 0.29701346651608834248 0.41557759072719041571;-0.59460553467393717497 -0.89993469189512076412 0.73082457950182544426 -0.70370080791292122235 -0.28614620190425626989 0.13792285641825965947 0.32806041330175922388 0.050562170066561516746 -0.47303377520112610544 -0.366264784075004457 -0.018899986918525280705 0.86643298718713523954 0.2541245078150662362 -0.44196581305513948923 -0.17162007514794605512 -0.087268290565033213024 -0.47763138558881607088 -0.68579475660063560216 0.54301438261769008342 -0.33458657769725475006;-0.48784359576034952433 0.036137700707445361004 -0.015535090130026428523 0.14101435135917300689 -0.11864484444547918063 -0.11193944149020818024 -0.2185887516293291144 0.020162639261830577614 0.053422611326551294741 -0.81660295935775362164 -0.25639232370450704135 -0.17313249095246099896 -0.12505709721252408761 -0.10534500240041808072 -0.66406446240542227333 -0.49342374456588078413 -0.4515962090350185143 0.19254892689739400158 -0.57252313701635848542 0.13872666647494316661;-0.14580590891442685164 0.16401014832584309699 -0.10058681179459116883 -0.18164922147471920799 0.12624363244989258992 -0.13693110144420544971 0.039503207378499854974 0.045951755474591973738 0.51544631199591273152 1.1729666970208296739 0.35524910071341908591 -0.0024819659583981850716 -0.048314298331462043889 0.092583550715842968803 0.01578913834708495223 -0.21019869506912344792 -0.3123025511129678411 0.23920363760264518049 0.18464107631010426291 -0.075503387740482513779;-0.04908183865319795669 0.25726347371405094977 0.061206147171196642609 0.17455612677959719825 -0.095371219183416955367 -0.63645964404660482217 0.10291469327502002218 -0.30852364142133170688 -0.59029104237835106073 -0.059107648363659115454 0.10762066166127580435 0.086562477570005846861 -0.066006084669100212325 -0.074672759435076521695 -0.32373989507109501851 0.19385862329523934067 -0.078104242799480486092 0.67362212815099542507 0.73260609254165098836 0.42902200954776531505;-0.14803067493854252246 0.48756685556861939501 0.081528298820342848252 0.23920596719773271066 -0.3285269746736142471 -1.0770271485457407756 -0.18615242439578896794 -0.11728326400746422187 0.15606836879291871578 0.31631309284490433109 -0.2322242652830274201 -0.0836610679766831844 -0.1709634804644921402 0.38452162459815864004 -0.49299807434800613226 -0.11985244784434016807 0.036072728234898293609 0.38706800142336289516 -0.33586830155609359583 -0.25719879744000967436;-0.38825870433740250487 -0.97743148610631280793 0.35693728173616751098 -0.31160056443905925772 0.30758522559758100234 -0.14801713864614868266 0.33978772796691442126 0.71032213579375036439 -0.47209978715882261469 -0.4324418540822962953 -0.08299797212339229957 0.16156792525042082409 0.70558335978473252226 -0.61048893397205383771 -0.85648460885301380685 -0.2007895985931462679 0.033283412591299195438 -0.13069778618072316889 -0.42277684481641869541 0.28133252217073623225;-0.50433486758754419998 0.26689112228958750128 -0.038566489655983485219 -0.11485082861169106094 -0.33446969560523059917 0.53260648559192635965 0.0068869754270008826103 -0.015011054688801789281 0.37112041093717951235 -0.46303758639068787195 -0.5964779883762010293 -0.21269777052387792149 0.12786205869918434996 0.068382163736174617075 -0.13680787358824209043 -0.23422480356230168663 -0.10664529031277004967 -0.045283295778889683103 0.40229031529849879067 0.67988068521023536928];

% Layer 3
b3 = [1.7258632940537530498;1.7836343059427157698;1.366877106665784547;1.1652254504381533984;-1.2308412918031819139;1.1472696126988339849;-0.55458200068815899364;0.27332914968977634063;-0.20009910485492204968;-0.053156836603753858383;0.18919025325133220772;0.25616908818985045793;-0.63522182668887927637;-0.64021382846745000794;-0.48646373284356986266;-1.1749907075415555457;0.77675424872737097726;1.427454186526604385;-1.8626828274350719639;2.1007338697541437789];
LW3_2 = [-0.15846610633601451723 0.050012671305824957235 0.90320271468754920186 0.95623108748762120079 0.74396560176172488177 0.21947970193722776688 0.99220950179509492806 0.29093100150870787601 0.038849535563449756614 -0.90670982420224954801;-0.73181286410830037603 -0.55289002217991745081 -0.81984661783977619276 -0.064189848030350479813 -0.64029924681250793839 0.16919912569696293758 -0.1141311615197892898 -0.6774411217661542306 -0.90926263923347605544 -0.018234265088990904424;-0.89646831827204576104 -0.060171644701417698053 -0.25161620078164509406 -0.72835783522657326916 -0.54216197500829166334 -0.28129711859995215617 0.13773354537234097639 -0.76537659113488643037 1.0448782241426108897 -1.0111771009598209403;-0.36817922327763924484 0.41992471608552084383 -0.8358936238596242907 0.36191854647913129783 0.05352617557600120729 -1.5675205408311221333 0.55366078377647953701 0.098894184876576293752 0.023858235727560288264 0.044259048625781990949;-0.050024191825209986251 -1.0486718941442625397 0.52419218806210554629 -0.66382313417507909925 -0.18507459409873555645 0.74970735978836777758 0.77786294083619700324 -1.0047061083274149151 0.37254670286101038146 0.081347502092243867411;-0.76705196219869897778 -0.29371220378070522772 -0.56708701686244711304 -0.88561497545961553879 0.56109311086968216564 0.62063192788606524886 0.6098370823925529649 -0.24538962047685813905 0.71553771389040032869 0.92095683565618502442;0.6017589034561967587 -0.77481117625933804138 -0.46638401020726782953 1.0633177911859243991 1.0163521295574746706 -0.0020237913780517652849 -0.3376007442891554855 -0.22897193140846625048 -0.014648836778875105186 0.42704616326364785994;-1.0438630279601186501 0.71432674787328187538 -0.55395116458664606096 -0.53205190004914926227 -0.35450038675397216315 0.34190736240590879902 0.66771330639559822728 -1.1740348910427833573 0.29676806390856930173 0.8738795258299636437;0.19311438043419029698 1.8234831151549069084 -0.9100611012783463849 -0.80481372687423646806 -0.22603168777316587357 0.51870714948372043107 0.43204628705156283841 0.11491921130853721689 -0.22474068010757969338 0.40880191878099003677;0.12186423619471314916 -0.95124978791061709504 -0.34216117408532914501 -1.0446010146181119449 1.0224261574377560002 0.41536511597272834928 -0.15271206520519953198 0.41300483258388986929 0.35770603418953178521 -0.74072686184896341377;-0.51266451414056757319 -0.19596361539929765816 0.026203440013042093165 0.54751665976906960243 -0.42738172724644390987 -0.032966370139787995464 -0.69114801549941307091 0.12043486534680618305 0.19708029533664209176 0.098093368757449977968;0.14199736988998998277 -0.14901756662728266045 -0.82658215588251227057 1.0663810940846500941 1.0696048520850327535 -0.095415446873128445526 -0.0026700045001534669468 0.032169595116431616566 0.85631896714895106015 -0.1375743891078040626;-0.37611925892447911624 -0.076797533688264321694 -0.31590046498495344407 -0.51498763292229676747 0.50738451062519873691 -1.0840429722084437003 0.98037440317608459672 0.52769335267519346111 0.61870610651698543236 0.12832776985927568658;-0.72500056967331361069 0.047279331104309783862 -0.33647639544908169995 0.65120239455592909827 -1.206680285412692788 0.015533026658558926267 -0.11481155541120553754 -0.666739232837969098 -0.99657008324569107405 -0.50917481628952709904;-0.13190171856869539746 -0.4352945878261472723 -1.0111975850792662701 -1.1646639202015531822 -0.19188786607111699145 0.12411746364501322071 0.73191247899785338848 -0.011797815463657894755 -0.64317956477716520247 -0.11565379425353151943;-0.55850917144354184085 -0.46919486711815483471 -0.60966802238673178937 0.59378847299804704551 0.71848961453659421217 -0.26793363452707652517 0.12594252122321900056 -0.10762060788008102896 0.54895322212305353027 1.1481011242383125648;-0.13982550611570690458 0.69733134934550167205 0.12372140586438679088 -0.90679783912419698044 -0.81068779485493347448 -0.43566763865598745475 0.58121007536597935061 -1.2406693860396460494 -0.61887959892249699845 0.61997502175831575855;0.4069061842518683636 -0.77853579319317722796 -0.32659011990197689412 0.42360788059090326296 -0.81173253855567040205 -0.58752957178470810451 -0.95001972537917833694 -0.098900676727571856794 0.84514276541294108824 -0.070349749054681970373;-0.68428800391550592686 0.33862444950536418897 -0.82037188649208470093 -0.37432460477008711042 -0.16763199955236804395 -1.2223913651586506557 -0.29362273041996345135 -0.047199055187436979308 -0.62599363462098556177 -0.038597017679217776598;0.59885964521882162348 0.76338545999515827756 -0.12993013580112067196 -0.37037225396557421631 0.88858627176503957035 0.33174504516304598178 0.18544325945013767631 0.94337482301737340951 0.47547109063776793469 -0.22936835803066585315];

% Layer 4
b4 = [-0.89897463655307141561;-0.98887635465158163495];
LW4_3 = [1.0462310587123200278 -0.482956857952442975 -0.041476036255607015568 -0.15103485227852153638 1.1695447653477124561 -0.46819611180010151097 -0.028880024987049893875 -0.17163038923313689299 -0.94693223426457395764 0.53580604123785346982 0.42454596905140556951 0.23117019666339111428 -0.072112229742422373491 -0.21007795910017093566 0.23885883344865727063 0.087237009092783035502 0.31717044861343562934 0.53931985770295809424 -0.60373867786749613185 -0.020608203108514154545;0.70207598177399310746 -0.044774175267296427438 0.029917421239262033394 0.74718118886577855609 0.35088737174817347109 -0.35970654557111764182 0.02446121178597686352 0.50226119614818753867 -0.565580444510168312 0.62803766713596553828 -0.98374886317340193287 0.68758084141009823131 0.32675457054735118634 0.10437839980396503015 -0.62268397254616170144 0.29756670294309905955 0.31991794427923664346 0.39131129200997777362 0.57112181287626839765 -0.83166666230957631001];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [0.220818796095921;0.154008828929914];
y1_step1.xoffset = [0.0999999999999996;0.715060397219156];

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