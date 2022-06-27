function [Y,Xf,Af] = nnmove_09(X,~,~)
%NNMOVE_09 neural network simulation function.
%
% Auto-generated by MATLAB, 25-Jun-2022 23:41:57.
% 
% [Y] = nnmove_09(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 2xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 1xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-2.76604557575478;-6.53549436703176];
x1_step1.gain = [0.392431576012724;0.126468695915715];
x1_step1.ymin = -1;

% Layer 1
b1 = [-4.4301221940086952245;3.4333662459555220892;-2.5086537665916859297;1.4807469162642188376;-0.56353851840614344049;0.085407626350877341448;1.3613985297690200937;2.3020137400064983879;-3.534035761454318525;-4.5123566852634846569];
IW1_1 = [4.3891835475083214035 0.024940082518750315843;-1.8223337386455189524 4.0575583960275904971;1.707475072631104096 3.9669892245459030811;-2.1062178789720675809 3.8510231281043902918;1.9193287095471509573 -4.0062963183587161353;3.6353400695426554279 1.0457056454630180298;0.75700565897392702031 -4.3388614212060394593;3.8828964322366124051 -2.1715615361240789838;-4.3282588664404579859 0.36103865826324521571;-4.1428773706565475976 -1.301477421539171786];

% Layer 2
b2 = [1.8557074653253382568;1.3708193287610908051;0.8964579934857902499;-0.5792508080582413621;-0.10953911908218887106;-0.22088503093135977706;-0.59772187917078922759;1.0335827502417642698;1.3863137309789523854;-1.6741584357031642494];
LW2_1 = [-0.45269306676176673809 0.18720207009531672493 0.077978205865093866422 -0.77428139303961152073 -0.2778564852489542325 -0.23410548529919850136 -0.70570779759783741625 0.74794591333790305665 -0.66430305924393995287 -0.15628062521781507788;-0.66830028355915827021 0.52624435205825026429 0.23945335657047669975 0.7215852042749665296 -0.16694703270226751712 -0.66987557539933584305 -0.77472842855419088437 0.68638366543244888618 -0.76063593191429046403 0.27286040490279284132;-0.30378490897954152361 -0.065034912193057195506 -0.78923363995091688761 0.20990770067365185914 0.48167511148870295612 -0.98982827092360392562 -0.24313332858645397838 -0.89186225010292508042 0.16486015657461353112 -0.018758774277896204941;0.58648882356029685692 -0.38917759714655364434 -0.042946726799692969134 -0.51255384301812934034 0.7780680329504778836 -0.97043384462307813454 -0.44062283546846225946 0.051035553609741435288 -0.34036832595364441278 0.68973313510459566267;0.091702303371614668492 0.21201027281459769447 -0.6754652919834339686 0.30077428782280074548 0.52186903069981904757 0.56798154830799107984 -0.82358521051582989081 -0.70428303917413537238 -0.49472372364475414308 -0.47913578910904336405;-0.49256795238059308817 0.48808629189907276613 0.37566961569762680195 0.35329874711031239443 -0.24057516237927220604 0.89880573476171565783 0.5377108118401382475 0.27208262482746259359 -0.94868434006012969384 0.40271698328730148875;-0.061827464519584353353 -0.82418768449502899376 0.62929394676390260077 -0.34933295761290478199 0.10377715904530965263 0.89862473146877130947 -0.111491144687276722 0.34572357720636970324 -0.81149614601459474361 0.087564707199341479393;0.72126678268192168098 -0.075696485828166196197 -0.63845425983748116394 -0.050257204722378823192 0.42739294042049058575 0.41427164627126189522 0.79910712337662770377 0.29572739745266207745 0.66832889276292173353 -0.76713384737274215031;0.45363981331193886648 0.2624163807820755201 0.45390568571871187098 0.57598901511555888888 0.78548430779816424963 -0.24560251673781166581 -0.91715291411241872677 0.50256142766197531291 -0.32748610246766907128 0.26667122945955579194;-0.865374358618073658 0.66459024939149202726 0.29762555305912974379 0.81985926653732987823 0.59131242015276674895 0.89507102841661556614 -0.62156468144435372825 0.49574199714769612291 -0.017927254606806369147 -0.40606979290849570807];

% Layer 3
b3 = -0.22456250538692557051;
LW3_2 = [-0.36831156014651506014 0.49619618576166973911 0.73445084591196518886 0.50724118249436545014 -0.10393349054986728008 0.028585206229451685239 -0.3863838451724949663 -0.054821921968364266398 0.39913960201688014617 -0.58509307467571847194];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 19.9999999999995;
y1_step1.xoffset = -0.0500000000000011;

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
    a3 = repmat(b3,1,Q) + LW3_2*a2;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a3,y1_step1);
end

% Final Delay States
Xf = cell(1,0);
Af = cell(3,0);

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
