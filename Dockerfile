FROM python:3.6-slim-buster

RUN apt-get update && apt-get install -y --no-install-recommends

WORKDIR /usr/src/app

COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt 
COPY vis.py .

EXPOSE 8051

CMD ["gunicorn", "vis:server", "-b", "0.0.0.0:8051"]
