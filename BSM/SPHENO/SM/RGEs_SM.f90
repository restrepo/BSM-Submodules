! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 21:50 on 15.11.2017   
! ----------------------------------------------------------------------  
 
 
Module RGEs_SM 
 
Use Control 
Use Settings 
Use Model_Data_SM 
Use Mathematics 
 
Logical,Private,Save::OnlyDiagonal

Real(dp),Parameter::id3R(3,3)=& 
   & Reshape(Source=(/& 
   & 1,0,0,& 
 &0,1,0,& 
 &0,0,1& 
 &/),shape=(/3,3/)) 
Contains 


Subroutine GToParameters61(g,g1,g2,g3,Lam,Yu,Yd,Ye,Mu)

Implicit None 
Real(dp), Intent(in) :: g(61) 
Real(dp),Intent(out) :: g1,g2,g3

Complex(dp),Intent(out) :: Lam,Yu(3,3),Yd(3,3),Ye(3,3),Mu

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters61' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
Lam= Cmplx(g(4),g(5),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+6), g(SumI+7), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+24), g(SumI+25), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+42), g(SumI+43), dp) 
End Do 
 End Do 
 
Mu= Cmplx(g(60),g(61),dp) 
Do i1=1,61 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters61

Subroutine ParametersToG61(g1,g2,g3,Lam,Yu,Yd,Ye,Mu,g)

Implicit None 
Real(dp), Intent(out) :: g(61) 
Real(dp), Intent(in) :: g1,g2,g3

Complex(dp), Intent(in) :: Lam,Yu(3,3),Yd(3,3),Ye(3,3),Mu

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG61' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = Real(Lam,dp)  
g(5) = Aimag(Lam)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+6) = Real(Yu(i1,i2), dp) 
g(SumI+7) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+24) = Real(Yd(i1,i2), dp) 
g(SumI+25) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+42) = Real(Ye(i1,i2), dp) 
g(SumI+43) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

g(60) = Real(Mu,dp)  
g(61) = Aimag(Mu)  
Iname = Iname - 1 
 
End Subroutine ParametersToG61

Subroutine rge61(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,Dg3
Complex(dp) :: Lam,betaLam1,betaLam2,DLam,Yu(3,3),betaYu1(3,3),betaYu2(3,3)           & 
& ,DYu(3,3),adjYu(3,3),Yd(3,3),betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3)             & 
& ,Ye(3,3),betaYe1(3,3),betaYe2(3,3),DYe(3,3),adjYe(3,3),Mu,betaMu1,betaMu2,DMu
Complex(dp) :: YdadjYd(3,3),YeadjYe(3,3),YuadjYu(3,3),adjYdYd(3,3),adjYeYe(3,3),adjYuYu(3,3),        & 
& YdadjYdYd(3,3),YdadjYuYu(3,3),YeadjYeYe(3,3),YuadjYdYd(3,3),YuadjYuYu(3,3),            & 
& adjYdYdadjYd(3,3),adjYeYeadjYe(3,3),adjYuYuadjYu(3,3),YdadjYdYdadjYd(3,3),             & 
& YeadjYeYeadjYe(3,3),YuadjYuYuadjYu(3,3)

Complex(dp) :: TrYdadjYd,TrYeadjYe,TrYuadjYu,TrYdadjYdYdadjYd,TrYeadjYeYeadjYe,TrYuadjYuYuadjYu

Real(dp) :: g1p2,g1p3,g1p4,g2p2,g2p3,g2p4,g3p2,g3p3

Complex(dp) :: Lamp2

Iname = Iname +1 
NameOfUnit(Iname) = 'rge61' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters61(gy,g1,g2,g3,Lam,Yu,Yd,Ye,Mu)

Call Adjungate(Yu,adjYu)
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)
 YdadjYd = Matmul(Yd,adjYd) 
Forall(i2=1:3)  YdadjYd(i2,i2) =  Real(YdadjYd(i2,i2),dp) 
 YeadjYe = Matmul(Ye,adjYe) 
