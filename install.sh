#!/bin/bash
docker-compose up
cp ./config.php /var/lib/docker/volumes/root_fossbilling/_data/config.php
rm -fr /var/lib/docker/volumes/root_fossbilling/_data/install/
rm -fr /var/lib/docker/volumes/root_fossbilling/_data/config-sample.php

git clone https://github.com/FOSSBilling/demo.git
cp -r ./demo/ /var/lib/docker/volumes/root_fossbilling/_data/modules/Demo

rm -fr var/lib/docker/volumes/root_fossbilling/_data/library/Registrar/Adapter/Email.php

