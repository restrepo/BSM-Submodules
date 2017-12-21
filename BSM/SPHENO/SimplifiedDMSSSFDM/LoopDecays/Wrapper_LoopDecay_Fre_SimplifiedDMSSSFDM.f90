! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 0:32 on 21.12.2017   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_Fre_SimplifiedDMSSSFDM
Use Model_Data_SimplifiedDMSSSFDM 
Use Kinematics 
Use OneLoopDecay_Fre_SimplifiedDMSSSFDM 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_Fre(MFdOS,MFd2OS,MFuOS,MFu2OS,MFeOS,MFe2OS,MFreOS,            & 
& MFre2OS,MHpOS,MHp2OS,MssOS,Mss2OS,MAhOS,MAh2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,              & 
& MVWpOS,MVWp2OS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,MAh,MAh2,MFd,MFd2,MFe,              & 
& MFe2,MFre,MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,               & 
& TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,              & 
& mu2,v,dg1,dg2,dg3,dMFS,dYu,dYs,dYd,dYe,dMS2,dmu2,dLS,dLSH,dLam,dv,dZDL,dZDR,           & 
& dZUL,dZUR,dZEL,dZER,dSinTW,dCosTW,dTanTW,ZfVG,ZfHp,Zfss,ZfvL,Zfed,Zfeu,ZfAh,           & 
& Zfhh,ZfVP,ZfVZ,ZfVWp,ZfDL,ZfDR,ZfUL,ZfUR,ZfEL,ZfER,ZfVPVZ,ZfVZVP,cplcFeFeAhL,          & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFressL,cplcFeFressR,cplcFreFessL,cplcFreFessR,cplcFreFreVPL,         & 
& cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR,cplhhssss,cplhhVZVZ,ctcplcFreFessL,          & 
& ctcplcFreFessR,ctcplcFreFreVPL,ctcplcFreFreVPR,ctcplcFreFreVZL,ctcplcFreFreVZR,        & 
& ZcplcFeFeAhL,ZcplcFeFeAhR,ZcplcFeFehhL,ZcplcFeFehhR,ZcplcFeFeVPL,ZcplcFeFeVPR,         & 
& ZcplcFeFressL,ZcplcFeFressR,ZcplcFreFessL,ZcplcFreFessR,ZcplcFreFreVPL,ZcplcFreFreVPR, & 
& ZcplcFreFreVZL,ZcplcFreFreVZR,Zcplhhssss,ZcplhhVZVZ,ZRUVd,ZRUUd,ZRUVu,ZRUUu,           & 
& ZRUVe,ZRUUe,MLambda,em,gs,deltaM,kont,gP1LFre)

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

Complex(dp),Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFeFeVPL(3,3), & 
& cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFressL(3),cplcFeFressR(3),    & 
& cplcFreFessL(3),cplcFreFessR(3),cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,             & 
& cplcFreFreVZR,cplhhssss,cplhhVZVZ,ctcplcFreFessL(3),ctcplcFreFessR(3),ctcplcFreFreVPL, & 
& ctcplcFreFreVPR,ctcplcFreFreVZL,ctcplcFreFreVZR,ZcplcFeFeAhL(3,3),ZcplcFeFeAhR(3,3),   & 
& ZcplcFeFehhL(3,3),ZcplcFeFehhR(3,3),ZcplcFeFeVPL(3,3),ZcplcFeFeVPR(3,3),               & 
& ZcplcFeFressL(3),ZcplcFeFressR(3),ZcplcFreFessL(3),ZcplcFreFessR(3),ZcplcFreFreVPL,    & 
& ZcplcFreFreVPR,ZcplcFreFreVZL,ZcplcFreFreVZR,Zcplhhssss,ZcplhhVZVZ

Real(dp), Intent(in) :: em, gs 
Complex(dp),Intent(in) :: ZfVG,ZfHp,Zfss,ZfvL(3,3),Zfed,Zfeu,ZfAh,Zfhh,ZfVP,ZfVZ,ZfVWp,ZfDL(3,3),               & 
& ZfDR(3,3),ZfUL(3,3),ZfUR(3,3),ZfEL(3,3),ZfER(3,3),ZfVPVZ,ZfVZVP

Real(dp),Intent(in) :: MFdOS(3),MFd2OS(3),MFuOS(3),MFu2OS(3),MFeOS(3),MFe2OS(3),MFreOS,MFre2OS,              & 
& MHpOS,MHp2OS,MssOS,Mss2OS,MAhOS,MAh2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,MVWpOS,MVWp2OS

Complex(dp),Intent(in) :: ZDLOS(3,3),ZDROS(3,3),ZULOS(3,3),ZUROS(3,3),ZELOS(3,3),ZEROS(3,3)

