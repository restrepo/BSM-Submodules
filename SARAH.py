import pandas as pd
import json
import re
import sys
import copy
import cmdlike as cmd
from collections import OrderedDict
import numpy as np

def fC(p):
    p['Field']=p['Field']+'C'
    return p

def get_particles(fdotm,Fields,NAME,KEY,particles,particlessons):
    '''
    Extract particles from  SARAH Model files by using the information
    from: 
    * Fields: list of lists
    * NAME[KEY] dictionary 
    '''
    #i=1
    #Field=Fields[i]
    for Field in Fields:
        for f in cmd.grep(Field,fdotm).split('\n'):
            particle={}
            if not re.search('^\s*\(\*',f):
                #Fix components fields
                ff=f.split('{')
                if len(ff) ==3:
                    fff=ff[2].split('}')
                    f=ff[0]+'{'+ff[1]+fff[0].replace(',','::')+''.join(fff[1:])+'};'
                g=re.search('%s\[\[[0-9]+\]\]\s*=\s*\{(.*)\s*\}\s*;\s*' 
                    %Field,f)

                if g:
                    try:
                        fp=g.groups()[0].split(',')
                    except 'KeyError':
                        fp=[]
                    if len(fp)>0:
                        particle['Field']=fp[0].strip()
                        particle['Parents']=None
                        particle['Properties']={}
                    if Field=='Gauge' and len(fp)>=5:
                        particle['Field']='V'+particle['Field']
                        particle['Properties']['Group']=fp[1]
                        particle['Definition']='GaugeES'
                        particle['Properties']['Index']=fp[2]
                        particle['Properties']['Coupling']=fp[3]
                        particle['Properties']['SSB']=fp[3]
                        particle['Properties']['Lorentz']='Vector'
                    else: 
                        if len(fp)>=6:
                            particle['Properties']['NF']=fp[1].strip()
                            particle['Properties']['Groups']=[ 
                                x.strip().replace(';','') for x in fp[3:]]
                            particle['Definition']='WeylFermionAndIndermediate'
                            if Field=='FermionFields':
                                particle['Properties']['Lorentz']='WeylFermion'
                            elif Field=='ScalarFields':
                                particle['Properties']['Lorentz']='Scalar'
                            sons=re.sub('conj\[(\w+)\]',r'\1', fp[2] ).split('::')
                            if len(sons)>1:
                                particle['Properties']['multiplet']=[s.strip() for s in sons]

                            for s in sons:
                                particleson={}
                                particleson['Properties']={}
                                particleson['Field']=s.strip()
                                if Field=='FermionFields':
                                    particleson['Definition']='WeylFermionAndIndermediate'
                                    particleson['Properties']['Lorentz']='WeylFermion'
                                elif Field=='ScalarFields':
                                    particleson['Definition']='GaugeES'
                                    particleson['Properties']['Lorentz']='Scalar'
                                particleson['Parents']=particle['Field']
                                particleson['Properties']['NF']=particle['Properties']['NF']
                                particlessons=particlessons+[particleson]

                    particles.append(particle)
    particles=particles+particlessons
    return particles

def sarahlist_to_python(strl,only_extract=False,DEBUG=False):
    '''
    Convert a string with a SARAH list of rotations into
    a Python object
    '''
    if only_extract:
        return strl
    #General transformations
    nl=re.sub(';\s*$','', #Drop final semicolon
               strl)
    if ( re.search('^\s*\t*\{.*\{.*\{.*->True',strl ) or 
       re.search('^\s*\t*\{.*\{.*\{.*->False',strl ) ):
        nl=re.sub( '([\w]+)([,:])',r'"\1"\2', # Keep True and False
              re.sub( '[\s\t]+','', # strip
              re.sub( '\s*->\s*',':', # to python dict                  
                  nl))).replace('}},{','}],['
                      ).replace('{{','[['
                      ).replace('}}}','}]]'
                      )        
    elif nl.find('->')>-1:
        nl=re.sub( '(\w+\[*\w+\]*)',r'"\1"' ,
           re.sub('\s*:\s*\{([\s\w,\[\]]+)\}',r':[\1 ]', # to python value lists of dict key
           re.sub( '\s*->\s*',':', # to python dict                  
              nl)))
    else:
        nl= re.sub( '\{','[',
            re.sub( '\}',']',                   
            re.sub('([\w\[\]\/\\\]+)',r'"\1"',  #to python_lists
           nl)))
    if DEBUG:    
        print(nl)
        print("*"*50)
    return eval(nl)

def extract_code_block(fdotm,pattern,pattern_start,pattern_end,only_extract=False):
    dsbd={}
    start=False
    startlist=False
    fields=''
    dsbt=''
    for f in fdotm.split('\n'):
        dsb=re.search(pattern,f)
        if dsb:
            #Capture EWSB DEFINITION 
            dsbt=dsb.groups()[0]
            start=True

        if start and f.find(pattern_start)>-1:
            startlist=True

        if startlist:
            fields=fields+f
        if re.search(pattern_end,f):
            start=False
            startlist=False
            if fields:
                srl=sarahlist_to_python(fields.split('=')[-1],only_extract)
                dsbd.update( {dsbt:srl} )
                
                fields=''
    return dsbd

