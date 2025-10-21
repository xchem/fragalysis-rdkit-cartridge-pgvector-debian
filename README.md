# Fragalysis PG-Vector DB image
A project that adds [pgvector] to the otherwise standard PostgreSQL
database cartridge.

## Building the image
Use docker to build and publish the image. As a matter of style
we tag the image using the tag of the underlying container.
Currently this is `Release_2024_03_6`: -

    TAG=Release_2024_03_6
    docker build . -t xchem/fragalysis-rdkit-cartridge-pgvector-debian:${TAG}
    docker push xchem/fragalysis-rdkit-cartridge-pgvector-debian:${TAG}

---

[pgvector]: https://github.com/pgvector/pgvector
