# Define function directory
ARG FUNCTION_DIR="/function"

FROM python:buster as build-image

# Install aws-lambda-cpp build dependencies
RUN apt-get update && \
  apt-get install -y \
  g++ \
  make \
  cmake \
  unzip \
  libcurl4-openssl-dev

RUN poetry run pip3 install -U setuptools
RUN apt-get update && apt-get install --no-install-recommends -y curl jq libpq-dev gcc python3-dev && \
    curl -sSL https://install.python-poetry.org | python &&
    
RUN apt-get install python3-dev -y && apt-get install libssl-dev -y && apt-get install swig 2.0.10 -y 
RUN poetry run pip3 install --upgrade M2Crypto

RUN pip3 install playwright
RUN playwright install-deps
RUN playwright install chromium

# Include global arg in this stage of the build
ARG FUNCTION_DIR
# Create function directory
RUN mkdir -p ${FUNCTION_DIR}

# Copy function code
COPY app/* ${FUNCTION_DIR}/

# Install the runtime interface client
RUN pip install \
        --target ${FUNCTION_DIR} \
        awslambdaric

# Multi-stage build: grab a fresh copy of the base image
FROM python:buster

# Include global arg in this stage of the build
ARG FUNCTION_DIR
# Set working directory to function root directory
WORKDIR ${FUNCTION_DIR}

# Copy in the build image dependencies
COPY --from=build-image ${FUNCTION_DIR} ${FUNCTION_DIR}

ENTRYPOINT [ "/usr/local/bin/python", "-m", "awslambdaric" ]
CMD [ "app.handler" ]
