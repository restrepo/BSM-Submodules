! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 0:32 on 21.12.2017   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_hh_SimplifiedDMSSSFDM
Use Model_Data_SimplifiedDMSSSFDM 
Use Kinematics 
Use OneLoopDecay_hh_SimplifiedDMSSSFDM 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_hh(MFdOS,MFd2OS,MFuOS,MFu2OS,MFeOS,MFe2OS,MFreOS,             & 
& MFre2OS,MHpOS,MHp2OS,MssOS,Mss2OS,MAhOS,MAh2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,              & 
& MVWpOS,MVWp2OS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,MAh,MAh2,MFd,MFd2,MFe,              & 
& MFe2,MFre,MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,               & 
& TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,              & 
& mu2,v,dg1,dg2,dg3,dMFS,dYu,dYs,dYd,dYe,dMS2,dmu2,dLS,dLSH,dLam,dv,dZDL,dZDR,           & 
& dZUL,dZUR,dZEL,dZER,dSinTW,dCosTW,dTanTW,ZfVG,ZfHp,Zfss,ZfvL,Zfed,Zfeu,ZfAh,           & 
& Zfhh,ZfVP,ZfVZ,ZfVWp,ZfDL,ZfDR,ZfUL,ZfUR,ZfEL,ZfER,ZfVPVZ,ZfVZVP,cplAhAhAhAh1,         & 
& cplAhAhcVWpVWp1,cplAhAhhh,cplAhAhhhhh1,cplAhAhHpcHp1,cplAhAhssss1,cplAhAhVZVZ1,        & 
& cplAhcHpVPVWp1,cplAhcHpVWp,cplAhcHpVWpVZ1,cplAhhhVZ,cplAhHpcVWp,cplAhHpcVWpVP1,        & 
& cplAhHpcVWpVZ1,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,            & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,              & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,          & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFressL,              & 
& cplcFeFressR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcFreFessL,       & 
& cplcFreFessR,cplcFreFreVZL,cplcFreFreVZR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,         & 
& cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,              & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFeHpL,               & 
& cplcFvFeHpR,cplcFvFeVWpL,cplcFvFeVWpR,cplcFvFvVZL,cplcFvFvVZR,cplcgAgWCVWp,            & 
& cplcgAgWpcVWp,cplcgWCgAcVWp,cplcgWCgWCAh,cplcgWCgWChh,cplcgWCgWCVP,cplcgWCgWCVZ,       & 
& cplcgWCgZcHp,cplcgWCgZcVWp,cplcgWpgAHp,cplcgWpgAVWp,cplcgWpgWpAh,cplcgWpgWphh,         & 
& cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWpgZHp,cplcgWpgZVWp,cplcgZgAhh,cplcgZgWCHp,             & 
& cplcgZgWCVWp,cplcgZgWpcHp,cplcgZgWpcVWp,cplcgZgZhh,cplcHpVPVWp,cplcHpVWpVZ,            & 
& cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,cplcVWpcVWpVWpVWp3Q,cplcVWpVPVPVWp1Q,          & 
& cplcVWpVPVPVWp2Q,cplcVWpVPVPVWp3Q,cplcVWpVPVWp,cplcVWpVPVWpVZ1Q,cplcVWpVPVWpVZ2Q,      & 
& cplcVWpVPVWpVZ3Q,cplcVWpVWpVZ,cplcVWpVWpVZVZ1Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,      & 
& cplhhcHpVPVWp1,cplhhcHpVWp,cplhhcHpVWpVZ1,cplhhcVWpVWp,cplhhhhcVWpVWp1,cplhhhhhh,      & 
& cplhhhhhhhh1,cplhhhhHpcHp1,cplhhhhssss1,cplhhhhVZVZ1,cplhhHpcHp,cplhhHpcVWp,           & 
& cplhhHpcVWpVP1,cplhhHpcVWpVZ1,cplhhssss,cplhhVZVZ,cplHpcHpcVWpVWp1,cplHpcHpVP,         & 
& cplHpcHpVPVP1,cplHpcHpVPVZ1,cplHpcHpVZ,cplHpcHpVZVZ1,cplHpcVWpVP,cplHpcVWpVZ,          & 
& cplHpHpcHpcHp1,cplHpsssscHp1,cplssssssss1,ctcplAhAhhh,ctcplAhhhVZ,ctcplcFdFdhhL,       & 
& ctcplcFdFdhhR,ctcplcFeFehhL,ctcplcFeFehhR,ctcplcFuFuhhL,ctcplcFuFuhhR,ctcplhhcVWpVWp,  & 
& ctcplhhhhhh,ctcplhhHpcHp,ctcplhhHpcVWp,ctcplhhssss,ctcplhhVZVZ,GcplcHpVPVWp,           & 
& GcplhhcHpVWp,GcplhhHpcHp,GcplhhHpcVWp,GcplHpcVWpVP,GosZcplcHpVPVWp,GosZcplhhcHpVWp,    & 
& GosZcplhhHpcHp,GosZcplhhHpcVWp,GosZcplHpcVWpVP,GZcplcHpVPVWp,GZcplhhcHpVWp,            & 
& GZcplhhHpcHp,GZcplhhHpcVWp,GZcplHpcVWpVP,ZcplAhAhhh,ZcplAhhhVZ,ZcplcFdFdhhL,           & 
& ZcplcFdFdhhR,ZcplcFeFehhL,ZcplcFeFehhR,ZcplcFuFuhhL,ZcplcFuFuhhR,ZcplhhcVWpVWp,        & 
& Zcplhhhhhh,ZcplhhHpcHp,ZcplhhHpcVWp,Zcplhhssss,ZcplhhVZVZ,ZRUVd,ZRUUd,ZRUVu,           & 
& ZRUUu,ZRUVe,ZRUUe,MLambda,em,gs,deltaM,kont,gP1Lhh)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,Ys(3),MS2

Complex(dp),Intent(in) :: LS,LSH,Lam,Yu(3,3),Yd(3,3),Ye(3,3),MFS,mu2

Real(dp),Intent(in) :: v

Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFre,MFre2,MFu(3),MFu2(3),Mhh,Mhh2,            & 
& MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp),Intent(in) :: dg1,dg2,dg3,dYs(3),dMS2,dv,dSinTW,dCosTW,dTanTW

Complex(dp),Intent(in) :: dMFS,dYu(3,3),dYd(3,3),dYe(3,3),dmu2,dLS,dLSH,dLam,dZDL(3,3),dZDR(3,3),               & 
& dZUL(3,3),dZUR(3,3),dZEL(3,3),dZER(3,3)

Complex(dp),Intent(in) :: cplAhAhAhAh1,cplAhAhcVWpVWp1,cplAhAhhh,cplAhAhhhhh1,cplAhAhHpcHp1,cplAhAhssss1,       & 
& cplAhAhVZVZ1,cplAhcHpVPVWp1,cplAhcHpVWp,cplAhcHpVWpVZ1,cplAhhhVZ,cplAhHpcVWp,          & 
& cplAhHpcVWpVP1,cplAhHpcVWpVZ1,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFdFdhhL(3,3),      & 
& cplcFdFdhhR(3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),  & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),cplcFdFucVWpL(3,3),& 
& cplcFdFucVWpR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),& 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFressL(3),   & 
& cplcFeFressR(3),cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),& 
& cplcFreFessL(3),cplcFreFessR(3),cplcFreFreVZL,cplcFreFreVZR,cplcFuFdHpL(3,3),          & 
& cplcFuFdHpR(3,3),cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),& 
& cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),  & 
& cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFvFeHpL(3,3),cplcFvFeHpR(3,3),  & 
& cplcFvFeVWpL(3,3),cplcFvFeVWpR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplcgAgWCVWp,    & 
& cplcgAgWpcVWp,cplcgWCgAcVWp,cplcgWCgWCAh,cplcgWCgWChh,cplcgWCgWCVP,cplcgWCgWCVZ,       & 
& cplcgWCgZcHp,cplcgWCgZcVWp,cplcgWpgAHp,cplcgWpgAVWp,cplcgWpgWpAh,cplcgWpgWphh,         & 
& cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWpgZHp,cplcgWpgZVWp,cplcgZgAhh,cplcgZgWCHp,             & 
& cplcgZgWCVWp,cplcgZgWpcHp,cplcgZgWpcVWp,cplcgZgZhh,cplcHpVPVWp,cplcHpVWpVZ,            & 
& cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,cplcVWpcVWpVWpVWp3Q,cplcVWpVPVPVWp1Q,          & 
& cplcVWpVPVPVWp2Q,cplcVWpVPVPVWp3Q,cplcVWpVPVWp,cplcVWpVPVWpVZ1Q,cplcVWpVPVWpVZ2Q,      & 
& cplcVWpVPVWpVZ3Q,cplcVWpVWpVZ,cplcVWpVWpVZVZ1Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,      & 
& cplhhcHpVPVWp1,cplhhcHpVWp,cplhhcHpVWpVZ1,cplhhcVWpVWp,cplhhhhcVWpVWp1,cplhhhhhh,      & 
& cplhhhhhhhh1,cplhhhhHpcHp1,cplhhhhssss1,cplhhhhVZVZ1,cplhhHpcHp,cplhhHpcVWp,           & 
& cplhhHpcVWpVP1,cplhhHpcVWpVZ1,cplhhssss,cplhhVZVZ,cplHpcHpcVWpVWp1,cplHpcHpVP,         & 
& cplHpcHpVPVP1,cplHpcHpVPVZ1,cplHpcHpVZ,cplHpcHpVZVZ1,cplHpcVWpVP,cplHpcVWpVZ,          & 
& cplHpHpcHpcHp1,cplHpsssscHp1,cplssssssss1,ctcplAhAhhh,ctcplAhhhVZ,ctcplcFdFdhhL(3,3),  & 
& ctcplcFdFdhhR(3,3),ctcplcFeFehhL(3,3),ctcplcFeFehhR(3,3),ctcplcFuFuhhL(3,3),           & 
& ctcplcFuFuhhR(3,3),ctcplhhcVWpVWp,ctcplhhhhhh,ctcplhhHpcHp,ctcplhhHpcVWp,              & 
& ctcplhhssss,ctcplhhVZVZ,GcplcHpVPVWp,GcplhhcHpVWp,GcplhhHpcHp,GcplhhHpcVWp,            & 
& GcplHpcVWpVP,GosZcplcHpVPVWp,GosZcplhhcHpVWp,GosZcplhhHpcHp,GosZcplhhHpcVWp,           & 
& GosZcplHpcVWpVP,GZcplcHpVPVWp,GZcplhhcHpVWp,GZcplhhHpcHp,GZcplhhHpcVWp,GZcplHpcVWpVP,  & 
& ZcplAhAhhh,ZcplAhhhVZ,ZcplcFdFdhhL(3,3),ZcplcFdFdhhR(3,3),ZcplcFeFehhL(3,3),           & 
& ZcplcFeFehhR(3,3),ZcplcFuFuhhL(3,3),ZcplcFuFuhhR(3,3),ZcplhhcVWpVWp,Zcplhhhhhh,        & 
& ZcplhhHpcHp,ZcplhhHpcVWp,Zcplhhssss,ZcplhhVZVZ

Real(dp), Intent(in) :: em, gs 
Complex(dp),Intent(in) :: ZfVG,ZfHp,Zfss,ZfvL(3,3),Zfed,Zfeu,ZfAh,Zfhh,ZfVP,ZfVZ,ZfVWp,ZfDL(3,3),               & 
& ZfDR(3,3),ZfUL(3,3),ZfUR(3,3),ZfEL(3,3),ZfER(3,3),ZfVPVZ,ZfVZVP

Real(dp),Intent(in) :: MFdOS(3),MFd2OS(3),MFuOS(3),MFu2OS(3),MFeOS(3),MFe2OS(3),MFreOS,MFre2OS,              & 
& MHpOS,MHp2OS,MssOS,Mss2OS,MAhOS,MAh2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,MVWpOS,MVWp2OS

Complex(dp),Intent(in) :: ZDLOS(3,3),ZDROS(3,3),ZULOS(3,3),ZUROS(3,3),ZELOS(3,3),ZEROS(3,3)

Complex(dp),Intent(in) :: ZRUVd(3,3),ZRUUd(3,3),ZRUVu(3,3),ZRUUu(3,3),ZRUVe(3,3),ZRUUe(3,3)

Real(dp), Intent(in) :: MLambda, deltaM 
Real(dp), Intent(out) :: gP1Lhh(1,50) 
Integer, Intent(out) :: kont 
Real(dp) :: MVG,MVP,MVG2,MVP2, helfactor, phasespacefactor 
Integer :: i1,i2,i3,i4, isave, gt1, gt2, gt3 

Complex(dp) :: ZRUVdc(3, 3) 
Complex(dp) :: ZRUUdc(3, 3) 
Complex(dp) :: ZRUVuc(3, 3) 
Complex(dp) :: ZRUUuc(3, 3) 
Complex(dp) :: ZRUVec(3, 3) 
Complex(dp) :: ZRUUec(3, 3) 
Real(dp) :: MRPhhTocFdFd(3,3),MRGhhTocFdFd(3,3), MRPZhhTocFdFd(3,3),MRGZhhTocFdFd(3,3) 
Real(dp) :: MVPhhTocFdFd(3,3) 
Real(dp) :: RMsqTreehhTocFdFd(3,3),RMsqWavehhTocFdFd(3,3),RMsqVertexhhTocFdFd(3,3) 
Complex(dp) :: AmpTreehhTocFdFd(2,3,3),AmpWavehhTocFdFd(2,3,3)=(0._dp,0._dp),AmpVertexhhTocFdFd(2,3,3)& 
 & ,AmpVertexIRoshhTocFdFd(2,3,3),AmpVertexIRdrhhTocFdFd(2,3,3), AmpSumhhTocFdFd(2,3,3), AmpSum2hhTocFdFd(2,3,3) 
Complex(dp) :: AmpTreeZhhTocFdFd(2,3,3),AmpWaveZhhTocFdFd(2,3,3),AmpVertexZhhTocFdFd(2,3,3) 
Real(dp) :: AmpSqhhTocFdFd(3,3),  AmpSqTreehhTocFdFd(3,3) 
Real(dp) :: MRPhhTocFeFe(3,3),MRGhhTocFeFe(3,3), MRPZhhTocFeFe(3,3),MRGZhhTocFeFe(3,3) 
Real(dp) :: MVPhhTocFeFe(3,3) 
Real(dp) :: RMsqTreehhTocFeFe(3,3),RMsqWavehhTocFeFe(3,3),RMsqVertexhhTocFeFe(3,3) 
Complex(dp) :: AmpTreehhTocFeFe(2,3,3),AmpWavehhTocFeFe(2,3,3)=(0._dp,0._dp),AmpVertexhhTocFeFe(2,3,3)& 
 & ,AmpVertexIRoshhTocFeFe(2,3,3),AmpVertexIRdrhhTocFeFe(2,3,3), AmpSumhhTocFeFe(2,3,3), AmpSum2hhTocFeFe(2,3,3) 
