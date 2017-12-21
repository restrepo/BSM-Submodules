! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 0:32 on 21.12.2017   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecay_hh_SimplifiedDMSSSFDM
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

Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_hhToAhAh(cplAhAhhh,MAh,Mhh,              & 
& MAh2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,Mhh,MAh2,Mhh2

Complex(dp), Intent(in) :: cplAhAhhh

Complex(dp) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

! External masses 
Mex1 = Mhh 
Mex2 = MAh 
Mex3 = MAh 
! Tree-Level Vertex 
coupT1 = cplAhAhhh
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp = AmpC 
End Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_hhToAhAh


Subroutine Gamma_Real_SimplifiedDMSSSFDM_hhToAhAh(MLambda,em,gs,cplAhAhhh,            & 
& MAh,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhAhhh

Real(dp), Intent(in) :: MAh,Mhh

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton, GammarealGluon 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Coup = cplAhAhhh
Mex1 = Mhh
Mex2 = MAh
Mex3 = MAh
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton = 0._dp 
  GammarealGluon = 0._dp 
Else 
  GammarealGluon = 0._dp 
  GammarealPhoton = 0._dp 

End if 
End Subroutine Gamma_Real_SimplifiedDMSSSFDM_hhToAhAh


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhToAhAh(cplAhAhhh,ctcplAhAhhh,          & 
& MAh,MAh2,Mhh,Mhh2,ZfAh,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MAh2,Mhh,Mhh2

Complex(dp), Intent(in) :: cplAhAhhh

Complex(dp), Intent(in) :: ctcplAhAhhh

Complex(dp), Intent(in) :: ZfAh,Zfhh

Complex(dp), Intent(out) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = Mhh 
Mex2 = MAh 
Mex3 = MAh 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhAhhh 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh*cplAhAhhh


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh*cplAhAhhh


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh*cplAhAhhh


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp = AmpC 
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhToAhAh


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToAhAh(MAh,MFd,MFe,MFu,              & 
& Mhh,MHp,Mss,MVWp,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,Mss2,MVWp2,MVZ2,cplAhAhhh,          & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,               & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,              & 
& cplcgWCgWChh,cplhhhhhh,cplhhHpcHp,cplhhssss,cplhhcVWpVWp,cplhhVZVZ,cplAhAhAhAh1,       & 
& cplAhAhhhhh1,cplAhAhHpcHp1,cplAhAhssss1,cplAhAhcVWpVWp1,cplAhAhVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh,MHp,Mss,MVWp,MVZ,MAh2,MFd2(3),MFe2(3),MFu2(3),           & 
& Mhh2,MHp2,Mss2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),        & 
& cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVZ,cplAhHpcVWp,     & 
& cplAhcHpVWp,cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),       & 
& cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcgWpgWphh,cplcgWCgWChh,cplhhhhhh,cplhhHpcHp,      & 
& cplhhssss,cplhhcVWpVWp,cplhhVZVZ,cplAhAhAhAh1,cplAhAhhhhh1,cplAhAhHpcHp1,              & 
& cplAhAhssss1,cplAhAhcVWpVWp1,cplAhAhVZVZ1

Complex(dp), Intent(out) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp = 0._dp 
! External masses 
Mex1 = Mhh 
Mex2 = MAh 
Mex3 = MAh 


! {Ah, Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh 
coup1 = cplAhAhhh
coup2 = cplAhAhhh
coup3 = cplAhAhhh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {Ah, VZ, hh}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
ML1 = MAh 
ML2 = MVZ 
ML3 = Mhh 
coup1 = cplAhhhVZ
coup2 = cplAhAhhh
coup3 = cplAhhhVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1)
coup1R = cplcFdFdhhR(i2,i1)
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
Amp = Amp + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1)
coup1R = cplcFeFehhR(i2,i1)
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
Amp = Amp + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1)
coup1R = cplcFuFuhhR(i2,i1)
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
Amp = Amp + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWp, gWp, gWp}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh
coup2 = cplcgWpgWpAh
coup3 = cplcgWpgWpAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(2)*AmpC 
End if 


! {gWpC, gWpC, gWpC}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh
coup2 = cplcgWCgWCAh
coup3 = cplcgWCgWCAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(2)*AmpC 
End if 


! {hh, hh, Ah}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
ML1 = Mhh 
ML2 = Mhh 
ML3 = MAh 
coup1 = cplhhhhhh
coup2 = cplAhAhhh
coup3 = cplAhAhhh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {hh, hh, VZ}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
ML1 = Mhh 
ML2 = Mhh 
ML3 = MVZ 
coup1 = cplhhhhhh
coup2 = -cplAhhhVZ
coup3 = cplAhhhVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {Hp, Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp
coup2 = -cplAhcHpVWp
coup3 = cplAhHpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp
coup2 = -cplAhHpcVWp
coup3 = cplAhcHpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {VZ, Ah, hh}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
ML1 = MVZ 
ML2 = MAh 
ML3 = Mhh 
coup1 = cplAhhhVZ
coup2 = -cplAhhhVZ
coup3 = cplAhAhhh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = Mhh 
coup1 = cplhhVZVZ
coup2 = -cplAhhhVZ
coup3 = cplAhhhVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp
coup2 = -cplAhHpcVWp
coup3 = cplAhcHpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp
coup2 = -cplAhcHpVWp
coup3 = cplAhHpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
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
coup1 = cplAhAhhh
coup2 = cplAhAhAhAh1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
ML1 = Mhh 
ML2 = Mhh 
coup1 = cplhhhhhh
coup2 = cplAhAhhhhh1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
coup1 = cplhhHpcHp
coup2 = cplAhAhHpcHp1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {ss, ss}
If ((Include_in_loopss).and.(Include_in_loopss)) Then 
ML1 = Mss 
ML2 = Mss 
coup1 = cplhhssss
coup2 = cplAhAhssss1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhcVWpVWp
coup2 = cplAhAhcVWpVWp1
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhVZVZ
coup2 = cplAhAhVZVZ1
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loophh)) Then 
ML1 = MAh 
ML2 = Mhh 
coup1 = cplAhAhhhhh1
coup2 = cplAhAhhh
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

End if 


! {Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loophh)) Then 
ML1 = MAh 
ML2 = Mhh 
coup1 = cplAhAhhhhh1
coup2 = cplAhAhhh
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

End if 
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToAhAh


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhToAhAh(MAh,MFd,MFe,               & 
& MFu,Mhh,MHp,Mss,MVWp,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,Mss2,MVWp2,MVZ2,cplAhAhhh,      & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,               & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,              & 
& cplcgWCgWChh,cplhhhhhh,cplhhHpcHp,cplhhssss,cplhhcVWpVWp,cplhhVZVZ,cplAhAhAhAh1,       & 
& cplAhAhhhhh1,cplAhAhHpcHp1,cplAhAhssss1,cplAhAhcVWpVWp1,cplAhAhVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh,MHp,Mss,MVWp,MVZ,MAh2,MFd2(3),MFe2(3),MFu2(3),           & 
& Mhh2,MHp2,Mss2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),        & 
& cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVZ,cplAhHpcVWp,     & 
& cplAhcHpVWp,cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),       & 
& cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcgWpgWphh,cplcgWCgWChh,cplhhhhhh,cplhhHpcHp,      & 
& cplhhssss,cplhhcVWpVWp,cplhhVZVZ,cplAhAhAhAh1,cplAhAhhhhh1,cplAhAhHpcHp1,              & 
& cplAhAhssss1,cplAhAhcVWpVWp1,cplAhAhVZVZ1

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
Mex1 = Mhh 
Mex2 = MAh 
Mex3 = MAh 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhToAhAh


Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_hhToAhVZ(cplAhhhVZ,MAh,Mhh,              & 
& MVZ,MAh2,Mhh2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,Mhh,MVZ,MAh2,Mhh2,MVZ2

Complex(dp), Intent(in) :: cplAhhhVZ

Complex(dp) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

! External masses 
Mex1 = Mhh 
Mex2 = MAh 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1 = -cplAhhhVZ
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:) = AmpC 
End Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_hhToAhVZ


Subroutine Gamma_Real_SimplifiedDMSSSFDM_hhToAhVZ(MLambda,em,gs,cplAhhhVZ,            & 
& MAh,Mhh,MVZ,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhhhVZ

Real(dp), Intent(in) :: MAh,Mhh,MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton, GammarealGluon 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Coup = cplAhhhVZ
Mex1 = Mhh
Mex2 = MAh
Mex3 = MVZ
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton = 0._dp 
 GammarealGluon = 0._dp 
Else 
  GammarealGluon = 0._dp 
  GammarealPhoton = 0._dp 

End if 
End Subroutine Gamma_Real_SimplifiedDMSSSFDM_hhToAhVZ


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhToAhVZ(cplAhhhVZ,ctcplAhhhVZ,          & 
& MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,ZfAh,Zfhh,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhhhVZ

Complex(dp), Intent(in) :: ctcplAhhhVZ

Complex(dp), Intent(in) :: ZfAh,Zfhh,ZfVZ

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = Mhh 
Mex2 = MAh 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhhhVZ 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh*cplAhhhVZ


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh*cplAhhhVZ


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cplAhhhVZ


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:) = AmpC 
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhToAhVZ


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToAhVZ(MAh,MFd,MFe,MFu,              & 
& Mhh,MHp,MVWp,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,MVWp2,MVZ2,cplAhAhhh,cplcFdFdAhL,       & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,              & 
& cplcgWCgWCAh,cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,    & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,            & 
& cplcgWCgWCVZ,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ1,cplAhHpcVWpVZ1,           & 
& cplAhcHpVWpVZ1,cplhhhhVZVZ1,cplhhHpcVWpVZ1,cplhhcHpVWpVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh,MHp,MVWp,MVZ,MAh2,MFd2(3),MFe2(3),MFu2(3),               & 
& Mhh2,MHp2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),        & 
& cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVZ,cplAhHpcVWp,     & 
& cplAhcHpVWp,cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),       & 
& cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuhhL(3,3),  & 
& cplcFuFuhhR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWpgWphh,cplcgWpgWpVZ,          & 
& cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,   & 
& cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ1,cplAhHpcVWpVZ1, & 
& cplAhcHpVWpVZ1,cplhhhhVZVZ1,cplhhHpcVWpVZ1,cplhhcHpVWpVZ1

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
! External masses 
Mex1 = Mhh 
Mex2 = MAh 
Mex3 = MVZ 


! {Ah, Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh 
coup1 = cplAhAhhh
coup2 = cplAhAhhh
coup3 = -cplAhhhVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Ah, VZ, hh}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
ML1 = MAh 
ML2 = MVZ 
ML3 = Mhh 
coup1 = cplAhhhVZ
coup2 = cplAhAhhh
coup3 = cplhhVZVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1)
coup1R = cplcFdFdhhR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1)
coup1R = cplcFeFehhR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1)
coup1R = cplcFuFuhhR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWp, gWp, gWp}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh
coup2 = cplcgWpgWpAh
coup3 = cplcgWpgWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
End if 


! {gWpC, gWpC, gWpC}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh
coup2 = cplcgWCgWCAh
coup3 = cplcgWCgWCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
End if 


! {hh, hh, Ah}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
ML1 = Mhh 
ML2 = Mhh 
ML3 = MAh 
coup1 = cplhhhhhh
coup2 = cplAhAhhh
coup3 = cplAhhhVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {hh, hh, VZ}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
ML1 = Mhh 
ML2 = Mhh 
ML3 = MVZ 
coup1 = cplhhhhhh
coup2 = cplAhhhVZ
coup3 = cplhhVZVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp
coup2 = cplAhcHpVWp
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhHpcVWp
coup2 = cplAhcHpVWp
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = -cplhhcHpVWp
coup2 = cplAhHpcVWp
coup3 = -cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp
coup2 = cplAhHpcVWp
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VZ, Ah, hh}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
ML1 = MVZ 
ML2 = MAh 
ML3 = Mhh 
coup1 = cplAhhhVZ
coup2 = cplAhhhVZ
coup3 = -cplAhhhVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = Mhh 
coup1 = cplhhVZVZ
coup2 = cplAhhhVZ
coup3 = cplhhVZVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp
coup2 = cplAhHpcVWp
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhcHpVWp
coup2 = cplAhHpcVWp
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = -cplhhHpcVWp
coup2 = cplAhcHpVWp
coup3 = cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp
coup2 = cplAhcHpVWp
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Ah, VZ}
If ((Include_in_loopAh).and.(Include_in_loopVZ)) Then 
ML1 = MAh 
ML2 = MVZ 
coup1 = -cplAhhhVZ
coup2 = cplAhAhVZVZ1
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWp
coup2 = cplAhcHpVWpVZ1
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVWp
coup2 = cplAhHpcVWpVZ1
Call Amp_VERTEX_StoSV_Topology2_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {hh, VZ}
If ((Include_in_loophh).and.(Include_in_loopVZ)) Then 
ML1 = Mhh 
ML2 = MVZ 
coup1 = cplhhhhVZVZ1
coup2 = cplAhhhVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVZ1
coup2 = cplAhcHpVWp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVWpVZ1
coup2 = cplAhHpcVWp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToAhVZ


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhToAhVZ(MAh,MFd,MFe,               & 
& MFu,Mhh,MHp,MVWp,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,MVWp2,MVZ2,cplAhAhhh,               & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,               & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWphh,              & 
& cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,               & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,    & 
& cplAhAhVZVZ1,cplAhHpcVWpVZ1,cplAhcHpVWpVZ1,cplhhhhVZVZ1,cplhhHpcVWpVZ1,cplhhcHpVWpVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh,MHp,MVWp,MVZ,MAh2,MFd2(3),MFe2(3),MFu2(3),               & 
& Mhh2,MHp2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),        & 
& cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVZ,cplAhHpcVWp,     & 
& cplAhcHpVWp,cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),       & 
& cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuhhL(3,3),  & 
& cplcFuFuhhR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWpgWphh,cplcgWpgWpVZ,          & 
& cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,   & 
& cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ1,cplAhHpcVWpVZ1, & 
& cplAhcHpVWpVZ1,cplhhhhVZVZ1,cplhhHpcVWpVZ1,cplhhcHpVWpVZ1

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
Mex1 = Mhh 
Mex2 = MAh 
Mex3 = MVZ 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhToAhVZ


Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_hhTocFdFd(cplcFdFdhhL,cplcFdFdhhR,       & 
& MFd,Mhh,MFd2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),Mhh,MFd2(3),Mhh2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3),cplcFdFdhhR(3,3)

Complex(dp) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh 
Mex2 = MFd(gt2) 
Mex3 = MFd(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFdFdhhL(gt2,gt3)
coupT1R = cplcFdFdhhR(gt2,gt3)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt2, gt3) = AmpC 
    End Do
  End Do
End Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_hhTocFdFd


Subroutine Gamma_Real_SimplifiedDMSSSFDM_hhTocFdFd(MLambda,em,gs,cplcFdFdhhL,         & 
& cplcFdFdhhR,MFd,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3),cplcFdFdhhR(3,3)

Real(dp), Intent(in) :: MFd(3),Mhh

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3), GammarealGluon(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
  Do i2=1,3
    Do i3=1,3
CoupL = cplcFdFdhhL(i2,i3)
CoupR = cplcFdFdhhR(i2,i3)
Mex1 = Mhh
Mex2 = MFd(i2)
Mex3 = MFd(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp/3._dp,-1._dp/3._dp,1._dp/3._dp,CoupL,CoupR,Gammarealphoton(i2,i3),kont)
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,gs,0._dp,0._dp,0._dp,4._dp,-4._dp,4._dp,CoupL,CoupR,Gammarealgluon(i2,i3),kont)
Else 
  GammarealGluon(i2,i3) = 0._dp 
  GammarealPhoton(i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Subroutine Gamma_Real_SimplifiedDMSSSFDM_hhTocFdFd


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhTocFdFd(cplcFdFdhhL,cplcFdFdhhR,       & 
& ctcplcFdFdhhL,ctcplcFdFdhhR,MFd,MFd2,Mhh,Mhh2,ZfDL,ZfDR,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFd2(3),Mhh,Mhh2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3),cplcFdFdhhR(3,3)

Complex(dp), Intent(in) :: ctcplcFdFdhhL(3,3),ctcplcFdFdhhR(3,3)

Complex(dp), Intent(in) :: ZfDL(3,3),ZfDR(3,3),Zfhh

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh 
Mex2 = MFd(gt2) 
Mex3 = MFd(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFdFdhhL(gt2,gt3) 
ZcoupT1R = ctcplcFdFdhhR(gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh*cplcFdFdhhL(gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh*cplcFdFdhhR(gt2,gt3)


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDR(i1,gt2)*cplcFdFdhhL(i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDL(i1,gt2))*cplcFdFdhhR(i1,gt3)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDL(i1,gt3)*cplcFdFdhhL(gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDR(i1,gt3))*cplcFdFdhhR(gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt2, gt3) = AmpC 
    End Do
  End Do
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhTocFdFd


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTocFdFd(MAh,MFd,MFu,Mhh,             & 
& MHp,MVG,MVP,MVWp,MVZ,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,          & 
& cplcFdFdAhL,cplcFdFdAhR,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,     & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,              & 
& cplhhcVWpVWp,cplhhVZVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFu(3),Mhh,MHp,MVG,MVP,MVWp,MVZ,MAh2,MFd2(3),MFu2(3),Mhh2,MHp2,            & 
& MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplAhhhVZ,cplcFdFdhhL(3,3),               & 
& cplcFdFdhhR(3,3),cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),  & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFdFdVZL(3,3),& 
& cplcFdFdVZR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),& 
& cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,    & 
& cplhhcVWpVWp,cplhhVZVZ

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh 
Mex2 = MFd(gt2) 
Mex3 = MFd(gt3) 


! {Ah, Ah, Fd}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopFd)) Then 
    Do i3=1,3
ML1 = MAh 
ML2 = MAh 
ML3 = MFd(i3) 
coup1 = cplAhAhhh
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {Ah, VZ, Fd}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopFd)) Then 
    Do i3=1,3
