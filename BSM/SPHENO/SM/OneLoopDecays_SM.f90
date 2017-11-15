! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 10:00 on 15.11.2017   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecays_SM 
Use Couplings_SM 
Use CouplingsCT_SM 
Use Model_Data_SM 
Use LoopCouplings_SM 
Use LoopMasses_SM 
Use RGEs_SM 
Use Tadpoles_SM 
Use Kinematics 
Use CouplingsForDecays_SM 
 
Use Wrapper_OneLoopDecay_Fu_SM 
Use Wrapper_OneLoopDecay_Fe_SM 
Use Wrapper_OneLoopDecay_Fd_SM 
Use Wrapper_OneLoopDecay_hh_SM 

 
Contains 
 
Subroutine getZCouplings(Lam,v,g1,g2,TW,g3,Yd,ZDL,ZDR,Ye,ZEL,ZER,Yu,ZUL,              & 
& ZUR,cplAhAhhh,cplhhhhhh,cplhhHpcHp,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,               & 
& cplhhhhhhhh,cplhhhhHpcHp,cplHpHpcHpcHp,cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,              & 
& cplhhHpcVWp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplhhcVWpVWp,cplhhVZVZ,cplHpcVWpVP,      & 
& cplHpcVWpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhHpcVWpVP,          & 
& cplAhHpcVWpVZ,cplAhcHpVPVWp,cplAhcHpVWpVZ,cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhHpcVWpVP,    & 
& cplhhHpcVWpVZ,cplhhcHpVPVWp,cplhhcHpVWpVZ,cplHpcHpVPVP,cplHpcHpVPVZ,cplHpcHpcVWpVWp,   & 
& cplHpcHpVZVZ,cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFdFdhhL,cplcFdFdhhR,               & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,           & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFvFeVWpL,cplcFvFeVWpR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFvFvVZL,cplcFvFvVZR,           & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWpVPVPVWp1,    & 
& cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,       & 
& cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpVWpVZVZ1,              & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcgGgGVG,cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWpVP,    & 
& cplcgWpgWpVZ,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWCVP,cplcgAgWCVWp,cplcgZgWCVWp,       & 
& cplcgWCgWCVZ,cplcgWpgZVWp,cplcgWCgZcVWp,cplcgWpgWpAh,cplcgWCgWCAh,cplcgZgAhh,          & 
& cplcgWpgAHp,cplcgWCgAcHp,cplcgWpgWphh,cplcgZgWpcHp,cplcgWCgWChh,cplcgZgWCHp,           & 
& cplcgZgZhh,cplcgWpgZHp,cplcgWCgZcHp,ZRUVd,ZRUUd,ZRUVu,ZRUUu,ZRUVe,ZRUUe,               & 
& ZcplAhAhhh,Zcplhhhhhh,ZcplhhHpcHp,ZcplAhAhAhAh,ZcplAhAhhhhh,ZcplAhAhHpcHp,             & 
& Zcplhhhhhhhh,ZcplhhhhHpcHp,ZcplHpHpcHpcHp,ZcplAhhhVZ,ZcplAhHpcVWp,ZcplAhcHpVWp,        & 
& ZcplhhHpcVWp,ZcplhhcHpVWp,ZcplHpcHpVP,ZcplHpcHpVZ,ZcplhhcVWpVWp,ZcplhhVZVZ,            & 
& ZcplHpcVWpVP,ZcplHpcVWpVZ,ZcplcHpVPVWp,ZcplcHpVWpVZ,ZcplAhAhcVWpVWp,ZcplAhAhVZVZ,      & 
& ZcplAhHpcVWpVP,ZcplAhHpcVWpVZ,ZcplAhcHpVPVWp,ZcplAhcHpVWpVZ,ZcplhhhhcVWpVWp,           & 
& ZcplhhhhVZVZ,ZcplhhHpcVWpVP,ZcplhhHpcVWpVZ,ZcplhhcHpVPVWp,ZcplhhcHpVWpVZ,              & 
& ZcplHpcHpVPVP,ZcplHpcHpVPVZ,ZcplHpcHpcVWpVWp,ZcplHpcHpVZVZ,ZcplVGVGVG,ZcplcVWpVPVWp,   & 
& ZcplcVWpVWpVZ,ZcplcFdFdAhL,ZcplcFdFdAhR,ZcplcFeFeAhL,ZcplcFeFeAhR,ZcplcFuFuAhL,        & 
& ZcplcFuFuAhR,ZcplcFdFdhhL,ZcplcFdFdhhR,ZcplcFuFdHpL,ZcplcFuFdHpR,ZcplcFeFehhL,         & 
& ZcplcFeFehhR,ZcplcFvFeHpL,ZcplcFvFeHpR,ZcplcFuFuhhL,ZcplcFuFuhhR,ZcplcFdFucHpL,        & 
& ZcplcFdFucHpR,ZcplcFeFvcHpL,ZcplcFeFvcHpR,ZcplcFdFdVGL,ZcplcFdFdVGR,ZcplcFdFdVPL,      & 
& ZcplcFdFdVPR,ZcplcFuFdVWpL,ZcplcFuFdVWpR,ZcplcFdFdVZL,ZcplcFdFdVZR,ZcplcFeFeVPL,       & 
& ZcplcFeFeVPR,ZcplcFvFeVWpL,ZcplcFvFeVWpR,ZcplcFeFeVZL,ZcplcFeFeVZR,ZcplcFuFuVGL,       & 
& ZcplcFuFuVGR,ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplcFuFuVZL,ZcplcFuFuVZR,ZcplcFdFucVWpL,       & 
& ZcplcFdFucVWpR,ZcplcFvFvVZL,ZcplcFvFvVZR,ZcplcFeFvcVWpL,ZcplcFeFvcVWpR,ZcplVGVGVGVG1,  & 
& ZcplVGVGVGVG2,ZcplVGVGVGVG3,ZcplcVWpVPVPVWp1,ZcplcVWpVPVPVWp2,ZcplcVWpVPVPVWp3,        & 
& ZcplcVWpVPVWpVZ1,ZcplcVWpVPVWpVZ2,ZcplcVWpVPVWpVZ3,ZcplcVWpcVWpVWpVWp1,ZcplcVWpcVWpVWpVWp2,& 
& ZcplcVWpcVWpVWpVWp3,ZcplcVWpVWpVZVZ1,ZcplcVWpVWpVZVZ2,ZcplcVWpVWpVZVZ3,ZcplcgGgGVG,    & 
& ZcplcgWpgAVWp,ZcplcgWCgAcVWp,ZcplcgWpgWpVP,ZcplcgWpgWpVZ,ZcplcgAgWpcVWp,               & 
& ZcplcgZgWpcVWp,ZcplcgWCgWCVP,ZcplcgAgWCVWp,ZcplcgZgWCVWp,ZcplcgWCgWCVZ,ZcplcgWpgZVWp,  & 
& ZcplcgWCgZcVWp,ZcplcgWpgWpAh,ZcplcgWCgWCAh,ZcplcgZgAhh,ZcplcgWpgAHp,ZcplcgWCgAcHp,     & 
& ZcplcgWpgWphh,ZcplcgZgWpcHp,ZcplcgWCgWChh,ZcplcgZgWCHp,ZcplcgZgZhh,ZcplcgWpgZHp,       & 
& ZcplcgWCgZcHp)

Implicit None

Real(dp), Intent(in) :: v,g1,g2,TW,g3

Complex(dp), Intent(in) :: Lam,Yd(3,3),ZDL(3,3),ZDR(3,3),Ye(3,3),ZEL(3,3),ZER(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(in) :: cplAhAhhh,cplhhhhhh,cplhhHpcHp,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,cplhhhhhhhh,      & 
& cplhhhhHpcHp,cplHpHpcHpcHp,cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cplhhHpcVWp,              & 
& cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplhhcVWpVWp,cplhhVZVZ,cplHpcVWpVP,cplHpcVWpVZ,      & 
& cplcHpVPVWp,cplcHpVWpVZ,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhHpcVWpVP,cplAhHpcVWpVZ,        & 
& cplAhcHpVPVWp,cplAhcHpVWpVZ,cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhHpcVWpVP,cplhhHpcVWpVZ,    & 
& cplhhcHpVPVWp,cplhhcHpVWpVZ,cplHpcHpVPVP,cplHpcHpVPVZ,cplHpcHpcVWpVWp,cplHpcHpVZVZ,    & 
& cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),& 
& cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),  & 
& cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFvFeHpL(3,3),  & 
& cplcFvFeHpR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),& 
& cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),& 
& cplcFdFdVPR(3,3),cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),& 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFvFeVWpL(3,3),cplcFvFeVWpR(3,3),cplcFeFeVZL(3,3),& 
& cplcFeFeVZR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),  & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),               & 
& cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),               & 
& cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,& 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2, & 
& cplcVWpcVWpVWpVWp3,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcgGgGVG,         & 
& cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgAgWpcVWp,cplcgZgWpcVWp,      & 
& cplcgWCgWCVP,cplcgAgWCVWp,cplcgZgWCVWp,cplcgWCgWCVZ,cplcgWpgZVWp,cplcgWCgZcVWp,        & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplcgZgAhh,cplcgWpgAHp,cplcgWCgAcHp,cplcgWpgWphh,            & 
& cplcgZgWpcHp,cplcgWCgWChh,cplcgZgWCHp,cplcgZgZhh,cplcgWpgZHp,cplcgWCgZcHp

Complex(dp), Intent(in) :: ZRUVd(3,3),ZRUUd(3,3),ZRUVu(3,3),ZRUUu(3,3),ZRUVe(3,3),ZRUUe(3,3)

Integer :: gt1, gt2
Complex(dp) :: TempcplAhAhhh,Tempcplhhhhhh,TempcplhhHpcHp,TempcplAhAhAhAh,TempcplAhAhhhhh,           & 
& TempcplAhAhHpcHp,Tempcplhhhhhhhh,TempcplhhhhHpcHp,TempcplHpHpcHpcHp,TempcplAhhhVZ,     & 
& TempcplAhHpcVWp,TempcplAhcHpVWp,TempcplhhHpcVWp,TempcplhhcHpVWp,TempcplHpcHpVP,        & 
& TempcplHpcHpVZ,TempcplhhcVWpVWp,TempcplhhVZVZ,TempcplHpcVWpVP,TempcplHpcVWpVZ,         & 
& TempcplcHpVPVWp,TempcplcHpVWpVZ,TempcplAhAhcVWpVWp,TempcplAhAhVZVZ,TempcplAhHpcVWpVP,  & 
& TempcplAhHpcVWpVZ,TempcplAhcHpVPVWp,TempcplAhcHpVWpVZ,TempcplhhhhcVWpVWp,              & 
& TempcplhhhhVZVZ,TempcplhhHpcVWpVP,TempcplhhHpcVWpVZ,TempcplhhcHpVPVWp,TempcplhhcHpVWpVZ,& 
& TempcplHpcHpVPVP,TempcplHpcHpVPVZ,TempcplHpcHpcVWpVWp,TempcplHpcHpVZVZ,TempcplVGVGVG,  & 
& TempcplcVWpVPVWp,TempcplcVWpVWpVZ,TempcplcFdFdAhL(3,3),TempcplcFdFdAhR(3,3),           & 
& TempcplcFeFeAhL(3,3),TempcplcFeFeAhR(3,3),TempcplcFuFuAhL(3,3),TempcplcFuFuAhR(3,3),   & 
& TempcplcFdFdhhL(3,3),TempcplcFdFdhhR(3,3),TempcplcFuFdHpL(3,3),TempcplcFuFdHpR(3,3),   & 
& TempcplcFeFehhL(3,3),TempcplcFeFehhR(3,3),TempcplcFvFeHpL(3,3),TempcplcFvFeHpR(3,3),   & 
& TempcplcFuFuhhL(3,3),TempcplcFuFuhhR(3,3),TempcplcFdFucHpL(3,3),TempcplcFdFucHpR(3,3), & 
& TempcplcFeFvcHpL(3,3),TempcplcFeFvcHpR(3,3),TempcplcFdFdVGL(3,3),TempcplcFdFdVGR(3,3), & 
& TempcplcFdFdVPL(3,3),TempcplcFdFdVPR(3,3),TempcplcFuFdVWpL(3,3),TempcplcFuFdVWpR(3,3), & 
& TempcplcFdFdVZL(3,3),TempcplcFdFdVZR(3,3),TempcplcFeFeVPL(3,3),TempcplcFeFeVPR(3,3),   & 
& TempcplcFvFeVWpL(3,3),TempcplcFvFeVWpR(3,3),TempcplcFeFeVZL(3,3),TempcplcFeFeVZR(3,3), & 
& TempcplcFuFuVGL(3,3),TempcplcFuFuVGR(3,3),TempcplcFuFuVPL(3,3),TempcplcFuFuVPR(3,3),   & 
& TempcplcFuFuVZL(3,3),TempcplcFuFuVZR(3,3),TempcplcFdFucVWpL(3,3),TempcplcFdFucVWpR(3,3),& 
& TempcplcFvFvVZL(3,3),TempcplcFvFvVZR(3,3),TempcplcFeFvcVWpL(3,3),TempcplcFeFvcVWpR(3,3),& 
& TempcplVGVGVGVG1,TempcplVGVGVGVG2,TempcplVGVGVGVG3,TempcplcVWpVPVPVWp1,TempcplcVWpVPVPVWp2,& 
& TempcplcVWpVPVPVWp3,TempcplcVWpVPVWpVZ1,TempcplcVWpVPVWpVZ2,TempcplcVWpVPVWpVZ3,       & 
& TempcplcVWpcVWpVWpVWp1,TempcplcVWpcVWpVWpVWp2,TempcplcVWpcVWpVWpVWp3,TempcplcVWpVWpVZVZ1,& 
& TempcplcVWpVWpVZVZ2,TempcplcVWpVWpVZVZ3,TempcplcgGgGVG,TempcplcgWpgAVWp,               & 
& TempcplcgWCgAcVWp,TempcplcgWpgWpVP,TempcplcgWpgWpVZ,TempcplcgAgWpcVWp,TempcplcgZgWpcVWp,& 
& TempcplcgWCgWCVP,TempcplcgAgWCVWp,TempcplcgZgWCVWp,TempcplcgWCgWCVZ,TempcplcgWpgZVWp,  & 
& TempcplcgWCgZcVWp,TempcplcgWpgWpAh,TempcplcgWCgWCAh,TempcplcgZgAhh,TempcplcgWpgAHp,    & 
& TempcplcgWCgAcHp,TempcplcgWpgWphh,TempcplcgZgWpcHp,TempcplcgWCgWChh,TempcplcgZgWCHp,   & 
& TempcplcgZgZhh,TempcplcgWpgZHp,TempcplcgWCgZcHp

Complex(dp), Intent(out) :: ZcplAhAhhh,Zcplhhhhhh,ZcplhhHpcHp,ZcplAhAhAhAh,ZcplAhAhhhhh,ZcplAhAhHpcHp,            & 
& Zcplhhhhhhhh,ZcplhhhhHpcHp,ZcplHpHpcHpcHp,ZcplAhhhVZ,ZcplAhHpcVWp,ZcplAhcHpVWp,        & 
& ZcplhhHpcVWp,ZcplhhcHpVWp,ZcplHpcHpVP,ZcplHpcHpVZ,ZcplhhcVWpVWp,ZcplhhVZVZ,            & 
& ZcplHpcVWpVP,ZcplHpcVWpVZ,ZcplcHpVPVWp,ZcplcHpVWpVZ,ZcplAhAhcVWpVWp,ZcplAhAhVZVZ,      & 
& ZcplAhHpcVWpVP,ZcplAhHpcVWpVZ,ZcplAhcHpVPVWp,ZcplAhcHpVWpVZ,ZcplhhhhcVWpVWp,           & 
& ZcplhhhhVZVZ,ZcplhhHpcVWpVP,ZcplhhHpcVWpVZ,ZcplhhcHpVPVWp,ZcplhhcHpVWpVZ,              & 
& ZcplHpcHpVPVP,ZcplHpcHpVPVZ,ZcplHpcHpcVWpVWp,ZcplHpcHpVZVZ,ZcplVGVGVG,ZcplcVWpVPVWp,   & 
& ZcplcVWpVWpVZ,ZcplcFdFdAhL(3,3),ZcplcFdFdAhR(3,3),ZcplcFeFeAhL(3,3),ZcplcFeFeAhR(3,3), & 
& ZcplcFuFuAhL(3,3),ZcplcFuFuAhR(3,3),ZcplcFdFdhhL(3,3),ZcplcFdFdhhR(3,3),               & 
& ZcplcFuFdHpL(3,3),ZcplcFuFdHpR(3,3),ZcplcFeFehhL(3,3),ZcplcFeFehhR(3,3),               & 
& ZcplcFvFeHpL(3,3),ZcplcFvFeHpR(3,3),ZcplcFuFuhhL(3,3),ZcplcFuFuhhR(3,3),               & 
& ZcplcFdFucHpL(3,3),ZcplcFdFucHpR(3,3),ZcplcFeFvcHpL(3,3),ZcplcFeFvcHpR(3,3),           & 
& ZcplcFdFdVGL(3,3),ZcplcFdFdVGR(3,3),ZcplcFdFdVPL(3,3),ZcplcFdFdVPR(3,3),               & 
& ZcplcFuFdVWpL(3,3),ZcplcFuFdVWpR(3,3),ZcplcFdFdVZL(3,3),ZcplcFdFdVZR(3,3),             & 
& ZcplcFeFeVPL(3,3),ZcplcFeFeVPR(3,3),ZcplcFvFeVWpL(3,3),ZcplcFvFeVWpR(3,3),             & 
& ZcplcFeFeVZL(3,3),ZcplcFeFeVZR(3,3),ZcplcFuFuVGL(3,3),ZcplcFuFuVGR(3,3),               & 
& ZcplcFuFuVPL(3,3),ZcplcFuFuVPR(3,3),ZcplcFuFuVZL(3,3),ZcplcFuFuVZR(3,3),               & 
& ZcplcFdFucVWpL(3,3),ZcplcFdFucVWpR(3,3),ZcplcFvFvVZL(3,3),ZcplcFvFvVZR(3,3),           & 
& ZcplcFeFvcVWpL(3,3),ZcplcFeFvcVWpR(3,3),ZcplVGVGVGVG1,ZcplVGVGVGVG2,ZcplVGVGVGVG3,     & 
& ZcplcVWpVPVPVWp1,ZcplcVWpVPVPVWp2,ZcplcVWpVPVPVWp3,ZcplcVWpVPVWpVZ1,ZcplcVWpVPVWpVZ2,  & 
& ZcplcVWpVPVWpVZ3,ZcplcVWpcVWpVWpVWp1,ZcplcVWpcVWpVWpVWp2,ZcplcVWpcVWpVWpVWp3,          & 
& ZcplcVWpVWpVZVZ1,ZcplcVWpVWpVZVZ2,ZcplcVWpVWpVZVZ3,ZcplcgGgGVG,ZcplcgWpgAVWp,          & 
& ZcplcgWCgAcVWp,ZcplcgWpgWpVP,ZcplcgWpgWpVZ,ZcplcgAgWpcVWp,ZcplcgZgWpcVWp,              & 
& ZcplcgWCgWCVP,ZcplcgAgWCVWp,ZcplcgZgWCVWp,ZcplcgWCgWCVZ,ZcplcgWpgZVWp,ZcplcgWCgZcVWp,  & 
& ZcplcgWpgWpAh,ZcplcgWCgWCAh,ZcplcgZgAhh,ZcplcgWpgAHp,ZcplcgWCgAcHp,ZcplcgWpgWphh,      & 
& ZcplcgZgWpcHp,ZcplcgWCgWChh,ZcplcgZgWCHp,ZcplcgZgZhh,ZcplcgWpgZHp,ZcplcgWCgZcHp

Complex(dp) :: ZRUVdc(3, 3) 
Complex(dp) :: ZRUUdc(3, 3) 
Complex(dp) :: ZRUVuc(3, 3) 
Complex(dp) :: ZRUUuc(3, 3) 
Complex(dp) :: ZRUVec(3, 3) 
Complex(dp) :: ZRUUec(3, 3) 
ZRUVdc = Conjg(ZRUVd)
ZRUUdc = Conjg(ZRUUd)
ZRUVuc = Conjg(ZRUVu)
ZRUUuc = Conjg(ZRUUu)
ZRUVec = Conjg(ZRUVe)
ZRUUec = Conjg(ZRUUe)


 ! ## ZcplAhAhhh ## 
ZcplAhAhhh = 0._dp 
TempcplAhAhhh = cplAhAhhh 
ZcplAhAhhh = TempcplAhAhhh 


 ! ## Zcplhhhhhh ## 
Zcplhhhhhh = 0._dp 
Tempcplhhhhhh = cplhhhhhh 
Zcplhhhhhh = Tempcplhhhhhh 


 ! ## ZcplhhHpcHp ## 
ZcplhhHpcHp = 0._dp 
TempcplhhHpcHp = cplhhHpcHp 
ZcplhhHpcHp = TempcplhhHpcHp 


 ! ## ZcplAhAhAhAh ## 
ZcplAhAhAhAh = 0._dp 


 ! ## ZcplAhAhhhhh ## 
ZcplAhAhhhhh = 0._dp 


 ! ## ZcplAhAhHpcHp ## 
ZcplAhAhHpcHp = 0._dp 


 ! ## Zcplhhhhhhhh ## 
Zcplhhhhhhhh = 0._dp 


 ! ## ZcplhhhhHpcHp ## 
ZcplhhhhHpcHp = 0._dp 


 ! ## ZcplHpHpcHpcHp ## 
ZcplHpHpcHpcHp = 0._dp 


 ! ## ZcplAhhhVZ ## 
ZcplAhhhVZ = 0._dp 
TempcplAhhhVZ = cplAhhhVZ 
ZcplAhhhVZ = TempcplAhhhVZ 


 ! ## ZcplAhHpcVWp ## 
ZcplAhHpcVWp = 0._dp 
TempcplAhHpcVWp = cplAhHpcVWp 
ZcplAhHpcVWp = TempcplAhHpcVWp 


 ! ## ZcplAhcHpVWp ## 
ZcplAhcHpVWp = 0._dp 
TempcplAhcHpVWp = cplAhcHpVWp 
ZcplAhcHpVWp = TempcplAhcHpVWp 


 ! ## ZcplhhHpcVWp ## 
ZcplhhHpcVWp = 0._dp 
TempcplhhHpcVWp = cplhhHpcVWp 
ZcplhhHpcVWp = TempcplhhHpcVWp 


 ! ## ZcplhhcHpVWp ## 
ZcplhhcHpVWp = 0._dp 
TempcplhhcHpVWp = cplhhcHpVWp 
ZcplhhcHpVWp = TempcplhhcHpVWp 


 ! ## ZcplHpcHpVP ## 
ZcplHpcHpVP = 0._dp 
TempcplHpcHpVP = cplHpcHpVP 
ZcplHpcHpVP = TempcplHpcHpVP 


 ! ## ZcplHpcHpVZ ## 
ZcplHpcHpVZ = 0._dp 
TempcplHpcHpVZ = cplHpcHpVZ 
ZcplHpcHpVZ = TempcplHpcHpVZ 


 ! ## ZcplhhcVWpVWp ## 
ZcplhhcVWpVWp = 0._dp 
TempcplhhcVWpVWp = cplhhcVWpVWp 
ZcplhhcVWpVWp = TempcplhhcVWpVWp 


 ! ## ZcplhhVZVZ ## 
ZcplhhVZVZ = 0._dp 
TempcplhhVZVZ = cplhhVZVZ 
ZcplhhVZVZ = TempcplhhVZVZ 


 ! ## ZcplHpcVWpVP ## 
ZcplHpcVWpVP = 0._dp 
TempcplHpcVWpVP = cplHpcVWpVP 
ZcplHpcVWpVP = TempcplHpcVWpVP 


 ! ## ZcplHpcVWpVZ ## 
ZcplHpcVWpVZ = 0._dp 
TempcplHpcVWpVZ = cplHpcVWpVZ 
ZcplHpcVWpVZ = TempcplHpcVWpVZ 


 ! ## ZcplcHpVPVWp ## 
ZcplcHpVPVWp = 0._dp 
TempcplcHpVPVWp = cplcHpVPVWp 
ZcplcHpVPVWp = TempcplcHpVPVWp 


 ! ## ZcplcHpVWpVZ ## 
ZcplcHpVWpVZ = 0._dp 
TempcplcHpVWpVZ = cplcHpVWpVZ 
ZcplcHpVWpVZ = TempcplcHpVWpVZ 


 ! ## ZcplAhAhcVWpVWp ## 
ZcplAhAhcVWpVWp = 0._dp 


 ! ## ZcplAhAhVZVZ ## 
ZcplAhAhVZVZ = 0._dp 


 ! ## ZcplAhHpcVWpVP ## 
ZcplAhHpcVWpVP = 0._dp 


 ! ## ZcplAhHpcVWpVZ ## 
ZcplAhHpcVWpVZ = 0._dp 


 ! ## ZcplAhcHpVPVWp ## 
ZcplAhcHpVPVWp = 0._dp 


 ! ## ZcplAhcHpVWpVZ ## 
ZcplAhcHpVWpVZ = 0._dp 


 ! ## ZcplhhhhcVWpVWp ## 
ZcplhhhhcVWpVWp = 0._dp 


 ! ## ZcplhhhhVZVZ ## 
ZcplhhhhVZVZ = 0._dp 


 ! ## ZcplhhHpcVWpVP ## 
ZcplhhHpcVWpVP = 0._dp 


 ! ## ZcplhhHpcVWpVZ ## 
ZcplhhHpcVWpVZ = 0._dp 


 ! ## ZcplhhcHpVPVWp ## 
ZcplhhcHpVPVWp = 0._dp 


 ! ## ZcplhhcHpVWpVZ ## 
ZcplhhcHpVWpVZ = 0._dp 


 ! ## ZcplHpcHpVPVP ## 
ZcplHpcHpVPVP = 0._dp 


 ! ## ZcplHpcHpVPVZ ## 
ZcplHpcHpVPVZ = 0._dp 


 ! ## ZcplHpcHpcVWpVWp ## 
ZcplHpcHpcVWpVWp = 0._dp 


 ! ## ZcplHpcHpVZVZ ## 
ZcplHpcHpVZVZ = 0._dp 


 ! ## ZcplVGVGVG ## 
ZcplVGVGVG = 0._dp 
TempcplVGVGVG = cplVGVGVG 
ZcplVGVGVG = TempcplVGVGVG 


 ! ## ZcplcVWpVPVWp ## 
