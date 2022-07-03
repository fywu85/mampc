function [Y,Xf,Af] = nnmove_05(X,~,~)
%NNMOVE_05 neural network simulation function.
%
% Auto-generated by MATLAB, 29-Jun-2022 03:24:49.
% 
% [Y] = nnmove_05(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 12xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 4xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-0.845918270200932;-1.30490266637008;-0.735770118525281;-1.8459585658227;-0.528101821673327;-0.399260196702291;-0.473219582538623;-1.85436538017275;-0.497898475723062;-1.90921670427207;-0.692838721194433;-0.295907880808792];
x1_step1.gain = [1.30953763543212;0.659138484640931;1.32690155168647;0.630893986156085;1.96896808474155;2.96896242792547;2.02865297091875;0.504314799844091;2.03919466078945;0.52529696099827;1.37113599420363;3.53003320431012];
x1_step1.ymin = -1;

% Layer 1
b1 = [2.0408655090825846834;1.5505193767307619002;-2.167228250336274531;0.47309034181563980326;-1.0871718468880546826;1.0822591683573474786;-0.70270913102450993648;0.0090993620133678482231;-0.080892620702264467214;0.58663512822027896743;-0.32406731925978921049;0.61074901730808217604;1.0169581951497788097;-1.110051123518681182;-0.64142852671485506288;1.2114769049282383406;-0.86952760525042971373;2.7407715414728692771;-1.8068194856843813323;1.091401727024184698];
IW1_1 = [-0.53066059271041854384 -0.082233456885666841862 -0.23638790886602392693 -1.4009276688746878925 -0.68737679452753985831 -0.019870602762559582549 -0.8397346818615174513 -0.19368635656506466569 1.1947475780374152698 2.0226849198832344001 0.44054027578325594128 0.0060736184520306518708;-0.39479383920109090145 -0.29178116291719308206 -0.77234302012235811485 -0.97312900012818015494 -0.18278696170556585354 -0.62566486273495647286 1.1882208209475240146 1.0645368240164128082 -0.56392547245467838923 0.074244901543839600389 -0.44920752515873130228 0.16774944888199358473;0.038188866175670584113 2.0684827676036303679 -1.455637489063143164 -1.0422542857651437842 1.2277492998171297689 1.2539358818946859664 1.3749055174993340955 2.7330676840925987037 -0.49429370085556717518 1.3616318523065447099 -1.1434385399106208325 -1.4834635364643244948;-0.15859701004293033644 -0.72990954343091718481 -0.076370479891761197666 -0.076186076509055539185 0.38873578792032775775 0.40995267605885887807 -0.042549289572739699972 -0.0179070560489407761 -0.70678362578282094564 -0.89973375661347798626 -0.74940285583336907482 -0.62008549844097415882;1.6554094415831261955 1.8472983308187511664 -0.13223318878444462188 2.5359963250018950909 -0.4403492312748408799 -0.31307321258541792597 -1.5157720305807353967 -1.5502304665458817023 1.9044116593323741071 1.4545941256636443217 1.3422102515487723817 -0.19941864874063727764;-0.23057199147680210172 -0.52433830205827047788 0.45299876367688096668 -2.5886109099883309881 -0.53525081426692255882 -0.22237344109733214736 1.4412666314802595746 1.7440035827929436518 0.022396474384705936794 -0.64806183449743326452 -1.581545492452215429 0.17612894909695139822;1.1204390458232735828 1.4039815216156823485 -1.0278917427720426492 -0.26846833203193881667 1.1140492537704729248 0.25636887696688809291 -0.44793928899829765777 0.2737441481927908038 2.1311148623522426782 1.3320451299408722079 0.005754250435382259575 -0.063346936308591964004;-1.4872098529218960028 -1.2119630891751336232 0.12687244388557705754 0.85544959995960101473 -1.5237202066082675689 -0.7904678875909224578 0.91246709985866325532 -0.0092341851690534906133 -1.3166230975561337146 -0.58956835195264423177 2.513491499302604737 0.49687922833309144943;-0.5403182930907138859 -1.014360614333972066 0.4156921572379553842 0.12342612342598528741 -1.1480998948188887443 -0.70342394406327746204 -0.67207756858987910409 -0.72696665996586917746 -1.1692429666490165019 -1.0901935013780046368 -0.13952511710270959489 0.011462268116646648353;1.587329929906945658 1.5545772751156521352 -0.80854784876057339549 0.191733093282993039 0.65942385716941509521 -0.57519503148574036011 0.79283261985226338719 1.5284964455013796414 0.96719227946232344539 -1.3348615138198371977 -1.0231595612381649829 -0.24204346940757612283;0.76673346125653085714 0.63808264604209119497 -2.169321861362341064 -0.7748961024753104887 0.18747827932902513814 -0.19321871109984270487 -0.41899991379295475902 2.3806065338221151784 0.73967414320208613177 -1.5166787280460611864 -0.61116435059275231456 2.6384279839264803691;-0.11588530718886674853 -0.10082336902896189834 -1.1311349506715031588 0.21717371020507056367 0.18224269195556141998 -0.0022429660430751418611 -0.40620418005684433282 -0.96823353031583059281 0.24983360682371372197 0.71300665212077685151 -0.26476581815611804904 -0.0049519377122491251356;0.87126135227188172827 0.33477101558582850194 -0.47578523454316995478 -0.55599395613988067399 1.1378487680070110688 0.082188090122589055331 1.2687483507991976772 1.1311285057226538875 1.5926817949423082155 1.5444684976971985169 0.88388765304832650482 0.21538299178504913267;-1.415447891561160354 -1.6865073559458132468 1.2785334363348952458 0.65641628425513243172 -0.31980112088730555664 -0.41267556617838208055 -0.58875002440269808002 0.18483030966991567667 -2.851921441332111673 -1.9740355991264897373 0.51452003774068988395 -0.35429806424378407215;-0.57760253414206907951 -0.88996258017715001998 0.01786574492104173878 -1.0726837511557283378 -0.87763896803427743354 -0.027248144746282763201 1.2661592102379521929 1.2698214668629181912 -0.64121573832343148336 -0.95671331266042203278 -0.31675557366662326908 -0.45150398076575426476;1.8525116193043962287 0.40464951918572938938 -0.89602980527220876805 -0.79708306221162594785 -0.57973965572766283927 -1.9132080370582009721 0.91494090119069138023 0.34753938672871459437 1.4924583747010222723 0.11445247138535241671 0.28813094146071599466 -0.45440812862503243696;-1.2082538355208511938 -0.62195038227311683077 -2.1499368946966366245 0.080474745816886600336 -0.74672430951449797476 0.82112822431640664078 0.98165305590625173693 -0.03427874031196360971 -2.0243931082998165571 -0.16564799771736915535 1.5658711421811355446 -0.32320669078962871446;0.73681886210733327225 -0.52041735021768309455 0.065261457736984579414 0.91792487938058697772 -0.011325802133749812706 1.2139330016357996467 -0.093289995681462664634 -0.93631880430544267568 0.93309835017781950217 -0.98646985060669578615 -0.49898637627674835571 -1.5671106358541651016;-0.23975757265304709076 -1.3620958721718727791 0.025387764306855933188 -0.33412364494081014943 1.4832687891339235708 1.1084739423718301676 -0.2025991314478870764 -0.058968905848742037001 -1.3826536181320789876 -1.2220391558930103759 -0.28398521905001505861 -0.46305234514960885717;1.2578687968871080649 1.1069651207885093935 -1.0632518389408687209 -0.75944674619804153348 -0.26548737114346671051 -0.10361502878690860563 0.2417875328028910864 0.089711506233321136605 1.8433640923219836161 1.3464872620311780782 -0.33027560743408479471 0.23485260848764372144];

