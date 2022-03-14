FROM python:3.7-alpine
MAINTAINER LABEL "Vivek"

#Copying files in Current Directory to docker container
WORKDIR /app
COPY . .

#Adding Dependencies for packages
RUN apk add --update --no-cache --virtual .tmp gcc libc-dev linux-headers
RUN apk add --no-cache jpeg-dev zlib-dev

#Installing all required packages
RUN pip install -r requirements.txt
RUN apk del .tmp

#Starting docker container
CMD ["python3","app.py"]