def parse_mathematica_list_of_list(fdotm,NAME='DEFINITION',KEY='EWSB'):
    '''
    Parse mathematica list with the structure:
    
      NAME[KEY][KEYS]={
                             LIST
                             };
    
    and generate a dictionary with KEYS
    '''
    pattern='%s\[%s\]\[(\w+)\]' %(NAME,KEY)
    pattern_start='{'
    pattern_end='\}\s*;'
    only_extract=False
    dsbd=extract_code_block(fdotm,pattern,pattern_start,pattern_end,only_extract)
    return dsbd

def bidiagonal(w,k='MatterSector'):
    weyl={}
    weyl['left_intr'  ]=w[0][0] #list
    weyl['right_intr' ]=w[0][1] #list
    weyl['left_mass' ]=w[1][0][0] 
    weyl['left_rota'  ]=w[1][0][1]
    weyl['right_mass']=w[1][1][0]
    weyl['right_rota' ]=w[1][1][1]
    if k=='MatterSector':
        weyl['lorentz' ]='WeylFermion'
        #If Diagonal then Scalar or Majorana
    return weyl

def diagonal(s,k='GaugeSector'):
    symm={}
    symm['intr']=s[0]
    symm['mass']=s[1]
    symm['rota']=s[2]
    if k=='GaugeSector':
        symm['Lorentz']='Vector'
    return symm    

def get_vev(v,k='VEVs'):        
    Vev={}
    Vev['Complex']=v[0]
    Vev['vev']=v[1][0]
    Vev['Imaginary']=v[2][0]
    Vev['Real']=v[3][0]
    Vev['vev_coeff']=v[1][1]
    Vev['Imaginary_coeff']=v[2][1]
    Vev['Real_coeff']=v[3][1]
    Vev['Lorentz']='Scalar'
    return Vev

def order_dict_by(d,element='Description'):
    l=list(d.keys())
    od=d
    if element in l:
        l.remove(element)
        l=[element]+l
        od=OrderedDict()
        for k in l:
            od[k]=d[k]
    return od

def to_math(SM,file,definitions='ParticleDefinitions',
               not_str    =['DependenceNum','Dependence'],
               list_or_str=['OutputName','Mass','Goldstone']):
    '''
    Write mathematica file from `SM` dictionary for either
     * particle.m:  definitions='ParticleDefinitions'
     * parameter.m: definitions='ParameterDefinitions'
    
    `not_str` is the list of keys to be printed without double quotes quotes
    `list_or_str` is the list of keys which may be either a string or a list of strings
    
    INPUT FORMAT in json (json.dumps(dict))
    {"PROPERTY1": {"PARAMETER1": {"KEY1":"STR_VALUE"},
                                {"KEY2": PYTHON_LIST},
                  "PARAMETER2": ...},
     "PROPERTY2":...           }
    
    If PROPERTY=Properties, it is ignored in the output file.
    '''
    f=open(file,'w')
    for c in SM.columns:
        if definitions=='ParticleDefinitions':
            f.write('{}[{}] = {{\n'.format(definitions,c))
        else:
            f.write('{} = {{\n'.format(definitions))

        cindex=SM[c].dropna().index
        csep=','
        for p in cindex:
            SMcp=order_dict_by(SM[c][p],element='Description')
            if p==list(cindex)[-1]:
                csep=''
            f.write('    {{{}, {{'.format(p))
            cpkeys=SMcp.keys()
            sangria=' '
            sep=','
            nl='\n'
            #TODO: Be sure that Description will be printed first
            for k in cpkeys:
                if k!=list(cpkeys)[0]:
                    sangria='           '
                if k==list(cpkeys)[-1]:
                    sep=''
                    nl=''
                #print list of strings with double quotes
                cp='{}{} -> '.format(sangria,k)
                smcpk=SMcp[k]
                if k in not_str:
                    smcpk='{}'.format(smcpk)
                elif type(smcpk)==str and smcpk.find('[')==-1:
                    #Special cases
                    if k not in list_or_str:
                        smcpk='"{}"'.format(smcpk)
                    else:
                        smcpk='{}'.format(smcpk)                    
                else:
                    if smcpk:
                        smcpk=json.dumps( smcpk ).replace('[','{').replace(']','}')

                f.write('{}{}{}{}'.format(cp,smcpk,sep,nl))

            f.write('}}}}{}\n'.format(csep))
        f.write('};\n\n')
    f.close()
    f=open(file,'r')
    return f.read()
    f.close()
    