Forall(i2=1:3)  YeadjYe(i2,i2) =  Real(YeadjYe(i2,i2),dp) 
 YuadjYu = Matmul(Yu,adjYu) 
Forall(i2=1:3)  YuadjYu(i2,i2) =  Real(YuadjYu(i2,i2),dp) 
 adjYdYd = Matmul(adjYd,Yd) 
Forall(i2=1:3)  adjYdYd(i2,i2) =  Real(adjYdYd(i2,i2),dp) 
 adjYeYe = Matmul(adjYe,Ye) 
Forall(i2=1:3)  adjYeYe(i2,i2) =  Real(adjYeYe(i2,i2),dp) 
 adjYuYu = Matmul(adjYu,Yu) 
Forall(i2=1:3)  adjYuYu(i2,i2) =  Real(adjYuYu(i2,i2),dp) 
 YdadjYdYd = Matmul(Yd,adjYdYd) 
 YdadjYuYu = Matmul(Yd,adjYuYu) 
 YeadjYeYe = Matmul(Ye,adjYeYe) 
 YuadjYdYd = Matmul(Yu,adjYdYd) 
 YuadjYuYu = Matmul(Yu,adjYuYu) 
 adjYdYdadjYd = Matmul(adjYd,YdadjYd) 
 adjYeYeadjYe = Matmul(adjYe,YeadjYe) 
 adjYuYuadjYu = Matmul(adjYu,YuadjYu) 
 YdadjYdYdadjYd = Matmul(Yd,adjYdYdadjYd) 
Forall(i2=1:3)  YdadjYdYdadjYd(i2,i2) =  Real(YdadjYdYdadjYd(i2,i2),dp) 
 YeadjYeYeadjYe = Matmul(Ye,adjYeYeadjYe) 
Forall(i2=1:3)  YeadjYeYeadjYe(i2,i2) =  Real(YeadjYeYeadjYe(i2,i2),dp) 
 YuadjYuYuadjYu = Matmul(Yu,adjYuYuadjYu) 
Forall(i2=1:3)  YuadjYuYuadjYu(i2,i2) =  Real(YuadjYuYuadjYu(i2,i2),dp) 
 TrYdadjYd = Real(cTrace(YdadjYd),dp) 
 TrYeadjYe = Real(cTrace(YeadjYe),dp) 
 TrYuadjYu = Real(cTrace(YuadjYu),dp) 
 TrYdadjYdYdadjYd = Real(cTrace(YdadjYdYdadjYd),dp) 
 TrYeadjYeYeadjYe = Real(cTrace(YeadjYeYeadjYe),dp) 
 TrYuadjYuYuadjYu = Real(cTrace(YuadjYuYuadjYu),dp) 
 g1p2 =g1**2 
 g1p3 =g1**3 
 g1p4 =g1**4 
 g2p2 =g2**2 
 g2p3 =g2**3 
 g2p4 =g2**4 
 g3p2 =g3**2 
 g3p3 =g3**3 
 Lamp2 =Lam**2 


If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = 41._dp*(g1p3)/10._dp

 
 
If (TwoLoopRGE) Then 
betag12 = 0

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = -19._dp*(g2p3)/6._dp

 
 
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
! Lam 
!-------------------- 
 
betaLam1  = 27._dp*(g1p4)/100._dp + (9*g1p2*g2p2)/10._dp + 9._dp*(g2p4)               & 
& /4._dp + 12._dp*(Lamp2) - 12._dp*(TrYdadjYdYdadjYd) - 4._dp*(TrYeadjYeYeadjYe)         & 
&  - 12._dp*(TrYuadjYuYuadjYu) - (9*g1p2*Lam)/5._dp - 9*g2p2*Lam + 12*TrYdadjYd*Lam +    & 
&  4*TrYeadjYe*Lam + 12*TrYuadjYu*Lam

 
 
If (TwoLoopRGE) Then 
betaLam2 = 0

 
DLam = oo16pi2*( betaLam1 + oo16pi2 * betaLam2 ) 

 
Else 
DLam = oo16pi2* betaLam1 
End If 
 
 
Call Chop(DLam) 

