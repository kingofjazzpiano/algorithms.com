FROM python

RUN apt update && \
	apt install micro -y && \
    apt install -y nginx && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /algorithms.com

COPY . /algorithms.com/

RUN pip install --upgrade pip && \
    pip install poetry && \
    poetry config virtualenvs.create false && \
    poetry install

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
