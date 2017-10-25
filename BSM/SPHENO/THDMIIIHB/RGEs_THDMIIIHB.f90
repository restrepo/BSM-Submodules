! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 17:25 on 25.10.2017   
! ----------------------------------------------------------------------  
 
 
Module RGEs_THDMIIIHB 
 
Use Control 
Use Settings 
Use Model_Data_THDMIIIHB 
Use Mathematics 
 
Logical,Private,Save::OnlyDiagonal

Real(dp),Parameter::id3R(3,3)=& 
   & Reshape(Source=(/& 
   & 1,0,0,& 
 &0,1,0,& 
 &0,0,1& 
 &/),shape=(/3,3/)) 
Contains 


Subroutine GToParameters131(g,g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,            & 
& epYU,Yu,Yd,Ye,epYD,epYE,M12,M112,M222)

Implicit None 
Real(dp), Intent(in) :: g(131) 
Real(dp),Intent(out) :: g1,g2,g3

Complex(dp),Intent(out) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU(3,3),Yu(3,3),Yd(3,3),Ye(3,3),epYD(3,3),       & 
& epYE(3,3),M12,M112,M222

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters131' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
Lam6= Cmplx(g(4),g(5),dp) 
Lam5= Cmplx(g(6),g(7),dp) 
Lam7= Cmplx(g(8),g(9),dp) 
Lam1= Cmplx(g(10),g(11),dp) 
Lam4= Cmplx(g(12),g(13),dp) 
Lam3= Cmplx(g(14),g(15),dp) 
Lam2= Cmplx(g(16),g(17),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
epYU(i1,i2) = Cmplx( g(SumI+18), g(SumI+19), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+36), g(SumI+37), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+54), g(SumI+55), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+72), g(SumI+73), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
epYD(i1,i2) = Cmplx( g(SumI+90), g(SumI+91), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
epYE(i1,i2) = Cmplx( g(SumI+108), g(SumI+109), dp) 
End Do 
 End Do 
 
M12= Cmplx(g(126),g(127),dp) 
M112= Cmplx(g(128),g(129),dp) 
M222= Cmplx(g(130),g(131),dp) 
Do i1=1,131 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters131

Subroutine ParametersToG131(g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,              & 
& epYU,Yu,Yd,Ye,epYD,epYE,M12,M112,M222,g)

Implicit None 
Real(dp), Intent(out) :: g(131) 
Real(dp), Intent(in) :: g1,g2,g3

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU(3,3),Yu(3,3),Yd(3,3),Ye(3,3),epYD(3,3),       & 
& epYE(3,3),M12,M112,M222

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG131' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = Real(Lam6,dp)  
g(5) = Aimag(Lam6)  
g(6) = Real(Lam5,dp)  
g(7) = Aimag(Lam5)  
g(8) = Real(Lam7,dp)  
g(9) = Aimag(Lam7)  
g(10) = Real(Lam1,dp)  
g(11) = Aimag(Lam1)  
g(12) = Real(Lam4,dp)  
g(13) = Aimag(Lam4)  
g(14) = Real(Lam3,dp)  
g(15) = Aimag(Lam3)  
g(16) = Real(Lam2,dp)  
g(17) = Aimag(Lam2)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+18) = Real(epYU(i1,i2), dp) 
g(SumI+19) = Aimag(epYU(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+36) = Real(Yu(i1,i2), dp) 
g(SumI+37) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+54) = Real(Yd(i1,i2), dp) 
g(SumI+55) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+72) = Real(Ye(i1,i2), dp) 
g(SumI+73) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+90) = Real(epYD(i1,i2), dp) 
g(SumI+91) = Aimag(epYD(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+108) = Real(epYE(i1,i2), dp) 
g(SumI+109) = Aimag(epYE(i1,i2)) 
End Do 
End Do 

g(126) = Real(M12,dp)  
g(127) = Aimag(M12)  
g(128) = Real(M112,dp)  
g(129) = Aimag(M112)  
g(130) = Real(M222,dp)  
g(131) = Aimag(M222)  
Iname = Iname - 1 
 
End Subroutine ParametersToG131

Subroutine rge131(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,Dg3
Complex(dp) :: Lam6,betaLam61,betaLam62,DLam6,Lam5,betaLam51,betaLam52,               & 
& DLam5,Lam7,betaLam71,betaLam72,DLam7,Lam1,betaLam11,betaLam12,DLam1,Lam4,              & 
& betaLam41,betaLam42,DLam4,Lam3,betaLam31,betaLam32,DLam3,Lam2,betaLam21,               & 
& betaLam22,DLam2,epYU(3,3),betaepYU1(3,3),betaepYU2(3,3),DepYU(3,3),adjepYU(3,3)        & 
& ,Yu(3,3),betaYu1(3,3),betaYu2(3,3),DYu(3,3),adjYu(3,3),Yd(3,3),betaYd1(3,3)            & 
& ,betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3),betaYe1(3,3),betaYe2(3,3),DYe(3,3)           & 
& ,adjYe(3,3),epYD(3,3),betaepYD1(3,3),betaepYD2(3,3),DepYD(3,3),adjepYD(3,3)            & 
& ,epYE(3,3),betaepYE1(3,3),betaepYE2(3,3),DepYE(3,3),adjepYE(3,3),M12,betaM121,         & 
& betaM122,DM12,M112,betaM1121,betaM1122,DM112,M222,betaM2221,betaM2222,DM222
Complex(dp) :: epYDadjepYD(3,3),epYDadjYd(3,3),epYEadjepYE(3,3),epYEadjYe(3,3),epYUadjepYD(3,3),     & 
& epYUadjepYU(3,3),epYUadjYu(3,3),YdadjepYD(3,3),YdadjYd(3,3),YdadjYu(3,3),              & 
& YeadjepYE(3,3),YeadjYe(3,3),YuadjepYU(3,3),YuadjYd(3,3),YuadjYu(3,3),adjepYDepYD(3,3), & 
& adjepYDYd(3,3),adjepYEepYE(3,3),adjepYEYe(3,3),adjepYUepYU(3,3),adjepYUYu(3,3),        & 
& adjYdepYD(3,3),adjYdYd(3,3),adjYeepYE(3,3),adjYeYe(3,3),adjYuepYU(3,3),adjYuYu(3,3),   & 
& epYDadjepYDepYD(3,3),epYDadjepYDYd(3,3),epYDadjepYUepYU(3,3),epYDadjepYUYu(3,3),       & 
& epYDadjYdYd(3,3),epYDadjYuYu(3,3),epYEadjepYEepYE(3,3),epYEadjepYEYe(3,3),             & 
& epYEadjYeYe(3,3),epYUadjepYDepYD(3,3),epYUadjepYDYd(3,3),epYUadjepYUepYU(3,3),         & 
& epYUadjepYUYu(3,3),epYUadjYdYd(3,3),epYUadjYuYu(3,3),YdadjepYDepYD(3,3),               & 
& YdadjepYUepYU(3,3),YdadjYdepYD(3,3),YdadjYdYd(3,3),YdadjYuepYU(3,3),YdadjYuYu(3,3),    & 
& YeadjepYEepYE(3,3),YeadjYeepYE(3,3),YeadjYeYe(3,3),YuadjepYDepYD(3,3),YuadjepYUepYU(3,3),& 
& YuadjYdepYD(3,3),YuadjYdYd(3,3),YuadjYuepYU(3,3),YuadjYuYu(3,3),adjepYDepYDadjepYD(3,3),& 
& adjepYDepYDadjYd(3,3),adjepYDYdadjepYD(3,3),adjepYDYdadjYd(3,3),adjepYDYdadjYu(3,3),   & 
& adjepYEepYEadjepYE(3,3),adjepYEepYEadjYe(3,3),adjepYEYeadjepYE(3,3),adjepYEYeadjYe(3,3),& 
& adjepYUepYUadjepYD(3,3),adjepYUepYUadjepYU(3,3),adjepYUepYUadjYu(3,3),adjepYUYuadjepYU(3,3),& 
& adjepYUYuadjYd(3,3),adjepYUYuadjYu(3,3),adjYdepYDadjepYD(3,3),adjYdepYDadjYd(3,3),     & 
& adjYdYdadjepYD(3,3),adjYdYdadjYd(3,3),adjYeepYEadjepYE(3,3),adjYeepYEadjYe(3,3),       & 
& adjYeYeadjepYE(3,3),adjYeYeadjYe(3,3),adjYuepYUadjepYU(3,3),adjYuepYUadjYu(3,3),       & 
& adjYuYuadjepYU(3,3),adjYuYuadjYd(3,3),adjYuYuadjYu(3,3),epYDadjepYDepYDadjepYD(3,3),   & 
& epYDadjepYDepYDadjYd(3,3),epYDadjepYDYdadjepYD(3,3),epYDadjepYDYdadjYd(3,3),           & 
& epYDadjepYUepYUadjepYD(3,3),epYDadjepYUYuadjYd(3,3),epYDadjYdepYDadjepYD(3,3),         & 
& epYDadjYdepYDadjYd(3,3),epYDadjYdYdadjepYD(3,3),epYDadjYdYdadjYd(3,3),epYEadjepYEepYEadjepYE(3,3),& 
& epYEadjepYEepYEadjYe(3,3),epYEadjepYEYeadjepYE(3,3),epYEadjepYEYeadjYe(3,3),           & 
& epYEadjYeepYEadjepYE(3,3),epYEadjYeepYEadjYe(3,3),epYEadjYeYeadjepYE(3,3),             & 
& epYEadjYeYeadjYe(3,3),epYUadjepYDYdadjYu(3,3),epYUadjepYUepYUadjepYU(3,3),             & 
& epYUadjepYUepYUadjYu(3,3),epYUadjepYUYuadjepYU(3,3),epYUadjepYUYuadjYu(3,3),           & 
& epYUadjYuepYUadjepYU(3,3),epYUadjYuepYUadjYu(3,3),epYUadjYuYuadjepYU(3,3),             & 
& epYUadjYuYuadjYu(3,3),YdadjepYDYdadjepYD(3,3),YdadjepYDYdadjYd(3,3),YdadjYdYdadjepYD(3,3),& 
& YdadjYdYdadjYd(3,3),YdadjYuYuadjYd(3,3),YeadjepYEYeadjepYE(3,3),YeadjepYEYeadjYe(3,3), & 
& YeadjYeYeadjepYE(3,3),YeadjYeYeadjYe(3,3),YuadjepYUYuadjepYU(3,3),YuadjepYUYuadjYu(3,3),& 
& YuadjYuYuadjepYU(3,3),YuadjYuYuadjYu(3,3)

Complex(dp) :: TrepYDadjepYD,TrepYDadjYd,TrepYEadjepYE,TrepYEadjYe,TrepYUadjepYU,TrepYUadjYu,        & 
& TrYdadjepYD,TrYdadjYd,TrYeadjepYE,TrYeadjYe,TrYuadjepYU,TrYuadjYu,TrepYDadjepYDepYDadjepYD,& 
& TrepYDadjepYDepYDadjYd,TrepYDadjepYDYdadjepYD,TrepYDadjepYDYdadjYd,TrepYDadjepYUepYUadjepYD,& 
& TrepYDadjepYUYuadjYd,TrepYDadjYdepYDadjepYD,TrepYDadjYdepYDadjYd,TrepYDadjYdYdadjepYD, & 
& TrepYDadjYdYdadjYd,TrepYEadjepYEepYEadjepYE,TrepYEadjepYEepYEadjYe,TrepYEadjepYEYeadjepYE,& 
& TrepYEadjepYEYeadjYe,TrepYEadjYeepYEadjepYE,TrepYEadjYeepYEadjYe,TrepYEadjYeYeadjepYE, & 
& TrepYEadjYeYeadjYe,TrepYUadjepYDYdadjYu,TrepYUadjepYUepYUadjepYU,TrepYUadjepYUepYUadjYu,& 
& TrepYUadjepYUYuadjepYU,TrepYUadjepYUYuadjYu,TrepYUadjYuepYUadjepYU,TrepYUadjYuepYUadjYu,& 
& TrepYUadjYuYuadjepYU,TrepYUadjYuYuadjYu,TrYdadjepYDYdadjepYD,TrYdadjepYDYdadjYd,       & 
& TrYdadjYdYdadjepYD,TrYdadjYdYdadjYd,TrYdadjYuYuadjYd,TrYeadjepYEYeadjepYE,             & 
& TrYeadjepYEYeadjYe,TrYeadjYeYeadjepYE,TrYeadjYeYeadjYe,TrYuadjepYUYuadjepYU,           & 
& TrYuadjepYUYuadjYu,TrYuadjYuYuadjepYU,TrYuadjYuYuadjYu

Real(dp) :: g1p2,g1p3,g1p4,g2p2,g2p3,g2p4,g3p2,g3p3

Complex(dp) :: Lam1p2,Lam2p2,Lam3p2,Lam4p2,Lam5p2,Lam6p2,Lam7p2

Iname = Iname +1 
NameOfUnit(Iname) = 'rge131' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters131(gy,g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU,            & 
& Yu,Yd,Ye,epYD,epYE,M12,M112,M222)

Call Adjungate(epYU,adjepYU)
Call Adjungate(Yu,adjYu)
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)
Call Adjungate(epYD,adjepYD)
Call Adjungate(epYE,adjepYE)
 epYDadjepYD = Matmul(epYD,adjepYD) 
Forall(i2=1:3)  epYDadjepYD(i2,i2) =  Real(epYDadjepYD(i2,i2),dp) 
 epYDadjYd = Matmul(epYD,adjYd) 
 epYEadjepYE = Matmul(epYE,adjepYE) 
Forall(i2=1:3)  epYEadjepYE(i2,i2) =  Real(epYEadjepYE(i2,i2),dp) 
 epYEadjYe = Matmul(epYE,adjYe) 
 epYUadjepYD = Matmul(epYU,adjepYD) 
 epYUadjepYU = Matmul(epYU,adjepYU) 
