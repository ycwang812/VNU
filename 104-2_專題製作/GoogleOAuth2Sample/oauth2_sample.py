import json
import webbrowser

import httplib2

from googleapiclient.discovery import build
from oauth2client import client

if __name__ == '__main__':

  flow = client.flow_from_clientsecrets(
    'client_secrets.json',
    scope='https://www.googleapis.com/auth/drive.metadata.readonly',
    redirect_uri='urn:ietf:wg:oauth:2.0:oob')

  auth_uri = flow.step1_get_authorize_url()
  webbrowser.open_new(auth_uri)

  auth_code = input('Enter the auth code: ')

  credentials = flow.step2_exchange(auth_code)
  http_auth = credentials.authorize(httplib2.Http())

  drive_service = build('drive', 'v2', http=http_auth)
  files = drive_service.files().list().execute()
  
  for f in files['items']:
    print(f['title'])