ML1 = MAh 
ML2 = MVZ 
ML3 = MFd(i3) 
coup1 = -cplAhhhVZ
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {hh, hh, Fd}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopFd)) Then 
    Do i3=1,3
ML1 = Mhh 
ML2 = Mhh 
ML3 = MFd(i3) 
coup1 = cplhhhhhh
coup2L = cplcFdFdhhL(gt2,i3)
coup2R = cplcFdFdhhR(gt2,i3)
coup3L = cplcFdFdhhL(i3,gt3)
coup3R = cplcFdFdhhR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {Hp, Hp, Fu}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopFu)) Then 
    Do i3=1,3
ML1 = MHp 
ML2 = MHp 
ML3 = MFu(i3) 
coup1 = cplhhHpcHp
coup2L = cplcFdFucHpL(gt2,i3)
coup2R = cplcFdFucHpR(gt2,i3)
coup3L = cplcFuFdHpL(i3,gt3)
coup3R = cplcFuFdHpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {Hp, VWp, Fu}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopFu)) Then 
    Do i3=1,3
ML1 = MHp 
ML2 = MVWp 
ML3 = MFu(i3) 
coup1 = cplhhHpcVWp
coup2L = cplcFdFucHpL(gt2,i3)
coup2R = cplcFdFucHpR(gt2,i3)
coup3L = cplcFuFdVWpL(i3,gt3)
coup3R = cplcFuFdVWpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWp, Hp, Fu}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopFu)) Then 
    Do i3=1,3
ML1 = MVWp 
ML2 = MHp 
ML3 = MFu(i3) 
coup1 = cplhhcHpVWp
coup2L = cplcFdFucVWpL(gt2,i3)
coup2R = cplcFdFucVWpR(gt2,i3)
coup3L = cplcFuFdHpL(i3,gt3)
coup3R = cplcFuFdHpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWp, VWp, Fu}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopFu)) Then 
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MFu(i3) 
coup1 = cplhhcVWpVWp
coup2L = cplcFdFucVWpL(gt2,i3)
coup2R = cplcFdFucVWpR(gt2,i3)
coup3L = cplcFuFdVWpL(i3,gt3)
coup3R = cplcFuFdVWpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, Ah, Fd}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopFd)) Then 
    Do i3=1,3
ML1 = MVZ 
ML2 = MAh 
ML3 = MFd(i3) 
coup1 = -cplAhhhVZ
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZ, Fd}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopFd)) Then 
    Do i3=1,3
ML1 = MVZ 
ML2 = MVZ 
ML3 = MFd(i3) 
coup1 = cplhhVZVZ
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {bar[Fd], bar[Fd], Ah}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MAh 
coup1L = cplcFdFdhhL(i1,i2)
coup1R = cplcFdFdhhR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fd], bar[Fd], hh}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = Mhh 
coup1L = cplcFdFdhhL(i1,i2)
coup1R = cplcFdFdhhR(i1,i2)
coup2L = cplcFdFdhhL(gt2,i1)
coup2R = cplcFdFdhhR(gt2,i1)
coup3L = cplcFdFdhhL(i2,gt3)
coup3R = cplcFdFdhhR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fd], bar[Fd], VG}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopVG)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVG 
coup1L = cplcFdFdhhL(i1,i2)
coup1R = cplcFdFdhhR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do
End if 


! {bar[Fd], bar[Fd], VP}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopVP)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVP 
coup1L = cplcFdFdhhL(i1,i2)
coup1R = cplcFdFdhhR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fd], bar[Fd], VZ}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopVZ)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVZ 
coup1L = cplcFdFdhhL(i1,i2)
coup1R = cplcFdFdhhR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], conj[Hp]}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopHp)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MHp 
coup1L = cplcFuFuhhL(i1,i2)
coup1R = cplcFuFuhhR(i1,i2)
coup2L = cplcFdFucHpL(gt2,i1)
coup2R = cplcFdFucHpR(gt2,i1)
coup3L = cplcFuFdHpL(i2,gt3)
coup3R = cplcFuFdHpR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], conj[VWp]}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopVWp)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVWp 
coup1L = cplcFuFuhhL(i1,i2)
coup1R = cplcFuFuhhR(i1,i2)
coup2L = cplcFdFucVWpL(gt2,i1)
coup2R = cplcFdFucVWpR(gt2,i1)
coup3L = cplcFuFdVWpL(i2,gt3)
coup3R = cplcFuFdVWpR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 
    End Do
  End Do
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTocFdFd


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocFdFd(MAh,MFd,MFu,              & 
& Mhh,MHp,MVG,MVP,MVWp,MVZ,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,      & 
& cplcFdFdAhL,cplcFdFdAhR,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,     & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,              & 
& cplhhcVWpVWp,cplhhVZVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFu(3),Mhh,MHp,MVG,MVP,MVWp,MVZ,MAh2,MFd2(3),MFu2(3),Mhh2,MHp2,            & 
& MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplAhhhVZ,cplcFdFdhhL(3,3),               & 
& cplcFdFdhhR(3,3),cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),  & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFdFdVZL(3,3),& 
& cplcFdFdVZR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),& 
& cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,    & 
& cplhhcVWpVWp,cplhhVZVZ

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh 
Mex2 = MFd(gt2) 
Mex3 = MFd(gt3) 


! {bar[Fd], bar[Fd], VG}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopVG)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVG 
coup1L = cplcFdFdhhL(i1,i2)
coup1R = cplcFdFdhhR(i1,i2)
coup2L = cplcFdFdVGL(gt2,i1)
coup2R = cplcFdFdVGR(gt2,i1)
coup3L = cplcFdFdVGL(i2,gt3)
coup3R = cplcFdFdVGR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do
End if 


! {bar[Fd], bar[Fd], VP}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopVP)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVP 
coup1L = cplcFdFdhhL(i1,i2)
coup1R = cplcFdFdhhR(i1,i2)
coup2L = cplcFdFdVPL(gt2,i1)
coup2R = cplcFdFdVPR(gt2,i1)
coup3L = cplcFdFdVPL(i2,gt3)
coup3R = cplcFdFdVPR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 
    End Do
  End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocFdFd


Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_hhTocFeFe(cplcFeFehhL,cplcFeFehhR,       & 
& MFe,Mhh,MFe2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),Mhh,MFe2(3),Mhh2

Complex(dp), Intent(in) :: cplcFeFehhL(3,3),cplcFeFehhR(3,3)

Complex(dp) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh 
Mex2 = MFe(gt2) 
Mex3 = MFe(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFeFehhL(gt2,gt3)
coupT1R = cplcFeFehhR(gt2,gt3)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt2, gt3) = AmpC 
    End Do
  End Do
End Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_hhTocFeFe


Subroutine Gamma_Real_SimplifiedDMSSSFDM_hhTocFeFe(MLambda,em,gs,cplcFeFehhL,         & 
& cplcFeFehhR,MFe,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFeFehhL(3,3),cplcFeFehhR(3,3)

Real(dp), Intent(in) :: MFe(3),Mhh

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3), GammarealGluon(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
  Do i2=1,3
    Do i3=1,3
CoupL = cplcFeFehhL(i2,i3)
CoupR = cplcFeFehhR(i2,i3)
Mex1 = Mhh
Mex2 = MFe(i2)
Mex3 = MFe(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp,-1._dp,1._dp,CoupL,CoupR,Gammarealphoton(i2,i3),kont)
  GammarealGluon(i2,i3) = 0._dp 
Else 
  GammarealGluon(i2,i3) = 0._dp 
  GammarealPhoton(i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Subroutine Gamma_Real_SimplifiedDMSSSFDM_hhTocFeFe


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhTocFeFe(cplcFeFehhL,cplcFeFehhR,       & 
& ctcplcFeFehhL,ctcplcFeFehhR,MFe,MFe2,Mhh,Mhh2,ZfEL,ZfER,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFe2(3),Mhh,Mhh2

Complex(dp), Intent(in) :: cplcFeFehhL(3,3),cplcFeFehhR(3,3)

Complex(dp), Intent(in) :: ctcplcFeFehhL(3,3),ctcplcFeFehhR(3,3)

Complex(dp), Intent(in) :: ZfEL(3,3),ZfER(3,3),Zfhh

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh 
Mex2 = MFe(gt2) 
Mex3 = MFe(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFeFehhL(gt2,gt3) 
ZcoupT1R = ctcplcFeFehhR(gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh*cplcFeFehhL(gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh*cplcFeFehhR(gt2,gt3)


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfER(i1,gt2)*cplcFeFehhL(i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfEL(i1,gt2))*cplcFeFehhR(i1,gt3)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfEL(i1,gt3)*cplcFeFehhL(gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfER(i1,gt3))*cplcFeFehhR(gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt2, gt3) = AmpC 
    End Do
  End Do
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhTocFeFe


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTocFeFe(MAh,MFe,MFre,Mhh,            & 
& MHp,Mss,MVP,MVWp,MVZ,MAh2,MFe2,MFre2,Mhh2,MHp2,Mss2,MVP2,MVWp2,MVZ2,cplAhAhhh,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplAhhhVZ,cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,     & 
& cplcFreFessL,cplcFreFessR,cplcFeFeVPL,cplcFeFeVPR,cplcFvFeVWpL,cplcFvFeVWpR,           & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFressL,cplcFeFressR,cplcFeFvcHpL,cplcFeFvcHpR,           & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhssss,cplhhcHpVWp,    & 
& cplhhcVWpVWp,cplhhVZVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFe(3),MFre,Mhh,MHp,Mss,MVP,MVWp,MVZ,MAh2,MFe2(3),MFre2,Mhh2,MHp2,Mss2,           & 
& MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh,cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplAhhhVZ,cplcFeFehhL(3,3),               & 
& cplcFeFehhR(3,3),cplcFvFeHpL(3,3),cplcFvFeHpR(3,3),cplcFreFessL(3),cplcFreFessR(3),    & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFvFeVWpL(3,3),cplcFvFeVWpR(3,3),cplcFeFeVZL(3,3),& 
& cplcFeFeVZR(3,3),cplcFeFressL(3),cplcFeFressR(3),cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),  & 
& cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhssss,      & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh 
Mex2 = MFe(gt2) 
Mex3 = MFe(gt3) 


! {Ah, Ah, Fe}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopFe)) Then 
    Do i3=1,3
ML1 = MAh 
ML2 = MAh 
ML3 = MFe(i3) 
coup1 = cplAhAhhh
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {Ah, VZ, Fe}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopFe)) Then 
    Do i3=1,3
ML1 = MAh 
ML2 = MVZ 
ML3 = MFe(i3) 
coup1 = -cplAhhhVZ
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {hh, hh, Fe}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopFe)) Then 
    Do i3=1,3
ML1 = Mhh 
ML2 = Mhh 
ML3 = MFe(i3) 
coup1 = cplhhhhhh
coup2L = cplcFeFehhL(gt2,i3)
coup2R = cplcFeFehhR(gt2,i3)
coup3L = cplcFeFehhL(i3,gt3)
coup3R = cplcFeFehhR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {Hp, Hp, Fv}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopFv)) Then 
    Do i3=1,3
ML1 = MHp 
ML2 = MHp 
ML3 = 0. 
coup1 = cplhhHpcHp
coup2L = cplcFeFvcHpL(gt2,i3)
coup2R = cplcFeFvcHpR(gt2,i3)
coup3L = cplcFvFeHpL(i3,gt3)
coup3R = cplcFvFeHpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {Hp, VWp, Fv}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopFv)) Then 
    Do i3=1,3
ML1 = MHp 
ML2 = MVWp 
ML3 = 0. 
coup1 = cplhhHpcVWp
coup2L = cplcFeFvcHpL(gt2,i3)
coup2R = cplcFeFvcHpR(gt2,i3)
coup3L = cplcFvFeVWpL(i3,gt3)
coup3R = cplcFvFeVWpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {ss, ss, Fre}
If ((Include_in_loopss).and.(Include_in_loopss).and.(Include_in_loopFre)) Then 
ML1 = Mss 
ML2 = Mss 
ML3 = MFre 
coup1 = cplhhssss
coup2L = cplcFeFressL(gt2)
coup2R = cplcFeFressR(gt2)
coup3L = cplcFreFessL(gt3)
coup3R = cplcFreFessR(gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, Fv}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopFv)) Then 
    Do i3=1,3
ML1 = MVWp 
ML2 = MHp 
ML3 = 0. 
coup1 = cplhhcHpVWp
coup2L = cplcFeFvcVWpL(gt2,i3)
coup2R = cplcFeFvcVWpR(gt2,i3)
coup3L = cplcFvFeHpL(i3,gt3)
coup3R = cplcFvFeHpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWp, VWp, Fv}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopFv)) Then 
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = 0. 
coup1 = cplhhcVWpVWp
coup2L = cplcFeFvcVWpL(gt2,i3)
coup2R = cplcFeFvcVWpR(gt2,i3)
coup3L = cplcFvFeVWpL(i3,gt3)
coup3R = cplcFvFeVWpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, Ah, Fe}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopFe)) Then 
    Do i3=1,3
ML1 = MVZ 
ML2 = MAh 
ML3 = MFe(i3) 
coup1 = -cplAhhhVZ
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZ, Fe}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopFe)) Then 
    Do i3=1,3
ML1 = MVZ 
ML2 = MVZ 
ML3 = MFe(i3) 
coup1 = cplhhVZVZ
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {bar[Fe], bar[Fe], Ah}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MAh 
coup1L = cplcFeFehhL(i1,i2)
coup1R = cplcFeFehhR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fe], bar[Fe], hh}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = Mhh 
coup1L = cplcFeFehhL(i1,i2)
coup1R = cplcFeFehhR(i1,i2)
coup2L = cplcFeFehhL(gt2,i1)
coup2R = cplcFeFehhR(gt2,i1)
coup3L = cplcFeFehhL(i2,gt3)
coup3R = cplcFeFehhR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fe], bar[Fe], VP}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopVP)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVP 
coup1L = cplcFeFehhL(i1,i2)
coup1R = cplcFeFehhR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fe], bar[Fe], VZ}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopVZ)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVZ 
coup1L = cplcFeFehhL(i1,i2)
coup1R = cplcFeFehhR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 
    End Do
  End Do
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTocFeFe


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocFeFe(MAh,MFe,MFre,             & 
& Mhh,MHp,Mss,MVP,MVWp,MVZ,MAh2,MFe2,MFre2,Mhh2,MHp2,Mss2,MVP2,MVWp2,MVZ2,               & 
& cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVZ,cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,       & 
& cplcFvFeHpR,cplcFreFessL,cplcFreFessR,cplcFeFeVPL,cplcFeFeVPR,cplcFvFeVWpL,            & 
& cplcFvFeVWpR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFressL,cplcFeFressR,cplcFeFvcHpL,           & 
& cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,             & 
& cplhhssss,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFe(3),MFre,Mhh,MHp,Mss,MVP,MVWp,MVZ,MAh2,MFe2(3),MFre2,Mhh2,MHp2,Mss2,           & 
& MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh,cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplAhhhVZ,cplcFeFehhL(3,3),               & 
& cplcFeFehhR(3,3),cplcFvFeHpL(3,3),cplcFvFeHpR(3,3),cplcFreFessL(3),cplcFreFessR(3),    & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFvFeVWpL(3,3),cplcFvFeVWpR(3,3),cplcFeFeVZL(3,3),& 
& cplcFeFeVZR(3,3),cplcFeFressL(3),cplcFeFressR(3),cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),  & 
& cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhssss,      & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh 
Mex2 = MFe(gt2) 
Mex3 = MFe(gt3) 