Complex(dp),Intent(in) :: ZRUVd(3,3),ZRUUd(3,3),ZRUVu(3,3),ZRUUu(3,3),ZRUVe(3,3),ZRUUe(3,3)

Real(dp), Intent(in) :: MLambda, deltaM 
Real(dp), Intent(out) :: gP1LFre(1,6) 
Integer, Intent(out) :: kont 
Real(dp) :: MVG,MVP,MVG2,MVP2, helfactor, phasespacefactor 
Integer :: i1,i2,i3,i4, isave, gt1, gt2, gt3 

Complex(dp) :: ZRUVdc(3, 3) 
Complex(dp) :: ZRUUdc(3, 3) 
Complex(dp) :: ZRUVuc(3, 3) 
Complex(dp) :: ZRUUuc(3, 3) 
Complex(dp) :: ZRUVec(3, 3) 
Complex(dp) :: ZRUUec(3, 3) 
Real(dp) :: MRPFreToFess(3),MRGFreToFess(3), MRPZFreToFess(3),MRGZFreToFess(3) 
Real(dp) :: MVPFreToFess(3) 
Real(dp) :: RMsqTreeFreToFess(3),RMsqWaveFreToFess(3),RMsqVertexFreToFess(3) 
Complex(dp) :: AmpTreeFreToFess(2,3),AmpWaveFreToFess(2,3)=(0._dp,0._dp),AmpVertexFreToFess(2,3)& 
 & ,AmpVertexIRosFreToFess(2,3),AmpVertexIRdrFreToFess(2,3), AmpSumFreToFess(2,3), AmpSum2FreToFess(2,3) 
Complex(dp) :: AmpTreeZFreToFess(2,3),AmpWaveZFreToFess(2,3),AmpVertexZFreToFess(2,3) 
Real(dp) :: AmpSqFreToFess(3),  AmpSqTreeFreToFess(3) 
Real(dp) :: MRPFreToFreVZ,MRGFreToFreVZ, MRPZFreToFreVZ,MRGZFreToFreVZ 
Real(dp) :: MVPFreToFreVZ 
Real(dp) :: RMsqTreeFreToFreVZ,RMsqWaveFreToFreVZ,RMsqVertexFreToFreVZ 
Complex(dp) :: AmpTreeFreToFreVZ(4),AmpWaveFreToFreVZ(4)=(0._dp,0._dp),AmpVertexFreToFreVZ(4)& 
 & ,AmpVertexIRosFreToFreVZ(4),AmpVertexIRdrFreToFreVZ(4), AmpSumFreToFreVZ(4), AmpSum2FreToFreVZ(4) 
Complex(dp) :: AmpTreeZFreToFreVZ(4),AmpWaveZFreToFreVZ(4),AmpVertexZFreToFreVZ(4) 
Real(dp) :: AmpSqFreToFreVZ,  AmpSqTreeFreToFreVZ 
Real(dp) :: MRPFreToFrehh,MRGFreToFrehh, MRPZFreToFrehh,MRGZFreToFrehh 
Real(dp) :: MVPFreToFrehh 
Real(dp) :: RMsqTreeFreToFrehh,RMsqWaveFreToFrehh,RMsqVertexFreToFrehh 
Complex(dp) :: AmpTreeFreToFrehh(2),AmpWaveFreToFrehh(2)=(0._dp,0._dp),AmpVertexFreToFrehh(2)& 
 & ,AmpVertexIRosFreToFrehh(2),AmpVertexIRdrFreToFrehh(2), AmpSumFreToFrehh(2), AmpSum2FreToFrehh(2) 
Complex(dp) :: AmpTreeZFreToFrehh(2),AmpWaveZFreToFrehh(2),AmpVertexZFreToFrehh(2) 
Real(dp) :: AmpSqFreToFrehh,  AmpSqTreeFreToFrehh 
Real(dp) :: MRPFreToFreVP,MRGFreToFreVP, MRPZFreToFreVP,MRGZFreToFreVP 
Real(dp) :: MVPFreToFreVP 
Real(dp) :: RMsqTreeFreToFreVP,RMsqWaveFreToFreVP,RMsqVertexFreToFreVP 
Complex(dp) :: AmpTreeFreToFreVP(4),AmpWaveFreToFreVP(4)=(0._dp,0._dp),AmpVertexFreToFreVP(4)& 
 & ,AmpVertexIRosFreToFreVP(4),AmpVertexIRdrFreToFreVP(4), AmpSumFreToFreVP(4), AmpSum2FreToFreVP(4) 
Complex(dp) :: AmpTreeZFreToFreVP(4),AmpWaveZFreToFreVP(4),AmpVertexZFreToFreVP(4) 
Real(dp) :: AmpSqFreToFreVP,  AmpSqTreeFreToFreVP 
Write(*,*) "Calculating one-loop decays of Fre " 
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
! Fe ss
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_SimplifiedDMSSSFDM_FreToFess(cplcFreFessL,cplcFreFessR,           & 
& MFe,MFre,Mss,MFe2,MFre2,Mss2,AmpTreeFreToFess)

  Else 
