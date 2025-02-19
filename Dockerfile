FROM python:3.11-slim-bookworm
ARG USER=root
USER $USER
RUN python3 -m venv venv
WORKDIR /app
#RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
#RUN apt-get install -y nodejs
COPY requirements.txt ./requirements.txt
RUN pip3 install -r requirements.txt
COPY start.sh start.sh
COPY app.py app.py
EXPOSE 5000
RUN chmod +x /app/start.sh
ENTRYPOINT ["./start.sh"]