! {bar[Fe], bar[Fe], VP}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopVP)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVP 
coup1L = cplcFeFehhL(i1,i2)
coup1R = cplcFeFehhR(i1,i2)
coup2L = cplcFeFeVPL(gt2,i1)
coup2R = cplcFeFeVPR(gt2,i1)
coup3L = cplcFeFeVPL(i2,gt3)
coup3R = cplcFeFeVPR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 
    End Do
  End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocFeFe


Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_hhTocFuFu(cplcFuFuhhL,cplcFuFuhhR,       & 
& MFu,Mhh,MFu2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MFu(3),Mhh,MFu2(3),Mhh2

Complex(dp), Intent(in) :: cplcFuFuhhL(3,3),cplcFuFuhhR(3,3)

Complex(dp) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh 
Mex2 = MFu(gt2) 
Mex3 = MFu(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFuFuhhL(gt2,gt3)
coupT1R = cplcFuFuhhR(gt2,gt3)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt2, gt3) = AmpC 
    End Do
  End Do
End Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_hhTocFuFu


Subroutine Gamma_Real_SimplifiedDMSSSFDM_hhTocFuFu(MLambda,em,gs,cplcFuFuhhL,         & 
& cplcFuFuhhR,MFu,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFuFuhhL(3,3),cplcFuFuhhR(3,3)

Real(dp), Intent(in) :: MFu(3),Mhh

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3), GammarealGluon(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
  Do i2=1,3
    Do i3=1,3
CoupL = cplcFuFuhhL(i2,i3)
CoupR = cplcFuFuhhR(i2,i3)
Mex1 = Mhh
Mex2 = MFu(i2)
Mex3 = MFu(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,4._dp/3._dp,-4._dp/3._dp,4._dp/3._dp,CoupL,CoupR,Gammarealphoton(i2,i3),kont)
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,gs,0._dp,0._dp,0._dp,4._dp,-4._dp,4._dp,CoupL,CoupR,Gammarealgluon(i2,i3),kont)
Else 
  GammarealGluon(i2,i3) = 0._dp 
  GammarealPhoton(i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Subroutine Gamma_Real_SimplifiedDMSSSFDM_hhTocFuFu


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhTocFuFu(cplcFuFuhhL,cplcFuFuhhR,       & 
& ctcplcFuFuhhL,ctcplcFuFuhhR,MFu,MFu2,Mhh,Mhh2,Zfhh,ZfUL,ZfUR,Amp)

Implicit None

Real(dp), Intent(in) :: MFu(3),MFu2(3),Mhh,Mhh2

Complex(dp), Intent(in) :: cplcFuFuhhL(3,3),cplcFuFuhhR(3,3)

Complex(dp), Intent(in) :: ctcplcFuFuhhL(3,3),ctcplcFuFuhhR(3,3)

Complex(dp), Intent(in) :: Zfhh,ZfUL(3,3),ZfUR(3,3)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh 
Mex2 = MFu(gt2) 
Mex3 = MFu(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFuFuhhL(gt2,gt3) 
ZcoupT1R = ctcplcFuFuhhR(gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh*cplcFuFuhhL(gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh*cplcFuFuhhR(gt2,gt3)


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfUR(i1,gt2)*cplcFuFuhhL(i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfUL(i1,gt2))*cplcFuFuhhR(i1,gt3)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfUL(i1,gt3)*cplcFuFuhhL(gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfUR(i1,gt3))*cplcFuFuhhR(gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt2, gt3) = AmpC 
    End Do
  End Do
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhTocFuFu


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTocFuFu(MAh,MFd,MFu,Mhh,             & 
& MHp,MVG,MVP,MVWp,MVZ,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,          & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,     & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHpL,cplcFdFucHpR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,              & 
& cplhhcVWpVWp,cplhhVZVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFu(3),Mhh,MHp,MVG,MVP,MVWp,MVZ,MAh2,MFd2(3),MFu2(3),Mhh2,MHp2,            & 
& MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh,cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplAhhhVZ,cplcFdFdhhL(3,3),               & 
& cplcFdFdhhR(3,3),cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),& 
& cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),  & 
& cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),& 
& cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,    & 
& cplhhcVWpVWp,cplhhVZVZ

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh 
Mex2 = MFu(gt2) 
Mex3 = MFu(gt3) 


! {Ah, Ah, Fu}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopFu)) Then 
    Do i3=1,3
ML1 = MAh 
ML2 = MAh 
ML3 = MFu(i3) 
coup1 = cplAhAhhh
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {Ah, VZ, Fu}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopFu)) Then 
    Do i3=1,3
ML1 = MAh 
ML2 = MVZ 
ML3 = MFu(i3) 
coup1 = -cplAhhhVZ
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {hh, hh, Fu}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopFu)) Then 
    Do i3=1,3
ML1 = Mhh 
ML2 = Mhh 
ML3 = MFu(i3) 
coup1 = cplhhhhhh
coup2L = cplcFuFuhhL(gt2,i3)
coup2R = cplcFuFuhhR(gt2,i3)
coup3L = cplcFuFuhhL(i3,gt3)
coup3R = cplcFuFuhhR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, Ah, Fu}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopFu)) Then 
    Do i3=1,3
ML1 = MVZ 
ML2 = MAh 
ML3 = MFu(i3) 
coup1 = -cplAhhhVZ
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZ, Fu}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopFu)) Then 
    Do i3=1,3
ML1 = MVZ 
ML2 = MVZ 
ML3 = MFu(i3) 
coup1 = cplhhVZVZ
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {bar[Fd], bar[Fd], Hp}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopHp)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MHp 
coup1L = cplcFdFdhhL(i1,i2)
coup1R = cplcFdFdhhR(i1,i2)
coup2L = cplcFuFdHpL(gt2,i1)
coup2R = cplcFuFdHpR(gt2,i1)
coup3L = cplcFdFucHpL(i2,gt3)
coup3R = cplcFdFucHpR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fd], bar[Fd], VWp}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopVWp)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVWp 
coup1L = cplcFdFdhhL(i1,i2)
coup1R = cplcFdFdhhR(i1,i2)
coup2L = cplcFuFdVWpL(gt2,i1)
coup2R = cplcFuFdVWpR(gt2,i1)
coup3L = cplcFdFucVWpL(i2,gt3)
coup3R = cplcFdFucVWpR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], Ah}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopAh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MAh 
coup1L = cplcFuFuhhL(i1,i2)
coup1R = cplcFuFuhhR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], hh}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loophh)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = Mhh 
coup1L = cplcFuFuhhL(i1,i2)
coup1R = cplcFuFuhhR(i1,i2)
coup2L = cplcFuFuhhL(gt2,i1)
coup2R = cplcFuFuhhR(gt2,i1)
coup3L = cplcFuFuhhL(i2,gt3)
coup3R = cplcFuFuhhR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], VG}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopVG)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVG 
coup1L = cplcFuFuhhL(i1,i2)
coup1R = cplcFuFuhhR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], VP}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopVP)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVP 
coup1L = cplcFuFuhhL(i1,i2)
coup1R = cplcFuFuhhR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], VZ}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopVZ)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVZ 
coup1L = cplcFuFuhhL(i1,i2)
coup1R = cplcFuFuhhR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[Hp], conj[Hp], Fd}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopFd)) Then 
    Do i3=1,3
ML1 = MHp 
ML2 = MHp 
ML3 = MFd(i3) 
coup1 = cplhhHpcHp
coup2L = cplcFuFdHpL(gt2,i3)
coup2R = cplcFuFdHpR(gt2,i3)
coup3L = cplcFdFucHpL(i3,gt3)
coup3R = cplcFdFucHpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[Hp], conj[VWp], Fd}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopFd)) Then 
    Do i3=1,3
ML1 = MHp 
ML2 = MVWp 
ML3 = MFd(i3) 
coup1 = cplhhcHpVWp
coup2L = cplcFuFdHpL(gt2,i3)
coup2R = cplcFuFdHpR(gt2,i3)
coup3L = cplcFdFucVWpL(i3,gt3)
coup3R = cplcFdFucVWpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[VWp], conj[Hp], Fd}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopFd)) Then 
    Do i3=1,3
ML1 = MVWp 
ML2 = MHp 
ML3 = MFd(i3) 
coup1 = cplhhHpcVWp
coup2L = cplcFuFdVWpL(gt2,i3)
coup2R = cplcFuFdVWpR(gt2,i3)
coup3L = cplcFdFucHpL(i3,gt3)
coup3R = cplcFdFucHpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[VWp], conj[VWp], Fd}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopFd)) Then 
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MFd(i3) 
coup1 = cplhhcVWpVWp
coup2L = cplcFuFdVWpL(gt2,i3)
coup2R = cplcFuFdVWpR(gt2,i3)
coup3L = cplcFdFucVWpL(i3,gt3)
coup3R = cplcFdFucVWpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 
    End Do
  End Do
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTocFuFu


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocFuFu(MAh,MFd,MFu,              & 
& Mhh,MHp,MVG,MVP,MVWp,MVZ,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,      & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,     & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHpL,cplcFdFucHpR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,              & 
& cplhhcVWpVWp,cplhhVZVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFu(3),Mhh,MHp,MVG,MVP,MVWp,MVZ,MAh2,MFd2(3),MFu2(3),Mhh2,MHp2,            & 
& MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh,cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplAhhhVZ,cplcFdFdhhL(3,3),               & 
& cplcFdFdhhR(3,3),cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),& 
& cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),  & 
& cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),& 
& cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,    & 
& cplhhcVWpVWp,cplhhVZVZ

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh 
Mex2 = MFu(gt2) 
Mex3 = MFu(gt3) 


! {bar[Fu], bar[Fu], VG}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopVG)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVG 
coup1L = cplcFuFuhhL(i1,i2)
coup1R = cplcFuFuhhR(i1,i2)
coup2L = cplcFuFuVGL(gt2,i1)
coup2R = cplcFuFuVGR(gt2,i1)
coup3L = cplcFuFuVGL(i2,gt3)
coup3R = cplcFuFuVGR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], VP}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopVP)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVP 
coup1L = cplcFuFuhhL(i1,i2)
coup1R = cplcFuFuhhR(i1,i2)
coup2L = cplcFuFuVPL(gt2,i1)
coup2R = cplcFuFuVPR(gt2,i1)
coup3L = cplcFuFuVPL(i2,gt3)
coup3R = cplcFuFuVPR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 
    End Do
  End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocFuFu


Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_hhTohhhh(cplhhhhhh,Mhh,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh,Mhh2

Complex(dp), Intent(in) :: cplhhhhhh

Complex(dp) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

! External masses 
Mex1 = Mhh 
Mex2 = Mhh 
Mex3 = Mhh 
! Tree-Level Vertex 
coupT1 = cplhhhhhh
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp = AmpC 
End Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_hhTohhhh


Subroutine Gamma_Real_SimplifiedDMSSSFDM_hhTohhhh(MLambda,em,gs,cplhhhhhh,            & 
& Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhhhhh

Real(dp), Intent(in) :: Mhh

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton, GammarealGluon 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Coup = cplhhhhhh
Mex1 = Mhh
Mex2 = Mhh
Mex3 = Mhh
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton = 0._dp 
  GammarealGluon = 0._dp 
Else 
  GammarealGluon = 0._dp 
  GammarealPhoton = 0._dp 

End if 
End Subroutine Gamma_Real_SimplifiedDMSSSFDM_hhTohhhh


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhTohhhh(cplhhhhhh,ctcplhhhhhh,          & 
& Mhh,Mhh2,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh,Mhh2

Complex(dp), Intent(in) :: cplhhhhhh

Complex(dp), Intent(in) :: ctcplhhhhhh

Complex(dp), Intent(in) :: Zfhh

Complex(dp), Intent(out) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = Mhh 
Mex2 = Mhh 
Mex3 = Mhh 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhhhhh 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh*cplhhhhhh


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh*cplhhhhhh


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh*cplhhhhhh


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp = AmpC 
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhTohhhh


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTohhhh(MAh,MFd,MFe,MFu,              & 
& Mhh,MHp,Mss,MVWp,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,Mss2,MVWp2,MVZ2,cplAhAhhh,          & 
& cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,     & 
& cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhssss,       & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplAhAhhhhh1,cplhhhhhhhh1,cplhhhhHpcHp1,            & 
& cplhhhhssss1,cplhhhhcVWpVWp1,cplhhhhVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh,MHp,Mss,MVWp,MVZ,MAh2,MFd2(3),MFe2(3),MFu2(3),           & 
& Mhh2,MHp2,Mss2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh,cplAhhhVZ,cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFeFehhL(3,3),               & 
& cplcFeFehhR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcgWpgWphh,cplcgWCgWChh,          & 
& cplcgZgZhh,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhssss,cplhhcHpVWp,cplhhcVWpVWp,        & 
& cplhhVZVZ,cplAhAhhhhh1,cplhhhhhhhh1,cplhhhhHpcHp1,cplhhhhssss1,cplhhhhcVWpVWp1,        & 
& cplhhhhVZVZ1

Complex(dp), Intent(out) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp = 0._dp 
! External masses 
Mex1 = Mhh 
Mex2 = Mhh 
Mex3 = Mhh 


! {Ah, Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopAh)) Then 
ML1 = MAh 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhAhhh
coup2 = cplAhAhhh
coup3 = cplAhAhhh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {Ah, VZ, Ah}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopAh)) Then 
ML1 = MAh 
ML2 = MVZ 
ML3 = MAh 
coup1 = cplAhhhVZ
coup2 = cplAhAhhh
coup3 = -cplAhhhVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {Ah, Ah, VZ}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopVZ)) Then 
ML1 = MAh 
ML2 = MAh 
ML3 = MVZ 
coup1 = cplAhAhhh
coup2 = cplAhhhVZ
coup3 = -cplAhhhVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {Ah, VZ, VZ}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MAh 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplAhhhVZ
coup2 = cplAhhhVZ
coup3 = cplhhVZVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1)
coup1R = cplcFdFdhhR(i2,i1)
coup2L = cplcFdFdhhL(i1,i3)
coup2R = cplcFdFdhhR(i1,i3)
coup3L = cplcFdFdhhL(i3,i2)
coup3R = cplcFdFdhhR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1)
coup1R = cplcFeFehhR(i2,i1)
coup2L = cplcFeFehhL(i1,i3)
coup2R = cplcFeFehhR(i1,i3)
coup3L = cplcFeFehhL(i3,i2)
coup3R = cplcFeFehhR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1)
coup1R = cplcFuFuhhR(i2,i1)
coup2L = cplcFuFuhhL(i1,i3)
coup2R = cplcFuFuhhR(i1,i3)
coup3L = cplcFuFuhhL(i3,i2)
coup3R = cplcFuFuhhR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWp, gWp, gWp}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh
coup2 = cplcgWpgWphh
coup3 = cplcgWpgWphh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(2)*AmpC 
End if 


! {gWpC, gWpC, gWpC}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh
coup2 = cplcgWCgWChh
coup3 = cplcgWCgWChh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(2)*AmpC 
End if 