Forall(i2=1:3)  epYUadjepYU(i2,i2) =  Real(epYUadjepYU(i2,i2),dp) 
 epYUadjYu = Matmul(epYU,adjYu) 
 YdadjepYD = Matmul(Yd,adjepYD) 
 YdadjYd = Matmul(Yd,adjYd) 
Forall(i2=1:3)  YdadjYd(i2,i2) =  Real(YdadjYd(i2,i2),dp) 
 YdadjYu = Matmul(Yd,adjYu) 
 YeadjepYE = Matmul(Ye,adjepYE) 
 YeadjYe = Matmul(Ye,adjYe) 
Forall(i2=1:3)  YeadjYe(i2,i2) =  Real(YeadjYe(i2,i2),dp) 
 YuadjepYU = Matmul(Yu,adjepYU) 
 YuadjYd = Matmul(Yu,adjYd) 
 YuadjYu = Matmul(Yu,adjYu) 
Forall(i2=1:3)  YuadjYu(i2,i2) =  Real(YuadjYu(i2,i2),dp) 
 adjepYDepYD = Matmul(adjepYD,epYD) 
Forall(i2=1:3)  adjepYDepYD(i2,i2) =  Real(adjepYDepYD(i2,i2),dp) 
 adjepYDYd = Matmul(adjepYD,Yd) 
 adjepYEepYE = Matmul(adjepYE,epYE) 
Forall(i2=1:3)  adjepYEepYE(i2,i2) =  Real(adjepYEepYE(i2,i2),dp) 
 adjepYEYe = Matmul(adjepYE,Ye) 
 adjepYUepYU = Matmul(adjepYU,epYU) 
Forall(i2=1:3)  adjepYUepYU(i2,i2) =  Real(adjepYUepYU(i2,i2),dp) 
 adjepYUYu = Matmul(adjepYU,Yu) 
 adjYdepYD = Matmul(adjYd,epYD) 
 adjYdYd = Matmul(adjYd,Yd) 
Forall(i2=1:3)  adjYdYd(i2,i2) =  Real(adjYdYd(i2,i2),dp) 
 adjYeepYE = Matmul(adjYe,epYE) 
 adjYeYe = Matmul(adjYe,Ye) 
Forall(i2=1:3)  adjYeYe(i2,i2) =  Real(adjYeYe(i2,i2),dp) 
 adjYuepYU = Matmul(adjYu,epYU) 
 adjYuYu = Matmul(adjYu,Yu) 
Forall(i2=1:3)  adjYuYu(i2,i2) =  Real(adjYuYu(i2,i2),dp) 
 epYDadjepYDepYD = Matmul(epYD,adjepYDepYD) 
 epYDadjepYDYd = Matmul(epYD,adjepYDYd) 
 epYDadjepYUepYU = Matmul(epYD,adjepYUepYU) 
 epYDadjepYUYu = Matmul(epYD,adjepYUYu) 
 epYDadjYdYd = Matmul(epYD,adjYdYd) 
 epYDadjYuYu = Matmul(epYD,adjYuYu) 
 epYEadjepYEepYE = Matmul(epYE,adjepYEepYE) 
 epYEadjepYEYe = Matmul(epYE,adjepYEYe) 
 epYEadjYeYe = Matmul(epYE,adjYeYe) 
 epYUadjepYDepYD = Matmul(epYU,adjepYDepYD) 
 epYUadjepYDYd = Matmul(epYU,adjepYDYd) 
 epYUadjepYUepYU = Matmul(epYU,adjepYUepYU) 
 epYUadjepYUYu = Matmul(epYU,adjepYUYu) 
 epYUadjYdYd = Matmul(epYU,adjYdYd) 
 epYUadjYuYu = Matmul(epYU,adjYuYu) 
 YdadjepYDepYD = Matmul(Yd,adjepYDepYD) 
 YdadjepYUepYU = Matmul(Yd,adjepYUepYU) 
 YdadjYdepYD = Matmul(Yd,adjYdepYD) 
 YdadjYdYd = Matmul(Yd,adjYdYd) 
 YdadjYuepYU = Matmul(Yd,adjYuepYU) 
 YdadjYuYu = Matmul(Yd,adjYuYu) 
 YeadjepYEepYE = Matmul(Ye,adjepYEepYE) 
 YeadjYeepYE = Matmul(Ye,adjYeepYE) 
 YeadjYeYe = Matmul(Ye,adjYeYe) 
 YuadjepYDepYD = Matmul(Yu,adjepYDepYD) 
 YuadjepYUepYU = Matmul(Yu,adjepYUepYU) 
 YuadjYdepYD = Matmul(Yu,adjYdepYD) 
 YuadjYdYd = Matmul(Yu,adjYdYd) 
 YuadjYuepYU = Matmul(Yu,adjYuepYU) 
 YuadjYuYu = Matmul(Yu,adjYuYu) 
 adjepYDepYDadjepYD = Matmul(adjepYD,epYDadjepYD) 
 adjepYDepYDadjYd = Matmul(adjepYD,epYDadjYd) 
 adjepYDYdadjepYD = Matmul(adjepYD,YdadjepYD) 
 adjepYDYdadjYd = Matmul(adjepYD,YdadjYd) 
 adjepYDYdadjYu = Matmul(adjepYD,YdadjYu) 
 adjepYEepYEadjepYE = Matmul(adjepYE,epYEadjepYE) 
 adjepYEepYEadjYe = Matmul(adjepYE,epYEadjYe) 
 adjepYEYeadjepYE = Matmul(adjepYE,YeadjepYE) 
 adjepYEYeadjYe = Matmul(adjepYE,YeadjYe) 
 adjepYUepYUadjepYD = Matmul(adjepYU,epYUadjepYD) 
 adjepYUepYUadjepYU = Matmul(adjepYU,epYUadjepYU) 
 adjepYUepYUadjYu = Matmul(adjepYU,epYUadjYu) 
 adjepYUYuadjepYU = Matmul(adjepYU,YuadjepYU) 
 adjepYUYuadjYd = Matmul(adjepYU,YuadjYd) 
 adjepYUYuadjYu = Matmul(adjepYU,YuadjYu) 
 adjYdepYDadjepYD = Matmul(adjYd,epYDadjepYD) 
 adjYdepYDadjYd = Matmul(adjYd,epYDadjYd) 
 adjYdYdadjepYD = Matmul(adjYd,YdadjepYD) 
 adjYdYdadjYd = Matmul(adjYd,YdadjYd) 
 adjYeepYEadjepYE = Matmul(adjYe,epYEadjepYE) 
 adjYeepYEadjYe = Matmul(adjYe,epYEadjYe) 
 adjYeYeadjepYE = Matmul(adjYe,YeadjepYE) 
 adjYeYeadjYe = Matmul(adjYe,YeadjYe) 
 adjYuepYUadjepYU = Matmul(adjYu,epYUadjepYU) 
 adjYuepYUadjYu = Matmul(adjYu,epYUadjYu) 
 adjYuYuadjepYU = Matmul(adjYu,YuadjepYU) 
 adjYuYuadjYd = Matmul(adjYu,YuadjYd) 
 adjYuYuadjYu = Matmul(adjYu,YuadjYu) 
 epYDadjepYDepYDadjepYD = Matmul(epYD,adjepYDepYDadjepYD) 
Forall(i2=1:3)  epYDadjepYDepYDadjepYD(i2,i2) =  Real(epYDadjepYDepYDadjepYD(i2,i2),dp) 
 epYDadjepYDepYDadjYd = Matmul(epYD,adjepYDepYDadjYd) 
 epYDadjepYDYdadjepYD = Matmul(epYD,adjepYDYdadjepYD) 
 epYDadjepYDYdadjYd = Matmul(epYD,adjepYDYdadjYd) 
 epYDadjepYUepYUadjepYD = Matmul(epYD,adjepYUepYUadjepYD) 
Forall(i2=1:3)  epYDadjepYUepYUadjepYD(i2,i2) =  Real(epYDadjepYUepYUadjepYD(i2,i2),dp) 
 epYDadjepYUYuadjYd = Matmul(epYD,adjepYUYuadjYd) 
 epYDadjYdepYDadjepYD = Matmul(epYD,adjYdepYDadjepYD) 
 epYDadjYdepYDadjYd = Matmul(epYD,adjYdepYDadjYd) 
 epYDadjYdYdadjepYD = Matmul(epYD,adjYdYdadjepYD) 
Forall(i2=1:3)  epYDadjYdYdadjepYD(i2,i2) =  Real(epYDadjYdYdadjepYD(i2,i2),dp) 
 epYDadjYdYdadjYd = Matmul(epYD,adjYdYdadjYd) 
 epYEadjepYEepYEadjepYE = Matmul(epYE,adjepYEepYEadjepYE) 
Forall(i2=1:3)  epYEadjepYEepYEadjepYE(i2,i2) =  Real(epYEadjepYEepYEadjepYE(i2,i2),dp) 
 epYEadjepYEepYEadjYe = Matmul(epYE,adjepYEepYEadjYe) 
 epYEadjepYEYeadjepYE = Matmul(epYE,adjepYEYeadjepYE) 
 epYEadjepYEYeadjYe = Matmul(epYE,adjepYEYeadjYe) 
 epYEadjYeepYEadjepYE = Matmul(epYE,adjYeepYEadjepYE) 
 epYEadjYeepYEadjYe = Matmul(epYE,adjYeepYEadjYe) 
 epYEadjYeYeadjepYE = Matmul(epYE,adjYeYeadjepYE) 
Forall(i2=1:3)  epYEadjYeYeadjepYE(i2,i2) =  Real(epYEadjYeYeadjepYE(i2,i2),dp) 
 epYEadjYeYeadjYe = Matmul(epYE,adjYeYeadjYe) 
 epYUadjepYDYdadjYu = Matmul(epYU,adjepYDYdadjYu) 
 epYUadjepYUepYUadjepYU = Matmul(epYU,adjepYUepYUadjepYU) 
Forall(i2=1:3)  epYUadjepYUepYUadjepYU(i2,i2) =  Real(epYUadjepYUepYUadjepYU(i2,i2),dp) 
 epYUadjepYUepYUadjYu = Matmul(epYU,adjepYUepYUadjYu) 
 epYUadjepYUYuadjepYU = Matmul(epYU,adjepYUYuadjepYU) 
 epYUadjepYUYuadjYu = Matmul(epYU,adjepYUYuadjYu) 
 epYUadjYuepYUadjepYU = Matmul(epYU,adjYuepYUadjepYU) 
 epYUadjYuepYUadjYu = Matmul(epYU,adjYuepYUadjYu) 
 epYUadjYuYuadjepYU = Matmul(epYU,adjYuYuadjepYU) 
Forall(i2=1:3)  epYUadjYuYuadjepYU(i2,i2) =  Real(epYUadjYuYuadjepYU(i2,i2),dp) 
 epYUadjYuYuadjYu = Matmul(epYU,adjYuYuadjYu) 
 YdadjepYDYdadjepYD = Matmul(Yd,adjepYDYdadjepYD) 
 YdadjepYDYdadjYd = Matmul(Yd,adjepYDYdadjYd) 
 YdadjYdYdadjepYD = Matmul(Yd,adjYdYdadjepYD) 
 YdadjYdYdadjYd = Matmul(Yd,adjYdYdadjYd) 
Forall(i2=1:3)  YdadjYdYdadjYd(i2,i2) =  Real(YdadjYdYdadjYd(i2,i2),dp) 
 YdadjYuYuadjYd = Matmul(Yd,adjYuYuadjYd) 
Forall(i2=1:3)  YdadjYuYuadjYd(i2,i2) =  Real(YdadjYuYuadjYd(i2,i2),dp) 
 YeadjepYEYeadjepYE = Matmul(Ye,adjepYEYeadjepYE) 
 YeadjepYEYeadjYe = Matmul(Ye,adjepYEYeadjYe) 
 YeadjYeYeadjepYE = Matmul(Ye,adjYeYeadjepYE) 
 YeadjYeYeadjYe = Matmul(Ye,adjYeYeadjYe) 
Forall(i2=1:3)  YeadjYeYeadjYe(i2,i2) =  Real(YeadjYeYeadjYe(i2,i2),dp) 
 YuadjepYUYuadjepYU = Matmul(Yu,adjepYUYuadjepYU) 
 YuadjepYUYuadjYu = Matmul(Yu,adjepYUYuadjYu) 
 YuadjYuYuadjepYU = Matmul(Yu,adjYuYuadjepYU) 
 YuadjYuYuadjYu = Matmul(Yu,adjYuYuadjYu) 
