FROM i386/httpd:2.4

# Копируем дистрибутив в директорию dist
COPY deb_8_3_18_1741.tar.gz /dist/deb_8_3_18_1741.tar.gz

# Разархивируем дистрибутив
RUN tar -xzf /dist/deb_8_3_18_1741.tar.gz -C /dist \
  # и устанавливаем пакеты 1С в систему внутри контейнера
  && dpkg -i /dist/*.deb \
  # и тут же удаляем исходные deb файлы дистрибутива, которые нам уже не нужны
  && rm /dist/*.deb

# Копируем внутрь контейнера заранее подготовленный конфиг от Apache
COPY httpd.conf /usr/local/apache2/conf/httpd.conf

# Копируем внутрь контейнера заранее подготовленный конфиг с настройками подключения к серверу 1С
COPY default.vrd /usr/local/apache2/htdocs/ut114/default.vrd

RUN chmod -R 755 /usr/local/apache2/htdocs/ut114