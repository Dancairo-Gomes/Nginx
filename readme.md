# Nginx Terraform
> O que é NginxTerraform

Essa documentação mostra como levantar uma infraestrutura de um Nginx server


<br/>

## Criando nova stack com terraform

> 1. Inicializando o terraform

```sh
terraform init
```

Para esse comando de inicialização funcionar, você precisa ter configurado as credencias aws `~/.aws/credentials`. Ex:

```sh
[default]
aws_access_key_id=AKIAIOSFODNN7EXAMPLE
aws_secret_access_key=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
```

> 2. Configurando variáveis do terraform

Você precisa informar para o terraform qual é o nome da sua aplicação. Esse nome deve ser o mesmo nome do repositório git.

Você precisa alterar o nome default `Nginx` para o nome da sua apliação, fazendo isso nesse arquivo [variables.tf](/variables.tf).


> 3. Criando os recursos AWS com o terraform

```sh
terraform apply
```

> 4. Esse script vai criar:
- 1 AWS AMI da aplicação;
- 1 AWS SecurityGroup da aplicação;
- 1 AWS S3 da aplicação;

<br/>

## Removendo stack com terraform

> 1. Removendo os recursos AWS com o terraform

```
terraform destroy
```

> 2. Esse script vai remover:
- 1 AWS AMI da aplicação;
- 1 AWS SecurityGroup da aplicação;
- 1 AWS s3 da aplicação;

## Movendo logs para s3

> 1. Acessar maquina via SSH

> 2. Configurar s3cmd

```
s3cmd --configure
```

> 2. Mover arquivos de log para o bucket criado

- 1. 

```
s3cmd --configure
```
- 2. 

```
s3cmd put /var/log/nginx/access.log s3://my-bucket-nginx-logs
s3cmd put /var/log/nginx/error.log s3://my-bucket-nginx-logs

```
