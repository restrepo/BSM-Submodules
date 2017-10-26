# ----------------------------------------------------------------------  
# This model file was automatically created by SARAH version4.12.2 
# SARAH References: arXiv:0806.0538, arXiv:0909.2863, arXiv:1002.0840    
# (c) Florian Staub, 2011  
# ----------------------------------------------------------------------  
# File created at 22:58 on 25.10.2017   
# ----------------------------------------------------------------------  
 
 
from object_library import all_parameters,Parameter 
 
from function_library import complexconjugate,re,im,csc,sec,acsc,asec 
 
ZERO=Parameter(name='ZERO', 
                      nature='internal', 
                      type='real', 
                      value='0.0', 
                      texname='0') 
 
Md1 = 	 Parameter(name = 'Md1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0.0035, 
	 texname = '\\text{Md1}', 
	 lhablock = 'MASS', 
	 lhacode = [1]) 
 
Md2 = 	 Parameter(name = 'Md2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0.104, 
	 texname = '\\text{Md2}', 
	 lhablock = 'MASS', 
	 lhacode = [3]) 
 
Md3 = 	 Parameter(name = 'Md3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 4.2, 
	 texname = '\\text{Md3}', 
	 lhablock = 'MASS', 
	 lhacode = [5]) 
 
Mu1 = 	 Parameter(name = 'Mu1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0.0015, 
	 texname = '\\text{Mu1}', 
	 lhablock = 'MASS', 
	 lhacode = [2]) 
 
Mu2 = 	 Parameter(name = 'Mu2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 1.27, 
	 texname = '\\text{Mu2}', 
	 lhablock = 'MASS', 
	 lhacode = [4]) 
 
Mu3 = 	 Parameter(name = 'Mu3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 171.2, 
	 texname = '\\text{Mu3}', 
	 lhablock = 'MASS', 
	 lhacode = [6]) 
 
Wu3 = 	 Parameter(name = 'Wu3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 1.51, 
	 texname = '\\text{Wu3}', 
	 lhablock = 'DECAY', 
	 lhacode = [6]) 
 
Me1 = 	 Parameter(name = 'Me1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0.000511, 
	 texname = '\\text{Me1}', 
	 lhablock = 'MASS', 
	 lhacode = [11]) 
 
Me2 = 	 Parameter(name = 'Me2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0.105, 
	 texname = '\\text{Me2}', 
	 lhablock = 'MASS', 
	 lhacode = [13]) 
 
Me3 = 	 Parameter(name = 'Me3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 1.776, 
	 texname = '\\text{Me3}', 
	 lhablock = 'MASS', 
	 lhacode = [15]) 
 
MAh = 	 Parameter(name = 'MAh', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MAh}', 
	 lhablock = 'MASS', 
	 lhacode = [36]) 
 
WAh = 	 Parameter(name = 'WAh', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WAh}', 
	 lhablock = 'DECAY', 
	 lhacode = [36]) 
 
Mh1 = 	 Parameter(name = 'Mh1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mh1}', 
	 lhablock = 'MASS', 
	 lhacode = [25]) 
 
Wh1 = 	 Parameter(name = 'Wh1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wh1}', 
	 lhablock = 'DECAY', 
	 lhacode = [25]) 
 
Mh2 = 	 Parameter(name = 'Mh2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mh2}', 
	 lhablock = 'MASS', 
	 lhacode = [35]) 
 
Wh2 = 	 Parameter(name = 'Wh2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wh2}', 
	 lhablock = 'DECAY', 
	 lhacode = [35]) 
 
MHm2 = 	 Parameter(name = 'MHm2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MHm2}', 
	 lhablock = 'MASS', 
	 lhacode = [37]) 
 
WHm2 = 	 Parameter(name = 'WHm2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WHm2}', 
	 lhablock = 'DECAY', 
	 lhacode = [37]) 
 
MZ = 	 Parameter(name = 'MZ', 
	 nature = 'external', 
	 type = 'real', 
	 value = 91.1876, 
	 texname = '\\text{MZ}', 
	 lhablock = 'MASS', 
	 lhacode = [23]) 
 
WZ = 	 Parameter(name = 'WZ', 
	 nature = 'external', 
	 type = 'real', 
	 value = 2.4952, 
	 texname = '\\text{WZ}', 
	 lhablock = 'DECAY', 
	 lhacode = [23]) 
 
WWm = 	 Parameter(name = 'WWm', 
	 nature = 'external', 
	 type = 'real', 
	 value = 2.141, 
	 texname = '\\text{WWm}', 
	 lhablock = 'DECAY', 
	 lhacode = [24]) 
 
rYu11 = 	 Parameter(name='rYu11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu11}', 
	 lhablock = 'YU', 
	 lhacode = [1, 1] ) 
 
iYu11 = 	 Parameter(name='iYu11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu11}', 
	 lhablock = 'IMYU', 
	 lhacode = [1, 1] ) 
 
rYu12 = 	 Parameter(name='rYu12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu12}', 
	 lhablock = 'YU', 
	 lhacode = [1, 2] ) 
 
iYu12 = 	 Parameter(name='iYu12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu12}', 
	 lhablock = 'IMYU', 
	 lhacode = [1, 2] ) 
 
rYu13 = 	 Parameter(name='rYu13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu13}', 
	 lhablock = 'YU', 
	 lhacode = [1, 3] ) 
 
iYu13 = 	 Parameter(name='iYu13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu13}', 
	 lhablock = 'IMYU', 
	 lhacode = [1, 3] ) 
 
rYu21 = 	 Parameter(name='rYu21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu21}', 
	 lhablock = 'YU', 
	 lhacode = [2, 1] ) 
 
iYu21 = 	 Parameter(name='iYu21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu21}', 
	 lhablock = 'IMYU', 
	 lhacode = [2, 1] ) 
 
rYu22 = 	 Parameter(name='rYu22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu22}', 
	 lhablock = 'YU', 
	 lhacode = [2, 2] ) 
 
iYu22 = 	 Parameter(name='iYu22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu22}', 
	 lhablock = 'IMYU', 
	 lhacode = [2, 2] ) 
 
rYu23 = 	 Parameter(name='rYu23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu23}', 
	 lhablock = 'YU', 
	 lhacode = [2, 3] ) 
 
iYu23 = 	 Parameter(name='iYu23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu23}', 
	 lhablock = 'IMYU', 
	 lhacode = [2, 3] ) 
 
rYu31 = 	 Parameter(name='rYu31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu31}', 
	 lhablock = 'YU', 
	 lhacode = [3, 1] ) 
 
iYu31 = 	 Parameter(name='iYu31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu31}', 
	 lhablock = 'IMYU', 
	 lhacode = [3, 1] ) 
 
rYu32 = 	 Parameter(name='rYu32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu32}', 
	 lhablock = 'YU', 
	 lhacode = [3, 2] ) 
 
iYu32 = 	 Parameter(name='iYu32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu32}', 
	 lhablock = 'IMYU', 
	 lhacode = [3, 2] ) 
 
rYu33 = 	 Parameter(name='rYu33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu33}', 
	 lhablock = 'YU', 
	 lhacode = [3, 3] ) 
 
iYu33 = 	 Parameter(name='iYu33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu33}', 
	 lhablock = 'IMYU', 
	 lhacode = [3, 3] ) 
 
repYU11 = 	 Parameter(name='repYU11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYU11}', 
	 lhablock = 'EPSU', 
	 lhacode = [1, 1] ) 
 
iepYU11 = 	 Parameter(name='iepYU11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYU11}', 
	 lhablock = 'IMEPSU', 
	 lhacode = [1, 1] ) 
 
repYU12 = 	 Parameter(name='repYU12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYU12}', 
	 lhablock = 'EPSU', 
	 lhacode = [1, 2] ) 
 
iepYU12 = 	 Parameter(name='iepYU12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYU12}', 
	 lhablock = 'IMEPSU', 
	 lhacode = [1, 2] ) 
 
repYU13 = 	 Parameter(name='repYU13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYU13}', 
	 lhablock = 'EPSU', 
	 lhacode = [1, 3] ) 
 