!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = (-17._dp*(g1p2)/20._dp - 9._dp*(g2p2)/4._dp - 8._dp*(g3p2) +               & 
&  3._dp*(TrYdadjYd) + TrYeadjYe + 3._dp*(TrYuadjYu))*Yu - (3*(YuadjYdYd -               & 
&  YuadjYuYu))/2._dp

 
 
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
 
betaYd1  = (-((g1p2 + 9._dp*(g2p2) + 32._dp*(g3p2) - 12._dp*(TrYdadjYd)               & 
&  - 4._dp*(TrYeadjYe) - 12._dp*(TrYuadjYu))*Yd) + 6*(YdadjYdYd - YdadjYuYu))/4._dp

 
 
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
 
betaYe1  = (-9._dp*(g1p2)/4._dp - 9._dp*(g2p2)/4._dp + 3._dp*(TrYdadjYd)              & 
&  + TrYeadjYe + 3._dp*(TrYuadjYu))*Ye + 3._dp*(YeadjYeYe)/2._dp

 
 
If (TwoLoopRGE) Then 
betaYe2 = 0

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! Mu 
!-------------------- 
 
betaMu1  = (-9*g1p2*Mu)/10._dp - (9*g2p2*Mu)/2._dp + 6*Mu*TrYdadjYd + 2*Mu*TrYeadjYe +& 
&  6*Mu*TrYuadjYu + 6*Mu*Lam

 
 
If (TwoLoopRGE) Then 
betaMu2 = 0

 
DMu = oo16pi2*( betaMu1 + oo16pi2 * betaMu2 ) 

 
Else 
DMu = oo16pi2* betaMu1 
End If 
 
 
Call Chop(DMu) 

Call ParametersToG61(Dg1,Dg2,Dg3,DLam,DYu,DYd,DYe,DMu,f)

Iname = Iname - 1 
 
End Subroutine rge61  

Subroutine GToParameters62(g,g1,g2,g3,Lam,Yu,Yd,Ye,Mu,v)

Implicit None 
Real(dp), Intent(in) :: g(62) 
Real(dp),Intent(out) :: g1,g2,g3,v

Complex(dp),Intent(out) :: Lam,Yu(3,3),Yd(3,3),Ye(3,3),Mu

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters62' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
Lam= Cmplx(g(4),g(5),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+6), g(SumI+7), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+24), g(SumI+25), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+42), g(SumI+43), dp) 
End Do 
 End Do 
 
Mu= Cmplx(g(60),g(61),dp) 
v= g(62) 
Do i1=1,62 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters62

Subroutine ParametersToG62(g1,g2,g3,Lam,Yu,Yd,Ye,Mu,v,g)

Implicit None 
Real(dp), Intent(out) :: g(62) 
Real(dp), Intent(in) :: g1,g2,g3,v

Complex(dp), Intent(in) :: Lam,Yu(3,3),Yd(3,3),Ye(3,3),Mu

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG62' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = Real(Lam,dp)  
g(5) = Aimag(Lam)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+6) = Real(Yu(i1,i2), dp) 
g(SumI+7) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+24) = Real(Yd(i1,i2), dp) 
g(SumI+25) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+42) = Real(Ye(i1,i2), dp) 
g(SumI+43) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

g(60) = Real(Mu,dp)  
g(61) = Aimag(Mu)  
g(62) = v  
Iname = Iname - 1 
 
End Subroutine ParametersToG62

