FROM python:alpine3.7

COPY src /src

WORKDIR /src

RUN pip install -r requirements.txt

CMD ["python", "app/server.py"]