! {gZ, gZ, gZ}
If ((Include_in_loopgZ).and.(Include_in_loopgZ).and.(Include_in_loopgZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplcgZgZhh
coup2 = cplcgZgZhh
coup3 = cplcgZgZhh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(2)*AmpC 
End if 


! {hh, hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loophh)) Then 
ML1 = Mhh 
ML2 = Mhh 
ML3 = Mhh 
coup1 = cplhhhhhh
coup2 = cplhhhhhh
coup3 = cplhhhhhh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {Hp, Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhHpcHp
coup2 = cplhhHpcHp
coup3 = cplhhHpcHp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(2)*AmpC 
End if 


! {Hp, VWp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = -cplhhHpcVWp
coup2 = cplhhHpcHp
coup3 = cplhhcHpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {Hp, Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp
coup2 = -cplhhcHpVWp
coup3 = cplhhHpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhHpcVWp
coup2 = -cplhhcHpVWp
coup3 = cplhhcVWpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {ss, ss, ss}
If ((Include_in_loopss).and.(Include_in_loopss).and.(Include_in_loopss)) Then 
ML1 = Mss 
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


! {VWp, Hp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = -cplhhcHpVWp
coup2 = -cplhhHpcVWp
coup3 = cplhhHpcHp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp
coup2 = -cplhhHpcVWp
coup3 = cplhhcHpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = -cplhhcHpVWp
coup2 = cplhhcVWpVWp
coup3 = cplhhHpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcVWpVWp
coup2 = cplhhcVWpVWp
coup3 = cplhhcVWpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(2)*AmpC 
End if 


! {VZ, Ah, Ah}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopAh)) Then 
ML1 = MVZ 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhhhVZ
coup2 = cplAhhhVZ
coup3 = cplAhAhhh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ, Ah}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopAh)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MAh 
coup1 = cplhhVZVZ
coup2 = cplAhhhVZ
coup3 = -cplAhhhVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {VZ, Ah, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MAh 
ML3 = MVZ 
coup1 = cplAhhhVZ
coup2 = cplhhVZVZ
coup3 = -cplAhhhVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplhhVZVZ
coup2 = cplhhVZVZ
coup3 = cplhhVZVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[Hp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = -cplhhcHpVWp
coup2 = cplhhHpcHp
coup3 = cplhhHpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp
coup2 = -cplhhHpcVWp
coup3 = cplhhcHpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhcHpVWp
coup2 = -cplhhHpcVWp
coup3 = cplhhcVWpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = -cplhhHpcVWp
coup2 = -cplhhcHpVWp
coup3 = cplhhHpcHp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp
coup2 = -cplhhcHpVWp
coup3 = cplhhHpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[VWp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = -cplhhHpcVWp
coup2 = cplhhcVWpVWp
coup3 = cplhhcHpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
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
coup1 = cplAhAhhh
coup2 = cplAhAhhhhh1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
ML1 = Mhh 
ML2 = Mhh 
coup1 = cplhhhhhh
coup2 = cplhhhhhhhh1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
coup1 = cplhhHpcHp
coup2 = cplhhhhHpcHp1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {ss, ss}
If ((Include_in_loopss).and.(Include_in_loopss)) Then 
ML1 = Mss 
ML2 = Mss 
coup1 = cplhhssss
coup2 = cplhhhhssss1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhcVWpVWp
coup2 = cplhhhhcVWpVWp1
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhVZVZ
coup2 = cplhhhhVZVZ1
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhhhh1
coup2 = cplAhAhhh
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplhhhhhhhh1
coup2 = cplhhhhhh
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplhhhhHpcHp1
coup2 = cplhhHpcHp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplhhhhssss1
coup2 = cplhhssss
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 

End if 


! {VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhhhcVWpVWp1
coup2 = cplhhcVWpVWp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

End if 


! {VZ, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhhhVZVZ1
coup2 = cplhhVZVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 

End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhhhh1
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
coup1 = cplhhhhhhhh1
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
coup1 = cplhhhhHpcHp1
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
coup1 = cplhhhhssss1
coup2 = cplhhssss
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 

End if 


! {VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhhhcVWpVWp1
coup2 = cplhhcVWpVWp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

End if 


! {VZ, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhhhVZVZ1
coup2 = cplhhVZVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 

End if 
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTohhhh


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTohhhh(MAh,MFd,MFe,               & 
& MFu,Mhh,MHp,Mss,MVWp,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,Mss2,MVWp2,MVZ2,cplAhAhhh,      & 
& cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,     & 
& cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhssss,       & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplAhAhhhhh1,cplhhhhhhhh1,cplhhhhHpcHp1,            & 
& cplhhhhssss1,cplhhhhcVWpVWp1,cplhhhhVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh,MHp,Mss,MVWp,MVZ,MAh2,MFd2(3),MFe2(3),MFu2(3),           & 
& Mhh2,MHp2,Mss2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh,cplAhhhVZ,cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFeFehhL(3,3),               & 
& cplcFeFehhR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcgWpgWphh,cplcgWCgWChh,          & 
& cplcgZgZhh,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhssss,cplhhcHpVWp,cplhhcVWpVWp,        & 
& cplhhVZVZ,cplAhAhhhhh1,cplhhhhhhhh1,cplhhhhHpcHp1,cplhhhhssss1,cplhhhhcVWpVWp1,        & 
& cplhhhhVZVZ1

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
Mex1 = Mhh 
Mex2 = Mhh 
Mex3 = Mhh 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTohhhh


Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_hhTocHpHp(cplhhHpcHp,Mhh,MHp,            & 
& Mhh2,MHp2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh,MHp,Mhh2,MHp2

Complex(dp), Intent(in) :: cplhhHpcHp

Complex(dp) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

! External masses 
Mex1 = Mhh 
Mex2 = MHp 
Mex3 = MHp 
! Tree-Level Vertex 
coupT1 = cplhhHpcHp
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp = AmpC 
End Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_hhTocHpHp


Subroutine Gamma_Real_SimplifiedDMSSSFDM_hhTocHpHp(MLambda,em,gs,cplhhHpcHp,          & 
& Mhh,MHp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhHpcHp

Real(dp), Intent(in) :: Mhh,MHp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton, GammarealGluon 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Coup = cplhhHpcHp
Mex1 = Mhh
Mex2 = MHp
Mex3 = MHp
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp,-1._dp,1._dp,Coup,Gammarealphoton,kont)
  GammarealGluon = 0._dp 
Else 
  GammarealGluon = 0._dp 
  GammarealPhoton = 0._dp 

End if 
End Subroutine Gamma_Real_SimplifiedDMSSSFDM_hhTocHpHp


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhTocHpHp(cplhhHpcHp,ctcplhhHpcHp,       & 
& Mhh,Mhh2,MHp,MHp2,Zfhh,ZfHp,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh,Mhh2,MHp,MHp2

Complex(dp), Intent(in) :: cplhhHpcHp

Complex(dp), Intent(in) :: ctcplhhHpcHp

Complex(dp), Intent(in) :: Zfhh,ZfHp

Complex(dp), Intent(out) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = Mhh 
Mex2 = MHp 
Mex3 = MHp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhHpcHp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh*cplhhHpcHp


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfHp)*cplhhHpcHp


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfHp*cplhhHpcHp


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp = AmpC 
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhTocHpHp


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTocHpHp(MAh,MFd,MFe,MFu,             & 
& Mhh,MHp,Mss,MVP,MVWp,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,Mss2,MVP2,MVWp2,MVZ2,           & 
& cplAhAhhh,cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,       & 
& cplcFuFdHpR,cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcgWpgWphh,          & 
& cplcgZgWpcHp,cplcgWCgWChh,cplcgZgWCHp,cplcgZgZhh,cplcgWpgZHp,cplcgWCgZcHp,             & 
& cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhssss,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,         & 
& cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplAhAhHpcHp1,   & 
& cplhhhhHpcHp1,cplhhHpcVWpVP1,cplhhHpcVWpVZ1,cplhhcHpVPVWp1,cplhhcHpVWpVZ1,             & 
& cplHpHpcHpcHp1,cplHpsssscHp1,cplHpcHpcVWpVWp1,cplHpcHpVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh,MHp,Mss,MVP,MVWp,MVZ,MAh2,MFd2(3),MFe2(3),               & 
& MFu2(3),Mhh2,MHp2,Mss2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh,cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),        & 
& cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFvFeHpL(3,3),  & 
& cplcFvFeHpR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),& 
& cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),cplcgWpgWphh,cplcgZgWpcHp,cplcgWCgWChh,            & 
& cplcgZgWCHp,cplcgZgZhh,cplcgWpgZHp,cplcgWCgZcHp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,      & 
& cplhhssss,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZ,        & 
& cplHpcVWpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplAhAhHpcHp1,cplhhhhHpcHp1,cplhhHpcVWpVP1,        & 
& cplhhHpcVWpVZ1,cplhhcHpVPVWp1,cplhhcHpVWpVZ1,cplHpHpcHpcHp1,cplHpsssscHp1,             & 
& cplHpcHpcVWpVWp1,cplHpcHpVZVZ1

Complex(dp), Intent(out) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp = 0._dp 
! External masses 
Mex1 = Mhh 
Mex2 = MHp 
Mex3 = MHp 


! {Ah, Ah, VWp}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopVWp)) Then 
ML1 = MAh 
ML2 = MAh 
ML3 = MVWp 
coup1 = cplAhAhhh
coup2 = cplAhcHpVWp
coup3 = -cplAhHpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {Ah, VZ, VWp}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
ML1 = MAh 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplAhhhVZ
coup2 = cplAhcHpVWp
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {Fd, Fd, Fu}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdhhL(i2,i1)
coup1R = cplcFdFdhhR(i2,i1)
coup2L = cplcFdFucHpL(i1,i3)
coup2R = cplcFdFucHpR(i1,i3)
coup3L = cplcFuFdHpL(i3,i2)
coup3R = cplcFuFdHpR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fv}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = 0. 
coup1L = cplcFeFehhL(i2,i1)
coup1R = cplcFeFehhR(i2,i1)
coup2L = cplcFeFvcHpL(i1,i3)
coup2R = cplcFeFvcHpR(i1,i3)
coup3L = cplcFvFeHpL(i3,i2)
coup3R = cplcFvFeHpR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWpC, gWpC, gZ}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgZ)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplcgWCgWChh
coup2 = cplcgWCgZcHp
coup3 = cplcgZgWCHp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {gZ, gZ, gWp}
If ((Include_in_loopgZ).and.(Include_in_loopgZ).and.(Include_in_loopgWp)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZgZhh
coup2 = cplcgZgWpcHp
coup3 = cplcgWpgZHp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {hh, hh, Hp}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopHp)) Then 
ML1 = Mhh 
ML2 = Mhh 
ML3 = MHp 
coup1 = cplhhhhhh
coup2 = cplhhHpcHp
coup3 = cplhhHpcHp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {hh, hh, VWp}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVWp)) Then 
ML1 = Mhh 
ML2 = Mhh 
ML3 = MVWp 
coup1 = cplhhhhhh
coup2 = cplhhcHpVWp
coup3 = -cplhhHpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ, Hp}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopHp)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MHp 
coup1 = cplhhVZVZ
coup2 = cplHpcHpVZ
coup3 = cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {VZ, Ah, VWp}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopVWp)) Then 
ML1 = MVZ 
ML2 = MAh 
ML3 = MVWp 
coup1 = cplAhhhVZ
coup2 = cplcHpVWpVZ
coup3 = -cplAhHpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ, VWp}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplhhVZVZ
coup2 = cplcHpVWpVZ
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {bar[Fu], bar[Fu], bar[Fd]}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuhhL(i1,i2)
coup1R = cplcFuFuhhR(i1,i2)
coup2L = cplcFdFucHpL(i3,i1)
coup2R = cplcFdFucHpR(i3,i1)
coup3L = cplcFuFdHpL(i2,i3)
coup3R = cplcFuFdHpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[gWp], bar[gWp], bar[gZ]}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgZ)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplcgWpgWphh
coup2 = cplcgZgWpcHp
coup3 = cplcgWpgZHp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {bar[gZ], bar[gZ], bar[gWpC]}
If ((Include_in_loopgZ).and.(Include_in_loopgZ).and.(Include_in_loopgWC)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZgZhh
coup2 = cplcgWCgZcHp
coup3 = cplcgZgWCHp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], hh}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loophh)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = Mhh 
coup1 = cplhhHpcHp
coup2 = cplhhHpcHp
coup3 = cplhhHpcHp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], hh}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loophh)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = Mhh 
coup1 = -cplhhcHpVWp
coup2 = cplhhHpcHp
coup3 = -cplhhHpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], VP}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVP 
coup1 = cplhhHpcHp
coup2 = cplHpcHpVP
coup3 = cplHpcHpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], VP}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVP 
coup1 = -cplhhcHpVWp
coup2 = cplHpcHpVP
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], VZ}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVZ)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVZ 
coup1 = cplhhHpcHp
coup2 = cplHpcHpVZ
coup3 = cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], VZ}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVZ)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = -cplhhcHpVWp
coup2 = cplHpcHpVZ
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], Ah}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopAh)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MAh 
coup1 = cplhhcVWpVWp
coup2 = cplAhcHpVWp
coup3 = -cplAhHpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], hh}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loophh)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = Mhh 
coup1 = -cplhhHpcVWp
coup2 = cplhhcHpVWp
coup3 = cplhhHpcHp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], hh}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loophh)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = Mhh 
coup1 = cplhhcVWpVWp
coup2 = cplhhcHpVWp
coup3 = -cplhhHpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], VP}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVP 
coup1 = -cplhhHpcVWp
coup2 = cplcHpVPVWp
coup3 = cplHpcHpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], VP}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplhhcVWpVWp
coup2 = cplcHpVPVWp
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], VZ}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVZ)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVZ 
coup1 = -cplhhHpcVWp
coup2 = cplcHpVWpVZ
coup3 = cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], VZ}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVZ)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplhhcVWpVWp
coup2 = cplcHpVWpVZ
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
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
coup1 = cplAhAhhh
coup2 = cplAhAhHpcHp1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
ML1 = Mhh 
ML2 = Mhh 
coup1 = cplhhhhhh
coup2 = cplhhhhHpcHp1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
coup1 = cplhhHpcHp
coup2 = cplHpHpcHpcHp1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {ss, ss}
If ((Include_in_loopss).and.(Include_in_loopss)) Then 
ML1 = Mss 
ML2 = Mss 
coup1 = cplhhssss
coup2 = cplHpsssscHp1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhcVWpVWp
coup2 = cplHpcHpcVWpVWp1
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhVZVZ
coup2 = cplHpcHpVZVZ1
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {hh, Hp}
If ((Include_in_loophh).and.(Include_in_loopHp)) Then 
ML1 = Mhh 
ML2 = MHp 
coup1 = cplhhhhHpcHp1
coup2 = cplhhHpcHp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

End if 


! {VP, VWp}
If ((Include_in_loopVP).and.(Include_in_loopVWp)) Then 
ML1 = MVP 
ML2 = MVWp 
coup1 = cplhhHpcVWpVP1
coup2 = cplcHpVPVWp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

End if 


! {VZ, VWp}
If ((Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
ML1 = MVZ 
ML2 = MVWp 
coup1 = cplhhHpcVWpVZ1
coup2 = cplcHpVWpVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

End if 


! {hh, conj[Hp]}
If ((Include_in_loophh).and.(Include_in_loopHp)) Then 
ML1 = Mhh 
ML2 = MHp 
coup1 = cplhhhhHpcHp1
coup2 = cplhhHpcHp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

End if 


! {VP, conj[VWp]}
If ((Include_in_loopVP).and.(Include_in_loopVWp)) Then 
ML1 = MVP 
ML2 = MVWp 
coup1 = cplhhcHpVPVWp1
coup2 = cplHpcVWpVP
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

End if 


! {VWp, VZ}
If ((Include_in_loopVWp).and.(Include_in_loopVZ)) Then 
ML1 = MVWp 
ML2 = MVZ 
coup1 = cplhhcHpVWpVZ1
coup2 = cplHpcVWpVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

End if 
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTocHpHp


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocHpHp(MAh,MFd,MFe,              & 
& MFu,Mhh,MHp,Mss,MVP,MVWp,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,Mss2,MVP2,MVWp2,            & 
& MVZ2,cplAhAhhh,cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,           & 
& cplcgWpgWphh,cplcgZgWpcHp,cplcgWCgWChh,cplcgZgWCHp,cplcgZgZhh,cplcgWpgZHp,             & 
& cplcgWCgZcHp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhssss,cplhhcHpVWp,cplhhcVWpVWp,      & 
& cplhhVZVZ,cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVPVWp,cplcHpVWpVZ,       & 
& cplAhAhHpcHp1,cplhhhhHpcHp1,cplhhHpcVWpVP1,cplhhHpcVWpVZ1,cplhhcHpVPVWp1,              & 
& cplhhcHpVWpVZ1,cplHpHpcHpcHp1,cplHpsssscHp1,cplHpcHpcVWpVWp1,cplHpcHpVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh,MHp,Mss,MVP,MVWp,MVZ,MAh2,MFd2(3),MFe2(3),               & 
& MFu2(3),Mhh2,MHp2,Mss2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh,cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),        & 
& cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFvFeHpL(3,3),  & 
& cplcFvFeHpR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),& 
& cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),cplcgWpgWphh,cplcgZgWpcHp,cplcgWCgWChh,            & 
& cplcgZgWCHp,cplcgZgZhh,cplcgWpgZHp,cplcgWCgZcHp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,      & 
& cplhhssss,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZ,        & 
& cplHpcVWpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplAhAhHpcHp1,cplhhhhHpcHp1,cplhhHpcVWpVP1,        & 
& cplhhHpcVWpVZ1,cplhhcHpVPVWp1,cplhhcHpVWpVZ1,cplHpHpcHpcHp1,cplHpsssscHp1,             & 
& cplHpcHpcVWpVWp1,cplHpcHpVZVZ1

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
Mex1 = Mhh 
Mex2 = MHp 
Mex3 = MHp 


! {conj[Hp], conj[Hp], VP}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVP 
coup1 = cplhhHpcHp
coup2 = cplHpcHpVP
coup3 = cplHpcHpVP
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], VP}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVP 
coup1 = -cplhhcHpVWp
coup2 = cplHpcHpVP
coup3 = cplHpcVWpVP
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], VP}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVP 
coup1 = -cplhhHpcVWp
coup2 = cplcHpVPVWp
coup3 = cplHpcHpVP
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], VP}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplhhcVWpVWp
coup2 = cplcHpVPVWp
coup3 = cplHpcVWpVP
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {VP, VWp}
If ((Include_in_loopVP).and.(Include_in_loopVWp)) Then 
ML1 = MVP 
ML2 = MVWp 
coup1 = cplhhHpcVWpVP1
coup2 = cplcHpVPVWp
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

End if 


! {VP, conj[VWp]}
If ((Include_in_loopVP).and.(Include_in_loopVWp)) Then 
ML1 = MVP 
ML2 = MVWp 
coup1 = cplhhcHpVPVWp1
coup2 = cplHpcVWpVP
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

End if 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocHpHp


Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_hhToHpcVWp(cplhhHpcVWp,Mhh,              & 
& MHp,MVWp,Mhh2,MHp2,MVWp2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh,MHp,MVWp,Mhh2,MHp2,MVWp2

Complex(dp), Intent(in) :: cplhhHpcVWp

Complex(dp) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

! External masses 
Mex1 = Mhh 
Mex2 = MHp 
Mex3 = MVWp 
! Tree-Level Vertex 
coupT1 = cplhhHpcVWp
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:) = AmpC 
End Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_hhToHpcVWp


Subroutine Gamma_Real_SimplifiedDMSSSFDM_hhToHpcVWp(MLambda,em,gs,cplhhHpcVWp,        & 
& Mhh,MHp,MVWp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhHpcVWp

Real(dp), Intent(in) :: Mhh,MHp,MVWp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton, GammarealGluon 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Coup = cplhhHpcVWp
Mex1 = Mhh
Mex2 = MHp
Mex3 = MVWp
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,em,0._dp,1._dp,-1._dp,Coup,Gammarealphoton,kont)
 GammarealGluon = 0._dp 
Else 
  GammarealGluon = 0._dp 
  GammarealPhoton = 0._dp 

End if 
End Subroutine Gamma_Real_SimplifiedDMSSSFDM_hhToHpcVWp


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhToHpcVWp(cplhhHpcVWp,ctcplhhHpcVWp,    & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,Zfhh,ZfHp,ZfVWp,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2

Complex(dp), Intent(in) :: cplhhHpcVWp

Complex(dp), Intent(in) :: ctcplhhHpcVWp

Complex(dp), Intent(in) :: Zfhh,ZfHp,ZfVWp

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = Mhh 
Mex2 = MHp 
Mex3 = MVWp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhHpcVWp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh*cplhhHpcVWp


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfHp*cplhhHpcVWp


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVWp*cplhhHpcVWp


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:) = AmpC 
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhToHpcVWp


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToHpcVWp(MAh,MFd,MFe,MFu,            & 
& Mhh,MHp,MVP,MVWp,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,cplAhhhVZ,          & 
& cplAhHpcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFeFehhL,               & 
& cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucVWpL,             & 
& cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgZgAhh,cplcgWpgAHp,cplcgWpgWphh,         & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWChh,cplcgZgWCHp,cplcgZgZhh,cplcgWpgZHp,           & 
& cplcgWCgZcVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,               & 
& cplhhVZVZ,cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZ,cplHpcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,     & 
& cplAhHpcVWpVZ1,cplhhhhcVWpVWp1,cplhhHpcVWpVP1,cplhhHpcVWpVZ1,cplHpcHpcVWpVWp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh,MHp,MVP,MVWp,MVZ,MAh2,MFd2(3),MFe2(3),MFu2(3),           & 
& Mhh2,MHp2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhhhVZ,cplAhHpcVWp,cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFuFdHpL(3,3),             & 
& cplcFuFdHpR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFvFeHpL(3,3),cplcFvFeHpR(3,3),  & 
& cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),               & 
& cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplcgZgAhh,cplcgWpgAHp,cplcgWpgWphh,             & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWChh,cplcgZgWCHp,cplcgZgZhh,cplcgWpgZHp,           & 
& cplcgWCgZcVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,               & 
& cplhhVZVZ,cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZ,cplHpcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,     & 
& cplAhHpcVWpVZ1,cplhhhhcVWpVWp1,cplhhHpcVWpVP1,cplhhHpcVWpVZ1,cplHpcHpcVWpVWp1

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
! External masses 
Mex1 = Mhh 
Mex2 = MHp 
Mex3 = MVWp 


