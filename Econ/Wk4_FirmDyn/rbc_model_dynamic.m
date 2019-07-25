function [residual, g1, g2, g3] = rbc_model_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(14, 1);
T14 = (-1)/params(2);
T21 = params(1)*(y(18)-y(5)*params(6))^T14;
T29 = y(5)^T14;
T44 = exp(y(11))*y(2)^params(7);
T46 = y(8)^(1-params(7));
lhs =(y(5)-params(6)*y(1))^T14;
rhs =T21*(1-params(8)+y(19));
residual(1)= lhs-rhs;
lhs =y(10)*T29;
rhs =params(4)*y(8)^(1/params(3));
residual(2)= lhs-rhs;
lhs =y(4);
rhs =T44*T46;
residual(3)= lhs-rhs;
lhs =y(10);
rhs =y(4)*(1-params(7))/y(8);
residual(4)= lhs-rhs;
lhs =y(9);
rhs =y(4)*params(7)/y(2);
residual(5)= lhs-rhs;
lhs =y(6);
rhs =(1-params(8))*y(2)+y(7);
residual(6)= lhs-rhs;
lhs =y(4);
rhs =y(5)+y(7);
residual(7)= lhs-rhs;
lhs =y(11);
rhs =params(9)*y(3)+x(it_, 1);
residual(8)= lhs-rhs;
lhs =y(12);
rhs =100*log(y(4));
residual(9)= lhs-rhs;
lhs =y(13);
rhs =100*log(y(5));
residual(10)= lhs-rhs;
lhs =y(14);
rhs =100*log(y(7));
residual(11)= lhs-rhs;
lhs =y(15);
rhs =100*log(y(8));
residual(12)= lhs-rhs;
lhs =y(16);
rhs =100*log(y(10));
residual(13)= lhs-rhs;
lhs =y(17);
rhs =y(9)*400;
residual(14)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(14, 20);

  %
  % Jacobian matrix
  %

T102 = getPowerDeriv(y(5)-params(6)*y(1),T14,1);
T104 = getPowerDeriv(y(18)-y(5)*params(6),T14,1);
T109 = getPowerDeriv(y(5),T14,1);
T118 = exp(y(11))*getPowerDeriv(y(2),params(7),1);
T132 = getPowerDeriv(y(8),1-params(7),1);
  g1(1,1)=(-params(6))*T102;
  g1(1,5)=T102-(1-params(8)+y(19))*params(1)*(-params(6))*T104;
  g1(1,18)=(-((1-params(8)+y(19))*params(1)*T104));
  g1(1,19)=(-T21);
  g1(2,5)=y(10)*T109;
  g1(2,8)=(-(params(4)*getPowerDeriv(y(8),1/params(3),1)));
  g1(2,10)=T29;
  g1(3,4)=1;
  g1(3,2)=(-(T46*T118));
  g1(3,8)=(-(T44*T132));
  g1(3,11)=(-(T44*T46));
  g1(4,4)=(-((1-params(7))/y(8)));
  g1(4,8)=(-((-(y(4)*(1-params(7))))/(y(8)*y(8))));
  g1(4,10)=1;
  g1(5,4)=(-(params(7)/y(2)));
  g1(5,2)=(-((-(y(4)*params(7)))/(y(2)*y(2))));
  g1(5,9)=1;
  g1(6,2)=(-(1-params(8)));
  g1(6,6)=1;
  g1(6,7)=(-1);
  g1(7,4)=1;
  g1(7,5)=(-1);
  g1(7,7)=(-1);
  g1(8,3)=(-params(9));
  g1(8,11)=1;
  g1(8,20)=(-1);
  g1(9,4)=(-(100*1/y(4)));
  g1(9,12)=1;
  g1(10,5)=(-(100*1/y(5)));
  g1(10,13)=1;
  g1(11,7)=(-(100*1/y(7)));
  g1(11,14)=1;
  g1(12,8)=(-(100*1/y(8)));
  g1(12,15)=1;
  g1(13,10)=(-(100*1/y(10)));
  g1(13,16)=1;
  g1(14,9)=(-400);
  g1(14,17)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(35,3);