Call Amplitude_Tree_SimplifiedDMSSSFDM_FreToFess(ZcplcFreFessL,ZcplcFreFessR,         & 
& MFe,MFre,Mss,MFe2,MFre2,Mss2,AmpTreeFreToFess)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_FreToFess(MLambda,em,gs,cplcFreFessL,              & 
& cplcFreFessR,MFeOS,MFreOS,MssOS,MRPFreToFess,MRGFreToFess)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_FreToFess(MLambda,em,gs,ZcplcFreFessL,             & 
& ZcplcFreFessR,MFeOS,MFreOS,MssOS,MRPFreToFess,MRGFreToFess)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_SimplifiedDMSSSFDM_FreToFess(MLambda,em,gs,cplcFreFessL,              & 
& cplcFreFessR,MFe,MFre,Mss,MRPFreToFess,MRGFreToFess)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_FreToFess(MLambda,em,gs,ZcplcFreFessL,             & 
& ZcplcFreFessR,MFe,MFre,Mss,MRPFreToFess,MRGFreToFess)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_SimplifiedDMSSSFDM_FreToFess(cplcFreFessL,cplcFreFessR,           & 
& ctcplcFreFessL,ctcplcFreFessR,MFe,MFe2,MFre,MFre2,Mss,Mss2,Zfed,ZfEL,ZfER,             & 
& Zfeu,Zfss,AmpWaveFreToFess)



!Vertex Corrections 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_FreToFess(MFe,MFre,Mhh,Mss,MVP,              & 
& MVZ,MFe2,MFre2,Mhh2,Mss2,MVP2,MVZ2,cplcFeFehhL,cplcFeFehhR,cplcFreFessL,               & 
& cplcFreFessR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFressL,             & 
& cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR,cplhhssss,        & 
& AmpVertexFreToFess)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_FreToFess(MFe,MFre,Mhh,Mss,               & 
& MVP,MVZ,MFe2,MFre2,Mhh2,Mss2,MVP2,MVZ2,cplcFeFehhL,cplcFeFehhR,cplcFreFessL,           & 
& cplcFreFessR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFressL,             & 
& cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR,cplhhssss,        & 
& AmpVertexIRdrFreToFess)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_FreToFess(MFeOS,MFreOS,MhhOS,             & 
& MssOS,MVP,MVZOS,MFe2OS,MFre2OS,Mhh2OS,Mss2OS,MVP2,MVZ2OS,cplcFeFehhL,cplcFeFehhR,      & 
& ZcplcFreFessL,ZcplcFreFessR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,           & 
& cplcFeFressL,cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR,     & 
& cplhhssss,AmpVertexIRosFreToFess)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_FreToFess(MFe,MFre,Mhh,Mss,               & 
& MVP,MVZ,MFe2,MFre2,Mhh2,Mss2,MVP2,MVZ2,cplcFeFehhL,cplcFeFehhR,ZcplcFreFessL,          & 
& ZcplcFreFessR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFressL,            & 
& cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR,cplhhssss,        & 
& AmpVertexIRosFreToFess)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_FreToFess(MFeOS,MFreOS,MhhOS,             & 
& MssOS,MVP,MVZOS,MFe2OS,MFre2OS,Mhh2OS,Mss2OS,MVP2,MVZ2OS,cplcFeFehhL,cplcFeFehhR,      & 
& cplcFreFessL,cplcFreFessR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFeFressL,cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR,     & 
& cplhhssss,AmpVertexIRosFreToFess)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_FreToFess(MFe,MFre,Mhh,Mss,               & 
& MVP,MVZ,MFe2,MFre2,Mhh2,Mss2,MVP2,MVZ2,cplcFeFehhL,cplcFeFehhR,cplcFreFessL,           & 
& cplcFreFessR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFressL,             & 
& cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR,cplhhssss,        & 
& AmpVertexIRosFreToFess)

 End if 
 End if 
AmpVertexFreToFess = AmpVertexFreToFess -  AmpVertexIRdrFreToFess! +  AmpVertexIRosFreToFess ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Final State 1 
AmpWaveZFreToFess=0._dp 
AmpVertexZFreToFess=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFreToFess(1,gt2) = AmpWaveZFreToFess(1,gt2)+ZRUVe(gt2,gt1)*AmpWaveFreToFess(1,gt1) 
AmpVertexZFreToFess(1,gt2)= AmpVertexZFreToFess(1,gt2)+ZRUVe(gt2,gt1)*AmpVertexFreToFess(1,gt1) 
AmpWaveZFreToFess(2,gt2) = AmpWaveZFreToFess(2,gt2)+ZRUUec(gt2,gt1)*AmpWaveFreToFess(2,gt1) 
AmpVertexZFreToFess(2,gt2)= AmpVertexZFreToFess(2,gt2)+ZRUUec(gt2,gt1)*AmpVertexFreToFess(2,gt1) 
 End Do 