! {Ah, VZ, conj[VWp]}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
ML1 = MAh 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplAhhhVZ
coup2 = -cplAhHpcVWp
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Fu, Fu, Fd}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuhhL(i2,i1)
coup1R = cplcFuFuhhR(i2,i1)
coup2L = cplcFuFdHpL(i1,i3)
coup2R = cplcFuFdHpR(i1,i3)
coup3L = -cplcFdFucVWpR(i3,i2)
coup3R = -cplcFdFucVWpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWp, gWp, gP}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgA)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplcgWpgWphh
coup2 = cplcgWpgAHp
coup3 = cplcgAgWpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {gWp, gWp, gZ}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgZ)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplcgWpgWphh
coup2 = cplcgWpgZHp
coup3 = cplcgZgWpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {gZ, gZ, gWpC}
If ((Include_in_loopgZ).and.(Include_in_loopgZ).and.(Include_in_loopgWC)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZgZhh
coup2 = cplcgZgWCHp
coup3 = cplcgWCgZcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {hh, hh, conj[Hp]}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopHp)) Then 
ML1 = Mhh 
ML2 = Mhh 
ML3 = MHp 
coup1 = cplhhhhhh
coup2 = cplhhHpcHp
coup3 = -cplhhHpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {hh, hh, conj[VWp]}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVWp)) Then 
ML1 = Mhh 
ML2 = Mhh 
ML3 = MVWp 
coup1 = cplhhhhhh
coup2 = -cplhhHpcVWp
coup3 = cplhhcVWpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, Hp, hh}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loophh)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = Mhh 
coup1 = cplhhHpcHp
coup2 = cplhhHpcHp
coup3 = cplhhHpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, hh}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loophh)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = Mhh 
coup1 = -cplhhHpcVWp
coup2 = cplhhHpcHp
coup3 = cplhhcVWpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, Hp, VP}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVP 
coup1 = cplhhHpcHp
coup2 = cplHpcHpVP
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VP}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVP 
coup1 = -cplhhHpcVWp
coup2 = cplHpcHpVP
coup3 = -cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, Hp, VZ}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVZ)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVZ 
coup1 = cplhhHpcHp
coup2 = cplHpcHpVZ
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VZ}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVZ)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = -cplhhHpcVWp
coup2 = cplHpcHpVZ
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, Ah}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopAh)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MAh 
coup1 = -cplhhcHpVWp
coup2 = -cplAhHpcVWp
coup3 = cplAhHpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, hh}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loophh)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = Mhh 
coup1 = -cplhhcHpVWp
coup2 = -cplhhHpcVWp
coup3 = cplhhHpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, hh}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loophh)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = Mhh 
coup1 = cplhhcVWpVWp
coup2 = -cplhhHpcVWp
coup3 = cplhhcVWpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, VP}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVP 
coup1 = -cplhhcHpVWp
coup2 = cplHpcVWpVP
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, VP}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplhhcVWpVWp
coup2 = cplHpcVWpVP
coup3 = -cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, VZ}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVZ)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVZ 
coup1 = -cplhhcHpVWp
coup2 = cplHpcVWpVZ
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, VZ}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVZ)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplhhcVWpVWp
coup2 = cplHpcVWpVZ
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VZ, Ah, conj[Hp]}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopHp)) Then 
ML1 = MVZ 
ML2 = MAh 
ML3 = MHp 
coup1 = cplAhhhVZ
coup2 = cplHpcHpVZ
coup3 = -cplAhHpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ, conj[Hp]}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopHp)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MHp 
coup1 = cplhhVZVZ
coup2 = cplHpcHpVZ
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ, conj[VWp]}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplhhVZVZ
coup2 = cplHpcVWpVZ
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {bar[Fd], bar[Fd], bar[Fu]}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdhhL(i1,i2)
coup1R = cplcFdFdhhR(i1,i2)
coup2L = cplcFuFdHpL(i3,i1)
coup2R = cplcFuFdHpR(i3,i1)
coup3L = cplcFdFucVWpL(i2,i3)
coup3R = cplcFdFucVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fe], bar[Fe], bar[Fv]}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = 0. 
coup1L = cplcFeFehhL(i1,i2)
coup1R = cplcFeFehhR(i1,i2)
coup2L = cplcFvFeHpL(i3,i1)
coup2R = cplcFvFeHpR(i3,i1)
coup3L = cplcFeFvcVWpL(i2,i3)
coup3R = cplcFeFvcVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[gWpC], bar[gWpC], bar[gZ]}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgZ)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplcgWCgWChh
coup2 = cplcgZgWCHp
coup3 = cplcgWCgZcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZ], bar[gP], bar[gWp]}
If ((Include_in_loopgZ).and.(Include_in_loopgA).and.(Include_in_loopgWp)) Then 
ML1 = MVZ 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplcgZgAhh
coup2 = cplcgWpgZHp
coup3 = cplcgAgWpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZ], bar[gZ], bar[gWp]}
If ((Include_in_loopgZ).and.(Include_in_loopgZ).and.(Include_in_loopgWp)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZgZhh
coup2 = cplcgWpgZHp
coup3 = cplcgZgWpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Ah, VZ}
If ((Include_in_loopAh).and.(Include_in_loopVZ)) Then 
ML1 = MAh 
ML2 = MVZ 
coup1 = -cplAhhhVZ
coup2 = cplAhHpcVWpVZ1
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWp
coup2 = cplHpcHpcVWpVWp1
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {hh, conj[VWp]}
If ((Include_in_loophh).and.(Include_in_loopVWp)) Then 
ML1 = Mhh 
ML2 = MVWp 
coup1 = cplhhhhcVWpVWp1
coup2 = -cplhhHpcVWp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 


! {Hp, VP}
If ((Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MVP 
coup1 = cplhhHpcVWpVP1
coup2 = cplHpcHpVP
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 


! {Hp, VZ}
If ((Include_in_loopHp).and.(Include_in_loopVZ)) Then 
ML1 = MHp 
ML2 = MVZ 
coup1 = cplhhHpcVWpVZ1
coup2 = cplHpcHpVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToHpcVWp


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhToHpcVWp(MAh,MFd,MFe,             & 
& MFu,Mhh,MHp,MVP,MVWp,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,cplAhhhVZ,      & 
& cplAhHpcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFeFehhL,               & 
& cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucVWpL,             & 
& cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgZgAhh,cplcgWpgAHp,cplcgWpgWphh,         & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWChh,cplcgZgWCHp,cplcgZgZhh,cplcgWpgZHp,           & 
& cplcgWCgZcVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,               & 
& cplhhVZVZ,cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZ,cplHpcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,     & 
& cplAhHpcVWpVZ1,cplhhhhcVWpVWp1,cplhhHpcVWpVP1,cplhhHpcVWpVZ1,cplHpcHpcVWpVWp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh,MHp,MVP,MVWp,MVZ,MAh2,MFd2(3),MFe2(3),MFu2(3),           & 
& Mhh2,MHp2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhhhVZ,cplAhHpcVWp,cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFuFdHpL(3,3),             & 
& cplcFuFdHpR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFvFeHpL(3,3),cplcFvFeHpR(3,3),  & 
& cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),               & 
& cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplcgZgAhh,cplcgWpgAHp,cplcgWpgWphh,             & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWChh,cplcgZgWCHp,cplcgZgZhh,cplcgWpgZHp,           & 
& cplcgWCgZcVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,               & 
& cplhhVZVZ,cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZ,cplHpcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,     & 
& cplAhHpcVWpVZ1,cplhhhhcVWpVWp1,cplhhHpcVWpVP1,cplhhHpcVWpVZ1,cplHpcHpcVWpVWp1

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
Mex1 = Mhh 
Mex2 = MHp 
Mex3 = MVWp 


! {Hp, Hp, VP}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVP 
coup1 = cplhhHpcHp
coup2 = cplHpcHpVP
coup3 = cplHpcVWpVP
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VP}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVP 
coup1 = -cplhhHpcVWp
coup2 = cplHpcHpVP
coup3 = -cplcVWpVPVWp
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, VP}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVP 
coup1 = -cplhhcHpVWp
coup2 = cplHpcVWpVP
coup3 = cplHpcVWpVP
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, VP}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplhhcVWpVWp
coup2 = cplHpcVWpVP
coup3 = -cplcVWpVPVWp
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VP}
If ((Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MVP 
coup1 = cplhhHpcVWpVP1
coup2 = cplHpcHpVP
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhToHpcVWp


Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_hhTossss(cplhhssss,Mhh,Mss,              & 
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
Mex1 = Mhh 
Mex2 = Mss 
Mex3 = Mss 
! Tree-Level Vertex 
coupT1 = cplhhssss
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp = AmpC 
End Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_hhTossss


Subroutine Gamma_Real_SimplifiedDMSSSFDM_hhTossss(MLambda,em,gs,cplhhssss,            & 
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
Mex1 = Mhh
Mex2 = Mss
Mex3 = Mss
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton = 0._dp 
  GammarealGluon = 0._dp 
Else 
  GammarealGluon = 0._dp 
  GammarealPhoton = 0._dp 

End if 
End Subroutine Gamma_Real_SimplifiedDMSSSFDM_hhTossss


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhTossss(cplhhssss,ctcplhhssss,          & 
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
Mex1 = Mhh 
Mex2 = Mss 
Mex3 = Mss 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhssss 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh*cplhhssss


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfss*cplhhssss


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfss*cplhhssss


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp = AmpC 
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhTossss


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTossss(MAh,MFe,MFre,Mhh,             & 
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
Mex1 = Mhh 
Mex2 = Mss 
Mex3 = Mss 


! {Fe, Fe, Fre}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFre)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFre 
coup1L = cplcFeFehhL(i2,i1)
coup1R = cplcFeFehhR(i2,i1)
coup2L = cplcFeFressL(i1)
coup2R = cplcFeFressR(i1)
coup3L = cplcFreFessL(i2)
coup3R = cplcFreFessR(i2)
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


! {hh, hh, ss}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopss)) Then 
ML1 = Mhh 
ML2 = Mhh 
ML3 = Mss 
coup1 = cplhhhhhh
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


! {ss, ss, hh}
If ((Include_in_loopss).and.(Include_in_loopss).and.(Include_in_loophh)) Then 
ML1 = Mss 
ML2 = Mss 
ML3 = Mhh 
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


! {bar[Fe], bar[Fe], bar[Fre]}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFre)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFre 
coup1L = cplcFeFehhL(i1,i2)
coup1R = cplcFeFehhR(i1,i2)
coup2L = cplcFreFessL(i1)
coup2R = cplcFreFessR(i1)
coup3L = cplcFeFressL(i2)
coup3R = cplcFeFressR(i2)
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


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhh
coup2 = cplAhAhssss1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
ML1 = Mhh 
ML2 = Mhh 
coup1 = cplhhhhhh
coup2 = cplhhhhssss1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
coup1 = cplhhHpcHp
coup2 = cplHpsssscHp1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {ss, ss}
If ((Include_in_loopss).and.(Include_in_loopss)) Then 
ML1 = Mss 
ML2 = Mss 
coup1 = cplhhssss
coup2 = cplssssssss1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 
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


! {hh, ss}
If ((Include_in_loophh).and.(Include_in_loopss)) Then 
ML1 = Mhh 
ML2 = Mss 
coup1 = cplhhhhssss1
coup2 = cplhhssss
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

End if 
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTossss


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTossss(MAh,MFe,MFre,              & 
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
Mex1 = Mhh 
Mex2 = Mss 
Mex3 = Mss 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTossss


Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_hhTocVWpVWp(cplhhcVWpVWp,Mhh,            & 
& MVWp,Mhh2,MVWp2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh,MVWp,Mhh2,MVWp2

Complex(dp), Intent(in) :: cplhhcVWpVWp

Complex(dp) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

! External masses 
Mex1 = Mhh 
Mex2 = MVWp 
Mex3 = MVWp 
! Tree-Level Vertex 
coupT1 = cplhhcVWpVWp
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:) = AmpC 
End Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_hhTocVWpVWp


Subroutine Gamma_Real_SimplifiedDMSSSFDM_hhTocVWpVWp(MLambda,em,gs,cplhhcVWpVWp,      & 
& Mhh,MVWp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhcVWpVWp

Real(dp), Intent(in) :: Mhh,MVWp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton, GammarealGluon 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Coup = cplhhcVWpVWp
Mex1 = Mhh
Mex2 = MVWp
Mex3 = MVWp
If (Mex1.gt.(Mex2+Mex3)) Then 
  GammarealGluon = 0._dp 
 Call hardphotonSVV(Mex1,Mex2,Mex3,MLambda,em,0._dp,-1._dp,1._dp,Coup,Gammarealphoton,kont)
Else 
  GammarealGluon = 0._dp 
  GammarealPhoton = 0._dp 

End if 
End Subroutine Gamma_Real_SimplifiedDMSSSFDM_hhTocVWpVWp


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhTocVWpVWp(cplhhcVWpVWp,ctcplhhcVWpVWp, & 
& Mhh,Mhh2,MVWp,MVWp2,Zfhh,ZfVWp,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh,Mhh2,MVWp,MVWp2

Complex(dp), Intent(in) :: cplhhcVWpVWp

Complex(dp), Intent(in) :: ctcplhhcVWpVWp

Complex(dp), Intent(in) :: Zfhh,ZfVWp

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = Mhh 
Mex2 = MVWp 
Mex3 = MVWp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhcVWpVWp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh*cplhhcVWpVWp


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfVWp)*cplhhcVWpVWp


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVWp*cplhhcVWpVWp


! Getting the amplitude 
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:) = AmpC 
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhTocVWpVWp


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTocVWpVWp(MAh,MFd,MFe,               & 
& MFu,Mhh,MHp,MVP,MVWp,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,cplAhAhhh,      & 
& cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdVWpL,cplcFuFdVWpR,   & 
& cplcFeFehhL,cplcFeFehhR,cplcFvFeVWpL,cplcFvFeVWpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgZgAhh,cplcgWpgAVWp,       & 
& cplcgWCgAcVWp,cplcgWpgWphh,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWChh,cplcgAgWCVWp,      & 
& cplcgZgWCVWp,cplcgZgZhh,cplcgWpgZVWp,cplcgWCgZcVWp,cplhhhhhh,cplhhHpcHp,               & 
& cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplHpcVWpVP,cplHpcVWpVZ,cplcHpVPVWp,    & 
& cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,cplAhAhcVWpVWp1,cplhhhhcVWpVWp1,cplhhHpcVWpVP1,  & 
& cplhhHpcVWpVZ1,cplhhcHpVPVWp1,cplhhcHpVWpVZ1,cplHpcHpcVWpVWp1,cplcVWpcVWpVWpVWp1Q,     & 
& cplcVWpcVWpVWpVWp2Q,cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,             & 
& cplcVWpVWpVZVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh,MHp,MVP,MVWp,MVZ,MAh2,MFd2(3),MFe2(3),MFu2(3),           & 
& Mhh2,MHp2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh,cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),        & 
& cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFvFeVWpL(3,3),& 
& cplcFvFeVWpR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),& 
& cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplcgZgAhh,cplcgWpgAVWp,cplcgWCgAcVWp,           & 
& cplcgWpgWphh,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWChh,cplcgAgWCVWp,cplcgZgWCVWp,       & 
& cplcgZgZhh,cplcgWpgZVWp,cplcgWCgZcVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,    & 
& cplhhcVWpVWp,cplhhVZVZ,cplHpcVWpVP,cplHpcVWpVZ,cplcHpVPVWp,cplcVWpVPVWp,               & 
& cplcHpVWpVZ,cplcVWpVWpVZ,cplAhAhcVWpVWp1,cplhhhhcVWpVWp1,cplhhHpcVWpVP1,               & 
& cplhhHpcVWpVZ1,cplhhcHpVPVWp1,cplhhcHpVWpVZ1,cplHpcHpcVWpVWp1,cplcVWpcVWpVWpVWp1Q,     & 
& cplcVWpcVWpVWpVWp2Q,cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,             & 
& cplcVWpVWpVZVZ1Q

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
! External masses 
Mex1 = Mhh 
Mex2 = MVWp 
Mex3 = MVWp 


! {Ah, Ah, Hp}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopHp)) Then 
ML1 = MAh 
ML2 = MAh 
ML3 = MHp 
coup1 = cplAhAhhh
coup2 = cplAhHpcVWp
coup3 = -cplAhcHpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Ah, VZ, Hp}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopHp)) Then 
ML1 = MAh 
ML2 = MVZ 
ML3 = MHp 
coup1 = -cplAhhhVZ
coup2 = cplAhHpcVWp
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Fd, Fd, Fu}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdhhL(i2,i1)
coup1R = cplcFdFdhhR(i2,i1)
coup2L = -cplcFdFucVWpR(i1,i3)
coup2R = -cplcFdFucVWpL(i1,i3)
coup3L = -cplcFuFdVWpR(i3,i2)
coup3R = -cplcFuFdVWpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fv}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = 0. 
coup1L = cplcFeFehhL(i2,i1)
coup1R = cplcFeFehhR(i2,i1)
coup2L = -cplcFeFvcVWpR(i1,i3)
coup2R = -cplcFeFvcVWpL(i1,i3)
coup3L = -cplcFvFeVWpR(i3,i2)
coup3R = -cplcFvFeVWpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gP, gZ, gWp}
If ((Include_in_loopgA).and.(Include_in_loopgZ).and.(Include_in_loopgWp)) Then 
ML1 = MVP 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZgAhh
coup2 = cplcgAgWpcVWp
coup3 = cplcgWpgZVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {gWpC, gWpC, gP}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgA)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplcgWCgWChh
coup2 = cplcgWCgAcVWp
coup3 = cplcgAgWCVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {gWpC, gWpC, gZ}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgZ)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplcgWCgWChh
coup2 = cplcgWCgZcVWp
coup3 = cplcgZgWCVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {gZ, gZ, gWp}
If ((Include_in_loopgZ).and.(Include_in_loopgZ).and.(Include_in_loopgWp)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZgZhh
coup2 = cplcgZgWpcVWp
coup3 = cplcgWpgZVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {hh, hh, Hp}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopHp)) Then 
ML1 = Mhh 
ML2 = Mhh 
ML3 = MHp 
coup1 = cplhhhhhh
coup2 = cplhhHpcVWp
coup3 = -cplhhcHpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {hh, hh, VWp}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVWp)) Then 
ML1 = Mhh 
ML2 = Mhh 
ML3 = MVWp 
coup1 = cplhhhhhh
coup2 = cplhhcVWpVWp
coup3 = cplhhcVWpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VZ, Ah, Hp}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopHp)) Then 
ML1 = MVZ 
ML2 = MAh 
ML3 = MHp 
coup1 = -cplAhhhVZ
coup2 = cplHpcVWpVZ
coup3 = -cplAhcHpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ, Hp}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopHp)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MHp 
coup1 = cplhhVZVZ
coup2 = cplHpcVWpVZ
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ, VWp}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplhhVZVZ
coup2 = cplcVWpVWpVZ
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {bar[Fu], bar[Fu], bar[Fd]}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuhhL(i1,i2)
coup1R = cplcFuFuhhR(i1,i2)
coup2L = cplcFdFucVWpL(i3,i1)
coup2R = cplcFdFucVWpR(i3,i1)
coup3L = cplcFuFdVWpL(i2,i3)
coup3R = cplcFuFdVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[gWp], bar[gWp], bar[gP]}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgA)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplcgWpgWphh
coup2 = cplcgAgWpcVWp
coup3 = cplcgWpgAVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {bar[gWp], bar[gWp], bar[gZ]}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgZ)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplcgWpgWphh
coup2 = cplcgZgWpcVWp
coup3 = cplcgWpgZVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZ], bar[gP], bar[gWpC]}
If ((Include_in_loopgZ).and.(Include_in_loopgA).and.(Include_in_loopgWC)) Then 
ML1 = MVZ 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplcgZgAhh
coup2 = cplcgWCgZcVWp
coup3 = cplcgAgWCVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZ], bar[gZ], bar[gWpC]}
If ((Include_in_loopgZ).and.(Include_in_loopgZ).and.(Include_in_loopgWC)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZgZhh
coup2 = cplcgWCgZcVWp
coup3 = cplcgZgWCVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], Ah}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopAh)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MAh 
coup1 = cplhhHpcHp
coup2 = -cplAhHpcVWp
coup3 = cplAhcHpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], hh}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loophh)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = Mhh 
coup1 = cplhhHpcHp
coup2 = -cplhhHpcVWp
coup3 = cplhhcHpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], hh}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loophh)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = Mhh 
coup1 = cplhhcHpVWp
coup2 = -cplhhHpcVWp
coup3 = cplhhcVWpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], VP}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVP 
coup1 = cplhhHpcHp
coup2 = cplHpcVWpVP
coup3 = cplcHpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], VP}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplhhcHpVWp
coup2 = cplHpcVWpVP
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], VZ}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVZ)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVZ 
coup1 = cplhhHpcHp
coup2 = cplHpcVWpVZ
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], VZ}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVZ)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplhhcHpVWp
coup2 = cplHpcVWpVZ
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], hh}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loophh)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = Mhh 
coup1 = cplhhHpcVWp
coup2 = cplhhcVWpVWp
coup3 = cplhhcHpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], hh}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loophh)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = Mhh 
coup1 = cplhhcVWpVWp
coup2 = cplhhcVWpVWp
coup3 = cplhhcVWpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], VP}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVP 
coup1 = cplhhHpcVWp
coup2 = cplcVWpVPVWp
coup3 = cplcHpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], VP}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplhhcVWpVWp
coup2 = cplcVWpVPVWp
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], VZ}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVZ)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVZ 
coup1 = cplhhHpcVWp
coup2 = -cplcVWpVWpVZ
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], VZ}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVZ)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplhhcVWpVWp
coup2 = -cplcVWpVWpVZ
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhh
coup2 = cplAhAhcVWpVWp1
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
ML1 = Mhh 
ML2 = Mhh 
coup1 = cplhhhhhh
coup2 = cplhhhhcVWpVWp1
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
coup1 = cplhhHpcHp
coup2 = cplHpcHpcVWpVWp1
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhcVWpVWp
coup2 = cplcVWpcVWpVWpVWp1Q
coup2b = coup2 
coup2 = cplcVWpcVWpVWpVWp2Q
coup2a = coup2 
coup2 = cplcVWpcVWpVWpVWp3Q
coup2c = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhVZVZ
coup2 = cplcVWpVWpVZVZ1Q
coup2a = coup2 
coup2 = cplcVWpVWpVZVZ2Q
coup2b = coup2 
coup2 = cplcVWpVWpVZVZ3Q
coup2c = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {hh, VWp}
If ((Include_in_loophh).and.(Include_in_loopVWp)) Then 
ML1 = Mhh 
ML2 = MVWp 
coup1 = cplhhhhcVWpVWp1
coup2 = cplhhcVWpVWp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 