iepYU13 = 	 Parameter(name='iepYU13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYU13}', 
	 lhablock = 'IMEPSU', 
	 lhacode = [1, 3] ) 
 
repYU21 = 	 Parameter(name='repYU21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYU21}', 
	 lhablock = 'EPSU', 
	 lhacode = [2, 1] ) 
 
iepYU21 = 	 Parameter(name='iepYU21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYU21}', 
	 lhablock = 'IMEPSU', 
	 lhacode = [2, 1] ) 
 
repYU22 = 	 Parameter(name='repYU22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYU22}', 
	 lhablock = 'EPSU', 
	 lhacode = [2, 2] ) 
 
iepYU22 = 	 Parameter(name='iepYU22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYU22}', 
	 lhablock = 'IMEPSU', 
	 lhacode = [2, 2] ) 
 
repYU23 = 	 Parameter(name='repYU23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYU23}', 
	 lhablock = 'EPSU', 
	 lhacode = [2, 3] ) 
 
iepYU23 = 	 Parameter(name='iepYU23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYU23}', 
	 lhablock = 'IMEPSU', 
	 lhacode = [2, 3] ) 
 
repYU31 = 	 Parameter(name='repYU31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYU31}', 
	 lhablock = 'EPSU', 
	 lhacode = [3, 1] ) 
 
iepYU31 = 	 Parameter(name='iepYU31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYU31}', 
	 lhablock = 'IMEPSU', 
	 lhacode = [3, 1] ) 
 
repYU32 = 	 Parameter(name='repYU32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYU32}', 
	 lhablock = 'EPSU', 
	 lhacode = [3, 2] ) 
 
iepYU32 = 	 Parameter(name='iepYU32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYU32}', 
	 lhablock = 'IMEPSU', 
	 lhacode = [3, 2] ) 
 
repYU33 = 	 Parameter(name='repYU33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYU33}', 
	 lhablock = 'EPSU', 
	 lhacode = [3, 3] ) 
 
iepYU33 = 	 Parameter(name='iepYU33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYU33}', 
	 lhablock = 'IMEPSU', 
	 lhacode = [3, 3] ) 
 
rYd11 = 	 Parameter(name='rYd11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd11}', 
	 lhablock = 'YD', 
	 lhacode = [1, 1] ) 
 
iYd11 = 	 Parameter(name='iYd11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd11}', 
	 lhablock = 'IMYD', 
	 lhacode = [1, 1] ) 
 
rYd12 = 	 Parameter(name='rYd12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd12}', 
	 lhablock = 'YD', 
	 lhacode = [1, 2] ) 
 
iYd12 = 	 Parameter(name='iYd12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd12}', 
	 lhablock = 'IMYD', 
	 lhacode = [1, 2] ) 
 
rYd13 = 	 Parameter(name='rYd13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd13}', 
	 lhablock = 'YD', 
	 lhacode = [1, 3] ) 
 
iYd13 = 	 Parameter(name='iYd13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd13}', 
	 lhablock = 'IMYD', 
	 lhacode = [1, 3] ) 
 
rYd21 = 	 Parameter(name='rYd21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd21}', 
	 lhablock = 'YD', 
	 lhacode = [2, 1] ) 
 
iYd21 = 	 Parameter(name='iYd21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd21}', 
	 lhablock = 'IMYD', 
	 lhacode = [2, 1] ) 
 
rYd22 = 	 Parameter(name='rYd22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd22}', 
	 lhablock = 'YD', 
	 lhacode = [2, 2] ) 
 
iYd22 = 	 Parameter(name='iYd22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd22}', 
	 lhablock = 'IMYD', 
	 lhacode = [2, 2] ) 
 
rYd23 = 	 Parameter(name='rYd23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd23}', 
	 lhablock = 'YD', 
	 lhacode = [2, 3] ) 
 
iYd23 = 	 Parameter(name='iYd23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd23}', 
	 lhablock = 'IMYD', 
	 lhacode = [2, 3] ) 
 
rYd31 = 	 Parameter(name='rYd31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd31}', 
	 lhablock = 'YD', 
	 lhacode = [3, 1] ) 
 
iYd31 = 	 Parameter(name='iYd31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd31}', 
	 lhablock = 'IMYD', 
	 lhacode = [3, 1] ) 
 
rYd32 = 	 Parameter(name='rYd32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd32}', 
	 lhablock = 'YD', 
	 lhacode = [3, 2] ) 
 
iYd32 = 	 Parameter(name='iYd32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd32}', 
	 lhablock = 'IMYD', 
	 lhacode = [3, 2] ) 
 
rYd33 = 	 Parameter(name='rYd33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd33}', 
	 lhablock = 'YD', 
	 lhacode = [3, 3] ) 
 
iYd33 = 	 Parameter(name='iYd33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd33}', 
	 lhablock = 'IMYD', 
	 lhacode = [3, 3] ) 
 
rYe11 = 	 Parameter(name='rYe11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye11}', 
	 lhablock = 'YE', 
	 lhacode = [1, 1] ) 
 
iYe11 = 	 Parameter(name='iYe11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye11}', 
	 lhablock = 'IMYE', 
	 lhacode = [1, 1] ) 
 
rYe12 = 	 Parameter(name='rYe12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye12}', 
	 lhablock = 'YE', 
	 lhacode = [1, 2] ) 
 
iYe12 = 	 Parameter(name='iYe12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye12}', 
	 lhablock = 'IMYE', 
	 lhacode = [1, 2] ) 
 
rYe13 = 	 Parameter(name='rYe13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye13}', 
	 lhablock = 'YE', 
	 lhacode = [1, 3] ) 
 
iYe13 = 	 Parameter(name='iYe13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye13}', 
	 lhablock = 'IMYE', 
	 lhacode = [1, 3] ) 
 
rYe21 = 	 Parameter(name='rYe21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye21}', 
	 lhablock = 'YE', 
	 lhacode = [2, 1] ) 
 
iYe21 = 	 Parameter(name='iYe21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye21}', 
	 lhablock = 'IMYE', 
	 lhacode = [2, 1] ) 
 
rYe22 = 	 Parameter(name='rYe22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye22}', 
	 lhablock = 'YE', 
	 lhacode = [2, 2] ) 
 
iYe22 = 	 Parameter(name='iYe22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye22}', 
	 lhablock = 'IMYE', 
	 lhacode = [2, 2] ) 
 
rYe23 = 	 Parameter(name='rYe23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye23}', 
	 lhablock = 'YE', 
	 lhacode = [2, 3] ) 
 
iYe23 = 	 Parameter(name='iYe23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye23}', 
	 lhablock = 'IMYE', 
	 lhacode = [2, 3] ) 
 
rYe31 = 	 Parameter(name='rYe31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye31}', 
	 lhablock = 'YE', 
	 lhacode = [3, 1] ) 
 
iYe31 = 	 Parameter(name='iYe31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye31}', 
	 lhablock = 'IMYE', 
	 lhacode = [3, 1] ) 
 
rYe32 = 	 Parameter(name='rYe32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye32}', 
	 lhablock = 'YE', 
	 lhacode = [3, 2] ) 
 
iYe32 = 	 Parameter(name='iYe32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye32}', 
	 lhablock = 'IMYE', 
	 lhacode = [3, 2] ) 
 
rYe33 = 	 Parameter(name='rYe33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye33}', 
	 lhablock = 'YE', 
	 lhacode = [3, 3] ) 
 
iYe33 = 	 Parameter(name='iYe33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye33}', 
	 lhablock = 'IMYE', 
	 lhacode = [3, 3] ) 
 
repYD11 = 	 Parameter(name='repYD11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYD11}', 
	 lhablock = 'EPSD', 
	 lhacode = [1, 1] ) 
 
iepYD11 = 	 Parameter(name='iepYD11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYD11}', 
	 lhablock = 'IMEPSD', 
	 lhacode = [1, 1] ) 
 