ZcplcVWpVPVWp = 0._dp 
TempcplcVWpVPVWp = cplcVWpVPVWp 
ZcplcVWpVPVWp = TempcplcVWpVPVWp 


 ! ## ZcplcVWpVWpVZ ## 
ZcplcVWpVWpVZ = 0._dp 
TempcplcVWpVWpVZ = cplcVWpVWpVZ 
ZcplcVWpVWpVZ = TempcplcVWpVWpVZ 


 ! ## ZcplcFdFdAhL ## 
ZcplcFdFdAhL = 0._dp 
TempcplcFdFdAhL = cplcFdFdAhL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdAhL(gt2,:) = ZcplcFdFdAhL(gt2,:) + ZRUUd(gt2,gt1)*TempcplcFdFdAhL(gt1,:) 
 End Do 
End Do 
TempcplcFdFdAhL = ZcplcFdFdAhL 
ZcplcFdFdAhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdAhL(:,gt2) = ZcplcFdFdAhL(:,gt2) + ZRUVd(gt2,gt1)*TempcplcFdFdAhL(:,gt1) 
 End Do 
End Do 
TempcplcFdFdAhL = ZcplcFdFdAhL 


 ! ## ZcplcFdFdAhR ## 
ZcplcFdFdAhR = 0._dp 
TempcplcFdFdAhR = cplcFdFdAhR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdAhR(gt2,:) = ZcplcFdFdAhR(gt2,:) + ZRUVdc(gt2,gt1)*TempcplcFdFdAhR(gt1,:) 
 End Do 
End Do 
TempcplcFdFdAhR = ZcplcFdFdAhR 
ZcplcFdFdAhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdAhR(:,gt2) = ZcplcFdFdAhR(:,gt2) + ZRUUdc(gt2,gt1)*TempcplcFdFdAhR(:,gt1) 
 End Do 
End Do 
TempcplcFdFdAhR = ZcplcFdFdAhR 


 ! ## ZcplcFeFeAhL ## 
ZcplcFeFeAhL = 0._dp 
TempcplcFeFeAhL = cplcFeFeAhL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeAhL(gt2,:) = ZcplcFeFeAhL(gt2,:) + ZRUUe(gt2,gt1)*TempcplcFeFeAhL(gt1,:) 
 End Do 
End Do 
TempcplcFeFeAhL = ZcplcFeFeAhL 
ZcplcFeFeAhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeAhL(:,gt2) = ZcplcFeFeAhL(:,gt2) + ZRUVe(gt2,gt1)*TempcplcFeFeAhL(:,gt1) 
 End Do 
End Do 
TempcplcFeFeAhL = ZcplcFeFeAhL 


 ! ## ZcplcFeFeAhR ## 
ZcplcFeFeAhR = 0._dp 
TempcplcFeFeAhR = cplcFeFeAhR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeAhR(gt2,:) = ZcplcFeFeAhR(gt2,:) + ZRUVec(gt2,gt1)*TempcplcFeFeAhR(gt1,:) 
 End Do 
End Do 
TempcplcFeFeAhR = ZcplcFeFeAhR 
ZcplcFeFeAhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeAhR(:,gt2) = ZcplcFeFeAhR(:,gt2) + ZRUUec(gt2,gt1)*TempcplcFeFeAhR(:,gt1) 
 End Do 
End Do 
TempcplcFeFeAhR = ZcplcFeFeAhR 


 ! ## ZcplcFuFuAhL ## 
ZcplcFuFuAhL = 0._dp 
TempcplcFuFuAhL = cplcFuFuAhL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuAhL(gt2,:) = ZcplcFuFuAhL(gt2,:) + ZRUUu(gt2,gt1)*TempcplcFuFuAhL(gt1,:) 
 End Do 
End Do 
TempcplcFuFuAhL = ZcplcFuFuAhL 
ZcplcFuFuAhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuAhL(:,gt2) = ZcplcFuFuAhL(:,gt2) + ZRUVu(gt2,gt1)*TempcplcFuFuAhL(:,gt1) 
 End Do 
End Do 
TempcplcFuFuAhL = ZcplcFuFuAhL 


 ! ## ZcplcFuFuAhR ## 
ZcplcFuFuAhR = 0._dp 
TempcplcFuFuAhR = cplcFuFuAhR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuAhR(gt2,:) = ZcplcFuFuAhR(gt2,:) + ZRUVuc(gt2,gt1)*TempcplcFuFuAhR(gt1,:) 
 End Do 
End Do 
TempcplcFuFuAhR = ZcplcFuFuAhR 
ZcplcFuFuAhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuAhR(:,gt2) = ZcplcFuFuAhR(:,gt2) + ZRUUuc(gt2,gt1)*TempcplcFuFuAhR(:,gt1) 
 End Do 
End Do 
TempcplcFuFuAhR = ZcplcFuFuAhR 


 ! ## ZcplcFdFdhhL ## 
ZcplcFdFdhhL = 0._dp 
TempcplcFdFdhhL = cplcFdFdhhL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdhhL(gt2,:) = ZcplcFdFdhhL(gt2,:) + ZRUUd(gt2,gt1)*TempcplcFdFdhhL(gt1,:) 
 End Do 
End Do 
TempcplcFdFdhhL = ZcplcFdFdhhL 
ZcplcFdFdhhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdhhL(:,gt2) = ZcplcFdFdhhL(:,gt2) + ZRUVd(gt2,gt1)*TempcplcFdFdhhL(:,gt1) 
 End Do 
End Do 
TempcplcFdFdhhL = ZcplcFdFdhhL 


 ! ## ZcplcFdFdhhR ## 
ZcplcFdFdhhR = 0._dp 
TempcplcFdFdhhR = cplcFdFdhhR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdhhR(gt2,:) = ZcplcFdFdhhR(gt2,:) + ZRUVdc(gt2,gt1)*TempcplcFdFdhhR(gt1,:) 
 End Do 
End Do 
TempcplcFdFdhhR = ZcplcFdFdhhR 
ZcplcFdFdhhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdhhR(:,gt2) = ZcplcFdFdhhR(:,gt2) + ZRUUdc(gt2,gt1)*TempcplcFdFdhhR(:,gt1) 
 End Do 
End Do 
TempcplcFdFdhhR = ZcplcFdFdhhR 


 ! ## ZcplcFuFdHpL ## 
ZcplcFuFdHpL = 0._dp 
TempcplcFuFdHpL = cplcFuFdHpL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdHpL(gt2,:) = ZcplcFuFdHpL(gt2,:) + ZRUUu(gt2,gt1)*TempcplcFuFdHpL(gt1,:) 
 End Do 
End Do 
TempcplcFuFdHpL = ZcplcFuFdHpL 
ZcplcFuFdHpL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdHpL(:,gt2) = ZcplcFuFdHpL(:,gt2) + ZRUVd(gt2,gt1)*TempcplcFuFdHpL(:,gt1) 
 End Do 
End Do 
TempcplcFuFdHpL = ZcplcFuFdHpL 


 ! ## ZcplcFuFdHpR ## 
ZcplcFuFdHpR = 0._dp 
TempcplcFuFdHpR = cplcFuFdHpR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdHpR(gt2,:) = ZcplcFuFdHpR(gt2,:) + ZRUVuc(gt2,gt1)*TempcplcFuFdHpR(gt1,:) 
 End Do 
End Do 
TempcplcFuFdHpR = ZcplcFuFdHpR 
ZcplcFuFdHpR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdHpR(:,gt2) = ZcplcFuFdHpR(:,gt2) + ZRUUdc(gt2,gt1)*TempcplcFuFdHpR(:,gt1) 
 End Do 
End Do 
TempcplcFuFdHpR = ZcplcFuFdHpR 


 ! ## ZcplcFeFehhL ## 
ZcplcFeFehhL = 0._dp 
TempcplcFeFehhL = cplcFeFehhL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFehhL(gt2,:) = ZcplcFeFehhL(gt2,:) + ZRUUe(gt2,gt1)*TempcplcFeFehhL(gt1,:) 
 End Do 
End Do 
TempcplcFeFehhL = ZcplcFeFehhL 
ZcplcFeFehhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFehhL(:,gt2) = ZcplcFeFehhL(:,gt2) + ZRUVe(gt2,gt1)*TempcplcFeFehhL(:,gt1) 
 End Do 
End Do 
TempcplcFeFehhL = ZcplcFeFehhL 


 ! ## ZcplcFeFehhR ## 
ZcplcFeFehhR = 0._dp 
TempcplcFeFehhR = cplcFeFehhR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFehhR(gt2,:) = ZcplcFeFehhR(gt2,:) + ZRUVec(gt2,gt1)*TempcplcFeFehhR(gt1,:) 
 End Do 
End Do 
TempcplcFeFehhR = ZcplcFeFehhR 
ZcplcFeFehhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFehhR(:,gt2) = ZcplcFeFehhR(:,gt2) + ZRUUec(gt2,gt1)*TempcplcFeFehhR(:,gt1) 
 End Do 
End Do 
TempcplcFeFehhR = ZcplcFeFehhR 


 ! ## ZcplcFvFeHpL ## 
ZcplcFvFeHpL = 0._dp 
TempcplcFvFeHpL = cplcFvFeHpL 
ZcplcFvFeHpL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFvFeHpL(:,gt2) = ZcplcFvFeHpL(:,gt2) + ZRUVe(gt2,gt1)*TempcplcFvFeHpL(:,gt1) 
 End Do 
End Do 
TempcplcFvFeHpL = ZcplcFvFeHpL 


 ! ## ZcplcFvFeHpR ## 
ZcplcFvFeHpR = 0._dp 
TempcplcFvFeHpR = cplcFvFeHpR 
ZcplcFvFeHpR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFvFeHpR(:,gt2) = ZcplcFvFeHpR(:,gt2) + ZRUUec(gt2,gt1)*TempcplcFvFeHpR(:,gt1) 
 End Do 
End Do 
TempcplcFvFeHpR = ZcplcFvFeHpR 


 ! ## ZcplcFuFuhhL ## 
ZcplcFuFuhhL = 0._dp 
TempcplcFuFuhhL = cplcFuFuhhL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuhhL(gt2,:) = ZcplcFuFuhhL(gt2,:) + ZRUUu(gt2,gt1)*TempcplcFuFuhhL(gt1,:) 
 End Do 
End Do 
TempcplcFuFuhhL = ZcplcFuFuhhL 
ZcplcFuFuhhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuhhL(:,gt2) = ZcplcFuFuhhL(:,gt2) + ZRUVu(gt2,gt1)*TempcplcFuFuhhL(:,gt1) 
 End Do 
End Do 
TempcplcFuFuhhL = ZcplcFuFuhhL 


 ! ## ZcplcFuFuhhR ## 
ZcplcFuFuhhR = 0._dp 
TempcplcFuFuhhR = cplcFuFuhhR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuhhR(gt2,:) = ZcplcFuFuhhR(gt2,:) + ZRUVuc(gt2,gt1)*TempcplcFuFuhhR(gt1,:) 
 End Do 
End Do 
TempcplcFuFuhhR = ZcplcFuFuhhR 
ZcplcFuFuhhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuhhR(:,gt2) = ZcplcFuFuhhR(:,gt2) + ZRUUuc(gt2,gt1)*TempcplcFuFuhhR(:,gt1) 
 End Do 
End Do 
TempcplcFuFuhhR = ZcplcFuFuhhR 


 ! ## ZcplcFdFucHpL ## 
ZcplcFdFucHpL = 0._dp 
TempcplcFdFucHpL = cplcFdFucHpL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFucHpL(gt2,:) = ZcplcFdFucHpL(gt2,:) + ZRUUd(gt2,gt1)*TempcplcFdFucHpL(gt1,:) 
 End Do 
End Do 
TempcplcFdFucHpL = ZcplcFdFucHpL 
ZcplcFdFucHpL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFucHpL(:,gt2) = ZcplcFdFucHpL(:,gt2) + ZRUVu(gt2,gt1)*TempcplcFdFucHpL(:,gt1) 
 End Do 
End Do 
TempcplcFdFucHpL = ZcplcFdFucHpL 


 ! ## ZcplcFdFucHpR ## 
ZcplcFdFucHpR = 0._dp 
TempcplcFdFucHpR = cplcFdFucHpR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFucHpR(gt2,:) = ZcplcFdFucHpR(gt2,:) + ZRUVdc(gt2,gt1)*TempcplcFdFucHpR(gt1,:) 
 End Do 
End Do 
TempcplcFdFucHpR = ZcplcFdFucHpR 
ZcplcFdFucHpR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFucHpR(:,gt2) = ZcplcFdFucHpR(:,gt2) + ZRUUuc(gt2,gt1)*TempcplcFdFucHpR(:,gt1) 
 End Do 
End Do 
TempcplcFdFucHpR = ZcplcFdFucHpR 


 ! ## ZcplcFeFvcHpL ## 
ZcplcFeFvcHpL = 0._dp 
TempcplcFeFvcHpL = cplcFeFvcHpL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFvcHpL(gt2,:) = ZcplcFeFvcHpL(gt2,:) + ZRUUe(gt2,gt1)*TempcplcFeFvcHpL(gt1,:) 
 End Do 
End Do 
TempcplcFeFvcHpL = ZcplcFeFvcHpL 


 ! ## ZcplcFeFvcHpR ## 
ZcplcFeFvcHpR = 0._dp 
TempcplcFeFvcHpR = cplcFeFvcHpR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFvcHpR(gt2,:) = ZcplcFeFvcHpR(gt2,:) + ZRUVec(gt2,gt1)*TempcplcFeFvcHpR(gt1,:) 
 End Do 
End Do 
TempcplcFeFvcHpR = ZcplcFeFvcHpR 


 ! ## ZcplcFdFdVGL ## 
