# SonarQubeDotNetExample

## Como preparar ambiente:

1. **Em .\Docker, execute docker-compose up -d.**

   Este comando inicia os containers definidos no arquivo `docker-compose.yml` no modo detached (`-d`), ou seja, em segundo plano, sem bloquear o terminal atual.

   ```bash
   docker-compose up -d
   ```

2. **Dentro de FilmApi, execute o script Add Migration e digite InitialMigration ou execute os seguintes comandos:**

   ```bash
	# Adiciona uma nova migração chamada InitialMigration
	dotnet ef migrations add InitialMigration --project ..\Film.Infra --context Context

	# Aplica as migrações pendentes ao banco de dados
	dotnet ef database update
   ```
    Estes passos são cruciais para garantir que o banco de dados esteja configurado corretamente com as últimas alterações de modelo ou estrutura.

3. **No navegador, acesse localhost://9000 e faça login com admin e senha admin. Depois redefina a senha.**
   
    Isso abre a interface do aplicativo hospedado localmente na porta 9000 no seu navegador. Você deve usar as credenciais padrão (admin/admin) para fazer login. Após o         login   inicial, é recomendável redefinir a senha para aumentar a segurança do ambiente.

## Criando projeto Sonar:
1. **Na home, selecione Create Project.**
  No painel principal do Sonar, localize a opção "Create Project" para começar a configurar um novo projeto.

2. **Selecione Local Project.**
  Escolha a opção "Local Project" para criar um projeto que será analisado localmente.

3. **Em product key e display name, escreva SonarQubeDotNetExample.**
  Defina uma chave de produto (product key) e um nome de exibição (display name) para identificar seu projeto no SonarQube. Aqui, usamos "SonarQubeDotNetExample". Clice em     next

4. **Configurações Finais**
Selecione "Use the global setting" e clique em Create Project.

Após isso o projeto já vai estar criado no sonar, porem ainda precisamos criar a chave de autenticação.

## Gerando token de autenticação
1. **Selecione Locally e Clique em Generate**
Isso vai criar o token de acesso que precisa ser vinculado no projeto.

2. **Pege o token gerado e copie ele.**
Após criar o projeto no SonarQube, você receberá um token de acesso. Copie este token.

3. **Abra sonar.cmd no editor e cole o token em sonar.login.**
Localize o arquivo sonar.cmd no seu sistema de arquivos e abra-o em um editor de texto. Dentro do arquivo, encontre o local onde você deve inserir o token de acesso (sonar.login) e cole o token que você copiou anteriormente.

4. **Salve a alteração e execute sonar.cmd.**
Salve o arquivo após inserir o token e execute o arquivo sonar.cmd no seu terminal ou prompt de comando. Este script iniciará o processo de análise estática do código do seu projeto usando as configurações do SonarQube.

5. **Após o término da execução, atualize a aba do navegador e veja o resultado.**
Após a conclusão da análise no SonarQube, atualize a aba do navegador onde você acessou o SonarQube (localhost:9000 ou similar) para ver os resultados da análise estática do código do seu projeto.

