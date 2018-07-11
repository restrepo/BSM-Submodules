{{{d[{i1, 1}], d[{i2, col2}]}, 
  ((g1^2 + 20*g3^2)*Xi*Kronecker[1, col2]*Kronecker[i1, i2])/15 + 
   MatMul[Yd, Adj[Yd]][i1, i2], 
  ((133*g1^2 + 765*g2^2 - 640*g3^2 - 540*trace[Yd, Adj[Yd]] - 
      180*trace[Ye, Adj[Ye]])*MatMul[Yd, Adj[Yd]][i1, i2] - 
    2*Kronecker[1, col2]*((25*g1^4 + 16*g1^2*g3^2 - 
        20*g3^4*(43 + 24*Xi + 3*Xi^2))*Kronecker[i1, i2] + 
      15*(MatMul[Yd, Adj[Yd], Yd, Adj[Yd]][i1, i2] + 
        MatMul[Yd, Adj[Yu], Yu, Adj[Yd]][i1, i2])))/120}, 
 {{e[{i1}], e[{i2}]}, (3*g1^2*Xi*Kronecker[i1, i2])/5 + 
   MatMul[Ye, Adj[Ye]][i1, i2], (-846*g1^4*Kronecker[i1, i2] - 
    5*(3*(11*g1^2 - 85*g2^2 + 60*trace[Yd, Adj[Yd]] + 20*trace[Ye, Adj[Ye]])*
       MatMul[Ye, Adj[Ye]][i1, i2] + 10*MatMul[Ye, Adj[Ye], Ye, Adj[Ye]][i1, 
        i2]))/200}, {{u[{i1, 1}], u[{i2, col2}]}, 
  (4*(g1^2 + 5*g3^2)*Xi*Kronecker[1, col2]*Kronecker[i1, i2])/15 + 
   MatMul[Yu, Adj[Yu]][i1, i2], 
  (5*(49*g1^2 + 765*g2^2 - 640*g3^2 - 540*trace[Yd, Adj[Yd]] - 
      180*trace[Ye, Adj[Ye]])*MatMul[Yu, Adj[Yu]][i1, i2] - 
    2*Kronecker[1, col2]*(4*(131*g1^4 + 80*g1^2*g3^2 - 
        25*g3^4*(43 + 24*Xi + 3*Xi^2))*Kronecker[i1, i2] + 
      75*(MatMul[Yu, Adj[Yd], Yd, Adj[Yu]][i1, i2] + 
        MatMul[Yu, Adj[Yu], Yu, Adj[Yu]][i1, i2])))/600}, 
 {{l[{1}][{i1}], l[{lef2}][{i2}]}, 
  (3*(g1^2 + 5*g2^2)*Xi*Kronecker[1, lef2]*Kronecker[i1, i2] + 
    10*MatMul[Tp[Ye], conj[Ye]][i1, i2])/20, 
  (-3*Kronecker[1, lef2]*((51*g1^4 + 18*g1^2*g2^2 - 
        5*g2^4*(41 + 32*Xi + 4*Xi^2))*Kronecker[i1, i2] - 
      8*(9*g1^2 + 45*g2^2 - 15*trace[Yd, Adj[Yd]] - 5*trace[Ye, Adj[Ye]])*
       MatMul[Tp[Ye], conj[Ye]][i1, i2]) - 
    2*(3*(11*g1^2 + 35*g2^2)*MatMul[Tp[Ye], conj[Ye]][i1, i2] + 
      20*MatMul[Tp[Ye], conj[Ye], Tp[Ye], conj[Ye]][i1, i2]))/160}, 
 {{q[{lef1}][{i1, 1}], q[{lef2}][{i2, col2}]}, 
  (Kronecker[lef1, lef2]*((g1^2 + 45*g2^2 + 80*g3^2)*Xi*Kronecker[1, col2]*
      Kronecker[i1, i2] + 30*(MatMul[Tp[Yd], conj[Yd]][i1, i2] + 
       (epsTensor[1, lef1]*epsTensor[1, lef2] + epsTensor[2, lef1]*
          epsTensor[2, lef2])*MatMul[Tp[Yu], conj[Yu]][i1, i2])))/60, 
  -(Kronecker[lef1, lef2]*
     (-10*((637*g1^2 + 2925*g2^2 - 640*g3^2 - 1080*trace[Yd, Adj[Yd]] - 
          360*trace[Ye, Adj[Ye]])*MatMul[Tp[Yd], conj[Yd]][i1, i2] + 
        (epsTensor[1, lef1]*(162*(g1^2 + 5*g2^2)*epsTensor[2, lef2] + 
            epsTensor[1, lef2]*(139*g1^2 + 495*g2^2 - 640*g3^2 - 
              540*trace[Yd, Adj[Yd]] - 180*trace[Ye, Adj[Ye]])) + 
          epsTensor[2, lef1]*(162*(g1^2 + 5*g2^2)*epsTensor[1, lef2] + 
            epsTensor[2, lef2]*(139*g1^2 + 495*g2^2 - 640*g3^2 - 
              540*trace[Yd, Adj[Yd]] - 180*trace[Ye, Adj[Ye]])))*
         MatMul[Tp[Yu], conj[Yu]][i1, i2]) + Kronecker[1, col2]*
       ((247*g1^4 + 10*g1^2*(9*g2^2 + 16*g3^2) - 
          25*(-288*g2^2*g3^2 + 32*g3^4*(43 + 24*Xi + 3*Xi^2) + 
            9*g2^4*(41 + 32*Xi + 4*Xi^2)))*Kronecker[i1, i2] + 
        600*(MatMul[Tp[Yd], conj[Yd], Tp[Yd], conj[Yd]][i1, i2] + 
          (epsTensor[1, lef1]*epsTensor[1, lef2] + epsTensor[2, lef1]*
             epsTensor[2, lef2])*MatMul[Tp[Yu], conj[Yu], Tp[Yu], conj[Yu]][
            i1, i2]))))/2400}}
