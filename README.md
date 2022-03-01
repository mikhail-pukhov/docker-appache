# docker-appache
https://infostart.ru/1c/articles/810851/

## Шаг 1.
Устанавливаем Docker на локальную машину разработчика (для удобства проверки и отладки) и на целевую Linux машину,
где мы собственно и хотим запустить веб-сервер.

## Шаг 2.
Создадим директорию для нашего проекта и скачаем в неё дистрибутив 1С Сервер для Linux: https://releases.1c.ru -> 
Технологическая платформа 8.3 -> Cервер 1С:Предприятия (64-bit) для DEB-based Linux-систем
Скачается файл с расширением .tar.gz - переименуем его в deb64.tar.gz.

## Шаг 3.
Создадим файл с настройками подключения к 1С: default.vrd

Я привожу пример минимального vrd файла в котором по умолчанию опубликованы все веб-сервисы, все http сервисы и стандартный REST интерфейс (OData).

<?xml version="1.0" encoding="UTF-8"?>
<point xmlns="http://v8.1c.ru/8.2/virtual-resource-system"
      xmlns:xs="http://www.w3.org/2001/XMLSchema"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      base="/BuhBase"
      ib="Srvr=Serv1C;Ref=BuhBase"
      enableStandardOData="true">
   <ws publishExtensionsByDefault="true" />
   <httpServices publishByDefault="true" publishExtensionsByDefault="true"/>
</point>
Обратите внимание на строку подключения, замените имя сервера 1С (Serv1C) и имя информационной базы (BuhBase) на свои.

Если вы ранее уже публиковали свою базу на веб-сервере (не важно на каком: IIS или Apache, Windows или Linux, с помощью конфигуратор
или с помощью webinst), у вас точно должен быть .vrd файл, поищите в публичных директориях веб-сервера и используйте его.
