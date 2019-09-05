ParameterDefinitions = { 

{g1,        { Description -> "Hypercharge-Coupling"}},

{g11p,        {Description -> "Mixed Gauge Coupling 2"}},
{g1p1,        {Description -> "Mixed Gauge Coupling 1"}},
{g1p,       {   Description -> "B-L-Coupling"}},

{MZp,       {   Description -> "Z' mass"}},


{g2,        { Description -> "Left-Coupling"}},
{g3,        { Description -> "Strong-Coupling"}},    
{AlphaS,    {Description -> "Alpha Strong"}},	
{e,         { Description -> "electric charge"}},
{Gf,        { Description -> "Fermi's constant"}},
{aEWinv,    { Description -> "inverse weak coupling constant at mZ"}},
 

{Yu,        { Description -> "Up-Yukawa-Coupling",
			 DependenceNum ->  Sqrt[2]/vH* {{Mass[Fu,1],0,0},
             									{0, Mass[Fu,2],0},
             									{0, 0, Mass[Fu,3]}}}}, 
             									
{Yd,        { Description -> "Down-Yukawa-Coupling",
			  DependenceNum ->  Sqrt[2]/vH* {{Mass[Fd,1],0,0},
             									{0, Mass[Fd,2],0},
             									{0, 0, Mass[Fd,3]}}}},
             									
{Ye,        { Description -> "Lepton-Yukawa-Coupling",
			  DependenceNum ->  Sqrt[2]/vH* {{Mass[Fe,1],0,0},
             									{0, Mass[Fe,2],0},
             									{0, 0, Mass[Fe,3]}}}}, 
                                                                            
                                                                           
{Mu,         { Description -> "SM Mu Parameter"}},                                        
{\[Lambda],  { Description -> "SM Higgs Selfcouplings"}},
{vH,          { Description -> "EW-VEV",
               DependenceSPheno -> None }},
{vX,      {  LaTeX -> "x",
             Dependence ->  None, 
             OutputName -> vX,
             Real -> True,
             LesHouches -> {BL,43} }},
{vY,      {  LaTeX -> "vY",
             Dependence ->  None, 
             OutputName -> vY,
             Real -> True,
             LesHouches -> {BL,44} }},

{ThetaW,    { Description -> "Weinberg-Angle"}},
{ThetaWp,  { Description -> "Theta'", DependenceNum -> None  }},

{ZZ, {Description ->   "Photon-Z-Z' Mixing Matrix"}},
{ZW, {Description -> "W Mixing Matrix"}},

{Yx, {OutputName -> Yx,
      LaTeX -> "Y_x",
      LesHouches -> YX}},

{Yv, {OutputName -> Yv,
      LaTeX -> "Y_\\nu",
      LesHouches -> Yv}},
    
{Y12, { Dependence -> None, 
        DependenceNum -> None, 
        DependenceOptional -> None, 
        DependenceSPheno -> None,
        OutputName  -> Y12,
        LesHouches -> {BL,8},
        LaTeX -> "Y12"}},
    
{Y34, { Dependence -> None, 
        DependenceNum -> None, 
        DependenceOptional -> None, 
        DependenceSPheno -> None, 
        Real -> True, 
        OutputName  -> Y34,
        LesHouches -> {BL,9},
        LaTeX -> "Y34"}},

{L1, {OutputName -> lam1,
      LaTeX -> "\\lambda_1",
      LesHouches -> {BL,1}}},


{L2, {OutputName -> lam2,
      LaTeX -> "\\lambda_2",
      LesHouches -> {BL,2}}},

{L3, {OutputName -> lam3,
      LaTeX -> "\\lambda_3",
      LesHouches -> {BL,3}}},

{MuP, {OutputName -> MUP,
      LaTeX -> "\\mu'",
      LesHouches -> {BL,20}}},
    
{L2P, {OutputName -> lam2p,
      LaTeX -> "\\lambda_{2p}",
      LesHouches -> {BL,4}}},

{L3P, {OutputName -> lam3p,
      LaTeX -> "\\lambda_{3p}",
      LesHouches -> {BL,5}}},
    
{L4, {OutputName -> lam4,
      LaTeX -> "\\lambda_{4}",
      LesHouches -> {BL,6}}},

{MuPP, {OutputName -> MUPP,
      LaTeX -> "\\mu''",
      LesHouches -> {BL,11}}},
    
{Mu3, {OutputName -> MU3,
      LaTeX -> "\\mu_{3}''",
      LesHouches -> {BL,7}}},

{mu2, {OutputName -> mu2,
      LaTeX -> "\\mu_2",
      LesHouches -> {BL,13}}},

{mH2, {OutputName -> mH2,
      LaTeX -> "\\m^2_H",
      LesHouches -> {BL,20}}},

{mchi2, {OutputName -> mX2,
      LaTeX -> "\\m^2_\\chi",
      LesHouches -> {BL,21}}},

{MUS, {OutputName -> muS,
      LaTeX -> "\\mu_s",
      LesHouches -> {BL,30}}},
      
{Vu,        {Description ->"Left-Up-Mixing-Matrix"}},
{Vd,        {Description ->"Left-Down-Mixing-Matrix"}},
{Uu,        {Description ->"Right-Up-Mixing-Matrix"}},
{Ud,        {Description ->"Right-Down-Mixing-Matrix"}}, 
{Ve,        {Description ->"Left-Lepton-Mixing-Matrix"}},
{Ue,        {Description ->"Right-Lepton-Mixing-Matrix"}},

{ZM,	    {Description -> "Neutrino-Mixing-Matrix"}},

{ZH,        { Description->"Scalar-Mixing-Matrix", 
               Dependence -> None,
               DependenceOptional -> None,
               DependenceNum -> None   }},
{ZA,        { Description->"Pseudo-Scalar-Mixing-Matrix", 
                Dependence -> None,
               DependenceOptional -> None,
               DependenceNum -> None   }}
 }; 
 

