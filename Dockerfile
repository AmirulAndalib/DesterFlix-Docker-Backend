FROM ubuntu:22.04

WORKDIR /usr/src/desterflix

SHELL ["/bin/bash", "-c"]

RUN chmod 777 /usr/src/desterflix

ENV LANG="en_US.UTF-8" LANGUAGE="en_US:en"

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install wget curl python3.9 python3-pip git zip unzip -y

RUN git clone https://github.com/AmirulAndalib/desterflix-main.git desterflix 

RUN cd desterflix && pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash", "desterflix.sh"]
