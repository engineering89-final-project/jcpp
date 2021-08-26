FROM python
WORKDIR /usr/src/project
COPY . .
RUN apt-get update && apt-get install -f -y
RUN apt-get install python3-pip -y
RUN pip3 install -r requirements.txt
EXPOSE 5000
RUN export FLASK_APP=main.py
CMD [ "python3", "-m", "flask", "run", "--host=0.0.0.0" ]