! {VP, Hp}
If ((Include_in_loopVP).and.(Include_in_loopHp)) Then 
ML1 = MVP 
ML2 = MHp 
coup1 = cplhhcHpVPVWp1
coup2 = cplHpcVWpVP
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 


! {VZ, Hp}
If ((Include_in_loopVZ).and.(Include_in_loopHp)) Then 
ML1 = MVZ 
ML2 = MHp 
coup1 = cplhhcHpVWpVZ1
coup2 = cplHpcVWpVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 


! {hh, conj[VWp]}
If ((Include_in_loophh).and.(Include_in_loopVWp)) Then 
ML1 = Mhh 
ML2 = MVWp 
coup1 = cplhhhhcVWpVWp1
coup2 = cplhhcVWpVWp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 


! {Hp, VP}
If ((Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MVP 
coup1 = cplhhHpcVWpVP1
coup2 = cplcHpVPVWp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 


! {Hp, VZ}
If ((Include_in_loopHp).and.(Include_in_loopVZ)) Then 
ML1 = MHp 
ML2 = MVZ 
coup1 = cplhhHpcVWpVZ1
coup2 = cplcHpVWpVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTocVWpVWp


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocVWpVWp(MAh,MFd,MFe,            & 
& MFu,Mhh,MHp,MVP,MVWp,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,cplAhAhhh,      & 
& cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdVWpL,cplcFuFdVWpR,   & 
& cplcFeFehhL,cplcFeFehhR,cplcFvFeVWpL,cplcFvFeVWpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgZgAhh,cplcgWpgAVWp,       & 
& cplcgWCgAcVWp,cplcgWpgWphh,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWChh,cplcgAgWCVWp,      & 
& cplcgZgWCVWp,cplcgZgZhh,cplcgWpgZVWp,cplcgWCgZcVWp,cplhhhhhh,cplhhHpcHp,               & 
& cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplHpcVWpVP,cplHpcVWpVZ,cplcHpVPVWp,    & 
& cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,cplAhAhcVWpVWp1,cplhhhhcVWpVWp1,cplhhHpcVWpVP1,  & 
& cplhhHpcVWpVZ1,cplhhcHpVPVWp1,cplhhcHpVWpVZ1,cplHpcHpcVWpVWp1,cplcVWpcVWpVWpVWp1Q,     & 
& cplcVWpcVWpVWpVWp2Q,cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,             & 
& cplcVWpVWpVZVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh,MHp,MVP,MVWp,MVZ,MAh2,MFd2(3),MFe2(3),MFu2(3),           & 
& Mhh2,MHp2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh,cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),        & 
& cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFvFeVWpL(3,3),& 
& cplcFvFeVWpR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),& 
& cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplcgZgAhh,cplcgWpgAVWp,cplcgWCgAcVWp,           & 
& cplcgWpgWphh,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWChh,cplcgAgWCVWp,cplcgZgWCVWp,       & 
& cplcgZgZhh,cplcgWpgZVWp,cplcgWCgZcVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,    & 
& cplhhcVWpVWp,cplhhVZVZ,cplHpcVWpVP,cplHpcVWpVZ,cplcHpVPVWp,cplcVWpVPVWp,               & 
& cplcHpVWpVZ,cplcVWpVWpVZ,cplAhAhcVWpVWp1,cplhhhhcVWpVWp1,cplhhHpcVWpVP1,               & 
& cplhhHpcVWpVZ1,cplhhcHpVPVWp1,cplhhcHpVWpVZ1,cplHpcHpcVWpVWp1,cplcVWpcVWpVWpVWp1Q,     & 
& cplcVWpcVWpVWpVWp2Q,cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,             & 
& cplcVWpVWpVZVZ1Q

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
Mex1 = Mhh 
Mex2 = MVWp 
Mex3 = MVWp 


! {conj[Hp], conj[Hp], VP}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVP 
coup1 = cplhhHpcHp
coup2 = cplHpcVWpVP
coup3 = cplcHpVPVWp
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], VP}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplhhcHpVWp
coup2 = cplHpcVWpVP
coup3 = cplcVWpVPVWp
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], VP}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVP 
coup1 = cplhhHpcVWp
coup2 = cplcVWpVPVWp
coup3 = cplcHpVPVWp
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], VP}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplhhcVWpVWp
coup2 = cplcVWpVPVWp
coup3 = cplcVWpVPVWp
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VP, Hp}
If ((Include_in_loopVP).and.(Include_in_loopHp)) Then 
ML1 = MVP 
ML2 = MHp 
coup1 = cplhhcHpVPVWp1
coup2 = cplHpcVWpVP
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 


! {Hp, VP}
If ((Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MVP 
coup1 = cplhhHpcVWpVP1
coup2 = cplcHpVPVWp
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocVWpVWp


Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_hhToVZVZ(cplhhVZVZ,Mhh,MVZ,              & 
& Mhh2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh,MVZ,Mhh2,MVZ2

Complex(dp), Intent(in) :: cplhhVZVZ

Complex(dp) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

! External masses 
Mex1 = Mhh 
Mex2 = MVZ 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1 = cplhhVZVZ
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:) = AmpC 
End Subroutine Amplitude_Tree_SimplifiedDMSSSFDM_hhToVZVZ


Subroutine Gamma_Real_SimplifiedDMSSSFDM_hhToVZVZ(MLambda,em,gs,cplhhVZVZ,            & 
& Mhh,MVZ,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhVZVZ

Real(dp), Intent(in) :: Mhh,MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton, GammarealGluon 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Coup = cplhhVZVZ
Mex1 = Mhh
Mex2 = MVZ
Mex3 = MVZ
If (Mex1.gt.(Mex2+Mex3)) Then 
  GammarealGluon = 0._dp 
 Gammarealphoton = 0._dp 
Else 
  GammarealGluon = 0._dp 
  GammarealPhoton = 0._dp 

End if 
End Subroutine Gamma_Real_SimplifiedDMSSSFDM_hhToVZVZ


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhToVZVZ(cplhhVZVZ,ctcplhhVZVZ,          & 
& Mhh,Mhh2,MVZ,MVZ2,Zfhh,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh,Mhh2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplhhVZVZ

Complex(dp), Intent(in) :: ctcplhhVZVZ

Complex(dp), Intent(in) :: Zfhh,ZfVZ

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = Mhh 
Mex2 = MVZ 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhVZVZ 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh*cplhhVZVZ


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cplhhVZVZ


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cplhhVZVZ


! Getting the amplitude 
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:) = AmpC 
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhToVZVZ


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToVZVZ(MAh,MFd,MFe,MFu,              & 
& Mhh,MHp,MVWp,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,MVWp2,MVZ2,cplAhAhhh,cplAhhhVZ,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHpcHp,              & 
& cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,     & 
& cplcVWpVWpVZ,cplAhAhVZVZ1,cplhhhhVZVZ1,cplhhHpcVWpVZ1,cplhhcHpVWpVZ1,cplHpcHpVZVZ1,    & 
& cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh,MHp,MVWp,MVZ,MAh2,MFd2(3),MFe2(3),MFu2(3),               & 
& Mhh2,MHp2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh,cplAhhhVZ,cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVZL(3,3),               & 
& cplcFdFdVZR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),  & 
& cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWpgWphh,      & 
& cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,               & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,    & 
& cplAhAhVZVZ1,cplhhhhVZVZ1,cplhhHpcVWpVZ1,cplhhcHpVWpVZ1,cplHpcHpVZVZ1,cplcVWpVWpVZVZ2Q,& 
& cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
! External masses 
Mex1 = Mhh 
Mex2 = MVZ 
Mex3 = MVZ 


! {Ah, Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh 
coup1 = cplAhAhhh
coup2 = cplAhhhVZ
coup3 = -cplAhhhVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Ah, VZ, hh}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
ML1 = MAh 
ML2 = MVZ 
ML3 = Mhh 
coup1 = -cplAhhhVZ
coup2 = cplAhhhVZ
coup3 = cplhhVZVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1)
coup1R = cplcFdFdhhR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1)
coup1R = cplcFeFehhR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1)
coup1R = cplcFuFuhhR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWp, gWp, gWp}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh
coup2 = cplcgWpgWpVZ
coup3 = cplcgWpgWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
End if 


! {gWpC, gWpC, gWpC}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh
coup2 = cplcgWCgWCVZ
coup3 = cplcgWCgWCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
End if 


! {hh, hh, Ah}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
ML1 = Mhh 
ML2 = Mhh 
ML3 = MAh 
coup1 = cplhhhhhh
coup2 = -cplAhhhVZ
coup3 = cplAhhhVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {hh, hh, VZ}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
ML1 = Mhh 
ML2 = Mhh 
ML3 = MVZ 
coup1 = cplhhhhhh
coup2 = cplhhVZVZ
coup3 = cplhhVZVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhHpcHp
coup2 = -cplHpcHpVZ
coup3 = -cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
End if 


! {Hp, VWp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhHpcVWp
coup2 = -cplHpcHpVZ
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp
coup2 = cplcHpVWpVZ
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhHpcVWp
coup2 = cplcHpVWpVZ
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhcHpVWp
coup2 = cplHpcVWpVZ
coup3 = -cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp
coup2 = cplHpcVWpVZ
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhcHpVWp
coup2 = -cplcVWpVWpVZ
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcVWpVWp
coup2 = -cplcVWpVWpVZ
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
End if 


! {VZ, Ah, hh}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
ML1 = MVZ 
ML2 = MAh 
ML3 = Mhh 
coup1 = -cplAhhhVZ
coup2 = cplhhVZVZ
coup3 = -cplAhhhVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = Mhh 
coup1 = cplhhVZVZ
coup2 = cplhhVZVZ
coup3 = cplhhVZVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[Hp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcHpVWp
coup2 = cplHpcHpVZ
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp
coup2 = cplHpcVWpVZ
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcHpVWp
coup2 = cplHpcVWpVZ
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhHpcVWp
coup2 = cplcHpVWpVZ
coup3 = cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp
coup2 = cplcHpVWpVZ
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[VWp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcVWp
coup2 = cplcVWpVWpVZ
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhh
coup2 = cplAhAhVZVZ1
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
ML1 = Mhh 
ML2 = Mhh 
coup1 = cplhhhhhh
coup2 = cplhhhhVZVZ1
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
coup1 = cplhhHpcHp
coup2 = cplHpcHpVZVZ1
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhcVWpVWp
coup2 = cplcVWpVWpVZVZ1Q
coup2a = coup2 
coup2 = cplcVWpVWpVZVZ2Q
coup2b = coup2 
coup2 = cplcVWpVWpVZVZ3Q
coup2c = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {hh, VZ}
If ((Include_in_loophh).and.(Include_in_loopVZ)) Then 
ML1 = Mhh 
ML2 = MVZ 
coup1 = cplhhhhVZVZ1
coup2 = cplhhVZVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVZ1
coup2 = cplcHpVWpVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVWpVZ1
coup2 = cplHpcVWpVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 


! {hh, VZ}
If ((Include_in_loophh).and.(Include_in_loopVZ)) Then 
ML1 = Mhh 
ML2 = MVZ 
coup1 = cplhhhhVZVZ1
coup2 = cplhhVZVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVZ1
coup2 = cplcHpVWpVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVWpVZ1
coup2 = cplHpcVWpVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToVZVZ


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhToVZVZ(MAh,MFd,MFe,               & 
& MFu,Mhh,MHp,MVWp,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,MVWp2,MVZ2,cplAhAhhh,               & 
& cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,     & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHpcHp,              & 
& cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,     & 
& cplcVWpVWpVZ,cplAhAhVZVZ1,cplhhhhVZVZ1,cplhhHpcVWpVZ1,cplhhcHpVWpVZ1,cplHpcHpVZVZ1,    & 
& cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh,MHp,MVWp,MVZ,MAh2,MFd2(3),MFe2(3),MFu2(3),               & 
& Mhh2,MHp2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh,cplAhhhVZ,cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVZL(3,3),               & 
& cplcFdFdVZR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),  & 
& cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWpgWphh,      & 
& cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,               & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,    & 
& cplAhAhVZVZ1,cplhhhhVZVZ1,cplhhHpcVWpVZ1,cplhhcHpVWpVZ1,cplHpcHpVZVZ1,cplcVWpVWpVZVZ2Q,& 
& cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q

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
Mex1 = Mhh 
Mex2 = MVZ 
Mex3 = MVZ 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhToVZVZ


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhToAhhh(MAh,MAh2,Mhh,Mhh2,              & 
& ZfAh,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MAh2,Mhh,Mhh2

Complex(dp), Intent(in) :: ZfAh,Zfhh

Complex(dp), Intent(out) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = Mhh 
Mex2 = MAh 
Mex3 = Mhh 
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
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhToAhhh


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToAhhh(MAh,MFd,MFe,MFu,              & 
& Mhh,MHp,MVWp,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,MVWp2,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,             & 
& cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,cplhhHpcHp,cplhhHpcVWp,              & 
& cplhhcHpVWp,cplhhcVWpVWp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh,MHp,MVWp,MAh2,MFd2(3),MFe2(3),MFu2(3),Mhh2,              & 
& MHp2,MVWp2

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3), & 
& cplcFuFuAhR(3,3),cplcgWpgWpAh,cplcgWCgWCAh,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL(3,3),   & 
& cplcFdFdhhR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),  & 
& cplcgWpgWphh,cplcgWCgWChh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp

Complex(dp), Intent(out) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp = 0._dp 
! External masses 
Mex1 = Mhh 
Mex2 = MAh 
Mex3 = Mhh 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1)
coup1R = cplcFdFdhhR(i2,i1)
coup2L = cplcFdFdAhL(i1,i3)
coup2R = cplcFdFdAhR(i1,i3)
coup3L = cplcFdFdhhL(i3,i2)
coup3R = cplcFdFdhhR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1)
coup1R = cplcFeFehhR(i2,i1)
coup2L = cplcFeFeAhL(i1,i3)
coup2R = cplcFeFeAhR(i1,i3)
coup3L = cplcFeFehhL(i3,i2)
coup3R = cplcFeFehhR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1)
coup1R = cplcFuFuhhR(i2,i1)
coup2L = cplcFuFuAhL(i1,i3)
coup2R = cplcFuFuAhR(i1,i3)
coup3L = cplcFuFuhhL(i3,i2)
coup3R = cplcFuFuhhR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWp, gWp, gWp}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh
coup2 = cplcgWpgWpAh
coup3 = cplcgWpgWphh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(2)*AmpC 
End if 


