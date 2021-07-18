## :car: Volanty

> **Motivação** :thought_balloon: <br>
> Criar uma aplicação para acessar os <em>endpoints</em> fornecidos.

## :bookmark_tabs: Introdução

> Centro de Atendimento Volanty (CAV) para agendamento de visitas de 
> inspeção de veículo.

#### APIs
> :mag_right: `/api-docs` API Rswag cria ferramentas
> [Swagger](https://swagger.io/) para APIs Rails, gera a descrição de
> todos os <em>endpoints</em> da documentação de API, incluindo uma IU para
> explorar e testar operações, diretamente de seus testes de integração.

### Tecnologias usadas no projeto:

- Linguagem: [Ruby](https://github.com/ruby/ruby/releases/tag/v2_7_1)
- Modelo Objeto Relacional: [ RoR ](https://guides.rubyonrails.org/getting_started.html)
- Banco de Dados: [ PostgresSQL ](https://www.postgresql.org/)

## :computer: Desenvolvimento :tea:

Este é um projeto que não precisa instalar bibliotecas de Ruby localmente ao
invés disso é possível rodar tudo nos conteiners, então faça as instalações do
`docker` e `docker-compose`, além disso, é uma boa prática não instalar
dependências do projeto em seu próprio sistema operacional. A aplicação contem
os seguintes containers descritas no `docker-compose.yml`:

* `app` a <em>app</em> no qual será realizado busca e agendamento.
* `db`  um container com o banco de dados PostgresSQL.

### Pré-requisitos:
 
 - Ter o [Docker](https://www.docker.com/) instalado;
 - Ter um editor ou uma IDE de sua preferência configurado, nós sugerimos as
   seguintes ferramentas:

   * [ RubyMine ](https://www.jetbrains.com/help/ruby/installation-guide.html)
   * [ VIM ](https://github.com/skwp/dotfiles)
   * [ VSCode ](https://code.visualstudio.com/)

### Instalação de docker e docker-compose:

* Se você não tem o `docker` instalado, [pode seguir este
 tutorial](https://docs.docker.com/get-docker/);

* Se você não tem o `docker-compose` instalado, [pode seguir este
tutorial](https://docs.docker.com/compose/install/).

### Segurança

Uma das grandes vantagens do uso do `docker` é a criação de imagens a partir de
uma já existente, portanto, é preciso ter cautela na utilização delas
porque muitas destas imagens podem estar mal configuradas, ou pior, podem conter
<em>malwares</em>, para mitigar essa possibilidade é indispensável o uso de
imagens autênticas disponibilizadas diretamente do [Docker
Hub](https://hub.docker.com/).

Para garantir isso, o uso do recurso [Docker Content
Trust](https://docs.docker.com/engine/security/trust/), ele é responsável por
validar as imagens, reconhecendo a sua autenticidade, portanto, é crucial que
ele seja habilitado, para isso, você precisa exportá-la para o seu profile no seu terminal
(.bashrc, .zshrc, entre outros), ou seja, via `export` no seu shell favorito:

```shell
export DOCKER_CONTENT_TRUST=1
```

> :notebook_with_decorative_cover: **NOTE**: Se imagem não for assinada você
> receberá a mensagem <em>(...) remote trust data not exist (...)</em>.

### Variáveis de ambiente
O sistema está preparado para carregar um `.env` ou ter as variáveis previamente
exportadas para o ambiente em que está sendo executado.

```shell
$ cp .env.development .env # (Desenvolvimento)
```

```shell
$ cp .env.test .env # (Teste)
```

### Construindo os containers

```shell
$ docker-compose build
```

> :warning: **WARNING**: Se você estiver executando o Docker no Linux, os
> arquivos recém-criados pertencem ao root, portanto, altere a propriedade dos
> novos arquivos com o seguinte comando `sudo chown -R $USER:$USER .`

### Subindo os containers em <em>background</em>

Após o termino das instalações acima, então você terá os containers instalado,
agora basta rodar o seguinte comando:

```shell
$ docker-compose up -d
```

Se for a primeira vez que você executa esse comando, os serviços listados no
`docker-compose.yml` levaram um tempo para serem construídos, porém nas
próximas vezes que você executar o mesmo comando ele irá subir na hora os
containers.

Pode ir tomar um café ou alguma bebida de sua preferência pois isso vai levar
um tempo para terminar.

> :warning: **WARNING**: Terminando a execução deste commando, ambiente de
> desenvolvimento estará pronto.

### Acesso aos <em>logs</em>

Para visualizar as últimas linhas do <em>log</em> do container `app`:

```shell
$ docker-compose logs -f --tail=100 app
```

### Parar os <em>containers</em> e remover <em>containers</em>, <em>networks</em>, <em>volumes</em> e <em>imagens</em>

```shell
$ docker-compose down
```

### Testes

Caso queira executar os testes na aplicação, basta referenciar o <em>path</em>
do <em>spec(tion)</em> desejado:

```shell
$ docker-compose run -e "RAILS_ENV=test" api rspec spec --format documentation
```

### Debug

Se você quiser utilizar ferramentas (gem) como o `pry`
ou `byebug` basta adicionar em uma linha abaixo do arquivo de teste que 
você deseja debugar.

Por exemplo:

```ruby
# /spec/path/test_spec.rb
require 'pry'

class A
  def hello() puts "hello world!" end
end

a = A.new

# start a REPL session
binding.pry

# program resumes here (after pry session)
puts "program resumes here."
```

Sessão Pry:

```ruby
pry(main)> a.hello
hello world!
=> nil
pry(main)> def a.goodbye
pry(main)*   puts "goodbye cruel world!"
pry(main)* end
=> nil
pry(main)> a.goodbye
goodbye cruel world!
=> nil
pry(main)> exit

program resumes here.
```

### Atualizações e Instalações das dependências:

- Executando fora do container:

```shell
$ docker-compose exec app bundle update
```

```shell
$ docker-compose exec app bundle install
```

> :notebook_with_decorative_cover: **NOTE**: Para desenvolvimento local usando o
> `docker` e `docker-compose` isso é tudo. :slightly_smiling_face: :tada:
