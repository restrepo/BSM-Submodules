! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 22:52 on 25.10.2017   
! ----------------------------------------------------------------------  
 
 
Module TreeLevelMasses_THDMIIIHB 
 
Use Control 
Use Mathematics 
Use MathematicsQP 
Use Settings 
Use Model_Data_THDMIIIHB 
!Use StandardModel 
 
 
Logical :: SignOfMassChanged =.False.  
Logical :: SignOfMuChanged =.False.  
Contains 
 
Subroutine TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHm,               & 
& MHm2,Msigma1,Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZH,               & 
& ZP,ZW,ZZ,alphaH,v,v2,g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,Yu,epYU,              & 
& Yd,Ye,epYD,epYE,M12,M112,M222,GenerationMixing,kont)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3

Complex(dp),Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,Yu(3,3),epYU(3,3),Yd(3,3),Ye(3,3),epYD(3,3),       & 
& epYE(3,3),M12,M112,M222

Real(dp),Intent(out) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh(2),Mhh2(2),MHm(2),          & 
& MHm2(2),Msigma1,Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZH(2,2),ZP(2,2),ZZ(2,2),alphaH

Complex(dp),Intent(out) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp),Intent(in) :: v,v2

Logical, Intent(in) :: GenerationMixing 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,kontSave 
Iname = Iname + 1 
NameOfUnit(Iname) = 'TreeMassesTHDM-III/HB'
 
kont = 0 
Call CalculateVPVZ(g1,g2,v,v2,ZZ,MVZ,MVZ2,TW,kont)

Call CalculateVWm(g2,v,v2,ZW,MVWm,MVWm2,kont)

Msigma12 = (4._dp*(M112) + 2*Lam1*v**2 + 2*Lam6*v*v2 + 2*Lam3*v2**2 + 2*Lam4*v2**2 -  & 
&  Lam5*v2**2 - v2**2*Conjg(Lam5) + 2*v*v2*Conjg(Lam6) + g2**2*v**2*Cos(TW)              & 
& **2*RXiZ + 2*g1*g2*v**2*Cos(TW)*RXiZ*Sin(TW) + g1**2*v**2*RXiZ*Sin(TW)**2)/4._dp 
  If (Msigma12.ne.Msigma12) Then 
      Write(*,*) 'NaN appearing in Msigma12' 
      Call TerminateProgram 
    End If 
  If (Msigma12.Ge.0._dp) Then 
Msigma1 = sqrt(Msigma12) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Msigma12' 
      Write(10,*) 'mass squarred is negative: ',Msigma12 
    End If 
     Write(ErrCan,*) 'Warning from routine Msigma12' 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) Msigma12 
     Write(*,*) 'Warning from routine Msigma12' 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) Msigma12 
        Msigma1= 1._dp 
        Msigma12= 1._dp 
   SignOfMassChanged = .True. 
 End if 


! ------------------------------- 
MAh2 = (4._dp*(M222) + 2*Lam3*v**2 + 2*Lam4*v**2 - Lam5*v**2 + 2*Lam7*v*v2 +          & 
&  2*Lam2*v2**2 - v**2*Conjg(Lam5) + 2*v*v2*Conjg(Lam7) + g2**2*v2**2*Cos(TW)            & 
& **2*RXiZ + 2*g1*g2*v2**2*Cos(TW)*RXiZ*Sin(TW) + g1**2*v2**2*RXiZ*Sin(TW)               & 
& **2)/4._dp 
  If (MAh2.ne.MAh2) Then 
      Write(*,*) 'NaN appearing in MAh2' 
      Call TerminateProgram 
    End If 
  If (MAh2.Ge.0._dp) Then 
MAh = sqrt(MAh2) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from MAh2' 
      Write(10,*) 'mass squarred is negative: ',MAh2 
    End If 
     Write(ErrCan,*) 'Warning from routine MAh2' 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) MAh2 
     Write(*,*) 'Warning from routine MAh2' 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) MAh2 
        MAh= 1._dp 
        MAh2= 1._dp 
   SignOfMassChanged = .True. 
 End if 


! ------------------------------- 
Call CalculateMhh(M12,Lam6,Lam5,Lam7,M112,M222,Lam1,Lam4,Lam3,Lam2,v,v2,              & 
& ZH,Mhh,Mhh2,kont)

kontSave = kont 
Call CalculateMHm(g2,M12,Lam6,Lam5,Lam7,M112,M222,Lam1,Lam4,Lam3,Lam2,v,              & 
& v2,ZP,MHm,MHm2,kont)

