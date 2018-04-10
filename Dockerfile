FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
    chromium-browser \
    firefox \
    golang-go \
    python-pip \
    unzip \
    wget \
    xvfb

RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.18.0/geckodriver-v0.18.0-linux64.tar.gz && \
    tar -xvzf geckodriver-v0.18.0-linux64.tar.gz geckodriver-v0.18.0-linux64 && \
    chmod a+x geckodriver-v0.18.0-linux64 && \
    rm geckodriver-v0.18.0-linux64.tar.gz

RUN wget https://chromedriver.storage.googleapis.com/2.37/chromedriver_linux64.zip && \
    unzip chromedriver_*.zip && \
    mv chromedriver /usr/bin/chromedriver && \
    chmod a+x /usr/bin/chromedriver && \
    rm -rf chromedriver_*.zip

RUN pip install selenium

RUN go get github.com/DATA-DOG/godog/cmd/godog

RUN go get github.com/tebeka/selenium


