! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 0:33 on 21.12.2017   
! ----------------------------------------------------------------------  
 
 
Module BranchingRatios_SimplifiedDMSSSFDM 
 
Use Control 
Use Settings 
Use Couplings_SimplifiedDMSSSFDM 
Use Model_Data_SimplifiedDMSSSFDM 
Use LoopCouplings_SimplifiedDMSSSFDM 
Use Fu3Decays_SimplifiedDMSSSFDM 
Use Fe3Decays_SimplifiedDMSSSFDM 
Use Fd3Decays_SimplifiedDMSSSFDM 
Use Fre3Decays_SimplifiedDMSSSFDM 
Use TreeLevelDecays_SimplifiedDMSSSFDM 
Use OneLoopDecays_SimplifiedDMSSSFDM


 Contains 
 
Subroutine CalculateBR(CTBD,fac3,epsI,deltaM,kont,MAh,MAh2,MFd,MFd2,MFe,              & 
& MFe2,MFre,MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,               & 
& TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,v,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,            & 
& mu2,gPFu,gTFu,BRFu,gPFe,gTFe,BRFe,gPFd,gTFd,BRFd,gPhh,gThh,BRhh,gPFre,gTFre,           & 
& BRFre,gPss,gTss,BRss)

Real(dp), Intent(in) :: epsI, deltaM, fac3 
Integer, Intent(inout) :: kont 
Logical, Intent(in) :: CTBD 
Real(dp),Intent(inout) :: g1,g2,g3,Ys(3),MS2

Complex(dp),Intent(inout) :: LS,LSH,Lam,Yu(3,3),Yd(3,3),Ye(3,3),MFS,mu2

Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFre,MFre2,MFu(3),MFu2(3),Mhh,Mhh2,            & 
& MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp),Intent(inout) :: v

Real(dp),Intent(inout) :: gPFu(3,153),gTFu(3),BRFu(3,153),gPFe(3,154),gTFe(3),BRFe(3,154),gPFd(3,153),          & 
& gTFd(3),BRFd(3,153),gPhh(1,50),gThh,BRhh(1,50),gPFre(1,6),gTFre,BRFre(1,6),            & 
& gPss(1,6),gTss,BRss(1,6)

Complex(dp) :: cplHiggsPP,cplHiggsGG,cplPseudoHiggsPP,cplPseudoHiggsGG,cplHiggsZZvirt,               & 
& cplHiggsWWvirt

Real(dp) :: gTAh 
Real(dp) :: gFuFucFdFd(3,3,3,3),gFuFdcFeFv(3,3,3,3),gFuFucFeFe(3,3,3,3),gFuFucFuFu(3,3,3,3),      & 
& gFuFucFreFre(3,3,1,1),gFuFucFvFv(3,3,3,3),gFeFecFdFd(3,3,3,3),gFeFecFeFe(3,3,3,3),     & 
& gFeFecFuFu(3,3,3,3),gFeFecFreFre(3,3,1,1),gFeFecFvFv(3,3,3,3),gFeFrecFeFre(3,1,3,1),   & 
& gFeFvcFuFd(3,3,3,3),gFdFdcFdFd(3,3,3,3),gFdFdcFeFe(3,3,3,3),gFdFdcFuFu(3,3,3,3),       & 
& gFdFdcFreFre(3,3,1,1),gFdFdcFvFv(3,3,3,3),gFdFucFvFe(3,3,3,3)

Complex(dp) :: coup 
Real(dp) :: vev 
Real(dp) :: gTVZ,gTVWp

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateBR'
 
Write(*,*) "Calculating branching ratios and decay widths" 
gTVWp = gamW 
gTVZ = gamZ 
! One-Loop Decays 
If (OneLoopDecays) Then 
Call CalculateOneLoopDecays(gP1LFu,gP1LFe,gP1LFd,gP1Lhh,gP1LFre,gP1Lss,               & 
& MFd,MFd2,MFu,MFu2,MFe,MFe2,MFre,MFre2,MHp,MHp2,Mss,Mss2,MAh,MAh2,Mhh,Mhh2,             & 
& MVZ,MVZ2,MVWp,MVWp2,ZDL,ZDR,ZUL,ZUR,ZEL,ZER,v,g1,g2,g3,LS,LSH,Lam,Yu,Ys,               & 
& Yd,Ye,MFS,MS2,mu2,epsI,deltaM,kont)