ZcplcFdFdVGL = 0._dp 
TempcplcFdFdVGL = cplcFdFdVGL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVGL(gt2,:) = ZcplcFdFdVGL(gt2,:) + ZRUVdc(gt2,gt1)*TempcplcFdFdVGL(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVGL = ZcplcFdFdVGL 
ZcplcFdFdVGL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVGL(:,gt2) = ZcplcFdFdVGL(:,gt2) + ZRUVd(gt2,gt1)*TempcplcFdFdVGL(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVGL = ZcplcFdFdVGL 


 ! ## ZcplcFdFdVGR ## 
ZcplcFdFdVGR = 0._dp 
TempcplcFdFdVGR = cplcFdFdVGR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVGR(gt2,:) = ZcplcFdFdVGR(gt2,:) + ZRUUd(gt2,gt1)*TempcplcFdFdVGR(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVGR = ZcplcFdFdVGR 
ZcplcFdFdVGR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVGR(:,gt2) = ZcplcFdFdVGR(:,gt2) + ZRUUdc(gt2,gt1)*TempcplcFdFdVGR(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVGR = ZcplcFdFdVGR 


 ! ## ZcplcFdFdVPL ## 
ZcplcFdFdVPL = 0._dp 
TempcplcFdFdVPL = cplcFdFdVPL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVPL(gt2,:) = ZcplcFdFdVPL(gt2,:) + ZRUVdc(gt2,gt1)*TempcplcFdFdVPL(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVPL = ZcplcFdFdVPL 
ZcplcFdFdVPL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVPL(:,gt2) = ZcplcFdFdVPL(:,gt2) + ZRUVd(gt2,gt1)*TempcplcFdFdVPL(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVPL = ZcplcFdFdVPL 


 ! ## ZcplcFdFdVPR ## 
ZcplcFdFdVPR = 0._dp 
TempcplcFdFdVPR = cplcFdFdVPR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVPR(gt2,:) = ZcplcFdFdVPR(gt2,:) + ZRUUd(gt2,gt1)*TempcplcFdFdVPR(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVPR = ZcplcFdFdVPR 
ZcplcFdFdVPR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVPR(:,gt2) = ZcplcFdFdVPR(:,gt2) + ZRUUdc(gt2,gt1)*TempcplcFdFdVPR(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVPR = ZcplcFdFdVPR 


 ! ## ZcplcFuFdVWpL ## 
ZcplcFuFdVWpL = 0._dp 
TempcplcFuFdVWpL = cplcFuFdVWpL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdVWpL(gt2,:) = ZcplcFuFdVWpL(gt2,:) + ZRUVuc(gt2,gt1)*TempcplcFuFdVWpL(gt1,:) 
 End Do 
End Do 
TempcplcFuFdVWpL = ZcplcFuFdVWpL 
ZcplcFuFdVWpL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdVWpL(:,gt2) = ZcplcFuFdVWpL(:,gt2) + ZRUVd(gt2,gt1)*TempcplcFuFdVWpL(:,gt1) 
 End Do 
End Do 
TempcplcFuFdVWpL = ZcplcFuFdVWpL 


 ! ## ZcplcFuFdVWpR ## 
ZcplcFuFdVWpR = 0._dp 
TempcplcFuFdVWpR = cplcFuFdVWpR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdVWpR(gt2,:) = ZcplcFuFdVWpR(gt2,:) + ZRUUu(gt2,gt1)*TempcplcFuFdVWpR(gt1,:) 
 End Do 
End Do 
TempcplcFuFdVWpR = ZcplcFuFdVWpR 
ZcplcFuFdVWpR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdVWpR(:,gt2) = ZcplcFuFdVWpR(:,gt2) + ZRUUdc(gt2,gt1)*TempcplcFuFdVWpR(:,gt1) 
 End Do 
End Do 
TempcplcFuFdVWpR = ZcplcFuFdVWpR 


 ! ## ZcplcFdFdVZL ## 
ZcplcFdFdVZL = 0._dp 
TempcplcFdFdVZL = cplcFdFdVZL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVZL(gt2,:) = ZcplcFdFdVZL(gt2,:) + ZRUVdc(gt2,gt1)*TempcplcFdFdVZL(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVZL = ZcplcFdFdVZL 
ZcplcFdFdVZL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVZL(:,gt2) = ZcplcFdFdVZL(:,gt2) + ZRUVd(gt2,gt1)*TempcplcFdFdVZL(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVZL = ZcplcFdFdVZL 


 ! ## ZcplcFdFdVZR ## 
ZcplcFdFdVZR = 0._dp 
TempcplcFdFdVZR = cplcFdFdVZR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVZR(gt2,:) = ZcplcFdFdVZR(gt2,:) + ZRUUd(gt2,gt1)*TempcplcFdFdVZR(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVZR = ZcplcFdFdVZR 
ZcplcFdFdVZR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVZR(:,gt2) = ZcplcFdFdVZR(:,gt2) + ZRUUdc(gt2,gt1)*TempcplcFdFdVZR(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVZR = ZcplcFdFdVZR 


 ! ## ZcplcFeFeVPL ## 
ZcplcFeFeVPL = 0._dp 
TempcplcFeFeVPL = cplcFeFeVPL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVPL(gt2,:) = ZcplcFeFeVPL(gt2,:) + ZRUVec(gt2,gt1)*TempcplcFeFeVPL(gt1,:) 
 End Do 
End Do 
TempcplcFeFeVPL = ZcplcFeFeVPL 
ZcplcFeFeVPL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVPL(:,gt2) = ZcplcFeFeVPL(:,gt2) + ZRUVe(gt2,gt1)*TempcplcFeFeVPL(:,gt1) 
 End Do 
End Do 
TempcplcFeFeVPL = ZcplcFeFeVPL 


 ! ## ZcplcFeFeVPR ## 
ZcplcFeFeVPR = 0._dp 
TempcplcFeFeVPR = cplcFeFeVPR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVPR(gt2,:) = ZcplcFeFeVPR(gt2,:) + ZRUUe(gt2,gt1)*TempcplcFeFeVPR(gt1,:) 
 End Do 
End Do 
TempcplcFeFeVPR = ZcplcFeFeVPR 
ZcplcFeFeVPR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVPR(:,gt2) = ZcplcFeFeVPR(:,gt2) + ZRUUec(gt2,gt1)*TempcplcFeFeVPR(:,gt1) 
 End Do 
End Do 
TempcplcFeFeVPR = ZcplcFeFeVPR 


 ! ## ZcplcFvFeVWpL ## 
ZcplcFvFeVWpL = 0._dp 
TempcplcFvFeVWpL = cplcFvFeVWpL 
ZcplcFvFeVWpL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFvFeVWpL(:,gt2) = ZcplcFvFeVWpL(:,gt2) + ZRUVe(gt2,gt1)*TempcplcFvFeVWpL(:,gt1) 
 End Do 
End Do 
TempcplcFvFeVWpL = ZcplcFvFeVWpL 


 ! ## ZcplcFvFeVWpR ## 
ZcplcFvFeVWpR = 0._dp 
TempcplcFvFeVWpR = cplcFvFeVWpR 
ZcplcFvFeVWpR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFvFeVWpR(:,gt2) = ZcplcFvFeVWpR(:,gt2) + ZRUUec(gt2,gt1)*TempcplcFvFeVWpR(:,gt1) 
 End Do 
End Do 
TempcplcFvFeVWpR = ZcplcFvFeVWpR 


 ! ## ZcplcFeFeVZL ## 
ZcplcFeFeVZL = 0._dp 
TempcplcFeFeVZL = cplcFeFeVZL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVZL(gt2,:) = ZcplcFeFeVZL(gt2,:) + ZRUVec(gt2,gt1)*TempcplcFeFeVZL(gt1,:) 
 End Do 
End Do 
TempcplcFeFeVZL = ZcplcFeFeVZL 
ZcplcFeFeVZL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVZL(:,gt2) = ZcplcFeFeVZL(:,gt2) + ZRUVe(gt2,gt1)*TempcplcFeFeVZL(:,gt1) 
 End Do 
End Do 
TempcplcFeFeVZL = ZcplcFeFeVZL 


 ! ## ZcplcFeFeVZR ## 
ZcplcFeFeVZR = 0._dp 
TempcplcFeFeVZR = cplcFeFeVZR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVZR(gt2,:) = ZcplcFeFeVZR(gt2,:) + ZRUUe(gt2,gt1)*TempcplcFeFeVZR(gt1,:) 
 End Do 
End Do 
TempcplcFeFeVZR = ZcplcFeFeVZR 
ZcplcFeFeVZR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVZR(:,gt2) = ZcplcFeFeVZR(:,gt2) + ZRUUec(gt2,gt1)*TempcplcFeFeVZR(:,gt1) 
 End Do 
End Do 
TempcplcFeFeVZR = ZcplcFeFeVZR 


 ! ## ZcplcFuFuVGL ## 
ZcplcFuFuVGL = 0._dp 
TempcplcFuFuVGL = cplcFuFuVGL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVGL(gt2,:) = ZcplcFuFuVGL(gt2,:) + ZRUVuc(gt2,gt1)*TempcplcFuFuVGL(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVGL = ZcplcFuFuVGL 
ZcplcFuFuVGL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVGL(:,gt2) = ZcplcFuFuVGL(:,gt2) + ZRUVu(gt2,gt1)*TempcplcFuFuVGL(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVGL = ZcplcFuFuVGL 


 ! ## ZcplcFuFuVGR ## 
ZcplcFuFuVGR = 0._dp 
TempcplcFuFuVGR = cplcFuFuVGR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVGR(gt2,:) = ZcplcFuFuVGR(gt2,:) + ZRUUu(gt2,gt1)*TempcplcFuFuVGR(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVGR = ZcplcFuFuVGR 
ZcplcFuFuVGR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVGR(:,gt2) = ZcplcFuFuVGR(:,gt2) + ZRUUuc(gt2,gt1)*TempcplcFuFuVGR(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVGR = ZcplcFuFuVGR 


 ! ## ZcplcFuFuVPL ## 
ZcplcFuFuVPL = 0._dp 
TempcplcFuFuVPL = cplcFuFuVPL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVPL(gt2,:) = ZcplcFuFuVPL(gt2,:) + ZRUVuc(gt2,gt1)*TempcplcFuFuVPL(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVPL = ZcplcFuFuVPL 
ZcplcFuFuVPL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVPL(:,gt2) = ZcplcFuFuVPL(:,gt2) + ZRUVu(gt2,gt1)*TempcplcFuFuVPL(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVPL = ZcplcFuFuVPL 


 ! ## ZcplcFuFuVPR ## 
ZcplcFuFuVPR = 0._dp 
TempcplcFuFuVPR = cplcFuFuVPR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVPR(gt2,:) = ZcplcFuFuVPR(gt2,:) + ZRUUu(gt2,gt1)*TempcplcFuFuVPR(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVPR = ZcplcFuFuVPR 
ZcplcFuFuVPR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVPR(:,gt2) = ZcplcFuFuVPR(:,gt2) + ZRUUuc(gt2,gt1)*TempcplcFuFuVPR(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVPR = ZcplcFuFuVPR 


 ! ## ZcplcFuFuVZL ## 
ZcplcFuFuVZL = 0._dp 
TempcplcFuFuVZL = cplcFuFuVZL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVZL(gt2,:) = ZcplcFuFuVZL(gt2,:) + ZRUVuc(gt2,gt1)*TempcplcFuFuVZL(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVZL = ZcplcFuFuVZL 
ZcplcFuFuVZL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVZL(:,gt2) = ZcplcFuFuVZL(:,gt2) + ZRUVu(gt2,gt1)*TempcplcFuFuVZL(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVZL = ZcplcFuFuVZL 


 ! ## ZcplcFuFuVZR ## 
ZcplcFuFuVZR = 0._dp 
TempcplcFuFuVZR = cplcFuFuVZR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVZR(gt2,:) = ZcplcFuFuVZR(gt2,:) + ZRUUu(gt2,gt1)*TempcplcFuFuVZR(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVZR = ZcplcFuFuVZR 
ZcplcFuFuVZR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVZR(:,gt2) = ZcplcFuFuVZR(:,gt2) + ZRUUuc(gt2,gt1)*TempcplcFuFuVZR(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVZR = ZcplcFuFuVZR 


 ! ## ZcplcFdFucVWpL ## 
ZcplcFdFucVWpL = 0._dp 
TempcplcFdFucVWpL = cplcFdFucVWpL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFucVWpL(gt2,:) = ZcplcFdFucVWpL(gt2,:) + ZRUVdc(gt2,gt1)*TempcplcFdFucVWpL(gt1,:) 
 End Do 
End Do 
TempcplcFdFucVWpL = ZcplcFdFucVWpL 
ZcplcFdFucVWpL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFucVWpL(:,gt2) = ZcplcFdFucVWpL(:,gt2) + ZRUVu(gt2,gt1)*TempcplcFdFucVWpL(:,gt1) 
 End Do 
End Do 
TempcplcFdFucVWpL = ZcplcFdFucVWpL 


 ! ## ZcplcFdFucVWpR ## 
ZcplcFdFucVWpR = 0._dp 
TempcplcFdFucVWpR = cplcFdFucVWpR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFucVWpR(gt2,:) = ZcplcFdFucVWpR(gt2,:) + ZRUUd(gt2,gt1)*TempcplcFdFucVWpR(gt1,:) 
 End Do 
End Do 
TempcplcFdFucVWpR = ZcplcFdFucVWpR 
ZcplcFdFucVWpR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFucVWpR(:,gt2) = ZcplcFdFucVWpR(:,gt2) + ZRUUuc(gt2,gt1)*TempcplcFdFucVWpR(:,gt1) 
 End Do 
End Do 
TempcplcFdFucVWpR = ZcplcFdFucVWpR 


 ! ## ZcplcFvFvVZL ## 
ZcplcFvFvVZL = 0._dp 
TempcplcFvFvVZL = cplcFvFvVZL 


 ! ## ZcplcFvFvVZR ## 
ZcplcFvFvVZR = 0._dp 
TempcplcFvFvVZR = cplcFvFvVZR 


 ! ## ZcplcFeFvcVWpL ## 
ZcplcFeFvcVWpL = 0._dp 
TempcplcFeFvcVWpL = cplcFeFvcVWpL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFvcVWpL(gt2,:) = ZcplcFeFvcVWpL(gt2,:) + ZRUVec(gt2,gt1)*TempcplcFeFvcVWpL(gt1,:) 
 End Do 
End Do 
TempcplcFeFvcVWpL = ZcplcFeFvcVWpL 


 ! ## ZcplcFeFvcVWpR ## 
ZcplcFeFvcVWpR = 0._dp 
TempcplcFeFvcVWpR = cplcFeFvcVWpR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFvcVWpR(gt2,:) = ZcplcFeFvcVWpR(gt2,:) + ZRUUe(gt2,gt1)*TempcplcFeFvcVWpR(gt1,:) 
 End Do 
End Do 
TempcplcFeFvcVWpR = ZcplcFeFvcVWpR 


 ! ## ZcplVGVGVGVG1 ## 
ZcplVGVGVGVG1 = 0._dp 


 ! ## ZcplVGVGVGVG2 ## 
ZcplVGVGVGVG2 = 0._dp 


 ! ## ZcplVGVGVGVG3 ## 
ZcplVGVGVGVG3 = 0._dp 


 ! ## ZcplcVWpVPVPVWp1 ## 
ZcplcVWpVPVPVWp1 = 0._dp 


 ! ## ZcplcVWpVPVPVWp2 ## 
ZcplcVWpVPVPVWp2 = 0._dp 


 ! ## ZcplcVWpVPVPVWp3 ## 
ZcplcVWpVPVPVWp3 = 0._dp 


 ! ## ZcplcVWpVPVWpVZ1 ## 
ZcplcVWpVPVWpVZ1 = 0._dp 


 ! ## ZcplcVWpVPVWpVZ2 ## 
ZcplcVWpVPVWpVZ2 = 0._dp 


 ! ## ZcplcVWpVPVWpVZ3 ## 
ZcplcVWpVPVWpVZ3 = 0._dp 


 ! ## ZcplcVWpcVWpVWpVWp1 ## 
ZcplcVWpcVWpVWpVWp1 = 0._dp 


 ! ## ZcplcVWpcVWpVWpVWp2 ## 
ZcplcVWpcVWpVWpVWp2 = 0._dp 


 ! ## ZcplcVWpcVWpVWpVWp3 ## 
ZcplcVWpcVWpVWpVWp3 = 0._dp 


 ! ## ZcplcVWpVWpVZVZ1 ## 
ZcplcVWpVWpVZVZ1 = 0._dp 


 ! ## ZcplcVWpVWpVZVZ2 ## 
ZcplcVWpVWpVZVZ2 = 0._dp 


 ! ## ZcplcVWpVWpVZVZ3 ## 
ZcplcVWpVWpVZVZ3 = 0._dp 


 ! ## ZcplcgGgGVG ## 
ZcplcgGgGVG = 0._dp 
TempcplcgGgGVG = cplcgGgGVG 
ZcplcgGgGVG = TempcplcgGgGVG 


 ! ## ZcplcgWpgAVWp ## 
ZcplcgWpgAVWp = 0._dp 
TempcplcgWpgAVWp = cplcgWpgAVWp 
ZcplcgWpgAVWp = TempcplcgWpgAVWp 


 ! ## ZcplcgWCgAcVWp ## 
ZcplcgWCgAcVWp = 0._dp 
TempcplcgWCgAcVWp = cplcgWCgAcVWp 
ZcplcgWCgAcVWp = TempcplcgWCgAcVWp 


 ! ## ZcplcgWpgWpVP ## 
ZcplcgWpgWpVP = 0._dp 
TempcplcgWpgWpVP = cplcgWpgWpVP 
ZcplcgWpgWpVP = TempcplcgWpgWpVP 


 ! ## ZcplcgWpgWpVZ ## 
ZcplcgWpgWpVZ = 0._dp 
TempcplcgWpgWpVZ = cplcgWpgWpVZ 
ZcplcgWpgWpVZ = TempcplcgWpgWpVZ 


 ! ## ZcplcgAgWpcVWp ## 
ZcplcgAgWpcVWp = 0._dp 
TempcplcgAgWpcVWp = cplcgAgWpcVWp 
ZcplcgAgWpcVWp = TempcplcgAgWpcVWp 


 ! ## ZcplcgZgWpcVWp ## 
ZcplcgZgWpcVWp = 0._dp 
TempcplcgZgWpcVWp = cplcgZgWpcVWp 
ZcplcgZgWpcVWp = TempcplcgZgWpcVWp 


 ! ## ZcplcgWCgWCVP ## 
ZcplcgWCgWCVP = 0._dp 
TempcplcgWCgWCVP = cplcgWCgWCVP 
ZcplcgWCgWCVP = TempcplcgWCgWCVP 


 ! ## ZcplcgAgWCVWp ## 
ZcplcgAgWCVWp = 0._dp 
TempcplcgAgWCVWp = cplcgAgWCVWp 
ZcplcgAgWCVWp = TempcplcgAgWCVWp 


 ! ## ZcplcgZgWCVWp ## 
ZcplcgZgWCVWp = 0._dp 
TempcplcgZgWCVWp = cplcgZgWCVWp 
ZcplcgZgWCVWp = TempcplcgZgWCVWp 


 ! ## ZcplcgWCgWCVZ ## 
ZcplcgWCgWCVZ = 0._dp 
TempcplcgWCgWCVZ = cplcgWCgWCVZ 
ZcplcgWCgWCVZ = TempcplcgWCgWCVZ 


 ! ## ZcplcgWpgZVWp ## 
ZcplcgWpgZVWp = 0._dp 
TempcplcgWpgZVWp = cplcgWpgZVWp 
ZcplcgWpgZVWp = TempcplcgWpgZVWp 


 ! ## ZcplcgWCgZcVWp ## 
ZcplcgWCgZcVWp = 0._dp 
TempcplcgWCgZcVWp = cplcgWCgZcVWp 
ZcplcgWCgZcVWp = TempcplcgWCgZcVWp 


 ! ## ZcplcgWpgWpAh ## 
ZcplcgWpgWpAh = 0._dp 
TempcplcgWpgWpAh = cplcgWpgWpAh 
ZcplcgWpgWpAh = TempcplcgWpgWpAh 


 ! ## ZcplcgWCgWCAh ## 
ZcplcgWCgWCAh = 0._dp 
TempcplcgWCgWCAh = cplcgWCgWCAh 
ZcplcgWCgWCAh = TempcplcgWCgWCAh 


 ! ## ZcplcgZgAhh ## 
ZcplcgZgAhh = 0._dp 
TempcplcgZgAhh = cplcgZgAhh 
ZcplcgZgAhh = TempcplcgZgAhh 


 ! ## ZcplcgWpgAHp ## 
ZcplcgWpgAHp = 0._dp 
TempcplcgWpgAHp = cplcgWpgAHp 
ZcplcgWpgAHp = TempcplcgWpgAHp 


 ! ## ZcplcgWCgAcHp ## 
ZcplcgWCgAcHp = 0._dp 
TempcplcgWCgAcHp = cplcgWCgAcHp 
ZcplcgWCgAcHp = TempcplcgWCgAcHp 


 ! ## ZcplcgWpgWphh ## 
ZcplcgWpgWphh = 0._dp 
TempcplcgWpgWphh = cplcgWpgWphh 
ZcplcgWpgWphh = TempcplcgWpgWphh 


 ! ## ZcplcgZgWpcHp ## 
ZcplcgZgWpcHp = 0._dp 
TempcplcgZgWpcHp = cplcgZgWpcHp 
ZcplcgZgWpcHp = TempcplcgZgWpcHp 


 ! ## ZcplcgWCgWChh ## 
ZcplcgWCgWChh = 0._dp 
TempcplcgWCgWChh = cplcgWCgWChh 
ZcplcgWCgWChh = TempcplcgWCgWChh 


 ! ## ZcplcgZgWCHp ## 
ZcplcgZgWCHp = 0._dp 
TempcplcgZgWCHp = cplcgZgWCHp 
ZcplcgZgWCHp = TempcplcgZgWCHp 


 ! ## ZcplcgZgZhh ## 
ZcplcgZgZhh = 0._dp 
TempcplcgZgZhh = cplcgZgZhh 
ZcplcgZgZhh = TempcplcgZgZhh 


 ! ## ZcplcgWpgZHp ## 
ZcplcgWpgZHp = 0._dp 
TempcplcgWpgZHp = cplcgWpgZHp 
ZcplcgWpgZHp = TempcplcgWpgZHp 


 ! ## ZcplcgWCgZcHp ## 
ZcplcgWCgZcHp = 0._dp 
TempcplcgWCgZcHp = cplcgWCgZcHp 
ZcplcgWCgZcHp = TempcplcgWCgZcHp 
End Subroutine  getZCouplings 

Subroutine getGBCouplings(MFdOS,MFd2OS,MFuOS,MFu2OS,MFeOS,MFe2OS,MHpOS,               & 
& MHp2OS,MAhOS,MAh2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,MVWpOS,MVWp2OS,ZDLOS,ZDROS,              & 
& ZULOS,ZUROS,ZELOS,ZEROS,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,              & 
& MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,cplcFdFucVWpL,               & 
& cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFvFeVWpL,      & 
& cplcFvFeVWpR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplhhcHpVWp,            & 
& cplhhcVWpVWp,ZcplcFdFucVWpL,ZcplcFdFucVWpR,ZcplcFeFvcVWpL,ZcplcFeFvcVWpR,              & 
& ZcplcFuFdVWpL,ZcplcFuFdVWpR,ZcplcFvFeVWpL,ZcplcFvFeVWpR,ZcplcHpVPVWp,ZcplcHpVWpVZ,     & 
& ZcplcVWpVPVWp,ZcplcVWpVWpVZ,ZcplhhcHpVWp,ZcplhhcVWpVWp,GcplhhHpcHp,GcplAhHpcVWp,       & 
& GcplAhcHpVWp,GcplhhHpcVWp,GcplhhcHpVWp,GcplHpcHpVP,GcplHpcHpVZ,GcplHpcVWpVP,           & 
& GcplHpcVWpVZ,GcplcHpVPVWp,GcplcHpVWpVZ,GcplcFuFdHpL,GcplcFuFdHpR,GcplcFvFeHpL,         & 
& GcplcFvFeHpR,GcplcFdFucHpL,GcplcFdFucHpR,GcplcFeFvcHpL,GcplcFeFvcHpR,GZcplhhHpcHp,     & 
& GZcplAhHpcVWp,GZcplAhcHpVWp,GZcplhhHpcVWp,GZcplhhcHpVWp,GZcplHpcHpVP,GZcplHpcHpVZ,     & 
& GZcplHpcVWpVP,GZcplHpcVWpVZ,GZcplcHpVPVWp,GZcplcHpVWpVZ,GZcplcFuFdHpL,GZcplcFuFdHpR,   & 
& GZcplcFvFeHpL,GZcplcFvFeHpR,GZcplcFdFucHpL,GZcplcFdFucHpR,GZcplcFeFvcHpL,              & 
& GZcplcFeFvcHpR,GosZcplhhHpcHp,GosZcplAhHpcVWp,GosZcplAhcHpVWp,GosZcplhhHpcVWp,         & 
& GosZcplhhcHpVWp,GosZcplHpcHpVP,GosZcplHpcHpVZ,GosZcplHpcVWpVP,GosZcplHpcVWpVZ,         & 
& GosZcplcHpVPVWp,GosZcplcHpVWpVZ,GosZcplcFuFdHpL,GosZcplcFuFdHpR,GosZcplcFvFeHpL,       & 
& GosZcplcFvFeHpR,GosZcplcFdFucHpL,GosZcplcFdFucHpR,GosZcplcFeFvcHpL,GosZcplcFeFvcHpR)

Implicit None

Real(dp), Intent(in) :: MFdOS(3),MFd2OS(3),MFuOS(3),MFu2OS(3),MFeOS(3),MFe2OS(3),MHpOS,MHp2OS,MAhOS,          & 
& MAh2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,MVWpOS,MVWp2OS

Complex(dp), Intent(in) :: ZDLOS(3,3),ZDROS(3,3),ZULOS(3,3),ZUROS(3,3),ZELOS(3,3),ZEROS(3,3)

Real(dp), Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,              & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp), Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Complex(dp), Intent(in) :: cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),          & 
& cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFvFeVWpL(3,3),cplcFvFeVWpR(3,3),               & 
& cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,            & 
& ZcplcFdFucVWpL(3,3),ZcplcFdFucVWpR(3,3),ZcplcFeFvcVWpL(3,3),ZcplcFeFvcVWpR(3,3),       & 
& ZcplcFuFdVWpL(3,3),ZcplcFuFdVWpR(3,3),ZcplcFvFeVWpL(3,3),ZcplcFvFeVWpR(3,3),           & 
& ZcplcHpVPVWp,ZcplcHpVWpVZ,ZcplcVWpVPVWp,ZcplcVWpVWpVZ,ZcplhhcHpVWp,ZcplhhcVWpVWp

Integer :: gt1, gt2, gt3, i1, i2
Complex(dp), Intent(out) :: GcplhhHpcHp,GcplAhHpcVWp,GcplAhcHpVWp,GcplhhHpcVWp,GcplhhcHpVWp,GcplHpcHpVP,          & 
& GcplHpcHpVZ,GcplHpcVWpVP,GcplHpcVWpVZ,GcplcHpVPVWp,GcplcHpVWpVZ,GcplcFuFdHpL(3,3),     & 
& GcplcFuFdHpR(3,3),GcplcFvFeHpL(3,3),GcplcFvFeHpR(3,3),GcplcFdFucHpL(3,3),              & 
& GcplcFdFucHpR(3,3),GcplcFeFvcHpL(3,3),GcplcFeFvcHpR(3,3)

Complex(dp), Intent(out) :: GZcplhhHpcHp,GZcplAhHpcVWp,GZcplAhcHpVWp,GZcplhhHpcVWp,GZcplhhcHpVWp,GZcplHpcHpVP,    & 
& GZcplHpcHpVZ,GZcplHpcVWpVP,GZcplHpcVWpVZ,GZcplcHpVPVWp,GZcplcHpVWpVZ,GZcplcFuFdHpL(3,3),& 
& GZcplcFuFdHpR(3,3),GZcplcFvFeHpL(3,3),GZcplcFvFeHpR(3,3),GZcplcFdFucHpL(3,3),          & 
& GZcplcFdFucHpR(3,3),GZcplcFeFvcHpL(3,3),GZcplcFeFvcHpR(3,3)

Complex(dp), Intent(out) :: GosZcplhhHpcHp,GosZcplAhHpcVWp,GosZcplAhcHpVWp,GosZcplhhHpcVWp,GosZcplhhcHpVWp,       & 
& GosZcplHpcHpVP,GosZcplHpcHpVZ,GosZcplHpcVWpVP,GosZcplHpcVWpVZ,GosZcplcHpVPVWp,         & 
& GosZcplcHpVWpVZ,GosZcplcFuFdHpL(3,3),GosZcplcFuFdHpR(3,3),GosZcplcFvFeHpL(3,3),        & 
& GosZcplcFvFeHpR(3,3),GosZcplcFdFucHpL(3,3),GosZcplcFdFucHpR(3,3),GosZcplcFeFvcHpL(3,3),& 
& GosZcplcFeFvcHpR(3,3)

GcplhhHpcHp = (1)*(Mhh2OS - MHp2OS)/MVWpOS*cplhhcHpVWp
GosZcplhhHpcHp = (1)*(Mhh2OS - MHp2OS)/MVWpOS*ZcplhhcHpVWp
GZcplhhHpcHp = (1)*(Mhh2 - MHp2)/MVWp*ZcplhhcHpVWp
GcplAhHpcVWp = 0._dp 
GosZcplAhHpcVWp = 0._dp
GZcplAhHpcVWp = 0._dp
GcplAhcHpVWp = 0._dp 
GosZcplAhcHpVWp = 0._dp
GZcplAhcHpVWp = 0._dp
GcplhhHpcVWp = 0.5_dp*(1)/MVWpOS*cplhhcVWpVWp
GosZcplhhHpcVWp = 0.5_dp*(1)/MVWpOS*ZcplhhcVWpVWp
GZcplhhHpcVWp = 0.5_dp*(1)/MVWp*ZcplhhcVWpVWp
GcplhhcHpVWp = 0.5_dp*(1)/MVWpOS*cplhhcVWpVWp
GosZcplhhcHpVWp = 0.5_dp*(1)/MVWpOS*ZcplhhcVWpVWp
GZcplhhcHpVWp = 0.5_dp*(1)/MVWp*ZcplhhcVWpVWp
GcplHpcHpVP = 0.5_dp*(1)/MVWpOS*cplcHpVPVWp
GosZcplHpcHpVP = 0.5_dp*(1)/MVWpOS*ZcplcHpVPVWp
GZcplHpcHpVP = 0.5_dp*(1)/MVWp*ZcplcHpVPVWp
GcplHpcHpVZ = 0.5_dp*(1)/MVWpOS*cplcHpVWpVZ
GosZcplHpcHpVZ = 0.5_dp*(1)/MVWpOS*ZcplcHpVWpVZ
GZcplHpcHpVZ = 0.5_dp*(1)/MVWp*ZcplcHpVWpVZ
GcplHpcVWpVP = (-1)*(MVWp2OS - 0._dp)/MVWpOS*cplcVWpVPVWp
GosZcplHpcVWpVP = (-1)*(MVWp2OS - 0._dp)/MVWpOS*ZcplcVWpVPVWp
GZcplHpcVWpVP = (-1)*(MVWp2 - 0._dp)/MVWpOS*ZcplcVWpVPVWp 
GcplHpcVWpVZ = (1)*(MVWp2OS - MVZ2OS)/MVWpOS*cplcVWpVWpVZ
GosZcplHpcVWpVZ = (1)*(MVWp2OS - MVZ2OS)/MVWpOS*ZcplcVWpVWpVZ
GZcplHpcVWpVZ = (1)*(MVWp2 - MVZ2)/MVWpOS*ZcplcVWpVWpVZ 
GcplcHpVPVWp = (-1)*(0._dp - MVWp2OS)/MVWpOS*cplcVWpVPVWp
GosZcplcHpVPVWp = (-1)*(0._dp - MVWp2OS)/MVWpOS*ZcplcVWpVPVWp
GZcplcHpVPVWp = (-1)*(0._dp - MVWp2)/MVWpOS*ZcplcVWpVPVWp 
GcplcHpVWpVZ = (-1)*(MVWp2OS - MVZ2OS)/MVWpOS*cplcVWpVWpVZ
GosZcplcHpVWpVZ = (-1)*(MVWp2OS - MVZ2OS)/MVWpOS*ZcplcVWpVWpVZ
GZcplcHpVWpVZ = (-1)*(MVWp2 - MVZ2)/MVWpOS*ZcplcVWpVWpVZ 
Do i1=1,3
 Do i2=1,3
GcplcFuFdHpL(i1,i2) = (MFuOS(i1)*cplcFuFdVWpL(i1,i2) - MFdOS(i2)*cplcFuFdVWpR(i1,i2))/MVWpOS
GcplcFuFdHpR(i1,i2) = -(MFdOS(i2)*cplcFuFdVWpL(i1,i2) - MFuOS(i1)*cplcFuFdVWpR(i1,i2))/MVWpOS
GosZcplcFuFdHpL(i1,i2) = (MFuOS(i1)*ZcplcFuFdVWpL(i1,i2) - MFdOS(i2)*ZcplcFuFdVWpR(i1,i2))/MVWpOS
GosZcplcFuFdHpR(i1,i2) = -(MFdOS(i2)*ZcplcFuFdVWpL(i1,i2) - MFuOS(i1)*ZcplcFuFdVWpR(i1,i2))/MVWpOS
GZcplcFuFdHpL(i1,i2) = (MFu(i1)*ZcplcFuFdVWpL(i1,i2) - MFd(i2)*ZcplcFuFdVWpR(i1,i2))/MVWp
GZcplcFuFdHpR(i1,i2) = -(MFd(i2)*ZcplcFuFdVWpL(i1,i2) - MFu(i1)*ZcplcFuFdVWpR(i1,i2))/MVWp
 End Do
End Do 
Do i1=1,3
 Do i2=1,3
GcplcFvFeHpL(i1,i2) = (0.*cplcFvFeVWpL(i1,i2) - MFeOS(i2)*cplcFvFeVWpR(i1,i2))/MVWpOS
GcplcFvFeHpR(i1,i2) = -(MFeOS(i2)*cplcFvFeVWpL(i1,i2) - 0.*cplcFvFeVWpR(i1,i2))/MVWpOS
GosZcplcFvFeHpL(i1,i2) = (0.*ZcplcFvFeVWpL(i1,i2) - MFeOS(i2)*ZcplcFvFeVWpR(i1,i2))/MVWpOS
GosZcplcFvFeHpR(i1,i2) = -(MFeOS(i2)*ZcplcFvFeVWpL(i1,i2) - 0.*ZcplcFvFeVWpR(i1,i2))/MVWpOS
GZcplcFvFeHpL(i1,i2) = (0.*ZcplcFvFeVWpL(i1,i2) - MFe(i2)*ZcplcFvFeVWpR(i1,i2))/MVWp
GZcplcFvFeHpR(i1,i2) = -(MFe(i2)*ZcplcFvFeVWpL(i1,i2) - 0.*ZcplcFvFeVWpR(i1,i2))/MVWp
 End Do
End Do 
Do i1=1,3
 Do i2=1,3
GcplcFdFucHpL(i1,i2) = (MFdOS(i1)*cplcFdFucVWpL(i1,i2) - MFuOS(i2)*cplcFdFucVWpR(i1,i2))/MVWpOS
GcplcFdFucHpR(i1,i2) = -(MFuOS(i2)*cplcFdFucVWpL(i1,i2) - MFdOS(i1)*cplcFdFucVWpR(i1,i2))/MVWpOS
GosZcplcFdFucHpL(i1,i2) = (MFdOS(i1)*ZcplcFdFucVWpL(i1,i2) - MFuOS(i2)*ZcplcFdFucVWpR(i1,i2))/MVWpOS
GosZcplcFdFucHpR(i1,i2) = -(MFuOS(i2)*ZcplcFdFucVWpL(i1,i2) - MFdOS(i1)*ZcplcFdFucVWpR(i1,i2))/MVWpOS
GZcplcFdFucHpL(i1,i2) = (MFd(i1)*ZcplcFdFucVWpL(i1,i2) - MFu(i2)*ZcplcFdFucVWpR(i1,i2))/MVWp
GZcplcFdFucHpR(i1,i2) = -(MFu(i2)*ZcplcFdFucVWpL(i1,i2) - MFd(i1)*ZcplcFdFucVWpR(i1,i2))/MVWp
 End Do
End Do 
Do i1=1,3
 Do i2=1,3
GcplcFeFvcHpL(i1,i2) = (MFeOS(i1)*cplcFeFvcVWpL(i1,i2) - 0.*cplcFeFvcVWpR(i1,i2))/MVWpOS
GcplcFeFvcHpR(i1,i2) = -(0.*cplcFeFvcVWpL(i1,i2) - MFeOS(i1)*cplcFeFvcVWpR(i1,i2))/MVWpOS
GosZcplcFeFvcHpL(i1,i2) = (MFeOS(i1)*ZcplcFeFvcVWpL(i1,i2) - 0.*ZcplcFeFvcVWpR(i1,i2))/MVWpOS
GosZcplcFeFvcHpR(i1,i2) = -(0.*ZcplcFeFvcVWpL(i1,i2) - MFeOS(i1)*ZcplcFeFvcVWpR(i1,i2))/MVWpOS
GZcplcFeFvcHpL(i1,i2) = (MFe(i1)*ZcplcFeFvcVWpL(i1,i2) - 0.*ZcplcFeFvcVWpR(i1,i2))/MVWp
GZcplcFeFvcHpR(i1,i2) = -(0.*ZcplcFeFvcVWpL(i1,i2) - MFe(i1)*ZcplcFeFvcVWpR(i1,i2))/MVWp
 End Do
End Do 
End Subroutine  getGBCouplings 

Subroutine WaveFunctionRenormalisation(MFdOS,MFd2OS,MFuOS,MFu2OS,MFeOS,               & 
& MFe2OS,MHpOS,MHp2OS,MAhOS,MAh2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,MVWpOS,MVWp2OS,             & 
& ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,               & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,             & 
& g2,g3,Lam,Yu,Yd,Ye,Mu,v,cplAhAhhh,cplhhhhhh,cplhhHpcHp,cplAhAhAhAh,cplAhAhhhhh,        & 
& cplAhAhHpcHp,cplhhhhhhhh,cplhhhhHpcHp,cplHpHpcHpcHp,cplAhhhVZ,cplAhHpcVWp,             & 
& cplAhcHpVWp,cplhhHpcVWp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplHpcVWpVP,cplHpcVWpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplAhAhcVWpVWp,cplAhAhVZVZ,            & 
& cplAhHpcVWpVP,cplAhHpcVWpVZ,cplAhcHpVPVWp,cplAhcHpVWpVZ,cplhhhhcVWpVWp,cplhhhhVZVZ,    & 
& cplhhHpcVWpVP,cplhhHpcVWpVZ,cplhhcHpVPVWp,cplhhcHpVWpVZ,cplHpcHpVPVP,cplHpcHpVPVZ,     & 
& cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFdFdhhL,               & 
& cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,               & 
& cplcFvFeHpR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,            & 
& cplcFeFvcHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,             & 
& cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFvFeVWpL,             & 
& cplcFvFeVWpR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,              & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFvFvVZL,           & 
& cplcFvFvVZR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,        & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,       & 
& cplcVWpVPVWpVZ3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,              & 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcgGgGVG,cplcgWpgAVWp,               & 
& cplcgWCgAcVWp,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWCVP,      & 
& cplcgAgWCVWp,cplcgZgWCVWp,cplcgWCgWCVZ,cplcgWpgZVWp,cplcgWCgZcVWp,cplcgWpgWpAh,        & 
& cplcgWCgWCAh,cplcgZgAhh,cplcgWpgAHp,cplcgWCgAcHp,cplcgWpgWphh,cplcgZgWpcHp,            & 
& cplcgWCgWChh,cplcgZgWCHp,cplcgZgZhh,cplcgWpgZHp,cplcgWCgZcHp,GcplhhHpcHp,              & 
& GcplAhHpcVWp,GcplAhcHpVWp,GcplhhHpcVWp,GcplhhcHpVWp,GcplHpcHpVP,GcplHpcHpVZ,           & 
& GcplHpcVWpVP,GcplHpcVWpVZ,GcplcHpVPVWp,GcplcHpVWpVZ,GcplcFuFdHpL,GcplcFuFdHpR,         & 
& GcplcFvFeHpL,GcplcFvFeHpR,GcplcFdFucHpL,GcplcFdFucHpR,GcplcFeFvcHpL,GcplcFeFvcHpR,     & 
& dg1,dg2,dg3,dYu,dYd,dYe,dMu,dLam,dv,dZDL,dZDR,dZUL,dZUR,dZEL,dZER,dSinTW,              & 
& dCosTW,dTanTW,ZfVG,ZfHp,ZfvL,ZfAh,Zfhh,ZfVP,ZfVZ,ZfVWp,ZfDL,ZfDR,ZfUL,ZfUR,            & 
& ZfEL,ZfER,ZfVPVZ,ZfVZVP,ctcplAhAhhh,ctcplhhhhhh,ctcplhhHpcHp,ctcplAhhhVZ,              & 
& ctcplAhHpcVWp,ctcplAhcHpVWp,ctcplhhHpcVWp,ctcplhhcHpVWp,ctcplHpcHpVP,ctcplHpcHpVZ,     & 
& ctcplhhcVWpVWp,ctcplhhVZVZ,ctcplHpcVWpVP,ctcplHpcVWpVZ,ctcplcHpVPVWp,ctcplcHpVWpVZ,    & 
& ctcplVGVGVG,ctcplcVWpVPVWp,ctcplcVWpVWpVZ,ctcplcFdFdAhL,ctcplcFdFdAhR,ctcplcFeFeAhL,   & 
& ctcplcFeFeAhR,ctcplcFuFuAhL,ctcplcFuFuAhR,ctcplcFdFdhhL,ctcplcFdFdhhR,ctcplcFuFdHpL,   & 
& ctcplcFuFdHpR,ctcplcFeFehhL,ctcplcFeFehhR,ctcplcFvFeHpL,ctcplcFvFeHpR,ctcplcFuFuhhL,   & 
& ctcplcFuFuhhR,ctcplcFdFucHpL,ctcplcFdFucHpR,ctcplcFeFvcHpL,ctcplcFeFvcHpR,             & 
& ctcplcFdFdVGL,ctcplcFdFdVGR,ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFuFdVWpL,ctcplcFuFdVWpR, & 
& ctcplcFdFdVZL,ctcplcFdFdVZR,ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFvFeVWpL,ctcplcFvFeVWpR, & 
& ctcplcFeFeVZL,ctcplcFeFeVZR,ctcplcFuFuVGL,ctcplcFuFuVGR,ctcplcFuFuVPL,ctcplcFuFuVPR,   & 
& ctcplcFuFuVZL,ctcplcFuFuVZR,ctcplcFdFucVWpL,ctcplcFdFucVWpR,ctcplcFvFvVZL,             & 
& ctcplcFvFvVZR,ctcplcFeFvcVWpL,ctcplcFeFvcVWpR,MLambda,deltaM,kont)

Implicit None 
Real(dp),Intent(inout) :: g1,g2,g3

Complex(dp),Intent(inout) :: Lam,Yu(3,3),Yd(3,3),Ye(3,3),Mu

Real(dp),Intent(inout) :: v

Complex(dp),Intent(in) :: cplAhAhhh,cplhhhhhh,cplhhHpcHp,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,cplhhhhhhhh,      & 
& cplhhhhHpcHp,cplHpHpcHpcHp,cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cplhhHpcVWp,              & 
& cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplhhcVWpVWp,cplhhVZVZ,cplHpcVWpVP,cplHpcVWpVZ,      & 
& cplcHpVPVWp,cplcHpVWpVZ,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhHpcVWpVP,cplAhHpcVWpVZ,        & 
& cplAhcHpVPVWp,cplAhcHpVWpVZ,cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhHpcVWpVP,cplhhHpcVWpVZ,    & 
& cplhhcHpVPVWp,cplhhcHpVWpVZ,cplHpcHpVPVP,cplHpcHpVPVZ,cplHpcHpcVWpVWp,cplHpcHpVZVZ,    & 
& cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),& 
& cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),  & 
& cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFvFeHpL(3,3),  & 
& cplcFvFeHpR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),& 
& cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),& 
& cplcFdFdVPR(3,3),cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),& 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFvFeVWpL(3,3),cplcFvFeVWpR(3,3),cplcFeFeVZL(3,3),& 
& cplcFeFeVZR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),  & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),               & 
& cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),               & 
& cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,& 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2, & 
& cplcVWpcVWpVWpVWp3,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcgGgGVG,         & 
& cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgAgWpcVWp,cplcgZgWpcVWp,      & 
& cplcgWCgWCVP,cplcgAgWCVWp,cplcgZgWCVWp,cplcgWCgWCVZ,cplcgWpgZVWp,cplcgWCgZcVWp,        & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplcgZgAhh,cplcgWpgAHp,cplcgWCgAcHp,cplcgWpgWphh,            & 
& cplcgZgWpcHp,cplcgWCgWChh,cplcgZgWCHp,cplcgZgZhh,cplcgWpgZHp,cplcgWCgZcHp

Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,              & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp),Intent(in) :: MFdOS(3),MFd2OS(3),MFuOS(3),MFu2OS(3),MFeOS(3),MFe2OS(3),MHpOS,MHp2OS,MAhOS,          & 
& MAh2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,MVWpOS,MVWp2OS

Complex(dp),Intent(in) :: ZDLOS(3,3),ZDROS(3,3),ZULOS(3,3),ZUROS(3,3),ZELOS(3,3),ZEROS(3,3)

Complex(dp) :: SigmaLFd(3,3,3),SigmaSLFd(3,3,3),SigmaSRFd(3,3,3),SigmaRFd(3,3,3),DerSigmaLFd(3,3,3), & 
& DerSigmaSLFd(3,3,3),DerSigmaSRFd(3,3,3),DerSigmaRFd(3,3,3),DerSigmaLirFd(3,3,3),       & 
& DerSigmaSLirFd(3,3,3),DerSigmaSRirFd(3,3,3),DerSigmaRirFd(3,3,3),SigmaLFu(3,3,3),      & 
& SigmaSLFu(3,3,3),SigmaSRFu(3,3,3),SigmaRFu(3,3,3),DerSigmaLFu(3,3,3),DerSigmaSLFu(3,3,3),& 
& DerSigmaSRFu(3,3,3),DerSigmaRFu(3,3,3),DerSigmaLirFu(3,3,3),DerSigmaSLirFu(3,3,3),     & 
& DerSigmaSRirFu(3,3,3),DerSigmaRirFu(3,3,3),SigmaLFe(3,3,3),SigmaSLFe(3,3,3),           & 
& SigmaSRFe(3,3,3),SigmaRFe(3,3,3),DerSigmaLFe(3,3,3),DerSigmaSLFe(3,3,3),               & 
& DerSigmaSRFe(3,3,3),DerSigmaRFe(3,3,3),DerSigmaLirFe(3,3,3),DerSigmaSLirFe(3,3,3),     & 
& DerSigmaSRirFe(3,3,3),DerSigmaRirFe(3,3,3),SigmaLFv(3,3,3),SigmaSLFv(3,3,3),           & 
& SigmaSRFv(3,3,3),SigmaRFv(3,3,3),DerSigmaLFv(3,3,3),DerSigmaSLFv(3,3,3),               & 
& DerSigmaSRFv(3,3,3),DerSigmaRFv(3,3,3),DerSigmaLirFv(3,3,3),DerSigmaSLirFv(3,3,3),     & 
& DerSigmaSRirFv(3,3,3),DerSigmaRirFv(3,3,3),PiHp,DerPiHp,PiAh,DerPiAh,Pihh,             & 
& DerPihh,PiVG,DerPiVG,PiVP,DerPiVP,PiVZ,DerPiVZ,PiVWp,DerPiVWp,PiVPlight0,              & 
& DerPiVPlight0,PiVPheavy0,DerPiVPheavy0,PiVPlightMZ,DerPiVPlightMZ,PiVPheavyMZ,         & 
& DerPiVPheavyMZ,PiVPVZ,DerPiVPVZ,PiVZVP,DerPiVZVP,PiVZAh,DerPiVZAh,PiAhVZ,              & 
& DerPiAhVZ,PiVZhh,DerPiVZhh,PihhVZ,DerPihhVZ,PiVWpHp,DerPiVWpHp,PiHpVWp,DerPiHpVWp

Complex(dp) :: SigmaLFdDR(3,3,3),SigmaSLFdDR(3,3,3),SigmaSRFdDR(3,3,3),SigmaRFdDR(3,3,3),            & 
& DerSigmaLFdDR(3,3,3),DerSigmaSLFdDR(3,3,3),DerSigmaSRFdDR(3,3,3),DerSigmaRFdDR(3,3,3), & 
& DerSigmaLirFdDR(3,3,3),DerSigmaSLirFdDR(3,3,3),DerSigmaSRirFdDR(3,3,3),DerSigmaRirFdDR(3,3,3),& 
& SigmaLFuDR(3,3,3),SigmaSLFuDR(3,3,3),SigmaSRFuDR(3,3,3),SigmaRFuDR(3,3,3),             & 
& DerSigmaLFuDR(3,3,3),DerSigmaSLFuDR(3,3,3),DerSigmaSRFuDR(3,3,3),DerSigmaRFuDR(3,3,3), & 
& DerSigmaLirFuDR(3,3,3),DerSigmaSLirFuDR(3,3,3),DerSigmaSRirFuDR(3,3,3),DerSigmaRirFuDR(3,3,3),& 
& SigmaLFeDR(3,3,3),SigmaSLFeDR(3,3,3),SigmaSRFeDR(3,3,3),SigmaRFeDR(3,3,3),             & 
& DerSigmaLFeDR(3,3,3),DerSigmaSLFeDR(3,3,3),DerSigmaSRFeDR(3,3,3),DerSigmaRFeDR(3,3,3), & 
& DerSigmaLirFeDR(3,3,3),DerSigmaSLirFeDR(3,3,3),DerSigmaSRirFeDR(3,3,3),DerSigmaRirFeDR(3,3,3),& 
& SigmaLFvDR(3,3,3),SigmaSLFvDR(3,3,3),SigmaSRFvDR(3,3,3),SigmaRFvDR(3,3,3),             & 
& DerSigmaLFvDR(3,3,3),DerSigmaSLFvDR(3,3,3),DerSigmaSRFvDR(3,3,3),DerSigmaRFvDR(3,3,3), & 
& DerSigmaLirFvDR(3,3,3),DerSigmaSLirFvDR(3,3,3),DerSigmaSRirFvDR(3,3,3),DerSigmaRirFvDR(3,3,3),& 
& PiHpDR,DerPiHpDR,PiAhDR,DerPiAhDR,PihhDR,DerPihhDR,PiVGDR,DerPiVGDR,PiVPDR,            & 
& DerPiVPDR,PiVZDR,DerPiVZDR,PiVWpDR,DerPiVWpDR,PiVPlight0DR,DerPiVPlight0DR,            & 
& PiVPheavy0DR,DerPiVPheavy0DR,PiVPlightMZDR,DerPiVPlightMZDR,PiVPheavyMZDR,             & 
& DerPiVPheavyMZDR,PiVPVZDR,DerPiVPVZDR,PiVZVPDR,DerPiVZVPDR,PiVZAhDR,DerPiVZAhDR,       & 
& PiAhVZDR,DerPiAhVZDR,PiVZhhDR,DerPiVZhhDR,PihhVZDR,DerPihhVZDR,PiVWpHpDR,              & 
& DerPiVWpHpDR,PiHpVWpDR,DerPiHpVWpDR

Complex(dp) :: SigmaLFdOS(3,3,3),SigmaSLFdOS(3,3,3),SigmaSRFdOS(3,3,3),SigmaRFdOS(3,3,3),            & 
& DerSigmaLFdOS(3,3,3),DerSigmaSLFdOS(3,3,3),DerSigmaSRFdOS(3,3,3),DerSigmaRFdOS(3,3,3), & 
& DerSigmaLirFdOS(3,3,3),DerSigmaSLirFdOS(3,3,3),DerSigmaSRirFdOS(3,3,3),DerSigmaRirFdOS(3,3,3),& 
& SigmaLFuOS(3,3,3),SigmaSLFuOS(3,3,3),SigmaSRFuOS(3,3,3),SigmaRFuOS(3,3,3),             & 
& DerSigmaLFuOS(3,3,3),DerSigmaSLFuOS(3,3,3),DerSigmaSRFuOS(3,3,3),DerSigmaRFuOS(3,3,3), & 
& DerSigmaLirFuOS(3,3,3),DerSigmaSLirFuOS(3,3,3),DerSigmaSRirFuOS(3,3,3),DerSigmaRirFuOS(3,3,3),& 
& SigmaLFeOS(3,3,3),SigmaSLFeOS(3,3,3),SigmaSRFeOS(3,3,3),SigmaRFeOS(3,3,3),             & 
& DerSigmaLFeOS(3,3,3),DerSigmaSLFeOS(3,3,3),DerSigmaSRFeOS(3,3,3),DerSigmaRFeOS(3,3,3), & 
& DerSigmaLirFeOS(3,3,3),DerSigmaSLirFeOS(3,3,3),DerSigmaSRirFeOS(3,3,3),DerSigmaRirFeOS(3,3,3),& 
& SigmaLFvOS(3,3,3),SigmaSLFvOS(3,3,3),SigmaSRFvOS(3,3,3),SigmaRFvOS(3,3,3),             & 
& DerSigmaLFvOS(3,3,3),DerSigmaSLFvOS(3,3,3),DerSigmaSRFvOS(3,3,3),DerSigmaRFvOS(3,3,3), & 
& DerSigmaLirFvOS(3,3,3),DerSigmaSLirFvOS(3,3,3),DerSigmaSRirFvOS(3,3,3),DerSigmaRirFvOS(3,3,3),& 
& PiHpOS,DerPiHpOS,PiAhOS,DerPiAhOS,PihhOS,DerPihhOS,PiVGOS,DerPiVGOS,PiVPOS,            & 
& DerPiVPOS,PiVZOS,DerPiVZOS,PiVWpOS,DerPiVWpOS,PiVPlight0OS,DerPiVPlight0OS,            & 
& PiVPheavy0OS,DerPiVPheavy0OS,PiVPlightMZOS,DerPiVPlightMZOS,PiVPheavyMZOS,             & 
& DerPiVPheavyMZOS,PiVPVZOS,DerPiVPVZOS,PiVZVPOS,DerPiVZVPOS,PiVZAhOS,DerPiVZAhOS,       & 
& PiAhVZOS,DerPiAhVZOS,PiVZhhOS,DerPiVZhhOS,PihhVZOS,DerPihhVZOS,PiVWpHpOS,              & 
& DerPiVWpHpOS,PiHpVWpOS,DerPiHpVWpOS

Real(dp), Intent(in) :: MLambda, deltaM 

Integer, Intent(out) :: kont 
Real(dp),Intent(out) :: dg1,dg2,dg3,dv,dSinTW,dCosTW,dTanTW

Complex(dp),Intent(out) :: dYu(3,3),dYd(3,3),dYe(3,3),dMu,dLam,dZDL(3,3),dZDR(3,3),dZUL(3,3),dZUR(3,3),          & 
& dZEL(3,3),dZER(3,3)

Complex(dp),Intent(out) :: ZfVG,ZfHp,ZfvL(3,3),ZfAh,Zfhh,ZfVP,ZfVZ,ZfVWp,ZfDL(3,3),ZfDR(3,3),ZfUL(3,3),          & 
& ZfUR(3,3),ZfEL(3,3),ZfER(3,3),ZfVPVZ,ZfVZVP

Complex(dp),Intent(out) :: ctcplAhAhhh,ctcplhhhhhh,ctcplhhHpcHp,ctcplAhhhVZ,ctcplAhHpcVWp,ctcplAhcHpVWp,         & 
& ctcplhhHpcVWp,ctcplhhcHpVWp,ctcplHpcHpVP,ctcplHpcHpVZ,ctcplhhcVWpVWp,ctcplhhVZVZ,      & 
& ctcplHpcVWpVP,ctcplHpcVWpVZ,ctcplcHpVPVWp,ctcplcHpVWpVZ,ctcplVGVGVG,ctcplcVWpVPVWp,    & 
& ctcplcVWpVWpVZ,ctcplcFdFdAhL(3,3),ctcplcFdFdAhR(3,3),ctcplcFeFeAhL(3,3),               & 
& ctcplcFeFeAhR(3,3),ctcplcFuFuAhL(3,3),ctcplcFuFuAhR(3,3),ctcplcFdFdhhL(3,3),           & 
& ctcplcFdFdhhR(3,3),ctcplcFuFdHpL(3,3),ctcplcFuFdHpR(3,3),ctcplcFeFehhL(3,3),           & 
& ctcplcFeFehhR(3,3),ctcplcFvFeHpL(3,3),ctcplcFvFeHpR(3,3),ctcplcFuFuhhL(3,3),           & 
& ctcplcFuFuhhR(3,3),ctcplcFdFucHpL(3,3),ctcplcFdFucHpR(3,3),ctcplcFeFvcHpL(3,3),        & 
& ctcplcFeFvcHpR(3,3),ctcplcFdFdVGL(3,3),ctcplcFdFdVGR(3,3),ctcplcFdFdVPL(3,3),          & 
& ctcplcFdFdVPR(3,3),ctcplcFuFdVWpL(3,3),ctcplcFuFdVWpR(3,3),ctcplcFdFdVZL(3,3),         & 
& ctcplcFdFdVZR(3,3),ctcplcFeFeVPL(3,3),ctcplcFeFeVPR(3,3),ctcplcFvFeVWpL(3,3),          & 
& ctcplcFvFeVWpR(3,3),ctcplcFeFeVZL(3,3),ctcplcFeFeVZR(3,3),ctcplcFuFuVGL(3,3),          & 
& ctcplcFuFuVGR(3,3),ctcplcFuFuVPL(3,3),ctcplcFuFuVPR(3,3),ctcplcFuFuVZL(3,3),           & 
& ctcplcFuFuVZR(3,3),ctcplcFdFucVWpL(3,3),ctcplcFdFucVWpR(3,3),ctcplcFvFvVZL(3,3),       & 
& ctcplcFvFvVZR(3,3),ctcplcFeFvcVWpL(3,3),ctcplcFeFvcVWpR(3,3)

Complex(dp),Intent(in) :: GcplhhHpcHp,GcplAhHpcVWp,GcplAhcHpVWp,GcplhhHpcVWp,GcplhhcHpVWp,GcplHpcHpVP,          & 
& GcplHpcHpVZ,GcplHpcVWpVP,GcplHpcVWpVZ,GcplcHpVPVWp,GcplcHpVWpVZ,GcplcFuFdHpL(3,3),     & 
& GcplcFuFdHpR(3,3),GcplcFvFeHpL(3,3),GcplcFvFeHpR(3,3),GcplcFdFucHpL(3,3),              & 
& GcplcFdFucHpR(3,3),GcplcFeFvcHpL(3,3),GcplcFeFvcHpR(3,3)

Real(dp) ::  g1D(62) 
Real(dp) :: p2 
Logical :: TwoLoopRGEsave 
Real(dp) ::MVG,MVP,MVG2,MVP2
Complex(dp) ::  Tad1Loop(1)
Complex(dp) :: MatTad_hh(1,1)=0._dp 
Integer :: i1,i2,i3 

MVG = MLambda 
MVP = MLambda 
MVG2 = MLambda**2 
MVP2 = MLambda**2 

Call OneLoopTadpoleshh(v,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,            & 
& MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,    & 
& cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,cplhhhhhh,cplhhHpcHp,     & 
& cplhhcVWpVWp,cplhhVZVZ,Tad1Loop(1:1))

MatTad_hh(1,1) = Tad1Loop(1) 
! Not working!! 
MatTad_hh= 0._dp
!--------------------------
!Fd
!--------------------------
Do i1=1,3
p2 =MFd2(i1)
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MHp,MHp2,MFu,MFu2,           & 
& MVWp,MVWp2,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,    & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,SigmaLFd(i1,:,:),SigmaRFd(i1,:,:),SigmaSLFd(i1,:,:)        & 
& ,SigmaSRFd(i1,:,:))

Call DerSigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MHp,MHp2,MFu,             & 
& MFu2,MVWp,MVWp2,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,           & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,              & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,DerSigmaLFd(i1,:,:),DerSigmaRFd(i1,:,:)       & 
& ,DerSigmaSLFd(i1,:,:),DerSigmaSRFd(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerSigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MHp,MHp2,MFu,             & 
& MFu2,MVWp,MVWp2,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,           & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,              & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,DerSigmaLFdDR(i1,:,:),DerSigmaRFdDR(i1,:,:)   & 
& ,DerSigmaSLFdDR(i1,:,:),DerSigmaSRFdDR(i1,:,:))

p2 =MFd2OS(i1)
Call DerSigma1LoopFd(p2,MFdOS,MFd2OS,MAhOS,MAh2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,          & 
& MHpOS,MHp2OS,MFuOS,MFu2OS,MVWpOS,MVWp2OS,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,DerSigmaLFdOS(i1,:,:)& 
& ,DerSigmaRFdOS(i1,:,:),DerSigmaSLFdOS(i1,:,:),DerSigmaSRFdOS(i1,:,:))

DerSigmaLFd(i1,:,:) = DerSigmaLFd(i1,:,:) - DerSigmaLFdDR(i1,:,:)! + DerSigmaLFdOS(i1,:,:)
DerSigmaRFd(i1,:,:) = DerSigmaRFd(i1,:,:) - DerSigmaRFdDR(i1,:,:)! + DerSigmaRFdOS(i1,:,:)
DerSigmaSLFd(i1,:,:) = DerSigmaSLFd(i1,:,:) - DerSigmaSLFdDR(i1,:,:)! + DerSigmaSLFdOS(i1,:,:)
DerSigmaSRFd(i1,:,:) = DerSigmaSRFd(i1,:,:) - DerSigmaSRFdDR(i1,:,:)! + DerSigmaSRFdOS(i1,:,:)
DerSigmaLirFd(i1,:,:) = + DerSigmaLFdOS(i1,:,:)
DerSigmaRirFd(i1,:,:) = + DerSigmaRFdOS(i1,:,:)
DerSigmaSLirFd(i1,:,:) = + DerSigmaSLFdOS(i1,:,:)
DerSigmaSRirFd(i1,:,:) = + DerSigmaSRFdOS(i1,:,:)
IRdivonly=.False. 
Else
DerSigmaLirFd(i1,:,:) = 0._dp
DerSigmaRirFd(i1,:,:) = 0._dp
DerSigmaSLirFd(i1,:,:) = 0._dp
DerSigmaSRirFd(i1,:,:) = 0._dp
End if
End do


!--------------------------
!Fu
!--------------------------
Do i1=1,3
p2 =MFu2(i1)
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MHp,MHp2,MFd,MFd2,MVWp,MVWp2,Mhh,              & 
& Mhh2,MVZ,MVZ2,cplcFuFuAhL,cplcFuFuAhR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,            & 
& cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,              & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,SigmaLFu(i1,:,:),SigmaRFu(i1,:,:),SigmaSLFu(i1,:,:)& 
& ,SigmaSRFu(i1,:,:))

Call DerSigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MHp,MHp2,MFd,MFd2,MVWp,MVWp2,               & 
& Mhh,Mhh2,MVZ,MVZ2,cplcFuFuAhL,cplcFuFuAhR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,        & 
& cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,              & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,DerSigmaLFu(i1,:,:),DerSigmaRFu(i1,:,:)            & 
& ,DerSigmaSLFu(i1,:,:),DerSigmaSRFu(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerSigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MHp,MHp2,MFd,MFd2,MVWp,MVWp2,               & 
& Mhh,Mhh2,MVZ,MVZ2,cplcFuFuAhL,cplcFuFuAhR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,        & 
& cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,              & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,DerSigmaLFuDR(i1,:,:),DerSigmaRFuDR(i1,:,:)        & 
& ,DerSigmaSLFuDR(i1,:,:),DerSigmaSRFuDR(i1,:,:))

p2 =MFu2OS(i1)
Call DerSigma1LoopFu(p2,MFuOS,MFu2OS,MAhOS,MAh2OS,MHpOS,MHp2OS,MFdOS,MFd2OS,          & 
& MVWpOS,MVWp2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,cplcFuFuAhL,cplcFuFuAhR,cplcFuFdHpL,          & 
& cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,             & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,DerSigmaLFuOS(i1,:,:)      & 
& ,DerSigmaRFuOS(i1,:,:),DerSigmaSLFuOS(i1,:,:),DerSigmaSRFuOS(i1,:,:))

DerSigmaLFu(i1,:,:) = DerSigmaLFu(i1,:,:) - DerSigmaLFuDR(i1,:,:)! + DerSigmaLFuOS(i1,:,:)
DerSigmaRFu(i1,:,:) = DerSigmaRFu(i1,:,:) - DerSigmaRFuDR(i1,:,:)! + DerSigmaRFuOS(i1,:,:)
DerSigmaSLFu(i1,:,:) = DerSigmaSLFu(i1,:,:) - DerSigmaSLFuDR(i1,:,:)! + DerSigmaSLFuOS(i1,:,:)
DerSigmaSRFu(i1,:,:) = DerSigmaSRFu(i1,:,:) - DerSigmaSRFuDR(i1,:,:)! + DerSigmaSRFuOS(i1,:,:)
DerSigmaLirFu(i1,:,:) = + DerSigmaLFuOS(i1,:,:)
DerSigmaRirFu(i1,:,:) = + DerSigmaRFuOS(i1,:,:)
DerSigmaSLirFu(i1,:,:) = + DerSigmaSLFuOS(i1,:,:)
DerSigmaSRirFu(i1,:,:) = + DerSigmaSRFuOS(i1,:,:)
IRdivonly=.False. 
Else
DerSigmaLirFu(i1,:,:) = 0._dp
DerSigmaRirFu(i1,:,:) = 0._dp
DerSigmaSLirFu(i1,:,:) = 0._dp
DerSigmaSRirFu(i1,:,:) = 0._dp
End if
End do


!--------------------------
!Fe
!--------------------------
Do i1=1,3
p2 =MFe2(i1)
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MHp,MHp2,MVWp,               & 
& MVWp2,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& SigmaLFe(i1,:,:),SigmaRFe(i1,:,:),SigmaSLFe(i1,:,:),SigmaSRFe(i1,:,:))

Call DerSigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MHp,MHp2,MVWp,            & 
& MVWp2,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& DerSigmaLFe(i1,:,:),DerSigmaRFe(i1,:,:),DerSigmaSLFe(i1,:,:),DerSigmaSRFe(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerSigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MHp,MHp2,MVWp,            & 
& MVWp2,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& DerSigmaLFeDR(i1,:,:),DerSigmaRFeDR(i1,:,:),DerSigmaSLFeDR(i1,:,:),DerSigmaSRFeDR(i1,:,:))

p2 =MFe2OS(i1)
Call DerSigma1LoopFe(p2,MFeOS,MFe2OS,MAhOS,MAh2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,          & 
& MHpOS,MHp2OS,MVWpOS,MVWp2OS,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,             & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,DerSigmaLFeOS(i1,:,:),DerSigmaRFeOS(i1,:,:),               & 
& DerSigmaSLFeOS(i1,:,:),DerSigmaSRFeOS(i1,:,:))

DerSigmaLFe(i1,:,:) = DerSigmaLFe(i1,:,:) - DerSigmaLFeDR(i1,:,:)! + DerSigmaLFeOS(i1,:,:)
DerSigmaRFe(i1,:,:) = DerSigmaRFe(i1,:,:) - DerSigmaRFeDR(i1,:,:)! + DerSigmaRFeOS(i1,:,:)
DerSigmaSLFe(i1,:,:) = DerSigmaSLFe(i1,:,:) - DerSigmaSLFeDR(i1,:,:)! + DerSigmaSLFeOS(i1,:,:)
DerSigmaSRFe(i1,:,:) = DerSigmaSRFe(i1,:,:) - DerSigmaSRFeDR(i1,:,:)! + DerSigmaSRFeOS(i1,:,:)
DerSigmaLirFe(i1,:,:) = + DerSigmaLFeOS(i1,:,:)
DerSigmaRirFe(i1,:,:) = + DerSigmaRFeOS(i1,:,:)
DerSigmaSLirFe(i1,:,:) = + DerSigmaSLFeOS(i1,:,:)
DerSigmaSRirFe(i1,:,:) = + DerSigmaSRFeOS(i1,:,:)
IRdivonly=.False. 
Else
DerSigmaLirFe(i1,:,:) = 0._dp
DerSigmaRirFe(i1,:,:) = 0._dp
DerSigmaSLirFe(i1,:,:) = 0._dp
DerSigmaSRirFe(i1,:,:) = 0._dp
End if
End do


!--------------------------
!Fv
!--------------------------
Do i1=1,3
p2 =0._dp
Call Sigma1LoopFv(p2,MHp,MHp2,MFe,MFe2,MVWp,MVWp2,MVZ,MVZ2,cplcFvFeHpL,               & 
& cplcFvFeHpR,cplcFvFeVWpL,cplcFvFeVWpR,cplcFvFvVZL,cplcFvFvVZR,SigmaLFv(i1,:,:)         & 
& ,SigmaRFv(i1,:,:),SigmaSLFv(i1,:,:),SigmaSRFv(i1,:,:))

Call DerSigma1LoopFv(p2,MHp,MHp2,MFe,MFe2,MVWp,MVWp2,MVZ,MVZ2,cplcFvFeHpL,            & 
& cplcFvFeHpR,cplcFvFeVWpL,cplcFvFeVWpR,cplcFvFvVZL,cplcFvFvVZR,DerSigmaLFv(i1,:,:)      & 
& ,DerSigmaRFv(i1,:,:),DerSigmaSLFv(i1,:,:),DerSigmaSRFv(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerSigma1LoopFv(p2,MHp,MHp2,MFe,MFe2,MVWp,MVWp2,MVZ,MVZ2,cplcFvFeHpL,            & 
& cplcFvFeHpR,cplcFvFeVWpL,cplcFvFeVWpR,cplcFvFvVZL,cplcFvFvVZR,DerSigmaLFvDR(i1,:,:)    & 
& ,DerSigmaRFvDR(i1,:,:),DerSigmaSLFvDR(i1,:,:),DerSigmaSRFvDR(i1,:,:))

p2 =0._dp
Call DerSigma1LoopFv(p2,MHpOS,MHp2OS,MFeOS,MFe2OS,MVWpOS,MVWp2OS,MVZOS,               & 
& MVZ2OS,cplcFvFeHpL,cplcFvFeHpR,cplcFvFeVWpL,cplcFvFeVWpR,cplcFvFvVZL,cplcFvFvVZR,      & 
& DerSigmaLFvOS(i1,:,:),DerSigmaRFvOS(i1,:,:),DerSigmaSLFvOS(i1,:,:),DerSigmaSRFvOS(i1,:,:))

DerSigmaLFv(i1,:,:) = DerSigmaLFv(i1,:,:) - DerSigmaLFvDR(i1,:,:)! + DerSigmaLFvOS(i1,:,:)
DerSigmaRFv(i1,:,:) = DerSigmaRFv(i1,:,:) - DerSigmaRFvDR(i1,:,:)! + DerSigmaRFvOS(i1,:,:)
DerSigmaSLFv(i1,:,:) = DerSigmaSLFv(i1,:,:) - DerSigmaSLFvDR(i1,:,:)! + DerSigmaSLFvOS(i1,:,:)
DerSigmaSRFv(i1,:,:) = DerSigmaSRFv(i1,:,:) - DerSigmaSRFvDR(i1,:,:)! + DerSigmaSRFvOS(i1,:,:)
DerSigmaLirFv(i1,:,:) = + DerSigmaLFvOS(i1,:,:)
DerSigmaRirFv(i1,:,:) = + DerSigmaRFvOS(i1,:,:)
DerSigmaSLirFv(i1,:,:) = + DerSigmaSLFvOS(i1,:,:)
DerSigmaSRirFv(i1,:,:) = + DerSigmaSRFvOS(i1,:,:)
IRdivonly=.False. 
Else
DerSigmaLirFv(i1,:,:) = 0._dp
DerSigmaRirFv(i1,:,:) = 0._dp
DerSigmaSLirFv(i1,:,:) = 0._dp
DerSigmaSRirFv(i1,:,:) = 0._dp
End if
End do


!--------------------------
!Hp
!--------------------------
p2 = MHp2
Call Pi1LoopHp(p2,MVWp,MVWp2,MAh,MAh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MHp,MHp2,            & 
& Mhh,Mhh2,MVZ,MVZ2,cplAhcHpVWp,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,     & 
& cplcgZgWpcHp,cplcgWpgZHp,cplcgWCgZcHp,cplcgZgWCHp,cplhhHpcHp,cplhhcHpVWp,              & 
& cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplAhAhHpcHp,cplhhhhHpcHp,               & 
& cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,kont,PiHp)

Call DerPi1LoopHp(p2,MVWp,MVWp2,MAh,MAh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MHp,              & 
& MHp2,Mhh,Mhh2,MVZ,MVZ2,cplAhcHpVWp,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,             & 
& cplcFeFvcHpR,cplcgZgWpcHp,cplcgWpgZHp,cplcgWCgZcHp,cplcgZgWCHp,cplhhHpcHp,             & 
& cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplAhAhHpcHp,cplhhhhHpcHp,   & 
& cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,kont,DerPiHp)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopHp(p2,MVWp,MVWp2,MAh,MAh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MHp,              & 
& MHp2,Mhh,Mhh2,MVZ,MVZ2,cplAhcHpVWp,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,             & 
& cplcFeFvcHpR,cplcgZgWpcHp,cplcgWpgZHp,cplcgWCgZcHp,cplcgZgWCHp,cplhhHpcHp,             & 
& cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplAhAhHpcHp,cplhhhhHpcHp,   & 
& cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,kont,DerPiHpDR)

p2 = MHp2OS
Call DerPi1LoopHp(p2,MVWpOS,MVWp2OS,MAhOS,MAh2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,           & 
& MFeOS,MFe2OS,MHpOS,MHp2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,GcplAhcHpVWp,GcplcFdFucHpL,        & 
& GcplcFdFucHpR,GcplcFeFvcHpL,GcplcFeFvcHpR,cplcgZgWpcHp,cplcgWpgZHp,cplcgWCgZcHp,       & 
& cplcgZgWCHp,GcplhhHpcHp,GcplhhcHpVWp,GcplHpcHpVP,GcplHpcHpVZ,GcplcHpVPVWp,             & 
& GcplcHpVWpVZ,cplAhAhHpcHp,cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,     & 
& cplHpcHpVZVZ,kont,DerPiHpOS)

DerPiHp = DerPiHp-DerPiHpDR + DerPiHpOS
IRdivonly=.False. 
End if 
!--------------------------
!Ah
!--------------------------
p2 = MAh2
Call Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,              & 
& MVWp,MVWp2,MHp,MHp2,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,         & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVZ,cplAhHpcVWp,               & 
& cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,cplAhAhcVWpVWp,cplAhAhVZVZ,kont,PiAh)

Call DerPi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,           & 
& MVWp,MVWp2,MHp,MHp2,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,         & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVZ,cplAhHpcVWp,               & 
& cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,cplAhAhcVWpVWp,cplAhAhVZVZ,kont,DerPiAh)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,           & 
& MVWp,MVWp2,MHp,MHp2,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,         & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVZ,cplAhHpcVWp,               & 
& cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,cplAhAhcVWpVWp,cplAhAhVZVZ,kont,DerPiAhDR)

p2 = MAh2OS
Call DerPi1LoopAh(p2,MhhOS,Mhh2OS,MAhOS,MAh2OS,MFdOS,MFd2OS,MFeOS,MFe2OS,             & 
& MFuOS,MFu2OS,MVZOS,MVZ2OS,MVWpOS,MVWp2OS,MHpOS,MHp2OS,cplAhAhhh,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,              & 
& cplcgWCgWCAh,cplAhhhVZ,GcplAhHpcVWp,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,              & 
& cplAhAhcVWpVWp,cplAhAhVZVZ,kont,DerPiAhOS)

DerPiAh = DerPiAh-DerPiAhDR + DerPiAhOS
IRdivonly=.False. 
End if 
!--------------------------
!hh
!--------------------------
p2 = Mhh2
Call Pi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,              & 
& MHp,MHp2,MVWp,MVWp2,cplAhAhhh,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,           & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,              & 
& cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcVWpVWp,cplhhVZVZ,cplAhAhhhhh,cplhhhhhhhh,       & 
& cplhhhhHpcHp,cplhhhhcVWpVWp,cplhhhhVZVZ,kont,Pihh)

Call DerPi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,           & 
& MHp,MHp2,MVWp,MVWp2,cplAhAhhh,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,           & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,              & 
& cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcVWpVWp,cplhhVZVZ,cplAhAhhhhh,cplhhhhhhhh,       & 
& cplhhhhHpcHp,cplhhhhcVWpVWp,cplhhhhVZVZ,kont,DerPihh)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,           & 
& MHp,MHp2,MVWp,MVWp2,cplAhAhhh,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,           & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,              & 
& cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcVWpVWp,cplhhVZVZ,cplAhAhhhhh,cplhhhhhhhh,       & 
& cplhhhhHpcHp,cplhhhhcVWpVWp,cplhhhhVZVZ,kont,DerPihhDR)

p2 = Mhh2OS
Call DerPi1Loophh(p2,MAhOS,MAh2OS,MVZOS,MVZ2OS,MFdOS,MFd2OS,MFeOS,MFe2OS,             & 
& MFuOS,MFu2OS,MhhOS,Mhh2OS,MHpOS,MHp2OS,MVWpOS,MVWp2OS,cplAhAhhh,cplAhhhVZ,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,cplhhhhhh,GcplhhHpcHp,GcplhhHpcVWp,               & 
& cplhhcVWpVWp,cplhhVZVZ,cplAhAhhhhh,cplhhhhhhhh,cplhhhhHpcHp,cplhhhhcVWpVWp,            & 
& cplhhhhVZVZ,kont,DerPihhOS)

DerPihh = DerPihh-DerPihhDR + DerPihhOS
IRdivonly=.False. 
End if 
!--------------------------
!VG
!--------------------------
p2 = MVG2
Call Pi1LoopVG(p2,MFd,MFd2,MFu,MFu2,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,              & 
& cplcFuFuVGR,cplcgGgGVG,cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,               & 
& kont,PiVG)

Call DerPi1LoopVG(p2,MFd,MFd2,MFu,MFu2,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,           & 
& cplcFuFuVGR,cplcgGgGVG,cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,               & 
& kont,DerPiVG)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVG(p2,MFd,MFd2,MFu,MFu2,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,           & 
& cplcFuFuVGR,cplcgGgGVG,cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,               & 
& kont,DerPiVGDR)

p2 = 0.
Call DerPi1LoopVG(p2,MFdOS,MFd2OS,MFuOS,MFu2OS,cplcFdFdVGL,cplcFdFdVGR,               & 
& cplcFuFuVGL,cplcFuFuVGR,cplcgGgGVG,cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,   & 
& kont,DerPiVGOS)

DerPiVG = DerPiVG-DerPiVGDR + DerPiVGOS
IRdivonly=.False. 
End if 
!--------------------------
!VP
!--------------------------
p2 = MVP2
Call Pi1LoopVP(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHp,MHp2,MVWp,MVWp2,cplcFdFdVPL,         & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,              & 
& cplcgWCgWCVP,cplHpcHpVP,cplHpcVWpVP,cplcVWpVPVWp,cplHpcHpVPVP,cplcVWpVPVPVWp3,         & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,PiVP)

Call DerPi1LoopVP(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHp,MHp2,MVWp,MVWp2,cplcFdFdVPL,      & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,              & 
& cplcgWCgWCVP,cplHpcHpVP,cplHpcVWpVP,cplcVWpVPVWp,cplHpcHpVPVP,cplcVWpVPVPVWp3,         & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,DerPiVP)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVP(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHp,MHp2,MVWp,MVWp2,cplcFdFdVPL,      & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,              & 
& cplcgWCgWCVP,cplHpcHpVP,cplHpcVWpVP,cplcVWpVPVWp,cplHpcHpVPVP,cplcVWpVPVPVWp3,         & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,DerPiVPDR)

p2 = 0.
Call DerPi1LoopVP(p2,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MHpOS,MHp2OS,             & 
& MVWpOS,MVWp2OS,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,            & 
& cplcFuFuVPR,cplcgWpgWpVP,cplcgWCgWCVP,GcplHpcHpVP,GcplHpcVWpVP,cplcVWpVPVWp,           & 
& cplHpcHpVPVP,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,DerPiVPOS)

DerPiVP = DerPiVP-DerPiVPDR + DerPiVPOS
IRdivonly=.False. 
End if 
!--------------------------
!VZ
!--------------------------
p2 = MVZ2
Call Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,              & 
& MHp,MHp2,MVWp,MVWp2,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,             & 
& cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,    & 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,PiVZ)

Call DerPi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,           & 
& MHp,MHp2,MVWp,MVWp2,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,             & 
& cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,    & 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,DerPiVZ)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,           & 
& MHp,MHp2,MVWp,MVWp2,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,             & 
& cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,    & 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,DerPiVZDR)

p2 = MVZ2OS
Call DerPi1LoopVZ(p2,MhhOS,Mhh2OS,MAhOS,MAh2OS,MFdOS,MFd2OS,MFeOS,MFe2OS,             & 
& MFuOS,MFu2OS,MVZOS,MVZ2OS,MHpOS,MHp2OS,MVWpOS,MVWp2OS,cplAhhhVZ,cplcFdFdVZL,           & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,               & 
& cplcFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,GcplHpcHpVZ,GcplHpcVWpVZ,              & 
& cplcVWpVWpVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,     & 
& cplcVWpVWpVZVZ3,kont,DerPiVZOS)

DerPiVZ = DerPiVZ-DerPiVZDR + DerPiVZOS
IRdivonly=.False. 
End if 
!--------------------------
!VWp
!--------------------------
p2 = MVWp2
Call Pi1LoopVWp(p2,MHp,MHp2,MAh,MAh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,Mhh,Mhh2,             & 
& MVWp,MVWp2,MVZ,MVZ2,cplAhHpcVWp,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,             & 
& cplcFeFvcVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgZcVWp,cplhhHpcVWp,     & 
& cplhhcVWpVWp,cplHpcVWpVP,cplHpcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplAhAhcVWpVWp,         & 
& cplhhhhcVWpVWp,cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,        & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,              & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,PiVWp)

Call DerPi1LoopVWp(p2,MHp,MHp2,MAh,MAh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,Mhh,               & 
& Mhh2,MVWp,MVWp2,MVZ,MVZ2,cplAhHpcVWp,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,        & 
& cplcFeFvcVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgZcVWp,cplhhHpcVWp,     & 
& cplhhcVWpVWp,cplHpcVWpVP,cplHpcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplAhAhcVWpVWp,         & 
& cplhhhhcVWpVWp,cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,        & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,              & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,DerPiVWp)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVWp(p2,MHp,MHp2,MAh,MAh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,Mhh,               & 
& Mhh2,MVWp,MVWp2,MVZ,MVZ2,cplAhHpcVWp,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,        & 
& cplcFeFvcVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgZcVWp,cplhhHpcVWp,     & 
& cplhhcVWpVWp,cplHpcVWpVP,cplHpcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplAhAhcVWpVWp,         & 
& cplhhhhcVWpVWp,cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,        & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,              & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,DerPiVWpDR)

p2 = MVWp2OS
Call DerPi1LoopVWp(p2,MHpOS,MHp2OS,MAhOS,MAh2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,            & 
& MFeOS,MFe2OS,MhhOS,Mhh2OS,MVWpOS,MVWp2OS,MVZOS,MVZ2OS,GcplAhHpcVWp,cplcFdFucVWpL,      & 
& cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,   & 
& cplcgWCgZcVWp,GcplhhHpcVWp,cplhhcVWpVWp,GcplHpcVWpVP,GcplHpcVWpVZ,cplcVWpVPVWp,        & 
& cplcVWpVWpVZ,cplAhAhcVWpVWp,cplhhhhcVWpVWp,cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,            & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,& 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,DerPiVWpOS)

DerPiVWp = DerPiVWp-DerPiVWpDR + DerPiVWpOS
IRdivonly=.False. 
End if 
!--------------------------
! Additional Self-Energies for Photon
!--------------------------
p2 = 0._dp
OnlyLightStates = .True. 
Call Pi1LoopVP(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHp,MHp2,MVWp,MVWp2,cplcFdFdVPL,         & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,              & 
& cplcgWCgWCVP,cplHpcHpVP,cplHpcVWpVP,cplcVWpVPVWp,cplHpcHpVPVP,cplcVWpVPVPVWp3,         & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,PiVPlight0)

Call DerPi1LoopVP(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHp,MHp2,MVWp,MVWp2,cplcFdFdVPL,      & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,              & 
& cplcgWCgWCVP,cplHpcHpVP,cplHpcVWpVP,cplcVWpVPVWp,cplHpcHpVPVP,cplcVWpVPVPVWp3,         & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,DerPiVPlight0)

OnlyLightStates = .False. 
p2 = 0._dp
OnlyHeavyStates = .True. 
Call Pi1LoopVP(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHp,MHp2,MVWp,MVWp2,cplcFdFdVPL,         & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,              & 
& cplcgWCgWCVP,cplHpcHpVP,cplHpcVWpVP,cplcVWpVPVWp,cplHpcHpVPVP,cplcVWpVPVPVWp3,         & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,PiVPheavy0)

Call DerPi1LoopVP(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHp,MHp2,MVWp,MVWp2,cplcFdFdVPL,      & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,              & 
& cplcgWCgWCVP,cplHpcHpVP,cplHpcVWpVP,cplcVWpVPVWp,cplHpcHpVPVP,cplcVWpVPVPVWp3,         & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,DerPiVPheavy0)

OnlyHeavyStates = .False. 
p2 = MVZ2
OnlyLightStates = .True. 
Call Pi1LoopVP(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHp,MHp2,MVWp,MVWp2,cplcFdFdVPL,         & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,              & 
& cplcgWCgWCVP,cplHpcHpVP,cplHpcVWpVP,cplcVWpVPVWp,cplHpcHpVPVP,cplcVWpVPVPVWp3,         & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,PiVPlightMZ)

Call DerPi1LoopVP(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHp,MHp2,MVWp,MVWp2,cplcFdFdVPL,      & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,              & 
& cplcgWCgWCVP,cplHpcHpVP,cplHpcVWpVP,cplcVWpVPVWp,cplHpcHpVPVP,cplcVWpVPVPVWp3,         & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,DerPiVPlightMZ)

OnlyLightStates = .False. 
p2 = MVZ2
OnlyHeavyStates = .True. 
Call Pi1LoopVP(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHp,MHp2,MVWp,MVWp2,cplcFdFdVPL,         & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,              & 
& cplcgWCgWCVP,cplHpcHpVP,cplHpcVWpVP,cplcVWpVPVWp,cplHpcHpVPVP,cplcVWpVPVPVWp3,         & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,PiVPheavyMZ)

Call DerPi1LoopVP(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHp,MHp2,MVWp,MVWp2,cplcFdFdVPL,      & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,              & 
& cplcgWCgWCVP,cplHpcHpVP,cplHpcVWpVP,cplcVWpVPVWp,cplHpcHpVPVP,cplcVWpVPVPVWp3,         & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,DerPiVPheavyMZ)

OnlyHeavyStates = .False. 
!--------------------------
!VP
!--------------------------
p2 = MVZ2
Call Pi1LoopVPVZ(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHp,MHp2,MVWp,MVWp2,cplcFdFdVPL,       & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCVP,              & 
& cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,           & 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,cplHpcHpVP,               & 
& cplHpcHpVPVZ,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,kont,PiVPVZ)

Call DerPi1LoopVPVZ(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHp,MHp2,MVWp,MVWp2,cplcFdFdVPL,    & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCVP,              & 
& cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,           & 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,cplHpcHpVP,               & 
& cplHpcHpVPVZ,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,kont,DerPiVPVZ)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVPVZ(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHp,MHp2,MVWp,MVWp2,cplcFdFdVPL,    & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCVP,              & 
& cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,           & 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,cplHpcHpVP,               & 
& cplHpcHpVPVZ,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,kont,DerPiVPVZDR)

p2 =MVZ2OS
Call DerPi1LoopVPVZ(p2,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MHpOS,MHp2OS,           & 
& MVWpOS,MVWp2OS,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,            & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,GcplcHpVPVWp,          & 
& GcplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,             & 
& cplcVWpVWpVZ,GcplHpcHpVP,cplHpcHpVPVZ,GcplHpcHpVZ,GcplHpcVWpVP,GcplHpcVWpVZ,           & 
& kont,DerPiVPVZOS)

DerPiVPVZ = DerPiVPVZ- DerPiVPVZDR + DerPiVPVZOS
IRdivonly=.False. 
End if
p2 = 0._dp 
Call Pi1LoopVPVZ(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHp,MHp2,MVWp,MVWp2,cplcFdFdVPL,       & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCVP,              & 
& cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,           & 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,cplHpcHpVP,               & 
& cplHpcHpVPVZ,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,kont,PiVZVP)

Call DerPi1LoopVPVZ(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHp,MHp2,MVWp,MVWp2,cplcFdFdVPL,    & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCVP,              & 
& cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,           & 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,cplHpcHpVP,               & 
& cplHpcHpVPVZ,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,kont,DerPiVZVP)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVPVZ(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHp,MHp2,MVWp,MVWp2,cplcFdFdVPL,    & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCVP,              & 
& cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,           & 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,cplHpcHpVP,               & 
& cplHpcHpVPVZ,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,kont,DerPiVPVZDR)

p2 = 0._dp 
Call DerPi1LoopVPVZ(p2,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MHpOS,MHp2OS,           & 
& MVWpOS,MVWp2OS,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,            & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,GcplcHpVPVWp,          & 
& GcplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,             & 
& cplcVWpVWpVZ,GcplHpcHpVP,cplHpcHpVPVZ,GcplHpcHpVZ,GcplHpcVWpVP,GcplHpcVWpVZ,           & 
& kont,DerPiVPVZOS)

DerPiVPVZ = DerPiVPVZ- DerPiVPVZDR + DerPiVPVZOS
IRdivonly=.False. 
End if
!--------------------------
!VZ
!--------------------------
p2 = MAh2
Call Pi1LoopVZAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,            & 
& MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCAh,              & 
& cplcgWCgWCVZ,cplcgWpgWpAh,cplcgWpgWpVZ,cplcHpVWpVZ,cplhhVZVZ,cplHpcVWpVZ,              & 
& kont,PiVZAh)

Call DerPi1LoopVZAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,              & 
& MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCAh,              & 
& cplcgWCgWCVZ,cplcgWpgWpAh,cplcgWpgWpVZ,cplcHpVWpVZ,cplhhVZVZ,cplHpcVWpVZ,              & 
& kont,DerPiVZAh)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,              & 
& MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCAh,              & 
& cplcgWCgWCVZ,cplcgWpgWpAh,cplcgWpgWpVZ,cplcHpVWpVZ,cplhhVZVZ,cplHpcVWpVZ,              & 
& kont,DerPiVZAhDR)