kont = kontSave 
Call CalculateMFd(Yd,epYD,v,v2,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
Call CalculateMFu(Yu,epYU,v,v2,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 
Call CalculateMFe(Ye,epYE,v,v2,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 

 
 Call SortGoldstones(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHm,MHm2,            & 
& Msigma1,Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZH,ZP,ZW,              & 
& ZZ,alphaH,kont)

If (SignOfMassChanged) Then  
 If (.Not.IgnoreNegativeMasses) Then 
  Write(*,*) " Stopping calculation because of negative mass squared." 
  Call TerminateProgram 
 Else 
  SignOfMassChanged= .False. 
  kont=0  
 End If 
End If 
If (SignOfMuChanged) Then 
 If (.Not.IgnoreMuSignFlip) Then 
  Write(*,*) " Stopping calculation because of negative mass squared in tadpoles." 
  Call TerminateProgram 
 Else 
  SignOfMuChanged= .False. 
  kont=0 
 End If 
End If 

 ! -------------------------------- 
! Setting Goldstone masses 
! -------------------------------- 
 
Msigma1=MVZ*sqrt(RXiZ)
Msigma12=MVZ2*RXiZ
MHm(1)=MVWm*sqrt(RXiWm)
MHm2(1)=MVWm2*RXiWm
alphaH = ACos(ZH(1,2))
TW = ACos(Abs(ZZ(1,1)))
Iname = Iname - 1 
 
End Subroutine  TreeMasses 
 
 
Subroutine RunningFermionMasses(MFeIN,MFe2IN,MFdIN,MFd2IN,MFuIN,MFu2IN,               & 
& v,v2,g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,Yu,epYU,Yd,Ye,epYD,epYE,              & 
& M12,M112,M222,kont)

Implicit None 
 
Integer, Intent(inout) :: kont 
Real(dp),Intent(in) :: g1,g2,g3

Complex(dp),Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,Yu(3,3),epYU(3,3),Yd(3,3),Ye(3,3),epYD(3,3),       & 
& epYE(3,3),M12,M112,M222

Real(dp),Intent(in) :: v,v2

Real(dp),Intent(inout) :: MFeIN(3),MFe2IN(3),MFdIN(3),MFd2IN(3),MFuIN(3),MFu2IN(3)

Real(dp) :: MFe(3),MFe2(3),MFd(3),MFd2(3),MFu(3),MFu2(3)

Call CalculateMFe(Ye,epYE,v,v2,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 
MFeIN(1:2) = MFe(1:2) 
MFe2IN(1:2) = MFe2(1:2) 
Call CalculateMFd(Yd,epYD,v,v2,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
MFdIN(1:2) = MFd(1:2) 
MFd2IN(1:2) = MFd2(1:2) 
Call CalculateMFu(Yu,epYU,v,v2,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 
MFuIN(1:2) = MFu(1:2) 
MFu2IN(1:2) = MFu2(1:2) 
End Subroutine RunningFermionMasses 

Subroutine TreeMassesEffPot(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,             & 
& MHm,MHm2,Msigma1,Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,              & 
& ZH,ZP,ZW,ZZ,alphaH,v,v2,g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,Yu,epYU,           & 
& Yd,Ye,epYD,epYE,M12,M112,M222,GenerationMixing,kont)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3

Complex(dp),Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,Yu(3,3),epYU(3,3),Yd(3,3),Ye(3,3),epYD(3,3),       & 
& epYE(3,3),M12,M112,M222

Real(dp),Intent(out) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh(2),Mhh2(2),MHm(2),          & 
& MHm2(2),Msigma1,Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZH(2,2),ZP(2,2),ZZ(2,2),alphaH

Complex(dp),Intent(out) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp),Intent(in) :: v,v2

Logical, Intent(in) :: GenerationMixing 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,kontSave 
Iname = Iname + 1 
NameOfUnit(Iname) = 'TreeMassesTHDM-III/HB'
 
kont = 0 
Call CalculateVPVZEffPot(g1,g2,v,v2,ZZ,MVZ,MVZ2,TW,kont)

Call CalculateVWmEffPot(g2,v,v2,ZW,MVWm,MVWm2,kont)

Msigma12 = (4._dp*(M112) + 2*Lam1*v**2 + 2*Lam6*v*v2 + 2*Lam3*v2**2 + 2*Lam4*v2**2 -  & 
&  Lam5*v2**2 - v2**2*Conjg(Lam5) + 2*v*v2*Conjg(Lam6) + g2**2*v**2*Cos(TW)              & 
& **2*RXiZ + 2*g1*g2*v**2*Cos(TW)*RXiZ*Sin(TW) + g1**2*v**2*RXiZ*Sin(TW)**2)/4._dp 
  If (Msigma12.ne.Msigma12) Then 
      Write(*,*) 'NaN appearing in Msigma12' 
      Call TerminateProgram 
    End If 
  If (Msigma12.Ge.0._dp) Then 
Msigma1 = sqrt(Msigma12) 
  Else 
 End if 


! ------------------------------- 
MAh2 = (4._dp*(M222) + 2*Lam3*v**2 + 2*Lam4*v**2 - Lam5*v**2 + 2*Lam7*v*v2 +          & 
&  2*Lam2*v2**2 - v**2*Conjg(Lam5) + 2*v*v2*Conjg(Lam7) + g2**2*v2**2*Cos(TW)            & 
& **2*RXiZ + 2*g1*g2*v2**2*Cos(TW)*RXiZ*Sin(TW) + g1**2*v2**2*RXiZ*Sin(TW)               & 
& **2)/4._dp 
  If (MAh2.ne.MAh2) Then 
      Write(*,*) 'NaN appearing in MAh2' 
      Call TerminateProgram 
    End If 
  If (MAh2.Ge.0._dp) Then 
MAh = sqrt(MAh2) 
  Else 
 End if 


! ------------------------------- 
Call CalculateMhhEffPot(M12,Lam6,Lam5,Lam7,M112,M222,Lam1,Lam4,Lam3,Lam2,             & 
& v,v2,ZH,Mhh,Mhh2,kont)

kontSave = kont 
Call CalculateMHmEffPot(g2,M12,Lam6,Lam5,Lam7,M112,M222,Lam1,Lam4,Lam3,               & 
& Lam2,v,v2,ZP,MHm,MHm2,kont)

kont = kontSave 
Call CalculateMFdEffPot(Yd,epYD,v,v2,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
Call CalculateMFuEffPot(Yu,epYU,v,v2,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 
Call CalculateMFeEffPot(Ye,epYE,v,v2,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 

 
 If (SignOfMassChanged) Then  
 If (.Not.IgnoreNegativeMasses) Then 
  Write(*,*) " Stopping calculation because of negative mass squared." 
  Call TerminateProgram 
 Else 
  SignOfMassChanged= .False. 
  kont=0  
 End If 
End If 
If (SignOfMuChanged) Then 
 If (.Not.IgnoreMuSignFlip) Then 
  Write(*,*) " Stopping calculation because of negative mass squared in tadpoles." 
  Call TerminateProgram 
 Else 
  SignOfMuChanged= .False. 
  kont=0 
 End If 
End If 
Iname = Iname - 1 
 
End Subroutine  TreeMassesEffPot 
 
 
Subroutine CalculateMhh(M12,Lam6,Lam5,Lam7,M112,M222,Lam1,Lam4,Lam3,Lam2,             & 
& v,v2,ZH,Mhh,Mhh2,kont)

Real(dp), Intent(in) :: v,v2

Complex(dp), Intent(in) :: M12,Lam6,Lam5,Lam7,M112,M222,Lam1,Lam4,Lam3,Lam2

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: Mhh(2), Mhh2(2) 
Real(dp), Intent(out) :: ZH(2,2) 
 
Real(dp) :: mat(2,2)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMhh'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+M112
mat(1,1) = mat(1,1)+(3*Lam1*v**2)/2._dp
mat(1,1) = mat(1,1)+(3*Lam6*v*v2)/2._dp
mat(1,1) = mat(1,1)+(Lam3*v2**2)/2._dp
mat(1,1) = mat(1,1)+(Lam4*v2**2)/2._dp
mat(1,1) = mat(1,1)+(Lam5*v2**2)/4._dp
mat(1,1) = mat(1,1)+(v2**2*Conjg(Lam5))/4._dp
mat(1,1) = mat(1,1)+(3*v*v2*Conjg(Lam6))/2._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-1._dp*(M12)/2._dp
mat(1,2) = mat(1,2)+(3*Lam6*v**2)/4._dp
mat(1,2) = mat(1,2)+Lam3*v*v2
mat(1,2) = mat(1,2)+Lam4*v*v2
mat(1,2) = mat(1,2)+(Lam5*v*v2)/2._dp
mat(1,2) = mat(1,2)+(3*Lam7*v2**2)/4._dp
mat(1,2) = mat(1,2)+(v*v2*Conjg(Lam5))/2._dp
mat(1,2) = mat(1,2)+(3*v**2*Conjg(Lam6))/4._dp
mat(1,2) = mat(1,2)+(3*v2**2*Conjg(Lam7))/4._dp
mat(1,2) = mat(1,2)-Conjg(M12)/2._dp
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+M222
mat(2,2) = mat(2,2)+(Lam3*v**2)/2._dp
mat(2,2) = mat(2,2)+(Lam4*v**2)/2._dp
mat(2,2) = mat(2,2)+(Lam5*v**2)/4._dp
mat(2,2) = mat(2,2)+(3*Lam7*v*v2)/2._dp
mat(2,2) = mat(2,2)+(3*Lam2*v2**2)/2._dp
mat(2,2) = mat(2,2)+(v**2*Conjg(Lam5))/4._dp
mat(2,2) = mat(2,2)+(3*v*v2*Conjg(Lam7))/2._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,Mhh2,ZH,ierr,test) 
 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Abs(Mhh2(i1)).Le.MaxMassNumericalZero) Mhh2(i1) = 1.E-10_dp 
  If (Mhh2(i1).ne.Mhh2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Mhh2(i1).Ge.0._dp) Then 
  Mhh(i1)=Sqrt(Mhh2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Mhh2(i1) 
    End If 
  Mhh(i1) = 1._dp 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Mhh2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,Mhh2(i1) 
  Mhh2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMhh 

Subroutine CalculateMHm(g2,M12,Lam6,Lam5,Lam7,M112,M222,Lam1,Lam4,Lam3,               & 
& Lam2,v,v2,ZP,MHm,MHm2,kont)

Real(dp), Intent(in) :: g2,v,v2

Complex(dp), Intent(in) :: M12,Lam6,Lam5,Lam7,M112,M222,Lam1,Lam4,Lam3,Lam2

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: MHm(2), MHm2(2) 
Real(dp), Intent(out) :: ZP(2,2) 
 
Real(dp) :: mat(2,2)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMHm'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+M112
mat(1,1) = mat(1,1)+(Lam1*v**2)/2._dp
mat(1,1) = mat(1,1)+(Lam6*v*v2)/2._dp
mat(1,1) = mat(1,1)+(Lam3*v2**2)/2._dp
mat(1,1) = mat(1,1)+(v*v2*Conjg(Lam6))/2._dp
mat(1,1) = mat(1,1)+(g2**2*v**2*RXiWm)/4._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(Lam4*v*v2)/2._dp
mat(1,2) = mat(1,2)+(Lam5*v*v2)/2._dp
mat(1,2) = mat(1,2)+(v**2*Conjg(Lam6))/2._dp
mat(1,2) = mat(1,2)+(v2**2*Conjg(Lam7))/2._dp
mat(1,2) = mat(1,2)-Conjg(M12)
mat(1,2) = mat(1,2)+(g2**2*v*v2*RXiWm)/4._dp
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+M222
mat(2,2) = mat(2,2)+(Lam3*v**2)/2._dp
mat(2,2) = mat(2,2)+(Lam7*v*v2)/2._dp
mat(2,2) = mat(2,2)+(Lam2*v2**2)/2._dp
mat(2,2) = mat(2,2)+(v*v2*Conjg(Lam7))/2._dp
mat(2,2) = mat(2,2)+(g2**2*v2**2*RXiWm)/4._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,MHm2,ZP,ierr,test) 
 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Abs(MHm2(i1)).Le.MaxMassNumericalZero) MHm2(i1) = 1.E-10_dp 
  If (MHm2(i1).ne.MHm2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MHm2(i1).Ge.0._dp) Then 
  MHm(i1)=Sqrt(MHm2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MHm2(i1) 
    End If 
  MHm(i1) = 1._dp 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MHm2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MHm2(i1) 
  MHm2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMHm 

Subroutine CalculateMFd(Yd,epYD,v,v2,ZDL,ZDR,MFd,kont)

Real(dp),Intent(in) :: v,v2

Complex(dp),Intent(in) :: Yd(3,3),epYD(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFd(3) 
 Complex(dp), Intent(out) :: ZDL(3,3), ZDR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZDL2(3,3), ZDR2(3,3) 
 
 Real(dp) :: ZDL1(3,3), ZDR1(3,3), test(2), MFd2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFd'
 
MFd = 0._dp 
ZDL = 0._dp 
ZDR = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)-((v2*epYD(1,1))/sqrt(2._dp))
mat(1,1) = mat(1,1)-((v*Yd(1,1))/sqrt(2._dp))
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-((v2*epYD(2,1))/sqrt(2._dp))
mat(1,2) = mat(1,2)-((v*Yd(2,1))/sqrt(2._dp))
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-((v2*epYD(3,1))/sqrt(2._dp))
mat(1,3) = mat(1,3)-((v*Yd(3,1))/sqrt(2._dp))
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)-((v2*epYD(1,2))/sqrt(2._dp))
mat(2,1) = mat(2,1)-((v*Yd(1,2))/sqrt(2._dp))
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)-((v2*epYD(2,2))/sqrt(2._dp))
mat(2,2) = mat(2,2)-((v*Yd(2,2))/sqrt(2._dp))
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)-((v2*epYD(3,2))/sqrt(2._dp))
mat(2,3) = mat(2,3)-((v*Yd(3,2))/sqrt(2._dp))
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)-((v2*epYD(1,3))/sqrt(2._dp))
mat(3,1) = mat(3,1)-((v*Yd(1,3))/sqrt(2._dp))
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)-((v2*epYD(2,3))/sqrt(2._dp))
mat(3,2) = mat(3,2)-((v*Yd(2,3))/sqrt(2._dp))
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)-((v2*epYD(3,3))/sqrt(2._dp))
mat(3,3) = mat(3,3)-((v*Yd(3,3))/sqrt(2._dp))

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFd2,ZDL1,ierr,test) 
                  
                  
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZDL2),mat),Transpose( Conjg(ZDR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZDR2(i1,:) = phaseM *ZDR2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZDR2(i1,i1)).gt.0._dp) Then 
phaseM = ZDR2(i1,i1) / Abs(ZDR2(i1,i1)) 
ZDR2(i1,:) = Conjg(phaseM) *ZDR2(i1,:) 
 ZDL2(i1,:) = phaseM *ZDL2(i1,:) 
 End if 
  If (MFd2(i1).ne.MFd2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFd2(i1)).Le.MaxMassNumericalZero) MFd2(i1) = Abs(MFd2(i1))+1.E-10_dp 
  If (MFd2(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MFd2(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,MFd2(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MFd2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MFd2(i1) 
  MFd2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFd, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFd = Sqrt( MFd2 ) 
ZDL = ZDL2 
ZDR = ZDR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFd 

Subroutine CalculateMFu(Yu,epYU,v,v2,ZUL,ZUR,MFu,kont)

Real(dp),Intent(in) :: v,v2

Complex(dp),Intent(in) :: Yu(3,3),epYU(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFu(3) 
 Complex(dp), Intent(out) :: ZUL(3,3), ZUR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZUL2(3,3), ZUR2(3,3) 
 
 Real(dp) :: ZUL1(3,3), ZUR1(3,3), test(2), MFu2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFu'
 
MFu = 0._dp 
ZUL = 0._dp 
ZUR = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(v2*epYU(1,1))/sqrt(2._dp)
mat(1,1) = mat(1,1)+(v*Yu(1,1))/sqrt(2._dp)
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(v2*epYU(2,1))/sqrt(2._dp)
mat(1,2) = mat(1,2)+(v*Yu(2,1))/sqrt(2._dp)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+(v2*epYU(3,1))/sqrt(2._dp)
mat(1,3) = mat(1,3)+(v*Yu(3,1))/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)+(v2*epYU(1,2))/sqrt(2._dp)
mat(2,1) = mat(2,1)+(v*Yu(1,2))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(v2*epYU(2,2))/sqrt(2._dp)
mat(2,2) = mat(2,2)+(v*Yu(2,2))/sqrt(2._dp)
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+(v2*epYU(3,2))/sqrt(2._dp)
mat(2,3) = mat(2,3)+(v*Yu(3,2))/sqrt(2._dp)
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)+(v2*epYU(1,3))/sqrt(2._dp)
mat(3,1) = mat(3,1)+(v*Yu(1,3))/sqrt(2._dp)
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)+(v2*epYU(2,3))/sqrt(2._dp)
mat(3,2) = mat(3,2)+(v*Yu(2,3))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(v2*epYU(3,3))/sqrt(2._dp)
mat(3,3) = mat(3,3)+(v*Yu(3,3))/sqrt(2._dp)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFu2,ZUL1,ierr,test) 
                  
                  
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZUL2),mat),Transpose( Conjg(ZUR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZUR2(i1,:) = phaseM *ZUR2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZUR2(i1,i1)).gt.0._dp) Then 
phaseM = ZUR2(i1,i1) / Abs(ZUR2(i1,i1)) 
ZUR2(i1,:) = Conjg(phaseM) *ZUR2(i1,:) 
 ZUL2(i1,:) = phaseM *ZUL2(i1,:) 
 End if 
  If (MFu2(i1).ne.MFu2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFu2(i1)).Le.MaxMassNumericalZero) MFu2(i1) = Abs(MFu2(i1))+1.E-10_dp 
  If (MFu2(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MFu2(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,MFu2(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MFu2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MFu2(i1) 
  MFu2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFu, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFu = Sqrt( MFu2 ) 
ZUL = ZUL2 
ZUR = ZUR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFu 

Subroutine CalculateMFe(Ye,epYE,v,v2,ZEL,ZER,MFe,kont)

Real(dp),Intent(in) :: v,v2

Complex(dp),Intent(in) :: Ye(3,3),epYE(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFe(3) 
 Complex(dp), Intent(out) :: ZEL(3,3), ZER(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZEL2(3,3), ZER2(3,3) 
 
 Real(dp) :: ZEL1(3,3), ZER1(3,3), test(2), MFe2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFe'
 
MFe = 0._dp 
ZEL = 0._dp 
ZER = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)-((v2*epYE(1,1))/sqrt(2._dp))
mat(1,1) = mat(1,1)-((v*Ye(1,1))/sqrt(2._dp))
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-((v2*epYE(2,1))/sqrt(2._dp))
mat(1,2) = mat(1,2)-((v*Ye(2,1))/sqrt(2._dp))
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-((v2*epYE(3,1))/sqrt(2._dp))
mat(1,3) = mat(1,3)-((v*Ye(3,1))/sqrt(2._dp))
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)-((v2*epYE(1,2))/sqrt(2._dp))
mat(2,1) = mat(2,1)-((v*Ye(1,2))/sqrt(2._dp))
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)-((v2*epYE(2,2))/sqrt(2._dp))
mat(2,2) = mat(2,2)-((v*Ye(2,2))/sqrt(2._dp))
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)-((v2*epYE(3,2))/sqrt(2._dp))
mat(2,3) = mat(2,3)-((v*Ye(3,2))/sqrt(2._dp))
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)-((v2*epYE(1,3))/sqrt(2._dp))
mat(3,1) = mat(3,1)-((v*Ye(1,3))/sqrt(2._dp))
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)-((v2*epYE(2,3))/sqrt(2._dp))
mat(3,2) = mat(3,2)-((v*Ye(2,3))/sqrt(2._dp))
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)-((v2*epYE(3,3))/sqrt(2._dp))
mat(3,3) = mat(3,3)-((v*Ye(3,3))/sqrt(2._dp))

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFe2,ZEL1,ierr,test) 
                  
                  
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MFe2,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZEL2),mat),Transpose( Conjg(ZER2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZER2(i1,:) = phaseM *ZER2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZER2(i1,i1)).gt.0._dp) Then 
phaseM = ZER2(i1,i1) / Abs(ZER2(i1,i1)) 
ZER2(i1,:) = Conjg(phaseM) *ZER2(i1,:) 
 ZEL2(i1,:) = phaseM *ZEL2(i1,:) 
 End if 
  If (MFe2(i1).ne.MFe2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFe2(i1)).Le.MaxMassNumericalZero) MFe2(i1) = Abs(MFe2(i1))+1.E-10_dp 
  If (MFe2(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MFe2(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,MFe2(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MFe2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MFe2(i1) 
  MFe2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFe, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFe = Sqrt( MFe2 ) 
ZEL = ZEL2 
ZER = ZER2 
Iname = Iname - 1 
 
End Subroutine CalculateMFe 

Subroutine CalculateVPVZ(g1,g2,v,v2,ZZ,MVZ,MVZ2,TW,kont)

Real(dp), Intent(in) :: g1,g2,v,v2

Real(dp), Intent(out) :: TW

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MVZ, MVZ2
Real(dp) :: VPVZ2(2),VPVZ(2)  

Real(dp), Intent(out) :: ZZ(2,2) 
 
Real(dp) :: mat(2,2)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateVPVZ'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g1**2*v**2)/4._dp
mat(1,1) = mat(1,1)+(g1**2*v2**2)/4._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-(g1*g2*v**2)/4._dp
mat(1,2) = mat(1,2)-(g1*g2*v2**2)/4._dp
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g2**2*v**2)/4._dp
mat(2,2) = mat(2,2)+(g2**2*v2**2)/4._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,VPVZ2,ZZ,ierr,test) 
 
 
ZZ = Transpose(ZZ) 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Abs(VPVZ2(i1)).Le.1.E-10_dp*(Maxval(VPVZ2))) VPVZ2(i1) = 1.E-10_dp 
  If (VPVZ2(i1).ne.VPVZ2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (VPVZ2(i1).Ge.0._dp) Then 
  VPVZ(i1) =Sqrt(VPVZ2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,VPVZ2(i1) 
    End If 
  VPVZ(i1)= 1._dp 
  VPVZ2(i1)= 1._dp  
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,VPVZ2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,VPVZ2(i1) 
  VPVZ(i1)= 1._dp 
  VPVZ2(i1) = 1._dp  
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
MVZ = VPVZ(2) 
MVZ2 = VPVZ2(2) 
TW = ACos(Abs(ZZ(1,1)))

 Iname = Iname - 1 
 
End Subroutine CalculateVPVZ 

Subroutine CalculateVWm(g2,v,v2,ZW,MVWm,MVWm2,kont)

Real(dp), Intent(in) :: g2,v,v2

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MVWm, MVWm2
Real(dp) :: VWm2(2),VWm(2)  

Complex(dp), Intent(out) :: ZW(2,2) 
 
Complex(dp) :: mat(2,2)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateVWm'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g2**2*v**2)/4._dp
mat(1,1) = mat(1,1)+(g2**2*v2**2)/4._dp
mat(1,2) = 0._dp 
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g2**2*v**2)/4._dp
mat(2,2) = mat(2,2)+(g2**2*v2**2)/4._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,VWm2,ZW,ierr,test) 
 
 
ZW = Transpose(ZW) 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Abs(VWm2(i1)).Le.1.E-10_dp*(Maxval(VWm2))) VWm2(i1) = 1.E-10_dp 
  If (VWm2(i1).ne.VWm2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (VWm2(i1).Ge.0._dp) Then 
  VWm(i1) =Sqrt(VWm2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,VWm2(i1) 
    End If 
  VWm(i1)= 1._dp 
  VWm2(i1)= 1._dp  
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,VWm2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,VWm2(i1) 
  VWm(i1)= 1._dp 
  VWm2(i1) = 1._dp  
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
MVWm = VWm(1) 
MVWm2 = VWm2(1) 

 Iname = Iname - 1 
 
End Subroutine CalculateVWm 

Subroutine CalculateMhhEffPot(M12,Lam6,Lam5,Lam7,M112,M222,Lam1,Lam4,Lam3,            & 
& Lam2,v,v2,ZH,Mhh,Mhh2,kont)

Real(dp), Intent(in) :: v,v2

Complex(dp), Intent(in) :: M12,Lam6,Lam5,Lam7,M112,M222,Lam1,Lam4,Lam3,Lam2

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: Mhh(2), Mhh2(2) 
Real(dp), Intent(out) :: ZH(2,2) 
 
Real(dp) :: mat(2,2)  

Real(dp) :: Mhh2temp(2), Q2 
Real(dp) :: ZHtemp(2,2),ZHtemp2(2,2) 
 
Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMhh'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+M112
mat(1,1) = mat(1,1)+(3*Lam1*v**2)/2._dp
mat(1,1) = mat(1,1)+(3*Lam6*v*v2)/2._dp
mat(1,1) = mat(1,1)+(Lam3*v2**2)/2._dp
mat(1,1) = mat(1,1)+(Lam4*v2**2)/2._dp
mat(1,1) = mat(1,1)+(Lam5*v2**2)/4._dp
mat(1,1) = mat(1,1)+(v2**2*Conjg(Lam5))/4._dp
mat(1,1) = mat(1,1)+(3*v*v2*Conjg(Lam6))/2._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-1._dp*(M12)/2._dp
mat(1,2) = mat(1,2)+(3*Lam6*v**2)/4._dp
mat(1,2) = mat(1,2)+Lam3*v*v2
mat(1,2) = mat(1,2)+Lam4*v*v2
mat(1,2) = mat(1,2)+(Lam5*v*v2)/2._dp
mat(1,2) = mat(1,2)+(3*Lam7*v2**2)/4._dp
mat(1,2) = mat(1,2)+(v*v2*Conjg(Lam5))/2._dp
mat(1,2) = mat(1,2)+(3*v**2*Conjg(Lam6))/4._dp
mat(1,2) = mat(1,2)+(3*v2**2*Conjg(Lam7))/4._dp
mat(1,2) = mat(1,2)-Conjg(M12)/2._dp
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+M222
mat(2,2) = mat(2,2)+(Lam3*v**2)/2._dp
mat(2,2) = mat(2,2)+(Lam4*v**2)/2._dp
mat(2,2) = mat(2,2)+(Lam5*v**2)/4._dp
mat(2,2) = mat(2,2)+(3*Lam7*v*v2)/2._dp
mat(2,2) = mat(2,2)+(3*Lam2*v2**2)/2._dp
mat(2,2) = mat(2,2)+(v**2*Conjg(Lam5))/4._dp
mat(2,2) = mat(2,2)+(3*v*v2*Conjg(Lam7))/2._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,Mhh2,ZH,ierr,test) 
 
 
! Fix phases
Do i1=1,2
  pos=Maxloc(Abs(ZH(i1,:)),1)
  If (Real(ZH(i1,pos),dp).lt.0._dp) Then
    ZH(i1,:)=-ZH(i1,:)
  End if
End do
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Mhh2(i1).ne.Mhh2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Mhh2(i1).Ge.0._dp) Then 
  Mhh(i1)=Sqrt(Mhh2(i1) ) 
  Else 
  Mhh(i1) = 1._dp 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMhhEffPot 

