#!/bin/bash

docker exec -it jhipsterconsole_jhipster-alerter_1 elastalert-test-rule rules/$1