repYD12 = 	 Parameter(name='repYD12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYD12}', 
	 lhablock = 'EPSD', 
	 lhacode = [1, 2] ) 
 
iepYD12 = 	 Parameter(name='iepYD12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYD12}', 
	 lhablock = 'IMEPSD', 
	 lhacode = [1, 2] ) 
 
repYD13 = 	 Parameter(name='repYD13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYD13}', 
	 lhablock = 'EPSD', 
	 lhacode = [1, 3] ) 
 
iepYD13 = 	 Parameter(name='iepYD13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYD13}', 
	 lhablock = 'IMEPSD', 
	 lhacode = [1, 3] ) 
 
repYD21 = 	 Parameter(name='repYD21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYD21}', 
	 lhablock = 'EPSD', 
	 lhacode = [2, 1] ) 
 
iepYD21 = 	 Parameter(name='iepYD21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYD21}', 
	 lhablock = 'IMEPSD', 
	 lhacode = [2, 1] ) 
 
repYD22 = 	 Parameter(name='repYD22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYD22}', 
	 lhablock = 'EPSD', 
	 lhacode = [2, 2] ) 
 
iepYD22 = 	 Parameter(name='iepYD22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYD22}', 
	 lhablock = 'IMEPSD', 
	 lhacode = [2, 2] ) 
 
repYD23 = 	 Parameter(name='repYD23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYD23}', 
	 lhablock = 'EPSD', 
	 lhacode = [2, 3] ) 
 
iepYD23 = 	 Parameter(name='iepYD23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYD23}', 
	 lhablock = 'IMEPSD', 
	 lhacode = [2, 3] ) 
 
repYD31 = 	 Parameter(name='repYD31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYD31}', 
	 lhablock = 'EPSD', 
	 lhacode = [3, 1] ) 
 
iepYD31 = 	 Parameter(name='iepYD31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYD31}', 
	 lhablock = 'IMEPSD', 
	 lhacode = [3, 1] ) 
 
repYD32 = 	 Parameter(name='repYD32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYD32}', 
	 lhablock = 'EPSD', 
	 lhacode = [3, 2] ) 
 
iepYD32 = 	 Parameter(name='iepYD32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYD32}', 
	 lhablock = 'IMEPSD', 
	 lhacode = [3, 2] ) 
 
repYD33 = 	 Parameter(name='repYD33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYD33}', 
	 lhablock = 'EPSD', 
	 lhacode = [3, 3] ) 
 
iepYD33 = 	 Parameter(name='iepYD33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYD33}', 
	 lhablock = 'IMEPSD', 
	 lhacode = [3, 3] ) 
 
repYE11 = 	 Parameter(name='repYE11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYE11}', 
	 lhablock = 'EPSE', 
	 lhacode = [1, 1] ) 
 
iepYE11 = 	 Parameter(name='iepYE11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYE11}', 
	 lhablock = 'IMEPSE', 
	 lhacode = [1, 1] ) 
 
repYE12 = 	 Parameter(name='repYE12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYE12}', 
	 lhablock = 'EPSE', 
	 lhacode = [1, 2] ) 
 
iepYE12 = 	 Parameter(name='iepYE12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYE12}', 
	 lhablock = 'IMEPSE', 
	 lhacode = [1, 2] ) 
 
repYE13 = 	 Parameter(name='repYE13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYE13}', 
	 lhablock = 'EPSE', 
	 lhacode = [1, 3] ) 
 
iepYE13 = 	 Parameter(name='iepYE13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYE13}', 
	 lhablock = 'IMEPSE', 
	 lhacode = [1, 3] ) 
 
repYE21 = 	 Parameter(name='repYE21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYE21}', 
	 lhablock = 'EPSE', 
	 lhacode = [2, 1] ) 
 
iepYE21 = 	 Parameter(name='iepYE21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYE21}', 
	 lhablock = 'IMEPSE', 
	 lhacode = [2, 1] ) 
 
repYE22 = 	 Parameter(name='repYE22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYE22}', 
	 lhablock = 'EPSE', 
	 lhacode = [2, 2] ) 
 
iepYE22 = 	 Parameter(name='iepYE22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYE22}', 
	 lhablock = 'IMEPSE', 
	 lhacode = [2, 2] ) 
 
repYE23 = 	 Parameter(name='repYE23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYE23}', 
	 lhablock = 'EPSE', 
	 lhacode = [2, 3] ) 
 
iepYE23 = 	 Parameter(name='iepYE23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYE23}', 
	 lhablock = 'IMEPSE', 
	 lhacode = [2, 3] ) 
 
repYE31 = 	 Parameter(name='repYE31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYE31}', 
	 lhablock = 'EPSE', 
	 lhacode = [3, 1] ) 
 
iepYE31 = 	 Parameter(name='iepYE31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYE31}', 
	 lhablock = 'IMEPSE', 
	 lhacode = [3, 1] ) 
 
repYE32 = 	 Parameter(name='repYE32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYE32}', 
	 lhablock = 'EPSE', 
	 lhacode = [3, 2] ) 
 
iepYE32 = 	 Parameter(name='iepYE32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYE32}', 
	 lhablock = 'IMEPSE', 
	 lhacode = [3, 2] ) 
 
repYE33 = 	 Parameter(name='repYE33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYE33}', 
	 lhablock = 'EPSE', 
	 lhacode = [3, 3] ) 
 
iepYE33 = 	 Parameter(name='iepYE33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{epYE33}', 
	 lhablock = 'IMEPSE', 
	 lhacode = [3, 3] ) 
 
rLam6 = 	 Parameter(name='rLam6', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Lam6}', 
	 lhablock = 'HMIX', 
	 lhacode = [36] ) 
 
iLam6 = 	 Parameter(name='iLam6', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Lam6}', 
	 lhablock = 'IMHMIX', 
	 lhacode = [36] ) 
 
rLam5 = 	 Parameter(name='rLam5', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Lam5}', 
	 lhablock = 'HMIX', 
	 lhacode = [35] ) 
 
iLam5 = 	 Parameter(name='iLam5', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Lam5}', 
	 lhablock = 'IMHMIX', 
	 lhacode = [35] ) 
 
rLam7 = 	 Parameter(name='rLam7', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Lam7}', 
	 lhablock = 'HMIX', 
	 lhacode = [37] ) 
 
iLam7 = 	 Parameter(name='iLam7', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Lam7}', 
	 lhablock = 'IMHMIX', 
	 lhacode = [37] ) 
 
rLam1 = 	 Parameter(name='rLam1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Lam1}', 
	 lhablock = 'HMIX', 
	 lhacode = [31] ) 
 
iLam1 = 	 Parameter(name='iLam1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Lam1}', 
	 lhablock = 'IMHMIX', 
	 lhacode = [31] ) 
 
rLam4 = 	 Parameter(name='rLam4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Lam4}', 
	 lhablock = 'HMIX', 
	 lhacode = [34] ) 
 
iLam4 = 	 Parameter(name='iLam4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Lam4}', 
	 lhablock = 'IMHMIX', 
	 lhacode = [34] ) 
 
rLam3 = 	 Parameter(name='rLam3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Lam3}', 
	 lhablock = 'HMIX', 
	 lhacode = [33] ) 
 
iLam3 = 	 Parameter(name='iLam3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Lam3}', 
	 lhablock = 'IMHMIX', 
	 lhacode = [33] ) 
 
rLam2 = 	 Parameter(name='rLam2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Lam2}', 
	 lhablock = 'HMIX', 
	 lhacode = [32] ) 
 
iLam2 = 	 Parameter(name='iLam2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Lam2}', 
	 lhablock = 'IMHMIX', 
	 lhacode = [32] ) 
 
ZP11 = 	 Parameter(name='ZP11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZP11}', 
	 lhablock = 'CHARGEMIX', 
	 lhacode = [1, 1] ) 
 
ZP12 = 	 Parameter(name='ZP12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZP12}', 
	 lhablock = 'CHARGEMIX', 
	 lhacode = [1, 2] ) 
 
