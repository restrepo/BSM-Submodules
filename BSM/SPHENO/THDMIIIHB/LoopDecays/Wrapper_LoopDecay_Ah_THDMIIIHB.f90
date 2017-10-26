! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 22:55 on 25.10.2017   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_Ah_THDMIIIHB
Use Model_Data_THDMIIIHB 
Use Kinematics 
Use OneLoopDecay_Ah_THDMIIIHB 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_Ah(MhhOS,Mhh2OS,MHmOS,MHm2OS,MFdOS,MFd2OS,MFuOS,              & 
& MFu2OS,MFeOS,MFe2OS,Msigma1OS,Msigma12OS,MAhOS,MAh2OS,MVZOS,MVZ2OS,MVWmOS,             & 
& MVWm2OS,ZHOS,ZPOS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,MAh,MAh2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHm,MHm2,Msigma1,Msigma12,MVWm,MVWm2,MVZ,MVZ2,              & 
& TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,Lam6,Lam5,Lam7,Lam1,            & 
& Lam4,Lam3,Lam2,Yu,epYU,Yd,Ye,epYD,epYE,M12,M112,M222,v,v2,dg1,dg2,dg3,dM12,            & 
& dYu,depYU,dYd,dYe,depYD,depYE,dLam6,dLam5,dLam7,dM112,dM222,dLam1,dLam4,               & 
& dLam3,dLam2,dv,dv2,dZH,dZP,dZDL,dZDR,dZUL,dZUR,dZEL,dZER,dSinTW,dCosTW,dTanTW,         & 
& ZfVG,ZfvL,Zfsigma1,ZfAh,ZfVP,ZfVZ,ZfVWm,Zfhh,ZfHm,ZfDL,ZfDR,ZfUL,ZfUR,ZfEL,            & 
& ZfER,ZfVPVZ,ZfVZVP,cplAhAhAh,cplAhAhAhAh1,cplAhAhAhhh1,cplAhAhAhsigma11,               & 
& cplAhAhcVWmVWm1,cplAhAhhh,cplAhAhhhhh1,cplAhAhhhsigma11,cplAhAhHmcHm1,cplAhAhsigma1,   & 
& cplAhAhsigma1sigma11,cplAhAhVZVZ1,cplAhcHmVPVWm1,cplAhcHmVWm,cplAhcHmVWmVZ1,           & 
& cplAhhhhh,cplAhhhhhhh1,cplAhhhhhsigma11,cplAhhhHmcHm1,cplAhhhsigma1,cplAhhhsigma1sigma11,& 
& cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhHmcVWmVP1,cplAhHmcVWmVZ1,cplAhHmsigma1cHm1,      & 
& cplAhsigma1sigma1,cplAhsigma1sigma1sigma11,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,        & 
& cplcFdFdhhR,cplcFdFdsigma1L,cplcFdFdsigma1R,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,       & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFuHmL,cplcFdFuHmR,cplcFdFuVWmL,              & 
& cplcFdFuVWmR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFesigma1L,          & 
& cplcFeFesigma1R,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHmL,           & 
& cplcFeFvHmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuFdcHmL,cplcFuFdcHmR,cplcFuFdcVWmL,         & 
& cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFusigma1L,         & 
& cplcFuFusigma1R,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,           & 
& cplcFuFuVZR,cplcFvFecHmL,cplcFvFecHmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcgAgWmcVWm,       & 
& cplcgAgWpCVWm,cplcgWmgAHm,cplcgWmgAVWm,cplcgWmgWmAh,cplcgWmgWmhh,cplcgWmgWmsigma1,     & 
& cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWmgZHm,cplcgWmgZVWm,cplcgWpCgAcVWm,cplcgWpCgWpCAh,      & 
& cplcgWpCgWpChh,cplcgWpCgWpCsigma1,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplcgWpCgZcHm,         & 
& cplcgWpCgZcVWm,cplcgZgWmcHm,cplcgZgWmcVWm,cplcgZgWpCHm,cplcgZgWpCVWm,cplcHmVPVWm,      & 
& cplcHmVWmVZ,cplcVWmVPVWm,cplcVWmVWmVZ,cplhhcHmVPVWm1,cplhhcHmVWm,cplhhcHmVWmVZ1,       & 
& cplhhcVWmVWm,cplhhhhcVWmVWm1,cplhhhhhh,cplhhhhhhhh1,cplhhhhhhsigma11,cplhhhhHmcHm1,    & 
& cplhhhhsigma1,cplhhhhsigma1sigma11,cplhhhhVZVZ1,cplhhHmcHm,cplhhHmcVWm,cplhhHmcVWmVP1, & 
& cplhhHmcVWmVZ1,cplhhHmsigma1cHm1,cplhhsigma1sigma1,cplhhsigma1sigma1sigma11,           & 
& cplhhsigma1VZ,cplhhVZVZ,cplHmcHmcVWmVWm1,cplHmcHmVP,cplHmcHmVPVP1,cplHmcHmVPVZ1,       & 
& cplHmcHmVZ,cplHmcHmVZVZ1,cplHmcVWmVP,cplHmcVWmVZ,cplHmHmcHmcHm1,cplHmsigma1cHm,        & 
& cplHmsigma1cVWm,cplHmsigma1cVWmVP1,cplHmsigma1cVWmVZ1,cplHmsigma1sigma1cHm1,           & 
& cplsigma1cHmVPVWm1,cplsigma1cHmVWm,cplsigma1cHmVWmVZ1,cplsigma1sigma1cVWmVWm1,         & 
& cplsigma1sigma1sigma1,cplsigma1sigma1sigma1sigma11,cplsigma1sigma1VZVZ1,               & 
& ctcplAhAhAh,ctcplAhAhhh,ctcplAhAhsigma1,ctcplAhhhhh,ctcplAhhhsigma1,ctcplAhhhVZ,       & 
& ctcplAhHmcHm,ctcplAhHmcVWm,ctcplAhsigma1sigma1,ctcplcFdFdAhL,ctcplcFdFdAhR,            & 
& ctcplcFeFeAhL,ctcplcFeFeAhR,ctcplcFuFuAhL,ctcplcFuFuAhR,GcplAhHmcHm,GcplcHmVPVWm,      & 
& GcplHmcVWmVP,GosZcplAhHmcHm,GosZcplcHmVPVWm,GosZcplHmcVWmVP,GZcplAhHmcHm,              & 
& GZcplcHmVPVWm,GZcplHmcVWmVP,ZcplAhAhAh,ZcplAhAhhh,ZcplAhAhsigma1,ZcplAhhhhh,           & 
& ZcplAhhhsigma1,ZcplAhhhVZ,ZcplAhHmcHm,ZcplAhHmcVWm,ZcplAhsigma1sigma1,ZcplcFdFdAhL,    & 
& ZcplcFdFdAhR,ZcplcFeFeAhL,ZcplcFeFeAhR,ZcplcFuFuAhL,ZcplcFuFuAhR,ZRUZH,ZRUZP,          & 
& ZRUVd,ZRUUd,ZRUVu,ZRUUu,ZRUVe,ZRUUe,MLambda,em,gs,deltaM,kont,gP1LAh)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3

Complex(dp),Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,Yu(3,3),epYU(3,3),Yd(3,3),Ye(3,3),epYD(3,3),       & 
& epYE(3,3),M12,M112,M222

Real(dp),Intent(in) :: v,v2

Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh(2),Mhh2(2),MHm(2),          & 
& MHm2(2),Msigma1,Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZH(2,2),ZP(2,2),ZZ(2,2),alphaH

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp),Intent(in) :: dg1,dg2,dg3,dv,dv2,dZH(2,2),dZP(2,2),dSinTW,dCosTW,dTanTW

Complex(dp),Intent(in) :: dM12,dYu(3,3),depYU(3,3),dYd(3,3),dYe(3,3),depYD(3,3),depYE(3,3),dLam6,               & 
& dLam5,dLam7,dM112,dM222,dLam1,dLam4,dLam3,dLam2,dZDL(3,3),dZDR(3,3),dZUL(3,3),         & 
& dZUR(3,3),dZEL(3,3),dZER(3,3)

Complex(dp),Intent(in) :: cplAhAhAh,cplAhAhAhAh1,cplAhAhAhhh1(2),cplAhAhAhsigma11,cplAhAhcVWmVWm1,              & 
& cplAhAhhh(2),cplAhAhhhhh1(2,2),cplAhAhhhsigma11(2),cplAhAhHmcHm1(2,2),cplAhAhsigma1,   & 
& cplAhAhsigma1sigma11,cplAhAhVZVZ1,cplAhcHmVPVWm1(2),cplAhcHmVWm(2),cplAhcHmVWmVZ1(2),  & 
& cplAhhhhh(2,2),cplAhhhhhhh1(2,2,2),cplAhhhhhsigma11(2,2),cplAhhhHmcHm1(2,2,2),         & 
& cplAhhhsigma1(2),cplAhhhsigma1sigma11(2),cplAhhhVZ(2),cplAhHmcHm(2,2),cplAhHmcVWm(2),  & 
& cplAhHmcVWmVP1(2),cplAhHmcVWmVZ1(2),cplAhHmsigma1cHm1(2,2),cplAhsigma1sigma1,          & 
& cplAhsigma1sigma1sigma11,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFdFdhhL(3,3,2),         & 
& cplcFdFdhhR(3,3,2),cplcFdFdsigma1L(3,3),cplcFdFdsigma1R(3,3),cplcFdFdVGL(3,3),         & 
& cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),  & 
& cplcFdFuHmL(3,3,2),cplcFdFuHmR(3,3,2),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),             & 
& cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),               & 
& cplcFeFesigma1L(3,3),cplcFeFesigma1R(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),           & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvHmL(3,3,2),cplcFeFvHmR(3,3,2),               & 
& cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplcFuFdcHmL(3,3,2),cplcFuFdcHmR(3,3,2),           & 
& cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),               & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFusigma1L(3,3),cplcFuFusigma1R(3,3),       & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),  & 
& cplcFuFuVZR(3,3),cplcFvFecHmL(3,3,2),cplcFvFecHmR(3,3,2),cplcFvFecVWmL(3,3),           & 
& cplcFvFecVWmR(3,3),cplcgAgWmcVWm,cplcgAgWpCVWm,cplcgWmgAHm(2),cplcgWmgAVWm,            & 
& cplcgWmgWmAh,cplcgWmgWmhh(2),cplcgWmgWmsigma1,cplcgWmgWmVP,cplcgWmgWmVZ,               & 
& cplcgWmgZHm(2),cplcgWmgZVWm,cplcgWpCgAcVWm,cplcgWpCgWpCAh,cplcgWpCgWpChh(2),           & 
& cplcgWpCgWpCsigma1,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplcgWpCgZcHm(2),cplcgWpCgZcVWm,      & 
& cplcgZgWmcHm(2),cplcgZgWmcVWm,cplcgZgWpCHm(2),cplcgZgWpCVWm,cplcHmVPVWm(2),            & 
& cplcHmVWmVZ(2),cplcVWmVPVWm,cplcVWmVWmVZ,cplhhcHmVPVWm1(2,2),cplhhcHmVWm(2,2),         & 
& cplhhcHmVWmVZ1(2,2),cplhhcVWmVWm(2),cplhhhhcVWmVWm1(2,2),cplhhhhhh(2,2,2),             & 
& cplhhhhhhhh1(2,2,2,2),cplhhhhhhsigma11(2,2,2),cplhhhhHmcHm1(2,2,2,2),cplhhhhsigma1(2,2),& 
& cplhhhhsigma1sigma11(2,2),cplhhhhVZVZ1(2,2),cplhhHmcHm(2,2,2),cplhhHmcVWm(2,2),        & 
& cplhhHmcVWmVP1(2,2),cplhhHmcVWmVZ1(2,2),cplhhHmsigma1cHm1(2,2,2),cplhhsigma1sigma1(2), & 
& cplhhsigma1sigma1sigma11(2),cplhhsigma1VZ(2),cplhhVZVZ(2),cplHmcHmcVWmVWm1(2,2),       & 
& cplHmcHmVP(2,2),cplHmcHmVPVP1(2,2),cplHmcHmVPVZ1(2,2),cplHmcHmVZ(2,2),cplHmcHmVZVZ1(2,2),& 
& cplHmcVWmVP(2),cplHmcVWmVZ(2),cplHmHmcHmcHm1(2,2,2,2),cplHmsigma1cHm(2,2),             & 
& cplHmsigma1cVWm(2),cplHmsigma1cVWmVP1(2),cplHmsigma1cVWmVZ1(2),cplHmsigma1sigma1cHm1(2,2),& 
& cplsigma1cHmVPVWm1(2),cplsigma1cHmVWm(2),cplsigma1cHmVWmVZ1(2),cplsigma1sigma1cVWmVWm1,& 
& cplsigma1sigma1sigma1,cplsigma1sigma1sigma1sigma11,cplsigma1sigma1VZVZ1,               & 
& ctcplAhAhAh,ctcplAhAhhh(2),ctcplAhAhsigma1,ctcplAhhhhh(2,2),ctcplAhhhsigma1(2),        & 
& ctcplAhhhVZ(2),ctcplAhHmcHm(2,2),ctcplAhHmcVWm(2),ctcplAhsigma1sigma1,ctcplcFdFdAhL(3,3),& 
& ctcplcFdFdAhR(3,3),ctcplcFeFeAhL(3,3),ctcplcFeFeAhR(3,3),ctcplcFuFuAhL(3,3)

Complex(dp),Intent(in) :: ctcplcFuFuAhR(3,3),GcplAhHmcHm(2,2),GcplcHmVPVWm(2),GcplHmcVWmVP(2),GosZcplAhHmcHm(2,2),& 
& GosZcplcHmVPVWm(2),GosZcplHmcVWmVP(2),GZcplAhHmcHm(2,2),GZcplcHmVPVWm(2),              & 
& GZcplHmcVWmVP(2),ZcplAhAhAh,ZcplAhAhhh(2),ZcplAhAhsigma1,ZcplAhhhhh(2,2),              & 
& ZcplAhhhsigma1(2),ZcplAhhhVZ(2),ZcplAhHmcHm(2,2),ZcplAhHmcVWm(2),ZcplAhsigma1sigma1,   & 
& ZcplcFdFdAhL(3,3),ZcplcFdFdAhR(3,3),ZcplcFeFeAhL(3,3),ZcplcFeFeAhR(3,3),               & 
& ZcplcFuFuAhL(3,3),ZcplcFuFuAhR(3,3)

Real(dp), Intent(in) :: em, gs 
Complex(dp),Intent(in) :: ZfVG,ZfvL(3,3),Zfsigma1,ZfAh,ZfVP,ZfVZ,ZfVWm,Zfhh(2,2),ZfHm(2,2),ZfDL(3,3),           & 
& ZfDR(3,3),ZfUL(3,3),ZfUR(3,3),ZfEL(3,3),ZfER(3,3),ZfVPVZ,ZfVZVP

Real(dp),Intent(in) :: MhhOS(2),Mhh2OS(2),MHmOS(2),MHm2OS(2),MFdOS(3),MFd2OS(3),MFuOS(3),MFu2OS(3),          & 
& MFeOS(3),MFe2OS(3),Msigma1OS,Msigma12OS,MAhOS,MAh2OS,MVZOS,MVZ2OS,MVWmOS,              & 
& MVWm2OS,ZHOS(2,2),ZPOS(2,2)

Complex(dp),Intent(in) :: ZDLOS(3,3),ZDROS(3,3),ZULOS(3,3),ZUROS(3,3),ZELOS(3,3),ZEROS(3,3)

Complex(dp),Intent(in) :: ZRUZH(2,2),ZRUZP(2,2),ZRUVd(3,3),ZRUUd(3,3),ZRUVu(3,3),ZRUUu(3,3),ZRUVe(3,3),         & 
& ZRUUe(3,3)

Real(dp), Intent(in) :: MLambda, deltaM 
Real(dp), Intent(out) :: gP1LAh(1,55) 
Integer, Intent(out) :: kont 
Real(dp) :: MVG,MVP,MVG2,MVP2, helfactor, phasespacefactor 
Integer :: i1,i2,i3,i4, isave, gt1, gt2, gt3 

Complex(dp) :: ZRUZHc(2, 2) 
Complex(dp) :: ZRUZPc(2, 2) 
Complex(dp) :: ZRUVdc(3, 3) 
Complex(dp) :: ZRUUdc(3, 3) 
Complex(dp) :: ZRUVuc(3, 3) 
Complex(dp) :: ZRUUuc(3, 3) 
Complex(dp) :: ZRUVec(3, 3) 
Complex(dp) :: ZRUUec(3, 3) 
Real(dp) :: MRPAhToAhAh,MRGAhToAhAh, MRPZAhToAhAh,MRGZAhToAhAh 
Real(dp) :: MVPAhToAhAh 
Real(dp) :: RMsqTreeAhToAhAh,RMsqWaveAhToAhAh,RMsqVertexAhToAhAh 
Complex(dp) :: AmpTreeAhToAhAh,AmpWaveAhToAhAh=(0._dp,0._dp),AmpVertexAhToAhAh& 
 & ,AmpVertexIRosAhToAhAh,AmpVertexIRdrAhToAhAh, AmpSumAhToAhAh, AmpSum2AhToAhAh 
Complex(dp) :: AmpTreeZAhToAhAh,AmpWaveZAhToAhAh,AmpVertexZAhToAhAh 
Real(dp) :: AmpSqAhToAhAh,  AmpSqTreeAhToAhAh 
Real(dp) :: MRPAhTohhAh(2),MRGAhTohhAh(2), MRPZAhTohhAh(2),MRGZAhTohhAh(2) 
Real(dp) :: MVPAhTohhAh(2) 
Real(dp) :: RMsqTreeAhTohhAh(2),RMsqWaveAhTohhAh(2),RMsqVertexAhTohhAh(2) 
Complex(dp) :: AmpTreeAhTohhAh(2),AmpWaveAhTohhAh(2)=(0._dp,0._dp),AmpVertexAhTohhAh(2)& 
 & ,AmpVertexIRosAhTohhAh(2),AmpVertexIRdrAhTohhAh(2), AmpSumAhTohhAh(2), AmpSum2AhTohhAh(2) 
Complex(dp) :: AmpTreeZAhTohhAh(2),AmpWaveZAhTohhAh(2),AmpVertexZAhTohhAh(2) 
Real(dp) :: AmpSqAhTohhAh(2),  AmpSqTreeAhTohhAh(2) 
Real(dp) :: MRPAhTocFdFd(3,3),MRGAhTocFdFd(3,3), MRPZAhTocFdFd(3,3),MRGZAhTocFdFd(3,3) 
Real(dp) :: MVPAhTocFdFd(3,3) 
Real(dp) :: RMsqTreeAhTocFdFd(3,3),RMsqWaveAhTocFdFd(3,3),RMsqVertexAhTocFdFd(3,3) 
Complex(dp) :: AmpTreeAhTocFdFd(2,3,3),AmpWaveAhTocFdFd(2,3,3)=(0._dp,0._dp),AmpVertexAhTocFdFd(2,3,3)& 
 & ,AmpVertexIRosAhTocFdFd(2,3,3),AmpVertexIRdrAhTocFdFd(2,3,3), AmpSumAhTocFdFd(2,3,3), AmpSum2AhTocFdFd(2,3,3) 
Complex(dp) :: AmpTreeZAhTocFdFd(2,3,3),AmpWaveZAhTocFdFd(2,3,3),AmpVertexZAhTocFdFd(2,3,3) 
Real(dp) :: AmpSqAhTocFdFd(3,3),  AmpSqTreeAhTocFdFd(3,3) 
Real(dp) :: MRPAhTocFeFe(3,3),MRGAhTocFeFe(3,3), MRPZAhTocFeFe(3,3),MRGZAhTocFeFe(3,3) 
Real(dp) :: MVPAhTocFeFe(3,3) 
Real(dp) :: RMsqTreeAhTocFeFe(3,3),RMsqWaveAhTocFeFe(3,3),RMsqVertexAhTocFeFe(3,3) 
Complex(dp) :: AmpTreeAhTocFeFe(2,3,3),AmpWaveAhTocFeFe(2,3,3)=(0._dp,0._dp),AmpVertexAhTocFeFe(2,3,3)& 
 & ,AmpVertexIRosAhTocFeFe(2,3,3),AmpVertexIRdrAhTocFeFe(2,3,3), AmpSumAhTocFeFe(2,3,3), AmpSum2AhTocFeFe(2,3,3) 
Complex(dp) :: AmpTreeZAhTocFeFe(2,3,3),AmpWaveZAhTocFeFe(2,3,3),AmpVertexZAhTocFeFe(2,3,3) 
Real(dp) :: AmpSqAhTocFeFe(3,3),  AmpSqTreeAhTocFeFe(3,3) 
Real(dp) :: MRPAhTocFuFu(3,3),MRGAhTocFuFu(3,3), MRPZAhTocFuFu(3,3),MRGZAhTocFuFu(3,3) 
Real(dp) :: MVPAhTocFuFu(3,3) 
Real(dp) :: RMsqTreeAhTocFuFu(3,3),RMsqWaveAhTocFuFu(3,3),RMsqVertexAhTocFuFu(3,3) 
Complex(dp) :: AmpTreeAhTocFuFu(2,3,3),AmpWaveAhTocFuFu(2,3,3)=(0._dp,0._dp),AmpVertexAhTocFuFu(2,3,3)& 
 & ,AmpVertexIRosAhTocFuFu(2,3,3),AmpVertexIRdrAhTocFuFu(2,3,3), AmpSumAhTocFuFu(2,3,3), AmpSum2AhTocFuFu(2,3,3) 
Complex(dp) :: AmpTreeZAhTocFuFu(2,3,3),AmpWaveZAhTocFuFu(2,3,3),AmpVertexZAhTocFuFu(2,3,3) 
Real(dp) :: AmpSqAhTocFuFu(3,3),  AmpSqTreeAhTocFuFu(3,3) 
Real(dp) :: MRPAhTohhhh(2,2),MRGAhTohhhh(2,2), MRPZAhTohhhh(2,2),MRGZAhTohhhh(2,2) 
Real(dp) :: MVPAhTohhhh(2,2) 
Real(dp) :: RMsqTreeAhTohhhh(2,2),RMsqWaveAhTohhhh(2,2),RMsqVertexAhTohhhh(2,2) 
Complex(dp) :: AmpTreeAhTohhhh(2,2),AmpWaveAhTohhhh(2,2)=(0._dp,0._dp),AmpVertexAhTohhhh(2,2)& 
 & ,AmpVertexIRosAhTohhhh(2,2),AmpVertexIRdrAhTohhhh(2,2), AmpSumAhTohhhh(2,2), AmpSum2AhTohhhh(2,2) 
Complex(dp) :: AmpTreeZAhTohhhh(2,2),AmpWaveZAhTohhhh(2,2),AmpVertexZAhTohhhh(2,2) 
Real(dp) :: AmpSqAhTohhhh(2,2),  AmpSqTreeAhTohhhh(2,2) 
Real(dp) :: MRPAhTohhVZ(2),MRGAhTohhVZ(2), MRPZAhTohhVZ(2),MRGZAhTohhVZ(2) 
Real(dp) :: MVPAhTohhVZ(2) 
Real(dp) :: RMsqTreeAhTohhVZ(2),RMsqWaveAhTohhVZ(2),RMsqVertexAhTohhVZ(2) 
Complex(dp) :: AmpTreeAhTohhVZ(2,2),AmpWaveAhTohhVZ(2,2)=(0._dp,0._dp),AmpVertexAhTohhVZ(2,2)& 
 & ,AmpVertexIRosAhTohhVZ(2,2),AmpVertexIRdrAhTohhVZ(2,2), AmpSumAhTohhVZ(2,2), AmpSum2AhTohhVZ(2,2) 
