#! /usr/bin/env sh

declare -i RESULT=0

cd /tmp
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

declare -r EXPECTED_CHECKSUM="$(wget -q -O - https://composer.github.io/installer.sig)"
declare -r ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]
then
    >&2 echo 'ERROR: Invalid installer checksum'
    rm composer-setup.php
    RESULT=1
else
    php composer-setup.php --quiet --install-dir=/usr/local/bin --filename=composer
    RESULT=$?
fi

rm composer-setup.php
exit $RESULT
