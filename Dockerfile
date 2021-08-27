FROM python:3.6.14-alpine3.14
WORKDIR /usr/src/project
COPY . .
RUN apk update && apk upgrade -y
RUN apk add python3-pip -y
RUN pip3 install -r requirements.txt
EXPOSE 5000
RUN export FLASK_APP=main.py
CMD [ "python3", "-m", "flask", "run", "--host=0.0.0.0" ]