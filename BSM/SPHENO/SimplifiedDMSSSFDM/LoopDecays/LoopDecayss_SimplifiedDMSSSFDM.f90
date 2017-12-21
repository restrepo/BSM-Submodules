! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 0:32 on 21.12.2017   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecay_ss_SimplifiedDMSSSFDM
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

Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_ssTocFreFe(cplcFreFessL,cplcFreFessR,    & 
& MFe,MFre,Mss,MFe2,MFre2,Mss2,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFre,Mss,MFe2(3),MFre2,Mss2

Complex(dp), Intent(in) :: cplcFreFessL(3),cplcFreFessR(3)

Complex(dp) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

    Do gt3=1,3
! External masses 
Mex1 = Mss 
Mex2 = MFre 
Mex3 = MFe(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFreFessL(gt3)
coupT1R = cplcFreFessR(gt3)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt3) = AmpC 
    End Do
End Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_ssTocFreFe


Subroutine Gamma_Real_SimplifiedDMSSSFDM_ssTocFreFe(MLambda,em,gs,cplcFreFessL,       & 
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
 
    Do i3=1,3
CoupL = cplcFreFessL(i3)
CoupR = cplcFreFessR(i3)
Mex1 = Mss
Mex2 = MFre
Mex3 = MFe(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp,-1._dp,1._dp,CoupL,CoupR,Gammarealphoton(i3),kont)
  GammarealGluon(i3) = 0._dp 
Else 
  GammarealGluon(i3) = 0._dp 
  GammarealPhoton(i3) = 0._dp 

End if 
    End Do
End Subroutine Gamma_Real_SimplifiedDMSSSFDM_ssTocFreFe


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_ssTocFreFe(cplcFreFessL,cplcFreFessR,    & 
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

    Do gt3=1,3
! External masses 
Mex1 = Mss 
Mex2 = MFre 
Mex3 = MFe(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFreFessL(gt3) 
ZcoupT1R = ctcplcFreFessR(gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfss*cplcFreFessL(gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfss*cplcFreFessR(gt3)


! External Field 2 
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfed*cplcFreFessL(gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(Zfeu)*cplcFreFessR(gt3)


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfEL(i1,gt3)*cplcFreFessL(i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfER(i1,gt3))*cplcFreFessR(i1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt3) = AmpC 
    End Do
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_ssTocFreFe


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_ssTocFreFe(MFe,MFre,Mhh,               & 
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
    Do gt3=1,3
Amp(:,gt3) = 0._dp 
! External masses 
Mex1 = Mss 
Mex2 = MFre 
Mex3 = MFe(gt3) 


! {ss, hh, Fe}
If ((Include_in_loopss).and.(Include_in_loophh).and.(Include_in_loopFe)) Then 
    Do i3=1,3
ML1 = Mss 
ML2 = Mhh 
ML3 = MFe(i3) 
coup1 = cplhhssss
coup2L = cplcFreFessL(i3)
coup2R = cplcFreFessR(i3)
coup3L = cplcFeFehhL(i3,gt3)
coup3R = cplcFeFehhR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt3) = Amp(:,gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {bar[Fe], bar[Fre], ss}
If ((Include_in_loopFe).and.(Include_in_loopFre).and.(Include_in_loopss)) Then 
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MFre 
ML3 = Mss 
coup1L = cplcFeFressL(i1)
coup1R = cplcFeFressR(i1)
coup2L = cplcFreFessL(i1)
coup2R = cplcFreFessR(i1)
coup3L = cplcFreFessL(gt3)
coup3R = cplcFreFessR(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt3) = Amp(:,gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {bar[Fre], bar[Fe], VP}
If ((Include_in_loopFre).and.(Include_in_loopFe).and.(Include_in_loopVP)) Then 
  Do i2=1,3
ML1 = MFre 
ML2 = MFe(i2) 
ML3 = MVP 
coup1L = cplcFreFessL(i2)
coup1R = cplcFreFessR(i2)
coup2L = cplcFreFreVPL
coup2R = cplcFreFreVPR
coup3L = cplcFeFeVPL(i2,gt3)
coup3R = cplcFeFeVPR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt3) = Amp(:,gt3) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {bar[Fre], bar[Fe], VZ}
If ((Include_in_loopFre).and.(Include_in_loopFe).and.(Include_in_loopVZ)) Then 
  Do i2=1,3
ML1 = MFre 
ML2 = MFe(i2) 
ML3 = MVZ 
coup1L = cplcFreFessL(i2)
coup1R = cplcFreFessR(i2)
coup2L = cplcFreFreVZL
coup2R = cplcFreFreVZR
coup3L = cplcFeFeVZL(i2,gt3)
coup3R = cplcFeFeVZR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt3) = Amp(:,gt3) + oo16pi2*(1)*AmpC 
  End Do
End if 
    End Do
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_ssTocFreFe


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_ssTocFreFe(MFe,MFre,Mhh,            & 
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
    Do gt3=1,3
Amp(:,gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mss 
Mex2 = MFre 
Mex3 = MFe(gt3) 


! {bar[Fre], bar[Fe], VP}
If ((Include_in_loopFre).and.(Include_in_loopFe).and.(Include_in_loopVP)) Then 
  Do i2=1,3
ML1 = MFre 
ML2 = MFe(i2) 
ML3 = MVP 
coup1L = cplcFreFessL(i2)
coup1R = cplcFreFessR(i2)
coup2L = cplcFreFreVPL
coup2R = cplcFreFreVPR
coup3L = cplcFeFeVPL(i2,gt3)
coup3R = cplcFeFeVPR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt3) = Amp(:,gt3) + oo16pi2*(1)*AmpC 
  End Do
End if 
    End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_ssTocFreFe


Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_ssTosshh(cplhhssss,Mhh,Mss,              & 
& Mhh2,Mss2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh,Mss,Mhh2,Mss2

Complex(dp), Intent(in) :: cplhhssss

Complex(dp) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

! External masses 
Mex1 = Mss 
Mex2 = Mss 
Mex3 = Mhh 
! Tree-Level Vertex 
coupT1 = cplhhssss
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp = AmpC 
End Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_ssTosshh


Subroutine Gamma_Real_SimplifiedDMSSSFDM_ssTosshh(MLambda,em,gs,cplhhssss,            & 
& Mhh,Mss,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhssss

Real(dp), Intent(in) :: Mhh,Mss

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton, GammarealGluon 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Coup = cplhhssss
Mex1 = Mss
Mex2 = Mss
Mex3 = Mhh
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton = 0._dp 
  GammarealGluon = 0._dp 
Else 
  GammarealGluon = 0._dp 
  GammarealPhoton = 0._dp 

End if 
End Subroutine Gamma_Real_SimplifiedDMSSSFDM_ssTosshh


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_ssTosshh(cplhhssss,ctcplhhssss,          & 
& Mhh,Mhh2,Mss,Mss2,Zfhh,Zfss,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh,Mhh2,Mss,Mss2

Complex(dp), Intent(in) :: cplhhssss

Complex(dp), Intent(in) :: ctcplhhssss

Complex(dp), Intent(in) :: Zfhh,Zfss

Complex(dp), Intent(out) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = Mss 
Mex2 = Mss 
Mex3 = Mhh 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhssss 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfss*cplhhssss


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfss*cplhhssss


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh*cplhhssss


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp = AmpC 
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_ssTosshh


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_ssTosshh(MAh,MFe,MFre,Mhh,             & 
& MHp,Mss,MAh2,MFe2,MFre2,Mhh2,MHp2,Mss2,cplAhAhhh,cplcFeFehhL,cplcFeFehhR,              & 
& cplcFreFessL,cplcFreFessR,cplcFeFressL,cplcFeFressR,cplhhhhhh,cplhhHpcHp,              & 
& cplhhssss,cplAhAhssss1,cplhhhhssss1,cplHpsssscHp1,cplssssssss1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFe(3),MFre,Mhh,MHp,Mss,MAh2,MFe2(3),MFre2,Mhh2,MHp2,Mss2

Complex(dp), Intent(in) :: cplAhAhhh,cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFreFessL(3),cplcFreFessR(3),          & 
& cplcFeFressL(3),cplcFeFressR(3),cplhhhhhh,cplhhHpcHp,cplhhssss,cplAhAhssss1,           & 
& cplhhhhssss1,cplHpsssscHp1,cplssssssss1

Complex(dp), Intent(out) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp = 0._dp 
! External masses 
Mex1 = Mss 
Mex2 = Mss 
Mex3 = Mhh 


! {Fre, Fe, Fe}
If ((Include_in_loopFre).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MFre 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFressL(i2)
coup1R = cplcFeFressR(i2)
coup2L = cplcFreFessL(i3)
coup2R = cplcFreFessR(i3)
coup3L = cplcFeFehhL(i3,i2)
coup3R = cplcFeFehhR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {hh, ss, ss}
If ((Include_in_loophh).and.(Include_in_loopss).and.(Include_in_loopss)) Then 
ML1 = Mhh 
ML2 = Mss 
ML3 = Mss 
coup1 = cplhhssss
coup2 = cplhhssss
coup3 = cplhhssss
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {ss, hh, hh}
If ((Include_in_loopss).and.(Include_in_loophh).and.(Include_in_loophh)) Then 
ML1 = Mss 
ML2 = Mhh 
ML3 = Mhh 
coup1 = cplhhssss
coup2 = cplhhssss
coup3 = cplhhhhhh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {bar[Fre], bar[Fe], bar[Fe]}
If ((Include_in_loopFre).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MFre 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFreFessL(i2)
coup1R = cplcFreFessR(i2)
coup2L = cplcFeFressL(i3)
coup2R = cplcFeFressR(i3)
coup3L = cplcFeFehhL(i2,i3)
coup3R = cplcFeFehhR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {hh, ss}
If ((Include_in_loophh).and.(Include_in_loopss)) Then 
ML1 = Mhh 
ML2 = Mss 
coup1 = cplhhssss
coup2 = cplhhhhssss1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {hh, ss}
If ((Include_in_loophh).and.(Include_in_loopss)) Then 
ML1 = Mhh 
ML2 = Mss 
coup1 = cplhhhhssss1
coup2 = cplhhssss
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhssss1
coup2 = cplAhAhhh
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 

End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
ML1 = Mhh 
ML2 = Mhh 
coup1 = cplhhhhssss1
coup2 = cplhhhhhh
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 

End if 


! {Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
coup1 = cplHpsssscHp1
coup2 = cplhhHpcHp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

End if 


! {ss, ss}
If ((Include_in_loopss).and.(Include_in_loopss)) Then 
ML1 = Mss 
ML2 = Mss 
coup1 = cplssssssss1
coup2 = cplhhssss
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 

End if 
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_ssTosshh


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_ssTosshh(MAh,MFe,MFre,              & 
& Mhh,MHp,Mss,MAh2,MFe2,MFre2,Mhh2,MHp2,Mss2,cplAhAhhh,cplcFeFehhL,cplcFeFehhR,          & 
& cplcFreFessL,cplcFreFessR,cplcFeFressL,cplcFeFressR,cplhhhhhh,cplhhHpcHp,              & 
& cplhhssss,cplAhAhssss1,cplhhhhssss1,cplHpsssscHp1,cplssssssss1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFe(3),MFre,Mhh,MHp,Mss,MAh2,MFe2(3),MFre2,Mhh2,MHp2,Mss2

Complex(dp), Intent(in) :: cplAhAhhh,cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFreFessL(3),cplcFreFessR(3),          & 
& cplcFeFressL(3),cplcFeFressR(3),cplhhhhhh,cplhhHpcHp,cplhhssss,cplAhAhssss1,           & 
& cplhhhhssss1,cplHpsssscHp1,cplssssssss1

Complex(dp), Intent(out) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mss 
Mex2 = Mss 
Mex3 = Mhh 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_ssTosshh


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_ssToAhss(MAh,MAh2,Mss,Mss2,              & 
& ZfAh,Zfss,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MAh2,Mss,Mss2

Complex(dp), Intent(in) :: ZfAh,Zfss

Complex(dp), Intent(out) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = Mss 
Mex2 = MAh 
Mex3 = Mss 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
! Vanishing 
Amp = 0._dp
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_ssToAhss


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_ssToAhss(MAh,MFe,MFre,Mss,             & 
& MAh2,MFe2,MFre2,Mss2,cplcFeFeAhL,cplcFeFeAhR,cplcFreFessL,cplcFreFessR,cplcFeFressL,   & 
& cplcFeFressR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFe(3),MFre,Mss,MAh2,MFe2(3),MFre2,Mss2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFreFessL(3),cplcFreFessR(3),cplcFeFressL(3),    & 
& cplcFeFressR(3)

Complex(dp), Intent(out) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp = 0._dp 
! External masses 
Mex1 = Mss 
Mex2 = MAh 
Mex3 = Mss 


! {Fe, Fre, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFre).and.(Include_in_loopFe)) Then 
Do i1=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFre 
ML3 = MFe(i3) 
coup1L = cplcFreFessL(i1)
coup1R = cplcFreFessR(i1)
coup2L = cplcFeFeAhL(i1,i3)
coup2R = cplcFeFeAhR(i1,i3)
coup3L = cplcFeFressL(i3)
coup3R = cplcFeFressR(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {bar[Fe], bar[Fre], bar[Fe]}
If ((Include_in_loopFe).and.(Include_in_loopFre).and.(Include_in_loopFe)) Then 
Do i1=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFre 
ML3 = MFe(i3) 
coup1L = cplcFeFressL(i1)
coup1R = cplcFeFressR(i1)
coup2L = cplcFeFeAhL(i3,i1)
coup2R = cplcFeFeAhR(i3,i1)
coup3L = cplcFreFessL(i3)
coup3R = cplcFreFessR(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_ssToAhss


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_ssToAhss(MAh,MFe,MFre,              & 
& Mss,MAh2,MFe2,MFre2,Mss2,cplcFeFeAhL,cplcFeFeAhR,cplcFreFessL,cplcFreFessR,            & 
& cplcFeFressL,cplcFeFressR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFe(3),MFre,Mss,MAh2,MFe2(3),MFre2,Mss2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFreFessL(3),cplcFreFessR(3),cplcFeFressL(3),    & 
& cplcFeFressR(3)

Complex(dp), Intent(out) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mss 
Mex2 = MAh 
Mex3 = Mss 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_ssToAhss


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_ssTossVP(Mss,Mss2,MVP,MVP2,              & 
& Zfss,ZfVP,Amp)

Implicit None

Real(dp), Intent(in) :: Mss,Mss2,MVP,MVP2

Complex(dp), Intent(in) :: Zfss,ZfVP

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = Mss 
Mex2 = Mss 
Mex3 = MVP 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
Amp(:) = 0._dp
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_ssTossVP


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_ssTossVP(MFe,MFre,Mss,MVP,             & 
& MFe2,MFre2,Mss2,MVP2,cplcFreFessL,cplcFreFessR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFressL,   & 
& cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFre,Mss,MVP,MFe2(3),MFre2,Mss2,MVP2

Complex(dp), Intent(in) :: cplcFreFessL(3),cplcFreFessR(3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFressL(3),    & 
& cplcFeFressR(3),cplcFreFreVPL,cplcFreFreVPR

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
! External masses 
Mex1 = Mss 
Mex2 = Mss 
Mex3 = MVP 


! {Fe, Fre, Fre}
If ((Include_in_loopFe).and.(Include_in_loopFre).and.(Include_in_loopFre)) Then 
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MFre 
ML3 = MFre 
coup1L = cplcFreFessL(i1)
coup1R = cplcFreFessR(i1)
coup2L = cplcFeFressL(i1)
coup2R = cplcFeFressR(i1)
coup3L = cplcFreFreVPL
coup3R = cplcFreFreVPR
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fre, Fe, Fe}
If ((Include_in_loopFre).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MFre 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFressL(i2)
coup1R = cplcFeFressR(i2)
coup2L = cplcFreFessL(i3)
coup2R = cplcFreFessR(i3)
coup3L = -cplcFeFeVPR(i3,i2)
coup3R = -cplcFeFeVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {bar[Fe], bar[Fre], bar[Fre]}
If ((Include_in_loopFe).and.(Include_in_loopFre).and.(Include_in_loopFre)) Then 
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MFre 
ML3 = MFre 
coup1L = cplcFeFressL(i1)
coup1R = cplcFeFressR(i1)
coup2L = cplcFreFessL(i1)
coup2R = cplcFreFessR(i1)
coup3L = cplcFreFreVPL
coup3R = cplcFreFreVPR
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do
End if 


! {bar[Fre], bar[Fe], bar[Fe]}
If ((Include_in_loopFre).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MFre 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFreFessL(i2)
coup1R = cplcFreFessR(i2)
coup2L = cplcFeFressL(i3)
coup2R = cplcFeFressR(i3)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_ssTossVP


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_ssTossVP(MFe,MFre,Mss,              & 
& MVP,MFe2,MFre2,Mss2,MVP2,cplcFreFessL,cplcFreFessR,cplcFeFeVPL,cplcFeFeVPR,            & 
& cplcFeFressL,cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFre,Mss,MVP,MFe2(3),MFre2,Mss2,MVP2

Complex(dp), Intent(in) :: cplcFreFessL(3),cplcFreFessR(3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFressL(3),    & 
& cplcFeFressR(3),cplcFreFreVPL,cplcFreFreVPR

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
Mex1 = Mss 
Mex2 = Mss 
Mex3 = MVP 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_ssTossVP


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_ssTossVZ(Mss,Mss2,MVZ,MVZ2,              & 
& Zfss,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: Mss,Mss2,MVZ,MVZ2

Complex(dp), Intent(in) :: Zfss,ZfVZ

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = Mss 
Mex2 = Mss 
Mex3 = MVZ 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
Amp(:) = 0._dp
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_ssTossVZ


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_ssTossVZ(MFe,MFre,Mss,MVZ,             & 
& MFe2,MFre2,Mss2,MVZ2,cplcFreFessL,cplcFreFessR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFressL,   & 
& cplcFeFressR,cplcFreFreVZL,cplcFreFreVZR,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFre,Mss,MVZ,MFe2(3),MFre2,Mss2,MVZ2

Complex(dp), Intent(in) :: cplcFreFessL(3),cplcFreFessR(3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFressL(3),    & 
& cplcFeFressR(3),cplcFreFreVZL,cplcFreFreVZR

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
! External masses 
Mex1 = Mss 
Mex2 = Mss 
Mex3 = MVZ 


! {Fe, Fre, Fre}
If ((Include_in_loopFe).and.(Include_in_loopFre).and.(Include_in_loopFre)) Then 
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MFre 
ML3 = MFre 
coup1L = cplcFreFessL(i1)
coup1R = cplcFreFessR(i1)
coup2L = cplcFeFressL(i1)
coup2R = cplcFeFressR(i1)
coup3L = cplcFreFreVZL
coup3R = cplcFreFreVZR
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fre, Fe, Fe}
If ((Include_in_loopFre).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MFre 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFressL(i2)
coup1R = cplcFeFressR(i2)
coup2L = cplcFreFessL(i3)
coup2R = cplcFreFessR(i3)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {bar[Fe], bar[Fre], bar[Fre]}
If ((Include_in_loopFe).and.(Include_in_loopFre).and.(Include_in_loopFre)) Then 
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MFre 
ML3 = MFre 
coup1L = cplcFeFressL(i1)
coup1R = cplcFeFressR(i1)
coup2L = cplcFreFessL(i1)
coup2R = cplcFreFessR(i1)
coup3L = cplcFreFreVZL
coup3R = cplcFreFreVZR
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do
End if 


! {bar[Fre], bar[Fe], bar[Fe]}
If ((Include_in_loopFre).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,3
    Do i3=1,3
ML1 = MFre 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFreFessL(i2)
coup1R = cplcFreFessR(i2)
coup2L = cplcFeFressL(i3)
coup2R = cplcFeFressR(i3)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_ssTossVZ


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_ssTossVZ(MFe,MFre,Mss,              & 
& MVZ,MFe2,MFre2,Mss2,MVZ2,cplcFreFessL,cplcFreFessR,cplcFeFeVZL,cplcFeFeVZR,            & 
& cplcFeFressL,cplcFeFressR,cplcFreFreVZL,cplcFreFreVZR,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFre,Mss,MVZ,MFe2(3),MFre2,Mss2,MVZ2

Complex(dp), Intent(in) :: cplcFreFessL(3),cplcFreFessR(3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFressL(3),    & 
& cplcFeFressR(3),cplcFreFreVZL,cplcFreFreVZR

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
Mex1 = Mss 
Mex2 = Mss 
Mex3 = MVZ 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_ssTossVZ



End Module OneLoopDecay_ss_SimplifiedDMSSSFDM