Forall(i2=1:3)  YuadjYuYuadjYu(i2,i2) =  Real(YuadjYuYuadjYu(i2,i2),dp) 
 TrepYDadjepYD = Real(cTrace(epYDadjepYD),dp) 
 TrepYDadjYd = cTrace(epYDadjYd) 
 TrepYEadjepYE = Real(cTrace(epYEadjepYE),dp) 
 TrepYEadjYe = cTrace(epYEadjYe) 
 TrepYUadjepYU = Real(cTrace(epYUadjepYU),dp) 
 TrepYUadjYu = cTrace(epYUadjYu) 
 TrYdadjepYD = cTrace(YdadjepYD) 
 TrYdadjYd = Real(cTrace(YdadjYd),dp) 
 TrYeadjepYE = cTrace(YeadjepYE) 
 TrYeadjYe = Real(cTrace(YeadjYe),dp) 
 TrYuadjepYU = cTrace(YuadjepYU) 
 TrYuadjYu = Real(cTrace(YuadjYu),dp) 
 TrepYDadjepYDepYDadjepYD = Real(cTrace(epYDadjepYDepYDadjepYD),dp) 
 TrepYDadjepYDepYDadjYd = cTrace(epYDadjepYDepYDadjYd) 
 TrepYDadjepYDYdadjepYD = cTrace(epYDadjepYDYdadjepYD) 
 TrepYDadjepYDYdadjYd = cTrace(epYDadjepYDYdadjYd) 
 TrepYDadjepYUepYUadjepYD = Real(cTrace(epYDadjepYUepYUadjepYD),dp) 
 TrepYDadjepYUYuadjYd = cTrace(epYDadjepYUYuadjYd) 
 TrepYDadjYdepYDadjepYD = cTrace(epYDadjYdepYDadjepYD) 
 TrepYDadjYdepYDadjYd = cTrace(epYDadjYdepYDadjYd) 
 TrepYDadjYdYdadjepYD = Real(cTrace(epYDadjYdYdadjepYD),dp) 
 TrepYDadjYdYdadjYd = cTrace(epYDadjYdYdadjYd) 
 TrepYEadjepYEepYEadjepYE = Real(cTrace(epYEadjepYEepYEadjepYE),dp) 
 TrepYEadjepYEepYEadjYe = cTrace(epYEadjepYEepYEadjYe) 
 TrepYEadjepYEYeadjepYE = cTrace(epYEadjepYEYeadjepYE) 
 TrepYEadjepYEYeadjYe = cTrace(epYEadjepYEYeadjYe) 
 TrepYEadjYeepYEadjepYE = cTrace(epYEadjYeepYEadjepYE) 
 TrepYEadjYeepYEadjYe = cTrace(epYEadjYeepYEadjYe) 
 TrepYEadjYeYeadjepYE = Real(cTrace(epYEadjYeYeadjepYE),dp) 
 TrepYEadjYeYeadjYe = cTrace(epYEadjYeYeadjYe) 
 TrepYUadjepYDYdadjYu = cTrace(epYUadjepYDYdadjYu) 
 TrepYUadjepYUepYUadjepYU = Real(cTrace(epYUadjepYUepYUadjepYU),dp) 
 TrepYUadjepYUepYUadjYu = cTrace(epYUadjepYUepYUadjYu) 
 TrepYUadjepYUYuadjepYU = cTrace(epYUadjepYUYuadjepYU) 
 TrepYUadjepYUYuadjYu = cTrace(epYUadjepYUYuadjYu) 
 TrepYUadjYuepYUadjepYU = cTrace(epYUadjYuepYUadjepYU) 
 TrepYUadjYuepYUadjYu = cTrace(epYUadjYuepYUadjYu) 
 TrepYUadjYuYuadjepYU = Real(cTrace(epYUadjYuYuadjepYU),dp) 
 TrepYUadjYuYuadjYu = cTrace(epYUadjYuYuadjYu) 
 TrYdadjepYDYdadjepYD = cTrace(YdadjepYDYdadjepYD) 
 TrYdadjepYDYdadjYd = cTrace(YdadjepYDYdadjYd) 
 TrYdadjYdYdadjepYD = cTrace(YdadjYdYdadjepYD) 
 TrYdadjYdYdadjYd = Real(cTrace(YdadjYdYdadjYd),dp) 
 TrYdadjYuYuadjYd = Real(cTrace(YdadjYuYuadjYd),dp) 
 TrYeadjepYEYeadjepYE = cTrace(YeadjepYEYeadjepYE) 
 TrYeadjepYEYeadjYe = cTrace(YeadjepYEYeadjYe) 
 TrYeadjYeYeadjepYE = cTrace(YeadjYeYeadjepYE) 
 TrYeadjYeYeadjYe = Real(cTrace(YeadjYeYeadjYe),dp) 
 TrYuadjepYUYuadjepYU = cTrace(YuadjepYUYuadjepYU) 
 TrYuadjepYUYuadjYu = cTrace(YuadjepYUYuadjYu) 
 TrYuadjYuYuadjepYU = cTrace(YuadjYuYuadjepYU) 
 TrYuadjYuYuadjYu = Real(cTrace(YuadjYuYuadjYu),dp) 
 g1p2 =g1**2 
 g1p3 =g1**3 
 g1p4 =g1**4 
 g2p2 =g2**2 
 g2p3 =g2**3 
 g2p4 =g2**4 
 g3p2 =g3**2 
 g3p3 =g3**3 
 Lam1p2 =Lam1**2 
 Lam2p2 =Lam2**2 
 Lam3p2 =Lam3**2 
 Lam4p2 =Lam4**2 
 Lam5p2 =Lam5**2 
 Lam6p2 =Lam6**2 
 Lam7p2 =Lam7**2 


If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = 21._dp*(g1p3)/5._dp

 
 
If (TwoLoopRGE) Then 
betag12 = 0

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = -3._dp*(g2p3)

 
 
If (TwoLoopRGE) Then 
betag22 = 0

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = -7._dp*(g3p3)

 
 
If (TwoLoopRGE) Then 
betag32 = 0

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! Lam6 
!-------------------- 
 
betaLam61  = (-18*g1p2*Lam6 - 90*g2p2*Lam6 + 120*Lam1*Lam6 + 60*Lam3*Lam6 +           & 
&  80*Lam4*Lam6 + 100*Lam5*Lam6 + 60*Lam3*Lam7 + 40*Lam4*Lam7 + 20*Lam5*Lam7 +           & 
&  30*Lam6*TrepYDadjepYD + 15*(Lam1 + Lam3 + Lam4 + Lam5)*TrepYDadjYd - 60._dp*(TrepYDadjYdYdadjYd)& 
&  + 10*Lam6*TrepYEadjepYE + 5*Lam1*TrepYEadjYe + 5*Lam3*TrepYEadjYe + 5*Lam4*TrepYEadjYe +& 
&  5*Lam5*TrepYEadjYe - 20._dp*(TrepYEadjYeYeadjYe) + 90*Lam6*TrepYUadjepYU -            & 
&  30._dp*(TrepYUadjepYUepYUadjYu) - 60._dp*(TrepYUadjepYUYuadjepYU) + 15*Lam1*TrepYUadjYu +& 
&  15*Lam3*TrepYUadjYu + 15*Lam4*TrepYUadjYu + 15*Lam5*TrepYUadjYu - 30._dp*(TrepYUadjYuepYUadjepYU)& 
&  + 15*Lam1*TrYdadjepYD + 15*Lam3*TrYdadjepYD + 15*Lam4*TrYdadjepYD + 15*Lam5*TrYdadjepYD -& 
&  30._dp*(TrYdadjepYDYdadjYd) + 90*Lam6*TrYdadjYd - 30._dp*(TrYdadjYdYdadjepYD)         & 
&  + 5*Lam1*TrYeadjepYE + 5*Lam3*TrYeadjepYE + 5*Lam4*TrYeadjepYE + 5*Lam5*TrYeadjepYE - & 
&  10._dp*(TrYeadjepYEYeadjYe) + 30*Lam6*TrYeadjYe - 10._dp*(TrYeadjYeYeadjepYE)         & 
&  + 15*Lam1*TrYuadjepYU + 15*Lam3*TrYuadjepYU + 15*Lam4*TrYuadjepYU + 15*Lam5*TrYuadjepYU +& 
&  30*Lam6*TrYuadjYu)/10._dp

 
 
If (TwoLoopRGE) Then 
betaLam62 = 0

 
DLam6 = oo16pi2*( betaLam61 + oo16pi2 * betaLam62 ) 

 
Else 
DLam6 = oo16pi2* betaLam61 
End If 
 
 
Call Chop(DLam6) 

!-------------------- 
! Lam5 
!-------------------- 
 
betaLam51  = 10._dp*(Lam6p2) + 10._dp*(Lam7p2) - (9*g1p2*Lam5)/5._dp - 9*g2p2*Lam5 +  & 
&  2*Lam1*Lam5 + 2*Lam2*Lam5 + 8*Lam3*Lam5 + 12*Lam4*Lam5 + 4*Lam6*Lam7 + 6*Lam5*TrepYDadjepYD +& 
&  3*(Lam6 + Lam7)*TrepYDadjYd - 6._dp*(TrepYDadjYdepYDadjYd) + 2*Lam5*TrepYEadjepYE +   & 
&  Lam6*TrepYEadjYe + Lam7*TrepYEadjYe - 2._dp*(TrepYEadjYeepYEadjYe) + 6*Lam5*TrepYUadjepYU +& 
&  3*Lam6*TrepYUadjYu + 3*Lam7*TrepYUadjYu - 6._dp*(TrepYUadjYuepYUadjYu) +              & 
&  3*Lam6*TrYdadjepYD + 3*Lam7*TrYdadjepYD - 6._dp*(TrYdadjepYDYdadjepYD) +              & 
&  6*Lam5*TrYdadjYd + Lam6*TrYeadjepYE + Lam7*TrYeadjepYE - 2._dp*(TrYeadjepYEYeadjepYE) & 
&  + 2*Lam5*TrYeadjYe + 3*Lam6*TrYuadjepYU + 3*Lam7*TrYuadjepYU - 6._dp*(TrYuadjepYUYuadjepYU)& 
&  + 6*Lam5*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betaLam52 = 0

 
DLam5 = oo16pi2*( betaLam51 + oo16pi2 * betaLam52 ) 

 
Else 
DLam5 = oo16pi2* betaLam51 
End If 
 
 
Call Chop(DLam5) 

!-------------------- 
! Lam7 
!-------------------- 
 
betaLam71  = (60*Lam3*Lam6 + 40*Lam4*Lam6 + 20*Lam5*Lam6 - 18*g1p2*Lam7 -             & 
&  90*g2p2*Lam7 + 120*Lam2*Lam7 + 60*Lam3*Lam7 + 80*Lam4*Lam7 + 100*Lam5*Lam7 +          & 
&  90*Lam7*TrepYDadjepYD - 30._dp*(TrepYDadjepYDepYDadjYd) - 60._dp*(TrepYDadjepYDYdadjepYD)& 
&  + 15*(Lam2 + Lam3 + Lam4 + Lam5)*TrepYDadjYd - 30._dp*(TrepYDadjYdepYDadjepYD)        & 
&  + 30*Lam7*TrepYEadjepYE - 10._dp*(TrepYEadjepYEepYEadjYe) - 20._dp*(TrepYEadjepYEYeadjepYE)& 
&  + 5*Lam2*TrepYEadjYe + 5*Lam3*TrepYEadjYe + 5*Lam4*TrepYEadjYe + 5*Lam5*TrepYEadjYe - & 
&  10._dp*(TrepYEadjYeepYEadjepYE) + 30*Lam7*TrepYUadjepYU + 15*Lam2*TrepYUadjYu +       & 
&  15*Lam3*TrepYUadjYu + 15*Lam4*TrepYUadjYu + 15*Lam5*TrepYUadjYu - 60._dp*(TrepYUadjYuYuadjYu)& 
&  + 15*Lam2*TrYdadjepYD + 15*Lam3*TrYdadjepYD + 15*Lam4*TrYdadjepYD + 15*Lam5*TrYdadjepYD +& 
&  30*Lam7*TrYdadjYd + 5*Lam2*TrYeadjepYE + 5*Lam3*TrYeadjepYE + 5*Lam4*TrYeadjepYE +    & 
&  5*Lam5*TrYeadjepYE + 10*Lam7*TrYeadjYe + 15*Lam2*TrYuadjepYU + 15*Lam3*TrYuadjepYU +  & 
&  15*Lam4*TrYuadjepYU + 15*Lam5*TrYuadjepYU - 30._dp*(TrYuadjepYUYuadjYu)               & 
&  + 90*Lam7*TrYuadjYu - 30._dp*(TrYuadjYuYuadjepYU))/10._dp

 
 
If (TwoLoopRGE) Then 
betaLam72 = 0

 
DLam7 = oo16pi2*( betaLam71 + oo16pi2 * betaLam72 ) 

 
Else 
DLam7 = oo16pi2* betaLam71 
End If 
 
 
Call Chop(DLam7) 

!-------------------- 
! Lam1 
!-------------------- 
 
betaLam11  = 27._dp*(g1p4)/100._dp + (9*g1p2*g2p2)/10._dp + 9._dp*(g2p4)              & 
& /4._dp + 12._dp*(Lam1p2) + 4._dp*(Lam3p2) + 2._dp*(Lam4p2) + 2._dp*(Lam5p2)            & 
&  + 24._dp*(Lam6p2) - (9*g1p2*Lam1)/5._dp - 9*g2p2*Lam1 + 4*Lam3*Lam4 + 6*Lam6*TrepYDadjYd +& 
&  2*Lam6*TrepYEadjYe + 12*Lam1*TrepYUadjepYU - 12._dp*(TrepYUadjepYUepYUadjepYU)        & 
&  + 6*Lam6*TrepYUadjYu + 6*Lam6*TrYdadjepYD + 12*Lam1*TrYdadjYd - 12._dp*(TrYdadjYdYdadjYd)& 
&  + 2*Lam6*TrYeadjepYE + 4*Lam1*TrYeadjYe - 4._dp*(TrYeadjYeYeadjYe) + 6*Lam6*TrYuadjepYU

 
 
If (TwoLoopRGE) Then 
betaLam12 = 0

 
DLam1 = oo16pi2*( betaLam11 + oo16pi2 * betaLam12 ) 

 
Else 
DLam1 = oo16pi2* betaLam11 
End If 
 
 
Call Chop(DLam1) 

!-------------------- 
! Lam4 
!-------------------- 
 