Subroutine rge62(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,v,betav1,betav2,Dv
Complex(dp) :: Lam,betaLam1,betaLam2,DLam,Yu(3,3),betaYu1(3,3),betaYu2(3,3)           & 
& ,DYu(3,3),adjYu(3,3),Yd(3,3),betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3)             & 
& ,Ye(3,3),betaYe1(3,3),betaYe2(3,3),DYe(3,3),adjYe(3,3),Mu,betaMu1,betaMu2,DMu
Complex(dp) :: YdadjYd(3,3),YeadjYe(3,3),YuadjYu(3,3),adjYdYd(3,3),adjYeYe(3,3),adjYuYu(3,3),        & 
& YdadjYdYd(3,3),YdadjYuYu(3,3),YeadjYeYe(3,3),YuadjYdYd(3,3),YuadjYuYu(3,3),            & 
& adjYdYdadjYd(3,3),adjYeYeadjYe(3,3),adjYuYuadjYu(3,3),YdadjYdYdadjYd(3,3),             & 
& YeadjYeYeadjYe(3,3),YuadjYuYuadjYu(3,3)

Complex(dp) :: TrYdadjYd,TrYeadjYe,TrYuadjYu,TrYdadjYdYdadjYd,TrYeadjYeYeadjYe,TrYuadjYuYuadjYu

Real(dp) :: g1p2,g1p3,g1p4,g2p2,g2p3,g2p4,g3p2,g3p3

Complex(dp) :: Lamp2

Iname = Iname +1 
NameOfUnit(Iname) = 'rge62' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters62(gy,g1,g2,g3,Lam,Yu,Yd,Ye,Mu,v)

Call Adjungate(Yu,adjYu)
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)
 YdadjYd = Matmul(Yd,adjYd) 
Forall(i2=1:3)  YdadjYd(i2,i2) =  Real(YdadjYd(i2,i2),dp) 
 YeadjYe = Matmul(Ye,adjYe) 
Forall(i2=1:3)  YeadjYe(i2,i2) =  Real(YeadjYe(i2,i2),dp) 
 YuadjYu = Matmul(Yu,adjYu) 
Forall(i2=1:3)  YuadjYu(i2,i2) =  Real(YuadjYu(i2,i2),dp) 
 adjYdYd = Matmul(adjYd,Yd) 
Forall(i2=1:3)  adjYdYd(i2,i2) =  Real(adjYdYd(i2,i2),dp) 
 adjYeYe = Matmul(adjYe,Ye) 
Forall(i2=1:3)  adjYeYe(i2,i2) =  Real(adjYeYe(i2,i2),dp) 
 adjYuYu = Matmul(adjYu,Yu) 
Forall(i2=1:3)  adjYuYu(i2,i2) =  Real(adjYuYu(i2,i2),dp) 
 YdadjYdYd = Matmul(Yd,adjYdYd) 
 YdadjYuYu = Matmul(Yd,adjYuYu) 
 YeadjYeYe = Matmul(Ye,adjYeYe) 
 YuadjYdYd = Matmul(Yu,adjYdYd) 
 YuadjYuYu = Matmul(Yu,adjYuYu) 
 adjYdYdadjYd = Matmul(adjYd,YdadjYd) 
 adjYeYeadjYe = Matmul(adjYe,YeadjYe) 
 adjYuYuadjYu = Matmul(adjYu,YuadjYu) 
 YdadjYdYdadjYd = Matmul(Yd,adjYdYdadjYd) 
Forall(i2=1:3)  YdadjYdYdadjYd(i2,i2) =  Real(YdadjYdYdadjYd(i2,i2),dp) 
 YeadjYeYeadjYe = Matmul(Ye,adjYeYeadjYe) 
Forall(i2=1:3)  YeadjYeYeadjYe(i2,i2) =  Real(YeadjYeYeadjYe(i2,i2),dp) 
 YuadjYuYuadjYu = Matmul(Yu,adjYuYuadjYu) 
Forall(i2=1:3)  YuadjYuYuadjYu(i2,i2) =  Real(YuadjYuYuadjYu(i2,i2),dp) 
 TrYdadjYd = Real(cTrace(YdadjYd),dp) 
 TrYeadjYe = Real(cTrace(YeadjYe),dp) 
 TrYuadjYu = Real(cTrace(YuadjYu),dp) 
 TrYdadjYdYdadjYd = Real(cTrace(YdadjYdYdadjYd),dp) 
 TrYeadjYeYeadjYe = Real(cTrace(YeadjYeYeadjYe),dp) 
 TrYuadjYuYuadjYu = Real(cTrace(YuadjYuYuadjYu),dp) 
 g1p2 =g1**2 
 g1p3 =g1**3 
 g1p4 =g1**4 
 g2p2 =g2**2 
 g2p3 =g2**3 
 g2p4 =g2**4 
 g3p2 =g3**2 
 g3p3 =g3**3 
 Lamp2 =Lam**2 