#Particle definitions
def rotations_to_particles(rotations,key='EWSB',lr='',sep='',DEBUG=False):
    if not lr and not sep:
        typekey='Diagonal'
    elif lr=='left' and sep=='_':
        typekey='Bidiagonal'
    elif lr=='right' and sep=='_':
        typekey='Bidiagonal'
    else:
        print('WARNING: Not yet implemented')
    newparticles=[]
    for k in rotations[key].keys():
        for bd in rotations['EWSB'][k]:
            if k==typekey:
                interaction='{}{}intr'.format(lr,sep)
                if type(bd.get(interaction))==list:
                    if DEBUG: print(bd)
                    for i in  range(len(bd.get(interaction))):
                        if type( bd.get('{}{}mass'.format(lr,sep) ) )==list:
                            fm=bd.get('{}{}mass'.format(lr,sep))[i]
                        else:
                            fm=bd.get('{}{}mass'.format(lr,sep))
                        f=re.sub('\s*\]\s*','',re.sub('conj\s*\[\s*','',
                                                    fm))
                        if f not in [ d.get('Field') for d in newparticles if type(d)==dict]:
                            #left particle
                            particle={'Properties':{}}
                            particle['Field']   =f
                            particle['Parents'] =bd.get(interaction)[i]
                            particle['rotation']=bd.get('{}{}rota'.format(lr,sep))
                            particle['Properties']['Mass_basis']=bd.get('{}{}mass'.format(lr,sep))
                            particle['Properties']['Interaction_basis']=bd.get(interaction)
                            particle['Block']='MatterField'
                            if lr:
                                particle['Definition']='WeylFermionAndIndermediate'
                                particle['Properties']['Chirality']=lr
                                particle['Properties']['Lorentz']='WeylFermion'
                            if bd.get('Lorentz')=='Vector':
                                particle['Definition']='EWSB'
                                particle['Block']='GaugeSector'
                                particle['Properties']['Lorentz']='Vector'
                            else:
                                if not lr:
                                    print('CODE for Scalar or Fermion here')
                            newparticles.append(particle)
                            #print('*'*50)
                            #print(particle)
                            #print('*'*50)
                            if DEBUG: print(i,bd.get('{}{}mass'.format(lr,sep)),particle)
                else:
                    print('No list in mass basis for diagonal particle, please check:',k,p)
    return newparticles

def vev_to_particles(d,cp="Real"):
    if cp!='Real' and cp!='Imaginary':
        return "Error: undefined CP"
    particle={'Properties':{}}
    particle['Field']     =d.get(cp)
    particle['Parents']   =d.get('Complex')
    particle['Definition']='EWSB'
    particle['Block']='VEVs'
    particle['Properties']['Lorentz']='Scalar'
    particle['Properties']['vev']=d.get('vev')
    particle['Properties']['CP']=cp
    particle['Properties']['Coefficient']=d.get('{}_coeff'.format(cp))
    return particle

def spinor_to_particles(dict_of_spinors,rotations,f):
    particle={'Properties':{}}
    particle['Field']=f
    particle['Definition']='EWSB'
    particle['Block']='DiracSpinors'
    particle['Properties']['Lorentz']='DiracSpinor'
    if type(dict_of_spinors[f])==list:
        particle['Parents']=dict_of_spinors[f][0]
        Majorana=False
        if 0 in dict_of_spinors[f]:
            Majorana=True
        elif dict_of_spinors[f][1].find(  
             dict_of_spinors[f][0])>-1:
            Majorana=True
        if not Majorana:
            particle['Properties']['DiracSpinor']=dict_of_spinors[f]
        else:
            particle['Properties']['Lorentz']='MajoranaSpinor'
            particle['Properties']['MajoranaSpinor']=rotations['EWSB']['DiracSpinors'][f]
    
    return particle



def sorted_equality(l1,l2):
    return sorted(l1)==sorted(l2)

#TODO: Incluede Input Yukawas
def get_input_parameters_IN(sci,suffix='IN'):
    sciIN=[]
    BLS=[]
    for p in sci:
        rp=re.search('(\w+)',p)
        if rp:
            sciIN.append( rp.groups()[0]+suffix )

    if len(sci)==len(sciIN):
        return sciIN
    else:
        sys.exit('ERROR: Input parameter mismatch {}!={}'.format(sci,sciIN))
        
def get_BoundaryLowScaleInput(sci,sciIN):
    BLS=[]
    for i in range(len(sci)):
        BLS.append([sci[i],sciIN[i]])
    return BLS
def get_MINPAR(sciIN):
    MP=[]
    for i in range(len(sciIN)):
        MP.append([i+1,sciIN[i]])
    return MP


def get_decay_particles(DecayParticles   = ['Fu', 'Fe', 'Fd', 'hh'],
                    DecayParticles3B = ['Fu', 'Fe', 'Fd']):
    LDecayParticles3B=[]
    for p in DecayParticles3B:
        LDecayParticles3B.append( [p,'"{}.f90"'.format(p)])
    return DecayParticles,LDecayParticles3B


def to_math_list( l ):
    import re
    sl=str(l).replace('[','{' ).replace(
                      ']','}'     ).replace(
                       "'",""   ).replace(
                       r'\\','\\')
    sl=re.sub(r'\\{(\w+)}',r'\\[\1]',sl)
    return sl