betaLam41  = (9*g1p2*g2p2)/5._dp + 4._dp*(Lam4p2) + 8._dp*(Lam5p2) + 10._dp*(Lam6p2)  & 
&  + 10._dp*(Lam7p2) - (9*g1p2*Lam4)/5._dp - 9*g2p2*Lam4 + 2*Lam1*Lam4 + 2*Lam2*Lam4 +   & 
&  8*Lam3*Lam4 + 4*Lam6*Lam7 + 6*Lam4*TrepYDadjepYD + 12._dp*(TrepYDadjepYUepYUadjepYD)  & 
&  - 12._dp*(TrepYDadjepYUYuadjYd) + 3*(Lam6 + Lam7)*TrepYDadjYd - 12._dp*(TrepYDadjYdYdadjepYD)& 
&  + 2*Lam4*TrepYEadjepYE + Lam6*TrepYEadjYe + Lam7*TrepYEadjYe - 4._dp*(TrepYEadjYeYeadjepYE)& 
&  - 12._dp*(TrepYUadjepYDYdadjYu) + 6*Lam4*TrepYUadjepYU + 3*Lam6*TrepYUadjYu +         & 
&  3*Lam7*TrepYUadjYu - 12._dp*(TrepYUadjYuYuadjepYU) + 3*Lam6*TrYdadjepYD +             & 
&  3*Lam7*TrYdadjepYD + 6*Lam4*TrYdadjYd + 12._dp*(TrYdadjYuYuadjYd) + Lam6*TrYeadjepYE +& 
&  Lam7*TrYeadjepYE + 2*Lam4*TrYeadjYe + 3*Lam6*TrYuadjepYU + 3*Lam7*TrYuadjepYU +       & 
&  6*Lam4*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betaLam42 = 0

 
DLam4 = oo16pi2*( betaLam41 + oo16pi2 * betaLam42 ) 

 
Else 
DLam4 = oo16pi2* betaLam41 
End If 
 
 
Call Chop(DLam4) 

!-------------------- 
! Lam3 
!-------------------- 
 
betaLam31  = 27._dp*(g1p4)/100._dp - (9*g1p2*g2p2)/10._dp + 9._dp*(g2p4)              & 
& /4._dp + 4._dp*(Lam3p2) + 2._dp*(Lam4p2) + 2._dp*(Lam5p2) + 4._dp*(Lam6p2)             & 
&  + 4._dp*(Lam7p2) - (9*g1p2*Lam3)/5._dp - 9*g2p2*Lam3 + 6*Lam1*Lam3 + 6*Lam2*Lam3 +    & 
&  2*Lam1*Lam4 + 2*Lam2*Lam4 + 16*Lam6*Lam7 + 6*Lam3*TrepYDadjepYD - 12._dp*(TrepYDadjepYDYdadjYd)& 
&  - 12._dp*(TrepYDadjepYUepYUadjepYD) + 12._dp*(TrepYDadjepYUYuadjYd) + 3*(Lam6 +       & 
&  Lam7)*TrepYDadjYd + 2*Lam3*TrepYEadjepYE - 4._dp*(TrepYEadjepYEYeadjYe)               & 
&  + Lam6*TrepYEadjYe + Lam7*TrepYEadjYe + 12._dp*(TrepYUadjepYDYdadjYu) +               & 
&  6*Lam3*TrepYUadjepYU - 12._dp*(TrepYUadjepYUYuadjYu) + 3*Lam6*TrepYUadjYu +           & 
&  3*Lam7*TrepYUadjYu + 3*Lam6*TrYdadjepYD + 3*Lam7*TrYdadjepYD + 6*Lam3*TrYdadjYd -     & 
&  12._dp*(TrYdadjYuYuadjYd) + Lam6*TrYeadjepYE + Lam7*TrYeadjepYE + 2*Lam3*TrYeadjYe +  & 
&  3*Lam6*TrYuadjepYU + 3*Lam7*TrYuadjepYU + 6*Lam3*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betaLam32 = 0

 
DLam3 = oo16pi2*( betaLam31 + oo16pi2 * betaLam32 ) 

 
Else 
DLam3 = oo16pi2* betaLam31 
End If 
 
 
Call Chop(DLam3) 

!-------------------- 
! Lam2 
!-------------------- 
 
betaLam21  = 27._dp*(g1p4)/100._dp + (9*g1p2*g2p2)/10._dp + 9._dp*(g2p4)              & 
& /4._dp + 12._dp*(Lam2p2) + 4._dp*(Lam3p2) + 2._dp*(Lam4p2) + 2._dp*(Lam5p2)            & 
&  + 24._dp*(Lam7p2) - (9*g1p2*Lam2)/5._dp - 9*g2p2*Lam2 + 4*Lam3*Lam4 + 12*Lam2*TrepYDadjepYD -& 
&  12._dp*(TrepYDadjepYDepYDadjepYD) + 6*Lam7*TrepYDadjYd + 4*Lam2*TrepYEadjepYE -       & 
&  4._dp*(TrepYEadjepYEepYEadjepYE) + 2*Lam7*TrepYEadjYe + 6*Lam7*TrepYUadjYu +          & 
&  6*Lam7*TrYdadjepYD + 2*Lam7*TrYeadjepYE + 6*Lam7*TrYuadjepYU + 12*Lam2*TrYuadjYu -    & 
&  12._dp*(TrYuadjYuYuadjYu)

 
 
If (TwoLoopRGE) Then 
betaLam22 = 0

 
DLam2 = oo16pi2*( betaLam21 + oo16pi2 * betaLam22 ) 

 
Else 
DLam2 = oo16pi2* betaLam21 
End If 
 
 
Call Chop(DLam2) 

!-------------------- 
! epYU 
!-------------------- 
 
betaepYU1  = epYU*(-17._dp*(g1p2)/20._dp - 9._dp*(g2p2)/4._dp - 8._dp*(g3p2)          & 
&  + 3._dp*(TrepYUadjepYU) + 3._dp*(TrYdadjYd) + TrYeadjYe) + (epYUadjepYDepYD +         & 
&  3._dp*(epYUadjepYUepYU) - 3._dp*(epYUadjYdYd) + epYUadjYuYu + 6*TrepYDadjYd*Yu +      & 
&  2*TrepYEadjYe*Yu + 6*TrepYUadjYu*Yu - 4._dp*(YuadjYdepYD) + 2._dp*(YuadjYuepYU))/2._dp

 
 
If (TwoLoopRGE) Then 
betaepYU2 = 0

 
DepYU = oo16pi2*( betaepYU1 + oo16pi2 * betaepYU2 ) 

 
Else 
DepYU = oo16pi2* betaepYU1 
End If 
 
 
Call Chop(DepYU) 

!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = epYU*(3._dp*(TrYdadjepYD) + TrYeadjepYE + 3._dp*(TrYuadjepYU))             & 
&  + (-17._dp*(g1p2)/20._dp - 9._dp*(g2p2)/4._dp - 8._dp*(g3p2) + 3._dp*(TrepYDadjepYD)  & 
&  + TrepYEadjepYE + 3._dp*(TrYuadjYu))*Yu + (-4._dp*(epYUadjepYDYd) + 2._dp*(epYUadjepYUYu)& 
&  - 3._dp*(YuadjepYDepYD) + YuadjepYUepYU + YuadjYdYd + 3._dp*(YuadjYuYu))/2._dp

 
 
If (TwoLoopRGE) Then 
betaYu2 = 0

 
DYu = oo16pi2*( betaYu1 + oo16pi2 * betaYu2 ) 

 
Else 
DYu = oo16pi2* betaYu1 
End If 
 
 
Call Chop(DYu) 

!-------------------- 
! Yd 
!-------------------- 
 
betaYd1  = epYD*(3._dp*(TrYdadjepYD) + TrYeadjepYE + 3._dp*(TrYuadjepYU))             & 
&  + (-((g1p2 + 9._dp*(g2p2) + 32._dp*(g3p2) - 12._dp*(TrepYUadjepYU) - 12._dp*(TrYdadjYd)& 
&  - 4._dp*(TrYeadjYe))*Yd) + 2*(2._dp*(epYDadjepYDYd) - 4._dp*(epYDadjepYUYu)           & 
&  + YdadjepYDepYD - 3._dp*(YdadjepYUepYU) + 3._dp*(YdadjYdYd) + YdadjYuYu))/4._dp

 
 
If (TwoLoopRGE) Then 
betaYd2 = 0

 
DYd = oo16pi2*( betaYd1 + oo16pi2 * betaYd2 ) 

 
Else 
DYd = oo16pi2* betaYd1 
End If 
 
 
Call Chop(DYd) 

!-------------------- 
! Ye 
!-------------------- 
 
betaYe1  = epYE*(3._dp*(TrYdadjepYD) + TrYeadjepYE + 3._dp*(TrYuadjepYU))             & 
&  + (-9._dp*(g1p2)/4._dp - 9._dp*(g2p2)/4._dp + 3._dp*(TrepYUadjepYU) + 3._dp*(TrYdadjYd)& 
&  + TrYeadjYe)*Ye + (2._dp*(epYEadjepYEYe) + YeadjepYEepYE + 3._dp*(YeadjYeYe))/2._dp

 
 
If (TwoLoopRGE) Then 
betaYe2 = 0

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! epYD 
!-------------------- 
 
betaepYD1  = epYD*(-1._dp*(g1p2)/4._dp - 9._dp*(g2p2)/4._dp - 8._dp*(g3p2)            & 
&  + 3._dp*(TrepYDadjepYD) + TrepYEadjepYE + 3._dp*(TrYuadjYu)) + (3._dp*(epYDadjepYDepYD)& 
&  + epYDadjepYUepYU + epYDadjYdYd - 3._dp*(epYDadjYuYu) + 6*TrepYDadjYd*Yd +            & 
&  2*TrepYEadjYe*Yd + 6*TrepYUadjYu*Yd + 2._dp*(YdadjYdepYD) - 4._dp*(YdadjYuepYU))/2._dp

 
 
If (TwoLoopRGE) Then 
betaepYD2 = 0

 
DepYD = oo16pi2*( betaepYD1 + oo16pi2 * betaepYD2 ) 

 
Else 
DepYD = oo16pi2* betaepYD1 
End If 
 
 
Call Chop(DepYD) 

!-------------------- 
! epYE 
!-------------------- 
 
betaepYE1  = 3._dp*(epYEadjepYEepYE)/2._dp + epYEadjYeYe/2._dp + epYE*(-              & 
& 9._dp*(g1p2)/4._dp - 9._dp*(g2p2)/4._dp + 3._dp*(TrepYDadjepYD) + TrepYEadjepYE +      & 
&  3._dp*(TrYuadjYu)) + 3*TrepYDadjYd*Ye + TrepYEadjYe*Ye + 3*TrepYUadjYu*Ye +           & 
&  YeadjYeepYE

 
 
If (TwoLoopRGE) Then 
betaepYE2 = 0

 
DepYE = oo16pi2*( betaepYE1 + oo16pi2 * betaepYE2 ) 

 
Else 
DepYE = oo16pi2* betaepYE1 
End If 
 
 
Call Chop(DepYE) 

!-------------------- 
! M12 
!-------------------- 
 
betaM121  = -6*Lam6*M112 - (9*g1p2*M12)/10._dp - (9*g2p2*M12)/2._dp + 2*Lam3*M12 +    & 
&  4*Lam4*M12 + 6*Lam5*M12 - 6*Lam7*M222 + 3*M12*TrepYDadjepYD - 3*M112*TrepYDadjYd +    & 
&  M12*TrepYEadjepYE - M112*TrepYEadjYe + 3*M12*TrepYUadjepYU - 3*M222*TrepYUadjYu -     & 
&  3*M222*TrYdadjepYD + 3*M12*TrYdadjYd - M222*TrYeadjepYE + M12*TrYeadjYe -             & 
&  3*M112*TrYuadjepYU + 3*M12*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betaM122 = 0

 
DM12 = oo16pi2*( betaM121 + oo16pi2 * betaM122 ) 

 
Else 
DM12 = oo16pi2* betaM121 
End If 
 
 
Call Chop(DM12) 

!-------------------- 
! M112 
!-------------------- 
 
betaM1121  = (-9*g1p2*M112)/10._dp - (9*g2p2*M112)/2._dp + 6*Lam1*M112 -              & 
&  12*Lam6*M12 + 4*Lam3*M222 + 2*Lam4*M222 + 6*M112*TrepYUadjepYU - 6*M12*TrepYUadjYu -  & 
&  6*M12*TrYdadjepYD + 6*M112*TrYdadjYd - 2*M12*TrYeadjepYE + 2*M112*TrYeadjYe

 
 
If (TwoLoopRGE) Then 
betaM1122 = 0

 
DM112 = oo16pi2*( betaM1121 + oo16pi2 * betaM1122 ) 

 
Else 
DM112 = oo16pi2* betaM1121 
End If 
 
 
Call Chop(DM112) 

!-------------------- 
! M222 
!-------------------- 
 
betaM2221  = 4*Lam3*M112 + 2*Lam4*M112 - 12*Lam7*M12 - (9*g1p2*M222)/10._dp -         & 
&  (9*g2p2*M222)/2._dp + 6*Lam2*M222 + 6*M222*TrepYDadjepYD - 6*M12*TrepYDadjYd +        & 
&  2*M222*TrepYEadjepYE - 2*M12*TrepYEadjYe - 6*M12*TrYuadjepYU + 6*M222*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betaM2222 = 0

 
DM222 = oo16pi2*( betaM2221 + oo16pi2 * betaM2222 ) 

 
Else 
DM222 = oo16pi2* betaM2221 
End If 
 
 
Call Chop(DM222) 

Call ParametersToG131(Dg1,Dg2,Dg3,DLam6,DLam5,DLam7,DLam1,DLam4,DLam3,DLam2,          & 
& DepYU,DYu,DYd,DYe,DepYD,DepYE,DM12,DM112,DM222,f)

Iname = Iname - 1 
 
End Subroutine rge131  

Subroutine GToParameters133(g,g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,            & 
& epYU,Yu,Yd,Ye,epYD,epYE,M12,M112,M222,v,v2)

Implicit None 
Real(dp), Intent(in) :: g(133) 
Real(dp),Intent(out) :: g1,g2,g3,v,v2

