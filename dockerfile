FROM ubuntu:18.04
MAINTAINER m_mandla@encs.concordia.ca

RUN apt-get update -y
RUN apt-get python-pip -y
RUN apt-get install gunicorn3 -y

COPY Requirement.txt
COPY Inertia /opt/

RUN pip3 install -r Requirement.txt
WORKDIR /opt/

CMD ["gunicorn3","-b","0.0.0.0/80","app:app","--workers=5
"]