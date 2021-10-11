# syntax=docker/dockerfile:1

FROM python:3.9
RUN apt-get update && apt-get install -y rrdtool
WORKDIR /code
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
COPY ./app /code/app
CMD ["uvicorn", "rrdrest.main:rrd_rest", "--host", "0.0.0.0", "--port", "80"]