Complex(dp),Intent(out) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU(3,3),Yu(3,3),Yd(3,3),Ye(3,3),epYD(3,3),       & 
& epYE(3,3),M12,M112,M222

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters133' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
Lam6= Cmplx(g(4),g(5),dp) 
Lam5= Cmplx(g(6),g(7),dp) 
Lam7= Cmplx(g(8),g(9),dp) 
Lam1= Cmplx(g(10),g(11),dp) 
Lam4= Cmplx(g(12),g(13),dp) 
Lam3= Cmplx(g(14),g(15),dp) 
Lam2= Cmplx(g(16),g(17),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
epYU(i1,i2) = Cmplx( g(SumI+18), g(SumI+19), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+36), g(SumI+37), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+54), g(SumI+55), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+72), g(SumI+73), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
epYD(i1,i2) = Cmplx( g(SumI+90), g(SumI+91), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
epYE(i1,i2) = Cmplx( g(SumI+108), g(SumI+109), dp) 
End Do 
 End Do 
 
M12= Cmplx(g(126),g(127),dp) 
M112= Cmplx(g(128),g(129),dp) 
M222= Cmplx(g(130),g(131),dp) 
v= g(132) 
v2= g(133) 
Do i1=1,133 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters133

Subroutine ParametersToG133(g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,              & 
& epYU,Yu,Yd,Ye,epYD,epYE,M12,M112,M222,v,v2,g)

Implicit None 
Real(dp), Intent(out) :: g(133) 
Real(dp), Intent(in) :: g1,g2,g3,v,v2

Complex(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU(3,3),Yu(3,3),Yd(3,3),Ye(3,3),epYD(3,3),       & 
& epYE(3,3),M12,M112,M222

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG133' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = Real(Lam6,dp)  
g(5) = Aimag(Lam6)  
g(6) = Real(Lam5,dp)  
g(7) = Aimag(Lam5)  
g(8) = Real(Lam7,dp)  
g(9) = Aimag(Lam7)  
g(10) = Real(Lam1,dp)  
g(11) = Aimag(Lam1)  
g(12) = Real(Lam4,dp)  
g(13) = Aimag(Lam4)  
g(14) = Real(Lam3,dp)  
g(15) = Aimag(Lam3)  
g(16) = Real(Lam2,dp)  
g(17) = Aimag(Lam2)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+18) = Real(epYU(i1,i2), dp) 
g(SumI+19) = Aimag(epYU(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+36) = Real(Yu(i1,i2), dp) 
g(SumI+37) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+54) = Real(Yd(i1,i2), dp) 
g(SumI+55) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+72) = Real(Ye(i1,i2), dp) 
g(SumI+73) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+90) = Real(epYD(i1,i2), dp) 
g(SumI+91) = Aimag(epYD(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+108) = Real(epYE(i1,i2), dp) 
g(SumI+109) = Aimag(epYE(i1,i2)) 
End Do 
End Do 

g(126) = Real(M12,dp)  
g(127) = Aimag(M12)  
g(128) = Real(M112,dp)  
g(129) = Aimag(M112)  
g(130) = Real(M222,dp)  
g(131) = Aimag(M222)  
g(132) = v  
g(133) = v2  
Iname = Iname - 1 
 
End Subroutine ParametersToG133

Subroutine rge133(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,v,betav1,betav2,Dv,v2,betav21,betav22,Dv2
Complex(dp) :: Lam6,betaLam61,betaLam62,DLam6,Lam5,betaLam51,betaLam52,               & 
& DLam5,Lam7,betaLam71,betaLam72,DLam7,Lam1,betaLam11,betaLam12,DLam1,Lam4,              & 
& betaLam41,betaLam42,DLam4,Lam3,betaLam31,betaLam32,DLam3,Lam2,betaLam21,               & 
& betaLam22,DLam2,epYU(3,3),betaepYU1(3,3),betaepYU2(3,3),DepYU(3,3),adjepYU(3,3)        & 
& ,Yu(3,3),betaYu1(3,3),betaYu2(3,3),DYu(3,3),adjYu(3,3),Yd(3,3),betaYd1(3,3)            & 
& ,betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3),betaYe1(3,3),betaYe2(3,3),DYe(3,3)           & 
& ,adjYe(3,3),epYD(3,3),betaepYD1(3,3),betaepYD2(3,3),DepYD(3,3),adjepYD(3,3)            & 
& ,epYE(3,3),betaepYE1(3,3),betaepYE2(3,3),DepYE(3,3),adjepYE(3,3),M12,betaM121,         & 
& betaM122,DM12,M112,betaM1121,betaM1122,DM112,M222,betaM2221,betaM2222,DM222
Complex(dp) :: epYDadjepYD(3,3),epYDadjYd(3,3),epYEadjepYE(3,3),epYEadjYe(3,3),epYUadjepYD(3,3),     & 
& epYUadjepYU(3,3),epYUadjYu(3,3),YdadjepYD(3,3),YdadjYd(3,3),YdadjYu(3,3),              & 
& YeadjepYE(3,3),YeadjYe(3,3),YuadjepYU(3,3),YuadjYd(3,3),YuadjYu(3,3),adjepYDepYD(3,3), & 
& adjepYDYd(3,3),adjepYEepYE(3,3),adjepYEYe(3,3),adjepYUepYU(3,3),adjepYUYu(3,3),        & 
& adjYdepYD(3,3),adjYdYd(3,3),adjYeepYE(3,3),adjYeYe(3,3),adjYuepYU(3,3),adjYuYu(3,3),   & 
& epYDadjepYDepYD(3,3),epYDadjepYDYd(3,3),epYDadjepYUepYU(3,3),epYDadjepYUYu(3,3),       & 
& epYDadjYdYd(3,3),epYDadjYuYu(3,3),epYEadjepYEepYE(3,3),epYEadjepYEYe(3,3),             & 
& epYEadjYeYe(3,3),epYUadjepYDepYD(3,3),epYUadjepYDYd(3,3),epYUadjepYUepYU(3,3),         & 
& epYUadjepYUYu(3,3),epYUadjYdYd(3,3),epYUadjYuYu(3,3),YdadjepYDepYD(3,3),               & 
& YdadjepYUepYU(3,3),YdadjYdepYD(3,3),YdadjYdYd(3,3),YdadjYuepYU(3,3),YdadjYuYu(3,3),    & 
& YeadjepYEepYE(3,3),YeadjYeepYE(3,3),YeadjYeYe(3,3),YuadjepYDepYD(3,3),YuadjepYUepYU(3,3),& 
& YuadjYdepYD(3,3),YuadjYdYd(3,3),YuadjYuepYU(3,3),YuadjYuYu(3,3),adjepYDepYDadjepYD(3,3),& 
& adjepYDepYDadjYd(3,3),adjepYDYdadjepYD(3,3),adjepYDYdadjYd(3,3),adjepYDYdadjYu(3,3),   & 
& adjepYEepYEadjepYE(3,3),adjepYEepYEadjYe(3,3),adjepYEYeadjepYE(3,3),adjepYEYeadjYe(3,3),& 
& adjepYUepYUadjepYD(3,3),adjepYUepYUadjepYU(3,3),adjepYUepYUadjYu(3,3),adjepYUYuadjepYU(3,3),& 
& adjepYUYuadjYd(3,3),adjepYUYuadjYu(3,3),adjYdepYDadjepYD(3,3),adjYdepYDadjYd(3,3),     & 
& adjYdYdadjepYD(3,3),adjYdYdadjYd(3,3),adjYeepYEadjepYE(3,3),adjYeepYEadjYe(3,3),       & 
& adjYeYeadjepYE(3,3),adjYeYeadjYe(3,3),adjYuepYUadjepYU(3,3),adjYuepYUadjYu(3,3),       & 
& adjYuYuadjepYU(3,3),adjYuYuadjYd(3,3),adjYuYuadjYu(3,3),epYDadjepYDepYDadjepYD(3,3),   & 
& epYDadjepYDepYDadjYd(3,3),epYDadjepYDYdadjepYD(3,3),epYDadjepYDYdadjYd(3,3),           & 
& epYDadjepYUepYUadjepYD(3,3),epYDadjepYUYuadjYd(3,3),epYDadjYdepYDadjepYD(3,3),         & 
& epYDadjYdepYDadjYd(3,3),epYDadjYdYdadjepYD(3,3),epYDadjYdYdadjYd(3,3),epYEadjepYEepYEadjepYE(3,3),& 
& epYEadjepYEepYEadjYe(3,3),epYEadjepYEYeadjepYE(3,3),epYEadjepYEYeadjYe(3,3),           & 
& epYEadjYeepYEadjepYE(3,3),epYEadjYeepYEadjYe(3,3),epYEadjYeYeadjepYE(3,3),             & 
& epYEadjYeYeadjYe(3,3),epYUadjepYDYdadjYu(3,3),epYUadjepYUepYUadjepYU(3,3),             & 
& epYUadjepYUepYUadjYu(3,3),epYUadjepYUYuadjepYU(3,3),epYUadjepYUYuadjYu(3,3),           & 
& epYUadjYuepYUadjepYU(3,3),epYUadjYuepYUadjYu(3,3),epYUadjYuYuadjepYU(3,3),             & 
& epYUadjYuYuadjYu(3,3),YdadjepYDYdadjepYD(3,3),YdadjepYDYdadjYd(3,3),YdadjYdYdadjepYD(3,3),& 
& YdadjYdYdadjYd(3,3),YdadjYuYuadjYd(3,3),YeadjepYEYeadjepYE(3,3),YeadjepYEYeadjYe(3,3), & 
& YeadjYeYeadjepYE(3,3),YeadjYeYeadjYe(3,3),YuadjepYUYuadjepYU(3,3),YuadjepYUYuadjYu(3,3),& 
& YuadjYuYuadjepYU(3,3),YuadjYuYuadjYu(3,3)

Complex(dp) :: TrepYDadjepYD,TrepYDadjYd,TrepYEadjepYE,TrepYEadjYe,TrepYUadjepYU,TrepYUadjYu,        & 
& TrYdadjepYD,TrYdadjYd,TrYeadjepYE,TrYeadjYe,TrYuadjepYU,TrYuadjYu,TrepYDadjepYDepYDadjepYD,& 
& TrepYDadjepYDepYDadjYd,TrepYDadjepYDYdadjepYD,TrepYDadjepYDYdadjYd,TrepYDadjepYUepYUadjepYD,& 
& TrepYDadjepYUYuadjYd,TrepYDadjYdepYDadjepYD,TrepYDadjYdepYDadjYd,TrepYDadjYdYdadjepYD, & 
& TrepYDadjYdYdadjYd,TrepYEadjepYEepYEadjepYE,TrepYEadjepYEepYEadjYe,TrepYEadjepYEYeadjepYE,& 
& TrepYEadjepYEYeadjYe,TrepYEadjYeepYEadjepYE,TrepYEadjYeepYEadjYe,TrepYEadjYeYeadjepYE, & 
& TrepYEadjYeYeadjYe,TrepYUadjepYDYdadjYu,TrepYUadjepYUepYUadjepYU,TrepYUadjepYUepYUadjYu,& 
& TrepYUadjepYUYuadjepYU,TrepYUadjepYUYuadjYu,TrepYUadjYuepYUadjepYU,TrepYUadjYuepYUadjYu,& 
& TrepYUadjYuYuadjepYU,TrepYUadjYuYuadjYu,TrYdadjepYDYdadjepYD,TrYdadjepYDYdadjYd,       & 
& TrYdadjYdYdadjepYD,TrYdadjYdYdadjYd,TrYdadjYuYuadjYd,TrYeadjepYEYeadjepYE,             & 
& TrYeadjepYEYeadjYe,TrYeadjYeYeadjepYE,TrYeadjYeYeadjYe,TrYuadjepYUYuadjepYU,           & 
& TrYuadjepYUYuadjYu,TrYuadjYuYuadjepYU,TrYuadjYuYuadjYu

Real(dp) :: g1p2,g1p3,g1p4,g2p2,g2p3,g2p4,g3p2,g3p3

Complex(dp) :: Lam1p2,Lam2p2,Lam3p2,Lam4p2,Lam5p2,Lam6p2,Lam7p2

Iname = Iname +1 
NameOfUnit(Iname) = 'rge133' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters133(gy,g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU,            & 
& Yu,Yd,Ye,epYD,epYE,M12,M112,M222,v,v2)

Call Adjungate(epYU,adjepYU)
Call Adjungate(Yu,adjYu)
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)
Call Adjungate(epYD,adjepYD)
Call Adjungate(epYE,adjepYE)
 epYDadjepYD = Matmul(epYD,adjepYD) 
Forall(i2=1:3)  epYDadjepYD(i2,i2) =  Real(epYDadjepYD(i2,i2),dp) 
 epYDadjYd = Matmul(epYD,adjYd) 
 epYEadjepYE = Matmul(epYE,adjepYE) 
Forall(i2=1:3)  epYEadjepYE(i2,i2) =  Real(epYEadjepYE(i2,i2),dp) 
 epYEadjYe = Matmul(epYE,adjYe) 
 epYUadjepYD = Matmul(epYU,adjepYD) 
 epYUadjepYU = Matmul(epYU,adjepYU) 
Forall(i2=1:3)  epYUadjepYU(i2,i2) =  Real(epYUadjepYU(i2,i2),dp) 
 epYUadjYu = Matmul(epYU,adjYu) 
 YdadjepYD = Matmul(Yd,adjepYD) 
 YdadjYd = Matmul(Yd,adjYd) 
Forall(i2=1:3)  YdadjYd(i2,i2) =  Real(YdadjYd(i2,i2),dp) 
 YdadjYu = Matmul(Yd,adjYu) 
 YeadjepYE = Matmul(Ye,adjepYE) 
 YeadjYe = Matmul(Ye,adjYe) 
Forall(i2=1:3)  YeadjYe(i2,i2) =  Real(YeadjYe(i2,i2),dp) 
 YuadjepYU = Matmul(Yu,adjepYU) 
 YuadjYd = Matmul(Yu,adjYd) 
 YuadjYu = Matmul(Yu,adjYu) 
Forall(i2=1:3)  YuadjYu(i2,i2) =  Real(YuadjYu(i2,i2),dp) 
 adjepYDepYD = Matmul(adjepYD,epYD) 
