FROM public.ecr.aws/lambda/python:3.7

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

CMD ["lambda_handler.handler"]
