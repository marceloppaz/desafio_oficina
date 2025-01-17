
# Projeto Lógico de Banco de Dados - Oficina Mecânica

Este projeto consiste na modelagem e implementação de um banco de dados lógico para um cenário de oficina mecânica, atendendo aos requisitos de negócios comuns nesse tipo de aplicação.

## Contexto do Projeto

O banco de dados foi projetado para gerenciar as informações de um sistema de oficina mecânica, incluindo:
- Cadastro de clientes Pessoa Física (PF) e Pessoa Jurídica (PJ), garantindo que cada cliente pertença exclusivamente a um desses tipos.
- Registro de veículos associados a clientes.
- Controle de ordens de serviço com status, descrição e valor estimado.
- Relacionamento entre ordens de serviço, funcionários, e serviços realizados.
- Registro de funcionários e das horas trabalhadas em cada ordem de serviço.

## Funcionalidades Implementadas

O script SQL disponibilizado implementa:
- **Criação do Esquema de Banco de Dados:**
  - Definição de tabelas com suas respectivas chaves primárias e estrangeiras.
  - Aplicação de constraints para garantir a integridade dos dados.
- **Persistência de Dados:**
  - Inserção de dados fictícios para validação de testes.
- **Consultas SQL Complexas:**
  - Recuperação de dados utilizando `SELECT`.
  - Filtros com `WHERE` e agrupamentos com `HAVING`.
  - Ordenação dos resultados com `ORDER BY`.
  - Junções entre tabelas para fornecer insights mais complexos.

## Perguntas Respondidas pelo Banco de Dados

Com este banco de dados, é possível responder a perguntas como:
- Quais veículos estão associados a cada cliente?
- Quantos serviços foram realizados em cada ordem de serviço?
- Qual o total estimado para uma ordem de serviço específica?
- Quais funcionários trabalharam em uma determinada ordem de serviço e por quanto tempo?

## Como Utilizar

1. Clone este repositório:
   ```bash
   git clone <url-do-repositorio>
   ```
2. Execute o script SQL para criar o banco de dados e inserir os dados:
   ```sql
   source oficina_mecanica.sql;
   ```
3. Use ferramentas como MySQL Workbench ou outro cliente de banco de dados para executar consultas e explorar os dados.

## Arquivo Disponível

- **`oficina_mecanica.sql`**: Contém o esquema completo do banco de dados, incluindo criação de tabelas, inserção de dados fictícios e exemplos de consultas.

## Tecnologias Utilizadas

- **Banco de Dados:** MySQL
- **Linguagem SQL**
- **Modelagem:** Modelo Entidade-Relacionamento Estendido (EER)

## Licença

Este projeto é aberto e pode ser utilizado para fins educacionais ou como referência para a criação de bancos de dados. Contribuições são bem-vindas!
