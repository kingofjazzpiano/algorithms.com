FROM python

RUN apt update && \
	apt install micro -y && \
    apt install -y nginx && \
    apt install -y make && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /algorithms.com

COPY . /algorithms.com/

RUN pip install --upgrade pip && \
    pip install poetry && \
    poetry config virtualenvs.create false && \
    poetry install

EXPOSE 8000
