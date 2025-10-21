FROM informaticsmatters/rdkit-cartridge-debian:Release_2024_03_6

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

USER root

WORKDIR /tmp
RUN apt update -y && \
    apt install --no-install-recommends -y \
    build-essential \
    curl \
    ca-certificates \
    git  \
    postgresql-server-dev-15 && \
    git clone --branch v0.8.1 https://github.com/pgvector/pgvector.git


WORKDIR /tmp/pgvector

RUN make && make install && \
    rm -r /tmp/pgvector && \
    apt-get remove -y build-essential curl git postgresql-server-dev-15 && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/lib/postgresql/data && \
    chown -R postgres:postgres /var/lib/postgresql


WORKDIR /

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 5432

CMD ["postgres", "-c", "listen_addresses=*"]
