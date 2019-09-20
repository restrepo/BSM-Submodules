OnlyLowEnergySPheno = True;


MINPAR={{1,Lambda1INPUT},
        {2,Lambda2INPUT},
        {3,Lambda3INPUT},
        {4,Lambda2PINPUT},
        {5,Lambda3PINPUT},
        {6,Lambda4INPUT},
        {7,Mu3INPUT},
        {8,Y12INPUT},
        {9,Y34INPUT},
        {10, g1pINPUT},
        {11, g1p1INPUT},
        {12, g11pINPUT},
        {20, vXInput},
        {21, vYInput}};

ParametersToSolveTadpoles = {MuP,MuPP,mu2};

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
 {L1, Lambda1INPUT},
 {L2, Lambda2INPUT},
 {L3, Lambda3INPUT},
 {L2P, Lambda2PINPUT},
 {L3P, Lambda3PINPUT},
 {L4, Lambda4INPUT},
 {Mu3, Mu3INPUT},
 {Yv, LHInput[Yv]},
 {Yx, LHInput[Yx]},
 {Y12, Y12Input},
 {Y34, Y34Input},
 {vX,vXInput},
 {vY,vYInput}    
};

AddTreeLevelUnitarityLimits=True;


ListDecayParticles = {Fu,Fe,Fd,Fv,hh,Ah,VZp};
ListDecayParticles3B = {{Fv,"Fv.f90"},{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};


DefaultInputValues ={Lambda1INPUT -> -0.127, Lambda2INPUT -> -7.2*10^-5, g1pINPUT->0.5, vXinput->2500, vYinput->2500, Yx[a_,a_]-> 0.32, Yv[a_,a_]->10^-3};

