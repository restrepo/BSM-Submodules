Module Pole2L_THDMIIIHB 
 
Use Control 
Use Settings 
Use Couplings_THDMIIIHB 
Use AddLoopFunctions 
Use LoopFunctions 
Use Mathematics 
Use MathematicsQP 
Use Model_Data_THDMIIIHB 
Use StandardModel 
Use TreeLevelMasses_THDMIIIHB 
Use Pole2LFunctions
Contains 
 
Subroutine CalculatePi2S(p2,vd,vu,g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,             & 
& Lam2,epYU,Yu,Yd,Ye,epYD,epYE,M12,M112,M222,kont,tad2L,Pi2S,Pi2P)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3

Complex(dp),Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU(3,3),Yu(3,3),Yd(3,3),Ye(3,3),epYD(3,3),       & 
& epYE(3,3),M12,M112,M222

Real(dp),Intent(in) :: vd,vu

Real(dp) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh(2),Mhh2(2),MHm(2),          & 
& MHm2(2),Msigma1,Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,v,ZH(2,2),ZP(2,2),ZZ(2,2),             & 
& alphaH,betaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Complex(dp) :: cplAhAhAh,cplAhAhhh(2),cplAhAhsigma1,cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhHmcHm(2,2), & 
& cplAhsigma1sigma1,cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),               & 
& cplhhsigma1sigma1(2),cplHmsigma1cHm(2,2),cplsigma1sigma1sigma1,cplVGVGVG,              & 
& cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),  & 
& cplcFuFuAhR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdsigma1L(3,3),           & 
& cplcFdFdsigma1R(3,3),cplcFuFdcHmL(3,3,2),cplcFuFdcHmR(3,3,2),cplcFeFehhL(3,3,2),       & 
& cplcFeFehhR(3,3,2),cplcFeFesigma1L(3,3),cplcFeFesigma1R(3,3),cplcFvFecHmL(3,3,2),      & 
& cplcFvFecHmR(3,3,2),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFdFuHmL(3,3,2),          & 
& cplcFdFuHmR(3,3,2),cplcFuFusigma1L(3,3),cplcFuFusigma1R(3,3),cplcFeFvHmL(3,3,2),       & 
& cplcFeFvHmR(3,3,2),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3)

Complex(dp) :: cplAhAhAhAh,cplAhAhAhhh(2),cplAhAhAhsigma1,cplAhAhhhhh(2,2),cplAhAhhhsigma1(2),       & 
& cplAhAhHmcHm(2,2),cplAhAhsigma1sigma1,cplAhhhhhhh(2,2,2),cplAhhhhhsigma1(2,2),         & 
& cplAhhhHmcHm(2,2,2),cplAhhhsigma1sigma1(2),cplAhHmsigma1cHm(2,2),cplAhsigma1sigma1sigma1,& 
& cplhhhhhhhh(2,2,2,2),cplhhhhhhsigma1(2,2,2),cplhhhhHmcHm(2,2,2,2),cplhhhhsigma1sigma1(2,2),& 
& cplhhHmsigma1cHm(2,2,2),cplhhsigma1sigma1sigma1(2),cplHmHmcHmcHm(2,2,2,2),             & 
& cplHmsigma1sigma1cHm(2,2),cplsigma1sigma1sigma1sigma1