Forall(i2=1:3)  adjepYDepYD(i2,i2) =  Real(adjepYDepYD(i2,i2),dp) 
 adjepYDYd = Matmul(adjepYD,Yd) 
 adjepYEepYE = Matmul(adjepYE,epYE) 
Forall(i2=1:3)  adjepYEepYE(i2,i2) =  Real(adjepYEepYE(i2,i2),dp) 
 adjepYEYe = Matmul(adjepYE,Ye) 
 adjepYUepYU = Matmul(adjepYU,epYU) 
Forall(i2=1:3)  adjepYUepYU(i2,i2) =  Real(adjepYUepYU(i2,i2),dp) 
 adjepYUYu = Matmul(adjepYU,Yu) 
 adjYdepYD = Matmul(adjYd,epYD) 
 adjYdYd = Matmul(adjYd,Yd) 
Forall(i2=1:3)  adjYdYd(i2,i2) =  Real(adjYdYd(i2,i2),dp) 
 adjYeepYE = Matmul(adjYe,epYE) 
 adjYeYe = Matmul(adjYe,Ye) 
Forall(i2=1:3)  adjYeYe(i2,i2) =  Real(adjYeYe(i2,i2),dp) 
 adjYuepYU = Matmul(adjYu,epYU) 
 adjYuYu = Matmul(adjYu,Yu) 
Forall(i2=1:3)  adjYuYu(i2,i2) =  Real(adjYuYu(i2,i2),dp) 
 epYDadjepYDepYD = Matmul(epYD,adjepYDepYD) 
 epYDadjepYDYd = Matmul(epYD,adjepYDYd) 
 epYDadjepYUepYU = Matmul(epYD,adjepYUepYU) 
 epYDadjepYUYu = Matmul(epYD,adjepYUYu) 
 epYDadjYdYd = Matmul(epYD,adjYdYd) 
 epYDadjYuYu = Matmul(epYD,adjYuYu) 
 epYEadjepYEepYE = Matmul(epYE,adjepYEepYE) 
 epYEadjepYEYe = Matmul(epYE,adjepYEYe) 
 epYEadjYeYe = Matmul(epYE,adjYeYe) 
 epYUadjepYDepYD = Matmul(epYU,adjepYDepYD) 
 epYUadjepYDYd = Matmul(epYU,adjepYDYd) 
 epYUadjepYUepYU = Matmul(epYU,adjepYUepYU) 
 epYUadjepYUYu = Matmul(epYU,adjepYUYu) 
 epYUadjYdYd = Matmul(epYU,adjYdYd) 
 epYUadjYuYu = Matmul(epYU,adjYuYu) 
 YdadjepYDepYD = Matmul(Yd,adjepYDepYD) 
 YdadjepYUepYU = Matmul(Yd,adjepYUepYU) 
 YdadjYdepYD = Matmul(Yd,adjYdepYD) 
 YdadjYdYd = Matmul(Yd,adjYdYd) 
 YdadjYuepYU = Matmul(Yd,adjYuepYU) 
 YdadjYuYu = Matmul(Yd,adjYuYu) 
 YeadjepYEepYE = Matmul(Ye,adjepYEepYE) 
 YeadjYeepYE = Matmul(Ye,adjYeepYE) 
 YeadjYeYe = Matmul(Ye,adjYeYe) 
 YuadjepYDepYD = Matmul(Yu,adjepYDepYD) 
 YuadjepYUepYU = Matmul(Yu,adjepYUepYU) 
 YuadjYdepYD = Matmul(Yu,adjYdepYD) 
 YuadjYdYd = Matmul(Yu,adjYdYd) 
 YuadjYuepYU = Matmul(Yu,adjYuepYU) 
 YuadjYuYu = Matmul(Yu,adjYuYu) 
 adjepYDepYDadjepYD = Matmul(adjepYD,epYDadjepYD) 
 adjepYDepYDadjYd = Matmul(adjepYD,epYDadjYd) 
 adjepYDYdadjepYD = Matmul(adjepYD,YdadjepYD) 
 adjepYDYdadjYd = Matmul(adjepYD,YdadjYd) 
 adjepYDYdadjYu = Matmul(adjepYD,YdadjYu) 
 adjepYEepYEadjepYE = Matmul(adjepYE,epYEadjepYE) 
 adjepYEepYEadjYe = Matmul(adjepYE,epYEadjYe) 
 adjepYEYeadjepYE = Matmul(adjepYE,YeadjepYE) 
 adjepYEYeadjYe = Matmul(adjepYE,YeadjYe) 
 adjepYUepYUadjepYD = Matmul(adjepYU,epYUadjepYD) 
 adjepYUepYUadjepYU = Matmul(adjepYU,epYUadjepYU) 
 adjepYUepYUadjYu = Matmul(adjepYU,epYUadjYu) 
 adjepYUYuadjepYU = Matmul(adjepYU,YuadjepYU) 
 adjepYUYuadjYd = Matmul(adjepYU,YuadjYd) 
 adjepYUYuadjYu = Matmul(adjepYU,YuadjYu) 
 adjYdepYDadjepYD = Matmul(adjYd,epYDadjepYD) 
 adjYdepYDadjYd = Matmul(adjYd,epYDadjYd) 
 adjYdYdadjepYD = Matmul(adjYd,YdadjepYD) 
 adjYdYdadjYd = Matmul(adjYd,YdadjYd) 
 adjYeepYEadjepYE = Matmul(adjYe,epYEadjepYE) 
 adjYeepYEadjYe = Matmul(adjYe,epYEadjYe) 
 adjYeYeadjepYE = Matmul(adjYe,YeadjepYE) 
 adjYeYeadjYe = Matmul(adjYe,YeadjYe) 
 adjYuepYUadjepYU = Matmul(adjYu,epYUadjepYU) 
 adjYuepYUadjYu = Matmul(adjYu,epYUadjYu) 
 adjYuYuadjepYU = Matmul(adjYu,YuadjepYU) 
 adjYuYuadjYd = Matmul(adjYu,YuadjYd) 
 adjYuYuadjYu = Matmul(adjYu,YuadjYu) 
 epYDadjepYDepYDadjepYD = Matmul(epYD,adjepYDepYDadjepYD) 
Forall(i2=1:3)  epYDadjepYDepYDadjepYD(i2,i2) =  Real(epYDadjepYDepYDadjepYD(i2,i2),dp) 
 epYDadjepYDepYDadjYd = Matmul(epYD,adjepYDepYDadjYd) 
 epYDadjepYDYdadjepYD = Matmul(epYD,adjepYDYdadjepYD) 
 epYDadjepYDYdadjYd = Matmul(epYD,adjepYDYdadjYd) 
 epYDadjepYUepYUadjepYD = Matmul(epYD,adjepYUepYUadjepYD) 
Forall(i2=1:3)  epYDadjepYUepYUadjepYD(i2,i2) =  Real(epYDadjepYUepYUadjepYD(i2,i2),dp) 
 epYDadjepYUYuadjYd = Matmul(epYD,adjepYUYuadjYd) 
 epYDadjYdepYDadjepYD = Matmul(epYD,adjYdepYDadjepYD) 
 epYDadjYdepYDadjYd = Matmul(epYD,adjYdepYDadjYd) 
 epYDadjYdYdadjepYD = Matmul(epYD,adjYdYdadjepYD) 
Forall(i2=1:3)  epYDadjYdYdadjepYD(i2,i2) =  Real(epYDadjYdYdadjepYD(i2,i2),dp) 
 epYDadjYdYdadjYd = Matmul(epYD,adjYdYdadjYd) 
 epYEadjepYEepYEadjepYE = Matmul(epYE,adjepYEepYEadjepYE) 
Forall(i2=1:3)  epYEadjepYEepYEadjepYE(i2,i2) =  Real(epYEadjepYEepYEadjepYE(i2,i2),dp) 
 epYEadjepYEepYEadjYe = Matmul(epYE,adjepYEepYEadjYe) 
 epYEadjepYEYeadjepYE = Matmul(epYE,adjepYEYeadjepYE) 
 epYEadjepYEYeadjYe = Matmul(epYE,adjepYEYeadjYe) 
 epYEadjYeepYEadjepYE = Matmul(epYE,adjYeepYEadjepYE) 
 epYEadjYeepYEadjYe = Matmul(epYE,adjYeepYEadjYe) 
 epYEadjYeYeadjepYE = Matmul(epYE,adjYeYeadjepYE) 
Forall(i2=1:3)  epYEadjYeYeadjepYE(i2,i2) =  Real(epYEadjYeYeadjepYE(i2,i2),dp) 
 epYEadjYeYeadjYe = Matmul(epYE,adjYeYeadjYe) 
 epYUadjepYDYdadjYu = Matmul(epYU,adjepYDYdadjYu) 
 epYUadjepYUepYUadjepYU = Matmul(epYU,adjepYUepYUadjepYU) 
Forall(i2=1:3)  epYUadjepYUepYUadjepYU(i2,i2) =  Real(epYUadjepYUepYUadjepYU(i2,i2),dp) 
 epYUadjepYUepYUadjYu = Matmul(epYU,adjepYUepYUadjYu) 
 epYUadjepYUYuadjepYU = Matmul(epYU,adjepYUYuadjepYU) 
 epYUadjepYUYuadjYu = Matmul(epYU,adjepYUYuadjYu) 
 epYUadjYuepYUadjepYU = Matmul(epYU,adjYuepYUadjepYU) 
 epYUadjYuepYUadjYu = Matmul(epYU,adjYuepYUadjYu) 
 epYUadjYuYuadjepYU = Matmul(epYU,adjYuYuadjepYU) 
Forall(i2=1:3)  epYUadjYuYuadjepYU(i2,i2) =  Real(epYUadjYuYuadjepYU(i2,i2),dp) 
 epYUadjYuYuadjYu = Matmul(epYU,adjYuYuadjYu) 
 YdadjepYDYdadjepYD = Matmul(Yd,adjepYDYdadjepYD) 
 YdadjepYDYdadjYd = Matmul(Yd,adjepYDYdadjYd) 
 YdadjYdYdadjepYD = Matmul(Yd,adjYdYdadjepYD) 
 YdadjYdYdadjYd = Matmul(Yd,adjYdYdadjYd) 
Forall(i2=1:3)  YdadjYdYdadjYd(i2,i2) =  Real(YdadjYdYdadjYd(i2,i2),dp) 
 YdadjYuYuadjYd = Matmul(Yd,adjYuYuadjYd) 
Forall(i2=1:3)  YdadjYuYuadjYd(i2,i2) =  Real(YdadjYuYuadjYd(i2,i2),dp) 
 YeadjepYEYeadjepYE = Matmul(Ye,adjepYEYeadjepYE) 
 YeadjepYEYeadjYe = Matmul(Ye,adjepYEYeadjYe) 
 YeadjYeYeadjepYE = Matmul(Ye,adjYeYeadjepYE) 
 YeadjYeYeadjYe = Matmul(Ye,adjYeYeadjYe) 
Forall(i2=1:3)  YeadjYeYeadjYe(i2,i2) =  Real(YeadjYeYeadjYe(i2,i2),dp) 
 YuadjepYUYuadjepYU = Matmul(Yu,adjepYUYuadjepYU) 
 YuadjepYUYuadjYu = Matmul(Yu,adjepYUYuadjYu) 
 YuadjYuYuadjepYU = Matmul(Yu,adjYuYuadjepYU) 
 YuadjYuYuadjYu = Matmul(Yu,adjYuYuadjYu) 