Complex(dp) :: AmpTreeZhhTocFeFe(2,3,3),AmpWaveZhhTocFeFe(2,3,3),AmpVertexZhhTocFeFe(2,3,3) 
Real(dp) :: AmpSqhhTocFeFe(3,3),  AmpSqTreehhTocFeFe(3,3) 
Real(dp) :: MRPhhTocFuFu(3,3),MRGhhTocFuFu(3,3), MRPZhhTocFuFu(3,3),MRGZhhTocFuFu(3,3) 
Real(dp) :: MVPhhTocFuFu(3,3) 
Real(dp) :: RMsqTreehhTocFuFu(3,3),RMsqWavehhTocFuFu(3,3),RMsqVertexhhTocFuFu(3,3) 
Complex(dp) :: AmpTreehhTocFuFu(2,3,3),AmpWavehhTocFuFu(2,3,3)=(0._dp,0._dp),AmpVertexhhTocFuFu(2,3,3)& 
 & ,AmpVertexIRoshhTocFuFu(2,3,3),AmpVertexIRdrhhTocFuFu(2,3,3), AmpSumhhTocFuFu(2,3,3), AmpSum2hhTocFuFu(2,3,3) 
Complex(dp) :: AmpTreeZhhTocFuFu(2,3,3),AmpWaveZhhTocFuFu(2,3,3),AmpVertexZhhTocFuFu(2,3,3) 
Real(dp) :: AmpSqhhTocFuFu(3,3),  AmpSqTreehhTocFuFu(3,3) 
Real(dp) :: MRPhhTohhhh,MRGhhTohhhh, MRPZhhTohhhh,MRGZhhTohhhh 
Real(dp) :: MVPhhTohhhh 
Real(dp) :: RMsqTreehhTohhhh,RMsqWavehhTohhhh,RMsqVertexhhTohhhh 
Complex(dp) :: AmpTreehhTohhhh,AmpWavehhTohhhh=(0._dp,0._dp),AmpVertexhhTohhhh& 
 & ,AmpVertexIRoshhTohhhh,AmpVertexIRdrhhTohhhh, AmpSumhhTohhhh, AmpSum2hhTohhhh 
Complex(dp) :: AmpTreeZhhTohhhh,AmpWaveZhhTohhhh,AmpVertexZhhTohhhh 
Real(dp) :: AmpSqhhTohhhh,  AmpSqTreehhTohhhh 
Real(dp) :: MRPhhTossss,MRGhhTossss, MRPZhhTossss,MRGZhhTossss 
Real(dp) :: MVPhhTossss 
Real(dp) :: RMsqTreehhTossss,RMsqWavehhTossss,RMsqVertexhhTossss 
Complex(dp) :: AmpTreehhTossss,AmpWavehhTossss=(0._dp,0._dp),AmpVertexhhTossss& 
 & ,AmpVertexIRoshhTossss,AmpVertexIRdrhhTossss, AmpSumhhTossss, AmpSum2hhTossss 
Complex(dp) :: AmpTreeZhhTossss,AmpWaveZhhTossss,AmpVertexZhhTossss 
Real(dp) :: AmpSqhhTossss,  AmpSqTreehhTossss 
Real(dp) :: MRPhhTocVWpVWp,MRGhhTocVWpVWp, MRPZhhTocVWpVWp,MRGZhhTocVWpVWp 
Real(dp) :: MVPhhTocVWpVWp 
Real(dp) :: RMsqTreehhTocVWpVWp,RMsqWavehhTocVWpVWp,RMsqVertexhhTocVWpVWp 
Complex(dp) :: AmpTreehhTocVWpVWp(2),AmpWavehhTocVWpVWp(2)=(0._dp,0._dp),AmpVertexhhTocVWpVWp(2)& 
 & ,AmpVertexIRoshhTocVWpVWp(2),AmpVertexIRdrhhTocVWpVWp(2), AmpSumhhTocVWpVWp(2), AmpSum2hhTocVWpVWp(2) 
Complex(dp) :: AmpTreeZhhTocVWpVWp(2),AmpWaveZhhTocVWpVWp(2),AmpVertexZhhTocVWpVWp(2) 
Real(dp) :: AmpSqhhTocVWpVWp,  AmpSqTreehhTocVWpVWp 
Real(dp) :: MRPhhToVZVZ,MRGhhToVZVZ, MRPZhhToVZVZ,MRGZhhToVZVZ 
Real(dp) :: MVPhhToVZVZ 
Real(dp) :: RMsqTreehhToVZVZ,RMsqWavehhToVZVZ,RMsqVertexhhToVZVZ 
Complex(dp) :: AmpTreehhToVZVZ(2),AmpWavehhToVZVZ(2)=(0._dp,0._dp),AmpVertexhhToVZVZ(2)& 
 & ,AmpVertexIRoshhToVZVZ(2),AmpVertexIRdrhhToVZVZ(2), AmpSumhhToVZVZ(2), AmpSum2hhToVZVZ(2) 
Complex(dp) :: AmpTreeZhhToVZVZ(2),AmpWaveZhhToVZVZ(2),AmpVertexZhhToVZVZ(2) 
Real(dp) :: AmpSqhhToVZVZ,  AmpSqTreehhToVZVZ 
Real(dp) :: MRPhhToFrecFre,MRGhhToFrecFre, MRPZhhToFrecFre,MRGZhhToFrecFre 
Real(dp) :: MVPhhToFrecFre 
Real(dp) :: RMsqTreehhToFrecFre,RMsqWavehhToFrecFre,RMsqVertexhhToFrecFre 
Complex(dp) :: AmpTreehhToFrecFre(2),AmpWavehhToFrecFre(2)=(0._dp,0._dp),AmpVertexhhToFrecFre(2)& 
 & ,AmpVertexIRoshhToFrecFre(2),AmpVertexIRdrhhToFrecFre(2), AmpSumhhToFrecFre(2), AmpSum2hhToFrecFre(2) 
Complex(dp) :: AmpTreeZhhToFrecFre(2),AmpWaveZhhToFrecFre(2),AmpVertexZhhToFrecFre(2) 
Real(dp) :: AmpSqhhToFrecFre,  AmpSqTreehhToFrecFre 
Real(dp) :: MRPhhToFvcFv(3,3),MRGhhToFvcFv(3,3), MRPZhhToFvcFv(3,3),MRGZhhToFvcFv(3,3) 
Real(dp) :: MVPhhToFvcFv(3,3) 
Real(dp) :: RMsqTreehhToFvcFv(3,3),RMsqWavehhToFvcFv(3,3),RMsqVertexhhToFvcFv(3,3) 
Complex(dp) :: AmpTreehhToFvcFv(2,3,3),AmpWavehhToFvcFv(2,3,3)=(0._dp,0._dp),AmpVertexhhToFvcFv(2,3,3)& 
 & ,AmpVertexIRoshhToFvcFv(2,3,3),AmpVertexIRdrhhToFvcFv(2,3,3), AmpSumhhToFvcFv(2,3,3), AmpSum2hhToFvcFv(2,3,3) 
Complex(dp) :: AmpTreeZhhToFvcFv(2,3,3),AmpWaveZhhToFvcFv(2,3,3),AmpVertexZhhToFvcFv(2,3,3) 
Real(dp) :: AmpSqhhToFvcFv(3,3),  AmpSqTreehhToFvcFv(3,3) 
Real(dp) :: MRPhhTohhVP,MRGhhTohhVP, MRPZhhTohhVP,MRGZhhTohhVP 
Real(dp) :: MVPhhTohhVP 
Real(dp) :: RMsqTreehhTohhVP,RMsqWavehhTohhVP,RMsqVertexhhTohhVP 
Complex(dp) :: AmpTreehhTohhVP(2),AmpWavehhTohhVP(2)=(0._dp,0._dp),AmpVertexhhTohhVP(2)& 
 & ,AmpVertexIRoshhTohhVP(2),AmpVertexIRdrhhTohhVP(2), AmpSumhhTohhVP(2), AmpSum2hhTohhVP(2) 
Complex(dp) :: AmpTreeZhhTohhVP(2),AmpWaveZhhTohhVP(2),AmpVertexZhhTohhVP(2) 
Real(dp) :: AmpSqhhTohhVP,  AmpSqTreehhTohhVP 
Real(dp) :: MRPhhTohhVZ,MRGhhTohhVZ, MRPZhhTohhVZ,MRGZhhTohhVZ 
Real(dp) :: MVPhhTohhVZ 
Real(dp) :: RMsqTreehhTohhVZ,RMsqWavehhTohhVZ,RMsqVertexhhTohhVZ 
Complex(dp) :: AmpTreehhTohhVZ(2),AmpWavehhTohhVZ(2)=(0._dp,0._dp),AmpVertexhhTohhVZ(2)& 
 & ,AmpVertexIRoshhTohhVZ(2),AmpVertexIRdrhhTohhVZ(2), AmpSumhhTohhVZ(2), AmpSum2hhTohhVZ(2) 
Complex(dp) :: AmpTreeZhhTohhVZ(2),AmpWaveZhhTohhVZ(2),AmpVertexZhhTohhVZ(2) 
Real(dp) :: AmpSqhhTohhVZ,  AmpSqTreehhTohhVZ 
Real(dp) :: MRPhhToVGVG,MRGhhToVGVG, MRPZhhToVGVG,MRGZhhToVGVG 
Real(dp) :: MVPhhToVGVG 
Real(dp) :: RMsqTreehhToVGVG,RMsqWavehhToVGVG,RMsqVertexhhToVGVG 
Complex(dp) :: AmpTreehhToVGVG(2),AmpWavehhToVGVG(2)=(0._dp,0._dp),AmpVertexhhToVGVG(2)& 
 & ,AmpVertexIRoshhToVGVG(2),AmpVertexIRdrhhToVGVG(2), AmpSumhhToVGVG(2), AmpSum2hhToVGVG(2) 
Complex(dp) :: AmpTreeZhhToVGVG(2),AmpWaveZhhToVGVG(2),AmpVertexZhhToVGVG(2) 
Real(dp) :: AmpSqhhToVGVG,  AmpSqTreehhToVGVG 
Real(dp) :: MRPhhToVPVP,MRGhhToVPVP, MRPZhhToVPVP,MRGZhhToVPVP 
Real(dp) :: MVPhhToVPVP 
Real(dp) :: RMsqTreehhToVPVP,RMsqWavehhToVPVP,RMsqVertexhhToVPVP 
Complex(dp) :: AmpTreehhToVPVP(2),AmpWavehhToVPVP(2)=(0._dp,0._dp),AmpVertexhhToVPVP(2)& 
 & ,AmpVertexIRoshhToVPVP(2),AmpVertexIRdrhhToVPVP(2), AmpSumhhToVPVP(2), AmpSum2hhToVPVP(2) 
Complex(dp) :: AmpTreeZhhToVPVP(2),AmpWaveZhhToVPVP(2),AmpVertexZhhToVPVP(2) 
Real(dp) :: AmpSqhhToVPVP,  AmpSqTreehhToVPVP 
Real(dp) :: MRPhhToVPVZ,MRGhhToVPVZ, MRPZhhToVPVZ,MRGZhhToVPVZ 
Real(dp) :: MVPhhToVPVZ 
Real(dp) :: RMsqTreehhToVPVZ,RMsqWavehhToVPVZ,RMsqVertexhhToVPVZ 
Complex(dp) :: AmpTreehhToVPVZ(2),AmpWavehhToVPVZ(2)=(0._dp,0._dp),AmpVertexhhToVPVZ(2)& 
 & ,AmpVertexIRoshhToVPVZ(2),AmpVertexIRdrhhToVPVZ(2), AmpSumhhToVPVZ(2), AmpSum2hhToVPVZ(2) 
Complex(dp) :: AmpTreeZhhToVPVZ(2),AmpWaveZhhToVPVZ(2),AmpVertexZhhToVPVZ(2) 
Real(dp) :: AmpSqhhToVPVZ,  AmpSqTreehhToVPVZ 
Write(*,*) "Calculating one-loop decays of hh " 
kont = 0 
MVG = MLambda 
MVP = MLambda 
MVG2 = MLambda**2 
MVP2 = MLambda**2 

ZRUVdc = Conjg(ZRUVd)
ZRUUdc = Conjg(ZRUUd)
ZRUVuc = Conjg(ZRUVu)
ZRUUuc = Conjg(ZRUUu)
ZRUVec = Conjg(ZRUVe)
ZRUUec = Conjg(ZRUUe)

 ! Counter 
isave = 5

If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fd) Fd
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_SimplifiedDMSSSFDM_hhTocFdFd(cplcFdFdhhL,cplcFdFdhhR,             & 
& MFd,Mhh,MFd2,Mhh2,AmpTreehhTocFdFd)

  Else 
Call Amplitude_Tree_SimplifiedDMSSSFDM_hhTocFdFd(ZcplcFdFdhhL,ZcplcFdFdhhR,           & 
& MFd,Mhh,MFd2,Mhh2,AmpTreehhTocFdFd)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_hhTocFdFd(MLambda,em,gs,cplcFdFdhhL,               & 
& cplcFdFdhhR,MFdOS,MhhOS,MRPhhTocFdFd,MRGhhTocFdFd)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_hhTocFdFd(MLambda,em,gs,ZcplcFdFdhhL,              & 
& ZcplcFdFdhhR,MFdOS,MhhOS,MRPhhTocFdFd,MRGhhTocFdFd)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_SimplifiedDMSSSFDM_hhTocFdFd(MLambda,em,gs,cplcFdFdhhL,               & 
& cplcFdFdhhR,MFd,Mhh,MRPhhTocFdFd,MRGhhTocFdFd)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_hhTocFdFd(MLambda,em,gs,ZcplcFdFdhhL,              & 
& ZcplcFdFdhhR,MFd,Mhh,MRPhhTocFdFd,MRGhhTocFdFd)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_SimplifiedDMSSSFDM_hhTocFdFd(cplcFdFdhhL,cplcFdFdhhR,             & 
& ctcplcFdFdhhL,ctcplcFdFdhhR,MFd,MFd2,Mhh,Mhh2,ZfDL,ZfDR,Zfhh,AmpWavehhTocFdFd)



!Vertex Corrections 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTocFdFd(MAh,MFd,MFu,Mhh,MHp,               & 
& MVG,MVP,MVWp,MVZ,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,              & 
& cplcFdFdAhL,cplcFdFdAhR,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,     & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,              & 
& cplhhcVWpVWp,cplhhVZVZ,AmpVertexhhTocFdFd)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocFdFd(MAh,MFd,MFu,Mhh,MHp,            & 
& MVG,MVP,MVWp,MVZ,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,              & 
& cplcFdFdAhL,cplcFdFdAhR,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,     & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,              & 
& cplhhcVWpVWp,cplhhVZVZ,AmpVertexIRdrhhTocFdFd)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocFdFd(MAhOS,MFdOS,MFuOS,              & 
& MhhOS,MHpOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,              & 
& MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhVZ,ZcplcFdFdhhL,          & 
& ZcplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,             & 
& cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,           & 
& cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,AmpVertexIRoshhTocFdFd)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocFdFd(MAh,MFd,MFu,Mhh,MHp,            & 
& MVG,MVP,MVWp,MVZ,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,              & 
& cplcFdFdAhL,cplcFdFdAhR,cplAhhhVZ,ZcplcFdFdhhL,ZcplcFdFdhhR,cplcFuFdHpL,               & 
& cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,              & 
& cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,             & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,             & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,AmpVertexIRoshhTocFdFd)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocFdFd(MAhOS,MFdOS,MFuOS,              & 
& MhhOS,MHpOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,              & 
& MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhVZ,cplcFdFdhhL,           & 
& cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,               & 
& cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,             & 
& cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,           & 
& cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,AmpVertexIRoshhTocFdFd)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocFdFd(MAh,MFd,MFu,Mhh,MHp,            & 
& MVG,MVP,MVWp,MVZ,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,              & 
& cplcFdFdAhL,cplcFdFdAhR,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,     & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,              & 
& cplhhcVWpVWp,cplhhVZVZ,AmpVertexIRoshhTocFdFd)

 End if 
 End if 
