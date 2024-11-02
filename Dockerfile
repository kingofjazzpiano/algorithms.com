FROM ubuntu/nginx

RUN apt update && \
	apt install -y \
	python3-venv \
	curl && \
	rm -rf /var/lib/apt/lists/*

COPY . /algorithms.com/

RUN python3 -m -venv /algorithms.com/venv && \
	source /algorithms.com/venv/bin/activate && \
	pip install poetry && \
	poetry install
