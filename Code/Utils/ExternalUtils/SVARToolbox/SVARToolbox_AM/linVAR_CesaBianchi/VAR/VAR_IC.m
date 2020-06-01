function [laglength, AIC, SCC, HQC,FPE,logL] = VAR_IC(ENDO,maxlag,const,EXOG,lag_ex)
% =======================================================================
% Determine VAR lag length wit Akaike criterion
% =======================================================================
% [laglength, AIC, logL] = VARlag(ENDO,maxlag,const,EXOG,lag_ex)
% -----------------------------------------------------------------------
% INPUT
%   - ENDO: an (nobs x nvar) matrix of endogenous variables.
%	- maxlag: the maximum lag length over which Akaike information criterion
%       is computed
% -----------------------------------------------------------------------
% OPTIONAL INPUT
%   - const: 0 no const; 1 const ; 2 const&trend; 3 const&trend^2; (dflt = 1)
%	- EXOG: optional matrix of variables (nobs x nvar_ex)
%   - nlag_ex: number of lags for exogeonus variables (dflt = 0)
% -----------------------------------------------------------------------
% OUTPUT
%	- laglength: preferred lag lenghth according to Akaike information criterion
%   - AIC: vector [maxlag x 1] of Akaike information criterion
%   - logL: vector [maxlag x 1] of loglikelihood
% =======================================================================
% Ambrogio Cesa Bianchi, March 2015
% ambrogio.cesabianchi@gmail.com
% 



%% Check inputs
%=========================================================
[nobs, ~] = size(ENDO);

% Check if ther are constant, trend, both, or none
if ~exist('const','var')
    const = 1;
end

% Check if there are exogenous variables
if exist('EXOG','var')
    [nobs2, num_ex] = size(EXOG);
    % Check that ENDO and EXOG are conformable
    if (nobs2 ~= nobs)
        error('var: nobs in EXOG-matrix not the same as y-matrix');
    end
    clear nobs2
else
    num_ex = 0;
end

% Check if there is lag order of EXOG, otherwise set it to 0
if ~exist('lag_ex','var')
    lag_ex = 0;
end

% number of exogenous variables per equation
nvar_ex = num_ex*(lag_ex+1);

%% Compute log likelihood and Akaike criterion
%=========================================================
logL = zeros(maxlag,1);
AIC  = zeros(maxlag,1);
SCC  = zeros(maxlag,1);
HQC  = zeros(maxlag,1);
FPE  = zeros(maxlag,1);
for i=1:maxlag
    X = ENDO(maxlag+1-i:end,:);
    aux = VARmodel(X,i,const);
    if nvar_ex>0
        Y = EXOG(maxlag+1-i:end,:);
        aux = VARmodel(X,i,const,Y,lag_ex);
    end
    Nstar = size(aux.eq1.beta,1);
    NOBS = aux.nobs;
    NEQS = aux.nvar;
    NTOTCOEFF = aux.ntotcoeff;
    RES = aux.residuals;
    SIGMA = (1/(NOBS)).*(RES)'*(RES); %use non dof adjusted version of sigma as in Eviews
    logL(i) = -(NOBS/2)* (NEQS*(1+log(2*pi)) + log(det(SIGMA)));
    AIC(i)  = -2*(logL(i)/NOBS) + 2*(NEQS*NTOTCOEFF/NOBS);
    SCC(i)  = -2*(logL(i)/NOBS) + ((log(NOBS))/NOBS)*NEQS*NTOTCOEFF; % gianni: using the (full system)log-likelihood (see Eviews guide II p. 774)
    HQC(i)  = -2*(logL(i)/NOBS) + (2*log(log(NOBS))/NOBS)*NEQS*NTOTCOEFF;
    FPE(i)  = ((NOBS + Nstar)/(NOBS-Nstar))^NEQS  * det(SIGMA);
end
    
laglength = [find(AIC==min(AIC)),find(SCC==min(SCC)),find(HQC==min(HQC)), find(FPE==min(FPE))];