p2 =MAh2OS
Call DerPi1LoopVZAh(p2,MAhOS,MAh2OS,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,           & 
& MhhOS,Mhh2OS,MHpOS,MHp2OS,MVWpOS,MVWp2OS,MVZOS,MVZ2OS,cplAhAhhh,GcplAhcHpVWp,          & 
& cplAhhhVZ,GcplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,    & 
& cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWCgWCAh,cplcgWCgWCVZ,cplcgWpgWpAh,cplcgWpgWpVZ,GcplcHpVWpVZ,          & 
& cplhhVZVZ,GcplHpcVWpVZ,kont,DerPiVZAhOS)

DerPiVZAh = DerPiVZAh- DerPiVZAhDR + DerPiVZAhOS
IRdivonly=.False. 
End if
p2 = MVZ2
Call Pi1LoopVZAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,            & 
& MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCAh,              & 
& cplcgWCgWCVZ,cplcgWpgWpAh,cplcgWpgWpVZ,cplcHpVWpVZ,cplhhVZVZ,cplHpcVWpVZ,              & 
& kont,PiAhVZ)

Call DerPi1LoopVZAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,              & 
& MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCAh,              & 
& cplcgWCgWCVZ,cplcgWpgWpAh,cplcgWpgWpVZ,cplcHpVWpVZ,cplhhVZVZ,cplHpcVWpVZ,              & 
& kont,DerPiAhVZ)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,              & 
& MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCAh,              & 
& cplcgWCgWCVZ,cplcgWpgWpAh,cplcgWpgWpVZ,cplcHpVWpVZ,cplhhVZVZ,cplHpcVWpVZ,              & 
& kont,DerPiVZAhDR)

