OnlyLowEnergySPheno = True;

MINPAR={
  {1,lambda1INPUT},
  {2,lambda2INPUT},
  {3,lambda3INPUT},
  {4,lambda4INPUT},
  {5,lambda5INPUT},
  {6,mEt2INPUT}
};

ParametersToSolveTadpoles = {mH2};

BoundaryLowScaleInput={
  {lambda1,lambda1INPUT},
  {lambda2,lambda2INPUT},
  {lambda3,lambda3INPUT},
  {lambda4,lambda4INPUT},
  {lambda5,lambda5INPUT},
  {mEt2,mEt2INPUT},
  {Yn, LHInput[Yn]},
  {Mn, LHInput[Mn]}
};

DEFINITION[MatchingConditions]= 
{{v, vSM}, 
 {Ye, YeSM},
 {Yd, YdSM},
 {Yu, YuSM},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM}};

ListDecayParticles = {Fu,Fe,Fd,Fv,VZ,VWp,hh,etR,etI,etp,Chi};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

DefaultInputValues ={
  lambda1INPUT -> 0.26,
  lambda2INPUT -> 0.1,
  lambda3INPUT -> 0.1,
  lambda4INPUT -> -0.1,
  lambda5INPUT -> 8.0*10^-10,
  mEt2INPUT -> 1.2*10^7,
  Yn[a_,a_]-> 0.01,
  Mn[1,1] -> 3.45*10^2,
  Mn[2,2] -> 4.8*10^3,
  Mn[3,3] -> 6.8*10^3
};

FlagLoopContributions = True;

RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWp/(MVWp^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWp/MVWp^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};


