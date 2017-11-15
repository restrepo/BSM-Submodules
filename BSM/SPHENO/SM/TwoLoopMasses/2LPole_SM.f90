Module Pole2L_SM 
 
Use Control 
Use Settings 
Use Couplings_SM 
Use AddLoopFunctions 
Use LoopFunctions 
Use Mathematics 
Use MathematicsQP 
Use Model_Data_SM 
Use StandardModel 
Use TreeLevelMasses_SM 
Use Pole2LFunctions
Contains 
 
Subroutine CalculatePi2S(p2,v,g1,g2,g3,Lam,Yu,Yd,Ye,Mu,kont,tad2L,Pi2S,Pi2P)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3

Complex(dp),Intent(in) :: Lam,Yu(3,3),Yd(3,3),Ye(3,3),Mu

Real(dp),Intent(in) :: v

Real(dp) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,              & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Complex(dp) :: cplAhAhhh,cplhhhhhh,cplhhHpcHp,cplVGVGVG,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),           & 
& cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFdFdhhL(3,3),  & 
& cplcFdFdhhR(3,3),cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),  & 
& cplcFvFeHpL(3,3),cplcFvFeHpR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFdFucHpL(3,3), & 
& cplcFdFucHpR(3,3),cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),& 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3)

Complex(dp) :: cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,cplhhhhhhhh,cplhhhhHpcHp,cplHpHpcHpcHp

Real(dp), Intent(in) :: p2
Integer, Intent(inout):: kont
Integer :: gE1,gE2,i,i1,i2,i3,i4,i5 
Real(dp) :: Qscale,prefactor,funcvalue
complex(dp) :: cplxprefactor,A0m
Real(dp)  :: temptad(1)
Real(dp)  :: tempcont(1,1)
Real(dp)  :: tempcontah(1,1)
Real(dp)  :: runningval(1,1)
Real(dp), Intent(out) :: tad2l(1)
Real(dp), Intent(out) :: Pi2S(1,1)
Real(dp), Intent(out) :: Pi2P(1,1)
complex(dp) :: coup1,coup2,coup3,coup4
complex(dp) :: coup1L,coup1R,coup2l,coup2r,coup3l,coup3r,coup4l,coup4r
real(dp) :: epsFmass
real(dp) :: epscouplings
Real(dp)  :: tempcouplingvector(1)
Real(dp)  :: tempcouplingmatrix(1,1)
Real(dp)  :: tempcouplingmatrixah(1,1)
logical :: nonzerocoupling
real(dp) :: delta2Ltadpoles(1)
real(dp)  :: delta2Lmasses(1,1)
real(dp)  :: delta2Lmassesah(1,1)
Real(dp)  :: tad1LG(1)


tad2l(:)=0
Pi2S(:,:)=0
Pi2P(:,:)=0
Qscale=getrenormalizationscale()
epsfmass=0._dp
epscouplings=1.0E-6_dp
Call TreeMassesEffPot(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,               & 
& MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,v,g1,g2,g3,Lam,              & 
& Yu,Yd,Ye,Mu,.True.,kont)

If (Abs(MHp2/Qscale).lt.TwoLoopRegulatorMass) MHp2=Qscale*TwoLoopRegulatorMass
If (Abs(MAh2/Qscale).lt.TwoLoopRegulatorMass) MAh2=Qscale*TwoLoopRegulatorMass
If (Abs(Mhh2/Qscale).lt.TwoLoopRegulatorMass) Mhh2=Qscale*TwoLoopRegulatorMass
Call CouplingsFor2LPole3(Lam,v,g3,Yd,ZDL,ZDR,Ye,ZEL,ZER,Yu,ZUL,ZUR,cplAhAhhh,         & 
& cplhhhhhh,cplhhHpcHp,cplVGVGVG,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,        & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,               & 
& cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFdFdVGL,cplcFdFdVGR,           & 
& cplcFuFuVGL,cplcFuFuVGR)

