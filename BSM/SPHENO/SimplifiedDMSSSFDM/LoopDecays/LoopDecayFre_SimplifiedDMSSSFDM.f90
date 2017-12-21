! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 0:32 on 21.12.2017   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecay_Fre_SimplifiedDMSSSFDM
Use Control 
Use Settings 
Use LoopFunctions 
Use AddLoopFunctions 
Use Model_Data_SimplifiedDMSSSFDM 
Use DecayFFS 
Use DecayFFV 
Use DecaySSS 
Use DecaySFF 
Use DecaySSV 
Use DecaySVV 
Use Bremsstrahlung 

Contains 

Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_FreToFess(cplcFreFessL,cplcFreFessR,     & 
& MFe,MFre,Mss,MFe2,MFre2,Mss2,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFre,Mss,MFe2(3),MFre2,Mss2

Complex(dp), Intent(in) :: cplcFreFessL(3),cplcFreFessR(3)

Complex(dp) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

  Do gt2=1,3
! External masses 
Mex1 = MFre 
Mex2 = MFe(gt2) 
Mex3 = Mss 
! Tree-Level Vertex 
coupT1L = cplcFreFessL(gt2)
coupT1R = cplcFreFessR(gt2)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt2) = AmpC 
  End Do
End Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_FreToFess


Subroutine Gamma_Real_SimplifiedDMSSSFDM_FreToFess(MLambda,em,gs,cplcFreFessL,        & 
& cplcFreFessR,MFe,MFre,Mss,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFreFessL(3),cplcFreFessR(3)

Real(dp), Intent(in) :: MFe(3),MFre,Mss

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3), GammarealGluon(3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
  Do i2=1,3
CoupL = cplcFreFessL(i2)
CoupR = cplcFreFessR(i2)
Mex1 = MFre
Mex2 = MFe(i2)
Mex3 = Mss
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp,1._dp,0._dp,1._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i2),kont)
  GammarealGluon(i2) = 0._dp 
Else 
  GammarealGluon(i2) = 0._dp 
  GammarealPhoton(i2) = 0._dp 

End if 
  End Do