End if 


gPFu = 0._dp 
gTFu = 0._dp 
BRFu = 0._dp 
Call FuTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,              & 
& MFu2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,            & 
& ZUL,ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,mu2,v,gPFu(:,1:15),gTFu,             & 
& BRFu(:,1:15))

Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
If (OneLoopDecays) Then 
gT1LFu(i1) =Sum(gP1LFu(i1,:)) 
If (gT1LFu(i1).Gt.0._dp) BR1LFu(i1,: ) =gP1LFu(i1,:)/gT1LFu(i1) 
End if
End Do 
 

gPFe = 0._dp 
gTFe = 0._dp 
BRFe = 0._dp 
Call FeTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,              & 
& MFu2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,            & 
& ZUL,ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,mu2,v,gPFe(:,1:13),gTFe,             & 
& BRFe(:,1:13))

Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
If (OneLoopDecays) Then 
gT1LFe(i1) =Sum(gP1LFe(i1,:)) 
If (gT1LFe(i1).Gt.0._dp) BR1LFe(i1,: ) =gP1LFe(i1,:)/gT1LFe(i1) 
End if
End Do 
 

gPFd = 0._dp 
gTFd = 0._dp 
BRFd = 0._dp 
Call FdTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,              & 
& MFu2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,            & 
& ZUL,ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,mu2,v,gPFd(:,1:15),gTFd,             & 
& BRFd(:,1:15))

Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
If (OneLoopDecays) Then 
gT1LFd(i1) =Sum(gP1LFd(i1,:)) 
If (gT1LFd(i1).Gt.0._dp) BR1LFd(i1,: ) =gP1LFd(i1,:)/gT1LFd(i1) 
End if
End Do 
 

gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
Call hhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,              & 
& MFu2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,            & 
& ZUL,ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,mu2,v,gPhh,gThh,BRhh)

Do i1=1,1
gThh =Sum(gPhh(i1,:)) 
If (gThh.Gt.0._dp) BRhh(i1,: ) =gPhh(i1,:)/gThh 
If (OneLoopDecays) Then 
gT1Lhh =Sum(gP1Lhh(i1,:)) 
If (gT1Lhh.Gt.0._dp) BR1Lhh(i1,: ) =gP1Lhh(i1,:)/gT1Lhh 
End if
End Do 
 

gPFre = 0._dp 
gTFre = 0._dp 
BRFre = 0._dp 
Call FreTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,             & 
& MFu2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,            & 
& ZUL,ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,mu2,v,gPFre(:,1:6),gTFre,            & 
& BRFre(:,1:6))

Do i1=1,1
gTFre =Sum(gPFre(i1,:)) 
If (gTFre.Gt.0._dp) BRFre(i1,: ) =gPFre(i1,:)/gTFre 
If (OneLoopDecays) Then 
gT1LFre =Sum(gP1LFre(i1,:)) 
If (gT1LFre.Gt.0._dp) BR1LFre(i1,: ) =gP1LFre(i1,:)/gT1LFre 
End if
End Do 
 

gPss = 0._dp 
gTss = 0._dp 
BRss = 0._dp 
Call ssTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,              & 
& MFu2,Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,            & 
& ZUL,ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,mu2,v,gPss,gTss,BRss)

Do i1=1,1
gTss =Sum(gPss(i1,:)) 
If (gTss.Gt.0._dp) BRss(i1,: ) =gPss(i1,:)/gTss 
If (OneLoopDecays) Then 
gT1Lss =Sum(gP1Lss(i1,:)) 
If (gT1Lss.Gt.0._dp) BR1Lss(i1,: ) =gP1Lss(i1,:)/gT1Lss 
End if
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Fu)) Then 
If (MaxVal(gTFu).Lt.MaxVal(fac3*Abs(MFu))) Then 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,mu2,v,gThh,gTVWp,gTVZ,gFuFucFdFd,        & 
& gFuFdcFeFv,gFuFucFeFe,gFuFucFuFu,gFuFucFreFre,gFuFucFvFv,epsI,deltaM,.False.,          & 
& gTFu,gPFu(:,16:153),BRFu(:,16:153))

Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,mu2,v,gThh,gTVWp,gTVZ,gFuFucFdFd,        & 
& gFuFdcFeFv,gFuFucFeFe,gFuFucFuFu,gFuFucFreFre,gFuFucFvFv,epsI,deltaM,.True.,           & 
& gTFu,gPFu(:,16:153),BRFu(:,16:153))

