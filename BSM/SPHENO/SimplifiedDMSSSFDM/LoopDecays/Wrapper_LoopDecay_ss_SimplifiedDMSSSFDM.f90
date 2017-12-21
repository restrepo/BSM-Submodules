! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 0:32 on 21.12.2017   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_ss_SimplifiedDMSSSFDM
Use Model_Data_SimplifiedDMSSSFDM 
Use Kinematics 
Use OneLoopDecay_ss_SimplifiedDMSSSFDM 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_ss(MFdOS,MFd2OS,MFuOS,MFu2OS,MFeOS,MFe2OS,MFreOS,             & 
& MFre2OS,MHpOS,MHp2OS,MssOS,Mss2OS,MAhOS,MAh2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,              & 
& MVWpOS,MVWp2OS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,MAh,MAh2,MFd,MFd2,MFe,              & 
& MFe2,MFre,MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,               & 
& TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,              & 
& mu2,v,dg1,dg2,dg3,dMFS,dYu,dYs,dYd,dYe,dMS2,dmu2,dLS,dLSH,dLam,dv,dZDL,dZDR,           & 
& dZUL,dZUR,dZEL,dZER,dSinTW,dCosTW,dTanTW,ZfVG,ZfHp,Zfss,ZfvL,Zfed,Zfeu,ZfAh,           & 
& Zfhh,ZfVP,ZfVZ,ZfVWp,ZfDL,ZfDR,ZfUL,ZfUR,ZfEL,ZfER,ZfVPVZ,ZfVZVP,cplAhAhhh,            & 
& cplAhAhssss1,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,              & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFressL,cplcFeFressR,cplcFreFessL,            & 
& cplcFreFessR,cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR,cplhhhhhh,        & 
& cplhhhhssss1,cplhhHpcHp,cplhhssss,cplHpsssscHp1,cplssssssss1,ctcplcFreFessL,           & 
& ctcplcFreFessR,ctcplhhssss,ZcplcFreFessL,ZcplcFreFessR,Zcplhhssss,ZRUVd,               & 
& ZRUUd,ZRUVu,ZRUUu,ZRUVe,ZRUUe,MLambda,em,gs,deltaM,kont,gP1Lss)

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

Complex(dp),Intent(in) :: cplAhAhhh,cplAhAhssss1,cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFehhL(3,3),            & 
& cplcFeFehhR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),  & 
& cplcFeFressL(3),cplcFeFressR(3),cplcFreFessL(3),cplcFreFessR(3),cplcFreFreVPL,         & 
& cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR,cplhhhhhh,cplhhhhssss1,cplhhHpcHp,           & 
& cplhhssss,cplHpsssscHp1,cplssssssss1,ctcplcFreFessL(3),ctcplcFreFessR(3),              & 
& ctcplhhssss,ZcplcFreFessL(3),ZcplcFreFessR(3),Zcplhhssss

Real(dp), Intent(in) :: em, gs 
Complex(dp),Intent(in) :: ZfVG,ZfHp,Zfss,ZfvL(3,3),Zfed,Zfeu,ZfAh,Zfhh,ZfVP,ZfVZ,ZfVWp,ZfDL(3,3),               & 
& ZfDR(3,3),ZfUL(3,3),ZfUR(3,3),ZfEL(3,3),ZfER(3,3),ZfVPVZ,ZfVZVP

Real(dp),Intent(in) :: MFdOS(3),MFd2OS(3),MFuOS(3),MFu2OS(3),MFeOS(3),MFe2OS(3),MFreOS,MFre2OS,              & 
& MHpOS,MHp2OS,MssOS,Mss2OS,MAhOS,MAh2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,MVWpOS,MVWp2OS

Complex(dp),Intent(in) :: ZDLOS(3,3),ZDROS(3,3),ZULOS(3,3),ZUROS(3,3),ZELOS(3,3),ZEROS(3,3)

Complex(dp),Intent(in) :: ZRUVd(3,3),ZRUUd(3,3),ZRUVu(3,3),ZRUUu(3,3),ZRUVe(3,3),ZRUUe(3,3)

Real(dp), Intent(in) :: MLambda, deltaM 
Real(dp), Intent(out) :: gP1Lss(1,6) 
Integer, Intent(out) :: kont 
Real(dp) :: MVG,MVP,MVG2,MVP2, helfactor, phasespacefactor 
Integer :: i1,i2,i3,i4, isave, gt1, gt2, gt3 