def to_SPheno(SP,file,dictentries=['DefaultInputValues']):
    '''dicentries:  dictionaries to be printed directly'''
    f=open(file,'w')
    for i in SP.index:
        if type(SP.loc[i,'Properties'])==bool:
            f.write('{} = {};\n\n'.format(i,SP.loc[i,'Properties']))
        elif type(SP.loc[i,'Properties'])==list:
            ll=to_math_list(SP.loc[i,'Properties'])
            if i=='RenConditionsDecays':
                ll=re.sub('([A-Z]\w+)\{\s*(\w+)\s*\}',r'\1[\2]',ll)
            f.write('{} = {};\n\n'.format(i,ll ))
        elif type(SP.loc[i,'Properties'])==dict:
            d=SP.loc[i,'Properties']
            if i in dictentries:
                dfv='{} = {{'.format(i)
                for k in d.keys():
                    dfv=dfv+'{} -> {}'.format(k,0.27) 
                dfv=dfv+'};\n\n'
                f.write(dfv)
            else:
                for k in d.keys():
                    if k  in ['MatchingConditions']:
                        f.write('{}[{}]={};\n\n'.format(i,k,to_math_list( SP.loc[i,'Properties'][k] )    
                              ))
    f.close()
    
def to_defintions(dpp,symbol='Field'):
    dppc=copy.deepcopy(dpp)
    PPDefinitions={}
    for k  in list(set( [d.get('Definition') for d in dppc] )):
        if k==None:
            PPDefinitions.update({'Properties':{}})
            [d.update({'Definition':'Properties'}) for d in dppc]
        else:
            PPDefinitions.update({k:{}})
            
    for d in dppc:
        #print(d.get(symbol))
        PPDefinitions[d.get('Definition')].update(
                                          {d.get(symbol): {}}
                                                       )
        if d.get('Description'):
            PPDefinitions[d.get('Definition')][d.get(symbol)].update(
                   {'Description':d.get('Description')})
        ud=d.get('Properties').get('update_Description')
        if ud:
            PPDefinitions[d.get('Definition')][d.get(symbol)].update(
                  ud )
    return PPDefinitions    


def get_hypercharge(field,particles):
    if not isinstance(particles,Particles):
        sys.exit('ERROR: secong argument must be a Particles object')
        
    try: 
        Y=particles.loc[field
                       ][0].get('Properties').get('Groups'
                                   )[0]
    except KeyError:
        Y=None
    return Y
def get_Lorentz(field,particles):
    if not isinstance(particles,Particles):
        sys.exit('ERROR: secong argument must be a Particles object')

    try: 
        Y=particles.loc[field
                       ][0].get('Properties').get('Lorentz')
    except KeyError:
        Y=None
    return Y

def get_diagonal_basis(vev,p,particles):
    try:
        pp=particles.apply_filter(lambda d:d.get('Parents')==p)[0].get('Field')
        DF=particles.apply_filter(lambda d:d.get('Parents')==pp)[0].get('Field')
    except:
        DF=''
    if vev and DF:
        db=r'''Sqrt[2]/%s* {{Mass[%s,1],0,0 },
                {0, Mass[%s,2],0},
                {0, 0, Mass[%s,3]}}''' %(vev,DF,DF,DF)
    else:
        db=''
    return db

def get_multiplet(WF,particles):
    '''WF: Weyl Fermion'''
    mltp=particles.apply_filter(lambda d: d.get('Parents')==WF)
    if mltp.size()==2:
        chiral='Left'
    elif mltp.size()==1:
        chiral='Right'
    else:
        chiral=None
    j=0
    multiplet={}
    for p in mltp.get('Field'):
        multiplet[p]={}
        j=j+1
        multiplet[p]['chiral']=chiral
        if chiral=='Left':
            multiplet[p]['dim']='doublet'
            if j==1:
                multiplet[p]['pos']='Up'
            elif j==2:
                multiplet[p]['pos']='Down'
            else:
                multiplet[p]['pos']=None
        else:
            multiplet[p]['dim']='singlet'
    return multiplet

def get_H0(H,particles):
    "H is string"
    Hs=particles.apply_filter(lambda d:d.get('Parents')==H)
    #Get doublet components
    if Hs.size()==2:
        # extract neutral component
        Hs=particles.apply_filter(lambda d:d.get('Parents')==H)
        H0s=Hs.apply_filter(  lambda d: d.get('Properties').get('ElectricCharge')==0  )
        if H0s.get('Properties')[0]:
            return H0s
        else:
            return Particles([])
        
def get_hh(H0,particles):
    "H0 is a dataframe"
    hh=particles.apply_filter(lambda d: d.get('Parents')==H0.get('Field')[0])
    if hh.get('Properties'):
        return hh.apply_filter(lambda d: d.get('Properties').get('CP')=='Real')
    else:
        return Particles([])
    
def get_higgs_vev(H,particles):
    '''
    Get the vev associated to the Yukawa coupling
    in `smdict` with Description `k`
    '''
    if H:
        H0=get_H0(H,particles)
        hh=get_hh(H0,particles)
        if hh.get('Properties'):
            v=hh.get('Properties').get('vev')[0]
    else:
        v=''
    return v    