ZP21 = 	 Parameter(name='ZP21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZP21}', 
	 lhablock = 'CHARGEMIX', 
	 lhacode = [2, 1] ) 
 
ZP22 = 	 Parameter(name='ZP22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZP22}', 
	 lhablock = 'CHARGEMIX', 
	 lhacode = [2, 2] ) 
 
rZDL11 = 	 Parameter(name='rZDL11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL11}', 
	 lhablock = 'UDLMIX', 
	 lhacode = [1, 1] ) 
 
iZDL11 = 	 Parameter(name='iZDL11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL11}', 
	 lhablock = 'IMUDLMIX', 
	 lhacode = [1, 1] ) 
 
rZDL12 = 	 Parameter(name='rZDL12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL12}', 
	 lhablock = 'UDLMIX', 
	 lhacode = [1, 2] ) 
 
iZDL12 = 	 Parameter(name='iZDL12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL12}', 
	 lhablock = 'IMUDLMIX', 
	 lhacode = [1, 2] ) 
 
rZDL13 = 	 Parameter(name='rZDL13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL13}', 
	 lhablock = 'UDLMIX', 
	 lhacode = [1, 3] ) 
 
iZDL13 = 	 Parameter(name='iZDL13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL13}', 
	 lhablock = 'IMUDLMIX', 
	 lhacode = [1, 3] ) 
 
rZDL21 = 	 Parameter(name='rZDL21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL21}', 
	 lhablock = 'UDLMIX', 
	 lhacode = [2, 1] ) 
 
iZDL21 = 	 Parameter(name='iZDL21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL21}', 
	 lhablock = 'IMUDLMIX', 
	 lhacode = [2, 1] ) 
 
rZDL22 = 	 Parameter(name='rZDL22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL22}', 
	 lhablock = 'UDLMIX', 
	 lhacode = [2, 2] ) 
 
iZDL22 = 	 Parameter(name='iZDL22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL22}', 
	 lhablock = 'IMUDLMIX', 
	 lhacode = [2, 2] ) 
 
rZDL23 = 	 Parameter(name='rZDL23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL23}', 
	 lhablock = 'UDLMIX', 
	 lhacode = [2, 3] ) 
 
iZDL23 = 	 Parameter(name='iZDL23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL23}', 
	 lhablock = 'IMUDLMIX', 
	 lhacode = [2, 3] ) 
 
rZDL31 = 	 Parameter(name='rZDL31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL31}', 
	 lhablock = 'UDLMIX', 
	 lhacode = [3, 1] ) 
 
iZDL31 = 	 Parameter(name='iZDL31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL31}', 
	 lhablock = 'IMUDLMIX', 
	 lhacode = [3, 1] ) 
 
rZDL32 = 	 Parameter(name='rZDL32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL32}', 
	 lhablock = 'UDLMIX', 
	 lhacode = [3, 2] ) 
 
iZDL32 = 	 Parameter(name='iZDL32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL32}', 
	 lhablock = 'IMUDLMIX', 
	 lhacode = [3, 2] ) 
 
rZDL33 = 	 Parameter(name='rZDL33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL33}', 
	 lhablock = 'UDLMIX', 
	 lhacode = [3, 3] ) 
 
iZDL33 = 	 Parameter(name='iZDL33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL33}', 
	 lhablock = 'IMUDLMIX', 
	 lhacode = [3, 3] ) 
 
rZDR11 = 	 Parameter(name='rZDR11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR11}', 
	 lhablock = 'UDRMIX', 
	 lhacode = [1, 1] ) 
 
iZDR11 = 	 Parameter(name='iZDR11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR11}', 
	 lhablock = 'IMUDRMIX', 
	 lhacode = [1, 1] ) 
 
rZDR12 = 	 Parameter(name='rZDR12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR12}', 
	 lhablock = 'UDRMIX', 
	 lhacode = [1, 2] ) 
 
iZDR12 = 	 Parameter(name='iZDR12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR12}', 
	 lhablock = 'IMUDRMIX', 
	 lhacode = [1, 2] ) 
 
rZDR13 = 	 Parameter(name='rZDR13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR13}', 
	 lhablock = 'UDRMIX', 
	 lhacode = [1, 3] ) 
 
iZDR13 = 	 Parameter(name='iZDR13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR13}', 
	 lhablock = 'IMUDRMIX', 
	 lhacode = [1, 3] ) 
 
rZDR21 = 	 Parameter(name='rZDR21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR21}', 
	 lhablock = 'UDRMIX', 
	 lhacode = [2, 1] ) 
 
iZDR21 = 	 Parameter(name='iZDR21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR21}', 
	 lhablock = 'IMUDRMIX', 
	 lhacode = [2, 1] ) 
 
rZDR22 = 	 Parameter(name='rZDR22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR22}', 
	 lhablock = 'UDRMIX', 
	 lhacode = [2, 2] ) 
 
iZDR22 = 	 Parameter(name='iZDR22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR22}', 
	 lhablock = 'IMUDRMIX', 
	 lhacode = [2, 2] ) 
 
rZDR23 = 	 Parameter(name='rZDR23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR23}', 
	 lhablock = 'UDRMIX', 
	 lhacode = [2, 3] ) 
 
iZDR23 = 	 Parameter(name='iZDR23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR23}', 
	 lhablock = 'IMUDRMIX', 
	 lhacode = [2, 3] ) 
 
rZDR31 = 	 Parameter(name='rZDR31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR31}', 
	 lhablock = 'UDRMIX', 
	 lhacode = [3, 1] ) 
 
iZDR31 = 	 Parameter(name='iZDR31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR31}', 
	 lhablock = 'IMUDRMIX', 
	 lhacode = [3, 1] ) 
 
rZDR32 = 	 Parameter(name='rZDR32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR32}', 
	 lhablock = 'UDRMIX', 
	 lhacode = [3, 2] ) 
 
iZDR32 = 	 Parameter(name='iZDR32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR32}', 
	 lhablock = 'IMUDRMIX', 
	 lhacode = [3, 2] ) 
 
rZDR33 = 	 Parameter(name='rZDR33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR33}', 
	 lhablock = 'UDRMIX', 
	 lhacode = [3, 3] ) 
 
iZDR33 = 	 Parameter(name='iZDR33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR33}', 
	 lhablock = 'IMUDRMIX', 
	 lhacode = [3, 3] ) 
 
rZUL11 = 	 Parameter(name='rZUL11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL11}', 
	 lhablock = 'UULMIX', 
	 lhacode = [1, 1] ) 
 
iZUL11 = 	 Parameter(name='iZUL11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL11}', 
	 lhablock = 'IMUULMIX', 
	 lhacode = [1, 1] ) 
 
rZUL12 = 	 Parameter(name='rZUL12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL12}', 
	 lhablock = 'UULMIX', 
	 lhacode = [1, 2] ) 
 
iZUL12 = 	 Parameter(name='iZUL12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL12}', 
	 lhablock = 'IMUULMIX', 
	 lhacode = [1, 2] ) 
 
rZUL13 = 	 Parameter(name='rZUL13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL13}', 
	 lhablock = 'UULMIX', 
	 lhacode = [1, 3] ) 
 
iZUL13 = 	 Parameter(name='iZUL13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL13}', 
	 lhablock = 'IMUULMIX', 
	 lhacode = [1, 3] ) 
 
rZUL21 = 	 Parameter(name='rZUL21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL21}', 
	 lhablock = 'UULMIX', 
	 lhacode = [2, 1] ) 
 
iZUL21 = 	 Parameter(name='iZUL21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL21}', 
	 lhablock = 'IMUULMIX', 
	 lhacode = [2, 1] ) 
 
rZUL22 = 	 Parameter(name='rZUL22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL22}', 
	 lhablock = 'UULMIX', 
	 lhacode = [2, 2] ) 
 
iZUL22 = 	 Parameter(name='iZUL22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL22}', 
	 lhablock = 'IMUULMIX', 
	 lhacode = [2, 2] ) 
 
