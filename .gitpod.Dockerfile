ARG PY_VERSION=3.11

FROM gitpod/workspace-python-${PY_VERSION}:latest

RUN sudo apt-get update && sudo apt-get -y install postgresql
RUN pip install "poetry==1.3.2"

COPY poetry.lock pyproject.toml /

RUN poetry config virtualenvs.create false \
  && poetry install --no-interaction --no-ansi