OnlyLowEnergySPheno = True;

MINPAR={{1,Lambda1IN},
        {2,LamSHIN},
        {3,LamSIN},
        {4,MS2Input},
        {5,MSFIN}
       };


ParametersToSolveTadpoles = {mu2};

DEFINITION[MatchingConditions]= 
    {{v, vSM}, 
 {Ye, YeSM},
 {Yd, YdSM},
 {Yu, YuSM},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM}};

BoundaryLowScaleInput={
 {Lambda1,Lambda1IN},
  {LamSH,LamSHIN},
  {LamS,LamSIN},
  {MS2, MS2Input},
  {Ys,LHInput[Ys]},
  {MSF, MSFIN}
 (*{MTF,LHInput[MTF]}*)
};

AddTreeLevelUnitarityLimits=True;


ListDecayParticles = {Fu,Fe,Fd,hh, Fre,ss};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}, {Fre,"Fre.f90"}};

FlagLoopContributions = True;  

DefaultInputValues ={Lambda1IN -> 0.255,MSFIN -> 200,
		     LamSHIN -> 0., LamSIN -> 0,
		     MS2Input -> 200., Ys[1] -> 0.01};

RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWp/(MVWp^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWp/MVWp^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};
