import sys
if sys.version_info >= (3, 0):
     # Python 3 code in this block
     import subprocess
     def getoutput(*args,**kargs):
         o,e=subprocess.Popen(*args,shell=True,stdout=subprocess.PIPE,
                              stderr=subprocess.PIPE,**kargs).communicate() 
         if o:
             return o.decode('utf8').strip()
         else:
             return e.decode('utf8').strip()

else:
     # Python 2 code in this block
     from commands import *
     