T149 = getPowerDeriv(y(5)-params(6)*y(1),T14,2);
T150 = (-params(6))*T149;
T152 = getPowerDeriv(y(18)-y(5)*params(6),T14,2);
T153 = (-params(6))*T152;
  v2(1,1)=1;
  v2(1,2)=1;
  v2(1,3)=(-params(6))*T150;
  v2(2,1)=1;
  v2(2,2)=81;
  v2(2,3)=T150;
  v2(3,1)=1;
  v2(3,2)=5;
  v2(3,3)=  v2(2,3);
  v2(4,1)=1;
  v2(4,2)=85;
  v2(4,3)=T149-(1-params(8)+y(19))*params(1)*(-params(6))*T153;
  v2(5,1)=1;
  v2(5,2)=345;
  v2(5,3)=(-((1-params(8)+y(19))*params(1)*T153));
  v2(6,1)=1;
  v2(6,2)=98;
  v2(6,3)=  v2(5,3);
  v2(7,1)=1;
  v2(7,2)=358;
  v2(7,3)=(-((1-params(8)+y(19))*params(1)*T152));
  v2(8,1)=1;
  v2(8,2)=365;
  v2(8,3)=(-(params(1)*(-params(6))*T104));
  v2(9,1)=1;
  v2(9,2)=99;
  v2(9,3)=  v2(8,3);
  v2(10,1)=1;
  v2(10,2)=378;
  v2(10,3)=(-(params(1)*T104));
  v2(11,1)=1;
  v2(11,2)=359;
  v2(11,3)=  v2(10,3);
  v2(12,1)=2;
  v2(12,2)=85;
  v2(12,3)=y(10)*getPowerDeriv(y(5),T14,2);
  v2(13,1)=2;
  v2(13,2)=148;
  v2(13,3)=(-(params(4)*getPowerDeriv(y(8),1/params(3),2)));
  v2(14,1)=2;
  v2(14,2)=185;
  v2(14,3)=T109;
  v2(15,1)=2;
  v2(15,2)=90;
  v2(15,3)=  v2(14,3);
  v2(16,1)=3;
  v2(16,2)=22;
  v2(16,3)=(-(T46*exp(y(11))*getPowerDeriv(y(2),params(7),2)));
  v2(17,1)=3;
  v2(17,2)=142;
  v2(17,3)=(-(T118*T132));
  v2(18,1)=3;
  v2(18,2)=28;
  v2(18,3)=  v2(17,3);
  v2(19,1)=3;
  v2(19,2)=148;
  v2(19,3)=(-(T44*getPowerDeriv(y(8),1-params(7),2)));
  v2(20,1)=3;
  v2(20,2)=202;
  v2(20,3)=(-(T46*T118));
  v2(21,1)=3;
  v2(21,2)=31;
  v2(21,3)=  v2(20,3);
  v2(22,1)=3;
  v2(22,2)=208;
  v2(22,3)=(-(T44*T132));
  v2(23,1)=3;
  v2(23,2)=151;
  v2(23,3)=  v2(22,3);
  v2(24,1)=3;
  v2(24,2)=211;
  v2(24,3)=(-(T44*T46));
  v2(25,1)=4;
  v2(25,2)=144;
  v2(25,3)=(-((-(1-params(7)))/(y(8)*y(8))));
  v2(26,1)=4;
  v2(26,2)=68;
  v2(26,3)=  v2(25,3);
  v2(27,1)=4;
  v2(27,2)=148;
  v2(27,3)=(-((-((-(y(4)*(1-params(7))))*(y(8)+y(8))))/(y(8)*y(8)*y(8)*y(8))));
  v2(28,1)=5;
  v2(28,2)=24;
  v2(28,3)=(-((-params(7))/(y(2)*y(2))));
  v2(29,1)=5;
  v2(29,2)=62;
  v2(29,3)=  v2(28,3);
  v2(30,1)=5;
  v2(30,2)=22;
  v2(30,3)=(-((-((-(y(4)*params(7)))*(y(2)+y(2))))/(y(2)*y(2)*y(2)*y(2))));
  v2(31,1)=9;
  v2(31,2)=64;
  v2(31,3)=(-(100*(-1)/(y(4)*y(4))));
  v2(32,1)=10;
  v2(32,2)=85;
  v2(32,3)=(-(100*(-1)/(y(5)*y(5))));
  v2(33,1)=11;
  v2(33,2)=127;
  v2(33,3)=(-(100*(-1)/(y(7)*y(7))));
  v2(34,1)=12;
  v2(34,2)=148;
  v2(34,3)=(-(100*(-1)/(y(8)*y(8))));
  v2(35,1)=13;
  v2(35,2)=190;
  v2(35,3)=(-(100*(-1)/(y(10)*y(10))));
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),14,400);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],14,8000);
end
end
end
end