! {gWpC, gWpC, gWpC}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh
coup2 = cplcgWCgWCAh
coup3 = cplcgWCgWChh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(2)*AmpC 
End if 


! {Hp, Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp
coup2 = -cplAhcHpVWp
coup3 = cplhhHpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhHpcVWp
coup2 = -cplAhcHpVWp
coup3 = cplhhcVWpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = -cplhhcHpVWp
coup2 = -cplAhHpcVWp
coup3 = cplhhHpcHp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp
coup2 = -cplAhHpcVWp
coup3 = cplhhcHpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp
coup2 = -cplAhHpcVWp
coup3 = cplhhcHpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhcHpVWp
coup2 = -cplAhHpcVWp
coup3 = cplhhcVWpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = -cplhhHpcVWp
coup2 = -cplAhcHpVWp
coup3 = cplhhHpcHp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp
coup2 = -cplAhcHpVWp
coup3 = cplhhHpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End if 
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToAhhh


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhToAhhh(MAh,MFd,MFe,               & 
& MFu,Mhh,MHp,MVWp,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,MVWp2,cplcFdFdAhL,cplcFdFdAhR,          & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,             & 
& cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,cplhhHpcHp,cplhhHpcVWp,              & 
& cplhhcHpVWp,cplhhcVWpVWp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh,MHp,MVWp,MAh2,MFd2(3),MFe2(3),MFu2(3),Mhh2,              & 
& MHp2,MVWp2

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3), & 
& cplcFuFuAhR(3,3),cplcgWpgWpAh,cplcgWCgWCAh,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL(3,3),   & 
& cplcFdFdhhR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),  & 
& cplcgWpgWphh,cplcgWCgWChh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp

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
Mex1 = Mhh 
Mex2 = MAh 
Mex3 = Mhh 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhToAhhh


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhToAhVP(cplAhhhVZ,ctcplAhhhVZ,          & 
& MAh,MAh2,Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,ZfAh,Zfhh,ZfVP,ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MAh2,Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhhhVZ

Complex(dp), Intent(in) :: ctcplAhhhVZ

Complex(dp), Intent(in) :: ZfAh,Zfhh,ZfVP,ZfVZVP

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = Mhh 
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
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZVP*cplAhhhVZ


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:) = AmpC 
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhToAhVP


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToAhVP(MAh,MFd,MFe,MFu,              & 
& Mhh,MHp,MVP,MVWp,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,MVP2,MVWp2,cplcFdFdAhL,cplcFdFdAhR,     & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,             & 
& cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,cplcgWCgWCVP,           & 
& cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,    & 
& cplcVWpVPVWp,cplAhHpcVWpVP1,cplAhcHpVPVWp1,cplhhHpcVWpVP1,cplhhcHpVPVWp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh,MHp,MVP,MVWp,MAh2,MFd2(3),MFe2(3),MFu2(3),               & 
& Mhh2,MHp2,MVP2,MVWp2

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3), & 
& cplcFuFuAhR(3,3),cplcgWpgWpAh,cplcgWCgWCAh,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL(3,3),   & 
& cplcFdFdhhR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),  & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFuFuVPL(3,3),  & 
& cplcFuFuVPR(3,3),cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,cplcgWCgWCVP,cplhhHpcHp,       & 
& cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,               & 
& cplcVWpVPVWp,cplAhHpcVWpVP1,cplAhcHpVPVWp1,cplhhHpcVWpVP1,cplhhcHpVPVWp1

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
! External masses 
Mex1 = Mhh 
Mex2 = MAh 
Mex3 = MVP 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1)
coup1R = cplcFdFdhhR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1)
coup1R = cplcFeFehhR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1)
coup1R = cplcFuFuhhR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWp, gWp, gWp}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh
coup2 = cplcgWpgWpAh
coup3 = cplcgWpgWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
End if 


! {gWpC, gWpC, gWpC}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh
coup2 = cplcgWCgWCAh
coup3 = cplcgWCgWCVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
End if 


! {Hp, Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp
coup2 = cplAhcHpVWp
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhHpcVWp
coup2 = cplAhcHpVWp
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = -cplhhcHpVWp
coup2 = cplAhHpcVWp
coup3 = -cplHpcHpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp
coup2 = cplAhHpcVWp
coup3 = cplcHpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp
coup2 = cplAhHpcVWp
coup3 = cplcHpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhcHpVWp
coup2 = cplAhHpcVWp
coup3 = -cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = -cplhhHpcVWp
coup2 = cplAhcHpVWp
coup3 = cplHpcHpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp
coup2 = cplAhcHpVWp
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWp
coup2 = cplAhcHpVPVWp1
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVWp
coup2 = cplAhHpcVWpVP1
Call Amp_VERTEX_StoSV_Topology2_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVP1
coup2 = cplAhcHpVWp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVPVWp1
coup2 = cplAhHpcVWp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToAhVP


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhToAhVP(MAh,MFd,MFe,               & 
& MFu,Mhh,MHp,MVP,MVWp,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,MVP2,MVWp2,cplcFdFdAhL,             & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,              & 
& cplcgWCgWCAh,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,            & 
& cplcgWCgWCVP,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVP,               & 
& cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,cplAhHpcVWpVP1,cplAhcHpVPVWp1,cplhhHpcVWpVP1,     & 
& cplhhcHpVPVWp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh,MHp,MVP,MVWp,MAh2,MFd2(3),MFe2(3),MFu2(3),               & 
& Mhh2,MHp2,MVP2,MVWp2

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3), & 
& cplcFuFuAhR(3,3),cplcgWpgWpAh,cplcgWCgWCAh,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL(3,3),   & 
& cplcFdFdhhR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),  & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFuFuVPL(3,3),  & 
& cplcFuFuVPR(3,3),cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,cplcgWCgWCVP,cplhhHpcHp,       & 
& cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,               & 
& cplcVWpVPVWp,cplAhHpcVWpVP1,cplAhcHpVPVWp1,cplhhHpcVWpVP1,cplhhcHpVPVWp1

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
Mex1 = Mhh 
Mex2 = MAh 
Mex3 = MVP 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhToAhVP


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhToFrecFre(MFre,MFre2,Mhh,              & 
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
Mex1 = Mhh 
Mex2 = MFre 
Mex3 = MFre 
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
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhToFrecFre


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToFrecFre(MFe,MFre,Mhh,              & 
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
Mex1 = Mhh 
Mex2 = MFre 
Mex3 = MFre 


! {Fe, Fe, ss}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopss)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = Mss 
coup1L = cplcFeFehhL(i2,i1)
coup1R = cplcFeFehhR(i2,i1)
coup2L = cplcFeFressL(i1)
coup2R = cplcFeFressR(i1)
coup3L = cplcFreFessL(i2)
coup3R = cplcFreFessR(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {ss, ss, bar[Fe]}
If ((Include_in_loopss).and.(Include_in_loopss).and.(Include_in_loopFe)) Then 
    Do i3=1,3
ML1 = Mss 
ML2 = Mss 
ML3 = MFe(i3) 
coup1 = cplhhssss
coup2L = cplcFeFressL(i3)
coup2R = cplcFeFressR(i3)
coup3L = cplcFreFessL(i3)
coup3R = cplcFreFessR(i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZ, bar[Fre]}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopFre)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MFre 
coup1 = cplhhVZVZ
coup2L = cplcFreFreVZL
coup2R = cplcFreFreVZR
coup3L = cplcFreFreVZL
coup3R = cplcFreFreVZR
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToFrecFre


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhToFrecFre(MFe,MFre,               & 
& Mhh,Mss,MVZ,MFe2,MFre2,Mhh2,Mss2,MVZ2,cplcFeFehhL,cplcFeFehhR,cplcFreFessL,            & 
& cplcFreFessR,cplcFeFressL,cplcFeFressR,cplcFreFreVZL,cplcFreFreVZR,cplhhssss,          & 
& cplhhVZVZ,Amp)

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
Mex1 = Mhh 
Mex2 = MFre 
Mex3 = MFre 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhToFrecFre


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhToFvcFv(Mhh,Mhh2,Zfhh,ZfvL,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh,Mhh2

Complex(dp), Intent(in) :: Zfhh,ZfvL(3,3)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh 
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
Amp(:,gt2, gt3) = 0._dp
    End Do
  End Do
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhToFvcFv


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToFvcFv(MFe,Mhh,MHp,MVWp,            & 
& MVZ,MFe2,Mhh2,MHp2,MVWp2,MVZ2,cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,         & 
& cplcFvFeVWpL,cplcFvFeVWpR,cplcFvFvVZL,cplcFvFvVZR,cplcFeFvcHpL,cplcFeFvcHpR,           & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,           & 
& cplhhVZVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),Mhh,MHp,MVWp,MVZ,MFe2(3),Mhh2,MHp2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFvFeHpL(3,3),cplcFvFeHpR(3,3),cplcFvFeVWpL(3,3),& 
& cplcFvFeVWpR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),& 
& cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,              & 
& cplhhcVWpVWp,cplhhVZVZ

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh 
Mex2 = 0. 
Mex3 = 0. 


! {Fe, Fe, conj[Hp]}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopHp)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MHp 
coup1L = cplcFeFehhL(i2,i1)
coup1R = cplcFeFehhR(i2,i1)
coup2L = cplcFeFvcHpL(i1,gt2)
coup2R = cplcFeFvcHpR(i1,gt2)
coup3L = cplcFvFeHpL(gt3,i2)
coup3R = cplcFvFeHpR(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, Fe, conj[VWp]}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopVWp)) Then 
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVWp 
coup1L = cplcFeFehhL(i2,i1)
coup1R = cplcFeFehhR(i2,i1)
coup2L = -cplcFeFvcVWpR(i1,gt2)
coup2R = -cplcFeFvcVWpL(i1,gt2)
coup3L = -cplcFvFeVWpR(gt3,i2)
coup3R = -cplcFvFeVWpL(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Hp, Hp, bar[Fe]}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopFe)) Then 
    Do i3=1,3
ML1 = MHp 
ML2 = MHp 
ML3 = MFe(i3) 
coup1 = cplhhHpcHp
coup2L = cplcFeFvcHpL(i3,gt2)
coup2R = cplcFeFvcHpR(i3,gt2)
coup3L = cplcFvFeHpL(gt3,i3)
coup3R = cplcFvFeHpR(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {Hp, VWp, bar[Fe]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopFe)) Then 
    Do i3=1,3
ML1 = MHp 
ML2 = MVWp 
ML3 = MFe(i3) 
coup1 = cplhhHpcVWp
coup2L = cplcFeFvcHpL(i3,gt2)
coup2R = cplcFeFvcHpR(i3,gt2)
coup3L = -cplcFvFeVWpR(gt3,i3)
coup3R = -cplcFvFeVWpL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWp, Hp, bar[Fe]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopFe)) Then 
    Do i3=1,3
ML1 = MVWp 
ML2 = MHp 
ML3 = MFe(i3) 
coup1 = cplhhcHpVWp
coup2L = -cplcFeFvcVWpR(i3,gt2)
coup2R = -cplcFeFvcVWpL(i3,gt2)
coup3L = cplcFvFeHpL(gt3,i3)
coup3R = cplcFvFeHpR(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWp, VWp, bar[Fe]}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopFe)) Then 
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MFe(i3) 
coup1 = cplhhcVWpVWp
coup2L = -cplcFeFvcVWpR(i3,gt2)
coup2R = -cplcFeFvcVWpL(i3,gt2)
coup3L = -cplcFvFeVWpR(gt3,i3)
coup3R = -cplcFvFeVWpL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZ, bar[Fv]}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopFv)) Then 
    Do i3=1,3
ML1 = MVZ 
ML2 = MVZ 
ML3 = 0. 
coup1 = cplhhVZVZ
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 
    End Do
  End Do
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToFvcFv


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhToFvcFv(MFe,Mhh,MHp,              & 
& MVWp,MVZ,MFe2,Mhh2,MHp2,MVWp2,MVZ2,cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,    & 
& cplcFvFeVWpL,cplcFvFeVWpR,cplcFvFvVZL,cplcFvFvVZR,cplcFeFvcHpL,cplcFeFvcHpR,           & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,           & 
& cplhhVZVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),Mhh,MHp,MVWp,MVZ,MFe2(3),Mhh2,MHp2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFvFeHpL(3,3),cplcFvFeHpR(3,3),cplcFvFeVWpL(3,3),& 
& cplcFvFeVWpR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),& 
& cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,              & 
& cplhhcVWpVWp,cplhhVZVZ

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh 
Mex2 = 0. 
Mex3 = 0. 
    End Do
  End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhToFvcFv


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhTohhVP(Mhh,Mhh2,MVP,MVP2,              & 
& Zfhh,ZfVP,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh,Mhh2,MVP,MVP2

Complex(dp), Intent(in) :: Zfhh,ZfVP

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = Mhh 
Mex2 = Mhh 
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
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhTohhVP


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTohhVP(MFd,MFe,MFu,Mhh,              & 
& MHp,MVP,MVWp,MFd2,MFe2,MFu2,Mhh2,MHp2,MVP2,MVWp2,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,cplcgWpgWpVP,             & 
& cplcgWCgWChh,cplcgWCgWCVP,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,             & 
& cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,cplhhHpcVWpVP1,cplhhcHpVPVWp1,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFe(3),MFu(3),Mhh,MHp,MVP,MVWp,MFd2(3),MFe2(3),MFu2(3),Mhh2,MHp2,              & 
& MVP2,MVWp2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFehhL(3,3), & 
& cplcFeFehhR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),  & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,              & 
& cplcgWCgWCVP,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVP,               & 
& cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,cplhhHpcVWpVP1,cplhhcHpVPVWp1

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
! External masses 
Mex1 = Mhh 
Mex2 = Mhh 
Mex3 = MVP 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1)
coup1R = cplcFdFdhhR(i2,i1)
coup2L = cplcFdFdhhL(i1,i3)
coup2R = cplcFdFdhhR(i1,i3)
coup3L = -cplcFdFdVPR(i3,i2)
coup3R = -cplcFdFdVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1)
coup1R = cplcFeFehhR(i2,i1)
coup2L = cplcFeFehhL(i1,i3)
coup2R = cplcFeFehhR(i1,i3)
coup3L = -cplcFeFeVPR(i3,i2)
coup3R = -cplcFeFeVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1)
coup1R = cplcFuFuhhR(i2,i1)
coup2L = cplcFuFuhhL(i1,i3)
coup2R = cplcFuFuhhR(i1,i3)
coup3L = -cplcFuFuVPR(i3,i2)
coup3R = -cplcFuFuVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWp, gWp, gWp}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh
coup2 = cplcgWpgWphh
coup3 = cplcgWpgWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
End if 


! {gWpC, gWpC, gWpC}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh
coup2 = cplcgWCgWChh
coup3 = cplcgWCgWCVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
End if 


