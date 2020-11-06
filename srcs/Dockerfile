# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gmoshe <gmoshe@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/02 13:08:00 by gmoshe            #+#    #+#              #
#    Updated: 2020/08/02 13:14:06 by gmoshe           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install vim \
nginx default-mysql-server php7.3 php7.3-fpm \
wordpress php7.3-mysql php-json php-mbstring \
openssl

COPY ./srcs/sql_config.sql /var/
COPY ./srcs/default /etc/nginx/sites-available
COPY ./srcs/ft_server.crt /etc/ssl/certs/
COPY ./srcs/ft_server.key /etc/ssl/private/ft_server.key
COPY ./srcs/autoindex.sh .
COPY ./srcs/start_server.sh .

ADD https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz phpmyadmin.tar.gz

RUN tar xvzf phpmyadmin.tar.gz && mv phpMyAdmin-5.0.2-all-languages /var/www/html/phpmyadmin
RUN mv /usr/share/wordpress /var/www/html

COPY ./srcs/wp-config.php /var/www/html/wordpress
COPY ./srcs/config.inc.php /var/www/html/phpmyadmin/
RUN chmod +x start_server.sh
RUN chmod +x autoindex.sh

RUN chown -R www-data /var/www/html

EXPOSE 80 443

ENTRYPOINT bash start_server.sh