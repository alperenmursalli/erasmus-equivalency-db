FROM postgres:15

ENV POSTGRES_USER=erasmus
ENV POSTGRES_PASSWORD=erasmus
ENV POSTGRES_DB=erasmus_db

COPY SQL /docker-entrypoint-initdb.d