#Move to SARAH
def get_EWSB(model,NAME='DEFINITION',KEY='EWSB'):
    dsbd=parse_mathematica_list_of_list(model,NAME='DEFINITION',KEY='EWSB')
    DEFINITION={}
    DEFINITION['EWSB']={}
    Bidiagonal=[]
    Diagonal=[]
    VEV=[]
    for k in dsbd.keys():

        for w in dsbd[k]:
            if k=='GaugeSector' or k=='MatterSector':
                if np.array(w).shape==(2,2):
                    weyl=bidiagonal(w,k)
                    Bidiagonal.append(weyl)
                elif np.array(w).shape==(3,):
                    symm=diagonal(w,k)
                    Diagonal.append(symm)
            elif k=='VEVs':
                VEV.append(get_vev(w,k))

    DEFINITION['EWSB']['Bidiagonal']=Bidiagonal
    DEFINITION['EWSB']['Diagonal']=Diagonal
    DEFINITION['EWSB']['VEVs']=VEV
    DEFINITION['EWSB']['DiracSpinors']=dsbd['DiracSpinors']
    return DEFINITION

def get_weylfermion_LaTeX(s):
    if len(s)==2 and re.search('[LR]$',s):
        sini=s[0]
        if sini=='v':
            sini=r'\nu'
        s=sini+'_'+s[1]
    return s

def get_abs_groups(grps=['1/2','2','1'],u1_abs='1/2',su2='2',su3_abs='1'):
    sgrps=str(grps).replace(' ','')
    return re.search(r"\['-*{}','{}','{}'".format(u1_abs,su2,su3_abs), sgrps )

def update_EWSB_Fermion_Description(p,prt):
    gprt=prt.loc[ p.get('Parents') ]
    if gprt[0].get('rotation'):
        gprt=prt.loc[gprt[0].get('Parents')]
    cmpt=gprt[0].get('Field')
    gprt=prt.loc[gprt[0].get('Parents')]
    if get_abs_groups( gprt[0].get('Properties').get('Groups'), u1_abs='1/6',su2='2',su3_abs='3' ):
        if cmpt==gprt[0].get('Properties').get('multiplet')[0]:
            p['Description']='Up-Quarks'
        else:
            p['Description']='Down-Quarks'
    if get_abs_groups( gprt[0].get('Properties').get('Groups'), u1_abs='1/2',su2='2',su3_abs='1' ):
        if cmpt==gprt[0].get('Properties').get('multiplet')[0]:
            p['Description']='Neutrinos'
        else:
            p['Description']='Leptons'
    return p

def get_EWSB_gauge_bosons(p,prt):
    mb=p.get('Properties').get('Mass_basis')
    #Get basis position
    pi=[i for i in range(len(mb)) if p.get('Field')==mb[i] ][-1]
    #Get parent particle
    ppij=p.get('Properties').get('Interaction_basis')[pi]
    #Simplify parent particle name
    ppi=re.sub('\[[0-9]+\]','',ppij)
    #Get Gauge Group from simplified parent particle name
    gppi=prt.loc[ppi][0].get('Properties').get('Group').strip()
    if gppi=='U[1]':
        p['Description']='Photon'
    elif gppi=='SU[2]':
        #Get SU[2] multiplet position
        j=eval(re.search('\[([0-9]+)\]',ppij).groups()[0])
        if j==3:
            p['Description']='Z-Boson'
        elif j<3:
            p['Description']='W+ - Boson'
    return p

#Spheno related functions
def add_Lagrangian_info(p):
    p['dimL']=len( p.get('Properties').get('Lorentz') )
    p['Lorentz_type']=len( list(set( p.get('Properties').get('Lorentz')  )) )
    return p

def extract_Lagrangian_terms(parameters,Lagrangian_dimension=4,Lorentz_structures=1 ):
    if (not isinstance(Lagrangian_dimension,int) or
        not isinstance(Lorentz_structures,int)):
        sys.exit('ERORR: input must be integers')
    lagcop=Particles( 
         parameters.apply_filter(
            lambda d: isinstance(d.get('Properties').get('Lorentz'),list) 
                                   ).apply(add_Lagrangian_info)
               )
    return lagcop.apply_filter(
                    lambda d: d.get('dimL')==Lagrangian_dimension
                            ).apply_filter(
                    lambda d: d.get('Lorentz_type')==Lorentz_structures
                            )

def get_tadpoles_and_bilinears(parameters,exclude=[]):
    '''
    exclude: List of symbols obtained from tadpole equations
    e.g: ['mu3']
    '''
    tdp=extract_Lagrangian_terms(parameters,
                                      Lagrangian_dimension=2,
                                      Lorentz_structures=1
                                     )
    tadpoles=tdp.get('Description')
    ctdpl=[] # Parameters to be calculated from tadpoles
    cbln =[] # Bilinear input paramater
    for t in tadpoles:
        bln=tdp.apply_filter(lambda d: d.get('Description')==t ).get('Symbol')[0]
        if bln not in exclude:
            ctdpl.append( bln )
        else:
            cbln.append(bln)
            
    return ctdpl,cbln

def get_gauge_couplings(parameters,
            smcouplings=['Hypercharge-Coupling','Left-Coupling','Strong-Coupling']):
    cs=[]
    for c in smcouplings:
        cs.append( parameters.apply_filter(
               lambda d: d.get('Description')==c).get('Symbol')[0] 
                 )
    
    return cs