p2 =MVZ2OS
Call DerPi1LoopVZAh(p2,MAhOS,MAh2OS,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,           & 
& MhhOS,Mhh2OS,MHpOS,MHp2OS,MVWpOS,MVWp2OS,MVZOS,MVZ2OS,cplAhAhhh,GcplAhcHpVWp,          & 
& cplAhhhVZ,GcplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,    & 
& cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWCgWCAh,cplcgWCgWCVZ,cplcgWpgWpAh,cplcgWpgWpVZ,GcplcHpVWpVZ,          & 
& cplhhVZVZ,GcplHpcVWpVZ,kont,DerPiVZAhOS)

DerPiVZAh = DerPiVZAh- DerPiVZAhDR + DerPiVZAhOS
IRdivonly=.False. 
End if
!--------------------------
!VZ
!--------------------------
p2 = Mhh2
Call Pi1LoopVZhh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHp,MHp2,MVWp,MVWp2,cplcFdFdhhL,       & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWChh,              & 
& cplcgWCgWCVZ,cplcgWpgWphh,cplcgWpgWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplhhcHpVWp,           & 
& cplhhcVWpVWp,cplhhHpcHp,cplhhHpcVWp,cplHpcHpVZ,cplHpcVWpVZ,kont,PiVZhh)

