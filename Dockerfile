FROM ubuntu:22.04

WORKDIR /usr/src/desterflix

SHELL ["/bin/bash", "-c"]

RUN chmod 777 /usr/src/desterflix

ENV LANG="en_US.UTF-8" LANGUAGE="en_US:en"

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install wget curl python3.9 python3-pip git zip unzip -y

RUN wget -O desterflix.zip https://github.com/DesterLib/Dester/releases/download/v0.9.0/Dester.v0.9.0.zip && unzip desterflix.zip && cd desterflix.zip

RUN ls

COPY . .

RUN pip3 install --no-cache-dir -r requirements.txt

CMD ["bash", "desterflix.sh"]
