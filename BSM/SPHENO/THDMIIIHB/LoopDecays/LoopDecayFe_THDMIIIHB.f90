! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 17:26 on 25.10.2017   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecay_Fe_THDMIIIHB
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

Subroutine Amplitude_Tree_THDMIIIHB_FeToFeAh(cplcFeFeAhL,cplcFeFeAhR,MAh,             & 
& MFe,MAh2,MFe2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFe(3),MAh2,MFe2(3)

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3)

Complex(dp) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MAh 
! Tree-Level Vertex 
coupT1L = cplcFeFeAhL(gt1,gt2)
coupT1R = cplcFeFeAhR(gt1,gt2)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_THDMIIIHB_FeToFeAh


Subroutine Gamma_Real_THDMIIIHB_FeToFeAh(MLambda,em,gs,cplcFeFeAhL,cplcFeFeAhR,       & 
& MAh,MFe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3)

Real(dp), Intent(in) :: MAh,MFe(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3), GammarealGluon(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,3
  Do i2=1,3
CoupL = cplcFeFeAhL(i1,i2)
CoupR = cplcFeFeAhR(i1,i2)
Mex1 = MFe(i1)
Mex2 = MFe(i2)
Mex3 = MAh
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp,1._dp,0._dp,1._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i1,i2),kont)
  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_THDMIIIHB_FeToFeAh


Subroutine Amplitude_WAVE_THDMIIIHB_FeToFeAh(cplcFeFeAhL,cplcFeFeAhR,ctcplcFeFeAhL,   & 
& ctcplcFeFeAhR,MAh,MAh2,MFe,MFe2,ZfAh,ZfEL,ZfER,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MAh2,MFe(3),MFe2(3)

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3)

Complex(dp), Intent(in) :: ctcplcFeFeAhL(3,3),ctcplcFeFeAhR(3,3)

Complex(dp), Intent(in) :: ZfAh,ZfEL(3,3),ZfER(3,3)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MAh 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFeFeAhL(gt1,gt2) 
ZcoupT1R = ctcplcFeFeAhR(gt1,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfER(i1,gt1)*cplcFeFeAhL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfEL(i1,gt1))*cplcFeFeAhR(i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfEL(i1,gt2)*cplcFeFeAhL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfER(i1,gt2))*cplcFeFeAhR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfAh*cplcFeFeAhL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfAh*cplcFeFeAhR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_FeToFeAh


Subroutine Amplitude_VERTEX_THDMIIIHB_FeToFeAh(MAh,MFe,Mhh,MHm,Msigma1,               & 
& MVP,MVWm,MVZ,MAh2,MFe2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,         & 
& cplAhAhsigma1,cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,               & 
& cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFeFehhL,cplcFeFehhR,          & 
& cplcFeFesigma1L,cplcFeFesigma1R,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,       & 
& cplcFvFecHmL,cplcFvFecHmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFeFvHmL,cplcFeFvHmR,         & 
& cplcFeFvVWmL,cplcFeFvVWmR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFe(3),Mhh(2),MHm(2),Msigma1,MVP,MVWm,MVZ,MAh2,MFe2(3),Mhh2(2),MHm2(2),           & 
& Msigma12,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhhh(2),cplAhAhsigma1,cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),               & 
& cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhhhVZ(2),cplAhHmcHm(2,2),cplAhHmcVWm(2),           & 
& cplAhsigma1sigma1,cplAhcHmVWm(2),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFesigma1L(3,3),& 
& cplcFeFesigma1R(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),               & 
& cplcFeFeVZR(3,3),cplcFvFecHmL(3,3,2),cplcFvFecHmR(3,3,2),cplcFvFecVWmL(3,3),           & 
& cplcFvFecVWmR(3,3),cplcFeFvHmL(3,3,2),cplcFeFvHmR(3,3,2),cplcFeFvVWmL(3,3),            & 
& cplcFeFvVWmR(3,3)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MAh 


! {Ah, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeAhL(gt1,i2)
coup1R = cplcFeFeAhR(gt1,i2)
coup2L = cplcFeFeAhL(i3,gt2)
coup2R = cplcFeFeAhR(i3,gt2)
coup3L = cplcFeFeAhL(i2,i3)
coup3R = cplcFeFeAhR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fe, Ah, Ah}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MAh 
ML3 = MAh 
coup1L = cplcFeFeAhL(gt1,i1)
coup1R = cplcFeFeAhR(gt1,i1)
coup2L = cplcFeFeAhL(i1,gt2)
coup2R = cplcFeFeAhR(i1,gt2)
coup3 = cplAhAhAh
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fe, hh, Ah}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2)
coup2R = cplcFeFeAhR(i1,gt2)
coup3 = cplAhAhhh(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, sigma1, Ah}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = Msigma1 
ML3 = MAh 
coup1L = cplcFeFesigma1L(gt1,i1)
coup1R = cplcFeFesigma1R(gt1,i1)
coup2L = cplcFeFeAhL(i1,gt2)
coup2R = cplcFeFeAhR(i1,gt2)
coup3 = cplAhAhsigma1
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fe, Ah, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1L = cplcFeFeAhL(gt1,i1)
coup1R = cplcFeFeAhR(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, hh, hh}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, sigma1, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1L = cplcFeFesigma1L(gt1,i1)
coup1R = cplcFeFesigma1R(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplAhhhsigma1(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, VZ, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = -cplcFeFeVZR(gt1,i1)
coup1R = -cplcFeFeVZL(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, Ah, sigma1}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MAh 
ML3 = Msigma1 
coup1L = cplcFeFeAhL(gt1,i1)
coup1R = cplcFeFeAhR(gt1,i1)
coup2L = cplcFeFesigma1L(i1,gt2)
coup2R = cplcFeFesigma1R(i1,gt2)
coup3 = cplAhAhsigma1
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fe, hh, sigma1}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFesigma1L(i1,gt2)
coup2R = cplcFeFesigma1R(i1,gt2)
coup3 = cplAhhhsigma1(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, sigma1, sigma1}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = Msigma1 
ML3 = Msigma1 
coup1L = cplcFeFesigma1L(gt1,i1)
coup1R = cplcFeFesigma1R(gt1,i1)
coup2L = cplcFeFesigma1L(i1,gt2)
coup2R = cplcFeFesigma1R(i1,gt2)
coup3 = cplAhsigma1sigma1
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fe, hh, VZ}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = -cplcFeFeVZR(i1,gt2)
coup2R = -cplcFeFeVZL(i1,gt2)
coup3 = -cplAhhhVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fv, conj[Hm], conj[Hm]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = 0. 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplcFeFvHmL(gt1,i1,i2)
coup1R = cplcFeFvHmR(gt1,i1,i2)
coup2L = cplcFvFecHmL(i1,gt2,i3)
coup2R = cplcFvFecHmR(i1,gt2,i3)
coup3 = cplAhHmcHm(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fv, conj[VWm], conj[Hm]}
Do i1=1,3
    Do i3=1,2
ML1 = 0. 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1L = -cplcFeFvVWmR(gt1,i1)
coup1R = -cplcFeFvVWmL(gt1,i1)
coup2L = cplcFvFecHmL(i1,gt2,i3)
coup2R = cplcFvFecHmR(i1,gt2,i3)
coup3 = -cplAhHmcVWm(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fv, conj[Hm], conj[VWm]}
Do i1=1,3
  Do i2=1,2
