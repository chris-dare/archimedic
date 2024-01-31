# TODO: Write me

FROM python:3.10-slim

LABEL maintainer="Chris Dare <engineering@chrisdare.me>"

WORKDIR /app/

# Install build dependencies
RUN apt-get -y update; apt-get -y install curl gcc python3-dev build-essential

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | POETRY_HOME=/opt/poetry python && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false

# Copy poetry.lock* in case it doesn't exist in the repo
COPY ./pyproject.toml ./poetry.lock* /app/

# Allow installing dev dependencies to run tests
ARG INSTALL_DEV=true
RUN bash -c "if [ $INSTALL_DEV == 'true' ] ; then poetry install --no-root ; else poetry install --no-root --no-dev ; fi"

COPY ./ /app

# Copy the training model script
# Copy scripts to start API

COPY ./scripts/start.sh /start.sh
RUN chmod +x /start.sh

COPY ./scripts/gunicorn_conf.py /gunicorn_conf.py

COPY ./scripts/start-reload.sh /start-reload.sh
RUN chmod +x /start-reload.sh

ENV PYTHONPATH=/app

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=${JUPYTER_TOKEN?Variable not set}"]

EXPOSE 8888
EXPOSE 80