% Layer 2
b2 = [-0.28031735529162304932;-1.1831515194590438433;-3.4354965371248868955;-1.0900629068924296838;-3.0579336833551948871;3.1942605283020468754;-1.8925198989197320465;-1.1044942988753256863;-0.46905377216152749353;-0.20946863571200968757];
LW2_1 = [-0.036312114399402725673 0.12686483074711613073 0.65529665681336779492 -0.045303769008747517277 0.1440236359696973889 0.46341694418083989593 -0.32972567167117039499 0.22558345114790767649 -0.16128944230538938553 0.20698895320238899775 0.0099303154722899973639 0.6944188851003961771 0.10747933552563727899 -0.26097252181539748461 0.22829995450338230745 0.36738856701686456452 0.080399657985820160988 0.46398019716012728342 0.27244578184811496513 -0.8268945702312676671;-0.0019892911518358197612 -1.1072321756002163617 -0.41594988594969950491 -0.63500128313064085894 0.16084597273670395157 0.30118834924955595334 -0.21503205369525660307 0.15014735884293448076 0.57342955504527770572 0.32243698298333661745 -0.034292385263336999657 0.84513152087872700502 0.19764838327701211851 -0.38416985708612777506 -0.20804162073134682687 0.17072406284973992707 -0.04834780494813967211 0.4965438312638555951 -0.67289475338016624395 -0.9928467949204516918;-0.65858871503973648309 1.1404834658023341731 1.6901037781459828935 1.2568670036445255267 -1.5861782601520879599 -1.1371419470482124758 -0.32124034334462919782 0.053924440000627897607 0.84107700877073399148 0.52808321363927313019 0.040310696033435997054 1.088833837913221414 0.55060372460346718171 -0.023768006913696154703 0.088775732124286799163 0.51519199478130650593 -0.011283623004255496566 1.3642814356253833985 -1.5929566448021286185 -1.4240310409776730793;0.60497847985266439697 0.22735854628652679699 1.1259299196289036527 -0.40555648291431761754 0.2241628438988987615 -0.22233908078057423863 0.38479650781682139815 -0.27889864906556927071 0.07292943366060448962 -0.29672464148256938454 -0.14699652106634761295 0.076718272490173877731 -0.28882904006859683177 0.32828831072804381952 0.007392796396260646781 0.014818382755231026757 -0.24546582654751106234 -0.43703939811931963311 -1.3596924339827842765 0.57235876154344222932;0.37384009230789944089 1.2448462528884507439 -0.82725239076483203515 -0.53886362724471070784 2.2976819858943553498 0.91152471161839621061 1.2999546750437116494 -0.37346044069754558148 -0.063432671207174148864 -0.29038777908685370344 -0.37186481505548318882 -0.021318410443762845358 -1.1224413486512974103 -0.25371661481523832826 -0.12401615096845897135 -0.70086427201084511296 -1.0210834652552966961 -0.79188978644988106126 -3.5900984891909537566 -0.19187318823480298269;-0.96612732057679806541 -0.87093527002822213046 -0.61054788304688023537 1.431984570405380186 -0.20210516623538779535 -0.69517817285346295009 -0.87701166071383851452 -0.28621794883886930716 1.4985617104145041445 0.45919527925610975627 -0.009631545185402084347 0.31508053281532438783 -0.18829224770352828711 -0.6988745829255537112 1.0034352883520742949 -0.65119085581424940301 -0.047701491743094626141 0.14544754354987338152 1.1003767270275401913 0.092029496285382414444;-0.13138502714003350014 -0.60700199889615502613 0.25295925992237855429 0.29880787685459797576 0.65629569626879813438 1.2286482941699132798 -0.3389811530645007176 0.44838338681823969312 -0.11448308329981818354 0.41300104809846238663 -0.057497504456133642636 1.6537579932420178874 -0.095703891933940660186 -0.43511239236968063393 0.080958349238138230253 0.28979053352007044797 -0.0068138231483519454135 2.1576304531438945666 0.6421586142996665858 -1.6462840325276761888;0.75506670367958006462 -2.1849497768260239816 -2.6354271305518746082 -1.8219644448557326122 0.0017236101999820521713 0.86745983863685360848 0.80388364944332713069 -0.024209640235625964205 0.39488628465010366941 -0.0061169045730878005701 0.075433303646768534723 -0.46550853337476250093 0.39894461172857309528 -2.8052663120760250592 -1.1096377676648538912 0.38959730113877205637 0.48291434452525833221 0.80377141676005392501 1.8253668277443191315 -3.367057174967028832;0.12199061540452925401 1.2911500224458853925 -1.3477712403084347592 -0.34471751653885401856 0.082371136065914174473 -0.039666848921975278452 0.48027155660631704048 0.069505479095421374147 0.25399347225705393161 -0.33869336183656850725 0.046770365564380272927 -0.67429190736303157294 -0.5903121146017277221 0.2924601400290181008 -0.53254923457557068467 0.53940631339214917261 0.23018753752258244716 -0.10731124965780758362 1.5282631297651068092 -0.074230378041008002188;-1.0134538434066446833 0.88798238586072086864 -0.50864591160888494858 0.54873287134666159925 1.4162909347795478165 1.9295969109933297503 0.40104101940148534355 0.11447626489397549898 0.23904992171164127224 0.084620427476427589886 0.087328407237208818814 -0.090055331951119879652 -0.056028603145665795138 1.5299075365270520255 1.721017089632486341 -0.82332093794256111519 0.51621039006398605764 -0.27995433887101223158 -0.34275800095228287079 2.1138601545256783254];