rZUL23 = 	 Parameter(name='rZUL23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL23}', 
	 lhablock = 'UULMIX', 
	 lhacode = [2, 3] ) 
 
iZUL23 = 	 Parameter(name='iZUL23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL23}', 
	 lhablock = 'IMUULMIX', 
	 lhacode = [2, 3] ) 
 
rZUL31 = 	 Parameter(name='rZUL31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL31}', 
	 lhablock = 'UULMIX', 
	 lhacode = [3, 1] ) 
 
iZUL31 = 	 Parameter(name='iZUL31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL31}', 
	 lhablock = 'IMUULMIX', 
	 lhacode = [3, 1] ) 
 
rZUL32 = 	 Parameter(name='rZUL32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL32}', 
	 lhablock = 'UULMIX', 
	 lhacode = [3, 2] ) 
 
iZUL32 = 	 Parameter(name='iZUL32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL32}', 
	 lhablock = 'IMUULMIX', 
	 lhacode = [3, 2] ) 
 
rZUL33 = 	 Parameter(name='rZUL33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL33}', 
	 lhablock = 'UULMIX', 
	 lhacode = [3, 3] ) 
 
iZUL33 = 	 Parameter(name='iZUL33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL33}', 
	 lhablock = 'IMUULMIX', 
	 lhacode = [3, 3] ) 
 
rZUR11 = 	 Parameter(name='rZUR11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR11}', 
	 lhablock = 'UURMIX', 
	 lhacode = [1, 1] ) 
 
iZUR11 = 	 Parameter(name='iZUR11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR11}', 
	 lhablock = 'IMUURMIX', 
	 lhacode = [1, 1] ) 
 
rZUR12 = 	 Parameter(name='rZUR12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR12}', 
	 lhablock = 'UURMIX', 
	 lhacode = [1, 2] ) 
 
iZUR12 = 	 Parameter(name='iZUR12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR12}', 
	 lhablock = 'IMUURMIX', 
	 lhacode = [1, 2] ) 
 
rZUR13 = 	 Parameter(name='rZUR13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR13}', 
	 lhablock = 'UURMIX', 
	 lhacode = [1, 3] ) 
 
iZUR13 = 	 Parameter(name='iZUR13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR13}', 
	 lhablock = 'IMUURMIX', 
	 lhacode = [1, 3] ) 
 
rZUR21 = 	 Parameter(name='rZUR21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR21}', 
	 lhablock = 'UURMIX', 
	 lhacode = [2, 1] ) 
 
iZUR21 = 	 Parameter(name='iZUR21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR21}', 
	 lhablock = 'IMUURMIX', 
	 lhacode = [2, 1] ) 
 
rZUR22 = 	 Parameter(name='rZUR22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR22}', 
	 lhablock = 'UURMIX', 
	 lhacode = [2, 2] ) 
 
iZUR22 = 	 Parameter(name='iZUR22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR22}', 
	 lhablock = 'IMUURMIX', 
	 lhacode = [2, 2] ) 
 
rZUR23 = 	 Parameter(name='rZUR23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR23}', 
	 lhablock = 'UURMIX', 
	 lhacode = [2, 3] ) 
 
iZUR23 = 	 Parameter(name='iZUR23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR23}', 
	 lhablock = 'IMUURMIX', 
	 lhacode = [2, 3] ) 
 
rZUR31 = 	 Parameter(name='rZUR31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR31}', 
	 lhablock = 'UURMIX', 
	 lhacode = [3, 1] ) 
 
iZUR31 = 	 Parameter(name='iZUR31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR31}', 
	 lhablock = 'IMUURMIX', 
	 lhacode = [3, 1] ) 
 
rZUR32 = 	 Parameter(name='rZUR32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR32}', 
	 lhablock = 'UURMIX', 
	 lhacode = [3, 2] ) 
 
iZUR32 = 	 Parameter(name='iZUR32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR32}', 
	 lhablock = 'IMUURMIX', 
	 lhacode = [3, 2] ) 
 
rZUR33 = 	 Parameter(name='rZUR33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR33}', 
	 lhablock = 'UURMIX', 
	 lhacode = [3, 3] ) 
 
iZUR33 = 	 Parameter(name='iZUR33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR33}', 
	 lhablock = 'IMUURMIX', 
	 lhacode = [3, 3] ) 
 
rZEL11 = 	 Parameter(name='rZEL11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL11}', 
	 lhablock = 'UELMIX', 
	 lhacode = [1, 1] ) 
 
iZEL11 = 	 Parameter(name='iZEL11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL11}', 
	 lhablock = 'IMUELMIX', 
	 lhacode = [1, 1] ) 
 
rZEL12 = 	 Parameter(name='rZEL12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL12}', 
	 lhablock = 'UELMIX', 
	 lhacode = [1, 2] ) 
 
iZEL12 = 	 Parameter(name='iZEL12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL12}', 
	 lhablock = 'IMUELMIX', 
	 lhacode = [1, 2] ) 
 
rZEL13 = 	 Parameter(name='rZEL13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL13}', 
	 lhablock = 'UELMIX', 
	 lhacode = [1, 3] ) 
 
iZEL13 = 	 Parameter(name='iZEL13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL13}', 
	 lhablock = 'IMUELMIX', 
	 lhacode = [1, 3] ) 
 
rZEL21 = 	 Parameter(name='rZEL21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL21}', 
	 lhablock = 'UELMIX', 
	 lhacode = [2, 1] ) 
 
iZEL21 = 	 Parameter(name='iZEL21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL21}', 
	 lhablock = 'IMUELMIX', 
	 lhacode = [2, 1] ) 
 
rZEL22 = 	 Parameter(name='rZEL22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL22}', 
	 lhablock = 'UELMIX', 
	 lhacode = [2, 2] ) 
 
iZEL22 = 	 Parameter(name='iZEL22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL22}', 
	 lhablock = 'IMUELMIX', 
	 lhacode = [2, 2] ) 
 
rZEL23 = 	 Parameter(name='rZEL23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL23}', 
	 lhablock = 'UELMIX', 
	 lhacode = [2, 3] ) 
 
iZEL23 = 	 Parameter(name='iZEL23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL23}', 
	 lhablock = 'IMUELMIX', 
	 lhacode = [2, 3] ) 
 
rZEL31 = 	 Parameter(name='rZEL31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL31}', 
	 lhablock = 'UELMIX', 
	 lhacode = [3, 1] ) 
 
iZEL31 = 	 Parameter(name='iZEL31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL31}', 
	 lhablock = 'IMUELMIX', 
	 lhacode = [3, 1] ) 
 
rZEL32 = 	 Parameter(name='rZEL32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL32}', 
	 lhablock = 'UELMIX', 
	 lhacode = [3, 2] ) 
 
iZEL32 = 	 Parameter(name='iZEL32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL32}', 
	 lhablock = 'IMUELMIX', 
	 lhacode = [3, 2] ) 
 
rZEL33 = 	 Parameter(name='rZEL33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL33}', 
	 lhablock = 'UELMIX', 
	 lhacode = [3, 3] ) 
 
iZEL33 = 	 Parameter(name='iZEL33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL33}', 
	 lhablock = 'IMUELMIX', 
	 lhacode = [3, 3] ) 
 
rZER11 = 	 Parameter(name='rZER11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER11}', 
	 lhablock = 'UERMIX', 
	 lhacode = [1, 1] ) 
 
iZER11 = 	 Parameter(name='iZER11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER11}', 
	 lhablock = 'IMUERMIX', 
	 lhacode = [1, 1] ) 
 
rZER12 = 	 Parameter(name='rZER12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER12}', 
	 lhablock = 'UERMIX', 
	 lhacode = [1, 2] ) 
 
iZER12 = 	 Parameter(name='iZER12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER12}', 
	 lhablock = 'IMUERMIX', 
	 lhacode = [1, 2] ) 
 
rZER13 = 	 Parameter(name='rZER13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER13}', 
	 lhablock = 'UERMIX', 
	 lhacode = [1, 3] ) 
 
