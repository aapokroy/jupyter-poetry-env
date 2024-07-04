FROM python:3.10-bullseye

ARG UID
ARG GID

RUN groupadd -g $GID host
RUN useradd -m -u $UID -g $GID -s /bin/bash host
USER host
WORKDIR /home/host
ENV PATH="$PATH:/home/host/.local/bin"

COPY ./requirements.txt .
RUN pip install -r ./requirements.txt

RUN curl -sSL https://install.python-poetry.org | python3 -

COPY ./services.txt .
COPY ./init_kernels.sh .
COPY --chown=host ./services/ ./services
RUN bash init_kernels.sh

RUN mkdir notebooks

EXPOSE 8888

CMD ["jupyter", "notebook", "--no-browser",\
     "--ip=0.0.0.0", "--port=8888", "--NotebookApp.token=token", \
     "--notebook-dir=/home/host/notebooks/"]
