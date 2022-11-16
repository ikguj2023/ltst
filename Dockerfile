FROM python:buster as build-image
#FROM public.ecr.aws/lambda/python:3.7

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

ENTRYPOINT [ "/usr/local/bin/python" ]
CMD [ "app.handler" ]