Subroutine CalculateMHmEffPot(g2,M12,Lam6,Lam5,Lam7,M112,M222,Lam1,Lam4,              & 
& Lam3,Lam2,v,v2,ZP,MHm,MHm2,kont)

Real(dp), Intent(in) :: g2,v,v2

Complex(dp), Intent(in) :: M12,Lam6,Lam5,Lam7,M112,M222,Lam1,Lam4,Lam3,Lam2

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr, pos 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MHm(2), MHm2(2) 
Real(dp), Intent(out) :: ZP(2,2) 
 
Real(dp) :: ZPFIX(2,2) 
 
Real(dp) :: mat(2,2)  

Real(dp) ::  test(2), Q2 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMHm'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+M112
mat(1,1) = mat(1,1)+(Lam1*v**2)/2._dp
mat(1,1) = mat(1,1)+(Lam6*v*v2)/2._dp
mat(1,1) = mat(1,1)+(Lam3*v2**2)/2._dp
mat(1,1) = mat(1,1)+(v*v2*Conjg(Lam6))/2._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(Lam4*v*v2)/2._dp
mat(1,2) = mat(1,2)+(Lam5*v*v2)/2._dp
mat(1,2) = mat(1,2)+(v**2*Conjg(Lam6))/2._dp
mat(1,2) = mat(1,2)+(v2**2*Conjg(Lam7))/2._dp
mat(1,2) = mat(1,2)-Conjg(M12)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+M222
mat(2,2) = mat(2,2)+(Lam3*v**2)/2._dp
mat(2,2) = mat(2,2)+(Lam7*v*v2)/2._dp
mat(2,2) = mat(2,2)+(Lam2*v2**2)/2._dp
mat(2,2) = mat(2,2)+(v*v2*Conjg(Lam7))/2._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,MHm2,ZP,ierr,test) 
 
 
! Fix phases
Do i1=1,2
  pos=Maxloc(Abs(ZP(i1,:)),1)
  If (Real(ZP(i1,pos),dp).lt.0._dp) Then
    ZP(i1,:)=-ZP(i1,:)
  End if
