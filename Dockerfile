FROM ubuntu:latest
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends gcc libffi-dev musl-dev ffmpeg aria2 python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /app/
WORKDIR /app/
RUN python3 -m venv .venv
RUN source .venv/bin/activate
RUN pip3 install --no-cache-dir --upgrade --requirement Installer
CMD python3 modules/main.py