% Layer 3
b3 = [-1.3308342424837742435;3.157958871744373397;-3.0166237744408048727;-1.16367207286130947;-1.5021638199792022306;0.14573140344802965052;-0.014166255245505812721;0.33473280252356268916;-1.7888336349733469088;1.2466315100472331601];
LW3_2 = [0.43079058771910883063 1.3004440024463741477 0.39395193952006363203 0.82110559469315747005 -0.21114671872928503227 1.1189966119137009226 -1.6035310131757929408 0.1911043669045310589 -1.4074854516869788057 0.73551337705378272425;-0.52325798121529021323 -0.89617384976064218272 -0.17955707022895189828 1.6522743298438493653 0.50997616945851753645 -2.1936306649776406985 1.0927093621180319349 -1.1005814497565706844 -1.2546742047287993138 0.71422715442415862785;0.90076375571121869434 1.72442691259629588 -0.11203109175769615513 -0.72482236920156972726 0.067098875854062184354 0.81720449725765298421 -2.0699075164374010072 -0.41673088372279254443 -1.3023548581933579449 0.27265451419695962976;-1.7462496430553058335 -0.94426457581857470291 1.6087017526072528995 -0.71455023340353218675 0.089711929426671291332 1.3279864153384119962 -0.87946325319655227482 2.6762370123794942955 0.78252378090021390555 0.013886108166256969434;-1.6095581891028563071 2.3685132857006099272 0.36285821204319212985 1.2569739494586411599 -0.75114753819100843479 0.0082841197910721760256 -1.5424142391320168066 -1.7338972330266997357 -2.139600335661924202 0.60675608246151035985;-0.28375852884991120684 0.24825603252071445914 -0.10282587845821659911 -0.072576261645026118874 -0.027253692606481510347 -0.066910015647758613877 0.055862027945440810572 -0.083643475863458660591 0.078538565844590541021 -0.054809022050710795582;-0.3325724485483473325 -0.070216675108316389808 0.28554805110062464468 0.86069597228636718356 -0.16166643864959412413 0.6150265218983634874 0.2951803156157083996 -0.12070774062969420737 0.26799489625669836723 0.30383254699335826565;0.08760810870517697635 -0.5968049134593852445 0.36465812834543620546 0.47936234589009157903 0.087879440334466096818 0.53265781360147823609 0.10808053185083697778 0.46196494897575446359 -0.46727637022491674834 -0.042623584256215193977;-0.57796176580842950621 -0.47639585431760839151 0.32201741232544472959 -1.0908073775086675195 0.36538802299626116366 1.1916574116176832376 0.20680526021109918444 0.70566157271941643003 -0.6947947328306425252 -0.7180454156245580366;0.58799990957189274265 -0.28366716226690513736 0.46242280269873953236 0.56374294439184291505 0.2936803364287427498 -0.10845459038402170682 -0.56052052016450004679 1.249589414388502906 -1.2388491297922088474 -0.92172655540560743948];