Call CouplingsFor2LPole4(Lam,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,cplhhhhhhhh,        & 
& cplhhhhHpcHp,cplHpHpcHpcHp)

! ----------------------------------
! ------- 1L GAUGELESS TADPOLE DIAGRAMS --------
! ----------------------------------
delta2Ltadpoles(:)=0._dp
delta2Lmasses(:,:)=0._dp
delta2LmassesAh(:,:)=0._dp
tad1LG(:)=0._dp
if(include1l2lshift) then
temptad(:) = 0._dp 
A0m = 1._dp/2._dp*(-J0(MAh2,qscale)) 
  Do gE1 = 1, 1
coup1 = cplAhAhhh
   temptad(gE1) = temptad(gE1)-real(coup1*A0m,dp) 
  End Do 
  Do i1 = 1, 3
A0m = 3._dp*(-J0(MFd2(i1),qscale)) 
  Do gE1 = 1, 1
coup1L = cplcFdFdhhL(i1,i1)
coup1R = cplcFdFdhhR(i1,i1)
  temptad(gE1)  = temptad(gE1)+ 2._dp*MFd(i1)*real((coup1L+coup1R)*A0m,dp) 
  End Do 
  End do 

  Do i1 = 1, 3
A0m = 1._dp*(-J0(MFe2(i1),qscale)) 
  Do gE1 = 1, 1
coup1L = cplcFeFehhL(i1,i1)
coup1R = cplcFeFehhR(i1,i1)
  temptad(gE1)  = temptad(gE1)+ 2._dp*MFe(i1)*real((coup1L+coup1R)*A0m,dp) 
  End Do 
  End do 

  Do i1 = 1, 3
A0m = 3._dp*(-J0(MFu2(i1),qscale)) 
  Do gE1 = 1, 1
coup1L = cplcFuFuhhL(i1,i1)
coup1R = cplcFuFuhhR(i1,i1)
  temptad(gE1)  = temptad(gE1)+ 2._dp*MFu(i1)*real((coup1L+coup1R)*A0m,dp) 
  End Do 
  End do 

A0m = 1._dp/2._dp*(-J0(Mhh2,qscale)) 
  Do gE1 = 1, 1
coup1 = cplhhhhhh
   temptad(gE1) = temptad(gE1)-real(coup1*A0m,dp) 
  End Do 
A0m = 1._dp*(-J0(MHp2,qscale)) 
  Do gE1 = 1, 1
coup1 = cplhhHpcHp
   temptad(gE1) = temptad(gE1)-real(coup1*A0m,dp) 
  End Do 
tad1LG=temptad*oo16Pi2
! ----------------------------
! ----------------------------------
! ------- 1L2L SHIFTS --------
! ----------------------------------
delta2Ltadpoles=delta2Ltadpoles*oo16Pi2
delta2Lmasses=delta2Lmasses*oo16Pi2
delta2LmassesAh=delta2LmassesAh*oo16Pi2
! ----------------------------
end if ! include1l2lshift
! ----------------------------------
! ------- TADPOLE DIAGRAMS --------
! ----------------------------------
temptad(:)=0._dp
tempcouplingvector(:)=0._dp
! ----------------------------
! ---- Final tadpole result --
temptad=(temptad*oo16Pi2*oo16Pi2)+delta2ltadpoles
tad2L=temptad
! ----------------------------

! ------------------------------------
! ------- CP EVEN MASS DIAGRAMS ------
! ------------------------------------
tempcont(:,:)=0._dp
tempcouplingmatrix(:,:)=0._dp
Pi2S(1,1)=tempcont(1,1)*oo16Pi2*oo16Pi2+delta2lmasses(1,1)

! -----------------------------------
! ------- CP ODD MASS DIAGRAMS ------
! -----------------------------------
tempcontah(:,:)=0._dp
tempcouplingmatrixah(:,:)=0._dp
Pi2P(1,1)=tempcontah(1,1)*oo16Pi2*oo16Pi2+delta2lmassesah(1,1)
End Subroutine CalculatePi2S
End Module Pole2L_SM 
 
