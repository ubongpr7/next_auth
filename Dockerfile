FROM python:3.12-alpine

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app
COPY .env /app/.env
RUN apk add --no-cache \
    gcc \
    musl-dev \
    libffi-dev \
    build-base \
    jpeg-dev \
    zlib-dev \
    postgresql-dev

COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . /app/

EXPOSE 8000