% Layer 4
b4 = [-2.4276416116879295792;-3.785419625900975138;-2.3702812451685266737;0.081008984240260567544;-1.4686155025489397996;0.053941367989749529344;-0.77227771555542235049;-3.677968925238106479;-0.87393296064121661626;-3.2547001439630158792;-2.3949835036095041829;3.325748592658498648;-2.3910602163188672264;0.86356448691485587776;-2.0813590734583189423;1.4408459761838938729;1.387235229357290045;-4.2094409904575318393;-0.46559985567509315496;4.0026681718973398105];
LW4_3 = [2.4948475148907682808 -0.086583655211843940647 -0.79599927248932933477 -2.6367606849489262366 -1.7373875246782695125 -1.7910740325872454015 -0.26474265412758107852 0.88891076796815593486 2.6313289071136862773 -1.7449773383829083606;-0.37810696382285247097 0.2406017174825629823 0.86301426688881521798 -0.90653130231564726937 1.8979421715831312767 1.3860810703907089358 0.63270590123716607955 -0.40403502763137388865 0.6847380708533348237 3.0390738670059911364;1.86312248534335545 0.10070414500704423511 0.28937330169822467196 -0.68239277077174509412 -0.9868123642268407103 3.4000338997415733289 -2.6509981636014861017 -0.505048538239588507 0.69573212772986603447 -0.88224082227543398904;-2.2334288925487268962 0.20878141715495363018 1.6667063930410543904 0.57172570764971852864 0.99174193577027647262 -0.95386978956774204352 -0.37553211369159417155 1.9507283881605825826 0.75386399039886653473 -2.0267420115773351341;-0.2849360635029636879 0.66036380640290870403 -1.3704691131299009399 2.0983249954323395237 -0.60465437227651330776 -1.1686949254570879742 0.71237289959140670526 0.11525183916760857461 0.52690024423189074643 -1.6911825584579978088;0.10739298597177565631 0.26039226630615713853 0.59909804800308552597 0.26781080617664171362 -0.26211240740175578701 2.1006332929104343243 0.50112402906867592467 -0.26883605417161016149 0.04266179299750006565 0.041831730821818013943;0.82905260974522765327 0.23524150508161309481 -1.1343381562495640225 -0.37020084892096666307 0.49247508809828693943 1.3436646276269246236 -0.62736371661479195527 -0.087069272271394021478 1.3250701432206108965 -0.10841099350554990466;1.3170554407270607111 0.18464590073270856219 -2.6107990077027656284 -1.7229837890027774883 0.31297798743627985862 1.7525638625390227432 -2.7177611151673231049 -1.1170750574347882988 0.67358219426894838655 -0.18875448449879106416;0.15013706064361218018 -0.33210858143657673303 -0.25285482527811237174 -0.7343800036995702385 -0.93118435574742952632 -0.42462882904798521233 1.4259114539331687599 -2.4546866944605452154 0.70982774375635793174 1.7311246300480105376;1.2102538796734996218 0.45026743951979497638 -1.3176825023637748213 -2.7689231487636019047 0.25716790696553337714 1.2491112557648265113 1.8391880953978561042 -1.3266391063604119349 1.0407464842202154287 0.67513185340378212285;-0.42494822553122296727 -0.50330705412589060721 -1.4466506289958842579 -0.99010544676864364888 0.5797851173446160189 0.99322779551524664754 -1.6483387392684873962 1.9291868106342615619 -1.0954992386995179299 -0.24586777287979363904;1.0222857385392125629 0.80353578600185593395 3.024234499917993535 1.7292335943799859166 1.1464578402700071891 0.9998165921137923684 0.27584490981376258434 1.4197079463846411507 -1.5651784423833690063 0.35098888515180448611;-1.8390558891722934565 -0.61671670103897535675 -0.92781849012406403254 0.071736677766426323877 -0.11467280350794434307 -2.1408760711862968584 -0.92746012893976836899 1.3832581043786027486 -1.4596929682705825915 -0.34164681071927877065;-2.324633520326883307 -0.15456040008551955034 2.3622561376948425504 1.8369091763311837795 1.582323938460886259 1.2313841888739074371 0.37525640572411916862 0.4079858765517903052 -0.48991836458148946276 0.056413929750772258409;-1.4396670633270902684 0.1565545381600476349 0.28089200636651323606 -2.5413210545565281251 -0.080480778452763870878 -0.68084847728582276183 -0.36937877977862321188 0.72145685909774137645 -1.187292413184520834 -0.78585676447359831265;1.7317308026742019855 0.65088458357926237685 -0.90339686778237127118 0.28669365261182810922 1.0118800967133001478 0.049029285174591007157 -0.99181563925292171024 0.60531210616540798153 -0.036427349577872934761 -1.865450579462744507;-1.1894869427482757107 0.57205184061541247686 2.1759853075150390467 0.32948532825446952277 0.54630340662371779104 0.46607538267480319583 -0.51347953682512981199 0.51580050707763325235 -0.36774538269894418985 -0.11515077951507023124;-1.0393874480648341851 -1.2286372289067142294 -0.75114584638064152422 -0.20041309814507562992 -0.11087911146224066483 2.4858334014012974933 -0.40437235504154755983 -0.22869924229943178196 -2.1929306319282870774 2.4367811415087357041;1.9758709750955680828 -0.50566072646214499375 -1.6046371681089970362 -1.7041172728947200365 -1.5508450239909934432 2.456381566063020383 1.7961461279231007993 -0.043569201043844152377 0.56474311528656639947 0.37819887879500291294;2.7503164382795590726 0.25032516768116458428 -0.3281898151477417036 1.0504832021829944022 0.80435417016799848344 -2.9572022370738118013 0.55213176136160813101 -2.4431255071328066286 -0.32985356104498969598 0.9546269606169097699];

