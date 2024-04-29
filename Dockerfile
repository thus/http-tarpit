FROM python:3

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY http_tarpit.py .

ENV TARPIT_HOST="0.0.0.0"
ENV TARPIT_PORT="80"
ENV TARPIT_ARGS=""

CMD exec uvicorn --host $TARPIT_HOST --port $TARPIT_PORT $TARPIT_ARGS http_tarpit:app
