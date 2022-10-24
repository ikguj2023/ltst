def handler(event, context):
  print("Welcome to lambda handler")
  print("Run your lambda code from here")
  
  return{"action": "handler_executed"}
