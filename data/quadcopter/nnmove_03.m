function [Y,Xf,Af] = nnmove_03(X,~,~)
%NNMOVE_03 neural network simulation function.
%
% Auto-generated by MATLAB, 29-Jun-2022 03:22:47.
% 
% [Y] = nnmove_03(X,~,~) takes these arguments:
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
x1_step1.xoffset = [-0.56979564277478;-1.30490266637008;-0.622846643748946;-1.30082039987417;-0.477463491463658;-0.345789308086296;-0.456124161375581;-1.85436538017275;-0.3785809936022;-1.90921670427207;-0.645412690014965;-0.295907880808792];
x1_step1.gain = [1.59854982741057;0.753836270955817;1.60573096982837;0.761914471229483;2.24049549472198;3.60550592035871;2.06682454863913;0.5896627770093;2.32163499097894;0.614402383072234;1.41721499548231;3.66792002962172];
x1_step1.ymin = -1;

% Layer 1
b1 = [-0.86493260481008538143;2.7659528071716237285;2.6050630899429134679;-0.42228084712621954955;3.4045827914926802826;0.56060676485522165091;-0.35403969576574956246;0.72262452129879373164;-1.0029769343913919055;1.8714063452574141166;-0.17730236111380953679;0.21915878789213666389;-0.012205306015567719824;-0.64384795119541893271;1.56573060210077597;-3.1953067240279122707;-2.6286857428045165008;-0.87090235614174771328;5.2300968870724373616;6.6591791259767223465];
IW1_1 = [1.3443946906643904349 0.099583332161633092428 1.5687299757452204396 2.5395072778734464336 -0.37967786469374614766 1.1378075019205962093 -2.2731292296309808521 0.48817936148384338813 1.5040965435001585337 -1.0602367986855074644 0.15704712463287284763 -0.7813986862401686162;-0.22775149676408457111 2.3550931532637338073 -0.71815328772564157589 1.2885591679167047729 2.5590963649884246323 2.3708756161636692639 -6.8592893084650379265 1.0261829812860121525 2.9329027704215215877 4.2392788130805705293 1.2719882871205347996 3.8028724220242202669;2.2838455330864961823 -0.013458902134092023961 1.1775564185002611595 4.243110432049740588 -0.99415649931536442807 0.33884222474707054173 -2.4169710574175691242 -2.9939134344155271528 1.0015148537952049956 -2.4960670777884357285 -0.41780121880212323093 -0.021596348689196423476;-2.2602714104345222879 -1.2637022264536423855 -0.52955673029240923899 -2.933356738972469735 -0.33551789265282905284 0.14756419463676098691 3.053269363507079337 1.0804793301386839133 -2.1484567065862809621 0.038500666473432129666 0.17941738219154784728 0.79422941047065209741;-1.1036299505681854694 0.42417966143207846974 1.8937762506491033765 -0.6738795121245645392 1.4566669825841018771 -1.5625706647768227153 5.175439566798335278 1.5260747335901310162 -0.22111100962612748044 1.7357745930711763194 2.6693997268344489271 -1.4042463726250171696;-0.20490324296294237794 -0.50462926626875959091 -2.2144617227843830243 -2.7905383211896253037 1.8875575449811619055 2.590031626282556676 2.3352118550380414064 1.5341714430607873432 0.20313341281507898972 0.20528867448524135142 -0.014895322929847042148 0.022168723354989143537;1.9225175401784027063 1.5633304519654522835 0.2426809861127720569 -0.64568124291332273934 -2.4491202527639006625 -1.9479164688160750529 -2.1506307771733568224 2.9226113371688731135 3.31664277829573928 1.6574266516153020046 0.3434741563937430131 -1.1121555629758868022;-2.1413816016971800593 -3.2947092321262432257 1.3788799657139898525 0.70303505551431677567 -1.2718376213641466865 0.44816378087947134068 -0.46326220835384590568 0.29694821573835339379 -2.7894926064026197565 -3.0705522163604208608 0.46047840374256626683 1.0942980945721441088;-0.88339365568788918992 3.6898877499469926455 -3.2473179330122032837 0.11278017553826412411 -2.5312167450297087257 -2.6066840610016335233 2.1622656186509097154 -1.5536949136975886088 1.3288824576220279461 3.0152242796062989072 -2.819630776641845582 -0.17078203391816532131;-2.5796365064753521423 -1.8480300983306754414 -0.85508978983214456449 -3.3632547662757934503 -3.2151805506923603062 -1.1617261704699080038 2.0004113418469460228 0.83716354866262454593 0.90062594941115337033 -2.7413586351543508535 -2.5129130783106519154 -0.15513585922581588084;1.5580126086840122568 1.5654993452011476407 1.5798861940037407514 2.1420047024549391246 0.85188703571233093115 2.1249657171481284301 0.35486662587354361742 0.17694866237001455334 3.6043902981276416675 2.9145696711560473702 0.20365411944688088797 -0.71203709520701219393;-1.4153736115092878656 -1.5605814363636532072 0.46084561610022872769 1.0987446978131019115 -0.39623778483302790621 -0.14807389087976585706 -2.4970417897897165815 -2.3147436495661399825 -2.406596895576399664 -1.5196663850553826514 0.13198560344514556619 0.3134202318828077094;1.2224149835105495576 6.3806010404022215354 0.39613794983027172947 5.1168627395972592353 -1.3598575260791323505 0.34465862214526687968 -8.5851689061023304106 -8.770381741000802478 6.1766390522968910304 5.1459978423574224138 -0.37967822923592886575 0.51018773229979452744;-1.2181867205863872172 -2.1740407438197935086 -2.1258540340526850265 -1.4702071724277656628 0.34756917419873090136 2.7589818355984316867 1.2388429930482243169 0.87092671265853249807 -1.765533027431731572 -1.3830481979649966728 0.44500435211757283227 -1.6233240524165819529;1.9086630851319645874 0.23964646218185287063 0.20670348940303373553 -1.5689516551758988516 1.1695528583734635664 0.25246568370897726208 4.607073403210026008 1.2134380760444889447 4.2330170468159211694 3.1276817359911226468 0.74181793120738037661 1.8873876120076984453;-2.1654234865822270528 -0.67909276522528638775 -5.4767624834323740401 -2.7110615183457680288 0.93782187691414009567 0.097190680664521175713 3.3751415421276731443 0.41475433683570872567 -0.41537300447415426152 4.6306323448387072261 -1.0331060814565797834 1.6858487828983932388;-1.2755616450207130086 0.53423816492352693697 2.2863876018364033271 0.88819853694219386142 -1.9436309543618850437 -0.94540044088241281806 -3.4376491529857617913 -1.3682844439393846425 1.5780313594315564796 -3.7473731259301725771 3.4465685070531186796 1.8188817333078339811;-2.7471378693362975554 -1.5813681224587881058 0.13520142412170166324 0.90262175518948606356 0.13350184311922747016 0.34686344630786908327 -4.007880926787099618 -2.9998950812698068624 -0.38630919700447108323 -1.8973755284391020659 -3.0837049888417382704 -2.1306507078335501504;0.058752595511234628756 -2.6290865161593774957 3.2545604421939695605 5.0758951035317760869 2.5245911311858559856 -3.3117622362633332145 -7.1002171777938576369 0.57926147706206421173 -5.6769232405572216393 -3.7032501658659753296 0.24715555161963953523 -2.1820834008494127687;3.0960271430072534571 -0.84272149813824326348 -3.8083846115680874966 -3.794315179697099083 -0.41628269063098466418 1.0973363987391879792 -1.7906339460403719599 1.5975772626575712732 4.9133421577312965667 -1.9659324655516567937 -2.4805188170411973658 2.6747148722001377052];