Forall(i2=1:3)  YuadjYuYuadjYu(i2,i2) =  Real(YuadjYuYuadjYu(i2,i2),dp) 
 TrepYDadjepYD = Real(cTrace(epYDadjepYD),dp) 
 TrepYDadjYd = cTrace(epYDadjYd) 
 TrepYEadjepYE = Real(cTrace(epYEadjepYE),dp) 
 TrepYEadjYe = cTrace(epYEadjYe) 
 TrepYUadjepYU = Real(cTrace(epYUadjepYU),dp) 
 TrepYUadjYu = cTrace(epYUadjYu) 
 TrYdadjepYD = cTrace(YdadjepYD) 
 TrYdadjYd = Real(cTrace(YdadjYd),dp) 
 TrYeadjepYE = cTrace(YeadjepYE) 
 TrYeadjYe = Real(cTrace(YeadjYe),dp) 
 TrYuadjepYU = cTrace(YuadjepYU) 
 TrYuadjYu = Real(cTrace(YuadjYu),dp) 
 TrepYDadjepYDepYDadjepYD = Real(cTrace(epYDadjepYDepYDadjepYD),dp) 
 TrepYDadjepYDepYDadjYd = cTrace(epYDadjepYDepYDadjYd) 
 TrepYDadjepYDYdadjepYD = cTrace(epYDadjepYDYdadjepYD) 
 TrepYDadjepYDYdadjYd = cTrace(epYDadjepYDYdadjYd) 
 TrepYDadjepYUepYUadjepYD = Real(cTrace(epYDadjepYUepYUadjepYD),dp) 
 TrepYDadjepYUYuadjYd = cTrace(epYDadjepYUYuadjYd) 
 TrepYDadjYdepYDadjepYD = cTrace(epYDadjYdepYDadjepYD) 
 TrepYDadjYdepYDadjYd = cTrace(epYDadjYdepYDadjYd) 
 TrepYDadjYdYdadjepYD = Real(cTrace(epYDadjYdYdadjepYD),dp) 
 TrepYDadjYdYdadjYd = cTrace(epYDadjYdYdadjYd) 
 TrepYEadjepYEepYEadjepYE = Real(cTrace(epYEadjepYEepYEadjepYE),dp) 
 TrepYEadjepYEepYEadjYe = cTrace(epYEadjepYEepYEadjYe) 
 TrepYEadjepYEYeadjepYE = cTrace(epYEadjepYEYeadjepYE) 
 TrepYEadjepYEYeadjYe = cTrace(epYEadjepYEYeadjYe) 
 TrepYEadjYeepYEadjepYE = cTrace(epYEadjYeepYEadjepYE) 
 TrepYEadjYeepYEadjYe = cTrace(epYEadjYeepYEadjYe) 
 TrepYEadjYeYeadjepYE = Real(cTrace(epYEadjYeYeadjepYE),dp) 
 TrepYEadjYeYeadjYe = cTrace(epYEadjYeYeadjYe) 
 TrepYUadjepYDYdadjYu = cTrace(epYUadjepYDYdadjYu) 
 TrepYUadjepYUepYUadjepYU = Real(cTrace(epYUadjepYUepYUadjepYU),dp) 
 TrepYUadjepYUepYUadjYu = cTrace(epYUadjepYUepYUadjYu) 
 TrepYUadjepYUYuadjepYU = cTrace(epYUadjepYUYuadjepYU) 
 TrepYUadjepYUYuadjYu = cTrace(epYUadjepYUYuadjYu) 
 TrepYUadjYuepYUadjepYU = cTrace(epYUadjYuepYUadjepYU) 
 TrepYUadjYuepYUadjYu = cTrace(epYUadjYuepYUadjYu) 
 TrepYUadjYuYuadjepYU = Real(cTrace(epYUadjYuYuadjepYU),dp) 
 TrepYUadjYuYuadjYu = cTrace(epYUadjYuYuadjYu) 
 TrYdadjepYDYdadjepYD = cTrace(YdadjepYDYdadjepYD) 
 TrYdadjepYDYdadjYd = cTrace(YdadjepYDYdadjYd) 
 TrYdadjYdYdadjepYD = cTrace(YdadjYdYdadjepYD) 
 TrYdadjYdYdadjYd = Real(cTrace(YdadjYdYdadjYd),dp) 
 TrYdadjYuYuadjYd = Real(cTrace(YdadjYuYuadjYd),dp) 
 TrYeadjepYEYeadjepYE = cTrace(YeadjepYEYeadjepYE) 
 TrYeadjepYEYeadjYe = cTrace(YeadjepYEYeadjYe) 
 TrYeadjYeYeadjepYE = cTrace(YeadjYeYeadjepYE) 
 TrYeadjYeYeadjYe = Real(cTrace(YeadjYeYeadjYe),dp) 
 TrYuadjepYUYuadjepYU = cTrace(YuadjepYUYuadjepYU) 
 TrYuadjepYUYuadjYu = cTrace(YuadjepYUYuadjYu) 
 TrYuadjYuYuadjepYU = cTrace(YuadjYuYuadjepYU) 
 TrYuadjYuYuadjYu = Real(cTrace(YuadjYuYuadjYu),dp) 
 g1p2 =g1**2 
 g1p3 =g1**3 
 g1p4 =g1**4 
 g2p2 =g2**2 
 g2p3 =g2**3 
 g2p4 =g2**4 
 g3p2 =g3**2 
 g3p3 =g3**3 
 Lam1p2 =Lam1**2 
 Lam2p2 =Lam2**2 
 Lam3p2 =Lam3**2 
 Lam4p2 =Lam4**2 
 Lam5p2 =Lam5**2 
 Lam6p2 =Lam6**2 
 Lam7p2 =Lam7**2 


If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = 21._dp*(g1p3)/5._dp

 
 
If (TwoLoopRGE) Then 
betag12 = 0

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = -3._dp*(g2p3)

 
 
If (TwoLoopRGE) Then 
betag22 = 0

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = -7._dp*(g3p3)

 
 
If (TwoLoopRGE) Then 
betag32 = 0

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! Lam6 
!-------------------- 
 
betaLam61  = (-18*g1p2*Lam6 - 90*g2p2*Lam6 + 120*Lam1*Lam6 + 60*Lam3*Lam6 +           & 
&  80*Lam4*Lam6 + 100*Lam5*Lam6 + 60*Lam3*Lam7 + 40*Lam4*Lam7 + 20*Lam5*Lam7 +           & 
&  30*Lam6*TrepYDadjepYD + 15*(Lam1 + Lam3 + Lam4 + Lam5)*TrepYDadjYd - 60._dp*(TrepYDadjYdYdadjYd)& 
&  + 10*Lam6*TrepYEadjepYE + 5*Lam1*TrepYEadjYe + 5*Lam3*TrepYEadjYe + 5*Lam4*TrepYEadjYe +& 
&  5*Lam5*TrepYEadjYe - 20._dp*(TrepYEadjYeYeadjYe) + 90*Lam6*TrepYUadjepYU -            & 
&  30._dp*(TrepYUadjepYUepYUadjYu) - 60._dp*(TrepYUadjepYUYuadjepYU) + 15*Lam1*TrepYUadjYu +& 
&  15*Lam3*TrepYUadjYu + 15*Lam4*TrepYUadjYu + 15*Lam5*TrepYUadjYu - 30._dp*(TrepYUadjYuepYUadjepYU)& 
&  + 15*Lam1*TrYdadjepYD + 15*Lam3*TrYdadjepYD + 15*Lam4*TrYdadjepYD + 15*Lam5*TrYdadjepYD -& 
&  30._dp*(TrYdadjepYDYdadjYd) + 90*Lam6*TrYdadjYd - 30._dp*(TrYdadjYdYdadjepYD)         & 
&  + 5*Lam1*TrYeadjepYE + 5*Lam3*TrYeadjepYE + 5*Lam4*TrYeadjepYE + 5*Lam5*TrYeadjepYE - & 
&  10._dp*(TrYeadjepYEYeadjYe) + 30*Lam6*TrYeadjYe - 10._dp*(TrYeadjYeYeadjepYE)         & 
&  + 15*Lam1*TrYuadjepYU + 15*Lam3*TrYuadjepYU + 15*Lam4*TrYuadjepYU + 15*Lam5*TrYuadjepYU +& 
&  30*Lam6*TrYuadjYu)/10._dp

 
 
If (TwoLoopRGE) Then 
betaLam62 = 0

 
DLam6 = oo16pi2*( betaLam61 + oo16pi2 * betaLam62 ) 

 
Else 
DLam6 = oo16pi2* betaLam61 
End If 
 
 
Call Chop(DLam6) 

!-------------------- 
! Lam5 
!-------------------- 
 
betaLam51  = 10._dp*(Lam6p2) + 10._dp*(Lam7p2) - (9*g1p2*Lam5)/5._dp - 9*g2p2*Lam5 +  & 
&  2*Lam1*Lam5 + 2*Lam2*Lam5 + 8*Lam3*Lam5 + 12*Lam4*Lam5 + 4*Lam6*Lam7 + 6*Lam5*TrepYDadjepYD +& 
&  3*(Lam6 + Lam7)*TrepYDadjYd - 6._dp*(TrepYDadjYdepYDadjYd) + 2*Lam5*TrepYEadjepYE +   & 
&  Lam6*TrepYEadjYe + Lam7*TrepYEadjYe - 2._dp*(TrepYEadjYeepYEadjYe) + 6*Lam5*TrepYUadjepYU +& 
&  3*Lam6*TrepYUadjYu + 3*Lam7*TrepYUadjYu - 6._dp*(TrepYUadjYuepYUadjYu) +              & 
&  3*Lam6*TrYdadjepYD + 3*Lam7*TrYdadjepYD - 6._dp*(TrYdadjepYDYdadjepYD) +              & 
&  6*Lam5*TrYdadjYd + Lam6*TrYeadjepYE + Lam7*TrYeadjepYE - 2._dp*(TrYeadjepYEYeadjepYE) & 
&  + 2*Lam5*TrYeadjYe + 3*Lam6*TrYuadjepYU + 3*Lam7*TrYuadjepYU - 6._dp*(TrYuadjepYUYuadjepYU)& 
&  + 6*Lam5*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betaLam52 = 0

 
DLam5 = oo16pi2*( betaLam51 + oo16pi2 * betaLam52 ) 

 
Else 
DLam5 = oo16pi2* betaLam51 
End If 
 
 
Call Chop(DLam5) 

!-------------------- 
! Lam7 
!-------------------- 
 
betaLam71  = (60*Lam3*Lam6 + 40*Lam4*Lam6 + 20*Lam5*Lam6 - 18*g1p2*Lam7 -             & 
&  90*g2p2*Lam7 + 120*Lam2*Lam7 + 60*Lam3*Lam7 + 80*Lam4*Lam7 + 100*Lam5*Lam7 +          & 
&  90*Lam7*TrepYDadjepYD - 30._dp*(TrepYDadjepYDepYDadjYd) - 60._dp*(TrepYDadjepYDYdadjepYD)& 
&  + 15*(Lam2 + Lam3 + Lam4 + Lam5)*TrepYDadjYd - 30._dp*(TrepYDadjYdepYDadjepYD)        & 
&  + 30*Lam7*TrepYEadjepYE - 10._dp*(TrepYEadjepYEepYEadjYe) - 20._dp*(TrepYEadjepYEYeadjepYE)& 
&  + 5*Lam2*TrepYEadjYe + 5*Lam3*TrepYEadjYe + 5*Lam4*TrepYEadjYe + 5*Lam5*TrepYEadjYe - & 
&  10._dp*(TrepYEadjYeepYEadjepYE) + 30*Lam7*TrepYUadjepYU + 15*Lam2*TrepYUadjYu +       & 
&  15*Lam3*TrepYUadjYu + 15*Lam4*TrepYUadjYu + 15*Lam5*TrepYUadjYu - 60._dp*(TrepYUadjYuYuadjYu)& 
&  + 15*Lam2*TrYdadjepYD + 15*Lam3*TrYdadjepYD + 15*Lam4*TrYdadjepYD + 15*Lam5*TrYdadjepYD +& 
&  30*Lam7*TrYdadjYd + 5*Lam2*TrYeadjepYE + 5*Lam3*TrYeadjepYE + 5*Lam4*TrYeadjepYE +    & 
&  5*Lam5*TrYeadjepYE + 10*Lam7*TrYeadjYe + 15*Lam2*TrYuadjepYU + 15*Lam3*TrYuadjepYU +  & 
&  15*Lam4*TrYuadjepYU + 15*Lam5*TrYuadjepYU - 30._dp*(TrYuadjepYUYuadjYu)               & 
&  + 90*Lam7*TrYuadjYu - 30._dp*(TrYuadjYuYuadjepYU))/10._dp

 
 
If (TwoLoopRGE) Then 
betaLam72 = 0

 
DLam7 = oo16pi2*( betaLam71 + oo16pi2 * betaLam72 ) 

 
Else 
DLam7 = oo16pi2* betaLam71 
End If 
 
 
Call Chop(DLam7) 

!-------------------- 
! Lam1 
!-------------------- 
 
betaLam11  = 27._dp*(g1p4)/100._dp + (9*g1p2*g2p2)/10._dp + 9._dp*(g2p4)              & 
& /4._dp + 12._dp*(Lam1p2) + 4._dp*(Lam3p2) + 2._dp*(Lam4p2) + 2._dp*(Lam5p2)            & 
&  + 24._dp*(Lam6p2) - (9*g1p2*Lam1)/5._dp - 9*g2p2*Lam1 + 4*Lam3*Lam4 + 6*Lam6*TrepYDadjYd +& 
&  2*Lam6*TrepYEadjYe + 12*Lam1*TrepYUadjepYU - 12._dp*(TrepYUadjepYUepYUadjepYU)        & 
&  + 6*Lam6*TrepYUadjYu + 6*Lam6*TrYdadjepYD + 12*Lam1*TrYdadjYd - 12._dp*(TrYdadjYdYdadjYd)& 
&  + 2*Lam6*TrYeadjepYE + 4*Lam1*TrYeadjYe - 4._dp*(TrYeadjYeYeadjYe) + 6*Lam6*TrYuadjepYU

 
 
If (TwoLoopRGE) Then 
betaLam12 = 0

 
DLam1 = oo16pi2*( betaLam11 + oo16pi2 * betaLam12 ) 

 
Else 
DLam1 = oo16pi2* betaLam11 
End If 
 
 
Call Chop(DLam1) 

!-------------------- 
! Lam4 
!-------------------- 
 
betaLam41  = (9*g1p2*g2p2)/5._dp + 4._dp*(Lam4p2) + 8._dp*(Lam5p2) + 10._dp*(Lam6p2)  & 
&  + 10._dp*(Lam7p2) - (9*g1p2*Lam4)/5._dp - 9*g2p2*Lam4 + 2*Lam1*Lam4 + 2*Lam2*Lam4 +   & 
&  8*Lam3*Lam4 + 4*Lam6*Lam7 + 6*Lam4*TrepYDadjepYD + 12._dp*(TrepYDadjepYUepYUadjepYD)  & 
&  - 12._dp*(TrepYDadjepYUYuadjYd) + 3*(Lam6 + Lam7)*TrepYDadjYd - 12._dp*(TrepYDadjYdYdadjepYD)& 
&  + 2*Lam4*TrepYEadjepYE + Lam6*TrepYEadjYe + Lam7*TrepYEadjYe - 4._dp*(TrepYEadjYeYeadjepYE)& 
&  - 12._dp*(TrepYUadjepYDYdadjYu) + 6*Lam4*TrepYUadjepYU + 3*Lam6*TrepYUadjYu +         & 
&  3*Lam7*TrepYUadjYu - 12._dp*(TrepYUadjYuYuadjepYU) + 3*Lam6*TrYdadjepYD +             & 
&  3*Lam7*TrYdadjepYD + 6*Lam4*TrYdadjYd + 12._dp*(TrYdadjYuYuadjYd) + Lam6*TrYeadjepYE +& 
&  Lam7*TrYeadjepYE + 2*Lam4*TrYeadjYe + 3*Lam6*TrYuadjepYU + 3*Lam7*TrYuadjepYU +       & 
&  6*Lam4*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betaLam42 = 0

 
DLam4 = oo16pi2*( betaLam41 + oo16pi2 * betaLam42 ) 

 
Else 
DLam4 = oo16pi2* betaLam41 
End If 
 
 
Call Chop(DLam4) 

