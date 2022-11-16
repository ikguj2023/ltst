import sys

def handler(event, context): 
    print("test at nov 15 10:09 pm")
    return 'Hello from AWS Lambda using Python' + sys.version + '!'

