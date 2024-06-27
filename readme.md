# laravel-vue-dschool

Это репозиторий сайта автошколы, переписанного на стек Laravel + Vue.

Первая версия была написана на CodeIgniter, а вторая - на Yii2 (см. https://github.com/maximalist777/yii2-driving-school). 
Сайт переписывается раз в два года. В качестве серверного стека используется LEMP. Хостинг dev сервера - droplet на DigitalOcean, cdn - Сloudlfare.

Публичная часть сайта доступна по ссылке https://voenmeh-avtoshkola.ru.
Админка https://voenmeh-avtoshkola.ru/dashboard.

Сайт все еще находится в стадии разработки и тестирования.

## Развертка (Deploy)

### Установка php 7
```
sudo apt-get update
sudo apt -y install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt -y install php7.1
sudo apt-get install -y php7.1-cli php7.1-json php7.1-common php7.1-mysql php7.1-zip php7.1-gd php7.1-mbstring php7.1-curl php7.1-xml php7.1-bcmath php7.1-pgsql
```

### Установка node нужной версии 
```
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/install.sh"

nvm install 11.15.0
```

### Установка yarn
```
npm install --global yarn
```

### Установка зависимостей для node-gyp
```
sudo apt install python2 make g++
```

### Установка composer
```
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
sudo composer self-update --1
```

## Установка и настройка СУБД

```
sudo apt install postgresql

sudo -i -u postgres
psql
CREATE USER dschool WITH PASSWORD 'easypass';
create database dschool with owner dschool;

```

```
\l - list all databases
\c dbname - switch connection to a new database dbname
\dt - list all tables

```

### Установка логина по паролю в PostgreSQL
```
sudo vim /etc/postgresql/14/main/pg_hba.conf
# set
# local all all md5
```

### Импорт БД в PostgreSQL
```
psql -U dschool -W dschool < Jul_21.sql
```

### Насстройка ENV
```
DB_CONNECTION=pgsql
DB_HOST=127.0.0.1
DB_PORT=5432
DB_DATABASE=dschool
DB_USERNAME=dschool
DB_PASSWORD=easypass
```

### Запуск сервера и проверка
```
php artisan passport:install
php artisan serve
```

### Установка проекта

```
composer install
yarn install
php artisan migrate:fresh
php artisan db:seed
php artisan passport:install
```

## Разработка

### Компиляция JS, CSS
```
npm run watch
```





## Использование Redis для очередей уведомлений

### Установка Redis

Весь процесс отлично описан в [статье](https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-redis-on-ubuntu-18-04) от Mark Drake на DigitalOcean.

Здесь заметки для себя, пока проект не вышел в релиз.

Чтобы установить Redis на Ubunru 18.04 используйте следующие команды
```language-bash
sudo apt update
sudo apt install redis-server
```

Еще следует настроить Redis
```language-bash
sudo vim /etc/redis/redis.conf
```

Набираем ```/supervised``` и находим нужную строку, устанавливаем значение 
```
supervised systemd
```

Перезагрузка Redis
```language-bash
sudo systemctl restart redis.service
```


Статус Redis
```language-bash
sudo systemctl status redis
```

### Настройка Laravel приложения

Нам нужен ```.env``` файл в корне проекта.

```
QUEUE_DRIVER=redis
REDIS_HOST=127.0.0.1
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_DRIVER=smtp
MAIL_HOST=smtp.mailtrap.io
MAIL_PORT=2525
MAIL_USERNAME=user
MAIL_PASSWORD=password
MAIL_ENCRYPTION=null
```

### Установка драйвера

```
composer require predis/predis
```

### Установка и конфигурация Supervisor-а

```
sudo apt-get install supervisor
cd /etc/supervisor/conf.d
vim laravel-worker.conf
```
Посмотреть пример можно в корне проекта, который так и называется ```laravel-worker.conf```.

```
sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl start laravel-worker:*
```

Источник: https://medium.com/modulr/api-rest-with-laravel-5-6-175eea5db3e8
