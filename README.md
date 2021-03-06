# One Bit Chatbot 

## Funcoes Chatbot

- [x] Listagem de perguntas e respostas
- [x] Inclusão de novas questões
- [x] Remocão de questão
- [x] Pesquisa de perguntas e respostas
- [x] Pesquisa de perguntas e respostas por hashtags
- [x] Listagem de comandos disponíveis

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
### Testing webhook

```curl
curl -X POST http://localhost:9292/webhook -H "Content-type: application/json" -d '{"queryResult": {"contexts": [{"parameters": {"question": "ques", "answer": "answ1", "hashtags": "php, js"}}],"action": "create"}}'

{"payload":{"telegram":{"text":"Criado com sucesso","parse_mode":"Markdown"}}}
```
