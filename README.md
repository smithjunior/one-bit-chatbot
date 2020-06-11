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
