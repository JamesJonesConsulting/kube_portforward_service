FROM registry.gitlab.com/sgan/containers/core/jamjon3/doctl_container:latest

ARG DIGITALOCEAN_ACCESS_TOKEN
ENV DIGITALOCEAN_ACCESS_TOKEN=${DIGITALOCEAN_ACCESS_TOKEN}
RUN doctl auth init
EXPOSE 3306
ENTRYPOINT []
CMD ["kubectl","port-forward svc/mariadb-prod 3306:3306"]
