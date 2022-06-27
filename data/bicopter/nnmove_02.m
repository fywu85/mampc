function [Y,Xf,Af] = nnmove_02(X,~,~)
%NNMOVE_02 neural network simulation function.
%
% Auto-generated by MATLAB, 26-Jun-2022 00:31:47.
% 
% [Y] = nnmove_02(X,~,~) takes these arguments:
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
x1_step1.xoffset = [-1.61717502386496;-2.93543929307278;-1.41902644818002;-1.79932934706044;-1.53133411450572;-5.96399313732134];
x1_step1.gain = [0.605311482852156;0.402157922200241;0.661948410850101;0.696966802812551;0.817033208121978;0.12838627801464];
x1_step1.ymin = -1;

% Layer 1
b1 = [2.4380257437339740711;1.9842341112267951608;2.195197790095714474;1.5907998642101064402;-0.88361356361446696805;1.2054247353357496753;-0.93200998966898263021;0.52021007425404319768;0.23007132648924039087;0.23895219740595347035;-0.26999098470439553132;0.40160636169955427066;0.73219391442980330531;0.6592731122704176272;-0.94822362207560562108;1.4651388764472961235;1.6444556997740409354;-1.9180139706283381162;1.9153972546133011257;2.4489285256537418611];
IW1_1 = [-0.79581706812599795065 0.29749107130231544627 -0.62914246325260236858 -1.8021746874025890151 -0.11719713456652018635 0.70577285519296417693;-0.33211986643756502557 1.4142722319438667533 -0.35059413695813879119 1.1563250775503026713 -0.73366989374222857379 -0.99966684980481057554;-1.1725768083620891069 -0.70028067191640241962 -0.94103201382527867924 -0.61751347531150646564 0.92461497087784849658 0.74430135099190575243;-0.16492649618637725273 -1.0800068877459074734 0.49692525720907559927 0.71798249159311089418 1.4386460309895363618 -1.33090631445547114;-0.20609108869976283662 -0.75716835530458548309 0.29838168584375673875 1.2583751291944140771 0.87641057905572883335 1.4339523999985985814;-0.96041728465537368198 -1.1474968069198299148 -0.060840696259306638327 0.9826988327273452617 0.79356634730008479561 -1.0922063031917703668;1.2066110368902744909 -0.69863924900306806354 0.79057999297396008842 0.64473205366783092884 0.89123627211179001772 -1.2164423920541393986;-0.94327225766596356493 -0.32102806214282159081 0.48364710529983689913 1.1680844748156014035 -0.16042627879797419221 -1.5853778702593794847;-0.11557559465059703829 -1.7559102941623878635 -0.19121968072212225387 -1.1717381365062706777 -0.47641788652267985649 0.58491427066812995417;1.0262899360159813966 0.90159540475978616758 -0.54785236949651183735 -0.87292868854287886116 1.3310163767144336244 0.37626118514965800621;0.5525384433217865876 0.62649570341867999446 -0.49220858090632030324 1.5256134801929961409 0.98675982140176865531 -0.77845339443819094871;0.98337758895681115501 0.46969129686425453718 -1.1457427359143461665 0.28661321394011329833 -1.0510434266206687415 1.2864921442607708535;0.30774936539435199245 -0.98681972171498100188 -1.2398379125836778147 -0.61679893130453733452 0.84404068059356607279 -0.82405482905235649671;1.2039661215327530641 0.1605687579362888584 1.3970245718658456102 0.039146525292796247042 0.0074757726275550412387 -0.23891155525151805405;-0.35730115773291931669 0.8886574145783088241 -0.56603741019042030924 1.083022472476343534 -0.92178937603192023786 -1.1951519109381554262;1.1917274366951582376 0.80348971971448390761 -1.1103326712427228351 0.41081006316757401331 -1.1442344250244995685 0.63540913196856219081;1.2815471494545789266 -0.94299442473764938377 -0.81610606106175909158 -0.948877446546436909 0.678102220421117452 -0.86514429605114295807;-0.94899386560790766065 1.1863506204758775819 0.16464796279491261677 -0.61050060277325635116 -0.24702063392352943683 1.3292913635019818486;0.24592102041703878257 -0.1683731401388002813 1.1888036469303728815 0.1224826297253539531 1.355479219776752231 1.1751248958624544994;0.12338916491085100136 -1.08788294813125197 1.3269924933145071932 0.65105694134118952121 -1.0684173251246709135 0.38083114667759898619];

% Layer 2
b2 = [-1.6135493757693437633;1.1235203287227835123;-0.71871409064652314047;-0.47012245409822545072;0.13017677376827063718;-0.039103991842410638913;0.49819894051267271662;0.8433285012914454315;1.2744799541160258816;1.6683593242213126118];
LW2_1 = [0.40491238817596619803 0.5303209129252898224 0.033267470167556698057 -0.33792115279692036545 0.24994649453020839625 0.35157878389699898092 0.24117377665797989916 -0.43202206998677611383 0.4923233317326002334 0.73330458193478731399 -0.4684235241939284089 -0.08316760082899692097 0.049479523258139708475 0.28718584774247307712 0.40081044831966616826 0.19737414360851535111 -0.27873634998940810537 0.15727078743043282349 -0.27967234953995462332 -0.31354310800900619949;-0.24604532312756080548 0.46240682984334124939 -0.34529639953035745625 0.16105878574151016869 -0.16976920450894794623 -0.45784318881234120635 -0.46283409386547402775 0.34267919577004152254 -0.12862380149386595796 0.34140730159558507761 0.0064521985441723991167 0.26392623840338347296 -0.0058136582852374458358 0.62658713854215364325 0.23585684692069594504 -0.16589825014520268032 -0.045840207783972769517 -0.13844997103962006224 -0.65997535112659300172 0.048515986432256213989;0.25733273208838314261 0.37170766375485836397 0.23527697738274555572 0.017382916038785178187 -0.39179798657549147478 -0.34521371477576873188 0.66006606711150195288 0.015837667810423148446 0.068945853202391008119 -0.26207971555788850404 -0.030883734203390460216 -0.14302840949146378158 0.083531515038279408047 0.3462356855193062799 0.90865532414992900012 0.29968554107655226426 -0.27734753719869587041 -0.47632567227526312337 -0.20933563586697176429 0.4254199801138172643;0.38150963313490116047 0.10959005741242114351 0.30019111021198252587 0.58828480658757820176 -0.10989354321896371847 -0.22824162193151076305 0.1902331813641991165 0.0779611420517492687 -0.20750008422348986681 -0.086926379968574885027 -0.23825782634214409672 -0.25945166309153472328 0.42983983490787958104 -0.53787486486061131252 0.43860878842030409652 0.72086801539542955108 -0.59292440963426240597 0.1010916781063087716 0.30668447490813560696 -0.57188368246198340028;-0.82731996666741869362 0.38814333147570778682 0.12703850373694938747 -0.28338861840019247129 0.12122615060849323276 0.0096047230460223481652 -0.36955246298625510359 0.41074719884017146798 0.037826279389726560898 -0.29374156681935514879 0.096034062873108505531 -0.49662747679168683934 -0.027188170056836873101 0.088587824150717031646 0.043035627835372590455 0.1223206064968180018 -0.24982286324586372439 0.52116037252971636473 0.57333356626737497219 -0.50247591908901734215;0.15452623115320679448 -0.50548808704143366466 -0.2158403434167218693 -0.038833030851349925605 0.6124493347943053001 0.56206093076780971884 0.35124121468636188004 0.27422468542042377493 -0.0036675491114902293577 0.17547027118011132574 0.24586099384236417831 0.089392606550336331517 -0.20328929297560227596 -0.14592036595116789077 0.11180452944109259272 -0.30241483692869108868 -0.49483917785418923829 0.16229108242465467571 0.82508249079169704299 -0.29879855865719617825;0.27856145243885133134 0.53596140097791067358 0.43673943405157739095 -0.052570370263872040484 0.44652987250815984188 -0.062487733968467525092 -0.33556707804474827928 0.11553699094182993956 -0.29496334750111474765 -0.51092275226715999636 0.43962294335872126316 -0.38255914728178058715 -0.34017647031919162615 0.27191447666222867685 -0.44457007751693122799 -0.018966590445046699331 0.277974568358254015 -0.46695224382606526081 0.18222405512399997285 -0.022890692020367593706;0.16948637064582844358 -0.23660480620982782263 0.099612805341665597303 -0.39551220323713504046 0.37951124934135621602 -0.1375241414169156573 0.05558731730227789436 -0.16694641126496514993 -0.43845171793673382021 -0.24123139846600225034 -0.4630099607699248998 -0.09598086691003909765 -0.60603485080276520147 0.20393615839036025039 0.39899184499289414019 0.61131765819711292309 0.31320207030727370556 -0.43026200417368415385 0.5126625726695853702 0.39710535476739988736;0.075752470440888314274 0.55132747038081209023 -0.42251662626475727791 0.0091420217902785528424 -0.075469697676150998555 0.25679676580031507438 0.052196506907630751959 0.35948790992341206341 0.033333935772980834156 -0.096585583006006156537 3.8670198300151670256e-05 -0.21635431641644170542 -0.51719893499175806362 -0.42435994213452793433 0.23773432954126938466 0.22592406066938039433 0.49873474786751631482 -0.35141654477320588557 -0.45772665753669872224 -0.47672482167328222857;0.34849159245439581545 0.085585545859869965879 0.26681732137808489291 -0.18576874933107878629 0.42753971389180284168 0.36996623076578583067 0.25816935730215123668 0.30408746254618967964 -0.28515544398065595377 0.021230300801489434409 -0.46763116709912982971 0.3824580202463390699 0.45952245242980782614 -0.31723108884004902475 -0.51247916851340613587 -0.42314749524098538291 0.46357659533201212021 0.41510439632121692854 0.40345948398129960477 -0.088512845290467101478];