! {Hp, Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhHpcHp
coup2 = cplhhHpcHp
coup3 = -cplHpcHpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
End if 


! {Hp, VWp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = -cplhhHpcVWp
coup2 = cplhhHpcHp
coup3 = cplcHpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp
coup2 = cplhhcHpVWp
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhHpcVWp
coup2 = cplhhcHpVWp
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = -cplhhcHpVWp
coup2 = cplhhHpcVWp
coup3 = -cplHpcHpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp
coup2 = cplhhHpcVWp
coup3 = cplcHpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = -cplhhcHpVWp
coup2 = cplhhcVWpVWp
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcVWpVWp
coup2 = cplhhcVWpVWp
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[Hp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = -cplhhcHpVWp
coup2 = cplhhHpcHp
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp
coup2 = cplhhHpcVWp
coup3 = cplcHpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhcHpVWp
coup2 = cplhhHpcVWp
coup3 = -cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = -cplhhHpcVWp
coup2 = cplhhcHpVWp
coup3 = cplHpcHpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp
coup2 = cplhhcHpVWp
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[VWp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = -cplhhHpcVWp
coup2 = cplhhcVWpVWp
coup3 = cplcHpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWp
coup2 = cplhhcHpVPVWp1
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVWp
coup2 = cplhhHpcVWpVP1
Call Amp_VERTEX_StoSV_Topology2_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVP1
coup2 = cplhhcHpVWp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVPVWp1
coup2 = cplhhHpcVWp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTohhVP


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTohhVP(MFd,MFe,MFu,               & 
& Mhh,MHp,MVP,MVWp,MFd2,MFe2,MFu2,Mhh2,MHp2,MVP2,MVWp2,cplcFdFdhhL,cplcFdFdhhR,          & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,cplcgWpgWpVP,             & 
& cplcgWCgWChh,cplcgWCgWCVP,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,             & 
& cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,cplhhHpcVWpVP1,cplhhcHpVPVWp1,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFe(3),MFu(3),Mhh,MHp,MVP,MVWp,MFd2(3),MFe2(3),MFu2(3),Mhh2,MHp2,              & 
& MVP2,MVWp2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFehhL(3,3), & 
& cplcFeFehhR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),  & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,              & 
& cplcgWCgWCVP,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVP,               & 
& cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,cplhhHpcVWpVP1,cplhhcHpVPVWp1

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
Mex1 = Mhh 
Mex2 = Mhh 
Mex3 = MVP 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTohhVP


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhTohhVZ(Mhh,Mhh2,MVZ,MVZ2,              & 
& Zfhh,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh,Mhh2,MVZ,MVZ2

Complex(dp), Intent(in) :: Zfhh,ZfVZ

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = Mhh 
Mex2 = Mhh 
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
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhTohhVZ


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTohhVZ(MFd,MFe,MFu,Mhh,              & 
& MHp,MVWp,MVZ,MFd2,MFe2,MFu2,Mhh2,MHp2,MVWp2,MVZ2,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWphh,cplcgWpgWpVZ,             & 
& cplcgWCgWChh,cplcgWCgWCVZ,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,             & 
& cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplhhHpcVWpVZ1,cplhhcHpVWpVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFe(3),MFu(3),Mhh,MHp,MVWp,MVZ,MFd2(3),MFe2(3),MFu2(3),Mhh2,MHp2,              & 
& MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3), & 
& cplcFeFehhR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),  & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,              & 
& cplcgWCgWCVZ,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVZ,               & 
& cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplhhHpcVWpVZ1,cplhhcHpVWpVZ1

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
! External masses 
Mex1 = Mhh 
Mex2 = Mhh 
Mex3 = MVZ 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1)
coup1R = cplcFdFdhhR(i2,i1)
coup2L = cplcFdFdhhL(i1,i3)
coup2R = cplcFdFdhhR(i1,i3)
coup3L = -cplcFdFdVZR(i3,i2)
coup3R = -cplcFdFdVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1)
coup1R = cplcFeFehhR(i2,i1)
coup2L = cplcFeFehhL(i1,i3)
coup2R = cplcFeFehhR(i1,i3)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1)
coup1R = cplcFuFuhhR(i2,i1)
coup2L = cplcFuFuhhL(i1,i3)
coup2R = cplcFuFuhhR(i1,i3)
coup3L = -cplcFuFuVZR(i3,i2)
coup3R = -cplcFuFuVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWp, gWp, gWp}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh
coup2 = cplcgWpgWphh
coup3 = cplcgWpgWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
End if 


! {gWpC, gWpC, gWpC}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh
coup2 = cplcgWCgWChh
coup3 = cplcgWCgWCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
End if 


! {Hp, Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhHpcHp
coup2 = cplhhHpcHp
coup3 = -cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
End if 


! {Hp, VWp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = -cplhhHpcVWp
coup2 = cplhhHpcHp
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp
coup2 = cplhhcHpVWp
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhHpcVWp
coup2 = cplhhcHpVWp
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = -cplhhcHpVWp
coup2 = cplhhHpcVWp
coup3 = -cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp
coup2 = cplhhHpcVWp
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = -cplhhcHpVWp
coup2 = cplhhcVWpVWp
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcVWpVWp
coup2 = cplhhcVWpVWp
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[Hp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = -cplhhcHpVWp
coup2 = cplhhHpcHp
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp
coup2 = cplhhHpcVWp
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhcHpVWp
coup2 = cplhhHpcVWp
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = -cplhhHpcVWp
coup2 = cplhhcHpVWp
coup3 = cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp
coup2 = cplhhcHpVWp
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[VWp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = -cplhhHpcVWp
coup2 = cplhhcVWpVWp
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWp
coup2 = cplhhcHpVWpVZ1
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVWp
coup2 = cplhhHpcVWpVZ1
Call Amp_VERTEX_StoSV_Topology2_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVZ1
coup2 = cplhhcHpVWp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVWpVZ1
coup2 = cplhhHpcVWp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTohhVZ


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTohhVZ(MFd,MFe,MFu,               & 
& Mhh,MHp,MVWp,MVZ,MFd2,MFe2,MFu2,Mhh2,MHp2,MVWp2,MVZ2,cplcFdFdhhL,cplcFdFdhhR,          & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWphh,cplcgWpgWpVZ,             & 
& cplcgWCgWChh,cplcgWCgWCVZ,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,             & 
& cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplhhHpcVWpVZ1,cplhhcHpVWpVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFe(3),MFu(3),Mhh,MHp,MVWp,MVZ,MFd2(3),MFe2(3),MFu2(3),Mhh2,MHp2,              & 
& MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3), & 
& cplcFeFehhR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),  & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,              & 
& cplcgWCgWCVZ,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVZ,               & 
& cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplhhHpcVWpVZ1,cplhhcHpVWpVZ1

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
Mex1 = Mhh 
Mex2 = Mhh 
Mex3 = MVZ 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTohhVZ


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhToVGVG(Mhh,Mhh2,MVG,MVG2,              & 
& Zfhh,ZfVG,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh,Mhh2,MVG,MVG2

Complex(dp), Intent(in) :: Zfhh,ZfVG

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = Mhh 
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
Amp(:) = 0._dp
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhToVGVG


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToVGVG(MFd,MFu,Mhh,MVG,              & 
& MFd2,MFu2,Mhh2,MVG2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuhhL,       & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFu(3),Mhh,MVG,MFd2(3),MFu2(3),Mhh2,MVG2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuhhL(3,3), & 
& cplcFuFuhhR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
! External masses 
Mex1 = Mhh 
Mex2 = MVG 
Mex3 = MVG 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1)
coup1R = cplcFdFdhhR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1)
coup1R = cplcFuFuhhR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToVGVG


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhToVGVG(MFd,MFu,Mhh,               & 
& MVG,MFd2,MFu2,Mhh2,MVG2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFu(3),Mhh,MVG,MFd2(3),MFu2(3),Mhh2,MVG2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuhhL(3,3), & 
& cplcFuFuhhR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3)

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
Mex1 = Mhh 
Mex2 = MVG 
Mex3 = MVG 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhToVGVG


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhToVPVP(cplhhVZVZ,ctcplhhVZVZ,          & 
& Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,Zfhh,ZfVP,ZfVPVZ,ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplhhVZVZ

Complex(dp), Intent(in) :: ctcplhhVZVZ

Complex(dp), Intent(in) :: Zfhh,ZfVP,ZfVPVZ,ZfVZVP

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = Mhh 
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
Amp(:) = 0._dp
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhToVPVP


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToVPVP(MFd,MFe,MFu,Mhh,              & 
& MHp,MVP,MVWp,MFd2,MFe2,MFu2,Mhh2,MHp2,MVP2,MVWp2,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,cplcgWpgWpVP,             & 
& cplcgWCgWChh,cplcgWCgWCVP,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,             & 
& cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,cplhhHpcVWpVP1,cplhhcHpVPVWp1,         & 
& cplHpcHpVPVP1,cplcVWpVPVPVWp3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFe(3),MFu(3),Mhh,MHp,MVP,MVWp,MFd2(3),MFe2(3),MFu2(3),Mhh2,MHp2,              & 
& MVP2,MVWp2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFehhL(3,3), & 
& cplcFeFehhR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),  & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,              & 
& cplcgWCgWCVP,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVP,               & 
& cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,cplhhHpcVWpVP1,cplhhcHpVPVWp1,cplHpcHpVPVP1,      & 
& cplcVWpVPVPVWp3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
! External masses 
Mex1 = Mhh 
Mex2 = MVP 
Mex3 = MVP 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1)
coup1R = cplcFdFdhhR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1)
coup1R = cplcFeFehhR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1)
coup1R = cplcFuFuhhR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWp, gWp, gWp}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh
coup2 = cplcgWpgWpVP
coup3 = cplcgWpgWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
End if 


! {gWpC, gWpC, gWpC}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh
coup2 = cplcgWCgWCVP
coup3 = cplcgWCgWCVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
End if 


! {Hp, Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhHpcHp
coup2 = -cplHpcHpVP
coup3 = -cplHpcHpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
End if 


! {Hp, VWp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhHpcVWp
coup2 = -cplHpcHpVP
coup3 = cplcHpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp
coup2 = cplcHpVPVWp
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhHpcVWp
coup2 = cplcHpVPVWp
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhcHpVWp
coup2 = cplHpcVWpVP
coup3 = -cplHpcHpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp
coup2 = cplHpcVWpVP
coup3 = cplcHpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhcHpVWp
coup2 = cplcVWpVPVWp
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcVWpVWp
coup2 = cplcVWpVPVWp
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[Hp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcHpVWp
coup2 = cplHpcHpVP
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp
coup2 = cplHpcVWpVP
coup3 = cplcHpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcHpVWp
coup2 = cplHpcVWpVP
coup3 = -cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhHpcVWp
coup2 = cplcHpVPVWp
coup3 = cplHpcHpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp
coup2 = cplcHpVPVWp
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[VWp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcVWp
coup2 = -cplcVWpVPVWp
coup3 = cplcHpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
coup1 = cplhhHpcHp
coup2 = cplHpcHpVPVP1
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhcVWpVWp
coup2 = cplcVWpVPVPVWp1Q
coup2b = coup2 
coup2 = cplcVWpVPVPVWp2Q
coup2c = coup2 
coup2 = cplcVWpVPVPVWp3Q
coup2a = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVP1
coup2 = cplcHpVPVWp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVPVWp1
coup2 = cplHpcVWpVP
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVP1
coup2 = cplcHpVPVWp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVPVWp1
coup2 = cplHpcVWpVP
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToVPVP


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhToVPVP(MFd,MFe,MFu,               & 
& Mhh,MHp,MVP,MVWp,MFd2,MFe2,MFu2,Mhh2,MHp2,MVP2,MVWp2,cplcFdFdhhL,cplcFdFdhhR,          & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,cplcgWpgWpVP,             & 
& cplcgWCgWChh,cplcgWCgWCVP,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,             & 
& cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,cplhhHpcVWpVP1,cplhhcHpVPVWp1,         & 
& cplHpcHpVPVP1,cplcVWpVPVPVWp3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFe(3),MFu(3),Mhh,MHp,MVP,MVWp,MFd2(3),MFe2(3),MFu2(3),Mhh2,MHp2,              & 
& MVP2,MVWp2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFehhL(3,3), & 
& cplcFeFehhR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),  & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,              & 
& cplcgWCgWCVP,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVP,               & 
& cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,cplhhHpcVWpVP1,cplhhcHpVPVWp1,cplHpcHpVPVP1,      & 
& cplcVWpVPVPVWp3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q

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
Mex1 = Mhh 
Mex2 = MVP 
Mex3 = MVP 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhToVPVP


Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhToVPVZ(cplhhVZVZ,ctcplhhVZVZ,          & 
& Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,Zfhh,ZfVP,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplhhVZVZ

Complex(dp), Intent(in) :: ctcplhhVZVZ

Complex(dp), Intent(in) :: Zfhh,ZfVP,ZfVZ

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = Mhh 
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
Amp(:) = 0._dp
End Subroutine Amplitude_WAVE_SimplifiedDMSSSFDM_hhToVPVZ


Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToVPVZ(MFd,MFe,MFu,Mhh,              & 
& MHp,MVP,MVWp,MVZ,MFd2,MFe2,MFu2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,cplcFdFdhhL,cplcFdFdhhR,     & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWphh,cplcgWpgWpVP,             & 
& cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVP,cplcgWCgWCVZ,cplhhHpcHp,cplhhHpcVWp,            & 
& cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVPVWp,    & 
& cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,cplhhHpcVWpVP1,cplhhHpcVWpVZ1,cplhhcHpVPVWp1,    & 
& cplhhcHpVWpVZ1,cplHpcHpVPVZ1,cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFe(3),MFu(3),Mhh,MHp,MVP,MVWp,MVZ,MFd2(3),MFe2(3),MFu2(3),Mhh2,               & 
& MHp2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3), & 
& cplcFdFdVZR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),  & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFuFuVPL(3,3),  & 
& cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWpgWphh,cplcgWpgWpVP,          & 
& cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVP,cplcgWCgWCVZ,cplhhHpcHp,cplhhHpcVWp,            & 
& cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVPVWp,    & 
& cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,cplhhHpcVWpVP1,cplhhHpcVWpVZ1,cplhhcHpVPVWp1,    & 
& cplhhcHpVWpVZ1,cplHpcHpVPVZ1,cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
! External masses 
Mex1 = Mhh 
Mex2 = MVP 
Mex3 = MVZ 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1)
coup1R = cplcFdFdhhR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1)
coup1R = cplcFeFehhR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1)
coup1R = cplcFuFuhhR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWp, gWp, gWp}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh
coup2 = cplcgWpgWpVP
coup3 = cplcgWpgWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
End if 


! {gWpC, gWpC, gWpC}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh
coup2 = cplcgWCgWCVP
coup3 = cplcgWCgWCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
End if 


! {Hp, Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhHpcHp
coup2 = -cplHpcHpVP
coup3 = -cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
End if 


! {Hp, VWp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhHpcVWp
coup2 = -cplHpcHpVP
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp
coup2 = cplcHpVPVWp
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhHpcVWp
coup2 = cplcHpVPVWp
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhcHpVWp
coup2 = cplHpcVWpVP
coup3 = -cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp
coup2 = cplHpcVWpVP
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhcHpVWp
coup2 = cplcVWpVPVWp
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcVWpVWp
coup2 = cplcVWpVPVWp
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[Hp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcHpVWp
coup2 = cplHpcHpVP
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp
coup2 = cplHpcVWpVP
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcHpVWp
coup2 = cplHpcVWpVP
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhHpcVWp
coup2 = cplcHpVPVWp
coup3 = cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp
coup2 = cplcHpVPVWp
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[VWp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcVWp
coup2 = -cplcVWpVPVWp
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
coup1 = cplhhHpcHp
coup2 = cplHpcHpVPVZ1
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhcVWpVWp
coup2 = cplcVWpVPVWpVZ1Q
coup2b = coup2 
coup2 = cplcVWpVPVWpVZ2Q
coup2a = coup2 
coup2 = cplcVWpVPVWpVZ3Q
coup2c = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVZ1
coup2 = cplcHpVPVWp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVWpVZ1
coup2 = cplHpcVWpVP
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVP1
coup2 = cplcHpVWpVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVPVWp1
coup2 = cplHpcVWpVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End if 
End Subroutine Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToVPVZ


Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhToVPVZ(MFd,MFe,MFu,               & 
& Mhh,MHp,MVP,MVWp,MVZ,MFd2,MFe2,MFu2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,cplcFdFdhhL,             & 
& cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,               & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWphh,              & 
& cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVP,cplcgWCgWCVZ,cplhhHpcHp,           & 
& cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZ,cplHpcVWpVZ,    & 
& cplcHpVPVWp,cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,cplhhHpcVWpVP1,cplhhHpcVWpVZ1,       & 
& cplhhcHpVPVWp1,cplhhcHpVWpVZ1,cplHpcHpVPVZ1,cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZ2Q,         & 
& cplcVWpVPVWpVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFe(3),MFu(3),Mhh,MHp,MVP,MVWp,MVZ,MFd2(3),MFe2(3),MFu2(3),Mhh2,               & 
& MHp2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3), & 
& cplcFdFdVZR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),  & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFuFuVPL(3,3),  & 
& cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWpgWphh,cplcgWpgWpVP,          & 
& cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVP,cplcgWCgWCVZ,cplhhHpcHp,cplhhHpcVWp,            & 
& cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVPVWp,    & 
& cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,cplhhHpcVWpVP1,cplhhHpcVWpVZ1,cplhhcHpVPVWp1,    & 
& cplhhcHpVWpVZ1,cplHpcHpVPVZ1,cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q

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
Mex1 = Mhh 
Mex2 = MVP 
Mex3 = MVZ 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhToVPVZ



End Module OneLoopDecay_hh_SimplifiedDMSSSFDM