def get_smyukawas(parameters,def_smyukawas=
                      ['Down-Yukawa-Coupling', 'Lepton-Yukawa-Coupling', 'Up-Yukawa-Coupling']):
    smyc=[]
    for y in def_smyukawas:
        smyc.append( parameters.apply_filter(
               lambda d: d.get('Description')==y).get('Symbol')[0]
                   )
    return smyc

def get_SM_MatchingConditions(parameters,
                              smcouplings=['Hypercharge-Coupling','Left-Coupling','Strong-Coupling'],
                              def_smyukawas=
                              ['Down-Yukawa-Coupling', 'Lepton-Yukawa-Coupling', 'Up-Yukawa-Coupling']):
    #VEV
    smvev=parameters.apply_filter(
                lambda d: d.get('Description')=='EW-VEV'
                                 ).get('Properties').get('Coupling')
    #Gauge couplings
    cs=get_gauge_couplings(parameters,smcouplings)
    #SM Yukawas
    smyc=get_smyukawas(parameters,def_smyukawas)

    lsmcpl=[]
    smcpl =smvev+smyc+cs
    for c in smcpl:
        lsmcpl.append( [c,c+'SM'])
    return lsmcpl

def get_sm_DefaultInputValues(parameters,sci,sciIN):
    for i in range(len(sci)):
        if parameters.apply_filter(
                lambda d: d.get('Description')=='SM Higgs Selfcouplings'
                     ).get('Symbol')[0]==sci[i]:
            d={sciIN[i]:0.27}
        else:
            d={}
        return d

#================
def _to_dict(df):
    return df.to_dict(orient='records')

#Classes
class list_of_dictionaries(list):
    '''
    Object containing a list of dictionaries
    
    __Some methods__
    
    * `self.apply(function)` implements `map`
    * `self.apply_filter(function)` implements `filter`
    * ...
    '''
    #Optional: just if something need to be check the object itself
    def __init__(self,*args, **kwargs):
        dt=list( set ([ type(d) for d in args[0] ]) )
        if dt and not (len(dt)==1 and dict in dt):
                sys.exit('NOT A LIST OF DICTIONARIES')
        super(list_of_dictionaries, self).__init__(*args, **kwargs)

    def __add__(self,other):
        '''
        Keep the list __add__, but return the proper object:
        
        NOTE: super() -> same as super(__class__, <first argument>)
        '''
        return list_of_dictionaries( super().__add__(other) )
        #return list_of_dictionaries(super(list_of_dictionaries, self).__add__(other))
        
    def size(self):
        return len(self)
    
    def unique(self):
        y=list( set( [str(d) for d in self] ) )
        return list_of_dictionaries( [eval(d) for d in y] )
    
    def Filter(self,k,v,first=False):
        x=list(filter(lambda d: d.get(k)==v,self))
        #x=[d for d in self if d.get(k)==v]
        if not x:
            x=[{}]
        if first:
            return x[0]
        else:
            return list_of_dictionaries(x)

    def apply_filter(self,f):
        x=list(filter(f,self))
        return list_of_dictionaries(x)

    def apply(self,f,args=()):
        '''
        Apply a multiargument function,
          f(x,*args)
        for each element, x, of the object
        May return a list. Don't enforce
        list_of_dictionaries() output
        ''' 
        if not isinstance(args, tuple):
            args = (args,)
        if args:
            g=lambda x:f(x,*args)
        else:
            g=f
        try:
            x=list(map(g,self))
        except TypeError:
            sys.exit('ERROR: Function returns some non boolean item. Be sure all KEYS are defined ')
        return x

    def Index(self):
        return range(len(self))
    
class Particles(list_of_dictionaries):
    '''
    Object containing a list of dictionaries intended
    to store information related with particles. 

    __Initilization__
    
    Each dictionary in the list may content an index with key `k` 
    (`k`="Field" by default). 
    Therefore, the instance can be initialized as
     
     x=self(list,index=k)
    
    such that `x.loc[k]` returns a filtered instance
    with the list of the filtered dictionaries with
    key `k`
    
    __Other methods__
    
    * To get and item of the dictionary by "KEY" use:
      `self.get("KEY")` instead of `self["KEY"]`.
    * `self.apply()` implements `map`
    * `self.apply_filter()` implements `filter`
    * ...
    '''
    def __init__(self,*args,index='Field'):
        '''
        Each dictionary in the list may content an index with key `k` 
        (`k`="Field" by default). 
        Therefore, the instance can be initialized as
     
             x=self(list,index=k)
    
        such that `x.loc[k]` returns a filtered instance
        with the list of the filtered dictionaries with
        key `k`
        '''
        self.loc={}
        # where the keys are the index values of args[0] (a list)
        for d in args[0]:
            if d.get(index):
                #Intialize an empty self instance to avoid recursion limit 
                self.loc[d.get(index)]=Particles([])
                #*** Capture all the d.get(index) ocurrences ***
                #Filter p-dictionaries matching the d.get(index)
                l=list(filter(lambda p: p.get(index)==d.get(index),
                         args[0] ))
                # Fill the self.loc dictionary
                for dx in l:
                    self.loc[d.get(index)].append(dx)
                #********************************************
                #=== Get only the last d.get(index) ===
                #self.loc[d.get(index)].append(d)
                #======================================
                
        super(Particles, self).__init__(*args)
        
    #Be sure that Particles is returned:
    def __add__(self,*args, **kwargs):
        return Particles(super().__add__(*args, **kwargs))
    
    def apply(self,*args, **kwargs):
        return super().apply(*args, **kwargs)
    
    def update(self,d):
        '''
        Updated internally with:
        d: dictionary
        for each one of the particles (dictionaries) in the
        Particles object
        '''
        for k in d.keys():
            kk=self.apply(lambda p: p.update({k:d[k]}) )  
    
    def unique(self):
        return Particles( super().unique() )
    

    def apply_filter(self,*args, **kwargs):
        return Particles(super().apply_filter(*args, **kwargs))


    #New methods:
    def mask(self,msk):
        return Particles( np.array(self)[msk] )

    def get(self,key):
        l=[d.get(key) for d in self]
        if list(set([isinstance(d,dict) for d in l]))==[True]:
            l=Particles(l)
        return l
    
