Off[General::spell]

Model`Name = "Zprime";
Model`NameLaTeX ="Standard Model with Z2 and Dark Symmetry";
Model`Authors = "F.Staub";
Model`Date = "2014-11-06";

(* 2013-01-24: changed normalization of lambda term to convention of hep-ph/0207271 *)
(* 2013-06-24: using new name conventions (without inital "S" and "F" for scalar and matter fields) *)
(* 2013-09-01: changing to new conventions for FermionFields/MatterFields *)
(* 2014-11-06: Changed sign in Lagrangian to fit standard conventions *)
(* 2016-05-03: Changed sign of Yu *)


(* 2014-11-06: Changed sign in Lagrangian *)
(* 2015-11-16: fixed particles.m *)

(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global Symmetries *)
Global[[1]] = {Z[2], Z2};

(* Gauge Groups *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False, 1};
Gauge[[2]]={WB, SU[2], left,        g2,True , 1};
Gauge[[3]]={G,  SU[3], color,       g3,False, 1};
(* name of the charge needs at least 3 characters *)
Gauge[[4]]={Bp,  U[1], XXX,       g1p, False,1}; (* False as in the official B-L Model *)

(* Charges *)
(* [1, -2, -2, 4, 5, -7, -7, 8]  [{'S': 9, 'psi': [(4, 5), (1, 8), (-2, -7)]}] *)
{Xq,Xl,Xd,Xu,Xe,XH,Xbi}={0,0,0,0,0,0,9};
(* anomaly solution *)
{Xn,Xp,Xr,Xs,Xt,Xw,Xx,Xy,Xz}={-2,-7,1,8,4,5,0,0,0}


(* Matter Fields *)

FermionFields[[1]]  = {q, 3, {uL, dL},     1/6, 2,  3, Xq, 1};  
FermionFields[[2]]  = {l, 3, {vL, eL},	 -1/2, 2,  1, Xl, 1};
FermionFields[[3]]  = {d, 3, conj[dR],	  1/3, 1, -3, Xd, 1};
FermionFields[[4]]  = {u, 3, conj[uR],	 -2/3, 1, -3, Xu, 1};
FermionFields[[5]]  = {e, 3, conj[eR],	    1, 1,  1, Xe, 1};
(* Odd left singlet fermions n,p,r,s,t,v,w,x,y,z *)
FermionFields[[6]]  = {n, 2, nL,	    0, 1,  1, Xn, -1};
FermionFields[[7]]  = {p, 2, conj[pR],	    0, 1,  1, Xp, -1};
FermionFields[[8]]  = {r, 1, rL,	    0, 1,  1, Xr, -1}
FermionFields[[9]]  = {s, 1, conj[sR],	    0, 1,  1, Xs, -1};
FermionFields[[10]] = {t, 1, tL,	    0, 1,  1, Xt, -1};
FermionFields[[11]] = {w, 1, conj[wR],	    0, 1,  1, Xw, -1};


 						         
ScalarFields[[1]] =  {H, 1, {Hp, H0},	  1/2, 2,  1, XH, 1};
ScalarFields[[2]] =  {bi,  1, BiD,	    0, 1,  1, Xbi, 1};
						        

(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][LagrangianInput]= 
{
  {LagFer   ,      {AddHC->True}},
  {LagSingFer,     {AddHC->True}},
  {LagH     ,      {AddHC->False}},
  {LagNoHCbi,      { AddHC->False}}
};

LagH     = -(mH2 conj[H].H     - 1/2 lambda1 conj[H].H.conj[H].H );
LagFer   = Yd conj[H].d.q + Ye conj[H].e.l + Yu H.u.q;
LagSingFer = Ynp n.p.bi + Yrs r.s.conj[bi] + Ytv t.w.conj[bi];
LagNoHCbi = -(MuP conj[bi].bi - L2 conj[bi].bi.conj[bi].bi - L3 conj[bi].bi.conj[H].H );


(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3],VBp},{VP,VZ,VZp},ZZ},  
  {{VWB[1],VWB[2]},{VWp,conj[VWp]},ZW}
};     

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{    {H0, {vH, 1/Sqrt[2]},  {sigmaH, \[ImaginaryI]/Sqrt[2]},{phiH, 1/Sqrt[2]}},
     {BiD,{vX, 1/Sqrt[2]}, {sigmaB, \[ImaginaryI]/Sqrt[2]},{phiB, 1/Sqrt[2]}}
  };
 

DEFINITION[EWSB][MatterSector]=   
    {
     {{phiH,phiB},{hh,ZH}},
     {{sigmaH,sigmaB},{Ah,ZA}},
     {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}}
};  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 Fv ->{  vL, 0}};

DEFINITION[EWSB][GaugeES]={
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  Fu1, 0},
 Fu2 ->{  0, Fu2},
 Fe1 ->{  Fe1, 0},
 Fe2 ->{  0, Fe2}};



