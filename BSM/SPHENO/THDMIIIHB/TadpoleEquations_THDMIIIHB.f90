! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 12:29 on 22.10.2017   
! ----------------------------------------------------------------------  
 
 
Module Tadpoles_THDMIIIHB 
 
Use Model_Data_THDMIIIHB 
Use TreeLevelMasses_THDMIIIHB 
Use RGEs_THDMIIIHB 
Use Control 
Use Settings 
Use Mathematics 

Contains 


Subroutine SolveTadpoleEquations(g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,              & 
& Lam2,epYU,Yu,Yd,Ye,epYD,epYE,M12,M112,M222,vd,vu,Tad1Loop)

Implicit None
Real(dp),Intent(inout) :: g1,g2,g3,vd,vu

Complex(dp),Intent(inout) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU(3,3),Yu(3,3),Yd(3,3),Ye(3,3),epYD(3,3),       & 
& epYE(3,3),M12,M112,M222

Complex(dp), Intent(in) :: Tad1Loop(2)

! For numerical routines 
Real(dp) :: gC(133)
logical :: broycheck 
Real(dp) :: broyx(2)

If (HighScaleModel.Eq."LOW") Then 
M112 = -(2*Lam1*vd**3 - 2*M12*vu + 3*Lam6*vd**2*vu + 2*Lam3*vd*vu**2 + 2*Lam4*vd*vu**2 +     & 
&  Lam5*vd*vu**2 + Lam7*vu**3 + vd*vu**2*Conjg(Lam5) + 3*vd**2*vu*Conjg(Lam6) +          & 
&  vu**3*Conjg(Lam7) - 2*vu*Conjg(M12) - 4*Tad1Loop(1))/(4._dp*vd)
M222 = -(-2*M12*vd + Lam6*vd**3 + 2*Lam3*vd**2*vu + 2*Lam4*vd**2*vu + Lam5*vd**2*vu +        & 
&  3*Lam7*vd*vu**2 + 2*Lam2*vu**3 + vd**2*vu*Conjg(Lam5) + vd**3*Conjg(Lam6) +           & 
&  3*vd*vu**2*Conjg(Lam7) - 2*vd*Conjg(M12) - 4*Tad1Loop(2))/(4._dp*vu)

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (Real(M112,dp).ne.Real(M112,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for M112" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(M112)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for M112" 
   !Call TerminateProgram  
   M112 = Real(M112,dp) 
  SignOfMuChanged= .True. 
End If 
 If (Real(M222,dp).ne.Real(M222,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for M222" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(M222)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for M222" 
   !Call TerminateProgram  
   M222 = Real(M222,dp) 
  SignOfMuChanged= .True. 
End If 
 Else 
M112 = -(2*Lam1*vd**3 - 2*M12*vu + 3*Lam6*vd**2*vu + 2*Lam3*vd*vu**2 + 2*Lam4*vd*vu**2 +     & 
&  Lam5*vd*vu**2 + Lam7*vu**3 + vd*vu**2*Conjg(Lam5) + 3*vd**2*vu*Conjg(Lam6) +          & 
&  vu**3*Conjg(Lam7) - 2*vu*Conjg(M12) - 4*Tad1Loop(1))/(4._dp*vd)
M222 = -(-2*M12*vd + Lam6*vd**3 + 2*Lam3*vd**2*vu + 2*Lam4*vd**2*vu + Lam5*vd**2*vu +        & 
&  3*Lam7*vd*vu**2 + 2*Lam2*vu**3 + vd**2*vu*Conjg(Lam5) + vd**3*Conjg(Lam6) +           & 
&  3*vd*vu**2*Conjg(Lam7) - 2*vd*Conjg(M12) - 4*Tad1Loop(2))/(4._dp*vu)

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (Real(M112,dp).ne.Real(M112,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for M112" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(M112)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for M112" 
   !Call TerminateProgram  
   M112 = Real(M112,dp) 
  SignOfMuChanged= .True. 
End If 
 If (Real(M222,dp).ne.Real(M222,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for M222" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(M222)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for M222" 
   !Call TerminateProgram  
   M222 = Real(M222,dp) 
  SignOfMuChanged= .True. 
End If 
 End if 
End Subroutine SolveTadpoleEquations

Subroutine CalculateTadpoles(g1,g2,g3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,             & 
& epYU,Yu,Yd,Ye,epYD,epYE,M12,M112,M222,vd,vu,Tad1Loop,TadpoleValues)

Real(dp),Intent(in) :: g1,g2,g3,vd,vu

Complex(dp),Intent(in) :: Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,epYU(3,3),Yu(3,3),Yd(3,3),Ye(3,3),epYD(3,3),       & 
& epYE(3,3),M12,M112,M222

Complex(dp), Intent(in) :: Tad1Loop(2)

Real(dp), Intent(out) :: TadpoleValues(2)

TadpoleValues(1) = Real((2*Lam1*vd**3 + vd*(4._dp*(M112) + vu**2*(2._dp*(Lam3)        & 
&  + 2._dp*(Lam4) + Lam5 + Conjg(Lam5))) + 3*vd**2*vu*(Lam6 + Conjg(Lam6))               & 
&  + vu*(-2._dp*(M12) + vu**2*(Lam7 + Conjg(Lam7)) - 2*Conjg(M12)))/4._dp - Tad1Loop(1),dp) 
TadpoleValues(2) = Real((4*M222*vu + 2*Lam2*vu**3 + vd**2*vu*(2._dp*(Lam3)            & 
&  + 2._dp*(Lam4) + Lam5 + Conjg(Lam5)) + vd**3*(Lam6 + Conjg(Lam6)) + vd*(-2._dp*(M12)  & 
&  + 3*vu**2*(Lam7 + Conjg(Lam7)) - 2*Conjg(M12)))/4._dp - Tad1Loop(2),dp) 
End Subroutine CalculateTadpoles 

End Module Tadpoles_THDMIIIHB 
 