AmpVertexhhTocFdFd = AmpVertexhhTocFdFd -  AmpVertexIRdrhhTocFdFd! +  AmpVertexIRoshhTocFdFd ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Final State 1 
AmpWaveZhhTocFdFd=0._dp 
AmpVertexZhhTocFdFd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFdFd(1,gt2,:) = AmpWaveZhhTocFdFd(1,gt2,:)+ZRUUd(gt2,gt1)*AmpWavehhTocFdFd(1,gt1,:) 
AmpVertexZhhTocFdFd(1,gt2,:)= AmpVertexZhhTocFdFd(1,gt2,:)+ZRUUd(gt2,gt1)*AmpVertexhhTocFdFd(1,gt1,:) 
AmpWaveZhhTocFdFd(2,gt2,:) = AmpWaveZhhTocFdFd(2,gt2,:)+ZRUVdc(gt2,gt1)*AmpWavehhTocFdFd(2,gt1,:) 
AmpVertexZhhTocFdFd(2,gt2,:)= AmpVertexZhhTocFdFd(2,gt2,:)+ZRUVdc(gt2,gt1)*AmpVertexhhTocFdFd(2,gt1,:) 
 End Do 
End Do 
AmpWavehhTocFdFd=AmpWaveZhhTocFdFd 
AmpVertexhhTocFdFd= AmpVertexZhhTocFdFd
! Final State 2 
AmpWaveZhhTocFdFd=0._dp 
AmpVertexZhhTocFdFd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFdFd(1,:,gt2) = AmpWaveZhhTocFdFd(1,:,gt2)+ZRUVd(gt2,gt1)*AmpWavehhTocFdFd(1,:,gt1) 
AmpVertexZhhTocFdFd(1,:,gt2)= AmpVertexZhhTocFdFd(1,:,gt2)+ZRUVd(gt2,gt1)*AmpVertexhhTocFdFd(1,:,gt1) 
AmpWaveZhhTocFdFd(2,:,gt2) = AmpWaveZhhTocFdFd(2,:,gt2)+ZRUUd(gt2,gt1)*AmpWavehhTocFdFd(2,:,gt1) 
AmpVertexZhhTocFdFd(2,:,gt2)= AmpVertexZhhTocFdFd(2,:,gt2)+ZRUUd(gt2,gt1)*AmpVertexhhTocFdFd(2,:,gt1) 
 End Do 
End Do 
AmpWavehhTocFdFd=AmpWaveZhhTocFdFd 
AmpVertexhhTocFdFd= AmpVertexZhhTocFdFd
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocFdFd = AmpVertexhhTocFdFd  +  AmpVertexIRoshhTocFdFd
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->bar[Fd] Fd -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocFdFd = AmpTreehhTocFdFd 
 AmpSum2hhTocFdFd = AmpTreehhTocFdFd + 2._dp*AmpWavehhTocFdFd + 2._dp*AmpVertexhhTocFdFd  
Else 
 AmpSumhhTocFdFd = AmpTreehhTocFdFd + AmpWavehhTocFdFd + AmpVertexhhTocFdFd
 AmpSum2hhTocFdFd = AmpTreehhTocFdFd + AmpWavehhTocFdFd + AmpVertexhhTocFdFd 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocFdFd = AmpTreehhTocFdFd
 AmpSum2hhTocFdFd = AmpTreehhTocFdFd 