If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = 41._dp*(g1p3)/10._dp

 
 
If (TwoLoopRGE) Then 
betag12 = 0

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = -19._dp*(g2p3)/6._dp

 
 
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
! Lam 
!-------------------- 
 
betaLam1  = 27._dp*(g1p4)/100._dp + (9*g1p2*g2p2)/10._dp + 9._dp*(g2p4)               & 
& /4._dp + 12._dp*(Lamp2) - 12._dp*(TrYdadjYdYdadjYd) - 4._dp*(TrYeadjYeYeadjYe)         & 
&  - 12._dp*(TrYuadjYuYuadjYu) - (9*g1p2*Lam)/5._dp - 9*g2p2*Lam + 12*TrYdadjYd*Lam +    & 
&  4*TrYeadjYe*Lam + 12*TrYuadjYu*Lam

 
 
If (TwoLoopRGE) Then 
betaLam2 = 0

 
DLam = oo16pi2*( betaLam1 + oo16pi2 * betaLam2 ) 

 
Else 
DLam = oo16pi2* betaLam1 
End If 
 
 
Call Chop(DLam) 

!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = (-17._dp*(g1p2)/20._dp - 9._dp*(g2p2)/4._dp - 8._dp*(g3p2) +               & 
&  3._dp*(TrYdadjYd) + TrYeadjYe + 3._dp*(TrYuadjYu))*Yu - (3*(YuadjYdYd -               & 
&  YuadjYuYu))/2._dp

 
 
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
 
betaYd1  = (-((g1p2 + 9._dp*(g2p2) + 32._dp*(g3p2) - 12._dp*(TrYdadjYd)               & 
&  - 4._dp*(TrYeadjYe) - 12._dp*(TrYuadjYu))*Yd) + 6*(YdadjYdYd - YdadjYuYu))/4._dp

 
 
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
 
betaYe1  = (-9._dp*(g1p2)/4._dp - 9._dp*(g2p2)/4._dp + 3._dp*(TrYdadjYd)              & 
&  + TrYeadjYe + 3._dp*(TrYuadjYu))*Ye + 3._dp*(YeadjYeYe)/2._dp

 
 
If (TwoLoopRGE) Then 
betaYe2 = 0

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! Mu 
!-------------------- 
 
betaMu1  = (-9*g1p2*Mu)/10._dp - (9*g2p2*Mu)/2._dp + 6*Mu*TrYdadjYd + 2*Mu*TrYeadjYe +& 
&  6*Mu*TrYuadjYu + 6*Mu*Lam

 
 
If (TwoLoopRGE) Then 
betaMu2 = 0

 
DMu = oo16pi2*( betaMu1 + oo16pi2 * betaMu2 ) 

 
Else 
DMu = oo16pi2* betaMu1 
End If 
 
 
Call Chop(DMu) 

!-------------------- 
! v 
!-------------------- 
 
betav1  = (v*(9._dp*(g1p2) + 45._dp*(g2p2) - 60._dp*(TrYdadjYd) - 20._dp*(TrYeadjYe)  & 
&  - 60._dp*(TrYuadjYu) + 3*g1p2*Xi + 15*g2p2*Xi))/20._dp

 
 
If (TwoLoopRGE) Then 
betav2 = 0

 
Dv = oo16pi2*( betav1 + oo16pi2 * betav2 ) 

 
Else 
Dv = oo16pi2* betav1 
End If 
 
 
Call ParametersToG62(Dg1,Dg2,Dg3,DLam,DYu,DYd,DYe,DMu,Dv,f)

Iname = Iname - 1 
 
End Subroutine rge62  

End Module RGEs_SM 
 