End do
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (MHm2(i1).ne.MHm2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MHm2(i1).Ge.0._dp) Then 
  MHm(i1)=Sqrt(MHm2(i1) ) 
  Else 
  MHm(i1) = 1._dp 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMHmEffPot 

Subroutine CalculateMFdEffPot(Yd,epYD,v,v2,ZDL,ZDR,MFd,kont)

Real(dp),Intent(in) :: v,v2

Complex(dp),Intent(in) :: Yd(3,3),epYD(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFd(3) 
 Complex(dp), Intent(out) :: ZDL(3,3), ZDR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZDL2(3,3), ZDR2(3,3) 
 
 Real(dp) :: ZDL1(3,3), ZDR1(3,3), test(2), MFd2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFd'
 
MFd = 0._dp 
ZDL = 0._dp 
ZDR = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)-((v2*epYD(1,1))/sqrt(2._dp))
mat(1,1) = mat(1,1)-((v*Yd(1,1))/sqrt(2._dp))
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-((v2*epYD(2,1))/sqrt(2._dp))
mat(1,2) = mat(1,2)-((v*Yd(2,1))/sqrt(2._dp))
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-((v2*epYD(3,1))/sqrt(2._dp))
mat(1,3) = mat(1,3)-((v*Yd(3,1))/sqrt(2._dp))
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)-((v2*epYD(1,2))/sqrt(2._dp))
mat(2,1) = mat(2,1)-((v*Yd(1,2))/sqrt(2._dp))
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)-((v2*epYD(2,2))/sqrt(2._dp))
mat(2,2) = mat(2,2)-((v*Yd(2,2))/sqrt(2._dp))
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)-((v2*epYD(3,2))/sqrt(2._dp))
mat(2,3) = mat(2,3)-((v*Yd(3,2))/sqrt(2._dp))
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)-((v2*epYD(1,3))/sqrt(2._dp))
mat(3,1) = mat(3,1)-((v*Yd(1,3))/sqrt(2._dp))
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)-((v2*epYD(2,3))/sqrt(2._dp))
mat(3,2) = mat(3,2)-((v*Yd(2,3))/sqrt(2._dp))
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)-((v2*epYD(3,3))/sqrt(2._dp))
mat(3,3) = mat(3,3)-((v*Yd(3,3))/sqrt(2._dp))

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFd2,ZDL1,ierr,test) 
                  
                  
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZDL2),mat),Transpose( Conjg(ZDR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZDR2(i1,:) = phaseM *ZDR2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZDR2(i1,i1)).gt.0._dp) Then 
phaseM = ZDR2(i1,i1) / Abs(ZDR2(i1,i1)) 
ZDR2(i1,:) = Conjg(phaseM) *ZDR2(i1,:) 
 ZDL2(i1,:) = phaseM *ZDL2(i1,:) 
 End if 
  If (MFd2(i1).ne.MFd2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFd2(i1)).Le.MaxMassNumericalZero) MFd2(i1) = Abs(MFd2(i1))+1.E-10_dp 
  If (MFd2(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFd, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFd = Sqrt( MFd2 ) 
ZDL = ZDL2 
ZDR = ZDR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFdEffPot 

Subroutine CalculateMFuEffPot(Yu,epYU,v,v2,ZUL,ZUR,MFu,kont)

Real(dp),Intent(in) :: v,v2

Complex(dp),Intent(in) :: Yu(3,3),epYU(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFu(3) 
 Complex(dp), Intent(out) :: ZUL(3,3), ZUR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZUL2(3,3), ZUR2(3,3) 
 
 Real(dp) :: ZUL1(3,3), ZUR1(3,3), test(2), MFu2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFu'
 
MFu = 0._dp 
ZUL = 0._dp 
ZUR = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(v2*epYU(1,1))/sqrt(2._dp)
mat(1,1) = mat(1,1)+(v*Yu(1,1))/sqrt(2._dp)
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(v2*epYU(2,1))/sqrt(2._dp)
mat(1,2) = mat(1,2)+(v*Yu(2,1))/sqrt(2._dp)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+(v2*epYU(3,1))/sqrt(2._dp)
mat(1,3) = mat(1,3)+(v*Yu(3,1))/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)+(v2*epYU(1,2))/sqrt(2._dp)
mat(2,1) = mat(2,1)+(v*Yu(1,2))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(v2*epYU(2,2))/sqrt(2._dp)
mat(2,2) = mat(2,2)+(v*Yu(2,2))/sqrt(2._dp)
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+(v2*epYU(3,2))/sqrt(2._dp)
mat(2,3) = mat(2,3)+(v*Yu(3,2))/sqrt(2._dp)
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)+(v2*epYU(1,3))/sqrt(2._dp)
mat(3,1) = mat(3,1)+(v*Yu(1,3))/sqrt(2._dp)
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)+(v2*epYU(2,3))/sqrt(2._dp)
mat(3,2) = mat(3,2)+(v*Yu(2,3))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(v2*epYU(3,3))/sqrt(2._dp)
mat(3,3) = mat(3,3)+(v*Yu(3,3))/sqrt(2._dp)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFu2,ZUL1,ierr,test) 
                  
                  
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZUL2),mat),Transpose( Conjg(ZUR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZUR2(i1,:) = phaseM *ZUR2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZUR2(i1,i1)).gt.0._dp) Then 
phaseM = ZUR2(i1,i1) / Abs(ZUR2(i1,i1)) 
ZUR2(i1,:) = Conjg(phaseM) *ZUR2(i1,:) 
 ZUL2(i1,:) = phaseM *ZUL2(i1,:) 
 End if 
  If (MFu2(i1).ne.MFu2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFu2(i1)).Le.MaxMassNumericalZero) MFu2(i1) = Abs(MFu2(i1))+1.E-10_dp 
  If (MFu2(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFu, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFu = Sqrt( MFu2 ) 
ZUL = ZUL2 
ZUR = ZUR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFuEffPot 

Subroutine CalculateMFeEffPot(Ye,epYE,v,v2,ZEL,ZER,MFe,kont)

Real(dp),Intent(in) :: v,v2

Complex(dp),Intent(in) :: Ye(3,3),epYE(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFe(3) 
 Complex(dp), Intent(out) :: ZEL(3,3), ZER(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZEL2(3,3), ZER2(3,3) 
 
 Real(dp) :: ZEL1(3,3), ZER1(3,3), test(2), MFe2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFe'
 
MFe = 0._dp 
ZEL = 0._dp 
ZER = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)-((v2*epYE(1,1))/sqrt(2._dp))
mat(1,1) = mat(1,1)-((v*Ye(1,1))/sqrt(2._dp))
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-((v2*epYE(2,1))/sqrt(2._dp))
mat(1,2) = mat(1,2)-((v*Ye(2,1))/sqrt(2._dp))
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-((v2*epYE(3,1))/sqrt(2._dp))
mat(1,3) = mat(1,3)-((v*Ye(3,1))/sqrt(2._dp))
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)-((v2*epYE(1,2))/sqrt(2._dp))
mat(2,1) = mat(2,1)-((v*Ye(1,2))/sqrt(2._dp))
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)-((v2*epYE(2,2))/sqrt(2._dp))
mat(2,2) = mat(2,2)-((v*Ye(2,2))/sqrt(2._dp))
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)-((v2*epYE(3,2))/sqrt(2._dp))
mat(2,3) = mat(2,3)-((v*Ye(3,2))/sqrt(2._dp))
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)-((v2*epYE(1,3))/sqrt(2._dp))
mat(3,1) = mat(3,1)-((v*Ye(1,3))/sqrt(2._dp))
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)-((v2*epYE(2,3))/sqrt(2._dp))
mat(3,2) = mat(3,2)-((v*Ye(2,3))/sqrt(2._dp))
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)-((v2*epYE(3,3))/sqrt(2._dp))
mat(3,3) = mat(3,3)-((v*Ye(3,3))/sqrt(2._dp))

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFe2,ZEL1,ierr,test) 
                  
                  
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MFe2,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZEL2),mat),Transpose( Conjg(ZER2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZER2(i1,:) = phaseM *ZER2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZER2(i1,i1)).gt.0._dp) Then 
phaseM = ZER2(i1,i1) / Abs(ZER2(i1,i1)) 
ZER2(i1,:) = Conjg(phaseM) *ZER2(i1,:) 
 ZEL2(i1,:) = phaseM *ZEL2(i1,:) 
 End if 
  If (MFe2(i1).ne.MFe2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFe2(i1)).Le.MaxMassNumericalZero) MFe2(i1) = Abs(MFe2(i1))+1.E-10_dp 
  If (MFe2(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFe, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFe = Sqrt( MFe2 ) 
ZEL = ZEL2 
ZER = ZER2 
Iname = Iname - 1 
 
End Subroutine CalculateMFeEffPot 

Subroutine CalculateVPVZEffPot(g1,g2,v,v2,ZZ,MVZ,MVZ2,TW,kont)

Real(dp), Intent(in) :: g1,g2,v,v2

Real(dp), Intent(out) :: TW

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MVZ, MVZ2
Real(dp) :: VPVZ2(2),VPVZ(2)  

Real(dp), Intent(out) :: ZZ(2,2) 
 
Real(dp) :: mat(2,2)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateVPVZ'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g1**2*v2Fix**2)/4._dp
mat(1,1) = mat(1,1)+(g1**2*vFix**2)/4._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-(g1*g2*v2Fix**2)/4._dp
mat(1,2) = mat(1,2)-(g1*g2*vFix**2)/4._dp
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g2**2*v2Fix**2)/4._dp
mat(2,2) = mat(2,2)+(g2**2*vFix**2)/4._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,VPVZ2,ZZ,ierr,test) 
 
 
ZZ = Transpose(ZZ) 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Abs(VPVZ2(i1)).Le.1.E-10_dp*(Maxval(VPVZ2))) VPVZ2(i1) = 1.E-10_dp 
  If (VPVZ2(i1).ne.VPVZ2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (VPVZ2(i1).Ge.0._dp) Then 
  VPVZ(i1) =Sqrt(VPVZ2(i1) ) 
  Else 
  VPVZ(i1)= 1._dp 
  VPVZ(i1)= 1._dp 
! kont = -104 
 End if 
End Do 
 
MVZ = VPVZ(2) 
MVZ2 = VPVZ2(2) 

 Iname = Iname - 1 
 
End Subroutine CalculateVPVZEffPot 

Subroutine CalculateVWmEffPot(g2,v,v2,ZW,MVWm,MVWm2,kont)

Real(dp), Intent(in) :: g2,v,v2

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MVWm, MVWm2
Real(dp) :: VWm2(2),VWm(2)  

Complex(dp), Intent(out) :: ZW(2,2) 
 
Complex(dp) :: mat(2,2)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateVWm'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g2**2*v2Fix**2)/4._dp
mat(1,1) = mat(1,1)+(g2**2*vFix**2)/4._dp
mat(1,2) = 0._dp 
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g2**2*v2Fix**2)/4._dp
mat(2,2) = mat(2,2)+(g2**2*vFix**2)/4._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,VWm2,ZW,ierr,test) 
 
 
ZW = Transpose(ZW) 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Abs(VWm2(i1)).Le.1.E-10_dp*(Maxval(VWm2))) VWm2(i1) = 1.E-10_dp 
  If (VWm2(i1).ne.VWm2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (VWm2(i1).Ge.0._dp) Then 
  VWm(i1) =Sqrt(VWm2(i1) ) 
  Else 
  VWm(i1)= 1._dp 
  VWm(i1)= 1._dp 
! kont = -104 
 End if 
End Do 
 
MVWm = VWm(1) 
MVWm2 = VWm2(1) 

 Iname = Iname - 1 
 
End Subroutine CalculateVWmEffPot 

Subroutine TreeMassesSM(MFd,MFd2,MFe,MFe2,MFu,MFu2,MVWm,MVWm2,MVZ,MVZ2,               & 
& TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,v,v2,g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,               & 
& Lam3,Lam2,Yu,epYU,Yd,Ye,epYD,epYE,M12,M112,M222,GenerationMixing,kont)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3

Complex(dp),Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,Yu(3,3),epYU(3,3),Yd(3,3),Ye(3,3),epYD(3,3),       & 
& epYE(3,3),M12,M112,M222

Real(dp),Intent(out) :: MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MVWm,MVWm2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(out) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp),Intent(in) :: v,v2

