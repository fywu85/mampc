function [Y,Xf,Af] = nnmove_11(X,~,~)
%NNMOVE_11 neural network simulation function.
%
% Auto-generated by MATLAB, 29-Jun-2022 03:11:29.
% 
% [Y] = nnmove_11(X,~,~) takes these arguments:
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
x1_step1.xoffset = [-1.40432655203162;-3.05772726649525;-1.50337830487775;-1.46639144081691;-1.47317076330138;-9.39260604806797];
x1_step1.gain = [0.701215936936036;0.342040821094694;0.707661234476445;0.774842031884718;0.660834644460766;0.119048524684758];
x1_step1.ymin = -1;

% Layer 1
b1 = [2.5531251157313090694;-2.3224117381141069494;2.7485130910889239431;1.9012160072424018065;-1.4349095863480205715;-1.6657757215821589192;1.0039355810080712317;0.36439974393512020168;-0.40421576830831967841;-0.090888403721927038537;0.37522480443090017177;0.049733237075485478562;-0.16877510914789362051;-0.90614306261533328346;-0.79346708422265432858;1.5430180763081560169;1.637896762810094442;-1.9342136280500168422;-1.2952043682299052563;2.2451333059316262997];
IW1_1 = [-0.93472583037705503362 -0.68564247722050342126 1.3605184623196482363 0.42943620734267134997 1.4837609720475419817 0.64250250494286087477;1.1290888441383917229 -0.18001980711674281377 -1.068877801408707251 0.47366005031526564606 1.1480085634326047117 -0.065785783203556963405;-1.0352612555778941683 -0.94787347907846819517 1.0126862045721438665 0.17640785269503470034 0.13334783503907915447 0.43012693295005638427;-0.55956853044040966161 -0.98405958378086355598 -0.23654253896685678571 -1.138755184553552624 -1.1142373236257059332 0.030159692367034852262;0.95882624231090385347 0.36617560101516127835 1.1038556735295428357 -1.1964784821270832982 -1.0633979686609809079 -1.1173024479159492373;0.50720906555263112203 1.6205065083770298084 0.1332112335420144178 0.36558467643489789278 -0.95703072921847953669 0.44834307211332430354;-0.41030098705497075606 -0.8917750519059132186 1.1991638616788959926 -0.31008225752118712126 -0.53601565854611998851 -0.68693582824240551066;-0.1719673234360347136 -0.12579406554990971157 -0.63196393824197460987 -0.28630900339991932624 0.34316404910068698531 0.13518639560852988013;0.86738292969938046717 -0.45176152409478298466 -0.73186955436492684424 1.0283267207371118435 -0.71624865246027291654 -0.24008832952376407688;-0.41295114284985756647 -0.4732249252177974097 -0.59683457813303852912 0.26884507275526259296 -0.70818739149887821593 -0.81816260922924188836;-0.0020471269392320226924 0.15872611016558432762 -0.95217971061633244201 -0.97782851561783790117 -1.3296037925682606673 -0.37107259467441727763;-0.24830899186595228878 -0.69960920946871152371 -0.084588602771608109587 -0.27945987028057334145 1.020374046558607084 0.9713204204975386391;-0.43305797337428608706 -0.21343129339565247715 -0.078744482887742994759 0.2687648421711232305 0.77556832452961443902 0.87429771569262493269;0.55228175686200875472 1.2571901360682815607 -1.444602004737611578 0.37281191046982486981 0.081820571801016789282 0.079196757848183640949;0.1388091565377689296 -0.99124118456415621914 -0.84474954651516365178 0.91036886588821130939 0.78319006150991188342 1.485329778548989621;-0.10130669486971337345 -1.2125915193190721642 -0.76834301599953791495 -0.71985182347795306779 0.60628105890051531279 -0.35198520784531867056;0.18442753412510601296 0.84460543547442201717 1.0113627947040300104 0.81355557347157969605 -0.19168745293414909958 -1.1757942337182818449;-0.39412738072724806671 1.2610166084554994548 -0.52534920111050043001 0.21117281968491227739 0.70952301317106891698 1.4461822098925687374;-0.338129676023585235 -1.5177483378813125814 0.63425857560717235906 -0.10711499689491003895 0.97929061681008700013 -0.20372161648896730535;0.76401072278428050488 0.20662244750854891207 1.1817623064264217714 0.26734435969435343949 -0.77278591616250469354 -0.55884292840255622714];