Complex(dp) :: AmpTreeZAhTohhVZ(2,2),AmpWaveZAhTohhVZ(2,2),AmpVertexZAhTohhVZ(2,2) 
Real(dp) :: AmpSqAhTohhVZ(2),  AmpSqTreeAhTohhVZ(2) 
Real(dp) :: MRPAhTocHmHm(2,2),MRGAhTocHmHm(2,2), MRPZAhTocHmHm(2,2),MRGZAhTocHmHm(2,2) 
Real(dp) :: MVPAhTocHmHm(2,2) 
Real(dp) :: RMsqTreeAhTocHmHm(2,2),RMsqWaveAhTocHmHm(2,2),RMsqVertexAhTocHmHm(2,2) 
Complex(dp) :: AmpTreeAhTocHmHm(2,2),AmpWaveAhTocHmHm(2,2)=(0._dp,0._dp),AmpVertexAhTocHmHm(2,2)& 
 & ,AmpVertexIRosAhTocHmHm(2,2),AmpVertexIRdrAhTocHmHm(2,2), AmpSumAhTocHmHm(2,2), AmpSum2AhTocHmHm(2,2) 
Complex(dp) :: AmpTreeZAhTocHmHm(2,2),AmpWaveZAhTocHmHm(2,2),AmpVertexZAhTocHmHm(2,2) 
Real(dp) :: AmpSqAhTocHmHm(2,2),  AmpSqTreeAhTocHmHm(2,2) 
Real(dp) :: MRPAhToHmcVWm(2),MRGAhToHmcVWm(2), MRPZAhToHmcVWm(2),MRGZAhToHmcVWm(2) 
Real(dp) :: MVPAhToHmcVWm(2) 
Real(dp) :: RMsqTreeAhToHmcVWm(2),RMsqWaveAhToHmcVWm(2),RMsqVertexAhToHmcVWm(2) 
Complex(dp) :: AmpTreeAhToHmcVWm(2,2),AmpWaveAhToHmcVWm(2,2)=(0._dp,0._dp),AmpVertexAhToHmcVWm(2,2)& 
 & ,AmpVertexIRosAhToHmcVWm(2,2),AmpVertexIRdrAhToHmcVWm(2,2), AmpSumAhToHmcVWm(2,2), AmpSum2AhToHmcVWm(2,2) 
Complex(dp) :: AmpTreeZAhToHmcVWm(2,2),AmpWaveZAhToHmcVWm(2,2),AmpVertexZAhToHmcVWm(2,2) 
Real(dp) :: AmpSqAhToHmcVWm(2),  AmpSqTreeAhToHmcVWm(2) 
Real(dp) :: MRPAhToAhVP,MRGAhToAhVP, MRPZAhToAhVP,MRGZAhToAhVP 
Real(dp) :: MVPAhToAhVP 
Real(dp) :: RMsqTreeAhToAhVP,RMsqWaveAhToAhVP,RMsqVertexAhToAhVP 
Complex(dp) :: AmpTreeAhToAhVP(2),AmpWaveAhToAhVP(2)=(0._dp,0._dp),AmpVertexAhToAhVP(2)& 
 & ,AmpVertexIRosAhToAhVP(2),AmpVertexIRdrAhToAhVP(2), AmpSumAhToAhVP(2), AmpSum2AhToAhVP(2) 
Complex(dp) :: AmpTreeZAhToAhVP(2),AmpWaveZAhToAhVP(2),AmpVertexZAhToAhVP(2) 
Real(dp) :: AmpSqAhToAhVP,  AmpSqTreeAhToAhVP 
Real(dp) :: MRPAhToAhVZ,MRGAhToAhVZ, MRPZAhToAhVZ,MRGZAhToAhVZ 
Real(dp) :: MVPAhToAhVZ 
Real(dp) :: RMsqTreeAhToAhVZ,RMsqWaveAhToAhVZ,RMsqVertexAhToAhVZ 
Complex(dp) :: AmpTreeAhToAhVZ(2),AmpWaveAhToAhVZ(2)=(0._dp,0._dp),AmpVertexAhToAhVZ(2)& 
 & ,AmpVertexIRosAhToAhVZ(2),AmpVertexIRdrAhToAhVZ(2), AmpSumAhToAhVZ(2), AmpSum2AhToAhVZ(2) 
Complex(dp) :: AmpTreeZAhToAhVZ(2),AmpWaveZAhToAhVZ(2),AmpVertexZAhToAhVZ(2) 
Real(dp) :: AmpSqAhToAhVZ,  AmpSqTreeAhToAhVZ 
Real(dp) :: MRPAhToFvcFv(3,3),MRGAhToFvcFv(3,3), MRPZAhToFvcFv(3,3),MRGZAhToFvcFv(3,3) 
Real(dp) :: MVPAhToFvcFv(3,3) 
Real(dp) :: RMsqTreeAhToFvcFv(3,3),RMsqWaveAhToFvcFv(3,3),RMsqVertexAhToFvcFv(3,3) 
Complex(dp) :: AmpTreeAhToFvcFv(2,3,3),AmpWaveAhToFvcFv(2,3,3)=(0._dp,0._dp),AmpVertexAhToFvcFv(2,3,3)& 
 & ,AmpVertexIRosAhToFvcFv(2,3,3),AmpVertexIRdrAhToFvcFv(2,3,3), AmpSumAhToFvcFv(2,3,3), AmpSum2AhToFvcFv(2,3,3) 
Complex(dp) :: AmpTreeZAhToFvcFv(2,3,3),AmpWaveZAhToFvcFv(2,3,3),AmpVertexZAhToFvcFv(2,3,3) 
Real(dp) :: AmpSqAhToFvcFv(3,3),  AmpSqTreeAhToFvcFv(3,3) 
Real(dp) :: MRPAhTohhVP(2),MRGAhTohhVP(2), MRPZAhTohhVP(2),MRGZAhTohhVP(2) 
Real(dp) :: MVPAhTohhVP(2) 
Real(dp) :: RMsqTreeAhTohhVP(2),RMsqWaveAhTohhVP(2),RMsqVertexAhTohhVP(2) 
Complex(dp) :: AmpTreeAhTohhVP(2,2),AmpWaveAhTohhVP(2,2)=(0._dp,0._dp),AmpVertexAhTohhVP(2,2)& 
 & ,AmpVertexIRosAhTohhVP(2,2),AmpVertexIRdrAhTohhVP(2,2), AmpSumAhTohhVP(2,2), AmpSum2AhTohhVP(2,2) 
Complex(dp) :: AmpTreeZAhTohhVP(2,2),AmpWaveZAhTohhVP(2,2),AmpVertexZAhTohhVP(2,2) 
Real(dp) :: AmpSqAhTohhVP(2),  AmpSqTreeAhTohhVP(2) 
Real(dp) :: MRPAhToVGVG,MRGAhToVGVG, MRPZAhToVGVG,MRGZAhToVGVG 
Real(dp) :: MVPAhToVGVG 
Real(dp) :: RMsqTreeAhToVGVG,RMsqWaveAhToVGVG,RMsqVertexAhToVGVG 
Complex(dp) :: AmpTreeAhToVGVG(2),AmpWaveAhToVGVG(2)=(0._dp,0._dp),AmpVertexAhToVGVG(2)& 
 & ,AmpVertexIRosAhToVGVG(2),AmpVertexIRdrAhToVGVG(2), AmpSumAhToVGVG(2), AmpSum2AhToVGVG(2) 
Complex(dp) :: AmpTreeZAhToVGVG(2),AmpWaveZAhToVGVG(2),AmpVertexZAhToVGVG(2) 
Real(dp) :: AmpSqAhToVGVG,  AmpSqTreeAhToVGVG 
Real(dp) :: MRPAhToVPVP,MRGAhToVPVP, MRPZAhToVPVP,MRGZAhToVPVP 
Real(dp) :: MVPAhToVPVP 
Real(dp) :: RMsqTreeAhToVPVP,RMsqWaveAhToVPVP,RMsqVertexAhToVPVP 
Complex(dp) :: AmpTreeAhToVPVP(2),AmpWaveAhToVPVP(2)=(0._dp,0._dp),AmpVertexAhToVPVP(2)& 
 & ,AmpVertexIRosAhToVPVP(2),AmpVertexIRdrAhToVPVP(2), AmpSumAhToVPVP(2), AmpSum2AhToVPVP(2) 
Complex(dp) :: AmpTreeZAhToVPVP(2),AmpWaveZAhToVPVP(2),AmpVertexZAhToVPVP(2) 
Real(dp) :: AmpSqAhToVPVP,  AmpSqTreeAhToVPVP 
Real(dp) :: MRPAhToVPVZ,MRGAhToVPVZ, MRPZAhToVPVZ,MRGZAhToVPVZ 
Real(dp) :: MVPAhToVPVZ 
Real(dp) :: RMsqTreeAhToVPVZ,RMsqWaveAhToVPVZ,RMsqVertexAhToVPVZ 
Complex(dp) :: AmpTreeAhToVPVZ(2),AmpWaveAhToVPVZ(2)=(0._dp,0._dp),AmpVertexAhToVPVZ(2)& 
 & ,AmpVertexIRosAhToVPVZ(2),AmpVertexIRdrAhToVPVZ(2), AmpSumAhToVPVZ(2), AmpSum2AhToVPVZ(2) 
Complex(dp) :: AmpTreeZAhToVPVZ(2),AmpWaveZAhToVPVZ(2),AmpVertexZAhToVPVZ(2) 
Real(dp) :: AmpSqAhToVPVZ,  AmpSqTreeAhToVPVZ 
Real(dp) :: MRPAhToVWmcVWm,MRGAhToVWmcVWm, MRPZAhToVWmcVWm,MRGZAhToVWmcVWm 
Real(dp) :: MVPAhToVWmcVWm 
Real(dp) :: RMsqTreeAhToVWmcVWm,RMsqWaveAhToVWmcVWm,RMsqVertexAhToVWmcVWm 
Complex(dp) :: AmpTreeAhToVWmcVWm(2),AmpWaveAhToVWmcVWm(2)=(0._dp,0._dp),AmpVertexAhToVWmcVWm(2)& 
 & ,AmpVertexIRosAhToVWmcVWm(2),AmpVertexIRdrAhToVWmcVWm(2), AmpSumAhToVWmcVWm(2), AmpSum2AhToVWmcVWm(2) 
Complex(dp) :: AmpTreeZAhToVWmcVWm(2),AmpWaveZAhToVWmcVWm(2),AmpVertexZAhToVWmcVWm(2) 
Real(dp) :: AmpSqAhToVWmcVWm,  AmpSqTreeAhToVWmcVWm 
Real(dp) :: MRPAhToVZVZ,MRGAhToVZVZ, MRPZAhToVZVZ,MRGZAhToVZVZ 
Real(dp) :: MVPAhToVZVZ 
Real(dp) :: RMsqTreeAhToVZVZ,RMsqWaveAhToVZVZ,RMsqVertexAhToVZVZ 
Complex(dp) :: AmpTreeAhToVZVZ(2),AmpWaveAhToVZVZ(2)=(0._dp,0._dp),AmpVertexAhToVZVZ(2)& 
 & ,AmpVertexIRosAhToVZVZ(2),AmpVertexIRdrAhToVZVZ(2), AmpSumAhToVZVZ(2), AmpSum2AhToVZVZ(2) 
Complex(dp) :: AmpTreeZAhToVZVZ(2),AmpWaveZAhToVZVZ(2),AmpVertexZAhToVZVZ(2) 
Real(dp) :: AmpSqAhToVZVZ,  AmpSqTreeAhToVZVZ 
Write(*,*) "Calculating one-loop decays of Ah " 
kont = 0 
MVG = MLambda 
MVP = MLambda 
MVG2 = MLambda**2 
MVP2 = MLambda**2 

ZRUZHc = Conjg(ZRUZH)
ZRUZPc = Conjg(ZRUZP)
ZRUVdc = Conjg(ZRUVd)
ZRUUdc = Conjg(ZRUUd)
ZRUVuc = Conjg(ZRUVu)
ZRUUuc = Conjg(ZRUUu)
ZRUVec = Conjg(ZRUVe)
ZRUUec = Conjg(ZRUUe)

 ! Counter 
isave = 1 

If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Ah Ah
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_THDMIIIHB_AhToAhAh(cplAhAhAh,MAh,MAh2,AmpTreeAhToAhAh)

  Else 