Real(dp), Intent(in) :: p2
Integer, Intent(inout):: kont
Integer :: gE1,gE2,i,i1,i2,i3,i4,i5 
Real(dp) :: Qscale,prefactor,funcvalue
complex(dp) :: cplxprefactor,A0m
Real(dp)  :: temptad(2)
Real(dp)  :: tempcont(2,2)
Real(dp)  :: tempcontah(1,1)
Real(dp)  :: runningval(2,2)
Real(dp), Intent(out) :: tad2l(2)
Real(dp), Intent(out) :: Pi2S(2,2)
Real(dp), Intent(out) :: Pi2P(1,1)
complex(dp) :: coup1,coup2,coup3,coup4
complex(dp) :: coup1L,coup1R,coup2l,coup2r,coup3l,coup3r,coup4l,coup4r
real(dp) :: epsFmass
real(dp) :: epscouplings
Real(dp)  :: tempcouplingvector(2)
Real(dp)  :: tempcouplingmatrix(2,2)
Real(dp)  :: tempcouplingmatrixah(1,1)
logical :: nonzerocoupling
real(dp) :: delta2Ltadpoles(2)
real(dp)  :: delta2Lmasses(2,2)
real(dp)  :: delta2Lmassesah(1,1)
Real(dp)  :: tad1LG(2)


tad2l(:)=0
Pi2S(:,:)=0
Pi2P(:,:)=0
Qscale=getrenormalizationscale()
epsfmass=0._dp
epscouplings=1.0E-6_dp
Call TreeMassesEffPot(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHm,               & 
& MHm2,Msigma1,Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,ZH,             & 
& ZP,ZW,ZZ,alphaH,betaH,vd,vu,g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,               & 
& epYU,Yu,Yd,Ye,epYD,epYE,M12,M112,M222,.True.,kont)

If (Abs(Msigma12/Qscale).lt.TwoLoopRegulatorMass) Msigma12=Qscale*TwoLoopRegulatorMass
If (Abs(MAh2/Qscale).lt.TwoLoopRegulatorMass) MAh2=Qscale*TwoLoopRegulatorMass
Where (Abs(Mhh2/Qscale).lt.TwoLoopRegulatorMass )Mhh2=Qscale*TwoLoopRegulatorMass
Where (Abs(MHm2/Qscale).lt.TwoLoopRegulatorMass )MHm2=Qscale*TwoLoopRegulatorMass
Call CouplingsFor2LPole3(Lam7,vd,Lam5,Lam4,Lam3,Lam2,vu,ZH,Lam6,ZP,Lam1,              & 
& g3,epYD,ZDL,ZDR,epYE,ZEL,ZER,Yu,ZUL,ZUR,Yd,epYU,Ye,cplAhAhAh,cplAhAhhh,cplAhAhsigma1,  & 
& cplAhhhhh,cplAhhhsigma1,cplAhHmcHm,cplAhsigma1sigma1,cplhhhhhh,cplhhhhsigma1,          & 
& cplhhHmcHm,cplhhsigma1sigma1,cplHmsigma1cHm,cplsigma1sigma1sigma1,cplVGVGVG,           & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdsigma1L,cplcFdFdsigma1R,cplcFuFdcHmL,cplcFuFdcHmR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFesigma1L,cplcFeFesigma1R,cplcFvFecHmL,cplcFvFecHmR,     & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHmL,cplcFdFuHmR,cplcFuFusigma1L,cplcFuFusigma1R,       & 
& cplcFeFvHmL,cplcFeFvHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR)

Call CouplingsFor2LPole4(Lam2,Lam7,ZH,Lam5,Lam4,Lam3,ZP,Lam6,Lam1,cplAhAhAhAh,        & 
& cplAhAhAhhh,cplAhAhAhsigma1,cplAhAhhhhh,cplAhAhhhsigma1,cplAhAhHmcHm,cplAhAhsigma1sigma1,& 
& cplAhhhhhhh,cplAhhhhhsigma1,cplAhhhHmcHm,cplAhhhsigma1sigma1,cplAhHmsigma1cHm,         & 
& cplAhsigma1sigma1sigma1,cplhhhhhhhh,cplhhhhhhsigma1,cplhhhhHmcHm,cplhhhhsigma1sigma1,  & 
& cplhhHmsigma1cHm,cplhhsigma1sigma1sigma1,cplHmHmcHmcHm,cplHmsigma1sigma1cHm,           & 
& cplsigma1sigma1sigma1sigma1)

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
  Do gE1 = 1, 2
