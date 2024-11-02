FROM ubuntu/nginx

RUN apt update && \
	apt install -y \
	python3 \
	python3-venv \
	curl && \
	rm -rf /var/lib/apt/lists/*

COPY . /algorithms.com/

RUN cd /algorithms.com/ && \
	python3 -m venv venv && \
	. venv/bin/activate && \
	pip install poetry && \
	poetry install && \
	python3 manage.py runserver 0.0.0.0:8000