Call DerPi1LoopVZhh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHp,MHp2,MVWp,MVWp2,cplcFdFdhhL,    & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWChh,              & 
& cplcgWCgWCVZ,cplcgWpgWphh,cplcgWpgWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplhhcHpVWp,           & 
& cplhhcVWpVWp,cplhhHpcHp,cplhhHpcVWp,cplHpcHpVZ,cplHpcVWpVZ,kont,DerPiVZhh)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZhh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHp,MHp2,MVWp,MVWp2,cplcFdFdhhL,    & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWChh,              & 
& cplcgWCgWCVZ,cplcgWpgWphh,cplcgWpgWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplhhcHpVWp,           & 
& cplhhcVWpVWp,cplhhHpcHp,cplhhHpcVWp,cplHpcHpVZ,cplHpcVWpVZ,kont,DerPiVZhhDR)

p2 =Mhh2OS
Call DerPi1LoopVZhh(p2,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MHpOS,MHp2OS,           & 
& MVWpOS,MVWp2OS,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,            & 
& cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWCgWChh,cplcgWCgWCVZ,cplcgWpgWphh,cplcgWpgWpVZ,GcplcHpVWpVZ,          & 
& cplcVWpVWpVZ,GcplhhcHpVWp,cplhhcVWpVWp,GcplhhHpcHp,GcplhhHpcVWp,GcplHpcHpVZ,           & 
& GcplHpcVWpVZ,kont,DerPiVZhhOS)

DerPiVZhh = DerPiVZhh- DerPiVZhhDR + DerPiVZhhOS
IRdivonly=.False. 
End if
p2 = MVZ2
Call Pi1LoopVZhh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHp,MHp2,MVWp,MVWp2,cplcFdFdhhL,       & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWChh,              & 
& cplcgWCgWCVZ,cplcgWpgWphh,cplcgWpgWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplhhcHpVWp,           & 
& cplhhcVWpVWp,cplhhHpcHp,cplhhHpcVWp,cplHpcHpVZ,cplHpcVWpVZ,kont,PihhVZ)

Call DerPi1LoopVZhh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHp,MHp2,MVWp,MVWp2,cplcFdFdhhL,    & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWChh,              & 
& cplcgWCgWCVZ,cplcgWpgWphh,cplcgWpgWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplhhcHpVWp,           & 
& cplhhcVWpVWp,cplhhHpcHp,cplhhHpcVWp,cplHpcHpVZ,cplHpcVWpVZ,kont,DerPihhVZ)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZhh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHp,MHp2,MVWp,MVWp2,cplcFdFdhhL,    & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWChh,              & 
& cplcgWCgWCVZ,cplcgWpgWphh,cplcgWpgWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplhhcHpVWp,           & 
& cplhhcVWpVWp,cplhhHpcHp,cplhhHpcVWp,cplHpcHpVZ,cplHpcVWpVZ,kont,DerPiVZhhDR)

p2 =MVZ2OS
Call DerPi1LoopVZhh(p2,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MHpOS,MHp2OS,           & 
& MVWpOS,MVWp2OS,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,            & 
& cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWCgWChh,cplcgWCgWCVZ,cplcgWpgWphh,cplcgWpgWpVZ,GcplcHpVWpVZ,          & 
& cplcVWpVWpVZ,GcplhhcHpVWp,cplhhcVWpVWp,GcplhhHpcHp,GcplhhHpcVWp,GcplHpcHpVZ,           & 
& GcplHpcVWpVZ,kont,DerPiVZhhOS)

DerPiVZhh = DerPiVZhh- DerPiVZhhDR + DerPiVZhhOS
IRdivonly=.False. 
End if
!--------------------------
!VWp
!--------------------------
p2 = MHp2
Call Pi1LoopVWpHp(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,               & 
& MVWp2,MVZ,MVZ2,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFuFdVWpL,       & 
& cplcFuFdVWpR,cplcFvFeVWpL,cplcFvFeVWpR,cplcgAgWCVWp,cplcgWCgAcHp,cplcgWCgZcHp,         & 
& cplcgWpgZVWp,cplcgZgWCVWp,cplcgZgWpcHp,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,           & 
& cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,cplHpcHpVP,cplHpcHpVZ,kont,PiVWpHp)

Call DerPi1LoopVWpHp(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,            & 
& MVWp2,MVZ,MVZ2,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFuFdVWpL,       & 
& cplcFuFdVWpR,cplcFvFeVWpL,cplcFvFeVWpR,cplcgAgWCVWp,cplcgWCgAcHp,cplcgWCgZcHp,         & 
& cplcgWpgZVWp,cplcgZgWCVWp,cplcgZgWpcHp,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,           & 
& cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,cplHpcHpVP,cplHpcHpVZ,kont,           & 
& DerPiVWpHp)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVWpHp(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,            & 
& MVWp2,MVZ,MVZ2,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFuFdVWpL,       & 
& cplcFuFdVWpR,cplcFvFeVWpL,cplcFvFeVWpR,cplcgAgWCVWp,cplcgWCgAcHp,cplcgWCgZcHp,         & 
& cplcgWpgZVWp,cplcgZgWCVWp,cplcgZgWpcHp,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,           & 
& cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,cplHpcHpVP,cplHpcHpVZ,kont,           & 
& DerPiVWpHpDR)

p2 =MHp2OS
Call DerPi1LoopVWpHp(p2,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MhhOS,Mhh2OS,          & 
& MHpOS,MHp2OS,MVWpOS,MVWp2OS,MVZOS,MVZ2OS,GcplcFdFucHpL,GcplcFdFucHpR,GcplcFeFvcHpL,    & 
& GcplcFeFvcHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFvFeVWpL,cplcFvFeVWpR,cplcgAgWCVWp,        & 
& cplcgWCgAcHp,cplcgWCgZcHp,cplcgWpgZVWp,cplcgZgWCVWp,cplcgZgWpcHp,GcplcHpVPVWp,         & 
& GcplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,GcplhhcHpVWp,cplhhcVWpVWp,GcplhhHpcHp,          & 
& GcplHpcHpVP,GcplHpcHpVZ,kont,DerPiVWpHpOS)

DerPiVWpHp = DerPiVWpHp- DerPiVWpHpDR + DerPiVWpHpOS
IRdivonly=.False. 
End if
p2 = MVWp2
Call Pi1LoopVWpHp(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,               & 
& MVWp2,MVZ,MVZ2,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFuFdVWpL,       & 
& cplcFuFdVWpR,cplcFvFeVWpL,cplcFvFeVWpR,cplcgAgWCVWp,cplcgWCgAcHp,cplcgWCgZcHp,         & 
& cplcgWpgZVWp,cplcgZgWCVWp,cplcgZgWpcHp,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,           & 
& cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,cplHpcHpVP,cplHpcHpVZ,kont,PiHpVWp)

Call DerPi1LoopVWpHp(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,            & 
& MVWp2,MVZ,MVZ2,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFuFdVWpL,       & 
& cplcFuFdVWpR,cplcFvFeVWpL,cplcFvFeVWpR,cplcgAgWCVWp,cplcgWCgAcHp,cplcgWCgZcHp,         & 
& cplcgWpgZVWp,cplcgZgWCVWp,cplcgZgWpcHp,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,           & 
& cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,cplHpcHpVP,cplHpcHpVZ,kont,           & 
& DerPiHpVWp)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVWpHp(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,            & 
& MVWp2,MVZ,MVZ2,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFuFdVWpL,       & 
& cplcFuFdVWpR,cplcFvFeVWpL,cplcFvFeVWpR,cplcgAgWCVWp,cplcgWCgAcHp,cplcgWCgZcHp,         & 
& cplcgWpgZVWp,cplcgZgWCVWp,cplcgZgWpcHp,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,           & 
& cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,cplHpcHpVP,cplHpcHpVZ,kont,           & 
& DerPiVWpHpDR)

p2 =MVWp2OS
Call DerPi1LoopVWpHp(p2,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MhhOS,Mhh2OS,          & 
& MHpOS,MHp2OS,MVWpOS,MVWp2OS,MVZOS,MVZ2OS,GcplcFdFucHpL,GcplcFdFucHpR,GcplcFeFvcHpL,    & 
& GcplcFeFvcHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFvFeVWpL,cplcFvFeVWpR,cplcgAgWCVWp,        & 
& cplcgWCgAcHp,cplcgWCgZcHp,cplcgWpgZVWp,cplcgZgWCVWp,cplcgZgWpcHp,GcplcHpVPVWp,         & 
& GcplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,GcplhhcHpVWp,cplhhcVWpVWp,GcplhhHpcHp,          & 
& GcplHpcHpVP,GcplHpcHpVZ,kont,DerPiVWpHpOS)

DerPiVWpHp = DerPiVWpHp- DerPiVWpHpDR + DerPiVWpHpOS
IRdivonly=.False. 
End if
! -----------------------------------------------------------
! Calculate now all wave-function renormalisation constants 
! -----------------------------------------------------------


!  ######    VG    ###### 
ZfVG = -DerPiVG


!  ######    Hp    ###### 
ZfHp = -DerPiHp


!  ######    vL    ###### 
Do i1=1,3
  Do i2=1,3
   If (i1.eq.i2) Then 
     ZfvL(i1,i2) = -SigmaRFv(i2,i1,i2) 
   Else 
     ZfvL(i1,i2) = 0._dp 
   End if 
  End Do 
End Do 


!  ######    Ah    ###### 
ZfAh = -DerPiAh


!  ######    hh    ###### 
Zfhh = -DerPihh


!  ######    VP    ###### 
ZfVP = -DerPiVP


!  ######    VZ    ###### 
ZfVZ = -DerPiVZ


!  ######    VWp    ###### 
ZfVWp = -DerPiVWp