% Layer 2
b2 = [-1.7584114301256592583;1.1500312213133363493;-2.4628815766399743126;-0.16908207786204099143;2.029814059893178424;-3.5335386805357544837;-7.1695529750446675976;-6.0402805889942206008;1.9044756401104583343;-3.8310886569989364148];
LW2_1 = [2.4213644468600734605 -0.44309119338569624702 2.5395401457220958541 0.54995918500723828259 0.53275550468258092707 -0.15623187039888650207 -0.47984254183666835702 0.55866341671555408421 0.071950332811708497815 -0.14027329182510972494 -0.99737669235217651931 1.6709893690205923633 -0.88599214061476871951 0.30272509140461967281 0.52661010236737126888 -1.5257529319933336165 3.2757457103809524135 0.44523779389833118003 1.7078737291329815218 -0.025550428505064164131;1.9684314711811339293 -0.91694823206090425582 -2.6406513130431310543 0.47127024343964718511 -0.59289766671825860911 0.47934009510930097875 0.25902969134849374022 -0.8990516712227504259 2.0984603932046712593 0.42091814571713920268 -1.1659468439549871555 -0.78735061574843245857 -1.0636052561534965477 -1.0750155225756972133 1.1286581254848391254 -3.2103862880909197486 -2.7961481861945798322 0.30009878889200175545 -0.98360928641999068045 -0.44101011753829560957;3.8383431602896802559 1.0452977452409863979 2.6925051126307639748 3.0230973124031765842 0.56926170378373031067 1.6686714602916583594 -1.2886434732355214194 -1.2931345140393473159 -1.5881264225572744309 -1.2271100200334816854 -3.0865682905177282969 -1.4822893068442524189 -0.17657222263554928077 -0.1162677205721650564 1.5497827300704518638 0.89055556838581995116 1.3770735397859967808 1.122036681554526405 3.3209136273874131362 -0.69732507782721719902;-2.3592393569694865008 0.90289029037881562978 0.00058447418687450694574 -1.3900111834980788394 -0.20136047912712484731 -0.71371176695692439829 -1.9675575088686005909 2.1810839596580371413 -1.5161520296749659842 -3.0253902955846880829 3.0818883185011509696 -1.3739224539525400903 0.061717377149788206492 -0.9464673844522077939 -3.6066737817839973346 0.31231223741711483521 -2.8271555674829009774 0.093905822824598278453 -3.5369009680644487581 1.124293476415723303;0.29634967223996916408 -0.40964056021681688469 -3.2196016065759405222 -1.1547331891777314894 1.1724172535153860597 -1.1399763587611577709 1.1714689234056707701 1.8173493591800415903 -2.3395605276274356044 -0.83087878559378025578 0.43118224281329392555 -2.4519882851914092114 1.1701399961573939468 0.94917999789849560877 -0.066567182828434268149 -0.42317930393500324815 1.3316981460645263002 -0.27813515786691694887 -0.72791335040095228592 -0.065691995224790133978;0.79699142252744026305 1.1347787969633229554 4.9176726265557979545 1.1669568466781263805 1.631853539829812183 -0.70777538687122854011 1.5614004902706288824 -1.7580018587288948062 -1.4443884063183318744 1.8864587398318009015 2.1887228771845137487 6.2312044637756578425 1.4784258095867399696 -1.1866251067515418693 2.2701909374512503348 2.6143162214885702355 0.63033773520669056367 1.8901874799025761842 1.3701961038740448906 -1.8191211188878422256;-1.2798886385407328703 0.46659596252117568893 5.3715463195232535654 -1.1484754120588969162 0.71000188396002961166 0.91386317195248212286 0.016694951478342406892 -1.7406759060717666987 -1.5851136212887775301 1.8871554474468672513 0.61640333870087404833 -0.81696656190432492828 1.5015622798316672348 -1.2868292454055021423 -0.97831830244535589181 -2.6846776547427686488 2.9106590261631186678 -1.005342828836497393 -0.61154522539658573432 0.12076448439440359839;-1.7221642383918240871 0.82204497277835031355 10.350008252149301313 1.5978234335153507217 0.083469864922958991738 0.042290289740736911051 0.69766969028197833858 -1.8502097394433889566 -0.98944432231625478735 -0.96325776753992609081 0.61368872625794879117 -0.57943400800475342027 1.0317647641615244058 1.0561138363530422346 0.84055255392376826418 0.16328929545460940664 4.3705943270375149368 -0.30705199108631153759 0.42681578097806743832 0.68038731191974521906;-0.7965607620706308678 1.1976254317348580258 0.088140009211091357999 -0.56007231884734598459 0.26426403582170526763 -2.5046790217571923698 0.60716519139463676069 -1.5143400630782704042 1.1042635612332896144 -1.1443138844199176596 2.974139313434777776 9.7714516107423232683 -1.5536031534626577599 0.58176143244332134685 -1.3551805729468777706 -1.0301713288912135447 0.20125212918664597828 -1.966489999350853779 -2.5564899819933568637 -1.9061882969134371635;3.315678806088790509 1.4859981448703998286 2.0995007304365356227 -1.0286560832701669987 -1.143980709324706968 1.0716191984834244622 -0.57282414851803342692 -2.4674723493884060943 -1.344074508789228295 0.59084737055644043213 -0.46232847668953874765 4.9601036682247556797 -0.38003679782684507416 -2.2815574166053389504 -0.83522876748800767288 -2.1248577228838541053 -2.1146206286464344082 0.96559289472894960227 -0.32643198607259737987 1.7486191355596711894];