ML1 = 0. 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1L = cplcFeFvHmL(gt1,i1,i2)
coup1R = cplcFeFvHmR(gt1,i1,i2)
coup2L = -cplcFvFecVWmR(i1,gt2)
coup2R = -cplcFvFecVWmL(i1,gt2)
coup3 = -cplAhcHmVWm(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, bar[Fe], bar[Fe]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(gt1,i2,i1)
coup1R = cplcFeFehhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
coup3L = cplcFeFeAhL(i2,i3)
coup3R = cplcFeFeAhR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {sigma1, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = Msigma1 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFesigma1L(gt1,i2)
coup1R = cplcFeFesigma1R(gt1,i2)
coup2L = cplcFeFesigma1L(i3,gt2)
coup2R = cplcFeFesigma1R(i3,gt2)
coup3L = cplcFeFeAhL(i2,i3)
coup3R = cplcFeFeAhR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VP, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFeVPR(gt1,i2)
coup1R = -cplcFeFeVPL(gt1,i2)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplcFeFeAhL(i2,i3)
coup3R = cplcFeFeAhR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFeVZR(gt1,i2)
coup1R = -cplcFeFeVZL(gt1,i2)
coup2L = -cplcFeFeVZR(i3,gt2)
coup2R = -cplcFeFeVZL(i3,gt2)
coup3L = cplcFeFeAhL(i2,i3)
coup3R = cplcFeFeAhR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_THDMIIIHB_FeToFeAh


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_FeToFeAh(MAh,MFe,Mhh,MHm,Msigma1,            & 
& MVP,MVWm,MVZ,MAh2,MFe2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,         & 
& cplAhAhsigma1,cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,               & 
& cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFeFehhL,cplcFeFehhR,          & 
& cplcFeFesigma1L,cplcFeFesigma1R,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,       & 
& cplcFvFecHmL,cplcFvFecHmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFeFvHmL,cplcFeFvHmR,         & 
& cplcFeFvVWmL,cplcFeFvVWmR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFe(3),Mhh(2),MHm(2),Msigma1,MVP,MVWm,MVZ,MAh2,MFe2(3),Mhh2(2),MHm2(2),           & 
& Msigma12,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhhh(2),cplAhAhsigma1,cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),               & 
& cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhhhVZ(2),cplAhHmcHm(2,2),cplAhHmcVWm(2),           & 
& cplAhsigma1sigma1,cplAhcHmVWm(2),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFesigma1L(3,3),& 
& cplcFeFesigma1R(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),               & 
& cplcFeFeVZR(3,3),cplcFvFecHmL(3,3,2),cplcFvFecHmR(3,3,2),cplcFvFecVWmL(3,3),           & 
& cplcFvFecVWmR(3,3),cplcFeFvHmL(3,3,2),cplcFeFvHmR(3,3,2),cplcFeFvVWmL(3,3),            & 
& cplcFeFvVWmR(3,3)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MAh 


! {VP, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFeVPR(gt1,i2)
coup1R = -cplcFeFeVPL(gt1,i2)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplcFeFeAhL(i2,i3)
coup3R = cplcFeFeAhR(i2,i3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_FeToFeAh


Subroutine Amplitude_Tree_THDMIIIHB_FeToFehh(cplcFeFehhL,cplcFeFehhR,MFe,             & 
& Mhh,MFe2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),Mhh(2),MFe2(3),Mhh2(2)

Complex(dp), Intent(in) :: cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2)

Complex(dp) :: Amp(2,3,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,2
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = Mhh(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFeFehhL(gt1,gt2,gt3)
coupT1R = cplcFeFehhR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_THDMIIIHB_FeToFehh


Subroutine Gamma_Real_THDMIIIHB_FeToFehh(MLambda,em,gs,cplcFeFehhL,cplcFeFehhR,       & 
& MFe,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2)

Real(dp), Intent(in) :: MFe(3),Mhh(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3,2), GammarealGluon(3,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
CoupL = cplcFeFehhL(i1,i2,i3)
CoupR = cplcFeFehhR(i1,i2,i3)
Mex1 = MFe(i1)
Mex2 = MFe(i2)
Mex3 = Mhh(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp,1._dp,0._dp,1._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_THDMIIIHB_FeToFehh


Subroutine Amplitude_WAVE_THDMIIIHB_FeToFehh(cplcFeFehhL,cplcFeFehhR,ctcplcFeFehhL,   & 
& ctcplcFeFehhR,MFe,MFe2,Mhh,Mhh2,ZfEL,ZfER,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFe2(3),Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2)

Complex(dp), Intent(in) :: ctcplcFeFehhL(3,3,2),ctcplcFeFehhR(3,3,2)

Complex(dp), Intent(in) :: ZfEL(3,3),ZfER(3,3),Zfhh(2,2)

Complex(dp), Intent(out) :: Amp(2,3,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,2
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = Mhh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFeFehhL(gt1,gt2,gt3) 
ZcoupT1R = ctcplcFeFehhR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfER(i1,gt1)*cplcFeFehhL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfEL(i1,gt1))*cplcFeFehhR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfEL(i1,gt2)*cplcFeFehhL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfER(i1,gt2))*cplcFeFehhR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh(i1,gt3)*cplcFeFehhL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh(i1,gt3)*cplcFeFehhR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_FeToFehh


Subroutine Amplitude_VERTEX_THDMIIIHB_FeToFehh(MAh,MFe,Mhh,MHm,Msigma1,               & 
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

Complex(dp), Intent(out) :: Amp(2,3,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,2
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = Mhh(gt3) 


! {Ah, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeAhL(gt1,i2)
coup1R = cplcFeFeAhR(gt1,i2)
coup2L = cplcFeFeAhL(i3,gt2)
coup2R = cplcFeFeAhR(i3,gt2)
coup3L = cplcFeFehhL(i2,i3,gt3)
coup3R = cplcFeFehhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fe, Ah, Ah}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MAh 
ML3 = MAh 
coup1L = cplcFeFeAhL(gt1,i1)
coup1R = cplcFeFeAhR(gt1,i1)
coup2L = cplcFeFeAhL(i1,gt2)
coup2R = cplcFeFeAhR(i1,gt2)
coup3 = cplAhAhhh(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, hh, Ah}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2)
coup2R = cplcFeFeAhR(i1,gt2)
coup3 = cplAhhhhh(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, sigma1, Ah}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = Msigma1 
ML3 = MAh 
coup1L = cplcFeFesigma1L(gt1,i1)
coup1R = cplcFeFesigma1R(gt1,i1)
coup2L = cplcFeFeAhL(i1,gt2)
coup2R = cplcFeFeAhR(i1,gt2)
coup3 = cplAhhhsigma1(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, VZ, Ah}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = MAh 
coup1L = -cplcFeFeVZR(gt1,i1)
coup1R = -cplcFeFeVZL(gt1,i1)
coup2L = cplcFeFeAhL(i1,gt2)
coup2R = cplcFeFeAhR(i1,gt2)
coup3 = cplAhhhVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, Ah, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1L = cplcFeFeAhL(gt1,i1)
coup1R = cplcFeFeAhR(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplAhhhhh(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, hh, hh}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhhhhh(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, sigma1, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1L = cplcFeFesigma1L(gt1,i1)
coup1R = cplcFeFesigma1R(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhhhsigma1(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, Ah, sigma1}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MAh 
ML3 = Msigma1 
coup1L = cplcFeFeAhL(gt1,i1)
coup1R = cplcFeFeAhR(gt1,i1)
coup2L = cplcFeFesigma1L(i1,gt2)
coup2R = cplcFeFesigma1R(i1,gt2)
coup3 = cplAhhhsigma1(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, hh, sigma1}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFesigma1L(i1,gt2)
coup2R = cplcFeFesigma1R(i1,gt2)
coup3 = cplhhhhsigma1(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, sigma1, sigma1}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = Msigma1 
ML3 = Msigma1 
coup1L = cplcFeFesigma1L(gt1,i1)
coup1R = cplcFeFesigma1R(gt1,i1)
coup2L = cplcFeFesigma1L(i1,gt2)
coup2R = cplcFeFesigma1R(i1,gt2)
coup3 = cplhhsigma1sigma1(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, VZ, sigma1}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = Msigma1 
coup1L = -cplcFeFeVZR(gt1,i1)
coup1R = -cplcFeFeVZL(gt1,i1)
coup2L = cplcFeFesigma1L(i1,gt2)
coup2R = cplcFeFesigma1R(i1,gt2)
coup3 = -cplhhsigma1VZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, Ah, VZ}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MAh 
ML3 = MVZ 
coup1L = cplcFeFeAhL(gt1,i1)
coup1R = cplcFeFeAhR(gt1,i1)
coup2L = -cplcFeFeVZR(i1,gt2)
coup2R = -cplcFeFeVZL(i1,gt2)
coup3 = cplAhhhVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, sigma1, VZ}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = Msigma1 
ML3 = MVZ 
coup1L = cplcFeFesigma1L(gt1,i1)
coup1R = cplcFeFesigma1R(gt1,i1)
coup2L = -cplcFeFeVZR(i1,gt2)
coup2R = -cplcFeFeVZL(i1,gt2)
coup3 = -cplhhsigma1VZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, VZ, VZ}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = MVZ 
coup1L = -cplcFeFeVZR(gt1,i1)
coup1R = -cplcFeFeVZL(gt1,i1)
coup2L = -cplcFeFeVZR(i1,gt2)
coup2R = -cplcFeFeVZL(i1,gt2)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fv, conj[Hm], conj[Hm]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = 0. 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplcFeFvHmL(gt1,i1,i2)
coup1R = cplcFeFvHmR(gt1,i1,i2)
coup2L = cplcFvFecHmL(i1,gt2,i3)
coup2R = cplcFvFecHmR(i1,gt2,i3)
coup3 = cplhhHmcHm(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fv, conj[VWm], conj[Hm]}
Do i1=1,3
    Do i3=1,2
ML1 = 0. 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1L = -cplcFeFvVWmR(gt1,i1)
coup1R = -cplcFeFvVWmL(gt1,i1)
coup2L = cplcFvFecHmL(i1,gt2,i3)
coup2R = cplcFvFecHmR(i1,gt2,i3)
coup3 = -cplhhHmcVWm(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fv, conj[Hm], conj[VWm]}
Do i1=1,3
  Do i2=1,2
ML1 = 0. 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1L = cplcFeFvHmL(gt1,i1,i2)
coup1R = cplcFeFvHmR(gt1,i1,i2)
coup2L = -cplcFvFecVWmR(i1,gt2)
coup2R = -cplcFvFecVWmL(i1,gt2)
coup3 = -cplhhcHmVWm(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fv, conj[VWm], conj[VWm]}
Do i1=1,3
ML1 = 0. 
ML2 = MVWm 
ML3 = MVWm 
coup1L = -cplcFeFvVWmR(gt1,i1)
coup1R = -cplcFeFvVWmL(gt1,i1)
coup2L = -cplcFvFecVWmR(i1,gt2)
coup2R = -cplcFvFecVWmL(i1,gt2)
coup3 = cplhhcVWmVWm(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, bar[Fe], bar[Fe]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(gt1,i2,i1)
coup1R = cplcFeFehhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
coup3L = cplcFeFehhL(i2,i3,gt3)
coup3R = cplcFeFehhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {sigma1, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = Msigma1 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFesigma1L(gt1,i2)
coup1R = cplcFeFesigma1R(gt1,i2)
coup2L = cplcFeFesigma1L(i3,gt2)
coup2R = cplcFeFesigma1R(i3,gt2)
coup3L = cplcFeFehhL(i2,i3,gt3)
coup3R = cplcFeFehhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VP, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFeVPR(gt1,i2)
coup1R = -cplcFeFeVPL(gt1,i2)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplcFeFehhL(i2,i3,gt3)
coup3R = cplcFeFehhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFeVZR(gt1,i2)
coup1R = -cplcFeFeVZL(gt1,i2)
coup2L = -cplcFeFeVZR(i3,gt2)
coup2R = -cplcFeFeVZL(i3,gt2)
coup3L = cplcFeFehhL(i2,i3,gt3)
coup3R = cplcFeFehhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
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
End Subroutine Amplitude_VERTEX_THDMIIIHB_FeToFehh


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_FeToFehh(MAh,MFe,Mhh,MHm,Msigma1,            & 
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

Complex(dp), Intent(out) :: Amp(2,3,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,2
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = Mhh(gt3) 


! {VP, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFeVPR(gt1,i2)
coup1R = -cplcFeFeVPL(gt1,i2)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplcFeFehhL(i2,i3,gt3)
coup3R = cplcFeFehhR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_FeToFehh


Subroutine Amplitude_Tree_THDMIIIHB_FeToFesigma1(cplcFeFesigma1L,cplcFeFesigma1R,     & 
& MFe,Msigma1,MFe2,Msigma12,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),Msigma1,MFe2(3),Msigma12

Complex(dp), Intent(in) :: cplcFeFesigma1L(3,3),cplcFeFesigma1R(3,3)

Complex(dp) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = Msigma1 
! Tree-Level Vertex 
coupT1L = cplcFeFesigma1L(gt1,gt2)
coupT1R = cplcFeFesigma1R(gt1,gt2)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_THDMIIIHB_FeToFesigma1


Subroutine Gamma_Real_THDMIIIHB_FeToFesigma1(MLambda,em,gs,cplcFeFesigma1L,           & 
& cplcFeFesigma1R,MFe,Msigma1,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFeFesigma1L(3,3),cplcFeFesigma1R(3,3)

Real(dp), Intent(in) :: MFe(3),Msigma1

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3), GammarealGluon(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,3
  Do i2=1,3
CoupL = cplcFeFesigma1L(i1,i2)
CoupR = cplcFeFesigma1R(i1,i2)
Mex1 = MFe(i1)
Mex2 = MFe(i2)
Mex3 = Msigma1
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp,1._dp,0._dp,1._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i1,i2),kont)
  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_THDMIIIHB_FeToFesigma1


Subroutine Amplitude_WAVE_THDMIIIHB_FeToFesigma1(cplcFeFesigma1L,cplcFeFesigma1R,     & 
& ctcplcFeFesigma1L,ctcplcFeFesigma1R,MFe,MFe2,Msigma1,Msigma12,ZfEL,ZfER,               & 
& Zfsigma1,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFe2(3),Msigma1,Msigma12

Complex(dp), Intent(in) :: cplcFeFesigma1L(3,3),cplcFeFesigma1R(3,3)

Complex(dp), Intent(in) :: ctcplcFeFesigma1L(3,3),ctcplcFeFesigma1R(3,3)

Complex(dp), Intent(in) :: ZfEL(3,3),ZfER(3,3),Zfsigma1

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = Msigma1 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFeFesigma1L(gt1,gt2) 
ZcoupT1R = ctcplcFeFesigma1R(gt1,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfER(i1,gt1)*cplcFeFesigma1L(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfEL(i1,gt1))*cplcFeFesigma1R(i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfEL(i1,gt2)*cplcFeFesigma1L(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfER(i1,gt2))*cplcFeFesigma1R(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfsigma1*cplcFeFesigma1L(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfsigma1*cplcFeFesigma1R(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_FeToFesigma1


Subroutine Amplitude_VERTEX_THDMIIIHB_FeToFesigma1(MAh,MFe,Mhh,MHm,Msigma1,           & 
& MVP,MVWm,MVZ,MAh2,MFe2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,cplAhAhsigma1,               & 
& cplcFeFeAhL,cplcFeFeAhR,cplAhhhsigma1,cplAhsigma1sigma1,cplcFeFehhL,cplcFeFehhR,       & 
& cplcFeFesigma1L,cplcFeFesigma1R,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,       & 
& cplcFvFecHmL,cplcFvFecHmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFeFvHmL,cplcFeFvHmR,         & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhhhsigma1,cplhhsigma1sigma1,cplhhsigma1VZ,               & 
& cplHmsigma1cHm,cplHmsigma1cVWm,cplsigma1sigma1sigma1,cplsigma1cHmVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFe(3),Mhh(2),MHm(2),Msigma1,MVP,MVWm,MVZ,MAh2,MFe2(3),Mhh2(2),MHm2(2),           & 
& Msigma12,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhsigma1,cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplAhhhsigma1(2),cplAhsigma1sigma1,   & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFesigma1L(3,3),cplcFeFesigma1R(3,3),       & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFvFecHmL(3,3,2),& 
& cplcFvFecHmR(3,3,2),cplcFvFecVWmL(3,3),cplcFvFecVWmR(3,3),cplcFeFvHmL(3,3,2),          & 
& cplcFeFvHmR(3,3,2),cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplhhhhsigma1(2,2),             & 
& cplhhsigma1sigma1(2),cplhhsigma1VZ(2),cplHmsigma1cHm(2,2),cplHmsigma1cVWm(2),          & 
& cplsigma1sigma1sigma1,cplsigma1cHmVWm(2)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = Msigma1 


! {Ah, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeAhL(gt1,i2)
coup1R = cplcFeFeAhR(gt1,i2)
coup2L = cplcFeFeAhL(i3,gt2)
coup2R = cplcFeFeAhR(i3,gt2)
coup3L = cplcFeFesigma1L(i2,i3)
coup3R = cplcFeFesigma1R(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fe, Ah, Ah}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MAh 
ML3 = MAh 
coup1L = cplcFeFeAhL(gt1,i1)
coup1R = cplcFeFeAhR(gt1,i1)
coup2L = cplcFeFeAhL(i1,gt2)
coup2R = cplcFeFeAhR(i1,gt2)
coup3 = cplAhAhsigma1
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fe, hh, Ah}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2)
coup2R = cplcFeFeAhR(i1,gt2)
coup3 = cplAhhhsigma1(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, sigma1, Ah}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = Msigma1 
ML3 = MAh 
coup1L = cplcFeFesigma1L(gt1,i1)
coup1R = cplcFeFesigma1R(gt1,i1)
coup2L = cplcFeFeAhL(i1,gt2)
coup2R = cplcFeFeAhR(i1,gt2)
coup3 = cplAhsigma1sigma1
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fe, Ah, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1L = cplcFeFeAhL(gt1,i1)
coup1R = cplcFeFeAhR(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplAhhhsigma1(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, hh, hh}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhhhsigma1(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, sigma1, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1L = cplcFeFesigma1L(gt1,i1)
coup1R = cplcFeFesigma1R(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhsigma1sigma1(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, VZ, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = -cplcFeFeVZR(gt1,i1)
coup1R = -cplcFeFeVZL(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhsigma1VZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, Ah, sigma1}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MAh 
ML3 = Msigma1 
coup1L = cplcFeFeAhL(gt1,i1)
coup1R = cplcFeFeAhR(gt1,i1)
coup2L = cplcFeFesigma1L(i1,gt2)
coup2R = cplcFeFesigma1R(i1,gt2)
coup3 = cplAhsigma1sigma1
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fe, hh, sigma1}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFesigma1L(i1,gt2)
coup2R = cplcFeFesigma1R(i1,gt2)
coup3 = cplhhsigma1sigma1(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, sigma1, sigma1}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = Msigma1 
ML3 = Msigma1 
coup1L = cplcFeFesigma1L(gt1,i1)
coup1R = cplcFeFesigma1R(gt1,i1)
coup2L = cplcFeFesigma1L(i1,gt2)
coup2R = cplcFeFesigma1R(i1,gt2)
coup3 = cplsigma1sigma1sigma1
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fe, hh, VZ}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = -cplcFeFeVZR(i1,gt2)
coup2R = -cplcFeFeVZL(i1,gt2)
coup3 = cplhhsigma1VZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fv, conj[Hm], conj[Hm]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = 0. 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplcFeFvHmL(gt1,i1,i2)
coup1R = cplcFeFvHmR(gt1,i1,i2)
coup2L = cplcFvFecHmL(i1,gt2,i3)
coup2R = cplcFvFecHmR(i1,gt2,i3)
coup3 = cplHmsigma1cHm(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fv, conj[VWm], conj[Hm]}
Do i1=1,3
    Do i3=1,2
ML1 = 0. 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1L = -cplcFeFvVWmR(gt1,i1)
coup1R = -cplcFeFvVWmL(gt1,i1)
coup2L = cplcFvFecHmL(i1,gt2,i3)
coup2R = cplcFvFecHmR(i1,gt2,i3)
coup3 = cplHmsigma1cVWm(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fv, conj[Hm], conj[VWm]}
Do i1=1,3
  Do i2=1,2
ML1 = 0. 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1L = cplcFeFvHmL(gt1,i1,i2)
coup1R = cplcFeFvHmR(gt1,i1,i2)
coup2L = -cplcFvFecVWmR(i1,gt2)
coup2R = -cplcFvFecVWmL(i1,gt2)
coup3 = -cplsigma1cHmVWm(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, bar[Fe], bar[Fe]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(gt1,i2,i1)
coup1R = cplcFeFehhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
coup3L = cplcFeFesigma1L(i2,i3)
coup3R = cplcFeFesigma1R(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {sigma1, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = Msigma1 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFesigma1L(gt1,i2)
coup1R = cplcFeFesigma1R(gt1,i2)
coup2L = cplcFeFesigma1L(i3,gt2)
coup2R = cplcFeFesigma1R(i3,gt2)
coup3L = cplcFeFesigma1L(i2,i3)
coup3R = cplcFeFesigma1R(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VP, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFeVPR(gt1,i2)
coup1R = -cplcFeFeVPL(gt1,i2)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplcFeFesigma1L(i2,i3)
coup3R = cplcFeFesigma1R(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFeVZR(gt1,i2)
coup1R = -cplcFeFeVZL(gt1,i2)
coup2L = -cplcFeFeVZR(i3,gt2)
coup2R = -cplcFeFeVZL(i3,gt2)
coup3L = cplcFeFesigma1L(i2,i3)
coup3R = cplcFeFesigma1R(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_THDMIIIHB_FeToFesigma1


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_FeToFesigma1(MAh,MFe,Mhh,MHm,Msigma1,        & 
& MVP,MVWm,MVZ,MAh2,MFe2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,cplAhAhsigma1,               & 
& cplcFeFeAhL,cplcFeFeAhR,cplAhhhsigma1,cplAhsigma1sigma1,cplcFeFehhL,cplcFeFehhR,       & 
& cplcFeFesigma1L,cplcFeFesigma1R,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,       & 
& cplcFvFecHmL,cplcFvFecHmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFeFvHmL,cplcFeFvHmR,         & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhhhsigma1,cplhhsigma1sigma1,cplhhsigma1VZ,               & 
& cplHmsigma1cHm,cplHmsigma1cVWm,cplsigma1sigma1sigma1,cplsigma1cHmVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFe(3),Mhh(2),MHm(2),Msigma1,MVP,MVWm,MVZ,MAh2,MFe2(3),Mhh2(2),MHm2(2),           & 
& Msigma12,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplAhAhsigma1,cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplAhhhsigma1(2),cplAhsigma1sigma1,   & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFesigma1L(3,3),cplcFeFesigma1R(3,3),       & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFvFecHmL(3,3,2),& 
& cplcFvFecHmR(3,3,2),cplcFvFecVWmL(3,3),cplcFvFecVWmR(3,3),cplcFeFvHmL(3,3,2),          & 
& cplcFeFvHmR(3,3,2),cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplhhhhsigma1(2,2),             & 
& cplhhsigma1sigma1(2),cplhhsigma1VZ(2),cplHmsigma1cHm(2,2),cplHmsigma1cVWm(2),          & 
& cplsigma1sigma1sigma1,cplsigma1cHmVWm(2)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = Msigma1 


! {VP, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFeVPR(gt1,i2)
coup1R = -cplcFeFeVPL(gt1,i2)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplcFeFesigma1L(i2,i3)
coup3R = cplcFeFesigma1R(i2,i3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_FeToFesigma1


Subroutine Amplitude_Tree_THDMIIIHB_FeToFeVZ(cplcFeFeVZL,cplcFeFeVZR,MFe,             & 
& MVZ,MFe2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MVZ,MFe2(3),MVZ2

Complex(dp), Intent(in) :: cplcFeFeVZL(3,3),cplcFeFeVZR(3,3)

Complex(dp) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1L = cplcFeFeVZL(gt1,gt2)
coupT1R = cplcFeFeVZR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_THDMIIIHB_FeToFeVZ


Subroutine Gamma_Real_THDMIIIHB_FeToFeVZ(MLambda,em,gs,cplcFeFeVZL,cplcFeFeVZR,       & 
& MFe,MVZ,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFeFeVZL(3,3),cplcFeFeVZR(3,3)

Real(dp), Intent(in) :: MFe(3),MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3), GammarealGluon(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,3
  Do i2=1,3
CoupL = cplcFeFeVZL(i1,i2)
CoupR = cplcFeFeVZR(i1,i2)
Mex1 = MFe(i1)
Mex2 = MFe(i2)
Mex3 = MVZ
If (Mex1.gt.(Mex2+Mex3)) Then 
  Call hardphotonFFZ(Mex1,Mex2,Mex3,MLambda,-1._dp,-1._dp,CoupL,CoupR,(0,1)*em,GammaRealPhoton(i1,i2),kont)
  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_THDMIIIHB_FeToFeVZ


Subroutine Amplitude_WAVE_THDMIIIHB_FeToFeVZ(cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,     & 
& cplcFeFeVZR,ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,ctcplcFeFeVZR,MFe,               & 
& MFe2,MVP,MVP2,MVZ,MVZ2,ZfEL,ZfER,ZfVPVZ,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFe2(3),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3)

Complex(dp), Intent(in) :: ctcplcFeFeVPL(3,3),ctcplcFeFeVPR(3,3),ctcplcFeFeVZL(3,3),ctcplcFeFeVZR(3,3)

Complex(dp), Intent(in) :: ZfEL(3,3),ZfER(3,3),ZfVPVZ,ZfVZ

Complex(dp), Intent(out) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFeFeVZL(gt1,gt2) 
ZcoupT1R = ctcplcFeFeVZR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfEL(i1,gt1))*cplcFeFeVZL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfER(i1,gt1)*cplcFeFeVZR(i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfEL(i1,gt2)*cplcFeFeVZL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfER(i1,gt2))*cplcFeFeVZR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVPVZ*cplcFeFeVPL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVPVZ*cplcFeFeVPR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZ*cplcFeFeVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZ*cplcFeFeVZR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_FeToFeVZ


Subroutine Amplitude_VERTEX_THDMIIIHB_FeToFeVZ(MAh,MFe,Mhh,MHm,Msigma1,               & 
& MVP,MVWm,MVZ,MAh2,MFe2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,     & 
& cplAhhhVZ,cplcFeFehhL,cplcFeFehhR,cplcFeFesigma1L,cplcFeFesigma1R,cplcFeFeVPL,         & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFvFecHmL,cplcFvFecHmR,cplcFvFecVWmL,           & 
& cplcFvFecVWmR,cplcFeFvHmL,cplcFeFvHmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,           & 
& cplcFvFvVZR,cplhhsigma1VZ,cplhhVZVZ,cplHmcHmVZ,cplHmcVWmVZ,cplcHmVWmVZ,cplcVWmVWmVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFe(3),Mhh(2),MHm(2),Msigma1,MVP,MVWm,MVZ,MAh2,MFe2(3),Mhh2(2),MHm2(2),           & 
& Msigma12,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplAhhhVZ(2),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2), & 
& cplcFeFesigma1L(3,3),cplcFeFesigma1R(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),           & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFvFecHmL(3,3,2),cplcFvFecHmR(3,3,2),             & 
& cplcFvFecVWmL(3,3),cplcFvFecVWmR(3,3),cplcFeFvHmL(3,3,2),cplcFeFvHmR(3,3,2),           & 
& cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplhhsigma1VZ(2),& 
& cplhhVZVZ(2),cplHmcHmVZ(2,2),cplHmcVWmVZ(2),cplcHmVWmVZ(2),cplcVWmVWmVZ

Complex(dp), Intent(out) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVZ 


! {Ah, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeAhL(gt1,i2)
coup1R = cplcFeFeAhR(gt1,i2)
coup2L = cplcFeFeAhL(i3,gt2)
coup2R = cplcFeFeAhR(i3,gt2)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fe, hh, Ah}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2)
coup2R = cplcFeFeAhR(i1,gt2)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, Ah, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1L = cplcFeFeAhL(gt1,i1)
coup1R = cplcFeFeAhR(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, sigma1, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = Msigma1 
ML3 = Mhh(i3) 
coup1L = cplcFeFesigma1L(gt1,i1)
coup1R = cplcFeFesigma1R(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhsigma1VZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, VZ, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = cplcFeFeVZL(gt1,i1)
coup1R = cplcFeFeVZR(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, hh, sigma1}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = Msigma1 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFesigma1L(i1,gt2)
coup2R = cplcFeFesigma1R(i1,gt2)
coup3 = -cplhhsigma1VZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, hh, VZ}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeVZL(i1,gt2)
coup2R = cplcFeFeVZR(i1,gt2)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fv, conj[Hm], conj[Hm]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = 0. 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplcFeFvHmL(gt1,i1,i2)
coup1R = cplcFeFvHmR(gt1,i1,i2)
coup2L = cplcFvFecHmL(i1,gt2,i3)
coup2R = cplcFvFecHmR(i1,gt2,i3)
coup3 = cplHmcHmVZ(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fv, conj[VWm], conj[Hm]}
Do i1=1,3
    Do i3=1,2
ML1 = 0. 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1L = cplcFeFvVWmL(gt1,i1)
coup1R = cplcFeFvVWmR(gt1,i1)
coup2L = cplcFvFecHmL(i1,gt2,i3)
coup2R = cplcFvFecHmR(i1,gt2,i3)
coup3 = cplHmcVWmVZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fv, conj[Hm], conj[VWm]}
Do i1=1,3
  Do i2=1,2
ML1 = 0. 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1L = cplcFeFvHmL(gt1,i1,i2)
coup1R = cplcFeFvHmR(gt1,i1,i2)
coup2L = cplcFvFecVWmL(i1,gt2)
coup2R = cplcFvFecVWmR(i1,gt2)
coup3 = cplcHmVWmVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fv, conj[VWm], conj[VWm]}
Do i1=1,3
ML1 = 0. 
ML2 = MVWm 
ML3 = MVWm 
coup1L = cplcFeFvVWmL(gt1,i1)
coup1R = cplcFeFvVWmR(gt1,i1)
coup2L = cplcFvFecVWmL(i1,gt2)
coup2R = cplcFvFecVWmR(i1,gt2)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, bar[Fe], bar[Fe]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(gt1,i2,i1)
coup1R = cplcFeFehhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hm, bar[Fv], bar[Fv]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = 0. 
ML3 = 0. 
coup1L = cplcFeFvHmL(gt1,i2,i1)
coup1R = cplcFeFvHmR(gt1,i2,i1)
coup2L = cplcFvFecHmL(i3,gt2,i1)
coup2R = cplcFvFecHmR(i3,gt2,i1)
coup3L = cplcFvFvVZL(i2,i3)
coup3R = cplcFvFvVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {sigma1, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = Msigma1 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFesigma1L(gt1,i2)
coup1R = cplcFeFesigma1R(gt1,i2)
coup2L = cplcFeFesigma1L(i3,gt2)
coup2R = cplcFeFesigma1R(i3,gt2)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VP, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeVPL(gt1,i2)
coup1R = cplcFeFeVPR(gt1,i2)
coup2L = cplcFeFeVPL(i3,gt2)
coup2R = cplcFeFeVPR(i3,gt2)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, bar[Fv], bar[Fv]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWm 
ML2 = 0. 
ML3 = 0. 
coup1L = cplcFeFvVWmL(gt1,i2)
coup1R = cplcFeFvVWmR(gt1,i2)
coup2L = cplcFvFecVWmL(i3,gt2)
coup2R = cplcFvFecVWmR(i3,gt2)
coup3L = cplcFvFvVZL(i2,i3)
coup3R = cplcFvFvVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeVZL(gt1,i2)
coup1R = cplcFeFeVZR(gt1,i2)
coup2L = cplcFeFeVZL(i3,gt2)
coup2R = cplcFeFeVZR(i3,gt2)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_THDMIIIHB_FeToFeVZ


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_FeToFeVZ(MAh,MFe,Mhh,MHm,Msigma1,            & 
& MVP,MVWm,MVZ,MAh2,MFe2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,     & 
& cplAhhhVZ,cplcFeFehhL,cplcFeFehhR,cplcFeFesigma1L,cplcFeFesigma1R,cplcFeFeVPL,         & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFvFecHmL,cplcFvFecHmR,cplcFvFecVWmL,           & 
& cplcFvFecVWmR,cplcFeFvHmL,cplcFeFvHmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,           & 
& cplcFvFvVZR,cplhhsigma1VZ,cplhhVZVZ,cplHmcHmVZ,cplHmcVWmVZ,cplcHmVWmVZ,cplcVWmVWmVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFe(3),Mhh(2),MHm(2),Msigma1,MVP,MVWm,MVZ,MAh2,MFe2(3),Mhh2(2),MHm2(2),           & 
& Msigma12,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplAhhhVZ(2),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2), & 
& cplcFeFesigma1L(3,3),cplcFeFesigma1R(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),           & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFvFecHmL(3,3,2),cplcFvFecHmR(3,3,2),             & 
& cplcFvFecVWmL(3,3),cplcFvFecVWmR(3,3),cplcFeFvHmL(3,3,2),cplcFeFvHmR(3,3,2),           & 
& cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplhhsigma1VZ(2),& 
& cplhhVZVZ(2),cplHmcHmVZ(2,2),cplHmcVWmVZ(2),cplcHmVWmVZ(2),cplcVWmVWmVZ

Complex(dp), Intent(out) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVZ 


! {VP, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeVPL(gt1,i2)
coup1R = cplcFeFeVPR(gt1,i2)
coup2L = cplcFeFeVPL(i3,gt2)
coup2R = cplcFeFeVPR(i3,gt2)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_FeToFeVZ


Subroutine Amplitude_Tree_THDMIIIHB_FeToFvHm(cplcFeFvHmL,cplcFeFvHmR,MFe,             & 
& MHm,MFe2,MHm2,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MHm(2),MFe2(3),MHm2(2)

Complex(dp), Intent(in) :: cplcFeFvHmL(3,3,2),cplcFeFvHmR(3,3,2)

Complex(dp) :: Amp(2,3,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,2
! External masses 
Mex1 = MFe(gt1) 
Mex2 = 0. 
Mex3 = MHm(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFeFvHmL(gt1,gt2,gt3)
coupT1R = cplcFeFvHmR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_THDMIIIHB_FeToFvHm


Subroutine Gamma_Real_THDMIIIHB_FeToFvHm(MLambda,em,gs,cplcFeFvHmL,cplcFeFvHmR,       & 
& MFe,MHm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFeFvHmL(3,3,2),cplcFeFvHmR(3,3,2)

Real(dp), Intent(in) :: MFe(3),MHm(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3,2), GammarealGluon(3,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,3
  Do i2=1,3
    Do i3=2,2
CoupL = cplcFeFvHmL(i1,i2,i3)
CoupR = cplcFeFvHmR(i1,i2,i3)
Mex1 = MFe(i1)
Mex2 = 0.
Mex3 = MHm(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp,0._dp,1._dp,0._dp,0._dp,1._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_THDMIIIHB_FeToFvHm


Subroutine Amplitude_WAVE_THDMIIIHB_FeToFvHm(cplcFeFvHmL,cplcFeFvHmR,ctcplcFeFvHmL,   & 
& ctcplcFeFvHmR,MFe,MFe2,MHm,MHm2,ZfEL,ZfER,ZfHm,ZfvL,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFe2(3),MHm(2),MHm2(2)

Complex(dp), Intent(in) :: cplcFeFvHmL(3,3,2),cplcFeFvHmR(3,3,2)

Complex(dp), Intent(in) :: ctcplcFeFvHmL(3,3,2),ctcplcFeFvHmR(3,3,2)

Complex(dp), Intent(in) :: ZfEL(3,3),ZfER(3,3),ZfHm(2,2),ZfvL(3,3)

Complex(dp), Intent(out) :: Amp(2,3,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,2
! External masses 
Mex1 = MFe(gt1) 
Mex2 = 0. 
Mex3 = MHm(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFeFvHmL(gt1,gt2,gt3) 
ZcoupT1R = ctcplcFeFvHmR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfER(i1,gt1)*cplcFeFvHmL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfEL(i1,gt1))*cplcFeFvHmR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfvL(i1,gt2)*cplcFeFvHmL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*0*cplcFeFvHmR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfHm(i1,gt3)*cplcFeFvHmL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfHm(i1,gt3)*cplcFeFvHmR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_FeToFvHm


Subroutine Amplitude_VERTEX_THDMIIIHB_FeToFvHm(MAh,MFe,Mhh,MHm,Msigma1,               & 
& MVP,MVWm,MVZ,MAh2,MFe2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,     & 
& cplAhHmcHm,cplAhHmcVWm,cplcFeFehhL,cplcFeFehhR,cplcFeFesigma1L,cplcFeFesigma1R,        & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHmL,cplcFeFvHmR,               & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,cplhhHmcHm,cplhhHmcVWm,              & 
& cplHmsigma1cHm,cplHmsigma1cVWm,cplHmcHmVP,cplHmcVWmVP,cplHmcHmVZ,cplHmcVWmVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFe(3),Mhh(2),MHm(2),Msigma1,MVP,MVWm,MVZ,MAh2,MFe2(3),Mhh2(2),MHm2(2),           & 
& Msigma12,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplAhHmcHm(2,2),cplAhHmcVWm(2),cplcFeFehhL(3,3,2),  & 
& cplcFeFehhR(3,3,2),cplcFeFesigma1L(3,3),cplcFeFesigma1R(3,3),cplcFeFeVPL(3,3),         & 
& cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvHmL(3,3,2),cplcFeFvHmR(3,3,2),& 
& cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplhhHmcHm(2,2,2),& 
& cplhhHmcVWm(2,2),cplHmsigma1cHm(2,2),cplHmsigma1cVWm(2),cplHmcHmVP(2,2),               & 
& cplHmcVWmVP(2),cplHmcHmVZ(2,2),cplHmcVWmVZ(2)

Complex(dp), Intent(out) :: Amp(2,3,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,2
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = 0. 
Mex3 = MHm(gt3) 


! {Fe, Ah, Hm}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MAh 
ML3 = MHm(i3) 
coup1L = cplcFeFeAhL(gt1,i1)
coup1R = cplcFeFeAhR(gt1,i1)
coup2L = cplcFeFvHmL(i1,gt2,i3)
coup2R = cplcFeFvHmR(i1,gt2,i3)
coup3 = cplAhHmcHm(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, hh, Hm}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFvHmL(i1,gt2,i3)
coup2R = cplcFeFvHmR(i1,gt2,i3)
coup3 = cplhhHmcHm(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, sigma1, Hm}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = Msigma1 
ML3 = MHm(i3) 
coup1L = cplcFeFesigma1L(gt1,i1)
coup1R = cplcFeFesigma1R(gt1,i1)
coup2L = cplcFeFvHmL(i1,gt2,i3)
coup2R = cplcFeFvHmR(i1,gt2,i3)
coup3 = cplHmsigma1cHm(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, VP, Hm}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MHm(i3) 
coup1L = -cplcFeFeVPR(gt1,i1)
coup1R = -cplcFeFeVPL(gt1,i1)
coup2L = cplcFeFvHmL(i1,gt2,i3)
coup2R = cplcFeFvHmR(i1,gt2,i3)
coup3 = -cplHmcHmVP(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, VZ, Hm}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1L = -cplcFeFeVZR(gt1,i1)
coup1R = -cplcFeFeVZL(gt1,i1)
coup2L = cplcFeFvHmL(i1,gt2,i3)
coup2R = cplcFeFvHmR(i1,gt2,i3)
coup3 = -cplHmcHmVZ(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, Ah, VWm}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MAh 
ML3 = MVWm 
coup1L = cplcFeFeAhL(gt1,i1)
coup1R = cplcFeFeAhR(gt1,i1)
coup2L = -cplcFeFvVWmR(i1,gt2)
coup2R = -cplcFeFvVWmL(i1,gt2)
coup3 = cplAhHmcVWm(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, hh, VWm}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = -cplcFeFvVWmR(i1,gt2)
coup2R = -cplcFeFvVWmL(i1,gt2)
coup3 = cplhhHmcVWm(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, sigma1, VWm}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = Msigma1 
ML3 = MVWm 
coup1L = cplcFeFesigma1L(gt1,i1)
coup1R = cplcFeFesigma1R(gt1,i1)
coup2L = -cplcFeFvVWmR(i1,gt2)
coup2R = -cplcFeFvVWmL(i1,gt2)
coup3 = -cplHmsigma1cVWm(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, VP, VWm}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1L = -cplcFeFeVPR(gt1,i1)
coup1R = -cplcFeFeVPL(gt1,i1)
coup2L = -cplcFeFvVWmR(i1,gt2)
coup2R = -cplcFeFvVWmL(i1,gt2)
coup3 = cplHmcVWmVP(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, VZ, VWm}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1L = -cplcFeFeVZR(gt1,i1)
coup1R = -cplcFeFeVZL(gt1,i1)
coup2L = -cplcFeFvVWmR(i1,gt2)
coup2R = -cplcFeFvVWmL(i1,gt2)
coup3 = cplHmcVWmVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fv, conj[Hm], VZ}
Do i1=1,3
  Do i2=1,2
ML1 = 0. 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1L = cplcFeFvHmL(gt1,i1,i2)
coup1R = cplcFeFvHmR(gt1,i1,i2)
coup2L = -cplcFvFvVZR(i1,gt2)
coup2R = -cplcFvFvVZL(i1,gt2)
coup3 = -cplHmcHmVZ(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fv, conj[VWm], VZ}
Do i1=1,3
ML1 = 0. 
ML2 = MVWm 
ML3 = MVZ 
coup1L = -cplcFeFvVWmR(gt1,i1)
coup1R = -cplcFeFvVWmL(gt1,i1)
coup2L = -cplcFvFvVZR(i1,gt2)
coup2R = -cplcFvFvVZL(i1,gt2)
coup3 = cplHmcVWmVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {VZ, bar[Fe], bar[Fv]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFe(i2) 
ML3 = 0. 
coup1L = -cplcFeFeVZR(gt1,i2)
coup1R = -cplcFeFeVZL(gt1,i2)
coup2L = -cplcFvFvVZR(i3,gt2)
coup2R = -cplcFvFvVZL(i3,gt2)
coup3L = cplcFeFvHmL(i2,i3,gt3)
coup3R = cplcFeFvHmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
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
End Subroutine Amplitude_VERTEX_THDMIIIHB_FeToFvHm


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_FeToFvHm(MAh,MFe,Mhh,MHm,Msigma1,            & 
& MVP,MVWm,MVZ,MAh2,MFe2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,     & 
& cplAhHmcHm,cplAhHmcVWm,cplcFeFehhL,cplcFeFehhR,cplcFeFesigma1L,cplcFeFesigma1R,        & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHmL,cplcFeFvHmR,               & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,cplhhHmcHm,cplhhHmcVWm,              & 
& cplHmsigma1cHm,cplHmsigma1cVWm,cplHmcHmVP,cplHmcVWmVP,cplHmcHmVZ,cplHmcVWmVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFe(3),Mhh(2),MHm(2),Msigma1,MVP,MVWm,MVZ,MAh2,MFe2(3),Mhh2(2),MHm2(2),           & 
& Msigma12,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplAhHmcHm(2,2),cplAhHmcVWm(2),cplcFeFehhL(3,3,2),  & 
& cplcFeFehhR(3,3,2),cplcFeFesigma1L(3,3),cplcFeFesigma1R(3,3),cplcFeFeVPL(3,3),         & 
& cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvHmL(3,3,2),cplcFeFvHmR(3,3,2),& 
& cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplhhHmcHm(2,2,2),& 
& cplhhHmcVWm(2,2),cplHmsigma1cHm(2,2),cplHmsigma1cVWm(2),cplHmcHmVP(2,2),               & 
& cplHmcVWmVP(2),cplHmcHmVZ(2,2),cplHmcVWmVZ(2)

Complex(dp), Intent(out) :: Amp(2,3,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,2
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = 0. 
Mex3 = MHm(gt3) 


! {Fe, VP, Hm}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MHm(i3) 
coup1L = -cplcFeFeVPR(gt1,i1)
coup1R = -cplcFeFeVPL(gt1,i1)
coup2L = cplcFeFvHmL(i1,gt2,i3)
coup2R = cplcFeFvHmR(i1,gt2,i3)
coup3 = -cplHmcHmVP(gt3,i3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, VP, VWm}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1L = -cplcFeFeVPR(gt1,i1)
coup1R = -cplcFeFeVPL(gt1,i1)
coup2L = -cplcFeFvVWmR(i1,gt2)
coup2R = -cplcFeFvVWmL(i1,gt2)
coup3 = cplHmcVWmVP(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_FeToFvHm


Subroutine Amplitude_Tree_THDMIIIHB_FeToFvVWm(cplcFeFvVWmL,cplcFeFvVWmR,              & 
& MFe,MVWm,MFe2,MVWm2,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MVWm,MFe2(3),MVWm2

Complex(dp), Intent(in) :: cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3)

Complex(dp) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFe(gt1) 
Mex2 = 0. 
Mex3 = MVWm 
! Tree-Level Vertex 
coupT1L = cplcFeFvVWmL(gt1,gt2)
coupT1R = cplcFeFvVWmR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_THDMIIIHB_FeToFvVWm


Subroutine Gamma_Real_THDMIIIHB_FeToFvVWm(MLambda,em,gs,cplcFeFvVWmL,cplcFeFvVWmR,    & 
& MFe,MVWm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3)

Real(dp), Intent(in) :: MFe(3),MVWm

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3), GammarealGluon(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,3
  Do i2=1,3
CoupL = cplcFeFvVWmL(i1,i2)
CoupR = cplcFeFvVWmR(i1,i2)
Mex1 = MFe(i1)
Mex2 = 0.
Mex3 = MVWm
If (Mex1.gt.(Mex2+Mex3)) Then 
  Call hardphotonFFW(Mex1,Mex2,Mex3,MLambda,-1._dp,0._dp,CoupL,CoupR,(0,1)*em,GammaRealPhoton(i1,i2),kont)
  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_THDMIIIHB_FeToFvVWm


Subroutine Amplitude_WAVE_THDMIIIHB_FeToFvVWm(cplcFeFvVWmL,cplcFeFvVWmR,              & 
& ctcplcFeFvVWmL,ctcplcFeFvVWmR,MFe,MFe2,MVWm,MVWm2,ZfEL,ZfER,ZfvL,ZfVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFe2(3),MVWm,MVWm2

Complex(dp), Intent(in) :: cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3)

Complex(dp), Intent(in) :: ctcplcFeFvVWmL(3,3),ctcplcFeFvVWmR(3,3)

Complex(dp), Intent(in) :: ZfEL(3,3),ZfER(3,3),ZfvL(3,3),ZfVWm

Complex(dp), Intent(out) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFe(gt1) 
Mex2 = 0. 
Mex3 = MVWm 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFeFvVWmL(gt1,gt2) 
ZcoupT1R = ctcplcFeFvVWmR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfEL(i1,gt1))*cplcFeFvVWmL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfER(i1,gt1)*cplcFeFvVWmR(i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfvL(i1,gt2)*cplcFeFvVWmL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*0*cplcFeFvVWmR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVWm*cplcFeFvVWmL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVWm*cplcFeFvVWmR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_FeToFvVWm


Subroutine Amplitude_VERTEX_THDMIIIHB_FeToFvVWm(MAh,MFe,Mhh,MHm,Msigma1,              & 
& MVP,MVWm,MVZ,MAh2,MFe2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,     & 
& cplAhcHmVWm,cplcFeFehhL,cplcFeFehhR,cplcFeFesigma1L,cplcFeFesigma1R,cplcFeFeVPL,       & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHmL,cplcFeFvHmR,cplcFeFvVWmL,              & 
& cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,cplhhcHmVWm,cplhhcVWmVWm,cplsigma1cHmVWm,         & 
& cplcHmVPVWm,cplcVWmVPVWm,cplcHmVWmVZ,cplcVWmVWmVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFe(3),Mhh(2),MHm(2),Msigma1,MVP,MVWm,MVZ,MAh2,MFe2(3),Mhh2(2),MHm2(2),           & 
& Msigma12,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplAhcHmVWm(2),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),& 
& cplcFeFesigma1L(3,3),cplcFeFesigma1R(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),           & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvHmL(3,3,2),cplcFeFvHmR(3,3,2),               & 
& cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplhhcHmVWm(2,2),& 
& cplhhcVWmVWm(2),cplsigma1cHmVWm(2),cplcHmVPVWm(2),cplcVWmVPVWm,cplcHmVWmVZ(2),         & 
& cplcVWmVWmVZ

Complex(dp), Intent(out) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = 0. 
Mex3 = MVWm 


! {Fe, Ah, Hm}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MAh 
ML3 = MHm(i3) 
coup1L = cplcFeFeAhL(gt1,i1)
coup1R = cplcFeFeAhR(gt1,i1)
coup2L = cplcFeFvHmL(i1,gt2,i3)
coup2R = cplcFeFvHmR(i1,gt2,i3)
coup3 = -cplAhcHmVWm(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, hh, Hm}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFvHmL(i1,gt2,i3)
coup2R = cplcFeFvHmR(i1,gt2,i3)
coup3 = -cplhhcHmVWm(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, sigma1, Hm}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = Msigma1 
ML3 = MHm(i3) 
coup1L = cplcFeFesigma1L(gt1,i1)
coup1R = cplcFeFesigma1R(gt1,i1)
coup2L = cplcFeFvHmL(i1,gt2,i3)
coup2R = cplcFeFvHmR(i1,gt2,i3)
coup3 = -cplsigma1cHmVWm(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, VP, Hm}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MHm(i3) 
coup1L = cplcFeFeVPL(gt1,i1)
coup1R = cplcFeFeVPR(gt1,i1)
coup2L = cplcFeFvHmL(i1,gt2,i3)
coup2R = cplcFeFvHmR(i1,gt2,i3)
coup3 = cplcHmVPVWm(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, VZ, Hm}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1L = cplcFeFeVZL(gt1,i1)
coup1R = cplcFeFeVZR(gt1,i1)
coup2L = cplcFeFvHmL(i1,gt2,i3)
coup2R = cplcFeFvHmR(i1,gt2,i3)
coup3 = cplcHmVWmVZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, hh, VWm}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFvVWmL(i1,gt2)
coup2R = cplcFeFvVWmR(i1,gt2)
coup3 = cplhhcVWmVWm(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, VP, VWm}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1L = cplcFeFeVPL(gt1,i1)
coup1R = cplcFeFeVPR(gt1,i1)
coup2L = cplcFeFvVWmL(i1,gt2)
coup2R = cplcFeFvVWmR(i1,gt2)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fe, VZ, VWm}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1L = cplcFeFeVZL(gt1,i1)
coup1R = cplcFeFeVZR(gt1,i1)
coup2L = cplcFeFvVWmL(i1,gt2)
coup2R = cplcFeFvVWmR(i1,gt2)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fv, conj[Hm], VZ}
Do i1=1,3
  Do i2=1,2
ML1 = 0. 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1L = cplcFeFvHmL(gt1,i1,i2)
coup1R = cplcFeFvHmR(gt1,i1,i2)
coup2L = cplcFvFvVZL(i1,gt2)
coup2R = cplcFvFvVZR(i1,gt2)
coup3 = cplcHmVWmVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fv, conj[VWm], VZ}
Do i1=1,3
ML1 = 0. 
ML2 = MVWm 
ML3 = MVZ 
coup1L = cplcFeFvVWmL(gt1,i1)
coup1R = cplcFeFvVWmR(gt1,i1)
coup2L = cplcFvFvVZL(i1,gt2)
coup2R = cplcFvFvVZR(i1,gt2)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VZ, bar[Fe], bar[Fv]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFe(i2) 
ML3 = 0. 
coup1L = cplcFeFeVZL(gt1,i2)
coup1R = cplcFeFeVZR(gt1,i2)
coup2L = cplcFvFvVZL(i3,gt2)
coup2R = cplcFvFvVZR(i3,gt2)
coup3L = cplcFeFvVWmL(i2,i3)
coup3R = cplcFeFvVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_THDMIIIHB_FeToFvVWm


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_FeToFvVWm(MAh,MFe,Mhh,MHm,Msigma1,           & 
& MVP,MVWm,MVZ,MAh2,MFe2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,     & 
& cplAhcHmVWm,cplcFeFehhL,cplcFeFehhR,cplcFeFesigma1L,cplcFeFesigma1R,cplcFeFeVPL,       & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHmL,cplcFeFvHmR,cplcFeFvVWmL,              & 
& cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,cplhhcHmVWm,cplhhcVWmVWm,cplsigma1cHmVWm,         & 
& cplcHmVPVWm,cplcVWmVPVWm,cplcHmVWmVZ,cplcVWmVWmVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFe(3),Mhh(2),MHm(2),Msigma1,MVP,MVWm,MVZ,MAh2,MFe2(3),Mhh2(2),MHm2(2),           & 
& Msigma12,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplAhcHmVWm(2),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),& 
& cplcFeFesigma1L(3,3),cplcFeFesigma1R(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),           & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvHmL(3,3,2),cplcFeFvHmR(3,3,2),               & 
& cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplhhcHmVWm(2,2),& 
& cplhhcVWmVWm(2),cplsigma1cHmVWm(2),cplcHmVPVWm(2),cplcVWmVPVWm,cplcHmVWmVZ(2),         & 
& cplcVWmVWmVZ

Complex(dp), Intent(out) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = 0. 
Mex3 = MVWm 


! {Fe, VP, Hm}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MHm(i3) 
coup1L = cplcFeFeVPL(gt1,i1)
coup1R = cplcFeFeVPR(gt1,i1)
coup2L = cplcFeFvHmL(i1,gt2,i3)
coup2R = cplcFeFvHmR(i1,gt2,i3)
coup3 = cplcHmVPVWm(i3)
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, VP, VWm}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1L = cplcFeFeVPL(gt1,i1)
coup1R = cplcFeFeVPR(gt1,i1)
coup2L = cplcFeFvVWmL(i1,gt2)
coup2R = cplcFeFvVWmR(i1,gt2)
coup3 = -cplcVWmVPVWm
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_FeToFvVWm


Subroutine Amplitude_WAVE_THDMIIIHB_FeToFeVP(cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,     & 
& cplcFeFeVZR,ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,ctcplcFeFeVZR,MFe,               & 
& MFe2,MVP,MVP2,ZfEL,ZfER,ZfVP,ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFe2(3),MVP,MVP2

Complex(dp), Intent(in) :: cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3)

Complex(dp), Intent(in) :: ctcplcFeFeVPL(3,3),ctcplcFeFeVPR(3,3),ctcplcFeFeVZL(3,3),ctcplcFeFeVZR(3,3)

Complex(dp), Intent(in) :: ZfEL(3,3),ZfER(3,3),ZfVP,ZfVZVP

Complex(dp), Intent(out) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVP 
ZcoupT1L = 0._dp 
ZcoupT1R = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfEL(i1,gt1))*cplcFeFeVPL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfER(i1,gt1)*cplcFeFeVPR(i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfEL(i1,gt2)*cplcFeFeVPL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfER(i1,gt2))*cplcFeFeVPR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZVP*cplcFeFeVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZVP*cplcFeFeVZR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_THDMIIIHB_FeToFeVP


Subroutine Amplitude_VERTEX_THDMIIIHB_FeToFeVP(MAh,MFe,Mhh,MHm,Msigma1,               & 
& MVP,MVWm,MVZ,MAh2,MFe2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFesigma1L,cplcFeFesigma1R,cplcFeFeVPL,cplcFeFeVPR,       & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFvFecHmL,cplcFvFecHmR,cplcFvFecVWmL,cplcFvFecVWmR,         & 
& cplcFeFvHmL,cplcFeFvHmR,cplcFeFvVWmL,cplcFeFvVWmR,cplHmcHmVP,cplHmcVWmVP,              & 
& cplcHmVPVWm,cplcVWmVPVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFe(3),Mhh(2),MHm(2),Msigma1,MVP,MVWm,MVZ,MAh2,MFe2(3),Mhh2(2),MHm2(2),           & 
& Msigma12,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),              & 
& cplcFeFesigma1L(3,3),cplcFeFesigma1R(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),           & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFvFecHmL(3,3,2),cplcFvFecHmR(3,3,2),             & 
& cplcFvFecVWmL(3,3),cplcFvFecVWmR(3,3),cplcFeFvHmL(3,3,2),cplcFeFvHmR(3,3,2),           & 
& cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplHmcHmVP(2,2),cplHmcVWmVP(2),cplcHmVPVWm(2),     & 
& cplcVWmVPVWm

Complex(dp), Intent(out) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVP 


! {Ah, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeAhL(gt1,i2)
coup1R = cplcFeFeAhR(gt1,i2)
coup2L = cplcFeFeAhL(i3,gt2)
coup2R = cplcFeFeAhR(i3,gt2)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fv, conj[Hm], conj[Hm]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = 0. 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplcFeFvHmL(gt1,i1,i2)
coup1R = cplcFeFvHmR(gt1,i1,i2)
coup2L = cplcFvFecHmL(i1,gt2,i3)
coup2R = cplcFvFecHmR(i1,gt2,i3)
coup3 = cplHmcHmVP(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fv, conj[VWm], conj[Hm]}
Do i1=1,3
    Do i3=1,2
ML1 = 0. 
ML2 = MVWm 
ML3 = MHm(i3) 
coup1L = cplcFeFvVWmL(gt1,i1)
coup1R = cplcFeFvVWmR(gt1,i1)
coup2L = cplcFvFecHmL(i1,gt2,i3)
coup2R = cplcFvFecHmR(i1,gt2,i3)
coup3 = cplHmcVWmVP(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fv, conj[Hm], conj[VWm]}
Do i1=1,3
  Do i2=1,2
ML1 = 0. 
ML2 = MHm(i2) 
ML3 = MVWm 
coup1L = cplcFeFvHmL(gt1,i1,i2)
coup1R = cplcFeFvHmR(gt1,i1,i2)
coup2L = cplcFvFecVWmL(i1,gt2)
coup2R = cplcFvFecVWmR(i1,gt2)
coup3 = cplcHmVPVWm(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fv, conj[VWm], conj[VWm]}
Do i1=1,3
ML1 = 0. 
ML2 = MVWm 
ML3 = MVWm 
coup1L = cplcFeFvVWmL(gt1,i1)
coup1R = cplcFeFvVWmR(gt1,i1)
coup2L = cplcFvFecVWmL(i1,gt2)
coup2R = cplcFvFecVWmR(i1,gt2)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, bar[Fe], bar[Fe]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(gt1,i2,i1)
coup1R = cplcFeFehhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {sigma1, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = Msigma1 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFesigma1L(gt1,i2)
coup1R = cplcFeFesigma1R(gt1,i2)
coup2L = cplcFeFesigma1L(i3,gt2)
coup2R = cplcFeFesigma1R(i3,gt2)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VP, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeVPL(gt1,i2)
coup1R = cplcFeFeVPR(gt1,i2)
coup2L = cplcFeFeVPL(i3,gt2)
coup2R = cplcFeFeVPR(i3,gt2)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeVZL(gt1,i2)
coup1R = cplcFeFeVZR(gt1,i2)
coup2L = cplcFeFeVZL(i3,gt2)
coup2R = cplcFeFeVZR(i3,gt2)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_THDMIIIHB_FeToFeVP


Subroutine Amplitude_IR_VERTEX_THDMIIIHB_FeToFeVP(MAh,MFe,Mhh,MHm,Msigma1,            & 
& MVP,MVWm,MVZ,MAh2,MFe2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFesigma1L,cplcFeFesigma1R,cplcFeFeVPL,cplcFeFeVPR,       & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFvFecHmL,cplcFvFecHmR,cplcFvFecVWmL,cplcFvFecVWmR,         & 
& cplcFeFvHmL,cplcFeFvHmR,cplcFeFvVWmL,cplcFeFvVWmR,cplHmcHmVP,cplHmcVWmVP,              & 
& cplcHmVPVWm,cplcVWmVPVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFe(3),Mhh(2),MHm(2),Msigma1,MVP,MVWm,MVZ,MAh2,MFe2(3),Mhh2(2),MHm2(2),           & 
& Msigma12,MVP2,MVWm2,MVZ2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),              & 
& cplcFeFesigma1L(3,3),cplcFeFesigma1R(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),           & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFvFecHmL(3,3,2),cplcFvFecHmR(3,3,2),             & 
& cplcFvFecVWmL(3,3),cplcFvFecVWmR(3,3),cplcFeFvHmL(3,3,2),cplcFeFvHmR(3,3,2),           & 
& cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplHmcHmVP(2,2),cplHmcVWmVP(2),cplcHmVPVWm(2),     & 
& cplcVWmVPVWm

Complex(dp), Intent(out) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVP 


! {VP, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeVPL(gt1,i2)
coup1R = cplcFeFeVPR(gt1,i2)
coup2L = cplcFeFeVPL(i3,gt2)
coup2R = cplcFeFeVPR(i3,gt2)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_THDMIIIHB_FeToFeVP



End Module OneLoopDecay_Fe_THDMIIIHB
