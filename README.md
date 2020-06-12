# One Bit Chatbot 

## Funcoes Chatbot

- [ ] Listagem de perguntas e respostas
- [ ] Inclusão de novas questões
- [ ] Remocão de questão
- [ ] Pesquisa de perguntas e respostas
- [ ] Pesquisa de perguntas e respostas por hashtags
- [ ] Listagem de comandos disponíveis

## Tecnologias

* Sinatra 
* Postgresql
* Dialogflow
* Docker 
* Docker Compose
* Telegram

## Database

Tab -> faq
Col -> id integer PK
Col -> question string
Col -> answer string

Tab -> faq_hashtag
Col -> id Integer PK
Col -> faq_id Integer FK
Col -> hashtag_id Integer FK

Tab -> hashtag
Col -> id Integer PK
Col -> name string

# Configuration

## Install locally

```bash
$ bundle install
```

## running locally

```bash
$ rackup config.ru -o 0.0.0.0
```

## Docker commands

### Build and Running

```bash
$ docker-compose up --build
```

### create database

```bash
$ docker-compose run --rm web rake db:create
$ docker-compose run --rm web rake db:migrate
```

### Running testing

```bash
$ docker-compose run --rm web rspec -fd
```

### Access console

```bash
$ docker-compose run --rm web tux
```

#### creating migration example

* ex:

```bash
$ docker-compose run --rm web rake db:create_migration NAME=create_faqs
$ docker-compose run --rm web rake db:create_migration NAME=create_hashtags
$ docker-compose run --rm web rake db:create_migration NAME=create_faq_hashtags
```