% Layer 3
b3 = [0.91523009669475030581;-1.0140128943041366583;1.5490490227952204982;1.4903658403451534031;1.8258684521211883123;-0.13355515915187654574;2.3344176130795131208;1.1787499652021904417;-0.430755827858652518;-0.78433461358038547573];
LW3_2 = [0.41050442637130241108 0.1572656962868792252 3.3268587180379118884 -1.5490935982991163034 -3.5548800830893392266 -1.0339970675083414164 -0.85126611352617809203 -0.93609557559243872227 -0.017981492923910057796 2.4889597726324050875;-0.30749560725204827527 -0.44628328802443484324 3.8440198287963340817 -0.11096477617498554102 1.1683064284069391014 -1.0050952861073525479 -0.42291973557668333106 4.9171207871966782221 2.6247436436645781299 -3.4226775034151124544;-1.2830226184019228874 -1.057159737033072977 -0.33724538979074003553 -0.043043172344119653983 -1.1484680174377006612 0.57159928294508621782 1.285437820862397551 -0.8629143843876770914 -0.09144867023640843029 1.1806570629997550359;0.15487394632899054159 -1.228296988049339955 0.82059203422467552613 0.80569186410283277766 1.9271100995929779653 -0.75982198413090207278 0.22827587842468757828 -1.0486881742474400969 -0.15099866776921441747 0.25535794031453273867;-1.1349382486937853454 1.0545752666889744997 0.70705858858422088176 0.0082056619374266809297 1.3449455829027596732 0.13370467138590591549 0.37615291086205693283 0.50672859986954843503 0.46658450558889807969 -1.0429680686720925742;-0.24830507032794768563 -0.088978737705625504661 -1.236279664793112687 -0.31866445848552293896 -0.12820721403172047337 0.80519775863356368717 -1.9743156452776211562 1.6953913877314088499 -0.13718014735648006996 -0.054177065429763165971;2.3874498781296895622 -1.6017295081117450817 -0.69671742943439030071 -0.52853132339387931538 -1.8786486119713357024 0.54247867349906464529 0.93765235862183959892 -2.2212129187052482848 -0.65624647102651345598 -3.1174925157586867996;0.2124411101182489825 -0.39190742548871637663 0.68107711330086129209 -0.39509868863418290408 0.15791281102264881353 -0.86621903933612998117 0.13153335864818813117 -1.0457889825889024049 2.3172232268889034756 1.5025627226579603146;-1.387096063368686627 1.0158262707654441837 0.80794279416934255966 -0.077325239605962645117 1.2176542854860463727 0.22011244714592273497 -0.15655381233551432518 0.79535463294609887175 0.40526077017648337586 0.43140868083475941708;2.8116840840415133762 1.3074980285592481266 -1.1176419839305375969 0.30441901868214682469 0.53099787018565591801 -1.6373290604829269235 0.10739256687611524466 0.1861328413918857394 -3.1171119715970507791 -0.49151329053211484377];

