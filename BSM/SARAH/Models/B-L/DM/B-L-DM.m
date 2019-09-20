Off[General::spell]


Model`Name = "BLDM";
Model`NameLaTeX ="B-L with DM";
Model`Authors = "O.Z.";
Model`Date = "2018-03-03";

(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global Symmetries *)

Global[[1]] = {Z[2], Z2};
Global[[2]] = {Z[2], ExtraZ2};

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False, 1, 1};
Gauge[[2]]={WB, SU[2], left,        g2,True, 1, 1};
Gauge[[3]]={G,  SU[3], color,       g3,False, 1, 1};
Gauge[[4]]={Bp,  U[1], BminusL,     g1p, False, 1, 1};


(* Chiral Superfields *)

FermionFields[[1]] = {q, 3, {uL, dL},   1/6, 2, 3, 1/3, 1, 1};  
FermionFields[[2]] = {l, 3, {vL, eL},  -1/2, 2, 1, -1, 1, 1};
FermionFields[[3]] = {d, 3, conj[dR],   1/3, 1, -3, -1/3, 1, 1};
FermionFields[[4]] = {u, 3, conj[uR],  -2/3, 1, -3, -1/3, 1, 1};
FermionFields[[5]] = {e, 3, conj[eR],   1, 1,  1, 1, 1, 1};
FermionFields[[6]] = {v, 2, conj[vR],   0, 1,  1, 1, 1, 1};
FermionFields[[7]] = {x1, 1, conj[x1R],   0, 1,  1, 10/7, -1, 1};
FermionFields[[8]] = {x2, 1, conj[x2R],   0, 1,  1, 4/7, -1, 1};
FermionFields[[9]] = {x3, 1, conj[x3R],   0, 1,  1, 2/7, 1, -1};
FermionFields[[10]] = {x4, 1, conj[x4R],   0, 1,  1,-9/7, 1, -1};



ScalarFields[[1]] = {H, 1, {H0, Hm},       -1/2, 2,  1, 0, 1, 1};
ScalarFields[[2]] = {bi,   1, BiD,    0, 1, 1, -2, 1, 1};
ScalarFields[[3]] = {ci,   1, CiD,    0, 1, 1, -1, 1, 1};

(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][Additional]= {
	{LagHC, {AddHC->True}},
    	{LagHC2, {AddHC->True}},
	{LagNoHC,{ AddHC->False}},
        {LagNoHC2,{ AddHC->False}},
        {LagNoHC3,{ AddHC->False}}
};

LagNoHC = -(mu2 conj[H].H + L1 conj[H].H.conj[H].H + MuP conj[bi].bi + L2 conj[bi].bi.conj[bi].bi + L3 conj[bi].bi.conj[H].H );
LagNoHC2 = -(MuPP conj[ci].ci + L2P conj[ci].ci.conj[ci].ci + L3P conj[ci].ci.conj[H].H);
LagNoHC3 = -(Mu3 ( conj[ci].conj[ci].bi + conj[bi].ci.ci ) + L4 conj[ci].ci.conj[bi].bi);
LagHC = - (Yd H.d.q + Ye H.e.l - Yu conj[H].u.q + Yv conj[H].l.v + Yx bi.v.v   );
LagHC2 =  -( Y12 bi.x2.x1 + Y34 conj[ci].x4.x3   );

			  		  

(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3],VBp},{VP,VZ,VZp},ZZ},
  {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW}
};
        
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{    {H0, {vH, 1/Sqrt[2]}, {sigmaH, \[ImaginaryI]/Sqrt[2]},{phiH, 1/Sqrt[2]}},
     {CiD,{vY, 1/Sqrt[2]}, {sigmaC, \[ImaginaryI]/Sqrt[2]},{phiC, 1/Sqrt[2]}},
     {BiD,{vX, 1/Sqrt[2]}, {sigmaB, \[ImaginaryI]/Sqrt[2]},{phiB, 1/Sqrt[2]}}     };
 

DEFINITION[EWSB][MatterSector]=   
    {
     {{phiH,phiB,phiC},{hh,ZH}},
     {{sigmaH,sigmaB,sigmaC},{Ah,ZA}},
     {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}},
     {{vL,conj[vR]}, {VL,ZM}}        
};  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 Fv ->{  VL, conj[VL]},
 Fx ->{  x1R, conj[x2R]},
 Fxx ->{ x3R, conj[x4R]} };
 
DEFINITION[EWSB][GaugeES]={
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  Fu1, 0},
 Fu2 ->{  0, Fu2},
 Fe1 ->{  Fe1, 0},
 Fe2 ->{  0, Fe2},
 Fx1 ->{  x1R, 0},
 Fx2 ->{  0, x2R},    
 Fxx1 ->{ x3R, 0},
 Fxx2 ->{ 0, x4R} };



