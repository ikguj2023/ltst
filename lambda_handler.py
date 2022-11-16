def handler(event, context):
  print("Welcome to lambda handler")
  print("Run your lambda code from here")
  print("Run your lambda code from here - Nove 15, 9:31 changes")
  print("Run your lambda code from here - Nove 15, 5:18 changes")
  resp=requests.get("http://www.google.com")
  print(resp)
  
  return{"action": "handler_executed"}
