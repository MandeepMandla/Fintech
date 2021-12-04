FROM ubuntu:14.04
FROM python:3.9

 # Update packages
RUN apt-get update -y

 # Install Python Setuptools
RUN apt-get install -y python-setuptools

 # Install pip
RUN python -m venv venv
RUN venv/bin/pip install --upgrade pip

 # Add and install Python modules
ADD requirements.txt /src/requirements.txt
RUN cd /src; pip install -r requirements.txt

 # Bundle app source
ADD . /src

 # Expose
EXPOSE  5000

 # Run
CMD ["python", "/src/application.py"]