!-------------------- 
! Lam3 
!-------------------- 
 
betaLam31  = 27._dp*(g1p4)/100._dp - (9*g1p2*g2p2)/10._dp + 9._dp*(g2p4)              & 
& /4._dp + 4._dp*(Lam3p2) + 2._dp*(Lam4p2) + 2._dp*(Lam5p2) + 4._dp*(Lam6p2)             & 
&  + 4._dp*(Lam7p2) - (9*g1p2*Lam3)/5._dp - 9*g2p2*Lam3 + 6*Lam1*Lam3 + 6*Lam2*Lam3 +    & 
&  2*Lam1*Lam4 + 2*Lam2*Lam4 + 16*Lam6*Lam7 + 6*Lam3*TrepYDadjepYD - 12._dp*(TrepYDadjepYDYdadjYd)& 
&  - 12._dp*(TrepYDadjepYUepYUadjepYD) + 12._dp*(TrepYDadjepYUYuadjYd) + 3*(Lam6 +       & 
&  Lam7)*TrepYDadjYd + 2*Lam3*TrepYEadjepYE - 4._dp*(TrepYEadjepYEYeadjYe)               & 
&  + Lam6*TrepYEadjYe + Lam7*TrepYEadjYe + 12._dp*(TrepYUadjepYDYdadjYu) +               & 
&  6*Lam3*TrepYUadjepYU - 12._dp*(TrepYUadjepYUYuadjYu) + 3*Lam6*TrepYUadjYu +           & 
&  3*Lam7*TrepYUadjYu + 3*Lam6*TrYdadjepYD + 3*Lam7*TrYdadjepYD + 6*Lam3*TrYdadjYd -     & 
&  12._dp*(TrYdadjYuYuadjYd) + Lam6*TrYeadjepYE + Lam7*TrYeadjepYE + 2*Lam3*TrYeadjYe +  & 
&  3*Lam6*TrYuadjepYU + 3*Lam7*TrYuadjepYU + 6*Lam3*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betaLam32 = 0

 
DLam3 = oo16pi2*( betaLam31 + oo16pi2 * betaLam32 ) 

 
Else 
DLam3 = oo16pi2* betaLam31 
End If 
 
 
Call Chop(DLam3) 

!-------------------- 
! Lam2 
!-------------------- 
 
betaLam21  = 27._dp*(g1p4)/100._dp + (9*g1p2*g2p2)/10._dp + 9._dp*(g2p4)              & 
& /4._dp + 12._dp*(Lam2p2) + 4._dp*(Lam3p2) + 2._dp*(Lam4p2) + 2._dp*(Lam5p2)            & 
&  + 24._dp*(Lam7p2) - (9*g1p2*Lam2)/5._dp - 9*g2p2*Lam2 + 4*Lam3*Lam4 + 12*Lam2*TrepYDadjepYD -& 
&  12._dp*(TrepYDadjepYDepYDadjepYD) + 6*Lam7*TrepYDadjYd + 4*Lam2*TrepYEadjepYE -       & 
&  4._dp*(TrepYEadjepYEepYEadjepYE) + 2*Lam7*TrepYEadjYe + 6*Lam7*TrepYUadjYu +          & 
&  6*Lam7*TrYdadjepYD + 2*Lam7*TrYeadjepYE + 6*Lam7*TrYuadjepYU + 12*Lam2*TrYuadjYu -    & 
&  12._dp*(TrYuadjYuYuadjYu)

 
 
If (TwoLoopRGE) Then 
betaLam22 = 0

 
DLam2 = oo16pi2*( betaLam21 + oo16pi2 * betaLam22 ) 

 
Else 
DLam2 = oo16pi2* betaLam21 
End If 
 
 
Call Chop(DLam2) 

!-------------------- 
! epYU 
!-------------------- 
 
betaepYU1  = epYU*(-17._dp*(g1p2)/20._dp - 9._dp*(g2p2)/4._dp - 8._dp*(g3p2)          & 
&  + 3._dp*(TrepYUadjepYU) + 3._dp*(TrYdadjYd) + TrYeadjYe) + (epYUadjepYDepYD +         & 
&  3._dp*(epYUadjepYUepYU) - 3._dp*(epYUadjYdYd) + epYUadjYuYu + 6*TrepYDadjYd*Yu +      & 
&  2*TrepYEadjYe*Yu + 6*TrepYUadjYu*Yu - 4._dp*(YuadjYdepYD) + 2._dp*(YuadjYuepYU))/2._dp

 
 
If (TwoLoopRGE) Then 
betaepYU2 = 0

 
DepYU = oo16pi2*( betaepYU1 + oo16pi2 * betaepYU2 ) 

 
Else 
DepYU = oo16pi2* betaepYU1 
End If 
 
 
Call Chop(DepYU) 

!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = epYU*(3._dp*(TrYdadjepYD) + TrYeadjepYE + 3._dp*(TrYuadjepYU))             & 
&  + (-17._dp*(g1p2)/20._dp - 9._dp*(g2p2)/4._dp - 8._dp*(g3p2) + 3._dp*(TrepYDadjepYD)  & 
&  + TrepYEadjepYE + 3._dp*(TrYuadjYu))*Yu + (-4._dp*(epYUadjepYDYd) + 2._dp*(epYUadjepYUYu)& 
&  - 3._dp*(YuadjepYDepYD) + YuadjepYUepYU + YuadjYdYd + 3._dp*(YuadjYuYu))/2._dp

 
 
If (TwoLoopRGE) Then 
betaYu2 = 0

 
DYu = oo16pi2*( betaYu1 + oo16pi2 * betaYu2 ) 

 
Else 
DYu = oo16pi2* betaYu1 
End If 
 
 
Call Chop(DYu) 

!-------------------- 
! Yd 
!-------------------- 
 
betaYd1  = epYD*(3._dp*(TrYdadjepYD) + TrYeadjepYE + 3._dp*(TrYuadjepYU))             & 
&  + (-((g1p2 + 9._dp*(g2p2) + 32._dp*(g3p2) - 12._dp*(TrepYUadjepYU) - 12._dp*(TrYdadjYd)& 
&  - 4._dp*(TrYeadjYe))*Yd) + 2*(2._dp*(epYDadjepYDYd) - 4._dp*(epYDadjepYUYu)           & 
&  + YdadjepYDepYD - 3._dp*(YdadjepYUepYU) + 3._dp*(YdadjYdYd) + YdadjYuYu))/4._dp

 
 
If (TwoLoopRGE) Then 
betaYd2 = 0

 
DYd = oo16pi2*( betaYd1 + oo16pi2 * betaYd2 ) 

 
Else 
DYd = oo16pi2* betaYd1 
End If 
 
 
Call Chop(DYd) 

!-------------------- 
! Ye 
!-------------------- 
 
betaYe1  = epYE*(3._dp*(TrYdadjepYD) + TrYeadjepYE + 3._dp*(TrYuadjepYU))             & 
&  + (-9._dp*(g1p2)/4._dp - 9._dp*(g2p2)/4._dp + 3._dp*(TrepYUadjepYU) + 3._dp*(TrYdadjYd)& 
&  + TrYeadjYe)*Ye + (2._dp*(epYEadjepYEYe) + YeadjepYEepYE + 3._dp*(YeadjYeYe))/2._dp

 
 
If (TwoLoopRGE) Then 
betaYe2 = 0

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! epYD 
!-------------------- 
 
betaepYD1  = epYD*(-1._dp*(g1p2)/4._dp - 9._dp*(g2p2)/4._dp - 8._dp*(g3p2)            & 
&  + 3._dp*(TrepYDadjepYD) + TrepYEadjepYE + 3._dp*(TrYuadjYu)) + (3._dp*(epYDadjepYDepYD)& 
&  + epYDadjepYUepYU + epYDadjYdYd - 3._dp*(epYDadjYuYu) + 6*TrepYDadjYd*Yd +            & 
&  2*TrepYEadjYe*Yd + 6*TrepYUadjYu*Yd + 2._dp*(YdadjYdepYD) - 4._dp*(YdadjYuepYU))/2._dp

 
 
If (TwoLoopRGE) Then 
betaepYD2 = 0

 
DepYD = oo16pi2*( betaepYD1 + oo16pi2 * betaepYD2 ) 

 
Else 
DepYD = oo16pi2* betaepYD1 
End If 
 
 
Call Chop(DepYD) 

!-------------------- 
! epYE 
!-------------------- 
 
betaepYE1  = 3._dp*(epYEadjepYEepYE)/2._dp + epYEadjYeYe/2._dp + epYE*(-              & 
& 9._dp*(g1p2)/4._dp - 9._dp*(g2p2)/4._dp + 3._dp*(TrepYDadjepYD) + TrepYEadjepYE +      & 
&  3._dp*(TrYuadjYu)) + 3*TrepYDadjYd*Ye + TrepYEadjYe*Ye + 3*TrepYUadjYu*Ye +           & 
&  YeadjYeepYE

 
 
If (TwoLoopRGE) Then 
betaepYE2 = 0

 
DepYE = oo16pi2*( betaepYE1 + oo16pi2 * betaepYE2 ) 

 
Else 
DepYE = oo16pi2* betaepYE1 
End If 
 
 
Call Chop(DepYE) 

!-------------------- 
! M12 
!-------------------- 
 
betaM121  = -6*Lam6*M112 - (9*g1p2*M12)/10._dp - (9*g2p2*M12)/2._dp + 2*Lam3*M12 +    & 
&  4*Lam4*M12 + 6*Lam5*M12 - 6*Lam7*M222 + 3*M12*TrepYDadjepYD - 3*M112*TrepYDadjYd +    & 
&  M12*TrepYEadjepYE - M112*TrepYEadjYe + 3*M12*TrepYUadjepYU - 3*M222*TrepYUadjYu -     & 
&  3*M222*TrYdadjepYD + 3*M12*TrYdadjYd - M222*TrYeadjepYE + M12*TrYeadjYe -             & 
&  3*M112*TrYuadjepYU + 3*M12*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betaM122 = 0

 
DM12 = oo16pi2*( betaM121 + oo16pi2 * betaM122 ) 

 
Else 
DM12 = oo16pi2* betaM121 
End If 
 
 
Call Chop(DM12) 

!-------------------- 
! M112 
!-------------------- 
 
betaM1121  = (-9*g1p2*M112)/10._dp - (9*g2p2*M112)/2._dp + 6*Lam1*M112 -              & 
&  12*Lam6*M12 + 4*Lam3*M222 + 2*Lam4*M222 + 6*M112*TrepYUadjepYU - 6*M12*TrepYUadjYu -  & 
&  6*M12*TrYdadjepYD + 6*M112*TrYdadjYd - 2*M12*TrYeadjepYE + 2*M112*TrYeadjYe

 
 
If (TwoLoopRGE) Then 
betaM1122 = 0

 
DM112 = oo16pi2*( betaM1121 + oo16pi2 * betaM1122 ) 

 
Else 
DM112 = oo16pi2* betaM1121 
End If 
 
 
Call Chop(DM112) 

!-------------------- 
! M222 
!-------------------- 
 
betaM2221  = 4*Lam3*M112 + 2*Lam4*M112 - 12*Lam7*M12 - (9*g1p2*M222)/10._dp -         & 
&  (9*g2p2*M222)/2._dp + 6*Lam2*M222 + 6*M222*TrepYDadjepYD - 6*M12*TrepYDadjYd +        & 
&  2*M222*TrepYEadjepYE - 2*M12*TrepYEadjYe - 6*M12*TrYuadjepYU + 6*M222*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betaM2222 = 0

 
DM222 = oo16pi2*( betaM2221 + oo16pi2 * betaM2222 ) 

 
Else 
DM222 = oo16pi2* betaM2221 
End If 
 
 
Call Chop(DM222) 

!-------------------- 
! v 
!-------------------- 
 
betav1  = (9*g1p2*v + 45*g2p2*v - 60*TrepYUadjepYU*v - 60*TrYdadjYd*v -               & 
&  20*TrYeadjYe*v - 30*TrepYDadjYd*v2 - 10*TrepYEadjYe*v2 - 30*TrepYUadjYu*v2 -          & 
&  30*TrYdadjepYD*v2 - 10*TrYeadjepYE*v2 - 30*TrYuadjepYU*v2 + 3*g1p2*v*Xi +             & 
&  15*g2p2*v*Xi)/20._dp

 
 
If (TwoLoopRGE) Then 
betav2 = 0

 
Dv = oo16pi2*( betav1 + oo16pi2 * betav2 ) 

 
Else 
Dv = oo16pi2* betav1 
End If 
 
 
!-------------------- 
! v2 
!-------------------- 
 
betav21  = (-30*TrepYDadjYd*v - 10*TrepYEadjYe*v - 30*TrepYUadjYu*v - 30*TrYdadjepYD*v -& 
&  10*TrYeadjepYE*v - 30*TrYuadjepYU*v + 9*g1p2*v2 + 45*g2p2*v2 - 60*TrepYDadjepYD*v2 -  & 
&  20*TrepYEadjepYE*v2 - 60*TrYuadjYu*v2 + 3*g1p2*v2*Xi + 15*g2p2*v2*Xi)/20._dp

 
 
If (TwoLoopRGE) Then 
betav22 = 0

 
Dv2 = oo16pi2*( betav21 + oo16pi2 * betav22 ) 

 
Else 
Dv2 = oo16pi2* betav21 
End If 
 
 
Call ParametersToG133(Dg1,Dg2,Dg3,DLam6,DLam5,DLam7,DLam1,DLam4,DLam3,DLam2,          & 
& DepYU,DYu,DYd,DYe,DepYD,DepYE,DM12,DM112,DM222,Dv,Dv2,f)

Iname = Iname - 1 
 
End Subroutine rge133  

End Module RGEs_THDMIIIHB 
 