% Layer 3
b3 = [-1.8825962446641431036;1.7022986658136871618;1.5182428390219997461;1.2303456934736689554;1.1737545599187684253;-1.0525026003114590356;0.60540540380893337336;-0.21205491096817022378;0.37418484234769222585;0.05474125485851583095;-0.070271320387815139341;-0.15235271414119835875;0.48568402243397734708;0.66239728054497792886;0.95817510050779608477;-1.0940859992730356254;1.2748099416190246114;1.590677614017507846;1.7576340381632753473;1.9226738937399043827];
LW3_2 = [0.66202654218370449168 0.36191491577016288161 -0.43867460982209166565 -0.37284427634398120688 -0.4363650659573161672 0.72725743835948397642 -0.84759248253662855532 -0.72552498461249770312 -0.54843693739300247714 0.62916224254221442269;-0.76904173070776682408 0.63866127578687481581 0.84443419334548430744 0.54360569728091323594 -0.45382245529674047901 0.33375602932098435982 -0.68677667617715576487 0.47564068312348056766 0.13463158189593052438 0.72626639859130259769;-0.59929167756638279663 0.11076120865668159787 -0.87279839447542251207 -0.20359670199006421609 0.45483201433368958266 0.35272921555425035267 -0.87608830834176620872 0.77362933212679674266 -0.059200453213987577761 0.78710558197383995171;-0.82893608900932869155 -1.0330516680947579022 -0.16648593294605826265 0.69102006673189286801 0.58235133564956953478 0.98015346560770355566 -0.061749406325205619117 0.59936505797735961654 0.38576291600337664356 0.25351438832133582624;-0.21739182745347845893 0.62107156213692871205 -0.11478756855551458527 -0.85770733050240832718 0.63466996055291202694 -1.0589359321818379023 0.74562648608851833654 -0.1746705449501184948 0.44685609195386921666 -0.21313919333442124526;0.96714328875228960936 0.37136648540069339131 -0.82832530974697360371 0.68748807008210810476 -0.037911931991173083989 0.36596835291783258448 -0.32575453825992412016 0.61256317372974733448 0.26179216991052528529 0.6204756041995392879;-0.8685283905021328188 -0.76723741886835583603 0.026919473104546978032 0.73259867778646226011 0.15031719051869640857 -0.75278819534308605288 0.53026976001803527438 -0.094151285653377533857 0.725492610376581748 -0.70561432984081806641;-0.1280441011804502871 0.040897572094830608735 0.67919486195417877461 0.15304614665123952855 0.60045620100078767045 -0.71362889784007854654 1.2108031724157817255 -0.15317111402330799153 0.77329024990950323559 0.86920048031845209557;-0.6105858257321985505 -0.70953579061551941276 -0.48951437260510965999 0.22963227655520118686 -0.65160604192173798843 -0.4567384831877059348 -0.9068485253608443708 -0.72192546414562597246 -0.14957005827881200699 0.56269196079015404433;-0.56466049047362043556 0.45977477888742573908 0.34979033167414153027 1.0653240455560171185 0.2287736662489718853 0.68578351042003904414 -0.88975987432814551692 -0.037001456744648386632 0.66383526516410851226 0.41782569731057889184;-0.00026656685132276183338 -0.012417449376012131695 0.051969937886619750611 -1.211552433048880939 -0.60612704478929324559 -1.0067456210847427478 -0.26599149149460854513 -0.50640283364835037005 0.020460042108258469362 0.7145274413921890444;-0.93558138133762003275 0.11894484453604017848 0.7719935277967230336 -0.57940102142654037465 -0.30699853865882381632 -0.1489791928666177323 -0.71705105946214542367 -0.16462579235931509847 -1.0045844505599101915 0.099572353793186130222;0.081278354534518079677 0.21823512647573642398 -0.44384852634575910901 -0.69725244687016063594 0.62949164835244397764 -0.77248855337852639913 0.66096894898663738349 -0.83538657213365408172 0.76542811087448769936 -0.42609133838262541749;0.32367647110441677416 -0.7499985992443772842 -0.37750099581120477588 -0.032289796538456330688 -0.67617103696411007263 0.77009055490885991446 -0.54186165232058836061 -0.44106017367827227149 0.23702791908753595429 0.83553613635291290596;0.044668114775451961407 -0.60337196427376948993 0.19716578038800655626 -0.26729073372766376515 -0.50497865407087594303 0.70339708226937025515 0.87688473040144443438 0.59467634622149856405 0.74282226994139033405 -0.8733461153558313983;-0.89841413683281512448 -0.13542843918235297762 -0.033849014936334326231 0.62385051523672541141 -0.084279670574871803912 0.92206313833991937479 0.70135249314908298945 0.87756268251335578512 -0.19615820485767651582 -0.17518117987640335897;-0.0026680498832881245283 0.26864513559575947665 0.73943810851087143909 -0.93084779658381777701 0.34378897503008931658 -0.33788148093058656407 0.42983751999840486002 0.44803401021291516804 -0.95032386652740741262 -0.79060503894320688367;0.11525574887664004342 0.48811791576944857374 -0.97308682388645495465 0.85097344304325739373 -0.089460422063091807332 -0.022646995043710087259 -0.021687338692823091013 -0.14301099238808709369 0.348719803947112994 -0.8277317893178457453;0.61887382104765609192 -0.40744199131317515583 -0.054438043223298704376 1.0100998115119455001 0.66954816596536037565 -0.66377476048420880339 -0.38174835930735556699 -0.85231070291015353924 0.0008723748002556867831 0.4427043671163921057;0.65867253847823092894 -0.44450766955481779696 -0.12002576255368575808 -0.37853624089338949732 -0.45509362612150794369 0.43863589093935734242 -0.92497537373495986035 -1.0156392934819744589 -0.18810498412232898313 -0.42249040591260944577];

% Layer 4
b4 = [-0.327887501035771467;-0.26192706083177186294];
LW4_3 = [-0.29252655893310341995 0.73505471536756572526 0.3109189177970906881 -0.88014154666723665166 0.72820466463847499661 -0.25677648435815220163 0.3533333617664374815 -0.11475911832309043659 0.14049873377618554704 0.45972194069075861256 0.35667404754600939842 -0.49982407757642804969 -0.84680025202517272831 0.038749834769616006702 -0.69639464576039467048 -0.77015640861581102783 -0.21053600941922645529 -0.53794061387265701413 0.48922442769400231732 0.1164746819846573106;0.13201565383751731608 0.10156509148954816213 0.075871248364833235311 0.095447792173355944234 0.086885028154398413758 0.04597054268817618583 -0.69440298716437975912 0.42412694387459654033 0.2473111067727714607 -0.44186296764307442242 0.079411308112320361241 0.42968640425731718935 0.20226293882290916071 0.50546559716137873242 -0.17105273994884045985 0.67151409600724887294 0.044055071582073696002 0.82084642309135891214 0.57330342315328775005 0.23015987789508501882];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [0.220818796095924;0.202501353740188];
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