End Subroutine Gamma_Real_SimplifiedDMSSSFDM_FreToFess


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_FreToFess(cplcFreFessL,cplcFreFessR,     & 
& ctcplcFreFessL,ctcplcFreFessR,MFe,MFe2,MFre,MFre2,Mss,Mss2,Zfed,ZfEL,ZfER,             & 
& Zfeu,Zfss,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFe2(3),MFre,MFre2,Mss,Mss2

Complex(dp), Intent(in) :: cplcFreFessL(3),cplcFreFessR(3)

Complex(dp), Intent(in) :: ctcplcFreFessL(3),ctcplcFreFessR(3)

Complex(dp), Intent(in) :: Zfed,ZfEL(3,3),ZfER(3,3),Zfeu,Zfss

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

  Do gt2=1,3
! External masses 
Mex1 = MFre 
Mex2 = MFe(gt2) 
Mex3 = Mss 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFreFessL(gt2) 
ZcoupT1R = ctcplcFreFessR(gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfed*cplcFreFessL(gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(Zfeu)*cplcFreFessR(gt2)


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfEL(i1,gt2)*cplcFreFessL(i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfER(i1,gt2))*cplcFreFessR(i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfss*cplcFreFessL(gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfss*cplcFreFessR(gt2)


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt2) = AmpC 
  End Do
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_FreToFess


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_FreToFess(MFe,MFre,Mhh,Mss,            & 
& MVP,MVZ,MFe2,MFre2,Mhh2,Mss2,MVP2,MVZ2,cplcFeFehhL,cplcFeFehhR,cplcFreFessL,           & 
& cplcFreFessR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFressL,             & 
& cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR,cplhhssss,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFre,Mhh,Mss,MVP,MVZ,MFe2(3),MFre2,Mhh2,Mss2,MVP2,MVZ2

Complex(dp), Intent(in) :: cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFreFessL(3),cplcFreFessR(3),cplcFeFeVPL(3,3),   & 
& cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFressL(3),cplcFeFressR(3),    & 
& cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR,cplhhssss

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
  Do gt2=1,3
Amp(:,gt2) = 0._dp 
! External masses 
Mex1 = MFre 
Mex2 = MFe(gt2) 
Mex3 = Mss 


! {Fe, ss, hh}
If ((Include_in_loopFe).and.(Include_in_loopss).and.(Include_in_loophh)) Then 
Do i1=1,3
ML1 = MFe(i1) 
ML2 = Mss 
ML3 = Mhh 
coup1L = cplcFreFessL(i1)
coup1R = cplcFreFessR(i1)
coup2L = cplcFeFehhL(i1,gt2)
coup2R = cplcFeFehhR(i1,gt2)
coup3 = cplhhssss
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {ss, bar[Fe], bar[Fre]}
If ((Include_in_loopss).and.(Include_in_loopFe).and.(Include_in_loopFre)) Then 
  Do i2=1,3
ML1 = Mss 
ML2 = MFe(i2) 
ML3 = MFre 
coup1L = cplcFreFessL(i2)
coup1R = cplcFreFessR(i2)
coup2L = cplcFreFessL(gt2)
coup2R = cplcFreFessR(gt2)
coup3L = cplcFeFressL(i2)
coup3R = cplcFeFressR(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VP, bar[Fre], bar[Fe]}
If ((Include_in_loopVP).and.(Include_in_loopFre).and.(Include_in_loopFe)) Then 
    Do i3=1,3
ML1 = MVP 
ML2 = MFre 
ML3 = MFe(i3) 
coup1L = cplcFreFreVPL
coup1R = cplcFreFreVPR
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplcFreFessL(i3)
coup3R = cplcFreFessR(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, bar[Fre], bar[Fe]}
If ((Include_in_loopVZ).and.(Include_in_loopFre).and.(Include_in_loopFe)) Then 
    Do i3=1,3
ML1 = MVZ 
ML2 = MFre 
ML3 = MFe(i3) 
coup1L = cplcFreFreVZL
coup1R = cplcFreFreVZR
coup2L = -cplcFeFeVZR(i3,gt2)
coup2R = -cplcFeFeVZL(i3,gt2)
coup3L = cplcFreFessL(i3)
coup3R = cplcFreFessR(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 
  End Do
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_FreToFess


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_FreToFess(MFe,MFre,Mhh,             & 
& Mss,MVP,MVZ,MFe2,MFre2,Mhh2,Mss2,MVP2,MVZ2,cplcFeFehhL,cplcFeFehhR,cplcFreFessL,       & 
& cplcFreFessR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFressL,             & 
& cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR,cplhhssss,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFre,Mhh,Mss,MVP,MVZ,MFe2(3),MFre2,Mhh2,Mss2,MVP2,MVZ2

Complex(dp), Intent(in) :: cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFreFessL(3),cplcFreFessR(3),cplcFeFeVPL(3,3),   & 
& cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFressL(3),cplcFeFressR(3),    & 
& cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR,cplhhssss

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
  Do gt2=1,3
Amp(:,gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFre 
Mex2 = MFe(gt2) 
Mex3 = Mss 


! {VP, bar[Fre], bar[Fe]}
If ((Include_in_loopVP).and.(Include_in_loopFre).and.(Include_in_loopFe)) Then 
    Do i3=1,3
ML1 = MVP 
ML2 = MFre 
ML3 = MFe(i3) 
coup1L = cplcFreFreVPL
coup1R = cplcFreFreVPR
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplcFreFessL(i3)
coup3R = cplcFreFessR(i3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 
  End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_FreToFess


Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_FreToFreVZ(cplcFreFreVZL,cplcFreFreVZR,  & 
& MFre,MVZ,MFre2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: MFre,MVZ,MFre2,MVZ2

Complex(dp), Intent(in) :: cplcFreFreVZL,cplcFreFreVZR

Complex(dp) :: Amp(4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

! External masses 
Mex1 = MFre 
Mex2 = MFre 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1L = cplcFreFreVZL
coupT1R = cplcFreFreVZR
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:) = -AmpC 
End Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_FreToFreVZ


Subroutine Gamma_Real_SimplifiedDMSSSFDM_FreToFreVZ(MLambda,em,gs,cplcFreFreVZL,      & 
& cplcFreFreVZR,MFre,MVZ,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFreFreVZL,cplcFreFreVZR

Real(dp), Intent(in) :: MFre,MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton, GammarealGluon 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
CoupL = cplcFreFreVZL
CoupR = cplcFreFreVZR
Mex1 = MFre
Mex2 = MFre
Mex3 = MVZ
If (Mex1.gt.(Mex2+Mex3)) Then 
  Call hardphotonFFZ(Mex1,Mex2,Mex3,MLambda,-1._dp,-1._dp,CoupL,CoupR,(0,1)*em,GammaRealPhoton,kont)
  GammarealGluon = 0._dp 
Else 
  GammarealGluon = 0._dp 
  GammarealPhoton = 0._dp 

End if 
End Subroutine Gamma_Real_SimplifiedDMSSSFDM_FreToFreVZ


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_FreToFreVZ(cplcFreFreVPL,cplcFreFreVPR,  & 
& cplcFreFreVZL,cplcFreFreVZR,ctcplcFreFreVPL,ctcplcFreFreVPR,ctcplcFreFreVZL,           & 
& ctcplcFreFreVZR,MFre,MFre2,MVP,MVP2,MVZ,MVZ2,Zfed,Zfeu,ZfVPVZ,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MFre,MFre2,MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR

Complex(dp), Intent(in) :: ctcplcFreFreVPL,ctcplcFreFreVPR,ctcplcFreFreVZL,ctcplcFreFreVZR

Complex(dp), Intent(in) :: Zfed,Zfeu,ZfVPVZ,ZfVZ

Complex(dp), Intent(out) :: Amp(4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = MFre 
Mex2 = MFre 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFreFreVZL 
ZcoupT1R = ctcplcFreFreVZR
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(Zfeu)*cplcFreFreVZL
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfed*cplcFreFreVZR


! External Field 2 
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfeu*cplcFreFreVZL
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(Zfed)*cplcFreFreVZR


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVPVZ*cplcFreFreVPL
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVPVZ*cplcFreFreVPR
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZ*cplcFreFreVZL
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZ*cplcFreFreVZR


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:) = -AmpC 
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_FreToFreVZ


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_FreToFreVZ(MFe,MFre,Mss,               & 
& MVP,MVZ,MFe2,MFre2,Mss2,MVP2,MVZ2,cplcFreFessL,cplcFreFessR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFressL,cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,       & 
& cplcFreFreVZR,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFre,Mss,MVP,MVZ,MFe2(3),MFre2,Mss2,MVP2,MVZ2

Complex(dp), Intent(in) :: cplcFreFessL(3),cplcFreFessR(3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFressL(3),    & 
& cplcFeFressR(3),cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR

Complex(dp), Intent(out) :: Amp(4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
! External masses 
Mex1 = MFre 
Mex2 = MFre 
Mex3 = MVZ 


! {ss, bar[Fe], bar[Fe]}
If ((Include_in_loopss).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = Mss 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFreFessL(i2)
coup1R = cplcFreFessR(i2)
coup2L = cplcFeFressL(i3)
coup2R = cplcFeFressR(i3)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VP, bar[Fre], bar[Fre]}
If ((Include_in_loopVP).and.(Include_in_loopFre).and.(Include_in_loopFre)) Then 
ML1 = MVP 
ML2 = MFre 
ML3 = MFre 
coup1L = cplcFreFreVPL
coup1R = cplcFreFreVPR
coup2L = cplcFreFreVPL
coup2R = cplcFreFreVPR
coup3L = cplcFreFreVZL
coup3R = cplcFreFreVZR
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VZ, bar[Fre], bar[Fre]}
If ((Include_in_loopVZ).and.(Include_in_loopFre).and.(Include_in_loopFre)) Then 
ML1 = MVZ 
ML2 = MFre 
ML3 = MFre 
coup1L = cplcFreFreVZL
coup1R = cplcFreFreVZR
coup2L = cplcFreFreVZL
coup2R = cplcFreFreVZR
coup3L = cplcFreFreVZL
coup3R = cplcFreFreVZR
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_FreToFreVZ


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_FreToFreVZ(MFe,MFre,Mss,            & 
& MVP,MVZ,MFe2,MFre2,Mss2,MVP2,MVZ2,cplcFreFessL,cplcFreFessR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFressL,cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,       & 
& cplcFreFreVZR,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFre,Mss,MVP,MVZ,MFe2(3),MFre2,Mss2,MVP2,MVZ2

Complex(dp), Intent(in) :: cplcFreFessL(3),cplcFreFessR(3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFressL(3),    & 
& cplcFeFressR(3),cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR

Complex(dp), Intent(out) :: Amp(4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFre 
Mex2 = MFre 
Mex3 = MVZ 


! {VP, bar[Fre], bar[Fre]}
If ((Include_in_loopVP).and.(Include_in_loopFre).and.(Include_in_loopFre)) Then 
ML1 = MVP 
ML2 = MFre 
ML3 = MFre 
coup1L = cplcFreFreVPL
coup1R = cplcFreFreVPR
coup2L = cplcFreFreVPL
coup2R = cplcFreFreVPR
coup3L = cplcFreFreVZL
coup3R = cplcFreFreVZR
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_FreToFreVZ


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_FreToFreAh(MAh,MAh2,MFre,MFre2,          & 
& ZfAh,Zfed,Zfeu,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MAh2,MFre,MFre2

Complex(dp), Intent(in) :: ZfAh,Zfed,Zfeu

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = MFre 
Mex2 = MFre 
Mex3 = MAh 
ZcoupT1L = 0._dp 
ZcoupT1R = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
! Vanishing 
Amp(:) = 0._dp
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_FreToFreAh


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_FreToFreAh(MAh,MFe,MFre,               & 
& Mss,MAh2,MFe2,MFre2,Mss2,cplcFeFeAhL,cplcFeFeAhR,cplcFreFessL,cplcFreFessR,            & 
& cplcFeFressL,cplcFeFressR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFe(3),MFre,Mss,MAh2,MFe2(3),MFre2,Mss2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFreFessL(3),cplcFreFessR(3),cplcFeFressL(3),    & 
& cplcFeFressR(3)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
! External masses 
Mex1 = MFre 
Mex2 = MFre 
Mex3 = MAh 


! {ss, bar[Fe], bar[Fe]}
If ((Include_in_loopss).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = Mss 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFreFessL(i2)
coup1R = cplcFreFessR(i2)
coup2L = cplcFeFressL(i3)
coup2R = cplcFeFressR(i3)
coup3L = cplcFeFeAhL(i2,i3)
coup3R = cplcFeFeAhR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_FreToFreAh


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_FreToFreAh(MAh,MFe,MFre,            & 
& Mss,MAh2,MFe2,MFre2,Mss2,cplcFeFeAhL,cplcFeFeAhR,cplcFreFessL,cplcFreFessR,            & 
& cplcFeFressL,cplcFeFressR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFe(3),MFre,Mss,MAh2,MFe2(3),MFre2,Mss2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFreFessL(3),cplcFreFessR(3),cplcFeFressL(3),    & 
& cplcFeFressR(3)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFre 
Mex2 = MFre 
Mex3 = MAh 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_FreToFreAh


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_FreToFrehh(MFre,MFre2,Mhh,               & 
& Mhh2,Zfed,Zfeu,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MFre,MFre2,Mhh,Mhh2

Complex(dp), Intent(in) :: Zfed,Zfeu,Zfhh

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = MFre 
Mex2 = MFre 
Mex3 = Mhh 
ZcoupT1L = 0._dp 
ZcoupT1R = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
! Vanishing 
Amp(:) = 0._dp
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_FreToFrehh


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_FreToFrehh(MFe,MFre,Mhh,               & 
& Mss,MVZ,MFe2,MFre2,Mhh2,Mss2,MVZ2,cplcFeFehhL,cplcFeFehhR,cplcFreFessL,cplcFreFessR,   & 
& cplcFeFressL,cplcFeFressR,cplcFreFreVZL,cplcFreFreVZR,cplhhssss,cplhhVZVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFre,Mhh,Mss,MVZ,MFe2(3),MFre2,Mhh2,Mss2,MVZ2

Complex(dp), Intent(in) :: cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFreFessL(3),cplcFreFessR(3),cplcFeFressL(3),    & 
& cplcFeFressR(3),cplcFreFreVZL,cplcFreFreVZR,cplhhssss,cplhhVZVZ

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
! External masses 
Mex1 = MFre 
Mex2 = MFre 
Mex3 = Mhh 


! {Fe, ss, ss}
If ((Include_in_loopFe).and.(Include_in_loopss).and.(Include_in_loopss)) Then 
Do i1=1,3
ML1 = MFe(i1) 
ML2 = Mss 
ML3 = Mss 
coup1L = cplcFreFessL(i1)
coup1R = cplcFreFessR(i1)
coup2L = cplcFeFressL(i1)
coup2R = cplcFeFressR(i1)
coup3 = cplhhssss
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fre, VZ, VZ}
If ((Include_in_loopFre).and.(Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MFre 
ML2 = MVZ 
ML3 = MVZ 
coup1L = cplcFreFreVZL
coup1R = cplcFreFreVZR
coup2L = cplcFreFreVZL
coup2R = cplcFreFreVZR
coup3 = cplhhVZVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {ss, bar[Fe], bar[Fe]}
If ((Include_in_loopss).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = Mss 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFreFessL(i2)
coup1R = cplcFreFessR(i2)
coup2L = cplcFeFressL(i3)
coup2R = cplcFeFressR(i3)
coup3L = cplcFeFehhL(i2,i3)
coup3R = cplcFeFehhR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_FreToFrehh


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_FreToFrehh(MFe,MFre,Mhh,            & 
& Mss,MVZ,MFe2,MFre2,Mhh2,Mss2,MVZ2,cplcFeFehhL,cplcFeFehhR,cplcFreFessL,cplcFreFessR,   & 
& cplcFeFressL,cplcFeFressR,cplcFreFreVZL,cplcFreFreVZR,cplhhssss,cplhhVZVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFre,Mhh,Mss,MVZ,MFe2(3),MFre2,Mhh2,Mss2,MVZ2

Complex(dp), Intent(in) :: cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFreFessL(3),cplcFreFessR(3),cplcFeFressL(3),    & 
& cplcFeFressR(3),cplcFreFreVZL,cplcFreFreVZR,cplhhssss,cplhhVZVZ

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFre 
Mex2 = MFre 
Mex3 = Mhh 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_FreToFrehh


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_FreToFreVP(cplcFreFreVPL,cplcFreFreVPR,  & 
& cplcFreFreVZL,cplcFreFreVZR,ctcplcFreFreVPL,ctcplcFreFreVPR,ctcplcFreFreVZL,           & 
& ctcplcFreFreVZR,MFre,MFre2,MVP,MVP2,Zfed,Zfeu,ZfVP,ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: MFre,MFre2,MVP,MVP2

Complex(dp), Intent(in) :: cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR

Complex(dp), Intent(in) :: ctcplcFreFreVPL,ctcplcFreFreVPR,ctcplcFreFreVZL,ctcplcFreFreVZR

Complex(dp), Intent(in) :: Zfed,Zfeu,ZfVP,ZfVZVP

Complex(dp), Intent(out) :: Amp(4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = MFre 
Mex2 = MFre 
Mex3 = MVP 
ZcoupT1L = 0._dp 
ZcoupT1R = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(Zfeu)*cplcFreFreVPL
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfed*cplcFreFreVPR


! External Field 2 
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfeu*cplcFreFreVPL
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(Zfed)*cplcFreFreVPR


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZVP*cplcFreFreVZL
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZVP*cplcFreFreVZR


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:) = -AmpC 
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_FreToFreVP


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_FreToFreVP(MFe,MFre,Mss,               & 
& MVP,MVZ,MFe2,MFre2,Mss2,MVP2,MVZ2,cplcFreFessL,cplcFreFessR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFressL,cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,       & 
& cplcFreFreVZR,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFre,Mss,MVP,MVZ,MFe2(3),MFre2,Mss2,MVP2,MVZ2

Complex(dp), Intent(in) :: cplcFreFessL(3),cplcFreFessR(3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFressL(3),    & 
& cplcFeFressR(3),cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR

Complex(dp), Intent(out) :: Amp(4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
! External masses 
Mex1 = MFre 
Mex2 = MFre 
Mex3 = MVP 


! {ss, bar[Fe], bar[Fe]}
If ((Include_in_loopss).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = Mss 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFreFessL(i2)
coup1R = cplcFreFessR(i2)
coup2L = cplcFeFressL(i3)
coup2R = cplcFeFressR(i3)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VP, bar[Fre], bar[Fre]}
If ((Include_in_loopVP).and.(Include_in_loopFre).and.(Include_in_loopFre)) Then 
ML1 = MVP 
ML2 = MFre 
ML3 = MFre 
coup1L = cplcFreFreVPL
coup1R = cplcFreFreVPR
coup2L = cplcFreFreVPL
coup2R = cplcFreFreVPR
coup3L = cplcFreFreVPL
coup3R = cplcFreFreVPR
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VZ, bar[Fre], bar[Fre]}
If ((Include_in_loopVZ).and.(Include_in_loopFre).and.(Include_in_loopFre)) Then 
ML1 = MVZ 
ML2 = MFre 
ML3 = MFre 
coup1L = cplcFreFreVZL
coup1R = cplcFreFreVZR
coup2L = cplcFreFreVZL
coup2R = cplcFreFreVZR
coup3L = cplcFreFreVPL
coup3R = cplcFreFreVPR
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_FreToFreVP


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_FreToFreVP(MFe,MFre,Mss,            & 
& MVP,MVZ,MFe2,MFre2,Mss2,MVP2,MVZ2,cplcFreFessL,cplcFreFessR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFressL,cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,       & 
& cplcFreFreVZR,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFre,Mss,MVP,MVZ,MFe2(3),MFre2,Mss2,MVP2,MVZ2

Complex(dp), Intent(in) :: cplcFreFessL(3),cplcFreFessR(3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFressL(3),    & 
& cplcFeFressR(3),cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR

Complex(dp), Intent(out) :: Amp(4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFre 
Mex2 = MFre 
Mex3 = MVP 


! {VP, bar[Fre], bar[Fre]}
If ((Include_in_loopVP).and.(Include_in_loopFre).and.(Include_in_loopFre)) Then 
ML1 = MVP 
ML2 = MFre 
ML3 = MFre 
coup1L = cplcFreFreVPL
coup1R = cplcFreFreVPR
coup2L = cplcFreFreVPL
coup2R = cplcFreFreVPR
coup3L = cplcFreFreVPL
coup3R = cplcFreFreVPR
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_FreToFreVP



End Module OneLoopDecay_Fre_SimplifiedDMSSSFDM
