! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 22:53 on 25.10.2017   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecay_hh_THDMIIIHB
Use Control 
Use Settings 
Use LoopFunctions 
Use AddLoopFunctions 
Use Model_Data_THDMIIIHB 
Use DecayFFS 
Use DecayFFV 
Use DecaySSS 
Use DecaySFF 
Use DecaySSV 
Use DecaySVV 
Use Bremsstrahlung 

Contains 

Subroutine Amplitude_Tree_THDMIIIHB_hhToAhAh(cplAhAhhh,MAh,Mhh,MAh2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,Mhh(2),MAh2,Mhh2(2)

Complex(dp), Intent(in) :: cplAhAhhh(2)

Complex(dp) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh 
Mex3 = MAh 
! Tree-Level Vertex 
coupT1 = cplAhAhhh(gt1)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1) = AmpC 
End Do
End Subroutine Amplitude_Tree_THDMIIIHB_hhToAhAh


Subroutine Gamma_Real_THDMIIIHB_hhToAhAh(MLambda,em,gs,cplAhAhhh,MAh,Mhh,             & 
& GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhAhhh(2)

Real(dp), Intent(in) :: MAh,Mhh(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2), GammarealGluon(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
Coup = cplAhAhhh(i1)
Mex1 = Mhh(i1)
Mex2 = MAh
Mex3 = MAh
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i1) = 0._dp 
  GammarealGluon(i1) = 0._dp 
Else 
  GammarealGluon(i1) = 0._dp 
  GammarealPhoton(i1) = 0._dp 

End if 
End Do
End Subroutine Gamma_Real_THDMIIIHB_hhToAhAh


Subroutine Amplitude_WAVE_THDMIIIHB_hhToAhAh(cplAhAhhh,ctcplAhAhhh,MAh,               & 
& MAh2,Mhh,Mhh2,ZfAh,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MAh2,Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cplAhAhhh(2)

Complex(dp), Intent(in) :: ctcplAhAhhh(2)

Complex(dp), Intent(in) :: ZfAh,Zfhh(2,2)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh 
Mex3 = MAh 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhAhhh(gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplAhAhhh(i1)
End Do


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh*cplAhAhhh(gt1)


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh*cplAhAhhh(gt1)


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_hhToAhAh


Subroutine Amplitude_VERTEX_THDMIIIHB_hhToAhAh(MAh,MFd,MFe,MFu,Mhh,MHm,               & 
& Msigma1,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhAh,          & 
& cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,           & 
& cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFdFdhhL,            & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWmgWmhh,              & 
& cplcgWpCgWpChh,cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,       & 
& cplhhsigma1VZ,cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,cplAhAhAhAh1,cplAhAhAhhh1,            & 
& cplAhAhAhsigma11,cplAhAhhhhh1,cplAhAhhhsigma11,cplAhAhHmcHm1,cplAhAhsigma1sigma11,     & 
& cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhhhhhhh1,cplAhhhhhsigma11,cplAhhhHmcHm1,              & 
& cplAhhhsigma1sigma11,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVWm,MVZ,MAh2,MFd2(3),MFe2(3),         & 
& MFu2(3),Mhh2(2),MHm2(2),Msigma12,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhhh(2),cplAhAhsigma1,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),               & 
& cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcgWmgWmAh,      & 
& cplcgWpCgWpCAh,cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhhhVZ(2),cplAhHmcHm(2,2),           & 
& cplAhHmcVWm(2),cplAhsigma1sigma1,cplAhcHmVWm(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2), & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),           & 
& cplcgWmgWmhh(2),cplcgWpCgWpChh(2),cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),& 
& cplhhHmcVWm(2,2),cplhhsigma1sigma1(2),cplhhsigma1VZ(2),cplhhcHmVWm(2,2),               & 
& cplhhcVWmVWm(2),cplhhVZVZ(2),cplAhAhAhAh1,cplAhAhAhhh1(2),cplAhAhAhsigma11,            & 
& cplAhAhhhhh1(2,2),cplAhAhhhsigma11(2),cplAhAhHmcHm1(2,2),cplAhAhsigma1sigma11,         & 
& cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhhhhhhh1(2,2,2),cplAhhhhhsigma11(2,2),cplAhhhHmcHm1(2,2,2),& 
& cplAhhhsigma1sigma11(2)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh 
Mex3 = MAh 


! {Ah, Ah, Ah}
ML1 = MAh 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhAh
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {Ah, hh, Ah}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhAh
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, sigma1, Ah}
ML1 = MAh 
ML2 = Msigma1 
ML3 = MAh 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhAhAh
coup3 = cplAhAhsigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhhh(i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhhh(i3)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, sigma1, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhAhhh(i3)
coup3 = cplAhhhsigma1(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, VZ, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhAhhh(i3)
coup3 = cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, Ah, sigma1}
ML1 = MAh 
ML2 = MAh 
ML3 = Msigma1 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhsigma1
coup3 = cplAhAhsigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {Ah, hh, sigma1}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhsigma1
coup3 = cplAhhhsigma1(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, sigma1, sigma1}
ML1 = MAh 
ML2 = Msigma1 
ML3 = Msigma1 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhAhsigma1
coup3 = cplAhsigma1sigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdAhL(i1,i3)
coup2R = cplcFdFdAhR(i1,i3)
coup3L = cplcFdFdAhL(i3,i2)
coup3R = cplcFdFdAhR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFeAhL(i1,i3)
coup2R = cplcFeFeAhR(i1,i3)
coup3L = cplcFeFeAhL(i3,i2)
coup3R = cplcFeFeAhR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuAhL(i1,i3)
coup2R = cplcFuFuAhR(i1,i3)
coup3L = cplcFuFuAhL(i3,i2)
coup3R = cplcFuFuAhR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWm, gWm, gWm}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgWmAh
coup3 = cplcgWmgWmAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(2)*AmpC 


! {gWmC, gWmC, gWmC}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgWpCAh
coup3 = cplcgWpCgWpCAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(2)*AmpC 


! {hh, Ah, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplAhAhhh(i1)
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhAhhh(i1)
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, sigma1, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = MAh 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplAhAhhh(i1)
coup3 = cplAhAhsigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, Ah, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplAhhhhh(i1,i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, hh}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhhh(i1,i3)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, sigma1, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplAhhhhh(i1,i3)
coup3 = cplAhhhsigma1(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, Ah, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Msigma1 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplAhhhsigma1(i1)
coup3 = cplAhAhsigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, sigma1}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhsigma1(i1)
coup3 = cplAhhhsigma1(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, sigma1, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = Msigma1 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplAhhhsigma1(i1)
coup3 = cplAhsigma1sigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, VZ}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = -cplAhhhVZ(i1)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Hm, Hm}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplAhHmcHm(i3,i1)
coup3 = cplAhHmcHm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, VWm, Hm}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = -cplhhHmcVWm(gt1,i1)
coup2 = cplAhHmcHm(i3,i1)
coup3 = cplAhcHmVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, VWm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = -cplAhcHmVWm(i1)
coup3 = cplAhHmcVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {sigma1, Ah, Ah}
ML1 = Msigma1 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhAhsigma1
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {sigma1, hh, Ah}
  Do i2=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplAhAhsigma1
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {sigma1, sigma1, Ah}
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = MAh 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplAhAhsigma1
coup3 = cplAhAhsigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {sigma1, Ah, hh}
    Do i3=1,2
ML1 = Msigma1 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhhhsigma1(i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplAhhhsigma1(i3)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {sigma1, sigma1, hh}
    Do i3=1,2
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplAhhhsigma1(i3)
coup3 = cplAhhhsigma1(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, VZ, hh}
    Do i3=1,2
ML1 = Msigma1 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = cplAhhhsigma1(i3)
coup3 = cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, Ah, sigma1}
ML1 = Msigma1 
ML2 = MAh 
ML3 = Msigma1 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhsigma1sigma1
coup3 = cplAhAhsigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {sigma1, hh, sigma1}
  Do i2=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplAhsigma1sigma1
