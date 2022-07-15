OnlyLowEnergySPheno = True;


MINPAR={{1,lambda1INPUT},
        {2,Lambda2INPUT},
        {3,Lambda3INPUT},
        {10, g1pINPUT},
        {11, g1p1INPUT},
        {12, g11pINPUT},
        {20, vXINPUT} };

ParametersToSolveTadpoles = {MuP,mH2};

DEFINITION[MatchingConditions]= {
 {Ye, YeSM},
 {Yd, YdSM},
 {Yu, YuSM},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM},
 {vH, vSM}
 };


BoundaryLowScaleInput={
 {g1p,g1pINPUT},
 {g11p,g11pINPUT},
 {g1p1,g1p1INPUT},
 {lambda1, lambda1INPUT},
 {L2, Lambda2INPUT},
 {L3, Lambda3INPUT},
 {vX,vXINPUT}
};


ListDecayParticles = {Fu,Fe,Fd,hh,VZp};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};


DefaultInputValues ={
  lambda1INPUT -> -0.25,
  Lambda2INPUT -> -1.0*10^-2,
  Lambda3INPUT ->  1.0*10^-5,  
  g1pINPUT -> 0.5,
  vXINPUT -> 2500
};

AddTreeLevelUnitarityLimits=True;
FlagLoopContributions = True;

RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWp/(MVWp^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWp/MVWp^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};