Logical, Intent(in) :: GenerationMixing 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,kontSave 
Iname = Iname + 1 
NameOfUnit(Iname) = 'TreeMassesTHDM-III/HB'
 
kont = 0 
Call CalculateMFd(Yd,epYD,v,v2,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
Call CalculateMFu(Yu,epYU,v,v2,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 
Call CalculateMFe(Ye,epYE,v,v2,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 

 
 Call CalculateVPVZ(g1,g2,v,v2,ZZ,MVZ,MVZ2,TW,kont)

Call CalculateVWm(g2,v,v2,ZW,MVWm,MVWm2,kont)

Iname = Iname - 1 
 
End Subroutine  TreeMassesSM 
 
 
Subroutine SortGoldstones(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,               & 
& MHm,MHm2,Msigma1,Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,              & 
& ZH,ZP,ZW,ZZ,alphaH,kont)

Real(dp),Intent(inout) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh(2),Mhh2(2),MHm(2),          & 
& MHm2(2),Msigma1,Msigma12,MVWm,MVWm2,MVZ,MVZ2,TW,ZH(2,2),ZP(2,2),ZZ(2,2),alphaH

Complex(dp),Intent(inout) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Integer, Intent(inout) :: kont 
Integer :: i1, i2, pos 
Real(dp) :: MHmtemp(2) 
Complex(dp) :: ZHmtemp(2,2) 


pos = MinLoc(Abs(MHm2-MVWm2*RXiWm),1) 
If (pos.ne.1) Then 
  MHmtemp = MHm2 
  ZHmtemp = ZP 
  MHm2(1) = MHmtemp(pos) 
  ZP(1,:) = ZHmtemp(pos,:) 
  MHm2(pos) = MHmtemp(1) 
  ZP(pos,:) = ZHmtemp(1,:) 
End if 

 ! Reorder the physical states by their mass 
Do i1=2,2
 pos = Minloc(MHm2(i1:2),1) + i1 -1  
If (pos.ne.i1) Then 
  MHmtemp = MHm2 
  ZHmtemp = ZP 
  MHm2(i1) = MHmtemp(pos) 
  ZP(i1,:) = ZHmtemp(pos,:) 
  MHm2(pos) = MHmtemp(i1) 
  ZP(pos,:) = ZHmtemp(i1,:) 
End if 
End do 
MHm = sqrt(MHm2) 

 
 
End subroutine SortGoldstones 


End Module TreeLevelMasses_THDMIIIHB 
 
