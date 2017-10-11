import requests
import io
'''
Based on:
http://stackoverflow.com/a/39225272
'''
def pandas_from_google_drive_csv(id):
    url='https://docs.google.com/spreadsheets/d/%s/gviz/tq?tqx=out:csv' %id
    r=requests.get(url)
    if r.status_code==200:
        csv_file=io.StringIO(r.text) # or directly  with: urllib.request.urlopen(url)
        return pd.read_csv( csv_file,keep_default_na=False)

def download_file_from_google_drive(id,destination=None,binary=True):
    '''
    Download file from google drive as binary (default) or txt file.
    If not destination the file object is returned
    Example: Let id="XXX" a txt file:
    1) fb=download_file_from_google_drive("XXX") ; fb.decode() #to convert to text file
    2) ft=download_file_from_google_drive("XXX",binary=False) # txt file
    3) fb=download_file_from_google_drive("XXX",'output_file') # always binay
    '''
    URL = "https://docs.google.com/uc?export=download"

    session = requests.Session()

    response = session.get(URL, params = { 'id' : id }, stream = True)
    token = get_confirm_token(response)

    if token:
        params = { 'id' : id, 'confirm' : token }
        response = session.get(URL, params = params, stream = True)

    
    return save_response_content(response, destination=destination,binary=binary)

def get_confirm_token(response):
    for key, value in response.cookies.items():
        if key.startswith('download_warning'):
            return value

    return None

def save_response_content(response, destination=None,binary=True):
    CHUNK_SIZE = 32768

    if destination:
        f=open(destination, "wb") #binary file
    else:
        chunks=b''
    for chunk in response.iter_content(CHUNK_SIZE):
        if chunk: # filter out keep-alive new chunks
            if destination:
                f.write(chunk)
            else:
                chunks=chunks+chunk
    if destination:
        f.close()  #writes the file
    else:
        if binary:
            return io.BytesIO(chunks) # returns the file object
        else:
            return io.StringIO(chunks.decode()) # returns the file object