End if 
gt1=1 
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(MhhOS.gt.(MFdOS(gt2)+MFdOS(gt3)))).or.((.not.OSkinematics).and.(Mhh.gt.(MFd(gt2)+MFd(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt2, gt3 
  AmpSum2hhTocFdFd = AmpTreehhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS,MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt2, gt3),AmpSum2hhTocFdFd(:,gt2, gt3),AmpSqhhTocFdFd(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh,MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt2, gt3),AmpSum2hhTocFdFd(:,gt2, gt3),AmpSqhhTocFdFd(gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocFdFd(gt2, gt3) 
  AmpSum2hhTocFdFd = 2._dp*AmpWavehhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS,MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt2, gt3),AmpSum2hhTocFdFd(:,gt2, gt3),AmpSqhhTocFdFd(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh,MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt2, gt3),AmpSum2hhTocFdFd(:,gt2, gt3),AmpSqhhTocFdFd(gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocFdFd(gt2, gt3) 
  AmpSum2hhTocFdFd = 2._dp*AmpVertexhhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS,MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt2, gt3),AmpSum2hhTocFdFd(:,gt2, gt3),AmpSqhhTocFdFd(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh,MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt2, gt3),AmpSum2hhTocFdFd(:,gt2, gt3),AmpSqhhTocFdFd(gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocFdFd(gt2, gt3) 
  AmpSum2hhTocFdFd = AmpTreehhTocFdFd + 2._dp*AmpWavehhTocFdFd + 2._dp*AmpVertexhhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS,MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt2, gt3),AmpSum2hhTocFdFd(:,gt2, gt3),AmpSqhhTocFdFd(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh,MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt2, gt3),AmpSum2hhTocFdFd(:,gt2, gt3),AmpSqhhTocFdFd(gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocFdFd(gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocFdFd = AmpTreehhTocFdFd
  Call SquareAmp_StoFF(MhhOS,MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt2, gt3),AmpSum2hhTocFdFd(:,gt2, gt3),AmpSqhhTocFdFd(gt2, gt3)) 
  AmpSqTreehhTocFdFd(gt2, gt3) = AmpSqhhTocFdFd(gt2, gt3)  
  AmpSum2hhTocFdFd = + 2._dp*AmpWavehhTocFdFd + 2._dp*AmpVertexhhTocFdFd
  Call SquareAmp_StoFF(MhhOS,MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt2, gt3),AmpSum2hhTocFdFd(:,gt2, gt3),AmpSqhhTocFdFd(gt2, gt3)) 
  AmpSqhhTocFdFd(gt2, gt3) = AmpSqhhTocFdFd(gt2, gt3) + AmpSqTreehhTocFdFd(gt2, gt3)  
Else  
  AmpSum2hhTocFdFd = AmpTreehhTocFdFd
  Call SquareAmp_StoFF(Mhh,MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt2, gt3),AmpSum2hhTocFdFd(:,gt2, gt3),AmpSqhhTocFdFd(gt2, gt3)) 
  AmpSqTreehhTocFdFd(gt2, gt3) = AmpSqhhTocFdFd(gt2, gt3)  
  AmpSum2hhTocFdFd = + 2._dp*AmpWavehhTocFdFd + 2._dp*AmpVertexhhTocFdFd
  Call SquareAmp_StoFF(Mhh,MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt2, gt3),AmpSum2hhTocFdFd(:,gt2, gt3),AmpSqhhTocFdFd(gt2, gt3)) 
  AmpSqhhTocFdFd(gt2, gt3) = AmpSqhhTocFdFd(gt2, gt3) + AmpSqTreehhTocFdFd(gt2, gt3)  
End if  
Else  
  AmpSqhhTocFdFd(gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqhhTocFdFd(gt2, gt3).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(MhhOS,MFdOS(gt2),MFdOS(gt3),helfactor*AmpSqhhTocFdFd(gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(Mhh,MFd(gt2),MFd(gt3),helfactor*AmpSqhhTocFdFd(gt2, gt3))
End if 
If ((Abs(MRPhhTocFdFd(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFdFd(gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocFdFd(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFdFd(gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocFdFd(gt2, gt3) + MRGhhTocFdFd(gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocFdFd(gt2, gt3) + MRGhhTocFdFd(gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
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
Call Amplitude_Tree_SimplifiedDMSSSFDM_hhTocFeFe(cplcFeFehhL,cplcFeFehhR,             & 
& MFe,Mhh,MFe2,Mhh2,AmpTreehhTocFeFe)

  Else 
Call Amplitude_Tree_SimplifiedDMSSSFDM_hhTocFeFe(ZcplcFeFehhL,ZcplcFeFehhR,           & 
& MFe,Mhh,MFe2,Mhh2,AmpTreehhTocFeFe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_hhTocFeFe(MLambda,em,gs,cplcFeFehhL,               & 
& cplcFeFehhR,MFeOS,MhhOS,MRPhhTocFeFe,MRGhhTocFeFe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_hhTocFeFe(MLambda,em,gs,ZcplcFeFehhL,              & 
& ZcplcFeFehhR,MFeOS,MhhOS,MRPhhTocFeFe,MRGhhTocFeFe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_SimplifiedDMSSSFDM_hhTocFeFe(MLambda,em,gs,cplcFeFehhL,               & 
& cplcFeFehhR,MFe,Mhh,MRPhhTocFeFe,MRGhhTocFeFe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_hhTocFeFe(MLambda,em,gs,ZcplcFeFehhL,              & 
& ZcplcFeFehhR,MFe,Mhh,MRPhhTocFeFe,MRGhhTocFeFe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_SimplifiedDMSSSFDM_hhTocFeFe(cplcFeFehhL,cplcFeFehhR,             & 
& ctcplcFeFehhL,ctcplcFeFehhR,MFe,MFe2,Mhh,Mhh2,ZfEL,ZfER,Zfhh,AmpWavehhTocFeFe)



!Vertex Corrections 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTocFeFe(MAh,MFe,MFre,Mhh,MHp,              & 
& Mss,MVP,MVWp,MVZ,MAh2,MFe2,MFre2,Mhh2,MHp2,Mss2,MVP2,MVWp2,MVZ2,cplAhAhhh,             & 
& cplcFeFeAhL,cplcFeFeAhR,cplAhhhVZ,cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,     & 
& cplcFreFessL,cplcFreFessR,cplcFeFeVPL,cplcFeFeVPR,cplcFvFeVWpL,cplcFvFeVWpR,           & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFressL,cplcFeFressR,cplcFeFvcHpL,cplcFeFvcHpR,           & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhssss,cplhhcHpVWp,    & 
& cplhhcVWpVWp,cplhhVZVZ,AmpVertexhhTocFeFe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocFeFe(MAh,MFe,MFre,Mhh,               & 
& MHp,Mss,MVP,MVWp,MVZ,MAh2,MFe2,MFre2,Mhh2,MHp2,Mss2,MVP2,MVWp2,MVZ2,cplAhAhhh,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplAhhhVZ,cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,     & 
& cplcFreFessL,cplcFreFessR,cplcFeFeVPL,cplcFeFeVPR,cplcFvFeVWpL,cplcFvFeVWpR,           & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFressL,cplcFeFressR,cplcFeFvcHpL,cplcFeFvcHpR,           & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhssss,cplhhcHpVWp,    & 
& cplhhcVWpVWp,cplhhVZVZ,AmpVertexIRdrhhTocFeFe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocFeFe(MAhOS,MFeOS,MFreOS,             & 
& MhhOS,MHpOS,MssOS,MVP,MVWpOS,MVZOS,MAh2OS,MFe2OS,MFre2OS,Mhh2OS,MHp2OS,Mss2OS,         & 
& MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVZ,ZcplcFeFehhL,          & 
& ZcplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,cplcFreFessL,cplcFreFessR,cplcFeFeVPL,            & 
& cplcFeFeVPR,cplcFvFeVWpL,cplcFvFeVWpR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFressL,            & 
& cplcFeFressR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,          & 
& cplhhHpcHp,cplhhHpcVWp,cplhhssss,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,AmpVertexIRoshhTocFeFe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocFeFe(MAh,MFe,MFre,Mhh,               & 
& MHp,Mss,MVP,MVWp,MVZ,MAh2,MFe2,MFre2,Mhh2,MHp2,Mss2,MVP2,MVWp2,MVZ2,cplAhAhhh,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplAhhhVZ,ZcplcFeFehhL,ZcplcFeFehhR,cplcFvFeHpL,               & 
& cplcFvFeHpR,cplcFreFessL,cplcFreFessR,cplcFeFeVPL,cplcFeFeVPR,cplcFvFeVWpL,            & 
& cplcFvFeVWpR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFressL,cplcFeFressR,cplcFeFvcHpL,           & 
& cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,             & 
& cplhhssss,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,AmpVertexIRoshhTocFeFe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocFeFe(MAhOS,MFeOS,MFreOS,             & 
& MhhOS,MHpOS,MssOS,MVP,MVWpOS,MVZOS,MAh2OS,MFe2OS,MFre2OS,Mhh2OS,MHp2OS,Mss2OS,         & 
& MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVZ,cplcFeFehhL,           & 
& cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,cplcFreFessL,cplcFreFessR,cplcFeFeVPL,             & 
& cplcFeFeVPR,cplcFvFeVWpL,cplcFvFeVWpR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFressL,            & 
& cplcFeFressR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,          & 
& cplhhHpcHp,cplhhHpcVWp,cplhhssss,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,AmpVertexIRoshhTocFeFe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocFeFe(MAh,MFe,MFre,Mhh,               & 
& MHp,Mss,MVP,MVWp,MVZ,MAh2,MFe2,MFre2,Mhh2,MHp2,Mss2,MVP2,MVWp2,MVZ2,cplAhAhhh,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplAhhhVZ,cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,     & 
& cplcFreFessL,cplcFreFessR,cplcFeFeVPL,cplcFeFeVPR,cplcFvFeVWpL,cplcFvFeVWpR,           & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFressL,cplcFeFressR,cplcFeFvcHpL,cplcFeFvcHpR,           & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhssss,cplhhcHpVWp,    & 
& cplhhcVWpVWp,cplhhVZVZ,AmpVertexIRoshhTocFeFe)

 End if 
 End if 
AmpVertexhhTocFeFe = AmpVertexhhTocFeFe -  AmpVertexIRdrhhTocFeFe! +  AmpVertexIRoshhTocFeFe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Final State 1 
AmpWaveZhhTocFeFe=0._dp 
AmpVertexZhhTocFeFe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFeFe(1,gt2,:) = AmpWaveZhhTocFeFe(1,gt2,:)+ZRUUe(gt2,gt1)*AmpWavehhTocFeFe(1,gt1,:) 
AmpVertexZhhTocFeFe(1,gt2,:)= AmpVertexZhhTocFeFe(1,gt2,:)+ZRUUe(gt2,gt1)*AmpVertexhhTocFeFe(1,gt1,:) 
AmpWaveZhhTocFeFe(2,gt2,:) = AmpWaveZhhTocFeFe(2,gt2,:)+ZRUVec(gt2,gt1)*AmpWavehhTocFeFe(2,gt1,:) 
AmpVertexZhhTocFeFe(2,gt2,:)= AmpVertexZhhTocFeFe(2,gt2,:)+ZRUVec(gt2,gt1)*AmpVertexhhTocFeFe(2,gt1,:) 
 End Do 
End Do 
AmpWavehhTocFeFe=AmpWaveZhhTocFeFe 
AmpVertexhhTocFeFe= AmpVertexZhhTocFeFe
! Final State 2 
AmpWaveZhhTocFeFe=0._dp 
AmpVertexZhhTocFeFe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFeFe(1,:,gt2) = AmpWaveZhhTocFeFe(1,:,gt2)+ZRUVe(gt2,gt1)*AmpWavehhTocFeFe(1,:,gt1) 
AmpVertexZhhTocFeFe(1,:,gt2)= AmpVertexZhhTocFeFe(1,:,gt2)+ZRUVe(gt2,gt1)*AmpVertexhhTocFeFe(1,:,gt1) 
AmpWaveZhhTocFeFe(2,:,gt2) = AmpWaveZhhTocFeFe(2,:,gt2)+ZRUUe(gt2,gt1)*AmpWavehhTocFeFe(2,:,gt1) 
AmpVertexZhhTocFeFe(2,:,gt2)= AmpVertexZhhTocFeFe(2,:,gt2)+ZRUUe(gt2,gt1)*AmpVertexhhTocFeFe(2,:,gt1) 
 End Do 
End Do 
AmpWavehhTocFeFe=AmpWaveZhhTocFeFe 
AmpVertexhhTocFeFe= AmpVertexZhhTocFeFe
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocFeFe = AmpVertexhhTocFeFe  +  AmpVertexIRoshhTocFeFe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->bar[Fe] Fe -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocFeFe = AmpTreehhTocFeFe 
 AmpSum2hhTocFeFe = AmpTreehhTocFeFe + 2._dp*AmpWavehhTocFeFe + 2._dp*AmpVertexhhTocFeFe  
Else 
 AmpSumhhTocFeFe = AmpTreehhTocFeFe + AmpWavehhTocFeFe + AmpVertexhhTocFeFe
 AmpSum2hhTocFeFe = AmpTreehhTocFeFe + AmpWavehhTocFeFe + AmpVertexhhTocFeFe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocFeFe = AmpTreehhTocFeFe
 AmpSum2hhTocFeFe = AmpTreehhTocFeFe 
End if 
gt1=1 
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(MhhOS.gt.(MFeOS(gt2)+MFeOS(gt3)))).or.((.not.OSkinematics).and.(Mhh.gt.(MFe(gt2)+MFe(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt2, gt3 
  AmpSum2hhTocFeFe = AmpTreehhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS,MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt2, gt3),AmpSum2hhTocFeFe(:,gt2, gt3),AmpSqhhTocFeFe(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh,MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt2, gt3),AmpSum2hhTocFeFe(:,gt2, gt3),AmpSqhhTocFeFe(gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocFeFe(gt2, gt3) 
  AmpSum2hhTocFeFe = 2._dp*AmpWavehhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS,MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt2, gt3),AmpSum2hhTocFeFe(:,gt2, gt3),AmpSqhhTocFeFe(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh,MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt2, gt3),AmpSum2hhTocFeFe(:,gt2, gt3),AmpSqhhTocFeFe(gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocFeFe(gt2, gt3) 
  AmpSum2hhTocFeFe = 2._dp*AmpVertexhhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS,MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt2, gt3),AmpSum2hhTocFeFe(:,gt2, gt3),AmpSqhhTocFeFe(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh,MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt2, gt3),AmpSum2hhTocFeFe(:,gt2, gt3),AmpSqhhTocFeFe(gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocFeFe(gt2, gt3) 
  AmpSum2hhTocFeFe = AmpTreehhTocFeFe + 2._dp*AmpWavehhTocFeFe + 2._dp*AmpVertexhhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS,MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt2, gt3),AmpSum2hhTocFeFe(:,gt2, gt3),AmpSqhhTocFeFe(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh,MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt2, gt3),AmpSum2hhTocFeFe(:,gt2, gt3),AmpSqhhTocFeFe(gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocFeFe(gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocFeFe = AmpTreehhTocFeFe
  Call SquareAmp_StoFF(MhhOS,MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt2, gt3),AmpSum2hhTocFeFe(:,gt2, gt3),AmpSqhhTocFeFe(gt2, gt3)) 
  AmpSqTreehhTocFeFe(gt2, gt3) = AmpSqhhTocFeFe(gt2, gt3)  
  AmpSum2hhTocFeFe = + 2._dp*AmpWavehhTocFeFe + 2._dp*AmpVertexhhTocFeFe
  Call SquareAmp_StoFF(MhhOS,MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt2, gt3),AmpSum2hhTocFeFe(:,gt2, gt3),AmpSqhhTocFeFe(gt2, gt3)) 
  AmpSqhhTocFeFe(gt2, gt3) = AmpSqhhTocFeFe(gt2, gt3) + AmpSqTreehhTocFeFe(gt2, gt3)  
Else  
  AmpSum2hhTocFeFe = AmpTreehhTocFeFe
  Call SquareAmp_StoFF(Mhh,MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt2, gt3),AmpSum2hhTocFeFe(:,gt2, gt3),AmpSqhhTocFeFe(gt2, gt3)) 
  AmpSqTreehhTocFeFe(gt2, gt3) = AmpSqhhTocFeFe(gt2, gt3)  
  AmpSum2hhTocFeFe = + 2._dp*AmpWavehhTocFeFe + 2._dp*AmpVertexhhTocFeFe
  Call SquareAmp_StoFF(Mhh,MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt2, gt3),AmpSum2hhTocFeFe(:,gt2, gt3),AmpSqhhTocFeFe(gt2, gt3)) 
  AmpSqhhTocFeFe(gt2, gt3) = AmpSqhhTocFeFe(gt2, gt3) + AmpSqTreehhTocFeFe(gt2, gt3)  
End if  
Else  
  AmpSqhhTocFeFe(gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqhhTocFeFe(gt2, gt3).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS,MFeOS(gt2),MFeOS(gt3),helfactor*AmpSqhhTocFeFe(gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh,MFe(gt2),MFe(gt3),helfactor*AmpSqhhTocFeFe(gt2, gt3))
End if 
If ((Abs(MRPhhTocFeFe(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFeFe(gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocFeFe(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFeFe(gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocFeFe(gt2, gt3) + MRGhhTocFeFe(gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocFeFe(gt2, gt3) + MRGhhTocFeFe(gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
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
Call Amplitude_Tree_SimplifiedDMSSSFDM_hhTocFuFu(cplcFuFuhhL,cplcFuFuhhR,             & 
& MFu,Mhh,MFu2,Mhh2,AmpTreehhTocFuFu)

  Else 
Call Amplitude_Tree_SimplifiedDMSSSFDM_hhTocFuFu(ZcplcFuFuhhL,ZcplcFuFuhhR,           & 
& MFu,Mhh,MFu2,Mhh2,AmpTreehhTocFuFu)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_hhTocFuFu(MLambda,em,gs,cplcFuFuhhL,               & 
& cplcFuFuhhR,MFuOS,MhhOS,MRPhhTocFuFu,MRGhhTocFuFu)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_hhTocFuFu(MLambda,em,gs,ZcplcFuFuhhL,              & 
& ZcplcFuFuhhR,MFuOS,MhhOS,MRPhhTocFuFu,MRGhhTocFuFu)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_SimplifiedDMSSSFDM_hhTocFuFu(MLambda,em,gs,cplcFuFuhhL,               & 
& cplcFuFuhhR,MFu,Mhh,MRPhhTocFuFu,MRGhhTocFuFu)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_hhTocFuFu(MLambda,em,gs,ZcplcFuFuhhL,              & 
& ZcplcFuFuhhR,MFu,Mhh,MRPhhTocFuFu,MRGhhTocFuFu)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_SimplifiedDMSSSFDM_hhTocFuFu(cplcFuFuhhL,cplcFuFuhhR,             & 
& ctcplcFuFuhhL,ctcplcFuFuhhR,MFu,MFu2,Mhh,Mhh2,Zfhh,ZfUL,ZfUR,AmpWavehhTocFuFu)



!Vertex Corrections 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTocFuFu(MAh,MFd,MFu,Mhh,MHp,               & 
& MVG,MVP,MVWp,MVZ,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,              & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,     & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHpL,cplcFdFucHpR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,              & 
& cplhhcVWpVWp,cplhhVZVZ,AmpVertexhhTocFuFu)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocFuFu(MAh,MFd,MFu,Mhh,MHp,            & 
& MVG,MVP,MVWp,MVZ,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,              & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,     & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHpL,cplcFdFucHpR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,              & 
& cplhhcVWpVWp,cplhhVZVZ,AmpVertexIRdrhhTocFuFu)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocFuFu(MAhOS,MFdOS,MFuOS,              & 
& MhhOS,MHpOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,              & 
& MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplcFdFdhhL,           & 
& cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,ZcplcFuFuhhL,            & 
& ZcplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,              & 
& cplcFuFuVZR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,           & 
& cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,AmpVertexIRoshhTocFuFu)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocFuFu(MAh,MFd,MFu,Mhh,MHp,            & 
& MVG,MVP,MVWp,MVZ,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,              & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,     & 
& cplcFuFdVWpL,cplcFuFdVWpR,ZcplcFuFuhhL,ZcplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHpL,cplcFdFucHpR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,              & 
& cplhhcVWpVWp,cplhhVZVZ,AmpVertexIRoshhTocFuFu)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocFuFu(MAhOS,MFdOS,MFuOS,              & 
& MhhOS,MHpOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,              & 
& MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplcFdFdhhL,           & 
& cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,             & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,           & 
& cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,AmpVertexIRoshhTocFuFu)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocFuFu(MAh,MFd,MFu,Mhh,MHp,            & 
& MVG,MVP,MVWp,MVZ,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,              & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,     & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHpL,cplcFdFucHpR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,              & 
& cplhhcVWpVWp,cplhhVZVZ,AmpVertexIRoshhTocFuFu)

 End if 
 End if 
AmpVertexhhTocFuFu = AmpVertexhhTocFuFu -  AmpVertexIRdrhhTocFuFu! +  AmpVertexIRoshhTocFuFu ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Final State 1 
AmpWaveZhhTocFuFu=0._dp 
AmpVertexZhhTocFuFu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFuFu(1,gt2,:) = AmpWaveZhhTocFuFu(1,gt2,:)+ZRUUu(gt2,gt1)*AmpWavehhTocFuFu(1,gt1,:) 
AmpVertexZhhTocFuFu(1,gt2,:)= AmpVertexZhhTocFuFu(1,gt2,:)+ZRUUu(gt2,gt1)*AmpVertexhhTocFuFu(1,gt1,:) 
AmpWaveZhhTocFuFu(2,gt2,:) = AmpWaveZhhTocFuFu(2,gt2,:)+ZRUVuc(gt2,gt1)*AmpWavehhTocFuFu(2,gt1,:) 
AmpVertexZhhTocFuFu(2,gt2,:)= AmpVertexZhhTocFuFu(2,gt2,:)+ZRUVuc(gt2,gt1)*AmpVertexhhTocFuFu(2,gt1,:) 
 End Do 
End Do 
AmpWavehhTocFuFu=AmpWaveZhhTocFuFu 
AmpVertexhhTocFuFu= AmpVertexZhhTocFuFu
! Final State 2 
AmpWaveZhhTocFuFu=0._dp 
AmpVertexZhhTocFuFu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFuFu(1,:,gt2) = AmpWaveZhhTocFuFu(1,:,gt2)+ZRUVu(gt2,gt1)*AmpWavehhTocFuFu(1,:,gt1) 
AmpVertexZhhTocFuFu(1,:,gt2)= AmpVertexZhhTocFuFu(1,:,gt2)+ZRUVu(gt2,gt1)*AmpVertexhhTocFuFu(1,:,gt1) 
AmpWaveZhhTocFuFu(2,:,gt2) = AmpWaveZhhTocFuFu(2,:,gt2)+ZRUUu(gt2,gt1)*AmpWavehhTocFuFu(2,:,gt1) 
AmpVertexZhhTocFuFu(2,:,gt2)= AmpVertexZhhTocFuFu(2,:,gt2)+ZRUUu(gt2,gt1)*AmpVertexhhTocFuFu(2,:,gt1) 
 End Do 
End Do 
AmpWavehhTocFuFu=AmpWaveZhhTocFuFu 
AmpVertexhhTocFuFu= AmpVertexZhhTocFuFu
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocFuFu = AmpVertexhhTocFuFu  +  AmpVertexIRoshhTocFuFu
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->bar[Fu] Fu -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocFuFu = AmpTreehhTocFuFu 
 AmpSum2hhTocFuFu = AmpTreehhTocFuFu + 2._dp*AmpWavehhTocFuFu + 2._dp*AmpVertexhhTocFuFu  
Else 
 AmpSumhhTocFuFu = AmpTreehhTocFuFu + AmpWavehhTocFuFu + AmpVertexhhTocFuFu
 AmpSum2hhTocFuFu = AmpTreehhTocFuFu + AmpWavehhTocFuFu + AmpVertexhhTocFuFu 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocFuFu = AmpTreehhTocFuFu
 AmpSum2hhTocFuFu = AmpTreehhTocFuFu 
End if 
gt1=1 
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(MhhOS.gt.(MFuOS(gt2)+MFuOS(gt3)))).or.((.not.OSkinematics).and.(Mhh.gt.(MFu(gt2)+MFu(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt2, gt3 
  AmpSum2hhTocFuFu = AmpTreehhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS,MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt2, gt3),AmpSum2hhTocFuFu(:,gt2, gt3),AmpSqhhTocFuFu(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh,MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt2, gt3),AmpSum2hhTocFuFu(:,gt2, gt3),AmpSqhhTocFuFu(gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocFuFu(gt2, gt3) 
  AmpSum2hhTocFuFu = 2._dp*AmpWavehhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS,MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt2, gt3),AmpSum2hhTocFuFu(:,gt2, gt3),AmpSqhhTocFuFu(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh,MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt2, gt3),AmpSum2hhTocFuFu(:,gt2, gt3),AmpSqhhTocFuFu(gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocFuFu(gt2, gt3) 
  AmpSum2hhTocFuFu = 2._dp*AmpVertexhhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS,MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt2, gt3),AmpSum2hhTocFuFu(:,gt2, gt3),AmpSqhhTocFuFu(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh,MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt2, gt3),AmpSum2hhTocFuFu(:,gt2, gt3),AmpSqhhTocFuFu(gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocFuFu(gt2, gt3) 
  AmpSum2hhTocFuFu = AmpTreehhTocFuFu + 2._dp*AmpWavehhTocFuFu + 2._dp*AmpVertexhhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS,MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt2, gt3),AmpSum2hhTocFuFu(:,gt2, gt3),AmpSqhhTocFuFu(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh,MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt2, gt3),AmpSum2hhTocFuFu(:,gt2, gt3),AmpSqhhTocFuFu(gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocFuFu(gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocFuFu = AmpTreehhTocFuFu
  Call SquareAmp_StoFF(MhhOS,MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt2, gt3),AmpSum2hhTocFuFu(:,gt2, gt3),AmpSqhhTocFuFu(gt2, gt3)) 
  AmpSqTreehhTocFuFu(gt2, gt3) = AmpSqhhTocFuFu(gt2, gt3)  
  AmpSum2hhTocFuFu = + 2._dp*AmpWavehhTocFuFu + 2._dp*AmpVertexhhTocFuFu
  Call SquareAmp_StoFF(MhhOS,MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt2, gt3),AmpSum2hhTocFuFu(:,gt2, gt3),AmpSqhhTocFuFu(gt2, gt3)) 
  AmpSqhhTocFuFu(gt2, gt3) = AmpSqhhTocFuFu(gt2, gt3) + AmpSqTreehhTocFuFu(gt2, gt3)  
Else  
  AmpSum2hhTocFuFu = AmpTreehhTocFuFu
  Call SquareAmp_StoFF(Mhh,MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt2, gt3),AmpSum2hhTocFuFu(:,gt2, gt3),AmpSqhhTocFuFu(gt2, gt3)) 
  AmpSqTreehhTocFuFu(gt2, gt3) = AmpSqhhTocFuFu(gt2, gt3)  
  AmpSum2hhTocFuFu = + 2._dp*AmpWavehhTocFuFu + 2._dp*AmpVertexhhTocFuFu
  Call SquareAmp_StoFF(Mhh,MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt2, gt3),AmpSum2hhTocFuFu(:,gt2, gt3),AmpSqhhTocFuFu(gt2, gt3)) 
  AmpSqhhTocFuFu(gt2, gt3) = AmpSqhhTocFuFu(gt2, gt3) + AmpSqTreehhTocFuFu(gt2, gt3)  
End if  
Else  
  AmpSqhhTocFuFu(gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqhhTocFuFu(gt2, gt3).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(MhhOS,MFuOS(gt2),MFuOS(gt3),helfactor*AmpSqhhTocFuFu(gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(Mhh,MFu(gt2),MFu(gt3),helfactor*AmpSqhhTocFuFu(gt2, gt3))
End if 
If ((Abs(MRPhhTocFuFu(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFuFu(gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocFuFu(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFuFu(gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocFuFu(gt2, gt3) + MRGhhTocFuFu(gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocFuFu(gt2, gt3) + MRGhhTocFuFu(gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
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
Call Amplitude_Tree_SimplifiedDMSSSFDM_hhTohhhh(cplhhhhhh,Mhh,Mhh2,AmpTreehhTohhhh)

  Else 
Call Amplitude_Tree_SimplifiedDMSSSFDM_hhTohhhh(Zcplhhhhhh,Mhh,Mhh2,AmpTreehhTohhhh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_hhTohhhh(MLambda,em,gs,cplhhhhhh,MhhOS,            & 
& MRPhhTohhhh,MRGhhTohhhh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_hhTohhhh(MLambda,em,gs,Zcplhhhhhh,MhhOS,           & 
& MRPhhTohhhh,MRGhhTohhhh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_SimplifiedDMSSSFDM_hhTohhhh(MLambda,em,gs,cplhhhhhh,Mhh,              & 
& MRPhhTohhhh,MRGhhTohhhh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_hhTohhhh(MLambda,em,gs,Zcplhhhhhh,Mhh,             & 
& MRPhhTohhhh,MRGhhTohhhh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_SimplifiedDMSSSFDM_hhTohhhh(cplhhhhhh,ctcplhhhhhh,Mhh,            & 
& Mhh2,Zfhh,AmpWavehhTohhhh)



!Vertex Corrections 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTohhhh(MAh,MFd,MFe,MFu,Mhh,MHp,            & 
& Mss,MVWp,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,Mss2,MVWp2,MVZ2,cplAhAhhh,cplAhhhVZ,        & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhssss,       & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplAhAhhhhh1,cplhhhhhhhh1,cplhhhhHpcHp1,            & 
& cplhhhhssss1,cplhhhhcVWpVWp1,cplhhhhVZVZ1,AmpVertexhhTohhhh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTohhhh(MAh,MFd,MFe,MFu,Mhh,             & 
& MHp,Mss,MVWp,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,Mss2,MVWp2,MVZ2,cplAhAhhh,              & 
& cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,     & 
& cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhssss,       & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplAhAhhhhh1,cplhhhhhhhh1,cplhhhhHpcHp1,            & 
& cplhhhhssss1,cplhhhhcVWpVWp1,cplhhhhVZVZ1,AmpVertexIRdrhhTohhhh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTohhhh(MAhOS,MFdOS,MFeOS,               & 
& MFuOS,MhhOS,MHpOS,MssOS,MVWpOS,MVZOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,               & 
& MHp2OS,Mss2OS,MVWp2OS,MVZ2OS,cplAhAhhh,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,             & 
& cplcgZgZhh,Zcplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhssss,cplhhcHpVWp,cplhhcVWpVWp,       & 
& cplhhVZVZ,cplAhAhhhhh1,cplhhhhhhhh1,cplhhhhHpcHp1,cplhhhhssss1,cplhhhhcVWpVWp1,        & 
& cplhhhhVZVZ1,AmpVertexIRoshhTohhhh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTohhhh(MAh,MFd,MFe,MFu,Mhh,             & 
& MHp,Mss,MVWp,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,Mss2,MVWp2,MVZ2,cplAhAhhh,              & 
& cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,     & 
& cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,Zcplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhssss,      & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplAhAhhhhh1,cplhhhhhhhh1,cplhhhhHpcHp1,            & 
& cplhhhhssss1,cplhhhhcVWpVWp1,cplhhhhVZVZ1,AmpVertexIRoshhTohhhh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTohhhh(MAhOS,MFdOS,MFeOS,               & 
& MFuOS,MhhOS,MHpOS,MssOS,MVWpOS,MVZOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,               & 
& MHp2OS,Mss2OS,MVWp2OS,MVZ2OS,cplAhAhhh,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,             & 
& cplcgZgZhh,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhssss,cplhhcHpVWp,cplhhcVWpVWp,        & 
& cplhhVZVZ,cplAhAhhhhh1,cplhhhhhhhh1,cplhhhhHpcHp1,cplhhhhssss1,cplhhhhcVWpVWp1,        & 
& cplhhhhVZVZ1,AmpVertexIRoshhTohhhh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTohhhh(MAh,MFd,MFe,MFu,Mhh,             & 
& MHp,Mss,MVWp,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,Mss2,MVWp2,MVZ2,cplAhAhhh,              & 
& cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,     & 
& cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhssss,       & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplAhAhhhhh1,cplhhhhhhhh1,cplhhhhHpcHp1,            & 
& cplhhhhssss1,cplhhhhcVWpVWp1,cplhhhhVZVZ1,AmpVertexIRoshhTohhhh)

 End if 
 End if 
AmpVertexhhTohhhh = AmpVertexhhTohhhh -  AmpVertexIRdrhhTohhhh! +  AmpVertexIRoshhTohhhh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
End if
If (ShiftIRdiv) Then 
AmpVertexhhTohhhh = AmpVertexhhTohhhh  +  AmpVertexIRoshhTohhhh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->hh hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTohhhh = AmpTreehhTohhhh 
 AmpSum2hhTohhhh = AmpTreehhTohhhh + 2._dp*AmpWavehhTohhhh + 2._dp*AmpVertexhhTohhhh  
Else 
 AmpSumhhTohhhh = AmpTreehhTohhhh + AmpWavehhTohhhh + AmpVertexhhTohhhh
 AmpSum2hhTohhhh = AmpTreehhTohhhh + AmpWavehhTohhhh + AmpVertexhhTohhhh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTohhhh = AmpTreehhTohhhh
 AmpSum2hhTohhhh = AmpTreehhTohhhh 
End if 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MhhOS.gt.(MhhOS+MhhOS))).or.((.not.OSkinematics).and.(Mhh.gt.(Mhh+Mhh)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*)  
  AmpSum2hhTohhhh = AmpTreehhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS,MhhOS,MhhOS,AmpSumhhTohhhh,AmpSum2hhTohhhh,AmpSqhhTohhhh) 
Else  
  Call SquareAmp_StoSS(Mhh,Mhh,Mhh,AmpSumhhTohhhh,AmpSum2hhTohhhh,AmpSqhhTohhhh) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTohhhh 
  AmpSum2hhTohhhh = 2._dp*AmpWavehhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS,MhhOS,MhhOS,AmpSumhhTohhhh,AmpSum2hhTohhhh,AmpSqhhTohhhh) 
Else  
  Call SquareAmp_StoSS(Mhh,Mhh,Mhh,AmpSumhhTohhhh,AmpSum2hhTohhhh,AmpSqhhTohhhh) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTohhhh 
  AmpSum2hhTohhhh = 2._dp*AmpVertexhhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS,MhhOS,MhhOS,AmpSumhhTohhhh,AmpSum2hhTohhhh,AmpSqhhTohhhh) 
Else  
  Call SquareAmp_StoSS(Mhh,Mhh,Mhh,AmpSumhhTohhhh,AmpSum2hhTohhhh,AmpSqhhTohhhh) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTohhhh 
  AmpSum2hhTohhhh = AmpTreehhTohhhh + 2._dp*AmpWavehhTohhhh + 2._dp*AmpVertexhhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS,MhhOS,MhhOS,AmpSumhhTohhhh,AmpSum2hhTohhhh,AmpSqhhTohhhh) 
Else  
  Call SquareAmp_StoSS(Mhh,Mhh,Mhh,AmpSumhhTohhhh,AmpSum2hhTohhhh,AmpSqhhTohhhh) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTohhhh 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTohhhh = AmpTreehhTohhhh
  Call SquareAmp_StoSS(MhhOS,MhhOS,MhhOS,AmpSumhhTohhhh,AmpSum2hhTohhhh,AmpSqhhTohhhh) 
  AmpSqTreehhTohhhh = AmpSqhhTohhhh  
  AmpSum2hhTohhhh = + 2._dp*AmpWavehhTohhhh + 2._dp*AmpVertexhhTohhhh
  Call SquareAmp_StoSS(MhhOS,MhhOS,MhhOS,AmpSumhhTohhhh,AmpSum2hhTohhhh,AmpSqhhTohhhh) 
  AmpSqhhTohhhh = AmpSqhhTohhhh + AmpSqTreehhTohhhh  
Else  
  AmpSum2hhTohhhh = AmpTreehhTohhhh
  Call SquareAmp_StoSS(Mhh,Mhh,Mhh,AmpSumhhTohhhh,AmpSum2hhTohhhh,AmpSqhhTohhhh) 
  AmpSqTreehhTohhhh = AmpSqhhTohhhh  
  AmpSum2hhTohhhh = + 2._dp*AmpWavehhTohhhh + 2._dp*AmpVertexhhTohhhh
  Call SquareAmp_StoSS(Mhh,Mhh,Mhh,AmpSumhhTohhhh,AmpSum2hhTohhhh,AmpSqhhTohhhh) 
  AmpSqhhTohhhh = AmpSqhhTohhhh + AmpSqTreehhTohhhh  
End if  
Else  
  AmpSqhhTohhhh = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTohhhh.le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(MhhOS,MhhOS,MhhOS,helfactor*AmpSqhhTohhhh)
Else 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(Mhh,Mhh,Mhh,helfactor*AmpSqhhTohhhh)
End if 
If ((Abs(MRPhhTohhhh).gt.1.0E-20_dp).or.(Abs(MRGhhTohhhh).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTohhhh).gt.1.0E-20_dp).or.(Abs(MRGhhTohhhh).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPhhTohhhh + MRGhhTohhhh) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPhhTohhhh + MRGhhTohhhh)
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

isave = i4 
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! ss ss
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_SimplifiedDMSSSFDM_hhTossss(cplhhssss,Mhh,Mss,Mhh2,               & 
& Mss2,AmpTreehhTossss)

  Else 
Call Amplitude_Tree_SimplifiedDMSSSFDM_hhTossss(Zcplhhssss,Mhh,Mss,Mhh2,              & 
& Mss2,AmpTreehhTossss)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_hhTossss(MLambda,em,gs,cplhhssss,MhhOS,            & 
& MssOS,MRPhhTossss,MRGhhTossss)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_hhTossss(MLambda,em,gs,Zcplhhssss,MhhOS,           & 
& MssOS,MRPhhTossss,MRGhhTossss)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_SimplifiedDMSSSFDM_hhTossss(MLambda,em,gs,cplhhssss,Mhh,              & 
& Mss,MRPhhTossss,MRGhhTossss)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_hhTossss(MLambda,em,gs,Zcplhhssss,Mhh,             & 
& Mss,MRPhhTossss,MRGhhTossss)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_SimplifiedDMSSSFDM_hhTossss(cplhhssss,ctcplhhssss,Mhh,            & 
& Mhh2,Mss,Mss2,Zfhh,Zfss,AmpWavehhTossss)



!Vertex Corrections 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTossss(MAh,MFe,MFre,Mhh,MHp,               & 
& Mss,MAh2,MFe2,MFre2,Mhh2,MHp2,Mss2,cplAhAhhh,cplcFeFehhL,cplcFeFehhR,cplcFreFessL,     & 
& cplcFreFessR,cplcFeFressL,cplcFeFressR,cplhhhhhh,cplhhHpcHp,cplhhssss,cplAhAhssss1,    & 
& cplhhhhssss1,cplHpsssscHp1,cplssssssss1,AmpVertexhhTossss)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTossss(MAh,MFe,MFre,Mhh,MHp,            & 
& Mss,MAh2,MFe2,MFre2,Mhh2,MHp2,Mss2,cplAhAhhh,cplcFeFehhL,cplcFeFehhR,cplcFreFessL,     & 
& cplcFreFessR,cplcFeFressL,cplcFeFressR,cplhhhhhh,cplhhHpcHp,cplhhssss,cplAhAhssss1,    & 
& cplhhhhssss1,cplHpsssscHp1,cplssssssss1,AmpVertexIRdrhhTossss)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTossss(MAhOS,MFeOS,MFreOS,              & 
& MhhOS,MHpOS,MssOS,MAh2OS,MFe2OS,MFre2OS,Mhh2OS,MHp2OS,Mss2OS,cplAhAhhh,cplcFeFehhL,    & 
& cplcFeFehhR,cplcFreFessL,cplcFreFessR,cplcFeFressL,cplcFeFressR,cplhhhhhh,             & 
& cplhhHpcHp,Zcplhhssss,cplAhAhssss1,cplhhhhssss1,cplHpsssscHp1,cplssssssss1,            & 
& AmpVertexIRoshhTossss)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTossss(MAh,MFe,MFre,Mhh,MHp,            & 
& Mss,MAh2,MFe2,MFre2,Mhh2,MHp2,Mss2,cplAhAhhh,cplcFeFehhL,cplcFeFehhR,cplcFreFessL,     & 
& cplcFreFessR,cplcFeFressL,cplcFeFressR,cplhhhhhh,cplhhHpcHp,Zcplhhssss,cplAhAhssss1,   & 
& cplhhhhssss1,cplHpsssscHp1,cplssssssss1,AmpVertexIRoshhTossss)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTossss(MAhOS,MFeOS,MFreOS,              & 
& MhhOS,MHpOS,MssOS,MAh2OS,MFe2OS,MFre2OS,Mhh2OS,MHp2OS,Mss2OS,cplAhAhhh,cplcFeFehhL,    & 
& cplcFeFehhR,cplcFreFessL,cplcFreFessR,cplcFeFressL,cplcFeFressR,cplhhhhhh,             & 
& cplhhHpcHp,cplhhssss,cplAhAhssss1,cplhhhhssss1,cplHpsssscHp1,cplssssssss1,             & 
& AmpVertexIRoshhTossss)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTossss(MAh,MFe,MFre,Mhh,MHp,            & 
& Mss,MAh2,MFe2,MFre2,Mhh2,MHp2,Mss2,cplAhAhhh,cplcFeFehhL,cplcFeFehhR,cplcFreFessL,     & 
& cplcFreFessR,cplcFeFressL,cplcFeFressR,cplhhhhhh,cplhhHpcHp,cplhhssss,cplAhAhssss1,    & 
& cplhhhhssss1,cplHpsssscHp1,cplssssssss1,AmpVertexIRoshhTossss)

 End if 
 End if 
AmpVertexhhTossss = AmpVertexhhTossss -  AmpVertexIRdrhhTossss! +  AmpVertexIRoshhTossss ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
End if
If (ShiftIRdiv) Then 
AmpVertexhhTossss = AmpVertexhhTossss  +  AmpVertexIRoshhTossss
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->ss ss -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTossss = AmpTreehhTossss 
 AmpSum2hhTossss = AmpTreehhTossss + 2._dp*AmpWavehhTossss + 2._dp*AmpVertexhhTossss  
Else 
 AmpSumhhTossss = AmpTreehhTossss + AmpWavehhTossss + AmpVertexhhTossss
 AmpSum2hhTossss = AmpTreehhTossss + AmpWavehhTossss + AmpVertexhhTossss 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTossss = AmpTreehhTossss
 AmpSum2hhTossss = AmpTreehhTossss 
End if 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MhhOS.gt.(MssOS+MssOS))).or.((.not.OSkinematics).and.(Mhh.gt.(Mss+Mss)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*)  
  AmpSum2hhTossss = AmpTreehhTossss
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS,MssOS,MssOS,AmpSumhhTossss,AmpSum2hhTossss,AmpSqhhTossss) 
Else  
  Call SquareAmp_StoSS(Mhh,Mss,Mss,AmpSumhhTossss,AmpSum2hhTossss,AmpSqhhTossss) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTossss 
  AmpSum2hhTossss = 2._dp*AmpWavehhTossss
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS,MssOS,MssOS,AmpSumhhTossss,AmpSum2hhTossss,AmpSqhhTossss) 
Else  
  Call SquareAmp_StoSS(Mhh,Mss,Mss,AmpSumhhTossss,AmpSum2hhTossss,AmpSqhhTossss) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTossss 
  AmpSum2hhTossss = 2._dp*AmpVertexhhTossss
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS,MssOS,MssOS,AmpSumhhTossss,AmpSum2hhTossss,AmpSqhhTossss) 
Else  
  Call SquareAmp_StoSS(Mhh,Mss,Mss,AmpSumhhTossss,AmpSum2hhTossss,AmpSqhhTossss) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTossss 
  AmpSum2hhTossss = AmpTreehhTossss + 2._dp*AmpWavehhTossss + 2._dp*AmpVertexhhTossss
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS,MssOS,MssOS,AmpSumhhTossss,AmpSum2hhTossss,AmpSqhhTossss) 
Else  
  Call SquareAmp_StoSS(Mhh,Mss,Mss,AmpSumhhTossss,AmpSum2hhTossss,AmpSqhhTossss) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTossss 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTossss = AmpTreehhTossss
  Call SquareAmp_StoSS(MhhOS,MssOS,MssOS,AmpSumhhTossss,AmpSum2hhTossss,AmpSqhhTossss) 
  AmpSqTreehhTossss = AmpSqhhTossss  
  AmpSum2hhTossss = + 2._dp*AmpWavehhTossss + 2._dp*AmpVertexhhTossss
  Call SquareAmp_StoSS(MhhOS,MssOS,MssOS,AmpSumhhTossss,AmpSum2hhTossss,AmpSqhhTossss) 
  AmpSqhhTossss = AmpSqhhTossss + AmpSqTreehhTossss  
Else  
  AmpSum2hhTossss = AmpTreehhTossss
  Call SquareAmp_StoSS(Mhh,Mss,Mss,AmpSumhhTossss,AmpSum2hhTossss,AmpSqhhTossss) 
  AmpSqTreehhTossss = AmpSqhhTossss  
  AmpSum2hhTossss = + 2._dp*AmpWavehhTossss + 2._dp*AmpVertexhhTossss
  Call SquareAmp_StoSS(Mhh,Mss,Mss,AmpSumhhTossss,AmpSum2hhTossss,AmpSqhhTossss) 
  AmpSqhhTossss = AmpSqhhTossss + AmpSqTreehhTossss  
End if  
Else  
  AmpSqhhTossss = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTossss.le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(MhhOS,MssOS,MssOS,helfactor*AmpSqhhTossss)
Else 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(Mhh,Mss,Mss,helfactor*AmpSqhhTossss)
End if 
If ((Abs(MRPhhTossss).gt.1.0E-20_dp).or.(Abs(MRGhhTossss).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTossss).gt.1.0E-20_dp).or.(Abs(MRGhhTossss).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPhhTossss + MRGhhTossss) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPhhTossss + MRGhhTossss)
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

isave = i4 
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Conjg(VWp) VWp
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_SimplifiedDMSSSFDM_hhTocVWpVWp(cplhhcVWpVWp,Mhh,MVWp,             & 
& Mhh2,MVWp2,AmpTreehhTocVWpVWp)

  Else 
Call Amplitude_Tree_SimplifiedDMSSSFDM_hhTocVWpVWp(ZcplhhcVWpVWp,Mhh,MVWp,            & 
& Mhh2,MVWp2,AmpTreehhTocVWpVWp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_hhTocVWpVWp(MLambda,em,gs,cplhhcVWpVWp,            & 
& MhhOS,MVWpOS,MRPhhTocVWpVWp,MRGhhTocVWpVWp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_hhTocVWpVWp(MLambda,em,gs,ZcplhhcVWpVWp,           & 
& MhhOS,MVWpOS,MRPhhTocVWpVWp,MRGhhTocVWpVWp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_SimplifiedDMSSSFDM_hhTocVWpVWp(MLambda,em,gs,cplhhcVWpVWp,            & 
& Mhh,MVWp,MRPhhTocVWpVWp,MRGhhTocVWpVWp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_hhTocVWpVWp(MLambda,em,gs,ZcplhhcVWpVWp,           & 
& Mhh,MVWp,MRPhhTocVWpVWp,MRGhhTocVWpVWp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_SimplifiedDMSSSFDM_hhTocVWpVWp(cplhhcVWpVWp,ctcplhhcVWpVWp,       & 
& Mhh,Mhh2,MVWp,MVWp2,Zfhh,ZfVWp,AmpWavehhTocVWpVWp)



!Vertex Corrections 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTocVWpVWp(MAh,MFd,MFe,MFu,Mhh,             & 
& MHp,MVP,MVWp,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,cplAhAhhh,              & 
& cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdVWpL,cplcFuFdVWpR,   & 
& cplcFeFehhL,cplcFeFehhR,cplcFvFeVWpL,cplcFvFeVWpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgZgAhh,cplcgWpgAVWp,       & 
& cplcgWCgAcVWp,cplcgWpgWphh,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWChh,cplcgAgWCVWp,      & 
& cplcgZgWCVWp,cplcgZgZhh,cplcgWpgZVWp,cplcgWCgZcVWp,cplhhhhhh,cplhhHpcHp,               & 
& cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplHpcVWpVP,cplHpcVWpVZ,cplcHpVPVWp,    & 
& cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,cplAhAhcVWpVWp1,cplhhhhcVWpVWp1,cplhhHpcVWpVP1,  & 
& cplhhHpcVWpVZ1,cplhhcHpVPVWp1,cplhhcHpVWpVZ1,cplHpcHpcVWpVWp1,cplcVWpcVWpVWpVWp1Q,     & 
& cplcVWpcVWpVWpVWp2Q,cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,             & 
& cplcVWpVWpVZVZ1Q,AmpVertexhhTocVWpVWp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocVWpVWp(MAh,MFd,MFe,MFu,              & 
& Mhh,MHp,MVP,MVWp,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,cplAhAhhh,          & 
& cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdVWpL,cplcFuFdVWpR,   & 
& cplcFeFehhL,cplcFeFehhR,cplcFvFeVWpL,cplcFvFeVWpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgZgAhh,cplcgWpgAVWp,       & 
& cplcgWCgAcVWp,cplcgWpgWphh,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWChh,cplcgAgWCVWp,      & 
& cplcgZgWCVWp,cplcgZgZhh,cplcgWpgZVWp,cplcgWCgZcVWp,cplhhhhhh,cplhhHpcHp,               & 
& cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplHpcVWpVP,cplHpcVWpVZ,cplcHpVPVWp,    & 
& cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,cplAhAhcVWpVWp1,cplhhhhcVWpVWp1,cplhhHpcVWpVP1,  & 
& cplhhHpcVWpVZ1,cplhhcHpVPVWp1,cplhhcHpVWpVZ1,cplHpcHpcVWpVWp1,cplcVWpcVWpVWpVWp1Q,     & 
& cplcVWpcVWpVWpVWp2Q,cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,             & 
& cplcVWpVWpVZVZ1Q,AmpVertexIRdrhhTocVWpVWp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocVWpVWp(MAhOS,MFdOS,MFeOS,            & 
& MFuOS,MhhOS,MHpOS,MVP,MVWpOS,MVZOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHp2OS,          & 
& MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,           & 
& cplcFdFdhhR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFeFehhL,cplcFeFehhR,cplcFvFeVWpL,            & 
& cplcFvFeVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,        & 
& cplcFeFvcVWpR,cplcgZgAhh,cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWphh,cplcgAgWpcVWp,        & 
& cplcgZgWpcVWp,cplcgWCgWChh,cplcgAgWCVWp,cplcgZgWCVWp,cplcgZgZhh,cplcgWpgZVWp,          & 
& cplcgWCgZcVWp,cplhhhhhh,GosZcplhhHpcHp,GosZcplhhHpcVWp,GosZcplhhcHpVWp,ZcplhhcVWpVWp,  & 
& cplhhVZVZ,GosZcplHpcVWpVP,cplHpcVWpVZ,GosZcplcHpVPVWp,cplcVWpVPVWp,cplcHpVWpVZ,        & 
& cplcVWpVWpVZ,cplAhAhcVWpVWp1,cplhhhhcVWpVWp1,cplhhHpcVWpVP1,cplhhHpcVWpVZ1,            & 
& cplhhcHpVPVWp1,cplhhcHpVWpVZ1,cplHpcHpcVWpVWp1,cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,& 
& cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,AmpVertexIRoshhTocVWpVWp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocVWpVWp(MAh,MFd,MFe,MFu,              & 
& Mhh,MHp,MVP,MVWp,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,cplAhAhhh,          & 
& cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdVWpL,cplcFuFdVWpR,   & 
& cplcFeFehhL,cplcFeFehhR,cplcFvFeVWpL,cplcFvFeVWpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgZgAhh,cplcgWpgAVWp,       & 
& cplcgWCgAcVWp,cplcgWpgWphh,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWChh,cplcgAgWCVWp,      & 
& cplcgZgWCVWp,cplcgZgZhh,cplcgWpgZVWp,cplcgWCgZcVWp,cplhhhhhh,GZcplhhHpcHp,             & 
& GZcplhhHpcVWp,GZcplhhcHpVWp,ZcplhhcVWpVWp,cplhhVZVZ,GZcplHpcVWpVP,cplHpcVWpVZ,         & 
& GZcplcHpVPVWp,cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,cplAhAhcVWpVWp1,cplhhhhcVWpVWp1,   & 
& cplhhHpcVWpVP1,cplhhHpcVWpVZ1,cplhhcHpVPVWp1,cplhhcHpVWpVZ1,cplHpcHpcVWpVWp1,          & 
& cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ2Q,          & 
& cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,AmpVertexIRoshhTocVWpVWp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocVWpVWp(MAhOS,MFdOS,MFeOS,            & 
& MFuOS,MhhOS,MHpOS,MVP,MVWpOS,MVZOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHp2OS,          & 
& MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,           & 
& cplcFdFdhhR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFeFehhL,cplcFeFehhR,cplcFvFeVWpL,            & 
& cplcFvFeVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,        & 
& cplcFeFvcVWpR,cplcgZgAhh,cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWphh,cplcgAgWpcVWp,        & 
& cplcgZgWpcVWp,cplcgWCgWChh,cplcgAgWCVWp,cplcgZgWCVWp,cplcgZgZhh,cplcgWpgZVWp,          & 
& cplcgWCgZcVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,GcplhhcHpVWp,cplhhcVWpVWp,              & 
& cplhhVZVZ,cplHpcVWpVP,cplHpcVWpVZ,cplcHpVPVWp,cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,   & 
& cplAhAhcVWpVWp1,cplhhhhcVWpVWp1,cplhhHpcVWpVP1,cplhhHpcVWpVZ1,cplhhcHpVPVWp1,          & 
& cplhhcHpVWpVZ1,cplHpcHpcVWpVWp1,cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,               & 
& cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,AmpVertexIRoshhTocVWpVWp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhTocVWpVWp(MAh,MFd,MFe,MFu,              & 
& Mhh,MHp,MVP,MVWp,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,cplAhAhhh,          & 
& cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdVWpL,cplcFuFdVWpR,   & 
& cplcFeFehhL,cplcFeFehhR,cplcFvFeVWpL,cplcFvFeVWpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgZgAhh,cplcgWpgAVWp,       & 
& cplcgWCgAcVWp,cplcgWpgWphh,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWChh,cplcgAgWCVWp,      & 
& cplcgZgWCVWp,cplcgZgZhh,cplcgWpgZVWp,cplcgWCgZcVWp,cplhhhhhh,cplhhHpcHp,               & 
& cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplHpcVWpVP,cplHpcVWpVZ,cplcHpVPVWp,    & 
& cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,cplAhAhcVWpVWp1,cplhhhhcVWpVWp1,cplhhHpcVWpVP1,  & 
& cplhhHpcVWpVZ1,cplhhcHpVPVWp1,cplhhcHpVWpVZ1,cplHpcHpcVWpVWp1,cplcVWpcVWpVWpVWp1Q,     & 
& cplcVWpcVWpVWpVWp2Q,cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,             & 
& cplcVWpVWpVZVZ1Q,AmpVertexIRoshhTocVWpVWp)

 End if 
 End if 
AmpVertexhhTocVWpVWp = AmpVertexhhTocVWpVWp -  AmpVertexIRdrhhTocVWpVWp! +  AmpVertexIRoshhTocVWpVWp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocVWpVWp = AmpVertexhhTocVWpVWp  +  AmpVertexIRoshhTocVWpVWp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->conj[VWp] VWp -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocVWpVWp = AmpTreehhTocVWpVWp 
 AmpSum2hhTocVWpVWp = AmpTreehhTocVWpVWp + 2._dp*AmpWavehhTocVWpVWp + 2._dp*AmpVertexhhTocVWpVWp  
Else 
 AmpSumhhTocVWpVWp = AmpTreehhTocVWpVWp + AmpWavehhTocVWpVWp + AmpVertexhhTocVWpVWp
 AmpSum2hhTocVWpVWp = AmpTreehhTocVWpVWp + AmpWavehhTocVWpVWp + AmpVertexhhTocVWpVWp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocVWpVWp = AmpTreehhTocVWpVWp
 AmpSum2hhTocVWpVWp = AmpTreehhTocVWpVWp 
End if 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MhhOS.gt.(MVWpOS+MVWpOS))).or.((.not.OSkinematics).and.(Mhh.gt.(MVWp+MVWp)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*)  
  AmpSum2hhTocVWpVWp = AmpTreehhTocVWpVWp
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS,MVWpOS,MVWpOS,AmpSumhhTocVWpVWp(:),AmpSum2hhTocVWpVWp(:),AmpSqhhTocVWpVWp) 
Else  
  Call SquareAmp_StoVV(Mhh,MVWp,MVWp,AmpSumhhTocVWpVWp(:),AmpSum2hhTocVWpVWp(:),AmpSqhhTocVWpVWp) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocVWpVWp 
  AmpSum2hhTocVWpVWp = 2._dp*AmpWavehhTocVWpVWp
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS,MVWpOS,MVWpOS,AmpSumhhTocVWpVWp(:),AmpSum2hhTocVWpVWp(:),AmpSqhhTocVWpVWp) 
Else  
  Call SquareAmp_StoVV(Mhh,MVWp,MVWp,AmpSumhhTocVWpVWp(:),AmpSum2hhTocVWpVWp(:),AmpSqhhTocVWpVWp) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocVWpVWp 
  AmpSum2hhTocVWpVWp = 2._dp*AmpVertexhhTocVWpVWp
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS,MVWpOS,MVWpOS,AmpSumhhTocVWpVWp(:),AmpSum2hhTocVWpVWp(:),AmpSqhhTocVWpVWp) 
Else  
  Call SquareAmp_StoVV(Mhh,MVWp,MVWp,AmpSumhhTocVWpVWp(:),AmpSum2hhTocVWpVWp(:),AmpSqhhTocVWpVWp) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocVWpVWp 
  AmpSum2hhTocVWpVWp = AmpTreehhTocVWpVWp + 2._dp*AmpWavehhTocVWpVWp + 2._dp*AmpVertexhhTocVWpVWp
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS,MVWpOS,MVWpOS,AmpSumhhTocVWpVWp(:),AmpSum2hhTocVWpVWp(:),AmpSqhhTocVWpVWp) 
Else  
  Call SquareAmp_StoVV(Mhh,MVWp,MVWp,AmpSumhhTocVWpVWp(:),AmpSum2hhTocVWpVWp(:),AmpSqhhTocVWpVWp) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocVWpVWp 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocVWpVWp = AmpTreehhTocVWpVWp
  Call SquareAmp_StoVV(MhhOS,MVWpOS,MVWpOS,AmpSumhhTocVWpVWp(:),AmpSum2hhTocVWpVWp(:),AmpSqhhTocVWpVWp) 
  AmpSqTreehhTocVWpVWp = AmpSqhhTocVWpVWp  
  AmpSum2hhTocVWpVWp = + 2._dp*AmpWavehhTocVWpVWp + 2._dp*AmpVertexhhTocVWpVWp
  Call SquareAmp_StoVV(MhhOS,MVWpOS,MVWpOS,AmpSumhhTocVWpVWp(:),AmpSum2hhTocVWpVWp(:),AmpSqhhTocVWpVWp) 
  AmpSqhhTocVWpVWp = AmpSqhhTocVWpVWp + AmpSqTreehhTocVWpVWp  
Else  
  AmpSum2hhTocVWpVWp = AmpTreehhTocVWpVWp
  Call SquareAmp_StoVV(Mhh,MVWp,MVWp,AmpSumhhTocVWpVWp(:),AmpSum2hhTocVWpVWp(:),AmpSqhhTocVWpVWp) 
  AmpSqTreehhTocVWpVWp = AmpSqhhTocVWpVWp  
  AmpSum2hhTocVWpVWp = + 2._dp*AmpWavehhTocVWpVWp + 2._dp*AmpVertexhhTocVWpVWp
  Call SquareAmp_StoVV(Mhh,MVWp,MVWp,AmpSumhhTocVWpVWp(:),AmpSum2hhTocVWpVWp(:),AmpSqhhTocVWpVWp) 
  AmpSqhhTocVWpVWp = AmpSqhhTocVWpVWp + AmpSqTreehhTocVWpVWp  
End if  
Else  
  AmpSqhhTocVWpVWp = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTocVWpVWp.le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(MhhOS,MVWpOS,MVWpOS,helfactor*AmpSqhhTocVWpVWp)
Else 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(Mhh,MVWp,MVWp,helfactor*AmpSqhhTocVWpVWp)
End if 
If ((Abs(MRPhhTocVWpVWp).gt.1.0E-20_dp).or.(Abs(MRGhhTocVWpVWp).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocVWpVWp).gt.1.0E-20_dp).or.(Abs(MRGhhTocVWpVWp).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*2._dp*helfactor*(MRPhhTocVWpVWp + MRGhhTocVWpVWp) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*2._dp*helfactor*(MRPhhTocVWpVWp + MRGhhTocVWpVWp)
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

isave = i4 
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! VZ VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_SimplifiedDMSSSFDM_hhToVZVZ(cplhhVZVZ,Mhh,MVZ,Mhh2,               & 
& MVZ2,AmpTreehhToVZVZ)

  Else 
Call Amplitude_Tree_SimplifiedDMSSSFDM_hhToVZVZ(ZcplhhVZVZ,Mhh,MVZ,Mhh2,              & 
& MVZ2,AmpTreehhToVZVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_hhToVZVZ(MLambda,em,gs,cplhhVZVZ,MhhOS,            & 
& MVZOS,MRPhhToVZVZ,MRGhhToVZVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_hhToVZVZ(MLambda,em,gs,ZcplhhVZVZ,MhhOS,           & 
& MVZOS,MRPhhToVZVZ,MRGhhToVZVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_SimplifiedDMSSSFDM_hhToVZVZ(MLambda,em,gs,cplhhVZVZ,Mhh,              & 
& MVZ,MRPhhToVZVZ,MRGhhToVZVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_hhToVZVZ(MLambda,em,gs,ZcplhhVZVZ,Mhh,             & 
& MVZ,MRPhhToVZVZ,MRGhhToVZVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_SimplifiedDMSSSFDM_hhToVZVZ(cplhhVZVZ,ctcplhhVZVZ,Mhh,            & 
& Mhh2,MVZ,MVZ2,Zfhh,ZfVZ,AmpWavehhToVZVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToVZVZ(MAh,MFd,MFe,MFu,Mhh,MHp,            & 
& MVWp,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,MVWp2,MVZ2,cplAhAhhh,cplAhhhVZ,cplcFdFdhhL,     & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWphh,              & 
& cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,               & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,    & 
& cplAhAhVZVZ1,cplhhhhVZVZ1,cplhhHpcVWpVZ1,cplhhcHpVWpVZ1,cplHpcHpVZVZ1,cplcVWpVWpVZVZ2Q,& 
& cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,AmpVertexhhToVZVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhToVZVZ(MAh,MFd,MFe,MFu,Mhh,             & 
& MHp,MVWp,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,MVWp2,MVZ2,cplAhAhhh,cplAhhhVZ,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHpcHp,              & 
& cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,     & 
& cplcVWpVWpVZ,cplAhAhVZVZ1,cplhhhhVZVZ1,cplhhHpcVWpVZ1,cplhhcHpVWpVZ1,cplHpcHpVZVZ1,    & 
& cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,AmpVertexIRdrhhToVZVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhToVZVZ(MAhOS,MFdOS,MFeOS,               & 
& MFuOS,MhhOS,MHpOS,MVWpOS,MVZOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHp2OS,              & 
& MVWp2OS,MVZ2OS,cplAhAhhh,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,    & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,           & 
& cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,ZcplhhVZVZ,cplHpcHpVZ,       & 
& cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ1,cplhhhhVZVZ1,cplhhHpcVWpVZ1,         & 
& cplhhcHpVWpVZ1,cplHpcHpVZVZ1,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,       & 
& AmpVertexIRoshhToVZVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhToVZVZ(MAh,MFd,MFe,MFu,Mhh,             & 
& MHp,MVWp,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,MVWp2,MVZ2,cplAhAhhh,cplAhhhVZ,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHpcHp,              & 
& cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,ZcplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,    & 
& cplcVWpVWpVZ,cplAhAhVZVZ1,cplhhhhVZVZ1,cplhhHpcVWpVZ1,cplhhcHpVWpVZ1,cplHpcHpVZVZ1,    & 
& cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,AmpVertexIRoshhToVZVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhToVZVZ(MAhOS,MFdOS,MFeOS,               & 
& MFuOS,MhhOS,MHpOS,MVWpOS,MVZOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHp2OS,              & 
& MVWp2OS,MVZ2OS,cplAhAhhh,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,    & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,           & 
& cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplHpcHpVZ,        & 
& cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ1,cplhhhhVZVZ1,cplhhHpcVWpVZ1,         & 
& cplhhcHpVWpVZ1,cplHpcHpVZVZ1,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,       & 
& AmpVertexIRoshhToVZVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_hhToVZVZ(MAh,MFd,MFe,MFu,Mhh,             & 
& MHp,MVWp,MVZ,MAh2,MFd2,MFe2,MFu2,Mhh2,MHp2,MVWp2,MVZ2,cplAhAhhh,cplAhhhVZ,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHpcHp,              & 
& cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,     & 
& cplcVWpVWpVZ,cplAhAhVZVZ1,cplhhhhVZVZ1,cplhhHpcVWpVZ1,cplhhcHpVWpVZ1,cplHpcHpVZVZ1,    & 
& cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,AmpVertexIRoshhToVZVZ)

 End if 
 End if 
AmpVertexhhToVZVZ = AmpVertexhhToVZVZ -  AmpVertexIRdrhhToVZVZ! +  AmpVertexIRoshhToVZVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
End if
If (ShiftIRdiv) Then 
AmpVertexhhToVZVZ = AmpVertexhhToVZVZ  +  AmpVertexIRoshhToVZVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VZ VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToVZVZ = AmpTreehhToVZVZ 
 AmpSum2hhToVZVZ = AmpTreehhToVZVZ + 2._dp*AmpWavehhToVZVZ + 2._dp*AmpVertexhhToVZVZ  
Else 
 AmpSumhhToVZVZ = AmpTreehhToVZVZ + AmpWavehhToVZVZ + AmpVertexhhToVZVZ
 AmpSum2hhToVZVZ = AmpTreehhToVZVZ + AmpWavehhToVZVZ + AmpVertexhhToVZVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVZVZ = AmpTreehhToVZVZ
 AmpSum2hhToVZVZ = AmpTreehhToVZVZ 
End if 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MhhOS.gt.(MVZOS+MVZOS))).or.((.not.OSkinematics).and.(Mhh.gt.(MVZ+MVZ)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*)  
  AmpSum2hhToVZVZ = AmpTreehhToVZVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS,MVZOS,MVZOS,AmpSumhhToVZVZ(:),AmpSum2hhToVZVZ(:),AmpSqhhToVZVZ) 
Else  
  Call SquareAmp_StoVV(Mhh,MVZ,MVZ,AmpSumhhToVZVZ(:),AmpSum2hhToVZVZ(:),AmpSqhhToVZVZ) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToVZVZ 
  AmpSum2hhToVZVZ = 2._dp*AmpWavehhToVZVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS,MVZOS,MVZOS,AmpSumhhToVZVZ(:),AmpSum2hhToVZVZ(:),AmpSqhhToVZVZ) 
Else  
  Call SquareAmp_StoVV(Mhh,MVZ,MVZ,AmpSumhhToVZVZ(:),AmpSum2hhToVZVZ(:),AmpSqhhToVZVZ) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToVZVZ 
  AmpSum2hhToVZVZ = 2._dp*AmpVertexhhToVZVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS,MVZOS,MVZOS,AmpSumhhToVZVZ(:),AmpSum2hhToVZVZ(:),AmpSqhhToVZVZ) 
Else  
  Call SquareAmp_StoVV(Mhh,MVZ,MVZ,AmpSumhhToVZVZ(:),AmpSum2hhToVZVZ(:),AmpSqhhToVZVZ) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToVZVZ 
  AmpSum2hhToVZVZ = AmpTreehhToVZVZ + 2._dp*AmpWavehhToVZVZ + 2._dp*AmpVertexhhToVZVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS,MVZOS,MVZOS,AmpSumhhToVZVZ(:),AmpSum2hhToVZVZ(:),AmpSqhhToVZVZ) 
Else  
  Call SquareAmp_StoVV(Mhh,MVZ,MVZ,AmpSumhhToVZVZ(:),AmpSum2hhToVZVZ(:),AmpSqhhToVZVZ) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToVZVZ 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToVZVZ = AmpTreehhToVZVZ
  Call SquareAmp_StoVV(MhhOS,MVZOS,MVZOS,AmpSumhhToVZVZ(:),AmpSum2hhToVZVZ(:),AmpSqhhToVZVZ) 
  AmpSqTreehhToVZVZ = AmpSqhhToVZVZ  
  AmpSum2hhToVZVZ = + 2._dp*AmpWavehhToVZVZ + 2._dp*AmpVertexhhToVZVZ
  Call SquareAmp_StoVV(MhhOS,MVZOS,MVZOS,AmpSumhhToVZVZ(:),AmpSum2hhToVZVZ(:),AmpSqhhToVZVZ) 
  AmpSqhhToVZVZ = AmpSqhhToVZVZ + AmpSqTreehhToVZVZ  
Else  
  AmpSum2hhToVZVZ = AmpTreehhToVZVZ
  Call SquareAmp_StoVV(Mhh,MVZ,MVZ,AmpSumhhToVZVZ(:),AmpSum2hhToVZVZ(:),AmpSqhhToVZVZ) 
  AmpSqTreehhToVZVZ = AmpSqhhToVZVZ  
  AmpSum2hhToVZVZ = + 2._dp*AmpWavehhToVZVZ + 2._dp*AmpVertexhhToVZVZ
  Call SquareAmp_StoVV(Mhh,MVZ,MVZ,AmpSumhhToVZVZ(:),AmpSum2hhToVZVZ(:),AmpSqhhToVZVZ) 
  AmpSqhhToVZVZ = AmpSqhhToVZVZ + AmpSqTreehhToVZVZ  
End if  
Else  
  AmpSqhhToVZVZ = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVZVZ.le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS,MVZOS,MVZOS,helfactor*AmpSqhhToVZVZ)
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh,MVZ,MVZ,helfactor*AmpSqhhToVZVZ)
End if 
If ((Abs(MRPhhToVZVZ).gt.1.0E-20_dp).or.(Abs(MRGhhToVZVZ).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToVZVZ).gt.1.0E-20_dp).or.(Abs(MRGhhToVZVZ).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPhhToVZVZ + MRGhhToVZVZ) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPhhToVZVZ + MRGhhToVZVZ)
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

isave = i4 
End If 
!---------------- 
! Fre bar(Fre)
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToFrecFre(MFeOS,MFreOS,MhhOS,              & 
& MssOS,MVZOS,MFe2OS,MFre2OS,Mhh2OS,Mss2OS,MVZ2OS,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFreFessL,cplcFreFessR,cplcFeFressL,cplcFeFressR,cplcFreFreVZL,cplcFreFreVZR,       & 
& cplhhssss,cplhhVZVZ,AmpVertexhhToFrecFre)

 Else 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToFrecFre(MFeOS,MFreOS,MhhOS,              & 
& MssOS,MVZOS,MFe2OS,MFre2OS,Mhh2OS,Mss2OS,MVZ2OS,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFreFessL,cplcFreFessR,cplcFeFressL,cplcFeFressR,cplcFreFreVZL,cplcFreFreVZR,       & 
& cplhhssss,cplhhVZVZ,AmpVertexhhToFrecFre)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToFrecFre(MFe,MFre,Mhh,Mss,MVZ,            & 
& MFe2,MFre2,Mhh2,Mss2,MVZ2,cplcFeFehhL,cplcFeFehhR,cplcFreFessL,cplcFreFessR,           & 
& cplcFeFressL,cplcFeFressR,cplcFreFreVZL,cplcFreFreVZR,cplhhssss,cplhhVZVZ,             & 
& AmpVertexhhToFrecFre)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->Fre bar[Fre] -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToFrecFre = 0._dp 
 AmpSum2hhToFrecFre = 0._dp  
Else 
 AmpSumhhToFrecFre = AmpVertexhhToFrecFre + AmpWavehhToFrecFre
 AmpSum2hhToFrecFre = AmpVertexhhToFrecFre + AmpWavehhToFrecFre 
End If 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MhhOS.gt.(MFreOS+MFreOS))).or.((.not.OSkinematics).and.(Mhh.gt.(MFre+MFre)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS,MFreOS,MFreOS,AmpSumhhToFrecFre(:),AmpSum2hhToFrecFre(:),AmpSqhhToFrecFre) 
Else  
  Call SquareAmp_StoFF(Mhh,MFre,MFre,AmpSumhhToFrecFre(:),AmpSum2hhToFrecFre(:),AmpSqhhToFrecFre) 
End if  
Else  
  AmpSqhhToFrecFre = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqhhToFrecFre.le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS,MFreOS,MFreOS,helfactor*AmpSqhhToFrecFre)
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh,MFre,MFre,helfactor*AmpSqhhToFrecFre)
End if 
If ((Abs(MRPhhToFrecFre).gt.1.0E-20_dp).or.(Abs(MRGhhToFrecFre).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
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
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToFvcFv(MFeOS,MhhOS,MHpOS,MVWpOS,          & 
& MVZOS,MFe2OS,Mhh2OS,MHp2OS,MVWp2OS,MVZ2OS,cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,         & 
& cplcFvFeHpR,cplcFvFeVWpL,cplcFvFeVWpR,cplcFvFvVZL,cplcFvFvVZR,cplcFeFvcHpL,            & 
& cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,           & 
& cplhhcVWpVWp,cplhhVZVZ,AmpVertexhhToFvcFv)

 Else 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToFvcFv(MFeOS,MhhOS,MHpOS,MVWpOS,          & 
& MVZOS,MFe2OS,Mhh2OS,MHp2OS,MVWp2OS,MVZ2OS,cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,         & 
& cplcFvFeHpR,cplcFvFeVWpL,cplcFvFeVWpR,cplcFvFvVZL,cplcFvFvVZR,cplcFeFvcHpL,            & 
& cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,           & 
& cplhhcVWpVWp,cplhhVZVZ,AmpVertexhhToFvcFv)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToFvcFv(MFe,Mhh,MHp,MVWp,MVZ,              & 
& MFe2,Mhh2,MHp2,MVWp2,MVZ2,cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,             & 
& cplcFvFeVWpL,cplcFvFeVWpR,cplcFvFvVZL,cplcFvFvVZR,cplcFeFvcHpL,cplcFeFvcHpR,           & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,           & 
& cplhhVZVZ,AmpVertexhhToFvcFv)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->Fv bar[Fv] -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToFvcFv = 0._dp 
 AmpSum2hhToFvcFv = 0._dp  
Else 
 AmpSumhhToFvcFv = AmpVertexhhToFvcFv + AmpWavehhToFvcFv
 AmpSum2hhToFvcFv = AmpVertexhhToFvcFv + AmpWavehhToFvcFv 
End If 
gt1=1 
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(MhhOS.gt.(0.+0.))).or.((.not.OSkinematics).and.(Mhh.gt.(0.+0.)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS,0._dp,0._dp,AmpSumhhToFvcFv(:,gt2, gt3),AmpSum2hhToFvcFv(:,gt2, gt3),AmpSqhhToFvcFv(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh,0._dp,0._dp,AmpSumhhToFvcFv(:,gt2, gt3),AmpSum2hhToFvcFv(:,gt2, gt3),AmpSqhhToFvcFv(gt2, gt3)) 
End if  
Else  
  AmpSqhhToFvcFv(gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqhhToFvcFv(gt2, gt3).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS,0._dp,0._dp,helfactor*AmpSqhhToFvcFv(gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh,0._dp,0._dp,helfactor*AmpSqhhToFvcFv(gt2, gt3))
End if 
If ((Abs(MRPhhToFvcFv(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToFvcFv(gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
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


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTohhVP(MFdOS,MFeOS,MFuOS,MhhOS,            & 
& MHpOS,MVP,MVWpOS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,              & 
& cplcgWpgWpVP,cplcgWCgWChh,cplcgWCgWCVP,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,             & 
& cplhhcVWpVWp,cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,cplhhHpcVWpVP1,           & 
& cplhhcHpVPVWp1,AmpVertexhhTohhVP)

 Else 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTohhVP(MFdOS,MFeOS,MFuOS,MhhOS,            & 
& MHpOS,MVP,MVWpOS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,              & 
& cplcgWpgWpVP,cplcgWCgWChh,cplcgWCgWCVP,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,             & 
& cplhhcVWpVWp,cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,cplhhHpcVWpVP1,           & 
& cplhhcHpVPVWp1,AmpVertexhhTohhVP)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTohhVP(MFd,MFe,MFu,Mhh,MHp,MVP,            & 
& MVWp,MFd2,MFe2,MFu2,Mhh2,MHp2,MVP2,MVWp2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,          & 
& cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,            & 
& cplcgWCgWCVP,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVP,               & 
& cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,cplhhHpcVWpVP1,cplhhcHpVPVWp1,AmpVertexhhTohhVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->hh VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTohhVP = 0._dp 
 AmpSum2hhTohhVP = 0._dp  
Else 
 AmpSumhhTohhVP = AmpVertexhhTohhVP + AmpWavehhTohhVP
 AmpSum2hhTohhVP = AmpVertexhhTohhVP + AmpWavehhTohhVP 
End If 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MhhOS.gt.(MhhOS+0.))).or.((.not.OSkinematics).and.(Mhh.gt.(Mhh+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS,MhhOS,0._dp,AmpSumhhTohhVP(:),AmpSum2hhTohhVP(:),AmpSqhhTohhVP) 
Else  
  Call SquareAmp_StoSV(Mhh,Mhh,MVP,AmpSumhhTohhVP(:),AmpSum2hhTohhVP(:),AmpSqhhTohhVP) 
End if  
Else  
  AmpSqhhTohhVP = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTohhVP.le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS,MhhOS,0._dp,helfactor*AmpSqhhTohhVP)
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh,Mhh,MVP,helfactor*AmpSqhhTohhVP)
End if 
If ((Abs(MRPhhTohhVP).gt.1.0E-20_dp).or.(Abs(MRGhhTohhVP).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

isave = i4 
!---------------- 
! hh VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTohhVZ(MFdOS,MFeOS,MFuOS,MhhOS,            & 
& MHpOS,MVWpOS,MVZOS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHp2OS,MVWp2OS,MVZ2OS,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWphh,              & 
& cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,             & 
& cplhhcVWpVWp,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplhhHpcVWpVZ1,           & 
& cplhhcHpVWpVZ1,AmpVertexhhTohhVZ)

 Else 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTohhVZ(MFdOS,MFeOS,MFuOS,MhhOS,            & 
& MHpOS,MVWpOS,MVZOS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHp2OS,MVWp2OS,MVZ2OS,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWphh,              & 
& cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,             & 
& cplhhcVWpVWp,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplhhHpcVWpVZ1,           & 
& cplhhcHpVWpVZ1,AmpVertexhhTohhVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_hhTohhVZ(MFd,MFe,MFu,Mhh,MHp,MVWp,           & 
& MVZ,MFd2,MFe2,MFu2,Mhh2,MHp2,MVWp2,MVZ2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,           & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,            & 
& cplcgWCgWCVZ,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVZ,               & 
& cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplhhHpcVWpVZ1,cplhhcHpVWpVZ1,AmpVertexhhTohhVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->hh VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTohhVZ = 0._dp 
 AmpSum2hhTohhVZ = 0._dp  
Else 
 AmpSumhhTohhVZ = AmpVertexhhTohhVZ + AmpWavehhTohhVZ
 AmpSum2hhTohhVZ = AmpVertexhhTohhVZ + AmpWavehhTohhVZ 
End If 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MhhOS.gt.(MhhOS+MVZOS))).or.((.not.OSkinematics).and.(Mhh.gt.(Mhh+MVZ)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS,MhhOS,MVZOS,AmpSumhhTohhVZ(:),AmpSum2hhTohhVZ(:),AmpSqhhTohhVZ) 
Else  
  Call SquareAmp_StoSV(Mhh,Mhh,MVZ,AmpSumhhTohhVZ(:),AmpSum2hhTohhVZ(:),AmpSqhhTohhVZ) 
End if  
Else  
  AmpSqhhTohhVZ = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTohhVZ.le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS,MhhOS,MVZOS,helfactor*AmpSqhhTohhVZ)
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh,Mhh,MVZ,helfactor*AmpSqhhTohhVZ)
End if 
If ((Abs(MRPhhTohhVZ).gt.1.0E-20_dp).or.(Abs(MRGhhTohhVZ).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

isave = i4 
!---------------- 
! VG VG
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToVGVG(MFdOS,MFuOS,MhhOS,MVG,              & 
& MFd2OS,MFu2OS,Mhh2OS,MVG2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,AmpVertexhhToVGVG)

 Else 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToVGVG(MFdOS,MFuOS,MhhOS,MVG,              & 
& MFd2OS,MFu2OS,Mhh2OS,MVG2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,AmpVertexhhToVGVG)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToVGVG(MFd,MFu,Mhh,MVG,MFd2,               & 
& MFu2,Mhh2,MVG2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,AmpVertexhhToVGVG)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VG VG -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVGVG = 0._dp 
 AmpSum2hhToVGVG = 0._dp  
Else 
 AmpSumhhToVGVG = AmpVertexhhToVGVG + AmpWavehhToVGVG
 AmpSum2hhToVGVG = AmpVertexhhToVGVG + AmpWavehhToVGVG 
End If 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MhhOS.gt.(0.+0.))).or.((.not.OSkinematics).and.(Mhh.gt.(MVG+MVG)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS,0._dp,0._dp,AmpSumhhToVGVG(:),AmpSum2hhToVGVG(:),AmpSqhhToVGVG) 
Else  
  Call SquareAmp_StoVV(Mhh,MVG,MVG,AmpSumhhToVGVG(:),AmpSum2hhToVGVG(:),AmpSqhhToVGVG) 
End if  
Else  
  AmpSqhhToVGVG = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVGVG.le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 8._dp*GammaTPS(MhhOS,0._dp,0._dp,helfactor*AmpSqhhToVGVG)
Else 
  gP1Lhh(gt1,i4) = 8._dp*GammaTPS(Mhh,MVG,MVG,helfactor*AmpSqhhToVGVG)
End if 
If ((Abs(MRPhhToVGVG).gt.1.0E-20_dp).or.(Abs(MRGhhToVGVG).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
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
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToVPVP(MFdOS,MFeOS,MFuOS,MhhOS,            & 
& MHpOS,MVP,MVWpOS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,              & 
& cplcgWpgWpVP,cplcgWCgWChh,cplcgWCgWCVP,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,             & 
& cplhhcVWpVWp,cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,cplhhHpcVWpVP1,           & 
& cplhhcHpVPVWp1,cplHpcHpVPVP1,cplcVWpVPVPVWp3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,       & 
& AmpVertexhhToVPVP)

 Else 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToVPVP(MFdOS,MFeOS,MFuOS,MhhOS,            & 
& MHpOS,MVP,MVWpOS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,              & 
& cplcgWpgWpVP,cplcgWCgWChh,cplcgWCgWCVP,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,             & 
& cplhhcVWpVWp,cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,cplhhHpcVWpVP1,           & 
& cplhhcHpVPVWp1,cplHpcHpVPVP1,cplcVWpVPVPVWp3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,       & 
& AmpVertexhhToVPVP)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToVPVP(MFd,MFe,MFu,Mhh,MHp,MVP,            & 
& MVWp,MFd2,MFe2,MFu2,Mhh2,MHp2,MVP2,MVWp2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,          & 
& cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,            & 
& cplcgWCgWCVP,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVP,               & 
& cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,cplhhHpcVWpVP1,cplhhcHpVPVWp1,cplHpcHpVPVP1,      & 
& cplcVWpVPVPVWp3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,AmpVertexhhToVPVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VP VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVPVP = 0._dp 
 AmpSum2hhToVPVP = 0._dp  
Else 
 AmpSumhhToVPVP = AmpVertexhhToVPVP + AmpWavehhToVPVP
 AmpSum2hhToVPVP = AmpVertexhhToVPVP + AmpWavehhToVPVP 
End If 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MhhOS.gt.(0.+0.))).or.((.not.OSkinematics).and.(Mhh.gt.(MVP+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS,0._dp,0._dp,AmpSumhhToVPVP(:),AmpSum2hhToVPVP(:),AmpSqhhToVPVP) 
Else  
  Call SquareAmp_StoVV(Mhh,MVP,MVP,AmpSumhhToVPVP(:),AmpSum2hhToVPVP(:),AmpSqhhToVPVP) 
End if  
Else  
  AmpSqhhToVPVP = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVPVP.le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS,0._dp,0._dp,helfactor*AmpSqhhToVPVP)
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh,MVP,MVP,helfactor*AmpSqhhToVPVP)
End if 
If ((Abs(MRPhhToVPVP).gt.1.0E-20_dp).or.(Abs(MRGhhToVPVP).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
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
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToVPVZ(MFdOS,MFeOS,MFuOS,MhhOS,            & 
& MHpOS,MVP,MVWpOS,MVZOS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,MVZ2OS,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWpgWphh,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVP,cplcgWCgWCVZ,         & 
& cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZ,     & 
& cplHpcVWpVZ,cplcHpVPVWp,cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,cplhhHpcVWpVP1,          & 
& cplhhHpcVWpVZ1,cplhhcHpVPVWp1,cplhhcHpVWpVZ1,cplHpcHpVPVZ1,cplcVWpVPVWpVZ3Q,           & 
& cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q,AmpVertexhhToVPVZ)

 Else 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToVPVZ(MFdOS,MFeOS,MFuOS,MhhOS,            & 
& MHpOS,MVP,MVWpOS,MVZOS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,MVZ2OS,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWpgWphh,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVP,cplcgWCgWCVZ,         & 
& cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZ,     & 
& cplHpcVWpVZ,cplcHpVPVWp,cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,cplhhHpcVWpVP1,          & 
& cplhhHpcVWpVZ1,cplhhcHpVPVWp1,cplhhcHpVWpVZ1,cplHpcHpVPVZ1,cplcVWpVPVWpVZ3Q,           & 
& cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q,AmpVertexhhToVPVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_hhToVPVZ(MFd,MFe,MFu,Mhh,MHp,MVP,            & 
& MVWp,MVZ,MFd2,MFe2,MFu2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,cplcFdFdhhL,cplcFdFdhhR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWphh,cplcgWpgWpVP,             & 
& cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVP,cplcgWCgWCVZ,cplhhHpcHp,cplhhHpcVWp,            & 
& cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVPVWp,    & 
& cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,cplhhHpcVWpVP1,cplhhHpcVWpVZ1,cplhhcHpVPVWp1,    & 
& cplhhcHpVWpVZ1,cplHpcHpVPVZ1,cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q,       & 
& AmpVertexhhToVPVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VP VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVPVZ = 0._dp 
 AmpSum2hhToVPVZ = 0._dp  
Else 
 AmpSumhhToVPVZ = AmpVertexhhToVPVZ + AmpWavehhToVPVZ
 AmpSum2hhToVPVZ = AmpVertexhhToVPVZ + AmpWavehhToVPVZ 
End If 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MhhOS.gt.(0.+MVZOS))).or.((.not.OSkinematics).and.(Mhh.gt.(MVP+MVZ)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS,0._dp,MVZOS,AmpSumhhToVPVZ(:),AmpSum2hhToVPVZ(:),AmpSqhhToVPVZ) 
Else  
  Call SquareAmp_StoVV(Mhh,MVP,MVZ,AmpSumhhToVPVZ(:),AmpSum2hhToVPVZ(:),AmpSqhhToVPVZ) 
End if  
Else  
  AmpSqhhToVPVZ = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVPVZ.le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(MhhOS,0._dp,MVZOS,helfactor*AmpSqhhToVPVZ)
Else 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(Mhh,MVP,MVZ,helfactor*AmpSqhhToVPVZ)
End if 
If ((Abs(MRPhhToVPVZ).gt.1.0E-20_dp).or.(Abs(MRGhhToVPVZ).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

isave = i4 
End Subroutine OneLoopDecay_hh

End Module Wrapper_OneLoopDecay_hh_SimplifiedDMSSSFDM
