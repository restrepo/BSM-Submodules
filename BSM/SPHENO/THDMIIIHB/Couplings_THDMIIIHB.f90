! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 22:52 on 25.10.2017   
! ----------------------------------------------------------------------  
 
 
Module Couplings_THDMIIIHB
 
Use Control 
Use Settings 
Use Model_Data_THDMIIIHB 
Use Mathematics, Only: CompareMatrices, Adjungate 
 
Contains 
 
 Subroutine AllCouplingsReallyAll(Lam7,v,Lam5,Lam4,Lam3,Lam2,v2,ZH,Lam6,               & 
& ZP,Lam1,g1,g2,TW,g3,epYD,ZDL,ZDR,epYE,ZEL,ZER,epYU,ZUL,ZUR,Yd,Yu,Ye,cplAhAhAh,         & 
& cplAhAhhh,cplAhAhsigma1,cplAhhhhh,cplAhhhsigma1,cplAhHmcHm,cplAhsigma1sigma1,          & 
& cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhsigma1sigma1,cplHmsigma1cHm,cplsigma1sigma1sigma1,& 
& cplAhAhAhAh,cplAhAhAhhh,cplAhAhAhsigma1,cplAhAhhhhh,cplAhAhhhsigma1,cplAhAhHmcHm,      & 
& cplAhAhsigma1sigma1,cplAhhhhhhh,cplAhhhhhsigma1,cplAhhhHmcHm,cplAhhhsigma1sigma1,      & 
& cplAhHmsigma1cHm,cplAhsigma1sigma1sigma1,cplhhhhhhhh,cplhhhhhhsigma1,cplhhhhHmcHm,     & 
& cplhhhhsigma1sigma1,cplhhHmsigma1cHm,cplhhsigma1sigma1sigma1,cplHmHmcHmcHm,            & 
& cplHmsigma1sigma1cHm,cplsigma1sigma1sigma1sigma1,cplAhhhVZ,cplAhHmcVWm,cplAhcHmVWm,    & 
& cplhhHmcVWm,cplhhsigma1VZ,cplhhcHmVWm,cplHmsigma1cVWm,cplHmcHmVP,cplHmcHmVZ,           & 
& cplsigma1cHmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHmcVWmVP,cplHmcVWmVZ,cplcHmVPVWm,            & 
& cplcHmVWmVZ,cplAhAhcVWmVWm,cplAhAhVZVZ,cplAhHmcVWmVP,cplAhHmcVWmVZ,cplAhcHmVPVWm,      & 
& cplAhcHmVWmVZ,cplhhhhcVWmVWm,cplhhhhVZVZ,cplhhHmcVWmVP,cplhhHmcVWmVZ,cplhhcHmVPVWm,    & 
& cplhhcHmVWmVZ,cplHmsigma1cVWmVP,cplHmsigma1cVWmVZ,cplHmcHmVPVP,cplHmcHmVPVZ,           & 
& cplHmcHmcVWmVWm,cplHmcHmVZVZ,cplsigma1sigma1cVWmVWm,cplsigma1sigma1VZVZ,               & 
& cplsigma1cHmVPVWm,cplsigma1cHmVWmVZ,cplVGVGVG,cplcVWmVPVWm,cplcVWmVWmVZ,               & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdsigma1L,cplcFdFdsigma1R,cplcFuFdcHmL,cplcFuFdcHmR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFesigma1L,cplcFeFesigma1R,cplcFvFecHmL,cplcFvFecHmR,     & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHmL,cplcFdFuHmR,cplcFuFusigma1L,cplcFuFusigma1R,       & 
& cplcFeFvHmL,cplcFeFvHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFeFeVPL,cplcFeFeVPR,           & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,cplVGVGVGVG1,cplVGVGVGVG2,           & 
& cplVGVGVGVG3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplcVWmVPVWmVZ1,          & 
& cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,& 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcgGgGVG,cplcgWmgAVWm,               & 
& cplcgWpCgAcVWm,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgWpCVP,   & 
& cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgWpCgWpCVZ,cplcgWmgZVWm,cplcgWpCgZcVWm,cplcgWmgWmAh,   & 
& cplcgWpCgWpCAh,cplcgZgAhh,cplcgWmgAHm,cplcgWpCgAcHm,cplcgWmgWmhh,cplcgWmgWmsigma1,     & 
& cplcgZgWmcHm,cplcgWpCgWpChh,cplcgZgWpCHm,cplcgWpCgWpCsigma1,cplcgZgZhh,cplcgWmgZHm,    & 
& cplcgWpCgZcHm)

Implicit None 
Real(dp), Intent(in) :: v,v2,ZH(2,2),ZP(2,2),g1,g2,TW,g3

Complex(dp), Intent(in) :: Lam7,Lam5,Lam4,Lam3,Lam2,Lam6,Lam1,epYD(3,3),ZDL(3,3),ZDR(3,3),epYE(3,3),             & 
& ZEL(3,3),ZER(3,3),epYU(3,3),ZUL(3,3),ZUR(3,3),Yd(3,3),Yu(3,3),Ye(3,3)

Complex(dp), Intent(out) :: cplAhAhAh,cplAhAhhh(2),cplAhAhsigma1,cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhHmcHm(2,2), & 
& cplAhsigma1sigma1,cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),               & 
& cplhhsigma1sigma1(2),cplHmsigma1cHm(2,2),cplsigma1sigma1sigma1,cplAhAhAhAh,            & 
& cplAhAhAhhh(2),cplAhAhAhsigma1,cplAhAhhhhh(2,2),cplAhAhhhsigma1(2),cplAhAhHmcHm(2,2),  & 
& cplAhAhsigma1sigma1,cplAhhhhhhh(2,2,2),cplAhhhhhsigma1(2,2),cplAhhhHmcHm(2,2,2),       & 
& cplAhhhsigma1sigma1(2),cplAhHmsigma1cHm(2,2),cplAhsigma1sigma1sigma1,cplhhhhhhhh(2,2,2,2),& 
& cplhhhhhhsigma1(2,2,2),cplhhhhHmcHm(2,2,2,2),cplhhhhsigma1sigma1(2,2),cplhhHmsigma1cHm(2,2,2),& 
& cplhhsigma1sigma1sigma1(2),cplHmHmcHmcHm(2,2,2,2),cplHmsigma1sigma1cHm(2,2),           & 
& cplsigma1sigma1sigma1sigma1,cplAhhhVZ(2),cplAhHmcVWm(2),cplAhcHmVWm(2),cplhhHmcVWm(2,2),& 
& cplhhsigma1VZ(2),cplhhcHmVWm(2,2),cplHmsigma1cVWm(2),cplHmcHmVP(2,2),cplHmcHmVZ(2,2),  & 
& cplsigma1cHmVWm(2),cplhhcVWmVWm(2),cplhhVZVZ(2),cplHmcVWmVP(2),cplHmcVWmVZ(2),         & 
& cplcHmVPVWm(2),cplcHmVWmVZ(2),cplAhAhcVWmVWm,cplAhAhVZVZ,cplAhHmcVWmVP(2),             & 
& cplAhHmcVWmVZ(2),cplAhcHmVPVWm(2),cplAhcHmVWmVZ(2),cplhhhhcVWmVWm(2,2),cplhhhhVZVZ(2,2),& 
& cplhhHmcVWmVP(2,2),cplhhHmcVWmVZ(2,2),cplhhcHmVPVWm(2,2),cplhhcHmVWmVZ(2,2),           & 
& cplHmsigma1cVWmVP(2),cplHmsigma1cVWmVZ(2),cplHmcHmVPVP(2,2),cplHmcHmVPVZ(2,2),         & 
& cplHmcHmcVWmVWm(2,2),cplHmcHmVZVZ(2,2),cplsigma1sigma1cVWmVWm,cplsigma1sigma1VZVZ,     & 
& cplsigma1cHmVPVWm(2),cplsigma1cHmVWmVZ(2),cplVGVGVG,cplcVWmVPVWm,cplcVWmVWmVZ,         & 
& cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),  & 
& cplcFuFuAhR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdsigma1L(3,3),           & 
& cplcFdFdsigma1R(3,3),cplcFuFdcHmL(3,3,2),cplcFuFdcHmR(3,3,2),cplcFeFehhL(3,3,2),       & 
& cplcFeFehhR(3,3,2),cplcFeFesigma1L(3,3),cplcFeFesigma1R(3,3),cplcFvFecHmL(3,3,2),      & 
& cplcFvFecHmR(3,3,2),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFdFuHmL(3,3,2),          & 
& cplcFdFuHmR(3,3,2),cplcFuFusigma1L(3,3),cplcFuFusigma1R(3,3),cplcFeFvHmL(3,3,2),       & 
& cplcFeFvHmR(3,3,2),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),& 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),               & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFvFecVWmL(3,3),& 
& cplcFvFecVWmR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),& 
& cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFeFvVWmL(3,3),& 
& cplcFeFvVWmR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplVGVGVGVG1,cplVGVGVGVG2,         & 
& cplVGVGVGVG3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplcVWmVPVWmVZ1,          & 
& cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,& 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcgGgGVG,cplcgWmgAVWm,               & 
& cplcgWpCgAcVWm,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgWpCVP,   & 
& cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgWpCgWpCVZ,cplcgWmgZVWm,cplcgWpCgZcVWm,cplcgWmgWmAh,   & 
& cplcgWpCgWpCAh,cplcgZgAhh(2),cplcgWmgAHm(2),cplcgWpCgAcHm(2),cplcgWmgWmhh(2),          & 
& cplcgWmgWmsigma1,cplcgZgWmcHm(2),cplcgWpCgWpChh(2),cplcgZgWpCHm(2),cplcgWpCgWpCsigma1, & 
& cplcgZgZhh(2),cplcgWmgZHm(2),cplcgWpCgZcHm(2)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'AllCouplingsReallyAll'
 
cplAhAhAh = 0._dp 
Call CouplingAhAhAhT(Lam7,v,cplAhAhAh)



cplAhAhhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhAhhhT(gt3,Lam5,Lam7,Lam4,Lam3,Lam2,v,v2,ZH,cplAhAhhh(gt3))

End Do 


cplAhAhsigma1 = 0._dp 
Call CouplingAhAhsigma1T(Lam5,Lam7,v,v2,cplAhAhsigma1)



cplAhhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhhhhhT(gt2,gt3,Lam6,Lam5,Lam7,v,v2,ZH,cplAhhhhh(gt2,gt3))

 End Do 
End Do 


cplAhhhsigma1 = 0._dp 
Do gt2 = 1, 2
Call CouplingAhhhsigma1T(gt2,Lam6,Lam5,Lam7,v,v2,ZH,cplAhhhsigma1(gt2))

End Do 


cplAhHmcHm = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhHmcHmT(gt2,gt3,Lam6,Lam5,Lam7,Lam4,v,ZP,cplAhHmcHm(gt2,gt3))

 End Do 
End Do 


cplAhsigma1sigma1 = 0._dp 
Call CouplingAhsigma1sigma1T(Lam6,Lam5,v,v2,cplAhsigma1sigma1)



cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhhhhhT(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,v,v2,             & 
& ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhhhsigma1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call Couplinghhhhsigma1T(gt1,gt2,Lam6,Lam5,Lam7,v,v2,ZH,cplhhhhsigma1(gt1,gt2))

 End Do 
End Do 


cplhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhHmcHmT(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,v,               & 
& v2,ZH,ZP,cplhhHmcHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhsigma1sigma1 = 0._dp 
Do gt1 = 1, 2
Call Couplinghhsigma1sigma1T(gt1,Lam6,Lam5,Lam1,Lam4,Lam3,v,v2,ZH,cplhhsigma1sigma1(gt1))

End Do 


cplHmsigma1cHm = 0._dp 
Do gt1 = 1, 2
 Do gt3 = 1, 2
Call CouplingHmsigma1cHmT(gt1,gt3,Lam6,Lam5,Lam7,Lam4,v2,ZP,cplHmsigma1cHm(gt1,gt3))

 End Do 
End Do 


cplsigma1sigma1sigma1 = 0._dp 
Call Couplingsigma1sigma1sigma1T(Lam6,v2,cplsigma1sigma1sigma1)



cplAhAhAhAh = 0._dp 
Call CouplingAhAhAhAhT(Lam2,cplAhAhAhAh)



cplAhAhAhhh = 0._dp 
Do gt4 = 1, 2
Call CouplingAhAhAhhhT(gt4,Lam7,ZH,cplAhAhAhhh(gt4))

End Do 


cplAhAhAhsigma1 = 0._dp 
Call CouplingAhAhAhsigma1T(Lam7,cplAhAhAhsigma1)



cplAhAhhhhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhhhhhT(gt3,gt4,Lam5,Lam7,Lam4,Lam3,Lam2,ZH,cplAhAhhhhh(gt3,gt4))

 End Do 
End Do 


cplAhAhhhsigma1 = 0._dp 
Do gt3 = 1, 2
Call CouplingAhAhhhsigma1T(gt3,Lam5,Lam7,ZH,cplAhAhhhsigma1(gt3))

End Do 


cplAhAhHmcHm = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhHmcHmT(gt3,gt4,Lam7,Lam3,Lam2,ZP,cplAhAhHmcHm(gt3,gt4))

 End Do 
End Do 


cplAhAhsigma1sigma1 = 0._dp 
Call CouplingAhAhsigma1sigma1T(Lam5,Lam4,Lam3,cplAhAhsigma1sigma1)



cplAhhhhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
  Do gt4 = 1, 2
Call CouplingAhhhhhhhT(gt2,gt3,gt4,Lam6,Lam5,Lam7,ZH,cplAhhhhhhh(gt2,gt3,gt4))

  End Do 
 End Do 
End Do 


cplAhhhhhsigma1 = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhhhhhsigma1T(gt2,gt3,Lam6,Lam5,Lam7,ZH,cplAhhhhhsigma1(gt2,gt3))

 End Do 
End Do 


cplAhhhHmcHm = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
  Do gt4 = 1, 2
Call CouplingAhhhHmcHmT(gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam4,ZH,ZP,cplAhhhHmcHm(gt2,gt3,gt4))

  End Do 
 End Do 
End Do 


cplAhhhsigma1sigma1 = 0._dp 
Do gt2 = 1, 2
Call CouplingAhhhsigma1sigma1T(gt2,Lam6,Lam5,ZH,cplAhhhsigma1sigma1(gt2))

End Do 


cplAhHmsigma1cHm = 0._dp 
Do gt2 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhHmsigma1cHmT(gt2,gt4,Lam6,Lam5,Lam7,Lam4,ZP,cplAhHmsigma1cHm(gt2,gt4))

 End Do 
End Do 


cplAhsigma1sigma1sigma1 = 0._dp 
Call CouplingAhsigma1sigma1sigma1T(Lam6,cplAhsigma1sigma1sigma1)



cplhhhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplinghhhhhhhhT(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,            & 
& ZH,cplhhhhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplhhhhhhsigma1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call Couplinghhhhhhsigma1T(gt1,gt2,gt3,Lam6,Lam5,Lam7,ZH,cplhhhhhhsigma1(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplinghhhhHmcHmT(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,           & 
& ZH,ZP,cplhhhhHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplhhhhsigma1sigma1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call Couplinghhhhsigma1sigma1T(gt1,gt2,Lam6,Lam5,Lam1,Lam4,Lam3,ZH,cplhhhhsigma1sigma1(gt1,gt2))

 End Do 
End Do 


cplhhHmsigma1cHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt4 = 1, 2
Call CouplinghhHmsigma1cHmT(gt1,gt2,gt4,Lam6,Lam5,Lam7,Lam4,ZH,ZP,cplhhHmsigma1cHm(gt1,gt2,gt4))

  End Do 
 End Do 
End Do 


cplhhsigma1sigma1sigma1 = 0._dp 
Do gt1 = 1, 2
Call Couplinghhsigma1sigma1sigma1T(gt1,Lam6,ZH,cplhhsigma1sigma1sigma1(gt1))

End Do 


cplHmHmcHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingHmHmcHmcHmT(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,               & 
& Lam2,ZP,cplHmHmcHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplHmsigma1sigma1cHm = 0._dp 
Do gt1 = 1, 2
 Do gt4 = 1, 2
Call CouplingHmsigma1sigma1cHmT(gt1,gt4,Lam6,Lam1,Lam3,ZP,cplHmsigma1sigma1cHm(gt1,gt4))

 End Do 
End Do 


cplsigma1sigma1sigma1sigma1 = 0._dp 
Call Couplingsigma1sigma1sigma1sigma1T(Lam1,cplsigma1sigma1sigma1sigma1)



cplAhhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingAhhhVZT(gt2,g1,g2,ZH,TW,cplAhhhVZ(gt2))

End Do 


cplAhHmcVWm = 0._dp 
Do gt2 = 1, 2
Call CouplingAhHmcVWmT(gt2,g2,ZP,cplAhHmcVWm(gt2))

End Do 


cplAhcHmVWm = 0._dp 
Do gt2 = 1, 2
Call CouplingAhcHmVWmT(gt2,g2,ZP,cplAhcHmVWm(gt2))

End Do 


cplhhHmcVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhHmcVWmT(gt1,gt2,g2,ZH,ZP,cplhhHmcVWm(gt1,gt2))

 End Do 
End Do 


cplhhsigma1VZ = 0._dp 
Do gt1 = 1, 2
Call Couplinghhsigma1VZT(gt1,g1,g2,ZH,TW,cplhhsigma1VZ(gt1))

End Do 


cplhhcHmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhcHmVWmT(gt1,gt2,g2,ZH,ZP,cplhhcHmVWm(gt1,gt2))

 End Do 
End Do 


cplHmsigma1cVWm = 0._dp 
Do gt1 = 1, 2
Call CouplingHmsigma1cVWmT(gt1,g2,ZP,cplHmsigma1cVWm(gt1))

End Do 


cplHmcHmVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHmcHmVPT(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVP(gt1,gt2))

 End Do 
End Do 


cplHmcHmVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHmcHmVZT(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVZ(gt1,gt2))

 End Do 
End Do 


cplsigma1cHmVWm = 0._dp 
Do gt2 = 1, 2
Call Couplingsigma1cHmVWmT(gt2,g2,ZP,cplsigma1cHmVWm(gt2))

End Do 


cplhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWmVWmT(gt1,g2,v,v2,ZH,cplhhcVWmVWm(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZT(gt1,g1,g2,v,v2,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplHmcVWmVP = 0._dp 
Do gt1 = 1, 2
Call CouplingHmcVWmVPT(gt1,g1,g2,v,v2,ZP,TW,cplHmcVWmVP(gt1))

End Do 


cplHmcVWmVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingHmcVWmVZT(gt1,g1,g2,v,v2,ZP,TW,cplHmcVWmVZ(gt1))

End Do 


cplcHmVPVWm = 0._dp 
Do gt1 = 1, 2
Call CouplingcHmVPVWmT(gt1,g1,g2,v,v2,ZP,TW,cplcHmVPVWm(gt1))

End Do 


cplcHmVWmVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingcHmVWmVZT(gt1,g1,g2,v,v2,ZP,TW,cplcHmVWmVZ(gt1))

End Do 


cplAhAhcVWmVWm = 0._dp 
Call CouplingAhAhcVWmVWmT(g2,cplAhAhcVWmVWm)



cplAhAhVZVZ = 0._dp 
Call CouplingAhAhVZVZT(g1,g2,TW,cplAhAhVZVZ)



cplAhHmcVWmVP = 0._dp 
Do gt2 = 1, 2
Call CouplingAhHmcVWmVPT(gt2,g1,g2,ZP,TW,cplAhHmcVWmVP(gt2))

End Do 


cplAhHmcVWmVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingAhHmcVWmVZT(gt2,g1,g2,ZP,TW,cplAhHmcVWmVZ(gt2))

End Do 


cplAhcHmVPVWm = 0._dp 
Do gt2 = 1, 2
Call CouplingAhcHmVPVWmT(gt2,g1,g2,ZP,TW,cplAhcHmVPVWm(gt2))

End Do 


cplAhcHmVWmVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingAhcHmVWmVZT(gt2,g1,g2,ZP,TW,cplAhcHmVWmVZ(gt2))

End Do 


cplhhhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhcVWmVWmT(gt1,gt2,g2,ZH,cplhhhhcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplhhhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZVZT(gt1,gt2,g1,g2,ZH,TW,cplhhhhVZVZ(gt1,gt2))

 End Do 
End Do 


cplhhHmcVWmVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhHmcVWmVPT(gt1,gt2,g1,g2,ZH,ZP,TW,cplhhHmcVWmVP(gt1,gt2))

 End Do 
End Do 


cplhhHmcVWmVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhHmcVWmVZT(gt1,gt2,g1,g2,ZH,ZP,TW,cplhhHmcVWmVZ(gt1,gt2))

 End Do 
End Do 


cplhhcHmVPVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhcHmVPVWmT(gt1,gt2,g1,g2,ZH,ZP,TW,cplhhcHmVPVWm(gt1,gt2))

 End Do 
End Do 


cplhhcHmVWmVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhcHmVWmVZT(gt1,gt2,g1,g2,ZH,ZP,TW,cplhhcHmVWmVZ(gt1,gt2))

 End Do 
End Do 


cplHmsigma1cVWmVP = 0._dp 
Do gt1 = 1, 2
Call CouplingHmsigma1cVWmVPT(gt1,g1,g2,ZP,TW,cplHmsigma1cVWmVP(gt1))

End Do 


cplHmsigma1cVWmVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingHmsigma1cVWmVZT(gt1,g1,g2,ZP,TW,cplHmsigma1cVWmVZ(gt1))

End Do 


cplHmcHmVPVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHmcHmVPVPT(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVPVP(gt1,gt2))

 End Do 
End Do 


cplHmcHmVPVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHmcHmVPVZT(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVPVZ(gt1,gt2))

 End Do 
End Do 


cplHmcHmcVWmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHmcHmcVWmVWmT(gt1,gt2,g2,ZP,cplHmcHmcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplHmcHmVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHmcHmVZVZT(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVZVZ(gt1,gt2))

 End Do 
End Do 


cplsigma1sigma1cVWmVWm = 0._dp 
Call Couplingsigma1sigma1cVWmVWmT(g2,cplsigma1sigma1cVWmVWm)



cplsigma1sigma1VZVZ = 0._dp 
Call Couplingsigma1sigma1VZVZT(g1,g2,TW,cplsigma1sigma1VZVZ)



cplsigma1cHmVPVWm = 0._dp 
Do gt2 = 1, 2
Call Couplingsigma1cHmVPVWmT(gt2,g1,g2,ZP,TW,cplsigma1cHmVPVWm(gt2))

End Do 


cplsigma1cHmVWmVZ = 0._dp 
Do gt2 = 1, 2
Call Couplingsigma1cHmVWmVZT(gt2,g1,g2,ZP,TW,cplsigma1cHmVWmVZ(gt2))

End Do 


cplVGVGVG = 0._dp 
Call CouplingVGVGVGT(g3,cplVGVGVG)



cplcVWmVPVWm = 0._dp 
Call CouplingcVWmVPVWmT(g2,TW,cplcVWmVPVWm)



cplcVWmVWmVZ = 0._dp 
Call CouplingcVWmVWmVZT(g2,TW,cplcVWmVWmVZ)



cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,epYD,ZDL,ZDR,cplcFdFdAhL(gt1,gt2),cplcFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,epYE,ZEL,ZER,cplcFeFeAhL(gt1,gt2),cplcFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,epYU,ZUL,ZUR,cplcFuFuAhL(gt1,gt2),cplcFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,epYD,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdsigma1L = 0._dp 
cplcFdFdsigma1R = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdsigma1T(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdsigma1L(gt1,gt2),cplcFdFdsigma1R(gt1,gt2))

 End Do 
End Do 


cplcFuFdcHmL = 0._dp 
cplcFuFdcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFdcHmT(gt1,gt2,gt3,Yu,epYU,Yd,epYD,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,epYE,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFesigma1L = 0._dp 
cplcFeFesigma1R = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFesigma1T(gt1,gt2,Ye,ZEL,ZER,cplcFeFesigma1L(gt1,gt2),cplcFeFesigma1R(gt1,gt2))

 End Do 
End Do 


cplcFvFecHmL = 0._dp 
cplcFvFecHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFvFecHmT(gt1,gt2,gt3,Ye,epYE,ZP,ZER,cplcFvFecHmL(gt1,gt2,gt3)           & 
& ,cplcFvFecHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,epYU,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHmL = 0._dp 
cplcFdFuHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFuHmT(gt1,gt2,gt3,Yu,epYU,Yd,epYD,ZP,ZDL,ZDR,ZUL,ZUR,cplcFdFuHmL(gt1,gt2,gt3)& 
& ,cplcFdFuHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFusigma1L = 0._dp 
cplcFuFusigma1R = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFusigma1T(gt1,gt2,Yu,ZUL,ZUR,cplcFuFusigma1L(gt1,gt2),cplcFuFusigma1R(gt1,gt2))

 End Do 
End Do 


cplcFeFvHmL = 0._dp 
cplcFeFvHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFvHmT(gt1,gt2,gt3,Ye,epYE,ZP,ZER,cplcFeFvHmL(gt1,gt2,gt3)             & 
& ,cplcFeFvHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVGT(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVPL = 0._dp 
cplcFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVPT(gt1,gt2,g1,g2,TW,cplcFdFdVPL(gt1,gt2),cplcFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVPL = 0._dp 
cplcFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVPT(gt1,gt2,g1,g2,TW,cplcFeFeVPL(gt1,gt2),cplcFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFvFecVWmL = 0._dp 
cplcFvFecVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFecVWmT(gt1,gt2,g2,ZEL,cplcFvFecVWmL(gt1,gt2),cplcFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVGT(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVPL = 0._dp 
cplcFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVPT(gt1,gt2,g1,g2,TW,cplcFuFuVPL(gt1,gt2),cplcFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWmL = 0._dp 
cplcFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWmL(gt1,gt2),cplcFdFuVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFvVWmL = 0._dp 
cplcFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvVWmT(gt1,gt2,g2,ZEL,cplcFeFvVWmL(gt1,gt2),cplcFeFvVWmR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZL = 0._dp 
cplcFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZT(gt1,gt2,g1,g2,TW,cplcFvFvVZL(gt1,gt2),cplcFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplVGVGVGVG1 = 0._dp 
cplVGVGVGVG2 = 0._dp 
cplVGVGVGVG3 = 0._dp 
Call CouplingVGVGVGVGT(g3,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3)



cplcVWmVPVPVWm1 = 0._dp 
cplcVWmVPVPVWm2 = 0._dp 
cplcVWmVPVPVWm3 = 0._dp 
Call CouplingcVWmVPVPVWmT(g2,TW,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3)



cplcVWmVPVWmVZ1 = 0._dp 
cplcVWmVPVWmVZ2 = 0._dp 
cplcVWmVPVWmVZ3 = 0._dp 
Call CouplingcVWmVPVWmVZT(g2,TW,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3)



cplcVWmcVWmVWmVWm1 = 0._dp 
cplcVWmcVWmVWmVWm2 = 0._dp 
cplcVWmcVWmVWmVWm3 = 0._dp 
Call CouplingcVWmcVWmVWmVWmT(g2,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3)



cplcVWmVWmVZVZ1 = 0._dp 
cplcVWmVWmVZVZ2 = 0._dp 
cplcVWmVWmVZVZ3 = 0._dp 
Call CouplingcVWmVWmVZVZT(g2,TW,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3)



cplcgGgGVG = 0._dp 
Call CouplingcgGgGVGT(g3,cplcgGgGVG)



cplcgWmgAVWm = 0._dp 
Call CouplingcgWmgAVWmT(g2,TW,cplcgWmgAVWm)



cplcgWpCgAcVWm = 0._dp 
Call CouplingcgWpCgAcVWmT(g2,TW,cplcgWpCgAcVWm)



cplcgWmgWmVP = 0._dp 
Call CouplingcgWmgWmVPT(g2,TW,cplcgWmgWmVP)



cplcgWmgWmVZ = 0._dp 
Call CouplingcgWmgWmVZT(g2,TW,cplcgWmgWmVZ)



cplcgAgWmcVWm = 0._dp 
Call CouplingcgAgWmcVWmT(g2,TW,cplcgAgWmcVWm)



cplcgZgWmcVWm = 0._dp 
Call CouplingcgZgWmcVWmT(g2,TW,cplcgZgWmcVWm)



cplcgWpCgWpCVP = 0._dp 
Call CouplingcgWpCgWpCVPT(g2,TW,cplcgWpCgWpCVP)



cplcgAgWpCVWm = 0._dp 
Call CouplingcgAgWpCVWmT(g2,TW,cplcgAgWpCVWm)



cplcgZgWpCVWm = 0._dp 
Call CouplingcgZgWpCVWmT(g2,TW,cplcgZgWpCVWm)



cplcgWpCgWpCVZ = 0._dp 
Call CouplingcgWpCgWpCVZT(g2,TW,cplcgWpCgWpCVZ)



cplcgWmgZVWm = 0._dp 
Call CouplingcgWmgZVWmT(g2,TW,cplcgWmgZVWm)



cplcgWpCgZcVWm = 0._dp 
Call CouplingcgWpCgZcVWmT(g2,TW,cplcgWpCgZcVWm)



cplcgWmgWmAh = 0._dp 
Call CouplingcgWmgWmAhT(g2,v2,cplcgWmgWmAh)



cplcgWpCgWpCAh = 0._dp 
Call CouplingcgWpCgWpCAhT(g2,v2,cplcgWpCgWpCAh)



cplcgZgAhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgAhhT(gt3,g1,g2,v,v2,ZH,TW,cplcgZgAhh(gt3))

End Do 


cplcgWmgAHm = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWmgAHmT(gt3,g1,g2,v,v2,ZP,TW,cplcgWmgAHm(gt3))

End Do 


cplcgWpCgAcHm = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWpCgAcHmT(gt3,g1,g2,v,v2,ZP,TW,cplcgWpCgAcHm(gt3))

End Do 


cplcgWmgWmhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWmgWmhhT(gt3,g2,v,v2,ZH,cplcgWmgWmhh(gt3))

End Do 


cplcgWmgWmsigma1 = 0._dp 
Call CouplingcgWmgWmsigma1T(g2,v,cplcgWmgWmsigma1)



cplcgZgWmcHm = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgWmcHmT(gt3,g1,g2,v,v2,ZP,TW,cplcgZgWmcHm(gt3))

End Do 


cplcgWpCgWpChh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWpCgWpChhT(gt3,g2,v,v2,ZH,cplcgWpCgWpChh(gt3))

End Do 


cplcgZgWpCHm = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgWpCHmT(gt3,g1,g2,v,v2,ZP,TW,cplcgZgWpCHm(gt3))

End Do 


cplcgWpCgWpCsigma1 = 0._dp 
Call CouplingcgWpCgWpCsigma1T(g2,v,cplcgWpCgWpCsigma1)



cplcgZgZhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgZhhT(gt3,g1,g2,v,v2,ZH,TW,cplcgZgZhh(gt3))

End Do 


cplcgWmgZHm = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWmgZHmT(gt3,g1,g2,v,v2,ZP,TW,cplcgWmgZHm(gt3))

End Do 


cplcgWpCgZcHm = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWpCgZcHmT(gt3,g1,g2,v,v2,ZP,TW,cplcgWpCgZcHm(gt3))

End Do 


Iname = Iname - 1 
End Subroutine AllCouplingsReallyAll

Subroutine AllCouplings(Lam7,v,Lam5,Lam4,Lam3,Lam2,v2,ZH,Lam6,ZP,Lam1,g1,             & 
& g2,TW,g3,epYD,ZDL,ZDR,epYE,ZEL,ZER,epYU,ZUL,ZUR,Yd,Yu,Ye,cplAhAhAh,cplAhAhhh,          & 
& cplAhAhsigma1,cplAhhhhh,cplAhhhsigma1,cplAhHmcHm,cplAhsigma1sigma1,cplhhhhhh,          & 
& cplhhhhsigma1,cplhhHmcHm,cplhhsigma1sigma1,cplHmsigma1cHm,cplsigma1sigma1sigma1,       & 
& cplAhhhVZ,cplAhHmcVWm,cplAhcHmVWm,cplhhHmcVWm,cplhhsigma1VZ,cplhhcHmVWm,               & 
& cplHmsigma1cVWm,cplHmcHmVP,cplHmcHmVZ,cplsigma1cHmVWm,cplhhcVWmVWm,cplhhVZVZ,          & 
& cplHmcVWmVP,cplHmcVWmVZ,cplcHmVPVWm,cplcHmVWmVZ,cplVGVGVG,cplcVWmVPVWm,cplcVWmVWmVZ,   & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdsigma1L,cplcFdFdsigma1R,cplcFuFdcHmL,cplcFuFdcHmR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFesigma1L,cplcFeFesigma1R,cplcFvFecHmL,cplcFvFecHmR,     & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHmL,cplcFdFuHmR,cplcFuFusigma1L,cplcFuFusigma1R,       & 
& cplcFeFvHmL,cplcFeFvHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFeFeVPL,cplcFeFeVPR,           & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR)

Implicit None 
Real(dp), Intent(in) :: v,v2,ZH(2,2),ZP(2,2),g1,g2,TW,g3

Complex(dp), Intent(in) :: Lam7,Lam5,Lam4,Lam3,Lam2,Lam6,Lam1,epYD(3,3),ZDL(3,3),ZDR(3,3),epYE(3,3),             & 
& ZEL(3,3),ZER(3,3),epYU(3,3),ZUL(3,3),ZUR(3,3),Yd(3,3),Yu(3,3),Ye(3,3)

Complex(dp), Intent(out) :: cplAhAhAh,cplAhAhhh(2),cplAhAhsigma1,cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhHmcHm(2,2), & 
& cplAhsigma1sigma1,cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),               & 
& cplhhsigma1sigma1(2),cplHmsigma1cHm(2,2),cplsigma1sigma1sigma1,cplAhhhVZ(2),           & 
& cplAhHmcVWm(2),cplAhcHmVWm(2),cplhhHmcVWm(2,2),cplhhsigma1VZ(2),cplhhcHmVWm(2,2),      & 
& cplHmsigma1cVWm(2),cplHmcHmVP(2,2),cplHmcHmVZ(2,2),cplsigma1cHmVWm(2),cplhhcVWmVWm(2), & 
& cplhhVZVZ(2),cplHmcVWmVP(2),cplHmcVWmVZ(2),cplcHmVPVWm(2),cplcHmVWmVZ(2),              & 
& cplVGVGVG,cplcVWmVPVWm,cplcVWmVWmVZ,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),& 
& cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),& 
& cplcFdFdsigma1L(3,3),cplcFdFdsigma1R(3,3),cplcFuFdcHmL(3,3,2),cplcFuFdcHmR(3,3,2),     & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFesigma1L(3,3),cplcFeFesigma1R(3,3),       & 
& cplcFvFecHmL(3,3,2),cplcFvFecHmR(3,3,2),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),         & 
& cplcFdFuHmL(3,3,2),cplcFdFuHmR(3,3,2),cplcFuFusigma1L(3,3),cplcFuFusigma1R(3,3),       & 
& cplcFeFvHmL(3,3,2),cplcFeFvHmR(3,3,2),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),               & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFuFdcVWmL(3,3),& 
& cplcFuFdcVWmR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),& 
& cplcFvFecVWmL(3,3),cplcFvFecVWmR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),               & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFuFuVZL(3,3),& 
& cplcFuFuVZR(3,3),cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'AllCouplings'
 
cplAhAhAh = 0._dp 
Call CouplingAhAhAhT(Lam7,v,cplAhAhAh)



cplAhAhhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhAhhhT(gt3,Lam5,Lam7,Lam4,Lam3,Lam2,v,v2,ZH,cplAhAhhh(gt3))

End Do 


cplAhAhsigma1 = 0._dp 
Call CouplingAhAhsigma1T(Lam5,Lam7,v,v2,cplAhAhsigma1)



cplAhhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhhhhhT(gt2,gt3,Lam6,Lam5,Lam7,v,v2,ZH,cplAhhhhh(gt2,gt3))

 End Do 
End Do 


cplAhhhsigma1 = 0._dp 
Do gt2 = 1, 2
Call CouplingAhhhsigma1T(gt2,Lam6,Lam5,Lam7,v,v2,ZH,cplAhhhsigma1(gt2))

End Do 


cplAhHmcHm = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhHmcHmT(gt2,gt3,Lam6,Lam5,Lam7,Lam4,v,ZP,cplAhHmcHm(gt2,gt3))

 End Do 
End Do 


cplAhsigma1sigma1 = 0._dp 
Call CouplingAhsigma1sigma1T(Lam6,Lam5,v,v2,cplAhsigma1sigma1)



cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhhhhhT(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,v,v2,             & 
& ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhhhsigma1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call Couplinghhhhsigma1T(gt1,gt2,Lam6,Lam5,Lam7,v,v2,ZH,cplhhhhsigma1(gt1,gt2))

 End Do 
End Do 


cplhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhHmcHmT(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,v,               & 
& v2,ZH,ZP,cplhhHmcHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhsigma1sigma1 = 0._dp 
Do gt1 = 1, 2
Call Couplinghhsigma1sigma1T(gt1,Lam6,Lam5,Lam1,Lam4,Lam3,v,v2,ZH,cplhhsigma1sigma1(gt1))

End Do 


cplHmsigma1cHm = 0._dp 
Do gt1 = 1, 2
 Do gt3 = 1, 2
Call CouplingHmsigma1cHmT(gt1,gt3,Lam6,Lam5,Lam7,Lam4,v2,ZP,cplHmsigma1cHm(gt1,gt3))

 End Do 
End Do 


cplsigma1sigma1sigma1 = 0._dp 
Call Couplingsigma1sigma1sigma1T(Lam6,v2,cplsigma1sigma1sigma1)



cplAhhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingAhhhVZT(gt2,g1,g2,ZH,TW,cplAhhhVZ(gt2))

End Do 


cplAhHmcVWm = 0._dp 
Do gt2 = 1, 2
Call CouplingAhHmcVWmT(gt2,g2,ZP,cplAhHmcVWm(gt2))

End Do 


cplAhcHmVWm = 0._dp 
Do gt2 = 1, 2
Call CouplingAhcHmVWmT(gt2,g2,ZP,cplAhcHmVWm(gt2))

End Do 


cplhhHmcVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhHmcVWmT(gt1,gt2,g2,ZH,ZP,cplhhHmcVWm(gt1,gt2))

 End Do 
End Do 


cplhhsigma1VZ = 0._dp 
Do gt1 = 1, 2
Call Couplinghhsigma1VZT(gt1,g1,g2,ZH,TW,cplhhsigma1VZ(gt1))

End Do 


cplhhcHmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhcHmVWmT(gt1,gt2,g2,ZH,ZP,cplhhcHmVWm(gt1,gt2))

 End Do 
End Do 


cplHmsigma1cVWm = 0._dp 
Do gt1 = 1, 2
Call CouplingHmsigma1cVWmT(gt1,g2,ZP,cplHmsigma1cVWm(gt1))

End Do 


cplHmcHmVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHmcHmVPT(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVP(gt1,gt2))

 End Do 
End Do 


cplHmcHmVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHmcHmVZT(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVZ(gt1,gt2))

 End Do 
End Do 


cplsigma1cHmVWm = 0._dp 
Do gt2 = 1, 2
Call Couplingsigma1cHmVWmT(gt2,g2,ZP,cplsigma1cHmVWm(gt2))

End Do 


cplhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWmVWmT(gt1,g2,v,v2,ZH,cplhhcVWmVWm(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZT(gt1,g1,g2,v,v2,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplHmcVWmVP = 0._dp 
Do gt1 = 1, 2
Call CouplingHmcVWmVPT(gt1,g1,g2,v,v2,ZP,TW,cplHmcVWmVP(gt1))

End Do 


cplHmcVWmVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingHmcVWmVZT(gt1,g1,g2,v,v2,ZP,TW,cplHmcVWmVZ(gt1))

End Do 


cplcHmVPVWm = 0._dp 
Do gt1 = 1, 2
Call CouplingcHmVPVWmT(gt1,g1,g2,v,v2,ZP,TW,cplcHmVPVWm(gt1))

End Do 


cplcHmVWmVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingcHmVWmVZT(gt1,g1,g2,v,v2,ZP,TW,cplcHmVWmVZ(gt1))

End Do 


cplVGVGVG = 0._dp 
Call CouplingVGVGVGT(g3,cplVGVGVG)



cplcVWmVPVWm = 0._dp 
Call CouplingcVWmVPVWmT(g2,TW,cplcVWmVPVWm)



cplcVWmVWmVZ = 0._dp 
Call CouplingcVWmVWmVZT(g2,TW,cplcVWmVWmVZ)



cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,epYD,ZDL,ZDR,cplcFdFdAhL(gt1,gt2),cplcFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,epYE,ZEL,ZER,cplcFeFeAhL(gt1,gt2),cplcFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,epYU,ZUL,ZUR,cplcFuFuAhL(gt1,gt2),cplcFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,epYD,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdsigma1L = 0._dp 
cplcFdFdsigma1R = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdsigma1T(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdsigma1L(gt1,gt2),cplcFdFdsigma1R(gt1,gt2))

 End Do 
End Do 


cplcFuFdcHmL = 0._dp 
cplcFuFdcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFdcHmT(gt1,gt2,gt3,Yu,epYU,Yd,epYD,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,epYE,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFesigma1L = 0._dp 
cplcFeFesigma1R = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFesigma1T(gt1,gt2,Ye,ZEL,ZER,cplcFeFesigma1L(gt1,gt2),cplcFeFesigma1R(gt1,gt2))

 End Do 
End Do 


cplcFvFecHmL = 0._dp 
cplcFvFecHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFvFecHmT(gt1,gt2,gt3,Ye,epYE,ZP,ZER,cplcFvFecHmL(gt1,gt2,gt3)           & 
& ,cplcFvFecHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,epYU,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHmL = 0._dp 
cplcFdFuHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFuHmT(gt1,gt2,gt3,Yu,epYU,Yd,epYD,ZP,ZDL,ZDR,ZUL,ZUR,cplcFdFuHmL(gt1,gt2,gt3)& 
& ,cplcFdFuHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFusigma1L = 0._dp 
cplcFuFusigma1R = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFusigma1T(gt1,gt2,Yu,ZUL,ZUR,cplcFuFusigma1L(gt1,gt2),cplcFuFusigma1R(gt1,gt2))

 End Do 
End Do 


cplcFeFvHmL = 0._dp 
cplcFeFvHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFvHmT(gt1,gt2,gt3,Ye,epYE,ZP,ZER,cplcFeFvHmL(gt1,gt2,gt3)             & 
& ,cplcFeFvHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVGT(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVPL = 0._dp 
cplcFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVPT(gt1,gt2,g1,g2,TW,cplcFdFdVPL(gt1,gt2),cplcFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVPL = 0._dp 
cplcFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVPT(gt1,gt2,g1,g2,TW,cplcFeFeVPL(gt1,gt2),cplcFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFvFecVWmL = 0._dp 
cplcFvFecVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFecVWmT(gt1,gt2,g2,ZEL,cplcFvFecVWmL(gt1,gt2),cplcFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVGT(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVPL = 0._dp 
cplcFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVPT(gt1,gt2,g1,g2,TW,cplcFuFuVPL(gt1,gt2),cplcFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWmL = 0._dp 
cplcFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWmL(gt1,gt2),cplcFdFuVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFvVWmL = 0._dp 
cplcFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvVWmT(gt1,gt2,g2,ZEL,cplcFeFvVWmL(gt1,gt2),cplcFeFvVWmR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZL = 0._dp 
cplcFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZT(gt1,gt2,g1,g2,TW,cplcFvFvVZL(gt1,gt2),cplcFvFvVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine AllCouplings

Subroutine CouplingAhAhAhT(Lam7,v,res)

Implicit None 

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAh' 
 
res = 0._dp 
res = res+(3*Lam7*v)/2._dp
res = res+(-3*v*Conjg(Lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhT  
 
 
Subroutine CouplingAhAhhhT(gt3,Lam5,Lam7,Lam4,Lam3,Lam2,v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: v,v2,ZH(2,2)

Complex(dp), Intent(in) :: Lam5,Lam7,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam3*v*ZH(gt3,1))
res = res-(Lam4*v*ZH(gt3,1))
res = res+(Lam5*v*ZH(gt3,1))/2._dp
res = res-(Lam7*v2*ZH(gt3,1))/2._dp
res = res+(v*Conjg(Lam5)*ZH(gt3,1))/2._dp
res = res-(v2*Conjg(Lam7)*ZH(gt3,1))/2._dp
res = res-(Lam7*v*ZH(gt3,2))/2._dp
res = res-(Lam2*v2*ZH(gt3,2))
res = res-(v*Conjg(Lam7)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhT  
 
 
Subroutine CouplingAhAhsigma1T(Lam5,Lam7,v,v2,res)

Implicit None 

Real(dp), Intent(in) :: v,v2

Complex(dp), Intent(in) :: Lam5,Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhsigma1' 
 
res = 0._dp 
res = res-(Lam5*v)/2._dp
res = res-(Lam7*v2)/2._dp
res = res+(v*Conjg(Lam5))/2._dp
res = res+(v2*Conjg(Lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhsigma1T  
 
 
Subroutine CouplingAhhhhhT(gt2,gt3,Lam6,Lam5,Lam7,v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,v2,ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhhh' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(3*Lam6*v*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(Lam5*v2*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(v2*Conjg(Lam5)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*v*Conjg(Lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(Lam5*v*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(Lam7*v2*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(v*Conjg(Lam5)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(v2*Conjg(Lam7)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(Lam5*v*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(Lam7*v2*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(v*Conjg(Lam5)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(v2*Conjg(Lam7)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(Lam7*v*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(v*Conjg(Lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhhhT  
 
 
Subroutine CouplingAhhhsigma1T(gt2,Lam6,Lam5,Lam7,v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: v,v2,ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhsigma1' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam6*v*ZH(gt2,1))/2._dp
res = res-(Lam5*v2*ZH(gt2,1))/2._dp
res = res-(v2*Conjg(Lam5)*ZH(gt2,1))/2._dp
res = res-(v*Conjg(Lam6)*ZH(gt2,1))/2._dp
res = res-(Lam5*v*ZH(gt2,2))/2._dp
res = res-(Lam7*v2*ZH(gt2,2))/2._dp
res = res-(v*Conjg(Lam5)*ZH(gt2,2))/2._dp
res = res-(v2*Conjg(Lam7)*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhsigma1T  
 
 
Subroutine CouplingAhHmcHmT(gt2,gt3,Lam6,Lam5,Lam7,Lam4,v,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmcHm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(Lam6*v*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(v*Conjg(Lam6)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(Lam4*v*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(Lam5*v*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(Lam4*v*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(v*Conjg(Lam5)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(Lam7*v*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(v*Conjg(Lam7)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmcHmT  
 
 
Subroutine CouplingAhsigma1sigma1T(Lam6,Lam5,v,v2,res)

Implicit None 

Real(dp), Intent(in) :: v,v2

Complex(dp), Intent(in) :: Lam6,Lam5

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhsigma1sigma1' 
 
res = 0._dp 
res = res+(Lam6*v)/2._dp
res = res+(Lam5*v2)/2._dp
res = res-(v2*Conjg(Lam5))/2._dp
res = res-(v*Conjg(Lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhsigma1sigma1T  
 
 
Subroutine CouplinghhhhhhT(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,            & 
& v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: v,v2,ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-3*Lam1*v*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)
res = res+(-3*Lam6*v2*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*v2*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*Lam6*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(Lam3*v2*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(Lam4*v2*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(Lam5*v2*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(v2*Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*v*Conjg(Lam6)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*Lam6*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(Lam3*v2*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(Lam4*v2*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(Lam5*v2*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(v2*Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(-3*v*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(Lam3*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(Lam4*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(Lam5*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(-3*Lam7*v2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(v*Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(-3*v2*Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(-3*Lam6*v*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(Lam3*v2*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(Lam4*v2*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(Lam5*v2*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(v2*Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(-3*v*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(Lam3*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(Lam4*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(Lam5*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(-3*Lam7*v2*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(v*Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(-3*v2*Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(Lam3*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(Lam4*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(Lam5*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*Lam7*v2*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(v*Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*v2*Conjg(Lam7)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*Lam7*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-3*Lam2*v2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)
res = res+(-3*v*Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhhhT  
 
 
Subroutine Couplinghhhhsigma1T(gt1,gt2,Lam6,Lam5,Lam7,v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: v,v2,ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhsigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam6*v2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(v2*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-(Lam6*v*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res+(Lam5*v2*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res-(v2*Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res+(v*Conjg(Lam6)*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res-(Lam6*v*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res+(Lam5*v2*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res-(v2*Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res+(v*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res+(Lam5*v*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res+(-3*Lam7*v2*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res-(v*Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res+(3*v2*Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhsigma1T  
 
 
Subroutine CouplinghhHmcHmT(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,           & 
& v,v2,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: v,v2,ZH(2,2),ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam1*v*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))
res = res-(Lam6*v2*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(v2*Conjg(Lam6)*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(Lam6*v*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(Lam3*v2*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))
res = res-(v*Conjg(Lam6)*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(Lam4*v2*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(Lam5*v2*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(v*Conjg(Lam6)*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,1))
res = res-(Lam4*v*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(Lam5*v*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(v2*Conjg(Lam7)*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,1))
res = res-(Lam6*v*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,2))
res = res-(Lam4*v2*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-(v2*Conjg(Lam5)*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-(Lam4*v*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-(Lam7*v2*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,2))
res = res-(v*Conjg(Lam5)*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-(Lam3*v*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))
res = res-(Lam7*v2*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(v2*Conjg(Lam7)*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(Lam7*v*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(Lam2*v2*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))
res = res-(v*Conjg(Lam7)*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmcHmT  
 
 
Subroutine Couplinghhsigma1sigma1T(gt1,Lam6,Lam5,Lam1,Lam4,Lam3,v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: v,v2,ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam1,Lam4,Lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhsigma1sigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam1*v*ZH(gt1,1))
res = res-(Lam6*v2*ZH(gt1,1))/2._dp
res = res-(v2*Conjg(Lam6)*ZH(gt1,1))/2._dp
res = res-(Lam6*v*ZH(gt1,2))/2._dp
res = res-(Lam3*v2*ZH(gt1,2))
res = res-(Lam4*v2*ZH(gt1,2))
res = res+(Lam5*v2*ZH(gt1,2))/2._dp
res = res+(v2*Conjg(Lam5)*ZH(gt1,2))/2._dp
res = res-(v*Conjg(Lam6)*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhsigma1sigma1T  
 
 
Subroutine CouplingHmsigma1cHmT(gt1,gt3,Lam6,Lam5,Lam7,Lam4,v2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt3
Real(dp), Intent(in) :: v2,ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmsigma1cHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam6*v2*ZP(gt1,1)*ZP(gt3,1))/2._dp
res = res+(v2*Conjg(Lam6)*ZP(gt1,1)*ZP(gt3,1))/2._dp
res = res-(Lam4*v2*ZP(gt1,2)*ZP(gt3,1))/2._dp
res = res+(Lam5*v2*ZP(gt1,2)*ZP(gt3,1))/2._dp
res = res+(Lam4*v2*ZP(gt1,1)*ZP(gt3,2))/2._dp
res = res-(v2*Conjg(Lam5)*ZP(gt1,1)*ZP(gt3,2))/2._dp
res = res-(Lam7*v2*ZP(gt1,2)*ZP(gt3,2))/2._dp
res = res+(v2*Conjg(Lam7)*ZP(gt1,2)*ZP(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmsigma1cHmT  
 
 
Subroutine Couplingsigma1sigma1sigma1T(Lam6,v2,res)

Implicit None 

Real(dp), Intent(in) :: v2

Complex(dp), Intent(in) :: Lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingsigma1sigma1sigma1' 
 
res = 0._dp 
res = res+(-3*Lam6*v2)/2._dp
res = res+(3*v2*Conjg(Lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplingsigma1sigma1sigma1T  
 
 
Subroutine CouplingAhAhAhAhT(Lam2,res)

Implicit None 

Complex(dp), Intent(in) :: Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhAh' 
 
res = 0._dp 
res = res-3._dp*(Lam2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhAhT  
 
 
Subroutine CouplingAhAhAhhhT(gt4,Lam7,ZH,res)

Implicit None 

Integer, Intent(in) :: gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhhh' 
 
If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(3*Lam7*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(Lam7)*ZH(gt4,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhhhT  
 
 
Subroutine CouplingAhAhAhsigma1T(Lam7,res)

Implicit None 

Complex(dp), Intent(in) :: Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhsigma1' 
 
res = 0._dp 
res = res-3._dp*(Lam7)/2._dp
res = res+(-3*Conjg(Lam7))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhsigma1T  
 
 
Subroutine CouplingAhAhhhhhT(gt3,gt4,Lam5,Lam7,Lam4,Lam3,Lam2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam5,Lam7,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam3*ZH(gt3,1)*ZH(gt4,1))
res = res-(Lam4*ZH(gt3,1)*ZH(gt4,1))
res = res+(Lam5*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(Conjg(Lam5)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res-(Lam7*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Conjg(Lam7)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Lam7*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Conjg(Lam7)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Lam2*ZH(gt3,2)*ZH(gt4,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhhT  
 
 
Subroutine CouplingAhAhhhsigma1T(gt3,Lam5,Lam7,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam5,Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhsigma1' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam5*ZH(gt3,1))/2._dp
res = res+(Conjg(Lam5)*ZH(gt3,1))/2._dp
res = res-(Lam7*ZH(gt3,2))/2._dp
res = res+(Conjg(Lam7)*ZH(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhsigma1T  
 
 
Subroutine CouplingAhAhHmcHmT(gt3,gt4,Lam7,Lam3,Lam2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Lam7,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHmcHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam3*ZP(gt3,1)*ZP(gt4,1))
res = res-(Conjg(Lam7)*ZP(gt3,2)*ZP(gt4,1))
res = res-(Lam7*ZP(gt3,1)*ZP(gt4,2))
res = res-(Lam2*ZP(gt3,2)*ZP(gt4,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHmcHmT  
 
 
Subroutine CouplingAhAhsigma1sigma1T(Lam5,Lam4,Lam3,res)

Implicit None 

Complex(dp), Intent(in) :: Lam5,Lam4,Lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhsigma1sigma1' 
 
res = 0._dp 
res = res-1._dp*(Lam3)
res = res-1._dp*(Lam4)
res = res-1._dp*(Lam5)/2._dp
res = res-Conjg(Lam5)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhsigma1sigma1T  
 
 
Subroutine CouplingAhhhhhhhT(gt2,gt3,gt4,Lam6,Lam5,Lam7,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhhhhh' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(3*Lam6*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(Lam6)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res-(Lam5*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(Conjg(Lam5)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res-(Lam5*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res+(Conjg(Lam5)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res+(Lam7*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Conjg(Lam7)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Lam5*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res+(Conjg(Lam5)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res+(Lam7*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Conjg(Lam7)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res+(Lam7*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res-(Conjg(Lam7)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhhhhhT  
 
 
Subroutine CouplingAhhhhhsigma1T(gt2,gt3,Lam6,Lam5,Lam7,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhhhsigma1' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam6*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(Conjg(Lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(Lam5*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(Conjg(Lam5)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(Lam5*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(Conjg(Lam5)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(Lam7*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(Conjg(Lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhhhsigma1T  
 
 
Subroutine CouplingAhhhHmcHmT(gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam4,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2),ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhHmcHm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(Lam6*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res-(Conjg(Lam6)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res+(Lam4*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,1))/2._dp
res = res-(Lam5*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,1))/2._dp
res = res-(Lam4*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,2))/2._dp
res = res+(Conjg(Lam5)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,2))/2._dp
res = res+(Lam7*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res-(Conjg(Lam7)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhHmcHmT  
 
 
Subroutine CouplingAhhhsigma1sigma1T(gt2,Lam6,Lam5,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhsigma1sigma1' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(Lam6*ZH(gt2,1))/2._dp
res = res-(Conjg(Lam6)*ZH(gt2,1))/2._dp
res = res+(Lam5*ZH(gt2,2))/2._dp
res = res-(Conjg(Lam5)*ZH(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhsigma1sigma1T  
 
 
Subroutine CouplingAhHmsigma1cHmT(gt2,gt4,Lam6,Lam5,Lam7,Lam4,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt4
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmsigma1cHm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam6*ZP(gt2,1)*ZP(gt4,1))/2._dp
res = res-(Conjg(Lam6)*ZP(gt2,1)*ZP(gt4,1))/2._dp
res = res-(Lam4*ZP(gt2,2)*ZP(gt4,1))/2._dp
res = res-(Lam5*ZP(gt2,2)*ZP(gt4,1))/2._dp
res = res-(Lam4*ZP(gt2,1)*ZP(gt4,2))/2._dp
res = res-(Conjg(Lam5)*ZP(gt2,1)*ZP(gt4,2))/2._dp
res = res-(Lam7*ZP(gt2,2)*ZP(gt4,2))/2._dp
res = res-(Conjg(Lam7)*ZP(gt2,2)*ZP(gt4,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmsigma1cHmT  
 
 
Subroutine CouplingAhsigma1sigma1sigma1T(Lam6,res)

Implicit None 

Complex(dp), Intent(in) :: Lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhsigma1sigma1sigma1' 
 
res = 0._dp 
res = res-3._dp*(Lam6)/2._dp
res = res+(-3*Conjg(Lam6))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhsigma1sigma1sigma1T  
 
 
Subroutine CouplinghhhhhhhhT(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,           & 
& Lam2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-3*Lam1*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
res = res+(-3*Lam6*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(Lam6)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(-3*Lam6*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res-(Lam3*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res = res-(Lam5*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res-(Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(-3*Lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
res = res-(Lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
res = res-(Lam4*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
res = res-(Lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res+(-3*Lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res+(-3*Lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res+(-3*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
res = res-(Lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
res = res-(Lam4*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
res = res-(Lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res+(-3*Lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res+(-3*Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Lam3*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res = res-(Lam4*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res = res-(Lam5*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res-(Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res+(-3*Lam7*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res+(-3*Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res+(-3*Lam7*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res+(-3*Conjg(Lam7)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res-3*Lam2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhhhhhT  
 
 
Subroutine Couplinghhhhhhsigma1T(gt1,gt2,gt3,Lam6,Lam5,Lam7,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhsigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam6*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(Conjg(Lam6)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(Lam6*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(Lam5*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(Lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(Lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(Lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*Lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(3*Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhhhsigma1T  
 
 
Subroutine CouplinghhhhHmcHmT(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,               & 
& Lam3,Lam2,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2),ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam1*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))
res = res-(Lam6*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res-(Conjg(Lam6)*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res-(Lam6*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res-(Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res-(Lam3*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))
res = res-(Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,1))
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,1))/2._dp
res = res-(Lam5*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,1))/2._dp
res = res-(Lam4*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,1))/2._dp
res = res-(Lam5*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,1))/2._dp
res = res-(Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,1))
res = res-(Lam6*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,2))
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,2))/2._dp
res = res-(Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,2))/2._dp
res = res-(Lam4*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,2))/2._dp
res = res-(Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,2))/2._dp
res = res-(Lam7*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,2))
res = res-(Lam3*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))
res = res-(Lam7*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res-(Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res-(Lam7*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res-(Conjg(Lam7)*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res-(Lam2*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHmcHmT  
 
 
Subroutine Couplinghhhhsigma1sigma1T(gt1,gt2,Lam6,Lam5,Lam1,Lam4,Lam3,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam1,Lam4,Lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhsigma1sigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam1*ZH(gt1,1)*ZH(gt2,1))
res = res-(Lam6*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res-(Conjg(Lam6)*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res-(Lam6*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res-(Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res-(Lam3*ZH(gt1,2)*ZH(gt2,2))
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,2))
res = res+(Lam5*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res+(Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhsigma1sigma1T  
 
 
Subroutine CouplinghhHmsigma1cHmT(gt1,gt2,gt4,Lam6,Lam5,Lam7,Lam4,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt4
Real(dp), Intent(in) :: ZH(2,2),ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmsigma1cHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam6*ZH(gt1,2)*ZP(gt2,1)*ZP(gt4,1))/2._dp
res = res+(Conjg(Lam6)*ZH(gt1,2)*ZP(gt2,1)*ZP(gt4,1))/2._dp
res = res-(Lam4*ZH(gt1,2)*ZP(gt2,2)*ZP(gt4,1))/2._dp
res = res+(Lam5*ZH(gt1,2)*ZP(gt2,2)*ZP(gt4,1))/2._dp
res = res+(Lam4*ZH(gt1,2)*ZP(gt2,1)*ZP(gt4,2))/2._dp
res = res-(Conjg(Lam5)*ZH(gt1,2)*ZP(gt2,1)*ZP(gt4,2))/2._dp
res = res-(Lam7*ZH(gt1,2)*ZP(gt2,2)*ZP(gt4,2))/2._dp
res = res+(Conjg(Lam7)*ZH(gt1,2)*ZP(gt2,2)*ZP(gt4,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmsigma1cHmT  
 
 
Subroutine Couplinghhsigma1sigma1sigma1T(gt1,Lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhsigma1sigma1sigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(-3*Lam6*ZH(gt1,2))/2._dp
res = res+(3*Conjg(Lam6)*ZH(gt1,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhsigma1sigma1sigma1T  
 
 
Subroutine CouplingHmHmcHmcHmT(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,              & 
& Lam3,Lam2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmHmcHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-2*Lam1*ZP(gt1,1)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,1)
res = res-2*Conjg(Lam6)*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,1)
res = res-2*Conjg(Lam6)*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,1)*ZP(gt4,1)
res = res-2*Lam5*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,1)*ZP(gt4,1)
res = res-2*Lam6*ZP(gt1,1)*ZP(gt2,1)*ZP(gt3,2)*ZP(gt4,1)
res = res-(Lam3*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,2)*ZP(gt4,1))
res = res-(Lam4*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,2)*ZP(gt4,1))
res = res-(Lam3*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,1))
res = res-(Lam4*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,1))
res = res-2*Conjg(Lam7)*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,1)
res = res-2*Lam6*ZP(gt1,1)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,2)
res = res-(Lam3*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,2))
res = res-(Lam4*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,2))
res = res-(Lam3*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,1)*ZP(gt4,2))
res = res-(Lam4*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,1)*ZP(gt4,2))
res = res-2*Conjg(Lam7)*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,1)*ZP(gt4,2)
res = res-2*Conjg(Lam5)*ZP(gt1,1)*ZP(gt2,1)*ZP(gt3,2)*ZP(gt4,2)
res = res-2*Lam7*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,2)*ZP(gt4,2)
res = res-2*Lam7*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,2)
res = res-2*Lam2*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmHmcHmcHmT  
 
 
Subroutine CouplingHmsigma1sigma1cHmT(gt1,gt4,Lam6,Lam1,Lam3,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt4
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam1,Lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmsigma1sigma1cHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam1*ZP(gt1,1)*ZP(gt4,1))
res = res-(Conjg(Lam6)*ZP(gt1,2)*ZP(gt4,1))
res = res-(Lam6*ZP(gt1,1)*ZP(gt4,2))
res = res-(Lam3*ZP(gt1,2)*ZP(gt4,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmsigma1sigma1cHmT  
 
 
Subroutine Couplingsigma1sigma1sigma1sigma1T(Lam1,res)

Implicit None 

Complex(dp), Intent(in) :: Lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingsigma1sigma1sigma1sigma1' 
 
res = 0._dp 
res = res-3._dp*(Lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplingsigma1sigma1sigma1sigma1T  
 
 
Subroutine CouplingAhhhVZT(gt2,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*Cos(TW)*ZH(gt2,2))/2._dp
res = res+(g1*Sin(TW)*ZH(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhVZT  
 
 
Subroutine CouplingAhHmcVWmT(gt2,g2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g2,ZP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmcVWm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*ZP(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmcVWmT  
 
 
Subroutine CouplingAhcHmVWmT(gt2,g2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g2,ZP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHmVWm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*ZP(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHmVWmT  
 
 
Subroutine CouplinghhHmcVWmT(gt1,gt2,g2,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2),ZP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*ZH(gt1,1)*ZP(gt2,1))/2._dp
res = res+(g2*ZH(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmcVWmT  
 
 
Subroutine Couplinghhsigma1VZT(gt1,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhsigma1VZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*Cos(TW)*ZH(gt1,1))/2._dp
res = res-(g1*Sin(TW)*ZH(gt1,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhsigma1VZT  
 
 
Subroutine CouplinghhcHmVWmT(gt1,gt2,g2,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2),ZP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*ZH(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g2*ZH(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHmVWmT  
 
 
Subroutine CouplingHmsigma1cVWmT(gt1,g2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,ZP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmsigma1cVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*ZP(gt1,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmsigma1cVWmT  
 
 
Subroutine CouplingHmcHmVPT(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*Cos(TW)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g2*Sin(TW)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g1*Cos(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(g2*Sin(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVPT  
 
 
Subroutine CouplingHmcHmVZT(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*Cos(TW)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res+(g1*Sin(TW)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g2*Cos(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(g1*Sin(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVZT  
 
 
Subroutine Couplingsigma1cHmVWmT(gt2,g2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g2,ZP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingsigma1cHmVWm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*ZP(gt2,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplingsigma1cHmVWmT  
 
 
Subroutine CouplinghhcVWmVWmT(gt1,g2,v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,v,v2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*v*ZH(gt1,1))/2._dp
res = res+(g2**2*v2*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcVWmVWmT  
 
 
Subroutine CouplinghhVZVZT(gt1,g1,g2,v,v2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,v2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*v*Cos(TW)**2*ZH(gt1,1))/2._dp
res = res+g1*g2*v*Cos(TW)*Sin(TW)*ZH(gt1,1)
res = res+(g1**2*v*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res+(g2**2*v2*Cos(TW)**2*ZH(gt1,2))/2._dp
res = res+g1*g2*v2*Cos(TW)*Sin(TW)*ZH(gt1,2)
res = res+(g1**2*v2*Sin(TW)**2*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVZVZT  
 
 
Subroutine CouplingHmcVWmVPT(gt1,g1,g2,v,v2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,v2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcVWmVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*v*Cos(TW)*ZP(gt1,1))/2._dp
res = res+(g1*g2*v2*Cos(TW)*ZP(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcVWmVPT  
 
 
Subroutine CouplingHmcVWmVZT(gt1,g1,g2,v,v2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,v2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*v*Sin(TW)*ZP(gt1,1))/2._dp
res = res-(g1*g2*v2*Sin(TW)*ZP(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcVWmVZT  
 
 
Subroutine CouplingcHmVPVWmT(gt1,g1,g2,v,v2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,v2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHmVPVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*v*Cos(TW)*ZP(gt1,1))/2._dp
res = res+(g1*g2*v2*Cos(TW)*ZP(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHmVPVWmT  
 
 
Subroutine CouplingcHmVWmVZT(gt1,g1,g2,v,v2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,v2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHmVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*v*Sin(TW)*ZP(gt1,1))/2._dp
res = res-(g1*g2*v2*Sin(TW)*ZP(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHmVWmVZT  
 
 
Subroutine CouplingAhAhcVWmVWmT(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhcVWmVWm' 
 
res = 0._dp 
res = res+g2**2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhcVWmVWmT  
 
 
Subroutine CouplingAhAhVZVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVZVZ' 
 
res = 0._dp 
res = res+(g2**2*Cos(TW)**2)/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)
res = res+(g1**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVZVZT  
 
 
Subroutine CouplingAhHmcVWmVPT(gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmcVWmVP' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*Cos(TW)*ZP(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmcVWmVPT  
 
 
Subroutine CouplingAhHmcVWmVZT(gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmcVWmVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Sin(TW)*ZP(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmcVWmVZT  
 
 
Subroutine CouplingAhcHmVPVWmT(gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHmVPVWm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Cos(TW)*ZP(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHmVPVWmT  
 
 
Subroutine CouplingAhcHmVWmVZT(gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHmVWmVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*Sin(TW)*ZP(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHmVWmVZT  
 
 
Subroutine CouplinghhhhcVWmVWmT(gt1,gt2,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g2**2*ZH(gt1,2)*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhcVWmVWmT  
 
 
Subroutine CouplinghhhhVZVZT(gt1,gt2,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*Cos(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,1)*ZH(gt2,1)
res = res+(g1**2*Sin(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g2**2*Cos(TW)**2*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,2)*ZH(gt2,2)
res = res+(g1**2*Sin(TW)**2*ZH(gt1,2)*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZVZT  
 
 
Subroutine CouplinghhHmcVWmVPT(gt1,gt2,g1,g2,ZH,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmcVWmVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Cos(TW)*ZH(gt1,1)*ZP(gt2,1))/2._dp
res = res+(g1*g2*Cos(TW)*ZH(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmcVWmVPT  
 
 
Subroutine CouplinghhHmcVWmVZT(gt1,gt2,g1,g2,ZH,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmcVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*Sin(TW)*ZH(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g1*g2*Sin(TW)*ZH(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmcVWmVZT  
 
 
Subroutine CouplinghhcHmVPVWmT(gt1,gt2,g1,g2,ZH,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHmVPVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Cos(TW)*ZH(gt1,1)*ZP(gt2,1))/2._dp
res = res+(g1*g2*Cos(TW)*ZH(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHmVPVWmT  
 
 
Subroutine CouplinghhcHmVWmVZT(gt1,gt2,g1,g2,ZH,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHmVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*Sin(TW)*ZH(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g1*g2*Sin(TW)*ZH(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHmVWmVZT  
 
 
Subroutine CouplingHmsigma1cVWmVPT(gt1,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmsigma1cVWmVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*Cos(TW)*ZP(gt1,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmsigma1cVWmVPT  
 
 
Subroutine CouplingHmsigma1cVWmVZT(gt1,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmsigma1cVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Sin(TW)*ZP(gt1,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmsigma1cVWmVZT  
 
 
Subroutine CouplingHmcHmVPVPT(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVPVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1**2*Cos(TW)**2*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*ZP(gt1,1)*ZP(gt2,1)
res = res+(g2**2*Sin(TW)**2*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res+(g1**2*Cos(TW)**2*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*ZP(gt1,2)*ZP(gt2,2)
res = res+(g2**2*Sin(TW)**2*ZP(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVPVPT  
 
 
Subroutine CouplingHmcHmVPVZT(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVPVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Cos(2._dp*(TW))*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g1**2*Sin(2._dp*(TW))*ZP(gt1,1)*ZP(gt2,1))/4._dp
res = res+(g2**2*Sin(2._dp*(TW))*ZP(gt1,1)*ZP(gt2,1))/4._dp
res = res+(g1*g2*Cos(2._dp*(TW))*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(g1**2*Sin(2._dp*(TW))*ZP(gt1,2)*ZP(gt2,2))/4._dp
res = res+(g2**2*Sin(2._dp*(TW))*ZP(gt1,2)*ZP(gt2,2))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVPVZT  
 
 
Subroutine CouplingHmcHmcVWmVWmT(gt1,gt2,g2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res+(g2**2*ZP(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmcVWmVWmT  
 
 
Subroutine CouplingHmcHmVZVZT(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*Cos(TW)**2*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g1*g2*Cos(TW)*Sin(TW)*ZP(gt1,1)*ZP(gt2,1))
res = res+(g1**2*Sin(TW)**2*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res+(g2**2*Cos(TW)**2*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(g1*g2*Cos(TW)*Sin(TW)*ZP(gt1,2)*ZP(gt2,2))
res = res+(g1**2*Sin(TW)**2*ZP(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVZVZT  
 
 
Subroutine Couplingsigma1sigma1cVWmVWmT(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingsigma1sigma1cVWmVWm' 
 
res = 0._dp 
res = res+g2**2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplingsigma1sigma1cVWmVWmT  
 
 
Subroutine Couplingsigma1sigma1VZVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingsigma1sigma1VZVZ' 
 
res = 0._dp 
res = res+(g2**2*Cos(TW)**2)/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)
res = res+(g1**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplingsigma1sigma1VZVZT  
 
 
Subroutine Couplingsigma1cHmVPVWmT(gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingsigma1cHmVPVWm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Cos(TW)*ZP(gt2,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplingsigma1cHmVPVWmT  
 
 
Subroutine Couplingsigma1cHmVWmVZT(gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingsigma1cHmVWmVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*Sin(TW)*ZP(gt2,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplingsigma1cHmVWmVZT  
 
 
Subroutine CouplingVGVGVGT(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVGT  
 
 
Subroutine CouplingcVWmVPVWmT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVPVWm' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVPVWmT  
 
 
Subroutine CouplingcVWmVWmVZT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVWmVZ' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVWmVZT  
 
 
Subroutine CouplingcFdFdAhT(gt1,gt2,epYD,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epYD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epYD(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epYD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdAhT  
 
 
Subroutine CouplingcFeFeAhT(gt1,gt2,epYE,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epYE(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*epYE(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epYE(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeAhT  
 
 
Subroutine CouplingcFuFuAhT(gt1,gt2,epYU,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epYU(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epYU(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epYU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuAhT  
 
 
Subroutine CouplingcFdFdhhT(gt1,gt2,gt3,Yd,epYD,ZH,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Yd(3,3),epYD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epYD(j1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epYD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdhhT  
 
 
Subroutine CouplingcFdFdsigma1T(gt1,gt2,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdsigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdsigma1T  
 
 
Subroutine CouplingcFuFdcHmT(gt1,gt2,gt3,Yu,epYU,Yd,epYD,ZP,ZDL,ZDR,ZUL,              & 
& ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Yu(3,3),epYU(3,3),Yd(3,3),epYD(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yu(j1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*epYU(j1,j2)*ZP(gt3,2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZUL(gt1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(epYD(j1,j2))*ZDR(gt2,j1)*ZUL(gt1,j2)*ZP(gt3,2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdcHmT  
 
 
Subroutine CouplingcFeFehhT(gt1,gt2,gt3,Ye,epYE,ZH,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Ye(3,3),epYE(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFehh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*epYE(j1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epYE(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFehhT  
 
 
Subroutine CouplingcFeFesigma1T(gt1,gt2,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFesigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFesigma1T  
 
 
Subroutine CouplingcFvFecHmT(gt1,gt2,gt3,Ye,epYE,ZP,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Ye(3,3),epYE(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFvFecHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
resR = 0._dp 
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,gt1))*ZER(gt2,j1)*ZP(gt3,1)
End Do 
Do j1 = 1,3
resR = resR+Conjg(epYE(j1,gt1))*ZER(gt2,j1)*ZP(gt3,2)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFvFecHmT  
 
 
Subroutine CouplingcFuFuhhT(gt1,gt2,gt3,Yu,epYU,ZH,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Yu(3,3),epYU(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epYU(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epYU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuhhT  
 
 
Subroutine CouplingcFdFuHmT(gt1,gt2,gt3,Yu,epYU,Yd,epYD,ZP,ZDL,ZDR,ZUL,               & 
& ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Yu(3,3),epYU(3,3),Yd(3,3),epYD(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFuHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yd(j1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*epYD(j1,j2)*ZP(gt3,2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(epYU(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)*ZP(gt3,2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFuHmT  
 
 
Subroutine CouplingcFuFusigma1T(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFusigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFusigma1T  
 
 
Subroutine CouplingcFeFvHmT(gt1,gt2,gt3,Ye,epYE,ZP,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Ye(3,3),epYE(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+Conjg(ZER(gt1,j1))*Ye(j1,gt2)*ZP(gt3,1)
End Do 
Do j1 = 1,3
resL = resL+Conjg(ZER(gt1,j1))*epYE(j1,gt2)*ZP(gt3,2)
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvHmT  
 
 
Subroutine CouplingcFdFdVGT(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVGT  
 
 
Subroutine CouplingcFdFdVPT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Cos(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(g1*Cos(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVPT  
 
 
Subroutine CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-(g1*Sin(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVZT  
 
 
Subroutine CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZDL(gt2,j1))*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdcVWmT  
 
 
Subroutine CouplingcFeFeVPT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+g1*Cos(TW)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVPT  
 
 
Subroutine CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-(g1*Sin(TW))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVZT  
 
 
Subroutine CouplingcFvFecVWmT(gt1,gt2,g2,ZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFvFecVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(ZEL(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFvFecVWmT  
 
 
Subroutine CouplingcFuFuVGT(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVGT  
 
 
Subroutine CouplingcFuFuVPT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Cos(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*g1*Cos(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVPT  
 
 
Subroutine CouplingcFdFuVWmT(gt1,gt2,g2,ZDL,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFuVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZUL(gt2,j1))*ZDL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFuVWmT  
 
 
Subroutine CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(2*g1*Sin(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVZT  
 
 
Subroutine CouplingcFeFvVWmT(gt1,gt2,g2,ZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt2.le.3).And.(gt2.ge.1)) Then 
resL = resL-((g2*ZEL(gt1,gt2))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvVWmT  
 
 
Subroutine CouplingcFvFvVZT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFvFvVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFvFvVZT  
 
 
Subroutine CouplingVGVGVGVGT(g3,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVGVG' 
 
res1 = 0._dp 
res1 = res1-16*g3**2
res2 = 0._dp 
res3 = 0._dp 
res3 = res3+16*g3**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVGVGT  
 
 
Subroutine CouplingcVWmVPVPVWmT(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVPVPVWm' 
 
res1 = 0._dp 
res1 = res1+g2**2*Sin(TW)**2
res2 = 0._dp 
res2 = res2+g2**2*Sin(TW)**2
res3 = 0._dp 
res3 = res3-2*g2**2*Sin(TW)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVPVPVWmT  
 
 
Subroutine CouplingcVWmVPVWmVZT(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVPVWmVZ' 
 
res1 = 0._dp 
res1 = res1+g2**2*Cos(TW)*Sin(TW)
res2 = 0._dp 
res2 = res2-(g2**2*Sin(2._dp*(TW)))
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)*Sin(TW)
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVPVWmVZT  
 
 
Subroutine CouplingcVWmcVWmVWmVWmT(g2,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmcVWmVWmVWm' 
 
res1 = 0._dp 
res1 = res1+2*g2**2
res2 = 0._dp 
res2 = res2-g2**2
res3 = 0._dp 
res3 = res3-g2**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmcVWmVWmVWmT  
 
 
Subroutine CouplingcVWmVWmVZVZT(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVWmVZVZ' 
 
res1 = 0._dp 
res1 = res1-2*g2**2*Cos(TW)**2
res2 = 0._dp 
res2 = res2+g2**2*Cos(TW)**2
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVWmVZVZT  
 
 
Subroutine CouplingcgGgGVGT(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgGgGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgGgGVGT  
 
 
Subroutine CouplingcgWmgAVWmT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgAVWm' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgAVWmT  
 
 
Subroutine CouplingcgWpCgAcVWmT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgAcVWm' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgAcVWmT  
 
 
Subroutine CouplingcgWmgWmVPT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgWmVP' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgWmVPT  
 
 
Subroutine CouplingcgWmgWmVZT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgWmVZ' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgWmVZT  
 
 
Subroutine CouplingcgAgWmcVWmT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgAgWmcVWm' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgAgWmcVWmT  
 
 
Subroutine CouplingcgZgWmcVWmT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWmcVWm' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWmcVWmT  
 
 
Subroutine CouplingcgWpCgWpCVPT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgWpCVP' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgWpCVPT  
 
 
Subroutine CouplingcgAgWpCVWmT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgAgWpCVWm' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgAgWpCVWmT  
 
 
Subroutine CouplingcgZgWpCVWmT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpCVWm' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpCVWmT  
 
 
Subroutine CouplingcgWpCgWpCVZT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgWpCVZ' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgWpCVZT  
 
 
Subroutine CouplingcgWmgZVWmT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgZVWm' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgZVWmT  
 
 
Subroutine CouplingcgWpCgZcVWmT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgZcVWm' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgZcVWmT  
 
 
Subroutine CouplingcgWmgWmAhT(g2,v2,res)

Implicit None 

Real(dp), Intent(in) :: g2,v2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgWmAh' 
 
res = 0._dp 
res = res-(g2**2*v2*RXiWm)/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgWmAhT  
 
 
Subroutine CouplingcgWpCgWpCAhT(g2,v2,res)

Implicit None 

Real(dp), Intent(in) :: g2,v2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgWpCAh' 
 
res = 0._dp 
res = res+(g2**2*v2*RXiWm)/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgWpCAhT  
 
 
Subroutine CouplingcgZgAhhT(gt3,g1,g2,v,v2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,v2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgAhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*v*Cos(2._dp*(TW))*RXiZ*ZH(gt3,1))/4._dp
res = res+(g1**2*v*RXiZ*Sin(2._dp*(TW))*ZH(gt3,1))/8._dp
res = res-(g2**2*v*RXiZ*Sin(2._dp*(TW))*ZH(gt3,1))/8._dp
res = res+(g1*g2*v2*Cos(2._dp*(TW))*RXiZ*ZH(gt3,2))/4._dp
res = res+(g1**2*v2*RXiZ*Sin(2._dp*(TW))*ZH(gt3,2))/8._dp
res = res-(g2**2*v2*RXiZ*Sin(2._dp*(TW))*ZH(gt3,2))/8._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgAhhT  
 
 
Subroutine CouplingcgWmgAHmT(gt3,g1,g2,v,v2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,v2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgAHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*v*Cos(TW)*RXiWm*ZP(gt3,1))/4._dp
res = res-(g2**2*v*RXiWm*Sin(TW)*ZP(gt3,1))/4._dp
res = res-(g1*g2*v2*Cos(TW)*RXiWm*ZP(gt3,2))/4._dp
res = res-(g2**2*v2*RXiWm*Sin(TW)*ZP(gt3,2))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgAHmT  
 
 
Subroutine CouplingcgWpCgAcHmT(gt3,g1,g2,v,v2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,v2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgAcHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*v*Cos(TW)*RXiWm*ZP(gt3,1))/4._dp
res = res-(g2**2*v*RXiWm*Sin(TW)*ZP(gt3,1))/4._dp
res = res-(g1*g2*v2*Cos(TW)*RXiWm*ZP(gt3,2))/4._dp
res = res-(g2**2*v2*RXiWm*Sin(TW)*ZP(gt3,2))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgAcHmT  
 
 
Subroutine CouplingcgWmgWmhhT(gt3,g2,v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,v,v2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgWmhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*v*RXiWm*ZH(gt3,1))/4._dp
res = res-(g2**2*v2*RXiWm*ZH(gt3,2))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgWmhhT  
 
 
Subroutine CouplingcgWmgWmsigma1T(g2,v,res)

Implicit None 

Real(dp), Intent(in) :: g2,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgWmsigma1' 
 
res = 0._dp 
res = res-(g2**2*v*RXiWm)/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgWmsigma1T  
 
 
Subroutine CouplingcgZgWmcHmT(gt3,g1,g2,v,v2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,v2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWmcHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*v*Cos(TW)*RXiZ*ZP(gt3,1))/4._dp
res = res+(g1*g2*v*RXiZ*Sin(TW)*ZP(gt3,1))/4._dp
res = res+(g2**2*v2*Cos(TW)*RXiZ*ZP(gt3,2))/4._dp
res = res+(g1*g2*v2*RXiZ*Sin(TW)*ZP(gt3,2))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWmcHmT  
 
 
Subroutine CouplingcgWpCgWpChhT(gt3,g2,v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,v,v2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgWpChh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*v*RXiWm*ZH(gt3,1))/4._dp
res = res-(g2**2*v2*RXiWm*ZH(gt3,2))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgWpChhT  
 
 
Subroutine CouplingcgZgWpCHmT(gt3,g1,g2,v,v2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,v2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpCHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*v*Cos(TW)*RXiZ*ZP(gt3,1))/4._dp
res = res+(g1*g2*v*RXiZ*Sin(TW)*ZP(gt3,1))/4._dp
res = res+(g2**2*v2*Cos(TW)*RXiZ*ZP(gt3,2))/4._dp
res = res+(g1*g2*v2*RXiZ*Sin(TW)*ZP(gt3,2))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpCHmT  
 
 
Subroutine CouplingcgWpCgWpCsigma1T(g2,v,res)

Implicit None 

Real(dp), Intent(in) :: g2,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgWpCsigma1' 
 
res = 0._dp 
res = res+(g2**2*v*RXiWm)/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgWpCsigma1T  
 
 
Subroutine CouplingcgZgZhhT(gt3,g1,g2,v,v2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,v2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgZhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*v*Cos(TW)**2*RXiZ*ZH(gt3,1))/4._dp
res = res-(g1*g2*v*Cos(TW)*RXiZ*Sin(TW)*ZH(gt3,1))/2._dp
res = res-(g1**2*v*RXiZ*Sin(TW)**2*ZH(gt3,1))/4._dp
res = res-(g2**2*v2*Cos(TW)**2*RXiZ*ZH(gt3,2))/4._dp
res = res-(g1*g2*v2*Cos(TW)*RXiZ*Sin(TW)*ZH(gt3,2))/2._dp
res = res-(g1**2*v2*RXiZ*Sin(TW)**2*ZH(gt3,2))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgZhhT  
 
 
Subroutine CouplingcgWmgZHmT(gt3,g1,g2,v,v2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,v2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgZHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*v*Cos(TW)*RXiWm*ZP(gt3,1))/4._dp
res = res+(g1*g2*v*RXiWm*Sin(TW)*ZP(gt3,1))/4._dp
res = res-(g2**2*v2*Cos(TW)*RXiWm*ZP(gt3,2))/4._dp
res = res+(g1*g2*v2*RXiWm*Sin(TW)*ZP(gt3,2))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgZHmT  
 
 
Subroutine CouplingcgWpCgZcHmT(gt3,g1,g2,v,v2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,v2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgZcHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*v*Cos(TW)*RXiWm*ZP(gt3,1))/4._dp
res = res+(g1*g2*v*RXiWm*Sin(TW)*ZP(gt3,1))/4._dp
res = res-(g2**2*v2*Cos(TW)*RXiWm*ZP(gt3,2))/4._dp
res = res+(g1*g2*v2*RXiWm*Sin(TW)*ZP(gt3,2))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgZcHmT  
 
 
Subroutine CouplingsForEffPot4(Lam2,Lam5,Lam7,Lam4,Lam3,ZH,ZP,Lam6,Lam1,              & 
& cplAhAhAhAh,cplAhAhhhhh,cplAhAhHmcHm,cplAhAhsigma1sigma1,cplhhhhhhhh,cplhhhhHmcHm,     & 
& cplhhhhsigma1sigma1,cplHmHmcHmcHm,cplHmsigma1sigma1cHm,cplsigma1sigma1sigma1sigma1)

Implicit None 
Real(dp), Intent(in) :: ZH(2,2),ZP(2,2)

Complex(dp), Intent(in) :: Lam2,Lam5,Lam7,Lam4,Lam3,Lam6,Lam1

Complex(dp), Intent(out) :: cplAhAhAhAh,cplAhAhhhhh(2,2),cplAhAhHmcHm(2,2),cplAhAhsigma1sigma1,cplhhhhhhhh(2,2,2,2),& 
& cplhhhhHmcHm(2,2,2,2),cplhhhhsigma1sigma1(2,2),cplHmHmcHmcHm(2,2,2,2),cplHmsigma1sigma1cHm(2,2),& 
& cplsigma1sigma1sigma1sigma1

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForEffPot4'
 
cplAhAhAhAh = 0._dp 
Call CouplingAhAhAhAh2L(Lam2,cplAhAhAhAh)



cplAhAhhhhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhhhhh2L(gt3,gt4,Lam5,Lam7,Lam4,Lam3,Lam2,ZH,cplAhAhhhhh(gt3,gt4))

 End Do 
End Do 


cplAhAhHmcHm = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhHmcHm2L(gt3,gt4,Lam7,Lam3,Lam2,ZP,cplAhAhHmcHm(gt3,gt4))

 End Do 
End Do 


cplAhAhsigma1sigma1 = 0._dp 
Call CouplingAhAhsigma1sigma12L(Lam5,Lam4,Lam3,cplAhAhsigma1sigma1)



cplhhhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call Couplinghhhhhhhh2L(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,           & 
& ZH,cplhhhhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplhhhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplinghhhhHmcHm2L(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,               & 
& Lam2,ZH,ZP,cplhhhhHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplhhhhsigma1sigma1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call Couplinghhhhsigma1sigma12L(gt1,gt2,Lam6,Lam5,Lam1,Lam4,Lam3,ZH,cplhhhhsigma1sigma1(gt1,gt2))

 End Do 
End Do 


cplHmHmcHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingHmHmcHmcHm2L(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,              & 
& Lam2,ZP,cplHmHmcHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplHmsigma1sigma1cHm = 0._dp 
Do gt1 = 1, 2
 Do gt4 = 1, 2
Call CouplingHmsigma1sigma1cHm2L(gt1,gt4,Lam6,Lam1,Lam3,ZP,cplHmsigma1sigma1cHm(gt1,gt4))

 End Do 
End Do 


cplsigma1sigma1sigma1sigma1 = 0._dp 
Call Couplingsigma1sigma1sigma1sigma12L(Lam1,cplsigma1sigma1sigma1sigma1)



Iname = Iname - 1 
End Subroutine CouplingsForEffPot4

Subroutine CouplingsForEffPot3(Lam7,v,Lam5,Lam4,Lam3,Lam2,v2,ZH,Lam6,ZP,              & 
& Lam1,g3,epYD,ZDL,ZDR,epYE,ZEL,ZER,epYU,ZUL,ZUR,Yd,Yu,Ye,cplAhAhAh,cplAhAhhh,           & 
& cplAhAhsigma1,cplAhhhhh,cplAhhhsigma1,cplAhHmcHm,cplAhsigma1sigma1,cplhhhhhh,          & 
& cplhhhhsigma1,cplhhHmcHm,cplhhsigma1sigma1,cplHmsigma1cHm,cplsigma1sigma1sigma1,       & 
& cplVGVGVG,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,     & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdsigma1L,cplcFdFdsigma1R,cplcFuFdcHmL,cplcFuFdcHmR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFesigma1L,cplcFeFesigma1R,cplcFvFecHmL,cplcFvFecHmR,     & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHmL,cplcFdFuHmR,cplcFuFusigma1L,cplcFuFusigma1R,       & 
& cplcFeFvHmL,cplcFeFvHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR)

Implicit None 
Real(dp), Intent(in) :: v,v2,ZH(2,2),ZP(2,2),g3

Complex(dp), Intent(in) :: Lam7,Lam5,Lam4,Lam3,Lam2,Lam6,Lam1,epYD(3,3),ZDL(3,3),ZDR(3,3),epYE(3,3),             & 
& ZEL(3,3),ZER(3,3),epYU(3,3),ZUL(3,3),ZUR(3,3),Yd(3,3),Yu(3,3),Ye(3,3)

Complex(dp), Intent(out) :: cplAhAhAh,cplAhAhhh(2),cplAhAhsigma1,cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhHmcHm(2,2), & 
& cplAhsigma1sigma1,cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),               & 
& cplhhsigma1sigma1(2),cplHmsigma1cHm(2,2),cplsigma1sigma1sigma1,cplVGVGVG,              & 
& cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),  & 
& cplcFuFuAhR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdsigma1L(3,3),           & 
& cplcFdFdsigma1R(3,3),cplcFuFdcHmL(3,3,2),cplcFuFdcHmR(3,3,2),cplcFeFehhL(3,3,2),       & 
& cplcFeFehhR(3,3,2),cplcFeFesigma1L(3,3),cplcFeFesigma1R(3,3),cplcFvFecHmL(3,3,2),      & 
& cplcFvFecHmR(3,3,2),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFdFuHmL(3,3,2),          & 
& cplcFdFuHmR(3,3,2),cplcFuFusigma1L(3,3),cplcFuFusigma1R(3,3),cplcFeFvHmL(3,3,2),       & 
& cplcFeFvHmR(3,3,2),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForEffPot3'
 
cplAhAhAh = 0._dp 
Call CouplingAhAhAh2L(Lam7,v,cplAhAhAh)



cplAhAhhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhAhhh2L(gt3,Lam5,Lam7,Lam4,Lam3,Lam2,v,v2,ZH,cplAhAhhh(gt3))

End Do 


cplAhAhsigma1 = 0._dp 
Call CouplingAhAhsigma12L(Lam5,Lam7,v,v2,cplAhAhsigma1)



cplAhhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhhhhh2L(gt2,gt3,Lam6,Lam5,Lam7,v,v2,ZH,cplAhhhhh(gt2,gt3))

 End Do 
End Do 


cplAhhhsigma1 = 0._dp 
Do gt2 = 1, 2
Call CouplingAhhhsigma12L(gt2,Lam6,Lam5,Lam7,v,v2,ZH,cplAhhhsigma1(gt2))

End Do 


cplAhHmcHm = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhHmcHm2L(gt2,gt3,Lam6,Lam5,Lam7,Lam4,v,ZP,cplAhHmcHm(gt2,gt3))

 End Do 
End Do 


cplAhsigma1sigma1 = 0._dp 
Call CouplingAhsigma1sigma12L(Lam6,Lam5,v,v2,cplAhsigma1sigma1)



cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call Couplinghhhhhh2L(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,v,               & 
& v2,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhhhsigma1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call Couplinghhhhsigma12L(gt1,gt2,Lam6,Lam5,Lam7,v,v2,ZH,cplhhhhsigma1(gt1,gt2))

 End Do 
End Do 


cplhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhHmcHm2L(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,v,              & 
& v2,ZH,ZP,cplhhHmcHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhsigma1sigma1 = 0._dp 
Do gt1 = 1, 2
Call Couplinghhsigma1sigma12L(gt1,Lam6,Lam5,Lam1,Lam4,Lam3,v,v2,ZH,cplhhsigma1sigma1(gt1))

End Do 


cplHmsigma1cHm = 0._dp 
Do gt1 = 1, 2
 Do gt3 = 1, 2
Call CouplingHmsigma1cHm2L(gt1,gt3,Lam6,Lam5,Lam7,Lam4,v2,ZP,cplHmsigma1cHm(gt1,gt3))

 End Do 
End Do 


cplsigma1sigma1sigma1 = 0._dp 
Call Couplingsigma1sigma1sigma12L(Lam6,v2,cplsigma1sigma1sigma1)



cplVGVGVG = 0._dp 
Call CouplingVGVGVG2L(g3,cplVGVGVG)



cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdAh2L(gt1,gt2,epYD,ZDL,ZDR,cplcFdFdAhL(gt1,gt2),cplcFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeAh2L(gt1,gt2,epYE,ZEL,ZER,cplcFeFeAhL(gt1,gt2),cplcFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuAh2L(gt1,gt2,epYU,ZUL,ZUR,cplcFuFuAhL(gt1,gt2),cplcFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhh2L(gt1,gt2,gt3,Yd,epYD,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)        & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdsigma1L = 0._dp 
cplcFdFdsigma1R = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdsigma12L(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdsigma1L(gt1,gt2),               & 
& cplcFdFdsigma1R(gt1,gt2))

 End Do 
End Do 


cplcFuFdcHmL = 0._dp 
cplcFuFdcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFdcHm2L(gt1,gt2,gt3,Yu,epYU,Yd,epYD,ZP,ZDL,ZDR,ZUL,ZUR,               & 
& cplcFuFdcHmL(gt1,gt2,gt3),cplcFuFdcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehh2L(gt1,gt2,gt3,Ye,epYE,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)        & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFesigma1L = 0._dp 
cplcFeFesigma1R = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFesigma12L(gt1,gt2,Ye,ZEL,ZER,cplcFeFesigma1L(gt1,gt2),               & 
& cplcFeFesigma1R(gt1,gt2))

 End Do 
End Do 


cplcFvFecHmL = 0._dp 
cplcFvFecHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFvFecHm2L(gt1,gt2,gt3,Ye,epYE,ZP,ZER,cplcFvFecHmL(gt1,gt2,gt3)          & 
& ,cplcFvFecHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhh2L(gt1,gt2,gt3,Yu,epYU,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)        & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHmL = 0._dp 
cplcFdFuHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFuHm2L(gt1,gt2,gt3,Yu,epYU,Yd,epYD,ZP,ZDL,ZDR,ZUL,ZUR,cplcFdFuHmL(gt1,gt2,gt3)& 
& ,cplcFdFuHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFusigma1L = 0._dp 
cplcFuFusigma1R = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFusigma12L(gt1,gt2,Yu,ZUL,ZUR,cplcFuFusigma1L(gt1,gt2),               & 
& cplcFuFusigma1R(gt1,gt2))

 End Do 
End Do 


cplcFeFvHmL = 0._dp 
cplcFeFvHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFvHm2L(gt1,gt2,gt3,Ye,epYE,ZP,ZER,cplcFeFvHmL(gt1,gt2,gt3)            & 
& ,cplcFeFvHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVG2L(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVG2L(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsForEffPot3

Subroutine CouplingAhAhAhAh2L(Lam2,res)

Implicit None 

Complex(dp), Intent(in) :: Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhAh' 
 
res = 0._dp 
res = res-3._dp*(Lam2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhAh2L  
 
 
Subroutine CouplingAhAhhhhh2L(gt3,gt4,Lam5,Lam7,Lam4,Lam3,Lam2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam5,Lam7,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt3.eq.gt4)) Then 
res = res-(Lam3*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((gt3.eq.gt4)) Then 
res = res-(Lam4*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((gt3.eq.gt4)) Then 
res = res+(Lam5*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((gt3.eq.gt4)) Then 
res = res+(Conjg(Lam5)*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((gt3.eq.gt4)) Then 
res = res-(Lam7*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((gt3.eq.gt4)) Then 
res = res-(Conjg(Lam7)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((gt3.eq.gt4)) Then 
res = res-(Lam7*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((gt3.eq.gt4)) Then 
res = res-(Conjg(Lam7)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((gt3.eq.gt4)) Then 
res = res-(Lam2*ZH(gt3,2)*ZH(gt4,2))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhh2L  
 
 
Subroutine CouplingAhAhHmcHm2L(gt3,gt4,Lam7,Lam3,Lam2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Lam7,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHmcHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt3.eq.gt4)) Then 
res = res-(Lam3*ZP(gt3,1)*ZP(gt4,1))
End If 
If ((gt3.eq.gt4)) Then 
res = res-(Conjg(Lam7)*ZP(gt3,2)*ZP(gt4,1))
End If 
If ((gt3.eq.gt4)) Then 
res = res-(Lam7*ZP(gt3,1)*ZP(gt4,2))
End If 
If ((gt3.eq.gt4)) Then 
res = res-(Lam2*ZP(gt3,2)*ZP(gt4,2))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHmcHm2L  
 
 
Subroutine CouplingAhAhsigma1sigma12L(Lam5,Lam4,Lam3,res)

Implicit None 

Complex(dp), Intent(in) :: Lam5,Lam4,Lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhsigma1sigma1' 
 
res = 0._dp 
res = res-1._dp*(Lam3)
res = res-1._dp*(Lam4)
res = res-1._dp*(Lam5)/2._dp
res = res-Conjg(Lam5)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhsigma1sigma12L  
 
 
Subroutine Couplinghhhhhhhh2L(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,               & 
& Lam3,Lam2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-3*Lam1*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Lam6*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Conjg(Lam6)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Lam6*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam3*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam3*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Lam7*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Lam7*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Conjg(Lam7)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-3*Lam2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhhhhh2L  
 
 
Subroutine CouplinghhhhHmcHm2L(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,              & 
& Lam3,Lam2,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2),ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam1*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam6*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Conjg(Lam6)*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam6*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam3*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam6*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam7*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam3*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam7*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam7*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Conjg(Lam7)*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam2*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHmcHm2L  
 
 
Subroutine Couplinghhhhsigma1sigma12L(gt1,gt2,Lam6,Lam5,Lam1,Lam4,Lam3,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam1,Lam4,Lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhsigma1sigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2)) Then 
res = res-(Lam1*ZH(gt1,1)*ZH(gt2,1))
End If 
If ((gt1.eq.gt2)) Then 
res = res-(Lam6*ZH(gt1,2)*ZH(gt2,1))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
res = res-(Conjg(Lam6)*ZH(gt1,2)*ZH(gt2,1))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
res = res-(Lam6*ZH(gt1,1)*ZH(gt2,2))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
res = res-(Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,2))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
res = res-(Lam3*ZH(gt1,2)*ZH(gt2,2))
End If 
If ((gt1.eq.gt2)) Then 
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,2))
End If 
If ((gt1.eq.gt2)) Then 
res = res+(Lam5*ZH(gt1,2)*ZH(gt2,2))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
res = res+(Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,2))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhsigma1sigma12L  
 
 
Subroutine CouplingHmHmcHmcHm2L(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,             & 
& Lam3,Lam2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmHmcHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*Lam1*ZP(gt1,1)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,1)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*Conjg(Lam6)*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,1)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*Conjg(Lam6)*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,1)*ZP(gt4,1)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*Lam5*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,1)*ZP(gt4,1)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*Lam6*ZP(gt1,1)*ZP(gt2,1)*ZP(gt3,2)*ZP(gt4,1)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam3*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,2)*ZP(gt4,1))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam4*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,2)*ZP(gt4,1))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam3*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,1))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam4*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,1))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*Conjg(Lam7)*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,1)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*Lam6*ZP(gt1,1)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,2)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam3*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,2))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam4*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,2))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam3*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,1)*ZP(gt4,2))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam4*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,1)*ZP(gt4,2))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*Conjg(Lam7)*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,1)*ZP(gt4,2)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*Conjg(Lam5)*ZP(gt1,1)*ZP(gt2,1)*ZP(gt3,2)*ZP(gt4,2)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*Lam7*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,2)*ZP(gt4,2)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*Lam7*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,2)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*Lam2*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmHmcHmcHm2L  
 
 
Subroutine CouplingHmsigma1sigma1cHm2L(gt1,gt4,Lam6,Lam1,Lam3,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt4
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam1,Lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmsigma1sigma1cHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt4)) Then 
res = res-(Lam1*ZP(gt1,1)*ZP(gt4,1))
End If 
If ((gt1.eq.gt4)) Then 
res = res-(Conjg(Lam6)*ZP(gt1,2)*ZP(gt4,1))
End If 
If ((gt1.eq.gt4)) Then 
res = res-(Lam6*ZP(gt1,1)*ZP(gt4,2))
End If 
If ((gt1.eq.gt4)) Then 
res = res-(Lam3*ZP(gt1,2)*ZP(gt4,2))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmsigma1sigma1cHm2L  
 
 
Subroutine Couplingsigma1sigma1sigma1sigma12L(Lam1,res)

Implicit None 

Complex(dp), Intent(in) :: Lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingsigma1sigma1sigma1sigma1' 
 
res = 0._dp 
res = res-3._dp*(Lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplingsigma1sigma1sigma1sigma12L  
 
 
Subroutine CouplingAhAhAh2L(Lam7,v,res)

Implicit None 

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAh' 
 
res = 0._dp 
res = res+(3*Lam7*v)/2._dp
res = res+(-3*v*Conjg(Lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAh2L  
 
 
Subroutine CouplingAhAhhh2L(gt3,Lam5,Lam7,Lam4,Lam3,Lam2,v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: v,v2,ZH(2,2)

Complex(dp), Intent(in) :: Lam5,Lam7,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam3*v*ZH(gt3,1))
res = res-(Lam4*v*ZH(gt3,1))
res = res+(Lam5*v*ZH(gt3,1))/2._dp
res = res-(Lam7*v2*ZH(gt3,1))/2._dp
res = res+(v*Conjg(Lam5)*ZH(gt3,1))/2._dp
res = res-(v2*Conjg(Lam7)*ZH(gt3,1))/2._dp
res = res-(Lam7*v*ZH(gt3,2))/2._dp
res = res-(Lam2*v2*ZH(gt3,2))
res = res-(v*Conjg(Lam7)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhh2L  
 
 
Subroutine CouplingAhAhsigma12L(Lam5,Lam7,v,v2,res)

Implicit None 

Real(dp), Intent(in) :: v,v2

Complex(dp), Intent(in) :: Lam5,Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhsigma1' 
 
res = 0._dp 
res = res-(Lam5*v)/2._dp
res = res-(Lam7*v2)/2._dp
res = res+(v*Conjg(Lam5))/2._dp
res = res+(v2*Conjg(Lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhsigma12L  
 
 
Subroutine CouplingAhhhhh2L(gt2,gt3,Lam6,Lam5,Lam7,v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,v2,ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhhh' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(3*Lam6*v*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(Lam5*v2*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(v2*Conjg(Lam5)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*v*Conjg(Lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(Lam5*v*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(Lam7*v2*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(v*Conjg(Lam5)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(v2*Conjg(Lam7)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(Lam5*v*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(Lam7*v2*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(v*Conjg(Lam5)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(v2*Conjg(Lam7)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(Lam7*v*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(v*Conjg(Lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhhh2L  
 
 
Subroutine CouplingAhhhsigma12L(gt2,Lam6,Lam5,Lam7,v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: v,v2,ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhsigma1' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam6*v*ZH(gt2,1))/2._dp
res = res-(Lam5*v2*ZH(gt2,1))/2._dp
res = res-(v2*Conjg(Lam5)*ZH(gt2,1))/2._dp
res = res-(v*Conjg(Lam6)*ZH(gt2,1))/2._dp
res = res-(Lam5*v*ZH(gt2,2))/2._dp
res = res-(Lam7*v2*ZH(gt2,2))/2._dp
res = res-(v*Conjg(Lam5)*ZH(gt2,2))/2._dp
res = res-(v2*Conjg(Lam7)*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhsigma12L  
 
 
Subroutine CouplingAhHmcHm2L(gt2,gt3,Lam6,Lam5,Lam7,Lam4,v,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmcHm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(Lam6*v*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(v*Conjg(Lam6)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(Lam4*v*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(Lam5*v*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(Lam4*v*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(v*Conjg(Lam5)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(Lam7*v*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(v*Conjg(Lam7)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmcHm2L  
 
 
Subroutine CouplingAhsigma1sigma12L(Lam6,Lam5,v,v2,res)

Implicit None 

Real(dp), Intent(in) :: v,v2

Complex(dp), Intent(in) :: Lam6,Lam5

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhsigma1sigma1' 
 
res = 0._dp 
res = res+(Lam6*v)/2._dp
res = res+(Lam5*v2)/2._dp
res = res-(v2*Conjg(Lam5))/2._dp
res = res-(v*Conjg(Lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhsigma1sigma12L  
 
 
Subroutine Couplinghhhhhh2L(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,           & 
& v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: v,v2,ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-3*Lam1*v*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)
res = res+(-3*Lam6*v2*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*v2*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*Lam6*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(Lam3*v2*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(Lam4*v2*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(Lam5*v2*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(v2*Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*v*Conjg(Lam6)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*Lam6*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(Lam3*v2*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(Lam4*v2*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(Lam5*v2*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(v2*Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(-3*v*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(Lam3*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(Lam4*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(Lam5*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(-3*Lam7*v2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(v*Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(-3*v2*Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(-3*Lam6*v*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(Lam3*v2*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(Lam4*v2*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(Lam5*v2*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(v2*Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(-3*v*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(Lam3*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(Lam4*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(Lam5*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(-3*Lam7*v2*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(v*Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(-3*v2*Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(Lam3*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(Lam4*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(Lam5*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*Lam7*v2*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(v*Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*v2*Conjg(Lam7)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*Lam7*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-3*Lam2*v2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)
res = res+(-3*v*Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhhh2L  
 
 
Subroutine Couplinghhhhsigma12L(gt1,gt2,Lam6,Lam5,Lam7,v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: v,v2,ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhsigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam6*v2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(v2*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-(Lam6*v*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res+(Lam5*v2*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res-(v2*Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res+(v*Conjg(Lam6)*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res-(Lam6*v*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res+(Lam5*v2*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res-(v2*Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res+(v*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res+(Lam5*v*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res+(-3*Lam7*v2*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res-(v*Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res+(3*v2*Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhsigma12L  
 
 
Subroutine CouplinghhHmcHm2L(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,               & 
& Lam2,v,v2,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: v,v2,ZH(2,2),ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam1*v*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))
res = res-(Lam6*v2*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(v2*Conjg(Lam6)*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(Lam6*v*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(Lam3*v2*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))
res = res-(v*Conjg(Lam6)*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(Lam4*v2*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(Lam5*v2*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(v*Conjg(Lam6)*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,1))
res = res-(Lam4*v*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(Lam5*v*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(v2*Conjg(Lam7)*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,1))
res = res-(Lam6*v*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,2))
res = res-(Lam4*v2*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-(v2*Conjg(Lam5)*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-(Lam4*v*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-(Lam7*v2*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,2))
res = res-(v*Conjg(Lam5)*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-(Lam3*v*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))
res = res-(Lam7*v2*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(v2*Conjg(Lam7)*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(Lam7*v*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(Lam2*v2*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))
res = res-(v*Conjg(Lam7)*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmcHm2L  
 
 
Subroutine Couplinghhsigma1sigma12L(gt1,Lam6,Lam5,Lam1,Lam4,Lam3,v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: v,v2,ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam1,Lam4,Lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhsigma1sigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam1*v*ZH(gt1,1))
res = res-(Lam6*v2*ZH(gt1,1))/2._dp
res = res-(v2*Conjg(Lam6)*ZH(gt1,1))/2._dp
res = res-(Lam6*v*ZH(gt1,2))/2._dp
res = res-(Lam3*v2*ZH(gt1,2))
res = res-(Lam4*v2*ZH(gt1,2))
res = res+(Lam5*v2*ZH(gt1,2))/2._dp
res = res+(v2*Conjg(Lam5)*ZH(gt1,2))/2._dp
res = res-(v*Conjg(Lam6)*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhsigma1sigma12L  
 
 
Subroutine CouplingHmsigma1cHm2L(gt1,gt3,Lam6,Lam5,Lam7,Lam4,v2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt3
Real(dp), Intent(in) :: v2,ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmsigma1cHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam6*v2*ZP(gt1,1)*ZP(gt3,1))/2._dp
res = res+(v2*Conjg(Lam6)*ZP(gt1,1)*ZP(gt3,1))/2._dp
res = res-(Lam4*v2*ZP(gt1,2)*ZP(gt3,1))/2._dp
res = res+(Lam5*v2*ZP(gt1,2)*ZP(gt3,1))/2._dp
res = res+(Lam4*v2*ZP(gt1,1)*ZP(gt3,2))/2._dp
res = res-(v2*Conjg(Lam5)*ZP(gt1,1)*ZP(gt3,2))/2._dp
res = res-(Lam7*v2*ZP(gt1,2)*ZP(gt3,2))/2._dp
res = res+(v2*Conjg(Lam7)*ZP(gt1,2)*ZP(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmsigma1cHm2L  
 
 
Subroutine Couplingsigma1sigma1sigma12L(Lam6,v2,res)

Implicit None 

Real(dp), Intent(in) :: v2

Complex(dp), Intent(in) :: Lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingsigma1sigma1sigma1' 
 
res = 0._dp 
res = res+(-3*Lam6*v2)/2._dp
res = res+(3*v2*Conjg(Lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplingsigma1sigma1sigma12L  
 
 
Subroutine CouplingVGVGVG2L(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVG2L  
 
 
Subroutine CouplingcFdFdAh2L(gt1,gt2,epYD,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epYD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epYD(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epYD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdAh2L  
 
 
Subroutine CouplingcFeFeAh2L(gt1,gt2,epYE,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epYE(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*epYE(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epYE(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeAh2L  
 
 
Subroutine CouplingcFuFuAh2L(gt1,gt2,epYU,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epYU(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epYU(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epYU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuAh2L  
 
 
Subroutine CouplingcFdFdhh2L(gt1,gt2,gt3,Yd,epYD,ZH,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Yd(3,3),epYD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epYD(j1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epYD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdhh2L  
 
 
Subroutine CouplingcFdFdsigma12L(gt1,gt2,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdsigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdsigma12L  
 
 
Subroutine CouplingcFuFdcHm2L(gt1,gt2,gt3,Yu,epYU,Yd,epYD,ZP,ZDL,ZDR,ZUL,             & 
& ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Yu(3,3),epYU(3,3),Yd(3,3),epYD(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yu(j1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*epYU(j1,j2)*ZP(gt3,2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZUL(gt1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(epYD(j1,j2))*ZDR(gt2,j1)*ZUL(gt1,j2)*ZP(gt3,2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdcHm2L  
 
 
Subroutine CouplingcFeFehh2L(gt1,gt2,gt3,Ye,epYE,ZH,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Ye(3,3),epYE(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFehh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*epYE(j1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epYE(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFehh2L  
 
 
Subroutine CouplingcFeFesigma12L(gt1,gt2,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFesigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFesigma12L  
 
 
Subroutine CouplingcFvFecHm2L(gt1,gt2,gt3,Ye,epYE,ZP,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Ye(3,3),epYE(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFvFecHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
resR = 0._dp 
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,gt1))*ZER(gt2,j1)*ZP(gt3,1)
End Do 
Do j1 = 1,3
resR = resR+Conjg(epYE(j1,gt1))*ZER(gt2,j1)*ZP(gt3,2)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFvFecHm2L  
 
 
Subroutine CouplingcFuFuhh2L(gt1,gt2,gt3,Yu,epYU,ZH,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Yu(3,3),epYU(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epYU(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epYU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuhh2L  
 
 
Subroutine CouplingcFdFuHm2L(gt1,gt2,gt3,Yu,epYU,Yd,epYD,ZP,ZDL,ZDR,ZUL,              & 
& ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Yu(3,3),epYU(3,3),Yd(3,3),epYD(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFuHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yd(j1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*epYD(j1,j2)*ZP(gt3,2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(epYU(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)*ZP(gt3,2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFuHm2L  
 
 
Subroutine CouplingcFuFusigma12L(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFusigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFusigma12L  
 
 
Subroutine CouplingcFeFvHm2L(gt1,gt2,gt3,Ye,epYE,ZP,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Ye(3,3),epYE(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+Conjg(ZER(gt1,j1))*Ye(j1,gt2)*ZP(gt3,1)
End Do 
Do j1 = 1,3
resL = resL+Conjg(ZER(gt1,j1))*epYE(j1,gt2)*ZP(gt3,2)
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvHm2L  
 
 
Subroutine CouplingcFdFdVG2L(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVG2L  
 
 
Subroutine CouplingcFuFuVG2L(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVG2L  
 
 
Subroutine CouplingsFor2LPole3(Lam7,v,Lam5,Lam4,Lam3,Lam2,v2,ZH,Lam6,ZP,              & 
& Lam1,g3,epYD,ZDL,ZDR,epYE,ZEL,ZER,epYU,ZUL,ZUR,Yd,Yu,Ye,cplAhAhAh,cplAhAhhh,           & 
& cplAhAhsigma1,cplAhhhhh,cplAhhhsigma1,cplAhHmcHm,cplAhsigma1sigma1,cplhhhhhh,          & 
& cplhhhhsigma1,cplhhHmcHm,cplhhsigma1sigma1,cplHmsigma1cHm,cplsigma1sigma1sigma1,       & 
& cplVGVGVG,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,     & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdsigma1L,cplcFdFdsigma1R,cplcFuFdcHmL,cplcFuFdcHmR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFesigma1L,cplcFeFesigma1R,cplcFvFecHmL,cplcFvFecHmR,     & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHmL,cplcFdFuHmR,cplcFuFusigma1L,cplcFuFusigma1R,       & 
& cplcFeFvHmL,cplcFeFvHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR)

Implicit None 
Real(dp), Intent(in) :: v,v2,ZH(2,2),ZP(2,2),g3

Complex(dp), Intent(in) :: Lam7,Lam5,Lam4,Lam3,Lam2,Lam6,Lam1,epYD(3,3),ZDL(3,3),ZDR(3,3),epYE(3,3),             & 
& ZEL(3,3),ZER(3,3),epYU(3,3),ZUL(3,3),ZUR(3,3),Yd(3,3),Yu(3,3),Ye(3,3)

Complex(dp), Intent(out) :: cplAhAhAh,cplAhAhhh(2),cplAhAhsigma1,cplAhhhhh(2,2),cplAhhhsigma1(2),cplAhHmcHm(2,2), & 
& cplAhsigma1sigma1,cplhhhhhh(2,2,2),cplhhhhsigma1(2,2),cplhhHmcHm(2,2,2),               & 
& cplhhsigma1sigma1(2),cplHmsigma1cHm(2,2),cplsigma1sigma1sigma1,cplVGVGVG,              & 
& cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),  & 
& cplcFuFuAhR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdsigma1L(3,3),           & 
& cplcFdFdsigma1R(3,3),cplcFuFdcHmL(3,3,2),cplcFuFdcHmR(3,3,2),cplcFeFehhL(3,3,2),       & 
& cplcFeFehhR(3,3,2),cplcFeFesigma1L(3,3),cplcFeFesigma1R(3,3),cplcFvFecHmL(3,3,2),      & 
& cplcFvFecHmR(3,3,2),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFdFuHmL(3,3,2),          & 
& cplcFdFuHmR(3,3,2),cplcFuFusigma1L(3,3),cplcFuFusigma1R(3,3),cplcFeFvHmL(3,3,2),       & 
& cplcFeFvHmR(3,3,2),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsFor2LPole3'
 
cplAhAhAh = 0._dp 
Call CouplingAhAhAh2LP(Lam7,v,cplAhAhAh)



cplAhAhhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhAhhh2LP(gt3,Lam5,Lam7,Lam4,Lam3,Lam2,v,v2,ZH,cplAhAhhh(gt3))

End Do 


cplAhAhsigma1 = 0._dp 
Call CouplingAhAhsigma12LP(Lam5,Lam7,v,v2,cplAhAhsigma1)



cplAhhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhhhhh2LP(gt2,gt3,Lam6,Lam5,Lam7,v,v2,ZH,cplAhhhhh(gt2,gt3))

 End Do 
End Do 


cplAhhhsigma1 = 0._dp 
Do gt2 = 1, 2
Call CouplingAhhhsigma12LP(gt2,Lam6,Lam5,Lam7,v,v2,ZH,cplAhhhsigma1(gt2))

End Do 


cplAhHmcHm = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhHmcHm2LP(gt2,gt3,Lam6,Lam5,Lam7,Lam4,v,ZP,cplAhHmcHm(gt2,gt3))

 End Do 
End Do 


cplAhsigma1sigma1 = 0._dp 
Call CouplingAhsigma1sigma12LP(Lam6,Lam5,v,v2,cplAhsigma1sigma1)



cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call Couplinghhhhhh2LP(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,v,              & 
& v2,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhhhsigma1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call Couplinghhhhsigma12LP(gt1,gt2,Lam6,Lam5,Lam7,v,v2,ZH,cplhhhhsigma1(gt1,gt2))

 End Do 
End Do 


cplhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhHmcHm2LP(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,               & 
& v,v2,ZH,ZP,cplhhHmcHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhsigma1sigma1 = 0._dp 
Do gt1 = 1, 2
Call Couplinghhsigma1sigma12LP(gt1,Lam6,Lam5,Lam1,Lam4,Lam3,v,v2,ZH,cplhhsigma1sigma1(gt1))

End Do 


cplHmsigma1cHm = 0._dp 
Do gt1 = 1, 2
 Do gt3 = 1, 2
Call CouplingHmsigma1cHm2LP(gt1,gt3,Lam6,Lam5,Lam7,Lam4,v2,ZP,cplHmsigma1cHm(gt1,gt3))

 End Do 
End Do 


cplsigma1sigma1sigma1 = 0._dp 
Call Couplingsigma1sigma1sigma12LP(Lam6,v2,cplsigma1sigma1sigma1)



cplVGVGVG = 0._dp 
Call CouplingVGVGVG2LP(g3,cplVGVGVG)



cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdAh2LP(gt1,gt2,epYD,ZDL,ZDR,cplcFdFdAhL(gt1,gt2),cplcFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeAh2LP(gt1,gt2,epYE,ZEL,ZER,cplcFeFeAhL(gt1,gt2),cplcFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuAh2LP(gt1,gt2,epYU,ZUL,ZUR,cplcFuFuAhL(gt1,gt2),cplcFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhh2LP(gt1,gt2,gt3,Yd,epYD,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)       & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdsigma1L = 0._dp 
cplcFdFdsigma1R = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdsigma12LP(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdsigma1L(gt1,gt2)               & 
& ,cplcFdFdsigma1R(gt1,gt2))

 End Do 
End Do 


cplcFuFdcHmL = 0._dp 
cplcFuFdcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFdcHm2LP(gt1,gt2,gt3,Yu,epYU,Yd,epYD,ZP,ZDL,ZDR,ZUL,ZUR,              & 
& cplcFuFdcHmL(gt1,gt2,gt3),cplcFuFdcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehh2LP(gt1,gt2,gt3,Ye,epYE,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)       & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFesigma1L = 0._dp 
cplcFeFesigma1R = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFesigma12LP(gt1,gt2,Ye,ZEL,ZER,cplcFeFesigma1L(gt1,gt2)               & 
& ,cplcFeFesigma1R(gt1,gt2))

 End Do 
End Do 


cplcFvFecHmL = 0._dp 
cplcFvFecHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFvFecHm2LP(gt1,gt2,gt3,Ye,epYE,ZP,ZER,cplcFvFecHmL(gt1,gt2,gt3)         & 
& ,cplcFvFecHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhh2LP(gt1,gt2,gt3,Yu,epYU,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)       & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHmL = 0._dp 
cplcFdFuHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFuHm2LP(gt1,gt2,gt3,Yu,epYU,Yd,epYD,ZP,ZDL,ZDR,ZUL,ZUR,               & 
& cplcFdFuHmL(gt1,gt2,gt3),cplcFdFuHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFusigma1L = 0._dp 
cplcFuFusigma1R = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFusigma12LP(gt1,gt2,Yu,ZUL,ZUR,cplcFuFusigma1L(gt1,gt2)               & 
& ,cplcFuFusigma1R(gt1,gt2))

 End Do 
End Do 


cplcFeFvHmL = 0._dp 
cplcFeFvHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFvHm2LP(gt1,gt2,gt3,Ye,epYE,ZP,ZER,cplcFeFvHmL(gt1,gt2,gt3)           & 
& ,cplcFeFvHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVG2LP(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVG2LP(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsFor2LPole3

Subroutine CouplingAhAhAh2LP(Lam7,v,res)

Implicit None 

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAh' 
 
res = 0._dp 
res = res+(3*Lam7*v)/2._dp
res = res+(-3*v*Conjg(Lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAh2LP  
 
 
Subroutine CouplingAhAhhh2LP(gt3,Lam5,Lam7,Lam4,Lam3,Lam2,v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: v,v2,ZH(2,2)

Complex(dp), Intent(in) :: Lam5,Lam7,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam3*v*ZH(gt3,1))
res = res-(Lam4*v*ZH(gt3,1))
res = res+(Lam5*v*ZH(gt3,1))/2._dp
res = res-(Lam7*v2*ZH(gt3,1))/2._dp
res = res+(v*Conjg(Lam5)*ZH(gt3,1))/2._dp
res = res-(v2*Conjg(Lam7)*ZH(gt3,1))/2._dp
res = res-(Lam7*v*ZH(gt3,2))/2._dp
res = res-(Lam2*v2*ZH(gt3,2))
res = res-(v*Conjg(Lam7)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhh2LP  
 
 
Subroutine CouplingAhAhsigma12LP(Lam5,Lam7,v,v2,res)

Implicit None 

Real(dp), Intent(in) :: v,v2

Complex(dp), Intent(in) :: Lam5,Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhsigma1' 
 
res = 0._dp 
res = res-(Lam5*v)/2._dp
res = res-(Lam7*v2)/2._dp
res = res+(v*Conjg(Lam5))/2._dp
res = res+(v2*Conjg(Lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhsigma12LP  
 
 
Subroutine CouplingAhhhhh2LP(gt2,gt3,Lam6,Lam5,Lam7,v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,v2,ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhhh' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(3*Lam6*v*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(Lam5*v2*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(v2*Conjg(Lam5)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*v*Conjg(Lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(Lam5*v*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(Lam7*v2*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(v*Conjg(Lam5)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(v2*Conjg(Lam7)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(Lam5*v*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(Lam7*v2*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(v*Conjg(Lam5)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(v2*Conjg(Lam7)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(Lam7*v*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(v*Conjg(Lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhhh2LP  
 
 
Subroutine CouplingAhhhsigma12LP(gt2,Lam6,Lam5,Lam7,v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: v,v2,ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhsigma1' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam6*v*ZH(gt2,1))/2._dp
res = res-(Lam5*v2*ZH(gt2,1))/2._dp
res = res-(v2*Conjg(Lam5)*ZH(gt2,1))/2._dp
res = res-(v*Conjg(Lam6)*ZH(gt2,1))/2._dp
res = res-(Lam5*v*ZH(gt2,2))/2._dp
res = res-(Lam7*v2*ZH(gt2,2))/2._dp
res = res-(v*Conjg(Lam5)*ZH(gt2,2))/2._dp
res = res-(v2*Conjg(Lam7)*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhsigma12LP  
 
 
Subroutine CouplingAhHmcHm2LP(gt2,gt3,Lam6,Lam5,Lam7,Lam4,v,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmcHm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(Lam6*v*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(v*Conjg(Lam6)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(Lam4*v*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(Lam5*v*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(Lam4*v*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(v*Conjg(Lam5)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(Lam7*v*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(v*Conjg(Lam7)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmcHm2LP  
 
 
Subroutine CouplingAhsigma1sigma12LP(Lam6,Lam5,v,v2,res)

Implicit None 

Real(dp), Intent(in) :: v,v2

Complex(dp), Intent(in) :: Lam6,Lam5

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhsigma1sigma1' 
 
res = 0._dp 
res = res+(Lam6*v)/2._dp
res = res+(Lam5*v2)/2._dp
res = res-(v2*Conjg(Lam5))/2._dp
res = res-(v*Conjg(Lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhsigma1sigma12LP  
 
 
Subroutine Couplinghhhhhh2LP(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,               & 
& Lam2,v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: v,v2,ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-3*Lam1*v*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)
res = res+(-3*Lam6*v2*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*v2*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*Lam6*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(Lam3*v2*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(Lam4*v2*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(Lam5*v2*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(v2*Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*v*Conjg(Lam6)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*Lam6*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(Lam3*v2*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(Lam4*v2*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(Lam5*v2*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(v2*Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(-3*v*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(Lam3*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(Lam4*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(Lam5*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(-3*Lam7*v2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(v*Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(-3*v2*Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(-3*Lam6*v*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(Lam3*v2*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(Lam4*v2*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(Lam5*v2*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(v2*Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(-3*v*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(Lam3*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(Lam4*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(Lam5*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(-3*Lam7*v2*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(v*Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(-3*v2*Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(Lam3*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(Lam4*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(Lam5*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*Lam7*v2*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(v*Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*v2*Conjg(Lam7)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*Lam7*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-3*Lam2*v2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)
res = res+(-3*v*Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhhh2LP  
 
 
Subroutine Couplinghhhhsigma12LP(gt1,gt2,Lam6,Lam5,Lam7,v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: v,v2,ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhsigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam6*v2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(v2*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-(Lam6*v*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res+(Lam5*v2*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res-(v2*Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res+(v*Conjg(Lam6)*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res-(Lam6*v*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res+(Lam5*v2*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res-(v2*Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res+(v*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res+(Lam5*v*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res+(-3*Lam7*v2*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res-(v*Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res+(3*v2*Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhsigma12LP  
 
 
Subroutine CouplinghhHmcHm2LP(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,              & 
& Lam2,v,v2,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: v,v2,ZH(2,2),ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam1*v*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))
res = res-(Lam6*v2*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(v2*Conjg(Lam6)*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(Lam6*v*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(Lam3*v2*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))
res = res-(v*Conjg(Lam6)*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(Lam4*v2*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(Lam5*v2*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(v*Conjg(Lam6)*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,1))
res = res-(Lam4*v*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(Lam5*v*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(v2*Conjg(Lam7)*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,1))
res = res-(Lam6*v*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,2))
res = res-(Lam4*v2*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-(v2*Conjg(Lam5)*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-(Lam4*v*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-(Lam7*v2*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,2))
res = res-(v*Conjg(Lam5)*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-(Lam3*v*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))
res = res-(Lam7*v2*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(v2*Conjg(Lam7)*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(Lam7*v*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(Lam2*v2*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))
res = res-(v*Conjg(Lam7)*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmcHm2LP  
 
 
Subroutine Couplinghhsigma1sigma12LP(gt1,Lam6,Lam5,Lam1,Lam4,Lam3,v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: v,v2,ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam1,Lam4,Lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhsigma1sigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam1*v*ZH(gt1,1))
res = res-(Lam6*v2*ZH(gt1,1))/2._dp
res = res-(v2*Conjg(Lam6)*ZH(gt1,1))/2._dp
res = res-(Lam6*v*ZH(gt1,2))/2._dp
res = res-(Lam3*v2*ZH(gt1,2))
res = res-(Lam4*v2*ZH(gt1,2))
res = res+(Lam5*v2*ZH(gt1,2))/2._dp
res = res+(v2*Conjg(Lam5)*ZH(gt1,2))/2._dp
res = res-(v*Conjg(Lam6)*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhsigma1sigma12LP  
 
 
Subroutine CouplingHmsigma1cHm2LP(gt1,gt3,Lam6,Lam5,Lam7,Lam4,v2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt3
Real(dp), Intent(in) :: v2,ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmsigma1cHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam6*v2*ZP(gt1,1)*ZP(gt3,1))/2._dp
res = res+(v2*Conjg(Lam6)*ZP(gt1,1)*ZP(gt3,1))/2._dp
res = res-(Lam4*v2*ZP(gt1,2)*ZP(gt3,1))/2._dp
res = res+(Lam5*v2*ZP(gt1,2)*ZP(gt3,1))/2._dp
res = res+(Lam4*v2*ZP(gt1,1)*ZP(gt3,2))/2._dp
res = res-(v2*Conjg(Lam5)*ZP(gt1,1)*ZP(gt3,2))/2._dp
res = res-(Lam7*v2*ZP(gt1,2)*ZP(gt3,2))/2._dp
res = res+(v2*Conjg(Lam7)*ZP(gt1,2)*ZP(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmsigma1cHm2LP  
 
 
Subroutine Couplingsigma1sigma1sigma12LP(Lam6,v2,res)

Implicit None 

Real(dp), Intent(in) :: v2

Complex(dp), Intent(in) :: Lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingsigma1sigma1sigma1' 
 
res = 0._dp 
res = res+(-3*Lam6*v2)/2._dp
res = res+(3*v2*Conjg(Lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplingsigma1sigma1sigma12LP  
 
 
Subroutine CouplingVGVGVG2LP(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVG2LP  
 
 
Subroutine CouplingcFdFdAh2LP(gt1,gt2,epYD,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epYD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epYD(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epYD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdAh2LP  
 
 
Subroutine CouplingcFeFeAh2LP(gt1,gt2,epYE,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epYE(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*epYE(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epYE(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeAh2LP  
 
 
Subroutine CouplingcFuFuAh2LP(gt1,gt2,epYU,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epYU(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epYU(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epYU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuAh2LP  
 
 
Subroutine CouplingcFdFdhh2LP(gt1,gt2,gt3,Yd,epYD,ZH,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Yd(3,3),epYD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epYD(j1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epYD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdhh2LP  
 
 
Subroutine CouplingcFdFdsigma12LP(gt1,gt2,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdsigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdsigma12LP  
 
 
Subroutine CouplingcFuFdcHm2LP(gt1,gt2,gt3,Yu,epYU,Yd,epYD,ZP,ZDL,ZDR,ZUL,            & 
& ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Yu(3,3),epYU(3,3),Yd(3,3),epYD(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yu(j1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*epYU(j1,j2)*ZP(gt3,2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZUL(gt1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(epYD(j1,j2))*ZDR(gt2,j1)*ZUL(gt1,j2)*ZP(gt3,2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdcHm2LP  
 
 
Subroutine CouplingcFeFehh2LP(gt1,gt2,gt3,Ye,epYE,ZH,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Ye(3,3),epYE(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFehh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*epYE(j1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epYE(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFehh2LP  
 
 
Subroutine CouplingcFeFesigma12LP(gt1,gt2,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFesigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFesigma12LP  
 
 
Subroutine CouplingcFvFecHm2LP(gt1,gt2,gt3,Ye,epYE,ZP,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Ye(3,3),epYE(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFvFecHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
resR = 0._dp 
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,gt1))*ZER(gt2,j1)*ZP(gt3,1)
End Do 
Do j1 = 1,3
resR = resR+Conjg(epYE(j1,gt1))*ZER(gt2,j1)*ZP(gt3,2)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFvFecHm2LP  
 
 
Subroutine CouplingcFuFuhh2LP(gt1,gt2,gt3,Yu,epYU,ZH,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Yu(3,3),epYU(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epYU(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epYU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuhh2LP  
 
 
Subroutine CouplingcFdFuHm2LP(gt1,gt2,gt3,Yu,epYU,Yd,epYD,ZP,ZDL,ZDR,ZUL,             & 
& ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Yu(3,3),epYU(3,3),Yd(3,3),epYD(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFuHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yd(j1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*epYD(j1,j2)*ZP(gt3,2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(epYU(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)*ZP(gt3,2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFuHm2LP  
 
 
Subroutine CouplingcFuFusigma12LP(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFusigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFusigma12LP  
 
 
Subroutine CouplingcFeFvHm2LP(gt1,gt2,gt3,Ye,epYE,ZP,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Ye(3,3),epYE(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+Conjg(ZER(gt1,j1))*Ye(j1,gt2)*ZP(gt3,1)
End Do 
Do j1 = 1,3
resL = resL+Conjg(ZER(gt1,j1))*epYE(j1,gt2)*ZP(gt3,2)
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvHm2LP  
 
 
Subroutine CouplingcFdFdVG2LP(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVG2LP  
 
 
Subroutine CouplingcFuFuVG2LP(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVG2LP  
 
 
Subroutine CouplingsFor2LPole4(Lam2,Lam7,ZH,Lam5,Lam4,Lam3,ZP,Lam6,Lam1,              & 
& cplAhAhAhAh,cplAhAhAhhh,cplAhAhAhsigma1,cplAhAhhhhh,cplAhAhhhsigma1,cplAhAhHmcHm,      & 
& cplAhAhsigma1sigma1,cplAhhhhhhh,cplAhhhhhsigma1,cplAhhhHmcHm,cplAhhhsigma1sigma1,      & 
& cplAhHmsigma1cHm,cplAhsigma1sigma1sigma1,cplhhhhhhhh,cplhhhhhhsigma1,cplhhhhHmcHm,     & 
& cplhhhhsigma1sigma1,cplhhHmsigma1cHm,cplhhsigma1sigma1sigma1,cplHmHmcHmcHm,            & 
& cplHmsigma1sigma1cHm,cplsigma1sigma1sigma1sigma1)

Implicit None 
Real(dp), Intent(in) :: ZH(2,2),ZP(2,2)

Complex(dp), Intent(in) :: Lam2,Lam7,Lam5,Lam4,Lam3,Lam6,Lam1

Complex(dp), Intent(out) :: cplAhAhAhAh,cplAhAhAhhh(2),cplAhAhAhsigma1,cplAhAhhhhh(2,2),cplAhAhhhsigma1(2),       & 
& cplAhAhHmcHm(2,2),cplAhAhsigma1sigma1,cplAhhhhhhh(2,2,2),cplAhhhhhsigma1(2,2),         & 
& cplAhhhHmcHm(2,2,2),cplAhhhsigma1sigma1(2),cplAhHmsigma1cHm(2,2),cplAhsigma1sigma1sigma1,& 
& cplhhhhhhhh(2,2,2,2),cplhhhhhhsigma1(2,2,2),cplhhhhHmcHm(2,2,2,2),cplhhhhsigma1sigma1(2,2),& 
& cplhhHmsigma1cHm(2,2,2),cplhhsigma1sigma1sigma1(2),cplHmHmcHmcHm(2,2,2,2),             & 
& cplHmsigma1sigma1cHm(2,2),cplsigma1sigma1sigma1sigma1

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsFor2LPole4'
 
cplAhAhAhAh = 0._dp 
Call CouplingAhAhAhAh2LP(Lam2,cplAhAhAhAh)



cplAhAhAhhh = 0._dp 
Do gt4 = 1, 2
Call CouplingAhAhAhhh2LP(gt4,Lam7,ZH,cplAhAhAhhh(gt4))

End Do 


cplAhAhAhsigma1 = 0._dp 
Call CouplingAhAhAhsigma12LP(Lam7,cplAhAhAhsigma1)



cplAhAhhhhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhhhhh2LP(gt3,gt4,Lam5,Lam7,Lam4,Lam3,Lam2,ZH,cplAhAhhhhh(gt3,gt4))

 End Do 
End Do 


cplAhAhhhsigma1 = 0._dp 
Do gt3 = 1, 2
Call CouplingAhAhhhsigma12LP(gt3,Lam5,Lam7,ZH,cplAhAhhhsigma1(gt3))

End Do 


cplAhAhHmcHm = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhHmcHm2LP(gt3,gt4,Lam7,Lam3,Lam2,ZP,cplAhAhHmcHm(gt3,gt4))

 End Do 
End Do 


cplAhAhsigma1sigma1 = 0._dp 
Call CouplingAhAhsigma1sigma12LP(Lam5,Lam4,Lam3,cplAhAhsigma1sigma1)



cplAhhhhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
  Do gt4 = 1, 2
Call CouplingAhhhhhhh2LP(gt2,gt3,gt4,Lam6,Lam5,Lam7,ZH,cplAhhhhhhh(gt2,gt3,gt4))

  End Do 
 End Do 
End Do 


cplAhhhhhsigma1 = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhhhhhsigma12LP(gt2,gt3,Lam6,Lam5,Lam7,ZH,cplAhhhhhsigma1(gt2,gt3))

 End Do 
End Do 


cplAhhhHmcHm = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
  Do gt4 = 1, 2
Call CouplingAhhhHmcHm2LP(gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam4,ZH,ZP,cplAhhhHmcHm(gt2,gt3,gt4))

  End Do 
 End Do 
End Do 


cplAhhhsigma1sigma1 = 0._dp 
Do gt2 = 1, 2
Call CouplingAhhhsigma1sigma12LP(gt2,Lam6,Lam5,ZH,cplAhhhsigma1sigma1(gt2))

End Do 


cplAhHmsigma1cHm = 0._dp 
Do gt2 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhHmsigma1cHm2LP(gt2,gt4,Lam6,Lam5,Lam7,Lam4,ZP,cplAhHmsigma1cHm(gt2,gt4))

 End Do 
End Do 


cplAhsigma1sigma1sigma1 = 0._dp 
Call CouplingAhsigma1sigma1sigma12LP(Lam6,cplAhsigma1sigma1sigma1)



cplhhhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call Couplinghhhhhhhh2LP(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,               & 
& Lam2,ZH,cplhhhhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplhhhhhhsigma1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call Couplinghhhhhhsigma12LP(gt1,gt2,gt3,Lam6,Lam5,Lam7,ZH,cplhhhhhhsigma1(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplinghhhhHmcHm2LP(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,              & 
& Lam2,ZH,ZP,cplhhhhHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplhhhhsigma1sigma1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call Couplinghhhhsigma1sigma12LP(gt1,gt2,Lam6,Lam5,Lam1,Lam4,Lam3,ZH,cplhhhhsigma1sigma1(gt1,gt2))

 End Do 
End Do 


cplhhHmsigma1cHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt4 = 1, 2
Call CouplinghhHmsigma1cHm2LP(gt1,gt2,gt4,Lam6,Lam5,Lam7,Lam4,ZH,ZP,cplhhHmsigma1cHm(gt1,gt2,gt4))

  End Do 
 End Do 
End Do 


cplhhsigma1sigma1sigma1 = 0._dp 
Do gt1 = 1, 2
Call Couplinghhsigma1sigma1sigma12LP(gt1,Lam6,ZH,cplhhsigma1sigma1sigma1(gt1))

End Do 


cplHmHmcHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingHmHmcHmcHm2LP(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,             & 
& Lam2,ZP,cplHmHmcHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplHmsigma1sigma1cHm = 0._dp 
Do gt1 = 1, 2
 Do gt4 = 1, 2
Call CouplingHmsigma1sigma1cHm2LP(gt1,gt4,Lam6,Lam1,Lam3,ZP,cplHmsigma1sigma1cHm(gt1,gt4))

 End Do 
End Do 


cplsigma1sigma1sigma1sigma1 = 0._dp 
Call Couplingsigma1sigma1sigma1sigma12LP(Lam1,cplsigma1sigma1sigma1sigma1)



Iname = Iname - 1 
End Subroutine CouplingsFor2LPole4

Subroutine CouplingAhAhAhAh2LP(Lam2,res)

Implicit None 

Complex(dp), Intent(in) :: Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhAh' 
 
res = 0._dp 
res = res-3._dp*(Lam2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhAh2LP  
 
 
Subroutine CouplingAhAhAhhh2LP(gt4,Lam7,ZH,res)

Implicit None 

Integer, Intent(in) :: gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhhh' 
 
If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(3*Lam7*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(Lam7)*ZH(gt4,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhhh2LP  
 
 
Subroutine CouplingAhAhAhsigma12LP(Lam7,res)

Implicit None 

Complex(dp), Intent(in) :: Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhsigma1' 
 
res = 0._dp 
res = res-3._dp*(Lam7)/2._dp
res = res+(-3*Conjg(Lam7))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhsigma12LP  
 
 
Subroutine CouplingAhAhhhhh2LP(gt3,gt4,Lam5,Lam7,Lam4,Lam3,Lam2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam5,Lam7,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam3*ZH(gt3,1)*ZH(gt4,1))
res = res-(Lam4*ZH(gt3,1)*ZH(gt4,1))
res = res+(Lam5*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(Conjg(Lam5)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res-(Lam7*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Conjg(Lam7)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Lam7*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Conjg(Lam7)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Lam2*ZH(gt3,2)*ZH(gt4,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhh2LP  
 
 
Subroutine CouplingAhAhhhsigma12LP(gt3,Lam5,Lam7,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam5,Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhsigma1' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam5*ZH(gt3,1))/2._dp
res = res+(Conjg(Lam5)*ZH(gt3,1))/2._dp
res = res-(Lam7*ZH(gt3,2))/2._dp
res = res+(Conjg(Lam7)*ZH(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhsigma12LP  
 
 
Subroutine CouplingAhAhHmcHm2LP(gt3,gt4,Lam7,Lam3,Lam2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Lam7,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHmcHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam3*ZP(gt3,1)*ZP(gt4,1))
res = res-(Conjg(Lam7)*ZP(gt3,2)*ZP(gt4,1))
res = res-(Lam7*ZP(gt3,1)*ZP(gt4,2))
res = res-(Lam2*ZP(gt3,2)*ZP(gt4,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHmcHm2LP  
 
 
Subroutine CouplingAhAhsigma1sigma12LP(Lam5,Lam4,Lam3,res)

Implicit None 

Complex(dp), Intent(in) :: Lam5,Lam4,Lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhsigma1sigma1' 
 
res = 0._dp 
res = res-1._dp*(Lam3)
res = res-1._dp*(Lam4)
res = res-1._dp*(Lam5)/2._dp
res = res-Conjg(Lam5)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhsigma1sigma12LP  
 
 
Subroutine CouplingAhhhhhhh2LP(gt2,gt3,gt4,Lam6,Lam5,Lam7,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhhhhh' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(3*Lam6*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(Lam6)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res-(Lam5*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(Conjg(Lam5)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res-(Lam5*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res+(Conjg(Lam5)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res+(Lam7*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Conjg(Lam7)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Lam5*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res+(Conjg(Lam5)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res+(Lam7*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Conjg(Lam7)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res+(Lam7*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res-(Conjg(Lam7)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhhhhh2LP  
 
 
Subroutine CouplingAhhhhhsigma12LP(gt2,gt3,Lam6,Lam5,Lam7,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhhhsigma1' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam6*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(Conjg(Lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(Lam5*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(Conjg(Lam5)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(Lam5*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(Conjg(Lam5)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(Lam7*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(Conjg(Lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhhhsigma12LP  
 
 
Subroutine CouplingAhhhHmcHm2LP(gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam4,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2),ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhHmcHm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(Lam6*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res-(Conjg(Lam6)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res+(Lam4*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,1))/2._dp
res = res-(Lam5*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,1))/2._dp
res = res-(Lam4*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,2))/2._dp
res = res+(Conjg(Lam5)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,2))/2._dp
res = res+(Lam7*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res-(Conjg(Lam7)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhHmcHm2LP  
 
 
Subroutine CouplingAhhhsigma1sigma12LP(gt2,Lam6,Lam5,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhsigma1sigma1' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(Lam6*ZH(gt2,1))/2._dp
res = res-(Conjg(Lam6)*ZH(gt2,1))/2._dp
res = res+(Lam5*ZH(gt2,2))/2._dp
res = res-(Conjg(Lam5)*ZH(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhsigma1sigma12LP  
 
 
Subroutine CouplingAhHmsigma1cHm2LP(gt2,gt4,Lam6,Lam5,Lam7,Lam4,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt4
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmsigma1cHm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam6*ZP(gt2,1)*ZP(gt4,1))/2._dp
res = res-(Conjg(Lam6)*ZP(gt2,1)*ZP(gt4,1))/2._dp
res = res-(Lam4*ZP(gt2,2)*ZP(gt4,1))/2._dp
res = res-(Lam5*ZP(gt2,2)*ZP(gt4,1))/2._dp
res = res-(Lam4*ZP(gt2,1)*ZP(gt4,2))/2._dp
res = res-(Conjg(Lam5)*ZP(gt2,1)*ZP(gt4,2))/2._dp
res = res-(Lam7*ZP(gt2,2)*ZP(gt4,2))/2._dp
res = res-(Conjg(Lam7)*ZP(gt2,2)*ZP(gt4,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmsigma1cHm2LP  
 
 
Subroutine CouplingAhsigma1sigma1sigma12LP(Lam6,res)

Implicit None 

Complex(dp), Intent(in) :: Lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhsigma1sigma1sigma1' 
 
res = 0._dp 
res = res-3._dp*(Lam6)/2._dp
res = res+(-3*Conjg(Lam6))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhsigma1sigma1sigma12LP  
 
 
Subroutine Couplinghhhhhhhh2LP(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,              & 
& Lam3,Lam2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-3*Lam1*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
res = res+(-3*Lam6*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(Lam6)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(-3*Lam6*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res-(Lam3*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res = res-(Lam5*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res-(Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(-3*Lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
res = res-(Lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
res = res-(Lam4*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
res = res-(Lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res+(-3*Lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res+(-3*Lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res+(-3*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
res = res-(Lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
res = res-(Lam4*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
res = res-(Lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res+(-3*Lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res+(-3*Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Lam3*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res = res-(Lam4*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res = res-(Lam5*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res-(Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res+(-3*Lam7*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res+(-3*Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res+(-3*Lam7*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res+(-3*Conjg(Lam7)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res-3*Lam2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhhhhh2LP  
 
 
Subroutine Couplinghhhhhhsigma12LP(gt1,gt2,gt3,Lam6,Lam5,Lam7,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhsigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam6*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(Conjg(Lam6)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(Lam6*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(Lam5*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(Lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(Lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(Lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*Lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(3*Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhhhsigma12LP  
 
 
Subroutine CouplinghhhhHmcHm2LP(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,             & 
& Lam3,Lam2,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2),ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam1*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))
res = res-(Lam6*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res-(Conjg(Lam6)*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res-(Lam6*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res-(Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res-(Lam3*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))
res = res-(Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,1))
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,1))/2._dp
res = res-(Lam5*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,1))/2._dp
res = res-(Lam4*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,1))/2._dp
res = res-(Lam5*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,1))/2._dp
res = res-(Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,1))
res = res-(Lam6*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,2))
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,2))/2._dp
res = res-(Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,2))/2._dp
res = res-(Lam4*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,2))/2._dp
res = res-(Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,2))/2._dp
res = res-(Lam7*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,2))
res = res-(Lam3*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))
res = res-(Lam7*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res-(Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res-(Lam7*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res-(Conjg(Lam7)*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res-(Lam2*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHmcHm2LP  
 
 
Subroutine Couplinghhhhsigma1sigma12LP(gt1,gt2,Lam6,Lam5,Lam1,Lam4,Lam3,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam1,Lam4,Lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhsigma1sigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam1*ZH(gt1,1)*ZH(gt2,1))
res = res-(Lam6*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res-(Conjg(Lam6)*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res-(Lam6*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res-(Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res-(Lam3*ZH(gt1,2)*ZH(gt2,2))
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,2))
res = res+(Lam5*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res+(Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhsigma1sigma12LP  
 
 
Subroutine CouplinghhHmsigma1cHm2LP(gt1,gt2,gt4,Lam6,Lam5,Lam7,Lam4,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt4
Real(dp), Intent(in) :: ZH(2,2),ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmsigma1cHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam6*ZH(gt1,2)*ZP(gt2,1)*ZP(gt4,1))/2._dp
res = res+(Conjg(Lam6)*ZH(gt1,2)*ZP(gt2,1)*ZP(gt4,1))/2._dp
res = res-(Lam4*ZH(gt1,2)*ZP(gt2,2)*ZP(gt4,1))/2._dp
res = res+(Lam5*ZH(gt1,2)*ZP(gt2,2)*ZP(gt4,1))/2._dp
res = res+(Lam4*ZH(gt1,2)*ZP(gt2,1)*ZP(gt4,2))/2._dp
res = res-(Conjg(Lam5)*ZH(gt1,2)*ZP(gt2,1)*ZP(gt4,2))/2._dp
res = res-(Lam7*ZH(gt1,2)*ZP(gt2,2)*ZP(gt4,2))/2._dp
res = res+(Conjg(Lam7)*ZH(gt1,2)*ZP(gt2,2)*ZP(gt4,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmsigma1cHm2LP  
 
 
Subroutine Couplinghhsigma1sigma1sigma12LP(gt1,Lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhsigma1sigma1sigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(-3*Lam6*ZH(gt1,2))/2._dp
res = res+(3*Conjg(Lam6)*ZH(gt1,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhsigma1sigma1sigma12LP  
 
 
Subroutine CouplingHmHmcHmcHm2LP(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,            & 
& Lam3,Lam2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmHmcHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-2*Lam1*ZP(gt1,1)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,1)
res = res-2*Conjg(Lam6)*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,1)
res = res-2*Conjg(Lam6)*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,1)*ZP(gt4,1)
res = res-2*Lam5*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,1)*ZP(gt4,1)
res = res-2*Lam6*ZP(gt1,1)*ZP(gt2,1)*ZP(gt3,2)*ZP(gt4,1)
res = res-(Lam3*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,2)*ZP(gt4,1))
res = res-(Lam4*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,2)*ZP(gt4,1))
res = res-(Lam3*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,1))
res = res-(Lam4*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,1))
res = res-2*Conjg(Lam7)*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,1)
res = res-2*Lam6*ZP(gt1,1)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,2)
res = res-(Lam3*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,2))
res = res-(Lam4*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,2))
res = res-(Lam3*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,1)*ZP(gt4,2))
res = res-(Lam4*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,1)*ZP(gt4,2))
res = res-2*Conjg(Lam7)*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,1)*ZP(gt4,2)
res = res-2*Conjg(Lam5)*ZP(gt1,1)*ZP(gt2,1)*ZP(gt3,2)*ZP(gt4,2)
res = res-2*Lam7*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,2)*ZP(gt4,2)
res = res-2*Lam7*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,2)
res = res-2*Lam2*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmHmcHmcHm2LP  
 
 
Subroutine CouplingHmsigma1sigma1cHm2LP(gt1,gt4,Lam6,Lam1,Lam3,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt4
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam1,Lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmsigma1sigma1cHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam1*ZP(gt1,1)*ZP(gt4,1))
res = res-(Conjg(Lam6)*ZP(gt1,2)*ZP(gt4,1))
res = res-(Lam6*ZP(gt1,1)*ZP(gt4,2))
res = res-(Lam3*ZP(gt1,2)*ZP(gt4,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmsigma1sigma1cHm2LP  
 
 
Subroutine Couplingsigma1sigma1sigma1sigma12LP(Lam1,res)

Implicit None 

Complex(dp), Intent(in) :: Lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingsigma1sigma1sigma1sigma1' 
 
res = 0._dp 
res = res-3._dp*(Lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplingsigma1sigma1sigma1sigma12LP  
 
 
Subroutine CouplingsForLoopMasses(Lam5,Lam7,Lam4,Lam3,Lam2,v,v2,Lam6,ZH,              & 
& g1,g2,TW,Yd,epYD,ZDL,ZDR,Ye,epYE,ZEL,ZER,Yu,epYU,ZUL,ZUR,Lam1,ZP,g3,cplAhAhUhh,        & 
& cplAhUhhhh,cplAhUhhsigma1,cplAhUhhVZ,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,           & 
& cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplcgWmgWmUhh,cplcgWpCgWpCUhh,cplcgZgZUhh,      & 
& cplUhhhhhh,cplUhhhhsigma1,cplUhhHmcHm,cplUhhHmcVWm,cplUhhsigma1sigma1,cplUhhsigma1VZ,  & 
& cplUhhcVWmVWm,cplUhhVZVZ,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHmcHm,cplUhhUhhsigma1sigma1,& 
& cplUhhUhhcVWmVWm,cplUhhUhhVZVZ,cplAhHmcUHm,cplAhcUHmVWm,cplcFuFdcUHmL,cplcFuFdcUHmR,   & 
& cplcFvFecUHmL,cplcFvFecUHmR,cplcgZgWmcUHm,cplcgWmgZUHm,cplcgWpCgZcUHm,cplcgZgWpCUHm,   & 
& cplhhHmcUHm,cplhhcUHmVWm,cplHmsigma1cUHm,cplHmcUHmVP,cplHmcUHmVZ,cplsigma1cUHmVWm,     & 
& cplcUHmVPVWm,cplcUHmVWmVZ,cplAhAhUHmcUHm,cplhhhhUHmcUHm,cplUHmHmcUHmcHm,               & 
& cplUHmsigma1sigma1cUHm,cplUHmcUHmVPVP,cplUHmcUHmcVWmVWm,cplUHmcUHmVZVZ,cplcUFdFdAhL,   & 
& cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdsigma1L,cplcUFdFdsigma1R,              & 
& cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,         & 
& cplcUFdFuHmL,cplcUFdFuHmR,cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFuFuAhL,cplcUFuFuAhR,       & 
& cplcUFuFdcHmL,cplcUFuFdcHmR,cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,   & 
& cplcUFuFusigma1L,cplcUFuFusigma1R,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,              & 
& cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFehhL,         & 
& cplcUFeFehhR,cplcUFeFesigma1L,cplcUFeFesigma1R,cplcUFeFeVPL,cplcUFeFeVPR,              & 
& cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFvHmL,cplcUFeFvHmR,cplcUFeFvVWmL,cplcUFeFvVWmR,       & 
& cplcUFvFecHmL,cplcUFvFecHmR,cplcUFvFecVWmL,cplcUFvFecVWmR,cplcUFvFvVZL,cplcUFvFvVZR,   & 
& cplAhAhsigma1,cplAhhhsigma1,cplAhsigma1sigma1,cplcFdFdsigma1L,cplcFdFdsigma1R,         & 
& cplcFeFesigma1L,cplcFeFesigma1R,cplcFuFusigma1L,cplcFuFusigma1R,cplcgWmgWmsigma1,      & 
& cplcgWpCgWpCsigma1,cplhhhhsigma1,cplhhsigma1sigma1,cplhhsigma1VZ,cplHmsigma1cHm,       & 
& cplHmsigma1cVWm,cplsigma1sigma1sigma1,cplAhAhsigma1sigma1,cplhhhhsigma1sigma1,         & 
& cplHmsigma1sigma1cHm,cplsigma1sigma1sigma1sigma1,cplsigma1sigma1cVWmVWm,               & 
& cplsigma1sigma1VZVZ,cplAhAhAh,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,             & 
& cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHmcHm,cplAhAhcVWmVWm,  & 
& cplAhAhVZVZ,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplcgGgGVG,cplVGVGVG,      & 
& cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,            & 
& cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,cplHmcHmVP,            & 
& cplHmcVWmVP,cplcVWmVPVWm,cplHmcHmVPVP,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3, & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,cplHmcHmVZ,              & 
& cplHmcVWmVZ,cplcVWmVWmVZ,cplhhhhVZVZ,cplHmcHmVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,     & 
& cplcVWmVWmVZVZ3,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFvFecVWmL,cplcFvFecVWmR,               & 
& cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgZcVWm,cplhhHmcVWm,cplhhcVWmVWm,    & 
& cplhhhhcVWmVWm,cplHmcHmcVWmVWm,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,& 
& cplcHmVWmVZ,cplcHmVPVWm,cplHmcHmVPVZ,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3)

Implicit None 
Real(dp), Intent(in) :: v,v2,ZH(2,2),g1,g2,TW,ZP(2,2),g3

Complex(dp), Intent(in) :: Lam5,Lam7,Lam4,Lam3,Lam2,Lam6,Yd(3,3),epYD(3,3),ZDL(3,3),ZDR(3,3),Ye(3,3),            & 
& epYE(3,3),ZEL(3,3),ZER(3,3),Yu(3,3),epYU(3,3),ZUL(3,3),ZUR(3,3),Lam1

Complex(dp), Intent(out) :: cplAhAhUhh(2),cplAhUhhhh(2,2),cplAhUhhsigma1(2),cplAhUhhVZ(2),cplcFdFdUhhL(3,3,2),    & 
& cplcFdFdUhhR(3,3,2),cplcFeFeUhhL(3,3,2),cplcFeFeUhhR(3,3,2),cplcFuFuUhhL(3,3,2),       & 
& cplcFuFuUhhR(3,3,2),cplcgWmgWmUhh(2),cplcgWpCgWpCUhh(2),cplcgZgZUhh(2),cplUhhhhhh(2,2,2),& 
& cplUhhhhsigma1(2,2),cplUhhHmcHm(2,2,2),cplUhhHmcVWm(2,2),cplUhhsigma1sigma1(2),        & 
& cplUhhsigma1VZ(2),cplUhhcVWmVWm(2),cplUhhVZVZ(2),cplAhAhUhhUhh(2,2),cplUhhUhhhhhh(2,2,2,2),& 
& cplUhhUhhHmcHm(2,2,2,2),cplUhhUhhsigma1sigma1(2,2),cplUhhUhhcVWmVWm(2,2),              & 
& cplUhhUhhVZVZ(2,2),cplAhHmcUHm(2,2),cplAhcUHmVWm(2),cplcFuFdcUHmL(3,3,2),              & 
& cplcFuFdcUHmR(3,3,2),cplcFvFecUHmL(3,3,2),cplcFvFecUHmR(3,3,2),cplcgZgWmcUHm(2),       & 
& cplcgWmgZUHm(2),cplcgWpCgZcUHm(2),cplcgZgWpCUHm(2),cplhhHmcUHm(2,2,2),cplhhcUHmVWm(2,2),& 
& cplHmsigma1cUHm(2,2),cplHmcUHmVP(2,2),cplHmcUHmVZ(2,2),cplsigma1cUHmVWm(2),            & 
& cplcUHmVPVWm(2),cplcUHmVWmVZ(2),cplAhAhUHmcUHm(2,2),cplhhhhUHmcUHm(2,2,2,2),           & 
& cplUHmHmcUHmcHm(2,2,2,2),cplUHmsigma1sigma1cUHm(2,2),cplUHmcUHmVPVP(2,2),              & 
& cplUHmcUHmcVWmVWm(2,2),cplUHmcUHmVZVZ(2,2),cplcUFdFdAhL(3,3),cplcUFdFdAhR(3,3),        & 
& cplcUFdFdhhL(3,3,2),cplcUFdFdhhR(3,3,2),cplcUFdFdsigma1L(3,3),cplcUFdFdsigma1R(3,3),   & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFuHmL(3,3,2),cplcUFdFuHmR(3,3,2),           & 
& cplcUFdFuVWmL(3,3),cplcUFdFuVWmR(3,3),cplcUFuFuAhL(3,3),cplcUFuFuAhR(3,3),             & 
& cplcUFuFdcHmL(3,3,2),cplcUFuFdcHmR(3,3,2),cplcUFuFdcVWmL(3,3),cplcUFuFdcVWmR(3,3),     & 
& cplcUFuFuhhL(3,3,2),cplcUFuFuhhR(3,3,2),cplcUFuFusigma1L(3,3),cplcUFuFusigma1R(3,3),   & 
& cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),               & 
& cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),cplcUFeFeAhL(3,3),cplcUFeFeAhR(3,3),               & 
& cplcUFeFehhL(3,3,2),cplcUFeFehhR(3,3,2),cplcUFeFesigma1L(3,3),cplcUFeFesigma1R(3,3),   & 
& cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),               & 
& cplcUFeFvHmL(3,3,2),cplcUFeFvHmR(3,3,2),cplcUFeFvVWmL(3,3),cplcUFeFvVWmR(3,3),         & 
& cplcUFvFecHmL(3,3,2),cplcUFvFecHmR(3,3,2),cplcUFvFecVWmL(3,3),cplcUFvFecVWmR(3,3),     & 
& cplcUFvFvVZL(3,3),cplcUFvFvVZR(3,3),cplAhAhsigma1,cplAhhhsigma1(2),cplAhsigma1sigma1,  & 
& cplcFdFdsigma1L(3,3),cplcFdFdsigma1R(3,3),cplcFeFesigma1L(3,3),cplcFeFesigma1R(3,3),   & 
& cplcFuFusigma1L(3,3),cplcFuFusigma1R(3,3),cplcgWmgWmsigma1,cplcgWpCgWpCsigma1,         & 
& cplhhhhsigma1(2,2),cplhhsigma1sigma1(2),cplhhsigma1VZ(2),cplHmsigma1cHm(2,2),          & 
& cplHmsigma1cVWm(2),cplsigma1sigma1sigma1,cplAhAhsigma1sigma1,cplhhhhsigma1sigma1(2,2), & 
& cplHmsigma1sigma1cHm(2,2),cplsigma1sigma1sigma1sigma1,cplsigma1sigma1cVWmVWm,          & 
& cplsigma1sigma1VZVZ,cplAhAhAh,cplAhAhhh(2),cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),          & 
& cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcgWmgWmAh,      & 
& cplcgWpCgWpCAh,cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmcHm(2,2),cplAhHmcVWm(2),             & 
& cplAhAhAhAh,cplAhAhhhhh(2,2),cplAhAhHmcHm(2,2),cplAhAhcVWmVWm,cplAhAhVZVZ,             & 
& cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcgGgGVG,        & 
& cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcFdFdVPL(3,3),cplcFdFdVPR(3,3)

Complex(dp), Intent(out) :: cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcgWmgWmVP,      & 
& cplcgWpCgWpCVP,cplHmcHmVP(2,2),cplHmcVWmVP(2),cplcVWmVPVWm,cplHmcHmVPVP(2,2),          & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),     & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFvFvVZL(3,3),  & 
& cplcFvFvVZR(3,3),cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ(2),cplHmcHmVZ(2,2),             & 
& cplHmcVWmVZ(2),cplcVWmVWmVZ,cplhhhhVZVZ(2,2),cplHmcHmVZVZ(2,2),cplcVWmVWmVZVZ1,        & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFvFecVWmL(3,3),& 
& cplcFvFecVWmR(3,3),cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgZcVWm,          & 
& cplhhHmcVWm(2,2),cplhhcVWmVWm(2),cplhhhhcVWmVWm(2,2),cplHmcHmcVWmVWm(2,2),             & 
& cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcHmVWmVZ(2),               & 
& cplcHmVPVWm(2),cplHmcHmVPVZ(2,2),cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForLoopMasses'
 
cplAhAhUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhAhUhhL(gt3,Lam5,Lam7,Lam4,Lam3,Lam2,v,v2,cplAhAhUhh(gt3))

End Do 


cplAhUhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhUhhhhL(gt2,gt3,Lam6,Lam5,Lam7,v,v2,ZH,cplAhUhhhh(gt2,gt3))

 End Do 
End Do 


cplAhUhhsigma1 = 0._dp 
Do gt2 = 1, 2
Call CouplingAhUhhsigma1L(gt2,Lam6,Lam5,Lam7,v,v2,cplAhUhhsigma1(gt2))

End Do 


cplAhUhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingAhUhhVZL(gt2,g1,g2,TW,cplAhUhhVZ(gt2))

End Do 


cplcFdFdUhhL = 0._dp 
cplcFdFdUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdUhhL(gt1,gt2,gt3,Yd,epYD,ZDL,ZDR,cplcFdFdUhhL(gt1,gt2,gt3)          & 
& ,cplcFdFdUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeUhhL = 0._dp 
cplcFeFeUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFeUhhL(gt1,gt2,gt3,Ye,epYE,ZEL,ZER,cplcFeFeUhhL(gt1,gt2,gt3)          & 
& ,cplcFeFeUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuUhhL = 0._dp 
cplcFuFuUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuUhhL(gt1,gt2,gt3,Yu,epYU,ZUL,ZUR,cplcFuFuUhhL(gt1,gt2,gt3)          & 
& ,cplcFuFuUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcgWmgWmUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWmgWmUhhL(gt3,g2,v,v2,cplcgWmgWmUhh(gt3))

End Do 


cplcgWpCgWpCUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWpCgWpCUhhL(gt3,g2,v,v2,cplcgWpCgWpCUhh(gt3))

End Do 


cplcgZgZUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgZUhhL(gt3,g1,g2,v,v2,TW,cplcgZgZUhh(gt3))

End Do 


cplUhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingUhhhhhhL(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,v,               & 
& v2,ZH,cplUhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplUhhhhsigma1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhhhsigma1L(gt1,gt2,Lam6,Lam5,Lam7,v,v2,ZH,cplUhhhhsigma1(gt1,gt2))

 End Do 
End Do 


cplUhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingUhhHmcHmL(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,v,              & 
& v2,ZP,cplUhhHmcHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplUhhHmcVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhHmcVWmL(gt1,gt2,g2,ZP,cplUhhHmcVWm(gt1,gt2))

 End Do 
End Do 


cplUhhsigma1sigma1 = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhsigma1sigma1L(gt1,Lam6,Lam5,Lam1,Lam4,Lam3,v,v2,cplUhhsigma1sigma1(gt1))

End Do 


cplUhhsigma1VZ = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhsigma1VZL(gt1,g1,g2,TW,cplUhhsigma1VZ(gt1))

End Do 


cplUhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhcVWmVWmL(gt1,g2,v,v2,cplUhhcVWmVWm(gt1))

End Do 


cplUhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhVZVZL(gt1,g1,g2,v,v2,TW,cplUhhVZVZ(gt1))

End Do 


cplAhAhUhhUhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhUhhUhhL(gt3,gt4,Lam5,Lam7,Lam4,Lam3,Lam2,cplAhAhUhhUhh(gt3,gt4))

 End Do 
End Do 


cplUhhUhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingUhhUhhhhhhL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,               & 
& Lam2,ZH,cplUhhUhhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUhhUhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingUhhUhhHmcHmL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,              & 
& Lam2,ZP,cplUhhUhhHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUhhUhhsigma1sigma1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhsigma1sigma1L(gt1,gt2,Lam6,Lam5,Lam1,Lam4,Lam3,cplUhhUhhsigma1sigma1(gt1,gt2))

 End Do 
End Do 


cplUhhUhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhcVWmVWmL(gt1,gt2,g2,cplUhhUhhcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplUhhUhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhVZVZL(gt1,gt2,g1,g2,TW,cplUhhUhhVZVZ(gt1,gt2))

 End Do 
End Do 


cplAhHmcUHm = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhHmcUHmL(gt2,gt3,Lam6,Lam5,Lam7,Lam4,v,ZP,cplAhHmcUHm(gt2,gt3))

 End Do 
End Do 


cplAhcUHmVWm = 0._dp 
Do gt2 = 1, 2
Call CouplingAhcUHmVWmL(gt2,g2,cplAhcUHmVWm(gt2))

End Do 


cplcFuFdcUHmL = 0._dp 
cplcFuFdcUHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFdcUHmL(gt1,gt2,gt3,Yu,epYU,Yd,epYD,ZDL,ZDR,ZUL,ZUR,cplcFuFdcUHmL(gt1,gt2,gt3)& 
& ,cplcFuFdcUHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvFecUHmL = 0._dp 
cplcFvFecUHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFvFecUHmL(gt1,gt2,gt3,Ye,epYE,ZER,cplcFvFecUHmL(gt1,gt2,gt3)            & 
& ,cplcFvFecUHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcgZgWmcUHm = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgWmcUHmL(gt3,g1,g2,v,v2,TW,cplcgZgWmcUHm(gt3))

End Do 


cplcgWmgZUHm = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWmgZUHmL(gt3,g1,g2,v,v2,TW,cplcgWmgZUHm(gt3))

End Do 


cplcgWpCgZcUHm = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWpCgZcUHmL(gt3,g1,g2,v,v2,TW,cplcgWpCgZcUHm(gt3))

End Do 


cplcgZgWpCUHm = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgWpCUHmL(gt3,g1,g2,v,v2,TW,cplcgZgWpCUHm(gt3))

End Do 


cplhhHmcUHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhHmcUHmL(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,v,              & 
& v2,ZH,ZP,cplhhHmcUHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhcUHmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhcUHmVWmL(gt1,gt2,g2,ZH,cplhhcUHmVWm(gt1,gt2))

 End Do 
End Do 


cplHmsigma1cUHm = 0._dp 
Do gt1 = 1, 2
 Do gt3 = 1, 2
Call CouplingHmsigma1cUHmL(gt1,gt3,Lam6,Lam5,Lam7,Lam4,v2,ZP,cplHmsigma1cUHm(gt1,gt3))

 End Do 
End Do 


cplHmcUHmVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHmcUHmVPL(gt1,gt2,g1,g2,ZP,TW,cplHmcUHmVP(gt1,gt2))

 End Do 
End Do 


cplHmcUHmVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHmcUHmVZL(gt1,gt2,g1,g2,ZP,TW,cplHmcUHmVZ(gt1,gt2))

 End Do 
End Do 


cplsigma1cUHmVWm = 0._dp 
Do gt2 = 1, 2
Call Couplingsigma1cUHmVWmL(gt2,g2,cplsigma1cUHmVWm(gt2))

End Do 


cplcUHmVPVWm = 0._dp 
Do gt1 = 1, 2
Call CouplingcUHmVPVWmL(gt1,g1,g2,v,v2,TW,cplcUHmVPVWm(gt1))

End Do 


cplcUHmVWmVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingcUHmVWmVZL(gt1,g1,g2,v,v2,TW,cplcUHmVWmVZ(gt1))

End Do 


cplAhAhUHmcUHm = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhUHmcUHmL(gt3,gt4,Lam7,Lam3,Lam2,cplAhAhUHmcUHm(gt3,gt4))

 End Do 
End Do 


cplhhhhUHmcUHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplinghhhhUHmcUHmL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,              & 
& Lam2,ZH,cplhhhhUHmcUHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUHmHmcUHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingUHmHmcUHmcHmL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,             & 
& Lam2,ZP,cplUHmHmcUHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUHmsigma1sigma1cUHm = 0._dp 
Do gt1 = 1, 2
 Do gt4 = 1, 2
Call CouplingUHmsigma1sigma1cUHmL(gt1,gt4,Lam6,Lam1,Lam3,cplUHmsigma1sigma1cUHm(gt1,gt4))

 End Do 
End Do 


cplUHmcUHmVPVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUHmcUHmVPVPL(gt1,gt2,g1,g2,TW,cplUHmcUHmVPVP(gt1,gt2))

 End Do 
End Do 


cplUHmcUHmcVWmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUHmcUHmcVWmVWmL(gt1,gt2,g2,cplUHmcUHmcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplUHmcUHmVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUHmcUHmVZVZL(gt1,gt2,g1,g2,TW,cplUHmcUHmVZVZ(gt1,gt2))

 End Do 
End Do 


cplcUFdFdAhL = 0._dp 
cplcUFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdAhL(gt1,gt2,epYD,ZDL,ZDR,cplcUFdFdAhL(gt1,gt2),cplcUFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdhhL = 0._dp 
cplcUFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFdFdhhL(gt1,gt2,gt3,Yd,epYD,ZH,ZDL,ZDR,cplcUFdFdhhL(gt1,gt2,gt3)       & 
& ,cplcUFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFdFdsigma1L = 0._dp 
cplcUFdFdsigma1R = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdsigma1L(gt1,gt2,Yd,ZDL,ZDR,cplcUFdFdsigma1L(gt1,gt2)               & 
& ,cplcUFdFdsigma1R(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVGL = 0._dp 
cplcUFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVGL(gt1,gt2,g3,ZDL,ZDR,cplcUFdFdVGL(gt1,gt2),cplcUFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVPL = 0._dp 
cplcUFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVPL(gt1,gt2,g1,g2,ZDL,ZDR,TW,cplcUFdFdVPL(gt1,gt2),cplcUFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVZL = 0._dp 
cplcUFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVZL(gt1,gt2,g1,g2,ZDL,ZDR,TW,cplcUFdFdVZL(gt1,gt2),cplcUFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcUFdFuHmL = 0._dp 
cplcUFdFuHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFdFuHmL(gt1,gt2,gt3,Yu,epYU,Yd,epYD,ZP,ZUL,ZUR,cplcUFdFuHmL(gt1,gt2,gt3)& 
& ,cplcUFdFuHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFdFuVWmL = 0._dp 
cplcUFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFuVWmL(gt1,gt2,g2,ZUL,cplcUFdFuVWmL(gt1,gt2),cplcUFdFuVWmR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuAhL = 0._dp 
cplcUFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuAhL(gt1,gt2,epYU,ZUL,ZUR,cplcUFuFuAhL(gt1,gt2),cplcUFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcUFuFdcHmL = 0._dp 
cplcUFuFdcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFuFdcHmL(gt1,gt2,gt3,Yu,epYU,Yd,epYD,ZP,ZDL,ZDR,cplcUFuFdcHmL(gt1,gt2,gt3)& 
& ,cplcUFuFdcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFuFdcVWmL = 0._dp 
cplcUFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFdcVWmL(gt1,gt2,g2,ZDL,cplcUFuFdcVWmL(gt1,gt2),cplcUFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuhhL = 0._dp 
cplcUFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFuFuhhL(gt1,gt2,gt3,Yu,epYU,ZH,ZUL,ZUR,cplcUFuFuhhL(gt1,gt2,gt3)       & 
& ,cplcUFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFuFusigma1L = 0._dp 
cplcUFuFusigma1R = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFusigma1L(gt1,gt2,Yu,ZUL,ZUR,cplcUFuFusigma1L(gt1,gt2)               & 
& ,cplcUFuFusigma1R(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVGL = 0._dp 
cplcUFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVGL(gt1,gt2,g3,ZUL,ZUR,cplcUFuFuVGL(gt1,gt2),cplcUFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVPL = 0._dp 
cplcUFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVPL(gt1,gt2,g1,g2,ZUL,ZUR,TW,cplcUFuFuVPL(gt1,gt2),cplcUFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVZL = 0._dp 
cplcUFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVZL(gt1,gt2,g1,g2,ZUL,ZUR,TW,cplcUFuFuVZL(gt1,gt2),cplcUFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeAhL = 0._dp 
cplcUFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeAhL(gt1,gt2,epYE,ZEL,ZER,cplcUFeFeAhL(gt1,gt2),cplcUFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcUFeFehhL = 0._dp 
cplcUFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFeFehhL(gt1,gt2,gt3,Ye,epYE,ZH,ZEL,ZER,cplcUFeFehhL(gt1,gt2,gt3)       & 
& ,cplcUFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFeFesigma1L = 0._dp 
cplcUFeFesigma1R = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFesigma1L(gt1,gt2,Ye,ZEL,ZER,cplcUFeFesigma1L(gt1,gt2)               & 
& ,cplcUFeFesigma1R(gt1,gt2))

 End Do 
End Do 


cplcUFeFeVPL = 0._dp 
cplcUFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeVPL(gt1,gt2,g1,g2,ZEL,ZER,TW,cplcUFeFeVPL(gt1,gt2),cplcUFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeVZL = 0._dp 
cplcUFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeVZL(gt1,gt2,g1,g2,ZEL,ZER,TW,cplcUFeFeVZL(gt1,gt2),cplcUFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcUFeFvHmL = 0._dp 
cplcUFeFvHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFeFvHmL(gt1,gt2,gt3,Ye,epYE,ZP,cplcUFeFvHmL(gt1,gt2,gt3)               & 
& ,cplcUFeFvHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFeFvVWmL = 0._dp 
cplcUFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFvVWmL(gt1,gt2,g2,cplcUFeFvVWmL(gt1,gt2),cplcUFeFvVWmR(gt1,gt2))

 End Do 
End Do 


cplcUFvFecHmL = 0._dp 
cplcUFvFecHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFvFecHmL(gt1,gt2,gt3,Ye,epYE,ZP,ZER,cplcUFvFecHmL(gt1,gt2,gt3)         & 
& ,cplcUFvFecHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFvFecVWmL = 0._dp 
cplcUFvFecVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFvFecVWmL(gt1,gt2,g2,ZEL,cplcUFvFecVWmL(gt1,gt2),cplcUFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcUFvFvVZL = 0._dp 
cplcUFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFvFvVZL(gt1,gt2,g1,g2,TW,cplcUFvFvVZL(gt1,gt2),cplcUFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplAhAhsigma1 = 0._dp 
Call CouplingAhAhsigma1L(Lam5,Lam7,v,v2,cplAhAhsigma1)



cplAhhhsigma1 = 0._dp 
Do gt2 = 1, 2
Call CouplingAhhhsigma1L(gt2,Lam6,Lam5,Lam7,v,v2,ZH,cplAhhhsigma1(gt2))

End Do 


cplAhsigma1sigma1 = 0._dp 
Call CouplingAhsigma1sigma1L(Lam6,Lam5,v,v2,cplAhsigma1sigma1)



cplcFdFdsigma1L = 0._dp 
cplcFdFdsigma1R = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdsigma1L(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdsigma1L(gt1,gt2),cplcFdFdsigma1R(gt1,gt2))

 End Do 
End Do 


cplcFeFesigma1L = 0._dp 
cplcFeFesigma1R = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFesigma1L(gt1,gt2,Ye,ZEL,ZER,cplcFeFesigma1L(gt1,gt2),cplcFeFesigma1R(gt1,gt2))

 End Do 
End Do 


cplcFuFusigma1L = 0._dp 
cplcFuFusigma1R = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFusigma1L(gt1,gt2,Yu,ZUL,ZUR,cplcFuFusigma1L(gt1,gt2),cplcFuFusigma1R(gt1,gt2))

 End Do 
End Do 


cplcgWmgWmsigma1 = 0._dp 
Call CouplingcgWmgWmsigma1L(g2,v,cplcgWmgWmsigma1)



cplcgWpCgWpCsigma1 = 0._dp 
Call CouplingcgWpCgWpCsigma1L(g2,v,cplcgWpCgWpCsigma1)



cplhhhhsigma1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call Couplinghhhhsigma1L(gt1,gt2,Lam6,Lam5,Lam7,v,v2,ZH,cplhhhhsigma1(gt1,gt2))

 End Do 
End Do 


cplhhsigma1sigma1 = 0._dp 
Do gt1 = 1, 2
Call Couplinghhsigma1sigma1L(gt1,Lam6,Lam5,Lam1,Lam4,Lam3,v,v2,ZH,cplhhsigma1sigma1(gt1))

End Do 


cplhhsigma1VZ = 0._dp 
Do gt1 = 1, 2
Call Couplinghhsigma1VZL(gt1,g1,g2,ZH,TW,cplhhsigma1VZ(gt1))

End Do 


cplHmsigma1cHm = 0._dp 
Do gt1 = 1, 2
 Do gt3 = 1, 2
Call CouplingHmsigma1cHmL(gt1,gt3,Lam6,Lam5,Lam7,Lam4,v2,ZP,cplHmsigma1cHm(gt1,gt3))

 End Do 
End Do 


cplHmsigma1cVWm = 0._dp 
Do gt1 = 1, 2
Call CouplingHmsigma1cVWmL(gt1,g2,ZP,cplHmsigma1cVWm(gt1))

End Do 


cplsigma1sigma1sigma1 = 0._dp 
Call Couplingsigma1sigma1sigma1L(Lam6,v2,cplsigma1sigma1sigma1)



cplAhAhsigma1sigma1 = 0._dp 
Call CouplingAhAhsigma1sigma1L(Lam5,Lam4,Lam3,cplAhAhsigma1sigma1)



cplhhhhsigma1sigma1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call Couplinghhhhsigma1sigma1L(gt1,gt2,Lam6,Lam5,Lam1,Lam4,Lam3,ZH,cplhhhhsigma1sigma1(gt1,gt2))

 End Do 
End Do 


cplHmsigma1sigma1cHm = 0._dp 
Do gt1 = 1, 2
 Do gt4 = 1, 2
Call CouplingHmsigma1sigma1cHmL(gt1,gt4,Lam6,Lam1,Lam3,ZP,cplHmsigma1sigma1cHm(gt1,gt4))

 End Do 
End Do 


cplsigma1sigma1sigma1sigma1 = 0._dp 
Call Couplingsigma1sigma1sigma1sigma1L(Lam1,cplsigma1sigma1sigma1sigma1)



cplsigma1sigma1cVWmVWm = 0._dp 
Call Couplingsigma1sigma1cVWmVWmL(g2,cplsigma1sigma1cVWmVWm)



cplsigma1sigma1VZVZ = 0._dp 
Call Couplingsigma1sigma1VZVZL(g1,g2,TW,cplsigma1sigma1VZVZ)



cplAhAhAh = 0._dp 
Call CouplingAhAhAhL(Lam7,v,cplAhAhAh)



cplAhAhhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhAhhhL(gt3,Lam5,Lam7,Lam4,Lam3,Lam2,v,v2,ZH,cplAhAhhh(gt3))

End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdAhL(gt1,gt2,epYD,ZDL,ZDR,cplcFdFdAhL(gt1,gt2),cplcFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeAhL(gt1,gt2,epYE,ZEL,ZER,cplcFeFeAhL(gt1,gt2),cplcFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuAhL(gt1,gt2,epYU,ZUL,ZUR,cplcFuFuAhL(gt1,gt2),cplcFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcgWmgWmAh = 0._dp 
Call CouplingcgWmgWmAhL(g2,v2,cplcgWmgWmAh)



cplcgWpCgWpCAh = 0._dp 
Call CouplingcgWpCgWpCAhL(g2,v2,cplcgWpCgWpCAh)



cplAhhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhhhhhL(gt2,gt3,Lam6,Lam5,Lam7,v,v2,ZH,cplAhhhhh(gt2,gt3))

 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingAhhhVZL(gt2,g1,g2,ZH,TW,cplAhhhVZ(gt2))

End Do 


cplAhHmcHm = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhHmcHmL(gt2,gt3,Lam6,Lam5,Lam7,Lam4,v,ZP,cplAhHmcHm(gt2,gt3))

 End Do 
End Do 


cplAhHmcVWm = 0._dp 
Do gt2 = 1, 2
Call CouplingAhHmcVWmL(gt2,g2,ZP,cplAhHmcVWm(gt2))

End Do 


cplAhAhAhAh = 0._dp 
Call CouplingAhAhAhAhL(Lam2,cplAhAhAhAh)



cplAhAhhhhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhhhhhL(gt3,gt4,Lam5,Lam7,Lam4,Lam3,Lam2,ZH,cplAhAhhhhh(gt3,gt4))

 End Do 
End Do 


cplAhAhHmcHm = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhHmcHmL(gt3,gt4,Lam7,Lam3,Lam2,ZP,cplAhAhHmcHm(gt3,gt4))

 End Do 
End Do 


cplAhAhcVWmVWm = 0._dp 
Call CouplingAhAhcVWmVWmL(g2,cplAhAhcVWmVWm)



cplAhAhVZVZ = 0._dp 
Call CouplingAhAhVZVZL(g1,g2,TW,cplAhAhVZVZ)



cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVGL(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVGL(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcgGgGVG = 0._dp 
Call CouplingcgGgGVGL(g3,cplcgGgGVG)



cplVGVGVG = 0._dp 
Call CouplingVGVGVGL(g3,cplVGVGVG)



cplVGVGVGVG1 = 0._dp 
cplVGVGVGVG2 = 0._dp 
cplVGVGVGVG3 = 0._dp 
Call CouplingVGVGVGVGL(g3,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3)



cplcFdFdVPL = 0._dp 
cplcFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVPL(gt1,gt2,g1,g2,TW,cplcFdFdVPL(gt1,gt2),cplcFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVPL = 0._dp 
cplcFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVPL(gt1,gt2,g1,g2,TW,cplcFeFeVPL(gt1,gt2),cplcFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVPL = 0._dp 
cplcFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVPL(gt1,gt2,g1,g2,TW,cplcFuFuVPL(gt1,gt2),cplcFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcgWmgWmVP = 0._dp 
Call CouplingcgWmgWmVPL(g2,TW,cplcgWmgWmVP)



cplcgWpCgWpCVP = 0._dp 
Call CouplingcgWpCgWpCVPL(g2,TW,cplcgWpCgWpCVP)



cplHmcHmVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHmcHmVPL(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVP(gt1,gt2))

 End Do 
End Do 


cplHmcVWmVP = 0._dp 
Do gt1 = 1, 2
Call CouplingHmcVWmVPL(gt1,g1,g2,v,v2,ZP,TW,cplHmcVWmVP(gt1))

End Do 


cplcVWmVPVWm = 0._dp 
Call CouplingcVWmVPVWmL(g2,TW,cplcVWmVPVWm)



cplHmcHmVPVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHmcHmVPVPL(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVPVP(gt1,gt2))

 End Do 
End Do 


cplcVWmVPVPVWm1 = 0._dp 
cplcVWmVPVPVWm2 = 0._dp 
cplcVWmVPVPVWm3 = 0._dp 
Call CouplingcVWmVPVPVWmL(g2,TW,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3)



cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZL(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZL(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZL(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZL = 0._dp 
cplcFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZL(gt1,gt2,g1,g2,TW,cplcFvFvVZL(gt1,gt2),cplcFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcgWmgWmVZ = 0._dp 
Call CouplingcgWmgWmVZL(g2,TW,cplcgWmgWmVZ)



cplcgWpCgWpCVZ = 0._dp 
Call CouplingcgWpCgWpCVZL(g2,TW,cplcgWpCgWpCVZ)



cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZL(gt1,g1,g2,v,v2,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplHmcHmVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHmcHmVZL(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVZ(gt1,gt2))

 End Do 
End Do 


cplHmcVWmVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingHmcVWmVZL(gt1,g1,g2,v,v2,ZP,TW,cplHmcVWmVZ(gt1))

End Do 


cplcVWmVWmVZ = 0._dp 
Call CouplingcVWmVWmVZL(g2,TW,cplcVWmVWmVZ)



cplhhhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZVZL(gt1,gt2,g1,g2,ZH,TW,cplhhhhVZVZ(gt1,gt2))

 End Do 
End Do 


cplHmcHmVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHmcHmVZVZL(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVZVZ(gt1,gt2))

 End Do 
End Do 


cplcVWmVWmVZVZ1 = 0._dp 
cplcVWmVWmVZVZ2 = 0._dp 
cplcVWmVWmVZVZ3 = 0._dp 
Call CouplingcVWmVWmVZVZL(g2,TW,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3)



cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmL(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplcFvFecVWmL = 0._dp 
cplcFvFecVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFecVWmL(gt1,gt2,g2,ZEL,cplcFvFecVWmL(gt1,gt2),cplcFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcgWpCgAcVWm = 0._dp 
Call CouplingcgWpCgAcVWmL(g2,TW,cplcgWpCgAcVWm)



cplcgAgWmcVWm = 0._dp 
Call CouplingcgAgWmcVWmL(g2,TW,cplcgAgWmcVWm)



cplcgZgWmcVWm = 0._dp 
Call CouplingcgZgWmcVWmL(g2,TW,cplcgZgWmcVWm)



cplcgWpCgZcVWm = 0._dp 
Call CouplingcgWpCgZcVWmL(g2,TW,cplcgWpCgZcVWm)



cplhhHmcVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhHmcVWmL(gt1,gt2,g2,ZH,ZP,cplhhHmcVWm(gt1,gt2))

 End Do 
End Do 


cplhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWmVWmL(gt1,g2,v,v2,ZH,cplhhcVWmVWm(gt1))

End Do 


cplhhhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhcVWmVWmL(gt1,gt2,g2,ZH,cplhhhhcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplHmcHmcVWmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHmcHmcVWmVWmL(gt1,gt2,g2,ZP,cplHmcHmcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplcVWmcVWmVWmVWm1 = 0._dp 
cplcVWmcVWmVWmVWm2 = 0._dp 
cplcVWmcVWmVWmVWm3 = 0._dp 
Call CouplingcVWmcVWmVWmVWmL(g2,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3)



cplcHmVWmVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingcHmVWmVZL(gt1,g1,g2,v,v2,ZP,TW,cplcHmVWmVZ(gt1))

End Do 


cplcHmVPVWm = 0._dp 
Do gt1 = 1, 2
Call CouplingcHmVPVWmL(gt1,g1,g2,v,v2,ZP,TW,cplcHmVPVWm(gt1))

End Do 


cplHmcHmVPVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHmcHmVPVZL(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVPVZ(gt1,gt2))

 End Do 
End Do 


cplcVWmVPVWmVZ1 = 0._dp 
cplcVWmVPVWmVZ2 = 0._dp 
cplcVWmVPVWmVZ3 = 0._dp 
Call CouplingcVWmVPVWmVZL(g2,TW,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3)



Iname = Iname - 1 
End Subroutine CouplingsForLoopMasses

Subroutine CouplingAhAhUhhL(gt3,Lam5,Lam7,Lam4,Lam3,Lam2,v,v2,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: v,v2

Complex(dp), Intent(in) :: Lam5,Lam7,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(Lam3*v)
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam4*v)
End If 
If ((1.eq.gt3)) Then 
res = res+(Lam5*v)/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam7*v2)/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res+(v*Conjg(Lam5))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(v2*Conjg(Lam7))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam7*v)/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam2*v2)
End If 
If ((2.eq.gt3)) Then 
res = res-(v*Conjg(Lam7))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhUhhL  
 
 
Subroutine CouplingAhUhhhhL(gt2,gt3,Lam6,Lam5,Lam7,v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,v2,ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhUhhhh' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2)) Then 
res = res+(3*Lam6*v*ZH(gt3,1))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res-(Lam5*v2*ZH(gt3,1))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res+(v2*Conjg(Lam5)*ZH(gt3,1))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res+(-3*v*Conjg(Lam6)*ZH(gt3,1))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(Lam5*v*ZH(gt3,1))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+(Lam7*v2*ZH(gt3,1))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+(v*Conjg(Lam5)*ZH(gt3,1))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(v2*Conjg(Lam7)*ZH(gt3,1))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res-(Lam5*v*ZH(gt3,2))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res+(Lam7*v2*ZH(gt3,2))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res+(v*Conjg(Lam5)*ZH(gt3,2))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res-(v2*Conjg(Lam7)*ZH(gt3,2))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+(Lam7*v*ZH(gt3,2))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(v*Conjg(Lam7)*ZH(gt3,2))/2._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhUhhhhL  
 
 
Subroutine CouplingAhUhhsigma1L(gt2,Lam6,Lam5,Lam7,v,v2,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: v,v2

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhUhhsigma1' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2)) Then 
res = res-(Lam6*v)/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res-(Lam5*v2)/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res-(v2*Conjg(Lam5))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res-(v*Conjg(Lam6))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(Lam5*v)/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(Lam7*v2)/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(v*Conjg(Lam5))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(v2*Conjg(Lam7))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhUhhsigma1L  
 
 
Subroutine CouplingAhUhhVZL(gt2,g1,g2,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhUhhVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((2.eq.gt2)) Then 
res = res+(g2*Cos(TW))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+(g1*Sin(TW))/2._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhUhhVZL  
 
 
Subroutine CouplingcFdFdUhhL(gt1,gt2,gt3,Yd,epYD,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Yd(3,3),epYD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdUhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epYD(j1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epYD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdUhhL  
 
 
Subroutine CouplingcFeFeUhhL(gt1,gt2,gt3,Ye,epYE,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Ye(3,3),epYE(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeUhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*epYE(j1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epYE(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeUhhL  
 
 
Subroutine CouplingcFuFuUhhL(gt1,gt2,gt3,Yu,epYU,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Yu(3,3),epYU(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuUhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epYU(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epYU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuUhhL  
 
 
Subroutine CouplingcgWmgWmUhhL(gt3,g2,v,v2,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,v,v2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgWmUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(g2**2*v*RXiWm)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(g2**2*v2*RXiWm)/4._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgWmUhhL  
 
 
Subroutine CouplingcgWpCgWpCUhhL(gt3,g2,v,v2,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,v,v2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgWpCUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(g2**2*v*RXiWm)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(g2**2*v2*RXiWm)/4._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgWpCUhhL  
 
 
Subroutine CouplingcgZgZUhhL(gt3,g1,g2,v,v2,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,v2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgZUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(g2**2*v*Cos(TW)**2*RXiZ)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(g2**2*v2*Cos(TW)**2*RXiZ)/4._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(g1*g2*v*Cos(TW)*RXiZ*Sin(TW))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(g1*g2*v2*Cos(TW)*RXiZ*Sin(TW))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(g1**2*v*RXiZ*Sin(TW)**2)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(g1**2*v2*RXiZ*Sin(TW)**2)/4._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgZUhhL  
 
 
Subroutine CouplingUhhhhhhL(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,           & 
& v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: v,v2,ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-3*Lam1*v*ZH(gt2,1)*ZH(gt3,1)
End If 
If ((1.eq.gt1)) Then 
res = res+(-3*Lam6*v2*ZH(gt2,1)*ZH(gt3,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(-3*v2*Conjg(Lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(-3*Lam6*v*ZH(gt2,1)*ZH(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam3*v2*ZH(gt2,1)*ZH(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam4*v2*ZH(gt2,1)*ZH(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam5*v2*ZH(gt2,1)*ZH(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(v2*Conjg(Lam5)*ZH(gt2,1)*ZH(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(-3*v*Conjg(Lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(-3*Lam6*v*ZH(gt2,2)*ZH(gt3,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam3*v2*ZH(gt2,2)*ZH(gt3,1))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam4*v2*ZH(gt2,2)*ZH(gt3,1))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam5*v2*ZH(gt2,2)*ZH(gt3,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(v2*Conjg(Lam5)*ZH(gt2,2)*ZH(gt3,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(-3*v*Conjg(Lam6)*ZH(gt2,2)*ZH(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam3*v*ZH(gt2,2)*ZH(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam4*v*ZH(gt2,2)*ZH(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam5*v*ZH(gt2,2)*ZH(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(-3*Lam7*v2*ZH(gt2,2)*ZH(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(v*Conjg(Lam5)*ZH(gt2,2)*ZH(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(-3*v2*Conjg(Lam7)*ZH(gt2,2)*ZH(gt3,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(-3*Lam6*v*ZH(gt2,1)*ZH(gt3,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam3*v2*ZH(gt2,1)*ZH(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam4*v2*ZH(gt2,1)*ZH(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam5*v2*ZH(gt2,1)*ZH(gt3,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(v2*Conjg(Lam5)*ZH(gt2,1)*ZH(gt3,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(-3*v*Conjg(Lam6)*ZH(gt2,1)*ZH(gt3,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam3*v*ZH(gt2,1)*ZH(gt3,2))
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam4*v*ZH(gt2,1)*ZH(gt3,2))
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam5*v*ZH(gt2,1)*ZH(gt3,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(-3*Lam7*v2*ZH(gt2,1)*ZH(gt3,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(v*Conjg(Lam5)*ZH(gt2,1)*ZH(gt3,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(-3*v2*Conjg(Lam7)*ZH(gt2,1)*ZH(gt3,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam3*v*ZH(gt2,2)*ZH(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam4*v*ZH(gt2,2)*ZH(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam5*v*ZH(gt2,2)*ZH(gt3,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(-3*Lam7*v2*ZH(gt2,2)*ZH(gt3,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(v*Conjg(Lam5)*ZH(gt2,2)*ZH(gt3,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(-3*v2*Conjg(Lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(-3*Lam7*v*ZH(gt2,2)*ZH(gt3,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-3*Lam2*v2*ZH(gt2,2)*ZH(gt3,2)
End If 
If ((2.eq.gt1)) Then 
res = res+(-3*v*Conjg(Lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhhhhhL  
 
 
Subroutine CouplingUhhhhsigma1L(gt1,gt2,Lam6,Lam5,Lam7,v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: v,v2,ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhhhsigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-(Lam6*v2*ZH(gt2,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(v2*Conjg(Lam6)*ZH(gt2,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam6*v*ZH(gt2,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(Lam5*v2*ZH(gt2,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(v2*Conjg(Lam5)*ZH(gt2,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(v*Conjg(Lam6)*ZH(gt2,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam6*v*ZH(gt2,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(Lam5*v2*ZH(gt2,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(v2*Conjg(Lam5)*ZH(gt2,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(v*Conjg(Lam6)*ZH(gt2,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(Lam5*v*ZH(gt2,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(-3*Lam7*v2*ZH(gt2,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(v*Conjg(Lam5)*ZH(gt2,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(3*v2*Conjg(Lam7)*ZH(gt2,2))/2._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhhhsigma1L  
 
 
Subroutine CouplingUhhHmcHmL(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,               & 
& Lam2,v,v2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: v,v2,ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-(Lam1*v*ZP(gt2,1)*ZP(gt3,1))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam6*v2*ZP(gt2,1)*ZP(gt3,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(v2*Conjg(Lam6)*ZP(gt2,1)*ZP(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam6*v*ZP(gt2,1)*ZP(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam3*v2*ZP(gt2,1)*ZP(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-(v*Conjg(Lam6)*ZP(gt2,1)*ZP(gt3,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam4*v2*ZP(gt2,2)*ZP(gt3,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam5*v2*ZP(gt2,2)*ZP(gt3,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(v*Conjg(Lam6)*ZP(gt2,2)*ZP(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam4*v*ZP(gt2,2)*ZP(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam5*v*ZP(gt2,2)*ZP(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(v2*Conjg(Lam7)*ZP(gt2,2)*ZP(gt3,1))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam6*v*ZP(gt2,1)*ZP(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam4*v2*ZP(gt2,1)*ZP(gt3,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(v2*Conjg(Lam5)*ZP(gt2,1)*ZP(gt3,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam4*v*ZP(gt2,1)*ZP(gt3,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam7*v2*ZP(gt2,1)*ZP(gt3,2))
End If 
If ((2.eq.gt1)) Then 
res = res-(v*Conjg(Lam5)*ZP(gt2,1)*ZP(gt3,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam3*v*ZP(gt2,2)*ZP(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam7*v2*ZP(gt2,2)*ZP(gt3,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(v2*Conjg(Lam7)*ZP(gt2,2)*ZP(gt3,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam7*v*ZP(gt2,2)*ZP(gt3,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam2*v2*ZP(gt2,2)*ZP(gt3,2))
End If 
If ((2.eq.gt1)) Then 
res = res-(v*Conjg(Lam7)*ZP(gt2,2)*ZP(gt3,2))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhHmcHmL  
 
 
Subroutine CouplingUhhHmcVWmL(gt1,gt2,g2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhHmcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res+(g2*ZP(gt2,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(g2*ZP(gt2,2))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhHmcVWmL  
 
 
Subroutine CouplingUhhsigma1sigma1L(gt1,Lam6,Lam5,Lam1,Lam4,Lam3,v,v2,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: v,v2

Complex(dp), Intent(in) :: Lam6,Lam5,Lam1,Lam4,Lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhsigma1sigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-(Lam1*v)
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam6*v2)/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(v2*Conjg(Lam6))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam6*v)/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam3*v2)
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam4*v2)
End If 
If ((2.eq.gt1)) Then 
res = res+(Lam5*v2)/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(v2*Conjg(Lam5))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(v*Conjg(Lam6))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhsigma1sigma1L  
 
 
Subroutine CouplingUhhsigma1VZL(gt1,g1,g2,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhsigma1VZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-(g2*Cos(TW))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(g1*Sin(TW))/2._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhsigma1VZL  
 
 
Subroutine CouplingUhhcVWmVWmL(gt1,g2,v,v2,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,v,v2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res+(g2**2*v)/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(g2**2*v2)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhcVWmVWmL  
 
 
Subroutine CouplingUhhVZVZL(gt1,g1,g2,v,v2,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,v2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res+(g2**2*v*Cos(TW)**2)/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(g2**2*v2*Cos(TW)**2)/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+g1*g2*v*Cos(TW)*Sin(TW)
End If 
If ((2.eq.gt1)) Then 
res = res+g1*g2*v2*Cos(TW)*Sin(TW)
End If 
If ((1.eq.gt1)) Then 
res = res+(g1**2*v*Sin(TW)**2)/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(g1**2*v2*Sin(TW)**2)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhVZVZL  
 
 
Subroutine CouplingAhAhUhhUhhL(gt3,gt4,Lam5,Lam7,Lam4,Lam3,Lam2,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Complex(dp), Intent(in) :: Lam5,Lam7,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhUhhUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-1._dp*(Lam3)
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-1._dp*(Lam4)
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res+Lam5/2._dp
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res+Conjg(Lam5)/2._dp
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-1._dp*(Lam7)/2._dp
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-Conjg(Lam7)/2._dp
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-1._dp*(Lam7)/2._dp
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-Conjg(Lam7)/2._dp
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-1._dp*(Lam2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhUhhUhhL  
 
 
Subroutine CouplingUhhUhhhhhhL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,              & 
& Lam3,Lam2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-3*Lam1*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res+(-3*Lam6*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res+(-3*Conjg(Lam6)*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(-3*Lam6*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(-3*Conjg(Lam6)*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam3*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam4*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam5*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Conjg(Lam5)*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(-3*Lam6*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(-3*Conjg(Lam6)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam3*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam4*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam5*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Conjg(Lam5)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam3*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam4*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam5*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Conjg(Lam5)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(-3*Lam7*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(-3*Conjg(Lam7)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(-3*Lam6*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(-3*Conjg(Lam6)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam3*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam4*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam5*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Conjg(Lam5)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam3*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam4*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam5*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Conjg(Lam5)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(-3*Lam7*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(-3*Conjg(Lam7)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(Lam3*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(Lam4*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(Lam5*ZH(gt3,2)*ZH(gt4,2))/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(Conjg(Lam5)*ZH(gt3,2)*ZH(gt4,2))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res+(-3*Lam7*ZH(gt3,2)*ZH(gt4,2))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res+(-3*Conjg(Lam7)*ZH(gt3,2)*ZH(gt4,2))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(-3*Lam7*ZH(gt3,2)*ZH(gt4,2))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(-3*Conjg(Lam7)*ZH(gt3,2)*ZH(gt4,2))/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-3*Lam2*ZH(gt3,2)*ZH(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhUhhhhhhL  
 
 
Subroutine CouplingUhhUhhHmcHmL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,             & 
& Lam3,Lam2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(Lam1*ZP(gt3,1)*ZP(gt4,1))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam6*ZP(gt3,1)*ZP(gt4,1))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Conjg(Lam6)*ZP(gt3,1)*ZP(gt4,1))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam6*ZP(gt3,1)*ZP(gt4,1))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Conjg(Lam6)*ZP(gt3,1)*ZP(gt4,1))/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam3*ZP(gt3,1)*ZP(gt4,1))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(Conjg(Lam6)*ZP(gt3,2)*ZP(gt4,1))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam4*ZP(gt3,2)*ZP(gt4,1))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam5*ZP(gt3,2)*ZP(gt4,1))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam4*ZP(gt3,2)*ZP(gt4,1))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam5*ZP(gt3,2)*ZP(gt4,1))/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Conjg(Lam7)*ZP(gt3,2)*ZP(gt4,1))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(Lam6*ZP(gt3,1)*ZP(gt4,2))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam4*ZP(gt3,1)*ZP(gt4,2))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Conjg(Lam5)*ZP(gt3,1)*ZP(gt4,2))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam4*ZP(gt3,1)*ZP(gt4,2))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Conjg(Lam5)*ZP(gt3,1)*ZP(gt4,2))/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam7*ZP(gt3,1)*ZP(gt4,2))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(Lam3*ZP(gt3,2)*ZP(gt4,2))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam7*ZP(gt3,2)*ZP(gt4,2))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Conjg(Lam7)*ZP(gt3,2)*ZP(gt4,2))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam7*ZP(gt3,2)*ZP(gt4,2))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Conjg(Lam7)*ZP(gt3,2)*ZP(gt4,2))/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam2*ZP(gt3,2)*ZP(gt4,2))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhUhhHmcHmL  
 
 
Subroutine CouplingUhhUhhsigma1sigma1L(gt1,gt2,Lam6,Lam5,Lam1,Lam4,Lam3,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Lam6,Lam5,Lam1,Lam4,Lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhsigma1sigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-1._dp*(Lam1)
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-1._dp*(Lam6)/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-Conjg(Lam6)/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-1._dp*(Lam6)/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-Conjg(Lam6)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-1._dp*(Lam3)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-1._dp*(Lam4)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+Lam5/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+Conjg(Lam5)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhUhhsigma1sigma1L  
 
 
Subroutine CouplingUhhUhhcVWmVWmL(gt1,gt2,g2,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g2**2/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+g2**2/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhUhhcVWmVWmL  
 
 
Subroutine CouplingUhhUhhVZVZL(gt1,gt2,g1,g2,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g2**2*Cos(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(g2**2*Cos(TW)**2)/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g1*g2*Cos(TW)*Sin(TW)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+g1*g2*Cos(TW)*Sin(TW)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g1**2*Sin(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(g1**2*Sin(TW)**2)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhUhhVZVZL  
 
 
Subroutine CouplingAhHmcUHmL(gt2,gt3,Lam6,Lam5,Lam7,Lam4,v,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmcUHm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res+(Lam6*v*ZP(gt2,1))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(v*Conjg(Lam6)*ZP(gt2,1))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam4*v*ZP(gt2,1))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res+(v*Conjg(Lam5)*ZP(gt2,1))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res+(Lam4*v*ZP(gt2,2))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam5*v*ZP(gt2,2))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res+(Lam7*v*ZP(gt2,2))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(v*Conjg(Lam7)*ZP(gt2,2))/2._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmcUHmL  
 
 
Subroutine CouplingAhcUHmVWmL(gt2,g2,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcUHmVWm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((2.eq.gt2)) Then 
res = res-1._dp*(g2)/2._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcUHmVWmL  
 
 
Subroutine CouplingcFuFdcUHmL(gt1,gt2,gt3,Yu,epYU,Yd,epYD,ZDL,ZDR,ZUL,ZUR,            & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Yu(3,3),epYU(3,3),Yd(3,3),epYD(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdcUHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*epYU(j1,j2)
End Do 
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yu(j1,j2)
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZUL(gt1,j2)
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(epYD(j1,j2))*ZDR(gt2,j1)*ZUL(gt1,j2)
End Do 
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdcUHmL  
 
 
Subroutine CouplingcFvFecUHmL(gt1,gt2,gt3,Ye,epYE,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Ye(3,3),epYE(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFvFecUHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,gt1))*ZER(gt2,j1)
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j1 = 1,3
resR = resR+Conjg(epYE(j1,gt1))*ZER(gt2,j1)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFvFecUHmL  
 
 
Subroutine CouplingcgZgWmcUHmL(gt3,g1,g2,v,v2,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,v2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWmcUHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res+(g2**2*v*Cos(TW)*RXiZ)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res+(g2**2*v2*Cos(TW)*RXiZ)/4._dp
End If 
If ((1.eq.gt3)) Then 
res = res+(g1*g2*v*RXiZ*Sin(TW))/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res+(g1*g2*v2*RXiZ*Sin(TW))/4._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWmcUHmL  
 
 
Subroutine CouplingcgWmgZUHmL(gt3,g1,g2,v,v2,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,v2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgZUHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(g2**2*v*Cos(TW)*RXiWm)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(g2**2*v2*Cos(TW)*RXiWm)/4._dp
End If 
If ((1.eq.gt3)) Then 
res = res+(g1*g2*v*RXiWm*Sin(TW))/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res+(g1*g2*v2*RXiWm*Sin(TW))/4._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgZUHmL  
 
 
Subroutine CouplingcgWpCgZcUHmL(gt3,g1,g2,v,v2,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,v2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgZcUHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(g2**2*v*Cos(TW)*RXiWm)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(g2**2*v2*Cos(TW)*RXiWm)/4._dp
End If 
If ((1.eq.gt3)) Then 
res = res+(g1*g2*v*RXiWm*Sin(TW))/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res+(g1*g2*v2*RXiWm*Sin(TW))/4._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgZcUHmL  
 
 
Subroutine CouplingcgZgWpCUHmL(gt3,g1,g2,v,v2,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,v2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpCUHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res+(g2**2*v*Cos(TW)*RXiZ)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res+(g2**2*v2*Cos(TW)*RXiZ)/4._dp
End If 
If ((1.eq.gt3)) Then 
res = res+(g1*g2*v*RXiZ*Sin(TW))/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res+(g1*g2*v2*RXiZ*Sin(TW))/4._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpCUHmL  
 
 
Subroutine CouplinghhHmcUHmL(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,               & 
& Lam2,v,v2,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: v,v2,ZH(2,2),ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmcUHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(Lam1*v*ZH(gt1,1)*ZP(gt2,1))
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam6*v2*ZH(gt1,1)*ZP(gt2,1))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(v2*Conjg(Lam6)*ZH(gt1,1)*ZP(gt2,1))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam6*v*ZH(gt1,1)*ZP(gt2,1))
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam4*v2*ZH(gt1,1)*ZP(gt2,1))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(v2*Conjg(Lam5)*ZH(gt1,1)*ZP(gt2,1))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam6*v*ZH(gt1,2)*ZP(gt2,1))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam3*v2*ZH(gt1,2)*ZP(gt2,1))
End If 
If ((1.eq.gt3)) Then 
res = res-(v*Conjg(Lam6)*ZH(gt1,2)*ZP(gt2,1))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam4*v*ZH(gt1,2)*ZP(gt2,1))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam7*v2*ZH(gt1,2)*ZP(gt2,1))
End If 
If ((2.eq.gt3)) Then 
res = res-(v*Conjg(Lam5)*ZH(gt1,2)*ZP(gt2,1))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam4*v2*ZH(gt1,1)*ZP(gt2,2))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam5*v2*ZH(gt1,1)*ZP(gt2,2))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(v*Conjg(Lam6)*ZH(gt1,1)*ZP(gt2,2))
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam3*v*ZH(gt1,1)*ZP(gt2,2))
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam7*v2*ZH(gt1,1)*ZP(gt2,2))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(v2*Conjg(Lam7)*ZH(gt1,1)*ZP(gt2,2))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam4*v*ZH(gt1,2)*ZP(gt2,2))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam5*v*ZH(gt1,2)*ZP(gt2,2))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(v2*Conjg(Lam7)*ZH(gt1,2)*ZP(gt2,2))
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam7*v*ZH(gt1,2)*ZP(gt2,2))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam2*v2*ZH(gt1,2)*ZP(gt2,2))
End If 
If ((2.eq.gt3)) Then 
res = res-(v*Conjg(Lam7)*ZH(gt1,2)*ZP(gt2,2))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmcUHmL  
 
 
Subroutine CouplinghhcUHmVWmL(gt1,gt2,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcUHmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2)) Then 
res = res-(g2*ZH(gt1,1))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(g2*ZH(gt1,2))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcUHmVWmL  
 
 
Subroutine CouplingHmsigma1cUHmL(gt1,gt3,Lam6,Lam5,Lam7,Lam4,v2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt3
Real(dp), Intent(in) :: v2,ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmsigma1cUHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(Lam6*v2*ZP(gt1,1))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res+(v2*Conjg(Lam6)*ZP(gt1,1))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res+(Lam4*v2*ZP(gt1,1))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(v2*Conjg(Lam5)*ZP(gt1,1))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam4*v2*ZP(gt1,2))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res+(Lam5*v2*ZP(gt1,2))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam7*v2*ZP(gt1,2))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res+(v2*Conjg(Lam7)*ZP(gt1,2))/2._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmsigma1cUHmL  
 
 
Subroutine CouplingHmcUHmVPL(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcUHmVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2)) Then 
res = res-(g1*Cos(TW)*ZP(gt1,1))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res-(g2*Sin(TW)*ZP(gt1,1))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(g1*Cos(TW)*ZP(gt1,2))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(g2*Sin(TW)*ZP(gt1,2))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcUHmVPL  
 
 
Subroutine CouplingHmcUHmVZL(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcUHmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2)) Then 
res = res-(g2*Cos(TW)*ZP(gt1,1))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res+(g1*Sin(TW)*ZP(gt1,1))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(g2*Cos(TW)*ZP(gt1,2))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+(g1*Sin(TW)*ZP(gt1,2))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcUHmVZL  
 
 
Subroutine Couplingsigma1cUHmVWmL(gt2,g2,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingsigma1cUHmVWm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2)) Then 
res = res-1._dp*(g2)/2._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplingsigma1cUHmVWmL  
 
 
Subroutine CouplingcUHmVPVWmL(gt1,g1,g2,v,v2,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,v2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUHmVPVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res+(g1*g2*v*Cos(TW))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(g1*g2*v2*Cos(TW))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUHmVPVWmL  
 
 
Subroutine CouplingcUHmVWmVZL(gt1,g1,g2,v,v2,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,v2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUHmVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-(g1*g2*v*Sin(TW))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(g1*g2*v2*Sin(TW))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUHmVWmVZL  
 
 
Subroutine CouplingAhAhUHmcUHmL(gt3,gt4,Lam7,Lam3,Lam2,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Complex(dp), Intent(in) :: Lam7,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhUHmcUHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-1._dp*(Lam3)
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-Conjg(Lam7)
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-1._dp*(Lam7)
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-1._dp*(Lam2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhUHmcUHmL  
 
 
Subroutine CouplinghhhhUHmcUHmL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,             & 
& Lam3,Lam2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhUHmcUHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-(Lam1*ZH(gt1,1)*ZH(gt2,1))
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-(Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,1))
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam6*ZH(gt1,1)*ZH(gt2,1))
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam3*ZH(gt1,1)*ZH(gt2,1))
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-(Lam6*ZH(gt1,2)*ZH(gt2,1))/2._dp
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-(Conjg(Lam6)*ZH(gt1,2)*ZH(gt2,1))/2._dp
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,1))/2._dp
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-(Lam5*ZH(gt1,2)*ZH(gt2,1))/2._dp
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,1))/2._dp
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,1))/2._dp
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam7*ZH(gt1,2)*ZH(gt2,1))/2._dp
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,1))/2._dp
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-(Lam6*ZH(gt1,1)*ZH(gt2,2))/2._dp
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-(Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,2))/2._dp
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-(Lam4*ZH(gt1,1)*ZH(gt2,2))/2._dp
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-(Lam5*ZH(gt1,1)*ZH(gt2,2))/2._dp
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam4*ZH(gt1,1)*ZH(gt2,2))/2._dp
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,2))/2._dp
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam7*ZH(gt1,1)*ZH(gt2,2))/2._dp
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Conjg(Lam7)*ZH(gt1,1)*ZH(gt2,2))/2._dp
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-(Lam3*ZH(gt1,2)*ZH(gt2,2))
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-(Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,2))
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam7*ZH(gt1,2)*ZH(gt2,2))
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam2*ZH(gt1,2)*ZH(gt2,2))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhUHmcUHmL  
 
 
Subroutine CouplingUHmHmcUHmcHmL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,            & 
& Lam3,Lam2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUHmHmcUHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt3)) Then 
res = res-2*Lam1*ZP(gt2,1)*ZP(gt4,1)
End If 
If ((1.eq.gt3).And.(2.eq.gt1)) Then 
res = res-2*Conjg(Lam6)*ZP(gt2,1)*ZP(gt4,1)
End If 
If ((1.eq.gt1).And.(2.eq.gt3)) Then 
res = res-2*Lam6*ZP(gt2,1)*ZP(gt4,1)
End If 
If ((2.eq.gt1).And.(2.eq.gt3)) Then 
res = res-(Lam3*ZP(gt2,1)*ZP(gt4,1))
End If 
If ((2.eq.gt1).And.(2.eq.gt3)) Then 
res = res-(Lam4*ZP(gt2,1)*ZP(gt4,1))
End If 
If ((1.eq.gt1).And.(1.eq.gt3)) Then 
res = res-2*Conjg(Lam6)*ZP(gt2,2)*ZP(gt4,1)
End If 
If ((1.eq.gt3).And.(2.eq.gt1)) Then 
res = res-2*Lam5*ZP(gt2,2)*ZP(gt4,1)
End If 
If ((1.eq.gt1).And.(2.eq.gt3)) Then 
res = res-(Lam3*ZP(gt2,2)*ZP(gt4,1))
End If 
If ((1.eq.gt1).And.(2.eq.gt3)) Then 
res = res-(Lam4*ZP(gt2,2)*ZP(gt4,1))
End If 
If ((2.eq.gt1).And.(2.eq.gt3)) Then 
res = res-2*Conjg(Lam7)*ZP(gt2,2)*ZP(gt4,1)
End If 
If ((1.eq.gt1).And.(1.eq.gt3)) Then 
res = res-2*Lam6*ZP(gt2,1)*ZP(gt4,2)
End If 
If ((1.eq.gt3).And.(2.eq.gt1)) Then 
res = res-(Lam3*ZP(gt2,1)*ZP(gt4,2))
End If 
If ((1.eq.gt3).And.(2.eq.gt1)) Then 
res = res-(Lam4*ZP(gt2,1)*ZP(gt4,2))
End If 
If ((1.eq.gt1).And.(2.eq.gt3)) Then 
res = res-2*Conjg(Lam5)*ZP(gt2,1)*ZP(gt4,2)
End If 
If ((2.eq.gt1).And.(2.eq.gt3)) Then 
res = res-2*Lam7*ZP(gt2,1)*ZP(gt4,2)
End If 
If ((1.eq.gt1).And.(1.eq.gt3)) Then 
res = res-(Lam3*ZP(gt2,2)*ZP(gt4,2))
End If 
If ((1.eq.gt1).And.(1.eq.gt3)) Then 
res = res-(Lam4*ZP(gt2,2)*ZP(gt4,2))
End If 
If ((1.eq.gt3).And.(2.eq.gt1)) Then 
res = res-2*Conjg(Lam7)*ZP(gt2,2)*ZP(gt4,2)
End If 
If ((1.eq.gt1).And.(2.eq.gt3)) Then 
res = res-2*Lam7*ZP(gt2,2)*ZP(gt4,2)
End If 
If ((2.eq.gt1).And.(2.eq.gt3)) Then 
res = res-2*Lam2*ZP(gt2,2)*ZP(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUHmHmcUHmcHmL  
 
 
Subroutine CouplingUHmsigma1sigma1cUHmL(gt1,gt4,Lam6,Lam1,Lam3,res)

Implicit None 

Integer, Intent(in) :: gt1,gt4
Complex(dp), Intent(in) :: Lam6,Lam1,Lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUHmsigma1sigma1cUHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt4)) Then 
res = res-1._dp*(Lam1)
End If 
If ((1.eq.gt4).And.(2.eq.gt1)) Then 
res = res-Conjg(Lam6)
End If 
If ((1.eq.gt1).And.(2.eq.gt4)) Then 
res = res-1._dp*(Lam6)
End If 
If ((2.eq.gt1).And.(2.eq.gt4)) Then 
res = res-1._dp*(Lam3)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUHmsigma1sigma1cUHmL  
 
 
Subroutine CouplingUHmcUHmVPVPL(gt1,gt2,g1,g2,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUHmcUHmVPVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g1**2*Cos(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(g1**2*Cos(TW)**2)/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g1*g2*Cos(TW)*Sin(TW)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+g1*g2*Cos(TW)*Sin(TW)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g2**2*Sin(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(g2**2*Sin(TW)**2)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUHmcUHmVPVPL  
 
 
Subroutine CouplingUHmcUHmcVWmVWmL(gt1,gt2,g2,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUHmcUHmcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g2**2/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+g2**2/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUHmcUHmcVWmVWmL  
 
 
Subroutine CouplingUHmcUHmVZVZL(gt1,gt2,g1,g2,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUHmcUHmVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g2**2*Cos(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(g2**2*Cos(TW)**2)/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(g1*g2*Cos(TW)*Sin(TW))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(g1*g2*Cos(TW)*Sin(TW))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g1**2*Sin(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(g1**2*Sin(TW)**2)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUHmcUHmVZVZL  
 
 
Subroutine CouplingcUFdFdAhL(gt1,gt2,epYD,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epYD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZDL(gt2,j2))*epYD(gt1,j2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(epYD(j1,gt1))*ZDR(gt2,j1))/sqrt(2._dp))
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdAhL  
 
 
Subroutine CouplingcUFdFdhhL(gt1,gt2,gt3,Yd,epYD,ZH,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Yd(3,3),epYD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZDL(gt2,j2))*Yd(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZDL(gt2,j2))*epYD(gt1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,gt1))*ZDR(gt2,j1)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(epYD(j1,gt1))*ZDR(gt2,j1)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdhhL  
 
 
Subroutine CouplingcUFdFdsigma1L(gt1,gt2,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdsigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZDL(gt2,j2))*Yd(gt1,j2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,gt1))*ZDR(gt2,j1))/sqrt(2._dp))
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdsigma1L  
 
 
Subroutine CouplingcUFdFdVGL(gt1,gt2,g3,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(in) :: ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g3*Conjg(ZDL(gt2,gt1)))
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(g3*ZDR(gt2,gt1))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdVGL  
 
 
Subroutine CouplingcUFdFdVPL(gt1,gt2,g1,g2,ZDL,ZDR,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g1*Conjg(ZDL(gt2,gt1))*Cos(TW))/6._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZDL(gt2,gt1))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(g1*Cos(TW)*ZDR(gt2,gt1))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdVPL  
 
 
Subroutine CouplingcUFdFdVZL(gt1,gt2,g1,g2,ZDL,ZDR,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZDL(gt2,gt1))*Cos(TW))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1*Conjg(ZDL(gt2,gt1))*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(g1*Sin(TW)*ZDR(gt2,gt1))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdVZL  
 
 
Subroutine CouplingcUFdFuHmL(gt1,gt2,gt3,Yu,epYU,Yd,epYD,ZP,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Yu(3,3),epYU(3,3),Yd(3,3),epYD(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFuHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+Conjg(ZUL(gt2,j2))*Yd(gt1,j2)*ZP(gt3,1)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+Conjg(ZUL(gt2,j2))*epYD(gt1,j2)*ZP(gt3,2)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,gt1))*ZUR(gt2,j1)*ZP(gt3,1)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+Conjg(epYU(j1,gt1))*ZUR(gt2,j1)*ZP(gt3,2)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFuHmL  
 
 
Subroutine CouplingcUFdFuVWmL(gt1,gt2,g2,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFuVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(ZUL(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFuVWmL  
 
 
Subroutine CouplingcUFuFuAhL(gt1,gt2,epYU,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epYU(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZUL(gt2,j2))*epYU(gt1,j2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(epYU(j1,gt1))*ZUR(gt2,j1))/sqrt(2._dp))
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuAhL  
 
 
Subroutine CouplingcUFuFdcHmL(gt1,gt2,gt3,Yu,epYU,Yd,epYD,ZP,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Yu(3,3),epYU(3,3),Yd(3,3),epYD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFdcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+Conjg(ZDL(gt2,j2))*Yu(gt1,j2)*ZP(gt3,1)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+Conjg(ZDL(gt2,j2))*epYU(gt1,j2)*ZP(gt3,2)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,gt1))*ZDR(gt2,j1)*ZP(gt3,1)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+Conjg(epYD(j1,gt1))*ZDR(gt2,j1)*ZP(gt3,2)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFdcHmL  
 
 
Subroutine CouplingcUFuFdcVWmL(gt1,gt2,g2,ZDL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFdcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(ZDL(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFdcVWmL  
 
 
Subroutine CouplingcUFuFuhhL(gt1,gt2,gt3,Yu,epYU,ZH,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Yu(3,3),epYU(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZUL(gt2,j2))*Yu(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZUL(gt2,j2))*epYU(gt1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,gt1))*ZUR(gt2,j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(epYU(j1,gt1))*ZUR(gt2,j1)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuhhL  
 
 
Subroutine CouplingcUFuFusigma1L(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFusigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZUL(gt2,j2))*Yu(gt1,j2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,gt1))*ZUR(gt2,j1))/sqrt(2._dp))
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFusigma1L  
 
 
Subroutine CouplingcUFuFuVGL(gt1,gt2,g3,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(in) :: ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g3*Conjg(ZUL(gt2,gt1)))
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(g3*ZUR(gt2,gt1))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuVGL  
 
 
Subroutine CouplingcUFuFuVPL(gt1,gt2,g1,g2,ZUL,ZUR,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g1*Conjg(ZUL(gt2,gt1))*Cos(TW))/6._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g2*Conjg(ZUL(gt2,gt1))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(-2*g1*Cos(TW)*ZUR(gt2,gt1))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuVPL  
 
 
Subroutine CouplingcUFuFuVZL(gt1,gt2,g1,g2,ZUL,ZUR,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g2*Conjg(ZUL(gt2,gt1))*Cos(TW))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1*Conjg(ZUL(gt2,gt1))*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(2*g1*Sin(TW)*ZUR(gt2,gt1))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuVZL  
 
 
Subroutine CouplingcUFeFeAhL(gt1,gt2,epYE,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epYE(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFeAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZEL(gt2,j2))*epYE(gt1,j2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(epYE(j1,gt1))*ZER(gt2,j1))/sqrt(2._dp))
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFeAhL  
 
 
Subroutine CouplingcUFeFehhL(gt1,gt2,gt3,Ye,epYE,ZH,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Ye(3,3),epYE(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFehh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZEL(gt2,j2))*Ye(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZEL(gt2,j2))*epYE(gt1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,gt1))*ZER(gt2,j1)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(epYE(j1,gt1))*ZER(gt2,j1)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFehhL  
 
 
Subroutine CouplingcUFeFesigma1L(gt1,gt2,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFesigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZEL(gt2,j2))*Ye(gt1,j2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,gt1))*ZER(gt2,j1))/sqrt(2._dp))
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFesigma1L  
 
 
Subroutine CouplingcUFeFeVPL(gt1,gt2,g1,g2,ZEL,ZER,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFeVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1*Conjg(ZEL(gt2,gt1))*Cos(TW))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZEL(gt2,gt1))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+g1*Cos(TW)*ZER(gt2,gt1)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFeVPL  
 
 
Subroutine CouplingcUFeFeVZL(gt1,gt2,g1,g2,ZEL,ZER,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFeVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZEL(gt2,gt1))*Cos(TW))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g1*Conjg(ZEL(gt2,gt1))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(g1*Sin(TW)*ZER(gt2,gt1))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFeVZL  
 
 
Subroutine CouplingcUFeFvHmL(gt1,gt2,gt3,Ye,epYE,ZP,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Ye(3,3),epYE(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFvHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+Ye(gt1,gt2)*ZP(gt3,1)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+epYE(gt1,gt2)*ZP(gt3,2)
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFvHmL  
 
 
Subroutine CouplingcUFeFvVWmL(gt1,gt2,g2,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFvVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2).And.(gt2.le.3).And.(gt2.ge.1)) Then 
resL = resL-(g2/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFvVWmL  
 
 
Subroutine CouplingcUFvFecHmL(gt1,gt2,gt3,Ye,epYE,ZP,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Ye(3,3),epYE(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFvFecHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
resR = 0._dp 
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,gt1))*ZER(gt2,j1)*ZP(gt3,1)
End Do 
Do j1 = 1,3
resR = resR+Conjg(epYE(j1,gt1))*ZER(gt2,j1)*ZP(gt3,2)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFvFecHmL  
 
 
Subroutine CouplingcUFvFecVWmL(gt1,gt2,g2,ZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFvFecVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(ZEL(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFvFecVWmL  
 
 
Subroutine CouplingcUFvFvVZL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFvFvVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFvFvVZL  
 
 
Subroutine CouplingAhAhsigma1L(Lam5,Lam7,v,v2,res)

Implicit None 

Real(dp), Intent(in) :: v,v2

Complex(dp), Intent(in) :: Lam5,Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhsigma1' 
 
res = 0._dp 
res = res-(Lam5*v)/2._dp
res = res-(Lam7*v2)/2._dp
res = res+(v*Conjg(Lam5))/2._dp
res = res+(v2*Conjg(Lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhsigma1L  
 
 
Subroutine CouplingAhhhsigma1L(gt2,Lam6,Lam5,Lam7,v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: v,v2,ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhsigma1' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam6*v*ZH(gt2,1))/2._dp
res = res-(Lam5*v2*ZH(gt2,1))/2._dp
res = res-(v2*Conjg(Lam5)*ZH(gt2,1))/2._dp
res = res-(v*Conjg(Lam6)*ZH(gt2,1))/2._dp
res = res-(Lam5*v*ZH(gt2,2))/2._dp
res = res-(Lam7*v2*ZH(gt2,2))/2._dp
res = res-(v*Conjg(Lam5)*ZH(gt2,2))/2._dp
res = res-(v2*Conjg(Lam7)*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhsigma1L  
 
 
Subroutine CouplingAhsigma1sigma1L(Lam6,Lam5,v,v2,res)

Implicit None 

Real(dp), Intent(in) :: v,v2

Complex(dp), Intent(in) :: Lam6,Lam5

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhsigma1sigma1' 
 
res = 0._dp 
res = res+(Lam6*v)/2._dp
res = res+(Lam5*v2)/2._dp
res = res-(v2*Conjg(Lam5))/2._dp
res = res-(v*Conjg(Lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhsigma1sigma1L  
 
 
Subroutine CouplingcFdFdsigma1L(gt1,gt2,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdsigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdsigma1L  
 
 
Subroutine CouplingcFeFesigma1L(gt1,gt2,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFesigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFesigma1L  
 
 
Subroutine CouplingcFuFusigma1L(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFusigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFusigma1L  
 
 
Subroutine CouplingcgWmgWmsigma1L(g2,v,res)

Implicit None 

Real(dp), Intent(in) :: g2,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgWmsigma1' 
 
res = 0._dp 
res = res-(g2**2*v*RXiWm)/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgWmsigma1L  
 
 
Subroutine CouplingcgWpCgWpCsigma1L(g2,v,res)

Implicit None 

Real(dp), Intent(in) :: g2,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgWpCsigma1' 
 
res = 0._dp 
res = res+(g2**2*v*RXiWm)/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgWpCsigma1L  
 
 
Subroutine Couplinghhhhsigma1L(gt1,gt2,Lam6,Lam5,Lam7,v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: v,v2,ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhsigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam6*v2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(v2*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-(Lam6*v*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res+(Lam5*v2*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res-(v2*Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res+(v*Conjg(Lam6)*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res-(Lam6*v*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res+(Lam5*v2*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res-(v2*Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res+(v*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res+(Lam5*v*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res+(-3*Lam7*v2*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res-(v*Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res+(3*v2*Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhsigma1L  
 
 
Subroutine Couplinghhsigma1sigma1L(gt1,Lam6,Lam5,Lam1,Lam4,Lam3,v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: v,v2,ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam1,Lam4,Lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhsigma1sigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam1*v*ZH(gt1,1))
res = res-(Lam6*v2*ZH(gt1,1))/2._dp
res = res-(v2*Conjg(Lam6)*ZH(gt1,1))/2._dp
res = res-(Lam6*v*ZH(gt1,2))/2._dp
res = res-(Lam3*v2*ZH(gt1,2))
res = res-(Lam4*v2*ZH(gt1,2))
res = res+(Lam5*v2*ZH(gt1,2))/2._dp
res = res+(v2*Conjg(Lam5)*ZH(gt1,2))/2._dp
res = res-(v*Conjg(Lam6)*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhsigma1sigma1L  
 
 
Subroutine Couplinghhsigma1VZL(gt1,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhsigma1VZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*Cos(TW)*ZH(gt1,1))/2._dp
res = res-(g1*Sin(TW)*ZH(gt1,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhsigma1VZL  
 
 
Subroutine CouplingHmsigma1cHmL(gt1,gt3,Lam6,Lam5,Lam7,Lam4,v2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt3
Real(dp), Intent(in) :: v2,ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmsigma1cHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam6*v2*ZP(gt1,1)*ZP(gt3,1))/2._dp
res = res+(v2*Conjg(Lam6)*ZP(gt1,1)*ZP(gt3,1))/2._dp
res = res-(Lam4*v2*ZP(gt1,2)*ZP(gt3,1))/2._dp
res = res+(Lam5*v2*ZP(gt1,2)*ZP(gt3,1))/2._dp
res = res+(Lam4*v2*ZP(gt1,1)*ZP(gt3,2))/2._dp
res = res-(v2*Conjg(Lam5)*ZP(gt1,1)*ZP(gt3,2))/2._dp
res = res-(Lam7*v2*ZP(gt1,2)*ZP(gt3,2))/2._dp
res = res+(v2*Conjg(Lam7)*ZP(gt1,2)*ZP(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmsigma1cHmL  
 
 
Subroutine CouplingHmsigma1cVWmL(gt1,g2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,ZP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmsigma1cVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*ZP(gt1,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmsigma1cVWmL  
 
 
Subroutine Couplingsigma1sigma1sigma1L(Lam6,v2,res)

Implicit None 

Real(dp), Intent(in) :: v2

Complex(dp), Intent(in) :: Lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingsigma1sigma1sigma1' 
 
res = 0._dp 
res = res+(-3*Lam6*v2)/2._dp
res = res+(3*v2*Conjg(Lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplingsigma1sigma1sigma1L  
 
 
Subroutine CouplingAhAhsigma1sigma1L(Lam5,Lam4,Lam3,res)

Implicit None 

Complex(dp), Intent(in) :: Lam5,Lam4,Lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhsigma1sigma1' 
 
res = 0._dp 
res = res-1._dp*(Lam3)
res = res-1._dp*(Lam4)
res = res-1._dp*(Lam5)/2._dp
res = res-Conjg(Lam5)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhsigma1sigma1L  
 
 
Subroutine Couplinghhhhsigma1sigma1L(gt1,gt2,Lam6,Lam5,Lam1,Lam4,Lam3,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam1,Lam4,Lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhsigma1sigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam1*ZH(gt1,1)*ZH(gt2,1))
res = res-(Lam6*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res-(Conjg(Lam6)*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res-(Lam6*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res-(Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res-(Lam3*ZH(gt1,2)*ZH(gt2,2))
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,2))
res = res+(Lam5*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res+(Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhsigma1sigma1L  
 
 
Subroutine CouplingHmsigma1sigma1cHmL(gt1,gt4,Lam6,Lam1,Lam3,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt4
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam1,Lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmsigma1sigma1cHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam1*ZP(gt1,1)*ZP(gt4,1))
res = res-(Conjg(Lam6)*ZP(gt1,2)*ZP(gt4,1))
res = res-(Lam6*ZP(gt1,1)*ZP(gt4,2))
res = res-(Lam3*ZP(gt1,2)*ZP(gt4,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmsigma1sigma1cHmL  
 
 
Subroutine Couplingsigma1sigma1sigma1sigma1L(Lam1,res)

Implicit None 

Complex(dp), Intent(in) :: Lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingsigma1sigma1sigma1sigma1' 
 
res = 0._dp 
res = res-3._dp*(Lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplingsigma1sigma1sigma1sigma1L  
 
 
Subroutine Couplingsigma1sigma1cVWmVWmL(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingsigma1sigma1cVWmVWm' 
 
res = 0._dp 
res = res+g2**2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplingsigma1sigma1cVWmVWmL  
 
 
Subroutine Couplingsigma1sigma1VZVZL(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingsigma1sigma1VZVZ' 
 
res = 0._dp 
res = res+(g2**2*Cos(TW)**2)/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)
res = res+(g1**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplingsigma1sigma1VZVZL  
 
 
Subroutine CouplingAhAhAhL(Lam7,v,res)

Implicit None 

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAh' 
 
res = 0._dp 
res = res+(3*Lam7*v)/2._dp
res = res+(-3*v*Conjg(Lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhL  
 
 
Subroutine CouplingAhAhhhL(gt3,Lam5,Lam7,Lam4,Lam3,Lam2,v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: v,v2,ZH(2,2)

Complex(dp), Intent(in) :: Lam5,Lam7,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam3*v*ZH(gt3,1))
res = res-(Lam4*v*ZH(gt3,1))
res = res+(Lam5*v*ZH(gt3,1))/2._dp
res = res-(Lam7*v2*ZH(gt3,1))/2._dp
res = res+(v*Conjg(Lam5)*ZH(gt3,1))/2._dp
res = res-(v2*Conjg(Lam7)*ZH(gt3,1))/2._dp
res = res-(Lam7*v*ZH(gt3,2))/2._dp
res = res-(Lam2*v2*ZH(gt3,2))
res = res-(v*Conjg(Lam7)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhL  
 
 
Subroutine CouplingcFdFdAhL(gt1,gt2,epYD,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epYD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epYD(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epYD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdAhL  
 
 
Subroutine CouplingcFeFeAhL(gt1,gt2,epYE,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epYE(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*epYE(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epYE(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeAhL  
 
 
Subroutine CouplingcFuFuAhL(gt1,gt2,epYU,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epYU(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epYU(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epYU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuAhL  
 
 
Subroutine CouplingcgWmgWmAhL(g2,v2,res)

Implicit None 

Real(dp), Intent(in) :: g2,v2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgWmAh' 
 
res = 0._dp 
res = res-(g2**2*v2*RXiWm)/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgWmAhL  
 
 
Subroutine CouplingcgWpCgWpCAhL(g2,v2,res)

Implicit None 

Real(dp), Intent(in) :: g2,v2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgWpCAh' 
 
res = 0._dp 
res = res+(g2**2*v2*RXiWm)/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgWpCAhL  
 
 
Subroutine CouplingAhhhhhL(gt2,gt3,Lam6,Lam5,Lam7,v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,v2,ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhhh' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(3*Lam6*v*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(Lam5*v2*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(v2*Conjg(Lam5)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*v*Conjg(Lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(Lam5*v*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(Lam7*v2*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(v*Conjg(Lam5)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(v2*Conjg(Lam7)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(Lam5*v*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(Lam7*v2*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(v*Conjg(Lam5)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(v2*Conjg(Lam7)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(Lam7*v*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(v*Conjg(Lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhhhL  
 
 
Subroutine CouplingAhhhVZL(gt2,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*Cos(TW)*ZH(gt2,2))/2._dp
res = res+(g1*Sin(TW)*ZH(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhVZL  
 
 
Subroutine CouplingAhHmcHmL(gt2,gt3,Lam6,Lam5,Lam7,Lam4,v,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmcHm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(Lam6*v*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(v*Conjg(Lam6)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(Lam4*v*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(Lam5*v*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(Lam4*v*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(v*Conjg(Lam5)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(Lam7*v*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(v*Conjg(Lam7)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmcHmL  
 
 
Subroutine CouplingAhHmcVWmL(gt2,g2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g2,ZP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmcVWm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*ZP(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmcVWmL  
 
 
Subroutine CouplingAhAhAhAhL(Lam2,res)

Implicit None 

Complex(dp), Intent(in) :: Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhAh' 
 
res = 0._dp 
res = res-3._dp*(Lam2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhAhL  
 
 
Subroutine CouplingAhAhhhhhL(gt3,gt4,Lam5,Lam7,Lam4,Lam3,Lam2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam5,Lam7,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam3*ZH(gt3,1)*ZH(gt4,1))
res = res-(Lam4*ZH(gt3,1)*ZH(gt4,1))
res = res+(Lam5*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(Conjg(Lam5)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res-(Lam7*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Conjg(Lam7)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Lam7*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Conjg(Lam7)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Lam2*ZH(gt3,2)*ZH(gt4,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhhL  
 
 
Subroutine CouplingAhAhHmcHmL(gt3,gt4,Lam7,Lam3,Lam2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Lam7,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHmcHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam3*ZP(gt3,1)*ZP(gt4,1))
res = res-(Conjg(Lam7)*ZP(gt3,2)*ZP(gt4,1))
res = res-(Lam7*ZP(gt3,1)*ZP(gt4,2))
res = res-(Lam2*ZP(gt3,2)*ZP(gt4,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHmcHmL  
 
 
Subroutine CouplingAhAhcVWmVWmL(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhcVWmVWm' 
 
res = 0._dp 
res = res+g2**2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhcVWmVWmL  
 
 
Subroutine CouplingAhAhVZVZL(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVZVZ' 
 
res = 0._dp 
res = res+(g2**2*Cos(TW)**2)/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)
res = res+(g1**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVZVZL  
 
 
Subroutine CouplingcFdFdVGL(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVGL  
 
 
Subroutine CouplingcFuFuVGL(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVGL  
 
 
Subroutine CouplingcgGgGVGL(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgGgGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgGgGVGL  
 
 
Subroutine CouplingVGVGVGL(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVGL  
 
 
Subroutine CouplingVGVGVGVGL(g3,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVGVG' 
 
res1 = 0._dp 
res1 = res1-16*g3**2
res2 = 0._dp 
res3 = 0._dp 
res3 = res3+16*g3**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVGVGL  
 
 
Subroutine CouplingcFdFdVPL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Cos(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(g1*Cos(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVPL  
 
 
Subroutine CouplingcFeFeVPL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+g1*Cos(TW)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVPL  
 
 
Subroutine CouplingcFuFuVPL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Cos(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*g1*Cos(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVPL  
 
 
Subroutine CouplingcgWmgWmVPL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgWmVP' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgWmVPL  
 
 
Subroutine CouplingcgWpCgWpCVPL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgWpCVP' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgWpCVPL  
 
 
Subroutine CouplingHmcHmVPL(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*Cos(TW)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g2*Sin(TW)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g1*Cos(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(g2*Sin(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVPL  
 
 
Subroutine CouplingHmcVWmVPL(gt1,g1,g2,v,v2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,v2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcVWmVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*v*Cos(TW)*ZP(gt1,1))/2._dp
res = res+(g1*g2*v2*Cos(TW)*ZP(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcVWmVPL  
 
 
Subroutine CouplingcVWmVPVWmL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVPVWm' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVPVWmL  
 
 
Subroutine CouplingHmcHmVPVPL(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVPVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1**2*Cos(TW)**2*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*ZP(gt1,1)*ZP(gt2,1)
res = res+(g2**2*Sin(TW)**2*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res+(g1**2*Cos(TW)**2*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*ZP(gt1,2)*ZP(gt2,2)
res = res+(g2**2*Sin(TW)**2*ZP(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVPVPL  
 
 
Subroutine CouplingcVWmVPVPVWmL(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVPVPVWm' 
 
res1 = 0._dp 
res1 = res1+g2**2*Sin(TW)**2
res2 = 0._dp 
res2 = res2+g2**2*Sin(TW)**2
res3 = 0._dp 
res3 = res3-2*g2**2*Sin(TW)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVPVPVWmL  
 
 
Subroutine CouplingcFdFdVZL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-(g1*Sin(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVZL  
 
 
Subroutine CouplingcFeFeVZL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-(g1*Sin(TW))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVZL  
 
 
Subroutine CouplingcFuFuVZL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(2*g1*Sin(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVZL  
 
 
Subroutine CouplingcFvFvVZL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFvFvVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFvFvVZL  
 
 
Subroutine CouplingcgWmgWmVZL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgWmVZ' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgWmVZL  
 
 
Subroutine CouplingcgWpCgWpCVZL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgWpCVZ' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgWpCVZL  
 
 
Subroutine CouplinghhVZVZL(gt1,g1,g2,v,v2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,v2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*v*Cos(TW)**2*ZH(gt1,1))/2._dp
res = res+g1*g2*v*Cos(TW)*Sin(TW)*ZH(gt1,1)
res = res+(g1**2*v*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res+(g2**2*v2*Cos(TW)**2*ZH(gt1,2))/2._dp
res = res+g1*g2*v2*Cos(TW)*Sin(TW)*ZH(gt1,2)
res = res+(g1**2*v2*Sin(TW)**2*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVZVZL  
 
 
Subroutine CouplingHmcHmVZL(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*Cos(TW)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res+(g1*Sin(TW)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g2*Cos(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(g1*Sin(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVZL  
 
 
Subroutine CouplingHmcVWmVZL(gt1,g1,g2,v,v2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,v2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*v*Sin(TW)*ZP(gt1,1))/2._dp
res = res-(g1*g2*v2*Sin(TW)*ZP(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcVWmVZL  
 
 
Subroutine CouplingcVWmVWmVZL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVWmVZ' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVWmVZL  
 
 
Subroutine CouplinghhhhVZVZL(gt1,gt2,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*Cos(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,1)*ZH(gt2,1)
res = res+(g1**2*Sin(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g2**2*Cos(TW)**2*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,2)*ZH(gt2,2)
res = res+(g1**2*Sin(TW)**2*ZH(gt1,2)*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZVZL  
 
 
Subroutine CouplingHmcHmVZVZL(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*Cos(TW)**2*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g1*g2*Cos(TW)*Sin(TW)*ZP(gt1,1)*ZP(gt2,1))
res = res+(g1**2*Sin(TW)**2*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res+(g2**2*Cos(TW)**2*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(g1*g2*Cos(TW)*Sin(TW)*ZP(gt1,2)*ZP(gt2,2))
res = res+(g1**2*Sin(TW)**2*ZP(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVZVZL  
 
 
Subroutine CouplingcVWmVWmVZVZL(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVWmVZVZ' 
 
res1 = 0._dp 
res1 = res1-2*g2**2*Cos(TW)**2
res2 = 0._dp 
res2 = res2+g2**2*Cos(TW)**2
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVWmVZVZL  
 
 
Subroutine CouplingcFuFdcVWmL(gt1,gt2,g2,ZDL,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZDL(gt2,j1))*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdcVWmL  
 
 
Subroutine CouplingcFvFecVWmL(gt1,gt2,g2,ZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFvFecVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(ZEL(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFvFecVWmL  
 
 
Subroutine CouplingcgWpCgAcVWmL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgAcVWm' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgAcVWmL  
 
 
Subroutine CouplingcgAgWmcVWmL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgAgWmcVWm' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgAgWmcVWmL  
 
 
Subroutine CouplingcgZgWmcVWmL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWmcVWm' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWmcVWmL  
 
 
Subroutine CouplingcgWpCgZcVWmL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgZcVWm' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgZcVWmL  
 
 
Subroutine CouplinghhHmcVWmL(gt1,gt2,g2,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2),ZP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*ZH(gt1,1)*ZP(gt2,1))/2._dp
res = res+(g2*ZH(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmcVWmL  
 
 
Subroutine CouplinghhcVWmVWmL(gt1,g2,v,v2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,v,v2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*v*ZH(gt1,1))/2._dp
res = res+(g2**2*v2*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcVWmVWmL  
 
 
Subroutine CouplinghhhhcVWmVWmL(gt1,gt2,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g2**2*ZH(gt1,2)*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhcVWmVWmL  
 
 
Subroutine CouplingHmcHmcVWmVWmL(gt1,gt2,g2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res+(g2**2*ZP(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmcVWmVWmL  
 
 
Subroutine CouplingcVWmcVWmVWmVWmL(g2,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmcVWmVWmVWm' 
 
res1 = 0._dp 
res1 = res1+2*g2**2
res2 = 0._dp 
res2 = res2-g2**2
res3 = 0._dp 
res3 = res3-g2**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmcVWmVWmVWmL  
 
 
Subroutine CouplingcHmVWmVZL(gt1,g1,g2,v,v2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,v2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHmVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*v*Sin(TW)*ZP(gt1,1))/2._dp
res = res-(g1*g2*v2*Sin(TW)*ZP(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHmVWmVZL  
 
 
Subroutine CouplingcHmVPVWmL(gt1,g1,g2,v,v2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,v2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHmVPVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*v*Cos(TW)*ZP(gt1,1))/2._dp
res = res+(g1*g2*v2*Cos(TW)*ZP(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHmVPVWmL  
 
 
Subroutine CouplingHmcHmVPVZL(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVPVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Cos(2._dp*(TW))*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g1**2*Sin(2._dp*(TW))*ZP(gt1,1)*ZP(gt2,1))/4._dp
res = res+(g2**2*Sin(2._dp*(TW))*ZP(gt1,1)*ZP(gt2,1))/4._dp
res = res+(g1*g2*Cos(2._dp*(TW))*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(g1**2*Sin(2._dp*(TW))*ZP(gt1,2)*ZP(gt2,2))/4._dp
res = res+(g2**2*Sin(2._dp*(TW))*ZP(gt1,2)*ZP(gt2,2))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVPVZL  
 
 
Subroutine CouplingcVWmVPVWmVZL(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVPVWmVZ' 
 
res1 = 0._dp 
res1 = res1+(g2**2*Sin(2._dp*(TW)))/2._dp
res2 = 0._dp 
res2 = res2-(g2**2*Sin(2._dp*(TW)))
res3 = 0._dp 
res3 = res3+(g2**2*Sin(2._dp*(TW)))/2._dp
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVPVWmVZL  
 
 
Subroutine CouplingsForVectorBosons(g1,g2,ZH,TW,ZP,v,v2,ZDL,ZUL,ZEL,cplhhsigma1VZ,    & 
& cplHmsigma1cVWm,cplsigma1sigma1cVWmVWm,cplsigma1sigma1VZVZ,cplAhhhVZ,cplAhHmcVWm,      & 
& cplAhAhcVWmVWm,cplAhAhVZVZ,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,            & 
& cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,cplHmcHmVP,cplHmcVWmVP,            & 
& cplcVWmVPVWm,cplHmcHmVPVP,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,cplHmcHmVZ,              & 
& cplHmcVWmVZ,cplcVWmVWmVZ,cplhhhhVZVZ,cplHmcHmVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,     & 
& cplcVWmVWmVZVZ3,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFvFecVWmL,cplcFvFecVWmR,               & 
& cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgZcVWm,cplhhHmcVWm,cplhhcVWmVWm,    & 
& cplhhhhcVWmVWm,cplHmcHmcVWmVWm,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,& 
& cplcHmVWmVZ,cplcHmVPVWm,cplHmcHmVPVZ,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3)

Implicit None 
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW,ZP(2,2),v,v2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3),ZEL(3,3)

Complex(dp), Intent(out) :: cplhhsigma1VZ(2),cplHmsigma1cVWm(2),cplsigma1sigma1cVWmVWm,cplsigma1sigma1VZVZ,       & 
& cplAhhhVZ(2),cplAhHmcVWm(2),cplAhAhcVWmVWm,cplAhAhVZVZ,cplcFdFdVPL(3,3),               & 
& cplcFdFdVPR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),  & 
& cplcgWmgWmVP,cplcgWpCgWpCVP,cplHmcHmVP(2,2),cplHmcVWmVP(2),cplcVWmVPVWm,               & 
& cplHmcHmVPVP(2,2),cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplcFdFdVZL(3,3),    & 
& cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),  & 
& cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ(2),            & 
& cplHmcHmVZ(2,2),cplHmcVWmVZ(2),cplcVWmVWmVZ,cplhhhhVZVZ(2,2),cplHmcHmVZVZ(2,2),        & 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3), & 
& cplcFvFecVWmL(3,3),cplcFvFecVWmR(3,3),cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,      & 
& cplcgWpCgZcVWm,cplhhHmcVWm(2,2),cplhhcVWmVWm(2),cplhhhhcVWmVWm(2,2),cplHmcHmcVWmVWm(2,2),& 
& cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcHmVWmVZ(2),               & 
& cplcHmVPVWm(2),cplHmcHmVPVZ(2,2),cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForVectorBosons'
 
cplhhsigma1VZ = 0._dp 
Do gt1 = 1, 2
Call Couplinghhsigma1VZL(gt1,g1,g2,ZH,TW,cplhhsigma1VZ(gt1))

End Do 


cplHmsigma1cVWm = 0._dp 
Do gt1 = 1, 2
Call CouplingHmsigma1cVWmL(gt1,g2,ZP,cplHmsigma1cVWm(gt1))

End Do 


cplsigma1sigma1cVWmVWm = 0._dp 
Call Couplingsigma1sigma1cVWmVWmL(g2,cplsigma1sigma1cVWmVWm)



cplsigma1sigma1VZVZ = 0._dp 
Call Couplingsigma1sigma1VZVZL(g1,g2,TW,cplsigma1sigma1VZVZ)



cplAhhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingAhhhVZL(gt2,g1,g2,ZH,TW,cplAhhhVZ(gt2))

End Do 


cplAhHmcVWm = 0._dp 
Do gt2 = 1, 2
Call CouplingAhHmcVWmL(gt2,g2,ZP,cplAhHmcVWm(gt2))

End Do 


cplAhAhcVWmVWm = 0._dp 
Call CouplingAhAhcVWmVWmL(g2,cplAhAhcVWmVWm)



cplAhAhVZVZ = 0._dp 
Call CouplingAhAhVZVZL(g1,g2,TW,cplAhAhVZVZ)



cplcFdFdVPL = 0._dp 
cplcFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVPL(gt1,gt2,g1,g2,TW,cplcFdFdVPL(gt1,gt2),cplcFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVPL = 0._dp 
cplcFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVPL(gt1,gt2,g1,g2,TW,cplcFeFeVPL(gt1,gt2),cplcFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVPL = 0._dp 
cplcFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVPL(gt1,gt2,g1,g2,TW,cplcFuFuVPL(gt1,gt2),cplcFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcgWmgWmVP = 0._dp 
Call CouplingcgWmgWmVPL(g2,TW,cplcgWmgWmVP)



cplcgWpCgWpCVP = 0._dp 
Call CouplingcgWpCgWpCVPL(g2,TW,cplcgWpCgWpCVP)



cplHmcHmVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHmcHmVPL(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVP(gt1,gt2))

 End Do 
End Do 


cplHmcVWmVP = 0._dp 
Do gt1 = 1, 2
Call CouplingHmcVWmVPL(gt1,g1,g2,v,v2,ZP,TW,cplHmcVWmVP(gt1))

End Do 


cplcVWmVPVWm = 0._dp 
Call CouplingcVWmVPVWmL(g2,TW,cplcVWmVPVWm)



cplHmcHmVPVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHmcHmVPVPL(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVPVP(gt1,gt2))

 End Do 
End Do 


cplcVWmVPVPVWm1 = 0._dp 
cplcVWmVPVPVWm2 = 0._dp 
cplcVWmVPVPVWm3 = 0._dp 
Call CouplingcVWmVPVPVWmL(g2,TW,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3)



cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZL(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZL(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZL(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZL = 0._dp 
cplcFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZL(gt1,gt2,g1,g2,TW,cplcFvFvVZL(gt1,gt2),cplcFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcgWmgWmVZ = 0._dp 
Call CouplingcgWmgWmVZL(g2,TW,cplcgWmgWmVZ)



cplcgWpCgWpCVZ = 0._dp 
Call CouplingcgWpCgWpCVZL(g2,TW,cplcgWpCgWpCVZ)



cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZL(gt1,g1,g2,v,v2,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplHmcHmVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHmcHmVZL(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVZ(gt1,gt2))

 End Do 
End Do 


cplHmcVWmVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingHmcVWmVZL(gt1,g1,g2,v,v2,ZP,TW,cplHmcVWmVZ(gt1))

End Do 


cplcVWmVWmVZ = 0._dp 
Call CouplingcVWmVWmVZL(g2,TW,cplcVWmVWmVZ)



cplhhhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZVZL(gt1,gt2,g1,g2,ZH,TW,cplhhhhVZVZ(gt1,gt2))

 End Do 
End Do 


cplHmcHmVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHmcHmVZVZL(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVZVZ(gt1,gt2))

 End Do 
End Do 


cplcVWmVWmVZVZ1 = 0._dp 
cplcVWmVWmVZVZ2 = 0._dp 
cplcVWmVWmVZVZ3 = 0._dp 
Call CouplingcVWmVWmVZVZL(g2,TW,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3)



cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmL(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplcFvFecVWmL = 0._dp 
cplcFvFecVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFecVWmL(gt1,gt2,g2,ZEL,cplcFvFecVWmL(gt1,gt2),cplcFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcgWpCgAcVWm = 0._dp 
Call CouplingcgWpCgAcVWmL(g2,TW,cplcgWpCgAcVWm)



cplcgAgWmcVWm = 0._dp 
Call CouplingcgAgWmcVWmL(g2,TW,cplcgAgWmcVWm)



cplcgZgWmcVWm = 0._dp 
Call CouplingcgZgWmcVWmL(g2,TW,cplcgZgWmcVWm)



cplcgWpCgZcVWm = 0._dp 
Call CouplingcgWpCgZcVWmL(g2,TW,cplcgWpCgZcVWm)



cplhhHmcVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhHmcVWmL(gt1,gt2,g2,ZH,ZP,cplhhHmcVWm(gt1,gt2))

 End Do 
End Do 


cplhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWmVWmL(gt1,g2,v,v2,ZH,cplhhcVWmVWm(gt1))

End Do 


cplhhhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhcVWmVWmL(gt1,gt2,g2,ZH,cplhhhhcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplHmcHmcVWmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHmcHmcVWmVWmL(gt1,gt2,g2,ZP,cplHmcHmcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplcVWmcVWmVWmVWm1 = 0._dp 
cplcVWmcVWmVWmVWm2 = 0._dp 
cplcVWmcVWmVWmVWm3 = 0._dp 
Call CouplingcVWmcVWmVWmVWmL(g2,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3)



cplcHmVWmVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingcHmVWmVZL(gt1,g1,g2,v,v2,ZP,TW,cplcHmVWmVZ(gt1))

End Do 


cplcHmVPVWm = 0._dp 
Do gt1 = 1, 2
Call CouplingcHmVPVWmL(gt1,g1,g2,v,v2,ZP,TW,cplcHmVPVWm(gt1))

End Do 


cplHmcHmVPVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHmcHmVPVZL(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVPVZ(gt1,gt2))

 End Do 
End Do 


cplcVWmVPVWmVZ1 = 0._dp 
cplcVWmVPVWmVZ2 = 0._dp 
cplcVWmVPVWmVZ3 = 0._dp 
Call CouplingcVWmVPVWmVZL(g2,TW,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3)



Iname = Iname - 1 
End Subroutine CouplingsForVectorBosons

Subroutine CouplingsForSMfermions(epYD,ZDL,ZDR,Yd,ZH,g3,g1,g2,TW,Yu,epYU,             & 
& ZP,ZUL,ZUR,epYE,ZEL,ZER,Ye,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,        & 
& cplcUFdFdsigma1L,cplcUFdFdsigma1R,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,              & 
& cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFuHmL,cplcUFdFuHmR,cplcUFdFuVWmL,        & 
& cplcUFdFuVWmR,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdcHmL,cplcUFuFdcHmR,cplcUFuFdcVWmL,    & 
& cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFusigma1L,cplcUFuFusigma1R,            & 
& cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,         & 
& cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFesigma1L,cplcUFeFesigma1R, & 
& cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFvHmL,cplcUFeFvHmR,         & 
& cplcUFeFvVWmL,cplcUFeFvVWmR)

Implicit None 
Real(dp), Intent(in) :: ZH(2,2),g3,g1,g2,TW,ZP(2,2)

Complex(dp), Intent(in) :: epYD(3,3),ZDL(3,3),ZDR(3,3),Yd(3,3),Yu(3,3),epYU(3,3),ZUL(3,3),ZUR(3,3),              & 
& epYE(3,3),ZEL(3,3),ZER(3,3),Ye(3,3)

Complex(dp), Intent(out) :: cplcUFdFdAhL(3,3),cplcUFdFdAhR(3,3),cplcUFdFdhhL(3,3,2),cplcUFdFdhhR(3,3,2),          & 
& cplcUFdFdsigma1L(3,3),cplcUFdFdsigma1R(3,3),cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),       & 
& cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),               & 
& cplcUFdFuHmL(3,3,2),cplcUFdFuHmR(3,3,2),cplcUFdFuVWmL(3,3),cplcUFdFuVWmR(3,3),         & 
& cplcUFuFuAhL(3,3),cplcUFuFuAhR(3,3),cplcUFuFdcHmL(3,3,2),cplcUFuFdcHmR(3,3,2),         & 
& cplcUFuFdcVWmL(3,3),cplcUFuFdcVWmR(3,3),cplcUFuFuhhL(3,3,2),cplcUFuFuhhR(3,3,2),       & 
& cplcUFuFusigma1L(3,3),cplcUFuFusigma1R(3,3),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),       & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFeFeAhL(3,3),cplcUFeFeAhR(3,3),cplcUFeFehhL(3,3,2),cplcUFeFehhR(3,3,2),           & 
& cplcUFeFesigma1L(3,3),cplcUFeFesigma1R(3,3),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),       & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFvHmL(3,3,2),cplcUFeFvHmR(3,3,2),           & 
& cplcUFeFvVWmL(3,3),cplcUFeFvVWmR(3,3)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForSMfermions'
 
cplcUFdFdAhL = 0._dp 
cplcUFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdAhL(gt1,gt2,epYD,ZDL,ZDR,cplcUFdFdAhL(gt1,gt2),cplcUFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdhhL = 0._dp 
cplcUFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFdFdhhL(gt1,gt2,gt3,Yd,epYD,ZH,ZDL,ZDR,cplcUFdFdhhL(gt1,gt2,gt3)       & 
& ,cplcUFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFdFdsigma1L = 0._dp 
cplcUFdFdsigma1R = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdsigma1L(gt1,gt2,Yd,ZDL,ZDR,cplcUFdFdsigma1L(gt1,gt2)               & 
& ,cplcUFdFdsigma1R(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVGL = 0._dp 
cplcUFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVGL(gt1,gt2,g3,ZDL,ZDR,cplcUFdFdVGL(gt1,gt2),cplcUFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVPL = 0._dp 
cplcUFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVPL(gt1,gt2,g1,g2,ZDL,ZDR,TW,cplcUFdFdVPL(gt1,gt2),cplcUFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVZL = 0._dp 
cplcUFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVZL(gt1,gt2,g1,g2,ZDL,ZDR,TW,cplcUFdFdVZL(gt1,gt2),cplcUFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcUFdFuHmL = 0._dp 
cplcUFdFuHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFdFuHmL(gt1,gt2,gt3,Yu,epYU,Yd,epYD,ZP,ZUL,ZUR,cplcUFdFuHmL(gt1,gt2,gt3)& 
& ,cplcUFdFuHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFdFuVWmL = 0._dp 
cplcUFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFuVWmL(gt1,gt2,g2,ZUL,cplcUFdFuVWmL(gt1,gt2),cplcUFdFuVWmR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuAhL = 0._dp 
cplcUFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuAhL(gt1,gt2,epYU,ZUL,ZUR,cplcUFuFuAhL(gt1,gt2),cplcUFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcUFuFdcHmL = 0._dp 
cplcUFuFdcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFuFdcHmL(gt1,gt2,gt3,Yu,epYU,Yd,epYD,ZP,ZDL,ZDR,cplcUFuFdcHmL(gt1,gt2,gt3)& 
& ,cplcUFuFdcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFuFdcVWmL = 0._dp 
cplcUFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFdcVWmL(gt1,gt2,g2,ZDL,cplcUFuFdcVWmL(gt1,gt2),cplcUFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuhhL = 0._dp 
cplcUFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFuFuhhL(gt1,gt2,gt3,Yu,epYU,ZH,ZUL,ZUR,cplcUFuFuhhL(gt1,gt2,gt3)       & 
& ,cplcUFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFuFusigma1L = 0._dp 
cplcUFuFusigma1R = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFusigma1L(gt1,gt2,Yu,ZUL,ZUR,cplcUFuFusigma1L(gt1,gt2)               & 
& ,cplcUFuFusigma1R(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVGL = 0._dp 
cplcUFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVGL(gt1,gt2,g3,ZUL,ZUR,cplcUFuFuVGL(gt1,gt2),cplcUFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVPL = 0._dp 
cplcUFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVPL(gt1,gt2,g1,g2,ZUL,ZUR,TW,cplcUFuFuVPL(gt1,gt2),cplcUFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVZL = 0._dp 
cplcUFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVZL(gt1,gt2,g1,g2,ZUL,ZUR,TW,cplcUFuFuVZL(gt1,gt2),cplcUFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeAhL = 0._dp 
cplcUFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeAhL(gt1,gt2,epYE,ZEL,ZER,cplcUFeFeAhL(gt1,gt2),cplcUFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcUFeFehhL = 0._dp 
cplcUFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFeFehhL(gt1,gt2,gt3,Ye,epYE,ZH,ZEL,ZER,cplcUFeFehhL(gt1,gt2,gt3)       & 
& ,cplcUFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFeFesigma1L = 0._dp 
cplcUFeFesigma1R = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFesigma1L(gt1,gt2,Ye,ZEL,ZER,cplcUFeFesigma1L(gt1,gt2)               & 
& ,cplcUFeFesigma1R(gt1,gt2))

 End Do 
End Do 


cplcUFeFeVPL = 0._dp 
cplcUFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeVPL(gt1,gt2,g1,g2,ZEL,ZER,TW,cplcUFeFeVPL(gt1,gt2),cplcUFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeVZL = 0._dp 
cplcUFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeVZL(gt1,gt2,g1,g2,ZEL,ZER,TW,cplcUFeFeVZL(gt1,gt2),cplcUFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcUFeFvHmL = 0._dp 
cplcUFeFvHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFeFvHmL(gt1,gt2,gt3,Ye,epYE,ZP,cplcUFeFvHmL(gt1,gt2,gt3)               & 
& ,cplcUFeFvHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFeFvVWmL = 0._dp 
cplcUFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFvVWmL(gt1,gt2,g2,cplcUFeFvVWmL(gt1,gt2),cplcUFeFvVWmR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsForSMfermions

Subroutine CouplingsForTadpoles(Lam5,Lam7,Lam4,Lam3,Lam2,v,v2,Lam6,ZH,g1,             & 
& g2,TW,Yd,epYD,ZDL,ZDR,Ye,epYE,ZEL,ZER,Yu,epYU,ZUL,ZUR,Lam1,ZP,cplAhAhUhh,              & 
& cplAhUhhhh,cplAhUhhsigma1,cplAhUhhVZ,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,           & 
& cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplcgWmgWmUhh,cplcgWpCgWpCUhh,cplcgZgZUhh,      & 
& cplUhhhhhh,cplUhhhhsigma1,cplUhhHmcHm,cplUhhHmcVWm,cplUhhsigma1sigma1,cplUhhsigma1VZ,  & 
& cplUhhcVWmVWm,cplUhhVZVZ,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHmcHm,cplUhhUhhsigma1sigma1,& 
& cplUhhUhhcVWmVWm,cplUhhUhhVZVZ)

Implicit None 
Real(dp), Intent(in) :: v,v2,ZH(2,2),g1,g2,TW,ZP(2,2)

Complex(dp), Intent(in) :: Lam5,Lam7,Lam4,Lam3,Lam2,Lam6,Yd(3,3),epYD(3,3),ZDL(3,3),ZDR(3,3),Ye(3,3),            & 
& epYE(3,3),ZEL(3,3),ZER(3,3),Yu(3,3),epYU(3,3),ZUL(3,3),ZUR(3,3),Lam1

Complex(dp), Intent(out) :: cplAhAhUhh(2),cplAhUhhhh(2,2),cplAhUhhsigma1(2),cplAhUhhVZ(2),cplcFdFdUhhL(3,3,2),    & 
& cplcFdFdUhhR(3,3,2),cplcFeFeUhhL(3,3,2),cplcFeFeUhhR(3,3,2),cplcFuFuUhhL(3,3,2),       & 
& cplcFuFuUhhR(3,3,2),cplcgWmgWmUhh(2),cplcgWpCgWpCUhh(2),cplcgZgZUhh(2),cplUhhhhhh(2,2,2),& 
& cplUhhhhsigma1(2,2),cplUhhHmcHm(2,2,2),cplUhhHmcVWm(2,2),cplUhhsigma1sigma1(2),        & 
& cplUhhsigma1VZ(2),cplUhhcVWmVWm(2),cplUhhVZVZ(2),cplAhAhUhhUhh(2,2),cplUhhUhhhhhh(2,2,2,2),& 
& cplUhhUhhHmcHm(2,2,2,2),cplUhhUhhsigma1sigma1(2,2),cplUhhUhhcVWmVWm(2,2),              & 
& cplUhhUhhVZVZ(2,2)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForTadpoles'
 
cplAhAhUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhAhUhhL(gt3,Lam5,Lam7,Lam4,Lam3,Lam2,v,v2,cplAhAhUhh(gt3))

End Do 


cplAhUhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhUhhhhL(gt2,gt3,Lam6,Lam5,Lam7,v,v2,ZH,cplAhUhhhh(gt2,gt3))

 End Do 
End Do 


cplAhUhhsigma1 = 0._dp 
Do gt2 = 1, 2
Call CouplingAhUhhsigma1L(gt2,Lam6,Lam5,Lam7,v,v2,cplAhUhhsigma1(gt2))

End Do 


cplAhUhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingAhUhhVZL(gt2,g1,g2,TW,cplAhUhhVZ(gt2))

End Do 


cplcFdFdUhhL = 0._dp 
cplcFdFdUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdUhhL(gt1,gt2,gt3,Yd,epYD,ZDL,ZDR,cplcFdFdUhhL(gt1,gt2,gt3)          & 
& ,cplcFdFdUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeUhhL = 0._dp 
cplcFeFeUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFeUhhL(gt1,gt2,gt3,Ye,epYE,ZEL,ZER,cplcFeFeUhhL(gt1,gt2,gt3)          & 
& ,cplcFeFeUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuUhhL = 0._dp 
cplcFuFuUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuUhhL(gt1,gt2,gt3,Yu,epYU,ZUL,ZUR,cplcFuFuUhhL(gt1,gt2,gt3)          & 
& ,cplcFuFuUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcgWmgWmUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWmgWmUhhL(gt3,g2,v,v2,cplcgWmgWmUhh(gt3))

End Do 


cplcgWpCgWpCUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWpCgWpCUhhL(gt3,g2,v,v2,cplcgWpCgWpCUhh(gt3))

End Do 


cplcgZgZUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgZUhhL(gt3,g1,g2,v,v2,TW,cplcgZgZUhh(gt3))

End Do 


cplUhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingUhhhhhhL(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,v,               & 
& v2,ZH,cplUhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplUhhhhsigma1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhhhsigma1L(gt1,gt2,Lam6,Lam5,Lam7,v,v2,ZH,cplUhhhhsigma1(gt1,gt2))

 End Do 
End Do 


cplUhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingUhhHmcHmL(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,v,              & 
& v2,ZP,cplUhhHmcHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplUhhHmcVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhHmcVWmL(gt1,gt2,g2,ZP,cplUhhHmcVWm(gt1,gt2))

 End Do 
End Do 


cplUhhsigma1sigma1 = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhsigma1sigma1L(gt1,Lam6,Lam5,Lam1,Lam4,Lam3,v,v2,cplUhhsigma1sigma1(gt1))

End Do 


cplUhhsigma1VZ = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhsigma1VZL(gt1,g1,g2,TW,cplUhhsigma1VZ(gt1))

End Do 


cplUhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhcVWmVWmL(gt1,g2,v,v2,cplUhhcVWmVWm(gt1))

End Do 


cplUhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhVZVZL(gt1,g1,g2,v,v2,TW,cplUhhVZVZ(gt1))

End Do 


cplAhAhUhhUhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhUhhUhhL(gt3,gt4,Lam5,Lam7,Lam4,Lam3,Lam2,cplAhAhUhhUhh(gt3,gt4))

 End Do 
End Do 


cplUhhUhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingUhhUhhhhhhL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,               & 
& Lam2,ZH,cplUhhUhhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUhhUhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingUhhUhhHmcHmL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,              & 
& Lam2,ZP,cplUhhUhhHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUhhUhhsigma1sigma1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhsigma1sigma1L(gt1,gt2,Lam6,Lam5,Lam1,Lam4,Lam3,cplUhhUhhsigma1sigma1(gt1,gt2))

 End Do 
End Do 


cplUhhUhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhcVWmVWmL(gt1,gt2,g2,cplUhhUhhcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplUhhUhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhVZVZL(gt1,gt2,g1,g2,TW,cplUhhUhhVZVZ(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsForTadpoles

Subroutine CouplingsColoredQuartics(Lam2,Lam7,ZH,Lam5,Lam4,Lam3,ZP,Lam6,              & 
& Lam1,g2,g1,TW,g3,cplAhAhAhAh1,cplAhAhAhhh1,cplAhAhAhsigma11,cplAhAhhhhh1,              & 
& cplAhAhhhsigma11,cplAhAhHmcHm1,cplAhAhsigma1sigma11,cplAhhhhhhh1,cplAhhhhhsigma11,     & 
& cplAhhhHmcHm1,cplAhhhsigma1sigma11,cplAhHmsigma1cHm1,cplAhsigma1sigma1sigma11,         & 
& cplhhhhhhhh1,cplhhhhhhsigma11,cplhhhhHmcHm1,cplhhhhsigma1sigma11,cplhhHmsigma1cHm1,    & 
& cplhhsigma1sigma1sigma11,cplHmHmcHmcHm1,cplHmsigma1sigma1cHm1,cplsigma1sigma1sigma1sigma11,& 
& cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhHmcVWmVP1,cplAhHmcVWmVZ1,cplAhcHmVPVWm1,             & 
& cplAhcHmVWmVZ1,cplhhhhcVWmVWm1,cplhhhhVZVZ1,cplhhHmcVWmVP1,cplhhHmcVWmVZ1,             & 
& cplhhcHmVPVWm1,cplhhcHmVWmVZ1,cplHmsigma1cVWmVP1,cplHmsigma1cVWmVZ1,cplHmcHmVPVP1,     & 
& cplHmcHmVPVZ1,cplHmcHmcVWmVWm1,cplHmcHmVZVZ1,cplsigma1sigma1cVWmVWm1,cplsigma1sigma1VZVZ1,& 
& cplsigma1cHmVPVWm1,cplsigma1cHmVWmVZ1,cplVGVGVGVG1Q,cplVGVGVGVG2Q,cplVGVGVGVG3Q,       & 
& cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q,cplcVWmVPVPVWm3Q,cplcVWmVPVWmVZ1Q,cplcVWmVPVWmVZ2Q,  & 
& cplcVWmVPVWmVZ3Q,cplcVWmcVWmVWmVWm1Q,cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,          & 
& cplcVWmVWmVZVZ1Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q)

Implicit None 
Real(dp), Intent(in) :: ZH(2,2),ZP(2,2),g2,g1,TW,g3

Complex(dp), Intent(in) :: Lam2,Lam7,Lam5,Lam4,Lam3,Lam6,Lam1

Complex(dp), Intent(out) :: cplAhAhAhAh1,cplAhAhAhhh1(2),cplAhAhAhsigma11,cplAhAhhhhh1(2,2),cplAhAhhhsigma11(2),  & 
& cplAhAhHmcHm1(2,2),cplAhAhsigma1sigma11,cplAhhhhhhh1(2,2,2),cplAhhhhhsigma11(2,2),     & 
& cplAhhhHmcHm1(2,2,2),cplAhhhsigma1sigma11(2),cplAhHmsigma1cHm1(2,2),cplAhsigma1sigma1sigma11,& 
& cplhhhhhhhh1(2,2,2,2),cplhhhhhhsigma11(2,2,2),cplhhhhHmcHm1(2,2,2,2),cplhhhhsigma1sigma11(2,2),& 
& cplhhHmsigma1cHm1(2,2,2),cplhhsigma1sigma1sigma11(2),cplHmHmcHmcHm1(2,2,2,2),          & 
& cplHmsigma1sigma1cHm1(2,2),cplsigma1sigma1sigma1sigma11,cplAhAhcVWmVWm1,               & 
& cplAhAhVZVZ1,cplAhHmcVWmVP1(2),cplAhHmcVWmVZ1(2),cplAhcHmVPVWm1(2),cplAhcHmVWmVZ1(2),  & 
& cplhhhhcVWmVWm1(2,2),cplhhhhVZVZ1(2,2),cplhhHmcVWmVP1(2,2),cplhhHmcVWmVZ1(2,2),        & 
& cplhhcHmVPVWm1(2,2),cplhhcHmVWmVZ1(2,2),cplHmsigma1cVWmVP1(2),cplHmsigma1cVWmVZ1(2),   & 
& cplHmcHmVPVP1(2,2),cplHmcHmVPVZ1(2,2),cplHmcHmcVWmVWm1(2,2),cplHmcHmVZVZ1(2,2),        & 
& cplsigma1sigma1cVWmVWm1,cplsigma1sigma1VZVZ1,cplsigma1cHmVPVWm1(2),cplsigma1cHmVWmVZ1(2),& 
& cplVGVGVGVG1Q,cplVGVGVGVG2Q,cplVGVGVGVG3Q,cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q,           & 
& cplcVWmVPVPVWm3Q,cplcVWmVPVWmVZ1Q,cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ3Q,cplcVWmcVWmVWmVWm1Q,& 
& cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,cplcVWmVWmVZVZ1Q,cplcVWmVWmVZVZ2Q,             & 
& cplcVWmVWmVZVZ3Q

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsColoredQuartics'
 
cplAhAhAhAh1 = 0._dp 
Call CouplingAhAhAhAhQ(Lam2,cplAhAhAhAh1)



cplAhAhAhhh1 = 0._dp 
Do gt4 = 1, 2
Call CouplingAhAhAhhhQ(gt4,Lam7,ZH,cplAhAhAhhh1(gt4))

End Do 


cplAhAhAhsigma11 = 0._dp 
Call CouplingAhAhAhsigma1Q(Lam7,cplAhAhAhsigma11)



cplAhAhhhhh1 = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhhhhhQ(gt3,gt4,Lam5,Lam7,Lam4,Lam3,Lam2,ZH,cplAhAhhhhh1(gt3,gt4))

 End Do 
End Do 


cplAhAhhhsigma11 = 0._dp 
Do gt3 = 1, 2
Call CouplingAhAhhhsigma1Q(gt3,Lam5,Lam7,ZH,cplAhAhhhsigma11(gt3))

End Do 


cplAhAhHmcHm1 = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhHmcHmQ(gt3,gt4,Lam7,Lam3,Lam2,ZP,cplAhAhHmcHm1(gt3,gt4))

 End Do 
End Do 


cplAhAhsigma1sigma11 = 0._dp 
Call CouplingAhAhsigma1sigma1Q(Lam5,Lam4,Lam3,cplAhAhsigma1sigma11)



cplAhhhhhhh1 = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
  Do gt4 = 1, 2
Call CouplingAhhhhhhhQ(gt2,gt3,gt4,Lam6,Lam5,Lam7,ZH,cplAhhhhhhh1(gt2,gt3,gt4))

  End Do 
 End Do 
End Do 


cplAhhhhhsigma11 = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhhhhhsigma1Q(gt2,gt3,Lam6,Lam5,Lam7,ZH,cplAhhhhhsigma11(gt2,gt3))

 End Do 
End Do 


cplAhhhHmcHm1 = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
  Do gt4 = 1, 2
Call CouplingAhhhHmcHmQ(gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam4,ZH,ZP,cplAhhhHmcHm1(gt2,gt3,gt4))

  End Do 
 End Do 
End Do 


cplAhhhsigma1sigma11 = 0._dp 
Do gt2 = 1, 2
Call CouplingAhhhsigma1sigma1Q(gt2,Lam6,Lam5,ZH,cplAhhhsigma1sigma11(gt2))

End Do 


cplAhHmsigma1cHm1 = 0._dp 
Do gt2 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhHmsigma1cHmQ(gt2,gt4,Lam6,Lam5,Lam7,Lam4,ZP,cplAhHmsigma1cHm1(gt2,gt4))

 End Do 
End Do 


cplAhsigma1sigma1sigma11 = 0._dp 
Call CouplingAhsigma1sigma1sigma1Q(Lam6,cplAhsigma1sigma1sigma11)



cplhhhhhhhh1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplinghhhhhhhhQ(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,            & 
& ZH,cplhhhhhhhh1(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplhhhhhhsigma11 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call Couplinghhhhhhsigma1Q(gt1,gt2,gt3,Lam6,Lam5,Lam7,ZH,cplhhhhhhsigma11(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhhhHmcHm1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplinghhhhHmcHmQ(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,           & 
& ZH,ZP,cplhhhhHmcHm1(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplhhhhsigma1sigma11 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call Couplinghhhhsigma1sigma1Q(gt1,gt2,Lam6,Lam5,Lam1,Lam4,Lam3,ZH,cplhhhhsigma1sigma11(gt1,gt2))

 End Do 
End Do 


cplhhHmsigma1cHm1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt4 = 1, 2
Call CouplinghhHmsigma1cHmQ(gt1,gt2,gt4,Lam6,Lam5,Lam7,Lam4,ZH,ZP,cplhhHmsigma1cHm1(gt1,gt2,gt4))

  End Do 
 End Do 
End Do 


cplhhsigma1sigma1sigma11 = 0._dp 
Do gt1 = 1, 2
Call Couplinghhsigma1sigma1sigma1Q(gt1,Lam6,ZH,cplhhsigma1sigma1sigma11(gt1))

End Do 


cplHmHmcHmcHm1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingHmHmcHmcHmQ(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,               & 
& Lam2,ZP,cplHmHmcHmcHm1(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplHmsigma1sigma1cHm1 = 0._dp 
Do gt1 = 1, 2
 Do gt4 = 1, 2
Call CouplingHmsigma1sigma1cHmQ(gt1,gt4,Lam6,Lam1,Lam3,ZP,cplHmsigma1sigma1cHm1(gt1,gt4))

 End Do 
End Do 


cplsigma1sigma1sigma1sigma11 = 0._dp 
Call Couplingsigma1sigma1sigma1sigma1Q(Lam1,cplsigma1sigma1sigma1sigma11)



cplAhAhcVWmVWm1 = 0._dp 
Call CouplingAhAhcVWmVWmQ(g2,cplAhAhcVWmVWm1)



cplAhAhVZVZ1 = 0._dp 
Call CouplingAhAhVZVZQ(g1,g2,TW,cplAhAhVZVZ1)



cplAhHmcVWmVP1 = 0._dp 
Do gt2 = 1, 2
Call CouplingAhHmcVWmVPQ(gt2,g1,g2,ZP,TW,cplAhHmcVWmVP1(gt2))

End Do 


cplAhHmcVWmVZ1 = 0._dp 
Do gt2 = 1, 2
Call CouplingAhHmcVWmVZQ(gt2,g1,g2,ZP,TW,cplAhHmcVWmVZ1(gt2))

End Do 


cplAhcHmVPVWm1 = 0._dp 
Do gt2 = 1, 2
Call CouplingAhcHmVPVWmQ(gt2,g1,g2,ZP,TW,cplAhcHmVPVWm1(gt2))

End Do 


cplAhcHmVWmVZ1 = 0._dp 
Do gt2 = 1, 2
Call CouplingAhcHmVWmVZQ(gt2,g1,g2,ZP,TW,cplAhcHmVWmVZ1(gt2))

End Do 


cplhhhhcVWmVWm1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhcVWmVWmQ(gt1,gt2,g2,ZH,cplhhhhcVWmVWm1(gt1,gt2))

 End Do 
End Do 


cplhhhhVZVZ1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZVZQ(gt1,gt2,g1,g2,ZH,TW,cplhhhhVZVZ1(gt1,gt2))

 End Do 
End Do 


cplhhHmcVWmVP1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhHmcVWmVPQ(gt1,gt2,g1,g2,ZH,ZP,TW,cplhhHmcVWmVP1(gt1,gt2))

 End Do 
End Do 


cplhhHmcVWmVZ1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhHmcVWmVZQ(gt1,gt2,g1,g2,ZH,ZP,TW,cplhhHmcVWmVZ1(gt1,gt2))

 End Do 
End Do 


cplhhcHmVPVWm1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhcHmVPVWmQ(gt1,gt2,g1,g2,ZH,ZP,TW,cplhhcHmVPVWm1(gt1,gt2))

 End Do 
End Do 


cplhhcHmVWmVZ1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhcHmVWmVZQ(gt1,gt2,g1,g2,ZH,ZP,TW,cplhhcHmVWmVZ1(gt1,gt2))

 End Do 
End Do 


cplHmsigma1cVWmVP1 = 0._dp 
Do gt1 = 1, 2
Call CouplingHmsigma1cVWmVPQ(gt1,g1,g2,ZP,TW,cplHmsigma1cVWmVP1(gt1))

End Do 


cplHmsigma1cVWmVZ1 = 0._dp 
Do gt1 = 1, 2
Call CouplingHmsigma1cVWmVZQ(gt1,g1,g2,ZP,TW,cplHmsigma1cVWmVZ1(gt1))

End Do 


cplHmcHmVPVP1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHmcHmVPVPQ(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVPVP1(gt1,gt2))

 End Do 
End Do 


cplHmcHmVPVZ1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHmcHmVPVZQ(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVPVZ1(gt1,gt2))

 End Do 
End Do 


cplHmcHmcVWmVWm1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHmcHmcVWmVWmQ(gt1,gt2,g2,ZP,cplHmcHmcVWmVWm1(gt1,gt2))

 End Do 
End Do 


cplHmcHmVZVZ1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHmcHmVZVZQ(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVZVZ1(gt1,gt2))

 End Do 
End Do 


cplsigma1sigma1cVWmVWm1 = 0._dp 
Call Couplingsigma1sigma1cVWmVWmQ(g2,cplsigma1sigma1cVWmVWm1)



cplsigma1sigma1VZVZ1 = 0._dp 
Call Couplingsigma1sigma1VZVZQ(g1,g2,TW,cplsigma1sigma1VZVZ1)



cplsigma1cHmVPVWm1 = 0._dp 
Do gt2 = 1, 2
Call Couplingsigma1cHmVPVWmQ(gt2,g1,g2,ZP,TW,cplsigma1cHmVPVWm1(gt2))

End Do 


cplsigma1cHmVWmVZ1 = 0._dp 
Do gt2 = 1, 2
Call Couplingsigma1cHmVWmVZQ(gt2,g1,g2,ZP,TW,cplsigma1cHmVWmVZ1(gt2))

End Do 


cplVGVGVGVG1Q = 0._dp 
cplVGVGVGVG2Q = 0._dp 
cplVGVGVGVG3Q = 0._dp 
Call CouplingVGVGVGVGQ(g3,cplVGVGVGVG1Q,cplVGVGVGVG2Q,cplVGVGVGVG3Q)



cplcVWmVPVPVWm1Q = 0._dp 
cplcVWmVPVPVWm2Q = 0._dp 
cplcVWmVPVPVWm3Q = 0._dp 
Call CouplingcVWmVPVPVWmQ(g2,TW,cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q,cplcVWmVPVPVWm3Q)



cplcVWmVPVWmVZ1Q = 0._dp 
cplcVWmVPVWmVZ2Q = 0._dp 
cplcVWmVPVWmVZ3Q = 0._dp 
Call CouplingcVWmVPVWmVZQ(g2,TW,cplcVWmVPVWmVZ1Q,cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ3Q)



cplcVWmcVWmVWmVWm1Q = 0._dp 
cplcVWmcVWmVWmVWm2Q = 0._dp 
cplcVWmcVWmVWmVWm3Q = 0._dp 
Call CouplingcVWmcVWmVWmVWmQ(g2,cplcVWmcVWmVWmVWm1Q,cplcVWmcVWmVWmVWm2Q,              & 
& cplcVWmcVWmVWmVWm3Q)



cplcVWmVWmVZVZ1Q = 0._dp 
cplcVWmVWmVZVZ2Q = 0._dp 
cplcVWmVWmVZVZ3Q = 0._dp 
Call CouplingcVWmVWmVZVZQ(g2,TW,cplcVWmVWmVZVZ1Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q)



Iname = Iname - 1 
End Subroutine CouplingsColoredQuartics

Subroutine CouplingAhAhAhAhQ(Lam2,res1)

Implicit None 

Complex(dp), Intent(in) :: Lam2

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhAh' 
 
res1 = 0._dp 
res1 = res1-3._dp*(Lam2)

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhAhQ  
 
 
Subroutine CouplingAhAhAhhhQ(gt4,Lam7,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam7

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhhh' 
 
If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(3*Lam7*ZH(gt4,1))/2._dp
res1 = res1+(-3*Conjg(Lam7)*ZH(gt4,1))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhhhQ  
 
 
Subroutine CouplingAhAhAhsigma1Q(Lam7,res1)

Implicit None 

Complex(dp), Intent(in) :: Lam7

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhsigma1' 
 
res1 = 0._dp 
res1 = res1-3._dp*(Lam7)/2._dp
res1 = res1+(-3*Conjg(Lam7))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhsigma1Q  
 
 
Subroutine CouplingAhAhhhhhQ(gt3,gt4,Lam5,Lam7,Lam4,Lam3,Lam2,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam5,Lam7,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(Lam3*ZH(gt3,1)*ZH(gt4,1))
res1 = res1-(Lam4*ZH(gt3,1)*ZH(gt4,1))
res1 = res1+(Lam5*ZH(gt3,1)*ZH(gt4,1))/2._dp
res1 = res1+(Conjg(Lam5)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res1 = res1-(Lam7*ZH(gt3,2)*ZH(gt4,1))/2._dp
res1 = res1-(Conjg(Lam7)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res1 = res1-(Lam7*ZH(gt3,1)*ZH(gt4,2))/2._dp
res1 = res1-(Conjg(Lam7)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res1 = res1-(Lam2*ZH(gt3,2)*ZH(gt4,2))

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhhQ  
 
 
Subroutine CouplingAhAhhhsigma1Q(gt3,Lam5,Lam7,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam5,Lam7

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhsigma1' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(Lam5*ZH(gt3,1))/2._dp
res1 = res1+(Conjg(Lam5)*ZH(gt3,1))/2._dp
res1 = res1-(Lam7*ZH(gt3,2))/2._dp
res1 = res1+(Conjg(Lam7)*ZH(gt3,2))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhsigma1Q  
 
 
Subroutine CouplingAhAhHmcHmQ(gt3,gt4,Lam7,Lam3,Lam2,ZP,res1)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Lam7,Lam3,Lam2

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHmcHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(Lam3*ZP(gt3,1)*ZP(gt4,1))
res1 = res1-(Conjg(Lam7)*ZP(gt3,2)*ZP(gt4,1))
res1 = res1-(Lam7*ZP(gt3,1)*ZP(gt4,2))
res1 = res1-(Lam2*ZP(gt3,2)*ZP(gt4,2))

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHmcHmQ  
 
 
Subroutine CouplingAhAhsigma1sigma1Q(Lam5,Lam4,Lam3,res1)

Implicit None 

Complex(dp), Intent(in) :: Lam5,Lam4,Lam3

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhsigma1sigma1' 
 
res1 = 0._dp 
res1 = res1-1._dp*(Lam3)
res1 = res1-1._dp*(Lam4)
res1 = res1-1._dp*(Lam5)/2._dp
res1 = res1-Conjg(Lam5)/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhsigma1sigma1Q  
 
 
Subroutine CouplingAhhhhhhhQ(gt2,gt3,gt4,Lam6,Lam5,Lam7,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhhhhh' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(3*Lam6*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res1 = res1+(-3*Conjg(Lam6)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res1 = res1-(Lam5*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res1 = res1+(Conjg(Lam5)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res1 = res1-(Lam5*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res1 = res1+(Conjg(Lam5)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res1 = res1+(Lam7*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res1 = res1-(Conjg(Lam7)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res1 = res1-(Lam5*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res1 = res1+(Conjg(Lam5)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res1 = res1+(Lam7*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res1 = res1-(Conjg(Lam7)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res1 = res1+(Lam7*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res1 = res1-(Conjg(Lam7)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhhhhhQ  
 
 
Subroutine CouplingAhhhhhsigma1Q(gt2,gt3,Lam6,Lam5,Lam7,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhhhsigma1' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(Lam6*ZH(gt2,1)*ZH(gt3,1))/2._dp
res1 = res1-(Conjg(Lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res1 = res1-(Lam5*ZH(gt2,2)*ZH(gt3,1))/2._dp
res1 = res1-(Conjg(Lam5)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res1 = res1-(Lam5*ZH(gt2,1)*ZH(gt3,2))/2._dp
res1 = res1-(Conjg(Lam5)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res1 = res1-(Lam7*ZH(gt2,2)*ZH(gt3,2))/2._dp
res1 = res1-(Conjg(Lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhhhsigma1Q  
 
 
Subroutine CouplingAhhhHmcHmQ(gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam4,ZH,ZP,res1)

Implicit None 

Integer, Intent(in) :: gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2),ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam4

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhHmcHm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(Lam6*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res1 = res1-(Conjg(Lam6)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res1 = res1+(Lam4*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,1))/2._dp
res1 = res1-(Lam5*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,1))/2._dp
res1 = res1-(Lam4*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,2))/2._dp
res1 = res1+(Conjg(Lam5)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,2))/2._dp
res1 = res1+(Lam7*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res1 = res1-(Conjg(Lam7)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhHmcHmQ  
 
 
Subroutine CouplingAhhhsigma1sigma1Q(gt2,Lam6,Lam5,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhsigma1sigma1' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(Lam6*ZH(gt2,1))/2._dp
res1 = res1-(Conjg(Lam6)*ZH(gt2,1))/2._dp
res1 = res1+(Lam5*ZH(gt2,2))/2._dp
res1 = res1-(Conjg(Lam5)*ZH(gt2,2))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhsigma1sigma1Q  
 
 
Subroutine CouplingAhHmsigma1cHmQ(gt2,gt4,Lam6,Lam5,Lam7,Lam4,ZP,res1)

Implicit None 

Integer, Intent(in) :: gt2,gt4
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam4

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmsigma1cHm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(Lam6*ZP(gt2,1)*ZP(gt4,1))/2._dp
res1 = res1-(Conjg(Lam6)*ZP(gt2,1)*ZP(gt4,1))/2._dp
res1 = res1-(Lam4*ZP(gt2,2)*ZP(gt4,1))/2._dp
res1 = res1-(Lam5*ZP(gt2,2)*ZP(gt4,1))/2._dp
res1 = res1-(Lam4*ZP(gt2,1)*ZP(gt4,2))/2._dp
res1 = res1-(Conjg(Lam5)*ZP(gt2,1)*ZP(gt4,2))/2._dp
res1 = res1-(Lam7*ZP(gt2,2)*ZP(gt4,2))/2._dp
res1 = res1-(Conjg(Lam7)*ZP(gt2,2)*ZP(gt4,2))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmsigma1cHmQ  
 
 
Subroutine CouplingAhsigma1sigma1sigma1Q(Lam6,res1)

Implicit None 

Complex(dp), Intent(in) :: Lam6

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhsigma1sigma1sigma1' 
 
res1 = 0._dp 
res1 = res1-3._dp*(Lam6)/2._dp
res1 = res1+(-3*Conjg(Lam6))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingAhsigma1sigma1sigma1Q  
 
 
Subroutine CouplinghhhhhhhhQ(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,           & 
& Lam2,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-3*Lam1*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
res1 = res1+(-3*Lam6*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res1 = res1+(-3*Conjg(Lam6)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res1 = res1+(-3*Lam6*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res1 = res1+(-3*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res1 = res1-(Lam3*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res1 = res1-(Lam4*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res1 = res1-(Lam5*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res1 = res1-(Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res1 = res1+(-3*Lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res1 = res1+(-3*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res1 = res1-(Lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
res1 = res1-(Lam4*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
res1 = res1-(Lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res1 = res1-(Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res1 = res1-(Lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
res1 = res1-(Lam4*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
res1 = res1-(Lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res1 = res1-(Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res1 = res1+(-3*Lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res1 = res1+(-3*Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res1 = res1+(-3*Lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res1 = res1+(-3*Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res1 = res1-(Lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
res1 = res1-(Lam4*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
res1 = res1-(Lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res1 = res1-(Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res1 = res1-(Lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
res1 = res1-(Lam4*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
res1 = res1-(Lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res1 = res1-(Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res1 = res1+(-3*Lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res1 = res1+(-3*Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res1 = res1-(Lam3*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res1 = res1-(Lam4*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res1 = res1-(Lam5*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res1 = res1-(Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res1 = res1+(-3*Lam7*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res1 = res1+(-3*Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res1 = res1+(-3*Lam7*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res1 = res1+(-3*Conjg(Lam7)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res1 = res1-3*Lam2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2)

 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhhhhhQ  
 
 
Subroutine Couplinghhhhhhsigma1Q(gt1,gt2,gt3,Lam6,Lam5,Lam7,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhsigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(Lam6*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res1 = res1+(Conjg(Lam6)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res1 = res1-(Lam6*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res1 = res1+(Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res1 = res1+(Lam5*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res1 = res1-(Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res1 = res1-(Lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res1 = res1+(Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res1 = res1+(Lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res1 = res1-(Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res1 = res1+(Lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res1 = res1-(Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res1 = res1+(-3*Lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res1 = res1+(3*Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhhhsigma1Q  
 
 
Subroutine CouplinghhhhHmcHmQ(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,               & 
& Lam3,Lam2,ZH,ZP,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2),ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(Lam1*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))
res1 = res1-(Lam6*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res1 = res1-(Conjg(Lam6)*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res1 = res1-(Lam6*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res1 = res1-(Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res1 = res1-(Lam3*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))
res1 = res1-(Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,1))
res1 = res1-(Lam4*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,1))/2._dp
res1 = res1-(Lam5*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,1))/2._dp
res1 = res1-(Lam4*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,1))/2._dp
res1 = res1-(Lam5*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,1))/2._dp
res1 = res1-(Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,1))
res1 = res1-(Lam6*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,2))
res1 = res1-(Lam4*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,2))/2._dp
res1 = res1-(Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,2))/2._dp
res1 = res1-(Lam4*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,2))/2._dp
res1 = res1-(Conjg(Lam5)*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,2))/2._dp
res1 = res1-(Lam7*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,2))
res1 = res1-(Lam3*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))
res1 = res1-(Lam7*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res1 = res1-(Conjg(Lam7)*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res1 = res1-(Lam7*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res1 = res1-(Conjg(Lam7)*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res1 = res1-(Lam2*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))

 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHmcHmQ  
 
 
Subroutine Couplinghhhhsigma1sigma1Q(gt1,gt2,Lam6,Lam5,Lam1,Lam4,Lam3,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam1,Lam4,Lam3

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhsigma1sigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(Lam1*ZH(gt1,1)*ZH(gt2,1))
res1 = res1-(Lam6*ZH(gt1,2)*ZH(gt2,1))/2._dp
res1 = res1-(Conjg(Lam6)*ZH(gt1,2)*ZH(gt2,1))/2._dp
res1 = res1-(Lam6*ZH(gt1,1)*ZH(gt2,2))/2._dp
res1 = res1-(Conjg(Lam6)*ZH(gt1,1)*ZH(gt2,2))/2._dp
res1 = res1-(Lam3*ZH(gt1,2)*ZH(gt2,2))
res1 = res1-(Lam4*ZH(gt1,2)*ZH(gt2,2))
res1 = res1+(Lam5*ZH(gt1,2)*ZH(gt2,2))/2._dp
res1 = res1+(Conjg(Lam5)*ZH(gt1,2)*ZH(gt2,2))/2._dp

 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhsigma1sigma1Q  
 
 
Subroutine CouplinghhHmsigma1cHmQ(gt1,gt2,gt4,Lam6,Lam5,Lam7,Lam4,ZH,ZP,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt4
Real(dp), Intent(in) :: ZH(2,2),ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam4

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmsigma1cHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(Lam6*ZH(gt1,2)*ZP(gt2,1)*ZP(gt4,1))/2._dp
res1 = res1+(Conjg(Lam6)*ZH(gt1,2)*ZP(gt2,1)*ZP(gt4,1))/2._dp
res1 = res1-(Lam4*ZH(gt1,2)*ZP(gt2,2)*ZP(gt4,1))/2._dp
res1 = res1+(Lam5*ZH(gt1,2)*ZP(gt2,2)*ZP(gt4,1))/2._dp
res1 = res1+(Lam4*ZH(gt1,2)*ZP(gt2,1)*ZP(gt4,2))/2._dp
res1 = res1-(Conjg(Lam5)*ZH(gt1,2)*ZP(gt2,1)*ZP(gt4,2))/2._dp
res1 = res1-(Lam7*ZH(gt1,2)*ZP(gt2,2)*ZP(gt4,2))/2._dp
res1 = res1+(Conjg(Lam7)*ZH(gt1,2)*ZP(gt2,2)*ZP(gt4,2))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmsigma1cHmQ  
 
 
Subroutine Couplinghhsigma1sigma1sigma1Q(gt1,Lam6,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Lam6

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhsigma1sigma1sigma1' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(-3*Lam6*ZH(gt1,2))/2._dp
res1 = res1+(3*Conjg(Lam6)*ZH(gt1,2))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine Couplinghhsigma1sigma1sigma1Q  
 
 
Subroutine CouplingHmHmcHmcHmQ(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,              & 
& Lam3,Lam2,ZP,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmHmcHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-2*Lam1*ZP(gt1,1)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,1)
res1 = res1-2*Conjg(Lam6)*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,1)
res1 = res1-2*Conjg(Lam6)*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,1)*ZP(gt4,1)
res1 = res1-2*Lam5*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,1)*ZP(gt4,1)
res1 = res1-2*Lam6*ZP(gt1,1)*ZP(gt2,1)*ZP(gt3,2)*ZP(gt4,1)
res1 = res1-(Lam3*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,2)*ZP(gt4,1))
res1 = res1-(Lam4*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,2)*ZP(gt4,1))
res1 = res1-(Lam3*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,1))
res1 = res1-(Lam4*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,1))
res1 = res1-2*Conjg(Lam7)*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,1)
res1 = res1-2*Lam6*ZP(gt1,1)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,2)
res1 = res1-(Lam3*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,2))
res1 = res1-(Lam4*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,2))
res1 = res1-(Lam3*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,1)*ZP(gt4,2))
res1 = res1-(Lam4*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,1)*ZP(gt4,2))
res1 = res1-2*Conjg(Lam7)*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,1)*ZP(gt4,2)
res1 = res1-2*Conjg(Lam5)*ZP(gt1,1)*ZP(gt2,1)*ZP(gt3,2)*ZP(gt4,2)
res1 = res1-2*Lam7*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,2)*ZP(gt4,2)
res1 = res1-2*Lam7*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,2)
res1 = res1-2*Lam2*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,2)

 


Iname = Iname - 1 
 
End Subroutine CouplingHmHmcHmcHmQ  
 
 
Subroutine CouplingHmsigma1sigma1cHmQ(gt1,gt4,Lam6,Lam1,Lam3,ZP,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt4
Real(dp), Intent(in) :: ZP(2,2)

Complex(dp), Intent(in) :: Lam6,Lam1,Lam3

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmsigma1sigma1cHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(Lam1*ZP(gt1,1)*ZP(gt4,1))
res1 = res1-(Conjg(Lam6)*ZP(gt1,2)*ZP(gt4,1))
res1 = res1-(Lam6*ZP(gt1,1)*ZP(gt4,2))
res1 = res1-(Lam3*ZP(gt1,2)*ZP(gt4,2))

 


Iname = Iname - 1 
 
End Subroutine CouplingHmsigma1sigma1cHmQ  
 
 
Subroutine Couplingsigma1sigma1sigma1sigma1Q(Lam1,res1)

Implicit None 

Complex(dp), Intent(in) :: Lam1

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingsigma1sigma1sigma1sigma1' 
 
res1 = 0._dp 
res1 = res1-3._dp*(Lam1)

 


Iname = Iname - 1 
 
End Subroutine Couplingsigma1sigma1sigma1sigma1Q  
 
 
Subroutine CouplingAhAhcVWmVWmQ(g2,res1)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhcVWmVWm' 
 
res1 = 0._dp 
res1 = res1+g2**2/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhcVWmVWmQ  
 
 
Subroutine CouplingAhAhVZVZQ(g1,g2,TW,res1)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVZVZ' 
 
res1 = 0._dp 
res1 = res1+(g2**2*Cos(TW)**2)/2._dp
res1 = res1+g1*g2*Cos(TW)*Sin(TW)
res1 = res1+(g1**2*Sin(TW)**2)/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVZVZQ  
 
 
Subroutine CouplingAhHmcVWmVPQ(gt2,g1,g2,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmcVWmVP' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(g1*g2*Cos(TW)*ZP(gt2,2))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmcVWmVPQ  
 
 
Subroutine CouplingAhHmcVWmVZQ(gt2,g1,g2,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmcVWmVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g1*g2*Sin(TW)*ZP(gt2,2))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmcVWmVZQ  
 
 
Subroutine CouplingAhcHmVPVWmQ(gt2,g1,g2,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHmVPVWm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g1*g2*Cos(TW)*ZP(gt2,2))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHmVPVWmQ  
 
 
Subroutine CouplingAhcHmVWmVZQ(gt2,g1,g2,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHmVWmVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(g1*g2*Sin(TW)*ZP(gt2,2))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHmVWmVZQ  
 
 
Subroutine CouplinghhhhcVWmVWmQ(gt1,gt2,g2,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g2**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res1 = res1+(g2**2*ZH(gt1,2)*ZH(gt2,2))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhcVWmVWmQ  
 
 
Subroutine CouplinghhhhVZVZQ(gt1,gt2,g1,g2,ZH,TW,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g2**2*Cos(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res1 = res1+g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,1)*ZH(gt2,1)
res1 = res1+(g1**2*Sin(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res1 = res1+(g2**2*Cos(TW)**2*ZH(gt1,2)*ZH(gt2,2))/2._dp
res1 = res1+g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,2)*ZH(gt2,2)
res1 = res1+(g1**2*Sin(TW)**2*ZH(gt1,2)*ZH(gt2,2))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZVZQ  
 
 
Subroutine CouplinghhHmcVWmVPQ(gt1,gt2,g1,g2,ZH,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),ZP(2,2),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmcVWmVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g1*g2*Cos(TW)*ZH(gt1,1)*ZP(gt2,1))/2._dp
res1 = res1+(g1*g2*Cos(TW)*ZH(gt1,2)*ZP(gt2,2))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmcVWmVPQ  
 
 
Subroutine CouplinghhHmcVWmVZQ(gt1,gt2,g1,g2,ZH,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),ZP(2,2),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmcVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(g1*g2*Sin(TW)*ZH(gt1,1)*ZP(gt2,1))/2._dp
res1 = res1-(g1*g2*Sin(TW)*ZH(gt1,2)*ZP(gt2,2))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmcVWmVZQ  
 
 
Subroutine CouplinghhcHmVPVWmQ(gt1,gt2,g1,g2,ZH,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),ZP(2,2),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHmVPVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g1*g2*Cos(TW)*ZH(gt1,1)*ZP(gt2,1))/2._dp
res1 = res1+(g1*g2*Cos(TW)*ZH(gt1,2)*ZP(gt2,2))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHmVPVWmQ  
 
 
Subroutine CouplinghhcHmVWmVZQ(gt1,gt2,g1,g2,ZH,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),ZP(2,2),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHmVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(g1*g2*Sin(TW)*ZH(gt1,1)*ZP(gt2,1))/2._dp
res1 = res1-(g1*g2*Sin(TW)*ZH(gt1,2)*ZP(gt2,2))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHmVWmVZQ  
 
 
Subroutine CouplingHmsigma1cVWmVPQ(gt1,g1,g2,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmsigma1cVWmVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(g1*g2*Cos(TW)*ZP(gt1,1))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingHmsigma1cVWmVPQ  
 
 
Subroutine CouplingHmsigma1cVWmVZQ(gt1,g1,g2,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmsigma1cVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g1*g2*Sin(TW)*ZP(gt1,1))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingHmsigma1cVWmVZQ  
 
 
Subroutine CouplingHmcHmVPVPQ(gt1,gt2,g1,g2,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVPVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g1**2*Cos(TW)**2*ZP(gt1,1)*ZP(gt2,1))/2._dp
res1 = res1+g1*g2*Cos(TW)*Sin(TW)*ZP(gt1,1)*ZP(gt2,1)
res1 = res1+(g2**2*Sin(TW)**2*ZP(gt1,1)*ZP(gt2,1))/2._dp
res1 = res1+(g1**2*Cos(TW)**2*ZP(gt1,2)*ZP(gt2,2))/2._dp
res1 = res1+g1*g2*Cos(TW)*Sin(TW)*ZP(gt1,2)*ZP(gt2,2)
res1 = res1+(g2**2*Sin(TW)**2*ZP(gt1,2)*ZP(gt2,2))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVPVPQ  
 
 
Subroutine CouplingHmcHmVPVZQ(gt1,gt2,g1,g2,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVPVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g1*g2*Cos(2._dp*(TW))*ZP(gt1,1)*ZP(gt2,1))/2._dp
res1 = res1-(g1**2*Sin(2._dp*(TW))*ZP(gt1,1)*ZP(gt2,1))/4._dp
res1 = res1+(g2**2*Sin(2._dp*(TW))*ZP(gt1,1)*ZP(gt2,1))/4._dp
res1 = res1+(g1*g2*Cos(2._dp*(TW))*ZP(gt1,2)*ZP(gt2,2))/2._dp
res1 = res1-(g1**2*Sin(2._dp*(TW))*ZP(gt1,2)*ZP(gt2,2))/4._dp
res1 = res1+(g2**2*Sin(2._dp*(TW))*ZP(gt1,2)*ZP(gt2,2))/4._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVPVZQ  
 
 
Subroutine CouplingHmcHmcVWmVWmQ(gt1,gt2,g2,ZP,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZP(2,2)

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g2**2*ZP(gt1,1)*ZP(gt2,1))/2._dp
res1 = res1+(g2**2*ZP(gt1,2)*ZP(gt2,2))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmcVWmVWmQ  
 
 
Subroutine CouplingHmcHmVZVZQ(gt1,gt2,g1,g2,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g2**2*Cos(TW)**2*ZP(gt1,1)*ZP(gt2,1))/2._dp
res1 = res1-(g1*g2*Cos(TW)*Sin(TW)*ZP(gt1,1)*ZP(gt2,1))
res1 = res1+(g1**2*Sin(TW)**2*ZP(gt1,1)*ZP(gt2,1))/2._dp
res1 = res1+(g2**2*Cos(TW)**2*ZP(gt1,2)*ZP(gt2,2))/2._dp
res1 = res1-(g1*g2*Cos(TW)*Sin(TW)*ZP(gt1,2)*ZP(gt2,2))
res1 = res1+(g1**2*Sin(TW)**2*ZP(gt1,2)*ZP(gt2,2))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVZVZQ  
 
 
Subroutine Couplingsigma1sigma1cVWmVWmQ(g2,res1)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingsigma1sigma1cVWmVWm' 
 
res1 = 0._dp 
res1 = res1+g2**2/2._dp

 


Iname = Iname - 1 
 
End Subroutine Couplingsigma1sigma1cVWmVWmQ  
 
 
Subroutine Couplingsigma1sigma1VZVZQ(g1,g2,TW,res1)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingsigma1sigma1VZVZ' 
 
res1 = 0._dp 
res1 = res1+(g2**2*Cos(TW)**2)/2._dp
res1 = res1+g1*g2*Cos(TW)*Sin(TW)
res1 = res1+(g1**2*Sin(TW)**2)/2._dp

 


Iname = Iname - 1 
 
End Subroutine Couplingsigma1sigma1VZVZQ  
 
 
Subroutine Couplingsigma1cHmVPVWmQ(gt2,g1,g2,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingsigma1cHmVPVWm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g1*g2*Cos(TW)*ZP(gt2,1))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine Couplingsigma1cHmVPVWmQ  
 
 
Subroutine Couplingsigma1cHmVWmVZQ(gt2,g1,g2,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingsigma1cHmVWmVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(g1*g2*Sin(TW)*ZP(gt2,1))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine Couplingsigma1cHmVWmVZQ  
 
 
Subroutine CouplingVGVGVGVGQ(g3,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res1 
Complex(dp), Intent(out) :: res2 
Complex(dp), Intent(out) :: res3 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVGVG' 
 
res1 = 0._dp 
res1 = res1-16*g3**2

 
res2 = 0._dp 
res2 = -(0.,1.)*res2 
 
res3 = 0._dp 
res3 = res3+16*g3**2

 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVGVGQ  
 
 
Subroutine CouplingcVWmVPVPVWmQ(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1 
Complex(dp), Intent(out) :: res2 
Complex(dp), Intent(out) :: res3 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVPVPVWm' 
 
res1 = 0._dp 
res1 = res1+g2**2*Sin(TW)**2

 
res2 = 0._dp 
res2 = res2+g2**2*Sin(TW)**2

 
res3 = 0._dp 
res3 = res3-2*g2**2*Sin(TW)**2

 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVPVPVWmQ  
 
 
Subroutine CouplingcVWmVPVWmVZQ(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1 
Complex(dp), Intent(out) :: res2 
Complex(dp), Intent(out) :: res3 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVPVWmVZ' 
 
res1 = 0._dp 
res1 = res1+g2**2*Cos(TW)*Sin(TW)

 
res2 = 0._dp 
res2 = res2-(g2**2*Sin(2._dp*(TW)))

 
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)*Sin(TW)

 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVPVWmVZQ  
 
 
Subroutine CouplingcVWmcVWmVWmVWmQ(g2,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res1 
Complex(dp), Intent(out) :: res2 
Complex(dp), Intent(out) :: res3 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmcVWmVWmVWm' 
 
res1 = 0._dp 
res1 = res1+2*g2**2

 
res2 = 0._dp 
res2 = res2-g2**2

 
res3 = 0._dp 
res3 = res3-g2**2

 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmcVWmVWmVWmQ  
 
 
Subroutine CouplingcVWmVWmVZVZQ(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1 
Complex(dp), Intent(out) :: res2 
Complex(dp), Intent(out) :: res3 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVWmVZVZ' 
 
res1 = 0._dp 
res1 = res1-2*g2**2*Cos(TW)**2

 
res2 = 0._dp 
res2 = res2+g2**2*Cos(TW)**2

 
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)**2

 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVWmVZVZQ  
 
 
End Module Couplings_THDMIIIHB 
