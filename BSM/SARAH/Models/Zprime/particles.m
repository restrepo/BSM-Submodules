

ParticleDefinitions[GaugeES] = {
      {H0,  {    PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 1,
                 LaTeX -> "H^0",
                 OutputName -> "H0" }},                         
      
      
      {Hp,  {    PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 2,
                 LaTeX -> "H^+",
                 OutputName -> "Hp" }}, 
                 
               
    
      {VB,   { Description -> "B-Boson"}},                                                   
      {VG,   { Description -> "Gluon"}},          
      {VWB,  { Description -> "W-Bosons"}},          

      {VBp,   { Description -> "Bp-Boson",
                PDG -> {0},
                PDG.IX -> {0},
                Width -> 0, 
                Mass -> 0,
                FeynArtsNr -> 1,
                LaTeX -> "B'",
                OutputName -> "Bp" }},
      
      {gB,   { Description -> "B-Boson Ghost"}},
      {gG,   { Description -> "Gluon Ghost" }},          
      {gWB,  { Description -> "W-Boson Ghost"}},
      {gBp,  { Description -> "Bp-Boson Ghost",
               PDG -> {0},
               PDG.IX -> {0},
               Width -> 0, 
               Mass -> 0,
               FeynArtsNr -> 1,
               LaTeX -> "\\eta^Bp",
               OutputName -> "gBp"}}      
      
      };
      
      
      
      
  ParticleDefinitions[EWSB] = {
            
      
    {hh   ,  { Description -> "Higgs",
                 PDG -> {25,35},
                 Width -> Automatic, 
                 Mass ->LesHouches,
                 FeynArtsNr -> 1,
                 LaTeX -> "h",
                 OutputName -> "h" }}, 
                 
     {Ah   ,  {  Description -> "Pseudo-Scalar Higgs",
                 PDG -> {0,0},
                 Width -> {0,0}, 
                 Mass -> {0,0},
                 FeynArtsNr -> 2,
                 LaTeX -> "A_h",
                 OutputName -> "Ah" }},                      
      
     {Hp,     { Description -> "Charged Higgs", 
                 PDG -> {0},
                 PDG.IX ->{0},
                 Width -> {0}, 
                 Mass -> {0},
                 LaTeX -> {"H^+","H^-"},
                 OutputName -> {"Hp","Hm"},
                 ElectricCharge->1
                 }},                                                   
      
      {VP,   { Description -> "Photon"}},
      {VZ,   { Description -> "Z-Boson",
      			 Goldstone -> Ah[{1}] }}, 
      {VG,   { Description -> "Gluon" }},
      {VWp,  { Description -> "W+ - Boson",
     			Goldstone -> Hp }},

      {VZp,    { Description -> "Z'-Boson",
      			 Goldstone -> Ah[{2}]}},
      
      {gP,   { Description -> "Photon Ghost"}},                                                   
      {gZ,   { Description -> "Z-Boson Ghost" }},
      {gWp,  { Description -> "Positive W+ - Boson Ghost"}}, 
      {gWpC, { Description -> "Negative W+ - Boson Ghost" }}, 
      {gG,   { Description -> "Gluon Ghost" }},          
      
      {gZp,    { Description -> "Z'-Ghost" }},    
                 
      {Fd,   { Description -> "Down-Quarks"}},   
      {Fu,   { Description -> "Up-Quarks"}},   
      {Fe,   { Description -> "Leptons" }},
      {Fv,   { Description -> "Neutrinos" }},
      {Fn,   { Description -> "Darkinos",
	      PDG -> {1000001},
	      PDG.IX -> {2000001},
	      Mass -> LesHouches,
              FeynArtsNr -> 11,
              LaTeX -> "{\\chi}^0_n",
              ElectricCharge -> 0,
              LHPC -> {3, "orange"},
              OutputName -> "N"}
      },
      {Fr,   { Description -> "Darkinos",
	      PDG -> {1000011},
	      PDG.IX -> {2000011},
              FeynArtsNr -> 12,
              LaTeX -> "{\\chi}^0_r",
              OutputName -> "R"}
      },
      {Ft,   { Description -> "Darkinos",
	      PDG -> {1000021},
	      PDG.IX -> {2000021},
              FeynArtsNr -> 13,
              LaTeX -> "{\\chi}^0_t",
              OutputName -> "T"}
      },
      {Fx,   { Description -> "Darkinos",
	      PDG -> {1000031},
	      PDG.IX -> {2000031},
              FeynArtsNr -> 14,
              LaTeX -> "{\\chi}^0_x",
              OutputName -> "X"}
      },
      {Fz,   { Description -> "Darkinos",
	      PDG -> {1000051,1000052,1000053},
	      PDG.IX -> {2000051,2000052,2000053},
              FeynArtsNr -> 14,
              LaTeX -> "{\\chi}^0_x",
              OutputName -> "X"}
       }
      
       };    
        
 WeylFermionAndIndermediate = {
     
    {H,      {   PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "H",
                 OutputName -> "" }},

   {dR,     {LaTeX -> "d_R" }},
   {eR,     {LaTeX -> "e_R" }},
   {lep,     {LaTeX -> "l" }},
   {uR,     {LaTeX -> "u_R" }},
   {q,      {LaTeX -> "q" }},
   {eL,     {LaTeX -> "e_L" }},
   {dL,     {LaTeX -> "d_L" }},
   {uL,     {LaTeX -> "u_L" }},
   {vL,     {LaTeX -> "\\nu_L" }},
   
   {DR,     {LaTeX -> "D_R" }},
   {ER,     {LaTeX -> "E_R" }},
   {UR,     {LaTeX -> "U_R" }},   
   {EL,     {LaTeX -> "E_L" }},
   {DL,     {LaTeX -> "D_L" }},
   {UL,     {LaTeX -> "U_L" }},

   {nL,     {LaTeX -> "n_L" }},
   {pR,     {LaTeX -> "p_R" }},
   {zL,     {LaTeX -> "z_L" }},
   
   {NR,     {LaTeX -> "N_R" }},
   {NL,     {LaTeX -> "N_R" }},
   {ZL,     {LaTeX -> "Z_R" }}
   
        };       


