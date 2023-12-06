# General implementation of local Abelian models in SARAH
## Define the charges of SM particles
```mathematica
{Xq,Xl,Xd,Xu,Xe,XH,Xbi}={0,0,0,0,0,0,9};
```
## Define extra charges
Define extra charges for SM-singlet chiral fermions compatible with anomaly cancellation.

In the initial design, only anomaly free solutions parameterized with until 9 not repeated integers are implemented.
```mathematica
(* anomaly solution: {d,i,r,a,c,0,0,m,a,j,o,r,a,n,a} *)
{Xn,Xp,Xr,Xs,Xt,Xw,Xx,Xy,Xz}={-2,-7,1,8,4,5,0,0,0};
```
This needs to be implemented in the other section of the model file.

* The first pair `(Xn,Xp)` is reserved for `n` generations of Dirac fermions (`nDG`)
* `(Xr,Xs)` and `(Xt,Xw)` are single generation Dirac Fermions
* `Xx` is reserved for `n` generations of Weyk fermions (`nWG`)
* `Xz` is reserved for `n` generations of Majorana fermions (`nMG`)

## Conventions
* We have difinde the charged gauge mexing in terms of positive W's. Therefore the SM vev needs to be redefined in `parameters.pm`: `DependenceNum -> Sqrt[4*Mass[VWp]^2/(g2^2)],`


 