Complex(dp) :: ZRUVdc(3, 3) 
Complex(dp) :: ZRUUdc(3, 3) 
Complex(dp) :: ZRUVuc(3, 3) 
Complex(dp) :: ZRUUuc(3, 3) 
Complex(dp) :: ZRUVec(3, 3) 
Complex(dp) :: ZRUUec(3, 3) 
Real(dp) :: MRPssTocFreFe(3),MRGssTocFreFe(3), MRPZssTocFreFe(3),MRGZssTocFreFe(3) 
Real(dp) :: MVPssTocFreFe(3) 
Real(dp) :: RMsqTreessTocFreFe(3),RMsqWavessTocFreFe(3),RMsqVertexssTocFreFe(3) 
Complex(dp) :: AmpTreessTocFreFe(2,3),AmpWavessTocFreFe(2,3)=(0._dp,0._dp),AmpVertexssTocFreFe(2,3)& 
 & ,AmpVertexIRosssTocFreFe(2,3),AmpVertexIRdrssTocFreFe(2,3), AmpSumssTocFreFe(2,3), AmpSum2ssTocFreFe(2,3) 
Complex(dp) :: AmpTreeZssTocFreFe(2,3),AmpWaveZssTocFreFe(2,3),AmpVertexZssTocFreFe(2,3) 
Real(dp) :: AmpSqssTocFreFe(3),  AmpSqTreessTocFreFe(3) 
Real(dp) :: MRPssTosshh,MRGssTosshh, MRPZssTosshh,MRGZssTosshh 
Real(dp) :: MVPssTosshh 
Real(dp) :: RMsqTreessTosshh,RMsqWavessTosshh,RMsqVertexssTosshh 
Complex(dp) :: AmpTreessTosshh,AmpWavessTosshh=(0._dp,0._dp),AmpVertexssTosshh& 
 & ,AmpVertexIRosssTosshh,AmpVertexIRdrssTosshh, AmpSumssTosshh, AmpSum2ssTosshh 
Complex(dp) :: AmpTreeZssTosshh,AmpWaveZssTosshh,AmpVertexZssTosshh 
Real(dp) :: AmpSqssTosshh,  AmpSqTreessTosshh 
Real(dp) :: MRPssTossVP,MRGssTossVP, MRPZssTossVP,MRGZssTossVP 
Real(dp) :: MVPssTossVP 
Real(dp) :: RMsqTreessTossVP,RMsqWavessTossVP,RMsqVertexssTossVP 
Complex(dp) :: AmpTreessTossVP(2),AmpWavessTossVP(2)=(0._dp,0._dp),AmpVertexssTossVP(2)& 
 & ,AmpVertexIRosssTossVP(2),AmpVertexIRdrssTossVP(2), AmpSumssTossVP(2), AmpSum2ssTossVP(2) 
Complex(dp) :: AmpTreeZssTossVP(2),AmpWaveZssTossVP(2),AmpVertexZssTossVP(2) 
Real(dp) :: AmpSqssTossVP,  AmpSqTreessTossVP 
Real(dp) :: MRPssTossVZ,MRGssTossVZ, MRPZssTossVZ,MRGZssTossVZ 
Real(dp) :: MVPssTossVZ 
Real(dp) :: RMsqTreessTossVZ,RMsqWavessTossVZ,RMsqVertexssTossVZ 
Complex(dp) :: AmpTreessTossVZ(2),AmpWavessTossVZ(2)=(0._dp,0._dp),AmpVertexssTossVZ(2)& 
 & ,AmpVertexIRosssTossVZ(2),AmpVertexIRdrssTossVZ(2), AmpSumssTossVZ(2), AmpSum2ssTossVZ(2) 
Complex(dp) :: AmpTreeZssTossVZ(2),AmpWaveZssTossVZ(2),AmpVertexZssTossVZ(2) 
Real(dp) :: AmpSqssTossVZ,  AmpSqTreessTossVZ 
Write(*,*) "Calculating one-loop decays of ss " 
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
isave = 1 

If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fre) Fe
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_SimplifiedDMSSSFDM_ssTocFreFe(cplcFreFessL,cplcFreFessR,          & 
& MFe,MFre,Mss,MFe2,MFre2,Mss2,AmpTreessTocFreFe)

  Else 
