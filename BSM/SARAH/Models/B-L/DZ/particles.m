

ParticleDefinitions[GaugeES] = {
      {H0,  { 
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 1,
                 LaTeX -> "H^0",
                 OutputName -> "H0" }},                         
      
      
      {Hp,  { 
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 2,
                 LaTeX -> "H^+",
                 OutputName -> "Hp" }},

                 
      {VB,   { Description -> "B-Boson"}},                                                   
      {VG,   { Description -> "Gluon"}},          
      {VWB,  { Description -> "W-Bosons"}},          
      {gB,   { Description -> "B-Boson Ghost"}},                                                   
      {gG,   { Description -> "Gluon Ghost" }},          
      {gWB,  { Description -> "W-Boson Ghost"}}
      
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
                 Width -> {0, External}, 
                 Mass ->LesHouches,
                 FeynArtsNr -> 2,
                 LaTeX -> "A_h",
                 OutputName -> "Ah" }},                      

    {Hm,   { Description -> "Charged Higgs", 
	     PDG -> {0, 900037, 900038},
	     PDG.IX -> {0, -10000602,  -10000603},
	     Width -> {0, External, External},
	     Mass -> {0, LesHouches, LesHouches},
	     ElectricCharge -> -1,
	     Latex -> {"Hm^-","S^-_1","S^-_2"},
	     OutputName -> {"Hm","s1","s2"}}},
      
    {VP,   { Description -> "Photon"}}, 
    {VZ,   { Description -> "Z-Boson",
    			 Goldstone -> Ah[{1}] }}, 
    {VG,   { Description -> "Gluon" }},          
    {VWm,  { Description -> "W-Boson",
	                 Goldstone-> Hm[{1}] }},         
    {gP,   { Description -> "Photon Ghost"}},                                                   
    {gWm,  { Description -> "Negative W-Boson Ghost"}}, 
    {gWmC, { Description -> "Positive W-Boson Ghost" }}, 
    {gZ,   { Description -> "Z-Boson Ghost" }},
    {gG,   { Description -> "Gluon Ghost" }},          
    {VZp,  { Description -> "Z'-Boson",
      			 Goldstone -> Ah[{2}]}},  
    {gZp,  { Description -> "Z'-Ghost" }},    
                               
                 
    {Fd,   { Description -> "Down-Quarks"}},   
    {Fu,   { Description -> "Up-Quarks"}},   
    {Fe,   { Description -> "Leptons" }},
    {Fv,   { Description -> "Neutrinos",
		   PDG ->{12,14,16,8810012,8810014,8810016} }}
     
        };    
        
        
        
 WeylFermionAndIndermediate = {
     
    {H,      {   PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "H",
                 OutputName -> "" }},

    {S1,      {  PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "S_1",
                 OutputName -> "" }},

    {S2,      {  PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "S_2",
                 OutputName -> "" }},

   {dR,     {LaTeX -> "d_R" }},
   {eR,     {LaTeX -> "e_R" }},
   {lep,     {LaTeX -> "l" }},
   {uR,     {LaTeX -> "u_R" }},
   {q,     {LaTeX -> "q" }},
   {eL,     {LaTeX -> "e_L" }},
   {dL,     {LaTeX -> "d_L" }},
   {uL,     {LaTeX -> "u_L" }},
   {vL,     {LaTeX -> "\\nu_L" }},
   {vR,     {LaTeX -> "\\nu_R" }},

   {DR,     {LaTeX -> "D_R" }},
   {ER,     {LaTeX -> "E_R" }},
   {UR,     {LaTeX -> "U_R" }},
   {VR,     {LaTeX -> "V_R" }},
   {EL,     {LaTeX -> "E_L" }},
   {DL,     {LaTeX -> "D_L" }},
   {UL,     {LaTeX -> "U_L" }},
   {VL,     {LaTeX -> "V_L" }},
   
   (* new right neutrinos *)
   {v,     {LaTeX -> "\\nu_R" }},    
   {vR,     {LaTeX -> "v_R" }},
   {v3,     {LaTeX -> "\\nu_R3" }},    
   {vR3,     {LaTeX -> "v_R3" }}

        };       


