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

(* Anomaly cancellation Module *)


(* Charges *)
(*{Xq,Xl,Xd,Xu,Xe,XH,Xbi}={0,0,0,0,0,0,9};*)
{Xq,Xl,Xd,Xu,Xe,XH,Xbi}={1/3, -1, -1/3, -1/3, 1, 0, -2};

(* anomaly solution: {d,i,r,a,c,0,0,m,a,j,o,r,a,n,a} *)
(*
(* [1, -2, -2, 4, 5, -7, -7, 8]  [{'S': 9, 'psi': [(4, 5), (1, 8), (-2, -7)]}] *)
{Xn,Xp,Xr,Xs,Xt,Xw,Xx,Xy,Xz}={-2,-7,1,8,4,5,0,0,0};
*)
(* [1, 1, 2, 3, -4, -4, -5, 6]	 [{'S': 2, 'psi': [(3, -5), (2, -4), (-4, 6), (1, 1)]}] *)
(* Beta version: implemented as if the two -4 were different *)
(*
    Xbi=-2;
   {Xn,Xp,Xr,Xs,Xt,Xw,Xx,Xy,Xz}={0,0,3,-5,2,-4,-4,6,1};
   {nDG,nWG,nMG}={2,2,2};

*)
{Xn,Xp,Xr,Xs,Xt,Xw,Xx,Xy,Xz}={1/5,-1/5,0,0,0,0,0,0,1};


(* Generations of Dirac, Weyl and Majorana fermions *)
(*{nDG,nWG,nMG}={2,2,2};*)
{nDG,nWG,nMG}={1,0,3};
(*<< config.m; (*reads {nDG,nWG,nMG} list values*)*)


(* Matter Fields *)

FermionFields[[1]]  = {q, 3, {uL, dL},     1/6, 2,  3, Xq, 1};  
FermionFields[[2]]  = {l, 3, {vL, eL},	 -1/2, 2,  1, Xl, 1};
FermionFields[[3]]  = {d, 3, conj[dR],	  1/3, 1, -3, Xd, 1};
FermionFields[[4]]  = {u, 3, conj[uR],	 -2/3, 1, -3, Xu, 1};
FermionFields[[5]]  = {e, 3, conj[eR],	    1, 1,  1, Xe, 1};
nF=5;
(* Odd left singlet fermions n,p,r,s,t,w,x,y,z *)
(* Multi-generation Dirac Fermions -> Fix PDG numbers in particles.m *)
If[Xn != 0 && Xp != 0,
   nF=nF+1;
   FermionFields[[nF]] = {n, nDG, nL,	    0, 1,  1, Xn, -1};
   nF=nF+1;
   FermionFields[[nF]] = {p, nDG, conj[pR], 0, 1,  1, Xp, -1};
 ];
(* Single family Dirac Fermion *)
If[Xr != 0 && Xs != 0,
   nF=nF+1;
   FermionFields[[nF]] = {r, 1, rL,	    0, 1,  1, Xr, -1};
   nF=nF+1;   
   FermionFields[[nF]] = {s, 1, conj[sR],   0, 1,  1, Xs, -1};
 ];
(* Single family Dirac Fermion *)
If[Xt != 0 && Xw != 0,
   nF=nF+1;
   FermionFields[[nF]] = {t, 1, tL,	    0, 1,  1, Xt, -1};
   nF=nF+1;   
   FermionFields[[nF]] = {w, 1, conj[wR],   0, 1,  1, Xw, -1};
 ];

(* (Xx,Xy) pair cases *)
(************** BEGIN CASES *****************************)
(* Cases: [1,-1]; [1,1] or [-1,-1] (S=2); [1,3] or [-1,-3] (S=4); [1,3] (S=6); [1,0] (S=2)   *)
If[Xx != 0 || Xy != 0,
   xMajorana = False;
   yDirac = False;
   yMajorana = False;

   If [
         Xx + Xy == 0, (*vector-like*)
            yDirac = True;,
         If [ (*non vector-like*)
               Abs[Xx + Xy] == Abs[Xbi], (*Massive chiral*)
               If[ (*chiral*)
                  Xx != Xy,
                     yDirac = True;,
                     yMajorana = True;
                  ],
                  (*massles Dirac*)
                  If [
                        Abs[2 Xy] == Abs[Xbi],
                           yMajorana = True;,
                        If [
                              Abs[2 Xx] == Abs[Xbi],
                                 xMajorana = True;
                           ]                           
                     ]             
            ]
      ]
   ]
(* Cases implementation *)
If[Xx != 0 && Xy != 0 && yDirac,
   nF=nF+1;
   FermionFields[[nF]] = {x, 1, tL,	    0, 1,  1, Xx, -1};
   nF=nF+1;   
   FermionFields[[nF]] = {y, 1, conj[yR],   0, 1,  1, Xy, -1};
 ];