% Layer 5
b5 = [0.0099500387648531300744;-0.56103311367339436799;0.38656136037284877238;-0.14961648924200890431];
LW5_4 = [-0.029257353354839612386 0.018838131367110971109 0.068939965247077128474 -0.3270155483371328109 -0.031259437210733043155 0.45646032019483756548 0.00049542471995170670948 -0.12970778177551156585 -0.17237324070783346941 0.044934039204946082946 0.24873769678292814711 0.026568286632981844009 0.097205556600886880436 -0.20848529103729793177 -0.015412340628888052813 -0.12479937116547959453 0.29013985958386190322 0.063397974316714802989 -0.28664878238028462798 0.056956776502469316781;-0.57701490888194229001 0.0022670056025625912911 -0.29207234388023622929 0.0249990729607815175 0.07823723473847099541 0.52304669132368797335 0.07524060898522866303 -0.27828106507384625656 -0.10610233765281314178 0.19700733470714820728 0.15682366723839627487 0.10626693572447659664 -0.30192611373109823347 -0.047117686191979160637 -0.046502621181990243249 0.0062145558273799276702 0.015271443295913733618 0.19149666998385800332 0.13382664044367512113 -0.40320441295720876873;0.25436756620878064883 -0.011626648907080932779 0.098268320187457416925 0.30041625942655736381 -0.09323604459972555103 -0.091106668591079006947 -0.18372202193942097082 0.26328221012383806743 0.57395041361181919903 -0.14580246037785388191 -0.24446876125478722575 -0.10863321601687170315 -0.033619789637626032452 0.36932790691523781357 0.1358372378322721119 0.39161764345192318082 -0.5168518941074378148 -0.20999926669385252098 0.38133772776893909429 0.3727099174102389556;-0.11412847088088270975 -0.055083676525994655637 -0.081387225397340487443 -0.081148859642081960786 -0.085327597367709132059 -0.9967914307352900849 -0.30888393642851008636 -0.11992411469101660337 0.4501516616544493643 0.10637433973013618593 -0.42405126467995235551 0.054618398878575759314 0.084947994697181727908 -0.14967097468798196136 0.080089851501535427869 0.38203138776749911987 0.51996353149971108465 0.00098526692526197147404 -0.17980463233944035673 -0.11701132332229934041];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [0.0397039958504373;0.0385819932481875;0.0400372589880812;0.0416989841712608];
y1_step1.xoffset = [143.937094917083;144.986763517599;144.540423916782;141.245908245125];

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
    a4 = tansig_apply(repmat(b4,1,Q) + LW4_3*a3);
    
    % Layer 5
    a5 = repmat(b5,1,Q) + LW5_4*a4;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a5,y1_step1);
end

% Final Delay States
Xf = cell(1,0);
Af = cell(5,0);

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