coup3 = cplAhhhsigma1(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {sigma1, sigma1, sigma1}
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = Msigma1 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplAhsigma1sigma1
coup3 = cplAhsigma1sigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {VWm, Hm, Hm}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhcHmVWm(gt1,i2)
coup2 = -cplAhHmcVWm(i3)
coup3 = cplAhHmcHm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, VWm, Hm}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = -cplAhHmcVWm(i3)
coup3 = cplAhcHmVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, Ah, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = -cplAhhhVZ(i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, sigma1, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = -cplAhhhVZ(i3)
coup3 = cplAhhhsigma1(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, VZ, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = -cplAhhhVZ(i3)
coup3 = cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[Hm], conj[VWm], conj[Hm]}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = -cplhhcHmVWm(gt1,i1)
coup2 = cplAhHmcHm(i1,i3)
coup3 = cplAhHmcVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[Hm], conj[Hm], conj[VWm]}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = -cplAhHmcVWm(i1)
coup3 = cplAhcHmVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[VWm], conj[Hm], conj[Hm]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhHmcVWm(gt1,i2)
coup2 = -cplAhcHmVWm(i3)
coup3 = cplAhHmcHm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWm], conj[VWm], conj[Hm]}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = -cplAhcHmVWm(i3)
coup3 = cplAhHmcVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhAhAh1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhAhhh1(i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, sigma1}
ML1 = MAh 
ML2 = Msigma1 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhAhAhsigma11
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhAhhhhh1(i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do


! {hh, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplAhAhhhsigma11(i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do


! {Hm, Hm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplAhAhHmcHm1(i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {sigma1, sigma1}
ML1 = Msigma1 
ML2 = Msigma1 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplAhAhsigma1sigma11
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 


! {VWm, VWm}
ML1 = MVWm 
ML2 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplAhAhcVWmVWm1
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {VZ, VZ}
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhVZVZ(gt1)
coup2 = cplAhAhVZVZ1
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhAhhh1(gt1)
coup2 = cplAhAhAh
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhAhhhhh1(gt1,i2)
coup2 = cplAhAhhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do


! {Ah, sigma1}
ML1 = MAh 
ML2 = Msigma1 
coup1 = cplAhAhhhsigma11(gt1)
coup2 = cplAhAhsigma1
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 



! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhhhhh1(gt1,i1,i2)
coup2 = cplAhhhhh(i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {hh, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
coup1 = cplAhhhhhsigma11(gt1,i1)
coup2 = cplAhhhsigma1(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

End Do


! {Hm, Hm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplAhhhHmcHm1(gt1,i1,i2)
coup2 = cplAhHmcHm(i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {sigma1, sigma1}
ML1 = Msigma1 
ML2 = Msigma1 
coup1 = cplAhhhsigma1sigma11(gt1)
coup2 = cplAhsigma1sigma1
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhAhhh1(gt1)
coup2 = cplAhAhAh
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhAhhhhh1(gt1,i2)
coup2 = cplAhAhhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do


! {Ah, sigma1}
ML1 = MAh 
ML2 = Msigma1 
coup1 = cplAhAhhhsigma11(gt1)
coup2 = cplAhAhsigma1
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 



! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhhhhh1(gt1,i1,i2)
coup2 = cplAhhhhh(i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {hh, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
coup1 = cplAhhhhhsigma11(gt1,i1)
coup2 = cplAhhhsigma1(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

End Do


! {Hm, Hm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplAhhhHmcHm1(gt1,i1,i2)
coup2 = cplAhHmcHm(i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {sigma1, sigma1}
ML1 = Msigma1 
ML2 = Msigma1 
coup1 = cplAhhhsigma1sigma11(gt1)
coup2 = cplAhsigma1sigma1
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 

End Do
End Subroutine Amplitude_VERTEX_THDMIIIHB_hhToAhAh


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhToAhAh(MAh,MFd,MFe,MFu,Mhh,MHm,            & 
& Msigma1,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhAh,          & 
& cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,           & 
& cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFdFdhhL,            & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWmgWmhh,              & 
& cplcgWpCgWpChh,cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,       & 
& cplhhsigma1VZ,cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,cplAhAhAhAh1,cplAhAhAhhh1,            & 
& cplAhAhAhsigma11,cplAhAhhhhh1,cplAhAhhhsigma11,cplAhAhHmcHm1,cplAhAhsigma1sigma11,     & 
& cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhhhhhhh1,cplAhhhhhsigma11,cplAhhhHmcHm1,              & 
& cplAhhhsigma1sigma11,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVWm,MVZ,MAh2,MFd2(3),MFe2(3),         & 
& MFu2(3),Mhh2(2),MHm2(2),Msigma12,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhhh(2),cplAhAhsigma1,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),               & 
& cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcgWmgWmAh,      & 
& cplcgWpCgWpCAh,cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhhhVZ(2),cplAhHmcHm(2,2),           & 
& cplAhHmcVWm(2),cplAhsigma1sigma1,cplAhcHmVWm(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2), & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),           & 
& cplcgWmgWmhh(2),cplcgWpCgWpChh(2),cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),& 
& cplhhHmcVWm(2,2),cplhhsigma1sigma1(2),cplhhsigma1VZ(2),cplhhcHmVWm(2,2),               & 
& cplhhcVWmVWm(2),cplhhVZVZ(2),cplAhAhAhAh1,cplAhAhAhhh1(2),cplAhAhAhsigma11,            & 
& cplAhAhhhhh1(2,2),cplAhAhhhsigma11(2),cplAhAhHmcHm1(2,2),cplAhAhsigma1sigma11,         & 
& cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhhhhhhh1(2,2,2),cplAhhhhhsigma11(2,2),cplAhhhHmcHm1(2,2,2),& 
& cplAhhhsigma1sigma11(2)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh 
Mex3 = MAh 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhToAhAh


Subroutine Amplitude_Tree_THDMIIIHB_hhTohhAh(cplAhhhhh,MAh,Mhh,MAh2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,Mhh(2),MAh2,Mhh2(2)

Complex(dp), Intent(in) :: cplAhhhhh(2,2)

Complex(dp) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MAh 
! Tree-Level Vertex 
coupT1 = cplAhhhhh(gt1,gt2)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_THDMIIIHB_hhTohhAh


Subroutine Gamma_Real_THDMIIIHB_hhTohhAh(MLambda,em,gs,cplAhhhhh,MAh,Mhh,             & 
& GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhhhhh(2,2)

Real(dp), Intent(in) :: MAh,Mhh(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,2), GammarealGluon(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
  Do i2=1,2
Coup = cplAhhhhh(i1,i2)
Mex1 = Mhh(i1)
Mex2 = Mhh(i2)
Mex3 = MAh
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i1,i2) = 0._dp 
  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_THDMIIIHB_hhTohhAh


Subroutine Amplitude_WAVE_THDMIIIHB_hhTohhAh(cplAhhhhh,ctcplAhhhhh,MAh,               & 
& MAh2,Mhh,Mhh2,ZfAh,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MAh2,Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cplAhhhhh(2,2)

Complex(dp), Intent(in) :: ctcplAhhhhh(2,2)

Complex(dp), Intent(in) :: ZfAh,Zfhh(2,2)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MAh 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhhhhh(gt1,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplAhhhhh(i1,gt2)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt2)*cplAhhhhh(gt1,i1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh*cplAhhhhh(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_hhTohhAh


Subroutine Amplitude_VERTEX_THDMIIIHB_hhTohhAh(MAh,MFd,MFe,MFu,Mhh,MHm,               & 
& Msigma1,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhAh,          & 
& cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,           & 
& cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFdFdhhL,            & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWmgWmhh,              & 
& cplcgWpCgWpChh,cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,       & 
& cplhhsigma1VZ,cplhhcHmVWm,cplhhcVWmVWm,cplAhAhAhhh1,cplAhAhhhhh1,cplAhAhhhsigma11,     & 
& cplAhhhhhhh1,cplAhhhhhsigma11,cplAhhhHmcHm1,cplAhhhsigma1sigma11,cplhhhhhhhh1,         & 
& cplhhhhhhsigma11,cplhhhhHmcHm1,cplhhhhsigma1sigma11,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVWm,MVZ,MAh2,MFd2(3),MFe2(3),         & 
& MFu2(3),Mhh2(2),MHm2(2),Msigma12,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhhh(2),cplAhAhsigma1,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),               & 
& cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcgWmgWmAh,      & 
& cplcgWpCgWpCAh,cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhhhVZ(2),cplAhHmcHm(2,2),           & 
& cplAhHmcVWm(2),cplAhsigma1sigma1,cplAhcHmVWm(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2), & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),           & 
& cplcgWmgWmhh(2),cplcgWpCgWpChh(2),cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),& 
& cplhhHmcVWm(2,2),cplhhsigma1sigma1(2),cplhhsigma1VZ(2),cplhhcHmVWm(2,2),               & 
& cplhhcVWmVWm(2),cplAhAhAhhh1(2),cplAhAhhhhh1(2,2),cplAhAhhhsigma11(2),cplAhhhhhhh1(2,2,2),& 
& cplAhhhhhsigma11(2,2),cplAhhhHmcHm1(2,2,2),cplAhhhsigma1sigma11(2),cplhhhhhhhh1(2,2,2,2),& 
& cplhhhhhhsigma11(2,2,2),cplhhhhHmcHm1(2,2,2,2),cplhhhhsigma1sigma11(2,2)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(gt1, gt2) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MAh 


! {Ah, Ah, Ah}
ML1 = MAh 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhhh(gt2)
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {Ah, hh, Ah}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhhh(gt2)
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, sigma1, Ah}
ML1 = MAh 
ML2 = Msigma1 
ML3 = MAh 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhAhhh(gt2)
coup3 = cplAhAhsigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhhhhh(gt2,i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhhhhh(gt2,i3)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, sigma1, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhhhhh(gt2,i3)
coup3 = cplAhhhsigma1(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, VZ, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhhhhh(gt2,i3)
coup3 = cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, Ah, sigma1}
ML1 = MAh 
ML2 = MAh 
ML3 = Msigma1 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhhhsigma1(gt2)
coup3 = cplAhAhsigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {Ah, hh, sigma1}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhhhsigma1(gt2)
coup3 = cplAhhhsigma1(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, sigma1, sigma1}
ML1 = MAh 
ML2 = Msigma1 
ML3 = Msigma1 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhhhsigma1(gt2)
coup3 = cplAhsigma1sigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {Ah, hh, VZ}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhhhVZ(gt2)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdhhL(i1,i3,gt2)
coup2R = cplcFdFdhhR(i1,i3,gt2)
coup3L = cplcFdFdAhL(i3,i2)
coup3R = cplcFdFdAhR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFehhL(i1,i3,gt2)
coup2R = cplcFeFehhR(i1,i3,gt2)
coup3L = cplcFeFeAhL(i3,i2)
coup3R = cplcFeFeAhR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuhhL(i1,i3,gt2)
coup2R = cplcFuFuhhR(i1,i3,gt2)
coup3L = cplcFuFuAhL(i3,i2)
coup3R = cplcFuFuAhR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWm, gWm, gWm}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgWmhh(gt2)
coup3 = cplcgWmgWmAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(2)*AmpC 


! {gWmC, gWmC, gWmC}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgWpChh(gt2)
coup3 = cplcgWpCgWpCAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(2)*AmpC 


! {hh, Ah, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplAhhhhh(gt2,i1)
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhhh(gt2,i1)
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, sigma1, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = MAh 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplAhhhhh(gt2,i1)
coup3 = cplAhAhsigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, Ah, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, hh}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, sigma1, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = cplAhhhsigma1(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, Ah, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Msigma1 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplhhhhsigma1(gt2,i1)
coup3 = cplAhAhsigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, sigma1}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhsigma1(gt2,i1)
coup3 = cplAhhhsigma1(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, sigma1, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = Msigma1 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplhhhhsigma1(gt2,i1)
coup3 = cplAhsigma1sigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Hm, Hm, Hm}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = cplAhHmcHm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, VWm, Hm}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = -cplhhHmcVWm(gt1,i1)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = cplAhcHmVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, VWm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = -cplhhcHmVWm(gt2,i1)
coup3 = cplAhHmcVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {sigma1, Ah, Ah}
ML1 = Msigma1 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhhhsigma1(gt2)
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {sigma1, hh, Ah}
  Do i2=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplAhhhsigma1(gt2)
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {sigma1, sigma1, Ah}
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = MAh 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplAhhhsigma1(gt2)
coup3 = cplAhAhsigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {sigma1, Ah, hh}
    Do i3=1,2
ML1 = Msigma1 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplhhhhsigma1(gt2,i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplhhhhsigma1(gt2,i3)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {sigma1, sigma1, hh}
    Do i3=1,2
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplhhhhsigma1(gt2,i3)
coup3 = cplAhhhsigma1(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, VZ, hh}
    Do i3=1,2
ML1 = Msigma1 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = cplhhhhsigma1(gt2,i3)
coup3 = cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, Ah, sigma1}
ML1 = Msigma1 
ML2 = MAh 
ML3 = Msigma1 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplhhsigma1sigma1(gt2)
coup3 = cplAhAhsigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {sigma1, hh, sigma1}
  Do i2=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplhhsigma1sigma1(gt2)
coup3 = cplAhhhsigma1(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {sigma1, sigma1, sigma1}
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = Msigma1 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplhhsigma1sigma1(gt2)
coup3 = cplAhsigma1sigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {sigma1, hh, VZ}
  Do i2=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = -cplhhsigma1VZ(gt2)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VWm, Hm, Hm}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhcHmVWm(gt1,i2)
coup2 = -cplhhHmcVWm(gt2,i3)
coup3 = cplAhHmcHm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, VWm, Hm}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = -cplhhHmcVWm(gt2,i3)
coup3 = cplAhcHmVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {VWm, Hm, VWm}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = -cplhhcHmVWm(gt1,i2)
coup2 = cplhhcVWmVWm(gt2)
coup3 = cplAhHmcVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VZ, Ah, Ah}
ML1 = MVZ 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhhhVZ(gt2)
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {VZ, sigma1, Ah}
ML1 = MVZ 
ML2 = Msigma1 
ML3 = MAh 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = cplAhhhVZ(gt2)
coup3 = cplAhAhsigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {VZ, Ah, sigma1}
ML1 = MVZ 
ML2 = MAh 
ML3 = Msigma1 
coup1 = cplAhhhVZ(gt1)
coup2 = -cplhhsigma1VZ(gt2)
coup3 = cplAhAhsigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {VZ, sigma1, sigma1}
ML1 = MVZ 
ML2 = Msigma1 
ML3 = Msigma1 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = -cplhhsigma1VZ(gt2)
coup3 = cplAhsigma1sigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {conj[Hm], conj[VWm], conj[Hm]}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = -cplhhcHmVWm(gt1,i1)
coup2 = cplhhHmcHm(gt2,i1,i3)
coup3 = cplAhHmcVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[Hm], conj[Hm], conj[VWm]}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = -cplhhHmcVWm(gt2,i1)
coup3 = cplAhcHmVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[VWm], conj[Hm], conj[Hm]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhHmcVWm(gt1,i2)
coup2 = -cplhhcHmVWm(gt2,i3)
coup3 = cplAhHmcHm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWm], conj[VWm], conj[Hm]}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = -cplhhcHmVWm(gt2,i3)
coup3 = cplAhHmcVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWm], conj[Hm], conj[VWm]}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = -cplhhHmcVWm(gt1,i2)
coup2 = cplhhcVWmVWm(gt2)
coup3 = cplAhcHmVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhAhhh1(gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhhhhh1(gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, sigma1}
ML1 = MAh 
ML2 = Msigma1 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhAhhhsigma11(gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhhhhh1(gt2,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do


! {hh, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplAhhhhhsigma11(gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Hm, Hm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplAhhhHmcHm1(gt2,i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {sigma1, sigma1}
ML1 = Msigma1 
ML2 = Msigma1 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplAhhhsigma1sigma11(gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhAhhh1(gt1)
coup2 = cplAhAhhh(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhAhhhhh1(gt1,i2)
coup2 = cplAhhhhh(gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do


! {Ah, sigma1}
ML1 = MAh 
ML2 = Msigma1 
coup1 = cplAhAhhhsigma11(gt1)
coup2 = cplAhhhsigma1(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 



! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhhhhh1(gt1,i1,i2)
coup2 = cplhhhhhh(gt2,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {hh, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
coup1 = cplAhhhhhsigma11(gt1,i1)
coup2 = cplhhhhsigma1(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Hm, Hm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplAhhhHmcHm1(gt1,i1,i2)
coup2 = cplhhHmcHm(gt2,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {sigma1, sigma1}
ML1 = Msigma1 
ML2 = Msigma1 
coup1 = cplAhhhsigma1sigma11(gt1)
coup2 = cplhhsigma1sigma1(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhhhh1(gt1,gt2)
coup2 = cplAhAhAh
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhhhhhhh1(gt1,gt2,i2)
coup2 = cplAhAhhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do


! {Ah, sigma1}
ML1 = MAh 
ML2 = Msigma1 
coup1 = cplAhhhhhsigma11(gt1,gt2)
coup2 = cplAhAhsigma1
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 



! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhhhh1(gt1,gt2,i1,i2)
coup2 = cplAhhhhh(i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {hh, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
coup1 = cplhhhhhhsigma11(gt1,gt2,i1)
coup2 = cplAhhhsigma1(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Hm, Hm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhhhHmcHm1(gt1,gt2,i1,i2)
coup2 = cplAhHmcHm(i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {sigma1, sigma1}
ML1 = Msigma1 
ML2 = Msigma1 
coup1 = cplhhhhsigma1sigma11(gt1,gt2)
coup2 = cplAhsigma1sigma1
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End Subroutine Amplitude_VERTEX_THDMIIIHB_hhTohhAh


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhTohhAh(MAh,MFd,MFe,MFu,Mhh,MHm,            & 
& Msigma1,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhAh,          & 
& cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,           & 
& cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFdFdhhL,            & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWmgWmhh,              & 
& cplcgWpCgWpChh,cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,       & 
& cplhhsigma1VZ,cplhhcHmVWm,cplhhcVWmVWm,cplAhAhAhhh1,cplAhAhhhhh1,cplAhAhhhsigma11,     & 
& cplAhhhhhhh1,cplAhhhhhsigma11,cplAhhhHmcHm1,cplAhhhsigma1sigma11,cplhhhhhhhh1,         & 
& cplhhhhhhsigma11,cplhhhhHmcHm1,cplhhhhsigma1sigma11,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVWm,MVZ,MAh2,MFd2(3),MFe2(3),         & 
& MFu2(3),Mhh2(2),MHm2(2),Msigma12,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhhh(2),cplAhAhsigma1,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),               & 
& cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcgWmgWmAh,      & 
& cplcgWpCgWpCAh,cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhhhVZ(2),cplAhHmcHm(2,2),           & 
& cplAhHmcVWm(2),cplAhsigma1sigma1,cplAhcHmVWm(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2), & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),           & 
& cplcgWmgWmhh(2),cplcgWpCgWpChh(2),cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),& 
& cplhhHmcVWm(2,2),cplhhsigma1sigma1(2),cplhhsigma1VZ(2),cplhhcHmVWm(2,2),               & 
& cplhhcVWmVWm(2),cplAhAhAhhh1(2),cplAhAhhhhh1(2,2),cplAhAhhhsigma11(2),cplAhhhhhhh1(2,2,2),& 
& cplAhhhhhsigma11(2,2),cplAhhhHmcHm1(2,2,2),cplAhhhsigma1sigma11(2),cplhhhhhhhh1(2,2,2,2),& 
& cplhhhhhhsigma11(2,2,2),cplhhhhHmcHm1(2,2,2,2),cplhhhhsigma1sigma11(2,2)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MAh 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhTohhAh


Subroutine Amplitude_Tree_THDMIIIHB_hhTosigma1Ah(cplAhhhsigma1,MAh,Mhh,               & 
& Msigma1,MAh2,Mhh2,Msigma12,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,Mhh(2),Msigma1,MAh2,Mhh2(2),Msigma12

Complex(dp), Intent(in) :: cplAhhhsigma1(2)

Complex(dp) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Msigma1 
Mex3 = MAh 
! Tree-Level Vertex 
coupT1 = cplAhhhsigma1(gt1)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1) = AmpC 
End Do
End Subroutine Amplitude_Tree_THDMIIIHB_hhTosigma1Ah


Subroutine Gamma_Real_THDMIIIHB_hhTosigma1Ah(MLambda,em,gs,cplAhhhsigma1,             & 
& MAh,Mhh,Msigma1,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhhhsigma1(2)

Real(dp), Intent(in) :: MAh,Mhh(2),Msigma1

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2), GammarealGluon(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
Coup = cplAhhhsigma1(i1)
Mex1 = Mhh(i1)
Mex2 = Msigma1
Mex3 = MAh
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i1) = 0._dp 
  GammarealGluon(i1) = 0._dp 
Else 
  GammarealGluon(i1) = 0._dp 
  GammarealPhoton(i1) = 0._dp 

End if 
End Do
End Subroutine Gamma_Real_THDMIIIHB_hhTosigma1Ah


Subroutine Amplitude_WAVE_THDMIIIHB_hhTosigma1Ah(cplAhhhsigma1,ctcplAhhhsigma1,       & 
& MAh,MAh2,Mhh,Mhh2,Msigma1,Msigma12,ZfAh,Zfhh,Zfsigma1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MAh2,Mhh(2),Mhh2(2),Msigma1,Msigma12

Complex(dp), Intent(in) :: cplAhhhsigma1(2)

Complex(dp), Intent(in) :: ctcplAhhhsigma1(2)

Complex(dp), Intent(in) :: ZfAh,Zfhh(2,2),Zfsigma1

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Msigma1 
Mex3 = MAh 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhhhsigma1(gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplAhhhsigma1(i1)
End Do


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfsigma1*cplAhhhsigma1(gt1)


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh*cplAhhhsigma1(gt1)


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_hhTosigma1Ah


Subroutine Amplitude_VERTEX_THDMIIIHB_hhTosigma1Ah(MAh,MFd,MFe,MFu,Mhh,               & 
& MHm,Msigma1,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhAh,      & 
& cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,           & 
& cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFdFdhhL,            & 
& cplcFdFdhhR,cplcFdFdsigma1L,cplcFdFdsigma1R,cplcFeFehhL,cplcFeFehhR,cplcFeFesigma1L,   & 
& cplcFeFesigma1R,cplcFuFuhhL,cplcFuFuhhR,cplcFuFusigma1L,cplcFuFusigma1R,               & 
& cplcgWmgWmhh,cplcgWmgWmsigma1,cplcgWpCgWpChh,cplcgWpCgWpCsigma1,cplhhhhhh,             & 
& cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,cplhhcHmVWm,      & 
& cplhhcVWmVWm,cplhhVZVZ,cplHmsigma1cHm,cplHmsigma1cVWm,cplsigma1sigma1sigma1,           & 
& cplsigma1cHmVWm,cplAhAhAhhh1,cplAhAhAhsigma11,cplAhAhhhhh1,cplAhAhhhsigma11,           & 
& cplAhAhsigma1sigma11,cplAhhhhhhh1,cplAhhhhhsigma11,cplAhhhHmcHm1,cplAhhhsigma1sigma11, & 
& cplAhHmsigma1cHm1,cplAhsigma1sigma1sigma11,cplhhhhhhsigma11,cplhhhhsigma1sigma11,      & 
& cplhhHmsigma1cHm1,cplhhsigma1sigma1sigma11,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVWm,MVZ,MAh2,MFd2(3),MFe2(3),         & 
& MFu2(3),Mhh2(2),MHm2(2),Msigma12,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhhh(2),cplAhAhsigma1,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),               & 
& cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcgWmgWmAh,      & 
& cplcgWpCgWpCAh,cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhhhVZ(2),cplAhHmcHm(2,2),           & 
& cplAhHmcVWm(2),cplAhsigma1sigma1,cplAhcHmVWm(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2), & 
& cplcFdFdsigma1L(3,3),cplcFdFdsigma1R(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),       & 
& cplcFeFesigma1L(3,3),cplcFeFesigma1R(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),       & 
& cplcFuFusigma1L(3,3),cplcFuFusigma1R(3,3),cplcgWmgWmhh(2),cplcgWmgWmsigma1,            & 
& cplcgWpCgWpChh(2),cplcgWpCgWpCsigma1,cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),              & 
& cplhhHmcHm(2,2,2),cplhhHmcVWm(2,2),cplhhsigma1sigma1(2),cplhhsigma1VZ(2),              & 
& cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplhhVZVZ(2),cplHmsigma1cHm(2,2),cplHmsigma1cVWm(2),  & 
& cplsigma1sigma1sigma1,cplsigma1cHmVWm(2),cplAhAhAhhh1(2),cplAhAhAhsigma11,             & 
& cplAhAhhhhh1(2,2),cplAhAhhhsigma11(2),cplAhAhsigma1sigma11,cplAhhhhhhh1(2,2,2),        & 
& cplAhhhhhsigma11(2,2),cplAhhhHmcHm1(2,2,2),cplAhhhsigma1sigma11(2),cplAhHmsigma1cHm1(2,2),& 
& cplAhsigma1sigma1sigma11,cplhhhhhhsigma11(2,2,2),cplhhhhsigma1sigma11(2,2),            & 
& cplhhHmsigma1cHm1(2,2,2),cplhhsigma1sigma1sigma11(2)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Msigma1 
Mex3 = MAh 


! {Ah, Ah, Ah}
ML1 = MAh 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhsigma1
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {Ah, hh, Ah}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhsigma1
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, sigma1, Ah}
ML1 = MAh 
ML2 = Msigma1 
ML3 = MAh 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhAhsigma1
coup3 = cplAhAhsigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhhhsigma1(i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhhhsigma1(i3)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, sigma1, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhhhsigma1(i3)
coup3 = cplAhhhsigma1(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, VZ, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhhhsigma1(i3)
coup3 = cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, Ah, sigma1}
ML1 = MAh 
ML2 = MAh 
ML3 = Msigma1 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhsigma1sigma1
coup3 = cplAhAhsigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {Ah, hh, sigma1}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhsigma1sigma1
coup3 = cplAhhhsigma1(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, sigma1, sigma1}
ML1 = MAh 
ML2 = Msigma1 
ML3 = Msigma1 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhsigma1sigma1
coup3 = cplAhsigma1sigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdsigma1L(i1,i3)
coup2R = cplcFdFdsigma1R(i1,i3)
coup3L = cplcFdFdAhL(i3,i2)
coup3R = cplcFdFdAhR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFesigma1L(i1,i3)
coup2R = cplcFeFesigma1R(i1,i3)
coup3L = cplcFeFeAhL(i3,i2)
coup3R = cplcFeFeAhR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFusigma1L(i1,i3)
coup2R = cplcFuFusigma1R(i1,i3)
coup3L = cplcFuFuAhL(i3,i2)
coup3R = cplcFuFuAhR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWm, gWm, gWm}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgWmsigma1
coup3 = cplcgWmgWmAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(2)*AmpC 


! {gWmC, gWmC, gWmC}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgWpCsigma1
coup3 = cplcgWpCgWpCAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(2)*AmpC 


! {hh, Ah, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplAhhhsigma1(i1)
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhsigma1(i1)
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, sigma1, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = MAh 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplAhhhsigma1(i1)
coup3 = cplAhAhsigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, Ah, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplhhhhsigma1(i1,i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, hh}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhsigma1(i1,i3)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, sigma1, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplhhhhsigma1(i1,i3)
coup3 = cplAhhhsigma1(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, Ah, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Msigma1 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplhhsigma1sigma1(i1)
coup3 = cplAhAhsigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, sigma1}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhsigma1sigma1(i1)
coup3 = cplAhhhsigma1(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, sigma1, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = Msigma1 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplhhsigma1sigma1(i1)
coup3 = cplAhsigma1sigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, VZ}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhsigma1VZ(i1)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Hm, Hm}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplHmsigma1cHm(i3,i1)
coup3 = cplAhHmcHm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, VWm, Hm}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = -cplhhHmcVWm(gt1,i1)
coup2 = cplHmsigma1cHm(i3,i1)
coup3 = cplAhcHmVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, VWm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = -cplsigma1cHmVWm(i1)
coup3 = cplAhHmcVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {sigma1, Ah, Ah}
ML1 = Msigma1 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhsigma1sigma1
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {sigma1, hh, Ah}
  Do i2=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplAhsigma1sigma1
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {sigma1, sigma1, Ah}
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = MAh 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplAhsigma1sigma1
coup3 = cplAhAhsigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {sigma1, Ah, hh}
    Do i3=1,2
ML1 = Msigma1 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplhhsigma1sigma1(i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplhhsigma1sigma1(i3)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {sigma1, sigma1, hh}
    Do i3=1,2
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplhhsigma1sigma1(i3)
coup3 = cplAhhhsigma1(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, VZ, hh}
    Do i3=1,2
ML1 = Msigma1 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = cplhhsigma1sigma1(i3)
coup3 = cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, Ah, sigma1}
ML1 = Msigma1 
ML2 = MAh 
ML3 = Msigma1 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplsigma1sigma1sigma1
coup3 = cplAhAhsigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {sigma1, hh, sigma1}
  Do i2=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplsigma1sigma1sigma1
coup3 = cplAhhhsigma1(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {sigma1, sigma1, sigma1}
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = Msigma1 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplsigma1sigma1sigma1
coup3 = cplAhsigma1sigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {VWm, Hm, Hm}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhcHmVWm(gt1,i2)
coup2 = cplHmsigma1cVWm(i3)
coup3 = cplAhHmcHm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, VWm, Hm}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplHmsigma1cVWm(i3)
coup3 = cplAhcHmVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, Ah, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = cplhhsigma1VZ(i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, sigma1, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = cplhhsigma1VZ(i3)
coup3 = cplAhhhsigma1(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, VZ, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplhhsigma1VZ(i3)
coup3 = cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[Hm], conj[VWm], conj[Hm]}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = -cplhhcHmVWm(gt1,i1)
coup2 = cplHmsigma1cHm(i1,i3)
coup3 = cplAhHmcVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[Hm], conj[Hm], conj[VWm]}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplHmsigma1cVWm(i1)
coup3 = cplAhcHmVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[VWm], conj[Hm], conj[Hm]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhHmcVWm(gt1,i2)
coup2 = -cplsigma1cHmVWm(i3)
coup3 = cplAhHmcHm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWm], conj[VWm], conj[Hm]}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = -cplsigma1cHmVWm(i3)
coup3 = cplAhHmcVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhAhsigma11
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhhhsigma11(i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, sigma1}
ML1 = MAh 
ML2 = Msigma1 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhAhsigma1sigma11
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhhhsigma11(i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do


! {hh, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplAhhhsigma1sigma11(i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do


! {Hm, Hm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplAhHmsigma1cHm1(i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {sigma1, sigma1}
ML1 = Msigma1 
ML2 = Msigma1 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplAhsigma1sigma1sigma11
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhAhhh1(gt1)
coup2 = cplAhAhsigma1
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhAhhhhh1(gt1,i2)
coup2 = cplAhhhsigma1(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do


! {Ah, sigma1}
ML1 = MAh 
ML2 = Msigma1 
coup1 = cplAhAhhhsigma11(gt1)
coup2 = cplAhsigma1sigma1
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 



! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhhhhh1(gt1,i1,i2)
coup2 = cplhhhhsigma1(i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {hh, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
coup1 = cplAhhhhhsigma11(gt1,i1)
coup2 = cplhhsigma1sigma1(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

End Do


! {Hm, Hm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplAhhhHmcHm1(gt1,i1,i2)
coup2 = cplHmsigma1cHm(i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {sigma1, sigma1}
ML1 = Msigma1 
ML2 = Msigma1 
coup1 = cplAhhhsigma1sigma11(gt1)
coup2 = cplsigma1sigma1sigma1
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhhsigma11(gt1)
coup2 = cplAhAhAh
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhhhhhsigma11(gt1,i2)
coup2 = cplAhAhhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do


! {Ah, sigma1}
ML1 = MAh 
ML2 = Msigma1 
coup1 = cplAhhhsigma1sigma11(gt1)
coup2 = cplAhAhsigma1
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 



! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhhsigma11(gt1,i1,i2)
coup2 = cplAhhhhh(i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {hh, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
coup1 = cplhhhhsigma1sigma11(gt1,i1)
coup2 = cplAhhhsigma1(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

End Do


! {Hm, Hm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmsigma1cHm1(gt1,i1,i2)
coup2 = cplAhHmcHm(i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {sigma1, sigma1}
ML1 = Msigma1 
ML2 = Msigma1 
coup1 = cplhhsigma1sigma1sigma11(gt1)
coup2 = cplAhsigma1sigma1
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 

End Do
End Subroutine Amplitude_VERTEX_THDMIIIHB_hhTosigma1Ah


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhTosigma1Ah(MAh,MFd,MFe,MFu,Mhh,            & 
& MHm,Msigma1,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhAh,      & 
& cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,           & 
& cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFdFdhhL,            & 
& cplcFdFdhhR,cplcFdFdsigma1L,cplcFdFdsigma1R,cplcFeFehhL,cplcFeFehhR,cplcFeFesigma1L,   & 
& cplcFeFesigma1R,cplcFuFuhhL,cplcFuFuhhR,cplcFuFusigma1L,cplcFuFusigma1R,               & 
& cplcgWmgWmhh,cplcgWmgWmsigma1,cplcgWpCgWpChh,cplcgWpCgWpCsigma1,cplhhhhhh,             & 
& cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,cplhhcHmVWm,      & 
& cplhhcVWmVWm,cplhhVZVZ,cplHmsigma1cHm,cplHmsigma1cVWm,cplsigma1sigma1sigma1,           & 
& cplsigma1cHmVWm,cplAhAhAhhh1,cplAhAhAhsigma11,cplAhAhhhhh1,cplAhAhhhsigma11,           & 
& cplAhAhsigma1sigma11,cplAhhhhhhh1,cplAhhhhhsigma11,cplAhhhHmcHm1,cplAhhhsigma1sigma11, & 
& cplAhHmsigma1cHm1,cplAhsigma1sigma1sigma11,cplhhhhhhsigma11,cplhhhhsigma1sigma11,      & 
& cplhhHmsigma1cHm1,cplhhsigma1sigma1sigma11,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVWm,MVZ,MAh2,MFd2(3),MFe2(3),         & 
& MFu2(3),Mhh2(2),MHm2(2),Msigma12,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhhh(2),cplAhAhsigma1,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),               & 
& cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcgWmgWmAh,      & 
& cplcgWpCgWpCAh,cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhhhVZ(2),cplAhHmcHm(2,2),           & 
& cplAhHmcVWm(2),cplAhsigma1sigma1,cplAhcHmVWm(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2), & 
& cplcFdFdsigma1L(3,3),cplcFdFdsigma1R(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),       & 
& cplcFeFesigma1L(3,3),cplcFeFesigma1R(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),       & 
& cplcFuFusigma1L(3,3),cplcFuFusigma1R(3,3),cplcgWmgWmhh(2),cplcgWmgWmsigma1,            & 
& cplcgWpCgWpChh(2),cplcgWpCgWpCsigma1,cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),              & 
& cplhhHmcHm(2,2,2),cplhhHmcVWm(2,2),cplhhsigma1sigma1(2),cplhhsigma1VZ(2),              & 
& cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplhhVZVZ(2),cplHmsigma1cHm(2,2),cplHmsigma1cVWm(2),  & 
& cplsigma1sigma1sigma1,cplsigma1cHmVWm(2),cplAhAhAhhh1(2),cplAhAhAhsigma11,             & 
& cplAhAhhhhh1(2,2),cplAhAhhhsigma11(2),cplAhAhsigma1sigma11,cplAhhhhhhh1(2,2,2),        & 
& cplAhhhhhsigma11(2,2),cplAhhhHmcHm1(2,2,2),cplAhhhsigma1sigma11(2),cplAhHmsigma1cHm1(2,2),& 
& cplAhsigma1sigma1sigma11,cplhhhhhhsigma11(2,2,2),cplhhhhsigma1sigma11(2,2),            & 
& cplhhHmsigma1cHm1(2,2,2),cplhhsigma1sigma1sigma11(2)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Msigma1 
Mex3 = MAh 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhTosigma1Ah


Subroutine Amplitude_Tree_THDMIIIHB_hhToAhVZ(cplAhhhVZ,MAh,Mhh,MVZ,MAh2,              & 
& Mhh2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,Mhh(2),MVZ,MAh2,Mhh2(2),MVZ2

Complex(dp), Intent(in) :: cplAhhhVZ(2)

Complex(dp) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1 = -cplAhhhVZ(gt1)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_Tree_THDMIIIHB_hhToAhVZ


Subroutine Gamma_Real_THDMIIIHB_hhToAhVZ(MLambda,em,gs,cplAhhhVZ,MAh,Mhh,             & 
& MVZ,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhhhVZ(2)

Real(dp), Intent(in) :: MAh,Mhh(2),MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2), GammarealGluon(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
Coup = cplAhhhVZ(i1)
Mex1 = Mhh(i1)
Mex2 = MAh
Mex3 = MVZ
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i1) = 0._dp 
 GammarealGluon(i1) = 0._dp 
Else 
  GammarealGluon(i1) = 0._dp 
  GammarealPhoton(i1) = 0._dp 

End if 
End Do
End Subroutine Gamma_Real_THDMIIIHB_hhToAhVZ


Subroutine Amplitude_WAVE_THDMIIIHB_hhToAhVZ(cplAhhhVZ,ctcplAhhhVZ,MAh,               & 
& MAh2,Mhh,Mhh2,MVZ,MVZ2,ZfAh,Zfhh,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MAh2,Mhh(2),Mhh2(2),MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhhhVZ(2)

Complex(dp), Intent(in) :: ctcplAhhhVZ(2)

Complex(dp), Intent(in) :: ZfAh,Zfhh(2,2),ZfVZ

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhhhVZ(gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplAhhhVZ(i1)
End Do


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh*cplAhhhVZ(gt1)


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cplAhhhVZ(gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_hhToAhVZ


Subroutine Amplitude_VERTEX_THDMIIIHB_hhToAhVZ(MAh,MFd,MFe,MFu,Mhh,MHm,               & 
& Msigma1,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhAh,          & 
& cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,           & 
& cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFdFdhhL,            & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,              & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,         & 
& cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,        & 
& cplHmcHmVZ,cplHmcVWmVZ,cplcHmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplAhHmcVWmVZ1,           & 
& cplAhcHmVWmVZ1,cplhhhhVZVZ1,cplhhHmcVWmVZ1,cplhhcHmVWmVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVWm,MVZ,MAh2,MFd2(3),MFe2(3),         & 
& MFu2(3),Mhh2(2),MHm2(2),Msigma12,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhhh(2),cplAhAhsigma1,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),               & 
& cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcgWmgWmAh,      & 
& cplcgWpCgWpCAh,cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhhhVZ(2),cplAhHmcHm(2,2),           & 
& cplAhHmcVWm(2),cplAhsigma1sigma1,cplAhcHmVWm(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2), & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),               & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),               & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWmgWmhh(2),cplcgWmgWmVZ,cplcgWpCgWpChh(2),      & 
& cplcgWpCgWpCVZ,cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),cplhhHmcVWm(2,2), & 
& cplhhsigma1sigma1(2),cplhhsigma1VZ(2),cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplhhVZVZ(2),   & 
& cplHmcHmVZ(2,2),cplHmcVWmVZ(2),cplcHmVWmVZ(2),cplcVWmVWmVZ,cplAhAhVZVZ1,               & 
& cplAhHmcVWmVZ1(2),cplAhcHmVWmVZ1(2),cplhhhhVZVZ1(2,2),cplhhHmcVWmVZ1(2,2),             & 
& cplhhcHmVWmVZ1(2,2)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh 
Mex3 = MVZ 


! {Ah, hh, Ah}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhAh
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhhh(i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, sigma1, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhAhhh(i3)
coup3 = cplhhsigma1VZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, VZ, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhAhhh(i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, sigma1}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhsigma1
coup3 = -cplhhsigma1VZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdAhL(i1,i3)
coup2R = cplcFdFdAhR(i1,i3)
coup3L = -cplcFdFdVZR(i3,i2)
coup3R = -cplcFdFdVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFeAhL(i1,i3)
coup2R = cplcFeFeAhR(i1,i3)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuAhL(i1,i3)
coup2R = cplcFuFuAhR(i1,i3)
coup3L = -cplcFuFuVZR(i3,i2)
coup3R = -cplcFuFuVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWm, gWm, gWm}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgWmAh
coup3 = cplcgWmgWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {gWmC, gWmC, gWmC}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgWpCAh
coup3 = cplcgWpCgWpCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhAhhh(i1)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, Ah, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplAhhhhh(i1,i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, sigma1, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplAhhhhh(i1,i3)
coup3 = cplhhsigma1VZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, sigma1}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhsigma1(i1)
coup3 = -cplhhsigma1VZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, hh, VZ}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhVZ(i1)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Hm, Hm}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplAhHmcHm(i3,i1)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, VWm, Hm}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = -cplhhHmcVWm(gt1,i1)
coup2 = cplAhHmcHm(i3,i1)
coup3 = cplcHmVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, VWm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplAhcHmVWm(i1)
coup3 = cplHmcVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, VWm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplhhHmcVWm(gt1,i1)
coup2 = cplAhcHmVWm(i1)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {sigma1, hh, Ah}
  Do i2=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplAhAhsigma1
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {sigma1, Ah, hh}
    Do i3=1,2
ML1 = Msigma1 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhhhsigma1(i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, sigma1, hh}
    Do i3=1,2
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplAhhhsigma1(i3)
coup3 = cplhhsigma1VZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, VZ, hh}
    Do i3=1,2
ML1 = Msigma1 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = cplAhhhsigma1(i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, hh, sigma1}
  Do i2=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplAhsigma1sigma1
coup3 = -cplhhsigma1VZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {VWm, Hm, Hm}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhcHmVWm(gt1,i2)
coup2 = cplAhHmcVWm(i3)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, VWm, Hm}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplAhHmcVWm(i3)
coup3 = cplcHmVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, Ah, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhhhVZ(i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, sigma1, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = cplAhhhVZ(i3)
coup3 = cplhhsigma1VZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, VZ, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplAhhhVZ(i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[Hm], conj[VWm], conj[Hm]}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = -cplhhcHmVWm(gt1,i1)
coup2 = cplAhHmcHm(i1,i3)
coup3 = cplHmcVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[Hm], conj[Hm], conj[VWm]}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplAhHmcVWm(i1)
coup3 = cplcHmVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], conj[VWm], conj[VWm]}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplhhcHmVWm(gt1,i1)
coup2 = cplAhHmcVWm(i1)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {conj[VWm], conj[Hm], conj[Hm]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhHmcVWm(gt1,i2)
coup2 = cplAhcHmVWm(i3)
coup3 = cplHmcHmVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWm], conj[VWm], conj[Hm]}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplAhcHmVWm(i3)
coup3 = cplHmcVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, VZ}
ML1 = MAh 
ML2 = MVZ 
coup1 = -cplAhhhVZ(gt1)
coup2 = cplAhAhVZVZ1
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {Hm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
coup1 = cplhhHmcVWm(gt1,i1)
coup2 = cplAhcHmVWmVZ1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {VWm, Hm}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
coup1 = cplhhcHmVWm(gt1,i2)
coup2 = cplAhHmcVWmVZ1(i2)
Call Amp_VERTEX_StoSV_Topology2_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {hh, VZ}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplhhhhVZVZ1(gt1,i1)
coup2 = cplAhhhVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {Hm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
coup1 = cplhhHmcVWmVZ1(gt1,i1)
coup2 = cplAhcHmVWm(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {VWm, Hm}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
coup1 = cplhhcHmVWmVZ1(gt1,i2)
coup2 = cplAhHmcVWm(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

  End Do
End Do
End Subroutine Amplitude_VERTEX_THDMIIIHB_hhToAhVZ


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhToAhVZ(MAh,MFd,MFe,MFu,Mhh,MHm,            & 
& Msigma1,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhAh,          & 
& cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,           & 
& cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFdFdhhL,            & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,              & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,         & 
& cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,        & 
& cplHmcHmVZ,cplHmcVWmVZ,cplcHmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplAhHmcVWmVZ1,           & 
& cplAhcHmVWmVZ1,cplhhhhVZVZ1,cplhhHmcVWmVZ1,cplhhcHmVWmVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVWm,MVZ,MAh2,MFd2(3),MFe2(3),         & 
& MFu2(3),Mhh2(2),MHm2(2),Msigma12,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhhh(2),cplAhAhsigma1,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),               & 
& cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcgWmgWmAh,      & 
& cplcgWpCgWpCAh,cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhhhVZ(2),cplAhHmcHm(2,2),           & 
& cplAhHmcVWm(2),cplAhsigma1sigma1,cplAhcHmVWm(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2), & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),               & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),               & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWmgWmhh(2),cplcgWmgWmVZ,cplcgWpCgWpChh(2),      & 
& cplcgWpCgWpCVZ,cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),cplhhHmcVWm(2,2), & 
& cplhhsigma1sigma1(2),cplhhsigma1VZ(2),cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplhhVZVZ(2),   & 
& cplHmcHmVZ(2,2),cplHmcVWmVZ(2),cplcHmVWmVZ(2),cplcVWmVWmVZ,cplAhAhVZVZ1,               & 
& cplAhHmcVWmVZ1(2),cplAhcHmVWmVZ1(2),cplhhhhVZVZ1(2,2),cplhhHmcVWmVZ1(2,2),             & 
& cplhhcHmVWmVZ1(2,2)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh 
Mex3 = MVZ 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhToAhVZ


Subroutine Amplitude_Tree_THDMIIIHB_hhTocFdFd(cplcFdFdhhL,cplcFdFdhhR,MFd,            & 
& Mhh,MFd2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),Mhh(2),MFd2(3),Mhh2(2)

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2)

Complex(dp) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MFd(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFdFdhhL(gt2,gt3,gt1)
coupT1R = cplcFdFdhhR(gt2,gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_THDMIIIHB_hhTocFdFd


Subroutine Gamma_Real_THDMIIIHB_hhTocFdFd(MLambda,em,gs,cplcFdFdhhL,cplcFdFdhhR,      & 
& MFd,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2)

Real(dp), Intent(in) :: MFd(3),Mhh(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,3,3), GammarealGluon(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
CoupL = cplcFdFdhhL(i2,i3,i1)
CoupR = cplcFdFdhhR(i2,i3,i1)
Mex1 = Mhh(i1)
Mex2 = MFd(i2)
Mex3 = MFd(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp/3._dp,-1._dp/3._dp,1._dp/3._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,gs,0._dp,0._dp,0._dp,4._dp,-4._dp,4._dp,CoupL,CoupR,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_THDMIIIHB_hhTocFdFd


Subroutine Amplitude_WAVE_THDMIIIHB_hhTocFdFd(cplcFdFdhhL,cplcFdFdhhR,ctcplcFdFdhhL,  & 
& ctcplcFdFdhhR,MFd,MFd2,Mhh,Mhh2,ZfDL,ZfDR,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFd2(3),Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2)

Complex(dp), Intent(in) :: ctcplcFdFdhhL(3,3,2),ctcplcFdFdhhR(3,3,2)

Complex(dp), Intent(in) :: ZfDL(3,3),ZfDR(3,3),Zfhh(2,2)

Complex(dp), Intent(out) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MFd(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFdFdhhL(gt2,gt3,gt1) 
ZcoupT1R = ctcplcFdFdhhR(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh(i1,gt1)*cplcFdFdhhL(gt2,gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh(i1,gt1)*cplcFdFdhhR(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDR(i1,gt2)*cplcFdFdhhL(i1,gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDL(i1,gt2))*cplcFdFdhhR(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDL(i1,gt3)*cplcFdFdhhL(gt2,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDR(i1,gt3))*cplcFdFdhhR(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_hhTocFdFd


Subroutine Amplitude_VERTEX_THDMIIIHB_hhTocFdFd(MAh,MFd,MFu,Mhh,MHm,Msigma1,          & 
& MVG,MVP,MVWm,MVZ,MAh2,MFd2,MFu2,Mhh2,MHm2,Msigma12,MVG2,MVP2,MVWm2,MVZ2,               & 
& cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplcFdFdhhL,       & 
& cplcFdFdhhR,cplcFdFdsigma1L,cplcFdFdsigma1R,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,       & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcHmL,cplcFuFdcHmR,cplcFuFdcVWmL,           & 
& cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHmL,cplcFdFuHmR,cplcFdFuVWmL,            & 
& cplcFdFuVWmR,cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,         & 
& cplhhsigma1VZ,cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVG,MVP,MVWm,MVZ,MAh2,MFd2(3),MFu2(3),        & 
& Mhh2(2),MHm2(2),Msigma12,MVG2,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplAhhhhh(2,2),cplAhhhsigma1(2),       & 
& cplAhhhVZ(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdsigma1L(3,3),               & 
& cplcFdFdsigma1R(3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),               & 
& cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFuFdcHmL(3,3,2),cplcFuFdcHmR(3,3,2),& 
& cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),           & 
& cplcFdFuHmL(3,3,2),cplcFdFuHmR(3,3,2),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),             & 
& cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),cplhhHmcVWm(2,2),cplhhsigma1sigma1(2),& 
& cplhhsigma1VZ(2),cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplhhVZVZ(2)

Complex(dp), Intent(out) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MFd(gt3) 


! {Ah, Ah, Fd}
    Do i3=1,3
ML1 = MAh 
ML2 = MAh 
ML3 = MFd(i3) 
coup1 = cplAhAhhh(gt1)
coup2L = cplcFdFdAhL(gt2,i3)
coup2R = cplcFdFdAhR(gt2,i3)
coup3L = cplcFdFdAhL(i3,gt3)
coup3R = cplcFdFdAhR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, Fd}
  Do i2=1,2
    Do i3=1,3
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MFd(i3) 
coup1 = cplAhhhhh(gt1,i2)
coup2L = cplcFdFdAhL(gt2,i3)
coup2R = cplcFdFdAhR(gt2,i3)
coup3L = cplcFdFdhhL(i3,gt3,i2)
coup3R = cplcFdFdhhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, sigma1, Fd}
    Do i3=1,3
ML1 = MAh 
ML2 = Msigma1 
ML3 = MFd(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2L = cplcFdFdAhL(gt2,i3)
coup2R = cplcFdFdAhR(gt2,i3)
coup3L = cplcFdFdsigma1L(i3,gt3)
coup3R = cplcFdFdsigma1R(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, VZ, Fd}
    Do i3=1,3
ML1 = MAh 
ML2 = MVZ 
ML3 = MFd(i3) 
coup1 = -cplAhhhVZ(gt1)
coup2L = cplcFdFdAhL(gt2,i3)
coup2R = cplcFdFdAhR(gt2,i3)
coup3L = cplcFdFdVZL(i3,gt3)
coup3R = cplcFdFdVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {hh, Ah, Fd}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MFd(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2L = cplcFdFdhhL(gt2,i3,i1)
coup2R = cplcFdFdhhR(gt2,i3,i1)
coup3L = cplcFdFdAhL(i3,gt3)
coup3R = cplcFdFdAhR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, Fd}
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MFd(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2L = cplcFdFdhhL(gt2,i3,i1)
coup2R = cplcFdFdhhR(gt2,i3,i1)
coup3L = cplcFdFdhhL(i3,gt3,i2)
coup3R = cplcFdFdhhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, sigma1, Fd}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = MFd(i3) 
coup1 = cplhhhhsigma1(gt1,i1)
coup2L = cplcFdFdhhL(gt2,i3,i1)
coup2R = cplcFdFdhhR(gt2,i3,i1)
coup3L = cplcFdFdsigma1L(i3,gt3)
coup3R = cplcFdFdsigma1R(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {sigma1, Ah, Fd}
    Do i3=1,3
ML1 = Msigma1 
ML2 = MAh 
ML3 = MFd(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2L = cplcFdFdsigma1L(gt2,i3)
coup2R = cplcFdFdsigma1R(gt2,i3)
coup3L = cplcFdFdAhL(i3,gt3)
coup3R = cplcFdFdAhR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, hh, Fd}
  Do i2=1,2
    Do i3=1,3
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = MFd(i3) 
coup1 = cplhhhhsigma1(gt1,i2)
coup2L = cplcFdFdsigma1L(gt2,i3)
coup2R = cplcFdFdsigma1R(gt2,i3)
coup3L = cplcFdFdhhL(i3,gt3,i2)
coup3R = cplcFdFdhhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {sigma1, sigma1, Fd}
    Do i3=1,3
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = MFd(i3) 
coup1 = cplhhsigma1sigma1(gt1)
coup2L = cplcFdFdsigma1L(gt2,i3)
coup2R = cplcFdFdsigma1R(gt2,i3)
coup3L = cplcFdFdsigma1L(i3,gt3)
coup3R = cplcFdFdsigma1R(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, VZ, Fd}
    Do i3=1,3
ML1 = Msigma1 
ML2 = MVZ 
ML3 = MFd(i3) 
coup1 = cplhhsigma1VZ(gt1)
coup2L = cplcFdFdsigma1L(gt2,i3)
coup2R = cplcFdFdsigma1R(gt2,i3)
coup3L = cplcFdFdVZL(i3,gt3)
coup3R = cplcFdFdVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, Ah, Fd}
    Do i3=1,3
ML1 = MVZ 
ML2 = MAh 
ML3 = MFd(i3) 
coup1 = -cplAhhhVZ(gt1)
coup2L = cplcFdFdVZL(gt2,i3)
coup2R = cplcFdFdVZR(gt2,i3)
coup3L = cplcFdFdAhL(i3,gt3)
coup3R = cplcFdFdAhR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, sigma1, Fd}
    Do i3=1,3
ML1 = MVZ 
ML2 = Msigma1 
ML3 = MFd(i3) 
coup1 = cplhhsigma1VZ(gt1)
coup2L = cplcFdFdVZL(gt2,i3)
coup2R = cplcFdFdVZR(gt2,i3)
coup3L = cplcFdFdsigma1L(i3,gt3)
coup3R = cplcFdFdsigma1R(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, VZ, Fd}
    Do i3=1,3
ML1 = MVZ 
ML2 = MVZ 
ML3 = MFd(i3) 
coup1 = cplhhVZVZ(gt1)
coup2L = cplcFdFdVZL(gt2,i3)
coup2R = cplcFdFdVZR(gt2,i3)
coup3L = cplcFdFdVZL(i3,gt3)
coup3R = cplcFdFdVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {bar[Fd], bar[Fd], Ah}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MAh 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdAhL(gt2,i1)
coup2R = cplcFdFdAhR(gt2,i1)
coup3L = cplcFdFdAhL(i2,gt3)
coup3R = cplcFdFdAhR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fd], bar[Fd], hh}
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdhhL(gt2,i1,i3)
coup2R = cplcFdFdhhR(gt2,i1,i3)
coup3L = cplcFdFdhhL(i2,gt3,i3)
coup3R = cplcFdFdhhR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {bar[Fd], bar[Fd], sigma1}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = Msigma1 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdsigma1L(gt2,i1)
coup2R = cplcFdFdsigma1R(gt2,i1)
coup3L = cplcFdFdsigma1L(i2,gt3)
coup3R = cplcFdFdsigma1R(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fd], bar[Fd], VG}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVG 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdVGL(gt2,i1)
coup2R = cplcFdFdVGR(gt2,i1)
coup3L = cplcFdFdVGL(i2,gt3)
coup3R = cplcFdFdVGR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do


! {bar[Fd], bar[Fd], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVP 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdVPL(gt2,i1)
coup2R = cplcFdFdVPR(gt2,i1)
coup3L = cplcFdFdVPL(i2,gt3)
coup3R = cplcFdFdVPR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fd], bar[Fd], VZ}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVZ 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdVZL(gt2,i1)
coup2R = cplcFdFdVZR(gt2,i1)
coup3L = cplcFdFdVZL(i2,gt3)
coup3R = cplcFdFdVZR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fu], bar[Fu], Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MHm(i3) 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFdFuHmL(gt2,i1,i3)
coup2R = cplcFdFuHmR(gt2,i1,i3)
coup3L = cplcFuFdcHmL(i2,gt3,i3)
coup3R = cplcFuFdcHmR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {bar[Fu], bar[Fu], VWm}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVWm 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFdFuVWmL(gt2,i1)
coup2R = cplcFdFuVWmR(gt2,i1)
coup3L = cplcFuFdcVWmL(i2,gt3)
coup3R = cplcFuFdcVWmR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], conj[Hm], Fu}
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MFu(i3) 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2L = cplcFdFuHmL(gt2,i3,i1)
coup2R = cplcFdFuHmR(gt2,i3,i1)
coup3L = cplcFuFdcHmL(i3,gt3,i2)
coup3R = cplcFuFdcHmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[Hm], conj[VWm], Fu}
Do i1=1,2
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MFu(i3) 
coup1 = cplhhcHmVWm(gt1,i1)
coup2L = cplcFdFuHmL(gt2,i3,i1)
coup2R = cplcFdFuHmR(gt2,i3,i1)
coup3L = cplcFuFdcVWmL(i3,gt3)
coup3R = cplcFuFdcVWmR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[VWm], conj[Hm], Fu}
  Do i2=1,2
    Do i3=1,3
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MFu(i3) 
coup1 = cplhhHmcVWm(gt1,i2)
coup2L = cplcFdFuVWmL(gt2,i3)
coup2R = cplcFdFuVWmR(gt2,i3)
coup3L = cplcFuFdcHmL(i3,gt3,i2)
coup3R = cplcFuFdcHmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWm], conj[VWm], Fu}
    Do i3=1,3
ML1 = MVWm 
ML2 = MVWm 
ML3 = MFu(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2L = cplcFdFuVWmL(gt2,i3)
coup2R = cplcFdFuVWmR(gt2,i3)
coup3L = cplcFuFdcVWmL(i3,gt3)
coup3R = cplcFuFdcVWmR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_THDMIIIHB_hhTocFdFd


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhTocFdFd(MAh,MFd,MFu,Mhh,MHm,               & 
& Msigma1,MVG,MVP,MVWm,MVZ,MAh2,MFd2,MFu2,Mhh2,MHm2,Msigma12,MVG2,MVP2,MVWm2,            & 
& MVZ2,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdsigma1L,cplcFdFdsigma1R,cplcFdFdVGL,cplcFdFdVGR,       & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcHmL,cplcFuFdcHmR,             & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHmL,cplcFdFuHmR,           & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,              & 
& cplhhsigma1sigma1,cplhhsigma1VZ,cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVG,MVP,MVWm,MVZ,MAh2,MFd2(3),MFu2(3),        & 
& Mhh2(2),MHm2(2),Msigma12,MVG2,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplAhhhhh(2,2),cplAhhhsigma1(2),       & 
& cplAhhhVZ(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdsigma1L(3,3),               & 
& cplcFdFdsigma1R(3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),               & 
& cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFuFdcHmL(3,3,2),cplcFuFdcHmR(3,3,2),& 
& cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),           & 
& cplcFdFuHmL(3,3,2),cplcFdFuHmR(3,3,2),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),             & 
& cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),cplhhHmcVWm(2,2),cplhhsigma1sigma1(2),& 
& cplhhsigma1VZ(2),cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplhhVZVZ(2)

Complex(dp), Intent(out) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MFd(gt3) 


! {bar[Fd], bar[Fd], VG}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVG 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdVGL(gt2,i1)
coup2R = cplcFdFdVGR(gt2,i1)
coup3L = cplcFdFdVGL(i2,gt3)
coup3R = cplcFdFdVGR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do


! {bar[Fd], bar[Fd], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVP 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdVPL(gt2,i1)
coup2R = cplcFdFdVPR(gt2,i1)
coup3L = cplcFdFdVPL(i2,gt3)
coup3R = cplcFdFdVPR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhTocFdFd


Subroutine Amplitude_Tree_THDMIIIHB_hhTocFeFe(cplcFeFehhL,cplcFeFehhR,MFe,            & 
& Mhh,MFe2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),Mhh(2),MFe2(3),Mhh2(2)

Complex(dp), Intent(in) :: cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2)

Complex(dp) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MFe(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFeFehhL(gt2,gt3,gt1)
coupT1R = cplcFeFehhR(gt2,gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_THDMIIIHB_hhTocFeFe


Subroutine Gamma_Real_THDMIIIHB_hhTocFeFe(MLambda,em,gs,cplcFeFehhL,cplcFeFehhR,      & 
& MFe,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2)

Real(dp), Intent(in) :: MFe(3),Mhh(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,3,3), GammarealGluon(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
CoupL = cplcFeFehhL(i2,i3,i1)
CoupR = cplcFeFehhR(i2,i3,i1)
Mex1 = Mhh(i1)
Mex2 = MFe(i2)
Mex3 = MFe(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp,-1._dp,1._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_THDMIIIHB_hhTocFeFe


Subroutine Amplitude_WAVE_THDMIIIHB_hhTocFeFe(cplcFeFehhL,cplcFeFehhR,ctcplcFeFehhL,  & 
& ctcplcFeFehhR,MFe,MFe2,Mhh,Mhh2,ZfEL,ZfER,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFe2(3),Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2)

Complex(dp), Intent(in) :: ctcplcFeFehhL(3,3,2),ctcplcFeFehhR(3,3,2)

Complex(dp), Intent(in) :: ZfEL(3,3),ZfER(3,3),Zfhh(2,2)

Complex(dp), Intent(out) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MFe(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFeFehhL(gt2,gt3,gt1) 
ZcoupT1R = ctcplcFeFehhR(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh(i1,gt1)*cplcFeFehhL(gt2,gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh(i1,gt1)*cplcFeFehhR(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfER(i1,gt2)*cplcFeFehhL(i1,gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfEL(i1,gt2))*cplcFeFehhR(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfEL(i1,gt3)*cplcFeFehhL(gt2,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfER(i1,gt3))*cplcFeFehhR(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_hhTocFeFe


Subroutine Amplitude_VERTEX_THDMIIIHB_hhTocFeFe(MAh,MFe,Mhh,MHm,Msigma1,              & 
& MVP,MVWm,MVZ,MAh2,MFe2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcFeFeAhL,       & 
& cplcFeFeAhR,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplcFeFehhL,cplcFeFehhR,cplcFeFesigma1L, & 
& cplcFeFesigma1R,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFvFecHmL,          & 
& cplcFvFecHmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFeFvHmL,cplcFeFvHmR,cplcFeFvVWmL,         & 
& cplcFeFvVWmR,cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,         & 
& cplhhsigma1VZ,cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFe(3),Mhh(2),MHm(2),Msigma1,MVP,MVWm,MVZ,MAh2,MFe2(3),Mhh2(2),MHm2(2),           & 
& Msigma12,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplAhhhhh(2,2),cplAhhhsigma1(2),       & 
& cplAhhhVZ(2),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFesigma1L(3,3),               & 
& cplcFeFesigma1R(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),               & 
& cplcFeFeVZR(3,3),cplcFvFecHmL(3,3,2),cplcFvFecHmR(3,3,2),cplcFvFecVWmL(3,3),           & 
& cplcFvFecVWmR(3,3),cplcFeFvHmL(3,3,2),cplcFeFvHmR(3,3,2),cplcFeFvVWmL(3,3),            & 
& cplcFeFvVWmR(3,3),cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),               & 
& cplhhHmcVWm(2,2),cplhhsigma1sigma1(2),cplhhsigma1VZ(2),cplhhcHmVWm(2,2),               & 
& cplhhcVWmVWm(2),cplhhVZVZ(2)

Complex(dp), Intent(out) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MFe(gt3) 


! {Ah, Ah, Fe}
    Do i3=1,3
ML1 = MAh 
ML2 = MAh 
ML3 = MFe(i3) 
coup1 = cplAhAhhh(gt1)
coup2L = cplcFeFeAhL(gt2,i3)
coup2R = cplcFeFeAhR(gt2,i3)
coup3L = cplcFeFeAhL(i3,gt3)
coup3R = cplcFeFeAhR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, Fe}
  Do i2=1,2
    Do i3=1,3
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MFe(i3) 
coup1 = cplAhhhhh(gt1,i2)
coup2L = cplcFeFeAhL(gt2,i3)
coup2R = cplcFeFeAhR(gt2,i3)
coup3L = cplcFeFehhL(i3,gt3,i2)
coup3R = cplcFeFehhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, sigma1, Fe}
    Do i3=1,3
ML1 = MAh 
ML2 = Msigma1 
ML3 = MFe(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2L = cplcFeFeAhL(gt2,i3)
coup2R = cplcFeFeAhR(gt2,i3)
coup3L = cplcFeFesigma1L(i3,gt3)
coup3R = cplcFeFesigma1R(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, VZ, Fe}
    Do i3=1,3
ML1 = MAh 
ML2 = MVZ 
ML3 = MFe(i3) 
coup1 = -cplAhhhVZ(gt1)
coup2L = cplcFeFeAhL(gt2,i3)
coup2R = cplcFeFeAhR(gt2,i3)
coup3L = cplcFeFeVZL(i3,gt3)
coup3R = cplcFeFeVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {hh, Ah, Fe}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MFe(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2L = cplcFeFehhL(gt2,i3,i1)
coup2R = cplcFeFehhR(gt2,i3,i1)
coup3L = cplcFeFeAhL(i3,gt3)
coup3R = cplcFeFeAhR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, Fe}
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MFe(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2L = cplcFeFehhL(gt2,i3,i1)
coup2R = cplcFeFehhR(gt2,i3,i1)
coup3L = cplcFeFehhL(i3,gt3,i2)
coup3R = cplcFeFehhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, sigma1, Fe}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = MFe(i3) 
coup1 = cplhhhhsigma1(gt1,i1)
coup2L = cplcFeFehhL(gt2,i3,i1)
coup2R = cplcFeFehhR(gt2,i3,i1)
coup3L = cplcFeFesigma1L(i3,gt3)
coup3R = cplcFeFesigma1R(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {sigma1, Ah, Fe}
    Do i3=1,3
ML1 = Msigma1 
ML2 = MAh 
ML3 = MFe(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2L = cplcFeFesigma1L(gt2,i3)
coup2R = cplcFeFesigma1R(gt2,i3)
coup3L = cplcFeFeAhL(i3,gt3)
coup3R = cplcFeFeAhR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, hh, Fe}
  Do i2=1,2
    Do i3=1,3
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = MFe(i3) 
coup1 = cplhhhhsigma1(gt1,i2)
coup2L = cplcFeFesigma1L(gt2,i3)
coup2R = cplcFeFesigma1R(gt2,i3)
coup3L = cplcFeFehhL(i3,gt3,i2)
coup3R = cplcFeFehhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {sigma1, sigma1, Fe}
    Do i3=1,3
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = MFe(i3) 
coup1 = cplhhsigma1sigma1(gt1)
coup2L = cplcFeFesigma1L(gt2,i3)
coup2R = cplcFeFesigma1R(gt2,i3)
coup3L = cplcFeFesigma1L(i3,gt3)
coup3R = cplcFeFesigma1R(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, VZ, Fe}
    Do i3=1,3
ML1 = Msigma1 
ML2 = MVZ 
ML3 = MFe(i3) 
coup1 = cplhhsigma1VZ(gt1)
coup2L = cplcFeFesigma1L(gt2,i3)
coup2R = cplcFeFesigma1R(gt2,i3)
coup3L = cplcFeFeVZL(i3,gt3)
coup3R = cplcFeFeVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, Ah, Fe}
    Do i3=1,3
ML1 = MVZ 
ML2 = MAh 
ML3 = MFe(i3) 
coup1 = -cplAhhhVZ(gt1)
coup2L = cplcFeFeVZL(gt2,i3)
coup2R = cplcFeFeVZR(gt2,i3)
coup3L = cplcFeFeAhL(i3,gt3)
coup3R = cplcFeFeAhR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, sigma1, Fe}
    Do i3=1,3
ML1 = MVZ 
ML2 = Msigma1 
ML3 = MFe(i3) 
coup1 = cplhhsigma1VZ(gt1)
coup2L = cplcFeFeVZL(gt2,i3)
coup2R = cplcFeFeVZR(gt2,i3)
coup3L = cplcFeFesigma1L(i3,gt3)
coup3R = cplcFeFesigma1R(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, VZ, Fe}
    Do i3=1,3
ML1 = MVZ 
ML2 = MVZ 
ML3 = MFe(i3) 
coup1 = cplhhVZVZ(gt1)
coup2L = cplcFeFeVZL(gt2,i3)
coup2R = cplcFeFeVZR(gt2,i3)
coup3L = cplcFeFeVZL(i3,gt3)
coup3R = cplcFeFeVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {bar[Fe], bar[Fe], Ah}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MAh 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcFeFeAhL(gt2,i1)
coup2R = cplcFeFeAhR(gt2,i1)
coup3L = cplcFeFeAhL(i2,gt3)
coup3R = cplcFeFeAhR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fe], bar[Fe], hh}
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcFeFehhL(gt2,i1,i3)
coup2R = cplcFeFehhR(gt2,i1,i3)
coup3L = cplcFeFehhL(i2,gt3,i3)
coup3R = cplcFeFehhR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {bar[Fe], bar[Fe], sigma1}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = Msigma1 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcFeFesigma1L(gt2,i1)
coup2R = cplcFeFesigma1R(gt2,i1)
coup3L = cplcFeFesigma1L(i2,gt3)
coup3R = cplcFeFesigma1R(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fe], bar[Fe], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVP 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcFeFeVPL(gt2,i1)
coup2R = cplcFeFeVPR(gt2,i1)
coup3L = cplcFeFeVPL(i2,gt3)
coup3R = cplcFeFeVPR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fe], bar[Fe], VZ}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVZ 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcFeFeVZL(gt2,i1)
coup2R = cplcFeFeVZR(gt2,i1)
coup3L = cplcFeFeVZL(i2,gt3)
coup3R = cplcFeFeVZR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], conj[Hm], Fv}
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = 0. 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2L = cplcFeFvHmL(gt2,i3,i1)
coup2R = cplcFeFvHmR(gt2,i3,i1)
coup3L = cplcFvFecHmL(i3,gt3,i2)
coup3R = cplcFvFecHmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[Hm], conj[VWm], Fv}
Do i1=1,2
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = 0. 
coup1 = cplhhcHmVWm(gt1,i1)
coup2L = cplcFeFvHmL(gt2,i3,i1)
coup2R = cplcFeFvHmR(gt2,i3,i1)
coup3L = cplcFvFecVWmL(i3,gt3)
coup3R = cplcFvFecVWmR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[VWm], conj[Hm], Fv}
  Do i2=1,2
    Do i3=1,3
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = 0. 
coup1 = cplhhHmcVWm(gt1,i2)
coup2L = cplcFeFvVWmL(gt2,i3)
coup2R = cplcFeFvVWmR(gt2,i3)
coup3L = cplcFvFecHmL(i3,gt3,i2)
coup3R = cplcFvFecHmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWm], conj[VWm], Fv}
    Do i3=1,3
ML1 = MVWm 
ML2 = MVWm 
ML3 = 0. 
coup1 = cplhhcVWmVWm(gt1)
coup2L = cplcFeFvVWmL(gt2,i3)
coup2R = cplcFeFvVWmR(gt2,i3)
coup3L = cplcFvFecVWmL(i3,gt3)
coup3R = cplcFvFecVWmR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_THDMIIIHB_hhTocFeFe


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhTocFeFe(MAh,MFe,Mhh,MHm,Msigma1,           & 
& MVP,MVWm,MVZ,MAh2,MFe2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcFeFeAhL,       & 
& cplcFeFeAhR,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplcFeFehhL,cplcFeFehhR,cplcFeFesigma1L, & 
& cplcFeFesigma1R,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFvFecHmL,          & 
& cplcFvFecHmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFeFvHmL,cplcFeFvHmR,cplcFeFvVWmL,         & 
& cplcFeFvVWmR,cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,         & 
& cplhhsigma1VZ,cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFe(3),Mhh(2),MHm(2),Msigma1,MVP,MVWm,MVZ,MAh2,MFe2(3),Mhh2(2),MHm2(2),           & 
& Msigma12,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplAhhhhh(2,2),cplAhhhsigma1(2),       & 
& cplAhhhVZ(2),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFesigma1L(3,3),               & 
& cplcFeFesigma1R(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),               & 
& cplcFeFeVZR(3,3),cplcFvFecHmL(3,3,2),cplcFvFecHmR(3,3,2),cplcFvFecVWmL(3,3),           & 
& cplcFvFecVWmR(3,3),cplcFeFvHmL(3,3,2),cplcFeFvHmR(3,3,2),cplcFeFvVWmL(3,3),            & 
& cplcFeFvVWmR(3,3),cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),               & 
& cplhhHmcVWm(2,2),cplhhsigma1sigma1(2),cplhhsigma1VZ(2),cplhhcHmVWm(2,2),               & 
& cplhhcVWmVWm(2),cplhhVZVZ(2)

Complex(dp), Intent(out) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MFe(gt3) 


! {bar[Fe], bar[Fe], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVP 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcFeFeVPL(gt2,i1)
coup2R = cplcFeFeVPR(gt2,i1)
coup3L = cplcFeFeVPL(i2,gt3)
coup3R = cplcFeFeVPR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhTocFeFe


Subroutine Amplitude_Tree_THDMIIIHB_hhTocFuFu(cplcFuFuhhL,cplcFuFuhhR,MFu,            & 
& Mhh,MFu2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MFu(3),Mhh(2),MFu2(3),Mhh2(2)

Complex(dp), Intent(in) :: cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2)

Complex(dp) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MFu(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFuFuhhL(gt2,gt3,gt1)
coupT1R = cplcFuFuhhR(gt2,gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_THDMIIIHB_hhTocFuFu


Subroutine Gamma_Real_THDMIIIHB_hhTocFuFu(MLambda,em,gs,cplcFuFuhhL,cplcFuFuhhR,      & 
& MFu,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2)

Real(dp), Intent(in) :: MFu(3),Mhh(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,3,3), GammarealGluon(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
CoupL = cplcFuFuhhL(i2,i3,i1)
CoupR = cplcFuFuhhR(i2,i3,i1)
Mex1 = Mhh(i1)
Mex2 = MFu(i2)
Mex3 = MFu(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,4._dp/3._dp,-4._dp/3._dp,4._dp/3._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,gs,0._dp,0._dp,0._dp,4._dp,-4._dp,4._dp,CoupL,CoupR,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_THDMIIIHB_hhTocFuFu


Subroutine Amplitude_WAVE_THDMIIIHB_hhTocFuFu(cplcFuFuhhL,cplcFuFuhhR,ctcplcFuFuhhL,  & 
& ctcplcFuFuhhR,MFu,MFu2,Mhh,Mhh2,Zfhh,ZfUL,ZfUR,Amp)

Implicit None

Real(dp), Intent(in) :: MFu(3),MFu2(3),Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2)

Complex(dp), Intent(in) :: ctcplcFuFuhhL(3,3,2),ctcplcFuFuhhR(3,3,2)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfUL(3,3),ZfUR(3,3)

Complex(dp), Intent(out) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MFu(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFuFuhhL(gt2,gt3,gt1) 
ZcoupT1R = ctcplcFuFuhhR(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh(i1,gt1)*cplcFuFuhhL(gt2,gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh(i1,gt1)*cplcFuFuhhR(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfUR(i1,gt2)*cplcFuFuhhL(i1,gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfUL(i1,gt2))*cplcFuFuhhR(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfUL(i1,gt3)*cplcFuFuhhL(gt2,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfUR(i1,gt3))*cplcFuFuhhR(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_hhTocFuFu


Subroutine Amplitude_VERTEX_THDMIIIHB_hhTocFuFu(MAh,MFd,MFu,Mhh,MHm,Msigma1,          & 
& MVG,MVP,MVWm,MVZ,MAh2,MFd2,MFu2,Mhh2,MHm2,Msigma12,MVG2,MVP2,MVWm2,MVZ2,               & 
& cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplcFdFdhhL,       & 
& cplcFdFdhhR,cplcFuFdcHmL,cplcFuFdcHmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,         & 
& cplcFuFuhhR,cplcFdFuHmL,cplcFdFuHmR,cplcFuFusigma1L,cplcFuFusigma1R,cplcFuFuVGL,       & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,          & 
& cplhhsigma1VZ,cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVG,MVP,MVWm,MVZ,MAh2,MFd2(3),MFu2(3),        & 
& Mhh2(2),MHm2(2),Msigma12,MVG2,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplAhhhhh(2,2),cplAhhhsigma1(2),       & 
& cplAhhhVZ(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdcHmL(3,3,2),cplcFuFdcHmR(3,3,2),& 
& cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),           & 
& cplcFdFuHmL(3,3,2),cplcFdFuHmR(3,3,2),cplcFuFusigma1L(3,3),cplcFuFusigma1R(3,3),       & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWmL(3,3), & 
& cplcFdFuVWmR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),& 
& cplhhHmcHm(2,2,2),cplhhHmcVWm(2,2),cplhhsigma1sigma1(2),cplhhsigma1VZ(2),              & 
& cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplhhVZVZ(2)

Complex(dp), Intent(out) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MFu(gt3) 


! {Ah, Ah, Fu}
    Do i3=1,3
ML1 = MAh 
ML2 = MAh 
ML3 = MFu(i3) 
coup1 = cplAhAhhh(gt1)
coup2L = cplcFuFuAhL(gt2,i3)
coup2R = cplcFuFuAhR(gt2,i3)
coup3L = cplcFuFuAhL(i3,gt3)
coup3R = cplcFuFuAhR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, Fu}
  Do i2=1,2
    Do i3=1,3
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MFu(i3) 
coup1 = cplAhhhhh(gt1,i2)
coup2L = cplcFuFuAhL(gt2,i3)
coup2R = cplcFuFuAhR(gt2,i3)
coup3L = cplcFuFuhhL(i3,gt3,i2)
coup3R = cplcFuFuhhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, sigma1, Fu}
    Do i3=1,3
ML1 = MAh 
ML2 = Msigma1 
ML3 = MFu(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2L = cplcFuFuAhL(gt2,i3)
coup2R = cplcFuFuAhR(gt2,i3)
coup3L = cplcFuFusigma1L(i3,gt3)
coup3R = cplcFuFusigma1R(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, VZ, Fu}
    Do i3=1,3
ML1 = MAh 
ML2 = MVZ 
ML3 = MFu(i3) 
coup1 = -cplAhhhVZ(gt1)
coup2L = cplcFuFuAhL(gt2,i3)
coup2R = cplcFuFuAhR(gt2,i3)
coup3L = cplcFuFuVZL(i3,gt3)
coup3R = cplcFuFuVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {hh, Ah, Fu}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MFu(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2L = cplcFuFuhhL(gt2,i3,i1)
coup2R = cplcFuFuhhR(gt2,i3,i1)
coup3L = cplcFuFuAhL(i3,gt3)
coup3R = cplcFuFuAhR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, Fu}
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MFu(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2L = cplcFuFuhhL(gt2,i3,i1)
coup2R = cplcFuFuhhR(gt2,i3,i1)
coup3L = cplcFuFuhhL(i3,gt3,i2)
coup3R = cplcFuFuhhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, sigma1, Fu}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = MFu(i3) 
coup1 = cplhhhhsigma1(gt1,i1)
coup2L = cplcFuFuhhL(gt2,i3,i1)
coup2R = cplcFuFuhhR(gt2,i3,i1)
coup3L = cplcFuFusigma1L(i3,gt3)
coup3R = cplcFuFusigma1R(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, Fd}
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MFd(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2L = cplcFuFdcHmL(gt2,i3,i1)
coup2R = cplcFuFdcHmR(gt2,i3,i1)
coup3L = cplcFdFuHmL(i3,gt3,i2)
coup3R = cplcFdFuHmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hm, VWm, Fd}
Do i1=1,2
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MFd(i3) 
coup1 = cplhhHmcVWm(gt1,i1)
coup2L = cplcFuFdcHmL(gt2,i3,i1)
coup2R = cplcFuFdcHmR(gt2,i3,i1)
coup3L = cplcFdFuVWmL(i3,gt3)
coup3R = cplcFdFuVWmR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {sigma1, Ah, Fu}
    Do i3=1,3
ML1 = Msigma1 
ML2 = MAh 
ML3 = MFu(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2L = cplcFuFusigma1L(gt2,i3)
coup2R = cplcFuFusigma1R(gt2,i3)
coup3L = cplcFuFuAhL(i3,gt3)
coup3R = cplcFuFuAhR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, hh, Fu}
  Do i2=1,2
    Do i3=1,3
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = MFu(i3) 
coup1 = cplhhhhsigma1(gt1,i2)
coup2L = cplcFuFusigma1L(gt2,i3)
coup2R = cplcFuFusigma1R(gt2,i3)
coup3L = cplcFuFuhhL(i3,gt3,i2)
coup3R = cplcFuFuhhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {sigma1, sigma1, Fu}
    Do i3=1,3
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = MFu(i3) 
coup1 = cplhhsigma1sigma1(gt1)
coup2L = cplcFuFusigma1L(gt2,i3)
coup2R = cplcFuFusigma1R(gt2,i3)
coup3L = cplcFuFusigma1L(i3,gt3)
coup3R = cplcFuFusigma1R(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, VZ, Fu}
    Do i3=1,3
ML1 = Msigma1 
ML2 = MVZ 
ML3 = MFu(i3) 
coup1 = cplhhsigma1VZ(gt1)
coup2L = cplcFuFusigma1L(gt2,i3)
coup2R = cplcFuFusigma1R(gt2,i3)
coup3L = cplcFuFuVZL(i3,gt3)
coup3R = cplcFuFuVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VWm, Hm, Fd}
  Do i2=1,2
    Do i3=1,3
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MFd(i3) 
coup1 = cplhhcHmVWm(gt1,i2)
coup2L = cplcFuFdcVWmL(gt2,i3)
coup2R = cplcFuFdcVWmR(gt2,i3)
coup3L = cplcFdFuHmL(i3,gt3,i2)
coup3R = cplcFdFuHmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, VWm, Fd}
    Do i3=1,3
ML1 = MVWm 
ML2 = MVWm 
ML3 = MFd(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2L = cplcFuFdcVWmL(gt2,i3)
coup2R = cplcFuFdcVWmR(gt2,i3)
coup3L = cplcFdFuVWmL(i3,gt3)
coup3R = cplcFdFuVWmR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, Ah, Fu}
    Do i3=1,3
ML1 = MVZ 
ML2 = MAh 
ML3 = MFu(i3) 
coup1 = -cplAhhhVZ(gt1)
coup2L = cplcFuFuVZL(gt2,i3)
coup2R = cplcFuFuVZR(gt2,i3)
coup3L = cplcFuFuAhL(i3,gt3)
coup3R = cplcFuFuAhR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, sigma1, Fu}
    Do i3=1,3
ML1 = MVZ 
ML2 = Msigma1 
ML3 = MFu(i3) 
coup1 = cplhhsigma1VZ(gt1)
coup2L = cplcFuFuVZL(gt2,i3)
coup2R = cplcFuFuVZR(gt2,i3)
coup3L = cplcFuFusigma1L(i3,gt3)
coup3R = cplcFuFusigma1R(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, VZ, Fu}
    Do i3=1,3
ML1 = MVZ 
ML2 = MVZ 
ML3 = MFu(i3) 
coup1 = cplhhVZVZ(gt1)
coup2L = cplcFuFuVZL(gt2,i3)
coup2R = cplcFuFuVZR(gt2,i3)
coup3L = cplcFuFuVZL(i3,gt3)
coup3R = cplcFuFuVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {bar[Fd], bar[Fd], conj[Hm]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MHm(i3) 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFuFdcHmL(gt2,i1,i3)
coup2R = cplcFuFdcHmR(gt2,i1,i3)
coup3L = cplcFdFuHmL(i2,gt3,i3)
coup3R = cplcFdFuHmR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {bar[Fd], bar[Fd], conj[VWm]}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVWm 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFuFdcVWmL(gt2,i1)
coup2R = cplcFuFdcVWmR(gt2,i1)
coup3L = cplcFdFuVWmL(i2,gt3)
coup3R = cplcFdFuVWmR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fu], bar[Fu], Ah}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MAh 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuAhL(gt2,i1)
coup2R = cplcFuFuAhR(gt2,i1)
coup3L = cplcFuFuAhL(i2,gt3)
coup3R = cplcFuFuAhR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fu], bar[Fu], hh}
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuhhL(gt2,i1,i3)
coup2R = cplcFuFuhhR(gt2,i1,i3)
coup3L = cplcFuFuhhL(i2,gt3,i3)
coup3R = cplcFuFuhhR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {bar[Fu], bar[Fu], sigma1}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = Msigma1 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFusigma1L(gt2,i1)
coup2R = cplcFuFusigma1R(gt2,i1)
coup3L = cplcFuFusigma1L(i2,gt3)
coup3R = cplcFuFusigma1R(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fu], bar[Fu], VG}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVG 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuVGL(gt2,i1)
coup2R = cplcFuFuVGR(gt2,i1)
coup3L = cplcFuFuVGL(i2,gt3)
coup3R = cplcFuFuVGR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do


! {bar[Fu], bar[Fu], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVP 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuVPL(gt2,i1)
coup2R = cplcFuFuVPR(gt2,i1)
coup3L = cplcFuFuVPL(i2,gt3)
coup3R = cplcFuFuVPR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fu], bar[Fu], VZ}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVZ 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuVZL(gt2,i1)
coup2R = cplcFuFuVZR(gt2,i1)
coup3L = cplcFuFuVZL(i2,gt3)
coup3R = cplcFuFuVZR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_THDMIIIHB_hhTocFuFu


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhTocFuFu(MAh,MFd,MFu,Mhh,MHm,               & 
& Msigma1,MVG,MVP,MVWm,MVZ,MAh2,MFd2,MFu2,Mhh2,MHm2,Msigma12,MVG2,MVP2,MVWm2,            & 
& MVZ2,cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHmL,cplcFuFdcHmR,cplcFuFdcVWmL,cplcFuFdcVWmR,         & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHmL,cplcFdFuHmR,cplcFuFusigma1L,cplcFuFusigma1R,       & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,& 
& cplhhsigma1VZ,cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVG,MVP,MVWm,MVZ,MAh2,MFd2(3),MFu2(3),        & 
& Mhh2(2),MHm2(2),Msigma12,MVG2,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplAhhhhh(2,2),cplAhhhsigma1(2),       & 
& cplAhhhVZ(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdcHmL(3,3,2),cplcFuFdcHmR(3,3,2),& 
& cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),           & 
& cplcFdFuHmL(3,3,2),cplcFdFuHmR(3,3,2),cplcFuFusigma1L(3,3),cplcFuFusigma1R(3,3),       & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWmL(3,3), & 
& cplcFdFuVWmR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),& 
& cplhhHmcHm(2,2,2),cplhhHmcVWm(2,2),cplhhsigma1sigma1(2),cplhhsigma1VZ(2),              & 
& cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplhhVZVZ(2)

Complex(dp), Intent(out) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MFu(gt3) 


! {bar[Fu], bar[Fu], VG}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVG 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuVGL(gt2,i1)
coup2R = cplcFuFuVGR(gt2,i1)
coup3L = cplcFuFuVGL(i2,gt3)
coup3R = cplcFuFuVGR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do


! {bar[Fu], bar[Fu], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVP 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuVPL(gt2,i1)
coup2R = cplcFuFuVPR(gt2,i1)
coup3L = cplcFuFuVPL(i2,gt3)
coup3R = cplcFuFuVPR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhTocFuFu


Subroutine Amplitude_Tree_THDMIIIHB_hhTohhhh(cplhhhhhh,Mhh,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cplhhhhhh(2,2,2)

Complex(dp) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = Mhh(gt3) 
! Tree-Level Vertex 
coupT1 = cplhhhhhh(gt1,gt2,gt3)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_THDMIIIHB_hhTohhhh


Subroutine Gamma_Real_THDMIIIHB_hhTohhhh(MLambda,em,gs,cplhhhhhh,Mhh,GammarealPhoton, & 
& GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhhhhh(2,2,2)

Real(dp), Intent(in) :: Mhh(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,2,2), GammarealGluon(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
Coup = cplhhhhhh(i1,i2,i3)
Mex1 = Mhh(i1)
Mex2 = Mhh(i2)
Mex3 = Mhh(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i1,i2,i3) = 0._dp 
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_THDMIIIHB_hhTohhhh


Subroutine Amplitude_WAVE_THDMIIIHB_hhTohhhh(cplhhhhhh,ctcplhhhhhh,Mhh,               & 
& Mhh2,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cplhhhhhh(2,2,2)

Complex(dp), Intent(in) :: ctcplhhhhhh(2,2,2)

Complex(dp), Intent(in) :: Zfhh(2,2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = Mhh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhhhhh(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhhhhh(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt2)*cplhhhhhh(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt3)*cplhhhhhh(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_hhTohhhh


Subroutine Amplitude_VERTEX_THDMIIIHB_hhTohhhh(MAh,MFd,MFe,MFu,Mhh,MHm,               & 
& Msigma1,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhhh,          & 
& cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,     & 
& cplcFuFuhhL,cplcFuFuhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplcgZgZhh,cplhhhhhh,              & 
& cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,cplhhcHmVWm,      & 
& cplhhcVWmVWm,cplhhVZVZ,cplAhAhhhhh1,cplAhhhhhhh1,cplAhhhhhsigma11,cplhhhhhhhh1,        & 
& cplhhhhhhsigma11,cplhhhhHmcHm1,cplhhhhsigma1sigma11,cplhhhhcVWmVWm1,cplhhhhVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVWm,MVZ,MAh2,MFd2(3),MFe2(3),         & 
& MFu2(3),Mhh2(2),MHm2(2),Msigma12,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhhhVZ(2),cplcFdFdhhL(3,3,2),         & 
& cplcFdFdhhR(3,3,2),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),           & 
& cplcFuFuhhR(3,3,2),cplcgWmgWmhh(2),cplcgWpCgWpChh(2),cplcgZgZhh(2),cplhhhhhh(2,2,2),   & 
& cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),cplhhHmcVWm(2,2),cplhhsigma1sigma1(2),            & 
& cplhhsigma1VZ(2),cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplhhVZVZ(2),cplAhAhhhhh1(2,2),      & 
& cplAhhhhhhh1(2,2,2),cplAhhhhhsigma11(2,2),cplhhhhhhhh1(2,2,2,2),cplhhhhhhsigma11(2,2,2),& 
& cplhhhhHmcHm1(2,2,2,2),cplhhhhsigma1sigma11(2,2),cplhhhhcVWmVWm1(2,2),cplhhhhVZVZ1(2,2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,2
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = Mhh(gt3) 


! {Ah, Ah, Ah}
ML1 = MAh 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhhh(gt2)
coup3 = cplAhAhhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, hh, Ah}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhhh(gt2)
coup3 = cplAhhhhh(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, sigma1, Ah}
ML1 = MAh 
ML2 = Msigma1 
ML3 = MAh 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhAhhh(gt2)
coup3 = cplAhhhsigma1(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, VZ, Ah}
ML1 = MAh 
ML2 = MVZ 
ML3 = MAh 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhAhhh(gt2)
coup3 = -cplAhhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhhhhh(gt2,i3)
coup3 = cplAhhhhh(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhhhhh(gt2,i3)
coup3 = cplhhhhhh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, sigma1, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhhhhh(gt2,i3)
coup3 = cplhhhhsigma1(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, Ah, sigma1}
ML1 = MAh 
ML2 = MAh 
ML3 = Msigma1 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhhhsigma1(gt2)
coup3 = cplAhhhsigma1(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, hh, sigma1}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhhhsigma1(gt2)
coup3 = cplhhhhsigma1(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, sigma1, sigma1}
ML1 = MAh 
ML2 = Msigma1 
ML3 = Msigma1 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhhhsigma1(gt2)
coup3 = cplhhsigma1sigma1(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, VZ, sigma1}
ML1 = MAh 
ML2 = MVZ 
ML3 = Msigma1 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhhhsigma1(gt2)
coup3 = cplhhsigma1VZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, Ah, VZ}
ML1 = MAh 
ML2 = MAh 
ML3 = MVZ 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhhhVZ(gt2)
coup3 = -cplAhhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, sigma1, VZ}
ML1 = MAh 
ML2 = Msigma1 
ML3 = MVZ 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhhhVZ(gt2)
coup3 = cplhhsigma1VZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, VZ, VZ}
ML1 = MAh 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhhhVZ(gt2)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdhhL(i1,i3,gt2)
coup2R = cplcFdFdhhR(i1,i3,gt2)
coup3L = cplcFdFdhhL(i3,i2,gt3)
coup3R = cplcFdFdhhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFehhL(i1,i3,gt2)
coup2R = cplcFeFehhR(i1,i3,gt2)
coup3L = cplcFeFehhL(i3,i2,gt3)
coup3R = cplcFeFehhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuhhL(i1,i3,gt2)
coup2R = cplcFuFuhhR(i1,i3,gt2)
coup3L = cplcFuFuhhL(i3,i2,gt3)
coup3R = cplcFuFuhhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWm, gWm, gWm}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgWmhh(gt2)
coup3 = cplcgWmgWmhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 


! {gWmC, gWmC, gWmC}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgWpChh(gt2)
coup3 = cplcgWpCgWpChh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 


! {gZ, gZ, gZ}
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgZgZhh(gt2)
coup3 = cplcgZgZhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 


! {hh, Ah, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplAhhhhh(gt2,i1)
coup3 = cplAhAhhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhhh(gt2,i1)
coup3 = cplAhhhhh(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, sigma1, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = MAh 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplAhhhhh(gt2,i1)
coup3 = cplAhhhsigma1(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, Ah, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = cplAhhhhh(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, hh}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = cplhhhhhh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, sigma1, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = cplhhhhsigma1(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, Ah, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Msigma1 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplhhhhsigma1(gt2,i1)
coup3 = cplAhhhsigma1(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, sigma1}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhsigma1(gt2,i1)
coup3 = cplhhhhsigma1(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, sigma1, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = Msigma1 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplhhhhsigma1(gt2,i1)
coup3 = cplhhsigma1sigma1(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Hm, Hm, Hm}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = cplhhHmcHm(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, VWm, Hm}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = -cplhhHmcVWm(gt1,i1)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = cplhhcHmVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, VWm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = -cplhhcHmVWm(gt2,i1)
coup3 = cplhhHmcVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, VWm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplhhHmcVWm(gt1,i1)
coup2 = -cplhhcHmVWm(gt2,i1)
coup3 = cplhhcVWmVWm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {sigma1, Ah, Ah}
ML1 = Msigma1 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhhhsigma1(gt2)
coup3 = cplAhAhhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {sigma1, hh, Ah}
  Do i2=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplAhhhsigma1(gt2)
coup3 = cplAhhhhh(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {sigma1, sigma1, Ah}
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = MAh 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplAhhhsigma1(gt2)
coup3 = cplAhhhsigma1(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {sigma1, VZ, Ah}
ML1 = Msigma1 
ML2 = MVZ 
ML3 = MAh 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = cplAhhhsigma1(gt2)
coup3 = -cplAhhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {sigma1, Ah, hh}
    Do i3=1,2
ML1 = Msigma1 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplhhhhsigma1(gt2,i3)
coup3 = cplAhhhhh(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplhhhhsigma1(gt2,i3)
coup3 = cplhhhhhh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {sigma1, sigma1, hh}
    Do i3=1,2
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplhhhhsigma1(gt2,i3)
coup3 = cplhhhhsigma1(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, Ah, sigma1}
ML1 = Msigma1 
ML2 = MAh 
ML3 = Msigma1 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplhhsigma1sigma1(gt2)
coup3 = cplAhhhsigma1(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {sigma1, hh, sigma1}
  Do i2=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplhhsigma1sigma1(gt2)
coup3 = cplhhhhsigma1(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {sigma1, sigma1, sigma1}
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = Msigma1 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplhhsigma1sigma1(gt2)
coup3 = cplhhsigma1sigma1(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {sigma1, VZ, sigma1}
ML1 = Msigma1 
ML2 = MVZ 
ML3 = Msigma1 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = cplhhsigma1sigma1(gt2)
coup3 = cplhhsigma1VZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {sigma1, Ah, VZ}
ML1 = Msigma1 
ML2 = MAh 
ML3 = MVZ 
coup1 = cplAhhhsigma1(gt1)
coup2 = -cplhhsigma1VZ(gt2)
coup3 = -cplAhhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {sigma1, sigma1, VZ}
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = MVZ 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = -cplhhsigma1VZ(gt2)
coup3 = cplhhsigma1VZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {sigma1, VZ, VZ}
ML1 = Msigma1 
ML2 = MVZ 
ML3 = MVZ 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = -cplhhsigma1VZ(gt2)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VWm, Hm, Hm}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhcHmVWm(gt1,i2)
coup2 = -cplhhHmcVWm(gt2,i3)
coup3 = cplhhHmcHm(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, VWm, Hm}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = -cplhhHmcVWm(gt2,i3)
coup3 = cplhhcHmVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VWm, Hm, VWm}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = -cplhhcHmVWm(gt1,i2)
coup2 = cplhhcVWmVWm(gt2)
coup3 = cplhhHmcVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {VWm, VWm, VWm}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplhhcVWmVWm(gt2)
coup3 = cplhhcVWmVWm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 


! {VZ, Ah, Ah}
ML1 = MVZ 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhhhVZ(gt2)
coup3 = cplAhAhhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VZ, sigma1, Ah}
ML1 = MVZ 
ML2 = Msigma1 
ML3 = MAh 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = cplAhhhVZ(gt2)
coup3 = cplAhhhsigma1(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VZ, VZ, Ah}
ML1 = MVZ 
ML2 = MVZ 
ML3 = MAh 
coup1 = cplhhVZVZ(gt1)
coup2 = cplAhhhVZ(gt2)
coup3 = -cplAhhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VZ, Ah, sigma1}
ML1 = MVZ 
ML2 = MAh 
ML3 = Msigma1 
coup1 = cplAhhhVZ(gt1)
coup2 = -cplhhsigma1VZ(gt2)
coup3 = cplAhhhsigma1(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VZ, sigma1, sigma1}
ML1 = MVZ 
ML2 = Msigma1 
ML3 = Msigma1 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = -cplhhsigma1VZ(gt2)
coup3 = cplhhsigma1sigma1(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VZ, VZ, sigma1}
ML1 = MVZ 
ML2 = MVZ 
ML3 = Msigma1 
coup1 = cplhhVZVZ(gt1)
coup2 = -cplhhsigma1VZ(gt2)
coup3 = cplhhsigma1VZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VZ, Ah, VZ}
ML1 = MVZ 
ML2 = MAh 
ML3 = MVZ 
coup1 = cplAhhhVZ(gt1)
coup2 = cplhhVZVZ(gt2)
coup3 = -cplAhhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VZ, sigma1, VZ}
ML1 = MVZ 
ML2 = Msigma1 
ML3 = MVZ 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = cplhhVZVZ(gt2)
coup3 = cplhhsigma1VZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VZ, VZ, VZ}
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplhhVZVZ(gt1)
coup2 = cplhhVZVZ(gt2)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {conj[Hm], conj[VWm], conj[Hm]}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = -cplhhcHmVWm(gt1,i1)
coup2 = cplhhHmcHm(gt2,i1,i3)
coup3 = cplhhHmcVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[Hm], conj[Hm], conj[VWm]}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = -cplhhHmcVWm(gt2,i1)
coup3 = cplhhcHmVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], conj[VWm], conj[VWm]}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplhhcHmVWm(gt1,i1)
coup2 = -cplhhHmcVWm(gt2,i1)
coup3 = cplhhcVWmVWm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {conj[VWm], conj[Hm], conj[Hm]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhHmcVWm(gt1,i2)
coup2 = -cplhhcHmVWm(gt2,i3)
coup3 = cplhhHmcHm(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWm], conj[VWm], conj[Hm]}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = -cplhhcHmVWm(gt2,i3)
coup3 = cplhhHmcVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWm], conj[Hm], conj[VWm]}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = -cplhhHmcVWm(gt1,i2)
coup2 = cplhhcVWmVWm(gt2)
coup3 = cplhhcHmVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhhhhh1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhhhhhhh1(gt2,gt3,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, sigma1}
ML1 = MAh 
ML2 = Msigma1 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhhhhhsigma11(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhhhhh1(gt2,gt3,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do


! {hh, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplhhhhhhsigma11(gt2,gt3,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Hm, Hm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplhhhhHmcHm1(gt2,gt3,i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {sigma1, sigma1}
ML1 = Msigma1 
ML2 = Msigma1 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplhhhhsigma1sigma11(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 


! {VWm, VWm}
ML1 = MVWm 
ML2 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplhhhhcVWmVWm1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VZ, VZ}
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhVZVZ(gt1)
coup2 = cplhhhhVZVZ1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhhhh1(gt1,gt3)
coup2 = cplAhAhhh(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhhhhhhh1(gt1,gt3,i2)
coup2 = cplAhhhhh(gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do


! {Ah, sigma1}
ML1 = MAh 
ML2 = Msigma1 
coup1 = cplAhhhhhsigma11(gt1,gt3)
coup2 = cplAhhhsigma1(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhhhh1(gt1,gt3,i1,i2)
coup2 = cplhhhhhh(gt2,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {hh, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
coup1 = cplhhhhhhsigma11(gt1,gt3,i1)
coup2 = cplhhhhsigma1(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End Do


! {Hm, Hm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhhhHmcHm1(gt1,gt3,i1,i2)
coup2 = cplhhHmcHm(gt2,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {sigma1, sigma1}
ML1 = Msigma1 
ML2 = Msigma1 
coup1 = cplhhhhsigma1sigma11(gt1,gt3)
coup2 = cplhhsigma1sigma1(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 



! {VWm, VWm}
ML1 = MVWm 
ML2 = MVWm 
coup1 = cplhhhhcVWmVWm1(gt1,gt3)
coup2 = cplhhcVWmVWm(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VZ, VZ}
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhhhVZVZ1(gt1,gt3)
coup2 = cplhhVZVZ(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhhhh1(gt1,gt2)
coup2 = cplAhAhhh(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhhhhhhh1(gt1,gt2,i2)
coup2 = cplAhhhhh(gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do


! {Ah, sigma1}
ML1 = MAh 
ML2 = Msigma1 
coup1 = cplAhhhhhsigma11(gt1,gt2)
coup2 = cplAhhhsigma1(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhhhh1(gt1,gt2,i1,i2)
coup2 = cplhhhhhh(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {hh, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
coup1 = cplhhhhhhsigma11(gt1,gt2,i1)
coup2 = cplhhhhsigma1(gt3,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End Do


! {Hm, Hm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhhhHmcHm1(gt1,gt2,i1,i2)
coup2 = cplhhHmcHm(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {sigma1, sigma1}
ML1 = Msigma1 
ML2 = Msigma1 
coup1 = cplhhhhsigma1sigma11(gt1,gt2)
coup2 = cplhhsigma1sigma1(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 



! {VWm, VWm}
ML1 = MVWm 
ML2 = MVWm 
coup1 = cplhhhhcVWmVWm1(gt1,gt2)
coup2 = cplhhcVWmVWm(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VZ, VZ}
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhhhVZVZ1(gt1,gt2)
coup2 = cplhhVZVZ(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_THDMIIIHB_hhTohhhh


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhTohhhh(MAh,MFd,MFe,MFu,Mhh,MHm,            & 
& Msigma1,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhhh,          & 
& cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,     & 
& cplcFuFuhhL,cplcFuFuhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplcgZgZhh,cplhhhhhh,              & 
& cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,cplhhcHmVWm,      & 
& cplhhcVWmVWm,cplhhVZVZ,cplAhAhhhhh1,cplAhhhhhhh1,cplAhhhhhsigma11,cplhhhhhhhh1,        & 
& cplhhhhhhsigma11,cplhhhhHmcHm1,cplhhhhsigma1sigma11,cplhhhhcVWmVWm1,cplhhhhVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVWm,MVZ,MAh2,MFd2(3),MFe2(3),         & 
& MFu2(3),Mhh2(2),MHm2(2),Msigma12,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhhhVZ(2),cplcFdFdhhL(3,3,2),         & 
& cplcFdFdhhR(3,3,2),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),           & 
& cplcFuFuhhR(3,3,2),cplcgWmgWmhh(2),cplcgWpCgWpChh(2),cplcgZgZhh(2),cplhhhhhh(2,2,2),   & 
& cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),cplhhHmcVWm(2,2),cplhhsigma1sigma1(2),            & 
& cplhhsigma1VZ(2),cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplhhVZVZ(2),cplAhAhhhhh1(2,2),      & 
& cplAhhhhhhh1(2,2,2),cplAhhhhhsigma11(2,2),cplhhhhhhhh1(2,2,2,2),cplhhhhhhsigma11(2,2,2),& 
& cplhhhhHmcHm1(2,2,2,2),cplhhhhsigma1sigma11(2,2),cplhhhhcVWmVWm1(2,2),cplhhhhVZVZ1(2,2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,2
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = Mhh(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhTohhhh


Subroutine Amplitude_Tree_THDMIIIHB_hhTosigma1hh(cplhhhhsigma1,Mhh,Msigma1,           & 
& Mhh2,Msigma12,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Msigma1,Mhh2(2),Msigma12

Complex(dp), Intent(in) :: cplhhhhsigma1(2,2)

Complex(dp) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
    Do gt3=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Msigma1 
Mex3 = Mhh(gt3) 
! Tree-Level Vertex 
coupT1 = cplhhhhsigma1(gt1,gt3)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt3) = AmpC 
    End Do
End Do
End Subroutine Amplitude_Tree_THDMIIIHB_hhTosigma1hh


Subroutine Gamma_Real_THDMIIIHB_hhTosigma1hh(MLambda,em,gs,cplhhhhsigma1,             & 
& Mhh,Msigma1,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhhhsigma1(2,2)

Real(dp), Intent(in) :: Mhh(2),Msigma1

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,2), GammarealGluon(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
    Do i3=1,2
Coup = cplhhhhsigma1(i1,i3)
Mex1 = Mhh(i1)
Mex2 = Msigma1
Mex3 = Mhh(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i1,i3) = 0._dp 
  GammarealGluon(i1,i3) = 0._dp 
Else 
  GammarealGluon(i1,i3) = 0._dp 
  GammarealPhoton(i1,i3) = 0._dp 

End if 
    End Do
End Do
End Subroutine Gamma_Real_THDMIIIHB_hhTosigma1hh


Subroutine Amplitude_WAVE_THDMIIIHB_hhTosigma1hh(cplhhhhsigma1,ctcplhhhhsigma1,       & 
& Mhh,Mhh2,Msigma1,Msigma12,Zfhh,Zfsigma1,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),Msigma1,Msigma12

Complex(dp), Intent(in) :: cplhhhhsigma1(2,2)

Complex(dp), Intent(in) :: ctcplhhhhsigma1(2,2)

Complex(dp), Intent(in) :: Zfhh(2,2),Zfsigma1

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
    Do gt3=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Msigma1 
Mex3 = Mhh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhhhsigma1(gt1,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhhhsigma1(i1,gt3)
End Do


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfsigma1*cplhhhhsigma1(gt1,gt3)


! External Field 3 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt3)*cplhhhhsigma1(gt1,i1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt3) = AmpC 
    End Do
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_hhTosigma1hh


Subroutine Amplitude_VERTEX_THDMIIIHB_hhTosigma1hh(MAh,MFd,MFe,MFu,Mhh,               & 
& MHm,Msigma1,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhhh,      & 
& cplAhAhsigma1,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhsigma1sigma1,cplcFdFdhhL,         & 
& cplcFdFdhhR,cplcFdFdsigma1L,cplcFdFdsigma1R,cplcFeFehhL,cplcFeFehhR,cplcFeFesigma1L,   & 
& cplcFeFesigma1R,cplcFuFuhhL,cplcFuFuhhR,cplcFuFusigma1L,cplcFuFusigma1R,               & 
& cplcgWmgWmhh,cplcgWmgWmsigma1,cplcgWpCgWpChh,cplcgWpCgWpCsigma1,cplhhhhhh,             & 
& cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,cplhhcHmVWm,      & 
& cplhhcVWmVWm,cplHmsigma1cHm,cplHmsigma1cVWm,cplsigma1sigma1sigma1,cplsigma1cHmVWm,     & 
& cplAhAhhhhh1,cplAhAhhhsigma11,cplAhhhhhhh1,cplAhhhhhsigma11,cplAhhhsigma1sigma11,      & 
& cplhhhhhhhh1,cplhhhhhhsigma11,cplhhhhHmcHm1,cplhhhhsigma1sigma11,cplhhHmsigma1cHm1,    & 
& cplhhsigma1sigma1sigma11,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVWm,MVZ,MAh2,MFd2(3),MFe2(3),         & 
& MFu2(3),Mhh2(2),MHm2(2),Msigma12,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhAhsigma1,cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhhhVZ(2),              & 
& cplAhsigma1sigma1,cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdsigma1L(3,3),          & 
& cplcFdFdsigma1R(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFesigma1L(3,3),       & 
& cplcFeFesigma1R(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFusigma1L(3,3),       & 
& cplcFuFusigma1R(3,3),cplcgWmgWmhh(2),cplcgWmgWmsigma1,cplcgWpCgWpChh(2),               & 
& cplcgWpCgWpCsigma1,cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),              & 
& cplhhHmcVWm(2,2),cplhhsigma1sigma1(2),cplhhsigma1VZ(2),cplhhcHmVWm(2,2),               & 
& cplhhcVWmVWm(2),cplHmsigma1cHm(2,2),cplHmsigma1cVWm(2),cplsigma1sigma1sigma1,          & 
& cplsigma1cHmVWm(2),cplAhAhhhhh1(2,2),cplAhAhhhsigma11(2),cplAhhhhhhh1(2,2,2),          & 
& cplAhhhhhsigma11(2,2),cplAhhhsigma1sigma11(2),cplhhhhhhhh1(2,2,2,2),cplhhhhhhsigma11(2,2,2),& 
& cplhhhhHmcHm1(2,2,2,2),cplhhhhsigma1sigma11(2,2),cplhhHmsigma1cHm1(2,2,2),             & 
& cplhhsigma1sigma1sigma11(2)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
    Do gt3=1,2
Amp(gt1, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Msigma1 
Mex3 = Mhh(gt3) 


! {Ah, Ah, Ah}
ML1 = MAh 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhsigma1
coup3 = cplAhAhhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 


! {Ah, hh, Ah}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhsigma1
coup3 = cplAhhhhh(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, sigma1, Ah}
ML1 = MAh 
ML2 = Msigma1 
ML3 = MAh 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhAhsigma1
coup3 = cplAhhhsigma1(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 


! {Ah, VZ, Ah}
ML1 = MAh 
ML2 = MVZ 
ML3 = MAh 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhAhsigma1
coup3 = -cplAhhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhhhsigma1(i3)
coup3 = cplAhhhhh(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhhhsigma1(i3)
coup3 = cplhhhhhh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, sigma1, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhhhsigma1(i3)
coup3 = cplhhhhsigma1(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, Ah, sigma1}
ML1 = MAh 
ML2 = MAh 
ML3 = Msigma1 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhsigma1sigma1
coup3 = cplAhhhsigma1(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 


! {Ah, hh, sigma1}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhsigma1sigma1
coup3 = cplhhhhsigma1(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, sigma1, sigma1}
ML1 = MAh 
ML2 = Msigma1 
ML3 = Msigma1 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhsigma1sigma1
coup3 = cplhhsigma1sigma1(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 


! {Ah, VZ, sigma1}
ML1 = MAh 
ML2 = MVZ 
ML3 = Msigma1 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhsigma1sigma1
coup3 = cplhhsigma1VZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdsigma1L(i1,i3)
coup2R = cplcFdFdsigma1R(i1,i3)
coup3L = cplcFdFdhhL(i3,i2,gt3)
coup3R = cplcFdFdhhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFesigma1L(i1,i3)
coup2R = cplcFeFesigma1R(i1,i3)
coup3L = cplcFeFehhL(i3,i2,gt3)
coup3R = cplcFeFehhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFusigma1L(i1,i3)
coup2R = cplcFuFusigma1R(i1,i3)
coup3L = cplcFuFuhhL(i3,i2,gt3)
coup3R = cplcFuFuhhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWm, gWm, gWm}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgWmsigma1
coup3 = cplcgWmgWmhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(2)*AmpC 


! {gWmC, gWmC, gWmC}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgWpCsigma1
coup3 = cplcgWpCgWpChh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(2)*AmpC 


! {hh, Ah, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplAhhhsigma1(i1)
coup3 = cplAhAhhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhsigma1(i1)
coup3 = cplAhhhhh(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, sigma1, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = MAh 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplAhhhsigma1(i1)
coup3 = cplAhhhsigma1(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, Ah, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplhhhhsigma1(i1,i3)
coup3 = cplAhhhhh(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, hh}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhsigma1(i1,i3)
coup3 = cplhhhhhh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, sigma1, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplhhhhsigma1(i1,i3)
coup3 = cplhhhhsigma1(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, Ah, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Msigma1 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplhhsigma1sigma1(i1)
coup3 = cplAhhhsigma1(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, sigma1}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhsigma1sigma1(i1)
coup3 = cplhhhhsigma1(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, sigma1, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = Msigma1 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplhhsigma1sigma1(i1)
coup3 = cplhhsigma1sigma1(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, Ah, VZ}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MVZ 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplhhsigma1VZ(i1)
coup3 = -cplAhhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, sigma1, VZ}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = MVZ 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplhhsigma1VZ(i1)
coup3 = cplhhsigma1VZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Hm, Hm, Hm}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplHmsigma1cHm(i3,i1)
coup3 = cplhhHmcHm(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, VWm, Hm}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = -cplhhHmcVWm(gt1,i1)
coup2 = cplHmsigma1cHm(i3,i1)
coup3 = cplhhcHmVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, VWm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = -cplsigma1cHmVWm(i1)
coup3 = cplhhHmcVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, VWm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplhhHmcVWm(gt1,i1)
coup2 = -cplsigma1cHmVWm(i1)
coup3 = cplhhcVWmVWm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
End Do


! {sigma1, Ah, Ah}
ML1 = Msigma1 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhsigma1sigma1
coup3 = cplAhAhhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 


! {sigma1, hh, Ah}
  Do i2=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplAhsigma1sigma1
coup3 = cplAhhhhh(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {sigma1, sigma1, Ah}
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = MAh 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplAhsigma1sigma1
coup3 = cplAhhhsigma1(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 


! {sigma1, VZ, Ah}
ML1 = Msigma1 
ML2 = MVZ 
ML3 = MAh 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = cplAhsigma1sigma1
coup3 = -cplAhhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 


! {sigma1, Ah, hh}
    Do i3=1,2
ML1 = Msigma1 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplhhsigma1sigma1(i3)
coup3 = cplAhhhhh(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplhhsigma1sigma1(i3)
coup3 = cplhhhhhh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {sigma1, sigma1, hh}
    Do i3=1,2
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplhhsigma1sigma1(i3)
coup3 = cplhhhhsigma1(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, Ah, sigma1}
ML1 = Msigma1 
ML2 = MAh 
ML3 = Msigma1 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplsigma1sigma1sigma1
coup3 = cplAhhhsigma1(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 


! {sigma1, hh, sigma1}
  Do i2=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplsigma1sigma1sigma1
coup3 = cplhhhhsigma1(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {sigma1, sigma1, sigma1}
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = Msigma1 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplsigma1sigma1sigma1
coup3 = cplhhsigma1sigma1(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 


! {sigma1, VZ, sigma1}
ML1 = Msigma1 
ML2 = MVZ 
ML3 = Msigma1 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = cplsigma1sigma1sigma1
coup3 = cplhhsigma1VZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 


! {VWm, Hm, Hm}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhcHmVWm(gt1,i2)
coup2 = cplHmsigma1cVWm(i3)
coup3 = cplhhHmcHm(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, VWm, Hm}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplHmsigma1cVWm(i3)
coup3 = cplhhcHmVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, Ah, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = cplhhsigma1VZ(i3)
coup3 = cplAhhhhh(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, sigma1, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = cplhhsigma1VZ(i3)
coup3 = cplhhhhsigma1(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {conj[Hm], conj[VWm], conj[Hm]}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = -cplhhcHmVWm(gt1,i1)
coup2 = cplHmsigma1cHm(i1,i3)
coup3 = cplhhHmcVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[Hm], conj[Hm], conj[VWm]}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplHmsigma1cVWm(i1)
coup3 = cplhhcHmVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], conj[VWm], conj[VWm]}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplhhcHmVWm(gt1,i1)
coup2 = cplHmsigma1cVWm(i1)
coup3 = cplhhcVWmVWm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
End Do


! {conj[VWm], conj[Hm], conj[Hm]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhHmcVWm(gt1,i2)
coup2 = -cplsigma1cHmVWm(i3)
coup3 = cplhhHmcHm(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWm], conj[VWm], conj[Hm]}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = -cplsigma1cHmVWm(i3)
coup3 = cplhhHmcVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhhhsigma11(gt3)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhhhhhsigma11(gt3,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, sigma1}
ML1 = MAh 
ML2 = Msigma1 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhhhsigma1sigma11(gt3)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhhhsigma11(gt3,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do


! {hh, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplhhhhsigma1sigma11(gt3,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Hm, Hm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplhhHmsigma1cHm1(gt3,i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {sigma1, sigma1}
ML1 = Msigma1 
ML2 = Msigma1 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplhhsigma1sigma1sigma11(gt3)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhhhh1(gt1,gt3)
coup2 = cplAhAhsigma1
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhhhhhhh1(gt1,gt3,i2)
coup2 = cplAhhhsigma1(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 

  End Do


! {Ah, sigma1}
ML1 = MAh 
ML2 = Msigma1 
coup1 = cplAhhhhhsigma11(gt1,gt3)
coup2 = cplAhsigma1sigma1
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 



! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhhhh1(gt1,gt3,i1,i2)
coup2 = cplhhhhsigma1(i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {hh, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
coup1 = cplhhhhhhsigma11(gt1,gt3,i1)
coup2 = cplhhsigma1sigma1(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 

End Do


! {Hm, Hm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhhhHmcHm1(gt1,gt3,i1,i2)
coup2 = cplHmsigma1cHm(i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {sigma1, sigma1}
ML1 = Msigma1 
ML2 = Msigma1 
coup1 = cplhhhhsigma1sigma11(gt1,gt3)
coup2 = cplsigma1sigma1sigma1
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhhsigma11(gt1)
coup2 = cplAhAhhh(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhhhhhsigma11(gt1,i2)
coup2 = cplAhhhhh(gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 

  End Do


! {Ah, sigma1}
ML1 = MAh 
ML2 = Msigma1 
coup1 = cplAhhhsigma1sigma11(gt1)
coup2 = cplAhhhsigma1(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 



! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhhsigma11(gt1,i1,i2)
coup2 = cplhhhhhh(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {hh, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
coup1 = cplhhhhsigma1sigma11(gt1,i1)
coup2 = cplhhhhsigma1(gt3,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 

End Do


! {Hm, Hm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmsigma1cHm1(gt1,i1,i2)
coup2 = cplhhHmcHm(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {sigma1, sigma1}
ML1 = Msigma1 
ML2 = Msigma1 
coup1 = cplhhsigma1sigma1sigma11(gt1)
coup2 = cplhhsigma1sigma1(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt3) = Amp(gt1, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

    End Do
End Do
End Subroutine Amplitude_VERTEX_THDMIIIHB_hhTosigma1hh


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhTosigma1hh(MAh,MFd,MFe,MFu,Mhh,            & 
& MHm,Msigma1,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhhh,      & 
& cplAhAhsigma1,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhsigma1sigma1,cplcFdFdhhL,         & 
& cplcFdFdhhR,cplcFdFdsigma1L,cplcFdFdsigma1R,cplcFeFehhL,cplcFeFehhR,cplcFeFesigma1L,   & 
& cplcFeFesigma1R,cplcFuFuhhL,cplcFuFuhhR,cplcFuFusigma1L,cplcFuFusigma1R,               & 
& cplcgWmgWmhh,cplcgWmgWmsigma1,cplcgWpCgWpChh,cplcgWpCgWpCsigma1,cplhhhhhh,             & 
& cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,cplhhcHmVWm,      & 
& cplhhcVWmVWm,cplHmsigma1cHm,cplHmsigma1cVWm,cplsigma1sigma1sigma1,cplsigma1cHmVWm,     & 
& cplAhAhhhhh1,cplAhAhhhsigma11,cplAhhhhhhh1,cplAhhhhhsigma11,cplAhhhsigma1sigma11,      & 
& cplhhhhhhhh1,cplhhhhhhsigma11,cplhhhhHmcHm1,cplhhhhsigma1sigma11,cplhhHmsigma1cHm1,    & 
& cplhhsigma1sigma1sigma11,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVWm,MVZ,MAh2,MFd2(3),MFe2(3),         & 
& MFu2(3),Mhh2(2),MHm2(2),Msigma12,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhAhsigma1,cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhhhVZ(2),              & 
& cplAhsigma1sigma1,cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdsigma1L(3,3),          & 
& cplcFdFdsigma1R(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFesigma1L(3,3),       & 
& cplcFeFesigma1R(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFusigma1L(3,3),       & 
& cplcFuFusigma1R(3,3),cplcgWmgWmhh(2),cplcgWmgWmsigma1,cplcgWpCgWpChh(2),               & 
& cplcgWpCgWpCsigma1,cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),              & 
& cplhhHmcVWm(2,2),cplhhsigma1sigma1(2),cplhhsigma1VZ(2),cplhhcHmVWm(2,2),               & 
& cplhhcVWmVWm(2),cplHmsigma1cHm(2,2),cplHmsigma1cVWm(2),cplsigma1sigma1sigma1,          & 
& cplsigma1cHmVWm(2),cplAhAhhhhh1(2,2),cplAhAhhhsigma11(2),cplAhhhhhhh1(2,2,2),          & 
& cplAhhhhhsigma11(2,2),cplAhhhsigma1sigma11(2),cplhhhhhhhh1(2,2,2,2),cplhhhhhhsigma11(2,2,2),& 
& cplhhhhHmcHm1(2,2,2,2),cplhhhhsigma1sigma11(2,2),cplhhHmsigma1cHm1(2,2,2),             & 
& cplhhsigma1sigma1sigma11(2)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
    Do gt3=1,2
Amp(gt1, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Msigma1 
Mex3 = Mhh(gt3) 
    End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhTosigma1hh


Subroutine Amplitude_Tree_THDMIIIHB_hhTocHmHm(cplhhHmcHm,Mhh,MHm,Mhh2,MHm2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),MHm(2),Mhh2(2),MHm2(2)

Complex(dp), Intent(in) :: cplhhHmcHm(2,2,2)

Complex(dp) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MHm(gt3) 
! Tree-Level Vertex 
coupT1 = cplhhHmcHm(gt1,gt3,gt2)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_THDMIIIHB_hhTocHmHm


Subroutine Gamma_Real_THDMIIIHB_hhTocHmHm(MLambda,em,gs,cplhhHmcHm,Mhh,               & 
& MHm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhHmcHm(2,2,2)

Real(dp), Intent(in) :: Mhh(2),MHm(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,2,2), GammarealGluon(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
  Do i2=2,2
    Do i3=2,2
Coup = cplhhHmcHm(i1,i3,i2)
Mex1 = Mhh(i1)
Mex2 = MHm(i2)
Mex3 = MHm(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp,-1._dp,1._dp,Coup,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_THDMIIIHB_hhTocHmHm


Subroutine Amplitude_WAVE_THDMIIIHB_hhTocHmHm(cplhhHmcHm,ctcplhhHmcHm,Mhh,            & 
& Mhh2,MHm,MHm2,Zfhh,ZfHm,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MHm(2),MHm2(2)

Complex(dp), Intent(in) :: cplhhHmcHm(2,2,2)

Complex(dp), Intent(in) :: ctcplhhHmcHm(2,2,2)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfHm(2,2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MHm(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhHmcHm(gt1,gt3,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhHmcHm(i1,gt3,gt2)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfHm(i1,gt2))*cplhhHmcHm(gt1,gt3,i1)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfHm(i1,gt3)*cplhhHmcHm(gt1,i1,gt2)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_hhTocHmHm


Subroutine Amplitude_VERTEX_THDMIIIHB_hhTocHmHm(MAh,MFd,MFe,MFu,Mhh,MHm,              & 
& Msigma1,MVP,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,           & 
& cplAhAhhh,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhcHmVWm,        & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHmL,cplcFuFdcHmR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFvFecHmL,cplcFvFecHmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHmL,cplcFdFuHmR,             & 
& cplcFeFvHmL,cplcFeFvHmR,cplcgWmgWmhh,cplcgZgWmcHm,cplcgWpCgWpChh,cplcgZgWpCHm,         & 
& cplcgZgZhh,cplcgWmgZHm,cplcgWpCgZcHm,cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,               & 
& cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,        & 
& cplHmsigma1cHm,cplHmsigma1cVWm,cplHmcHmVP,cplHmcVWmVP,cplHmcHmVZ,cplHmcVWmVZ,          & 
& cplsigma1cHmVWm,cplcHmVPVWm,cplcHmVWmVZ,cplAhAhHmcHm1,cplAhhhHmcHm1,cplAhHmsigma1cHm1, & 
& cplhhhhHmcHm1,cplhhHmsigma1cHm1,cplhhHmcVWmVP1,cplhhHmcVWmVZ1,cplhhcHmVPVWm1,          & 
& cplhhcHmVWmVZ1,cplHmHmcHmcHm1,cplHmsigma1sigma1cHm1,cplHmcHmcVWmVWm1,cplHmcHmVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVP,MVWm,MVZ,MAh2,MFd2(3),             & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(2),Msigma12,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhhhVZ(2),cplAhHmcHm(2,2),            & 
& cplAhHmcVWm(2),cplAhcHmVWm(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdcHmL(3,3,2),& 
& cplcFuFdcHmR(3,3,2),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFvFecHmL(3,3,2),         & 
& cplcFvFecHmR(3,3,2),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFdFuHmL(3,3,2),          & 
& cplcFdFuHmR(3,3,2),cplcFeFvHmL(3,3,2),cplcFeFvHmR(3,3,2),cplcgWmgWmhh(2),              & 
& cplcgZgWmcHm(2),cplcgWpCgWpChh(2),cplcgZgWpCHm(2),cplcgZgZhh(2),cplcgWmgZHm(2),        & 
& cplcgWpCgZcHm(2),cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),cplhhHmcVWm(2,2),& 
& cplhhsigma1sigma1(2),cplhhsigma1VZ(2),cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplhhVZVZ(2),   & 
& cplHmsigma1cHm(2,2),cplHmsigma1cVWm(2),cplHmcHmVP(2,2),cplHmcVWmVP(2),cplHmcHmVZ(2,2), & 
& cplHmcVWmVZ(2),cplsigma1cHmVWm(2),cplcHmVPVWm(2),cplcHmVWmVZ(2),cplAhAhHmcHm1(2,2),    & 
& cplAhhhHmcHm1(2,2,2),cplAhHmsigma1cHm1(2,2),cplhhhhHmcHm1(2,2,2,2),cplhhHmsigma1cHm1(2,2,2),& 
& cplhhHmcVWmVP1(2,2),cplhhHmcVWmVZ1(2,2),cplhhcHmVPVWm1(2,2),cplhhcHmVWmVZ1(2,2),       & 
& cplHmHmcHmcHm1(2,2,2,2),cplHmsigma1sigma1cHm1(2,2),cplHmcHmcVWmVWm1(2,2),              & 
& cplHmcHmVZVZ1(2,2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,2
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MHm(gt3) 


! {Ah, Ah, Hm}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhHmcHm(i3,gt2)
coup3 = cplAhHmcHm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, Hm}
  Do i2=1,2
    Do i3=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhHmcHm(i3,gt2)
coup3 = cplhhHmcHm(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, sigma1, Hm}
    Do i3=1,2
ML1 = MAh 
ML2 = Msigma1 
ML3 = MHm(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhHmcHm(i3,gt2)
coup3 = cplHmsigma1cHm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, VZ, Hm}
    Do i3=1,2
ML1 = MAh 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhHmcHm(i3,gt2)
coup3 = cplHmcHmVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, Ah, VWm}
ML1 = MAh 
ML2 = MAh 
ML3 = MVWm 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhcHmVWm(gt2)
coup3 = -cplAhHmcVWm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, hh, VWm}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhcHmVWm(gt2)
coup3 = -cplhhHmcVWm(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, sigma1, VWm}
ML1 = MAh 
ML2 = Msigma1 
ML3 = MVWm 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhcHmVWm(gt2)
coup3 = cplHmsigma1cVWm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, VZ, VWm}
ML1 = MAh 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhcHmVWm(gt2)
coup3 = cplHmcVWmVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Fu, Fu, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFdcHmL(i1,i3,gt2)
coup2R = cplcFuFdcHmR(i1,i3,gt2)
coup3L = cplcFdFuHmL(i3,i2,gt3)
coup3R = cplcFdFuHmR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {gWmC, gWmC, gZ}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgZcHm(gt2)
coup3 = cplcgZgWpCHm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {gZ, gZ, gWm}
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgZgWmcHm(gt2)
coup3 = cplcgWmgZHm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {hh, Ah, Hm}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplhhHmcHm(i1,i3,gt2)
coup3 = cplAhHmcHm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, Hm}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhHmcHm(i1,i3,gt2)
coup3 = cplhhHmcHm(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, sigma1, Hm}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = MHm(i3) 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplhhHmcHm(i1,i3,gt2)
coup3 = cplHmsigma1cHm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, Ah, VWm}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MVWm 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplhhcHmVWm(i1,gt2)
coup3 = -cplAhHmcVWm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, VWm}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhcHmVWm(i1,gt2)
coup3 = -cplhhHmcVWm(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, sigma1, VWm}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = MVWm 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplhhcHmVWm(i1,gt2)
coup3 = cplHmsigma1cVWm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {sigma1, Ah, Hm}
    Do i3=1,2
ML1 = Msigma1 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplHmsigma1cHm(i3,gt2)
coup3 = cplAhHmcHm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, hh, Hm}
  Do i2=1,2
    Do i3=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplHmsigma1cHm(i3,gt2)
coup3 = cplhhHmcHm(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {sigma1, sigma1, Hm}
    Do i3=1,2
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = MHm(i3) 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplHmsigma1cHm(i3,gt2)
coup3 = cplHmsigma1cHm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, VZ, Hm}
    Do i3=1,2
ML1 = Msigma1 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = cplHmsigma1cHm(i3,gt2)
coup3 = cplHmcHmVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, Ah, VWm}
ML1 = Msigma1 
ML2 = MAh 
ML3 = MVWm 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplsigma1cHmVWm(gt2)
coup3 = -cplAhHmcVWm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {sigma1, hh, VWm}
  Do i2=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplsigma1cHmVWm(gt2)
coup3 = -cplhhHmcVWm(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {sigma1, sigma1, VWm}
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = MVWm 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplsigma1cHmVWm(gt2)
coup3 = cplHmsigma1cVWm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {sigma1, VZ, VWm}
ML1 = Msigma1 
ML2 = MVZ 
ML3 = MVWm 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = cplsigma1cHmVWm(gt2)
coup3 = cplHmcVWmVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VZ, Ah, Hm}
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = cplHmcHmVZ(i3,gt2)
coup3 = cplAhHmcHm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, sigma1, Hm}
    Do i3=1,2
ML1 = MVZ 
ML2 = Msigma1 
ML3 = MHm(i3) 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = cplHmcHmVZ(i3,gt2)
coup3 = cplHmsigma1cHm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, VZ, Hm}
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplHmcHmVZ(i3,gt2)
coup3 = cplHmcHmVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, Ah, VWm}
ML1 = MVZ 
ML2 = MAh 
ML3 = MVWm 
coup1 = cplAhhhVZ(gt1)
coup2 = cplcHmVWmVZ(gt2)
coup3 = -cplAhHmcVWm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VZ, sigma1, VWm}
ML1 = MVZ 
ML2 = Msigma1 
ML3 = MVWm 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = cplcHmVWmVZ(gt2)
coup3 = cplHmsigma1cVWm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VZ, VZ, VWm}
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplhhVZVZ(gt1)
coup2 = cplcHmVWmVZ(gt2)
coup3 = cplHmcVWmVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {bar[Fd], bar[Fd], bar[Fu]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFuFdcHmL(i3,i1,gt2)
coup2R = cplcFuFdcHmR(i3,i1,gt2)
coup3L = cplcFdFuHmL(i2,i3,gt3)
coup3R = cplcFdFuHmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {bar[Fe], bar[Fe], bar[Fv]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = 0. 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcFvFecHmL(i3,i1,gt2)
coup2R = cplcFvFecHmR(i3,i1,gt2)
coup3L = cplcFeFvHmL(i2,i3,gt3)
coup3R = cplcFeFvHmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {bar[gWm], bar[gWm], bar[gZ]}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgZgWmcHm(gt2)
coup3 = cplcgWmgZHm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {bar[gZ], bar[gZ], bar[gWmC]}
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgWpCgZcHm(gt2)
coup3 = cplcgZgWpCHm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {conj[Hm], conj[Hm], Ah}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MAh 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplAhHmcHm(i1,gt2)
coup3 = cplAhHmcHm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], conj[VWm], Ah}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MAh 
coup1 = -cplhhcHmVWm(gt1,i1)
coup2 = cplAhHmcHm(i1,gt2)
coup3 = -cplAhHmcVWm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], hh}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplhhHmcHm(i3,i1,gt2)
coup3 = cplhhHmcHm(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[Hm], conj[VWm], hh}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = -cplhhcHmVWm(gt1,i1)
coup2 = cplhhHmcHm(i3,i1,gt2)
coup3 = -cplhhHmcVWm(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[Hm], conj[Hm], sigma1}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = Msigma1 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplHmsigma1cHm(i1,gt2)
coup3 = cplHmsigma1cHm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], conj[VWm], sigma1}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = Msigma1 
coup1 = -cplhhcHmVWm(gt1,i1)
coup2 = cplHmsigma1cHm(i1,gt2)
coup3 = cplHmsigma1cVWm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VP}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplHmcHmVP(i1,gt2)
coup3 = cplHmcHmVP(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], conj[VWm], VP}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1 = -cplhhcHmVWm(gt1,i1)
coup2 = cplHmcHmVP(i1,gt2)
coup3 = cplHmcVWmVP(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VZ}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplHmcHmVZ(i1,gt2)
coup3 = cplHmcHmVZ(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], conj[VWm], VZ}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1 = -cplhhcHmVWm(gt1,i1)
coup2 = cplHmcHmVZ(i1,gt2)
coup3 = cplHmcVWmVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {conj[VWm], conj[Hm], Ah}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MAh 
coup1 = -cplhhHmcVWm(gt1,i2)
coup2 = cplAhcHmVWm(gt2)
coup3 = cplAhHmcHm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWm], conj[VWm], Ah}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MAh 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplAhcHmVWm(gt2)
coup3 = -cplAhHmcVWm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {conj[VWm], conj[Hm], hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = -cplhhHmcVWm(gt1,i2)
coup2 = cplhhcHmVWm(i3,gt2)
coup3 = cplhhHmcHm(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWm], conj[VWm], hh}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplhhcHmVWm(i3,gt2)
coup3 = -cplhhHmcVWm(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWm], conj[Hm], sigma1}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = Msigma1 
coup1 = -cplhhHmcVWm(gt1,i2)
coup2 = cplsigma1cHmVWm(gt2)
coup3 = cplHmsigma1cHm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWm], conj[VWm], sigma1}
ML1 = MVWm 
ML2 = MVWm 
ML3 = Msigma1 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplsigma1cHmVWm(gt2)
coup3 = cplHmsigma1cVWm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {conj[VWm], conj[Hm], VP}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = -cplhhHmcVWm(gt1,i2)
coup2 = cplcHmVPVWm(gt2)
coup3 = cplHmcHmVP(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWm], conj[VWm], VP}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplcHmVPVWm(gt2)
coup3 = cplHmcVWmVP(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {conj[VWm], conj[Hm], VZ}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1 = -cplhhHmcVWm(gt1,i2)
coup2 = cplcHmVWmVZ(gt2)
coup3 = cplHmcHmVZ(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWm], conj[VWm], VZ}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplcHmVWmVZ(gt2)
coup3 = cplHmcVWmVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhHmcHm1(gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhhhHmcHm1(i2,gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, sigma1}
ML1 = MAh 
ML2 = Msigma1 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhHmsigma1cHm1(gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhHmcHm1(i1,i2,gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do


! {hh, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplhhHmsigma1cHm1(i1,gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Hm, Hm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplHmHmcHmcHm1(gt3,i2,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {sigma1, sigma1}
ML1 = Msigma1 
ML2 = Msigma1 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplHmsigma1sigma1cHm1(gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 


! {VWm, VWm}
ML1 = MVWm 
ML2 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplHmcHmcVWmVWm1(gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VZ, VZ}
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhVZVZ(gt1)
coup2 = cplHmcHmVZVZ1(gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, Hm}
  Do i2=1,2
ML1 = MAh 
ML2 = MHm(i2) 
coup1 = cplAhhhHmcHm1(gt1,gt3,i2)
coup2 = cplAhHmcHm(i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do


! {hh, Hm}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
coup1 = cplhhhhHmcHm1(gt1,i1,gt3,i2)
coup2 = cplhhHmcHm(i1,i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {sigma1, Hm}
  Do i2=1,2
ML1 = Msigma1 
ML2 = MHm(i2) 
coup1 = cplhhHmsigma1cHm1(gt1,gt3,i2)
coup2 = cplHmsigma1cHm(i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do


! {VP, VWm}
ML1 = MVP 
ML2 = MVWm 
coup1 = cplhhHmcVWmVP1(gt1,gt3)
coup2 = cplcHmVPVWm(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VZ, VWm}
ML1 = MVZ 
ML2 = MVWm 
coup1 = cplhhHmcVWmVZ1(gt1,gt3)
coup2 = cplcHmVWmVZ(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {Ah, conj[Hm]}
  Do i2=1,2
ML1 = MAh 
ML2 = MHm(i2) 
coup1 = cplAhhhHmcHm1(gt1,i2,gt2)
coup2 = cplAhHmcHm(gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do


! {hh, conj[Hm]}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
coup1 = cplhhhhHmcHm1(gt1,i1,i2,gt2)
coup2 = cplhhHmcHm(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Hm, sigma1}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = Msigma1 
coup1 = cplhhHmsigma1cHm1(gt1,i1,gt2)
coup2 = cplHmsigma1cHm(gt3,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End Do


! {VP, conj[VWm]}
ML1 = MVP 
ML2 = MVWm 
coup1 = cplhhcHmVPVWm1(gt1,gt2)
coup2 = cplHmcVWmVP(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VWm, VZ}
ML1 = MVWm 
ML2 = MVZ 
coup1 = cplhhcHmVWmVZ1(gt1,gt2)
coup2 = cplHmcVWmVZ(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_THDMIIIHB_hhTocHmHm


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhTocHmHm(MAh,MFd,MFe,MFu,Mhh,               & 
& MHm,Msigma1,MVP,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,            & 
& MVZ2,cplAhAhhh,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,               & 
& cplAhcHmVWm,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHmL,cplcFuFdcHmR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFvFecHmL,cplcFvFecHmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHmL,             & 
& cplcFdFuHmR,cplcFeFvHmL,cplcFeFvHmR,cplcgWmgWmhh,cplcgZgWmcHm,cplcgWpCgWpChh,          & 
& cplcgZgWpCHm,cplcgZgZhh,cplcgWmgZHm,cplcgWpCgZcHm,cplhhhhhh,cplhhhhsigma1,             & 
& cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,cplhhcHmVWm,cplhhcVWmVWm,       & 
& cplhhVZVZ,cplHmsigma1cHm,cplHmsigma1cVWm,cplHmcHmVP,cplHmcVWmVP,cplHmcHmVZ,            & 
& cplHmcVWmVZ,cplsigma1cHmVWm,cplcHmVPVWm,cplcHmVWmVZ,cplAhAhHmcHm1,cplAhhhHmcHm1,       & 
& cplAhHmsigma1cHm1,cplhhhhHmcHm1,cplhhHmsigma1cHm1,cplhhHmcVWmVP1,cplhhHmcVWmVZ1,       & 
& cplhhcHmVPVWm1,cplhhcHmVWmVZ1,cplHmHmcHmcHm1,cplHmsigma1sigma1cHm1,cplHmcHmcVWmVWm1,   & 
& cplHmcHmVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVP,MVWm,MVZ,MAh2,MFd2(3),             & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(2),Msigma12,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhhhVZ(2),cplAhHmcHm(2,2),            & 
& cplAhHmcVWm(2),cplAhcHmVWm(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdcHmL(3,3,2),& 
& cplcFuFdcHmR(3,3,2),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFvFecHmL(3,3,2),         & 
& cplcFvFecHmR(3,3,2),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFdFuHmL(3,3,2),          & 
& cplcFdFuHmR(3,3,2),cplcFeFvHmL(3,3,2),cplcFeFvHmR(3,3,2),cplcgWmgWmhh(2),              & 
& cplcgZgWmcHm(2),cplcgWpCgWpChh(2),cplcgZgWpCHm(2),cplcgZgZhh(2),cplcgWmgZHm(2),        & 
& cplcgWpCgZcHm(2),cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),cplhhHmcVWm(2,2),& 
& cplhhsigma1sigma1(2),cplhhsigma1VZ(2),cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplhhVZVZ(2),   & 
& cplHmsigma1cHm(2,2),cplHmsigma1cVWm(2),cplHmcHmVP(2,2),cplHmcVWmVP(2),cplHmcHmVZ(2,2), & 
& cplHmcVWmVZ(2),cplsigma1cHmVWm(2),cplcHmVPVWm(2),cplcHmVWmVZ(2),cplAhAhHmcHm1(2,2),    & 
& cplAhhhHmcHm1(2,2,2),cplAhHmsigma1cHm1(2,2),cplhhhhHmcHm1(2,2,2,2),cplhhHmsigma1cHm1(2,2,2),& 
& cplhhHmcVWmVP1(2,2),cplhhHmcVWmVZ1(2,2),cplhhcHmVPVWm1(2,2),cplhhcHmVWmVZ1(2,2),       & 
& cplHmHmcHmcHm1(2,2,2,2),cplHmsigma1sigma1cHm1(2,2),cplHmcHmcVWmVWm1(2,2),              & 
& cplHmcHmVZVZ1(2,2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,2
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MHm(gt3) 


! {conj[Hm], conj[Hm], VP}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplHmcHmVP(i1,gt2)
coup3 = cplHmcHmVP(gt3,i2)
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], conj[VWm], VP}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1 = -cplhhcHmVWm(gt1,i1)
coup2 = cplHmcHmVP(i1,gt2)
coup3 = cplHmcVWmVP(gt3)
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {conj[VWm], conj[Hm], VP}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = -cplhhHmcVWm(gt1,i2)
coup2 = cplcHmVPVWm(gt2)
coup3 = cplHmcHmVP(gt3,i2)
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWm], conj[VWm], VP}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplcHmVPVWm(gt2)
coup3 = cplHmcVWmVP(gt3)
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VP, VWm}
ML1 = MVP 
ML2 = MVWm 
coup1 = cplhhHmcVWmVP1(gt1,gt3)
coup2 = cplcHmVPVWm(gt2)
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VP, conj[VWm]}
ML1 = MVP 
ML2 = MVWm 
coup1 = cplhhcHmVPVWm1(gt1,gt2)
coup2 = cplHmcVWmVP(gt3)
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhTocHmHm


Subroutine Amplitude_Tree_THDMIIIHB_hhToHmcVWm(cplhhHmcVWm,Mhh,MHm,MVWm,              & 
& Mhh2,MHm2,MVWm2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),MHm(2),MVWm,Mhh2(2),MHm2(2),MVWm2

Complex(dp), Intent(in) :: cplhhHmcVWm(2,2)

Complex(dp) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MVWm 
! Tree-Level Vertex 
coupT1 = cplhhHmcVWm(gt1,gt2)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_THDMIIIHB_hhToHmcVWm


Subroutine Gamma_Real_THDMIIIHB_hhToHmcVWm(MLambda,em,gs,cplhhHmcVWm,Mhh,             & 
& MHm,MVWm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhHmcVWm(2,2)

Real(dp), Intent(in) :: Mhh(2),MHm(2),MVWm

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,2), GammarealGluon(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
  Do i2=2,2
Coup = cplhhHmcVWm(i1,i2)
Mex1 = Mhh(i1)
Mex2 = MHm(i2)
Mex3 = MVWm
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,em,0._dp,-1._dp,1._dp,Coup,Gammarealphoton(i1,i2),kont)
 GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_THDMIIIHB_hhToHmcVWm


Subroutine Amplitude_WAVE_THDMIIIHB_hhToHmcVWm(cplhhHmcVWm,ctcplhhHmcVWm,             & 
& Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,Zfhh,ZfHm,ZfVWm,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MHm(2),MHm2(2),MVWm,MVWm2

Complex(dp), Intent(in) :: cplhhHmcVWm(2,2)

Complex(dp), Intent(in) :: ctcplhhHmcVWm(2,2)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfHm(2,2),ZfVWm

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MVWm 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhHmcVWm(gt1,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhHmcVWm(i1,gt2)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfHm(i1,gt2)*cplhhHmcVWm(gt1,i1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVWm*cplhhHmcVWm(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_hhToHmcVWm


Subroutine Amplitude_VERTEX_THDMIIIHB_hhToHmcVWm(MAh,MFd,MFe,MFu,Mhh,MHm,             & 
& Msigma1,MVP,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,           & 
& cplAhAhhh,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplcFdFdhhL,        & 
& cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFeFehhL,cplcFeFehhR,cplcFvFecVWmL,         & 
& cplcFvFecVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHmL,cplcFdFuHmR,cplcFeFvHmL,             & 
& cplcFeFvHmR,cplcgZgAhh,cplcgWmgAHm,cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,           & 
& cplcgWpCgWpChh,cplcgZgWpCHm,cplcgZgZhh,cplcgWmgZHm,cplcgWpCgZcVWm,cplhhhhhh,           & 
& cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,cplhhcHmVWm,      & 
& cplhhcVWmVWm,cplhhVZVZ,cplHmsigma1cHm,cplHmsigma1cVWm,cplHmcHmVP,cplHmcVWmVP,          & 
& cplHmcHmVZ,cplHmcVWmVZ,cplcVWmVPVWm,cplcVWmVWmVZ,cplAhHmcVWmVZ1,cplhhhhcVWmVWm1,       & 
& cplhhHmcVWmVP1,cplhhHmcVWmVZ1,cplHmsigma1cVWmVZ1,cplHmcHmcVWmVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVP,MVWm,MVZ,MAh2,MFd2(3),             & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(2),Msigma12,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhhhVZ(2),cplAhHmcHm(2,2),            & 
& cplAhHmcVWm(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdcVWmL(3,3),               & 
& cplcFuFdcVWmR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFvFecVWmL(3,3),           & 
& cplcFvFecVWmR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFdFuHmL(3,3,2),           & 
& cplcFdFuHmR(3,3,2),cplcFeFvHmL(3,3,2),cplcFeFvHmR(3,3,2),cplcgZgAhh(2),cplcgWmgAHm(2), & 
& cplcgWmgWmhh(2),cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgWpChh(2),cplcgZgWpCHm(2),         & 
& cplcgZgZhh(2),cplcgWmgZHm(2),cplcgWpCgZcVWm,cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),       & 
& cplhhHmcHm(2,2,2),cplhhHmcVWm(2,2),cplhhsigma1sigma1(2),cplhhsigma1VZ(2),              & 
& cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplhhVZVZ(2),cplHmsigma1cHm(2,2),cplHmsigma1cVWm(2),  & 
& cplHmcHmVP(2,2),cplHmcVWmVP(2),cplHmcHmVZ(2,2),cplHmcVWmVZ(2),cplcVWmVPVWm,            & 
& cplcVWmVWmVZ,cplAhHmcVWmVZ1(2),cplhhhhcVWmVWm1(2,2),cplhhHmcVWmVP1(2,2),               & 
& cplhhHmcVWmVZ1(2,2),cplHmsigma1cVWmVZ1(2),cplHmcHmcVWmVWm1(2,2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MVWm 


! {Ah, Ah, conj[Hm]}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhHmcHm(gt2,i3)
coup3 = -cplAhHmcVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, conj[Hm]}
  Do i2=1,2
    Do i3=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhHmcHm(gt2,i3)
coup3 = -cplhhHmcVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, sigma1, conj[Hm]}
    Do i3=1,2
ML1 = MAh 
ML2 = Msigma1 
ML3 = MHm(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhHmcHm(gt2,i3)
coup3 = cplHmsigma1cVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, VZ, conj[Hm]}
    Do i3=1,2
ML1 = MAh 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhHmcHm(gt2,i3)
coup3 = cplHmcVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, conj[VWm]}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplAhhhhh(gt1,i2)
coup2 = -cplAhHmcVWm(gt2)
coup3 = cplhhcVWmVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, VZ, conj[VWm]}
ML1 = MAh 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplAhhhVZ(gt1)
coup2 = -cplAhHmcVWm(gt2)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {Fd, Fd, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFuHmL(i1,i3,gt2)
coup2R = cplcFdFuHmR(i1,i3,gt2)
coup3L = -cplcFuFdcVWmR(i3,i2)
coup3R = -cplcFuFdcVWmL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fv}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = 0. 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFvHmL(i1,i3,gt2)
coup2R = cplcFeFvHmR(i1,i3,gt2)
coup3L = -cplcFvFecVWmR(i3,i2)
coup3R = -cplcFvFecVWmL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {gWm, gWm, gP}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgAHm(gt2)
coup3 = cplcgAgWmcVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {gWm, gWm, gZ}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgZHm(gt2)
coup3 = cplcgZgWmcVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {gZ, gZ, gWmC}
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgZgWpCHm(gt2)
coup3 = cplcgWpCgZcVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {hh, Ah, conj[Hm]}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplhhHmcHm(i1,gt2,i3)
coup3 = -cplAhHmcVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, conj[Hm]}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhHmcHm(i1,gt2,i3)
coup3 = -cplhhHmcVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, sigma1, conj[Hm]}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = MHm(i3) 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplhhHmcHm(i1,gt2,i3)
coup3 = cplHmsigma1cVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, conj[VWm]}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = -cplhhHmcVWm(i1,gt2)
coup3 = cplhhcVWmVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Hm, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MAh 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplAhHmcHm(gt2,i1)
coup3 = cplAhHmcVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Hm, hh}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplhhHmcHm(i3,gt2,i1)
coup3 = cplhhHmcVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hm, VWm, hh}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = -cplhhHmcVWm(gt1,i1)
coup2 = cplhhHmcHm(i3,gt2,i1)
coup3 = cplhhcVWmVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, sigma1}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = Msigma1 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplHmsigma1cHm(gt2,i1)
coup3 = -cplHmsigma1cVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Hm, VP}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplHmcHmVP(gt2,i1)
coup3 = cplHmcVWmVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, VWm, VP}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1 = -cplhhHmcVWm(gt1,i1)
coup2 = cplHmcHmVP(gt2,i1)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Hm, Hm, VZ}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplHmcHmVZ(gt2,i1)
coup3 = cplHmcVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, VWm, VZ}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1 = -cplhhHmcVWm(gt1,i1)
coup2 = cplHmcHmVZ(gt2,i1)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {sigma1, Ah, conj[Hm]}
    Do i3=1,2
ML1 = Msigma1 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplHmsigma1cHm(gt2,i3)
coup3 = -cplAhHmcVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, hh, conj[Hm]}
  Do i2=1,2
    Do i3=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplHmsigma1cHm(gt2,i3)
coup3 = -cplhhHmcVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {sigma1, sigma1, conj[Hm]}
    Do i3=1,2
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = MHm(i3) 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplHmsigma1cHm(gt2,i3)
coup3 = cplHmsigma1cVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, VZ, conj[Hm]}
    Do i3=1,2
ML1 = Msigma1 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = cplHmsigma1cHm(gt2,i3)
coup3 = cplHmcVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, hh, conj[VWm]}
  Do i2=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplHmsigma1cVWm(gt2)
coup3 = cplhhcVWmVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {sigma1, VZ, conj[VWm]}
ML1 = Msigma1 
ML2 = MVZ 
ML3 = MVWm 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = cplHmsigma1cVWm(gt2)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {VWm, Hm, Ah}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MAh 
coup1 = -cplhhcHmVWm(gt1,i2)
coup2 = -cplAhHmcVWm(gt2)
coup3 = cplAhHmcVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VWm, Hm, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = -cplhhcHmVWm(gt1,i2)
coup2 = -cplhhHmcVWm(i3,gt2)
coup3 = cplhhHmcVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, VWm, hh}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = -cplhhHmcVWm(i3,gt2)
coup3 = cplhhcVWmVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {VWm, Hm, sigma1}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = Msigma1 
coup1 = -cplhhcHmVWm(gt1,i2)
coup2 = cplHmsigma1cVWm(gt2)
coup3 = -cplHmsigma1cVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VWm, Hm, VP}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = -cplhhcHmVWm(gt1,i2)
coup2 = cplHmcVWmVP(gt2)
coup3 = cplHmcVWmVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VWm, VWm, VP}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplHmcVWmVP(gt2)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {VWm, Hm, VZ}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1 = -cplhhcHmVWm(gt1,i2)
coup2 = cplHmcVWmVZ(gt2)
coup3 = cplHmcVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VWm, VWm, VZ}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplHmcVWmVZ(gt2)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {VZ, Ah, conj[Hm]}
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = cplHmcHmVZ(gt2,i3)
coup3 = -cplAhHmcVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, sigma1, conj[Hm]}
    Do i3=1,2
ML1 = MVZ 
ML2 = Msigma1 
ML3 = MHm(i3) 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = cplHmcHmVZ(gt2,i3)
coup3 = cplHmsigma1cVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, VZ, conj[Hm]}
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplHmcHmVZ(gt2,i3)
coup3 = cplHmcVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, VZ, conj[VWm]}
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplhhVZVZ(gt1)
coup2 = cplHmcVWmVZ(gt2)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {bar[Fu], bar[Fu], bar[Fd]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFdFuHmL(i3,i1,gt2)
coup2R = cplcFdFuHmR(i3,i1,gt2)
coup3L = cplcFuFdcVWmL(i2,i3)
coup3R = cplcFuFdcVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {bar[gWmC], bar[gWmC], bar[gZ]}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgZgWpCHm(gt2)
coup3 = cplcgWpCgZcVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {bar[gZ], bar[gP], bar[gWm]}
ML1 = MVZ 
ML2 = MVP 
ML3 = MVWm 
coup1 = cplcgZgAhh(gt1)
coup2 = cplcgWmgZHm(gt2)
coup3 = cplcgAgWmcVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {bar[gZ], bar[gZ], bar[gWm]}
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgWmgZHm(gt2)
coup3 = cplcgZgWmcVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {Ah, VZ}
ML1 = MAh 
ML2 = MVZ 
coup1 = -cplAhhhVZ(gt1)
coup2 = cplAhHmcVWmVZ1(gt2)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {Hm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
coup1 = cplhhHmcVWm(gt1,i1)
coup2 = cplHmcHmcVWmVWm1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {sigma1, VZ}
ML1 = Msigma1 
ML2 = MVZ 
coup1 = cplhhsigma1VZ(gt1)
coup2 = cplHmsigma1cVWmVZ1(gt2)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {hh, conj[VWm]}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVWm 
coup1 = cplhhhhcVWmVWm1(gt1,i1)
coup2 = -cplhhHmcVWm(i1,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Hm, VP}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVP 
coup1 = cplhhHmcVWmVP1(gt1,i1)
coup2 = cplHmcHmVP(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Hm, VZ}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVZ 
coup1 = cplhhHmcVWmVZ1(gt1,i1)
coup2 = cplHmcHmVZ(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_THDMIIIHB_hhToHmcVWm


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhToHmcVWm(MAh,MFd,MFe,MFu,Mhh,              & 
& MHm,Msigma1,MVP,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,            & 
& MVZ2,cplAhAhhh,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,               & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHmL,cplcFdFuHmR,           & 
& cplcFeFvHmL,cplcFeFvHmR,cplcgZgAhh,cplcgWmgAHm,cplcgWmgWmhh,cplcgAgWmcVWm,             & 
& cplcgZgWmcVWm,cplcgWpCgWpChh,cplcgZgWpCHm,cplcgZgZhh,cplcgWmgZHm,cplcgWpCgZcVWm,       & 
& cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,        & 
& cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHmsigma1cHm,cplHmsigma1cVWm,cplHmcHmVP,          & 
& cplHmcVWmVP,cplHmcHmVZ,cplHmcVWmVZ,cplcVWmVPVWm,cplcVWmVWmVZ,cplAhHmcVWmVZ1,           & 
& cplhhhhcVWmVWm1,cplhhHmcVWmVP1,cplhhHmcVWmVZ1,cplHmsigma1cVWmVZ1,cplHmcHmcVWmVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVP,MVWm,MVZ,MAh2,MFd2(3),             & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(2),Msigma12,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhhhVZ(2),cplAhHmcHm(2,2),            & 
& cplAhHmcVWm(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdcVWmL(3,3),               & 
& cplcFuFdcVWmR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFvFecVWmL(3,3),           & 
& cplcFvFecVWmR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFdFuHmL(3,3,2),           & 
& cplcFdFuHmR(3,3,2),cplcFeFvHmL(3,3,2),cplcFeFvHmR(3,3,2),cplcgZgAhh(2),cplcgWmgAHm(2), & 
& cplcgWmgWmhh(2),cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgWpChh(2),cplcgZgWpCHm(2),         & 
& cplcgZgZhh(2),cplcgWmgZHm(2),cplcgWpCgZcVWm,cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),       & 
& cplhhHmcHm(2,2,2),cplhhHmcVWm(2,2),cplhhsigma1sigma1(2),cplhhsigma1VZ(2),              & 
& cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplhhVZVZ(2),cplHmsigma1cHm(2,2),cplHmsigma1cVWm(2),  & 
& cplHmcHmVP(2,2),cplHmcVWmVP(2),cplHmcHmVZ(2,2),cplHmcVWmVZ(2),cplcVWmVPVWm,            & 
& cplcVWmVWmVZ,cplAhHmcVWmVZ1(2),cplhhhhcVWmVWm1(2,2),cplhhHmcVWmVP1(2,2),               & 
& cplhhHmcVWmVZ1(2,2),cplHmsigma1cVWmVZ1(2),cplHmcHmcVWmVWm1(2,2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MVWm 


! {Hm, Hm, VP}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplHmcHmVP(gt2,i1)
coup3 = cplHmcVWmVP(i2)
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, VWm, VP}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1 = -cplhhHmcVWm(gt1,i1)
coup2 = cplHmcHmVP(gt2,i1)
coup3 = -cplcVWmVPVWm
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VWm, Hm, VP}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = -cplhhcHmVWm(gt1,i2)
coup2 = cplHmcVWmVP(gt2)
coup3 = cplHmcVWmVP(i2)
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VWm, VWm, VP}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplHmcVWmVP(gt2)
coup3 = -cplcVWmVPVWm
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {Hm, VP}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVP 
coup1 = cplhhHmcVWmVP1(gt1,i1)
coup2 = cplHmcHmVP(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhToHmcVWm


Subroutine Amplitude_Tree_THDMIIIHB_hhTosigma1sigma1(cplhhsigma1sigma1,               & 
& Mhh,Msigma1,Mhh2,Msigma12,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Msigma1,Mhh2(2),Msigma12

Complex(dp), Intent(in) :: cplhhsigma1sigma1(2)

Complex(dp) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Msigma1 
Mex3 = Msigma1 
! Tree-Level Vertex 
coupT1 = cplhhsigma1sigma1(gt1)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1) = AmpC 
End Do
End Subroutine Amplitude_Tree_THDMIIIHB_hhTosigma1sigma1


Subroutine Gamma_Real_THDMIIIHB_hhTosigma1sigma1(MLambda,em,gs,cplhhsigma1sigma1,     & 
& Mhh,Msigma1,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhsigma1sigma1(2)

Real(dp), Intent(in) :: Mhh(2),Msigma1

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2), GammarealGluon(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
Coup = cplhhsigma1sigma1(i1)
Mex1 = Mhh(i1)
Mex2 = Msigma1
Mex3 = Msigma1
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i1) = 0._dp 
  GammarealGluon(i1) = 0._dp 
Else 
  GammarealGluon(i1) = 0._dp 
  GammarealPhoton(i1) = 0._dp 

End if 
End Do
End Subroutine Gamma_Real_THDMIIIHB_hhTosigma1sigma1


Subroutine Amplitude_WAVE_THDMIIIHB_hhTosigma1sigma1(cplhhsigma1sigma1,               & 
& ctcplhhsigma1sigma1,Mhh,Mhh2,Msigma1,Msigma12,Zfhh,Zfsigma1,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),Msigma1,Msigma12

Complex(dp), Intent(in) :: cplhhsigma1sigma1(2)

Complex(dp), Intent(in) :: ctcplhhsigma1sigma1(2)

Complex(dp), Intent(in) :: Zfhh(2,2),Zfsigma1

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Msigma1 
Mex3 = Msigma1 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhsigma1sigma1(gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhsigma1sigma1(i1)
End Do


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfsigma1*cplhhsigma1sigma1(gt1)


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfsigma1*cplhhsigma1sigma1(gt1)


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_hhTosigma1sigma1


Subroutine Amplitude_VERTEX_THDMIIIHB_hhTosigma1sigma1(MAh,MFd,MFe,MFu,               & 
& Mhh,MHm,Msigma1,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,            & 
& cplAhAhhh,cplAhAhsigma1,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhsigma1sigma1,           & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdsigma1L,cplcFdFdsigma1R,cplcFeFehhL,cplcFeFehhR,       & 
& cplcFeFesigma1L,cplcFeFesigma1R,cplcFuFuhhL,cplcFuFuhhR,cplcFuFusigma1L,               & 
& cplcFuFusigma1R,cplcgWmgWmhh,cplcgWmgWmsigma1,cplcgWpCgWpChh,cplcgWpCgWpCsigma1,       & 
& cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,        & 
& cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHmsigma1cHm,cplHmsigma1cVWm,cplsigma1sigma1sigma1,& 
& cplsigma1cHmVWm,cplAhAhhhsigma11,cplAhAhsigma1sigma11,cplAhhhhhsigma11,cplAhhhsigma1sigma11,& 
& cplAhsigma1sigma1sigma11,cplhhhhhhsigma11,cplhhhhsigma1sigma11,cplhhHmsigma1cHm1,      & 
& cplhhsigma1sigma1sigma11,cplHmsigma1sigma1cHm1,cplsigma1sigma1sigma1sigma11,           & 
& cplsigma1sigma1cVWmVWm1,cplsigma1sigma1VZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVWm,MVZ,MAh2,MFd2(3),MFe2(3),         & 
& MFu2(3),Mhh2(2),MHm2(2),Msigma12,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhAhsigma1,cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhhhVZ(2),              & 
& cplAhsigma1sigma1,cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdsigma1L(3,3),          & 
& cplcFdFdsigma1R(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFesigma1L(3,3),       & 
& cplcFeFesigma1R(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFusigma1L(3,3),       & 
& cplcFuFusigma1R(3,3),cplcgWmgWmhh(2),cplcgWmgWmsigma1,cplcgWpCgWpChh(2),               & 
& cplcgWpCgWpCsigma1,cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),              & 
& cplhhHmcVWm(2,2),cplhhsigma1sigma1(2),cplhhsigma1VZ(2),cplhhcHmVWm(2,2),               & 
& cplhhcVWmVWm(2),cplhhVZVZ(2),cplHmsigma1cHm(2,2),cplHmsigma1cVWm(2),cplsigma1sigma1sigma1,& 
& cplsigma1cHmVWm(2),cplAhAhhhsigma11(2),cplAhAhsigma1sigma11,cplAhhhhhsigma11(2,2),     & 
& cplAhhhsigma1sigma11(2),cplAhsigma1sigma1sigma11,cplhhhhhhsigma11(2,2,2),              & 
& cplhhhhsigma1sigma11(2,2),cplhhHmsigma1cHm1(2,2,2),cplhhsigma1sigma1sigma11(2),        & 
& cplHmsigma1sigma1cHm1(2,2),cplsigma1sigma1sigma1sigma11,cplsigma1sigma1cVWmVWm1,       & 
& cplsigma1sigma1VZVZ1

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Msigma1 
Mex3 = Msigma1 


! {Ah, Ah, Ah}
ML1 = MAh 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhsigma1
coup3 = cplAhAhsigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {Ah, hh, Ah}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhsigma1
coup3 = cplAhhhsigma1(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, sigma1, Ah}
ML1 = MAh 
ML2 = Msigma1 
ML3 = MAh 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhAhsigma1
coup3 = cplAhsigma1sigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhhhsigma1(i3)
coup3 = cplAhhhsigma1(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhhhsigma1(i3)
coup3 = cplhhhhsigma1(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, sigma1, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhhhsigma1(i3)
coup3 = cplhhsigma1sigma1(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, VZ, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhhhsigma1(i3)
coup3 = -cplhhsigma1VZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, Ah, sigma1}
ML1 = MAh 
ML2 = MAh 
ML3 = Msigma1 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhsigma1sigma1
coup3 = cplAhsigma1sigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {Ah, hh, sigma1}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhsigma1sigma1
coup3 = cplhhsigma1sigma1(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, sigma1, sigma1}
ML1 = MAh 
ML2 = Msigma1 
ML3 = Msigma1 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhsigma1sigma1
coup3 = cplsigma1sigma1sigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdsigma1L(i1,i3)
coup2R = cplcFdFdsigma1R(i1,i3)
coup3L = cplcFdFdsigma1L(i3,i2)
coup3R = cplcFdFdsigma1R(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFesigma1L(i1,i3)
coup2R = cplcFeFesigma1R(i1,i3)
coup3L = cplcFeFesigma1L(i3,i2)
coup3R = cplcFeFesigma1R(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFusigma1L(i1,i3)
coup2R = cplcFuFusigma1R(i1,i3)
coup3L = cplcFuFusigma1L(i3,i2)
coup3R = cplcFuFusigma1R(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWm, gWm, gWm}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgWmsigma1
coup3 = cplcgWmgWmsigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(2)*AmpC 


! {gWmC, gWmC, gWmC}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgWpCsigma1
coup3 = cplcgWpCgWpCsigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(2)*AmpC 


! {hh, Ah, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplAhhhsigma1(i1)
coup3 = cplAhAhsigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhsigma1(i1)
coup3 = cplAhhhsigma1(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, sigma1, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = MAh 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplAhhhsigma1(i1)
coup3 = cplAhsigma1sigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, Ah, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplhhhhsigma1(i1,i3)
coup3 = cplAhhhsigma1(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, hh}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhsigma1(i1,i3)
coup3 = cplhhhhsigma1(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, sigma1, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplhhhhsigma1(i1,i3)
coup3 = cplhhsigma1sigma1(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, Ah, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Msigma1 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplhhsigma1sigma1(i1)
coup3 = cplAhsigma1sigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, sigma1}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhsigma1sigma1(i1)
coup3 = cplhhsigma1sigma1(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, sigma1, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = Msigma1 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplhhsigma1sigma1(i1)
coup3 = cplsigma1sigma1sigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, VZ}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhsigma1VZ(i1)
coup3 = -cplhhsigma1VZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Hm, Hm}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplHmsigma1cHm(i3,i1)
coup3 = cplHmsigma1cHm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, VWm, Hm}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = -cplhhHmcVWm(gt1,i1)
coup2 = cplHmsigma1cHm(i3,i1)
coup3 = cplsigma1cHmVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, VWm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = -cplsigma1cHmVWm(i1)
coup3 = -cplHmsigma1cVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {sigma1, Ah, Ah}
ML1 = Msigma1 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhsigma1sigma1
coup3 = cplAhAhsigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {sigma1, hh, Ah}
  Do i2=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplAhsigma1sigma1
coup3 = cplAhhhsigma1(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {sigma1, sigma1, Ah}
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = MAh 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplAhsigma1sigma1
coup3 = cplAhsigma1sigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {sigma1, Ah, hh}
    Do i3=1,2
ML1 = Msigma1 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplhhsigma1sigma1(i3)
coup3 = cplAhhhsigma1(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplhhsigma1sigma1(i3)
coup3 = cplhhhhsigma1(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {sigma1, sigma1, hh}
    Do i3=1,2
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplhhsigma1sigma1(i3)
coup3 = cplhhsigma1sigma1(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, VZ, hh}
    Do i3=1,2
ML1 = Msigma1 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = cplhhsigma1sigma1(i3)
coup3 = -cplhhsigma1VZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, Ah, sigma1}
ML1 = Msigma1 
ML2 = MAh 
ML3 = Msigma1 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplsigma1sigma1sigma1
coup3 = cplAhsigma1sigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {sigma1, hh, sigma1}
  Do i2=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplsigma1sigma1sigma1
coup3 = cplhhsigma1sigma1(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {sigma1, sigma1, sigma1}
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = Msigma1 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplsigma1sigma1sigma1
coup3 = cplsigma1sigma1sigma1
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {VWm, Hm, Hm}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhcHmVWm(gt1,i2)
coup2 = cplHmsigma1cVWm(i3)
coup3 = cplHmsigma1cHm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, VWm, Hm}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplHmsigma1cVWm(i3)
coup3 = cplsigma1cHmVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, Ah, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = cplhhsigma1VZ(i3)
coup3 = cplAhhhsigma1(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, sigma1, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = cplhhsigma1VZ(i3)
coup3 = cplhhsigma1sigma1(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, VZ, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplhhsigma1VZ(i3)
coup3 = -cplhhsigma1VZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[Hm], conj[VWm], conj[Hm]}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = -cplhhcHmVWm(gt1,i1)
coup2 = cplHmsigma1cHm(i1,i3)
coup3 = -cplHmsigma1cVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[Hm], conj[Hm], conj[VWm]}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplHmsigma1cVWm(i1)
coup3 = cplsigma1cHmVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[VWm], conj[Hm], conj[Hm]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhHmcVWm(gt1,i2)
coup2 = -cplsigma1cHmVWm(i3)
coup3 = cplHmsigma1cHm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWm], conj[VWm], conj[Hm]}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = -cplsigma1cHmVWm(i3)
coup3 = -cplHmsigma1cVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhsigma1sigma11
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhhhsigma1sigma11(i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, sigma1}
ML1 = MAh 
ML2 = Msigma1 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhsigma1sigma1sigma11
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhsigma1sigma11(i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do


! {hh, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplhhsigma1sigma1sigma11(i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do


! {Hm, Hm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplHmsigma1sigma1cHm1(i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {sigma1, sigma1}
ML1 = Msigma1 
ML2 = Msigma1 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplsigma1sigma1sigma1sigma11
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 


! {VWm, VWm}
ML1 = MVWm 
ML2 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplsigma1sigma1cVWmVWm1
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {VZ, VZ}
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhVZVZ(gt1)
coup2 = cplsigma1sigma1VZVZ1
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhhsigma11(gt1)
coup2 = cplAhAhsigma1
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhhhhhsigma11(gt1,i2)
coup2 = cplAhhhsigma1(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do


! {Ah, sigma1}
ML1 = MAh 
ML2 = Msigma1 
coup1 = cplAhhhsigma1sigma11(gt1)
coup2 = cplAhsigma1sigma1
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 



! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhhsigma11(gt1,i1,i2)
coup2 = cplhhhhsigma1(i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {hh, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
coup1 = cplhhhhsigma1sigma11(gt1,i1)
coup2 = cplhhsigma1sigma1(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

End Do


! {Hm, Hm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmsigma1cHm1(gt1,i1,i2)
coup2 = cplHmsigma1cHm(i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {sigma1, sigma1}
ML1 = Msigma1 
ML2 = Msigma1 
coup1 = cplhhsigma1sigma1sigma11(gt1)
coup2 = cplsigma1sigma1sigma1
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhhsigma11(gt1)
coup2 = cplAhAhsigma1
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhhhhhsigma11(gt1,i2)
coup2 = cplAhhhsigma1(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do


! {Ah, sigma1}
ML1 = MAh 
ML2 = Msigma1 
coup1 = cplAhhhsigma1sigma11(gt1)
coup2 = cplAhsigma1sigma1
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 



! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhhsigma11(gt1,i1,i2)
coup2 = cplhhhhsigma1(i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {hh, sigma1}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
coup1 = cplhhhhsigma1sigma11(gt1,i1)
coup2 = cplhhsigma1sigma1(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

End Do


! {Hm, Hm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmsigma1cHm1(gt1,i1,i2)
coup2 = cplHmsigma1cHm(i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {sigma1, sigma1}
ML1 = Msigma1 
ML2 = Msigma1 
coup1 = cplhhsigma1sigma1sigma11(gt1)
coup2 = cplsigma1sigma1sigma1
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 

End Do
End Subroutine Amplitude_VERTEX_THDMIIIHB_hhTosigma1sigma1


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhTosigma1sigma1(MAh,MFd,MFe,MFu,            & 
& Mhh,MHm,Msigma1,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,            & 
& cplAhAhhh,cplAhAhsigma1,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhsigma1sigma1,           & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdsigma1L,cplcFdFdsigma1R,cplcFeFehhL,cplcFeFehhR,       & 
& cplcFeFesigma1L,cplcFeFesigma1R,cplcFuFuhhL,cplcFuFuhhR,cplcFuFusigma1L,               & 
& cplcFuFusigma1R,cplcgWmgWmhh,cplcgWmgWmsigma1,cplcgWpCgWpChh,cplcgWpCgWpCsigma1,       & 
& cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,        & 
& cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHmsigma1cHm,cplHmsigma1cVWm,cplsigma1sigma1sigma1,& 
& cplsigma1cHmVWm,cplAhAhhhsigma11,cplAhAhsigma1sigma11,cplAhhhhhsigma11,cplAhhhsigma1sigma11,& 
& cplAhsigma1sigma1sigma11,cplhhhhhhsigma11,cplhhhhsigma1sigma11,cplhhHmsigma1cHm1,      & 
& cplhhsigma1sigma1sigma11,cplHmsigma1sigma1cHm1,cplsigma1sigma1sigma1sigma11,           & 
& cplsigma1sigma1cVWmVWm1,cplsigma1sigma1VZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVWm,MVZ,MAh2,MFd2(3),MFe2(3),         & 
& MFu2(3),Mhh2(2),MHm2(2),Msigma12,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhAhsigma1,cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhhhVZ(2),              & 
& cplAhsigma1sigma1,cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdsigma1L(3,3),          & 
& cplcFdFdsigma1R(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFesigma1L(3,3),       & 
& cplcFeFesigma1R(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFusigma1L(3,3),       & 
& cplcFuFusigma1R(3,3),cplcgWmgWmhh(2),cplcgWmgWmsigma1,cplcgWpCgWpChh(2),               & 
& cplcgWpCgWpCsigma1,cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),              & 
& cplhhHmcVWm(2,2),cplhhsigma1sigma1(2),cplhhsigma1VZ(2),cplhhcHmVWm(2,2),               & 
& cplhhcVWmVWm(2),cplhhVZVZ(2),cplHmsigma1cHm(2,2),cplHmsigma1cVWm(2),cplsigma1sigma1sigma1,& 
& cplsigma1cHmVWm(2),cplAhAhhhsigma11(2),cplAhAhsigma1sigma11,cplAhhhhhsigma11(2,2),     & 
& cplAhhhsigma1sigma11(2),cplAhsigma1sigma1sigma11,cplhhhhhhsigma11(2,2,2),              & 
& cplhhhhsigma1sigma11(2,2),cplhhHmsigma1cHm1(2,2,2),cplhhsigma1sigma1sigma11(2),        & 
& cplHmsigma1sigma1cHm1(2,2),cplsigma1sigma1sigma1sigma11,cplsigma1sigma1cVWmVWm1,       & 
& cplsigma1sigma1VZVZ1

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Msigma1 
Mex3 = Msigma1 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhTosigma1sigma1


Subroutine Amplitude_Tree_THDMIIIHB_hhTosigma1VZ(cplhhsigma1VZ,Mhh,Msigma1,           & 
& MVZ,Mhh2,Msigma12,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Msigma1,MVZ,Mhh2(2),Msigma12,MVZ2

Complex(dp), Intent(in) :: cplhhsigma1VZ(2)

Complex(dp) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Msigma1 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1 = cplhhsigma1VZ(gt1)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_Tree_THDMIIIHB_hhTosigma1VZ


Subroutine Gamma_Real_THDMIIIHB_hhTosigma1VZ(MLambda,em,gs,cplhhsigma1VZ,             & 
& Mhh,Msigma1,MVZ,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhsigma1VZ(2)

Real(dp), Intent(in) :: Mhh(2),Msigma1,MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2), GammarealGluon(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
Coup = cplhhsigma1VZ(i1)
Mex1 = Mhh(i1)
Mex2 = Msigma1
Mex3 = MVZ
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i1) = 0._dp 
 GammarealGluon(i1) = 0._dp 
Else 
  GammarealGluon(i1) = 0._dp 
  GammarealPhoton(i1) = 0._dp 

End if 
End Do
End Subroutine Gamma_Real_THDMIIIHB_hhTosigma1VZ


Subroutine Amplitude_WAVE_THDMIIIHB_hhTosigma1VZ(cplhhsigma1VZ,ctcplhhsigma1VZ,       & 
& Mhh,Mhh2,Msigma1,Msigma12,MVZ,MVZ2,Zfhh,Zfsigma1,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),Msigma1,Msigma12,MVZ,MVZ2

Complex(dp), Intent(in) :: cplhhsigma1VZ(2)

Complex(dp), Intent(in) :: ctcplhhsigma1VZ(2)

Complex(dp), Intent(in) :: Zfhh(2,2),Zfsigma1,ZfVZ

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Msigma1 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhsigma1VZ(gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhsigma1VZ(i1)
End Do


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfsigma1*cplhhsigma1VZ(gt1)


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cplhhsigma1VZ(gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_hhTosigma1VZ


Subroutine Amplitude_VERTEX_THDMIIIHB_hhTosigma1VZ(MAh,MFd,MFe,MFu,Mhh,               & 
& MHm,Msigma1,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhhh,      & 
& cplAhAhsigma1,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhsigma1sigma1,cplcFdFdhhL,         & 
& cplcFdFdhhR,cplcFdFdsigma1L,cplcFdFdsigma1R,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,       & 
& cplcFeFehhR,cplcFeFesigma1L,cplcFeFesigma1R,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,       & 
& cplcFuFuhhR,cplcFuFusigma1L,cplcFuFusigma1R,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,      & 
& cplcgWmgWmsigma1,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCsigma1,cplcgWpCgWpCVZ,        & 
& cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,        & 
& cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHmsigma1cHm,cplHmsigma1cVWm,cplHmcHmVZ,          & 
& cplHmcVWmVZ,cplsigma1sigma1sigma1,cplsigma1cHmVWm,cplcHmVWmVZ,cplcVWmVWmVZ,            & 
& cplhhhhVZVZ1,cplhhHmcVWmVZ1,cplhhcHmVWmVZ1,cplHmsigma1cVWmVZ1,cplsigma1sigma1VZVZ1,    & 
& cplsigma1cHmVWmVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVWm,MVZ,MAh2,MFd2(3),MFe2(3),         & 
& MFu2(3),Mhh2(2),MHm2(2),Msigma12,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhAhsigma1,cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhhhVZ(2),              & 
& cplAhsigma1sigma1,cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdsigma1L(3,3),          & 
& cplcFdFdsigma1R(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3,2),             & 
& cplcFeFehhR(3,3,2),cplcFeFesigma1L(3,3),cplcFeFesigma1R(3,3),cplcFeFeVZL(3,3),         & 
& cplcFeFeVZR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFusigma1L(3,3),           & 
& cplcFuFusigma1R(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWmgWmhh(2),cplcgWmgWmsigma1,& 
& cplcgWmgWmVZ,cplcgWpCgWpChh(2),cplcgWpCgWpCsigma1,cplcgWpCgWpCVZ,cplhhhhhh(2,2,2),     & 
& cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),cplhhHmcVWm(2,2),cplhhsigma1sigma1(2),            & 
& cplhhsigma1VZ(2),cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplhhVZVZ(2),cplHmsigma1cHm(2,2),    & 
& cplHmsigma1cVWm(2),cplHmcHmVZ(2,2),cplHmcVWmVZ(2),cplsigma1sigma1sigma1,               & 
& cplsigma1cHmVWm(2),cplcHmVWmVZ(2),cplcVWmVWmVZ,cplhhhhVZVZ1(2,2),cplhhHmcVWmVZ1(2,2),  & 
& cplhhcHmVWmVZ1(2,2),cplHmsigma1cVWmVZ1(2),cplsigma1sigma1VZVZ1,cplsigma1cHmVWmVZ1(2)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Msigma1 
Mex3 = MVZ 


! {Ah, hh, Ah}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhsigma1
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhhhsigma1(i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, sigma1, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhhhsigma1(i3)
coup3 = cplhhsigma1VZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, VZ, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhhhsigma1(i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, sigma1}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhsigma1sigma1
coup3 = -cplhhsigma1VZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdsigma1L(i1,i3)
coup2R = cplcFdFdsigma1R(i1,i3)
coup3L = -cplcFdFdVZR(i3,i2)
coup3R = -cplcFdFdVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFesigma1L(i1,i3)
coup2R = cplcFeFesigma1R(i1,i3)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFusigma1L(i1,i3)
coup2R = cplcFuFusigma1R(i1,i3)
coup3L = -cplcFuFuVZR(i3,i2)
coup3R = -cplcFuFuVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWm, gWm, gWm}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgWmsigma1
coup3 = cplcgWmgWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {gWmC, gWmC, gWmC}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgWpCsigma1
coup3 = cplcgWpCgWpCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhsigma1(i1)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, Ah, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplhhhhsigma1(i1,i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, sigma1, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplhhhhsigma1(i1,i3)
coup3 = cplhhsigma1VZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, sigma1}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhsigma1sigma1(i1)
coup3 = -cplhhsigma1VZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, hh, VZ}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = -cplhhsigma1VZ(i1)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Hm, Hm}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplHmsigma1cHm(i3,i1)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, VWm, Hm}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = -cplhhHmcVWm(gt1,i1)
coup2 = cplHmsigma1cHm(i3,i1)
coup3 = cplcHmVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, VWm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplsigma1cHmVWm(i1)
coup3 = cplHmcVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, VWm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplhhHmcVWm(gt1,i1)
coup2 = cplsigma1cHmVWm(i1)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {sigma1, hh, Ah}
  Do i2=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplAhsigma1sigma1
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {sigma1, Ah, hh}
    Do i3=1,2
ML1 = Msigma1 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplhhsigma1sigma1(i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, sigma1, hh}
    Do i3=1,2
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplhhsigma1sigma1(i3)
coup3 = cplhhsigma1VZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, VZ, hh}
    Do i3=1,2
ML1 = Msigma1 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = cplhhsigma1sigma1(i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, hh, sigma1}
  Do i2=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplsigma1sigma1sigma1
coup3 = -cplhhsigma1VZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {VWm, Hm, Hm}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhcHmVWm(gt1,i2)
coup2 = -cplHmsigma1cVWm(i3)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, VWm, Hm}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = -cplHmsigma1cVWm(i3)
coup3 = cplcHmVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, Ah, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = -cplhhsigma1VZ(i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, sigma1, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = -cplhhsigma1VZ(i3)
coup3 = cplhhsigma1VZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, VZ, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = -cplhhsigma1VZ(i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[Hm], conj[VWm], conj[Hm]}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = -cplhhcHmVWm(gt1,i1)
coup2 = cplHmsigma1cHm(i1,i3)
coup3 = cplHmcVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[Hm], conj[Hm], conj[VWm]}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = -cplHmsigma1cVWm(i1)
coup3 = cplcHmVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], conj[VWm], conj[VWm]}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplhhcHmVWm(gt1,i1)
coup2 = -cplHmsigma1cVWm(i1)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {conj[VWm], conj[Hm], conj[Hm]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhHmcVWm(gt1,i2)
coup2 = cplsigma1cHmVWm(i3)
coup3 = cplHmcHmVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWm], conj[VWm], conj[Hm]}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplsigma1cHmVWm(i3)
coup3 = cplHmcVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Hm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
coup1 = cplhhHmcVWm(gt1,i1)
coup2 = cplsigma1cHmVWmVZ1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {sigma1, VZ}
ML1 = Msigma1 
ML2 = MVZ 
coup1 = cplhhsigma1VZ(gt1)
coup2 = cplsigma1sigma1VZVZ1
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {VWm, Hm}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
coup1 = cplhhcHmVWm(gt1,i2)
coup2 = cplHmsigma1cVWmVZ1(i2)
Call Amp_VERTEX_StoSV_Topology2_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {hh, VZ}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplhhhhVZVZ1(gt1,i1)
coup2 = -cplhhsigma1VZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {Hm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
coup1 = cplhhHmcVWmVZ1(gt1,i1)
coup2 = cplsigma1cHmVWm(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {VWm, Hm}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
coup1 = cplhhcHmVWmVZ1(gt1,i2)
coup2 = -cplHmsigma1cVWm(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

  End Do
End Do
End Subroutine Amplitude_VERTEX_THDMIIIHB_hhTosigma1VZ


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhTosigma1VZ(MAh,MFd,MFe,MFu,Mhh,            & 
& MHm,Msigma1,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhhh,      & 
& cplAhAhsigma1,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhsigma1sigma1,cplcFdFdhhL,         & 
& cplcFdFdhhR,cplcFdFdsigma1L,cplcFdFdsigma1R,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,       & 
& cplcFeFehhR,cplcFeFesigma1L,cplcFeFesigma1R,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,       & 
& cplcFuFuhhR,cplcFuFusigma1L,cplcFuFusigma1R,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,      & 
& cplcgWmgWmsigma1,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCsigma1,cplcgWpCgWpCVZ,        & 
& cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,        & 
& cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHmsigma1cHm,cplHmsigma1cVWm,cplHmcHmVZ,          & 
& cplHmcVWmVZ,cplsigma1sigma1sigma1,cplsigma1cHmVWm,cplcHmVWmVZ,cplcVWmVWmVZ,            & 
& cplhhhhVZVZ1,cplhhHmcVWmVZ1,cplhhcHmVWmVZ1,cplHmsigma1cVWmVZ1,cplsigma1sigma1VZVZ1,    & 
& cplsigma1cHmVWmVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVWm,MVZ,MAh2,MFd2(3),MFe2(3),         & 
& MFu2(3),Mhh2(2),MHm2(2),Msigma12,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhAhsigma1,cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhhhVZ(2),              & 
& cplAhsigma1sigma1,cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdsigma1L(3,3),          & 
& cplcFdFdsigma1R(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3,2),             & 
& cplcFeFehhR(3,3,2),cplcFeFesigma1L(3,3),cplcFeFesigma1R(3,3),cplcFeFeVZL(3,3),         & 
& cplcFeFeVZR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFusigma1L(3,3),           & 
& cplcFuFusigma1R(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWmgWmhh(2),cplcgWmgWmsigma1,& 
& cplcgWmgWmVZ,cplcgWpCgWpChh(2),cplcgWpCgWpCsigma1,cplcgWpCgWpCVZ,cplhhhhhh(2,2,2),     & 
& cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),cplhhHmcVWm(2,2),cplhhsigma1sigma1(2),            & 
& cplhhsigma1VZ(2),cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplhhVZVZ(2),cplHmsigma1cHm(2,2),    & 
& cplHmsigma1cVWm(2),cplHmcHmVZ(2,2),cplHmcVWmVZ(2),cplsigma1sigma1sigma1,               & 
& cplsigma1cHmVWm(2),cplcHmVWmVZ(2),cplcVWmVWmVZ,cplhhhhVZVZ1(2,2),cplhhHmcVWmVZ1(2,2),  & 
& cplhhcHmVWmVZ1(2,2),cplHmsigma1cVWmVZ1(2),cplsigma1sigma1VZVZ1,cplsigma1cHmVWmVZ1(2)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Msigma1 
Mex3 = MVZ 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhTosigma1VZ


Subroutine Amplitude_Tree_THDMIIIHB_hhTocVWmVWm(cplhhcVWmVWm,Mhh,MVWm,Mhh2,           & 
& MVWm2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),MVWm,Mhh2(2),MVWm2

Complex(dp), Intent(in) :: cplhhcVWmVWm(2)

Complex(dp) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVWm 
Mex3 = MVWm 
! Tree-Level Vertex 
coupT1 = cplhhcVWmVWm(gt1)
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_Tree_THDMIIIHB_hhTocVWmVWm


Subroutine Gamma_Real_THDMIIIHB_hhTocVWmVWm(MLambda,em,gs,cplhhcVWmVWm,               & 
& Mhh,MVWm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhcVWmVWm(2)

Real(dp), Intent(in) :: Mhh(2),MVWm

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2), GammarealGluon(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
Coup = cplhhcVWmVWm(i1)
Mex1 = Mhh(i1)
Mex2 = MVWm
Mex3 = MVWm
If (Mex1.gt.(Mex2+Mex3)) Then 
  GammarealGluon(i1) = 0._dp 
 Call hardphotonSVV(Mex1,Mex2,Mex3,MLambda,em,0._dp,1._dp,-1._dp,Coup,Gammarealphoton(i1),kont)
Else 
  GammarealGluon(i1) = 0._dp 
  GammarealPhoton(i1) = 0._dp 

End if 
End Do
End Subroutine Gamma_Real_THDMIIIHB_hhTocVWmVWm


Subroutine Amplitude_WAVE_THDMIIIHB_hhTocVWmVWm(cplhhcVWmVWm,ctcplhhcVWmVWm,          & 
& Mhh,Mhh2,MVWm,MVWm2,Zfhh,ZfVWm,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MVWm,MVWm2

Complex(dp), Intent(in) :: cplhhcVWmVWm(2)

Complex(dp), Intent(in) :: ctcplhhcVWmVWm(2)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfVWm

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVWm 
Mex3 = MVWm 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhcVWmVWm(gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhcVWmVWm(i1)
End Do


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfVWm)*cplhhcVWmVWm(gt1)


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVWm*cplhhcVWmVWm(gt1)


! Getting the amplitude 
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_hhTocVWmVWm


Subroutine Amplitude_VERTEX_THDMIIIHB_hhTocVWmVWm(MAh,MFd,MFe,MFu,Mhh,MHm,            & 
& Msigma1,MVP,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,           & 
& cplAhAhhh,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcVWm,cplAhcHmVWm,cplcFdFdhhL,       & 
& cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFeFehhL,cplcFeFehhR,cplcFvFecVWmL,         & 
& cplcFvFecVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplcgZgAhh,cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgWmgWmhh,cplcgAgWmcVWm,        & 
& cplcgZgWmcVWm,cplcgWpCgWpChh,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgZgZhh,cplcgWmgZVWm,      & 
& cplcgWpCgZcVWm,cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,       & 
& cplhhsigma1VZ,cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHmsigma1cVWm,cplHmcVWmVP,          & 
& cplHmcVWmVZ,cplsigma1cHmVWm,cplcHmVPVWm,cplcVWmVPVWm,cplcHmVWmVZ,cplcVWmVWmVZ,         & 
& cplAhAhcVWmVWm1,cplhhhhcVWmVWm1,cplhhHmcVWmVP1,cplhhHmcVWmVZ1,cplhhcHmVPVWm1,          & 
& cplhhcHmVWmVZ1,cplHmcHmcVWmVWm1,cplsigma1sigma1cVWmVWm1,cplcVWmcVWmVWmVWm1Q,           & 
& cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,             & 
& cplcVWmVWmVZVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVP,MVWm,MVZ,MAh2,MFd2(3),             & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(2),Msigma12,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhhhVZ(2),cplAhHmcVWm(2),             & 
& cplAhcHmVWm(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdcVWmL(3,3),               & 
& cplcFuFdcVWmR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFvFecVWmL(3,3),           & 
& cplcFvFecVWmR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFdFuVWmL(3,3),            & 
& cplcFdFuVWmR(3,3),cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplcgZgAhh(2),cplcgWmgAVWm,      & 
& cplcgWpCgAcVWm,cplcgWmgWmhh(2),cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgWpChh(2),          & 
& cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgZgZhh(2),cplcgWmgZVWm,cplcgWpCgZcVWm,cplhhhhhh(2,2,2),& 
& cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),cplhhHmcVWm(2,2),cplhhsigma1sigma1(2),            & 
& cplhhsigma1VZ(2),cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplhhVZVZ(2),cplHmsigma1cVWm(2),     & 
& cplHmcVWmVP(2),cplHmcVWmVZ(2),cplsigma1cHmVWm(2),cplcHmVPVWm(2),cplcVWmVPVWm,          & 
& cplcHmVWmVZ(2),cplcVWmVWmVZ,cplAhAhcVWmVWm1,cplhhhhcVWmVWm1(2,2),cplhhHmcVWmVP1(2,2),  & 
& cplhhHmcVWmVZ1(2,2),cplhhcHmVPVWm1(2,2),cplhhcHmVWmVZ1(2,2),cplHmcHmcVWmVWm1(2,2),     & 
& cplsigma1sigma1cVWmVWm1,cplcVWmcVWmVWmVWm1Q,cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,   & 
& cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVWm 
Mex3 = MVWm 


! {Ah, Ah, Hm}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhHmcVWm(i3)
coup3 = -cplAhcHmVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, Hm}
  Do i2=1,2
    Do i3=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhHmcVWm(i3)
coup3 = -cplhhcHmVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, sigma1, Hm}
    Do i3=1,2
ML1 = MAh 
ML2 = Msigma1 
ML3 = MHm(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhHmcVWm(i3)
coup3 = -cplsigma1cHmVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, VZ, Hm}
    Do i3=1,2
ML1 = MAh 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1 = -cplAhhhVZ(gt1)
coup2 = cplAhHmcVWm(i3)
coup3 = cplcHmVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Fu, Fu, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = -cplcFuFdcVWmR(i1,i3)
coup2R = -cplcFuFdcVWmL(i1,i3)
coup3L = -cplcFdFuVWmR(i3,i2)
coup3R = -cplcFdFuVWmL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {gP, gZ, gWm}
ML1 = MVP 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplcgZgAhh(gt1)
coup2 = cplcgAgWmcVWm
coup3 = cplcgWmgZVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {gWmC, gWmC, gP}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgAcVWm
coup3 = cplcgAgWpCVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {gWmC, gWmC, gZ}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgZcVWm
coup3 = cplcgZgWpCVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {gZ, gZ, gWm}
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgZgWmcVWm
coup3 = cplcgWmgZVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {hh, Ah, Hm}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplhhHmcVWm(i1,i3)
coup3 = -cplAhcHmVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, Hm}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhHmcVWm(i1,i3)
coup3 = -cplhhcHmVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, sigma1, Hm}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = MHm(i3) 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplhhHmcVWm(i1,i3)
coup3 = -cplsigma1cHmVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, VWm}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhcVWmVWm(i1)
coup3 = cplhhcVWmVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {sigma1, Ah, Hm}
    Do i3=1,2
ML1 = Msigma1 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2 = -cplHmsigma1cVWm(i3)
coup3 = -cplAhcHmVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, hh, Hm}
  Do i2=1,2
    Do i3=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = -cplHmsigma1cVWm(i3)
coup3 = -cplhhcHmVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {sigma1, sigma1, Hm}
    Do i3=1,2
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = MHm(i3) 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = -cplHmsigma1cVWm(i3)
coup3 = -cplsigma1cHmVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, VZ, Hm}
    Do i3=1,2
ML1 = Msigma1 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1 = cplhhsigma1VZ(gt1)
coup2 = -cplHmsigma1cVWm(i3)
coup3 = cplcHmVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, Ah, Hm}
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = -cplAhhhVZ(gt1)
coup2 = cplHmcVWmVZ(i3)
coup3 = -cplAhcHmVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, sigma1, Hm}
    Do i3=1,2
ML1 = MVZ 
ML2 = Msigma1 
ML3 = MHm(i3) 
coup1 = cplhhsigma1VZ(gt1)
coup2 = cplHmcVWmVZ(i3)
coup3 = -cplsigma1cHmVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, VZ, Hm}
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplHmcVWmVZ(i3)
coup3 = cplcHmVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, VZ, VWm}
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplhhVZVZ(gt1)
coup2 = cplcVWmVWmVZ
coup3 = cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {bar[Fd], bar[Fd], bar[Fu]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFuFdcVWmL(i3,i1)
coup2R = cplcFuFdcVWmR(i3,i1)
coup3L = cplcFdFuVWmL(i2,i3)
coup3R = cplcFdFuVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {bar[Fe], bar[Fe], bar[Fv]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = 0. 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcFvFecVWmL(i3,i1)
coup2R = cplcFvFecVWmR(i3,i1)
coup3L = cplcFeFvVWmL(i2,i3)
coup3R = cplcFeFvVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {bar[gWm], bar[gWm], bar[gP]}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgAgWmcVWm
coup3 = cplcgWmgAVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {bar[gWm], bar[gWm], bar[gZ]}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgZgWmcVWm
coup3 = cplcgWmgZVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {bar[gZ], bar[gP], bar[gWmC]}
ML1 = MVZ 
ML2 = MVP 
ML3 = MVWm 
coup1 = cplcgZgAhh(gt1)
coup2 = cplcgWpCgZcVWm
coup3 = cplcgAgWpCVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {bar[gZ], bar[gZ], bar[gWmC]}
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgWpCgZcVWm
coup3 = cplcgZgWpCVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {conj[Hm], conj[Hm], Ah}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MAh 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = -cplAhHmcVWm(i1)
coup3 = cplAhcHmVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], conj[Hm], hh}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = -cplhhHmcVWm(i3,i1)
coup3 = cplhhcHmVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[Hm], conj[VWm], hh}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = cplhhcHmVWm(gt1,i1)
coup2 = -cplhhHmcVWm(i3,i1)
coup3 = cplhhcVWmVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[Hm], conj[Hm], sigma1}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = Msigma1 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplHmsigma1cVWm(i1)
coup3 = cplsigma1cHmVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], conj[Hm], VP}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplHmcVWmVP(i1)
coup3 = cplcHmVPVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], conj[VWm], VP}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplhhcHmVWm(gt1,i1)
coup2 = cplHmcVWmVP(i1)
coup3 = cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VZ}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplHmcVWmVZ(i1)
coup3 = cplcHmVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], conj[VWm], VZ}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplhhcHmVWm(gt1,i1)
coup2 = cplHmcVWmVZ(i1)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {conj[VWm], conj[Hm], hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhHmcVWm(gt1,i2)
coup2 = cplhhcVWmVWm(i3)
coup3 = cplhhcHmVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWm], conj[VWm], hh}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplhhcVWmVWm(i3)
coup3 = cplhhcVWmVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWm], conj[Hm], VP}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = cplhhHmcVWm(gt1,i2)
coup2 = cplcVWmVPVWm
coup3 = cplcHmVPVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWm], conj[VWm], VP}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplcVWmVPVWm
coup3 = cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {conj[VWm], conj[Hm], VZ}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1 = cplhhHmcVWm(gt1,i2)
coup2 = -cplcVWmVWmVZ
coup3 = cplcHmVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWm], conj[VWm], VZ}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplhhcVWmVWm(gt1)
coup2 = -cplcVWmVWmVZ
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhcVWmVWm1
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhcVWmVWm1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do


! {Hm, Hm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplHmcHmcVWmVWm1(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {sigma1, sigma1}
ML1 = Msigma1 
ML2 = Msigma1 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplsigma1sigma1cVWmVWm1
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 


! {VWm, VWm}
ML1 = MVWm 
ML2 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplcVWmcVWmVWmVWm1Q
coup2b = coup2 
coup2 = cplcVWmcVWmVWmVWm2Q
coup2a = coup2 
coup2 = cplcVWmcVWmVWmVWm3Q
coup2c = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {VZ, VZ}
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhVZVZ(gt1)
coup2 = cplcVWmVWmVZVZ1Q
coup2a = coup2 
coup2 = cplcVWmVWmVZVZ2Q
coup2b = coup2 
coup2 = cplcVWmVWmVZVZ3Q
coup2c = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 


! {hh, VWm}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVWm 
coup1 = cplhhhhcVWmVWm1(gt1,i1)
coup2 = cplhhcVWmVWm(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {VP, Hm}
  Do i2=1,2
ML1 = MVP 
ML2 = MHm(i2) 
coup1 = cplhhcHmVPVWm1(gt1,i2)
coup2 = cplHmcVWmVP(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

  End Do


! {VZ, Hm}
  Do i2=1,2
ML1 = MVZ 
ML2 = MHm(i2) 
coup1 = cplhhcHmVWmVZ1(gt1,i2)
coup2 = cplHmcVWmVZ(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

  End Do


! {hh, conj[VWm]}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVWm 
coup1 = cplhhhhcVWmVWm1(gt1,i1)
coup2 = cplhhcVWmVWm(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {Hm, VP}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVP 
coup1 = cplhhHmcVWmVP1(gt1,i1)
coup2 = cplcHmVPVWm(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {Hm, VZ}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVZ 
coup1 = cplhhHmcVWmVZ1(gt1,i1)
coup2 = cplcHmVWmVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End Do
End Subroutine Amplitude_VERTEX_THDMIIIHB_hhTocVWmVWm


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhTocVWmVWm(MAh,MFd,MFe,MFu,Mhh,             & 
& MHm,Msigma1,MVP,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,            & 
& MVZ2,cplAhAhhh,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcVWm,cplAhcHmVWm,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWmL,cplcFdFuVWmR,         & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplcgZgAhh,cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgWmgWmhh,         & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgWpChh,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgZgZhh,     & 
& cplcgWmgZVWm,cplcgWpCgZcVWm,cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,            & 
& cplhhsigma1sigma1,cplhhsigma1VZ,cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHmsigma1cVWm,    & 
& cplHmcVWmVP,cplHmcVWmVZ,cplsigma1cHmVWm,cplcHmVPVWm,cplcVWmVPVWm,cplcHmVWmVZ,          & 
& cplcVWmVWmVZ,cplAhAhcVWmVWm1,cplhhhhcVWmVWm1,cplhhHmcVWmVP1,cplhhHmcVWmVZ1,            & 
& cplhhcHmVPVWm1,cplhhcHmVWmVZ1,cplHmcHmcVWmVWm1,cplsigma1sigma1cVWmVWm1,cplcVWmcVWmVWmVWm1Q,& 
& cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,             & 
& cplcVWmVWmVZVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVP,MVWm,MVZ,MAh2,MFd2(3),             & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(2),Msigma12,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhhhVZ(2),cplAhHmcVWm(2),             & 
& cplAhcHmVWm(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdcVWmL(3,3),               & 
& cplcFuFdcVWmR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFvFecVWmL(3,3),           & 
& cplcFvFecVWmR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFdFuVWmL(3,3),            & 
& cplcFdFuVWmR(3,3),cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplcgZgAhh(2),cplcgWmgAVWm,      & 
& cplcgWpCgAcVWm,cplcgWmgWmhh(2),cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgWpChh(2),          & 
& cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgZgZhh(2),cplcgWmgZVWm,cplcgWpCgZcVWm,cplhhhhhh(2,2,2),& 
& cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),cplhhHmcVWm(2,2),cplhhsigma1sigma1(2),            & 
& cplhhsigma1VZ(2),cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplhhVZVZ(2),cplHmsigma1cVWm(2),     & 
& cplHmcVWmVP(2),cplHmcVWmVZ(2),cplsigma1cHmVWm(2),cplcHmVPVWm(2),cplcVWmVPVWm,          & 
& cplcHmVWmVZ(2),cplcVWmVWmVZ,cplAhAhcVWmVWm1,cplhhhhcVWmVWm1(2,2),cplhhHmcVWmVP1(2,2),  & 
& cplhhHmcVWmVZ1(2,2),cplhhcHmVPVWm1(2,2),cplhhcHmVWmVZ1(2,2),cplHmcHmcVWmVWm1(2,2),     & 
& cplsigma1sigma1cVWmVWm1,cplcVWmcVWmVWmVWm1Q,cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,   & 
& cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVWm 
Mex3 = MVWm 


! {conj[Hm], conj[Hm], VP}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplHmcVWmVP(i1)
coup3 = cplcHmVPVWm(i2)
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], conj[VWm], VP}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplhhcHmVWm(gt1,i1)
coup2 = cplHmcVWmVP(i1)
coup3 = cplcVWmVPVWm
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {conj[VWm], conj[Hm], VP}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = cplhhHmcVWm(gt1,i2)
coup2 = cplcVWmVPVWm
coup3 = cplcHmVPVWm(i2)
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWm], conj[VWm], VP}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplcVWmVPVWm
coup3 = cplcVWmVPVWm
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {VP, Hm}
  Do i2=1,2
ML1 = MVP 
ML2 = MHm(i2) 
coup1 = cplhhcHmVPVWm1(gt1,i2)
coup2 = cplHmcVWmVP(i2)
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

  End Do


! {Hm, VP}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVP 
coup1 = cplhhHmcVWmVP1(gt1,i1)
coup2 = cplcHmVPVWm(i1)
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhTocVWmVWm


Subroutine Amplitude_Tree_THDMIIIHB_hhToVZVZ(cplhhVZVZ,Mhh,MVZ,Mhh2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),MVZ,Mhh2(2),MVZ2

Complex(dp), Intent(in) :: cplhhVZVZ(2)

Complex(dp) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVZ 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1 = cplhhVZVZ(gt1)
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_Tree_THDMIIIHB_hhToVZVZ


Subroutine Gamma_Real_THDMIIIHB_hhToVZVZ(MLambda,em,gs,cplhhVZVZ,Mhh,MVZ,             & 
& GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhVZVZ(2)

Real(dp), Intent(in) :: Mhh(2),MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2), GammarealGluon(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
Coup = cplhhVZVZ(i1)
Mex1 = Mhh(i1)
Mex2 = MVZ
Mex3 = MVZ
If (Mex1.gt.(Mex2+Mex3)) Then 
  GammarealGluon(i1) = 0._dp 
 Gammarealphoton(i1) = 0._dp 
Else 
  GammarealGluon(i1) = 0._dp 
  GammarealPhoton(i1) = 0._dp 

End if 
End Do
End Subroutine Gamma_Real_THDMIIIHB_hhToVZVZ


Subroutine Amplitude_WAVE_THDMIIIHB_hhToVZVZ(cplhhVZVZ,ctcplhhVZVZ,Mhh,               & 
& Mhh2,MVZ,MVZ2,Zfhh,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MVZ,MVZ2

Complex(dp), Intent(in) :: cplhhVZVZ(2)

Complex(dp), Intent(in) :: ctcplhhVZVZ(2)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfVZ

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVZ 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhVZVZ(gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhVZVZ(i1)
End Do


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cplhhVZVZ(gt1)


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cplhhVZVZ(gt1)


! Getting the amplitude 
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_hhToVZVZ


Subroutine Amplitude_VERTEX_THDMIIIHB_hhToVZVZ(MAh,MFd,MFe,MFu,Mhh,MHm,               & 
& Msigma1,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhhh,          & 
& cplAhhhsigma1,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,       & 
& cplhhhhhh,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,cplhhcHmVWm,          & 
& cplhhcVWmVWm,cplhhVZVZ,cplHmcHmVZ,cplHmcVWmVZ,cplcHmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,   & 
& cplhhhhVZVZ1,cplhhHmcVWmVZ1,cplhhcHmVWmVZ1,cplHmcHmVZVZ1,cplsigma1sigma1VZVZ1,         & 
& cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVWm,MVZ,MAh2,MFd2(3),MFe2(3),         & 
& MFu2(3),Mhh2(2),MHm2(2),Msigma12,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhhhsigma1(2),cplAhhhVZ(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),     & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),               & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),               & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWmgWmhh(2),cplcgWmgWmVZ,cplcgWpCgWpChh(2),      & 
& cplcgWpCgWpCVZ,cplhhhhhh(2,2,2),cplhhHmcHm(2,2,2),cplhhHmcVWm(2,2),cplhhsigma1sigma1(2),& 
& cplhhsigma1VZ(2),cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplhhVZVZ(2),cplHmcHmVZ(2,2),        & 
& cplHmcVWmVZ(2),cplcHmVWmVZ(2),cplcVWmVWmVZ,cplAhAhVZVZ1,cplhhhhVZVZ1(2,2),             & 
& cplhhHmcVWmVZ1(2,2),cplhhcHmVWmVZ1(2,2),cplHmcHmVZVZ1(2,2),cplsigma1sigma1VZVZ1,       & 
& cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVZ 
Mex3 = MVZ 


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhhhVZ(i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, sigma1, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhhhVZ(i3)
coup3 = cplhhsigma1VZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, VZ, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZ(gt1)
coup2 = cplAhhhVZ(i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = -cplcFdFdVZR(i1,i3)
coup2R = -cplcFdFdVZL(i1,i3)
coup3L = -cplcFdFdVZR(i3,i2)
coup3R = -cplcFdFdVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = -cplcFeFeVZR(i1,i3)
coup2R = -cplcFeFeVZL(i1,i3)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = -cplcFuFuVZR(i1,i3)
coup2R = -cplcFuFuVZL(i1,i3)
coup3L = -cplcFuFuVZR(i3,i2)
coup3R = -cplcFuFuVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWm, gWm, gWm}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgWmVZ
coup3 = cplcgWmgWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {gWmC, gWmC, gWmC}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgWpCVZ
coup3 = cplcgWpCgWpCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = -cplAhhhVZ(i1)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, hh, sigma1}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhsigma1VZ(i1)
coup3 = -cplhhsigma1VZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, hh, VZ}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhVZVZ(i1)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Hm, Hm}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = -cplHmcHmVZ(i3,i1)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, VWm, Hm}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhHmcVWm(gt1,i1)
coup2 = -cplHmcHmVZ(i3,i1)
coup3 = cplcHmVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, VWm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplcHmVWmVZ(i1)
coup3 = cplHmcVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, VWm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplhhHmcVWm(gt1,i1)
coup2 = cplcHmVWmVZ(i1)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {sigma1, Ah, hh}
    Do i3=1,2
ML1 = Msigma1 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2 = -cplhhsigma1VZ(i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, sigma1, hh}
    Do i3=1,2
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = -cplhhsigma1VZ(i3)
coup3 = cplhhsigma1VZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, VZ, hh}
    Do i3=1,2
ML1 = Msigma1 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhsigma1VZ(gt1)
coup2 = -cplhhsigma1VZ(i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VWm, Hm, Hm}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhcHmVWm(gt1,i2)
coup2 = cplHmcVWmVZ(i3)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, VWm, Hm}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplHmcVWmVZ(i3)
coup3 = cplcHmVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VWm, Hm, VWm}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhcHmVWm(gt1,i2)
coup2 = -cplcVWmVWmVZ
coup3 = cplHmcVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {VWm, VWm, VWm}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = -cplcVWmVWmVZ
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {VZ, Ah, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZ(gt1)
coup2 = cplhhVZVZ(i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, sigma1, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplhhsigma1VZ(gt1)
coup2 = cplhhVZVZ(i3)
coup3 = cplhhsigma1VZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, VZ, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplhhVZVZ(i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[Hm], conj[VWm], conj[Hm]}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcHmVWm(gt1,i1)
coup2 = cplHmcHmVZ(i1,i3)
coup3 = cplHmcVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[Hm], conj[Hm], conj[VWm]}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplHmcVWmVZ(i1)
coup3 = cplcHmVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], conj[VWm], conj[VWm]}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplhhcHmVWm(gt1,i1)
coup2 = cplHmcVWmVZ(i1)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {conj[VWm], conj[Hm], conj[Hm]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcVWm(gt1,i2)
coup2 = cplcHmVWmVZ(i3)
coup3 = cplHmcHmVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWm], conj[VWm], conj[Hm]}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplcHmVWmVZ(i3)
coup3 = cplHmcVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWm], conj[Hm], conj[VWm]}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcVWm(gt1,i2)
coup2 = cplcVWmVWmVZ
coup3 = cplcHmVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhVZVZ1
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhVZVZ1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do


! {Hm, Hm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplHmcHmVZVZ1(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {sigma1, sigma1}
ML1 = Msigma1 
ML2 = Msigma1 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplsigma1sigma1VZVZ1
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 


! {VWm, VWm}
ML1 = MVWm 
ML2 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplcVWmVWmVZVZ1Q
coup2a = coup2 
coup2 = cplcVWmVWmVZVZ2Q
coup2b = coup2 
coup2 = cplcVWmVWmVZVZ3Q
coup2c = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {hh, VZ}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplhhhhVZVZ1(gt1,i1)
coup2 = cplhhVZVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {Hm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
coup1 = cplhhHmcVWmVZ1(gt1,i1)
coup2 = cplcHmVWmVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {VWm, Hm}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
coup1 = cplhhcHmVWmVZ1(gt1,i2)
coup2 = cplHmcVWmVZ(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

  End Do


! {hh, VZ}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplhhhhVZVZ1(gt1,i1)
coup2 = cplhhVZVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {Hm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
coup1 = cplhhHmcVWmVZ1(gt1,i1)
coup2 = cplcHmVWmVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {VWm, Hm}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
coup1 = cplhhcHmVWmVZ1(gt1,i2)
coup2 = cplHmcVWmVZ(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

  End Do
End Do
End Subroutine Amplitude_VERTEX_THDMIIIHB_hhToVZVZ


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhToVZVZ(MAh,MFd,MFe,MFu,Mhh,MHm,            & 
& Msigma1,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhhh,          & 
& cplAhhhsigma1,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,       & 
& cplhhhhhh,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,cplhhcHmVWm,          & 
& cplhhcVWmVWm,cplhhVZVZ,cplHmcHmVZ,cplHmcVWmVZ,cplcHmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,   & 
& cplhhhhVZVZ1,cplhhHmcVWmVZ1,cplhhcHmVWmVZ1,cplHmcHmVZVZ1,cplsigma1sigma1VZVZ1,         & 
& cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVWm,MVZ,MAh2,MFd2(3),MFe2(3),         & 
& MFu2(3),Mhh2(2),MHm2(2),Msigma12,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhhhsigma1(2),cplAhhhVZ(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),     & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),               & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),               & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWmgWmhh(2),cplcgWmgWmVZ,cplcgWpCgWpChh(2),      & 
& cplcgWpCgWpCVZ,cplhhhhhh(2,2,2),cplhhHmcHm(2,2,2),cplhhHmcVWm(2,2),cplhhsigma1sigma1(2),& 
& cplhhsigma1VZ(2),cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplhhVZVZ(2),cplHmcHmVZ(2,2),        & 
& cplHmcVWmVZ(2),cplcHmVWmVZ(2),cplcVWmVWmVZ,cplAhAhVZVZ1,cplhhhhVZVZ1(2,2),             & 
& cplhhHmcVWmVZ1(2,2),cplhhcHmVWmVZ1(2,2),cplHmcHmVZVZ1(2,2),cplsigma1sigma1VZVZ1,       & 
& cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVZ 
Mex3 = MVZ 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhToVZVZ


Subroutine Amplitude_WAVE_THDMIIIHB_hhToAhVP(cplAhhhVZ,ctcplAhhhVZ,MAh,               & 
& MAh2,Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,ZfAh,Zfhh,ZfVP,ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MAh2,Mhh(2),Mhh2(2),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhhhVZ(2)

Complex(dp), Intent(in) :: ctcplAhhhVZ(2)

Complex(dp), Intent(in) :: ZfAh,Zfhh(2,2),ZfVP,ZfVZVP

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh 
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
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZVP*cplAhhhVZ(gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_hhToAhVP


Subroutine Amplitude_VERTEX_THDMIIIHB_hhToAhVP(MAh,MFd,MFe,MFu,Mhh,MHm,               & 
& MVP,MVWm,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVP2,MVWm2,cplcFdFdAhL,cplcFdFdAhR,             & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhHmcHm,cplAhHmcVWm,cplAhcHmVWm,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,    & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,       & 
& cplhhHmcHm,cplhhHmcVWm,cplhhcHmVWm,cplhhcVWmVWm,cplHmcHmVP,cplHmcVWmVP,cplcHmVPVWm,    & 
& cplcVWmVPVWm,cplAhHmcVWmVP1,cplAhcHmVPVWm1,cplhhHmcVWmVP1,cplhhcHmVPVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),MVP,MVWm,MAh2,MFd2(3),MFe2(3),MFu2(3),         & 
& Mhh2(2),MHm2(2),MVP2,MVWm2

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3), & 
& cplcFuFuAhR(3,3),cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHmcHm(2,2),cplAhHmcVWm(2),           & 
& cplAhcHmVWm(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),& 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),               & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),               & 
& cplcgWmgWmhh(2),cplcgWmgWmVP,cplcgWpCgWpChh(2),cplcgWpCgWpCVP,cplhhHmcHm(2,2,2),       & 
& cplhhHmcVWm(2,2),cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplHmcHmVP(2,2),cplHmcVWmVP(2),      & 
& cplcHmVPVWm(2),cplcVWmVPVWm,cplAhHmcVWmVP1(2),cplAhcHmVPVWm1(2),cplhhHmcVWmVP1(2,2),   & 
& cplhhcHmVPVWm1(2,2)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh 
Mex3 = MVP 


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdAhL(i1,i3)
coup2R = cplcFdFdAhR(i1,i3)
coup3L = -cplcFdFdVPR(i3,i2)
coup3R = -cplcFdFdVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFeAhL(i1,i3)
coup2R = cplcFeFeAhR(i1,i3)
coup3L = -cplcFeFeVPR(i3,i2)
coup3R = -cplcFeFeVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuAhL(i1,i3)
coup2R = cplcFuFuAhR(i1,i3)
coup3L = -cplcFuFuVPR(i3,i2)
coup3R = -cplcFuFuVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWm, gWm, gWm}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgWmAh
coup3 = cplcgWmgWmVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {gWmC, gWmC, gWmC}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgWpCAh
coup3 = cplcgWpCgWpCVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {Hm, Hm, Hm}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplAhHmcHm(i3,i1)
coup3 = -cplHmcHmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, VWm, Hm}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = -cplhhHmcVWm(gt1,i1)
coup2 = cplAhHmcHm(i3,i1)
coup3 = cplcHmVPVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, VWm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplAhcHmVWm(i1)
coup3 = cplHmcVWmVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, VWm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplhhHmcVWm(gt1,i1)
coup2 = cplAhcHmVWm(i1)
coup3 = cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {VWm, Hm, Hm}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhcHmVWm(gt1,i2)
coup2 = cplAhHmcVWm(i3)
coup3 = -cplHmcHmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, VWm, Hm}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplAhHmcVWm(i3)
coup3 = cplcHmVPVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[Hm], conj[VWm], conj[Hm]}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = -cplhhcHmVWm(gt1,i1)
coup2 = cplAhHmcHm(i1,i3)
coup3 = cplHmcVWmVP(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[Hm], conj[Hm], conj[VWm]}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplAhHmcVWm(i1)
coup3 = cplcHmVPVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], conj[VWm], conj[VWm]}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplhhcHmVWm(gt1,i1)
coup2 = cplAhHmcVWm(i1)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {conj[VWm], conj[Hm], conj[Hm]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhHmcVWm(gt1,i2)
coup2 = cplAhcHmVWm(i3)
coup3 = cplHmcHmVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWm], conj[VWm], conj[Hm]}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplAhcHmVWm(i3)
coup3 = cplHmcVWmVP(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Hm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
coup1 = cplhhHmcVWm(gt1,i1)
coup2 = cplAhcHmVPVWm1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {VWm, Hm}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
coup1 = cplhhcHmVWm(gt1,i2)
coup2 = cplAhHmcVWmVP1(i2)
Call Amp_VERTEX_StoSV_Topology2_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Hm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
coup1 = cplhhHmcVWmVP1(gt1,i1)
coup2 = cplAhcHmVWm(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {VWm, Hm}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
coup1 = cplhhcHmVPVWm1(gt1,i2)
coup2 = cplAhHmcVWm(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

  End Do
End Do
End Subroutine Amplitude_VERTEX_THDMIIIHB_hhToAhVP


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhToAhVP(MAh,MFd,MFe,MFu,Mhh,MHm,            & 
& MVP,MVWm,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVP2,MVWm2,cplcFdFdAhL,cplcFdFdAhR,             & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhHmcHm,cplAhHmcVWm,cplAhcHmVWm,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,    & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,       & 
& cplhhHmcHm,cplhhHmcVWm,cplhhcHmVWm,cplhhcVWmVWm,cplHmcHmVP,cplHmcVWmVP,cplcHmVPVWm,    & 
& cplcVWmVPVWm,cplAhHmcVWmVP1,cplAhcHmVPVWm1,cplhhHmcVWmVP1,cplhhcHmVPVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),MVP,MVWm,MAh2,MFd2(3),MFe2(3),MFu2(3),         & 
& Mhh2(2),MHm2(2),MVP2,MVWm2

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3), & 
& cplcFuFuAhR(3,3),cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHmcHm(2,2),cplAhHmcVWm(2),           & 
& cplAhcHmVWm(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),& 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),               & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),               & 
& cplcgWmgWmhh(2),cplcgWmgWmVP,cplcgWpCgWpChh(2),cplcgWpCgWpCVP,cplhhHmcHm(2,2,2),       & 
& cplhhHmcVWm(2,2),cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplHmcHmVP(2,2),cplHmcVWmVP(2),      & 
& cplcHmVPVWm(2),cplcVWmVPVWm,cplAhHmcVWmVP1(2),cplAhcHmVPVWm1(2),cplhhHmcVWmVP1(2,2),   & 
& cplhhcHmVPVWm1(2,2)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh 
Mex3 = MVP 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhToAhVP


Subroutine Amplitude_WAVE_THDMIIIHB_hhToFvcFv(Mhh,Mhh2,Zfhh,ZfvL,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfvL(3,3)

Complex(dp), Intent(out) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = 0. 
Mex3 = 0. 
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
Amp(:,gt1, gt2, gt3) = 0._dp
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_hhToFvcFv


Subroutine Amplitude_VERTEX_THDMIIIHB_hhToFvcFv(MFe,Mhh,MHm,MVWm,MVZ,MFe2,            & 
& Mhh2,MHm2,MVWm2,MVZ2,cplcFeFehhL,cplcFeFehhR,cplcFvFecHmL,cplcFvFecHmR,cplcFvFecVWmL,  & 
& cplcFvFecVWmR,cplcFeFvHmL,cplcFeFvHmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,           & 
& cplcFvFvVZR,cplhhHmcHm,cplhhHmcVWm,cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),Mhh(2),MHm(2),MVWm,MVZ,MFe2(3),Mhh2(2),MHm2(2),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFvFecHmL(3,3,2),cplcFvFecHmR(3,3,2),        & 
& cplcFvFecVWmL(3,3),cplcFvFecVWmR(3,3),cplcFeFvHmL(3,3,2),cplcFeFvHmR(3,3,2),           & 
& cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplhhHmcHm(2,2,2),& 
& cplhhHmcVWm(2,2),cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplhhVZVZ(2)

Complex(dp), Intent(out) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = 0. 
Mex3 = 0. 


! {Fe, Fe, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MHm(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFvHmL(i1,gt2,i3)
coup2R = cplcFeFvHmR(i1,gt2,i3)
coup3L = cplcFvFecHmL(gt3,i2,i3)
coup3R = cplcFvFecHmR(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, VWm}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVWm 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = -cplcFeFvVWmR(i1,gt2)
coup2R = -cplcFeFvVWmL(i1,gt2)
coup3L = -cplcFvFecVWmR(gt3,i2)
coup3R = -cplcFvFecVWmL(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VZ, VZ, bar[Fv]}
    Do i3=1,3
ML1 = MVZ 
ML2 = MVZ 
ML3 = 0. 
coup1 = cplhhVZVZ(gt1)
coup2L = -cplcFvFvVZR(i3,gt2)
coup2R = -cplcFvFvVZL(i3,gt2)
coup3L = -cplcFvFvVZR(gt3,i3)
coup3R = -cplcFvFvVZL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {conj[Hm], conj[Hm], bar[Fe]}
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MFe(i3) 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2L = cplcFeFvHmL(i3,gt2,i1)
coup2R = cplcFeFvHmR(i3,gt2,i1)
coup3L = cplcFvFecHmL(gt3,i3,i2)
coup3R = cplcFvFecHmR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[Hm], conj[VWm], bar[Fe]}
Do i1=1,2
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MFe(i3) 
coup1 = cplhhcHmVWm(gt1,i1)
coup2L = cplcFeFvHmL(i3,gt2,i1)
coup2R = cplcFeFvHmR(i3,gt2,i1)
coup3L = -cplcFvFecVWmR(gt3,i3)
coup3R = -cplcFvFecVWmL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[VWm], conj[Hm], bar[Fe]}
  Do i2=1,2
    Do i3=1,3
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MFe(i3) 
coup1 = cplhhHmcVWm(gt1,i2)
coup2L = -cplcFeFvVWmR(i3,gt2)
coup2R = -cplcFeFvVWmL(i3,gt2)
coup3L = cplcFvFecHmL(gt3,i3,i2)
coup3R = cplcFvFecHmR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWm], conj[VWm], bar[Fe]}
    Do i3=1,3
ML1 = MVWm 
ML2 = MVWm 
ML3 = MFe(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2L = -cplcFeFvVWmR(i3,gt2)
coup2R = -cplcFeFvVWmL(i3,gt2)
coup3L = -cplcFvFecVWmR(gt3,i3)
coup3R = -cplcFvFecVWmL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_THDMIIIHB_hhToFvcFv


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhToFvcFv(MFe,Mhh,MHm,MVWm,MVZ,              & 
& MFe2,Mhh2,MHm2,MVWm2,MVZ2,cplcFeFehhL,cplcFeFehhR,cplcFvFecHmL,cplcFvFecHmR,           & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplcFeFvHmL,cplcFeFvHmR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& cplcFvFvVZL,cplcFvFvVZR,cplhhHmcHm,cplhhHmcVWm,cplhhcHmVWm,cplhhcVWmVWm,               & 
& cplhhVZVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),Mhh(2),MHm(2),MVWm,MVZ,MFe2(3),Mhh2(2),MHm2(2),MVWm2,MVZ2

Complex(dp), Intent(in) :: cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFvFecHmL(3,3,2),cplcFvFecHmR(3,3,2),        & 
& cplcFvFecVWmL(3,3),cplcFvFecVWmR(3,3),cplcFeFvHmL(3,3,2),cplcFeFvHmR(3,3,2),           & 
& cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplhhHmcHm(2,2,2),& 
& cplhhHmcVWm(2,2),cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplhhVZVZ(2)

Complex(dp), Intent(out) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = 0. 
Mex3 = 0. 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhToFvcFv


Subroutine Amplitude_WAVE_THDMIIIHB_hhTohhVP(Mhh,Mhh2,MVP,MVP2,Zfhh,ZfVP,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MVP,MVP2

Complex(dp), Intent(in) :: Zfhh(2,2),ZfVP

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
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
Amp(:,gt1, gt2) = 0._dp
  End Do
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_hhTohhVP


Subroutine Amplitude_VERTEX_THDMIIIHB_hhTohhVP(MFd,MFe,MFu,Mhh,MHm,MVP,               & 
& MVWm,MFd2,MFe2,MFu2,Mhh2,MHm2,MVP2,MVWm2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,          & 
& cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,          & 
& cplcgWpCgWpCVP,cplhhHmcHm,cplhhHmcVWm,cplhhcHmVWm,cplhhcVWmVWm,cplHmcHmVP,             & 
& cplHmcVWmVP,cplcHmVPVWm,cplcVWmVPVWm,cplhhHmcVWmVP1,cplhhcHmVPVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),MVP,MVWm,MFd2(3),MFe2(3),MFu2(3),Mhh2(2),          & 
& MHm2(2),MVP2,MVWm2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),              & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),               & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),               & 
& cplcgWmgWmhh(2),cplcgWmgWmVP,cplcgWpCgWpChh(2),cplcgWpCgWpCVP,cplhhHmcHm(2,2,2),       & 
& cplhhHmcVWm(2,2),cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplHmcHmVP(2,2),cplHmcVWmVP(2),      & 
& cplcHmVPVWm(2),cplcVWmVPVWm,cplhhHmcVWmVP1(2,2),cplhhcHmVPVWm1(2,2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVP 


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdhhL(i1,i3,gt2)
coup2R = cplcFdFdhhR(i1,i3,gt2)
coup3L = -cplcFdFdVPR(i3,i2)
coup3R = -cplcFdFdVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFehhL(i1,i3,gt2)
coup2R = cplcFeFehhR(i1,i3,gt2)
coup3L = -cplcFeFeVPR(i3,i2)
coup3R = -cplcFeFeVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuhhL(i1,i3,gt2)
coup2R = cplcFuFuhhR(i1,i3,gt2)
coup3L = -cplcFuFuVPR(i3,i2)
coup3R = -cplcFuFuVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWm, gWm, gWm}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgWmhh(gt2)
coup3 = cplcgWmgWmVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 


! {gWmC, gWmC, gWmC}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgWpChh(gt2)
coup3 = cplcgWpCgWpCVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 


! {Hm, Hm, Hm}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = -cplHmcHmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, VWm, Hm}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = -cplhhHmcVWm(gt1,i1)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = cplcHmVPVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, VWm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplhhcHmVWm(gt2,i1)
coup3 = cplHmcVWmVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, VWm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplhhHmcVWm(gt1,i1)
coup2 = cplhhcHmVWm(gt2,i1)
coup3 = cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VWm, Hm, Hm}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhcHmVWm(gt1,i2)
coup2 = cplhhHmcVWm(gt2,i3)
coup3 = -cplHmcHmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, VWm, Hm}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplhhHmcVWm(gt2,i3)
coup3 = cplcHmVPVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {VWm, Hm, VWm}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = -cplhhcHmVWm(gt1,i2)
coup2 = cplhhcVWmVWm(gt2)
coup3 = cplHmcVWmVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VWm, VWm, VWm}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplhhcVWmVWm(gt2)
coup3 = cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 


! {conj[Hm], conj[VWm], conj[Hm]}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = -cplhhcHmVWm(gt1,i1)
coup2 = cplhhHmcHm(gt2,i1,i3)
coup3 = cplHmcVWmVP(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[Hm], conj[Hm], conj[VWm]}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplhhHmcVWm(gt2,i1)
coup3 = cplcHmVPVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], conj[VWm], conj[VWm]}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplhhcHmVWm(gt1,i1)
coup2 = cplhhHmcVWm(gt2,i1)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {conj[VWm], conj[Hm], conj[Hm]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhHmcVWm(gt1,i2)
coup2 = cplhhcHmVWm(gt2,i3)
coup3 = cplHmcHmVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWm], conj[VWm], conj[Hm]}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplhhcHmVWm(gt2,i3)
coup3 = cplHmcVWmVP(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWm], conj[Hm], conj[VWm]}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = -cplhhHmcVWm(gt1,i2)
coup2 = cplhhcVWmVWm(gt2)
coup3 = cplcHmVPVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Hm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
coup1 = cplhhHmcVWm(gt1,i1)
coup2 = cplhhcHmVPVWm1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VWm, Hm}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
coup1 = cplhhcHmVWm(gt1,i2)
coup2 = cplhhHmcVWmVP1(gt2,i2)
Call Amp_VERTEX_StoSV_Topology2_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Hm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
coup1 = cplhhHmcVWmVP1(gt1,i1)
coup2 = cplhhcHmVWm(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {VWm, Hm}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
coup1 = cplhhcHmVPVWm1(gt1,i2)
coup2 = cplhhHmcVWm(gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_THDMIIIHB_hhTohhVP


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhTohhVP(MFd,MFe,MFu,Mhh,MHm,MVP,            & 
& MVWm,MFd2,MFe2,MFu2,Mhh2,MHm2,MVP2,MVWm2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,          & 
& cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,          & 
& cplcgWpCgWpCVP,cplhhHmcHm,cplhhHmcVWm,cplhhcHmVWm,cplhhcVWmVWm,cplHmcHmVP,             & 
& cplHmcVWmVP,cplcHmVPVWm,cplcVWmVPVWm,cplhhHmcVWmVP1,cplhhcHmVPVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),MVP,MVWm,MFd2(3),MFe2(3),MFu2(3),Mhh2(2),          & 
& MHm2(2),MVP2,MVWm2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),              & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),               & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),               & 
& cplcgWmgWmhh(2),cplcgWmgWmVP,cplcgWpCgWpChh(2),cplcgWpCgWpCVP,cplhhHmcHm(2,2,2),       & 
& cplhhHmcVWm(2,2),cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplHmcHmVP(2,2),cplHmcVWmVP(2),      & 
& cplcHmVPVWm(2),cplcVWmVPVWm,cplhhHmcVWmVP1(2,2),cplhhcHmVPVWm1(2,2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVP 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhTohhVP


Subroutine Amplitude_WAVE_THDMIIIHB_hhTohhVZ(Mhh,Mhh2,MVZ,MVZ2,Zfhh,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MVZ,MVZ2

Complex(dp), Intent(in) :: Zfhh(2,2),ZfVZ

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
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
Amp(:,gt1, gt2) = 0._dp
  End Do
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_hhTohhVZ


Subroutine Amplitude_VERTEX_THDMIIIHB_hhTohhVZ(MAh,MFd,MFe,MFu,Mhh,MHm,               & 
& Msigma1,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhhh,          & 
& cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,       & 
& cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,        & 
& cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHmcHmVZ,cplHmcVWmVZ,cplcHmVWmVZ,cplcVWmVWmVZ,    & 
& cplhhHmcVWmVZ1,cplhhcHmVWmVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVWm,MVZ,MAh2,MFd2(3),MFe2(3),         & 
& MFu2(3),Mhh2(2),MHm2(2),Msigma12,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhhhVZ(2),cplcFdFdhhL(3,3,2),         & 
& cplcFdFdhhR(3,3,2),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3,2),               & 
& cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuhhL(3,3,2),               & 
& cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWmgWmhh(2),cplcgWmgWmVZ,     & 
& cplcgWpCgWpChh(2),cplcgWpCgWpCVZ,cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),& 
& cplhhHmcVWm(2,2),cplhhsigma1sigma1(2),cplhhsigma1VZ(2),cplhhcHmVWm(2,2),               & 
& cplhhcVWmVWm(2),cplhhVZVZ(2),cplHmcHmVZ(2,2),cplHmcVWmVZ(2),cplcHmVWmVZ(2),            & 
& cplcVWmVWmVZ,cplhhHmcVWmVZ1(2,2),cplhhcHmVWmVZ1(2,2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVZ 


! {Ah, hh, Ah}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhhh(gt2)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhhhhh(gt2,i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, sigma1, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplAhhhhh(gt2,i3)
coup3 = cplhhsigma1VZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, VZ, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhhhhh(gt2,i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, sigma1}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhhhsigma1(gt2)
coup3 = -cplhhsigma1VZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, hh, VZ}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplAhhhhh(gt1,i2)
coup2 = -cplAhhhVZ(gt2)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdhhL(i1,i3,gt2)
coup2R = cplcFdFdhhR(i1,i3,gt2)
coup3L = -cplcFdFdVZR(i3,i2)
coup3R = -cplcFdFdVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFehhL(i1,i3,gt2)
coup2R = cplcFeFehhR(i1,i3,gt2)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuhhL(i1,i3,gt2)
coup2R = cplcFuFuhhR(i1,i3,gt2)
coup3L = -cplcFuFuVZR(i3,i2)
coup3R = -cplcFuFuVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWm, gWm, gWm}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgWmhh(gt2)
coup3 = cplcgWmgWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 


! {gWmC, gWmC, gWmC}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgWpChh(gt2)
coup3 = cplcgWpCgWpCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhhh(gt2,i1)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, Ah, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, sigma1, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplhhhhsigma1(gt1,i1)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = cplhhsigma1VZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, sigma1}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhsigma1(gt2,i1)
coup3 = -cplhhsigma1VZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Hm, Hm}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, VWm, Hm}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = -cplhhHmcVWm(gt1,i1)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = cplcHmVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, VWm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplhhcHmVWm(gt2,i1)
coup3 = cplHmcVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, VWm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplhhHmcVWm(gt1,i1)
coup2 = cplhhcHmVWm(gt2,i1)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {sigma1, hh, Ah}
  Do i2=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplAhhhsigma1(gt2)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {sigma1, Ah, hh}
    Do i3=1,2
ML1 = Msigma1 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhsigma1(gt1)
coup2 = cplhhhhsigma1(gt2,i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, sigma1, hh}
    Do i3=1,2
ML1 = Msigma1 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1 = cplhhsigma1sigma1(gt1)
coup2 = cplhhhhsigma1(gt2,i3)
coup3 = cplhhsigma1VZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, VZ, hh}
    Do i3=1,2
ML1 = Msigma1 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cplhhsigma1VZ(gt1)
coup2 = cplhhhhsigma1(gt2,i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {sigma1, hh, sigma1}
  Do i2=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplhhsigma1sigma1(gt2)
coup3 = -cplhhsigma1VZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {sigma1, hh, VZ}
  Do i2=1,2
ML1 = Msigma1 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhhhsigma1(gt1,i2)
coup2 = cplhhsigma1VZ(gt2)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VWm, Hm, Hm}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhcHmVWm(gt1,i2)
coup2 = cplhhHmcVWm(gt2,i3)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, VWm, Hm}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplhhHmcVWm(gt2,i3)
coup3 = cplcHmVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {VWm, Hm, VWm}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = -cplhhcHmVWm(gt1,i2)
coup2 = cplhhcVWmVWm(gt2)
coup3 = cplHmcVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VWm, VWm, VWm}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplhhcVWmVWm(gt2)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 


! {conj[Hm], conj[VWm], conj[Hm]}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = -cplhhcHmVWm(gt1,i1)
coup2 = cplhhHmcHm(gt2,i1,i3)
coup3 = cplHmcVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[Hm], conj[Hm], conj[VWm]}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplhhHmcVWm(gt2,i1)
coup3 = cplcHmVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], conj[VWm], conj[VWm]}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplhhcHmVWm(gt1,i1)
coup2 = cplhhHmcVWm(gt2,i1)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {conj[VWm], conj[Hm], conj[Hm]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhHmcVWm(gt1,i2)
coup2 = cplhhcHmVWm(gt2,i3)
coup3 = cplHmcHmVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWm], conj[VWm], conj[Hm]}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplhhcHmVWm(gt2,i3)
coup3 = cplHmcVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWm], conj[Hm], conj[VWm]}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = -cplhhHmcVWm(gt1,i2)
coup2 = cplhhcVWmVWm(gt2)
coup3 = cplcHmVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Hm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
coup1 = cplhhHmcVWm(gt1,i1)
coup2 = cplhhcHmVWmVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VWm, Hm}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
coup1 = cplhhcHmVWm(gt1,i2)
coup2 = cplhhHmcVWmVZ1(gt2,i2)
Call Amp_VERTEX_StoSV_Topology2_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Hm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
coup1 = cplhhHmcVWmVZ1(gt1,i1)
coup2 = cplhhcHmVWm(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {VWm, Hm}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
coup1 = cplhhcHmVWmVZ1(gt1,i2)
coup2 = cplhhHmcVWm(gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_THDMIIIHB_hhTohhVZ


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhTohhVZ(MAh,MFd,MFe,MFu,Mhh,MHm,            & 
& Msigma1,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhhh,          & 
& cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,       & 
& cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,        & 
& cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHmcHmVZ,cplHmcVWmVZ,cplcHmVWmVZ,cplcVWmVWmVZ,    & 
& cplhhHmcVWmVZ1,cplhhcHmVWmVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVWm,MVZ,MAh2,MFd2(3),MFe2(3),         & 
& MFu2(3),Mhh2(2),MHm2(2),Msigma12,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhhhVZ(2),cplcFdFdhhL(3,3,2),         & 
& cplcFdFdhhR(3,3,2),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3,2),               & 
& cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuhhL(3,3,2),               & 
& cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWmgWmhh(2),cplcgWmgWmVZ,     & 
& cplcgWpCgWpChh(2),cplcgWpCgWpCVZ,cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),& 
& cplhhHmcVWm(2,2),cplhhsigma1sigma1(2),cplhhsigma1VZ(2),cplhhcHmVWm(2,2),               & 
& cplhhcVWmVWm(2),cplhhVZVZ(2),cplHmcHmVZ(2,2),cplHmcVWmVZ(2),cplcHmVWmVZ(2),            & 
& cplcVWmVWmVZ,cplhhHmcVWmVZ1(2,2),cplhhcHmVWmVZ1(2,2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVZ 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhTohhVZ


Subroutine Amplitude_WAVE_THDMIIIHB_hhTosigma1VP(cplhhsigma1VZ,ctcplhhsigma1VZ,       & 
& Mhh,Mhh2,Msigma1,Msigma12,MVP,MVP2,MVZ,MVZ2,Zfhh,Zfsigma1,ZfVP,ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),Msigma1,Msigma12,MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplhhsigma1VZ(2)

Complex(dp), Intent(in) :: ctcplhhsigma1VZ(2)

Complex(dp), Intent(in) :: Zfhh(2,2),Zfsigma1,ZfVP,ZfVZVP

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Msigma1 
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
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZVP*cplhhsigma1VZ(gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_hhTosigma1VP


Subroutine Amplitude_VERTEX_THDMIIIHB_hhTosigma1VP(MFd,MFe,MFu,Mhh,MHm,               & 
& Msigma1,MVP,MVWm,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,cplcFdFdhhL,             & 
& cplcFdFdhhR,cplcFdFdsigma1L,cplcFdFdsigma1R,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,       & 
& cplcFeFehhR,cplcFeFesigma1L,cplcFeFesigma1R,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,       & 
& cplcFuFuhhR,cplcFuFusigma1L,cplcFuFusigma1R,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmhh,      & 
& cplcgWmgWmsigma1,cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCsigma1,cplcgWpCgWpCVP,        & 
& cplhhHmcHm,cplhhHmcVWm,cplhhcHmVWm,cplhhcVWmVWm,cplHmsigma1cHm,cplHmsigma1cVWm,        & 
& cplHmcHmVP,cplHmcVWmVP,cplsigma1cHmVWm,cplcHmVPVWm,cplcVWmVPVWm,cplhhHmcVWmVP1,        & 
& cplhhcHmVPVWm1,cplHmsigma1cVWmVP1,cplsigma1cHmVPVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVP,MVWm,MFd2(3),MFe2(3),MFu2(3),          & 
& Mhh2(2),MHm2(2),Msigma12,MVP2,MVWm2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdsigma1L(3,3),cplcFdFdsigma1R(3,3),      & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),               & 
& cplcFeFesigma1L(3,3),cplcFeFesigma1R(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),           & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFusigma1L(3,3),cplcFuFusigma1R(3,3),       & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcgWmgWmhh(2),cplcgWmgWmsigma1,cplcgWmgWmVP,       & 
& cplcgWpCgWpChh(2),cplcgWpCgWpCsigma1,cplcgWpCgWpCVP,cplhhHmcHm(2,2,2),cplhhHmcVWm(2,2),& 
& cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplHmsigma1cHm(2,2),cplHmsigma1cVWm(2),               & 
& cplHmcHmVP(2,2),cplHmcVWmVP(2),cplsigma1cHmVWm(2),cplcHmVPVWm(2),cplcVWmVPVWm,         & 
& cplhhHmcVWmVP1(2,2),cplhhcHmVPVWm1(2,2),cplHmsigma1cVWmVP1(2),cplsigma1cHmVPVWm1(2)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Msigma1 
Mex3 = MVP 


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdsigma1L(i1,i3)
coup2R = cplcFdFdsigma1R(i1,i3)
coup3L = -cplcFdFdVPR(i3,i2)
coup3R = -cplcFdFdVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFesigma1L(i1,i3)
coup2R = cplcFeFesigma1R(i1,i3)
coup3L = -cplcFeFeVPR(i3,i2)
coup3R = -cplcFeFeVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFusigma1L(i1,i3)
coup2R = cplcFuFusigma1R(i1,i3)
coup3L = -cplcFuFuVPR(i3,i2)
coup3R = -cplcFuFuVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWm, gWm, gWm}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgWmsigma1
coup3 = cplcgWmgWmVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {gWmC, gWmC, gWmC}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgWpCsigma1
coup3 = cplcgWpCgWpCVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {Hm, Hm, Hm}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplHmsigma1cHm(i3,i1)
coup3 = -cplHmcHmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, VWm, Hm}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = -cplhhHmcVWm(gt1,i1)
coup2 = cplHmsigma1cHm(i3,i1)
coup3 = cplcHmVPVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, VWm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplsigma1cHmVWm(i1)
coup3 = cplHmcVWmVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, VWm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplhhHmcVWm(gt1,i1)
coup2 = cplsigma1cHmVWm(i1)
coup3 = cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {VWm, Hm, Hm}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhcHmVWm(gt1,i2)
coup2 = -cplHmsigma1cVWm(i3)
coup3 = -cplHmcHmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, VWm, Hm}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = -cplHmsigma1cVWm(i3)
coup3 = cplcHmVPVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[Hm], conj[VWm], conj[Hm]}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = -cplhhcHmVWm(gt1,i1)
coup2 = cplHmsigma1cHm(i1,i3)
coup3 = cplHmcVWmVP(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[Hm], conj[Hm], conj[VWm]}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = -cplHmsigma1cVWm(i1)
coup3 = cplcHmVPVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], conj[VWm], conj[VWm]}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = -cplhhcHmVWm(gt1,i1)
coup2 = -cplHmsigma1cVWm(i1)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {conj[VWm], conj[Hm], conj[Hm]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhHmcVWm(gt1,i2)
coup2 = cplsigma1cHmVWm(i3)
coup3 = cplHmcHmVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWm], conj[VWm], conj[Hm]}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplsigma1cHmVWm(i3)
coup3 = cplHmcVWmVP(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Hm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
coup1 = cplhhHmcVWm(gt1,i1)
coup2 = cplsigma1cHmVPVWm1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {VWm, Hm}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
coup1 = cplhhcHmVWm(gt1,i2)
coup2 = cplHmsigma1cVWmVP1(i2)
Call Amp_VERTEX_StoSV_Topology2_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Hm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
coup1 = cplhhHmcVWmVP1(gt1,i1)
coup2 = cplsigma1cHmVWm(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {VWm, Hm}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
coup1 = cplhhcHmVPVWm1(gt1,i2)
coup2 = -cplHmsigma1cVWm(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

  End Do
End Do
End Subroutine Amplitude_VERTEX_THDMIIIHB_hhTosigma1VP


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhTosigma1VP(MFd,MFe,MFu,Mhh,MHm,            & 
& Msigma1,MVP,MVWm,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,cplcFdFdhhL,             & 
& cplcFdFdhhR,cplcFdFdsigma1L,cplcFdFdsigma1R,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,       & 
& cplcFeFehhR,cplcFeFesigma1L,cplcFeFesigma1R,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,       & 
& cplcFuFuhhR,cplcFuFusigma1L,cplcFuFusigma1R,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmhh,      & 
& cplcgWmgWmsigma1,cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCsigma1,cplcgWpCgWpCVP,        & 
& cplhhHmcHm,cplhhHmcVWm,cplhhcHmVWm,cplhhcVWmVWm,cplHmsigma1cHm,cplHmsigma1cVWm,        & 
& cplHmcHmVP,cplHmcVWmVP,cplsigma1cHmVWm,cplcHmVPVWm,cplcVWmVPVWm,cplhhHmcVWmVP1,        & 
& cplhhcHmVPVWm1,cplHmsigma1cVWmVP1,cplsigma1cHmVPVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),Msigma1,MVP,MVWm,MFd2(3),MFe2(3),MFu2(3),          & 
& Mhh2(2),MHm2(2),Msigma12,MVP2,MVWm2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdsigma1L(3,3),cplcFdFdsigma1R(3,3),      & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),               & 
& cplcFeFesigma1L(3,3),cplcFeFesigma1R(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),           & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFusigma1L(3,3),cplcFuFusigma1R(3,3),       & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcgWmgWmhh(2),cplcgWmgWmsigma1,cplcgWmgWmVP,       & 
& cplcgWpCgWpChh(2),cplcgWpCgWpCsigma1,cplcgWpCgWpCVP,cplhhHmcHm(2,2,2),cplhhHmcVWm(2,2),& 
& cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplHmsigma1cHm(2,2),cplHmsigma1cVWm(2),               & 
& cplHmcHmVP(2,2),cplHmcVWmVP(2),cplsigma1cHmVWm(2),cplcHmVPVWm(2),cplcVWmVPVWm,         & 
& cplhhHmcVWmVP1(2,2),cplhhcHmVPVWm1(2,2),cplHmsigma1cVWmVP1(2),cplsigma1cHmVPVWm1(2)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Msigma1 
Mex3 = MVP 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhTosigma1VP


Subroutine Amplitude_WAVE_THDMIIIHB_hhToVGVG(Mhh,Mhh2,MVG,MVG2,Zfhh,ZfVG,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MVG,MVG2

Complex(dp), Intent(in) :: Zfhh(2,2),ZfVG

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVG 
Mex3 = MVG 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
Amp(:,gt1) = 0._dp
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_hhToVGVG


Subroutine Amplitude_VERTEX_THDMIIIHB_hhToVGVG(MFd,MFu,Mhh,MVG,MFd2,MFu2,             & 
& Mhh2,MVG2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuhhL,cplcFuFuhhR,     & 
& cplcFuFuVGL,cplcFuFuVGR,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFu(3),Mhh(2),MVG,MFd2(3),MFu2(3),Mhh2(2),MVG2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),              & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVG 
Mex3 = MVG 


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = -cplcFdFdVGR(i1,i3)
coup2R = -cplcFdFdVGL(i1,i3)
coup3L = -cplcFdFdVGR(i3,i2)
coup3R = -cplcFdFdVGL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = -cplcFuFuVGR(i1,i3)
coup2R = -cplcFuFuVGL(i1,i3)
coup3L = -cplcFuFuVGR(i3,i2)
coup3R = -cplcFuFuVGL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End Do
End Subroutine Amplitude_VERTEX_THDMIIIHB_hhToVGVG


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhToVGVG(MFd,MFu,Mhh,MVG,MFd2,               & 
& MFu2,Mhh2,MVG2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFu(3),Mhh(2),MVG,MFd2(3),MFu2(3),Mhh2(2),MVG2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),              & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVG 
Mex3 = MVG 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhToVGVG


Subroutine Amplitude_WAVE_THDMIIIHB_hhToVPVP(cplhhVZVZ,ctcplhhVZVZ,Mhh,               & 
& Mhh2,MVP,MVP2,MVZ,MVZ2,Zfhh,ZfVP,ZfVPVZ,ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplhhVZVZ(2)

Complex(dp), Intent(in) :: ctcplhhVZVZ(2)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfVP,ZfVPVZ,ZfVZVP

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVP 
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
Amp(:,gt1) = 0._dp
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_hhToVPVP


Subroutine Amplitude_VERTEX_THDMIIIHB_hhToVPVP(MFd,MFe,MFu,Mhh,MHm,MVP,               & 
& MVWm,MFd2,MFe2,MFu2,Mhh2,MHm2,MVP2,MVWm2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,          & 
& cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,          & 
& cplcgWpCgWpCVP,cplhhHmcHm,cplhhHmcVWm,cplhhcHmVWm,cplhhcVWmVWm,cplHmcHmVP,             & 
& cplHmcVWmVP,cplcHmVPVWm,cplcVWmVPVWm,cplhhHmcVWmVP1,cplhhcHmVPVWm1,cplHmcHmVPVP1,      & 
& cplcVWmVPVPVWm3Q,cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),MVP,MVWm,MFd2(3),MFe2(3),MFu2(3),Mhh2(2),          & 
& MHm2(2),MVP2,MVWm2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),              & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),               & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),               & 
& cplcgWmgWmhh(2),cplcgWmgWmVP,cplcgWpCgWpChh(2),cplcgWpCgWpCVP,cplhhHmcHm(2,2,2),       & 
& cplhhHmcVWm(2,2),cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplHmcHmVP(2,2),cplHmcVWmVP(2),      & 
& cplcHmVPVWm(2),cplcVWmVPVWm,cplhhHmcVWmVP1(2,2),cplhhcHmVPVWm1(2,2),cplHmcHmVPVP1(2,2),& 
& cplcVWmVPVPVWm3Q,cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVP 
Mex3 = MVP 


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = -cplcFdFdVPR(i1,i3)
coup2R = -cplcFdFdVPL(i1,i3)
coup3L = -cplcFdFdVPR(i3,i2)
coup3R = -cplcFdFdVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = -cplcFeFeVPR(i1,i3)
coup2R = -cplcFeFeVPL(i1,i3)
coup3L = -cplcFeFeVPR(i3,i2)
coup3R = -cplcFeFeVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = -cplcFuFuVPR(i1,i3)
coup2R = -cplcFuFuVPL(i1,i3)
coup3L = -cplcFuFuVPR(i3,i2)
coup3R = -cplcFuFuVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWm, gWm, gWm}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgWmVP
coup3 = cplcgWmgWmVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {gWmC, gWmC, gWmC}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgWpCVP
coup3 = cplcgWpCgWpCVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {Hm, Hm, Hm}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = -cplHmcHmVP(i3,i1)
coup3 = -cplHmcHmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, VWm, Hm}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhHmcVWm(gt1,i1)
coup2 = -cplHmcHmVP(i3,i1)
coup3 = cplcHmVPVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, VWm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplcHmVPVWm(i1)
coup3 = cplHmcVWmVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, VWm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplhhHmcVWm(gt1,i1)
coup2 = cplcHmVPVWm(i1)
coup3 = cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {VWm, Hm, Hm}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhcHmVWm(gt1,i2)
coup2 = cplHmcVWmVP(i3)
coup3 = -cplHmcHmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, VWm, Hm}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplHmcVWmVP(i3)
coup3 = cplcHmVPVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VWm, Hm, VWm}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhcHmVWm(gt1,i2)
coup2 = cplcVWmVPVWm
coup3 = cplHmcVWmVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {VWm, VWm, VWm}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplcVWmVPVWm
coup3 = cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {conj[Hm], conj[VWm], conj[Hm]}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcHmVWm(gt1,i1)
coup2 = cplHmcHmVP(i1,i3)
coup3 = cplHmcVWmVP(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[Hm], conj[Hm], conj[VWm]}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplHmcVWmVP(i1)
coup3 = cplcHmVPVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], conj[VWm], conj[VWm]}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplhhcHmVWm(gt1,i1)
coup2 = cplHmcVWmVP(i1)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {conj[VWm], conj[Hm], conj[Hm]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcVWm(gt1,i2)
coup2 = cplcHmVPVWm(i3)
coup3 = cplHmcHmVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWm], conj[VWm], conj[Hm]}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplcHmVPVWm(i3)
coup3 = cplHmcVWmVP(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWm], conj[Hm], conj[VWm]}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcVWm(gt1,i2)
coup2 = -cplcVWmVPVWm
coup3 = cplcHmVPVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Hm, Hm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplHmcHmVPVP1(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VWm, VWm}
ML1 = MVWm 
ML2 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplcVWmVPVPVWm1Q
coup2b = coup2 
coup2 = cplcVWmVPVPVWm2Q
coup2c = coup2 
coup2 = cplcVWmVPVPVWm3Q
coup2a = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {Hm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
coup1 = cplhhHmcVWmVP1(gt1,i1)
coup2 = cplcHmVPVWm(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {VWm, Hm}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
coup1 = cplhhcHmVPVWm1(gt1,i2)
coup2 = cplHmcVWmVP(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

  End Do


! {Hm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
coup1 = cplhhHmcVWmVP1(gt1,i1)
coup2 = cplcHmVPVWm(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {VWm, Hm}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
coup1 = cplhhcHmVPVWm1(gt1,i2)
coup2 = cplHmcVWmVP(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

  End Do
End Do
End Subroutine Amplitude_VERTEX_THDMIIIHB_hhToVPVP


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhToVPVP(MFd,MFe,MFu,Mhh,MHm,MVP,            & 
& MVWm,MFd2,MFe2,MFu2,Mhh2,MHm2,MVP2,MVWm2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,          & 
& cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,          & 
& cplcgWpCgWpCVP,cplhhHmcHm,cplhhHmcVWm,cplhhcHmVWm,cplhhcVWmVWm,cplHmcHmVP,             & 
& cplHmcVWmVP,cplcHmVPVWm,cplcVWmVPVWm,cplhhHmcVWmVP1,cplhhcHmVPVWm1,cplHmcHmVPVP1,      & 
& cplcVWmVPVPVWm3Q,cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),MVP,MVWm,MFd2(3),MFe2(3),MFu2(3),Mhh2(2),          & 
& MHm2(2),MVP2,MVWm2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),              & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),               & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),               & 
& cplcgWmgWmhh(2),cplcgWmgWmVP,cplcgWpCgWpChh(2),cplcgWpCgWpCVP,cplhhHmcHm(2,2,2),       & 
& cplhhHmcVWm(2,2),cplhhcHmVWm(2,2),cplhhcVWmVWm(2),cplHmcHmVP(2,2),cplHmcVWmVP(2),      & 
& cplcHmVPVWm(2),cplcVWmVPVWm,cplhhHmcVWmVP1(2,2),cplhhcHmVPVWm1(2,2),cplHmcHmVPVP1(2,2),& 
& cplcVWmVPVPVWm3Q,cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVP 
Mex3 = MVP 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhToVPVP


Subroutine Amplitude_WAVE_THDMIIIHB_hhToVPVZ(cplhhVZVZ,ctcplhhVZVZ,Mhh,               & 
& Mhh2,MVP,MVP2,MVZ,MVZ2,Zfhh,ZfVP,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplhhVZVZ(2)

Complex(dp), Intent(in) :: ctcplhhVZVZ(2)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfVP,ZfVZ

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVP 
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
Amp(:,gt1) = 0._dp
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_hhToVPVZ


Subroutine Amplitude_VERTEX_THDMIIIHB_hhToVPVZ(MFd,MFe,MFu,Mhh,MHm,MVP,               & 
& MVWm,MVZ,MFd2,MFe2,MFu2,Mhh2,MHm2,MVP2,MVWm2,MVZ2,cplcFdFdhhL,cplcFdFdhhR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVP,             & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplhhHmcHm,cplhhHmcVWm,      & 
& cplhhcHmVWm,cplhhcVWmVWm,cplHmcHmVP,cplHmcVWmVP,cplHmcHmVZ,cplHmcVWmVZ,cplcHmVPVWm,    & 
& cplcVWmVPVWm,cplcHmVWmVZ,cplcVWmVWmVZ,cplhhHmcVWmVP1,cplhhHmcVWmVZ1,cplhhcHmVPVWm1,    & 
& cplhhcHmVWmVZ1,cplHmcHmVPVZ1,cplcVWmVPVWmVZ3Q,cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),MVP,MVWm,MVZ,MFd2(3),MFe2(3),MFu2(3),              & 
& Mhh2(2),MHm2(2),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),              & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),               & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuhhL(3,3,2),& 
& cplcFuFuhhR(3,3,2),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),& 
& cplcgWmgWmhh(2),cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpChh(2),cplcgWpCgWpCVP,            & 
& cplcgWpCgWpCVZ,cplhhHmcHm(2,2,2),cplhhHmcVWm(2,2),cplhhcHmVWm(2,2),cplhhcVWmVWm(2),    & 
& cplHmcHmVP(2,2),cplHmcVWmVP(2),cplHmcHmVZ(2,2),cplHmcVWmVZ(2),cplcHmVPVWm(2),          & 
& cplcVWmVPVWm,cplcHmVWmVZ(2),cplcVWmVWmVZ,cplhhHmcVWmVP1(2,2),cplhhHmcVWmVZ1(2,2),      & 
& cplhhcHmVPVWm1(2,2),cplhhcHmVWmVZ1(2,2),cplHmcHmVPVZ1(2,2),cplcVWmVPVWmVZ3Q,           & 
& cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ1Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVP 
Mex3 = MVZ 


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = -cplcFdFdVPR(i1,i3)
coup2R = -cplcFdFdVPL(i1,i3)
coup3L = -cplcFdFdVZR(i3,i2)
coup3R = -cplcFdFdVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = -cplcFeFeVPR(i1,i3)
coup2R = -cplcFeFeVPL(i1,i3)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = -cplcFuFuVPR(i1,i3)
coup2R = -cplcFuFuVPL(i1,i3)
coup3L = -cplcFuFuVZR(i3,i2)
coup3R = -cplcFuFuVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWm, gWm, gWm}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWmgWmhh(gt1)
coup2 = cplcgWmgWmVP
coup3 = cplcgWmgWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {gWmC, gWmC, gWmC}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplcgWpCgWpChh(gt1)
coup2 = cplcgWpCgWpCVP
coup3 = cplcgWpCgWpCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {Hm, Hm, Hm}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = -cplHmcHmVP(i3,i1)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, VWm, Hm}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhHmcVWm(gt1,i1)
coup2 = -cplHmcHmVP(i3,i1)
coup3 = cplcHmVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, VWm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplcHmVPVWm(i1)
coup3 = cplHmcVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, VWm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplhhHmcVWm(gt1,i1)
coup2 = cplcHmVPVWm(i1)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {VWm, Hm, Hm}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhcHmVWm(gt1,i2)
coup2 = cplHmcVWmVP(i3)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, VWm, Hm}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplHmcVWmVP(i3)
coup3 = cplcHmVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VWm, Hm, VWm}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhcHmVWm(gt1,i2)
coup2 = cplcVWmVPVWm
coup3 = cplHmcVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {VWm, VWm, VWm}
ML1 = MVWm 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplcVWmVPVWm
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {conj[Hm], conj[VWm], conj[Hm]}
Do i1=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcHmVWm(gt1,i1)
coup2 = cplHmcHmVP(i1,i3)
coup3 = cplHmcVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[Hm], conj[Hm], conj[VWm]}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplHmcVWmVP(i1)
coup3 = cplcHmVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], conj[VWm], conj[VWm]}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplhhcHmVWm(gt1,i1)
coup2 = cplHmcVWmVP(i1)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {conj[VWm], conj[Hm], conj[Hm]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcVWm(gt1,i2)
coup2 = cplcHmVPVWm(i3)
coup3 = cplHmcHmVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWm], conj[VWm], conj[Hm]}
    Do i3=1,2
ML1 = MVWm 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplcHmVPVWm(i3)
coup3 = cplHmcVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWm], conj[Hm], conj[VWm]}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1 = cplhhHmcVWm(gt1,i2)
coup2 = -cplcVWmVPVWm
coup3 = cplcHmVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Hm, Hm}
Do i1=1,2
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplHmcHmVPVZ1(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VWm, VWm}
ML1 = MVWm 
ML2 = MVWm 
coup1 = cplhhcVWmVWm(gt1)
coup2 = cplcVWmVPVWmVZ1Q
coup2b = coup2 
coup2 = cplcVWmVPVWmVZ2Q
coup2a = coup2 
coup2 = cplcVWmVPVWmVZ3Q
coup2c = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {Hm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
coup1 = cplhhHmcVWmVZ1(gt1,i1)
coup2 = cplcHmVPVWm(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {VWm, Hm}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
coup1 = cplhhcHmVWmVZ1(gt1,i2)
coup2 = cplHmcVWmVP(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

  End Do


! {Hm, VWm}
Do i1=1,2
ML1 = MHm(i1) 
ML2 = MVWm 
coup1 = cplhhHmcVWmVP1(gt1,i1)
coup2 = cplcHmVWmVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {VWm, Hm}
  Do i2=1,2
ML1 = MVWm 
ML2 = MHm(i2) 
coup1 = cplhhcHmVPVWm1(gt1,i2)
coup2 = cplHmcVWmVZ(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

  End Do
End Do
End Subroutine Amplitude_VERTEX_THDMIIIHB_hhToVPVZ


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhToVPVZ(MFd,MFe,MFu,Mhh,MHm,MVP,            & 
& MVWm,MVZ,MFd2,MFe2,MFu2,Mhh2,MHm2,MVP2,MVWm2,MVZ2,cplcFdFdhhL,cplcFdFdhhR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVP,             & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplhhHmcHm,cplhhHmcVWm,      & 
& cplhhcHmVWm,cplhhcVWmVWm,cplHmcHmVP,cplHmcVWmVP,cplHmcHmVZ,cplHmcVWmVZ,cplcHmVPVWm,    & 
& cplcVWmVPVWm,cplcHmVWmVZ,cplcVWmVWmVZ,cplhhHmcVWmVP1,cplhhHmcVWmVZ1,cplhhcHmVPVWm1,    & 
& cplhhcHmVWmVZ1,cplHmcHmVPVZ1,cplcVWmVPVWmVZ3Q,cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFe(3),MFu(3),Mhh(2),MHm(2),MVP,MVWm,MVZ,MFd2(3),MFe2(3),MFu2(3),              & 
& Mhh2(2),MHm2(2),MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),              & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),               & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuhhL(3,3,2),& 
& cplcFuFuhhR(3,3,2),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),& 
& cplcgWmgWmhh(2),cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpChh(2),cplcgWpCgWpCVP,            & 
& cplcgWpCgWpCVZ,cplhhHmcHm(2,2,2),cplhhHmcVWm(2,2),cplhhcHmVWm(2,2),cplhhcVWmVWm(2),    & 
& cplHmcHmVP(2,2),cplHmcVWmVP(2),cplHmcHmVZ(2,2),cplHmcVWmVZ(2),cplcHmVPVWm(2),          & 
& cplcVWmVPVWm,cplcHmVWmVZ(2),cplcVWmVWmVZ,cplhhHmcVWmVP1(2,2),cplhhHmcVWmVZ1(2,2),      & 
& cplhhcHmVPVWm1(2,2),cplhhcHmVWmVZ1(2,2),cplHmcHmVPVZ1(2,2),cplcVWmVPVWmVZ3Q,           & 
& cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ1Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVP 
Mex3 = MVZ 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_hhToVPVZ



End Module OneLoopDecay_hh_THDMIIIHB
