import re
import cmdlike as cmd
from collections import OrderedDict
import json
import numpy as np

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
                        print(g.groups(),Field,len(fp))
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
                        print(particle)
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
                            print("**********")
                            sons=re.sub('conj\[(\w+)\]',r'\1', fp[2] ).split('::')
                            if len(sons)>1:
                                particle['Properties']['multiplet']=[s.strip() for s in sons]

                            print(fp[2],sons)
                            for s in sons:
                                print(s)
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
                            print("**********")

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


#Parameter defintions
def get_hypercharge(field,particles):
    try: 
        Y=particles[particles['Field']==field].reset_index(
              ).loc[0].get('Properties').get('Groups'
                                   )[0]
    except KeyError:
        Y=None
    return Y

def get_Lorentz(field,particles):
    try: 
        Y=particles[particles['Field']==field].reset_index(
              ).loc[0].get('Properties').get('Lorentz'
                                   )
    except KeyError:
        Y=None
    return Y

def get_higgs_vev(smdict,k,particles):
    '''
    Get the vev associated to the Yukawa coupling
    in `smdict` with Description `k`
    '''
    try:
        H=smdict.get(k).get('Higgs')
    except AttributeError:
        H=''
    if H:
        H0=get_H0(H,particles)
        hh=get_hh(H0)
        if not hh.empty:
            v=hh.get('Properties').apply(lambda d: d.get('vev')).loc[0]
    else:
        v=''
    return v

def get_diagonal_basis(vev,p,particles):
    try:
        pp=particles[particles['Parents']==p].reset_index(drop=True).loc[0,'Field']
        DF=particles[particles['Parents']==pp].reset_index(drop=True).loc[0,'Field']
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
    mltp=particles[particles['Parents']==WF]
    if mltp.shape[0]==2:
        chiral='Left'
    elif mltp.shape[0]==1:
        chiral='Right'
    else:
        chiral=None
    j=0
    multiplet={}
    for p in mltp['Field']:
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

def sorted_equality(l1,l2):
    return sorted(l1)==sorted(l2)

def get_H0(H,particles):
    "H is string"
    Hs=particles[particles['Parents']==H]
    #Get doublet components
    if Hs.shape[0]==2:
        # extract neutral component
        for Hf in Hs.get('Field'):
            H0s=particles[particles.get('Parents')==Hf].reset_index(drop=True)
            if not H0s.get('Properties').empty:
                return H0s
        
def get_hh(H0):
    "H0 is a dataframe"
    if not H0.empty:
        return H0[H0.get('Properties').apply(lambda d: d.get('CP')=='Real')].reset_index(drop=True)
    else:
        return pd.DataFrame()
    

#SPHENO Definitions

def get_tadpoles_and_bilinears(L,dimL,smd,exclude=None):
    #Get tadpoles from Lagrangina excluding bilinear `exclude`
    tadpoles=list(L[(np.logical_and(L==1,dimL==2))].index)
    ctdpl=[] # Parameters to be calculated from tadpoles
    cbln =[] # Bilinear input paramater
    for t in tadpoles:
        bln=smd.loc['Coupling',t]
        if bln!=exclude:
            ctdpl.append( bln )
        else:
            cbln.append(bln)
    return ctdpl,cbln

def get_input_parameters(L,dimL,smd):
    #TODO: Include Yukawas
    sci=[]
    scalarint=list(L[(np.logical_and(L==1,dimL>2))].index)
    for sc in scalarint:
        sci.append( smd.loc['Coupling',sc] )
    return sci

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

def get_smyukawas(smd,def_smyukawas=
                      ['Down-Yukawa-Coupling', 'Lepton-Yukawa-Coupling', 'Up-Yukawa-Coupling']):
    smyc=[]
    for y in def_smyukawas:
        smyc.append( smd.loc['Coupling',y])
    return smyc

def get_other_yukawas(smd,L,dimL,def_smyukawas=
                      ['Down-Yukawa-Coupling', 'Lepton-Yukawa-Coupling', 'Up-Yukawa-Coupling']):
    def_yukawas=list(L[(np.logical_and(L==2,dimL==3))].index)
    oyc=[]
    for y in def_yukawas:
        if y not in def_smyukawas:
            oyc.append( smd.loc['Coupling',y])
    return oyc

def get_gauge_couplings(smc,smcouplings=['Hypercharge-Coupling','Left-Coupling','Strong-Coupling']):
    cs=[]
    for c in smcouplings:
        cs.append( smc.loc['Description'][ smc.loc['Description']==c ].index[0] )
    
    return cs

def get_SM_MatchingConditions(smd,smc,
                              smcouplings=['Hypercharge-Coupling','Left-Coupling','Strong-Coupling'],
                              def_smyukawas=
                              ['Down-Yukawa-Coupling', 'Lepton-Yukawa-Coupling', 'Up-Yukawa-Coupling']):
    #VEV
    smvev=smd.loc['Coupling','EW-VEV']
    #Gauge couplings
    cs=get_gauge_couplings(smc,smcouplings)
    #SM Yukawas
    smyc=get_smyukawas(smd,def_smyukawas)

    lsmcpl=[]
    smcpl =[smvev]+smyc+cs
    for c in smcpl:
        lsmcpl.append( [c,c+'SM'])
    return lsmcpl

def get_decay_particles(DecayParticles   = ['Fu', 'Fe', 'Fd', 'hh'],
                    DecayParticles3B = ['Fu', 'Fe', 'Fd']):
    LDecayParticles3B=[]
    for p in DecayParticles3B:
        LDecayParticles3B.append( [p,'"{}.f90"'.format(p)])
    return DecayParticles,LDecayParticles3B


def get_sm_DefaultInputValues(smd,sci,sciIN):
    for i in range(len(sci)):
        if smd.loc['Coupling','SM Higgs Selfcouplings']==sci[i]:
            d={sciIN[i]:0.27}
        else:
            d={}
        return d
    
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
            f.write('{} = {};\n\n'.format(i,to_math_list(SP.loc[i,'Properties'])  ))
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