iZER13 = 	 Parameter(name='iZER13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER13}', 
	 lhablock = 'IMUERMIX', 
	 lhacode = [1, 3] ) 
 
rZER21 = 	 Parameter(name='rZER21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER21}', 
	 lhablock = 'UERMIX', 
	 lhacode = [2, 1] ) 
 
iZER21 = 	 Parameter(name='iZER21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER21}', 
	 lhablock = 'IMUERMIX', 
	 lhacode = [2, 1] ) 
 
rZER22 = 	 Parameter(name='rZER22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER22}', 
	 lhablock = 'UERMIX', 
	 lhacode = [2, 2] ) 
 
iZER22 = 	 Parameter(name='iZER22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER22}', 
	 lhablock = 'IMUERMIX', 
	 lhacode = [2, 2] ) 
 
rZER23 = 	 Parameter(name='rZER23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER23}', 
	 lhablock = 'UERMIX', 
	 lhacode = [2, 3] ) 
 
iZER23 = 	 Parameter(name='iZER23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER23}', 
	 lhablock = 'IMUERMIX', 
	 lhacode = [2, 3] ) 
 
rZER31 = 	 Parameter(name='rZER31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER31}', 
	 lhablock = 'UERMIX', 
	 lhacode = [3, 1] ) 
 
iZER31 = 	 Parameter(name='iZER31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER31}', 
	 lhablock = 'IMUERMIX', 
	 lhacode = [3, 1] ) 
 
rZER32 = 	 Parameter(name='rZER32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER32}', 
	 lhablock = 'UERMIX', 
	 lhacode = [3, 2] ) 
 
iZER32 = 	 Parameter(name='iZER32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER32}', 
	 lhablock = 'IMUERMIX', 
	 lhacode = [3, 2] ) 
 
rZER33 = 	 Parameter(name='rZER33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER33}', 
	 lhablock = 'UERMIX', 
	 lhacode = [3, 3] ) 
 
iZER33 = 	 Parameter(name='iZER33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER33}', 
	 lhablock = 'IMUERMIX', 
	 lhacode = [3, 3] ) 
 
alphaH = 	 Parameter(name='alphaH', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{alphaH}', 
	 lhablock = 'HMIX', 
	 lhacode = [11] ) 
 
aS = 	 Parameter(name='aS', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0.119, 
	 texname = '\\text{aS}', 
	 lhablock = 'SMINPUTS', 
	 lhacode = [3] ) 
 
aEWM1 = 	 Parameter(name='aEWM1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 137.035999679, 
	 texname = '\\text{aEWM1}', 
	 lhablock = 'SMINPUTS', 
	 lhacode = [1] ) 
 
Gf = 	 Parameter(name='Gf', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0.0000116639, 
	 texname = '\\text{Gf}', 
	 lhablock = 'SMINPUTS', 
	 lhacode = [2] ) 
 
Yu11 = 	 Parameter(name='Yu11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYu11 + complex(0,1)*iYu11', 
	 texname = '\\text{Yu11}' ) 
 
Yu12 = 	 Parameter(name='Yu12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYu12 + complex(0,1)*iYu12', 
	 texname = '\\text{Yu12}' ) 
 
Yu13 = 	 Parameter(name='Yu13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYu13 + complex(0,1)*iYu13', 
	 texname = '\\text{Yu13}' ) 
 
Yu21 = 	 Parameter(name='Yu21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYu21 + complex(0,1)*iYu21', 
	 texname = '\\text{Yu21}' ) 
 
Yu22 = 	 Parameter(name='Yu22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYu22 + complex(0,1)*iYu22', 
	 texname = '\\text{Yu22}' ) 
 
Yu23 = 	 Parameter(name='Yu23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYu23 + complex(0,1)*iYu23', 
	 texname = '\\text{Yu23}' ) 
 
Yu31 = 	 Parameter(name='Yu31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYu31 + complex(0,1)*iYu31', 
	 texname = '\\text{Yu31}' ) 
 
Yu32 = 	 Parameter(name='Yu32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYu32 + complex(0,1)*iYu32', 
	 texname = '\\text{Yu32}' ) 
 
Yu33 = 	 Parameter(name='Yu33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYu33 + complex(0,1)*iYu33', 
	 texname = '\\text{Yu33}' ) 
 
epYU11 = 	 Parameter(name='epYU11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'repYU11 + complex(0,1)*iepYU11', 
	 texname = '\\text{epYU11}' ) 
 
epYU12 = 	 Parameter(name='epYU12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'repYU12 + complex(0,1)*iepYU12', 
	 texname = '\\text{epYU12}' ) 
 
epYU13 = 	 Parameter(name='epYU13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'repYU13 + complex(0,1)*iepYU13', 
	 texname = '\\text{epYU13}' ) 
 
epYU21 = 	 Parameter(name='epYU21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'repYU21 + complex(0,1)*iepYU21', 
	 texname = '\\text{epYU21}' ) 
 
epYU22 = 	 Parameter(name='epYU22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'repYU22 + complex(0,1)*iepYU22', 
	 texname = '\\text{epYU22}' ) 
 
epYU23 = 	 Parameter(name='epYU23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'repYU23 + complex(0,1)*iepYU23', 
	 texname = '\\text{epYU23}' ) 
 
epYU31 = 	 Parameter(name='epYU31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'repYU31 + complex(0,1)*iepYU31', 
	 texname = '\\text{epYU31}' ) 
 
epYU32 = 	 Parameter(name='epYU32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'repYU32 + complex(0,1)*iepYU32', 
	 texname = '\\text{epYU32}' ) 
 
epYU33 = 	 Parameter(name='epYU33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'repYU33 + complex(0,1)*iepYU33', 
	 texname = '\\text{epYU33}' ) 
 
Yd11 = 	 Parameter(name='Yd11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYd11 + complex(0,1)*iYd11', 
	 texname = '\\text{Yd11}' ) 
 
Yd12 = 	 Parameter(name='Yd12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYd12 + complex(0,1)*iYd12', 
	 texname = '\\text{Yd12}' ) 
 
Yd13 = 	 Parameter(name='Yd13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYd13 + complex(0,1)*iYd13', 
	 texname = '\\text{Yd13}' ) 
 
Yd21 = 	 Parameter(name='Yd21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYd21 + complex(0,1)*iYd21', 
	 texname = '\\text{Yd21}' ) 
 
Yd22 = 	 Parameter(name='Yd22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYd22 + complex(0,1)*iYd22', 
	 texname = '\\text{Yd22}' ) 
 
Yd23 = 	 Parameter(name='Yd23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYd23 + complex(0,1)*iYd23', 
	 texname = '\\text{Yd23}' ) 
 
Yd31 = 	 Parameter(name='Yd31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYd31 + complex(0,1)*iYd31', 
	 texname = '\\text{Yd31}' ) 
 
Yd32 = 	 Parameter(name='Yd32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYd32 + complex(0,1)*iYd32', 
	 texname = '\\text{Yd32}' ) 
 
Yd33 = 	 Parameter(name='Yd33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYd33 + complex(0,1)*iYd33', 
	 texname = '\\text{Yd33}' ) 
 
Ye11 = 	 Parameter(name='Ye11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYe11 + complex(0,1)*iYe11', 
	 texname = '\\text{Ye11}' ) 
 
Ye12 = 	 Parameter(name='Ye12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYe12 + complex(0,1)*iYe12', 
	 texname = '\\text{Ye12}' ) 
 
Ye13 = 	 Parameter(name='Ye13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYe13 + complex(0,1)*iYe13', 
	 texname = '\\text{Ye13}' ) 
 
Ye21 = 	 Parameter(name='Ye21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYe21 + complex(0,1)*iYe21', 
	 texname = '\\text{Ye21}' ) 
 
Ye22 = 	 Parameter(name='Ye22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYe22 + complex(0,1)*iYe22', 
	 texname = '\\text{Ye22}' ) 
 
Ye23 = 	 Parameter(name='Ye23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYe23 + complex(0,1)*iYe23', 
	 texname = '\\text{Ye23}' ) 
 
