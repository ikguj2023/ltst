import sys
import requests

def handler(event, context): 
    resp=requests.get("https://www.google.com")
    print(resp)
    return 'Hello from AWS Lambda using Python' + sys.version + '!'