% Layer 2
b2 = [1.3334162876364197281;1.128273098848936673;0.7849299976251248312;0.55108145515366613321;-0.089744593872263064838;0.0418366225298408001;0.37990202452931109978;0.91046582884652849099;-1.3202850082670416487;-1.7503051874072308447];
LW2_1 = [-0.57655385048408069881 -0.079954191919417688661 0.042418083517984650488 -0.03829596619112914796 -0.16906210016660538908 0.10967701566352407172 0.33358685323714704074 -0.87379684235438659368 -0.28427296425938014535 0.25988684740822703967 0.048696166301278917543 0.65898869411162797061 -0.068033434103830475737 0.2975821130512883439 0.37186116979628347501 0.064155666646348724624 0.6354309810528729896 -0.13707917369661296036 0.21719511007494871069 0.047340284488050235479;-0.40988340961967711928 0.37991364637647978553 0.10409299743276305417 -0.16868411491296333993 0.17890380889476797943 0.37837720793916762574 0.35027974816770968136 0.4209894543463608696 -0.4915855599813697685 -0.20548888052680028271 0.15536756035086005112 0.44861018860443807599 -0.07830276289042613358 0.020050990907139795011 0.63652974926356331586 0.4228993662072170201 -0.40049116896177922031 -0.3249079265563546981 -0.2906663711781185544 -0.2121922874924734026;-0.52386676840801771338 -0.096645574652341359467 0.21326369489080049258 0.0056455876351822120371 -0.07362851473403018987 -0.25458774750637552797 -0.21204192256096576763 -0.17712113088008199502 -0.15067590730940605415 -0.10479809516590422869 -0.053636670679971513997 0.45910497811249656452 0.3799041166262892566 -0.20596420172649984592 0.0398864984863385591 -0.54127818920200243547 -0.31829154884782512314 0.23191969336993986661 0.0093410474803159500995 0.47014240400529655473;-0.23175321570777460134 -0.44170182540888858203 -0.3982801041685423149 -0.33776199028466030727 -0.19593610099101047006 -0.19318339579527543659 -0.039557528512614958949 0.098068884650003046444 0.08117557874905141635 0.20176574627523613525 0.19007012856789778921 -0.39100384654273445673 -0.63602938211176995864 0.14947823538197901883 -0.11993620030386596687 0.24412406650806092734 0.13700267163273882609 -0.10735212787450468253 -0.20657563387763105966 -0.24274820771589039614;0.34338119963107871513 0.054268567555559733828 -0.40470167386205013749 0.046837545227051781416 -0.058933736394685749815 -0.044978215456165274166 -0.11280072594465961888 0.33153213658119895513 -0.079612238933559245635 0.02102358595073290648 0.037326790695267890452 0.49145108018114336268 -0.14235632659500699337 -0.055750528279621472394 0.10391835358826055635 -0.38022848520029572938 0.034856741874091934363 -0.055865556551906447869 -0.014932042171970969988 -0.1357951681556454071;-0.11617074282272546459 -0.17399374958540014813 0.22643195874423316383 -0.13404708290331573961 0.11764569239435143655 0.12777936605569145678 0.27339579451118778408 -0.041999671142722481976 0.25212585071283977189 0.10043520355666868404 0.11256970471947620738 0.54502272481525670944 0.91466428004237787519 0.22752022408592845193 -0.27374406256505684487 0.74795479603993619833 0.013700123571777441181 0.046399757351225409674 -0.019165834266408821734 -0.32089295721546767792;0.005391039857162822739 -0.17795491660031634296 -0.40234280523604337709 0.25530008478468857458 0.065407474470477039441 0.18177296937320833181 0.4771770940681535067 0.16366516490386801008 -0.00024976728453866430023 0.22852637862089575371 0.33403218639998771833 -0.13780396438240002932 0.13875978733825533595 0.35352732432660272099 -0.071057731586397415713 -0.47673773585451961754 -0.0098976964798659500255 0.2484430467156525657 0.2763437797647088634 0.16766079553398194335;0.54340449021404335639 -0.71031502276715963173 -0.43179541845229602037 -0.001166226227614395889 -0.0037749405114944709766 -0.11365889916062904552 -0.51291028504649260888 0.29083995258638389858 0.09751277584494053019 -0.17412199026959451764 -0.57623873829431160321 -0.026260658322843681567 0.097002942172974171431 -0.39947786896261405776 -0.40767976699133962049 0.61261127437080997726 -0.81864756283712325491 0.20050492685548393368 -0.10333856391405420172 -0.24106070584350897112;-0.2681584963521116971 -0.38160379032612318229 0.035385700888727195101 0.10694226744329482504 0.078451362520988665583 -0.60108924761152815464 0.7152258290046796807 0.16922110162342957063 -0.017954743770615882309 0.24087355889703490619 0.17419904234468774895 1.2828075874227633513 -0.50677960774701280577 0.39925173452064705026 -0.15716875472417338178 0.10537774326030814598 0.32374924970331447893 0.43231813677775732252 0.0022974356501053840376 -0.73610130882712554445;-0.054514602105224227446 -0.053240335609760859603 -0.43784882464378893641 0.031044554967908762066 -0.10131266418492282377 -0.53465232579250743239 -0.088483860733712463298 -0.62451796849866936245 -0.31278130105371504399 -0.43537802910536654855 0.30378063500451446544 0.10360301410066254102 0.070005547245568733317 -0.03308037682242107036 -0.061189028820093978311 0.32436767173721031687 0.26948005332649066501 -0.039004434602718761338 0.48584954370472083207 0.1006117764495120942];