Ye31 = 	 Parameter(name='Ye31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYe31 + complex(0,1)*iYe31', 
	 texname = '\\text{Ye31}' ) 
 
Ye32 = 	 Parameter(name='Ye32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYe32 + complex(0,1)*iYe32', 
	 texname = '\\text{Ye32}' ) 
 
Ye33 = 	 Parameter(name='Ye33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYe33 + complex(0,1)*iYe33', 
	 texname = '\\text{Ye33}' ) 
 
epYD11 = 	 Parameter(name='epYD11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'repYD11 + complex(0,1)*iepYD11', 
	 texname = '\\text{epYD11}' ) 
 
epYD12 = 	 Parameter(name='epYD12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'repYD12 + complex(0,1)*iepYD12', 
	 texname = '\\text{epYD12}' ) 
 
epYD13 = 	 Parameter(name='epYD13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'repYD13 + complex(0,1)*iepYD13', 
	 texname = '\\text{epYD13}' ) 
 
epYD21 = 	 Parameter(name='epYD21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'repYD21 + complex(0,1)*iepYD21', 
	 texname = '\\text{epYD21}' ) 
 
epYD22 = 	 Parameter(name='epYD22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'repYD22 + complex(0,1)*iepYD22', 
	 texname = '\\text{epYD22}' ) 
 
epYD23 = 	 Parameter(name='epYD23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'repYD23 + complex(0,1)*iepYD23', 
	 texname = '\\text{epYD23}' ) 
 
epYD31 = 	 Parameter(name='epYD31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'repYD31 + complex(0,1)*iepYD31', 
	 texname = '\\text{epYD31}' ) 
 
epYD32 = 	 Parameter(name='epYD32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'repYD32 + complex(0,1)*iepYD32', 
	 texname = '\\text{epYD32}' ) 
 
epYD33 = 	 Parameter(name='epYD33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'repYD33 + complex(0,1)*iepYD33', 
	 texname = '\\text{epYD33}' ) 
 
epYE11 = 	 Parameter(name='epYE11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'repYE11 + complex(0,1)*iepYE11', 
	 texname = '\\text{epYE11}' ) 
 
epYE12 = 	 Parameter(name='epYE12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'repYE12 + complex(0,1)*iepYE12', 
	 texname = '\\text{epYE12}' ) 
 
epYE13 = 	 Parameter(name='epYE13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'repYE13 + complex(0,1)*iepYE13', 
	 texname = '\\text{epYE13}' ) 
 
epYE21 = 	 Parameter(name='epYE21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'repYE21 + complex(0,1)*iepYE21', 
	 texname = '\\text{epYE21}' ) 
 
epYE22 = 	 Parameter(name='epYE22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'repYE22 + complex(0,1)*iepYE22', 
	 texname = '\\text{epYE22}' ) 
 
epYE23 = 	 Parameter(name='epYE23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'repYE23 + complex(0,1)*iepYE23', 
	 texname = '\\text{epYE23}' ) 
 
epYE31 = 	 Parameter(name='epYE31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'repYE31 + complex(0,1)*iepYE31', 
	 texname = '\\text{epYE31}' ) 
 
epYE32 = 	 Parameter(name='epYE32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'repYE32 + complex(0,1)*iepYE32', 
	 texname = '\\text{epYE32}' ) 
 
epYE33 = 	 Parameter(name='epYE33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'repYE33 + complex(0,1)*iepYE33', 
	 texname = '\\text{epYE33}' ) 
 
Lam6 = 	 Parameter(name='Lam6', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rLam6 + complex(0,1)*iLam6', 
	 texname = '\\text{Lam6}' ) 
 
Lam5 = 	 Parameter(name='Lam5', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rLam5 + complex(0,1)*iLam5', 
	 texname = '\\text{Lam5}' ) 
 
Lam7 = 	 Parameter(name='Lam7', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rLam7 + complex(0,1)*iLam7', 
	 texname = '\\text{Lam7}' ) 
 
Lam1 = 	 Parameter(name='Lam1', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rLam1 + complex(0,1)*iLam1', 
	 texname = '\\text{Lam1}' ) 
 
Lam4 = 	 Parameter(name='Lam4', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rLam4 + complex(0,1)*iLam4', 
	 texname = '\\text{Lam4}' ) 
 
Lam3 = 	 Parameter(name='Lam3', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rLam3 + complex(0,1)*iLam3', 
	 texname = '\\text{Lam3}' ) 
 
Lam2 = 	 Parameter(name='Lam2', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rLam2 + complex(0,1)*iLam2', 
	 texname = '\\text{Lam2}' ) 
 
ZDL11 = 	 Parameter(name='ZDL11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDL11 + complex(0,1)*iZDL11', 
	 texname = '\\text{ZDL11}' ) 
 
ZDL12 = 	 Parameter(name='ZDL12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDL12 + complex(0,1)*iZDL12', 
	 texname = '\\text{ZDL12}' ) 
 
ZDL13 = 	 Parameter(name='ZDL13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDL13 + complex(0,1)*iZDL13', 
	 texname = '\\text{ZDL13}' ) 
 
ZDL21 = 	 Parameter(name='ZDL21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDL21 + complex(0,1)*iZDL21', 
	 texname = '\\text{ZDL21}' ) 
 
ZDL22 = 	 Parameter(name='ZDL22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDL22 + complex(0,1)*iZDL22', 
	 texname = '\\text{ZDL22}' ) 
 
ZDL23 = 	 Parameter(name='ZDL23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDL23 + complex(0,1)*iZDL23', 
	 texname = '\\text{ZDL23}' ) 
 
ZDL31 = 	 Parameter(name='ZDL31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDL31 + complex(0,1)*iZDL31', 
	 texname = '\\text{ZDL31}' ) 
 
ZDL32 = 	 Parameter(name='ZDL32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDL32 + complex(0,1)*iZDL32', 
	 texname = '\\text{ZDL32}' ) 
 
ZDL33 = 	 Parameter(name='ZDL33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDL33 + complex(0,1)*iZDL33', 
	 texname = '\\text{ZDL33}' ) 
 
ZDR11 = 	 Parameter(name='ZDR11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDR11 + complex(0,1)*iZDR11', 
	 texname = '\\text{ZDR11}' ) 
 
ZDR12 = 	 Parameter(name='ZDR12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDR12 + complex(0,1)*iZDR12', 
	 texname = '\\text{ZDR12}' ) 
 
ZDR13 = 	 Parameter(name='ZDR13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDR13 + complex(0,1)*iZDR13', 
	 texname = '\\text{ZDR13}' ) 
 
ZDR21 = 	 Parameter(name='ZDR21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDR21 + complex(0,1)*iZDR21', 
	 texname = '\\text{ZDR21}' ) 
 
ZDR22 = 	 Parameter(name='ZDR22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDR22 + complex(0,1)*iZDR22', 
	 texname = '\\text{ZDR22}' ) 
 
ZDR23 = 	 Parameter(name='ZDR23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDR23 + complex(0,1)*iZDR23', 
	 texname = '\\text{ZDR23}' ) 
 
ZDR31 = 	 Parameter(name='ZDR31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDR31 + complex(0,1)*iZDR31', 
	 texname = '\\text{ZDR31}' ) 
 
ZDR32 = 	 Parameter(name='ZDR32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDR32 + complex(0,1)*iZDR32', 
	 texname = '\\text{ZDR32}' ) 
 
ZDR33 = 	 Parameter(name='ZDR33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDR33 + complex(0,1)*iZDR33', 
	 texname = '\\text{ZDR33}' ) 
 
ZUL11 = 	 Parameter(name='ZUL11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUL11 + complex(0,1)*iZUL11', 
	 texname = '\\text{ZUL11}' ) 
 
ZUL12 = 	 Parameter(name='ZUL12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUL12 + complex(0,1)*iZUL12', 
	 texname = '\\text{ZUL12}' ) 
 
