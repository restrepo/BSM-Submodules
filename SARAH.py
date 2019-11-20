import re
import cmdlike as cmd
from collections import OrderedDict
import json

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
                            particle['Properties']['Groups']=fp[3:]
                            particle['Definition']='WeylFermionAndIndermediate'
                            if Field=='FermionFields':
                                particle['Properties']['Lorentz']='WeylFermion'
                            elif Field=='ScalarFields':
                                particle['Properties']['Lorentz']='Scalar'
                            print("**********")
                            sons=re.sub('conj\[(\w+)\]',r'\1', fp[2] ).split('::')
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