coup1 = cplAhAhhh(gE1)
   temptad(gE1) = temptad(gE1)-real(coup1*A0m,dp) 
  End Do 
  Do i1 = 1, 3
A0m = 3._dp*(-J0(MFd2(i1),qscale)) 
  Do gE1 = 1, 2
coup1L = cplcFdFdhhL(i1,i1,gE1)
coup1R = cplcFdFdhhR(i1,i1,gE1)
  temptad(gE1)  = temptad(gE1)+ 2._dp*MFd(i1)*real((coup1L+coup1R)*A0m,dp) 
  End Do 
  End do 

  Do i1 = 1, 3
A0m = 1._dp*(-J0(MFe2(i1),qscale)) 
  Do gE1 = 1, 2
coup1L = cplcFeFehhL(i1,i1,gE1)
coup1R = cplcFeFehhR(i1,i1,gE1)
  temptad(gE1)  = temptad(gE1)+ 2._dp*MFe(i1)*real((coup1L+coup1R)*A0m,dp) 
  End Do 
  End do 

  Do i1 = 1, 3
A0m = 3._dp*(-J0(MFu2(i1),qscale)) 
  Do gE1 = 1, 2
coup1L = cplcFuFuhhL(i1,i1,gE1)
coup1R = cplcFuFuhhR(i1,i1,gE1)
  temptad(gE1)  = temptad(gE1)+ 2._dp*MFu(i1)*real((coup1L+coup1R)*A0m,dp) 
  End Do 
  End do 

  Do i1 = 1, 2
A0m = 1._dp/2._dp*(-J0(Mhh2(i1),qscale)) 
  Do gE1 = 1, 2
coup1 = cplhhhhhh(gE1,i1,i1)
   temptad(gE1) = temptad(gE1)-real(coup1*A0m,dp) 
  End Do 
  End do 

  Do i1 = 1, 2
A0m = 1._dp*(-J0(MHm2(i1),qscale)) 
  Do gE1 = 1, 2
coup1 = cplhhHmcHm(gE1,i1,i1)
   temptad(gE1) = temptad(gE1)-real(coup1*A0m,dp) 
  End Do 
  End do 

A0m = 1._dp/2._dp*(-J0(Msigma12,qscale)) 
  Do gE1 = 1, 2
coup1 = cplhhsigma1sigma1(gE1)
   temptad(gE1) = temptad(gE1)-real(coup1*A0m,dp) 
  End Do 
tad1LG=matmul(temptad*oo16Pi2,ZH)
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
tad2L=matmul(temptad,ZH)
! ----------------------------

! ------------------------------------
! ------- CP EVEN MASS DIAGRAMS ------
! ------------------------------------
tempcont(:,:)=0._dp
tempcouplingmatrix(:,:)=0._dp
do gE1=1,2
Pi2S(gE1,gE1)=Pi2S(gE1,gE1)+tempcont(gE1,gE1)*oo16Pi2*oo16Pi2
do gE2=1,gE1-1
Pi2S(gE1,gE2)=Pi2S(gE1,gE2)+0.5_dp*(tempcont(gE1,gE2)+tempcont(gE2,gE1))*oo16Pi2*oo16Pi2
Pi2S(gE2,gE1)=Pi2S(gE1,gE2)
End do
End do
Pi2S=Pi2S+delta2lmasses
Pi2S = Matmul(Pi2S,ZH)
Pi2S = Matmul(Transpose(ZH),Pi2S)

! -----------------------------------
! ------- CP ODD MASS DIAGRAMS ------
! -----------------------------------
tempcontah(:,:)=0._dp
tempcouplingmatrixah(:,:)=0._dp
Pi2P(1,1)=tempcontah(1,1)*oo16Pi2*oo16Pi2+delta2lmassesah(1,1)
End Subroutine CalculatePi2S
End Module Pole2L_THDMIIIHB 
 