!  ######    DL    ###### 
Do i1=1,3
  Do i2=1,3
   If ((i1.eq.i2).or.(MFd(i1).eq.MFd(i2))) Then 
     ZfDL(i1,i2) = -SigmaRFd(i2,i1,i2) &
      & -MFd2(i1)*(DerSigmaRFd(i2,i1,i2) + DerSigmaLFd(i2,i1,i2))&
      & -MFd(i1)*(DerSigmaSRFd(i2,i1,i2)+DerSigmaSLFd(i2,i1,i2))
     If (OSkinematics) Then 
     ZfDL(i1,i2) = ZfDL(i1,i2) &
      & -MFd2OS(i1)*(DerSigmaRirFd(i2,i1,i2) + DerSigmaLirFd(i2,i1,i2))&
      & -MFdOS(i1)*(DerSigmaSRirFd(i2,i1,i2)+DerSigmaSLirFd(i2,i1,i2))
     Else 
     ZfDL(i1,i2) = ZfDL(i1,i2) &
      & -MFd2(i1)*(DerSigmaRirFd(i2,i1,i2) + DerSigmaLirFd(i2,i1,i2))&
      & -MFd(i1)*(DerSigmaSRirFd(i2,i1,i2)+DerSigmaSLirFd(i2,i1,i2))
     End if 
   Else 
     ZfDL(i1,i2) = 2._dp/(MFd2(i1) - MFd2(i2))* &
      & (MFd2(i2)*SigmaRFd(i2,i1,i2) + MFd(i1)*MFd(i2)*SigmaLFd(i2,i1,i2) + MFd(i1)*SigmaSRFd(i2,i1,i2) + MFd(i2)*SigmaSLFd(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    DR    ###### 
Do i1=1,3
  Do i2=1,3
   If ((i1.eq.i2).or.(MFd(i1).eq.MFd(i2))) Then 
     ZfDR(i1,i2) = -SigmaLFd(i2,i1,i2) &
      & -MFd2(i1)*(DerSigmaLFd(i2,i1,i2) + DerSigmaRFd(i2,i1,i2))&
      & -MFd(i1)*(DerSigmaSLFd(i2,i1,i2)+DerSigmaSRFd(i2,i1,i2))
     If (OSkinematics) Then 
     ZfDR(i1,i2) = ZfDR(i1,i2) &
      & -MFd2OS(i1)*(DerSigmaLirFd(i2,i1,i2) + DerSigmaRirFd(i2,i1,i2))&
      & -MFdOS(i1)*(DerSigmaSLirFd(i2,i1,i2)+DerSigmaSRirFd(i2,i1,i2))
     Else 
     ZfDR(i1,i2) = ZfDR(i1,i2) &
      & -MFd2(i1)*(DerSigmaLirFd(i2,i1,i2) + DerSigmaRirFd(i2,i1,i2))&
      & -MFd(i1)*(DerSigmaSLirFd(i2,i1,i2)+DerSigmaSRirFd(i2,i1,i2))
     End if 
   Else 
     ZfDR(i1,i2) = 2._dp/(MFd2(i1) - MFd2(i2))* &
      & (MFd2(i2)*SigmaLFd(i2,i1,i2) + MFd(i1)*MFd(i2)*SigmaRFd(i2,i1,i2) + MFd(i1)*SigmaSLFd(i2,i1,i2) + MFd(i2)*SigmaSRFd(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    UL    ###### 
Do i1=1,3
  Do i2=1,3
   If ((i1.eq.i2).or.(MFu(i1).eq.MFu(i2))) Then 
     ZfUL(i1,i2) = -SigmaRFu(i2,i1,i2) &
      & -MFu2(i1)*(DerSigmaRFu(i2,i1,i2) + DerSigmaLFu(i2,i1,i2))&
      & -MFu(i1)*(DerSigmaSRFu(i2,i1,i2)+DerSigmaSLFu(i2,i1,i2))
     If (OSkinematics) Then 
     ZfUL(i1,i2) = ZfUL(i1,i2) &
      & -MFu2OS(i1)*(DerSigmaRirFu(i2,i1,i2) + DerSigmaLirFu(i2,i1,i2))&
      & -MFuOS(i1)*(DerSigmaSRirFu(i2,i1,i2)+DerSigmaSLirFu(i2,i1,i2))
     Else 
     ZfUL(i1,i2) = ZfUL(i1,i2) &
      & -MFu2(i1)*(DerSigmaRirFu(i2,i1,i2) + DerSigmaLirFu(i2,i1,i2))&
      & -MFu(i1)*(DerSigmaSRirFu(i2,i1,i2)+DerSigmaSLirFu(i2,i1,i2))
     End if 
   Else 
     ZfUL(i1,i2) = 2._dp/(MFu2(i1) - MFu2(i2))* &
      & (MFu2(i2)*SigmaRFu(i2,i1,i2) + MFu(i1)*MFu(i2)*SigmaLFu(i2,i1,i2) + MFu(i1)*SigmaSRFu(i2,i1,i2) + MFu(i2)*SigmaSLFu(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    UR    ###### 
Do i1=1,3
  Do i2=1,3
   If ((i1.eq.i2).or.(MFu(i1).eq.MFu(i2))) Then 
     ZfUR(i1,i2) = -SigmaLFu(i2,i1,i2) &
      & -MFu2(i1)*(DerSigmaLFu(i2,i1,i2) + DerSigmaRFu(i2,i1,i2))&
      & -MFu(i1)*(DerSigmaSLFu(i2,i1,i2)+DerSigmaSRFu(i2,i1,i2))
     If (OSkinematics) Then 
     ZfUR(i1,i2) = ZfUR(i1,i2) &
      & -MFu2OS(i1)*(DerSigmaLirFu(i2,i1,i2) + DerSigmaRirFu(i2,i1,i2))&
      & -MFuOS(i1)*(DerSigmaSLirFu(i2,i1,i2)+DerSigmaSRirFu(i2,i1,i2))
     Else 
     ZfUR(i1,i2) = ZfUR(i1,i2) &
      & -MFu2(i1)*(DerSigmaLirFu(i2,i1,i2) + DerSigmaRirFu(i2,i1,i2))&
      & -MFu(i1)*(DerSigmaSLirFu(i2,i1,i2)+DerSigmaSRirFu(i2,i1,i2))
     End if 
   Else 
     ZfUR(i1,i2) = 2._dp/(MFu2(i1) - MFu2(i2))* &
      & (MFu2(i2)*SigmaLFu(i2,i1,i2) + MFu(i1)*MFu(i2)*SigmaRFu(i2,i1,i2) + MFu(i1)*SigmaSLFu(i2,i1,i2) + MFu(i2)*SigmaSRFu(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    EL    ###### 
Do i1=1,3
  Do i2=1,3
   If ((i1.eq.i2).or.(MFe(i1).eq.MFe(i2))) Then 
     ZfEL(i1,i2) = -SigmaRFe(i2,i1,i2) &
      & -MFe2(i1)*(DerSigmaRFe(i2,i1,i2) + DerSigmaLFe(i2,i1,i2))&
      & -MFe(i1)*(DerSigmaSRFe(i2,i1,i2)+DerSigmaSLFe(i2,i1,i2))
     If (OSkinematics) Then 
     ZfEL(i1,i2) = ZfEL(i1,i2) &
      & -MFe2OS(i1)*(DerSigmaRirFe(i2,i1,i2) + DerSigmaLirFe(i2,i1,i2))&
      & -MFeOS(i1)*(DerSigmaSRirFe(i2,i1,i2)+DerSigmaSLirFe(i2,i1,i2))
     Else 
     ZfEL(i1,i2) = ZfEL(i1,i2) &
      & -MFe2(i1)*(DerSigmaRirFe(i2,i1,i2) + DerSigmaLirFe(i2,i1,i2))&
      & -MFe(i1)*(DerSigmaSRirFe(i2,i1,i2)+DerSigmaSLirFe(i2,i1,i2))
     End if 
   Else 
     ZfEL(i1,i2) = 2._dp/(MFe2(i1) - MFe2(i2))* &
      & (MFe2(i2)*SigmaRFe(i2,i1,i2) + MFe(i1)*MFe(i2)*SigmaLFe(i2,i1,i2) + MFe(i1)*SigmaSRFe(i2,i1,i2) + MFe(i2)*SigmaSLFe(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    ER    ###### 
Do i1=1,3
  Do i2=1,3
   If ((i1.eq.i2).or.(MFe(i1).eq.MFe(i2))) Then 
     ZfER(i1,i2) = -SigmaLFe(i2,i1,i2) &
      & -MFe2(i1)*(DerSigmaLFe(i2,i1,i2) + DerSigmaRFe(i2,i1,i2))&
      & -MFe(i1)*(DerSigmaSLFe(i2,i1,i2)+DerSigmaSRFe(i2,i1,i2))
     If (OSkinematics) Then 
     ZfER(i1,i2) = ZfER(i1,i2) &
      & -MFe2OS(i1)*(DerSigmaLirFe(i2,i1,i2) + DerSigmaRirFe(i2,i1,i2))&
      & -MFeOS(i1)*(DerSigmaSLirFe(i2,i1,i2)+DerSigmaSRirFe(i2,i1,i2))
     Else 
     ZfER(i1,i2) = ZfER(i1,i2) &
      & -MFe2(i1)*(DerSigmaLirFe(i2,i1,i2) + DerSigmaRirFe(i2,i1,i2))&
      & -MFe(i1)*(DerSigmaSLirFe(i2,i1,i2)+DerSigmaSRirFe(i2,i1,i2))
     End if 
   Else 
     ZfER(i1,i2) = 2._dp/(MFe2(i1) - MFe2(i2))* &
      & (MFe2(i2)*SigmaLFe(i2,i1,i2) + MFe(i1)*MFe(i2)*SigmaRFe(i2,i1,i2) + MFe(i1)*SigmaSLFe(i2,i1,i2) + MFe(i2)*SigmaSRFe(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    VPVZ    ###### 
ZfVPVZ = 2._dp*PiVPVZ/(MVP2-MVZ2 )
ZfVZVP = 2._dp*PiVZVP/(MVZ2-MVP2 )
! -----------------------------------------------------------
! Setting the Counter-Terms 
! -----------------------------------------------------------
! ----------- getting the divergent pieces ---------

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
! ----------------------- 
 
Call ParametersToG62(g1,g2,g3,Lam,Yu,Yd,Ye,Mu,v,g1D)

TwoLoopRGEsave=TwoLoopRGE 
TwoLoopRGE=.False. 
Call rge62(62,0._dp,g1D,g1D) 
TwoLoopRGE=TwoLoopRGEsave 
Call GToParameters62(g1D,dg1,dg2,dg3,dLam,dYu,dYd,dYe,dMu,dv)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
dg1 = Sqrt(3._dp/5._dp)*dg1 
! ----------------------- 
 

 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
! ----------------------- 
 
dg1 = 0.5_dp*divergence*dg1 
dg2 = 0.5_dp*divergence*dg2 
dg3 = 0.5_dp*divergence*dg3 
dYu = 0.5_dp*divergence*dYu 
dYd = 0.5_dp*divergence*dYd 
dYe = 0.5_dp*divergence*dYe 
dMu = 0.5_dp*divergence*dMu 
dLam = 0.5_dp*divergence*dLam 
dv = 0.5_dp*divergence*dv 
dZDL = 0._dp 
dZDR = 0._dp 
dZUL = 0._dp 
dZUR = 0._dp 
dZEL = 0._dp 
dZER = 0._dp 
dSinTW = 0._dp 
dCosTW = 0._dp 
dTanTW = 0._dp 
If (CTinLoopDecays) Then 
dCosTW = ((PiVWp/MVWp**2 - PiVZ/mVZ**2)*Cos(TW))/2._dp 
dSinTW = -(dCosTW*1/Tan(TW)) 
dg2 = (g2*(derPiVPheavy0 + PiVPlightMZ/MVZ**2 - (-(PiVWp/MVWp**2) + PiVZ/MVZ**2)*1/Tan(TW)**2 + (2*PiVZVP*Tan(TW))/MVZ**2))/2._dp 
dg1 = dSinTW*g2*1/Cos(TW) + dg2*Tan(TW) - dCosTW*g2*1/Cos(TW)*Tan(TW) 
End if 
 
dZDR = 0.25_dp*MatMul(ZfDR- Conjg(Transpose(ZfDR)),ZDR)
dZER = 0.25_dp*MatMul(ZfER- Conjg(Transpose(ZfER)),ZER)
dZUR = 0.25_dp*MatMul(ZfUR- Conjg(Transpose(ZfUR)),ZUR)
dZDL = 0.25_dp*MatMul(ZfDL- Conjg(Transpose(ZfDL)),ZDL)
dZEL = 0.25_dp*MatMul(ZfEL- Conjg(Transpose(ZfEL)),ZEL)
dZUL = 0.25_dp*MatMul(ZfUL- Conjg(Transpose(ZfUL)),ZUL)


! -----------------------------------------------------------
! Calculating the CT vertices 
! -----------------------------------------------------------
Call CalculateCouplingCT(Lam,v,g1,g2,TW,g3,Yd,ZDL,ZDR,Ye,ZEL,ZER,Yu,ZUL,              & 
& ZUR,dLam,dv,dg1,dg2,dSinTW,dCosTW,dTanTW,dg3,dYd,dZDL,dZDR,dYe,dZEL,dZER,              & 
& dYu,dZUL,dZUR,ctcplAhAhhh,ctcplhhhhhh,ctcplhhHpcHp,ctcplAhhhVZ,ctcplAhHpcVWp,          & 
& ctcplAhcHpVWp,ctcplhhHpcVWp,ctcplhhcHpVWp,ctcplHpcHpVP,ctcplHpcHpVZ,ctcplhhcVWpVWp,    & 
& ctcplhhVZVZ,ctcplHpcVWpVP,ctcplHpcVWpVZ,ctcplcHpVPVWp,ctcplcHpVWpVZ,ctcplVGVGVG,       & 
& ctcplcVWpVPVWp,ctcplcVWpVWpVZ,ctcplcFdFdAhL,ctcplcFdFdAhR,ctcplcFeFeAhL,               & 
& ctcplcFeFeAhR,ctcplcFuFuAhL,ctcplcFuFuAhR,ctcplcFdFdhhL,ctcplcFdFdhhR,ctcplcFuFdHpL,   & 
& ctcplcFuFdHpR,ctcplcFeFehhL,ctcplcFeFehhR,ctcplcFvFeHpL,ctcplcFvFeHpR,ctcplcFuFuhhL,   & 
& ctcplcFuFuhhR,ctcplcFdFucHpL,ctcplcFdFucHpR,ctcplcFeFvcHpL,ctcplcFeFvcHpR,             & 
& ctcplcFdFdVGL,ctcplcFdFdVGR,ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFuFdVWpL,ctcplcFuFdVWpR, & 
& ctcplcFdFdVZL,ctcplcFdFdVZR,ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFvFeVWpL,ctcplcFvFeVWpR, & 
& ctcplcFeFeVZL,ctcplcFeFeVZR,ctcplcFuFuVGL,ctcplcFuFuVGR,ctcplcFuFuVPL,ctcplcFuFuVPR,   & 
& ctcplcFuFuVZL,ctcplcFuFuVZR,ctcplcFdFucVWpL,ctcplcFdFucVWpR,ctcplcFvFvVZL,             & 
& ctcplcFvFvVZR,ctcplcFeFvcVWpL,ctcplcFeFvcVWpR)

End Subroutine WaveFunctionRenormalisation 
Subroutine CalculateOneLoopDecays(gP1LFu,gP1LFe,gP1LFd,gP1Lhh,MFdOS,MFd2OS,           & 
& MFuOS,MFu2OS,MFeOS,MFe2OS,MHpOS,MHp2OS,MAhOS,MAh2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,         & 
& MVWpOS,MVWp2OS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,v,g1,g2,g3,Lam,Yu,Yd,               & 
& Ye,Mu,epsI,deltaM,kont)

Implicit None 
Real(dp), Intent(in) :: epsI, deltaM 
Integer, Intent(inout) :: kont 
Real(dp) :: MLambda, em, gs, vSM, sinW2, g1SM, g2SM 
Integer :: divset, i1 
Complex(dp) :: divvalue, YuSM(3,3), YdSM(3,3), YeSM(3,3) 
Real(dp),Intent(inout) :: g1,g2,g3

Complex(dp),Intent(inout) :: Lam,Yu(3,3),Yd(3,3),Ye(3,3),Mu

Real(dp),Intent(inout) :: v

Real(dp) :: dg1,dg2,dg3,dv,dSinTW,dCosTW,dTanTW

Complex(dp) :: dYu(3,3),dYd(3,3),dYe(3,3),dMu,dLam,dZDL(3,3),dZDR(3,3),dZUL(3,3),dZUR(3,3),          & 
& dZEL(3,3),dZER(3,3)

Complex(dp) :: ZfVG,ZfHp,ZfvL(3,3),ZfAh,Zfhh,ZfVP,ZfVZ,ZfVWp,ZfDL(3,3),ZfDR(3,3),ZfUL(3,3),          & 
& ZfUR(3,3),ZfEL(3,3),ZfER(3,3),ZfVPVZ,ZfVZVP

Real(dp),Intent(in) :: MFdOS(3),MFd2OS(3),MFuOS(3),MFu2OS(3),MFeOS(3),MFe2OS(3),MHpOS,MHp2OS,MAhOS,          & 
& MAh2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,MVWpOS,MVWp2OS

Complex(dp),Intent(in) :: ZDLOS(3,3),ZDROS(3,3),ZULOS(3,3),ZUROS(3,3),ZELOS(3,3),ZEROS(3,3)

Real(dp) :: p2, q2, q2_save 
Real(dp) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,              & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Complex(dp) :: cplAhAhAhAh1,cplAhAhhhhh1,cplAhAhHpcHp1,cplhhhhhhhh1,cplhhhhHpcHp1,cplHpHpcHpcHp1,    & 
& cplAhAhcVWpVWp1,cplAhAhVZVZ1,cplAhHpcVWpVP1,cplAhHpcVWpVZ1,cplAhcHpVPVWp1,             & 
& cplAhcHpVWpVZ1,cplhhhhcVWpVWp1,cplhhhhVZVZ1,cplhhHpcVWpVP1,cplhhHpcVWpVZ1,             & 
& cplhhcHpVPVWp1,cplhhcHpVWpVZ1,cplHpcHpVPVP1,cplHpcHpVPVZ1,cplHpcHpcVWpVWp1,            & 
& cplHpcHpVZVZ1,cplVGVGVGVG1Q,cplVGVGVGVG2Q,cplVGVGVGVG3Q,cplcVWpVPVPVWp1Q,              & 
& cplcVWpVPVPVWp2Q,cplcVWpVPVPVWp3Q,cplcVWpVPVWpVZ1Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ3Q,  & 
& cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ1Q,          & 
& cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q

Complex(dp) :: cplAhAhhh,cplhhhhhh,cplhhHpcHp,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,cplhhhhhhhh,      & 
& cplhhhhHpcHp,cplHpHpcHpcHp,cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cplhhHpcVWp,              & 
& cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplhhcVWpVWp,cplhhVZVZ,cplHpcVWpVP,cplHpcVWpVZ,      & 
& cplcHpVPVWp,cplcHpVWpVZ,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhHpcVWpVP,cplAhHpcVWpVZ,        & 
& cplAhcHpVPVWp,cplAhcHpVWpVZ,cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhHpcVWpVP,cplhhHpcVWpVZ,    & 
& cplhhcHpVPVWp,cplhhcHpVWpVZ,cplHpcHpVPVP,cplHpcHpVPVZ,cplHpcHpcVWpVWp,cplHpcHpVZVZ,    & 
& cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),& 
& cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),  & 
& cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFvFeHpL(3,3),  & 
& cplcFvFeHpR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),& 
& cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),& 
& cplcFdFdVPR(3,3),cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),& 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFvFeVWpL(3,3),cplcFvFeVWpR(3,3),cplcFeFeVZL(3,3),& 
& cplcFeFeVZR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),  & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),               & 
& cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),               & 
& cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,& 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2, & 
& cplcVWpcVWpVWpVWp3,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcgGgGVG,         & 
& cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgAgWpcVWp,cplcgZgWpcVWp,      & 
& cplcgWCgWCVP,cplcgAgWCVWp,cplcgZgWCVWp,cplcgWCgWCVZ,cplcgWpgZVWp,cplcgWCgZcVWp,        & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplcgZgAhh,cplcgWpgAHp,cplcgWCgAcHp,cplcgWpgWphh,            & 
& cplcgZgWpcHp,cplcgWCgWChh,cplcgZgWCHp,cplcgZgZhh,cplcgWpgZHp,cplcgWCgZcHp

Complex(dp) :: ctcplAhAhhh,ctcplhhhhhh,ctcplhhHpcHp,ctcplAhhhVZ,ctcplAhHpcVWp,ctcplAhcHpVWp,         & 
& ctcplhhHpcVWp,ctcplhhcHpVWp,ctcplHpcHpVP,ctcplHpcHpVZ,ctcplhhcVWpVWp,ctcplhhVZVZ,      & 
& ctcplHpcVWpVP,ctcplHpcVWpVZ,ctcplcHpVPVWp,ctcplcHpVWpVZ,ctcplVGVGVG,ctcplcVWpVPVWp,    & 
& ctcplcVWpVWpVZ,ctcplcFdFdAhL(3,3),ctcplcFdFdAhR(3,3),ctcplcFeFeAhL(3,3),               & 
& ctcplcFeFeAhR(3,3),ctcplcFuFuAhL(3,3),ctcplcFuFuAhR(3,3),ctcplcFdFdhhL(3,3),           & 
& ctcplcFdFdhhR(3,3),ctcplcFuFdHpL(3,3),ctcplcFuFdHpR(3,3),ctcplcFeFehhL(3,3),           & 
& ctcplcFeFehhR(3,3),ctcplcFvFeHpL(3,3),ctcplcFvFeHpR(3,3),ctcplcFuFuhhL(3,3),           & 
& ctcplcFuFuhhR(3,3),ctcplcFdFucHpL(3,3),ctcplcFdFucHpR(3,3),ctcplcFeFvcHpL(3,3),        & 
& ctcplcFeFvcHpR(3,3),ctcplcFdFdVGL(3,3),ctcplcFdFdVGR(3,3),ctcplcFdFdVPL(3,3),          & 
& ctcplcFdFdVPR(3,3),ctcplcFuFdVWpL(3,3),ctcplcFuFdVWpR(3,3),ctcplcFdFdVZL(3,3),         & 
& ctcplcFdFdVZR(3,3),ctcplcFeFeVPL(3,3),ctcplcFeFeVPR(3,3),ctcplcFvFeVWpL(3,3),          & 
& ctcplcFvFeVWpR(3,3),ctcplcFeFeVZL(3,3),ctcplcFeFeVZR(3,3),ctcplcFuFuVGL(3,3),          & 
& ctcplcFuFuVGR(3,3),ctcplcFuFuVPL(3,3),ctcplcFuFuVPR(3,3),ctcplcFuFuVZL(3,3),           & 
& ctcplcFuFuVZR(3,3),ctcplcFdFucVWpL(3,3),ctcplcFdFucVWpR(3,3),ctcplcFvFvVZL(3,3),       & 
& ctcplcFvFvVZR(3,3),ctcplcFeFvcVWpL(3,3),ctcplcFeFvcVWpR(3,3)

Complex(dp) :: ZRUVd(3,3),ZRUUd(3,3),ZRUVu(3,3),ZRUUu(3,3),ZRUVe(3,3),ZRUUe(3,3)

Complex(dp) :: ZcplAhAhhh,Zcplhhhhhh,ZcplhhHpcHp,ZcplAhAhAhAh,ZcplAhAhhhhh,ZcplAhAhHpcHp,            & 
& Zcplhhhhhhhh,ZcplhhhhHpcHp,ZcplHpHpcHpcHp,ZcplAhhhVZ,ZcplAhHpcVWp,ZcplAhcHpVWp,        & 
& ZcplhhHpcVWp,ZcplhhcHpVWp,ZcplHpcHpVP,ZcplHpcHpVZ,ZcplhhcVWpVWp,ZcplhhVZVZ,            & 
& ZcplHpcVWpVP,ZcplHpcVWpVZ,ZcplcHpVPVWp,ZcplcHpVWpVZ,ZcplAhAhcVWpVWp,ZcplAhAhVZVZ,      & 
& ZcplAhHpcVWpVP,ZcplAhHpcVWpVZ,ZcplAhcHpVPVWp,ZcplAhcHpVWpVZ,ZcplhhhhcVWpVWp,           & 
& ZcplhhhhVZVZ,ZcplhhHpcVWpVP,ZcplhhHpcVWpVZ,ZcplhhcHpVPVWp,ZcplhhcHpVWpVZ,              & 
& ZcplHpcHpVPVP,ZcplHpcHpVPVZ,ZcplHpcHpcVWpVWp,ZcplHpcHpVZVZ,ZcplVGVGVG,ZcplcVWpVPVWp,   & 
& ZcplcVWpVWpVZ,ZcplcFdFdAhL(3,3),ZcplcFdFdAhR(3,3),ZcplcFeFeAhL(3,3),ZcplcFeFeAhR(3,3), & 
& ZcplcFuFuAhL(3,3),ZcplcFuFuAhR(3,3),ZcplcFdFdhhL(3,3),ZcplcFdFdhhR(3,3),               & 
& ZcplcFuFdHpL(3,3),ZcplcFuFdHpR(3,3),ZcplcFeFehhL(3,3),ZcplcFeFehhR(3,3),               & 
& ZcplcFvFeHpL(3,3),ZcplcFvFeHpR(3,3),ZcplcFuFuhhL(3,3),ZcplcFuFuhhR(3,3),               & 
& ZcplcFdFucHpL(3,3),ZcplcFdFucHpR(3,3),ZcplcFeFvcHpL(3,3),ZcplcFeFvcHpR(3,3),           & 
& ZcplcFdFdVGL(3,3),ZcplcFdFdVGR(3,3),ZcplcFdFdVPL(3,3),ZcplcFdFdVPR(3,3),               & 
& ZcplcFuFdVWpL(3,3),ZcplcFuFdVWpR(3,3),ZcplcFdFdVZL(3,3),ZcplcFdFdVZR(3,3),             & 
& ZcplcFeFeVPL(3,3),ZcplcFeFeVPR(3,3),ZcplcFvFeVWpL(3,3),ZcplcFvFeVWpR(3,3),             & 
& ZcplcFeFeVZL(3,3),ZcplcFeFeVZR(3,3),ZcplcFuFuVGL(3,3),ZcplcFuFuVGR(3,3),               & 
& ZcplcFuFuVPL(3,3),ZcplcFuFuVPR(3,3),ZcplcFuFuVZL(3,3),ZcplcFuFuVZR(3,3),               & 
& ZcplcFdFucVWpL(3,3),ZcplcFdFucVWpR(3,3),ZcplcFvFvVZL(3,3),ZcplcFvFvVZR(3,3),           & 
& ZcplcFeFvcVWpL(3,3),ZcplcFeFvcVWpR(3,3),ZcplVGVGVGVG1,ZcplVGVGVGVG2,ZcplVGVGVGVG3,     & 
& ZcplcVWpVPVPVWp1,ZcplcVWpVPVPVWp2,ZcplcVWpVPVPVWp3,ZcplcVWpVPVWpVZ1,ZcplcVWpVPVWpVZ2,  & 
& ZcplcVWpVPVWpVZ3,ZcplcVWpcVWpVWpVWp1,ZcplcVWpcVWpVWpVWp2,ZcplcVWpcVWpVWpVWp3,          & 
& ZcplcVWpVWpVZVZ1,ZcplcVWpVWpVZVZ2,ZcplcVWpVWpVZVZ3,ZcplcgGgGVG,ZcplcgWpgAVWp,          & 
& ZcplcgWCgAcVWp,ZcplcgWpgWpVP,ZcplcgWpgWpVZ,ZcplcgAgWpcVWp,ZcplcgZgWpcVWp,              & 
& ZcplcgWCgWCVP,ZcplcgAgWCVWp,ZcplcgZgWCVWp,ZcplcgWCgWCVZ,ZcplcgWpgZVWp,ZcplcgWCgZcVWp,  & 
& ZcplcgWpgWpAh,ZcplcgWCgWCAh,ZcplcgZgAhh,ZcplcgWpgAHp,ZcplcgWCgAcHp,ZcplcgWpgWphh,      & 
& ZcplcgZgWpcHp,ZcplcgWCgWChh,ZcplcgZgWCHp,ZcplcgZgZhh,ZcplcgWpgZHp,ZcplcgWCgZcHp

Complex(dp) :: GcplhhHpcHp,GcplAhHpcVWp,GcplAhcHpVWp,GcplhhHpcVWp,GcplhhcHpVWp,GcplHpcHpVP,          & 
& GcplHpcHpVZ,GcplHpcVWpVP,GcplHpcVWpVZ,GcplcHpVPVWp,GcplcHpVWpVZ,GcplcFuFdHpL(3,3),     & 
& GcplcFuFdHpR(3,3),GcplcFvFeHpL(3,3),GcplcFvFeHpR(3,3),GcplcFdFucHpL(3,3),              & 
& GcplcFdFucHpR(3,3),GcplcFeFvcHpL(3,3),GcplcFeFvcHpR(3,3)

Complex(dp) :: GZcplhhHpcHp,GZcplAhHpcVWp,GZcplAhcHpVWp,GZcplhhHpcVWp,GZcplhhcHpVWp,GZcplHpcHpVP,    & 
& GZcplHpcHpVZ,GZcplHpcVWpVP,GZcplHpcVWpVZ,GZcplcHpVPVWp,GZcplcHpVWpVZ,GZcplcFuFdHpL(3,3),& 
& GZcplcFuFdHpR(3,3),GZcplcFvFeHpL(3,3),GZcplcFvFeHpR(3,3),GZcplcFdFucHpL(3,3),          & 
& GZcplcFdFucHpR(3,3),GZcplcFeFvcHpL(3,3),GZcplcFeFvcHpR(3,3)

Complex(dp) :: GosZcplhhHpcHp,GosZcplAhHpcVWp,GosZcplAhcHpVWp,GosZcplhhHpcVWp,GosZcplhhcHpVWp,       & 
& GosZcplHpcHpVP,GosZcplHpcHpVZ,GosZcplHpcVWpVP,GosZcplHpcVWpVZ,GosZcplcHpVPVWp,         & 
& GosZcplcHpVWpVZ,GosZcplcFuFdHpL(3,3),GosZcplcFuFdHpR(3,3),GosZcplcFvFeHpL(3,3),        & 
& GosZcplcFvFeHpR(3,3),GosZcplcFdFucHpL(3,3),GosZcplcFdFucHpR(3,3),GosZcplcFeFvcHpL(3,3),& 
& GosZcplcFeFvcHpR(3,3)

Real(dp), Intent(out) :: gP1LFu(3,15) 
Real(dp), Intent(out) :: gP1LFe(3,12) 
Real(dp), Intent(out) :: gP1LFd(3,15) 
Real(dp), Intent(out) :: gP1Lhh(1,48) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateOneLoopDecays'
 
Write(*,*) "Calculating one loop decays" 
! Regulator mass for gluon/photon 
MLambda = Mass_Regulator_PhotonGluon 
divset=SetDivonlyAdd(INT(divonly_save)) 
divvalue=SetDivergenceAdd(divergence_save) 
If (.not.CalculateOneLoopMasses) Then 
 If (OSkinematics) Then 
  Write(*,*) "Loop masses not calculated: tree-level masses used for kinematics" 
  OSkinematics = .false. 
 End if
 If (ExternalZfactors) Then 
  Write(*,*) "Loop masses not calculated: no U-factors are applied" 
  ExternalZfactors = .false. 
 End if
End if

If (Extra_scale_loopDecays) Then 
q2_save = GetRenormalizationScale() 
q2 = SetRenormalizationScale(scale_loopdecays **2) 
End if 
If ((OSkinematics).or.(ExternalZfactors)) ShiftIRdiv = .true. 
If (ewOSinDecays) Then 
sinW2=1._dp-mW2/mZ2 
g1SM=sqrt(4*Pi*Alpha_MZ/(1-sinW2)) 
g2SM=sqrt(4*Pi*Alpha_MZ/Sinw2) 
vSM=sqrt(mz2*4._dp/(g1SM**2+g2SM**2)) 
v=vSM 
g1=g1SM 
g2=g2SM 
 If (yukOSinDecays) Then !! Allow OS Yukawas only together with vSM 
    YuSM = 0._dp 
    YdSM = 0._dp 
    YuSM = 0._dp 
   Do i1=1,3 
      YuSM(i1,i1)=sqrt(2._dp)*mf_u(i1)/vSM 
      YeSM(i1,i1)=sqrt(2._dp)*mf_l(i1)/vSM 
      YdSM(i1,i1)=sqrt(2._dp)*mf_d(i1)/vSM 
    End Do 
   If(GenerationMixing) Then 
    YuSM = Transpose(Matmul(Transpose(CKM),Transpose(YuSM))) 
   End if 
Ye=YeSM 
Yd=YdSM 
Yu=YuSM 
 End if 
End if 
! -------------------------------------------- 
! General information needed in the following 
! -------------------------------------------- 

! DR parameters 
Call SolveTadpoleEquations(g1,g2,g3,Lam,Yu,Yd,Ye,Mu,v,(/ ZeroC /))

Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,           & 
& MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,v,g1,g2,g3,Lam,Yu,Yd,Ye,               & 
& Mu,GenerationMixing,kont)

! Stabilize numerics 
If (Abs(MHp).lt.1.0E-15_dp) MHp=0._dp
If (Abs(MHp2).lt.1.0E-30_dp) MHp2=0._dp
If (Abs(MAh).lt.1.0E-15_dp) MAh=0._dp
If (Abs(MAh2).lt.1.0E-30_dp) MAh2=0._dp
If (Abs(Mhh).lt.1.0E-15_dp) Mhh=0._dp
If (Abs(Mhh2).lt.1.0E-30_dp) Mhh2=0._dp
Where (Abs(MFd).lt.1.0E-15_dp) MFd=0._dp
Where (Abs(MFd2).lt.1.0E-30_dp) MFd2=0._dp
Where (Abs(MFu).lt.1.0E-15_dp) MFu=0._dp
Where (Abs(MFu2).lt.1.0E-30_dp) MFu2=0._dp
Where (Abs(MFe).lt.1.0E-15_dp) MFe=0._dp
Where (Abs(MFe2).lt.1.0E-30_dp) MFe2=0._dp
If (UseZeroRotationMatrices) Then  ! Rotation matrices calculated for p2=0
ZRUVd = MatMul(ZDLOS_0, Conjg(Transpose(ZDL)))
ZRUUd = MatMul(ZDROS_0, Conjg(Transpose(ZDR)))
ZRUVu = MatMul(ZULOS_0, Conjg(Transpose(ZUL)))
ZRUUu = MatMul(ZUROS_0, Conjg(Transpose(ZUR)))
ZRUVe = MatMul(ZELOS_0, Conjg(Transpose(ZEL)))
ZRUUe = MatMul(ZEROS_0, Conjg(Transpose(ZER)))
Else If (UseP2Matrices) Then   ! p2 dependent matrix 
ZRUVd = MatMul(ZDLOS_p2, Conjg(Transpose(ZDL)))
ZRUUd = MatMul(ZDROS_p2, Conjg(Transpose(ZDR)))
ZRUVu = MatMul(ZULOS_p2, Conjg(Transpose(ZUL)))
ZRUUu = MatMul(ZUROS_p2, Conjg(Transpose(ZUR)))
ZRUVe = MatMul(ZELOS_p2, Conjg(Transpose(ZEL)))
ZRUUe = MatMul(ZEROS_p2, Conjg(Transpose(ZER)))
Else  ! Rotation matrix for lightest state
ZRUVd = MatMul(ZDLOS, Conjg(Transpose(ZDL)))
ZRUUd = MatMul(ZDROS, Conjg(Transpose(ZDR)))
ZRUVu = MatMul(ZULOS, Conjg(Transpose(ZUL)))
ZRUUu = MatMul(ZUROS, Conjg(Transpose(ZUR)))
ZRUVe = MatMul(ZELOS, Conjg(Transpose(ZEL)))
ZRUUe = MatMul(ZEROS, Conjg(Transpose(ZER)))
End if 
! Couplings 
Call AllCouplingsReallyAll(Lam,v,g1,g2,TW,g3,Yd,ZDL,ZDR,Ye,ZEL,ZER,Yu,ZUL,            & 
& ZUR,cplAhAhhh,cplhhhhhh,cplhhHpcHp,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,               & 
& cplhhhhhhhh,cplhhhhHpcHp,cplHpHpcHpcHp,cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,              & 
& cplhhHpcVWp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplhhcVWpVWp,cplhhVZVZ,cplHpcVWpVP,      & 
& cplHpcVWpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhHpcVWpVP,          & 
& cplAhHpcVWpVZ,cplAhcHpVPVWp,cplAhcHpVWpVZ,cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhHpcVWpVP,    & 
& cplhhHpcVWpVZ,cplhhcHpVPVWp,cplhhcHpVWpVZ,cplHpcHpVPVP,cplHpcHpVPVZ,cplHpcHpcVWpVWp,   & 
& cplHpcHpVZVZ,cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFdFdhhL,cplcFdFdhhR,               & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,           & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFvFeVWpL,cplcFvFeVWpR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFvFvVZL,cplcFvFvVZR,           & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWpVPVPVWp1,    & 
& cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,       & 
& cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpVWpVZVZ1,              & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcgGgGVG,cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWpVP,    & 
& cplcgWpgWpVZ,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWCVP,cplcgAgWCVWp,cplcgZgWCVWp,       & 
& cplcgWCgWCVZ,cplcgWpgZVWp,cplcgWCgZcVWp,cplcgWpgWpAh,cplcgWCgWCAh,cplcgZgAhh,          & 
& cplcgWpgAHp,cplcgWCgAcHp,cplcgWpgWphh,cplcgZgWpcHp,cplcgWCgWChh,cplcgZgWCHp,           & 
& cplcgZgZhh,cplcgWpgZHp,cplcgWCgZcHp)

em = cplcVWpVPVWp 
gs = cplcFdFdVGL(1,1) 
Call CouplingsColoredQuartics(Lam,g2,g1,TW,g3,cplAhAhAhAh1,cplAhAhhhhh1,              & 
& cplAhAhHpcHp1,cplhhhhhhhh1,cplhhhhHpcHp1,cplHpHpcHpcHp1,cplAhAhcVWpVWp1,               & 
& cplAhAhVZVZ1,cplAhHpcVWpVP1,cplAhHpcVWpVZ1,cplAhcHpVPVWp1,cplAhcHpVWpVZ1,              & 
& cplhhhhcVWpVWp1,cplhhhhVZVZ1,cplhhHpcVWpVP1,cplhhHpcVWpVZ1,cplhhcHpVPVWp1,             & 
& cplhhcHpVWpVZ1,cplHpcHpVPVP1,cplHpcHpVPVZ1,cplHpcHpcVWpVWp1,cplHpcHpVZVZ1,             & 
& cplVGVGVGVG1Q,cplVGVGVGVG2Q,cplVGVGVGVG3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,           & 
& cplcVWpVPVPVWp3Q,cplcVWpVPVWpVZ1Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ3Q,cplcVWpcVWpVWpVWp1Q,& 
& cplcVWpcVWpVWpVWp2Q,cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ1Q,cplcVWpVWpVZVZ2Q,             & 
& cplcVWpVWpVZVZ3Q)

If (externalZfactors) Then 
Call getZCouplings(Lam,v,g1,g2,TW,g3,Yd,ZDL,ZDR,Ye,ZEL,ZER,Yu,ZUL,ZUR,cplAhAhhh,      & 
& cplhhhhhh,cplhhHpcHp,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,cplhhhhhhhh,cplhhhhHpcHp,    & 
& cplHpHpcHpcHp,cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cplhhHpcVWp,cplhhcHpVWp,               & 
& cplHpcHpVP,cplHpcHpVZ,cplhhcVWpVWp,cplhhVZVZ,cplHpcVWpVP,cplHpcVWpVZ,cplcHpVPVWp,      & 
& cplcHpVWpVZ,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhHpcVWpVP,cplAhHpcVWpVZ,cplAhcHpVPVWp,      & 
& cplAhcHpVWpVZ,cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhHpcVWpVP,cplhhHpcVWpVZ,cplhhcHpVPVWp,    & 
& cplhhcHpVWpVZ,cplHpcHpVPVP,cplHpcHpVPVZ,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplVGVGVG,        & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,               & 
& cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFdFdVGL,cplcFdFdVGR,           & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFvFeVWpL,cplcFvFeVWpR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplcFvFvVZL,cplcFvFvVZR,cplcFeFvcVWpL,cplcFeFvcVWpR,       & 
& cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,& 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2, & 
& cplcVWpcVWpVWpVWp3,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcgGgGVG,         & 
& cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgAgWpcVWp,cplcgZgWpcVWp,      & 
& cplcgWCgWCVP,cplcgAgWCVWp,cplcgZgWCVWp,cplcgWCgWCVZ,cplcgWpgZVWp,cplcgWCgZcVWp,        & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplcgZgAhh,cplcgWpgAHp,cplcgWCgAcHp,cplcgWpgWphh,            & 
& cplcgZgWpcHp,cplcgWCgWChh,cplcgZgWCHp,cplcgZgZhh,cplcgWpgZHp,cplcgWCgZcHp,             & 
& ZRUVd,ZRUUd,ZRUVu,ZRUUu,ZRUVe,ZRUUe,ZcplAhAhhh,Zcplhhhhhh,ZcplhhHpcHp,ZcplAhAhAhAh,    & 
& ZcplAhAhhhhh,ZcplAhAhHpcHp,Zcplhhhhhhhh,ZcplhhhhHpcHp,ZcplHpHpcHpcHp,ZcplAhhhVZ,       & 
& ZcplAhHpcVWp,ZcplAhcHpVWp,ZcplhhHpcVWp,ZcplhhcHpVWp,ZcplHpcHpVP,ZcplHpcHpVZ,           & 
& ZcplhhcVWpVWp,ZcplhhVZVZ,ZcplHpcVWpVP,ZcplHpcVWpVZ,ZcplcHpVPVWp,ZcplcHpVWpVZ,          & 
& ZcplAhAhcVWpVWp,ZcplAhAhVZVZ,ZcplAhHpcVWpVP,ZcplAhHpcVWpVZ,ZcplAhcHpVPVWp,             & 
& ZcplAhcHpVWpVZ,ZcplhhhhcVWpVWp,ZcplhhhhVZVZ,ZcplhhHpcVWpVP,ZcplhhHpcVWpVZ,             & 
& ZcplhhcHpVPVWp,ZcplhhcHpVWpVZ,ZcplHpcHpVPVP,ZcplHpcHpVPVZ,ZcplHpcHpcVWpVWp,            & 
& ZcplHpcHpVZVZ,ZcplVGVGVG,ZcplcVWpVPVWp,ZcplcVWpVWpVZ,ZcplcFdFdAhL,ZcplcFdFdAhR,        & 
& ZcplcFeFeAhL,ZcplcFeFeAhR,ZcplcFuFuAhL,ZcplcFuFuAhR,ZcplcFdFdhhL,ZcplcFdFdhhR,         & 
& ZcplcFuFdHpL,ZcplcFuFdHpR,ZcplcFeFehhL,ZcplcFeFehhR,ZcplcFvFeHpL,ZcplcFvFeHpR,         & 
& ZcplcFuFuhhL,ZcplcFuFuhhR,ZcplcFdFucHpL,ZcplcFdFucHpR,ZcplcFeFvcHpL,ZcplcFeFvcHpR,     & 
& ZcplcFdFdVGL,ZcplcFdFdVGR,ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFuFdVWpL,ZcplcFuFdVWpR,       & 
& ZcplcFdFdVZL,ZcplcFdFdVZR,ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcFvFeVWpL,ZcplcFvFeVWpR,       & 
& ZcplcFeFeVZL,ZcplcFeFeVZR,ZcplcFuFuVGL,ZcplcFuFuVGR,ZcplcFuFuVPL,ZcplcFuFuVPR,         & 
& ZcplcFuFuVZL,ZcplcFuFuVZR,ZcplcFdFucVWpL,ZcplcFdFucVWpR,ZcplcFvFvVZL,ZcplcFvFvVZR,     & 
& ZcplcFeFvcVWpL,ZcplcFeFvcVWpR,ZcplVGVGVGVG1,ZcplVGVGVGVG2,ZcplVGVGVGVG3,               & 
& ZcplcVWpVPVPVWp1,ZcplcVWpVPVPVWp2,ZcplcVWpVPVPVWp3,ZcplcVWpVPVWpVZ1,ZcplcVWpVPVWpVZ2,  & 
& ZcplcVWpVPVWpVZ3,ZcplcVWpcVWpVWpVWp1,ZcplcVWpcVWpVWpVWp2,ZcplcVWpcVWpVWpVWp3,          & 
& ZcplcVWpVWpVZVZ1,ZcplcVWpVWpVZVZ2,ZcplcVWpVWpVZVZ3,ZcplcgGgGVG,ZcplcgWpgAVWp,          & 
& ZcplcgWCgAcVWp,ZcplcgWpgWpVP,ZcplcgWpgWpVZ,ZcplcgAgWpcVWp,ZcplcgZgWpcVWp,              & 
& ZcplcgWCgWCVP,ZcplcgAgWCVWp,ZcplcgZgWCVWp,ZcplcgWCgWCVZ,ZcplcgWpgZVWp,ZcplcgWCgZcVWp,  & 
& ZcplcgWpgWpAh,ZcplcgWCgWCAh,ZcplcgZgAhh,ZcplcgWpgAHp,ZcplcgWCgAcHp,ZcplcgWpgWphh,      & 
& ZcplcgZgWpcHp,ZcplcgWCgWChh,ZcplcgZgWCHp,ZcplcgZgZhh,ZcplcgWpgZHp,ZcplcgWCgZcHp)

End if 
Call getGBCouplings(MFdOS,MFd2OS,MFuOS,MFu2OS,MFeOS,MFe2OS,MHpOS,MHp2OS,              & 
& MAhOS,MAh2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,MVWpOS,MVWp2OS,ZDLOS,ZDROS,ZULOS,               & 
& ZUROS,ZELOS,ZEROS,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,               & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,cplcFdFucVWpL,cplcFdFucVWpR,      & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFvFeVWpL,cplcFvFeVWpR,       & 
& cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,            & 
& ZcplcFdFucVWpL,ZcplcFdFucVWpR,ZcplcFeFvcVWpL,ZcplcFeFvcVWpR,ZcplcFuFdVWpL,             & 
& ZcplcFuFdVWpR,ZcplcFvFeVWpL,ZcplcFvFeVWpR,ZcplcHpVPVWp,ZcplcHpVWpVZ,ZcplcVWpVPVWp,     & 
& ZcplcVWpVWpVZ,ZcplhhcHpVWp,ZcplhhcVWpVWp,GcplhhHpcHp,GcplAhHpcVWp,GcplAhcHpVWp,        & 
& GcplhhHpcVWp,GcplhhcHpVWp,GcplHpcHpVP,GcplHpcHpVZ,GcplHpcVWpVP,GcplHpcVWpVZ,           & 
& GcplcHpVPVWp,GcplcHpVWpVZ,GcplcFuFdHpL,GcplcFuFdHpR,GcplcFvFeHpL,GcplcFvFeHpR,         & 
& GcplcFdFucHpL,GcplcFdFucHpR,GcplcFeFvcHpL,GcplcFeFvcHpR,GZcplhhHpcHp,GZcplAhHpcVWp,    & 
& GZcplAhcHpVWp,GZcplhhHpcVWp,GZcplhhcHpVWp,GZcplHpcHpVP,GZcplHpcHpVZ,GZcplHpcVWpVP,     & 
& GZcplHpcVWpVZ,GZcplcHpVPVWp,GZcplcHpVWpVZ,GZcplcFuFdHpL,GZcplcFuFdHpR,GZcplcFvFeHpL,   & 
& GZcplcFvFeHpR,GZcplcFdFucHpL,GZcplcFdFucHpR,GZcplcFeFvcHpL,GZcplcFeFvcHpR,             & 
& GosZcplhhHpcHp,GosZcplAhHpcVWp,GosZcplAhcHpVWp,GosZcplhhHpcVWp,GosZcplhhcHpVWp,        & 
& GosZcplHpcHpVP,GosZcplHpcHpVZ,GosZcplHpcVWpVP,GosZcplHpcVWpVZ,GosZcplcHpVPVWp,         & 
& GosZcplcHpVWpVZ,GosZcplcFuFdHpL,GosZcplcFuFdHpR,GosZcplcFvFeHpL,GosZcplcFvFeHpR,       & 
& GosZcplcFdFucHpL,GosZcplcFdFucHpR,GosZcplcFeFvcHpL,GosZcplcFeFvcHpR)

! Write intilization of all counter terms 
Call WaveFunctionRenormalisation(MFdOS,MFd2OS,MFuOS,MFu2OS,MFeOS,MFe2OS,              & 
& MHpOS,MHp2OS,MAhOS,MAh2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,MVWpOS,MVWp2OS,ZDLOS,              & 
& ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,            & 
& MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,Lam,            & 
& Yu,Yd,Ye,Mu,v,cplAhAhhh,cplhhhhhh,cplhhHpcHp,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,     & 
& cplhhhhhhhh,cplhhhhHpcHp,cplHpHpcHpcHp,cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,              & 
& cplhhHpcVWp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplhhcVWpVWp,cplhhVZVZ,cplHpcVWpVP,      & 
& cplHpcVWpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhHpcVWpVP,          & 
& cplAhHpcVWpVZ,cplAhcHpVPVWp,cplAhcHpVWpVZ,cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhHpcVWpVP,    & 
& cplhhHpcVWpVZ,cplhhcHpVPVWp,cplhhcHpVWpVZ,cplHpcHpVPVP,cplHpcHpVPVZ,cplHpcHpcVWpVWp,   & 
& cplHpcHpVZVZ,cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFdFdhhL,cplcFdFdhhR,               & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,           & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFvFeVWpL,cplcFvFeVWpR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFvFvVZL,cplcFvFvVZR,           & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWpVPVPVWp1,    & 
& cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,       & 
& cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpVWpVZVZ1,              & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcgGgGVG,cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWpVP,    & 
& cplcgWpgWpVZ,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWCVP,cplcgAgWCVWp,cplcgZgWCVWp,       & 
& cplcgWCgWCVZ,cplcgWpgZVWp,cplcgWCgZcVWp,cplcgWpgWpAh,cplcgWCgWCAh,cplcgZgAhh,          & 
& cplcgWpgAHp,cplcgWCgAcHp,cplcgWpgWphh,cplcgZgWpcHp,cplcgWCgWChh,cplcgZgWCHp,           & 
& cplcgZgZhh,cplcgWpgZHp,cplcgWCgZcHp,GcplhhHpcHp,GcplAhHpcVWp,GcplAhcHpVWp,             & 
& GcplhhHpcVWp,GcplhhcHpVWp,GcplHpcHpVP,GcplHpcHpVZ,GcplHpcVWpVP,GcplHpcVWpVZ,           & 
& GcplcHpVPVWp,GcplcHpVWpVZ,GcplcFuFdHpL,GcplcFuFdHpR,GcplcFvFeHpL,GcplcFvFeHpR,         & 
& GcplcFdFucHpL,GcplcFdFucHpR,GcplcFeFvcHpL,GcplcFeFvcHpR,dg1,dg2,dg3,dYu,               & 
& dYd,dYe,dMu,dLam,dv,dZDL,dZDR,dZUL,dZUR,dZEL,dZER,dSinTW,dCosTW,dTanTW,ZfVG,           & 
& ZfHp,ZfvL,ZfAh,Zfhh,ZfVP,ZfVZ,ZfVWp,ZfDL,ZfDR,ZfUL,ZfUR,ZfEL,ZfER,ZfVPVZ,              & 
& ZfVZVP,ctcplAhAhhh,ctcplhhhhhh,ctcplhhHpcHp,ctcplAhhhVZ,ctcplAhHpcVWp,ctcplAhcHpVWp,   & 
& ctcplhhHpcVWp,ctcplhhcHpVWp,ctcplHpcHpVP,ctcplHpcHpVZ,ctcplhhcVWpVWp,ctcplhhVZVZ,      & 
& ctcplHpcVWpVP,ctcplHpcVWpVZ,ctcplcHpVPVWp,ctcplcHpVWpVZ,ctcplVGVGVG,ctcplcVWpVPVWp,    & 
& ctcplcVWpVWpVZ,ctcplcFdFdAhL,ctcplcFdFdAhR,ctcplcFeFeAhL,ctcplcFeFeAhR,ctcplcFuFuAhL,  & 
& ctcplcFuFuAhR,ctcplcFdFdhhL,ctcplcFdFdhhR,ctcplcFuFdHpL,ctcplcFuFdHpR,ctcplcFeFehhL,   & 
& ctcplcFeFehhR,ctcplcFvFeHpL,ctcplcFvFeHpR,ctcplcFuFuhhL,ctcplcFuFuhhR,ctcplcFdFucHpL,  & 
& ctcplcFdFucHpR,ctcplcFeFvcHpL,ctcplcFeFvcHpR,ctcplcFdFdVGL,ctcplcFdFdVGR,              & 
& ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFuFdVWpL,ctcplcFuFdVWpR,ctcplcFdFdVZL,               & 
& ctcplcFdFdVZR,ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFvFeVWpL,ctcplcFvFeVWpR,               & 
& ctcplcFeFeVZL,ctcplcFeFeVZR,ctcplcFuFuVGL,ctcplcFuFuVGR,ctcplcFuFuVPL,ctcplcFuFuVPR,   & 
& ctcplcFuFuVZL,ctcplcFuFuVZR,ctcplcFdFucVWpL,ctcplcFdFucVWpR,ctcplcFvFvVZL,             & 
& ctcplcFvFvVZR,ctcplcFeFvcVWpL,ctcplcFeFvcVWpR,MLambda,deltaM,kont)

! -------------------------------------------- 
! The decays at one-loop 
! -------------------------------------------- 

! Fu
If (CalcLoopDecay_Fu) Then 
Call OneLoopDecay_Fu(MFdOS,MFd2OS,MFuOS,MFu2OS,MFeOS,MFe2OS,MHpOS,MHp2OS,             & 
& MAhOS,MAh2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,MVWpOS,MVWp2OS,ZDLOS,ZDROS,ZULOS,               & 
& ZUROS,ZELOS,ZEROS,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,               & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,               & 
& Ye,Mu,v,dg1,dg2,dg3,dYu,dYd,dYe,dMu,dLam,dv,dZDL,dZDR,dZUL,dZUR,dZEL,dZER,             & 
& dSinTW,dCosTW,dTanTW,ZfVG,ZfHp,ZfvL,ZfAh,Zfhh,ZfVP,ZfVZ,ZfVWp,ZfDL,ZfDR,               & 
& ZfUL,ZfUR,ZfEL,ZfER,ZfVPVZ,ZfVZVP,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,         & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,               & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,         & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcHpVPVWp,cplcHpVWpVZ,               & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,               & 
& cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,cplVGVGVG,         & 
& ctcplcFuFdHpL,ctcplcFuFdHpR,ctcplcFuFdVWpL,ctcplcFuFdVWpR,ctcplcFuFuAhL,               & 
& ctcplcFuFuAhR,ctcplcFuFuhhL,ctcplcFuFuhhR,ctcplcFuFuVGL,ctcplcFuFuVGR,ctcplcFuFuVPL,   & 
& ctcplcFuFuVPR,ctcplcFuFuVZL,ctcplcFuFuVZR,GcplcFuFdHpL,GcplcFuFdHpR,GcplcHpVPVWp,      & 
& GcplHpcVWpVP,GosZcplcFuFdHpL,GosZcplcFuFdHpR,GosZcplcHpVPVWp,GosZcplHpcVWpVP,          & 
& GZcplcFuFdHpL,GZcplcFuFdHpR,GZcplcHpVPVWp,GZcplHpcVWpVP,ZcplcFdFdVGL,ZcplcFdFdVGR,     & 
& ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFdFucHpL,ZcplcFdFucHpR,ZcplcFdFucVWpL,ZcplcFdFucVWpR,   & 
& ZcplcFuFdHpL,ZcplcFuFdHpR,ZcplcFuFdVWpL,ZcplcFuFdVWpR,ZcplcFuFuAhL,ZcplcFuFuAhR,       & 
& ZcplcFuFuhhL,ZcplcFuFuhhR,ZcplcFuFuVGL,ZcplcFuFuVGR,ZcplcFuFuVPL,ZcplcFuFuVPR,         & 
& ZcplcFuFuVZL,ZcplcFuFuVZR,ZcplcHpVPVWp,ZcplcVWpVPVWp,ZcplHpcHpVP,ZcplHpcVWpVP,         & 
& ZcplVGVGVG,ZRUVd,ZRUUd,ZRUVu,ZRUUu,ZRUVe,ZRUUe,MLambda,em,gs,deltaM,kont,gP1LFu)

End if 
! Fe
If (CalcLoopDecay_Fe) Then 
Call OneLoopDecay_Fe(MFdOS,MFd2OS,MFuOS,MFu2OS,MFeOS,MFe2OS,MHpOS,MHp2OS,             & 
& MAhOS,MAh2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,MVWpOS,MVWp2OS,ZDLOS,ZDROS,ZULOS,               & 
& ZUROS,ZELOS,ZEROS,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,               & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,               & 
& Ye,Mu,v,dg1,dg2,dg3,dYu,dYd,dYe,dMu,dLam,dv,dZDL,dZDR,dZUL,dZUR,dZEL,dZER,             & 
& dSinTW,dCosTW,dTanTW,ZfVG,ZfHp,ZfvL,ZfAh,Zfhh,ZfVP,ZfVZ,ZfVWp,ZfDL,ZfDR,               & 
& ZfUL,ZfUR,ZfEL,ZfER,ZfVPVZ,ZfVZVP,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFvFeHpL,cplcFvFeHpR,cplcFvFeVWpL,cplcFvFeVWpR,cplcFvFvVZL,cplcFvFvVZR,             & 
& cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,            & 
& cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,          & 
& cplHpcVWpVZ,ctcplcFeFeAhL,ctcplcFeFeAhR,ctcplcFeFehhL,ctcplcFeFehhR,ctcplcFeFeVPL,     & 
& ctcplcFeFeVPR,ctcplcFeFeVZL,ctcplcFeFeVZR,ctcplcFeFvcHpL,ctcplcFeFvcHpR,               & 
& ctcplcFeFvcVWpL,ctcplcFeFvcVWpR,GcplcFeFvcHpL,GcplcFeFvcHpR,GcplcHpVPVWp,              & 
& GcplHpcVWpVP,GosZcplcFeFvcHpL,GosZcplcFeFvcHpR,GosZcplcHpVPVWp,GosZcplHpcVWpVP,        & 
& GZcplcFeFvcHpL,GZcplcFeFvcHpR,GZcplcHpVPVWp,GZcplHpcVWpVP,ZcplcFeFeAhL,ZcplcFeFeAhR,   & 
& ZcplcFeFehhL,ZcplcFeFehhR,ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcFeFeVZL,ZcplcFeFeVZR,         & 
& ZcplcFeFvcHpL,ZcplcFeFvcHpR,ZcplcFeFvcVWpL,ZcplcFeFvcVWpR,ZcplcFvFeHpL,ZcplcFvFeHpR,   & 
& ZcplcFvFeVWpL,ZcplcFvFeVWpR,ZcplcHpVPVWp,ZcplcVWpVPVWp,ZcplHpcHpVP,ZcplHpcVWpVP,       & 
& ZRUVd,ZRUUd,ZRUVu,ZRUUu,ZRUVe,ZRUUe,MLambda,em,gs,deltaM,kont,gP1LFe)

End if 
! Fd
If (CalcLoopDecay_Fd) Then 
Call OneLoopDecay_Fd(MFdOS,MFd2OS,MFuOS,MFu2OS,MFeOS,MFe2OS,MHpOS,MHp2OS,             & 
& MAhOS,MAh2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,MVWpOS,MVWp2OS,ZDLOS,ZDROS,ZULOS,               & 
& ZUROS,ZELOS,ZEROS,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,               & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,               & 
& Ye,Mu,v,dg1,dg2,dg3,dYu,dYd,dYe,dMu,dLam,dv,dZDL,dZDR,dZUL,dZUR,dZEL,dZER,             & 
& dSinTW,dCosTW,dTanTW,ZfVG,ZfHp,ZfvL,ZfAh,Zfhh,ZfVP,ZfVZ,ZfVWp,ZfDL,ZfDR,               & 
& ZfUL,ZfUR,ZfEL,ZfER,ZfVPVZ,ZfVZVP,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,         & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,               & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,         & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcHpVPVWp,cplcHpVWpVZ,               & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,               & 
& cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,cplVGVGVG,         & 
& ctcplcFdFdAhL,ctcplcFdFdAhR,ctcplcFdFdhhL,ctcplcFdFdhhR,ctcplcFdFdVGL,ctcplcFdFdVGR,   & 
& ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFdFdVZL,ctcplcFdFdVZR,ctcplcFdFucHpL,ctcplcFdFucHpR, & 
& ctcplcFdFucVWpL,ctcplcFdFucVWpR,GcplcFdFucHpL,GcplcFdFucHpR,GcplcHpVPVWp,              & 
& GcplHpcVWpVP,GosZcplcFdFucHpL,GosZcplcFdFucHpR,GosZcplcHpVPVWp,GosZcplHpcVWpVP,        & 
& GZcplcFdFucHpL,GZcplcFdFucHpR,GZcplcHpVPVWp,GZcplHpcVWpVP,ZcplcFdFdAhL,ZcplcFdFdAhR,   & 
& ZcplcFdFdhhL,ZcplcFdFdhhR,ZcplcFdFdVGL,ZcplcFdFdVGR,ZcplcFdFdVPL,ZcplcFdFdVPR,         & 
& ZcplcFdFdVZL,ZcplcFdFdVZR,ZcplcFdFucHpL,ZcplcFdFucHpR,ZcplcFdFucVWpL,ZcplcFdFucVWpR,   & 
& ZcplcFuFdHpL,ZcplcFuFdHpR,ZcplcFuFdVWpL,ZcplcFuFdVWpR,ZcplcFuFuVGL,ZcplcFuFuVGR,       & 
& ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplcHpVPVWp,ZcplcVWpVPVWp,ZcplHpcHpVP,ZcplHpcVWpVP,         & 
& ZcplVGVGVG,ZRUVd,ZRUUd,ZRUVu,ZRUUu,ZRUVe,ZRUUe,MLambda,em,gs,deltaM,kont,gP1LFd)

End if 
! hh
If (CalcLoopDecay_hh) Then 
Call OneLoopDecay_hh(MFdOS,MFd2OS,MFuOS,MFu2OS,MFeOS,MFe2OS,MHpOS,MHp2OS,             & 
& MAhOS,MAh2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,MVWpOS,MVWp2OS,ZDLOS,ZDROS,ZULOS,               & 
& ZUROS,ZELOS,ZEROS,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,               & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,               & 
& Ye,Mu,v,dg1,dg2,dg3,dYu,dYd,dYe,dMu,dLam,dv,dZDL,dZDR,dZUL,dZUR,dZEL,dZER,             & 
& dSinTW,dCosTW,dTanTW,ZfVG,ZfHp,ZfvL,ZfAh,Zfhh,ZfVP,ZfVZ,ZfVWp,ZfDL,ZfDR,               & 
& ZfUL,ZfUR,ZfEL,ZfER,ZfVPVZ,ZfVZVP,cplAhAhAhAh1,cplAhAhcVWpVWp1,cplAhAhhh,              & 
& cplAhAhhhhh1,cplAhAhHpcHp1,cplAhAhVZVZ1,cplAhcHpVPVWp1,cplAhcHpVWp,cplAhcHpVWpVZ1,     & 
& cplAhhhVZ,cplAhHpcVWp,cplAhHpcVWpVP1,cplAhHpcVWpVZ1,cplcFdFdAhL,cplcFdFdAhR,           & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFvFeHpL,cplcFvFeHpR,cplcFvFeVWpL,cplcFvFeVWpR,             & 
& cplcFvFvVZL,cplcFvFvVZR,cplcgAgWCVWp,cplcgAgWpcVWp,cplcgWCgAcVWp,cplcgWCgWCAh,         & 
& cplcgWCgWChh,cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWCgZcHp,cplcgWCgZcVWp,cplcgWpgAHp,         & 
& cplcgWpgAVWp,cplcgWpgWpAh,cplcgWpgWphh,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWpgZHp,          & 
& cplcgWpgZVWp,cplcgZgAhh,cplcgZgWCHp,cplcgZgWCVWp,cplcgZgWpcHp,cplcgZgWpcVWp,           & 
& cplcgZgZhh,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,            & 
& cplcVWpcVWpVWpVWp3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,cplcVWpVPVPVWp3Q,cplcVWpVPVWp,   & 
& cplcVWpVPVWpVZ1Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ3Q,cplcVWpVWpVZ,cplcVWpVWpVZVZ1Q,      & 
& cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplhhcHpVPVWp1,cplhhcHpVWp,cplhhcHpVWpVZ1,           & 
& cplhhcVWpVWp,cplhhhhcVWpVWp1,cplhhhhhh,cplhhhhhhhh1,cplhhhhHpcHp1,cplhhhhVZVZ1,        & 
& cplhhHpcHp,cplhhHpcVWp,cplhhHpcVWpVP1,cplhhHpcVWpVZ1,cplhhVZVZ,cplHpcHpcVWpVWp1,       & 
& cplHpcHpVP,cplHpcHpVPVP1,cplHpcHpVPVZ1,cplHpcHpVZ,cplHpcHpVZVZ1,cplHpcVWpVP,           & 
& cplHpcVWpVZ,cplHpHpcHpcHp1,ctcplAhAhhh,ctcplAhhhVZ,ctcplcFdFdhhL,ctcplcFdFdhhR,        & 
& ctcplcFeFehhL,ctcplcFeFehhR,ctcplcFuFuhhL,ctcplcFuFuhhR,ctcplhhcVWpVWp,ctcplhhhhhh,    & 
& ctcplhhHpcHp,ctcplhhHpcVWp,ctcplhhVZVZ,GcplcHpVPVWp,GcplhhcHpVWp,GcplhhHpcHp,          & 
& GcplhhHpcVWp,GcplHpcVWpVP,GosZcplcHpVPVWp,GosZcplhhcHpVWp,GosZcplhhHpcHp,              & 
& GosZcplhhHpcVWp,GosZcplHpcVWpVP,GZcplcHpVPVWp,GZcplhhcHpVWp,GZcplhhHpcHp,              & 
& GZcplhhHpcVWp,GZcplHpcVWpVP,ZcplAhAhhh,ZcplAhhhVZ,ZcplcFdFdhhL,ZcplcFdFdhhR,           & 
& ZcplcFeFehhL,ZcplcFeFehhR,ZcplcFuFuhhL,ZcplcFuFuhhR,ZcplhhcVWpVWp,Zcplhhhhhh,          & 
& ZcplhhHpcHp,ZcplhhHpcVWp,ZcplhhVZVZ,ZRUVd,ZRUUd,ZRUVu,ZRUUu,ZRUVe,ZRUUe,               & 
& MLambda,em,gs,deltaM,kont,gP1Lhh)

End if 
If (Extra_scale_loopDecays) Then 
q2 = SetRenormalizationScale(q2_save) 
End if 
Iname = Iname - 1 
 
End Subroutine CalculateOneLoopDecays  
 
 
End Module OneLoopDecays_SM 
 