ZUL13 = 	 Parameter(name='ZUL13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUL13 + complex(0,1)*iZUL13', 
	 texname = '\\text{ZUL13}' ) 
 
ZUL21 = 	 Parameter(name='ZUL21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUL21 + complex(0,1)*iZUL21', 
	 texname = '\\text{ZUL21}' ) 
 
ZUL22 = 	 Parameter(name='ZUL22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUL22 + complex(0,1)*iZUL22', 
	 texname = '\\text{ZUL22}' ) 
 
ZUL23 = 	 Parameter(name='ZUL23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUL23 + complex(0,1)*iZUL23', 
	 texname = '\\text{ZUL23}' ) 
 
ZUL31 = 	 Parameter(name='ZUL31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUL31 + complex(0,1)*iZUL31', 
	 texname = '\\text{ZUL31}' ) 
 
ZUL32 = 	 Parameter(name='ZUL32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUL32 + complex(0,1)*iZUL32', 
	 texname = '\\text{ZUL32}' ) 
 
ZUL33 = 	 Parameter(name='ZUL33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUL33 + complex(0,1)*iZUL33', 
	 texname = '\\text{ZUL33}' ) 
 
ZUR11 = 	 Parameter(name='ZUR11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUR11 + complex(0,1)*iZUR11', 
	 texname = '\\text{ZUR11}' ) 
 
ZUR12 = 	 Parameter(name='ZUR12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUR12 + complex(0,1)*iZUR12', 
	 texname = '\\text{ZUR12}' ) 
 
ZUR13 = 	 Parameter(name='ZUR13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUR13 + complex(0,1)*iZUR13', 
	 texname = '\\text{ZUR13}' ) 
 
ZUR21 = 	 Parameter(name='ZUR21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUR21 + complex(0,1)*iZUR21', 
	 texname = '\\text{ZUR21}' ) 
 
ZUR22 = 	 Parameter(name='ZUR22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUR22 + complex(0,1)*iZUR22', 
	 texname = '\\text{ZUR22}' ) 
 
ZUR23 = 	 Parameter(name='ZUR23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUR23 + complex(0,1)*iZUR23', 
	 texname = '\\text{ZUR23}' ) 
 
ZUR31 = 	 Parameter(name='ZUR31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUR31 + complex(0,1)*iZUR31', 
	 texname = '\\text{ZUR31}' ) 
 
ZUR32 = 	 Parameter(name='ZUR32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUR32 + complex(0,1)*iZUR32', 
	 texname = '\\text{ZUR32}' ) 
 
ZUR33 = 	 Parameter(name='ZUR33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUR33 + complex(0,1)*iZUR33', 
	 texname = '\\text{ZUR33}' ) 
 
ZEL11 = 	 Parameter(name='ZEL11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZEL11 + complex(0,1)*iZEL11', 
	 texname = '\\text{ZEL11}' ) 
 
ZEL12 = 	 Parameter(name='ZEL12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZEL12 + complex(0,1)*iZEL12', 
	 texname = '\\text{ZEL12}' ) 
 
ZEL13 = 	 Parameter(name='ZEL13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZEL13 + complex(0,1)*iZEL13', 
	 texname = '\\text{ZEL13}' ) 
 
ZEL21 = 	 Parameter(name='ZEL21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZEL21 + complex(0,1)*iZEL21', 
	 texname = '\\text{ZEL21}' ) 
 
ZEL22 = 	 Parameter(name='ZEL22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZEL22 + complex(0,1)*iZEL22', 
	 texname = '\\text{ZEL22}' ) 
 
ZEL23 = 	 Parameter(name='ZEL23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZEL23 + complex(0,1)*iZEL23', 
	 texname = '\\text{ZEL23}' ) 
 
ZEL31 = 	 Parameter(name='ZEL31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZEL31 + complex(0,1)*iZEL31', 
	 texname = '\\text{ZEL31}' ) 
 
ZEL32 = 	 Parameter(name='ZEL32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZEL32 + complex(0,1)*iZEL32', 
	 texname = '\\text{ZEL32}' ) 
 
ZEL33 = 	 Parameter(name='ZEL33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZEL33 + complex(0,1)*iZEL33', 
	 texname = '\\text{ZEL33}' ) 
 
ZER11 = 	 Parameter(name='ZER11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZER11 + complex(0,1)*iZER11', 
	 texname = '\\text{ZER11}' ) 
 
ZER12 = 	 Parameter(name='ZER12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZER12 + complex(0,1)*iZER12', 
	 texname = '\\text{ZER12}' ) 
 
ZER13 = 	 Parameter(name='ZER13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZER13 + complex(0,1)*iZER13', 
	 texname = '\\text{ZER13}' ) 
 
ZER21 = 	 Parameter(name='ZER21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZER21 + complex(0,1)*iZER21', 
	 texname = '\\text{ZER21}' ) 
 
ZER22 = 	 Parameter(name='ZER22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZER22 + complex(0,1)*iZER22', 
	 texname = '\\text{ZER22}' ) 
 
ZER23 = 	 Parameter(name='ZER23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZER23 + complex(0,1)*iZER23', 
	 texname = '\\text{ZER23}' ) 
 
ZER31 = 	 Parameter(name='ZER31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZER31 + complex(0,1)*iZER31', 
	 texname = '\\text{ZER31}' ) 
 
ZER32 = 	 Parameter(name='ZER32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZER32 + complex(0,1)*iZER32', 
	 texname = '\\text{ZER32}' ) 
 
ZER33 = 	 Parameter(name='ZER33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZER33 + complex(0,1)*iZER33', 
	 texname = '\\text{ZER33}' ) 
 
G = 	 Parameter(name='G', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '2*cmath.sqrt(aS)*cmath.sqrt(cmath.pi)', 
	 texname = 'G') 
 
v2 = 	 Parameter(name='v2', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '1.*(0)', 
	 texname = 'v2') 
 
ZH11 = 	 Parameter(name='ZH11', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '-cmath.sin(alphaH)', 
	 texname = 'ZH11') 
 
ZH12 = 	 Parameter(name='ZH12', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'cmath.cos(alphaH)', 
	 texname = 'ZH12') 
 
ZH21 = 	 Parameter(name='ZH21', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'cmath.cos(alphaH)', 
	 texname = 'ZH21') 
 
ZH22 = 	 Parameter(name='ZH22', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'cmath.sin(alphaH)', 
	 texname = 'ZH22') 
 
el = 	 Parameter(name='el', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '2*cmath.sqrt(1/aEWM1)*cmath.sqrt(cmath.pi)', 
	 texname = 'el') 
 
MWm = 	 Parameter(name='MWm', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'cmath.sqrt(MZ**2/2. + cmath.sqrt(MZ**4/4. - (MZ**2*cmath.pi)/(cmath.sqrt(2)*aEWM1*Gf)))', 
	 texname = 'MWm') 
 
TW = 	 Parameter(name='TW', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'cmath.asin(cmath.sqrt(1 - MWm**2/MZ**2))', 
	 texname = 'TW') 
 
g1 = 	 Parameter(name='g1', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'el*1./cmath.cos(TW)', 
	 texname = 'g1') 
 
g2 = 	 Parameter(name='g2', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'el*1./cmath.sin(TW)', 
	 texname = 'g2') 
 
v = 	 Parameter(name='v', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '2*cmath.sqrt(MWm**2/g2**2)', 
	 texname = 'v') 
 
RXiWm = 	 Parameter(name='RXiWm', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '1.', 
	 texname = 'RXiWm') 
 
RXiZ = 	 Parameter(name='RXiZ', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '1.', 
	 texname = 'RXiZ') 
 
HPP1 = 	 Parameter(name='HPP1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{HPP1}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [25,22,22] ) 
 
HGG1 = 	 Parameter(name='HGG1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{HGG1}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [25,21,21] ) 
 
HPP2 = 	 Parameter(name='HPP2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{HPP2}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [35,22,22] ) 
 
HGG2 = 	 Parameter(name='HGG2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{HGG2}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [35,21,21] ) 
 