Call Amplitude_Tree_THDMIIIHB_AhToAhAh(ZcplAhAhAh,MAh,MAh2,AmpTreeAhToAhAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_THDMIIIHB_AhToAhAh(MLambda,em,gs,cplAhAhAh,MAhOS,MRPAhToAhAh,         & 
& MRGAhToAhAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_THDMIIIHB_AhToAhAh(MLambda,em,gs,ZcplAhAhAh,MAhOS,MRPAhToAhAh,        & 
& MRGAhToAhAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_THDMIIIHB_AhToAhAh(MLambda,em,gs,cplAhAhAh,MAh,MRPAhToAhAh,           & 
& MRGAhToAhAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_THDMIIIHB_AhToAhAh(MLambda,em,gs,ZcplAhAhAh,MAh,MRPAhToAhAh,          & 
& MRGAhToAhAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_THDMIIIHB_AhToAhAh(cplAhAhAh,ctcplAhAhAh,MAh,MAh2,ZfAh,           & 
& AmpWaveAhToAhAh)



!Vertex Corrections 
Call Amplitude_VERTEX_THDMIIIHB_AhToAhAh(MAh,MFd,MFe,MFu,Mhh,MHm,Msigma1,             & 
& MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,        & 
& cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,             & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,             & 
& cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplAhAhAhAh1,cplAhAhAhhh1,        & 
& cplAhAhAhsigma11,cplAhAhhhhh1,cplAhAhhhsigma11,cplAhAhHmcHm1,cplAhAhsigma1sigma11,     & 
& AmpVertexAhToAhAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhToAhAh(MAh,MFd,MFe,MFu,Mhh,MHm,Msigma1,          & 
& MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,        & 
& cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,             & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,             & 
& cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplAhAhAhAh1,cplAhAhAhhh1,        & 
& cplAhAhAhsigma11,cplAhAhhhhh1,cplAhAhhhsigma11,cplAhAhHmcHm1,cplAhAhsigma1sigma11,     & 
& AmpVertexIRdrAhToAhAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhToAhAh(MAhOS,MFdOS,MFeOS,MFuOS,MhhOS,            & 
& MHmOS,Msigma1OS,MVWmOS,MVZOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,Msigma12OS,     & 
& MVWm2OS,MVZ2OS,ZcplAhAhAh,cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,             & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,            & 
& cplAhcHmVWm,cplAhAhAhAh1,cplAhAhAhhh1,cplAhAhAhsigma11,cplAhAhhhhh1,cplAhAhhhsigma11,  & 
& cplAhAhHmcHm1,cplAhAhsigma1sigma11,AmpVertexIRosAhToAhAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhToAhAh(MAh,MFd,MFe,MFu,Mhh,MHm,Msigma1,          & 
& MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,ZcplAhAhAh,cplAhAhhh,       & 
& cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,             & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,             & 
& cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplAhAhAhAh1,cplAhAhAhhh1,        & 
& cplAhAhAhsigma11,cplAhAhhhhh1,cplAhAhhhsigma11,cplAhAhHmcHm1,cplAhAhsigma1sigma11,     & 
& AmpVertexIRosAhToAhAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhToAhAh(MAhOS,MFdOS,MFeOS,MFuOS,MhhOS,            & 
& MHmOS,Msigma1OS,MVWmOS,MVZOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,Msigma12OS,     & 
& MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,            & 
& cplAhcHmVWm,cplAhAhAhAh1,cplAhAhAhhh1,cplAhAhAhsigma11,cplAhAhhhhh1,cplAhAhhhsigma11,  & 
& cplAhAhHmcHm1,cplAhAhsigma1sigma11,AmpVertexIRosAhToAhAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhToAhAh(MAh,MFd,MFe,MFu,Mhh,MHm,Msigma1,          & 
& MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,        & 
& cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,             & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,             & 
& cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplAhAhAhAh1,cplAhAhAhhh1,        & 
& cplAhAhAhsigma11,cplAhAhhhhh1,cplAhAhhhsigma11,cplAhAhHmcHm1,cplAhAhsigma1sigma11,     & 
& AmpVertexIRosAhToAhAh)

 End if 
 End if 
AmpVertexAhToAhAh = AmpVertexAhToAhAh -  AmpVertexIRdrAhToAhAh! +  AmpVertexIRosAhToAhAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
End if
If (ShiftIRdiv) Then 
AmpVertexAhToAhAh = AmpVertexAhToAhAh  +  AmpVertexIRosAhToAhAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->Ah Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhToAhAh = AmpTreeAhToAhAh 
 AmpSum2AhToAhAh = AmpTreeAhToAhAh + 2._dp*AmpWaveAhToAhAh + 2._dp*AmpVertexAhToAhAh  
Else 
 AmpSumAhToAhAh = AmpTreeAhToAhAh + AmpWaveAhToAhAh + AmpVertexAhToAhAh
 AmpSum2AhToAhAh = AmpTreeAhToAhAh + AmpWaveAhToAhAh + AmpVertexAhToAhAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToAhAh = AmpTreeAhToAhAh
 AmpSum2AhToAhAh = AmpTreeAhToAhAh 
End if 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MAhOS.gt.(MAhOS+MAhOS))).or.((.not.OSkinematics).and.(MAh.gt.(MAh+MAh)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*)  
  AmpSum2AhToAhAh = AmpTreeAhToAhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS,MAhOS,MAhOS,AmpSumAhToAhAh,AmpSum2AhToAhAh,AmpSqAhToAhAh) 
Else  
  Call SquareAmp_StoSS(MAh,MAh,MAh,AmpSumAhToAhAh,AmpSum2AhToAhAh,AmpSqAhToAhAh) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhToAhAh 
  AmpSum2AhToAhAh = 2._dp*AmpWaveAhToAhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS,MAhOS,MAhOS,AmpSumAhToAhAh,AmpSum2AhToAhAh,AmpSqAhToAhAh) 
Else  
  Call SquareAmp_StoSS(MAh,MAh,MAh,AmpSumAhToAhAh,AmpSum2AhToAhAh,AmpSqAhToAhAh) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhToAhAh 
  AmpSum2AhToAhAh = 2._dp*AmpVertexAhToAhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS,MAhOS,MAhOS,AmpSumAhToAhAh,AmpSum2AhToAhAh,AmpSqAhToAhAh) 
Else  
  Call SquareAmp_StoSS(MAh,MAh,MAh,AmpSumAhToAhAh,AmpSum2AhToAhAh,AmpSqAhToAhAh) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhToAhAh 
  AmpSum2AhToAhAh = AmpTreeAhToAhAh + 2._dp*AmpWaveAhToAhAh + 2._dp*AmpVertexAhToAhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS,MAhOS,MAhOS,AmpSumAhToAhAh,AmpSum2AhToAhAh,AmpSqAhToAhAh) 
Else  
  Call SquareAmp_StoSS(MAh,MAh,MAh,AmpSumAhToAhAh,AmpSum2AhToAhAh,AmpSqAhToAhAh) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhToAhAh 
 End if 
If (OSkinematics) Then 
  AmpSum2AhToAhAh = AmpTreeAhToAhAh
  Call SquareAmp_StoSS(MAhOS,MAhOS,MAhOS,AmpSumAhToAhAh,AmpSum2AhToAhAh,AmpSqAhToAhAh) 
  AmpSqTreeAhToAhAh = AmpSqAhToAhAh  
  AmpSum2AhToAhAh = + 2._dp*AmpWaveAhToAhAh + 2._dp*AmpVertexAhToAhAh
  Call SquareAmp_StoSS(MAhOS,MAhOS,MAhOS,AmpSumAhToAhAh,AmpSum2AhToAhAh,AmpSqAhToAhAh) 
  AmpSqAhToAhAh = AmpSqAhToAhAh + AmpSqTreeAhToAhAh  
Else  
  AmpSum2AhToAhAh = AmpTreeAhToAhAh
  Call SquareAmp_StoSS(MAh,MAh,MAh,AmpSumAhToAhAh,AmpSum2AhToAhAh,AmpSqAhToAhAh) 
  AmpSqTreeAhToAhAh = AmpSqAhToAhAh  
  AmpSum2AhToAhAh = + 2._dp*AmpWaveAhToAhAh + 2._dp*AmpVertexAhToAhAh
  Call SquareAmp_StoSS(MAh,MAh,MAh,AmpSumAhToAhAh,AmpSum2AhToAhAh,AmpSqAhToAhAh) 
  AmpSqAhToAhAh = AmpSqAhToAhAh + AmpSqTreeAhToAhAh  
End if  
Else  
  AmpSqAhToAhAh = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToAhAh.le.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAhOS,MAhOS,MAhOS,helfactor*AmpSqAhToAhAh)
Else 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAh,MAh,MAh,helfactor*AmpSqAhToAhAh)
End if 
If ((Abs(MRPAhToAhAh).gt.1.0E-20_dp).or.(Abs(MRGAhToAhAh).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhToAhAh).gt.1.0E-20_dp).or.(Abs(MRGAhToAhAh).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPAhToAhAh + MRGAhToAhAh) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPAhToAhAh + MRGAhToAhAh)
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

isave = i4 
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! hh Ah
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_THDMIIIHB_AhTohhAh(cplAhAhhh,MAh,Mhh,MAh2,Mhh2,AmpTreeAhTohhAh)

  Else 
Call Amplitude_Tree_THDMIIIHB_AhTohhAh(ZcplAhAhhh,MAh,Mhh,MAh2,Mhh2,AmpTreeAhTohhAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_THDMIIIHB_AhTohhAh(MLambda,em,gs,cplAhAhhh,MAhOS,MhhOS,               & 
& MRPAhTohhAh,MRGAhTohhAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_THDMIIIHB_AhTohhAh(MLambda,em,gs,ZcplAhAhhh,MAhOS,MhhOS,              & 
& MRPAhTohhAh,MRGAhTohhAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_THDMIIIHB_AhTohhAh(MLambda,em,gs,cplAhAhhh,MAh,Mhh,MRPAhTohhAh,       & 
& MRGAhTohhAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_THDMIIIHB_AhTohhAh(MLambda,em,gs,ZcplAhAhhh,MAh,Mhh,MRPAhTohhAh,      & 
& MRGAhTohhAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_THDMIIIHB_AhTohhAh(cplAhAhhh,ctcplAhAhhh,MAh,MAh2,Mhh,            & 
& Mhh2,ZfAh,Zfhh,AmpWaveAhTohhAh)



!Vertex Corrections 
Call Amplitude_VERTEX_THDMIIIHB_AhTohhAh(MAh,MFd,MFe,MFu,Mhh,MHm,Msigma1,             & 
& MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,        & 
& cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,             & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,             & 
& cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFdFdhhL,cplcFdFdhhR,          & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWmgWmhh,cplcgWpCgWpChh,           & 
& cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,        & 
& cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,cplAhAhAhAh1,cplAhAhAhhh1,cplAhAhAhsigma11,         & 
& cplAhAhhhhh1,cplAhAhhhsigma11,cplAhAhHmcHm1,cplAhAhsigma1sigma11,cplAhAhcVWmVWm1,      & 
& cplAhAhVZVZ1,cplAhhhhhhh1,cplAhhhhhsigma11,cplAhhhHmcHm1,cplAhhhsigma1sigma11,         & 
& AmpVertexAhTohhAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTohhAh(MAh,MFd,MFe,MFu,Mhh,MHm,Msigma1,          & 
& MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,        & 
& cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,             & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,             & 
& cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFdFdhhL,cplcFdFdhhR,          & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWmgWmhh,cplcgWpCgWpChh,           & 
& cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,        & 
& cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,cplAhAhAhAh1,cplAhAhAhhh1,cplAhAhAhsigma11,         & 
& cplAhAhhhhh1,cplAhAhhhsigma11,cplAhAhHmcHm1,cplAhAhsigma1sigma11,cplAhAhcVWmVWm1,      & 
& cplAhAhVZVZ1,cplAhhhhhhh1,cplAhhhhhsigma11,cplAhhhHmcHm1,cplAhhhsigma1sigma11,         & 
& AmpVertexIRdrAhTohhAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTohhAh(MAhOS,MFdOS,MFeOS,MFuOS,MhhOS,            & 
& MHmOS,Msigma1OS,MVWmOS,MVZOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,Msigma12OS,     & 
& MVWm2OS,MVZ2OS,cplAhAhAh,ZcplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,             & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,            & 
& cplAhcHmVWm,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,            & 
& cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,        & 
& cplAhAhAhAh1,cplAhAhAhhh1,cplAhAhAhsigma11,cplAhAhhhhh1,cplAhAhhhsigma11,              & 
& cplAhAhHmcHm1,cplAhAhsigma1sigma11,cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhhhhhhh1,          & 
& cplAhhhhhsigma11,cplAhhhHmcHm1,cplAhhhsigma1sigma11,AmpVertexIRosAhTohhAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTohhAh(MAh,MFd,MFe,MFu,Mhh,MHm,Msigma1,          & 
& MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhAh,ZcplAhAhhh,       & 
& cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,             & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,             & 
& cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFdFdhhL,cplcFdFdhhR,          & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWmgWmhh,cplcgWpCgWpChh,           & 
& cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,        & 
& cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,cplAhAhAhAh1,cplAhAhAhhh1,cplAhAhAhsigma11,         & 
& cplAhAhhhhh1,cplAhAhhhsigma11,cplAhAhHmcHm1,cplAhAhsigma1sigma11,cplAhAhcVWmVWm1,      & 
& cplAhAhVZVZ1,cplAhhhhhhh1,cplAhhhhhsigma11,cplAhhhHmcHm1,cplAhhhsigma1sigma11,         & 
& AmpVertexIRosAhTohhAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTohhAh(MAhOS,MFdOS,MFeOS,MFuOS,MhhOS,            & 
& MHmOS,Msigma1OS,MVWmOS,MVZOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,Msigma12OS,     & 
& MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,            & 
& cplAhcHmVWm,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,            & 
& cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,        & 
& cplAhAhAhAh1,cplAhAhAhhh1,cplAhAhAhsigma11,cplAhAhhhhh1,cplAhAhhhsigma11,              & 
& cplAhAhHmcHm1,cplAhAhsigma1sigma11,cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhhhhhhh1,          & 
& cplAhhhhhsigma11,cplAhhhHmcHm1,cplAhhhsigma1sigma11,AmpVertexIRosAhTohhAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTohhAh(MAh,MFd,MFe,MFu,Mhh,MHm,Msigma1,          & 
& MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,        & 
& cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,             & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,             & 
& cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFdFdhhL,cplcFdFdhhR,          & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWmgWmhh,cplcgWpCgWpChh,           & 
& cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,        & 
& cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,cplAhAhAhAh1,cplAhAhAhhh1,cplAhAhAhsigma11,         & 
& cplAhAhhhhh1,cplAhAhhhsigma11,cplAhAhHmcHm1,cplAhAhsigma1sigma11,cplAhAhcVWmVWm1,      & 
& cplAhAhVZVZ1,cplAhhhhhhh1,cplAhhhhhsigma11,cplAhhhHmcHm1,cplAhhhsigma1sigma11,         & 
& AmpVertexIRosAhTohhAh)

 End if 
 End if 
AmpVertexAhTohhAh = AmpVertexAhTohhAh -  AmpVertexIRdrAhTohhAh! +  AmpVertexIRosAhTohhAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Final State 1 
AmpWaveZAhTohhAh=0._dp 
AmpVertexZAhTohhAh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZAhTohhAh(gt2) = AmpWaveZAhTohhAh(gt2)+ZRUZH(gt2,gt1)*AmpWaveAhTohhAh(gt1) 
AmpVertexZAhTohhAh(gt2)= AmpVertexZAhTohhAh(gt2)+ZRUZH(gt2,gt1)*AmpVertexAhTohhAh(gt1) 
 End Do 
End Do 
AmpWaveAhTohhAh=AmpWaveZAhTohhAh 
AmpVertexAhTohhAh= AmpVertexZAhTohhAh
End if
If (ShiftIRdiv) Then 
AmpVertexAhTohhAh = AmpVertexAhTohhAh  +  AmpVertexIRosAhTohhAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->hh Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTohhAh = AmpTreeAhTohhAh 
 AmpSum2AhTohhAh = AmpTreeAhTohhAh + 2._dp*AmpWaveAhTohhAh + 2._dp*AmpVertexAhTohhAh  
Else 
 AmpSumAhTohhAh = AmpTreeAhTohhAh + AmpWaveAhTohhAh + AmpVertexAhTohhAh
 AmpSum2AhTohhAh = AmpTreeAhTohhAh + AmpWaveAhTohhAh + AmpVertexAhTohhAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTohhAh = AmpTreeAhTohhAh
 AmpSum2AhTohhAh = AmpTreeAhTohhAh 
End if 
gt1=1 
i4 = isave 
  Do gt2=1,2
If (((OSkinematics).and.(MAhOS.gt.(MhhOS(gt2)+MAhOS))).or.((.not.OSkinematics).and.(MAh.gt.(Mhh(gt2)+MAh)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt2 
  AmpSum2AhTohhAh = AmpTreeAhTohhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS,MhhOS(gt2),MAhOS,AmpSumAhTohhAh(gt2),AmpSum2AhTohhAh(gt2),AmpSqAhTohhAh(gt2)) 
Else  
  Call SquareAmp_StoSS(MAh,Mhh(gt2),MAh,AmpSumAhTohhAh(gt2),AmpSum2AhTohhAh(gt2),AmpSqAhTohhAh(gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTohhAh(gt2) 
  AmpSum2AhTohhAh = 2._dp*AmpWaveAhTohhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS,MhhOS(gt2),MAhOS,AmpSumAhTohhAh(gt2),AmpSum2AhTohhAh(gt2),AmpSqAhTohhAh(gt2)) 
Else  
  Call SquareAmp_StoSS(MAh,Mhh(gt2),MAh,AmpSumAhTohhAh(gt2),AmpSum2AhTohhAh(gt2),AmpSqAhTohhAh(gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTohhAh(gt2) 
  AmpSum2AhTohhAh = 2._dp*AmpVertexAhTohhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS,MhhOS(gt2),MAhOS,AmpSumAhTohhAh(gt2),AmpSum2AhTohhAh(gt2),AmpSqAhTohhAh(gt2)) 
Else  
  Call SquareAmp_StoSS(MAh,Mhh(gt2),MAh,AmpSumAhTohhAh(gt2),AmpSum2AhTohhAh(gt2),AmpSqAhTohhAh(gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTohhAh(gt2) 
  AmpSum2AhTohhAh = AmpTreeAhTohhAh + 2._dp*AmpWaveAhTohhAh + 2._dp*AmpVertexAhTohhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS,MhhOS(gt2),MAhOS,AmpSumAhTohhAh(gt2),AmpSum2AhTohhAh(gt2),AmpSqAhTohhAh(gt2)) 
Else  
  Call SquareAmp_StoSS(MAh,Mhh(gt2),MAh,AmpSumAhTohhAh(gt2),AmpSum2AhTohhAh(gt2),AmpSqAhTohhAh(gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTohhAh(gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTohhAh = AmpTreeAhTohhAh
  Call SquareAmp_StoSS(MAhOS,MhhOS(gt2),MAhOS,AmpSumAhTohhAh(gt2),AmpSum2AhTohhAh(gt2),AmpSqAhTohhAh(gt2)) 
  AmpSqTreeAhTohhAh(gt2) = AmpSqAhTohhAh(gt2)  
  AmpSum2AhTohhAh = + 2._dp*AmpWaveAhTohhAh + 2._dp*AmpVertexAhTohhAh
  Call SquareAmp_StoSS(MAhOS,MhhOS(gt2),MAhOS,AmpSumAhTohhAh(gt2),AmpSum2AhTohhAh(gt2),AmpSqAhTohhAh(gt2)) 
  AmpSqAhTohhAh(gt2) = AmpSqAhTohhAh(gt2) + AmpSqTreeAhTohhAh(gt2)  
Else  
  AmpSum2AhTohhAh = AmpTreeAhTohhAh
  Call SquareAmp_StoSS(MAh,Mhh(gt2),MAh,AmpSumAhTohhAh(gt2),AmpSum2AhTohhAh(gt2),AmpSqAhTohhAh(gt2)) 
  AmpSqTreeAhTohhAh(gt2) = AmpSqAhTohhAh(gt2)  
  AmpSum2AhTohhAh = + 2._dp*AmpWaveAhTohhAh + 2._dp*AmpVertexAhTohhAh
  Call SquareAmp_StoSS(MAh,Mhh(gt2),MAh,AmpSumAhTohhAh(gt2),AmpSum2AhTohhAh(gt2),AmpSqAhTohhAh(gt2)) 
  AmpSqAhTohhAh(gt2) = AmpSqAhTohhAh(gt2) + AmpSqTreeAhTohhAh(gt2)  
End if  
Else  
  AmpSqAhTohhAh(gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhTohhAh(gt2).le.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS,MhhOS(gt2),MAhOS,helfactor*AmpSqAhTohhAh(gt2))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh,Mhh(gt2),MAh,helfactor*AmpSqAhTohhAh(gt2))
End if 
If ((Abs(MRPAhTohhAh(gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhAh(gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTohhAh(gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhAh(gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTohhAh(gt2) + MRGAhTohhAh(gt2)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTohhAh(gt2) + MRGAhTohhAh(gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
isave = i4 
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fd) Fd
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_THDMIIIHB_AhTocFdFd(cplcFdFdAhL,cplcFdFdAhR,MAh,MFd,              & 
& MAh2,MFd2,AmpTreeAhTocFdFd)

  Else 
Call Amplitude_Tree_THDMIIIHB_AhTocFdFd(ZcplcFdFdAhL,ZcplcFdFdAhR,MAh,MFd,            & 
& MAh2,MFd2,AmpTreeAhTocFdFd)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_THDMIIIHB_AhTocFdFd(MLambda,em,gs,cplcFdFdAhL,cplcFdFdAhR,            & 
& MAhOS,MFdOS,MRPAhTocFdFd,MRGAhTocFdFd)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_THDMIIIHB_AhTocFdFd(MLambda,em,gs,ZcplcFdFdAhL,ZcplcFdFdAhR,          & 
& MAhOS,MFdOS,MRPAhTocFdFd,MRGAhTocFdFd)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_THDMIIIHB_AhTocFdFd(MLambda,em,gs,cplcFdFdAhL,cplcFdFdAhR,            & 
& MAh,MFd,MRPAhTocFdFd,MRGAhTocFdFd)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_THDMIIIHB_AhTocFdFd(MLambda,em,gs,ZcplcFdFdAhL,ZcplcFdFdAhR,          & 
& MAh,MFd,MRPAhTocFdFd,MRGAhTocFdFd)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_THDMIIIHB_AhTocFdFd(cplcFdFdAhL,cplcFdFdAhR,ctcplcFdFdAhL,        & 
& ctcplcFdFdAhR,MAh,MAh2,MFd,MFd2,ZfAh,ZfDL,ZfDR,AmpWaveAhTocFdFd)



!Vertex Corrections 
Call Amplitude_VERTEX_THDMIIIHB_AhTocFdFd(MAh,MFd,MFu,Mhh,MHm,Msigma1,MVG,            & 
& MVP,MVWm,MVZ,MAh2,MFd2,MFu2,Mhh2,MHm2,Msigma12,MVG2,MVP2,MVWm2,MVZ2,cplAhAhAh,         & 
& cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,            & 
& cplAhcHmVWm,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdsigma1L,cplcFdFdsigma1R,cplcFdFdVGL,       & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcHmL,              & 
& cplcFuFdcHmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFdFuHmL,cplcFdFuHmR,cplcFdFuVWmL,         & 
& cplcFdFuVWmR,AmpVertexAhTocFdFd)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTocFdFd(MAh,MFd,MFu,Mhh,MHm,Msigma1,             & 
& MVG,MVP,MVWm,MVZ,MAh2,MFd2,MFu2,Mhh2,MHm2,Msigma12,MVG2,MVP2,MVWm2,MVZ2,               & 
& cplAhAhAh,cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,     & 
& cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,            & 
& cplAhcHmVWm,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdsigma1L,cplcFdFdsigma1R,cplcFdFdVGL,       & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcHmL,              & 
& cplcFuFdcHmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFdFuHmL,cplcFdFuHmR,cplcFdFuVWmL,         & 
& cplcFdFuVWmR,AmpVertexIRdrAhTocFdFd)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTocFdFd(MAhOS,MFdOS,MFuOS,MhhOS,MHmOS,           & 
& Msigma1OS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,Msigma12OS,          & 
& MVG2,MVP2,MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,cplAhAhsigma1,ZcplcFdFdAhL,               & 
& ZcplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,     & 
& cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdsigma1L,     & 
& cplcFdFdsigma1R,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,           & 
& cplcFdFdVZR,cplcFuFdcHmL,cplcFuFdcHmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFdFuHmL,         & 
& cplcFdFuHmR,cplcFdFuVWmL,cplcFdFuVWmR,AmpVertexIRosAhTocFdFd)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTocFdFd(MAh,MFd,MFu,Mhh,MHm,Msigma1,             & 
& MVG,MVP,MVWm,MVZ,MAh2,MFd2,MFu2,Mhh2,MHm2,Msigma12,MVG2,MVP2,MVWm2,MVZ2,               & 
& cplAhAhAh,cplAhAhhh,cplAhAhsigma1,ZcplcFdFdAhL,ZcplcFdFdAhR,cplcFuFuAhL,               & 
& cplcFuFuAhR,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,& 
& cplAhcHmVWm,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdsigma1L,cplcFdFdsigma1R,cplcFdFdVGL,       & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcHmL,              & 
& cplcFuFdcHmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFdFuHmL,cplcFdFuHmR,cplcFdFuVWmL,         & 
& cplcFdFuVWmR,AmpVertexIRosAhTocFdFd)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTocFdFd(MAhOS,MFdOS,MFuOS,MhhOS,MHmOS,           & 
& Msigma1OS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,Msigma12OS,          & 
& MVG2,MVP2,MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,    & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,      & 
& cplAhsigma1sigma1,cplAhcHmVWm,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdsigma1L,cplcFdFdsigma1R, & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFuFdcHmL,cplcFuFdcHmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFdFuHmL,cplcFdFuHmR,         & 
& cplcFdFuVWmL,cplcFdFuVWmR,AmpVertexIRosAhTocFdFd)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTocFdFd(MAh,MFd,MFu,Mhh,MHm,Msigma1,             & 
& MVG,MVP,MVWm,MVZ,MAh2,MFd2,MFu2,Mhh2,MHm2,Msigma12,MVG2,MVP2,MVWm2,MVZ2,               & 
& cplAhAhAh,cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,     & 
& cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,            & 
& cplAhcHmVWm,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdsigma1L,cplcFdFdsigma1R,cplcFdFdVGL,       & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcHmL,              & 
& cplcFuFdcHmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFdFuHmL,cplcFdFuHmR,cplcFdFuVWmL,         & 
& cplcFdFuVWmR,AmpVertexIRosAhTocFdFd)

 End if 
 End if 
AmpVertexAhTocFdFd = AmpVertexAhTocFdFd -  AmpVertexIRdrAhTocFdFd! +  AmpVertexIRosAhTocFdFd ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Final State 1 
AmpWaveZAhTocFdFd=0._dp 
AmpVertexZAhTocFdFd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZAhTocFdFd(1,gt2,:) = AmpWaveZAhTocFdFd(1,gt2,:)+ZRUUd(gt2,gt1)*AmpWaveAhTocFdFd(1,gt1,:) 
AmpVertexZAhTocFdFd(1,gt2,:)= AmpVertexZAhTocFdFd(1,gt2,:)+ZRUUd(gt2,gt1)*AmpVertexAhTocFdFd(1,gt1,:) 
AmpWaveZAhTocFdFd(2,gt2,:) = AmpWaveZAhTocFdFd(2,gt2,:)+ZRUVdc(gt2,gt1)*AmpWaveAhTocFdFd(2,gt1,:) 
AmpVertexZAhTocFdFd(2,gt2,:)= AmpVertexZAhTocFdFd(2,gt2,:)+ZRUVdc(gt2,gt1)*AmpVertexAhTocFdFd(2,gt1,:) 
 End Do 
End Do 
AmpWaveAhTocFdFd=AmpWaveZAhTocFdFd 
AmpVertexAhTocFdFd= AmpVertexZAhTocFdFd
! Final State 2 
AmpWaveZAhTocFdFd=0._dp 
AmpVertexZAhTocFdFd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZAhTocFdFd(1,:,gt2) = AmpWaveZAhTocFdFd(1,:,gt2)+ZRUVd(gt2,gt1)*AmpWaveAhTocFdFd(1,:,gt1) 
AmpVertexZAhTocFdFd(1,:,gt2)= AmpVertexZAhTocFdFd(1,:,gt2)+ZRUVd(gt2,gt1)*AmpVertexAhTocFdFd(1,:,gt1) 
AmpWaveZAhTocFdFd(2,:,gt2) = AmpWaveZAhTocFdFd(2,:,gt2)+ZRUUd(gt2,gt1)*AmpWaveAhTocFdFd(2,:,gt1) 
AmpVertexZAhTocFdFd(2,:,gt2)= AmpVertexZAhTocFdFd(2,:,gt2)+ZRUUd(gt2,gt1)*AmpVertexAhTocFdFd(2,:,gt1) 
 End Do 
End Do 
AmpWaveAhTocFdFd=AmpWaveZAhTocFdFd 
AmpVertexAhTocFdFd= AmpVertexZAhTocFdFd
End if
If (ShiftIRdiv) Then 
AmpVertexAhTocFdFd = AmpVertexAhTocFdFd  +  AmpVertexIRosAhTocFdFd
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->bar[Fd] Fd -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTocFdFd = AmpTreeAhTocFdFd 
 AmpSum2AhTocFdFd = AmpTreeAhTocFdFd + 2._dp*AmpWaveAhTocFdFd + 2._dp*AmpVertexAhTocFdFd  
Else 
 AmpSumAhTocFdFd = AmpTreeAhTocFdFd + AmpWaveAhTocFdFd + AmpVertexAhTocFdFd
 AmpSum2AhTocFdFd = AmpTreeAhTocFdFd + AmpWaveAhTocFdFd + AmpVertexAhTocFdFd 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTocFdFd = AmpTreeAhTocFdFd
 AmpSum2AhTocFdFd = AmpTreeAhTocFdFd 
End if 
gt1=1 
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(MAhOS.gt.(MFdOS(gt2)+MFdOS(gt3)))).or.((.not.OSkinematics).and.(MAh.gt.(MFd(gt2)+MFd(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt2, gt3 
  AmpSum2AhTocFdFd = AmpTreeAhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS,MFdOS(gt2),MFdOS(gt3),AmpSumAhTocFdFd(:,gt2, gt3),AmpSum2AhTocFdFd(:,gt2, gt3),AmpSqAhTocFdFd(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh,MFd(gt2),MFd(gt3),AmpSumAhTocFdFd(:,gt2, gt3),AmpSum2AhTocFdFd(:,gt2, gt3),AmpSqAhTocFdFd(gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTocFdFd(gt2, gt3) 
  AmpSum2AhTocFdFd = 2._dp*AmpWaveAhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS,MFdOS(gt2),MFdOS(gt3),AmpSumAhTocFdFd(:,gt2, gt3),AmpSum2AhTocFdFd(:,gt2, gt3),AmpSqAhTocFdFd(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh,MFd(gt2),MFd(gt3),AmpSumAhTocFdFd(:,gt2, gt3),AmpSum2AhTocFdFd(:,gt2, gt3),AmpSqAhTocFdFd(gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTocFdFd(gt2, gt3) 
  AmpSum2AhTocFdFd = 2._dp*AmpVertexAhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS,MFdOS(gt2),MFdOS(gt3),AmpSumAhTocFdFd(:,gt2, gt3),AmpSum2AhTocFdFd(:,gt2, gt3),AmpSqAhTocFdFd(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh,MFd(gt2),MFd(gt3),AmpSumAhTocFdFd(:,gt2, gt3),AmpSum2AhTocFdFd(:,gt2, gt3),AmpSqAhTocFdFd(gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTocFdFd(gt2, gt3) 
  AmpSum2AhTocFdFd = AmpTreeAhTocFdFd + 2._dp*AmpWaveAhTocFdFd + 2._dp*AmpVertexAhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS,MFdOS(gt2),MFdOS(gt3),AmpSumAhTocFdFd(:,gt2, gt3),AmpSum2AhTocFdFd(:,gt2, gt3),AmpSqAhTocFdFd(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh,MFd(gt2),MFd(gt3),AmpSumAhTocFdFd(:,gt2, gt3),AmpSum2AhTocFdFd(:,gt2, gt3),AmpSqAhTocFdFd(gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTocFdFd(gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTocFdFd = AmpTreeAhTocFdFd
  Call SquareAmp_StoFF(MAhOS,MFdOS(gt2),MFdOS(gt3),AmpSumAhTocFdFd(:,gt2, gt3),AmpSum2AhTocFdFd(:,gt2, gt3),AmpSqAhTocFdFd(gt2, gt3)) 
  AmpSqTreeAhTocFdFd(gt2, gt3) = AmpSqAhTocFdFd(gt2, gt3)  
  AmpSum2AhTocFdFd = + 2._dp*AmpWaveAhTocFdFd + 2._dp*AmpVertexAhTocFdFd
  Call SquareAmp_StoFF(MAhOS,MFdOS(gt2),MFdOS(gt3),AmpSumAhTocFdFd(:,gt2, gt3),AmpSum2AhTocFdFd(:,gt2, gt3),AmpSqAhTocFdFd(gt2, gt3)) 
  AmpSqAhTocFdFd(gt2, gt3) = AmpSqAhTocFdFd(gt2, gt3) + AmpSqTreeAhTocFdFd(gt2, gt3)  
Else  
  AmpSum2AhTocFdFd = AmpTreeAhTocFdFd
  Call SquareAmp_StoFF(MAh,MFd(gt2),MFd(gt3),AmpSumAhTocFdFd(:,gt2, gt3),AmpSum2AhTocFdFd(:,gt2, gt3),AmpSqAhTocFdFd(gt2, gt3)) 
  AmpSqTreeAhTocFdFd(gt2, gt3) = AmpSqAhTocFdFd(gt2, gt3)  
  AmpSum2AhTocFdFd = + 2._dp*AmpWaveAhTocFdFd + 2._dp*AmpVertexAhTocFdFd
  Call SquareAmp_StoFF(MAh,MFd(gt2),MFd(gt3),AmpSumAhTocFdFd(:,gt2, gt3),AmpSum2AhTocFdFd(:,gt2, gt3),AmpSqAhTocFdFd(gt2, gt3)) 
  AmpSqAhTocFdFd(gt2, gt3) = AmpSqAhTocFdFd(gt2, gt3) + AmpSqTreeAhTocFdFd(gt2, gt3)  
End if  
Else  
  AmpSqAhTocFdFd(gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqAhTocFdFd(gt2, gt3).le.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 3._dp*GammaTPS(MAhOS,MFdOS(gt2),MFdOS(gt3),helfactor*AmpSqAhTocFdFd(gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 3._dp*GammaTPS(MAh,MFd(gt2),MFd(gt3),helfactor*AmpSqAhTocFdFd(gt2, gt3))
End if 
If ((Abs(MRPAhTocFdFd(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocFdFd(gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTocFdFd(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocFdFd(gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTocFdFd(gt2, gt3) + MRGAhTocFdFd(gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTocFdFd(gt2, gt3) + MRGAhTocFdFd(gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
isave = i4 
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fe) Fe
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_THDMIIIHB_AhTocFeFe(cplcFeFeAhL,cplcFeFeAhR,MAh,MFe,              & 
& MAh2,MFe2,AmpTreeAhTocFeFe)

  Else 
Call Amplitude_Tree_THDMIIIHB_AhTocFeFe(ZcplcFeFeAhL,ZcplcFeFeAhR,MAh,MFe,            & 
& MAh2,MFe2,AmpTreeAhTocFeFe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_THDMIIIHB_AhTocFeFe(MLambda,em,gs,cplcFeFeAhL,cplcFeFeAhR,            & 
& MAhOS,MFeOS,MRPAhTocFeFe,MRGAhTocFeFe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_THDMIIIHB_AhTocFeFe(MLambda,em,gs,ZcplcFeFeAhL,ZcplcFeFeAhR,          & 
& MAhOS,MFeOS,MRPAhTocFeFe,MRGAhTocFeFe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_THDMIIIHB_AhTocFeFe(MLambda,em,gs,cplcFeFeAhL,cplcFeFeAhR,            & 
& MAh,MFe,MRPAhTocFeFe,MRGAhTocFeFe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_THDMIIIHB_AhTocFeFe(MLambda,em,gs,ZcplcFeFeAhL,ZcplcFeFeAhR,          & 
& MAh,MFe,MRPAhTocFeFe,MRGAhTocFeFe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_THDMIIIHB_AhTocFeFe(cplcFeFeAhL,cplcFeFeAhR,ctcplcFeFeAhL,        & 
& ctcplcFeFeAhR,MAh,MAh2,MFe,MFe2,ZfAh,ZfEL,ZfER,AmpWaveAhTocFeFe)



!Vertex Corrections 
Call Amplitude_VERTEX_THDMIIIHB_AhTocFeFe(MAh,MFe,Mhh,MHm,Msigma1,MVP,MVWm,           & 
& MVZ,MAh2,MFe2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,cplAhAhsigma1,    & 
& cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,      & 
& cplAhsigma1sigma1,cplAhcHmVWm,cplcFeFehhL,cplcFeFehhR,cplcFeFesigma1L,cplcFeFesigma1R, & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFvFecHmL,cplcFvFecHmR,             & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplcFeFvHmL,cplcFeFvHmR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& AmpVertexAhTocFeFe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTocFeFe(MAh,MFe,Mhh,MHm,Msigma1,MVP,             & 
& MVWm,MVZ,MAh2,MFe2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,             & 
& cplAhAhsigma1,cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,               & 
& cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFeFehhL,cplcFeFehhR,          & 
& cplcFeFesigma1L,cplcFeFesigma1R,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,       & 
& cplcFvFecHmL,cplcFvFecHmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFeFvHmL,cplcFeFvHmR,         & 
& cplcFeFvVWmL,cplcFeFvVWmR,AmpVertexIRdrAhTocFeFe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTocFeFe(MAhOS,MFeOS,MhhOS,MHmOS,Msigma1OS,       & 
& MVP,MVWmOS,MVZOS,MAh2OS,MFe2OS,Mhh2OS,MHm2OS,Msigma12OS,MVP2,MVWm2OS,MVZ2OS,           & 
& cplAhAhAh,cplAhAhhh,cplAhAhsigma1,ZcplcFeFeAhL,ZcplcFeFeAhR,cplAhhhhh,cplAhhhsigma1,   & 
& cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFeFehhL,            & 
& cplcFeFehhR,cplcFeFesigma1L,cplcFeFesigma1R,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,       & 
& cplcFeFeVZR,cplcFvFecHmL,cplcFvFecHmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFeFvHmL,         & 
& cplcFeFvHmR,cplcFeFvVWmL,cplcFeFvVWmR,AmpVertexIRosAhTocFeFe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTocFeFe(MAh,MFe,Mhh,MHm,Msigma1,MVP,             & 
& MVWm,MVZ,MAh2,MFe2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,             & 
& cplAhAhsigma1,ZcplcFeFeAhL,ZcplcFeFeAhR,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,             & 
& cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFeFehhL,cplcFeFehhR,          & 
& cplcFeFesigma1L,cplcFeFesigma1R,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,       & 
& cplcFvFecHmL,cplcFvFecHmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFeFvHmL,cplcFeFvHmR,         & 
& cplcFeFvVWmL,cplcFeFvVWmR,AmpVertexIRosAhTocFeFe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTocFeFe(MAhOS,MFeOS,MhhOS,MHmOS,Msigma1OS,       & 
& MVP,MVWmOS,MVZOS,MAh2OS,MFe2OS,Mhh2OS,MHm2OS,Msigma12OS,MVP2,MVWm2OS,MVZ2OS,           & 
& cplAhAhAh,cplAhAhhh,cplAhAhsigma1,cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,cplAhhhsigma1,     & 
& cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFeFehhL,            & 
& cplcFeFehhR,cplcFeFesigma1L,cplcFeFesigma1R,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,       & 
& cplcFeFeVZR,cplcFvFecHmL,cplcFvFecHmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFeFvHmL,         & 
& cplcFeFvHmR,cplcFeFvVWmL,cplcFeFvVWmR,AmpVertexIRosAhTocFeFe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTocFeFe(MAh,MFe,Mhh,MHm,Msigma1,MVP,             & 
& MVWm,MVZ,MAh2,MFe2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,             & 
& cplAhAhsigma1,cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,               & 
& cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFeFehhL,cplcFeFehhR,          & 
& cplcFeFesigma1L,cplcFeFesigma1R,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,       & 
& cplcFvFecHmL,cplcFvFecHmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFeFvHmL,cplcFeFvHmR,         & 
& cplcFeFvVWmL,cplcFeFvVWmR,AmpVertexIRosAhTocFeFe)

 End if 
 End if 
AmpVertexAhTocFeFe = AmpVertexAhTocFeFe -  AmpVertexIRdrAhTocFeFe! +  AmpVertexIRosAhTocFeFe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Final State 1 
AmpWaveZAhTocFeFe=0._dp 
AmpVertexZAhTocFeFe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZAhTocFeFe(1,gt2,:) = AmpWaveZAhTocFeFe(1,gt2,:)+ZRUUe(gt2,gt1)*AmpWaveAhTocFeFe(1,gt1,:) 
AmpVertexZAhTocFeFe(1,gt2,:)= AmpVertexZAhTocFeFe(1,gt2,:)+ZRUUe(gt2,gt1)*AmpVertexAhTocFeFe(1,gt1,:) 
AmpWaveZAhTocFeFe(2,gt2,:) = AmpWaveZAhTocFeFe(2,gt2,:)+ZRUVec(gt2,gt1)*AmpWaveAhTocFeFe(2,gt1,:) 
AmpVertexZAhTocFeFe(2,gt2,:)= AmpVertexZAhTocFeFe(2,gt2,:)+ZRUVec(gt2,gt1)*AmpVertexAhTocFeFe(2,gt1,:) 
 End Do 
End Do 
AmpWaveAhTocFeFe=AmpWaveZAhTocFeFe 
AmpVertexAhTocFeFe= AmpVertexZAhTocFeFe
! Final State 2 
AmpWaveZAhTocFeFe=0._dp 
AmpVertexZAhTocFeFe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZAhTocFeFe(1,:,gt2) = AmpWaveZAhTocFeFe(1,:,gt2)+ZRUVe(gt2,gt1)*AmpWaveAhTocFeFe(1,:,gt1) 
AmpVertexZAhTocFeFe(1,:,gt2)= AmpVertexZAhTocFeFe(1,:,gt2)+ZRUVe(gt2,gt1)*AmpVertexAhTocFeFe(1,:,gt1) 
AmpWaveZAhTocFeFe(2,:,gt2) = AmpWaveZAhTocFeFe(2,:,gt2)+ZRUUe(gt2,gt1)*AmpWaveAhTocFeFe(2,:,gt1) 
AmpVertexZAhTocFeFe(2,:,gt2)= AmpVertexZAhTocFeFe(2,:,gt2)+ZRUUe(gt2,gt1)*AmpVertexAhTocFeFe(2,:,gt1) 
 End Do 
End Do 
AmpWaveAhTocFeFe=AmpWaveZAhTocFeFe 
AmpVertexAhTocFeFe= AmpVertexZAhTocFeFe
End if
If (ShiftIRdiv) Then 
AmpVertexAhTocFeFe = AmpVertexAhTocFeFe  +  AmpVertexIRosAhTocFeFe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->bar[Fe] Fe -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTocFeFe = AmpTreeAhTocFeFe 
 AmpSum2AhTocFeFe = AmpTreeAhTocFeFe + 2._dp*AmpWaveAhTocFeFe + 2._dp*AmpVertexAhTocFeFe  
Else 
 AmpSumAhTocFeFe = AmpTreeAhTocFeFe + AmpWaveAhTocFeFe + AmpVertexAhTocFeFe
 AmpSum2AhTocFeFe = AmpTreeAhTocFeFe + AmpWaveAhTocFeFe + AmpVertexAhTocFeFe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTocFeFe = AmpTreeAhTocFeFe
 AmpSum2AhTocFeFe = AmpTreeAhTocFeFe 
End if 
gt1=1 
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(MAhOS.gt.(MFeOS(gt2)+MFeOS(gt3)))).or.((.not.OSkinematics).and.(MAh.gt.(MFe(gt2)+MFe(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt2, gt3 
  AmpSum2AhTocFeFe = AmpTreeAhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS,MFeOS(gt2),MFeOS(gt3),AmpSumAhTocFeFe(:,gt2, gt3),AmpSum2AhTocFeFe(:,gt2, gt3),AmpSqAhTocFeFe(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh,MFe(gt2),MFe(gt3),AmpSumAhTocFeFe(:,gt2, gt3),AmpSum2AhTocFeFe(:,gt2, gt3),AmpSqAhTocFeFe(gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTocFeFe(gt2, gt3) 
  AmpSum2AhTocFeFe = 2._dp*AmpWaveAhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS,MFeOS(gt2),MFeOS(gt3),AmpSumAhTocFeFe(:,gt2, gt3),AmpSum2AhTocFeFe(:,gt2, gt3),AmpSqAhTocFeFe(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh,MFe(gt2),MFe(gt3),AmpSumAhTocFeFe(:,gt2, gt3),AmpSum2AhTocFeFe(:,gt2, gt3),AmpSqAhTocFeFe(gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTocFeFe(gt2, gt3) 
  AmpSum2AhTocFeFe = 2._dp*AmpVertexAhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS,MFeOS(gt2),MFeOS(gt3),AmpSumAhTocFeFe(:,gt2, gt3),AmpSum2AhTocFeFe(:,gt2, gt3),AmpSqAhTocFeFe(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh,MFe(gt2),MFe(gt3),AmpSumAhTocFeFe(:,gt2, gt3),AmpSum2AhTocFeFe(:,gt2, gt3),AmpSqAhTocFeFe(gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTocFeFe(gt2, gt3) 
  AmpSum2AhTocFeFe = AmpTreeAhTocFeFe + 2._dp*AmpWaveAhTocFeFe + 2._dp*AmpVertexAhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS,MFeOS(gt2),MFeOS(gt3),AmpSumAhTocFeFe(:,gt2, gt3),AmpSum2AhTocFeFe(:,gt2, gt3),AmpSqAhTocFeFe(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh,MFe(gt2),MFe(gt3),AmpSumAhTocFeFe(:,gt2, gt3),AmpSum2AhTocFeFe(:,gt2, gt3),AmpSqAhTocFeFe(gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTocFeFe(gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTocFeFe = AmpTreeAhTocFeFe
  Call SquareAmp_StoFF(MAhOS,MFeOS(gt2),MFeOS(gt3),AmpSumAhTocFeFe(:,gt2, gt3),AmpSum2AhTocFeFe(:,gt2, gt3),AmpSqAhTocFeFe(gt2, gt3)) 
  AmpSqTreeAhTocFeFe(gt2, gt3) = AmpSqAhTocFeFe(gt2, gt3)  
  AmpSum2AhTocFeFe = + 2._dp*AmpWaveAhTocFeFe + 2._dp*AmpVertexAhTocFeFe
  Call SquareAmp_StoFF(MAhOS,MFeOS(gt2),MFeOS(gt3),AmpSumAhTocFeFe(:,gt2, gt3),AmpSum2AhTocFeFe(:,gt2, gt3),AmpSqAhTocFeFe(gt2, gt3)) 
  AmpSqAhTocFeFe(gt2, gt3) = AmpSqAhTocFeFe(gt2, gt3) + AmpSqTreeAhTocFeFe(gt2, gt3)  
Else  
  AmpSum2AhTocFeFe = AmpTreeAhTocFeFe
  Call SquareAmp_StoFF(MAh,MFe(gt2),MFe(gt3),AmpSumAhTocFeFe(:,gt2, gt3),AmpSum2AhTocFeFe(:,gt2, gt3),AmpSqAhTocFeFe(gt2, gt3)) 
  AmpSqTreeAhTocFeFe(gt2, gt3) = AmpSqAhTocFeFe(gt2, gt3)  
  AmpSum2AhTocFeFe = + 2._dp*AmpWaveAhTocFeFe + 2._dp*AmpVertexAhTocFeFe
  Call SquareAmp_StoFF(MAh,MFe(gt2),MFe(gt3),AmpSumAhTocFeFe(:,gt2, gt3),AmpSum2AhTocFeFe(:,gt2, gt3),AmpSqAhTocFeFe(gt2, gt3)) 
  AmpSqAhTocFeFe(gt2, gt3) = AmpSqAhTocFeFe(gt2, gt3) + AmpSqTreeAhTocFeFe(gt2, gt3)  
End if  
Else  
  AmpSqAhTocFeFe(gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqAhTocFeFe(gt2, gt3).le.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS,MFeOS(gt2),MFeOS(gt3),helfactor*AmpSqAhTocFeFe(gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh,MFe(gt2),MFe(gt3),helfactor*AmpSqAhTocFeFe(gt2, gt3))
End if 
If ((Abs(MRPAhTocFeFe(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocFeFe(gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTocFeFe(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocFeFe(gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTocFeFe(gt2, gt3) + MRGAhTocFeFe(gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTocFeFe(gt2, gt3) + MRGAhTocFeFe(gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
isave = i4 
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fu) Fu
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_THDMIIIHB_AhTocFuFu(cplcFuFuAhL,cplcFuFuAhR,MAh,MFu,              & 
& MAh2,MFu2,AmpTreeAhTocFuFu)

  Else 
Call Amplitude_Tree_THDMIIIHB_AhTocFuFu(ZcplcFuFuAhL,ZcplcFuFuAhR,MAh,MFu,            & 
& MAh2,MFu2,AmpTreeAhTocFuFu)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_THDMIIIHB_AhTocFuFu(MLambda,em,gs,cplcFuFuAhL,cplcFuFuAhR,            & 
& MAhOS,MFuOS,MRPAhTocFuFu,MRGAhTocFuFu)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_THDMIIIHB_AhTocFuFu(MLambda,em,gs,ZcplcFuFuAhL,ZcplcFuFuAhR,          & 
& MAhOS,MFuOS,MRPAhTocFuFu,MRGAhTocFuFu)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_THDMIIIHB_AhTocFuFu(MLambda,em,gs,cplcFuFuAhL,cplcFuFuAhR,            & 
& MAh,MFu,MRPAhTocFuFu,MRGAhTocFuFu)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_THDMIIIHB_AhTocFuFu(MLambda,em,gs,ZcplcFuFuAhL,ZcplcFuFuAhR,          & 
& MAh,MFu,MRPAhTocFuFu,MRGAhTocFuFu)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_THDMIIIHB_AhTocFuFu(cplcFuFuAhL,cplcFuFuAhR,ctcplcFuFuAhL,        & 
& ctcplcFuFuAhR,MAh,MAh2,MFu,MFu2,ZfAh,ZfUL,ZfUR,AmpWaveAhTocFuFu)



!Vertex Corrections 
Call Amplitude_VERTEX_THDMIIIHB_AhTocFuFu(MAh,MFd,MFu,Mhh,MHm,Msigma1,MVG,            & 
& MVP,MVWm,MVZ,MAh2,MFd2,MFu2,Mhh2,MHm2,Msigma12,MVG2,MVP2,MVWm2,MVZ2,cplAhAhAh,         & 
& cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,            & 
& cplAhcHmVWm,cplcFuFdcHmL,cplcFuFdcHmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,         & 
& cplcFuFuhhR,cplcFdFuHmL,cplcFdFuHmR,cplcFuFusigma1L,cplcFuFusigma1R,cplcFuFuVGL,       & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,AmpVertexAhTocFuFu)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTocFuFu(MAh,MFd,MFu,Mhh,MHm,Msigma1,             & 
& MVG,MVP,MVWm,MVZ,MAh2,MFd2,MFu2,Mhh2,MHm2,Msigma12,MVG2,MVP2,MVWm2,MVZ2,               & 
& cplAhAhAh,cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,     & 
& cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,            & 
& cplAhcHmVWm,cplcFuFdcHmL,cplcFuFdcHmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,         & 
& cplcFuFuhhR,cplcFdFuHmL,cplcFdFuHmR,cplcFuFusigma1L,cplcFuFusigma1R,cplcFuFuVGL,       & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,AmpVertexIRdrAhTocFuFu)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTocFuFu(MAhOS,MFdOS,MFuOS,MhhOS,MHmOS,           & 
& Msigma1OS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,Msigma12OS,          & 
& MVG2,MVP2,MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,    & 
& ZcplcFuFuAhL,ZcplcFuFuAhR,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,    & 
& cplAhsigma1sigma1,cplAhcHmVWm,cplcFuFdcHmL,cplcFuFdcHmR,cplcFuFdcVWmL,cplcFuFdcVWmR,   & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHmL,cplcFdFuHmR,cplcFuFusigma1L,cplcFuFusigma1R,       & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplcFuFuVZL,cplcFuFuVZR,AmpVertexIRosAhTocFuFu)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTocFuFu(MAh,MFd,MFu,Mhh,MHm,Msigma1,             & 
& MVG,MVP,MVWm,MVZ,MAh2,MFd2,MFu2,Mhh2,MHm2,Msigma12,MVG2,MVP2,MVWm2,MVZ2,               & 
& cplAhAhAh,cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,ZcplcFuFuAhL,ZcplcFuFuAhR,   & 
& cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,            & 
& cplAhcHmVWm,cplcFuFdcHmL,cplcFuFdcHmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,         & 
& cplcFuFuhhR,cplcFdFuHmL,cplcFdFuHmR,cplcFuFusigma1L,cplcFuFusigma1R,cplcFuFuVGL,       & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,AmpVertexIRosAhTocFuFu)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTocFuFu(MAhOS,MFdOS,MFuOS,MhhOS,MHmOS,           & 
& Msigma1OS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,Msigma12OS,          & 
& MVG2,MVP2,MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,    & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,      & 
& cplAhsigma1sigma1,cplAhcHmVWm,cplcFuFdcHmL,cplcFuFdcHmR,cplcFuFdcVWmL,cplcFuFdcVWmR,   & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHmL,cplcFdFuHmR,cplcFuFusigma1L,cplcFuFusigma1R,       & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplcFuFuVZL,cplcFuFuVZR,AmpVertexIRosAhTocFuFu)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTocFuFu(MAh,MFd,MFu,Mhh,MHm,Msigma1,             & 
& MVG,MVP,MVWm,MVZ,MAh2,MFd2,MFu2,Mhh2,MHm2,Msigma12,MVG2,MVP2,MVWm2,MVZ2,               & 
& cplAhAhAh,cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,     & 
& cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,            & 
& cplAhcHmVWm,cplcFuFdcHmL,cplcFuFdcHmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,         & 
& cplcFuFuhhR,cplcFdFuHmL,cplcFdFuHmR,cplcFuFusigma1L,cplcFuFusigma1R,cplcFuFuVGL,       & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,AmpVertexIRosAhTocFuFu)

 End if 
 End if 
AmpVertexAhTocFuFu = AmpVertexAhTocFuFu -  AmpVertexIRdrAhTocFuFu! +  AmpVertexIRosAhTocFuFu ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Final State 1 
AmpWaveZAhTocFuFu=0._dp 
AmpVertexZAhTocFuFu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZAhTocFuFu(1,gt2,:) = AmpWaveZAhTocFuFu(1,gt2,:)+ZRUUu(gt2,gt1)*AmpWaveAhTocFuFu(1,gt1,:) 
AmpVertexZAhTocFuFu(1,gt2,:)= AmpVertexZAhTocFuFu(1,gt2,:)+ZRUUu(gt2,gt1)*AmpVertexAhTocFuFu(1,gt1,:) 
AmpWaveZAhTocFuFu(2,gt2,:) = AmpWaveZAhTocFuFu(2,gt2,:)+ZRUVuc(gt2,gt1)*AmpWaveAhTocFuFu(2,gt1,:) 
AmpVertexZAhTocFuFu(2,gt2,:)= AmpVertexZAhTocFuFu(2,gt2,:)+ZRUVuc(gt2,gt1)*AmpVertexAhTocFuFu(2,gt1,:) 
 End Do 
End Do 
AmpWaveAhTocFuFu=AmpWaveZAhTocFuFu 
AmpVertexAhTocFuFu= AmpVertexZAhTocFuFu
! Final State 2 
AmpWaveZAhTocFuFu=0._dp 
AmpVertexZAhTocFuFu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZAhTocFuFu(1,:,gt2) = AmpWaveZAhTocFuFu(1,:,gt2)+ZRUVu(gt2,gt1)*AmpWaveAhTocFuFu(1,:,gt1) 
AmpVertexZAhTocFuFu(1,:,gt2)= AmpVertexZAhTocFuFu(1,:,gt2)+ZRUVu(gt2,gt1)*AmpVertexAhTocFuFu(1,:,gt1) 
AmpWaveZAhTocFuFu(2,:,gt2) = AmpWaveZAhTocFuFu(2,:,gt2)+ZRUUu(gt2,gt1)*AmpWaveAhTocFuFu(2,:,gt1) 
AmpVertexZAhTocFuFu(2,:,gt2)= AmpVertexZAhTocFuFu(2,:,gt2)+ZRUUu(gt2,gt1)*AmpVertexAhTocFuFu(2,:,gt1) 
 End Do 
End Do 
AmpWaveAhTocFuFu=AmpWaveZAhTocFuFu 
AmpVertexAhTocFuFu= AmpVertexZAhTocFuFu
End if
If (ShiftIRdiv) Then 
AmpVertexAhTocFuFu = AmpVertexAhTocFuFu  +  AmpVertexIRosAhTocFuFu
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->bar[Fu] Fu -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTocFuFu = AmpTreeAhTocFuFu 
 AmpSum2AhTocFuFu = AmpTreeAhTocFuFu + 2._dp*AmpWaveAhTocFuFu + 2._dp*AmpVertexAhTocFuFu  
Else 
 AmpSumAhTocFuFu = AmpTreeAhTocFuFu + AmpWaveAhTocFuFu + AmpVertexAhTocFuFu
 AmpSum2AhTocFuFu = AmpTreeAhTocFuFu + AmpWaveAhTocFuFu + AmpVertexAhTocFuFu 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTocFuFu = AmpTreeAhTocFuFu
 AmpSum2AhTocFuFu = AmpTreeAhTocFuFu 
End if 
gt1=1 
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(MAhOS.gt.(MFuOS(gt2)+MFuOS(gt3)))).or.((.not.OSkinematics).and.(MAh.gt.(MFu(gt2)+MFu(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt2, gt3 
  AmpSum2AhTocFuFu = AmpTreeAhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS,MFuOS(gt2),MFuOS(gt3),AmpSumAhTocFuFu(:,gt2, gt3),AmpSum2AhTocFuFu(:,gt2, gt3),AmpSqAhTocFuFu(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh,MFu(gt2),MFu(gt3),AmpSumAhTocFuFu(:,gt2, gt3),AmpSum2AhTocFuFu(:,gt2, gt3),AmpSqAhTocFuFu(gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTocFuFu(gt2, gt3) 
  AmpSum2AhTocFuFu = 2._dp*AmpWaveAhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS,MFuOS(gt2),MFuOS(gt3),AmpSumAhTocFuFu(:,gt2, gt3),AmpSum2AhTocFuFu(:,gt2, gt3),AmpSqAhTocFuFu(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh,MFu(gt2),MFu(gt3),AmpSumAhTocFuFu(:,gt2, gt3),AmpSum2AhTocFuFu(:,gt2, gt3),AmpSqAhTocFuFu(gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTocFuFu(gt2, gt3) 
  AmpSum2AhTocFuFu = 2._dp*AmpVertexAhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS,MFuOS(gt2),MFuOS(gt3),AmpSumAhTocFuFu(:,gt2, gt3),AmpSum2AhTocFuFu(:,gt2, gt3),AmpSqAhTocFuFu(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh,MFu(gt2),MFu(gt3),AmpSumAhTocFuFu(:,gt2, gt3),AmpSum2AhTocFuFu(:,gt2, gt3),AmpSqAhTocFuFu(gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTocFuFu(gt2, gt3) 
  AmpSum2AhTocFuFu = AmpTreeAhTocFuFu + 2._dp*AmpWaveAhTocFuFu + 2._dp*AmpVertexAhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS,MFuOS(gt2),MFuOS(gt3),AmpSumAhTocFuFu(:,gt2, gt3),AmpSum2AhTocFuFu(:,gt2, gt3),AmpSqAhTocFuFu(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh,MFu(gt2),MFu(gt3),AmpSumAhTocFuFu(:,gt2, gt3),AmpSum2AhTocFuFu(:,gt2, gt3),AmpSqAhTocFuFu(gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTocFuFu(gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTocFuFu = AmpTreeAhTocFuFu
  Call SquareAmp_StoFF(MAhOS,MFuOS(gt2),MFuOS(gt3),AmpSumAhTocFuFu(:,gt2, gt3),AmpSum2AhTocFuFu(:,gt2, gt3),AmpSqAhTocFuFu(gt2, gt3)) 
  AmpSqTreeAhTocFuFu(gt2, gt3) = AmpSqAhTocFuFu(gt2, gt3)  
  AmpSum2AhTocFuFu = + 2._dp*AmpWaveAhTocFuFu + 2._dp*AmpVertexAhTocFuFu
  Call SquareAmp_StoFF(MAhOS,MFuOS(gt2),MFuOS(gt3),AmpSumAhTocFuFu(:,gt2, gt3),AmpSum2AhTocFuFu(:,gt2, gt3),AmpSqAhTocFuFu(gt2, gt3)) 
  AmpSqAhTocFuFu(gt2, gt3) = AmpSqAhTocFuFu(gt2, gt3) + AmpSqTreeAhTocFuFu(gt2, gt3)  
Else  
  AmpSum2AhTocFuFu = AmpTreeAhTocFuFu
  Call SquareAmp_StoFF(MAh,MFu(gt2),MFu(gt3),AmpSumAhTocFuFu(:,gt2, gt3),AmpSum2AhTocFuFu(:,gt2, gt3),AmpSqAhTocFuFu(gt2, gt3)) 
  AmpSqTreeAhTocFuFu(gt2, gt3) = AmpSqAhTocFuFu(gt2, gt3)  
  AmpSum2AhTocFuFu = + 2._dp*AmpWaveAhTocFuFu + 2._dp*AmpVertexAhTocFuFu
  Call SquareAmp_StoFF(MAh,MFu(gt2),MFu(gt3),AmpSumAhTocFuFu(:,gt2, gt3),AmpSum2AhTocFuFu(:,gt2, gt3),AmpSqAhTocFuFu(gt2, gt3)) 
  AmpSqAhTocFuFu(gt2, gt3) = AmpSqAhTocFuFu(gt2, gt3) + AmpSqTreeAhTocFuFu(gt2, gt3)  
End if  
Else  
  AmpSqAhTocFuFu(gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqAhTocFuFu(gt2, gt3).le.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 3._dp*GammaTPS(MAhOS,MFuOS(gt2),MFuOS(gt3),helfactor*AmpSqAhTocFuFu(gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 3._dp*GammaTPS(MAh,MFu(gt2),MFu(gt3),helfactor*AmpSqAhTocFuFu(gt2, gt3))
End if 
If ((Abs(MRPAhTocFuFu(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocFuFu(gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTocFuFu(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocFuFu(gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTocFuFu(gt2, gt3) + MRGAhTocFuFu(gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTocFuFu(gt2, gt3) + MRGAhTocFuFu(gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
isave = i4 
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! hh hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_THDMIIIHB_AhTohhhh(cplAhhhhh,MAh,Mhh,MAh2,Mhh2,AmpTreeAhTohhhh)

  Else 
Call Amplitude_Tree_THDMIIIHB_AhTohhhh(ZcplAhhhhh,MAh,Mhh,MAh2,Mhh2,AmpTreeAhTohhhh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_THDMIIIHB_AhTohhhh(MLambda,em,gs,cplAhhhhh,MAhOS,MhhOS,               & 
& MRPAhTohhhh,MRGAhTohhhh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_THDMIIIHB_AhTohhhh(MLambda,em,gs,ZcplAhhhhh,MAhOS,MhhOS,              & 
& MRPAhTohhhh,MRGAhTohhhh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_THDMIIIHB_AhTohhhh(MLambda,em,gs,cplAhhhhh,MAh,Mhh,MRPAhTohhhh,       & 
& MRGAhTohhhh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_THDMIIIHB_AhTohhhh(MLambda,em,gs,ZcplAhhhhh,MAh,Mhh,MRPAhTohhhh,      & 
& MRGAhTohhhh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_THDMIIIHB_AhTohhhh(cplAhhhhh,ctcplAhhhhh,MAh,MAh2,Mhh,            & 
& Mhh2,ZfAh,Zfhh,AmpWaveAhTohhhh)



!Vertex Corrections 
Call Amplitude_VERTEX_THDMIIIHB_AhTohhhh(MAh,MFd,MFe,MFu,Mhh,MHm,Msigma1,             & 
& MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,        & 
& cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,             & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,             & 
& cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFdFdhhL,cplcFdFdhhR,          & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWmgWmhh,cplcgWpCgWpChh,           & 
& cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,        & 
& cplhhcHmVWm,cplhhcVWmVWm,cplAhAhAhhh1,cplAhAhhhhh1,cplAhAhhhsigma11,cplAhhhhhhh1,      & 
& cplAhhhhhsigma11,cplAhhhHmcHm1,cplAhhhsigma1sigma11,cplhhhhhhhh1,cplhhhhhhsigma11,     & 
& cplhhhhHmcHm1,cplhhhhsigma1sigma11,AmpVertexAhTohhhh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTohhhh(MAh,MFd,MFe,MFu,Mhh,MHm,Msigma1,          & 
& MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,        & 
& cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,             & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,             & 
& cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFdFdhhL,cplcFdFdhhR,          & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWmgWmhh,cplcgWpCgWpChh,           & 
& cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,        & 
& cplhhcHmVWm,cplhhcVWmVWm,cplAhAhAhhh1,cplAhAhhhhh1,cplAhAhhhsigma11,cplAhhhhhhh1,      & 
& cplAhhhhhsigma11,cplAhhhHmcHm1,cplAhhhsigma1sigma11,cplhhhhhhhh1,cplhhhhhhsigma11,     & 
& cplhhhhHmcHm1,cplhhhhsigma1sigma11,AmpVertexIRdrAhTohhhh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTohhhh(MAhOS,MFdOS,MFeOS,MFuOS,MhhOS,            & 
& MHmOS,Msigma1OS,MVWmOS,MVZOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,Msigma12OS,     & 
& MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& ZcplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,           & 
& cplAhcHmVWm,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,            & 
& cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,cplhhcHmVWm,cplhhcVWmVWm,cplAhAhAhhh1,     & 
& cplAhAhhhhh1,cplAhAhhhsigma11,cplAhhhhhhh1,cplAhhhhhsigma11,cplAhhhHmcHm1,             & 
& cplAhhhsigma1sigma11,cplhhhhhhhh1,cplhhhhhhsigma11,cplhhhhHmcHm1,cplhhhhsigma1sigma11, & 
& AmpVertexIRosAhTohhhh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTohhhh(MAh,MFd,MFe,MFu,Mhh,MHm,Msigma1,          & 
& MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,        & 
& cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,             & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,ZcplAhhhhh,cplAhhhsigma1,cplAhhhVZ,            & 
& cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFdFdhhL,cplcFdFdhhR,          & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWmgWmhh,cplcgWpCgWpChh,           & 
& cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,        & 
& cplhhcHmVWm,cplhhcVWmVWm,cplAhAhAhhh1,cplAhAhhhhh1,cplAhAhhhsigma11,cplAhhhhhhh1,      & 
& cplAhhhhhsigma11,cplAhhhHmcHm1,cplAhhhsigma1sigma11,cplhhhhhhhh1,cplhhhhhhsigma11,     & 
& cplhhhhHmcHm1,cplhhhhsigma1sigma11,AmpVertexIRosAhTohhhh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTohhhh(MAhOS,MFdOS,MFeOS,MFuOS,MhhOS,            & 
& MHmOS,Msigma1OS,MVWmOS,MVZOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,Msigma12OS,     & 
& MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,            & 
& cplAhcHmVWm,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,            & 
& cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,cplhhcHmVWm,cplhhcVWmVWm,cplAhAhAhhh1,     & 
& cplAhAhhhhh1,cplAhAhhhsigma11,cplAhhhhhhh1,cplAhhhhhsigma11,cplAhhhHmcHm1,             & 
& cplAhhhsigma1sigma11,cplhhhhhhhh1,cplhhhhhhsigma11,cplhhhhHmcHm1,cplhhhhsigma1sigma11, & 
& AmpVertexIRosAhTohhhh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTohhhh(MAh,MFd,MFe,MFu,Mhh,MHm,Msigma1,          & 
& MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,        & 
& cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,             & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,             & 
& cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFdFdhhL,cplcFdFdhhR,          & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWmgWmhh,cplcgWpCgWpChh,           & 
& cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,        & 
& cplhhcHmVWm,cplhhcVWmVWm,cplAhAhAhhh1,cplAhAhhhhh1,cplAhAhhhsigma11,cplAhhhhhhh1,      & 
& cplAhhhhhsigma11,cplAhhhHmcHm1,cplAhhhsigma1sigma11,cplhhhhhhhh1,cplhhhhhhsigma11,     & 
& cplhhhhHmcHm1,cplhhhhsigma1sigma11,AmpVertexIRosAhTohhhh)

 End if 
 End if 
AmpVertexAhTohhhh = AmpVertexAhTohhhh -  AmpVertexIRdrAhTohhhh! +  AmpVertexIRosAhTohhhh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Final State 1 
AmpWaveZAhTohhhh=0._dp 
AmpVertexZAhTohhhh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZAhTohhhh(gt2,:) = AmpWaveZAhTohhhh(gt2,:)+ZRUZH(gt2,gt1)*AmpWaveAhTohhhh(gt1,:) 
AmpVertexZAhTohhhh(gt2,:)= AmpVertexZAhTohhhh(gt2,:)+ZRUZH(gt2,gt1)*AmpVertexAhTohhhh(gt1,:) 
 End Do 
End Do 
AmpWaveAhTohhhh=AmpWaveZAhTohhhh 
AmpVertexAhTohhhh= AmpVertexZAhTohhhh
! Final State 2 
AmpWaveZAhTohhhh=0._dp 
AmpVertexZAhTohhhh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZAhTohhhh(:,gt2) = AmpWaveZAhTohhhh(:,gt2)+ZRUZH(gt2,gt1)*AmpWaveAhTohhhh(:,gt1) 
AmpVertexZAhTohhhh(:,gt2)= AmpVertexZAhTohhhh(:,gt2)+ZRUZH(gt2,gt1)*AmpVertexAhTohhhh(:,gt1) 
 End Do 
End Do 
AmpWaveAhTohhhh=AmpWaveZAhTohhhh 
AmpVertexAhTohhhh= AmpVertexZAhTohhhh
End if
If (ShiftIRdiv) Then 
AmpVertexAhTohhhh = AmpVertexAhTohhhh  +  AmpVertexIRosAhTohhhh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->hh hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTohhhh = AmpTreeAhTohhhh 
 AmpSum2AhTohhhh = AmpTreeAhTohhhh + 2._dp*AmpWaveAhTohhhh + 2._dp*AmpVertexAhTohhhh  
Else 
 AmpSumAhTohhhh = AmpTreeAhTohhhh + AmpWaveAhTohhhh + AmpVertexAhTohhhh
 AmpSum2AhTohhhh = AmpTreeAhTohhhh + AmpWaveAhTohhhh + AmpVertexAhTohhhh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTohhhh = AmpTreeAhTohhhh
 AmpSum2AhTohhhh = AmpTreeAhTohhhh 
End if 
gt1=1 
i4 = isave 
  Do gt2=1,2
    Do gt3=gt2,2
If (((OSkinematics).and.(MAhOS.gt.(MhhOS(gt2)+MhhOS(gt3)))).or.((.not.OSkinematics).and.(MAh.gt.(Mhh(gt2)+Mhh(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt2, gt3 
  AmpSum2AhTohhhh = AmpTreeAhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS,MhhOS(gt2),MhhOS(gt3),AmpSumAhTohhhh(gt2, gt3),AmpSum2AhTohhhh(gt2, gt3),AmpSqAhTohhhh(gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh,Mhh(gt2),Mhh(gt3),AmpSumAhTohhhh(gt2, gt3),AmpSum2AhTohhhh(gt2, gt3),AmpSqAhTohhhh(gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTohhhh(gt2, gt3) 
  AmpSum2AhTohhhh = 2._dp*AmpWaveAhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS,MhhOS(gt2),MhhOS(gt3),AmpSumAhTohhhh(gt2, gt3),AmpSum2AhTohhhh(gt2, gt3),AmpSqAhTohhhh(gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh,Mhh(gt2),Mhh(gt3),AmpSumAhTohhhh(gt2, gt3),AmpSum2AhTohhhh(gt2, gt3),AmpSqAhTohhhh(gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTohhhh(gt2, gt3) 
  AmpSum2AhTohhhh = 2._dp*AmpVertexAhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS,MhhOS(gt2),MhhOS(gt3),AmpSumAhTohhhh(gt2, gt3),AmpSum2AhTohhhh(gt2, gt3),AmpSqAhTohhhh(gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh,Mhh(gt2),Mhh(gt3),AmpSumAhTohhhh(gt2, gt3),AmpSum2AhTohhhh(gt2, gt3),AmpSqAhTohhhh(gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTohhhh(gt2, gt3) 
  AmpSum2AhTohhhh = AmpTreeAhTohhhh + 2._dp*AmpWaveAhTohhhh + 2._dp*AmpVertexAhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS,MhhOS(gt2),MhhOS(gt3),AmpSumAhTohhhh(gt2, gt3),AmpSum2AhTohhhh(gt2, gt3),AmpSqAhTohhhh(gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh,Mhh(gt2),Mhh(gt3),AmpSumAhTohhhh(gt2, gt3),AmpSum2AhTohhhh(gt2, gt3),AmpSqAhTohhhh(gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTohhhh(gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTohhhh = AmpTreeAhTohhhh
  Call SquareAmp_StoSS(MAhOS,MhhOS(gt2),MhhOS(gt3),AmpSumAhTohhhh(gt2, gt3),AmpSum2AhTohhhh(gt2, gt3),AmpSqAhTohhhh(gt2, gt3)) 
  AmpSqTreeAhTohhhh(gt2, gt3) = AmpSqAhTohhhh(gt2, gt3)  
  AmpSum2AhTohhhh = + 2._dp*AmpWaveAhTohhhh + 2._dp*AmpVertexAhTohhhh
  Call SquareAmp_StoSS(MAhOS,MhhOS(gt2),MhhOS(gt3),AmpSumAhTohhhh(gt2, gt3),AmpSum2AhTohhhh(gt2, gt3),AmpSqAhTohhhh(gt2, gt3)) 
  AmpSqAhTohhhh(gt2, gt3) = AmpSqAhTohhhh(gt2, gt3) + AmpSqTreeAhTohhhh(gt2, gt3)  
Else  
  AmpSum2AhTohhhh = AmpTreeAhTohhhh
  Call SquareAmp_StoSS(MAh,Mhh(gt2),Mhh(gt3),AmpSumAhTohhhh(gt2, gt3),AmpSum2AhTohhhh(gt2, gt3),AmpSqAhTohhhh(gt2, gt3)) 
  AmpSqTreeAhTohhhh(gt2, gt3) = AmpSqAhTohhhh(gt2, gt3)  
  AmpSum2AhTohhhh = + 2._dp*AmpWaveAhTohhhh + 2._dp*AmpVertexAhTohhhh
  Call SquareAmp_StoSS(MAh,Mhh(gt2),Mhh(gt3),AmpSumAhTohhhh(gt2, gt3),AmpSum2AhTohhhh(gt2, gt3),AmpSqAhTohhhh(gt2, gt3)) 
  AmpSqAhTohhhh(gt2, gt3) = AmpSqAhTohhhh(gt2, gt3) + AmpSqTreeAhTohhhh(gt2, gt3)  
End if  
Else  
  AmpSqAhTohhhh(gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqAhTohhhh(gt2, gt3).le.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAhOS,MhhOS(gt2),MhhOS(gt3),helfactor*AmpSqAhTohhhh(gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAh,Mhh(gt2),Mhh(gt3),helfactor*AmpSqAhTohhhh(gt2, gt3))
End if 
If ((Abs(MRPAhTohhhh(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhhh(gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTohhhh(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhhh(gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPAhTohhhh(gt2, gt3) + MRGAhTohhhh(gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPAhTohhhh(gt2, gt3) + MRGAhTohhhh(gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
isave = i4 
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! hh VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_THDMIIIHB_AhTohhVZ(cplAhhhVZ,MAh,Mhh,MVZ,MAh2,Mhh2,               & 
& MVZ2,AmpTreeAhTohhVZ)

  Else 
Call Amplitude_Tree_THDMIIIHB_AhTohhVZ(ZcplAhhhVZ,MAh,Mhh,MVZ,MAh2,Mhh2,              & 
& MVZ2,AmpTreeAhTohhVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_THDMIIIHB_AhTohhVZ(MLambda,em,gs,cplAhhhVZ,MAhOS,MhhOS,               & 
& MVZOS,MRPAhTohhVZ,MRGAhTohhVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_THDMIIIHB_AhTohhVZ(MLambda,em,gs,ZcplAhhhVZ,MAhOS,MhhOS,              & 
& MVZOS,MRPAhTohhVZ,MRGAhTohhVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_THDMIIIHB_AhTohhVZ(MLambda,em,gs,cplAhhhVZ,MAh,Mhh,MVZ,               & 
& MRPAhTohhVZ,MRGAhTohhVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_THDMIIIHB_AhTohhVZ(MLambda,em,gs,ZcplAhhhVZ,MAh,Mhh,MVZ,              & 
& MRPAhTohhVZ,MRGAhTohhVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_THDMIIIHB_AhTohhVZ(cplAhhhVZ,ctcplAhhhVZ,MAh,MAh2,Mhh,            & 
& Mhh2,MVZ,MVZ2,ZfAh,Zfhh,ZfVZ,AmpWaveAhTohhVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_THDMIIIHB_AhTohhVZ(MAh,MFd,MFe,MFu,Mhh,MHm,Msigma1,             & 
& MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,        & 
& cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,             & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,             & 
& cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFdFdhhL,cplcFdFdhhR,          & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVZ,             & 
& cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,          & 
& cplhhsigma1sigma1,cplhhsigma1VZ,cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHmcHmVZ,         & 
& cplHmcVWmVZ,cplcHmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplAhHmcVWmVZ1,cplAhcHmVWmVZ1,       & 
& cplhhhhVZVZ1,cplhhHmcVWmVZ1,cplhhcHmVWmVZ1,AmpVertexAhTohhVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTohhVZ(MAh,MFd,MFe,MFu,Mhh,MHm,Msigma1,          & 
& MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,        & 
& cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,             & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,             & 
& cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFdFdhhL,cplcFdFdhhR,          & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVZ,             & 
& cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,          & 
& cplhhsigma1sigma1,cplhhsigma1VZ,cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHmcHmVZ,         & 
& cplHmcVWmVZ,cplcHmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplAhHmcVWmVZ1,cplAhcHmVWmVZ1,       & 
& cplhhhhVZVZ1,cplhhHmcVWmVZ1,cplhhcHmVWmVZ1,AmpVertexIRdrAhTohhVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTohhVZ(MAhOS,MFdOS,MFeOS,MFuOS,MhhOS,            & 
& MHmOS,Msigma1OS,MVWmOS,MVZOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,Msigma12OS,     & 
& MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhhh,cplAhhhsigma1,ZcplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,           & 
& cplAhcHmVWm,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,               & 
& cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,         & 
& cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,cplhhcHmVWm,      & 
& cplhhcVWmVWm,cplhhVZVZ,cplHmcHmVZ,cplHmcVWmVZ,cplcHmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,   & 
& cplAhHmcVWmVZ1,cplAhcHmVWmVZ1,cplhhhhVZVZ1,cplhhHmcVWmVZ1,cplhhcHmVWmVZ1,              & 
& AmpVertexIRosAhTohhVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTohhVZ(MAh,MFd,MFe,MFu,Mhh,MHm,Msigma1,          & 
& MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,        & 
& cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,             & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,ZcplAhhhVZ,            & 
& cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFdFdhhL,cplcFdFdhhR,          & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVZ,             & 
& cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,          & 
& cplhhsigma1sigma1,cplhhsigma1VZ,cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHmcHmVZ,         & 
& cplHmcVWmVZ,cplcHmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplAhHmcVWmVZ1,cplAhcHmVWmVZ1,       & 
& cplhhhhVZVZ1,cplhhHmcVWmVZ1,cplhhcHmVWmVZ1,AmpVertexIRosAhTohhVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTohhVZ(MAhOS,MFdOS,MFeOS,MFuOS,MhhOS,            & 
& MHmOS,Msigma1OS,MVWmOS,MVZOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,Msigma12OS,     & 
& MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,            & 
& cplAhcHmVWm,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,               & 
& cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,         & 
& cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,cplhhsigma1sigma1,cplhhsigma1VZ,cplhhcHmVWm,      & 
& cplhhcVWmVWm,cplhhVZVZ,cplHmcHmVZ,cplHmcVWmVZ,cplcHmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,   & 
& cplAhHmcVWmVZ1,cplAhcHmVWmVZ1,cplhhhhVZVZ1,cplhhHmcVWmVZ1,cplhhcHmVWmVZ1,              & 
& AmpVertexIRosAhTohhVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTohhVZ(MAh,MFd,MFe,MFu,Mhh,MHm,Msigma1,          & 
& MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,        & 
& cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,             & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,             & 
& cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFdFdhhL,cplcFdFdhhR,          & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVZ,             & 
& cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhhhsigma1,cplhhHmcHm,cplhhHmcVWm,          & 
& cplhhsigma1sigma1,cplhhsigma1VZ,cplhhcHmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHmcHmVZ,         & 
& cplHmcVWmVZ,cplcHmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplAhHmcVWmVZ1,cplAhcHmVWmVZ1,       & 
& cplhhhhVZVZ1,cplhhHmcVWmVZ1,cplhhcHmVWmVZ1,AmpVertexIRosAhTohhVZ)

 End if 
 End if 
AmpVertexAhTohhVZ = AmpVertexAhTohhVZ -  AmpVertexIRdrAhTohhVZ! +  AmpVertexIRosAhTohhVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Final State 1 
AmpWaveZAhTohhVZ=0._dp 
AmpVertexZAhTohhVZ=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZAhTohhVZ(:,gt2) = AmpWaveZAhTohhVZ(:,gt2)+ZRUZH(gt2,gt1)*AmpWaveAhTohhVZ(:,gt1) 
AmpVertexZAhTohhVZ(:,gt2)= AmpVertexZAhTohhVZ(:,gt2)+ZRUZH(gt2,gt1)*AmpVertexAhTohhVZ(:,gt1) 
 End Do 
End Do 
AmpWaveAhTohhVZ=AmpWaveZAhTohhVZ 
AmpVertexAhTohhVZ= AmpVertexZAhTohhVZ
End if
If (ShiftIRdiv) Then 
AmpVertexAhTohhVZ = AmpVertexAhTohhVZ  +  AmpVertexIRosAhTohhVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->hh VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTohhVZ = AmpTreeAhTohhVZ 
 AmpSum2AhTohhVZ = AmpTreeAhTohhVZ + 2._dp*AmpWaveAhTohhVZ + 2._dp*AmpVertexAhTohhVZ  
Else 
 AmpSumAhTohhVZ = AmpTreeAhTohhVZ + AmpWaveAhTohhVZ + AmpVertexAhTohhVZ
 AmpSum2AhTohhVZ = AmpTreeAhTohhVZ + AmpWaveAhTohhVZ + AmpVertexAhTohhVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTohhVZ = AmpTreeAhTohhVZ
 AmpSum2AhTohhVZ = AmpTreeAhTohhVZ 
End if 
gt1=1 
i4 = isave 
  Do gt2=1,2
If (((OSkinematics).and.(MAhOS.gt.(MhhOS(gt2)+MVZOS))).or.((.not.OSkinematics).and.(MAh.gt.(Mhh(gt2)+MVZ)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt2 
  AmpSum2AhTohhVZ = AmpTreeAhTohhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS,MhhOS(gt2),MVZOS,AmpSumAhTohhVZ(:,gt2),AmpSum2AhTohhVZ(:,gt2),AmpSqAhTohhVZ(gt2)) 
Else  
  Call SquareAmp_StoSV(MAh,Mhh(gt2),MVZ,AmpSumAhTohhVZ(:,gt2),AmpSum2AhTohhVZ(:,gt2),AmpSqAhTohhVZ(gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTohhVZ(gt2) 
  AmpSum2AhTohhVZ = 2._dp*AmpWaveAhTohhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS,MhhOS(gt2),MVZOS,AmpSumAhTohhVZ(:,gt2),AmpSum2AhTohhVZ(:,gt2),AmpSqAhTohhVZ(gt2)) 
Else  
  Call SquareAmp_StoSV(MAh,Mhh(gt2),MVZ,AmpSumAhTohhVZ(:,gt2),AmpSum2AhTohhVZ(:,gt2),AmpSqAhTohhVZ(gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTohhVZ(gt2) 
  AmpSum2AhTohhVZ = 2._dp*AmpVertexAhTohhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS,MhhOS(gt2),MVZOS,AmpSumAhTohhVZ(:,gt2),AmpSum2AhTohhVZ(:,gt2),AmpSqAhTohhVZ(gt2)) 
Else  
  Call SquareAmp_StoSV(MAh,Mhh(gt2),MVZ,AmpSumAhTohhVZ(:,gt2),AmpSum2AhTohhVZ(:,gt2),AmpSqAhTohhVZ(gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTohhVZ(gt2) 
  AmpSum2AhTohhVZ = AmpTreeAhTohhVZ + 2._dp*AmpWaveAhTohhVZ + 2._dp*AmpVertexAhTohhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS,MhhOS(gt2),MVZOS,AmpSumAhTohhVZ(:,gt2),AmpSum2AhTohhVZ(:,gt2),AmpSqAhTohhVZ(gt2)) 
Else  
  Call SquareAmp_StoSV(MAh,Mhh(gt2),MVZ,AmpSumAhTohhVZ(:,gt2),AmpSum2AhTohhVZ(:,gt2),AmpSqAhTohhVZ(gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTohhVZ(gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTohhVZ = AmpTreeAhTohhVZ
  Call SquareAmp_StoSV(MAhOS,MhhOS(gt2),MVZOS,AmpSumAhTohhVZ(:,gt2),AmpSum2AhTohhVZ(:,gt2),AmpSqAhTohhVZ(gt2)) 
  AmpSqTreeAhTohhVZ(gt2) = AmpSqAhTohhVZ(gt2)  
  AmpSum2AhTohhVZ = + 2._dp*AmpWaveAhTohhVZ + 2._dp*AmpVertexAhTohhVZ
  Call SquareAmp_StoSV(MAhOS,MhhOS(gt2),MVZOS,AmpSumAhTohhVZ(:,gt2),AmpSum2AhTohhVZ(:,gt2),AmpSqAhTohhVZ(gt2)) 
  AmpSqAhTohhVZ(gt2) = AmpSqAhTohhVZ(gt2) + AmpSqTreeAhTohhVZ(gt2)  
Else  
  AmpSum2AhTohhVZ = AmpTreeAhTohhVZ
  Call SquareAmp_StoSV(MAh,Mhh(gt2),MVZ,AmpSumAhTohhVZ(:,gt2),AmpSum2AhTohhVZ(:,gt2),AmpSqAhTohhVZ(gt2)) 
  AmpSqTreeAhTohhVZ(gt2) = AmpSqAhTohhVZ(gt2)  
  AmpSum2AhTohhVZ = + 2._dp*AmpWaveAhTohhVZ + 2._dp*AmpVertexAhTohhVZ
  Call SquareAmp_StoSV(MAh,Mhh(gt2),MVZ,AmpSumAhTohhVZ(:,gt2),AmpSum2AhTohhVZ(:,gt2),AmpSqAhTohhVZ(gt2)) 
  AmpSqAhTohhVZ(gt2) = AmpSqAhTohhVZ(gt2) + AmpSqTreeAhTohhVZ(gt2)  
End if  
Else  
  AmpSqAhTohhVZ(gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhTohhVZ(gt2).le.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS,MhhOS(gt2),MVZOS,helfactor*AmpSqAhTohhVZ(gt2))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh,Mhh(gt2),MVZ,helfactor*AmpSqAhTohhVZ(gt2))
End if 
If ((Abs(MRPAhTohhVZ(gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhVZ(gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTohhVZ(gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhVZ(gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPAhTohhVZ(gt2) + MRGAhTohhVZ(gt2)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPAhTohhVZ(gt2) + MRGAhTohhVZ(gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
isave = i4 
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Conjg(Hm) Hm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_THDMIIIHB_AhTocHmHm(cplAhHmcHm,MAh,MHm,MAh2,MHm2,AmpTreeAhTocHmHm)

  Else 
Call Amplitude_Tree_THDMIIIHB_AhTocHmHm(ZcplAhHmcHm,MAh,MHm,MAh2,MHm2,AmpTreeAhTocHmHm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_THDMIIIHB_AhTocHmHm(MLambda,em,gs,cplAhHmcHm,MAhOS,MHmOS,             & 
& MRPAhTocHmHm,MRGAhTocHmHm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_THDMIIIHB_AhTocHmHm(MLambda,em,gs,ZcplAhHmcHm,MAhOS,MHmOS,            & 
& MRPAhTocHmHm,MRGAhTocHmHm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_THDMIIIHB_AhTocHmHm(MLambda,em,gs,cplAhHmcHm,MAh,MHm,MRPAhTocHmHm,    & 
& MRGAhTocHmHm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_THDMIIIHB_AhTocHmHm(MLambda,em,gs,ZcplAhHmcHm,MAh,MHm,MRPAhTocHmHm,   & 
& MRGAhTocHmHm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_THDMIIIHB_AhTocHmHm(cplAhHmcHm,ctcplAhHmcHm,MAh,MAh2,             & 
& MHm,MHm2,ZfAh,ZfHm,AmpWaveAhTocHmHm)



!Vertex Corrections 
Call Amplitude_VERTEX_THDMIIIHB_AhTocHmHm(MAh,MFd,MFe,MFu,Mhh,MHm,Msigma1,            & 
& MVP,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,cplAhAhAh,         & 
& cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,           & 
& cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFuFdcHmL,           & 
& cplcFuFdcHmR,cplcFvFecHmL,cplcFvFecHmR,cplcFdFuHmL,cplcFdFuHmR,cplcFeFvHmL,            & 
& cplcFeFvHmR,cplcgZgWmcHm,cplcgZgWpCHm,cplcgWmgZHm,cplcgWpCgZcHm,cplhhHmcHm,            & 
& cplhhHmcVWm,cplhhcHmVWm,cplHmsigma1cHm,cplHmsigma1cVWm,cplHmcHmVP,cplHmcVWmVP,         & 
& cplHmcHmVZ,cplHmcVWmVZ,cplsigma1cHmVWm,cplcHmVPVWm,cplcHmVWmVZ,cplAhAhHmcHm1,          & 
& cplAhhhHmcHm1,cplAhHmsigma1cHm1,cplAhHmcVWmVP1,cplAhHmcVWmVZ1,cplAhcHmVPVWm1,          & 
& cplAhcHmVWmVZ1,cplhhhhHmcHm1,cplhhHmsigma1cHm1,cplHmHmcHmcHm1,cplHmsigma1sigma1cHm1,   & 
& AmpVertexAhTocHmHm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTocHmHm(MAh,MFd,MFe,MFu,Mhh,MHm,Msigma1,         & 
& MVP,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,cplAhAhAh,         & 
& cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,           & 
& cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFuFdcHmL,           & 
& cplcFuFdcHmR,cplcFvFecHmL,cplcFvFecHmR,cplcFdFuHmL,cplcFdFuHmR,cplcFeFvHmL,            & 
& cplcFeFvHmR,cplcgZgWmcHm,cplcgZgWpCHm,cplcgWmgZHm,cplcgWpCgZcHm,cplhhHmcHm,            & 
& cplhhHmcVWm,cplhhcHmVWm,cplHmsigma1cHm,cplHmsigma1cVWm,cplHmcHmVP,cplHmcVWmVP,         & 
& cplHmcHmVZ,cplHmcVWmVZ,cplsigma1cHmVWm,cplcHmVPVWm,cplcHmVWmVZ,cplAhAhHmcHm1,          & 
& cplAhhhHmcHm1,cplAhHmsigma1cHm1,cplAhHmcVWmVP1,cplAhHmcVWmVZ1,cplAhcHmVPVWm1,          & 
& cplAhcHmVWmVZ1,cplhhhhHmcHm1,cplhhHmsigma1cHm1,cplHmHmcHmcHm1,cplHmsigma1sigma1cHm1,   & 
& AmpVertexIRdrAhTocHmHm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTocHmHm(MAhOS,MFdOS,MFeOS,MFuOS,MhhOS,           & 
& MHmOS,Msigma1OS,MVP,MVWmOS,MVZOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,            & 
& Msigma12OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,ZcplAhHmcHm,cplAhHmcVWm,              & 
& cplAhsigma1sigma1,cplAhcHmVWm,cplcFuFdcHmL,cplcFuFdcHmR,cplcFvFecHmL,cplcFvFecHmR,     & 
& cplcFdFuHmL,cplcFdFuHmR,cplcFeFvHmL,cplcFeFvHmR,cplcgZgWmcHm,cplcgZgWpCHm,             & 
& cplcgWmgZHm,cplcgWpCgZcHm,cplhhHmcHm,cplhhHmcVWm,cplhhcHmVWm,cplHmsigma1cHm,           & 
& cplHmsigma1cVWm,cplHmcHmVP,cplHmcVWmVP,cplHmcHmVZ,cplHmcVWmVZ,cplsigma1cHmVWm,         & 
& cplcHmVPVWm,cplcHmVWmVZ,cplAhAhHmcHm1,cplAhhhHmcHm1,cplAhHmsigma1cHm1,cplAhHmcVWmVP1,  & 
& cplAhHmcVWmVZ1,cplAhcHmVPVWm1,cplAhcHmVWmVZ1,cplhhhhHmcHm1,cplhhHmsigma1cHm1,          & 
& cplHmHmcHmcHm1,cplHmsigma1sigma1cHm1,AmpVertexIRosAhTocHmHm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTocHmHm(MAh,MFd,MFe,MFu,Mhh,MHm,Msigma1,         & 
& MVP,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,cplAhAhAh,         & 
& cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,           & 
& cplAhhhVZ,ZcplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFuFdcHmL,          & 
& cplcFuFdcHmR,cplcFvFecHmL,cplcFvFecHmR,cplcFdFuHmL,cplcFdFuHmR,cplcFeFvHmL,            & 
& cplcFeFvHmR,cplcgZgWmcHm,cplcgZgWpCHm,cplcgWmgZHm,cplcgWpCgZcHm,cplhhHmcHm,            & 
& cplhhHmcVWm,cplhhcHmVWm,cplHmsigma1cHm,cplHmsigma1cVWm,cplHmcHmVP,cplHmcVWmVP,         & 
& cplHmcHmVZ,cplHmcVWmVZ,cplsigma1cHmVWm,cplcHmVPVWm,cplcHmVWmVZ,cplAhAhHmcHm1,          & 
& cplAhhhHmcHm1,cplAhHmsigma1cHm1,cplAhHmcVWmVP1,cplAhHmcVWmVZ1,cplAhcHmVPVWm1,          & 
& cplAhcHmVWmVZ1,cplhhhhHmcHm1,cplhhHmsigma1cHm1,cplHmHmcHmcHm1,cplHmsigma1sigma1cHm1,   & 
& AmpVertexIRosAhTocHmHm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTocHmHm(MAhOS,MFdOS,MFeOS,MFuOS,MhhOS,           & 
& MHmOS,Msigma1OS,MVP,MVWmOS,MVZOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,            & 
& Msigma12OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,               & 
& cplAhsigma1sigma1,cplAhcHmVWm,cplcFuFdcHmL,cplcFuFdcHmR,cplcFvFecHmL,cplcFvFecHmR,     & 
& cplcFdFuHmL,cplcFdFuHmR,cplcFeFvHmL,cplcFeFvHmR,cplcgZgWmcHm,cplcgZgWpCHm,             & 
& cplcgWmgZHm,cplcgWpCgZcHm,cplhhHmcHm,cplhhHmcVWm,cplhhcHmVWm,cplHmsigma1cHm,           & 
& cplHmsigma1cVWm,cplHmcHmVP,cplHmcVWmVP,cplHmcHmVZ,cplHmcVWmVZ,cplsigma1cHmVWm,         & 
& cplcHmVPVWm,cplcHmVWmVZ,cplAhAhHmcHm1,cplAhhhHmcHm1,cplAhHmsigma1cHm1,cplAhHmcVWmVP1,  & 
& cplAhHmcVWmVZ1,cplAhcHmVPVWm1,cplAhcHmVWmVZ1,cplhhhhHmcHm1,cplhhHmsigma1cHm1,          & 
& cplHmHmcHmcHm1,cplHmsigma1sigma1cHm1,AmpVertexIRosAhTocHmHm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhTocHmHm(MAh,MFd,MFe,MFu,Mhh,MHm,Msigma1,         & 
& MVP,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,cplAhAhAh,         & 
& cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,           & 
& cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFuFdcHmL,           & 
& cplcFuFdcHmR,cplcFvFecHmL,cplcFvFecHmR,cplcFdFuHmL,cplcFdFuHmR,cplcFeFvHmL,            & 
& cplcFeFvHmR,cplcgZgWmcHm,cplcgZgWpCHm,cplcgWmgZHm,cplcgWpCgZcHm,cplhhHmcHm,            & 
& cplhhHmcVWm,cplhhcHmVWm,cplHmsigma1cHm,cplHmsigma1cVWm,cplHmcHmVP,cplHmcVWmVP,         & 
& cplHmcHmVZ,cplHmcVWmVZ,cplsigma1cHmVWm,cplcHmVPVWm,cplcHmVWmVZ,cplAhAhHmcHm1,          & 
& cplAhhhHmcHm1,cplAhHmsigma1cHm1,cplAhHmcVWmVP1,cplAhHmcVWmVZ1,cplAhcHmVPVWm1,          & 
& cplAhcHmVWmVZ1,cplhhhhHmcHm1,cplhhHmsigma1cHm1,cplHmHmcHmcHm1,cplHmsigma1sigma1cHm1,   & 
& AmpVertexIRosAhTocHmHm)

 End if 
 End if 
AmpVertexAhTocHmHm = AmpVertexAhTocHmHm -  AmpVertexIRdrAhTocHmHm! +  AmpVertexIRosAhTocHmHm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Final State 1 
AmpWaveZAhTocHmHm=0._dp 
AmpVertexZAhTocHmHm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZAhTocHmHm(gt2,:) = AmpWaveZAhTocHmHm(gt2,:)+ZRUZP(gt2,gt1)*AmpWaveAhTocHmHm(gt1,:) 
AmpVertexZAhTocHmHm(gt2,:)= AmpVertexZAhTocHmHm(gt2,:)+ZRUZP(gt2,gt1)*AmpVertexAhTocHmHm(gt1,:) 
 End Do 
End Do 
AmpWaveAhTocHmHm=AmpWaveZAhTocHmHm 
AmpVertexAhTocHmHm= AmpVertexZAhTocHmHm
! Final State 2 
AmpWaveZAhTocHmHm=0._dp 
AmpVertexZAhTocHmHm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZAhTocHmHm(:,gt2) = AmpWaveZAhTocHmHm(:,gt2)+ZRUZP(gt2,gt1)*AmpWaveAhTocHmHm(:,gt1) 
AmpVertexZAhTocHmHm(:,gt2)= AmpVertexZAhTocHmHm(:,gt2)+ZRUZP(gt2,gt1)*AmpVertexAhTocHmHm(:,gt1) 
 End Do 
End Do 
AmpWaveAhTocHmHm=AmpWaveZAhTocHmHm 
AmpVertexAhTocHmHm= AmpVertexZAhTocHmHm
End if
If (ShiftIRdiv) Then 
AmpVertexAhTocHmHm = AmpVertexAhTocHmHm  +  AmpVertexIRosAhTocHmHm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->conj[Hm] Hm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTocHmHm = AmpTreeAhTocHmHm 
 AmpSum2AhTocHmHm = AmpTreeAhTocHmHm + 2._dp*AmpWaveAhTocHmHm + 2._dp*AmpVertexAhTocHmHm  
Else 
 AmpSumAhTocHmHm = AmpTreeAhTocHmHm + AmpWaveAhTocHmHm + AmpVertexAhTocHmHm
 AmpSum2AhTocHmHm = AmpTreeAhTocHmHm + AmpWaveAhTocHmHm + AmpVertexAhTocHmHm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTocHmHm = AmpTreeAhTocHmHm
 AmpSum2AhTocHmHm = AmpTreeAhTocHmHm 
End if 
gt1=1 
i4 = isave 
  Do gt2=2,2
    Do gt3=2,2
If (((OSkinematics).and.(MAhOS.gt.(MHmOS(gt2)+MHmOS(gt3)))).or.((.not.OSkinematics).and.(MAh.gt.(MHm(gt2)+MHm(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt2, gt3 
  AmpSum2AhTocHmHm = AmpTreeAhTocHmHm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS,MHmOS(gt2),MHmOS(gt3),AmpSumAhTocHmHm(gt2, gt3),AmpSum2AhTocHmHm(gt2, gt3),AmpSqAhTocHmHm(gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh,MHm(gt2),MHm(gt3),AmpSumAhTocHmHm(gt2, gt3),AmpSum2AhTocHmHm(gt2, gt3),AmpSqAhTocHmHm(gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTocHmHm(gt2, gt3) 
  AmpSum2AhTocHmHm = 2._dp*AmpWaveAhTocHmHm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS,MHmOS(gt2),MHmOS(gt3),AmpSumAhTocHmHm(gt2, gt3),AmpSum2AhTocHmHm(gt2, gt3),AmpSqAhTocHmHm(gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh,MHm(gt2),MHm(gt3),AmpSumAhTocHmHm(gt2, gt3),AmpSum2AhTocHmHm(gt2, gt3),AmpSqAhTocHmHm(gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTocHmHm(gt2, gt3) 
  AmpSum2AhTocHmHm = 2._dp*AmpVertexAhTocHmHm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS,MHmOS(gt2),MHmOS(gt3),AmpSumAhTocHmHm(gt2, gt3),AmpSum2AhTocHmHm(gt2, gt3),AmpSqAhTocHmHm(gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh,MHm(gt2),MHm(gt3),AmpSumAhTocHmHm(gt2, gt3),AmpSum2AhTocHmHm(gt2, gt3),AmpSqAhTocHmHm(gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTocHmHm(gt2, gt3) 
  AmpSum2AhTocHmHm = AmpTreeAhTocHmHm + 2._dp*AmpWaveAhTocHmHm + 2._dp*AmpVertexAhTocHmHm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS,MHmOS(gt2),MHmOS(gt3),AmpSumAhTocHmHm(gt2, gt3),AmpSum2AhTocHmHm(gt2, gt3),AmpSqAhTocHmHm(gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh,MHm(gt2),MHm(gt3),AmpSumAhTocHmHm(gt2, gt3),AmpSum2AhTocHmHm(gt2, gt3),AmpSqAhTocHmHm(gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTocHmHm(gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTocHmHm = AmpTreeAhTocHmHm
  Call SquareAmp_StoSS(MAhOS,MHmOS(gt2),MHmOS(gt3),AmpSumAhTocHmHm(gt2, gt3),AmpSum2AhTocHmHm(gt2, gt3),AmpSqAhTocHmHm(gt2, gt3)) 
  AmpSqTreeAhTocHmHm(gt2, gt3) = AmpSqAhTocHmHm(gt2, gt3)  
  AmpSum2AhTocHmHm = + 2._dp*AmpWaveAhTocHmHm + 2._dp*AmpVertexAhTocHmHm
  Call SquareAmp_StoSS(MAhOS,MHmOS(gt2),MHmOS(gt3),AmpSumAhTocHmHm(gt2, gt3),AmpSum2AhTocHmHm(gt2, gt3),AmpSqAhTocHmHm(gt2, gt3)) 
  AmpSqAhTocHmHm(gt2, gt3) = AmpSqAhTocHmHm(gt2, gt3) + AmpSqTreeAhTocHmHm(gt2, gt3)  
Else  
  AmpSum2AhTocHmHm = AmpTreeAhTocHmHm
  Call SquareAmp_StoSS(MAh,MHm(gt2),MHm(gt3),AmpSumAhTocHmHm(gt2, gt3),AmpSum2AhTocHmHm(gt2, gt3),AmpSqAhTocHmHm(gt2, gt3)) 
  AmpSqTreeAhTocHmHm(gt2, gt3) = AmpSqAhTocHmHm(gt2, gt3)  
  AmpSum2AhTocHmHm = + 2._dp*AmpWaveAhTocHmHm + 2._dp*AmpVertexAhTocHmHm
  Call SquareAmp_StoSS(MAh,MHm(gt2),MHm(gt3),AmpSumAhTocHmHm(gt2, gt3),AmpSum2AhTocHmHm(gt2, gt3),AmpSqAhTocHmHm(gt2, gt3)) 
  AmpSqAhTocHmHm(gt2, gt3) = AmpSqAhTocHmHm(gt2, gt3) + AmpSqTreeAhTocHmHm(gt2, gt3)  
End if  
Else  
  AmpSqAhTocHmHm(gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhTocHmHm(gt2, gt3).le.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS,MHmOS(gt2),MHmOS(gt3),helfactor*AmpSqAhTocHmHm(gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh,MHm(gt2),MHm(gt3),helfactor*AmpSqAhTocHmHm(gt2, gt3))
End if 
If ((Abs(MRPAhTocHmHm(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocHmHm(gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTocHmHm(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocHmHm(gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTocHmHm(gt2, gt3) + MRGAhTocHmHm(gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTocHmHm(gt2, gt3) + MRGAhTocHmHm(gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
isave = i4 
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Hm Conjg(VWm)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_THDMIIIHB_AhToHmcVWm(cplAhHmcVWm,MAh,MHm,MVWm,MAh2,               & 
& MHm2,MVWm2,AmpTreeAhToHmcVWm)

  Else 
Call Amplitude_Tree_THDMIIIHB_AhToHmcVWm(ZcplAhHmcVWm,MAh,MHm,MVWm,MAh2,              & 
& MHm2,MVWm2,AmpTreeAhToHmcVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_THDMIIIHB_AhToHmcVWm(MLambda,em,gs,cplAhHmcVWm,MAhOS,MHmOS,           & 
& MVWmOS,MRPAhToHmcVWm,MRGAhToHmcVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_THDMIIIHB_AhToHmcVWm(MLambda,em,gs,ZcplAhHmcVWm,MAhOS,MHmOS,          & 
& MVWmOS,MRPAhToHmcVWm,MRGAhToHmcVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_THDMIIIHB_AhToHmcVWm(MLambda,em,gs,cplAhHmcVWm,MAh,MHm,               & 
& MVWm,MRPAhToHmcVWm,MRGAhToHmcVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_THDMIIIHB_AhToHmcVWm(MLambda,em,gs,ZcplAhHmcVWm,MAh,MHm,              & 
& MVWm,MRPAhToHmcVWm,MRGAhToHmcVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_THDMIIIHB_AhToHmcVWm(cplAhHmcVWm,ctcplAhHmcVWm,MAh,               & 
& MAh2,MHm,MHm2,MVWm,MVWm2,ZfAh,ZfHm,ZfVWm,AmpWaveAhToHmcVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_THDMIIIHB_AhToHmcVWm(MAh,MFd,MFe,MFu,Mhh,MHm,Msigma1,           & 
& MVP,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,cplAhAhAh,         & 
& cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,           & 
& cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFuFdcVWmL,          & 
& cplcFuFdcVWmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFdFuHmL,cplcFdFuHmR,cplcFeFvHmL,         & 
& cplcFeFvHmR,cplcgWmgAHm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZgWpCHm,cplcgWmgZHm,          & 
& cplcgWpCgZcVWm,cplhhHmcHm,cplhhHmcVWm,cplhhcVWmVWm,cplHmsigma1cHm,cplHmsigma1cVWm,     & 
& cplHmcHmVP,cplHmcVWmVP,cplHmcHmVZ,cplHmcVWmVZ,cplcVWmVPVWm,cplcVWmVWmVZ,               & 
& cplAhAhcVWmVWm1,cplAhHmcVWmVP1,cplAhHmcVWmVZ1,cplhhHmcVWmVZ1,cplHmcHmcVWmVWm1,         & 
& AmpVertexAhToHmcVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhToHmcVWm(MAh,MFd,MFe,MFu,Mhh,MHm,Msigma1,        & 
& MVP,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,cplAhAhAh,         & 
& cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,           & 
& cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFuFdcVWmL,          & 
& cplcFuFdcVWmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFdFuHmL,cplcFdFuHmR,cplcFeFvHmL,         & 
& cplcFeFvHmR,cplcgWmgAHm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZgWpCHm,cplcgWmgZHm,          & 
& cplcgWpCgZcVWm,cplhhHmcHm,cplhhHmcVWm,cplhhcVWmVWm,cplHmsigma1cHm,cplHmsigma1cVWm,     & 
& cplHmcHmVP,cplHmcVWmVP,cplHmcHmVZ,cplHmcVWmVZ,cplcVWmVPVWm,cplcVWmVWmVZ,               & 
& cplAhAhcVWmVWm1,cplAhHmcVWmVP1,cplAhHmcVWmVZ1,cplhhHmcVWmVZ1,cplHmcHmcVWmVWm1,         & 
& AmpVertexIRdrAhToHmcVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhToHmcVWm(MAhOS,MFdOS,MFeOS,MFuOS,MhhOS,          & 
& MHmOS,Msigma1OS,MVP,MVWmOS,MVZOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,            & 
& Msigma12OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,GosZcplAhHmcHm,ZcplAhHmcVWm,          & 
& cplAhsigma1sigma1,cplAhcHmVWm,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFvFecVWmL,               & 
& cplcFvFecVWmR,cplcFdFuHmL,cplcFdFuHmR,cplcFeFvHmL,cplcFeFvHmR,cplcgWmgAHm,             & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZgWpCHm,cplcgWmgZHm,cplcgWpCgZcVWm,cplhhHmcHm,        & 
& cplhhHmcVWm,cplhhcVWmVWm,cplHmsigma1cHm,cplHmsigma1cVWm,cplHmcHmVP,GosZcplHmcVWmVP,    & 
& cplHmcHmVZ,cplHmcVWmVZ,cplcVWmVPVWm,cplcVWmVWmVZ,cplAhAhcVWmVWm1,cplAhHmcVWmVP1,       & 
& cplAhHmcVWmVZ1,cplhhHmcVWmVZ1,cplHmcHmcVWmVWm1,AmpVertexIRosAhToHmcVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhToHmcVWm(MAh,MFd,MFe,MFu,Mhh,MHm,Msigma1,        & 
& MVP,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,cplAhAhAh,         & 
& cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,           & 
& cplAhhhVZ,GZcplAhHmcHm,ZcplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFuFdcVWmL,       & 
& cplcFuFdcVWmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFdFuHmL,cplcFdFuHmR,cplcFeFvHmL,         & 
& cplcFeFvHmR,cplcgWmgAHm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZgWpCHm,cplcgWmgZHm,          & 
& cplcgWpCgZcVWm,cplhhHmcHm,cplhhHmcVWm,cplhhcVWmVWm,cplHmsigma1cHm,cplHmsigma1cVWm,     & 
& cplHmcHmVP,GZcplHmcVWmVP,cplHmcHmVZ,cplHmcVWmVZ,cplcVWmVPVWm,cplcVWmVWmVZ,             & 
& cplAhAhcVWmVWm1,cplAhHmcVWmVP1,cplAhHmcVWmVZ1,cplhhHmcVWmVZ1,cplHmcHmcVWmVWm1,         & 
& AmpVertexIRosAhToHmcVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhToHmcVWm(MAhOS,MFdOS,MFeOS,MFuOS,MhhOS,          & 
& MHmOS,Msigma1OS,MVP,MVWmOS,MVZOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,            & 
& Msigma12OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,GcplAhHmcHm,cplAhHmcVWm,              & 
& cplAhsigma1sigma1,cplAhcHmVWm,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFvFecVWmL,               & 
& cplcFvFecVWmR,cplcFdFuHmL,cplcFdFuHmR,cplcFeFvHmL,cplcFeFvHmR,cplcgWmgAHm,             & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZgWpCHm,cplcgWmgZHm,cplcgWpCgZcVWm,cplhhHmcHm,        & 
& cplhhHmcVWm,cplhhcVWmVWm,cplHmsigma1cHm,cplHmsigma1cVWm,cplHmcHmVP,GcplHmcVWmVP,       & 
& cplHmcHmVZ,cplHmcVWmVZ,cplcVWmVPVWm,cplcVWmVWmVZ,cplAhAhcVWmVWm1,cplAhHmcVWmVP1,       & 
& cplAhHmcVWmVZ1,cplhhHmcVWmVZ1,cplHmcHmcVWmVWm1,AmpVertexIRosAhToHmcVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_THDMIIIHB_AhToHmcVWm(MAh,MFd,MFe,MFu,Mhh,MHm,Msigma1,        & 
& MVP,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,cplAhAhAh,         & 
& cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,           & 
& cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFuFdcVWmL,          & 
& cplcFuFdcVWmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFdFuHmL,cplcFdFuHmR,cplcFeFvHmL,         & 
& cplcFeFvHmR,cplcgWmgAHm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZgWpCHm,cplcgWmgZHm,          & 
& cplcgWpCgZcVWm,cplhhHmcHm,cplhhHmcVWm,cplhhcVWmVWm,cplHmsigma1cHm,cplHmsigma1cVWm,     & 
& cplHmcHmVP,cplHmcVWmVP,cplHmcHmVZ,cplHmcVWmVZ,cplcVWmVPVWm,cplcVWmVWmVZ,               & 
& cplAhAhcVWmVWm1,cplAhHmcVWmVP1,cplAhHmcVWmVZ1,cplhhHmcVWmVZ1,cplHmcHmcVWmVWm1,         & 
& AmpVertexIRosAhToHmcVWm)

 End if 
 End if 
AmpVertexAhToHmcVWm = AmpVertexAhToHmcVWm -  AmpVertexIRdrAhToHmcVWm! +  AmpVertexIRosAhToHmcVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Final State 1 
AmpWaveZAhToHmcVWm=0._dp 
AmpVertexZAhToHmcVWm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZAhToHmcVWm(:,gt2) = AmpWaveZAhToHmcVWm(:,gt2)+ZRUZP(gt2,gt1)*AmpWaveAhToHmcVWm(:,gt1) 
AmpVertexZAhToHmcVWm(:,gt2)= AmpVertexZAhToHmcVWm(:,gt2)+ZRUZP(gt2,gt1)*AmpVertexAhToHmcVWm(:,gt1) 
 End Do 
End Do 
AmpWaveAhToHmcVWm=AmpWaveZAhToHmcVWm 
AmpVertexAhToHmcVWm= AmpVertexZAhToHmcVWm
End if
If (ShiftIRdiv) Then 
AmpVertexAhToHmcVWm = AmpVertexAhToHmcVWm  +  AmpVertexIRosAhToHmcVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->Hm conj[VWm] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhToHmcVWm = AmpTreeAhToHmcVWm 
 AmpSum2AhToHmcVWm = AmpTreeAhToHmcVWm + 2._dp*AmpWaveAhToHmcVWm + 2._dp*AmpVertexAhToHmcVWm  
Else 
 AmpSumAhToHmcVWm = AmpTreeAhToHmcVWm + AmpWaveAhToHmcVWm + AmpVertexAhToHmcVWm
 AmpSum2AhToHmcVWm = AmpTreeAhToHmcVWm + AmpWaveAhToHmcVWm + AmpVertexAhToHmcVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToHmcVWm = AmpTreeAhToHmcVWm
 AmpSum2AhToHmcVWm = AmpTreeAhToHmcVWm 
End if 
gt1=1 
i4 = isave 
  Do gt2=2,2
If (((OSkinematics).and.(MAhOS.gt.(MHmOS(gt2)+MVWmOS))).or.((.not.OSkinematics).and.(MAh.gt.(MHm(gt2)+MVWm)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt2 
  AmpSum2AhToHmcVWm = AmpTreeAhToHmcVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS,MHmOS(gt2),MVWmOS,AmpSumAhToHmcVWm(:,gt2),AmpSum2AhToHmcVWm(:,gt2),AmpSqAhToHmcVWm(gt2)) 
Else  
  Call SquareAmp_StoSV(MAh,MHm(gt2),MVWm,AmpSumAhToHmcVWm(:,gt2),AmpSum2AhToHmcVWm(:,gt2),AmpSqAhToHmcVWm(gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhToHmcVWm(gt2) 
  AmpSum2AhToHmcVWm = 2._dp*AmpWaveAhToHmcVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS,MHmOS(gt2),MVWmOS,AmpSumAhToHmcVWm(:,gt2),AmpSum2AhToHmcVWm(:,gt2),AmpSqAhToHmcVWm(gt2)) 
Else  
  Call SquareAmp_StoSV(MAh,MHm(gt2),MVWm,AmpSumAhToHmcVWm(:,gt2),AmpSum2AhToHmcVWm(:,gt2),AmpSqAhToHmcVWm(gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhToHmcVWm(gt2) 
  AmpSum2AhToHmcVWm = 2._dp*AmpVertexAhToHmcVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS,MHmOS(gt2),MVWmOS,AmpSumAhToHmcVWm(:,gt2),AmpSum2AhToHmcVWm(:,gt2),AmpSqAhToHmcVWm(gt2)) 
Else  
  Call SquareAmp_StoSV(MAh,MHm(gt2),MVWm,AmpSumAhToHmcVWm(:,gt2),AmpSum2AhToHmcVWm(:,gt2),AmpSqAhToHmcVWm(gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhToHmcVWm(gt2) 
  AmpSum2AhToHmcVWm = AmpTreeAhToHmcVWm + 2._dp*AmpWaveAhToHmcVWm + 2._dp*AmpVertexAhToHmcVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS,MHmOS(gt2),MVWmOS,AmpSumAhToHmcVWm(:,gt2),AmpSum2AhToHmcVWm(:,gt2),AmpSqAhToHmcVWm(gt2)) 
Else  
  Call SquareAmp_StoSV(MAh,MHm(gt2),MVWm,AmpSumAhToHmcVWm(:,gt2),AmpSum2AhToHmcVWm(:,gt2),AmpSqAhToHmcVWm(gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhToHmcVWm(gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhToHmcVWm = AmpTreeAhToHmcVWm
  Call SquareAmp_StoSV(MAhOS,MHmOS(gt2),MVWmOS,AmpSumAhToHmcVWm(:,gt2),AmpSum2AhToHmcVWm(:,gt2),AmpSqAhToHmcVWm(gt2)) 
  AmpSqTreeAhToHmcVWm(gt2) = AmpSqAhToHmcVWm(gt2)  
  AmpSum2AhToHmcVWm = + 2._dp*AmpWaveAhToHmcVWm + 2._dp*AmpVertexAhToHmcVWm
  Call SquareAmp_StoSV(MAhOS,MHmOS(gt2),MVWmOS,AmpSumAhToHmcVWm(:,gt2),AmpSum2AhToHmcVWm(:,gt2),AmpSqAhToHmcVWm(gt2)) 
  AmpSqAhToHmcVWm(gt2) = AmpSqAhToHmcVWm(gt2) + AmpSqTreeAhToHmcVWm(gt2)  
Else  
  AmpSum2AhToHmcVWm = AmpTreeAhToHmcVWm
  Call SquareAmp_StoSV(MAh,MHm(gt2),MVWm,AmpSumAhToHmcVWm(:,gt2),AmpSum2AhToHmcVWm(:,gt2),AmpSqAhToHmcVWm(gt2)) 
  AmpSqTreeAhToHmcVWm(gt2) = AmpSqAhToHmcVWm(gt2)  
  AmpSum2AhToHmcVWm = + 2._dp*AmpWaveAhToHmcVWm + 2._dp*AmpVertexAhToHmcVWm
  Call SquareAmp_StoSV(MAh,MHm(gt2),MVWm,AmpSumAhToHmcVWm(:,gt2),AmpSum2AhToHmcVWm(:,gt2),AmpSqAhToHmcVWm(gt2)) 
  AmpSqAhToHmcVWm(gt2) = AmpSqAhToHmcVWm(gt2) + AmpSqTreeAhToHmcVWm(gt2)  
End if  
Else  
  AmpSqAhToHmcVWm(gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToHmcVWm(gt2).le.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAhOS,MHmOS(gt2),MVWmOS,helfactor*AmpSqAhToHmcVWm(gt2))
Else 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAh,MHm(gt2),MVWm,helfactor*AmpSqAhToHmcVWm(gt2))
End if 
If ((Abs(MRPAhToHmcVWm(gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhToHmcVWm(gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhToHmcVWm(gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhToHmcVWm(gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*2._dp*helfactor*(MRPAhToHmcVWm(gt2) + MRGAhToHmcVWm(gt2)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*2._dp*helfactor*(MRPAhToHmcVWm(gt2) + MRGAhToHmcVWm(gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
isave = i4 
End If 
!---------------- 
! Ah VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_THDMIIIHB_AhToAhVP(MAhOS,MFdOS,MFeOS,MFuOS,MHmOS,               & 
& MVP,MVWmOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,MHm2OS,MVP2,MVWm2OS,cplcFdFdAhL,cplcFdFdAhR,    & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhHmcHm,cplAhHmcVWm,cplAhcHmVWm,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,    & 
& cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,cplHmcHmVP,cplHmcVWmVP,            & 
& cplcHmVPVWm,cplcVWmVPVWm,cplAhHmcVWmVP1,cplAhcHmVPVWm1,AmpVertexAhToAhVP)

 Else 
Call Amplitude_VERTEX_THDMIIIHB_AhToAhVP(MAhOS,MFdOS,MFeOS,MFuOS,MHmOS,               & 
& MVP,MVWmOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,MHm2OS,MVP2,MVWm2OS,cplcFdFdAhL,cplcFdFdAhR,    & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhHmcHm,cplAhHmcVWm,cplAhcHmVWm,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,    & 
& cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,cplHmcHmVP,cplHmcVWmVP,            & 
& cplcHmVPVWm,cplcVWmVPVWm,cplAhHmcVWmVP1,cplAhcHmVPVWm1,AmpVertexAhToAhVP)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_THDMIIIHB_AhToAhVP(MAh,MFd,MFe,MFu,MHm,MVP,MVWm,MAh2,           & 
& MFd2,MFe2,MFu2,MHm2,MVP2,MVWm2,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,        & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHmcHm,cplAhHmcVWm,            & 
& cplAhcHmVWm,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,cplHmcHmVP,cplHmcVWmVP,cplcHmVPVWm,            & 
& cplcVWmVPVWm,cplAhHmcVWmVP1,cplAhcHmVPVWm1,AmpVertexAhToAhVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->Ah VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToAhVP = 0._dp 
 AmpSum2AhToAhVP = 0._dp  
Else 
 AmpSumAhToAhVP = AmpVertexAhToAhVP + AmpWaveAhToAhVP
 AmpSum2AhToAhVP = AmpVertexAhToAhVP + AmpWaveAhToAhVP 
End If 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MAhOS.gt.(MAhOS+0.))).or.((.not.OSkinematics).and.(MAh.gt.(MAh+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS,MAhOS,0._dp,AmpSumAhToAhVP(:),AmpSum2AhToAhVP(:),AmpSqAhToAhVP) 
Else  
  Call SquareAmp_StoSV(MAh,MAh,MVP,AmpSumAhToAhVP(:),AmpSum2AhToAhVP(:),AmpSqAhToAhVP) 
End if  
Else  
  AmpSqAhToAhVP = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToAhVP.le.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS,MAhOS,0._dp,helfactor*AmpSqAhToAhVP)
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh,MAh,MVP,helfactor*AmpSqAhToAhVP)
End if 
If ((Abs(MRPAhToAhVP).gt.1.0E-20_dp).or.(Abs(MRGAhToAhVP).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

isave = i4 
!---------------- 
! Ah VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_THDMIIIHB_AhToAhVZ(MAhOS,MFdOS,MFeOS,MFuOS,MhhOS,               & 
& MHmOS,Msigma1OS,MVWmOS,MVZOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,Msigma12OS,     & 
& MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,            & 
& cplAhcHmVWm,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhsigma1VZ,cplhhVZVZ,cplHmcHmVZ,            & 
& cplHmcVWmVZ,cplcHmVWmVZ,cplcVWmVWmVZ,cplAhHmcVWmVZ1,cplAhcHmVWmVZ1,AmpVertexAhToAhVZ)

 Else 
Call Amplitude_VERTEX_THDMIIIHB_AhToAhVZ(MAhOS,MFdOS,MFeOS,MFuOS,MhhOS,               & 
& MHmOS,Msigma1OS,MVWmOS,MVZOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,Msigma12OS,     & 
& MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,            & 
& cplAhcHmVWm,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhsigma1VZ,cplhhVZVZ,cplHmcHmVZ,            & 
& cplHmcVWmVZ,cplcHmVWmVZ,cplcVWmVWmVZ,cplAhHmcVWmVZ1,cplAhcHmVWmVZ1,AmpVertexAhToAhVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_THDMIIIHB_AhToAhVZ(MAh,MFd,MFe,MFu,Mhh,MHm,Msigma1,             & 
& MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhAh,cplAhAhhh,        & 
& cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,             & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,             & 
& cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFdFdVZL,cplcFdFdVZR,          & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,           & 
& cplhhsigma1VZ,cplhhVZVZ,cplHmcHmVZ,cplHmcVWmVZ,cplcHmVWmVZ,cplcVWmVWmVZ,               & 
& cplAhHmcVWmVZ1,cplAhcHmVWmVZ1,AmpVertexAhToAhVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->Ah VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToAhVZ = 0._dp 
 AmpSum2AhToAhVZ = 0._dp  
Else 
 AmpSumAhToAhVZ = AmpVertexAhToAhVZ + AmpWaveAhToAhVZ
 AmpSum2AhToAhVZ = AmpVertexAhToAhVZ + AmpWaveAhToAhVZ 
End If 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MAhOS.gt.(MAhOS+MVZOS))).or.((.not.OSkinematics).and.(MAh.gt.(MAh+MVZ)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS,MAhOS,MVZOS,AmpSumAhToAhVZ(:),AmpSum2AhToAhVZ(:),AmpSqAhToAhVZ) 
Else  
  Call SquareAmp_StoSV(MAh,MAh,MVZ,AmpSumAhToAhVZ(:),AmpSum2AhToAhVZ(:),AmpSqAhToAhVZ) 
End if  
Else  
  AmpSqAhToAhVZ = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToAhVZ.le.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS,MAhOS,MVZOS,helfactor*AmpSqAhToAhVZ)
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh,MAh,MVZ,helfactor*AmpSqAhToAhVZ)
End if 
If ((Abs(MRPAhToAhVZ).gt.1.0E-20_dp).or.(Abs(MRGAhToAhVZ).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

isave = i4 
!---------------- 
! Fv bar(Fv)
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_THDMIIIHB_AhToFvcFv(MAhOS,MFeOS,MHmOS,MVWmOS,MAh2OS,            & 
& MFe2OS,MHm2OS,MVWm2OS,cplcFeFeAhL,cplcFeFeAhR,cplAhHmcHm,cplAhHmcVWm,cplAhcHmVWm,      & 
& cplcFvFecHmL,cplcFvFecHmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFeFvHmL,cplcFeFvHmR,         & 
& cplcFeFvVWmL,cplcFeFvVWmR,AmpVertexAhToFvcFv)

 Else 
Call Amplitude_VERTEX_THDMIIIHB_AhToFvcFv(MAhOS,MFeOS,MHmOS,MVWmOS,MAh2OS,            & 
& MFe2OS,MHm2OS,MVWm2OS,cplcFeFeAhL,cplcFeFeAhR,cplAhHmcHm,cplAhHmcVWm,cplAhcHmVWm,      & 
& cplcFvFecHmL,cplcFvFecHmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFeFvHmL,cplcFeFvHmR,         & 
& cplcFeFvVWmL,cplcFeFvVWmR,AmpVertexAhToFvcFv)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_THDMIIIHB_AhToFvcFv(MAh,MFe,MHm,MVWm,MAh2,MFe2,MHm2,            & 
& MVWm2,cplcFeFeAhL,cplcFeFeAhR,cplAhHmcHm,cplAhHmcVWm,cplAhcHmVWm,cplcFvFecHmL,         & 
& cplcFvFecHmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFeFvHmL,cplcFeFvHmR,cplcFeFvVWmL,         & 
& cplcFeFvVWmR,AmpVertexAhToFvcFv)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->Fv bar[Fv] -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToFvcFv = 0._dp 
 AmpSum2AhToFvcFv = 0._dp  
Else 
 AmpSumAhToFvcFv = AmpVertexAhToFvcFv + AmpWaveAhToFvcFv
 AmpSum2AhToFvcFv = AmpVertexAhToFvcFv + AmpWaveAhToFvcFv 
End If 
gt1=1 
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(MAhOS.gt.(0.+0.))).or.((.not.OSkinematics).and.(MAh.gt.(0.+0.)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS,0._dp,0._dp,AmpSumAhToFvcFv(:,gt2, gt3),AmpSum2AhToFvcFv(:,gt2, gt3),AmpSqAhToFvcFv(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh,0._dp,0._dp,AmpSumAhToFvcFv(:,gt2, gt3),AmpSum2AhToFvcFv(:,gt2, gt3),AmpSqAhToFvcFv(gt2, gt3)) 
End if  
Else  
  AmpSqAhToFvcFv(gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqAhToFvcFv(gt2, gt3).le.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS,0._dp,0._dp,helfactor*AmpSqAhToFvcFv(gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh,0._dp,0._dp,helfactor*AmpSqAhToFvcFv(gt2, gt3))
End if 
If ((Abs(MRPAhToFvcFv(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhToFvcFv(gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

    End do
  End do
isave = i4 
!---------------- 
! hh VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_THDMIIIHB_AhTohhVP(cplAhhhVZ,ctcplAhhhVZ,MAhOS,MAh2OS,            & 
& MhhOS,Mhh2OS,MVP,MVP2,MVZOS,MVZ2OS,ZfAh,Zfhh,ZfVP,ZfVZVP,AmpWaveAhTohhVP)

 Else 
Call Amplitude_WAVE_THDMIIIHB_AhTohhVP(cplAhhhVZ,ctcplAhhhVZ,MAhOS,MAh2OS,            & 
& MhhOS,Mhh2OS,MVP,MVP2,MVZOS,MVZ2OS,ZfAh,Zfhh,ZfVP,ZfVZVP,AmpWaveAhTohhVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_THDMIIIHB_AhTohhVP(MAhOS,MFdOS,MFeOS,MFuOS,MhhOS,               & 
& MHmOS,MVP,MVWmOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,MVP2,MVWm2OS,               & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHmcHm,cplAhHmcVWm,cplAhcHmVWm,cplcFdFdhhL,            & 
& cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmhh,              & 
& cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhHmcHm,cplhhHmcVWm,cplhhcHmVWm,         & 
& cplhhcVWmVWm,cplHmcHmVP,cplHmcVWmVP,cplcHmVPVWm,cplcVWmVPVWm,cplAhHmcVWmVP1,           & 
& cplAhcHmVPVWm1,cplhhHmcVWmVP1,cplhhcHmVPVWm1,AmpVertexAhTohhVP)

 Else 
Call Amplitude_VERTEX_THDMIIIHB_AhTohhVP(MAhOS,MFdOS,MFeOS,MFuOS,MhhOS,               & 
& MHmOS,MVP,MVWmOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,MVP2,MVWm2OS,               & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHmcHm,cplAhHmcVWm,cplAhcHmVWm,cplcFdFdhhL,            & 
& cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmhh,              & 
& cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhHmcHm,cplhhHmcVWm,cplhhcHmVWm,         & 
& cplhhcVWmVWm,cplHmcHmVP,cplHmcVWmVP,cplcHmVPVWm,cplcVWmVPVWm,cplAhHmcVWmVP1,           & 
& cplAhcHmVPVWm1,cplhhHmcVWmVP1,cplhhcHmVPVWm1,AmpVertexAhTohhVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_THDMIIIHB_AhTohhVP(cplAhhhVZ,ctcplAhhhVZ,MAh,MAh2,Mhh,            & 
& Mhh2,MVP,MVP2,MVZ,MVZ2,ZfAh,Zfhh,ZfVP,ZfVZVP,AmpWaveAhTohhVP)



!Vertex Corrections 
Call Amplitude_VERTEX_THDMIIIHB_AhTohhVP(MAh,MFd,MFe,MFu,Mhh,MHm,MVP,MVWm,            & 
& MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVP2,MVWm2,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,          & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHmcHm,            & 
& cplAhHmcVWm,cplAhcHmVWm,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,       & 
& cplhhHmcHm,cplhhHmcVWm,cplhhcHmVWm,cplhhcVWmVWm,cplHmcHmVP,cplHmcVWmVP,cplcHmVPVWm,    & 
& cplcVWmVPVWm,cplAhHmcVWmVP1,cplAhcHmVPVWm1,cplhhHmcVWmVP1,cplhhcHmVPVWm1,              & 
& AmpVertexAhTohhVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->hh VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTohhVP = 0._dp 
 AmpSum2AhTohhVP = 0._dp  
Else 
 AmpSumAhTohhVP = AmpVertexAhTohhVP + AmpWaveAhTohhVP
 AmpSum2AhTohhVP = AmpVertexAhTohhVP + AmpWaveAhTohhVP 
End If 
gt1=1 
i4 = isave 
  Do gt2=1,2
If (((OSkinematics).and.(MAhOS.gt.(MhhOS(gt2)+0.))).or.((.not.OSkinematics).and.(MAh.gt.(Mhh(gt2)+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS,MhhOS(gt2),0._dp,AmpSumAhTohhVP(:,gt2),AmpSum2AhTohhVP(:,gt2),AmpSqAhTohhVP(gt2)) 
Else  
  Call SquareAmp_StoSV(MAh,Mhh(gt2),MVP,AmpSumAhTohhVP(:,gt2),AmpSum2AhTohhVP(:,gt2),AmpSqAhTohhVP(gt2)) 
End if  
Else  
  AmpSqAhTohhVP(gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhTohhVP(gt2).le.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS,MhhOS(gt2),0._dp,helfactor*AmpSqAhTohhVP(gt2))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh,Mhh(gt2),MVP,helfactor*AmpSqAhTohhVP(gt2))
End if 
If ((Abs(MRPAhTohhVP(gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhVP(gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

  End do
isave = i4 
!---------------- 
! VG VG
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_THDMIIIHB_AhToVGVG(MAhOS,MFdOS,MFuOS,MVG,MAh2OS,MFd2OS,         & 
& MFu2OS,MVG2,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFdFdVGL,               & 
& cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,AmpVertexAhToVGVG)

 Else 
Call Amplitude_VERTEX_THDMIIIHB_AhToVGVG(MAhOS,MFdOS,MFuOS,MVG,MAh2OS,MFd2OS,         & 
& MFu2OS,MVG2,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFdFdVGL,               & 
& cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,AmpVertexAhToVGVG)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_THDMIIIHB_AhToVGVG(MAh,MFd,MFu,MVG,MAh2,MFd2,MFu2,              & 
& MVG2,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFdFdVGL,cplcFdFdVGR,          & 
& cplcFuFuVGL,cplcFuFuVGR,AmpVertexAhToVGVG)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->VG VG -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToVGVG = 0._dp 
 AmpSum2AhToVGVG = 0._dp  
Else 
 AmpSumAhToVGVG = AmpVertexAhToVGVG + AmpWaveAhToVGVG
 AmpSum2AhToVGVG = AmpVertexAhToVGVG + AmpWaveAhToVGVG 
End If 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MAhOS.gt.(0.+0.))).or.((.not.OSkinematics).and.(MAh.gt.(MVG+MVG)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MAhOS,0._dp,0._dp,AmpSumAhToVGVG(:),AmpSum2AhToVGVG(:),AmpSqAhToVGVG) 
Else  
  Call SquareAmp_StoVV(MAh,MVG,MVG,AmpSumAhToVGVG(:),AmpSum2AhToVGVG(:),AmpSqAhToVGVG) 
End if  
Else  
  AmpSqAhToVGVG = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToVGVG.le.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 8._dp*GammaTPS(MAhOS,0._dp,0._dp,helfactor*AmpSqAhToVGVG)
Else 
  gP1LAh(gt1,i4) = 8._dp*GammaTPS(MAh,MVG,MVG,helfactor*AmpSqAhToVGVG)
End if 
If ((Abs(MRPAhToVGVG).gt.1.0E-20_dp).or.(Abs(MRGAhToVGVG).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

isave = i4 
!---------------- 
! VP VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_THDMIIIHB_AhToVPVP(MAhOS,MFdOS,MFeOS,MFuOS,MHmOS,               & 
& MVP,MVWmOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,MHm2OS,MVP2,MVWm2OS,cplcFdFdAhL,cplcFdFdAhR,    & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhHmcHm,cplAhHmcVWm,cplAhcHmVWm,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,    & 
& cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,cplHmcHmVP,cplHmcVWmVP,            & 
& cplcHmVPVWm,cplcVWmVPVWm,cplAhHmcVWmVP1,cplAhcHmVPVWm1,cplHmcHmVPVP1,AmpVertexAhToVPVP)

 Else 
Call Amplitude_VERTEX_THDMIIIHB_AhToVPVP(MAhOS,MFdOS,MFeOS,MFuOS,MHmOS,               & 
& MVP,MVWmOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,MHm2OS,MVP2,MVWm2OS,cplcFdFdAhL,cplcFdFdAhR,    & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhHmcHm,cplAhHmcVWm,cplAhcHmVWm,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,    & 
& cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,cplHmcHmVP,cplHmcVWmVP,            & 
& cplcHmVPVWm,cplcVWmVPVWm,cplAhHmcVWmVP1,cplAhcHmVPVWm1,cplHmcHmVPVP1,AmpVertexAhToVPVP)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_THDMIIIHB_AhToVPVP(MAh,MFd,MFe,MFu,MHm,MVP,MVWm,MAh2,           & 
& MFd2,MFe2,MFu2,MHm2,MVP2,MVWm2,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,        & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHmcHm,cplAhHmcVWm,            & 
& cplAhcHmVWm,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,cplHmcHmVP,cplHmcVWmVP,cplcHmVPVWm,            & 
& cplcVWmVPVWm,cplAhHmcVWmVP1,cplAhcHmVPVWm1,cplHmcHmVPVP1,AmpVertexAhToVPVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->VP VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToVPVP = 0._dp 
 AmpSum2AhToVPVP = 0._dp  
Else 
 AmpSumAhToVPVP = AmpVertexAhToVPVP + AmpWaveAhToVPVP
 AmpSum2AhToVPVP = AmpVertexAhToVPVP + AmpWaveAhToVPVP 
End If 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MAhOS.gt.(0.+0.))).or.((.not.OSkinematics).and.(MAh.gt.(MVP+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MAhOS,0._dp,0._dp,AmpSumAhToVPVP(:),AmpSum2AhToVPVP(:),AmpSqAhToVPVP) 
Else  
  Call SquareAmp_StoVV(MAh,MVP,MVP,AmpSumAhToVPVP(:),AmpSum2AhToVPVP(:),AmpSqAhToVPVP) 
End if  
Else  
  AmpSqAhToVPVP = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToVPVP.le.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS,0._dp,0._dp,helfactor*AmpSqAhToVPVP)
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh,MVP,MVP,helfactor*AmpSqAhToVPVP)
End if 
If ((Abs(MRPAhToVPVP).gt.1.0E-20_dp).or.(Abs(MRGAhToVPVP).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

isave = i4 
!---------------- 
! VP VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_THDMIIIHB_AhToVPVZ(MAhOS,MFdOS,MFeOS,MFuOS,MHmOS,               & 
& MVP,MVWmOS,MVZOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,MHm2OS,MVP2,MVWm2OS,MVZ2OS,               & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHmcHm,cplAhHmcVWm,cplAhcHmVWm,cplcFdFdVPL,            & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmVP,              & 
& cplcgWmgWmVZ,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplHmcHmVP,cplHmcVWmVP,cplHmcHmVZ,          & 
& cplHmcVWmVZ,cplcHmVPVWm,cplcVWmVPVWm,cplcHmVWmVZ,cplcVWmVWmVZ,cplAhHmcVWmVP1,          & 
& cplAhHmcVWmVZ1,cplAhcHmVPVWm1,cplAhcHmVWmVZ1,cplHmcHmVPVZ1,AmpVertexAhToVPVZ)

 Else 
Call Amplitude_VERTEX_THDMIIIHB_AhToVPVZ(MAhOS,MFdOS,MFeOS,MFuOS,MHmOS,               & 
& MVP,MVWmOS,MVZOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,MHm2OS,MVP2,MVWm2OS,MVZ2OS,               & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHmcHm,cplAhHmcVWm,cplAhcHmVWm,cplcFdFdVPL,            & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmVP,              & 
& cplcgWmgWmVZ,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplHmcHmVP,cplHmcVWmVP,cplHmcHmVZ,          & 
& cplHmcVWmVZ,cplcHmVPVWm,cplcVWmVPVWm,cplcHmVWmVZ,cplcVWmVWmVZ,cplAhHmcVWmVP1,          & 
& cplAhHmcVWmVZ1,cplAhcHmVPVWm1,cplAhcHmVWmVZ1,cplHmcHmVPVZ1,AmpVertexAhToVPVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_THDMIIIHB_AhToVPVZ(MAh,MFd,MFe,MFu,MHm,MVP,MVWm,MVZ,            & 
& MAh2,MFd2,MFe2,MFu2,MHm2,MVP2,MVWm2,MVZ2,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,          & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHmcHm,            & 
& cplAhHmcVWm,cplAhcHmVWm,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,       & 
& cplHmcHmVP,cplHmcVWmVP,cplHmcHmVZ,cplHmcVWmVZ,cplcHmVPVWm,cplcVWmVPVWm,cplcHmVWmVZ,    & 
& cplcVWmVWmVZ,cplAhHmcVWmVP1,cplAhHmcVWmVZ1,cplAhcHmVPVWm1,cplAhcHmVWmVZ1,              & 
& cplHmcHmVPVZ1,AmpVertexAhToVPVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->VP VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToVPVZ = 0._dp 
 AmpSum2AhToVPVZ = 0._dp  
Else 
 AmpSumAhToVPVZ = AmpVertexAhToVPVZ + AmpWaveAhToVPVZ
 AmpSum2AhToVPVZ = AmpVertexAhToVPVZ + AmpWaveAhToVPVZ 
End If 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MAhOS.gt.(0.+MVZOS))).or.((.not.OSkinematics).and.(MAh.gt.(MVP+MVZ)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MAhOS,0._dp,MVZOS,AmpSumAhToVPVZ(:),AmpSum2AhToVPVZ(:),AmpSqAhToVPVZ) 
Else  
  Call SquareAmp_StoVV(MAh,MVP,MVZ,AmpSumAhToVPVZ(:),AmpSum2AhToVPVZ(:),AmpSqAhToVPVZ) 
End if  
Else  
  AmpSqAhToVPVZ = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToVPVZ.le.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAhOS,0._dp,MVZOS,helfactor*AmpSqAhToVPVZ)
Else 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAh,MVP,MVZ,helfactor*AmpSqAhToVPVZ)
End if 
If ((Abs(MRPAhToVPVZ).gt.1.0E-20_dp).or.(Abs(MRGAhToVPVZ).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

isave = i4 
!---------------- 
! VWm Conjg(VWm)
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_THDMIIIHB_AhToVWmcVWm(MAhOS,MFdOS,MFeOS,MFuOS,MhhOS,            & 
& MHmOS,Msigma1OS,MVP,MVWmOS,MVZOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,            & 
& Msigma12OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,               & 
& cplAhsigma1sigma1,cplAhcHmVWm,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFvFecVWmL,               & 
& cplcFvFecVWmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgWmgAVWm,        & 
& cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgWmgZVWm,   & 
& cplcgWpCgZcVWm,cplhhHmcVWm,cplhhcHmVWm,cplhhcVWmVWm,cplHmsigma1cVWm,cplHmcVWmVP,       & 
& cplHmcVWmVZ,cplsigma1cHmVWm,cplcHmVPVWm,cplcVWmVPVWm,cplcHmVWmVZ,cplcVWmVWmVZ,         & 
& cplAhAhcVWmVWm1,cplAhHmcVWmVP1,cplAhHmcVWmVZ1,cplAhcHmVPVWm1,cplAhcHmVWmVZ1,           & 
& cplhhhhcVWmVWm1,cplHmcHmcVWmVWm1,cplsigma1sigma1cVWmVWm1,AmpVertexAhToVWmcVWm)

 Else 
Call Amplitude_VERTEX_THDMIIIHB_AhToVWmcVWm(MAhOS,MFdOS,MFeOS,MFuOS,MhhOS,            & 
& MHmOS,Msigma1OS,MVP,MVWmOS,MVZOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,            & 
& Msigma12OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,               & 
& cplAhsigma1sigma1,cplAhcHmVWm,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFvFecVWmL,               & 
& cplcFvFecVWmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgWmgAVWm,        & 
& cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgWmgZVWm,   & 
& cplcgWpCgZcVWm,cplhhHmcVWm,cplhhcHmVWm,cplhhcVWmVWm,cplHmsigma1cVWm,cplHmcVWmVP,       & 
& cplHmcVWmVZ,cplsigma1cHmVWm,cplcHmVPVWm,cplcVWmVPVWm,cplcHmVWmVZ,cplcVWmVWmVZ,         & 
& cplAhAhcVWmVWm1,cplAhHmcVWmVP1,cplAhHmcVWmVZ1,cplAhcHmVPVWm1,cplAhcHmVWmVZ1,           & 
& cplhhhhcVWmVWm1,cplHmcHmcVWmVWm1,cplsigma1sigma1cVWmVWm1,AmpVertexAhToVWmcVWm)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_THDMIIIHB_AhToVWmcVWm(MAh,MFd,MFe,MFu,Mhh,MHm,Msigma1,          & 
& MVP,MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVP2,MVWm2,MVZ2,cplAhAhAh,         & 
& cplAhAhhh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhsigma1,           & 
& cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFuFdcVWmL,          & 
& cplcFuFdcVWmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,      & 
& cplcFeFvVWmR,cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgAgWpCVWm,    & 
& cplcgZgWpCVWm,cplcgWmgZVWm,cplcgWpCgZcVWm,cplhhHmcVWm,cplhhcHmVWm,cplhhcVWmVWm,        & 
& cplHmsigma1cVWm,cplHmcVWmVP,cplHmcVWmVZ,cplsigma1cHmVWm,cplcHmVPVWm,cplcVWmVPVWm,      & 
& cplcHmVWmVZ,cplcVWmVWmVZ,cplAhAhcVWmVWm1,cplAhHmcVWmVP1,cplAhHmcVWmVZ1,cplAhcHmVPVWm1, & 
& cplAhcHmVWmVZ1,cplhhhhcVWmVWm1,cplHmcHmcVWmVWm1,cplsigma1sigma1cVWmVWm1,               & 
& AmpVertexAhToVWmcVWm)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->VWm conj[VWm] -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToVWmcVWm = 0._dp 
 AmpSum2AhToVWmcVWm = 0._dp  
Else 
 AmpSumAhToVWmcVWm = AmpVertexAhToVWmcVWm + AmpWaveAhToVWmcVWm
 AmpSum2AhToVWmcVWm = AmpVertexAhToVWmcVWm + AmpWaveAhToVWmcVWm 
End If 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MAhOS.gt.(MVWmOS+MVWmOS))).or.((.not.OSkinematics).and.(MAh.gt.(MVWm+MVWm)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MAhOS,MVWmOS,MVWmOS,AmpSumAhToVWmcVWm(:),AmpSum2AhToVWmcVWm(:),AmpSqAhToVWmcVWm) 
Else  
  Call SquareAmp_StoVV(MAh,MVWm,MVWm,AmpSumAhToVWmcVWm(:),AmpSum2AhToVWmcVWm(:),AmpSqAhToVWmcVWm) 
End if  
Else  
  AmpSqAhToVWmcVWm = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToVWmcVWm.le.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAhOS,MVWmOS,MVWmOS,helfactor*AmpSqAhToVWmcVWm)
Else 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAh,MVWm,MVWm,helfactor*AmpSqAhToVWmcVWm)
End if 
If ((Abs(MRPAhToVWmcVWm).gt.1.0E-20_dp).or.(Abs(MRGAhToVWmcVWm).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

isave = i4 
!---------------- 
! VZ VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_THDMIIIHB_AhToVZVZ(MAhOS,MFdOS,MFeOS,MFuOS,MhhOS,               & 
& MHmOS,Msigma1OS,MVWmOS,MVZOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,Msigma12OS,     & 
& MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,            & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,             & 
& cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFdFdVZL,            & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmVZ,              & 
& cplcgWpCgWpCVZ,cplhhsigma1VZ,cplhhVZVZ,cplHmcHmVZ,cplHmcVWmVZ,cplcHmVWmVZ,             & 
& cplcVWmVWmVZ,cplAhAhVZVZ1,cplAhHmcVWmVZ1,cplAhcHmVWmVZ1,cplhhhhVZVZ1,cplHmcHmVZVZ1,    & 
& cplsigma1sigma1VZVZ1,AmpVertexAhToVZVZ)

 Else 
Call Amplitude_VERTEX_THDMIIIHB_AhToVZVZ(MAhOS,MFdOS,MFeOS,MFuOS,MhhOS,               & 
& MHmOS,Msigma1OS,MVWmOS,MVZOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,Msigma12OS,     & 
& MVWm2OS,MVZ2OS,cplAhAhAh,cplAhAhsigma1,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,            & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,             & 
& cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,cplAhcHmVWm,cplcFdFdVZL,            & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmVZ,              & 
& cplcgWpCgWpCVZ,cplhhsigma1VZ,cplhhVZVZ,cplHmcHmVZ,cplHmcVWmVZ,cplcHmVWmVZ,             & 
& cplcVWmVWmVZ,cplAhAhVZVZ1,cplAhHmcVWmVZ1,cplAhcHmVWmVZ1,cplhhhhVZVZ1,cplHmcHmVZVZ1,    & 
& cplsigma1sigma1VZVZ1,AmpVertexAhToVZVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_THDMIIIHB_AhToVZVZ(MAh,MFd,MFe,MFu,Mhh,MHm,Msigma1,             & 
& MVWm,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,Msigma12,MVWm2,MVZ2,cplAhAhAh,cplAhAhsigma1,    & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHmcHm,cplAhHmcVWm,cplAhsigma1sigma1,& 
& cplAhcHmVWm,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhsigma1VZ,cplhhVZVZ,cplHmcHmVZ,            & 
& cplHmcVWmVZ,cplcHmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplAhHmcVWmVZ1,cplAhcHmVWmVZ1,       & 
& cplhhhhVZVZ1,cplHmcHmVZVZ1,cplsigma1sigma1VZVZ1,AmpVertexAhToVZVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->VZ VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToVZVZ = 0._dp 
 AmpSum2AhToVZVZ = 0._dp  
Else 
 AmpSumAhToVZVZ = AmpVertexAhToVZVZ + AmpWaveAhToVZVZ
 AmpSum2AhToVZVZ = AmpVertexAhToVZVZ + AmpWaveAhToVZVZ 
End If 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MAhOS.gt.(MVZOS+MVZOS))).or.((.not.OSkinematics).and.(MAh.gt.(MVZ+MVZ)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MAhOS,MVZOS,MVZOS,AmpSumAhToVZVZ(:),AmpSum2AhToVZVZ(:),AmpSqAhToVZVZ) 
Else  
  Call SquareAmp_StoVV(MAh,MVZ,MVZ,AmpSumAhToVZVZ(:),AmpSum2AhToVZVZ(:),AmpSqAhToVZVZ) 
End if  
Else  
  AmpSqAhToVZVZ = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToVZVZ.le.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS,MVZOS,MVZOS,helfactor*AmpSqAhToVZVZ)
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh,MVZ,MVZ,helfactor*AmpSqAhToVZVZ)
End if 
If ((Abs(MRPAhToVZVZ).gt.1.0E-20_dp).or.(Abs(MRGAhToVZVZ).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

isave = i4 
End Subroutine OneLoopDecay_Ah

End Module Wrapper_OneLoopDecay_Ah_THDMIIIHB
