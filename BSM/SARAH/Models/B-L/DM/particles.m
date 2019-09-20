

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
      {gWB,  { Description -> "W-Boson Ghost"}},
    
      {Fx1,{ 
          FeynArtsNr -> 72   (* auto generated FeynArts number *), 
          LaTeX -> "x1"   (* auto generated LaTeX name *), 
          Mass -> LesHouches, 
          OutputName -> "fx1"   (* auto generated Output name *), 
          PDG -> {151}   (* auto generated PDGs  *), 
          Width -> Automatic}}, 

      {Fx2,{ 
          FeynArtsNr -> 74   (* auto generated FeynArts number *), 
          LaTeX -> "x2"   (* auto generated LaTeX name *), 
          Mass -> LesHouches, 
          OutputName -> "fx2"   (* auto generated Output name *), 
          PDG -> {153}   (* auto generated PDGs  *), 
          Width -> Automatic}}, 
       
      {Fxx1,{ 
          FeynArtsNr -> 76   (* auto generated FeynArts number *), 
          LaTeX -> "xx1"   (* auto generated LaTeX name *), 
          Mass -> LesHouches, 
          OutputName -> "fxx1"   (* auto generated Output name *), 
          PDG -> {153}   (* auto generated PDGs  *), 
          Width -> Automatic}}, 

      {Fxx2,{ 
          FeynArtsNr -> 78   (* auto generated FeynArts number *), 
          LaTeX -> "xx2"   (* auto generated LaTeX name *), 
          Mass -> LesHouches, 
          OutputName -> "fxx2"   (* auto generated Output name *), 
          PDG -> {155}   (* auto generated PDGs  *), 
          Width -> Automatic}}
      
      };
      
      
      
      
  ParticleDefinitions[EWSB] = {
            
      
    {hh   ,  { Description -> "Higgs",
                 PDG -> {25,35,1035},
                 Width -> Automatic, 
                 Mass ->LesHouches,
                 FeynArtsNr -> 1,
                 LaTeX -> "h",
                 OutputName -> "h" }}, 
                 
     {Ah   ,  {  Description -> "Pseudo-Scalar Higgs",
                 PDG -> {0, 0, 36},
                 Mass ->{0, 0, LesHouches},
                 LaTeX -> "A_h",
                 OutputName -> "Ah" }},                      
      
      
     {Hm,     {  Description -> "Charged Higgs", 
                 PDG -> {0},
                 Width -> 0, 
                 Mass ->LesHouches,
                 FeynArtsNr -> 3,
                 LaTeX -> "H^-",
                 OutputName -> "Hm" }},                                              
      
      {VP,   { Description -> "Photon"}}, 
      {VZ,   { Description -> "Z-Boson",
      			 Goldstone -> Ah[{1}] }}, 
      {VG,   { Description -> "Gluon" }},          
      {VWm,  { Description -> "W-Boson",
                Goldstone->Hm }},         
      {gP,   { Description -> "Photon Ghost"}},                                                   
      {gWm,  { Description -> "Negative W-Boson Ghost"}}, 
      {gWmC, { Description -> "Positive W-Boson Ghost" }}, 
      {gZ,   { Description -> "Z-Boson Ghost" }},
      {gG,   { Description -> "Gluon Ghost" }},          
      {VZp,    { Description -> "Z'-Boson",
      			 Goldstone -> Ah[{2}]}},  
      {gZp,    { Description -> "Z'-Ghost" }},    
                               
                 
      {Fd,   { Description -> "Down-Quarks"}},   
      {Fu,   { Description -> "Up-Quarks"}},   
      {Fe,   { Description -> "Leptons" }},
      {Fv,   { Description -> "Neutrinos",
      	       PDG ->{12,14,16,8810012,8810014} }},
      {Fx,  { Description -> "vectorlike-lepton-1", 
              FeynArtsNr -> 101, 
              LaTeX -> "Fx", 
              Mass -> LesHouches, 
              OutputName -> "Fx", 
              PDG -> {101}, 
              ElectricCharge -> 0, 
              Width -> Automatic}},
      {Fxx,  { Description -> "vectorlike-lepton-2", 
              FeynArtsNr -> 102, 
              LaTeX -> "Fxx", 
              Mass -> LesHouches, 
              OutputName -> "Fxx", 
              PDG -> {102}, 
              ElectricCharge -> 0, 
              Width -> Automatic}} };    
        
        
        
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
   {q,     {LaTeX -> "q" }},
   {eL,     {LaTeX -> "e_L" }},
   {dL,     {LaTeX -> "d_L" }},
   {uL,     {LaTeX -> "u_L" }},
   {vL,     {LaTeX -> "\\nu_L" }},

   {DR,     {LaTeX -> "D_R" }},
   {ER,     {LaTeX -> "E_R" }},
   {UR,     {LaTeX -> "U_R" }},
   {EL,     {LaTeX -> "E_L" }},
   {DL,     {LaTeX -> "D_L" }},
   {UL,     {LaTeX -> "U_L" }}
        };       


