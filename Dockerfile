FROM ruby:2.5.1-slim
# Instala as nossas dependências  
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
  build-essential libpq-dev
# Seta nosso path
ENV INSTALL_PATH /onebitbot
# Cria nosso diretório
RUN mkdir -p $INSTALL_PATH
# Seta o nosso path como o diretório principal
WORKDIR $INSTALL_PATH
# Copia a nossa Gemfile para dentro do container
COPY Gemfile ./
# Instala as Gems
RUN bundle install
# Copia nosso código para dentro do container
COPY . .
# Roda nosso servidor
CMD rackup config.ru -o 0.0.0.0
