FROM debian:11
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y install \
    python3 python3-dev python3-dev python3-pip python3-venv
RUN apt-get install -y gconf-service libasound2 libatk1.0-0 libcairo2 libcups2 libfontconfig1 libgdk-pixbuf2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libxss1 fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install
RUN apt-get install git curl python3-pip ffmpeg -y
ARG USER=root
USER $USER
RUN python3 -m venv venv
WORKDIR /app
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs
COPY requirements.txt ./requirements.txt
RUN pip3 install -r requirements.txt
COPY start.sh start.sh
COPY app.py app.py
EXPOSE 5000
RUN chmod +x /app/start.sh
ENTRYPOINT ["./start.sh"]
