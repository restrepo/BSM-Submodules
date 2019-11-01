(* ---------------------------------------------------------------------- *) 
(* This model file was automatically created by SARAH version4.13.0 *) 
(* SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906   *) 
(* (c) Florian Staub, 2013  *) 
(* ---------------------------------------------------------------------- *) 
(* File created at 13:31 on 20.6.2018  *) 
(* ---------------------------------------------------------------------- *) 
 
 
(* ###################### *)
(* All running parameters *)
(* ###################### *)

AllParametersEx = {mu2, v, g1, g2, g3, Yu[1, 1], Yu[2, 2], Yu[3, 3], Yd[1, 1], Yd[2, 2], 
 Yd[3, 3], Ye[1, 1], Ye[2, 2], Ye[3, 3], \[Lambda]}


(* ###################### *)
(*   All Beta Functions   *)
(* ###################### *)

AllEquations = {Derivative[1][mu2][t] == 
  (Log[10]*((-9*g1[t]^2*mu2[t])/10 - (9*g2[t]^2*mu2[t])/2 + 
      6*mu2[t]*\[Lambda][t] + 6*mu2[t]*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + 
        Yd[3, 3][t]^2) + 2*mu2[t]*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + 
        Ye[3, 3][t]^2) + 6*mu2[t]*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
        Yu[3, 3][t]^2)))/(16*Pi^2) + 
   (inc2L*Log[10]*mu2[t]*(1671*g1[t]^4 + 450*g1[t]^2*g2[t]^2 - 3625*g2[t]^4 + 
      2880*g1[t]^2*\[Lambda][t] + 14400*g2[t]^2*\[Lambda][t] - 
      6000*\[Lambda][t]^2 + 100*(5*g1[t]^2 + 45*g2[t]^2 + 160*g3[t]^2 - 
        144*\[Lambda][t])*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) - 
      5400*(Yd[1, 1][t]^4 + Yd[2, 2][t]^4 + Yd[3, 3][t]^4) + 
      300*(5*g1[t]^2 + 5*g2[t]^2 - 16*\[Lambda][t])*(Ye[1, 1][t]^2 + 
        Ye[2, 2][t]^2 + Ye[3, 3][t]^2) - 
      1800*(Ye[1, 1][t]^4 + Ye[2, 2][t]^4 + Ye[3, 3][t]^4) + 
      1700*g1[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2) + 
      4500*g2[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2) + 
      16000*g3[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2) - 
      14400*\[Lambda][t]*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2) - 
      8400*(Yd[1, 1][t]^2*Yu[1, 1][t]^2 + Yd[2, 2][t]^2*Yu[2, 2][t]^2 + 
        Yd[3, 3][t]^2*Yu[3, 3][t]^2) - 5400*(Yu[1, 1][t]^4 + Yu[2, 2][t]^4 + 
        Yu[3, 3][t]^4)))/(102400*Pi^4), Derivative[1][v][t] == 
  (Log[10]*v[t]*(9*g1[t]^2 + 3*Xi*g1[t]^2 + 45*g2[t]^2 + 15*Xi*g2[t]^2 - 
      60*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) - 
      20*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + Ye[3, 3][t]^2) - 
      60*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2)))/(320*Pi^2) + 
   (inc2L*Log[10]*v[t]*(-1293*g1[t]^4 + 36*Xi*g1[t]^4 + 36*Xi^2*g1[t]^4 - 
      270*g1[t]^2*g2[t]^2 + 360*Xi*g1[t]^2*g2[t]^2 + 
      360*Xi^2*g1[t]^2*g2[t]^2 + 6775*g2[t]^4 + 2700*Xi*g2[t]^4 - 
      1200*\[Lambda][t]^2 - 20*((25 + 36*Xi)*g1[t]^2 + 
        5*(9*(5 + 4*Xi)*g2[t]^2 + 160*g3[t]^2))*(Yd[1, 1][t]^2 + 
        Yd[2, 2][t]^2 + Yd[3, 3][t]^2) + 
      5400*(Yd[1, 1][t]^4 + Yd[2, 2][t]^4 + Yd[3, 3][t]^4) - 
      60*((25 + 4*Xi)*g1[t]^2 + 5*(5 + 4*Xi)*g2[t]^2)*
       (Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + Ye[3, 3][t]^2) + 
      1800*(Ye[1, 1][t]^4 + Ye[2, 2][t]^4 + Ye[3, 3][t]^4) - 
      1700*g1[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2) - 
      720*Xi*g1[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2) - 
      4500*g2[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2) - 
      3600*Xi*g2[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2) - 
      16000*g3[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2) - 
      1200*(Yd[1, 1][t]^2*Yu[1, 1][t]^2 + Yd[2, 2][t]^2*Yu[2, 2][t]^2 + 
        Yd[3, 3][t]^2*Yu[3, 3][t]^2) + 5400*(Yu[1, 1][t]^4 + Yu[2, 2][t]^4 + 
        Yu[3, 3][t]^4)))/(204800*Pi^4), Derivative[1][g1][t] == 
  (41*g1[t]^3*Log[10])/(160*Pi^2) + 
   (inc2L*g1[t]^3*Log[10]*(199*g1[t]^2 + 135*g2[t]^2 + 440*g3[t]^2 - 
      25*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) - 
      75*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + Ye[3, 3][t]^2) - 
      85*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2)))/(12800*Pi^4), 
 Derivative[1][g2][t] == (-19*g2[t]^3*Log[10])/(96*Pi^2) + 
   (inc2L*g2[t]^3*Log[10]*(27*g1[t]^2 + 175*g2[t]^2 + 360*g3[t]^2 - 
      45*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) - 
      15*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + Ye[3, 3][t]^2) - 
      45*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2)))/(7680*Pi^4), 
 Derivative[1][g3][t] == (-7*g3[t]^3*Log[10])/(16*Pi^2) - 
   (inc2L*g3[t]^3*Log[10]*(-11*g1[t]^2 - 45*g2[t]^2 + 260*g3[t]^2 + 
      20*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) + 
      20*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2)))/(2560*Pi^4), 
 Derivative[1][Yu[1, 1]][t] == 
  (Log[10]*((-3*(Yd[1, 1][t]^2*Yu[1, 1][t] - Yu[1, 1][t]^3))/2 + 
      Yu[1, 1][t]*((-17*g1[t]^2)/20 - (9*g2[t]^2)/4 - 8*g3[t]^2 + 
        3*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) + Ye[1, 1][t]^2 + 
        Ye[2, 2][t]^2 + Ye[3, 3][t]^2 + 3*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
          Yu[3, 3][t]^2))))/(16*Pi^2) + 
   (inc2L*Log[10]*((Yu[1, 1][t]*(1187*g1[t]^4 - 270*g1[t]^2*g2[t]^2 - 
         3450*g2[t]^4 + 760*g1[t]^2*g3[t]^2 + 5400*g2[t]^2*g3[t]^2 - 
         64800*g3[t]^4 + 900*\[Lambda][t]^2 + 375*(g1[t]^2 + 9*g2[t]^2 + 
           32*g3[t]^2)*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) - 
         4050*(Yd[1, 1][t]^4 + Yd[2, 2][t]^4 + Yd[3, 3][t]^4) + 
         1125*(g1[t]^2 + g2[t]^2)*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + 
           Ye[3, 3][t]^2) - 1350*(Ye[1, 1][t]^4 + Ye[2, 2][t]^4 + 
           Ye[3, 3][t]^4) + 1275*g1[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
           Yu[3, 3][t]^2) + 3375*g2[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
           Yu[3, 3][t]^2) + 12000*g3[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
           Yu[3, 3][t]^2) + 900*(Yd[1, 1][t]^2*Yu[1, 1][t]^2 + 
           Yd[2, 2][t]^2*Yu[2, 2][t]^2 + Yd[3, 3][t]^2*Yu[3, 3][t]^2) - 
         4050*(Yu[1, 1][t]^4 + Yu[2, 2][t]^4 + Yu[3, 3][t]^4)))/600 + 
      (20*(11*Yd[1, 1][t]^4*Yu[1, 1][t] - 5*Yd[1, 1][t]^2*Yu[1, 1][t]^3 + 
          6*Yu[1, 1][t]^5) + Yu[1, 1][t]^3*(223*g1[t]^2 + 675*g2[t]^2 + 
          1280*g3[t]^2 - 480*\[Lambda][t] - 540*(Yd[1, 1][t]^2 + 
            Yd[2, 2][t]^2 + Yd[3, 3][t]^2) - 180*(Ye[1, 1][t]^2 + 
            Ye[2, 2][t]^2 + Ye[3, 3][t]^2) - 540*(Yu[1, 1][t]^2 + 
            Yu[2, 2][t]^2 + Yu[3, 3][t]^2)) + Yd[1, 1][t]^2*Yu[1, 1][t]*
         (-43*g1[t]^2 + 45*g2[t]^2 - 1280*g3[t]^2 + 
          300*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) + 
          100*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + Ye[3, 3][t]^2) + 
          300*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2)))/80))/
    (256*Pi^4), Derivative[1][Yu[2, 2]][t] == 
  (Log[10]*((-3*(Yd[2, 2][t]^2*Yu[2, 2][t] - Yu[2, 2][t]^3))/2 + 
      Yu[2, 2][t]*((-17*g1[t]^2)/20 - (9*g2[t]^2)/4 - 8*g3[t]^2 + 
        3*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) + Ye[1, 1][t]^2 + 
        Ye[2, 2][t]^2 + Ye[3, 3][t]^2 + 3*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
          Yu[3, 3][t]^2))))/(16*Pi^2) + 
   (inc2L*Log[10]*((Yu[2, 2][t]*(1187*g1[t]^4 - 270*g1[t]^2*g2[t]^2 - 
         3450*g2[t]^4 + 760*g1[t]^2*g3[t]^2 + 5400*g2[t]^2*g3[t]^2 - 
         64800*g3[t]^4 + 900*\[Lambda][t]^2 + 375*(g1[t]^2 + 9*g2[t]^2 + 
           32*g3[t]^2)*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) - 
         4050*(Yd[1, 1][t]^4 + Yd[2, 2][t]^4 + Yd[3, 3][t]^4) + 
         1125*(g1[t]^2 + g2[t]^2)*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + 
           Ye[3, 3][t]^2) - 1350*(Ye[1, 1][t]^4 + Ye[2, 2][t]^4 + 
           Ye[3, 3][t]^4) + 1275*g1[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
           Yu[3, 3][t]^2) + 3375*g2[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
           Yu[3, 3][t]^2) + 12000*g3[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
           Yu[3, 3][t]^2) + 900*(Yd[1, 1][t]^2*Yu[1, 1][t]^2 + 
           Yd[2, 2][t]^2*Yu[2, 2][t]^2 + Yd[3, 3][t]^2*Yu[3, 3][t]^2) - 
         4050*(Yu[1, 1][t]^4 + Yu[2, 2][t]^4 + Yu[3, 3][t]^4)))/600 + 
      (20*(11*Yd[2, 2][t]^4*Yu[2, 2][t] - 5*Yd[2, 2][t]^2*Yu[2, 2][t]^3 + 
          6*Yu[2, 2][t]^5) + Yu[2, 2][t]^3*(223*g1[t]^2 + 675*g2[t]^2 + 
          1280*g3[t]^2 - 480*\[Lambda][t] - 540*(Yd[1, 1][t]^2 + 
            Yd[2, 2][t]^2 + Yd[3, 3][t]^2) - 180*(Ye[1, 1][t]^2 + 
            Ye[2, 2][t]^2 + Ye[3, 3][t]^2) - 540*(Yu[1, 1][t]^2 + 
            Yu[2, 2][t]^2 + Yu[3, 3][t]^2)) + Yd[2, 2][t]^2*Yu[2, 2][t]*
         (-43*g1[t]^2 + 45*g2[t]^2 - 1280*g3[t]^2 + 
          300*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) + 
          100*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + Ye[3, 3][t]^2) + 
          300*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2)))/80))/
    (256*Pi^4), Derivative[1][Yu[3, 3]][t] == 
  (Log[10]*((-3*(Yd[3, 3][t]^2*Yu[3, 3][t] - Yu[3, 3][t]^3))/2 + 
      Yu[3, 3][t]*((-17*g1[t]^2)/20 - (9*g2[t]^2)/4 - 8*g3[t]^2 + 
        3*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) + Ye[1, 1][t]^2 + 
        Ye[2, 2][t]^2 + Ye[3, 3][t]^2 + 3*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
          Yu[3, 3][t]^2))))/(16*Pi^2) + 
   (inc2L*Log[10]*((Yu[3, 3][t]*(1187*g1[t]^4 - 270*g1[t]^2*g2[t]^2 - 
         3450*g2[t]^4 + 760*g1[t]^2*g3[t]^2 + 5400*g2[t]^2*g3[t]^2 - 
         64800*g3[t]^4 + 900*\[Lambda][t]^2 + 375*(g1[t]^2 + 9*g2[t]^2 + 
           32*g3[t]^2)*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) - 
         4050*(Yd[1, 1][t]^4 + Yd[2, 2][t]^4 + Yd[3, 3][t]^4) + 
         1125*(g1[t]^2 + g2[t]^2)*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + 
           Ye[3, 3][t]^2) - 1350*(Ye[1, 1][t]^4 + Ye[2, 2][t]^4 + 
           Ye[3, 3][t]^4) + 1275*g1[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
           Yu[3, 3][t]^2) + 3375*g2[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
           Yu[3, 3][t]^2) + 12000*g3[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
           Yu[3, 3][t]^2) + 900*(Yd[1, 1][t]^2*Yu[1, 1][t]^2 + 
           Yd[2, 2][t]^2*Yu[2, 2][t]^2 + Yd[3, 3][t]^2*Yu[3, 3][t]^2) - 
         4050*(Yu[1, 1][t]^4 + Yu[2, 2][t]^4 + Yu[3, 3][t]^4)))/600 + 
      (20*(11*Yd[3, 3][t]^4*Yu[3, 3][t] - 5*Yd[3, 3][t]^2*Yu[3, 3][t]^3 + 
          6*Yu[3, 3][t]^5) + Yu[3, 3][t]^3*(223*g1[t]^2 + 675*g2[t]^2 + 
          1280*g3[t]^2 - 480*\[Lambda][t] - 540*(Yd[1, 1][t]^2 + 
            Yd[2, 2][t]^2 + Yd[3, 3][t]^2) - 180*(Ye[1, 1][t]^2 + 
            Ye[2, 2][t]^2 + Ye[3, 3][t]^2) - 540*(Yu[1, 1][t]^2 + 
            Yu[2, 2][t]^2 + Yu[3, 3][t]^2)) + Yd[3, 3][t]^2*Yu[3, 3][t]*
         (-43*g1[t]^2 + 45*g2[t]^2 - 1280*g3[t]^2 + 
          300*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) + 
          100*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + Ye[3, 3][t]^2) + 
          300*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2)))/80))/
    (256*Pi^4), Derivative[1][Yd[1, 1]][t] == 
  (Log[10]*(6*(Yd[1, 1][t]^3 - Yd[1, 1][t]*Yu[1, 1][t]^2) - 
      Yd[1, 1][t]*(g1[t]^2 + 9*g2[t]^2 + 32*g3[t]^2 - 
        12*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) - 
        4*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + Ye[3, 3][t]^2) - 
        12*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2))))/(64*Pi^2) + 
   (inc2L*Log[10]*(Yd[1, 1][t]*((-127*g1[t]^4)/600 - (27*g1[t]^2*g2[t]^2)/
         20 - (23*g2[t]^4)/4 + (31*g1[t]^2*g3[t]^2)/15 + 9*g2[t]^2*g3[t]^2 - 
        108*g3[t]^4 + (3*\[Lambda][t]^2)/2 + 
        (5*(g1[t]^2 + 9*g2[t]^2 + 32*g3[t]^2)*(Yd[1, 1][t]^2 + 
           Yd[2, 2][t]^2 + Yd[3, 3][t]^2))/8 - 
        (27*(Yd[1, 1][t]^4 + Yd[2, 2][t]^4 + Yd[3, 3][t]^4))/4 + 
        (15*(g1[t]^2 + g2[t]^2)*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + 
           Ye[3, 3][t]^2))/8 - (9*(Ye[1, 1][t]^4 + Ye[2, 2][t]^4 + 
           Ye[3, 3][t]^4))/4 + (17*g1[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
           Yu[3, 3][t]^2))/8 + (45*g2[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
           Yu[3, 3][t]^2))/8 + 20*g3[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
          Yu[3, 3][t]^2) + (3*(Yd[1, 1][t]^2*Yu[1, 1][t]^2 + 
           Yd[2, 2][t]^2*Yu[2, 2][t]^2 + Yd[3, 3][t]^2*Yu[3, 3][t]^2))/2 - 
        (27*(Yu[1, 1][t]^4 + Yu[2, 2][t]^4 + Yu[3, 3][t]^4))/4) + 
      (20*(6*Yd[1, 1][t]^5 - 5*Yd[1, 1][t]^3*Yu[1, 1][t]^2 + 
          11*Yd[1, 1][t]*Yu[1, 1][t]^4) + Yd[1, 1][t]^3*
         (187*g1[t]^2 + 675*g2[t]^2 + 1280*g3[t]^2 - 480*\[Lambda][t] - 
          540*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) - 
          180*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + Ye[3, 3][t]^2) - 
          540*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2)) + 
        Yd[1, 1][t]*Yu[1, 1][t]^2*(-79*g1[t]^2 + 45*g2[t]^2 - 1280*g3[t]^2 + 
          300*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) + 
          100*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + Ye[3, 3][t]^2) + 
          300*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2)))/80))/
    (256*Pi^4), Derivative[1][Yd[2, 2]][t] == 
  (Log[10]*(6*(Yd[2, 2][t]^3 - Yd[2, 2][t]*Yu[2, 2][t]^2) - 
      Yd[2, 2][t]*(g1[t]^2 + 9*g2[t]^2 + 32*g3[t]^2 - 
        12*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) - 
        4*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + Ye[3, 3][t]^2) - 
        12*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2))))/(64*Pi^2) + 
   (inc2L*Log[10]*(Yd[2, 2][t]*((-127*g1[t]^4)/600 - (27*g1[t]^2*g2[t]^2)/
         20 - (23*g2[t]^4)/4 + (31*g1[t]^2*g3[t]^2)/15 + 9*g2[t]^2*g3[t]^2 - 
        108*g3[t]^4 + (3*\[Lambda][t]^2)/2 + 
        (5*(g1[t]^2 + 9*g2[t]^2 + 32*g3[t]^2)*(Yd[1, 1][t]^2 + 
           Yd[2, 2][t]^2 + Yd[3, 3][t]^2))/8 - 
        (27*(Yd[1, 1][t]^4 + Yd[2, 2][t]^4 + Yd[3, 3][t]^4))/4 + 
        (15*(g1[t]^2 + g2[t]^2)*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + 
           Ye[3, 3][t]^2))/8 - (9*(Ye[1, 1][t]^4 + Ye[2, 2][t]^4 + 
           Ye[3, 3][t]^4))/4 + (17*g1[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
           Yu[3, 3][t]^2))/8 + (45*g2[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
           Yu[3, 3][t]^2))/8 + 20*g3[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
          Yu[3, 3][t]^2) + (3*(Yd[1, 1][t]^2*Yu[1, 1][t]^2 + 
           Yd[2, 2][t]^2*Yu[2, 2][t]^2 + Yd[3, 3][t]^2*Yu[3, 3][t]^2))/2 - 
        (27*(Yu[1, 1][t]^4 + Yu[2, 2][t]^4 + Yu[3, 3][t]^4))/4) + 
      (20*(6*Yd[2, 2][t]^5 - 5*Yd[2, 2][t]^3*Yu[2, 2][t]^2 + 
          11*Yd[2, 2][t]*Yu[2, 2][t]^4) + Yd[2, 2][t]^3*
         (187*g1[t]^2 + 675*g2[t]^2 + 1280*g3[t]^2 - 480*\[Lambda][t] - 
          540*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) - 
          180*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + Ye[3, 3][t]^2) - 
          540*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2)) + 
        Yd[2, 2][t]*Yu[2, 2][t]^2*(-79*g1[t]^2 + 45*g2[t]^2 - 1280*g3[t]^2 + 
          300*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) + 
          100*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + Ye[3, 3][t]^2) + 
          300*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2)))/80))/
    (256*Pi^4), Derivative[1][Yd[3, 3]][t] == 
  (Log[10]*(6*(Yd[3, 3][t]^3 - Yd[3, 3][t]*Yu[3, 3][t]^2) - 
      Yd[3, 3][t]*(g1[t]^2 + 9*g2[t]^2 + 32*g3[t]^2 - 
        12*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) - 
        4*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + Ye[3, 3][t]^2) - 
        12*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2))))/(64*Pi^2) + 
   (inc2L*Log[10]*(Yd[3, 3][t]*((-127*g1[t]^4)/600 - (27*g1[t]^2*g2[t]^2)/
         20 - (23*g2[t]^4)/4 + (31*g1[t]^2*g3[t]^2)/15 + 9*g2[t]^2*g3[t]^2 - 
        108*g3[t]^4 + (3*\[Lambda][t]^2)/2 + 
        (5*(g1[t]^2 + 9*g2[t]^2 + 32*g3[t]^2)*(Yd[1, 1][t]^2 + 
           Yd[2, 2][t]^2 + Yd[3, 3][t]^2))/8 - 
        (27*(Yd[1, 1][t]^4 + Yd[2, 2][t]^4 + Yd[3, 3][t]^4))/4 + 
        (15*(g1[t]^2 + g2[t]^2)*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + 
           Ye[3, 3][t]^2))/8 - (9*(Ye[1, 1][t]^4 + Ye[2, 2][t]^4 + 
           Ye[3, 3][t]^4))/4 + (17*g1[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
           Yu[3, 3][t]^2))/8 + (45*g2[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
           Yu[3, 3][t]^2))/8 + 20*g3[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
          Yu[3, 3][t]^2) + (3*(Yd[1, 1][t]^2*Yu[1, 1][t]^2 + 
           Yd[2, 2][t]^2*Yu[2, 2][t]^2 + Yd[3, 3][t]^2*Yu[3, 3][t]^2))/2 - 
        (27*(Yu[1, 1][t]^4 + Yu[2, 2][t]^4 + Yu[3, 3][t]^4))/4) + 
      (20*(6*Yd[3, 3][t]^5 - 5*Yd[3, 3][t]^3*Yu[3, 3][t]^2 + 
          11*Yd[3, 3][t]*Yu[3, 3][t]^4) + Yd[3, 3][t]^3*
         (187*g1[t]^2 + 675*g2[t]^2 + 1280*g3[t]^2 - 480*\[Lambda][t] - 
          540*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) - 
          180*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + Ye[3, 3][t]^2) - 
          540*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2)) + 
        Yd[3, 3][t]*Yu[3, 3][t]^2*(-79*g1[t]^2 + 45*g2[t]^2 - 1280*g3[t]^2 + 
          300*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) + 
          100*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + Ye[3, 3][t]^2) + 
          300*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2)))/80))/
    (256*Pi^4), Derivative[1][Ye[1, 1]][t] == 
  (Log[10]*((3*Ye[1, 1][t]^3)/2 + Ye[1, 1][t]*((-9*g1[t]^2)/4 - 
        (9*g2[t]^2)/4 + 3*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) + 
        Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + Ye[3, 3][t]^2 + 
        3*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2))))/(16*Pi^2) + 
   (inc2L*Log[10]*(Ye[1, 1][t]*(2742*g1[t]^4 + 540*g1[t]^2*g2[t]^2 - 
        2300*g2[t]^4 + 600*\[Lambda][t]^2 + 250*(g1[t]^2 + 9*g2[t]^2 + 
          32*g3[t]^2)*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) - 
        2700*(Yd[1, 1][t]^4 + Yd[2, 2][t]^4 + Yd[3, 3][t]^4) + 
        750*(g1[t]^2 + g2[t]^2)*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + 
          Ye[3, 3][t]^2) - 900*(Ye[1, 1][t]^4 + Ye[2, 2][t]^4 + 
          Ye[3, 3][t]^4) + 850*g1[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
          Yu[3, 3][t]^2) + 2250*g2[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
          Yu[3, 3][t]^2) + 8000*g3[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
          Yu[3, 3][t]^2) + 600*(Yd[1, 1][t]^2*Yu[1, 1][t]^2 + 
          Yd[2, 2][t]^2*Yu[2, 2][t]^2 + Yd[3, 3][t]^2*Yu[3, 3][t]^2) - 
        2700*(Yu[1, 1][t]^4 + Yu[2, 2][t]^4 + Yu[3, 3][t]^4)) + 
      15*(40*Ye[1, 1][t]^5 + Ye[1, 1][t]^3*(129*g1[t]^2 + 225*g2[t]^2 - 
          160*\[Lambda][t] - 180*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + 
            Yd[3, 3][t]^2) - 60*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + 
            Ye[3, 3][t]^2) - 180*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
            Yu[3, 3][t]^2)))))/(102400*Pi^4), Derivative[1][Ye[2, 2]][t] == 
  (Log[10]*((3*Ye[2, 2][t]^3)/2 + Ye[2, 2][t]*((-9*g1[t]^2)/4 - 
        (9*g2[t]^2)/4 + 3*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) + 
        Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + Ye[3, 3][t]^2 + 
        3*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2))))/(16*Pi^2) + 
   (inc2L*Log[10]*(Ye[2, 2][t]*(2742*g1[t]^4 + 540*g1[t]^2*g2[t]^2 - 
        2300*g2[t]^4 + 600*\[Lambda][t]^2 + 250*(g1[t]^2 + 9*g2[t]^2 + 
          32*g3[t]^2)*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) - 
        2700*(Yd[1, 1][t]^4 + Yd[2, 2][t]^4 + Yd[3, 3][t]^4) + 
        750*(g1[t]^2 + g2[t]^2)*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + 
          Ye[3, 3][t]^2) - 900*(Ye[1, 1][t]^4 + Ye[2, 2][t]^4 + 
          Ye[3, 3][t]^4) + 850*g1[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
          Yu[3, 3][t]^2) + 2250*g2[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
          Yu[3, 3][t]^2) + 8000*g3[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
          Yu[3, 3][t]^2) + 600*(Yd[1, 1][t]^2*Yu[1, 1][t]^2 + 
          Yd[2, 2][t]^2*Yu[2, 2][t]^2 + Yd[3, 3][t]^2*Yu[3, 3][t]^2) - 
        2700*(Yu[1, 1][t]^4 + Yu[2, 2][t]^4 + Yu[3, 3][t]^4)) + 
      15*(40*Ye[2, 2][t]^5 + Ye[2, 2][t]^3*(129*g1[t]^2 + 225*g2[t]^2 - 
          160*\[Lambda][t] - 180*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + 
            Yd[3, 3][t]^2) - 60*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + 
            Ye[3, 3][t]^2) - 180*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
            Yu[3, 3][t]^2)))))/(102400*Pi^4), Derivative[1][Ye[3, 3]][t] == 
  (Log[10]*((3*Ye[3, 3][t]^3)/2 + Ye[3, 3][t]*((-9*g1[t]^2)/4 - 
        (9*g2[t]^2)/4 + 3*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) + 
        Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + Ye[3, 3][t]^2 + 
        3*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2))))/(16*Pi^2) + 
   (inc2L*Log[10]*(Ye[3, 3][t]*(2742*g1[t]^4 + 540*g1[t]^2*g2[t]^2 - 
        2300*g2[t]^4 + 600*\[Lambda][t]^2 + 250*(g1[t]^2 + 9*g2[t]^2 + 
          32*g3[t]^2)*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + Yd[3, 3][t]^2) - 
        2700*(Yd[1, 1][t]^4 + Yd[2, 2][t]^4 + Yd[3, 3][t]^4) + 
        750*(g1[t]^2 + g2[t]^2)*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + 
          Ye[3, 3][t]^2) - 900*(Ye[1, 1][t]^4 + Ye[2, 2][t]^4 + 
          Ye[3, 3][t]^4) + 850*g1[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
          Yu[3, 3][t]^2) + 2250*g2[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
          Yu[3, 3][t]^2) + 8000*g3[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
          Yu[3, 3][t]^2) + 600*(Yd[1, 1][t]^2*Yu[1, 1][t]^2 + 
          Yd[2, 2][t]^2*Yu[2, 2][t]^2 + Yd[3, 3][t]^2*Yu[3, 3][t]^2) - 
        2700*(Yu[1, 1][t]^4 + Yu[2, 2][t]^4 + Yu[3, 3][t]^4)) + 
      15*(40*Ye[3, 3][t]^5 + Ye[3, 3][t]^3*(129*g1[t]^2 + 225*g2[t]^2 - 
          160*\[Lambda][t] - 180*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + 
            Yd[3, 3][t]^2) - 60*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + 
            Ye[3, 3][t]^2) - 180*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
            Yu[3, 3][t]^2)))))/(102400*Pi^4), Derivative[1][\[Lambda]][t] == 
  (Log[10]*((27*g1[t]^4)/100 + (9*g1[t]^2*g2[t]^2)/10 + (9*g2[t]^4)/4 - 
      (9*g1[t]^2*\[Lambda][t])/5 - 9*g2[t]^2*\[Lambda][t] + 
      12*\[Lambda][t]^2 + 12*\[Lambda][t]*(Yd[1, 1][t]^2 + Yd[2, 2][t]^2 + 
        Yd[3, 3][t]^2) - 12*(Yd[1, 1][t]^4 + Yd[2, 2][t]^4 + Yd[3, 3][t]^4) + 
      4*\[Lambda][t]*(Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + Ye[3, 3][t]^2) - 
      4*(Ye[1, 1][t]^4 + Ye[2, 2][t]^4 + Ye[3, 3][t]^4) + 
      12*\[Lambda][t]*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2) - 
      12*(Yu[1, 1][t]^4 + Yu[2, 2][t]^4 + Yu[3, 3][t]^4)))/(16*Pi^2) + 
   (inc2L*Log[10]*((-3411*g1[t]^6)/1000 - (1677*g1[t]^4*g2[t]^2)/200 - 
      (289*g1[t]^2*g2[t]^4)/40 + (305*g2[t]^6)/8 + 
      (1887*g1[t]^4*\[Lambda][t])/200 + (117*g1[t]^2*g2[t]^2*\[Lambda][t])/
       20 - (73*g2[t]^4*\[Lambda][t])/8 + (54*g1[t]^2*\[Lambda][t]^2)/5 + 
      54*g2[t]^2*\[Lambda][t]^2 - 78*\[Lambda][t]^3 + 
      ((9*g1[t]^4 - 45*g2[t]^4 + 225*g2[t]^2*\[Lambda][t] + 
         80*(10*g3[t]^2 - 9*\[Lambda][t])*\[Lambda][t] + 
         g1[t]^2*(54*g2[t]^2 + 25*\[Lambda][t]))*(Yd[1, 1][t]^2 + 
         Yd[2, 2][t]^2 + Yd[3, 3][t]^2))/10 + 
      (8*g1[t]^2*(Yd[1, 1][t]^4 + Yd[2, 2][t]^4 + Yd[3, 3][t]^4))/5 - 
      64*g3[t]^2*(Yd[1, 1][t]^4 + Yd[2, 2][t]^4 + Yd[3, 3][t]^4) - 
      3*\[Lambda][t]*(Yd[1, 1][t]^4 + Yd[2, 2][t]^4 + Yd[3, 3][t]^4) + 
      60*(Yd[1, 1][t]^6 + Yd[2, 2][t]^6 + Yd[3, 3][t]^6) - 
      (3*(15*g1[t]^4 - g1[t]^2*(22*g2[t]^2 + 25*\[Lambda][t]) + 
         5*(g2[t]^4 - 5*g2[t]^2*\[Lambda][t] + 16*\[Lambda][t]^2))*
        (Ye[1, 1][t]^2 + Ye[2, 2][t]^2 + Ye[3, 3][t]^2))/10 - 
      (24*g1[t]^2*(Ye[1, 1][t]^4 + Ye[2, 2][t]^4 + Ye[3, 3][t]^4))/5 - 
      \[Lambda][t]*(Ye[1, 1][t]^4 + Ye[2, 2][t]^4 + Ye[3, 3][t]^4) + 
      20*(Ye[1, 1][t]^6 + Ye[2, 2][t]^6 + Ye[3, 3][t]^6) - 
      (171*g1[t]^4*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2))/50 + 
      (63*g1[t]^2*g2[t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2))/
       5 - (9*g2[t]^4*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2))/2 + 
      (17*g1[t]^2*\[Lambda][t]*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + 
         Yu[3, 3][t]^2))/2 + (45*g2[t]^2*\[Lambda][t]*(Yu[1, 1][t]^2 + 
         Yu[2, 2][t]^2 + Yu[3, 3][t]^2))/2 + 80*g3[t]^2*\[Lambda][t]*
       (Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2) - 
      72*\[Lambda][t]^2*(Yu[1, 1][t]^2 + Yu[2, 2][t]^2 + Yu[3, 3][t]^2) - 
      42*\[Lambda][t]*(Yd[1, 1][t]^2*Yu[1, 1][t]^2 + 
        Yd[2, 2][t]^2*Yu[2, 2][t]^2 + Yd[3, 3][t]^2*Yu[3, 3][t]^2) - 
      12*(Yd[1, 1][t]^4*Yu[1, 1][t]^2 + Yd[2, 2][t]^4*Yu[2, 2][t]^2 + 
        Yd[3, 3][t]^4*Yu[3, 3][t]^2) - 
      (16*g1[t]^2*(Yu[1, 1][t]^4 + Yu[2, 2][t]^4 + Yu[3, 3][t]^4))/5 - 
      64*g3[t]^2*(Yu[1, 1][t]^4 + Yu[2, 2][t]^4 + Yu[3, 3][t]^4) - 
      3*\[Lambda][t]*(Yu[1, 1][t]^4 + Yu[2, 2][t]^4 + Yu[3, 3][t]^4) - 
      12*(Yd[1, 1][t]^2*Yu[1, 1][t]^4 + Yd[2, 2][t]^2*Yu[2, 2][t]^4 + 
        Yd[3, 3][t]^2*Yu[3, 3][t]^4) + 60*(Yu[1, 1][t]^6 + Yu[2, 2][t]^6 + 
        Yu[3, 3][t]^6)))/(256*Pi^4)}


(* ###################### *)
(*  Function to run RGEs  *)
(* ###################### *)

Options[RunRGEs]={TwoLoop->True}; 
RunRGEs[input_,start_,finish_,opt___]:=RunRGEsFunc[input,start,finish,TwoLoop/.{opt}/.Options[RunRGEs]]; 
RunRGEsFunc[input_,start_,finish_,twoloop_]:=Block[{init}, 
If[twoloop=!=False,coeff2L=1;,coeff2L=0;]; 
init={}; 
For[i=1,i<=Length[AllParametersEx], 
init=Join[init,{AllParametersEx[[i]][start]==(AllParametersEx[[i]] /. input /. (AllParametersEx[[i]]->0))}]; 
i++;]; 
equations=Join[AllEquations/. inc2L->coeff2L /. Xi->0,init]; 
sol=NDSolve[equations,AllParametersEx,{t,start,finish}]; 
Return[sol]; 
]; 