(* Multi-generation Weyl Fermion -> Fix PDG numbers in particles.m (Dirac neutrinos) *)
If[Xx != 0 && (!yDirac && !yMajorana && !xMajorana),
   nF=nF+1;
   FermionFields[[nF]]  = {x, nWG, xL,	    0, 1,  1, Xx, -1};
   ];

(* Single Majorana Fermion *)
If[Xy != 0 && xMajorana,
   nF=nF+1;
   FermionFields[[nF]]  = {y, 1, yL,	    0, 1,  1, Xy, -1}; (* try conj[yR] if errors *)
   ];
(************** END CASES *******************************)

If[Xz != 0,
   nF=nF+1;
   FermionFields[[nF]]  = {z, nMG, zL,	    0, 1,  1, Xz, -1}; (* try conj[zR] if errors *)
    ];

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
  (*{LagSingFer,     {AddHC->True}},*)
  {LagH     ,      {AddHC->False}},
  {LagNoHCbi,      { AddHC->False}}
};

LagH     = -(mH2 conj[H].H     - 1/2 lambda1 conj[H].H.conj[H].H );
LagFer   = Yd conj[H].d.q + Ye conj[H].e.l + Yu H.u.q;
(* (Xn,Xp) cases*)
(*Massive chiral Dirac fermion*)
If[ Xn !=0 && Xn + Xp + Xbi == 0,
    LagFer = LagFer + Ynp n.p.bi;
    ];
(*Vector like Dirac fermion*)
If[ Xn !=0 && Xn + Xp == 0,
    LagFer = LagFer + Mnp n.p;
    ];

If[ Xr !=0 && Xr + Xs - Xbi == 0,
    LagFer = LagFer + Yrs r.s.conj[bi];
    ];
If[ Xt !=0 && Xt + Xw - Xbi == 0,
    LagFer = LagFer + Ytv t.w.conj[bi];
    ];

If[ yDirac && Xx + Xy + Xbi == 0,
 LagFer = LagFer +  Yxy x.y.bi;
];
If[ yMajorana && 2 Xy + Xbi == 0,
 LagFer = LagFer +  Yxy y.y.bi;
];
If[ xMajorana && 2 Xx + Xbi == 0,
 LagFer = LagFer +  Yxy x.x.bi;
];

If[ Xz !=0 && 2*Xz  + Xbi == 0,
 LagFer = LagFer +  Yz z.z.bi;
];


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


If[Xn != 0 && nDG > 1,
   DEFINITION[EWSB][MatterSector]=Join[
       DEFINITION[EWSB][MatterSector],
       {
	 {{{nL}, {conj[pR]}}, {{NL,Vn}, {NR,Un}}}
       }
				       ];
   ];


If[Xz != 0 && nMG > 1,
   DEFINITION[EWSB][MatterSector]=Join[
       DEFINITION[EWSB][MatterSector],
       {
	 {{zL},{ZL, Uz}}	 
       }
				       ];
 ];


If[Xn != 0,
      If[nDG > 1,
      FnList={Fn ->{  NL, conj[NR]}};,
      FnList={Fn ->{  nL, conj[pR]}};
      ]
]

(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 Fv ->{  vL, 0}
};

If[Xn != 0,
      (*FnList={Fn ->{  nL, conj[pR]}};*)
   DEFINITION[EWSB][DiracSpinors]=Join[
         DEFINITION[EWSB][DiracSpinors],
         FnList   
                                      ];
   ] 

If[Xr != 0,
   DEFINITION[EWSB][DiracSpinors]=Join[
      DEFINITION[EWSB][DiracSpinors],
      {
       Fr ->{  rL, sR}
       }
				       ];
   ];

If[Xt != 0,
   DEFINITION[EWSB][DiracSpinors]=Join[
      DEFINITION[EWSB][DiracSpinors],
      {
       Ft ->{  tL, wR}
      }
				       ];
   ];

If[Xx != 0 && Xy !=0 && yDirac,
   DEFINITION[EWSB][DiracSpinors]=Join[
      DEFINITION[EWSB][DiracSpinors],
      {
       Fx ->{  xL, yR}
      }
				       ];
   ];

If[Xx != 0 && xMajorana,
   DEFINITION[EWSB][DiracSpinors]=Join[
      DEFINITION[EWSB][DiracSpinors],
      {
       Fx ->{  xL, conj[xL]}
      }
				       ];
   ];

If[Xy != 0 && yMajorana,
   DEFINITION[EWSB][DiracSpinors]=Join[
      DEFINITION[EWSB][DiracSpinors],
      {
       Fx ->{  yR, conj[yL]}
      }
				       ];
   ];

(* Fix for nMG == 1, as before for nDG *)
If[Xz != 0,
   DEFINITION[EWSB][DiracSpinors]=Join[
      DEFINITION[EWSB][DiracSpinors],
      {
       Fz ->{  ZL, conj[ZL] }
      }
				       ];
  ];


DEFINITION[EWSB][GaugeES]={
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  Fu1, 0},
 Fu2 ->{  0, Fu2},
 Fe1 ->{  Fe1, 0},
 Fe2 ->{  0, Fe2}};