% Layer 4
b4 = [-5.1005886218554330469;-3.6407716930320117577;-2.8350913654472837955;1.2778991541805064802;2.7694402341705424142;1.8618254436789984929;0.22587239652057400363;0.37141193646473069645;-3.5203220354809947601;2.1405951144127053354;0.62321020424392936654;-1.973365559943290215;-2.4683956945654474957;-2.0201436687454745744;2.9630675722908161873;-5.7758878101612234346;1.6799568068074517413;0.70919391536191911385;-1.1055484855128279165;3.6523315498332866724];
LW4_3 = [1.0107939712798692522 0.86179177800880768512 3.0643443574373541161 0.53025651524589734187 1.4774629237735801279 0.048259005198570695261 2.4610052400723705368 -1.7375197899953043201 1.7873428717921675535 -1.5503489170920152773;0.78325117993938786487 -2.4982595867656662847 -0.0070977869815002855858 2.7100916177021656672 -2.6528696720660880359 -2.4024827608574756965 1.1259074261996548927 0.51230328362181842827 0.44712640485776461441 -0.019677158866281199701;-0.035894466850985899675 -2.2363600599859765339 -0.52189825549637847146 2.4735601222166012647 0.37844468205012082862 0.96797760322869919047 -0.76179094245547451791 -3.1285658533726481423 -0.49246400516605459696 -3.1636739678449830038;4.6217679130822073574 0.70904688441824514911 -6.5577889326858134211 -3.4356900014316522629 1.648583269754742453 -2.1192603403185561461 -0.49472583095741468062 3.6047232795075290213 2.5445255705849221251 -1.2517030993701312447;-0.25844047519950569258 -0.32567071335040542746 -3.5503326590117034733 0.25649359772073321295 0.51252921056089906227 0.3335290758812800016 -0.34205416597433035975 -0.22104998852793475428 -1.3193252913551838379 -0.53672812070697506481;-0.015415516851303431162 -0.58441105980100760409 -4.1900322206564997174 1.4736675696068659569 1.8063395724986393009 0.48267657149105092085 2.2277014117368612034 -0.40766362506524300713 0.25894659748487974804 0.98592867744281709186;0.72907242688162954281 0.93215339871463309684 1.2588615886590885928 -0.087705784686247845183 3.2813075647972551607 1.1487411808790444212 2.0663111542838521473 1.2669219341218285191 0.77804578546536951045 1.7699847807575614933;-2.0730950783542629878 2.6681920621303056862 1.5730763103586085094 1.6475002812088186399 -0.18004459695001101549 1.4724329037689847244 -0.99180163384848085695 1.2671404318796497535 -1.9314334062414613147 -1.8858020251372875631;-2.9321836608653799594 -0.73830571674241363134 0.27208412744165505481 -1.4547417624926366475 1.8015134778437889018 2.5897155193825405206 0.8314368766389400589 1.9664246826788236433 0.41205890825558449952 -1.4505781788263032439;0.67424782466864274788 0.51060446783415625038 -3.7361055064311718965 -1.4002118943338630608 0.93864065426510978618 2.3394488169264229249 0.62461325196747641275 0.1061485025997425391 0.29181316219513359078 1.0029644933117702887;0.32784301682189659344 1.2276714381348243776 -2.5475685814927051531 -1.3095855151274717887 1.749926349080608512 1.9684384747851000341 1.4681342495398230774 2.7941620428957971711 -0.49517049687406444747 1.8963718064402745878;-0.39834453676459324889 3.4331679715988272505 1.7423978503722790112 7.8013212548423052084 -3.1340450015925256366 2.0417725066791132527 -0.18561410658284330233 -2.6688250475840149534 -1.3850164017032315922 4.0699501681954357579;-1.1638560316188177879 -4.3049394282080513108 -0.12096275372528002279 3.0230524367807078967 -0.66374175003762292402 0.18362307852219572624 -0.23313139768431015431 5.3369007600323161711 1.1680983134816160796 -2.3690689000391573771;-3.8648015454191821938 -1.6543389049956991332 -2.3115204353138474325 0.43177291227293373987 3.4695490138390865376 1.562405204863556607 1.8992145970742391192 0.02242897929116466349 0.99122584503815136525 1.4539585807494377345;-2.5551846299316025579 0.1852287256339060495 0.97506137042400320425 -0.84920293029991222866 0.029251172014707511881 0.73534770086548673085 -1.5621557443675853083 0.19080189197770516807 0.61826369902887423624 0.14515391233788016434;0.11164668895855332786 -0.33807662981604652552 4.8788983679335427013 0.59507618302134535071 0.81719292618159400376 -1.1043559329543037872 -0.70850040953343962347 0.093153327965678739409 -2.6760915582046234107 -0.8468499263274029687;2.7930843800694171719 -1.318080590275283237 -3.7905942346980729951 3.3597212923213453095 -0.31502759676235370101 -2.6444578007841119671 -1.748506739023100609 0.17713545296420091235 -0.55858930154414832003 0.87831472216353723148;1.6124706369798498251 0.20793879152505370667 -3.4179978162934636643 -1.0152637299294253737 -0.23964492758151390017 -1.3053650019739027055 3.0912885299635513014 3.6613077736866341816 0.041984793743571710567 -2.6348453256388655319;-2.987387662996069615 0.44305113378746097119 -0.18321721652563399685 0.13495642755020004211 -0.19609176479650108904 -0.96350839870280069466 -1.1113545633510932831 1.9535304551154262231 -4.0349954130733607371 -0.02879785881843978379;1.178919843781081056 1.6379768901685896054 0.94112639615111759461 1.9061306327989719911 1.6203876185378320862 -3.1875703442146736677 -0.80047691247697949635 3.3793127875714814579 3.6478933638158737018 -1.2689995454553488763];