Call Amplitude_Tree_SimplifiedDMSSSFDM_ssTocFreFe(ZcplcFreFessL,ZcplcFreFessR,        & 
& MFe,MFre,Mss,MFe2,MFre2,Mss2,AmpTreessTocFreFe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_ssTocFreFe(MLambda,em,gs,cplcFreFessL,             & 
& cplcFreFessR,MFeOS,MFreOS,MssOS,MRPssTocFreFe,MRGssTocFreFe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_ssTocFreFe(MLambda,em,gs,ZcplcFreFessL,            & 
& ZcplcFreFessR,MFeOS,MFreOS,MssOS,MRPssTocFreFe,MRGssTocFreFe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_SimplifiedDMSSSFDM_ssTocFreFe(MLambda,em,gs,cplcFreFessL,             & 
& cplcFreFessR,MFe,MFre,Mss,MRPssTocFreFe,MRGssTocFreFe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_ssTocFreFe(MLambda,em,gs,ZcplcFreFessL,            & 
& ZcplcFreFessR,MFe,MFre,Mss,MRPssTocFreFe,MRGssTocFreFe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_SimplifiedDMSSSFDM_ssTocFreFe(cplcFreFessL,cplcFreFessR,          & 
& ctcplcFreFessL,ctcplcFreFessR,MFe,MFe2,MFre,MFre2,Mss,Mss2,Zfed,ZfEL,ZfER,             & 
& Zfeu,Zfss,AmpWavessTocFreFe)



!Vertex Corrections 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_ssTocFreFe(MFe,MFre,Mhh,Mss,MVP,             & 
& MVZ,MFe2,MFre2,Mhh2,Mss2,MVP2,MVZ2,cplcFeFehhL,cplcFeFehhR,cplcFreFessL,               & 
& cplcFreFessR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFressL,             & 
& cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR,cplhhssss,        & 
& AmpVertexssTocFreFe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_ssTocFreFe(MFe,MFre,Mhh,Mss,              & 
& MVP,MVZ,MFe2,MFre2,Mhh2,Mss2,MVP2,MVZ2,cplcFeFehhL,cplcFeFehhR,cplcFreFessL,           & 
& cplcFreFessR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFressL,             & 
& cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR,cplhhssss,        & 
& AmpVertexIRdrssTocFreFe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_ssTocFreFe(MFeOS,MFreOS,MhhOS,            & 
& MssOS,MVP,MVZOS,MFe2OS,MFre2OS,Mhh2OS,Mss2OS,MVP2,MVZ2OS,cplcFeFehhL,cplcFeFehhR,      & 
& ZcplcFreFessL,ZcplcFreFessR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,           & 
& cplcFeFressL,cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR,     & 
& cplhhssss,AmpVertexIRosssTocFreFe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_ssTocFreFe(MFe,MFre,Mhh,Mss,              & 
& MVP,MVZ,MFe2,MFre2,Mhh2,Mss2,MVP2,MVZ2,cplcFeFehhL,cplcFeFehhR,ZcplcFreFessL,          & 
& ZcplcFreFessR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFressL,            & 
& cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR,cplhhssss,        & 
& AmpVertexIRosssTocFreFe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_ssTocFreFe(MFeOS,MFreOS,MhhOS,            & 
& MssOS,MVP,MVZOS,MFe2OS,MFre2OS,Mhh2OS,Mss2OS,MVP2,MVZ2OS,cplcFeFehhL,cplcFeFehhR,      & 
& cplcFreFessL,cplcFreFessR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFeFressL,cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR,     & 
& cplhhssss,AmpVertexIRosssTocFreFe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_ssTocFreFe(MFe,MFre,Mhh,Mss,              & 
& MVP,MVZ,MFe2,MFre2,Mhh2,Mss2,MVP2,MVZ2,cplcFeFehhL,cplcFeFehhR,cplcFreFessL,           & 
& cplcFreFessR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFressL,             & 
& cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR,cplhhssss,        & 
& AmpVertexIRosssTocFreFe)

 End if 
 End if 
AmpVertexssTocFreFe = AmpVertexssTocFreFe -  AmpVertexIRdrssTocFreFe! +  AmpVertexIRosssTocFreFe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Final State 2 
AmpWaveZssTocFreFe=0._dp 
AmpVertexZssTocFreFe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZssTocFreFe(1,gt2) = AmpWaveZssTocFreFe(1,gt2)+ZRUVe(gt2,gt1)*AmpWavessTocFreFe(1,gt1) 
AmpVertexZssTocFreFe(1,gt2)= AmpVertexZssTocFreFe(1,gt2)+ZRUVe(gt2,gt1)*AmpVertexssTocFreFe(1,gt1) 
AmpWaveZssTocFreFe(2,gt2) = AmpWaveZssTocFreFe(2,gt2)+ZRUUe(gt2,gt1)*AmpWavessTocFreFe(2,gt1) 
AmpVertexZssTocFreFe(2,gt2)= AmpVertexZssTocFreFe(2,gt2)+ZRUUe(gt2,gt1)*AmpVertexssTocFreFe(2,gt1) 
 End Do 
End Do 
AmpWavessTocFreFe=AmpWaveZssTocFreFe 
AmpVertexssTocFreFe= AmpVertexZssTocFreFe
End if
If (ShiftIRdiv) Then 
AmpVertexssTocFreFe = AmpVertexssTocFreFe  +  AmpVertexIRosssTocFreFe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ ss->bar[Fre] Fe -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumssTocFreFe = AmpTreessTocFreFe 
 AmpSum2ssTocFreFe = AmpTreessTocFreFe + 2._dp*AmpWavessTocFreFe + 2._dp*AmpVertexssTocFreFe  
Else 
 AmpSumssTocFreFe = AmpTreessTocFreFe + AmpWavessTocFreFe + AmpVertexssTocFreFe
 AmpSum2ssTocFreFe = AmpTreessTocFreFe + AmpWavessTocFreFe + AmpVertexssTocFreFe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumssTocFreFe = AmpTreessTocFreFe
 AmpSum2ssTocFreFe = AmpTreessTocFreFe 
End if 
gt1=1 
i4 = isave 
    Do gt3=1,3
If (((OSkinematics).and.(MssOS.gt.(MFreOS+MFeOS(gt3)))).or.((.not.OSkinematics).and.(Mss.gt.(MFre+MFe(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt3 
  AmpSum2ssTocFreFe = AmpTreessTocFreFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MssOS,MFreOS,MFeOS(gt3),AmpSumssTocFreFe(:,gt3),AmpSum2ssTocFreFe(:,gt3),AmpSqssTocFreFe(gt3)) 
Else  
  Call SquareAmp_StoFF(Mss,MFre,MFe(gt3),AmpSumssTocFreFe(:,gt3),AmpSum2ssTocFreFe(:,gt3),AmpSqssTocFreFe(gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqssTocFreFe(gt3) 
  AmpSum2ssTocFreFe = 2._dp*AmpWavessTocFreFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MssOS,MFreOS,MFeOS(gt3),AmpSumssTocFreFe(:,gt3),AmpSum2ssTocFreFe(:,gt3),AmpSqssTocFreFe(gt3)) 
Else  
  Call SquareAmp_StoFF(Mss,MFre,MFe(gt3),AmpSumssTocFreFe(:,gt3),AmpSum2ssTocFreFe(:,gt3),AmpSqssTocFreFe(gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqssTocFreFe(gt3) 
  AmpSum2ssTocFreFe = 2._dp*AmpVertexssTocFreFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MssOS,MFreOS,MFeOS(gt3),AmpSumssTocFreFe(:,gt3),AmpSum2ssTocFreFe(:,gt3),AmpSqssTocFreFe(gt3)) 
Else  
  Call SquareAmp_StoFF(Mss,MFre,MFe(gt3),AmpSumssTocFreFe(:,gt3),AmpSum2ssTocFreFe(:,gt3),AmpSqssTocFreFe(gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqssTocFreFe(gt3) 
  AmpSum2ssTocFreFe = AmpTreessTocFreFe + 2._dp*AmpWavessTocFreFe + 2._dp*AmpVertexssTocFreFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MssOS,MFreOS,MFeOS(gt3),AmpSumssTocFreFe(:,gt3),AmpSum2ssTocFreFe(:,gt3),AmpSqssTocFreFe(gt3)) 
Else  
  Call SquareAmp_StoFF(Mss,MFre,MFe(gt3),AmpSumssTocFreFe(:,gt3),AmpSum2ssTocFreFe(:,gt3),AmpSqssTocFreFe(gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqssTocFreFe(gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ssTocFreFe = AmpTreessTocFreFe
  Call SquareAmp_StoFF(MssOS,MFreOS,MFeOS(gt3),AmpSumssTocFreFe(:,gt3),AmpSum2ssTocFreFe(:,gt3),AmpSqssTocFreFe(gt3)) 
  AmpSqTreessTocFreFe(gt3) = AmpSqssTocFreFe(gt3)  
  AmpSum2ssTocFreFe = + 2._dp*AmpWavessTocFreFe + 2._dp*AmpVertexssTocFreFe
  Call SquareAmp_StoFF(MssOS,MFreOS,MFeOS(gt3),AmpSumssTocFreFe(:,gt3),AmpSum2ssTocFreFe(:,gt3),AmpSqssTocFreFe(gt3)) 
  AmpSqssTocFreFe(gt3) = AmpSqssTocFreFe(gt3) + AmpSqTreessTocFreFe(gt3)  
Else  
  AmpSum2ssTocFreFe = AmpTreessTocFreFe
  Call SquareAmp_StoFF(Mss,MFre,MFe(gt3),AmpSumssTocFreFe(:,gt3),AmpSum2ssTocFreFe(:,gt3),AmpSqssTocFreFe(gt3)) 
  AmpSqTreessTocFreFe(gt3) = AmpSqssTocFreFe(gt3)  
  AmpSum2ssTocFreFe = + 2._dp*AmpWavessTocFreFe + 2._dp*AmpVertexssTocFreFe
  Call SquareAmp_StoFF(Mss,MFre,MFe(gt3),AmpSumssTocFreFe(:,gt3),AmpSum2ssTocFreFe(:,gt3),AmpSqssTocFreFe(gt3)) 
  AmpSqssTocFreFe(gt3) = AmpSqssTocFreFe(gt3) + AmpSqTreessTocFreFe(gt3)  
End if  
Else  
  AmpSqssTocFreFe(gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqssTocFreFe(gt3).le.0._dp) Then 
  gP1Lss(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lss(gt1,i4) = 2._dp*GammaTPS(MssOS,MFreOS,MFeOS(gt3),helfactor*AmpSqssTocFreFe(gt3))
Else 
  gP1Lss(gt1,i4) = 2._dp*GammaTPS(Mss,MFre,MFe(gt3),helfactor*AmpSqssTocFreFe(gt3))
End if 
If ((Abs(MRPssTocFreFe(gt3)).gt.1.0E-20_dp).or.(Abs(MRGssTocFreFe(gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lss(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPssTocFreFe(gt3)).gt.1.0E-20_dp).or.(Abs(MRGssTocFreFe(gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPssTocFreFe(gt3) + MRGssTocFreFe(gt3)) 
  gP1Lss(gt1,i4) = gP1Lss(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPssTocFreFe(gt3) + MRGssTocFreFe(gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lss(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
isave = i4 
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! ss hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_SimplifiedDMSSSFDM_ssTosshh(cplhhssss,Mhh,Mss,Mhh2,               & 
& Mss2,AmpTreessTosshh)

  Else 
Call Amplitude_Tree_SimplifiedDMSSSFDM_ssTosshh(Zcplhhssss,Mhh,Mss,Mhh2,              & 
& Mss2,AmpTreessTosshh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_ssTosshh(MLambda,em,gs,cplhhssss,MhhOS,            & 
& MssOS,MRPssTosshh,MRGssTosshh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_ssTosshh(MLambda,em,gs,Zcplhhssss,MhhOS,           & 
& MssOS,MRPssTosshh,MRGssTosshh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_SimplifiedDMSSSFDM_ssTosshh(MLambda,em,gs,cplhhssss,Mhh,              & 
& Mss,MRPssTosshh,MRGssTosshh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_ssTosshh(MLambda,em,gs,Zcplhhssss,Mhh,             & 
& Mss,MRPssTosshh,MRGssTosshh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_SimplifiedDMSSSFDM_ssTosshh(cplhhssss,ctcplhhssss,Mhh,            & 
& Mhh2,Mss,Mss2,Zfhh,Zfss,AmpWavessTosshh)



!Vertex Corrections 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_ssTosshh(MAh,MFe,MFre,Mhh,MHp,               & 
& Mss,MAh2,MFe2,MFre2,Mhh2,MHp2,Mss2,cplAhAhhh,cplcFeFehhL,cplcFeFehhR,cplcFreFessL,     & 
& cplcFreFessR,cplcFeFressL,cplcFeFressR,cplhhhhhh,cplhhHpcHp,cplhhssss,cplAhAhssss1,    & 
& cplhhhhssss1,cplHpsssscHp1,cplssssssss1,AmpVertexssTosshh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_ssTosshh(MAh,MFe,MFre,Mhh,MHp,            & 
& Mss,MAh2,MFe2,MFre2,Mhh2,MHp2,Mss2,cplAhAhhh,cplcFeFehhL,cplcFeFehhR,cplcFreFessL,     & 
& cplcFreFessR,cplcFeFressL,cplcFeFressR,cplhhhhhh,cplhhHpcHp,cplhhssss,cplAhAhssss1,    & 
& cplhhhhssss1,cplHpsssscHp1,cplssssssss1,AmpVertexIRdrssTosshh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_ssTosshh(MAhOS,MFeOS,MFreOS,              & 
& MhhOS,MHpOS,MssOS,MAh2OS,MFe2OS,MFre2OS,Mhh2OS,MHp2OS,Mss2OS,cplAhAhhh,cplcFeFehhL,    & 
& cplcFeFehhR,cplcFreFessL,cplcFreFessR,cplcFeFressL,cplcFeFressR,cplhhhhhh,             & 
& cplhhHpcHp,Zcplhhssss,cplAhAhssss1,cplhhhhssss1,cplHpsssscHp1,cplssssssss1,            & 
& AmpVertexIRosssTosshh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_ssTosshh(MAh,MFe,MFre,Mhh,MHp,            & 
& Mss,MAh2,MFe2,MFre2,Mhh2,MHp2,Mss2,cplAhAhhh,cplcFeFehhL,cplcFeFehhR,cplcFreFessL,     & 
& cplcFreFessR,cplcFeFressL,cplcFeFressR,cplhhhhhh,cplhhHpcHp,Zcplhhssss,cplAhAhssss1,   & 
& cplhhhhssss1,cplHpsssscHp1,cplssssssss1,AmpVertexIRosssTosshh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_ssTosshh(MAhOS,MFeOS,MFreOS,              & 
& MhhOS,MHpOS,MssOS,MAh2OS,MFe2OS,MFre2OS,Mhh2OS,MHp2OS,Mss2OS,cplAhAhhh,cplcFeFehhL,    & 
& cplcFeFehhR,cplcFreFessL,cplcFreFessR,cplcFeFressL,cplcFeFressR,cplhhhhhh,             & 
& cplhhHpcHp,cplhhssss,cplAhAhssss1,cplhhhhssss1,cplHpsssscHp1,cplssssssss1,             & 
& AmpVertexIRosssTosshh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_ssTosshh(MAh,MFe,MFre,Mhh,MHp,            & 
& Mss,MAh2,MFe2,MFre2,Mhh2,MHp2,Mss2,cplAhAhhh,cplcFeFehhL,cplcFeFehhR,cplcFreFessL,     & 
& cplcFreFessR,cplcFeFressL,cplcFeFressR,cplhhhhhh,cplhhHpcHp,cplhhssss,cplAhAhssss1,    & 
& cplhhhhssss1,cplHpsssscHp1,cplssssssss1,AmpVertexIRosssTosshh)

 End if 
 End if 
AmpVertexssTosshh = AmpVertexssTosshh -  AmpVertexIRdrssTosshh! +  AmpVertexIRosssTosshh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
End if
If (ShiftIRdiv) Then 
AmpVertexssTosshh = AmpVertexssTosshh  +  AmpVertexIRosssTosshh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ ss->ss hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumssTosshh = AmpTreessTosshh 
 AmpSum2ssTosshh = AmpTreessTosshh + 2._dp*AmpWavessTosshh + 2._dp*AmpVertexssTosshh  
Else 
 AmpSumssTosshh = AmpTreessTosshh + AmpWavessTosshh + AmpVertexssTosshh
 AmpSum2ssTosshh = AmpTreessTosshh + AmpWavessTosshh + AmpVertexssTosshh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumssTosshh = AmpTreessTosshh
 AmpSum2ssTosshh = AmpTreessTosshh 
End if 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MssOS.gt.(MssOS+MhhOS))).or.((.not.OSkinematics).and.(Mss.gt.(Mss+Mhh)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*)  
  AmpSum2ssTosshh = AmpTreessTosshh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MssOS,MssOS,MhhOS,AmpSumssTosshh,AmpSum2ssTosshh,AmpSqssTosshh) 
Else  
  Call SquareAmp_StoSS(Mss,Mss,Mhh,AmpSumssTosshh,AmpSum2ssTosshh,AmpSqssTosshh) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqssTosshh 
  AmpSum2ssTosshh = 2._dp*AmpWavessTosshh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MssOS,MssOS,MhhOS,AmpSumssTosshh,AmpSum2ssTosshh,AmpSqssTosshh) 
Else  
  Call SquareAmp_StoSS(Mss,Mss,Mhh,AmpSumssTosshh,AmpSum2ssTosshh,AmpSqssTosshh) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqssTosshh 
  AmpSum2ssTosshh = 2._dp*AmpVertexssTosshh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MssOS,MssOS,MhhOS,AmpSumssTosshh,AmpSum2ssTosshh,AmpSqssTosshh) 
Else  
  Call SquareAmp_StoSS(Mss,Mss,Mhh,AmpSumssTosshh,AmpSum2ssTosshh,AmpSqssTosshh) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqssTosshh 
  AmpSum2ssTosshh = AmpTreessTosshh + 2._dp*AmpWavessTosshh + 2._dp*AmpVertexssTosshh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MssOS,MssOS,MhhOS,AmpSumssTosshh,AmpSum2ssTosshh,AmpSqssTosshh) 
Else  
  Call SquareAmp_StoSS(Mss,Mss,Mhh,AmpSumssTosshh,AmpSum2ssTosshh,AmpSqssTosshh) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqssTosshh 
 End if 
If (OSkinematics) Then 
  AmpSum2ssTosshh = AmpTreessTosshh
  Call SquareAmp_StoSS(MssOS,MssOS,MhhOS,AmpSumssTosshh,AmpSum2ssTosshh,AmpSqssTosshh) 
  AmpSqTreessTosshh = AmpSqssTosshh  
  AmpSum2ssTosshh = + 2._dp*AmpWavessTosshh + 2._dp*AmpVertexssTosshh
  Call SquareAmp_StoSS(MssOS,MssOS,MhhOS,AmpSumssTosshh,AmpSum2ssTosshh,AmpSqssTosshh) 
  AmpSqssTosshh = AmpSqssTosshh + AmpSqTreessTosshh  
Else  
  AmpSum2ssTosshh = AmpTreessTosshh
  Call SquareAmp_StoSS(Mss,Mss,Mhh,AmpSumssTosshh,AmpSum2ssTosshh,AmpSqssTosshh) 
  AmpSqTreessTosshh = AmpSqssTosshh  
  AmpSum2ssTosshh = + 2._dp*AmpWavessTosshh + 2._dp*AmpVertexssTosshh
  Call SquareAmp_StoSS(Mss,Mss,Mhh,AmpSumssTosshh,AmpSum2ssTosshh,AmpSqssTosshh) 
  AmpSqssTosshh = AmpSqssTosshh + AmpSqTreessTosshh  
End if  
Else  
  AmpSqssTosshh = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqssTosshh.le.0._dp) Then 
  gP1Lss(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lss(gt1,i4) = 1._dp*GammaTPS(MssOS,MssOS,MhhOS,helfactor*AmpSqssTosshh)
Else 
  gP1Lss(gt1,i4) = 1._dp*GammaTPS(Mss,Mss,Mhh,helfactor*AmpSqssTosshh)
End if 
If ((Abs(MRPssTosshh).gt.1.0E-20_dp).or.(Abs(MRGssTosshh).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lss(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPssTosshh).gt.1.0E-20_dp).or.(Abs(MRGssTosshh).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPssTosshh + MRGssTosshh) 
  gP1Lss(gt1,i4) = gP1Lss(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPssTosshh + MRGssTosshh)
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lss(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

isave = i4 
End If 
!---------------- 
! ss VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_ssTossVP(MFeOS,MFreOS,MssOS,MVP,             & 
& MFe2OS,MFre2OS,Mss2OS,MVP2,cplcFreFessL,cplcFreFessR,cplcFeFeVPL,cplcFeFeVPR,          & 
& cplcFeFressL,cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,AmpVertexssTossVP)

 Else 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_ssTossVP(MFeOS,MFreOS,MssOS,MVP,             & 
& MFe2OS,MFre2OS,Mss2OS,MVP2,cplcFreFessL,cplcFreFessR,cplcFeFeVPL,cplcFeFeVPR,          & 
& cplcFeFressL,cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,AmpVertexssTossVP)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_ssTossVP(MFe,MFre,Mss,MVP,MFe2,              & 
& MFre2,Mss2,MVP2,cplcFreFessL,cplcFreFessR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFressL,        & 
& cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,AmpVertexssTossVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ ss->ss VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumssTossVP = 0._dp 
 AmpSum2ssTossVP = 0._dp  
Else 
 AmpSumssTossVP = AmpVertexssTossVP + AmpWavessTossVP
 AmpSum2ssTossVP = AmpVertexssTossVP + AmpWavessTossVP 
End If 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MssOS.gt.(MssOS+0.))).or.((.not.OSkinematics).and.(Mss.gt.(Mss+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MssOS,MssOS,0._dp,AmpSumssTossVP(:),AmpSum2ssTossVP(:),AmpSqssTossVP) 
Else  
  Call SquareAmp_StoSV(Mss,Mss,MVP,AmpSumssTossVP(:),AmpSum2ssTossVP(:),AmpSqssTossVP) 
End if  
Else  
  AmpSqssTossVP = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqssTossVP.le.0._dp) Then 
  gP1Lss(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lss(gt1,i4) = 1._dp*GammaTPS(MssOS,MssOS,0._dp,helfactor*AmpSqssTossVP)
Else 
  gP1Lss(gt1,i4) = 1._dp*GammaTPS(Mss,Mss,MVP,helfactor*AmpSqssTossVP)
End if 
If ((Abs(MRPssTossVP).gt.1.0E-20_dp).or.(Abs(MRGssTossVP).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lss(gt1,i4) 
End if 
i4=i4+1

isave = i4 
!---------------- 
! ss VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_ssTossVZ(MFeOS,MFreOS,MssOS,MVZOS,           & 
& MFe2OS,MFre2OS,Mss2OS,MVZ2OS,cplcFreFessL,cplcFreFessR,cplcFeFeVZL,cplcFeFeVZR,        & 
& cplcFeFressL,cplcFeFressR,cplcFreFreVZL,cplcFreFreVZR,AmpVertexssTossVZ)

 Else 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_ssTossVZ(MFeOS,MFreOS,MssOS,MVZOS,           & 
& MFe2OS,MFre2OS,Mss2OS,MVZ2OS,cplcFreFessL,cplcFreFessR,cplcFeFeVZL,cplcFeFeVZR,        & 
& cplcFeFressL,cplcFeFressR,cplcFreFreVZL,cplcFreFreVZR,AmpVertexssTossVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_ssTossVZ(MFe,MFre,Mss,MVZ,MFe2,              & 
& MFre2,Mss2,MVZ2,cplcFreFessL,cplcFreFessR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFressL,        & 
& cplcFeFressR,cplcFreFreVZL,cplcFreFreVZR,AmpVertexssTossVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ ss->ss VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumssTossVZ = 0._dp 
 AmpSum2ssTossVZ = 0._dp  
Else 
 AmpSumssTossVZ = AmpVertexssTossVZ + AmpWavessTossVZ
 AmpSum2ssTossVZ = AmpVertexssTossVZ + AmpWavessTossVZ 
End If 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MssOS.gt.(MssOS+MVZOS))).or.((.not.OSkinematics).and.(Mss.gt.(Mss+MVZ)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MssOS,MssOS,MVZOS,AmpSumssTossVZ(:),AmpSum2ssTossVZ(:),AmpSqssTossVZ) 
Else  
  Call SquareAmp_StoSV(Mss,Mss,MVZ,AmpSumssTossVZ(:),AmpSum2ssTossVZ(:),AmpSqssTossVZ) 
End if  
Else  
  AmpSqssTossVZ = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqssTossVZ.le.0._dp) Then 
  gP1Lss(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lss(gt1,i4) = 1._dp*GammaTPS(MssOS,MssOS,MVZOS,helfactor*AmpSqssTossVZ)
Else 
  gP1Lss(gt1,i4) = 1._dp*GammaTPS(Mss,Mss,MVZ,helfactor*AmpSqssTossVZ)
End if 
If ((Abs(MRPssTossVZ).gt.1.0E-20_dp).or.(Abs(MRGssTossVZ).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lss(gt1,i4) 
End if 
i4=i4+1

isave = i4 
End Subroutine OneLoopDecay_ss

End Module Wrapper_OneLoopDecay_ss_SimplifiedDMSSSFDM
