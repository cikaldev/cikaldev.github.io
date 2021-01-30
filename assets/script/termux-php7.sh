cd && \
  echo update package && apt update && \
  echo install WGET and CURL && apt install wget curl && \
  echo download and install PHP && \
  wget https://github.com/cikaldev/termux-pod/raw/main/arm/php7/php_7.4.12_arm.deb && \
    dpkg -i php_7.4.12_arm.deb && \
  echo download and install PHP-FPM && \
  wget https://github.com/cikaldev/termux-pod/raw/main/arm/php7/php-fpm_7.4.12_arm.deb && \
    dpkg -i php-fpm_7.4.12_arm.deb && \
    echo setup FPM && \
    mkdir -p $PREFIX/var/run && php-fpm && \
  echo download and install PHP-PGSQL && \
  wget https://github.com/cikaldev/termux-pod/raw/main/arm/php7/php-pgsql_7.4.12_arm.deb && \
    dpkg -i php-pgsql_7.4.12_arm.deb && \
  echo install and setup NGINX && \
    apt install nginx && \
    mv $PREFIX/etc/nginx/nginx.conf $PREFIX/etc/nginx/nginx.conf.bak && \
    wget https://raw.githubusercontent.com/cikaldev/cikaldev.github.io/master/assets/script/nginx.conf -O $PREFIX/etc/nginx/nginx.conf && \
    nginx && sv-enable nginx && sv up nginx && \
  echo create symlink to main dir && \
    ln -s $PREFIX/share/nginx/html html && \
  echo clear temp file && \
    rm php-pgsql_7.4.12_arm.deb && \
    rm php_7.4.12_arm.deb && \
    rm php-fpm_7.4.12_arm.deb && \
  echo create test file && echo '<?php phpinfo();?>' > ~/html/info.php && \
  xdg-open http://localhost:8080/info.php

echo done.