% Layer 3
b3 = [1.7806549524503634263;1.6711126613170217414;-1.7648671666334367902;-1.6791502147303392078;1.1719412081028404149;0.79393526734143660128;0.72260504272045689156;0.4582833013804236133;-0.50970226600662449368;-0.3496161305110258577;-0.041973939302422776099;-0.20523699823189581193;0.42549756026388863006;0.77883909023505604186;-0.93331468592585009603;1.0967454840063366461;1.1911108424573870757;1.5582638239767760968;1.7512168908626917219;-2.1707962096001880425];
LW3_2 = [-0.28301805058782403268 0.27956984404996498839 0.076000969941032267552 1.1431897035655056438 0.78527754994194365334 -0.45025819000551492444 0.94165286614737186976 -0.68033823289391137656 0.44299328193155040889 0.80082539495244131622;-0.47480841951946506363 -0.49920499847708504904 0.95822021879040897296 0.1589691375892945957 -0.87256198327115441771 0.42001908809342403117 -0.30396142125679564971 0.47702280945222169661 -1.1543174391392452272 0.8524192542476772827;0.53078393843544258157 -0.27571460851067308706 0.036089997130948778259 -0.6780309602983269901 0.79122637374891513495 0.72375219459828399327 -0.47919283443587268323 0.64226654343163425143 0.57632416184760604239 0.051940435125711406639;0.59812484013548594675 0.64728040377052720178 -0.97791943061866370979 -0.67616416992702033095 -0.11578500856128888519 0.483991578781138021 -0.26569843915509289145 0.26435591449039536061 -0.79390729189911568575 -0.65586932786021656661;-0.38344395475110643057 1.2548567958989649274 0.16705336421014282955 0.089527565946115369999 -0.13809967812911275176 -0.038861017793302893297 -0.1669119854743212894 0.12168032243491752609 -0.82582716846775017228 -0.91458705202707513138;-0.49446959868295869978 0.91997040389093376334 0.44578528820941321076 0.83340403075175739644 0.51481073162927848408 0.29160482874390075692 0.38112613462135380704 0.2487750726038304161 -1.2323159637432665736 -0.18169200795067810827;-0.050847112235351141218 -0.30037307670603785592 0.73128249327446237515 -0.28070198104212140677 -0.78513365237815357922 -0.17478069172429072653 0.54811345053066762301 -0.83408678213852838201 -0.31669262922992369447 0.418454615493107418;-0.62983794441382634499 0.61590630463834472597 -0.83900132175004549229 -0.61147495685674890797 0.54920259835700890871 -0.18272097356463520845 0.1815163441041506287 0.48698150443753934757 -1.104944516151597389 0.24080851344323522811;0.22053444207308628422 -0.032124301306149655177 0.36825246002959910463 0.47124548297931073693 -0.039107162481934194809 0.85961546950762857122 -0.33074372996389433954 0.12564212865740664871 -0.3837693672568793235 0.73772608708604392458;0.59188149188011618396 -0.58421695642574467122 0.36378069326220729973 -0.62981589899216050554 0.81314491018633450192 -0.27081451606096912377 -0.06673394500933554907 0.044767447690851912279 -0.24238643840322252054 1.1807748637225194965;-0.72542207981259920757 -0.61632152624872382773 -0.50389112052803375352 0.63849708300474194989 -0.21381877121896727956 0.025471363745866018591 -0.51919740714624429412 -0.64615505034639442172 0.16933239946819927946 0.65082952485513456686;-0.0034191855364152368146 0.27119861809445700018 -0.25325584157161601384 -0.46322865326144258002 0.017789504174595613395 0.79489018880222805929 1.2997459497484606938 1.0380752970219879749 -0.11784943853558377258 -0.17703258659397957953;0.78675458490760818986 -0.69021700379739236997 -0.88148848535290924566 0.39492691182180700293 0.67700895774981517672 0.39385162919000288317 -0.23554644641590358201 0.76511803474610928788 0.22837290113295888316 0.9362225728995485774;1.0975875863468191884 -0.52514604514057883211 0.13260826617715504305 -0.86323093119087268565 0.14358086352199966873 -0.024850309963164073784 -0.36066072363030832193 0.67402642864162798375 0.32983634500818381774 0.56665629302548103929;-0.30925113611150317761 0.064271427876656989087 -0.44420984470842711511 -0.33323479330580807467 -0.8720937639728726376 -0.047586623495206703538 0.89683446348079198795 -0.14674018785222123218 0.82511250733708330074 -0.61679500252963592732;0.33882266235766023144 -0.47404987102030998747 0.51379436430708635974 0.45010358089743141008 -0.27054679091912714473 0.8059479163664673429 -0.31325571297130827553 -0.28464444497128127409 0.32281339253117147248 -1.2707805589187366468;0.28694901498074154578 -0.57974104427496320202 -0.19229597336969914134 -0.29887592791453193586 1.0368825566876316291 0.39660344544423958846 0.40639431559919186876 -0.35543073650477768899 0.18886632137896119943 0.33844384232873747642;0.95868565956812523687 0.24514796177271849786 0.73153358168798776617 0.54127945406119593041 0.59615256754991396981 -0.53052593107377044035 -0.17971671991997456574 -0.91216477902838666303 -0.37175447847232778731 -0.0131806968159447601;0.15822471494933626479 0.12963051691038091073 -0.32952189275351423392 -0.6174077178661644405 0.53348680457507546837 0.49937664810729898157 0.10229002786412245973 -0.76444864732902628734 -0.86056549591225572904 -1.0477357158460647302;-0.76964136913199565626 0.65273306713484990915 0.6296299553948532246 -0.52665824076246736674 0.77846565347509832922 0.047105729300926803271 -0.13776379633463120555 -0.015998931445583744471 0.62394902054787215739 -0.93262808358539972531];

% Layer 4
b4 = [0.18285508975646308505;-0.67948583946332363759];
LW4_3 = [-0.20069148372505099531 -0.42448251941096853956 -0.31483521950960680069 -1.0287741032807780073 0.10795780175443649151 -0.64817528568606974648 -0.68038531896788567721 0.93730508679749169332 -0.22144959095152283446 -1.2088973651153351874 0.47861978022168161218 0.17404326792722973893 0.088736632988312955095 -0.86040355997795214815 0.04835976627066891631 -0.37946917731619256298 0.24412986750233336974 0.4696164177060537237 -0.047663238536859268979 -0.29121279896893464967;-0.119878743941443211 -0.39524425466776058613 0.29961013914877621112 -0.55425218320584457299 -0.30580945572621709427 0.54524631768022113754 -0.7219516939015088175 0.52406872887483446632 0.3826329703611471289 -0.40752800211421680299 -0.8457250198008917641 -0.046256776271979958837 -0.42230261641483934909 -0.34420218844152961069 -0.24403141570047431896 0.80508668997391874544 0.77278204279663487153 -0.33513814849131634555 -0.18066744825036665234 0.4441803821359045501];

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