% Layer 5
b5 = [-0.053463910385319772522;0.17317298691100813102;0.012014271447775379253;0.058656406835791145837];
LW5_4 = [0.029865722069588838961 -0.01315669309083012696 0.027128210427283687423 -0.0874121958376433833 -0.21630889484207888041 0.19284742261730603019 -0.078048588457863388168 0.040086165500295062314 0.059693836241371804607 0.026304991627684765065 0.06080622333625883974 -0.031139910697626470293 0.0076962061378796960825 0.069902791809106745724 0.12018253669796885585 0.098807127163883290422 -0.049164616529930635358 0.013962371021624814249 -0.12692745021406925954 0.03036843770969732681;0.019726086405757708997 0.1104076743358456264 0.012210733316686470107 0.0093505451593133108446 -0.12241244353772159914 -4.2945867778108881563e-05 0.047121443630224690846 0.029001675554141848057 0.077840664248066251951 0.087887041535751803112 -0.075723161085066256759 -0.021774371833705178508 0.054940958102134535013 -0.13292393905795379938 0.032253859301466084042 0.023754259389867155711 -0.047914607199194582388 -0.015532876183516340293 0.14458595309593524902 -0.021578249665007560171;-0.037778414040786287287 -0.035319131395956986086 -0.081720910120267248322 0.0024444521940680391525 0.17180520806707155756 -0.0040345292046191083557 -0.044329330682560119659 0.023354708209033400029 0.025695159396927742812 -0.063383349975609598603 0.0010738242823823580807 -0.063619894715402885987 -0.032908557632374782487 -0.020071229329990964568 -0.063284038962420963159 -0.072325090785601925392 0.027918034172659610126 0.048568972471598137464 0.043029700600651213382 0.01658438997199055201;-0.094165110949183283839 0.032411334742656491836 -0.013960529188181752466 0.039642631039649864344 0.24768055158896923329 -0.041342064335630965277 0.066518208874749573667 -0.10146930042196715405 -0.079163844345396139346 0.059433167358573582573 0.0062421768770911014584 -0.0010693124496146833718 -0.01409928430893024956 0.11187749936222014802 -0.05140411325732884007 0.088321538276407263179 -0.044627108669573437028 -0.044583046060265238419 -0.059003375778484641601 -0.004466027782000742824];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [0.0512947217543748;0.041876790299613;0.0400372589880812;0.0499501412370409];
y1_step1.xoffset = [155.319492107924;145.966854132823;144.540423916782;149.168780509199];

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
