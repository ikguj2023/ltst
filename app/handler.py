import requests
def handler(event, context):
  print("Welcome to lambda handler")
  print("Run your lambda code from here")
  resp=requests.get("http://www.google.com")
  print(resp)
  
  return{"action": "handler_executed"}
