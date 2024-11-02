FROM ubuntu/nginx

RUN apt update && \
	apt install -y \
	python3 \
	python3-venv \
	curl && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /algorithms.com

COPY . /algorithms.com/

RUN python3 -m venv venv && \
    ./venv/bin/pip install --upgrade pip && \
    ./venv/bin/pip install poetry && \
    ./venv/bin/poetry install

EXPOSE 8000

CMD ["./venv/bin/python", "manage.py", "runserver", "0.0.0.0:8000"]
