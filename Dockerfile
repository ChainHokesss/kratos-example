FROM oryd/kratos:v1.3.1

USER root

COPY ./config /etc/config/kratos
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh
RUN mkdir -p /var/lib/sqlite && touch /var/lib/sqlite/db.sqlite && chown -R ory:ory /var/lib/sqlite

USER ory
RUN kratos -c /etc/config/kratos/kratos.yml migrate sql -e --yes

EXPOSE 4433

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]