# JHipster Console

[![Build Status][travis-image]][travis-url]
[![Join the chat at https://gitter.im/jhipster/jhipster-console](https://badges.gitter.im/jhipster/jhipster-console.svg)](https://gitter.im/jhipster/jhipster-console?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

This is the [JHipster](http://jhipster.github.io/) Console, based on the [ELK Stack](https://www.elastic.co/products). It provides a default configuration to get started with logs and metrics monitoring with ELK as well as some nice dashboards.

Please refer to the [JHipster Monitoring Documentation](http://jhipster.github.io/monitoring) for instructions on how to set up the JHipster Console.

[travis-image]: https://travis-ci.org/jhipster/jhipster-console.svg?branch=master
[travis-url]: https://travis-ci.org/jhipster/jhipster-console

## Quick Start

Start everything by running `docker-compose up -d` in the `bootstrap/` directory, then access Kibana at [localhost:5601](http://localhost:5601) and Zipkin at [localhost:9411](http://localhost:9411).

## Contributing

PRs are welcome ! When contributing, make sure you force build and restart everything with `docker-compose down && docker-compose build --no-cache && docker-compose up`.

## Images hosted on Docker Hub

- **jhipster/jhipster-console** [![Automated build](https://img.shields.io/docker/automated/jhipster/jhipster-console.svg)](https://hub.docker.com/r/jhipster/jhipster-console/) [![Docker Pulls](https://img.shields.io/docker/pulls/jhipster/jhipster-console.svg)](https://hub.docker.com/v2/repositories/jhipster/jhipster-console/)
- **jhipster/jhipster-elasticsearch** [![Automated build](https://img.shields.io/docker/automated/jhipster/jhipster-elasticsearch.svg)](https://hub.docker.com/r/jhipster/jhipster-elasticsearch/) [![Docker Pulls](https://img.shields.io/docker/pulls/jhipster/jhipster-elasticsearch.svg)](https://hub.docker.com/v2/repositories/jhipster/jhipster-elasticsearch/)
- **jhipster/jhipster-logstash** [![Automated build](https://img.shields.io/docker/automated/jhipster/jhipster-logstash.svg)](https://hub.docker.com/r/jhipster/jhipster-logstash/) [![Docker Pulls](https://img.shields.io/docker/pulls/jhipster/jhipster-logstash.svg)](https://hub.docker.com/v2/repositories/jhipster/jhipster-logstash/)
- **jhipster/jhipster-zipkin** [![Automated build](https://img.shields.io/docker/automated/jhipster/jhipster-zipkin.svg)](https://hub.docker.com/r/jhipster/jhipster-zipkin/) [![Docker Pulls](https://img.shields.io/docker/pulls/jhipster/jhipster-zipkin.svg)](https://hub.docker.com/v2/repositories/jhipster/jhipster-zipkin/)
- **jhipster/jhipster-alerter** [![Automated build](https://img.shields.io/docker/automated/jhipster/jhipster-alerter.svg)](https://hub.docker.com/r/jhipster/jhipster-alerter/) [![Docker Pulls](https://img.shields.io/docker/pulls/jhipster/jhipster-alerter.svg)](https://hub.docker.com/v2/repositories/jhipster/jhipster-alerter/)
- **jhipster/jhipster-curator** [![Automated build](https://img.shields.io/docker/automated/jhipster/jhipster-curator.svg)](https://hub.docker.com/r/jhipster/jhipster-curator/) [![Docker Pulls](https://img.shields.io/docker/pulls/jhipster/jhipster-curator.svg)](https://hub.docker.com/v2/repositories/jhipster/jhipster-curator/)
- **jhipster/jhipster-import-dashboards** [![Automated build](https://img.shields.io/docker/automated/jhipster/jhipster-import-dashboards.svg)](https://hub.docker.com/r/jhipster/jhipster-import-dashboards/) [![Docker Pulls](https://img.shields.io/docker/pulls/jhipster/jhipster-import-dashboards.svg)](https://hub.docker.com/v2/repositories/jhipster/jhipster-import-dashboards/)
