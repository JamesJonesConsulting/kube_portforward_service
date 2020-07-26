FROM registry.gitlab.com/sgan/containers/core/jamjon3/doctl_container:latest

ARG DIGITALOCEAN_ACCESS_TOKEN
ENV DIGITALOCEAN_ACCESS_TOKEN=${DIGITALOCEAN_ACCESS_TOKEN}
RUN doctl auth init
RUN doctl kubernetes cluster kubeconfig save sgan-k8s
EXPOSE 3306
COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s /usr/local/bin/docker-entrypoint.sh / # backwards compat
ENTRYPOINT ["docker-entrypoint.sh"]