class Parameters(Particles):
    '''
    Object containing a list of parameters
    '''
    pass
    
class SARAH:
    def __init__(self,model='SM',
                      path="./SARAH/Models/",
                      particles ='JSON/fullparticlesnames.json',
                      parameters='JSON/fullparametersnames.json',
                      SPheno='JSON/fullSPhenonames.json',
                      output_dir=''):
        '''
        LOAD predefined particles
        TODO: Include singlet scalar and other multiplets
        TODO: modify to_dict to default orient="records"
        '''
        f=open('JSON/fullparticlesnames.json','r')
        self.particles=Particles(json.load(f))
        f.close()        
        dfpt=pd.DataFrame(self.particles)
        dfpt.index=dfpt['Name'].str.replace('-','_').str.replace('\s','_')
        self.particle = pd.Series()
        for n in dfpt.index:
            self.particle[n]=dfpt.loc[n]
        f=open('JSON/fullparametersnames.json','r')
        self.parameters=Parameters(json.load(f))
        f.close()        
        dfpm = pd.DataFrame(self.parameters)
        dfpm.index=dfpm['Name'].str.replace('-','_').str.replace('\s','_')
        self.parameter = pd.Series()
        for n in dfpm.index:
            self.parameter[n]=dfpm.loc[n]
        self.Fields=['Gauge','FermionFields','ScalarFields']
        self.NAME='DEFINITION'
        self.KEY='EWSB'
        self.modelparticles=Particles([])
        self.modelparameters=Parameters([])
        self.modelSPheno=[]
        #READ Model File
        if not re.search('\/$',path):
            path=path+'/'
        mfile='{}.m'.format(model.split('/')[-1])
        self.model_path='{}{}/{}'.format(path,model,mfile)
        f=open(self.model_path,'r')
        self.model_file=f.read()
        f.close()
        self.model_dir=path
        self.model_name=model
        self.model_file_name=mfile
        self.DEFINITION=get_EWSB(self.model_file,self.NAME,self.KEY)
        self.Lagrangian_Couplings={
            'Down-Yukawa-Coupling':{'Lorentz': ['Scalar', 'WeylFermion', 'WeylFermion'],
                                'hypercharge': ['1/2', '1/3', '1/6'],
                                'update_Description':{}},
            'Up-Yukawa-Coupling':{'Lorentz': ['WeylFermion', 'WeylFermion','Scalar'],
                              'hypercharge': ['1/2', '1/6', '2/3'],
                             'update_Description':{}},
            'Lepton-Yukawa-Coupling':{'Lorentz': ['Scalar', 'WeylFermion', 'WeylFermion'],
                                  'hypercharge': ['1', '1/2', '1/2'],
                                 'update_Description':{}},
            'SM Mu Parameter':  {'Lorentz': ['Scalar', 'Scalar'],
                             'hypercharge': ['1/2', '1/2'],
                             'update_Description':{'OutputName':'m2SM'}},
            'SM Higgs Selfcouplings': {'Lorentz': ['Scalar', 'Scalar', 'Scalar', 'Scalar'],
                             'hypercharge': ['1/2', '1/2', '1/2', '1/2'],
                            'update_Description':{}}
           }
        self.parse_model_particles()
        
    def parse_particle_content(self):
        '''1)
        Parse Particle Content section of SARAH Model File
        with the intial particles in the GaugeES basis
        '''
        newparticles=get_particles(self.model_file,self.Fields,self.NAME,self.KEY,[],[])
        self.modelparticles=Particles( self.modelparticles+newparticles )
        return Particles(newparticles)
    
    def parse_Lagrangian(self):
        '''2)
        Read the Lagrangian from Model File and store as a
        dictionary
        '''
        if self.modelparticles.size()==0:
            sys.exit('ERROR: self.modelparticles is empty. Run "s.parse_model_particles()" ')

        dsbd=parse_mathematica_list_of_list(self.model_file,self.NAME,KEY='GaugeES')
        fdotm=self.model_file
        d={}
        for lag in dsbd['LagrangianInput']:
            pattern='^\s*\t*({}.*)'.format(lag[0])
            pattern_start='='
            pattern_end=';'
            only_extract=True
            l=extract_code_block(fdotm,pattern,pattern_start,pattern_end,only_extract)
            fl=list(l.values())[0]

            fll=re.sub('[\+\-]','::',
                re.sub('\)*\s*\t*\;\s*\t*$','',
                    re.sub( '^\s*\t*[\-\+\(]+','',
                    fl))).split('::')

            for x in fll:
                flli=re.sub('^\s*\t*', '',x)
                dd=re.sub('([\w\\\/\s\[\]]+)\s+([\w\[\]\.]+)',r'\1::\2',  flli).split('::')
                d[dd[0].strip()]=dd[1].strip()

        dd={}
        for k in d.keys():
            prtcls=[ s.strip() for s in re.sub( '[\w]+\[(\w+)\]',r'\1',d[k]).split('.')]
            dd[k]={'operator':d[k],'fields':prtcls,
                   'hypercharge': sorted( [ get_hypercharge(f,self.modelparticles).replace('-','') 
                                         for f in prtcls]),
                   'Lorentz':[ get_Lorentz(f,self.modelparticles) for f in prtcls]
                  }

        for k in dd.keys():
            ck=re.sub('^[0-9\/\s]+',r'',k)
            if ck!=k:
                vk=dd.pop(k)
                dd[ck]=vk

        self.Lagrangian=dd
        return dd    
    
    
    def parse_vevs_particles(self):
        '''3.a)
        '''
        newparticles=[]
        for d in self.DEFINITION[self.KEY]['VEVs']:
            particle=vev_to_particles(d,cp='Real')
            newparticles.append(particle)
            particle=vev_to_particles(d,cp='Imaginary')
            newparticles.append(particle)
            
        self.modelparticles=Particles( self.modelparticles+newparticles )
        return Particles(newparticles)
    def parse_diagonal_rotated_particles(self):
        '''3.b.I)
        '''
        newp=rotations_to_particles(self.DEFINITION,
                                     self.KEY,
                                     lr='',
                                     sep='')
        self.modelparticles=Particles( self.modelparticles+newp )
        return Particles( newp )

    def parse_bidiagonal_rotated_particles(self):
        '''3.b.II) - 3.b.III)
        '''
        newp=rotations_to_particles(self.DEFINITION,
                                        self.KEY,
                                        lr='left',
                                        sep='_')
        newp=newp+rotations_to_particles(self.DEFINITION,
                                        self.KEY,
                                        lr='right',
                                        sep='_')
        self.modelparticles=Particles(self.modelparticles+newp)
        return Particles(newp)

    def parse_DiracSpinors(self):
        '''3.c)
        '''
        newparticles=[]
        dict_of_spinors=self.DEFINITION['EWSB']['DiracSpinors']
        for f in dict_of_spinors.keys():
            particle=spinor_to_particles(dict_of_spinors,self.DEFINITION,f)
            newparticles.append(particle)
            
        self.modelparticles=Particles( self.modelparticles+newparticles )
        return Particles( newparticles )
    
    def parse_DEFINITION(self):
        '''3a..e)
        '''
        newp=self.parse_vevs_particles()
        newp=newp+self.parse_diagonal_rotated_particles()
        newp=newp+self.parse_bidiagonal_rotated_particles()
        newp=newp+self.parse_DiracSpinors()        
        return newp
    
    def parse_model_particles(self):
        '''
        Generate particles, parameters and SPheno dictionary.
        A) There will be a basic class of particles which can be readed directly
        B) Later one inhereted class with SM particles
        C) May be one final class with BSM particles not automatically identified
        The SARAH file is organized in sections:
        1) First the Gauge, FermionFields and ScalarFields in the Gauge basis
        2) Next the Lagrangian (more relevant to extract parameters)
        3) Next load the dictionary DEFINITION
        3.a) VEVS definitions 
        3.b) Rotations 
        3.b.I)   Diagonal -> GaugeSector, MatterField
        3.b.II)  Bidiagonal left  -> MatterField
        3.b.III) Bidiagonal right -> MatterField
        3.c) Dirac Fermions
        '''
        #1)
        newp=self.parse_particle_content()
        #3) a...c
        newp=newp+self.parse_DEFINITION()
        return newp
        #Check missing particles
        
    def update_particles(self,f,Definition='EWSB',Lorentz='DiracSpinor',args=()):
        DS=self.modelparticles.apply_filter(
                   lambda p: p.get('Definition')==Definition
                ).apply_filter(
                   lambda p: p.get('Properties').get('Lorentz').strip()==Lorentz)
        return Particles( DS.apply(f,args=args ) )
        
    def add_parameter(self,Name):
        # update predefined dataframes for particles, parameters and SPheno
        #reuturn series
        pass
    
    #Output files
    def to_particles(self,file='particles.m'):
        '''
        Generate particles.m
        '''
        pass
    def to_parameters(self,file='parameters.m'):
        '''
        Generate parameters.m
        '''
        pass
    def to_SPheno(self,file='SPheno.m'):
        '''
        Generate SPheno.m
        '''
        pass
    def to_all(self):
        self.to_particles()
        self.to_parameters()
        self.to_SPheno()
    def to_json(self):
        '''
        UPDATE JSON predefined dictionaries
        '''
        pass
#class 