End If 
 
End If 
Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,mu2,v,gThh,gTVWp,gTVZ,gFuFucFdFd,        & 
& gFuFdcFeFv,gFuFucFeFe,gFuFucFuFu,gFuFucFreFre,gFuFucFvFv,epsI,deltaM,.False.,          & 
& gTFu,gPFu(:,16:153),BRFu(:,16:153))

End If 
Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Fe)) Then 
If (MaxVal(gTFe).Lt.MaxVal(fac3*Abs(MFe))) Then 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,mu2,v,gThh,gTss,gTVWp,gTVZ,              & 
& gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFecFreFre,gFeFecFvFv,gFeFrecFeFre,gFeFvcFuFd,      & 
& epsI,deltaM,.False.,gTFe,gPFe(:,14:154),BRFe(:,14:154))

Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,mu2,v,gThh,gTss,gTVWp,gTVZ,              & 
& gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFecFreFre,gFeFecFvFv,gFeFrecFeFre,gFeFvcFuFd,      & 
& epsI,deltaM,.True.,gTFe,gPFe(:,14:154),BRFe(:,14:154))

End If 
 
End If 
Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,mu2,v,gThh,gTss,gTVWp,gTVZ,              & 
& gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFecFreFre,gFeFecFvFv,gFeFrecFeFre,gFeFvcFuFd,      & 
& epsI,deltaM,.False.,gTFe,gPFe(:,14:154),BRFe(:,14:154))

End If 
Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Fd)) Then 
If (MaxVal(gTFd).Lt.MaxVal(fac3*Abs(MFd))) Then 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,mu2,v,gThh,gTVWp,gTVZ,gFdFdcFdFd,        & 
& gFdFdcFeFe,gFdFdcFuFu,gFdFdcFreFre,gFdFdcFvFv,gFdFucFvFe,epsI,deltaM,.False.,          & 
& gTFd,gPFd(:,16:153),BRFd(:,16:153))

Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,mu2,v,gThh,gTVWp,gTVZ,gFdFdcFdFd,        & 
& gFdFdcFeFe,gFdFdcFuFu,gFdFdcFreFre,gFdFdcFvFv,gFdFucFvFe,epsI,deltaM,.True.,           & 
& gTFd,gPFd(:,16:153),BRFd(:,16:153))

End If 
 
End If 
Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,mu2,v,gThh,gTVWp,gTVZ,gFdFdcFdFd,        & 
& gFdFdcFeFe,gFdFdcFuFu,gFdFdcFreFre,gFdFdcFvFv,gFdFucFvFe,epsI,deltaM,.False.,          & 
& gTFd,gPFd(:,16:153),BRFd(:,16:153))

End If 
Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

! No 3-body decays for hh  
If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Fre)) Then 
If (gTFre.Lt.fac3*Abs(MFre)) Then 
Call FreThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,             & 
& Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,mu2,v,epsI,deltaM,.False.,               & 
& gTFre,gPFre(:,7:6),BRFre(:,7:6))

Else 
Call FreThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,             & 
& Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,mu2,v,epsI,deltaM,.True.,gTFre,          & 
& gPFre(:,7:6),BRFre(:,7:6))

End If 
 
End If 
Else 
Call FreThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,             & 
& Mhh,Mhh2,MHp,MHp2,Mss,Mss2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZW,ZZ,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MFS,MS2,mu2,v,epsI,deltaM,.False.,               & 
& gTFre,gPFre(:,7:6),BRFre(:,7:6))

End If 
Do i1=1,1
gTFre =Sum(gPFre(i1,:)) 
If (gTFre.Gt.0._dp) BRFre(i1,: ) =gPFre(i1,:)/gTFre 
End Do 
 

! No 3-body decays for ss  
Iname = Iname - 1 
 
End Subroutine CalculateBR 
End Module BranchingRatios_SimplifiedDMSSSFDM 
 