End Do 
AmpWaveFreToFess=AmpWaveZFreToFess 
AmpVertexFreToFess= AmpVertexZFreToFess
End if
If (ShiftIRdiv) Then 
AmpVertexFreToFess = AmpVertexFreToFess  +  AmpVertexIRosFreToFess
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fre->Fe ss -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFreToFess = AmpTreeFreToFess 
 AmpSum2FreToFess = AmpTreeFreToFess + 2._dp*AmpWaveFreToFess + 2._dp*AmpVertexFreToFess  
Else 
 AmpSumFreToFess = AmpTreeFreToFess + AmpWaveFreToFess + AmpVertexFreToFess
 AmpSum2FreToFess = AmpTreeFreToFess + AmpWaveFreToFess + AmpVertexFreToFess 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFreToFess = AmpTreeFreToFess
 AmpSum2FreToFess = AmpTreeFreToFess 
End if 
gt1=1 
i4 = isave 
  Do gt2=1,3
If (((OSkinematics).and.(MFreOS.gt.(MFeOS(gt2)+MssOS))).or.((.not.OSkinematics).and.(MFre.gt.(MFe(gt2)+Mss)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt2 
  AmpSum2FreToFess = AmpTreeFreToFess
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFreOS,MFeOS(gt2),MssOS,AmpSumFreToFess(:,gt2),AmpSum2FreToFess(:,gt2),AmpSqFreToFess(gt2)) 
Else  
  Call SquareAmp_FtoFS(MFre,MFe(gt2),Mss,AmpSumFreToFess(:,gt2),AmpSum2FreToFess(:,gt2),AmpSqFreToFess(gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFreToFess(gt2) 
  AmpSum2FreToFess = 2._dp*AmpWaveFreToFess
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFreOS,MFeOS(gt2),MssOS,AmpSumFreToFess(:,gt2),AmpSum2FreToFess(:,gt2),AmpSqFreToFess(gt2)) 
Else  
  Call SquareAmp_FtoFS(MFre,MFe(gt2),Mss,AmpSumFreToFess(:,gt2),AmpSum2FreToFess(:,gt2),AmpSqFreToFess(gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFreToFess(gt2) 
  AmpSum2FreToFess = 2._dp*AmpVertexFreToFess
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFreOS,MFeOS(gt2),MssOS,AmpSumFreToFess(:,gt2),AmpSum2FreToFess(:,gt2),AmpSqFreToFess(gt2)) 
Else  
  Call SquareAmp_FtoFS(MFre,MFe(gt2),Mss,AmpSumFreToFess(:,gt2),AmpSum2FreToFess(:,gt2),AmpSqFreToFess(gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFreToFess(gt2) 
  AmpSum2FreToFess = AmpTreeFreToFess + 2._dp*AmpWaveFreToFess + 2._dp*AmpVertexFreToFess
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFreOS,MFeOS(gt2),MssOS,AmpSumFreToFess(:,gt2),AmpSum2FreToFess(:,gt2),AmpSqFreToFess(gt2)) 
Else  
  Call SquareAmp_FtoFS(MFre,MFe(gt2),Mss,AmpSumFreToFess(:,gt2),AmpSum2FreToFess(:,gt2),AmpSqFreToFess(gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFreToFess(gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2FreToFess = AmpTreeFreToFess
  Call SquareAmp_FtoFS(MFreOS,MFeOS(gt2),MssOS,AmpSumFreToFess(:,gt2),AmpSum2FreToFess(:,gt2),AmpSqFreToFess(gt2)) 
  AmpSqTreeFreToFess(gt2) = AmpSqFreToFess(gt2)  
  AmpSum2FreToFess = + 2._dp*AmpWaveFreToFess + 2._dp*AmpVertexFreToFess
  Call SquareAmp_FtoFS(MFreOS,MFeOS(gt2),MssOS,AmpSumFreToFess(:,gt2),AmpSum2FreToFess(:,gt2),AmpSqFreToFess(gt2)) 
  AmpSqFreToFess(gt2) = AmpSqFreToFess(gt2) + AmpSqTreeFreToFess(gt2)  
Else  
  AmpSum2FreToFess = AmpTreeFreToFess
  Call SquareAmp_FtoFS(MFre,MFe(gt2),Mss,AmpSumFreToFess(:,gt2),AmpSum2FreToFess(:,gt2),AmpSqFreToFess(gt2)) 
  AmpSqTreeFreToFess(gt2) = AmpSqFreToFess(gt2)  
  AmpSum2FreToFess = + 2._dp*AmpWaveFreToFess + 2._dp*AmpVertexFreToFess
  Call SquareAmp_FtoFS(MFre,MFe(gt2),Mss,AmpSumFreToFess(:,gt2),AmpSum2FreToFess(:,gt2),AmpSqFreToFess(gt2)) 
  AmpSqFreToFess(gt2) = AmpSqFreToFess(gt2) + AmpSqTreeFreToFess(gt2)  
End if  
Else  
  AmpSqFreToFess(gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFreToFess(gt2).le.0._dp) Then 
  gP1LFre(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFre(gt1,i4) = 1._dp*GammaTPS(MFreOS,MFeOS(gt2),MssOS,helfactor*AmpSqFreToFess(gt2))
Else 
  gP1LFre(gt1,i4) = 1._dp*GammaTPS(MFre,MFe(gt2),Mss,helfactor*AmpSqFreToFess(gt2))
End if 
If ((Abs(MRPFreToFess(gt2)).gt.1.0E-20_dp).or.(Abs(MRGFreToFess(gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFre(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFreToFess(gt2)).gt.1.0E-20_dp).or.(Abs(MRGFreToFess(gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFreToFess(gt2) + MRGFreToFess(gt2)) 
  gP1LFre(gt1,i4) = gP1LFre(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFreToFess(gt2) + MRGFreToFess(gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFre(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
isave = i4 
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fre VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_SimplifiedDMSSSFDM_FreToFreVZ(cplcFreFreVZL,cplcFreFreVZR,        & 
& MFre,MVZ,MFre2,MVZ2,AmpTreeFreToFreVZ)

  Else 
Call Amplitude_Tree_SimplifiedDMSSSFDM_FreToFreVZ(ZcplcFreFreVZL,ZcplcFreFreVZR,      & 
& MFre,MVZ,MFre2,MVZ2,AmpTreeFreToFreVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_FreToFreVZ(MLambda,em,gs,cplcFreFreVZL,            & 
& cplcFreFreVZR,MFreOS,MVZOS,MRPFreToFreVZ,MRGFreToFreVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_FreToFreVZ(MLambda,em,gs,ZcplcFreFreVZL,           & 
& ZcplcFreFreVZR,MFreOS,MVZOS,MRPFreToFreVZ,MRGFreToFreVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_SimplifiedDMSSSFDM_FreToFreVZ(MLambda,em,gs,cplcFreFreVZL,            & 
& cplcFreFreVZR,MFre,MVZ,MRPFreToFreVZ,MRGFreToFreVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_SimplifiedDMSSSFDM_FreToFreVZ(MLambda,em,gs,ZcplcFreFreVZL,           & 
& ZcplcFreFreVZR,MFre,MVZ,MRPFreToFreVZ,MRGFreToFreVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_SimplifiedDMSSSFDM_FreToFreVZ(cplcFreFreVPL,cplcFreFreVPR,        & 
& cplcFreFreVZL,cplcFreFreVZR,ctcplcFreFreVPL,ctcplcFreFreVPR,ctcplcFreFreVZL,           & 
& ctcplcFreFreVZR,MFre,MFre2,MVP,MVP2,MVZ,MVZ2,Zfed,Zfeu,ZfVPVZ,ZfVZ,AmpWaveFreToFreVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_FreToFreVZ(MFe,MFre,Mss,MVP,MVZ,             & 
& MFe2,MFre2,Mss2,MVP2,MVZ2,cplcFreFessL,cplcFreFessR,cplcFeFeVZL,cplcFeFeVZR,           & 
& cplcFeFressL,cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR,     & 
& AmpVertexFreToFreVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_FreToFreVZ(MFe,MFre,Mss,MVP,              & 
& MVZ,MFe2,MFre2,Mss2,MVP2,MVZ2,cplcFreFessL,cplcFreFessR,cplcFeFeVZL,cplcFeFeVZR,       & 
& cplcFeFressL,cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR,     & 
& AmpVertexIRdrFreToFreVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_FreToFreVZ(MFeOS,MFreOS,MssOS,            & 
& MVP,MVZOS,MFe2OS,MFre2OS,Mss2OS,MVP2,MVZ2OS,cplcFreFessL,cplcFreFessR,cplcFeFeVZL,     & 
& cplcFeFeVZR,cplcFeFressL,cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,ZcplcFreFreVZL,      & 
& ZcplcFreFreVZR,AmpVertexIRosFreToFreVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_FreToFreVZ(MFe,MFre,Mss,MVP,              & 
& MVZ,MFe2,MFre2,Mss2,MVP2,MVZ2,cplcFreFessL,cplcFreFessR,cplcFeFeVZL,cplcFeFeVZR,       & 
& cplcFeFressL,cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,ZcplcFreFreVZL,ZcplcFreFreVZR,   & 
& AmpVertexIRosFreToFreVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_FreToFreVZ(MFeOS,MFreOS,MssOS,            & 
& MVP,MVZOS,MFe2OS,MFre2OS,Mss2OS,MVP2,MVZ2OS,cplcFreFessL,cplcFreFessR,cplcFeFeVZL,     & 
& cplcFeFeVZR,cplcFeFressL,cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,       & 
& cplcFreFreVZR,AmpVertexIRosFreToFreVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_SimplifiedDMSSSFDM_FreToFreVZ(MFe,MFre,Mss,MVP,              & 
& MVZ,MFe2,MFre2,Mss2,MVP2,MVZ2,cplcFreFessL,cplcFreFessR,cplcFeFeVZL,cplcFeFeVZR,       & 
& cplcFeFressL,cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR,     & 
& AmpVertexIRosFreToFreVZ)

 End if 
 End if 
AmpVertexFreToFreVZ = AmpVertexFreToFreVZ -  AmpVertexIRdrFreToFreVZ! +  AmpVertexIRosFreToFreVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
End if
If (ShiftIRdiv) Then 
AmpVertexFreToFreVZ = AmpVertexFreToFreVZ  +  AmpVertexIRosFreToFreVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fre->Fre VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFreToFreVZ = AmpTreeFreToFreVZ 
 AmpSum2FreToFreVZ = AmpTreeFreToFreVZ + 2._dp*AmpWaveFreToFreVZ + 2._dp*AmpVertexFreToFreVZ  
Else 
 AmpSumFreToFreVZ = AmpTreeFreToFreVZ + AmpWaveFreToFreVZ + AmpVertexFreToFreVZ
 AmpSum2FreToFreVZ = AmpTreeFreToFreVZ + AmpWaveFreToFreVZ + AmpVertexFreToFreVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFreToFreVZ = AmpTreeFreToFreVZ
 AmpSum2FreToFreVZ = AmpTreeFreToFreVZ 
End if 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MFreOS.gt.(MFreOS+MVZOS))).or.((.not.OSkinematics).and.(MFre.gt.(MFre+MVZ)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*)  
  AmpSum2FreToFreVZ = AmpTreeFreToFreVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFreOS,MFreOS,MVZOS,AmpSumFreToFreVZ(:),AmpSum2FreToFreVZ(:),AmpSqFreToFreVZ) 
Else  
  Call SquareAmp_FtoFV(MFre,MFre,MVZ,AmpSumFreToFreVZ(:),AmpSum2FreToFreVZ(:),AmpSqFreToFreVZ) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFreToFreVZ 
  AmpSum2FreToFreVZ = 2._dp*AmpWaveFreToFreVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFreOS,MFreOS,MVZOS,AmpSumFreToFreVZ(:),AmpSum2FreToFreVZ(:),AmpSqFreToFreVZ) 
Else  
  Call SquareAmp_FtoFV(MFre,MFre,MVZ,AmpSumFreToFreVZ(:),AmpSum2FreToFreVZ(:),AmpSqFreToFreVZ) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFreToFreVZ 
  AmpSum2FreToFreVZ = 2._dp*AmpVertexFreToFreVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFreOS,MFreOS,MVZOS,AmpSumFreToFreVZ(:),AmpSum2FreToFreVZ(:),AmpSqFreToFreVZ) 
Else  
  Call SquareAmp_FtoFV(MFre,MFre,MVZ,AmpSumFreToFreVZ(:),AmpSum2FreToFreVZ(:),AmpSqFreToFreVZ) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFreToFreVZ 
  AmpSum2FreToFreVZ = AmpTreeFreToFreVZ + 2._dp*AmpWaveFreToFreVZ + 2._dp*AmpVertexFreToFreVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFreOS,MFreOS,MVZOS,AmpSumFreToFreVZ(:),AmpSum2FreToFreVZ(:),AmpSqFreToFreVZ) 
Else  
  Call SquareAmp_FtoFV(MFre,MFre,MVZ,AmpSumFreToFreVZ(:),AmpSum2FreToFreVZ(:),AmpSqFreToFreVZ) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFreToFreVZ 
 End if 
If (OSkinematics) Then 
  AmpSum2FreToFreVZ = AmpTreeFreToFreVZ
  Call SquareAmp_FtoFV(MFreOS,MFreOS,MVZOS,AmpSumFreToFreVZ(:),AmpSum2FreToFreVZ(:),AmpSqFreToFreVZ) 
  AmpSqTreeFreToFreVZ = AmpSqFreToFreVZ  
  AmpSum2FreToFreVZ = + 2._dp*AmpWaveFreToFreVZ + 2._dp*AmpVertexFreToFreVZ
  Call SquareAmp_FtoFV(MFreOS,MFreOS,MVZOS,AmpSumFreToFreVZ(:),AmpSum2FreToFreVZ(:),AmpSqFreToFreVZ) 
  AmpSqFreToFreVZ = AmpSqFreToFreVZ + AmpSqTreeFreToFreVZ  
Else  
  AmpSum2FreToFreVZ = AmpTreeFreToFreVZ
  Call SquareAmp_FtoFV(MFre,MFre,MVZ,AmpSumFreToFreVZ(:),AmpSum2FreToFreVZ(:),AmpSqFreToFreVZ) 
  AmpSqTreeFreToFreVZ = AmpSqFreToFreVZ  
  AmpSum2FreToFreVZ = + 2._dp*AmpWaveFreToFreVZ + 2._dp*AmpVertexFreToFreVZ
  Call SquareAmp_FtoFV(MFre,MFre,MVZ,AmpSumFreToFreVZ(:),AmpSum2FreToFreVZ(:),AmpSqFreToFreVZ) 
  AmpSqFreToFreVZ = AmpSqFreToFreVZ + AmpSqTreeFreToFreVZ  
End if  
Else  
  AmpSqFreToFreVZ = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFreToFreVZ.le.0._dp) Then 
  gP1LFre(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFre(gt1,i4) = 1._dp*GammaTPS(MFreOS,MFreOS,MVZOS,helfactor*AmpSqFreToFreVZ)
Else 
  gP1LFre(gt1,i4) = 1._dp*GammaTPS(MFre,MFre,MVZ,helfactor*AmpSqFreToFreVZ)
End if 
If ((Abs(MRPFreToFreVZ).gt.1.0E-20_dp).or.(Abs(MRGFreToFreVZ).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFre(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFreToFreVZ).gt.1.0E-20_dp).or.(Abs(MRGFreToFreVZ).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFreToFreVZ + MRGFreToFreVZ) 
  gP1LFre(gt1,i4) = gP1LFre(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFreToFreVZ + MRGFreToFreVZ)
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFre(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

isave = i4 
End If 
!---------------- 
! Fre hh
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_FreToFrehh(MFeOS,MFreOS,MhhOS,               & 
& MssOS,MVZOS,MFe2OS,MFre2OS,Mhh2OS,Mss2OS,MVZ2OS,ZcplcFeFehhL,ZcplcFeFehhR,             & 
& ZcplcFreFessL,ZcplcFreFessR,ZcplcFeFressL,ZcplcFeFressR,ZcplcFreFreVZL,ZcplcFreFreVZR, & 
& Zcplhhssss,ZcplhhVZVZ,AmpVertexFreToFrehh)

 Else 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_FreToFrehh(MFeOS,MFreOS,MhhOS,               & 
& MssOS,MVZOS,MFe2OS,MFre2OS,Mhh2OS,Mss2OS,MVZ2OS,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFreFessL,cplcFreFessR,cplcFeFressL,cplcFeFressR,cplcFreFreVZL,cplcFreFreVZR,       & 
& cplhhssss,cplhhVZVZ,AmpVertexFreToFrehh)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_FreToFrehh(MFe,MFre,Mhh,Mss,MVZ,             & 
& MFe2,MFre2,Mhh2,Mss2,MVZ2,cplcFeFehhL,cplcFeFehhR,cplcFreFessL,cplcFreFessR,           & 
& cplcFeFressL,cplcFeFressR,cplcFreFreVZL,cplcFreFreVZR,cplhhssss,cplhhVZVZ,             & 
& AmpVertexFreToFrehh)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fre->Fre hh -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumFreToFrehh = 0._dp 
 AmpSum2FreToFrehh = 0._dp  
Else 
 AmpSumFreToFrehh = AmpVertexFreToFrehh + AmpWaveFreToFrehh
 AmpSum2FreToFrehh = AmpVertexFreToFrehh + AmpWaveFreToFrehh 
End If 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MFreOS.gt.(MFreOS+MhhOS))).or.((.not.OSkinematics).and.(MFre.gt.(MFre+Mhh)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFreOS,MFreOS,MhhOS,AmpSumFreToFrehh(:),AmpSum2FreToFrehh(:),AmpSqFreToFrehh) 
Else  
  Call SquareAmp_FtoFS(MFre,MFre,Mhh,AmpSumFreToFrehh(:),AmpSum2FreToFrehh(:),AmpSqFreToFrehh) 
End if  
Else  
  AmpSqFreToFrehh = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFreToFrehh.le.0._dp) Then 
  gP1LFre(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFre(gt1,i4) = 1._dp*GammaTPS(MFreOS,MFreOS,MhhOS,helfactor*AmpSqFreToFrehh)
Else 
  gP1LFre(gt1,i4) = 1._dp*GammaTPS(MFre,MFre,Mhh,helfactor*AmpSqFreToFrehh)
End if 
If ((Abs(MRPFreToFrehh).gt.1.0E-20_dp).or.(Abs(MRGFreToFrehh).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFre(gt1,i4) 
End if 
i4=i4+1

isave = i4 
!---------------- 
! Fre VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_SimplifiedDMSSSFDM_FreToFreVP(ZcplcFreFreVPL,ZcplcFreFreVPR,      & 
& ZcplcFreFreVZL,ZcplcFreFreVZR,ctcplcFreFreVPL,ctcplcFreFreVPR,ctcplcFreFreVZL,         & 
& ctcplcFreFreVZR,MFreOS,MFre2OS,MVP,MVP2,Zfed,Zfeu,ZfVP,ZfVZVP,AmpWaveFreToFreVP)

 Else 
Call Amplitude_WAVE_SimplifiedDMSSSFDM_FreToFreVP(cplcFreFreVPL,cplcFreFreVPR,        & 
& cplcFreFreVZL,cplcFreFreVZR,ctcplcFreFreVPL,ctcplcFreFreVPR,ctcplcFreFreVZL,           & 
& ctcplcFreFreVZR,MFreOS,MFre2OS,MVP,MVP2,Zfed,Zfeu,ZfVP,ZfVZVP,AmpWaveFreToFreVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_FreToFreVP(MFeOS,MFreOS,MssOS,               & 
& MVP,MVZOS,MFe2OS,MFre2OS,Mss2OS,MVP2,MVZ2OS,ZcplcFreFessL,ZcplcFreFessR,               & 
& ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcFeFressL,ZcplcFeFressR,ZcplcFreFreVPL,ZcplcFreFreVPR,   & 
& ZcplcFreFreVZL,ZcplcFreFreVZR,AmpVertexFreToFreVP)

 Else 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_FreToFreVP(MFeOS,MFreOS,MssOS,               & 
& MVP,MVZOS,MFe2OS,MFre2OS,Mss2OS,MVP2,MVZ2OS,cplcFreFessL,cplcFreFessR,cplcFeFeVPL,     & 
& cplcFeFeVPR,cplcFeFressL,cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,       & 
& cplcFreFreVZR,AmpVertexFreToFreVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_SimplifiedDMSSSFDM_FreToFreVP(cplcFreFreVPL,cplcFreFreVPR,        & 
& cplcFreFreVZL,cplcFreFreVZR,ctcplcFreFreVPL,ctcplcFreFreVPR,ctcplcFreFreVZL,           & 
& ctcplcFreFreVZR,MFre,MFre2,MVP,MVP2,Zfed,Zfeu,ZfVP,ZfVZVP,AmpWaveFreToFreVP)



!Vertex Corrections 
Call Amplitude_VERTEX_SimplifiedDMSSSFDM_FreToFreVP(MFe,MFre,Mss,MVP,MVZ,             & 
& MFe2,MFre2,Mss2,MVP2,MVZ2,cplcFreFessL,cplcFreFessR,cplcFeFeVPL,cplcFeFeVPR,           & 
& cplcFeFressL,cplcFeFressR,cplcFreFreVPL,cplcFreFreVPR,cplcFreFreVZL,cplcFreFreVZR,     & 
& AmpVertexFreToFreVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fre->Fre VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumFreToFreVP = 0._dp 
 AmpSum2FreToFreVP = 0._dp  
Else 
 AmpSumFreToFreVP = AmpVertexFreToFreVP + AmpWaveFreToFreVP
 AmpSum2FreToFreVP = AmpVertexFreToFreVP + AmpWaveFreToFreVP 
End If 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MFreOS.gt.(MFreOS+0.))).or.((.not.OSkinematics).and.(MFre.gt.(MFre+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFreOS,MFreOS,0._dp,AmpSumFreToFreVP(:),AmpSum2FreToFreVP(:),AmpSqFreToFreVP) 
Else  
  Call SquareAmp_FtoFV(MFre,MFre,MVP,AmpSumFreToFreVP(:),AmpSum2FreToFreVP(:),AmpSqFreToFreVP) 
End if  
Else  
  AmpSqFreToFreVP = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFreToFreVP.le.0._dp) Then 
  gP1LFre(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFre(gt1,i4) = 1._dp*GammaTPS(MFreOS,MFreOS,0._dp,helfactor*AmpSqFreToFreVP)
Else 
  gP1LFre(gt1,i4) = 1._dp*GammaTPS(MFre,MFre,MVP,helfactor*AmpSqFreToFreVP)
End if 
If ((Abs(MRPFreToFreVP).gt.1.0E-20_dp).or.(Abs(MRGFreToFreVP).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFre(gt1,i4) 
End if 
i4=i4+1

isave = i4 
End Subroutine OneLoopDecay_Fre

End Module Wrapper_OneLoopDecay_Fre_SimplifiedDMSSSFDM
