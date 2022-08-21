-- EXERCÍCIOS PARA PROVA BANCO DE DADOS - COMANDOS DDL

-- LISTA 001 

-- EXERCÍCIO 01 - BANCO DE DADOS ENTRE PEDIDOS, ITENS E CLIENTE. 
-- REQUISITOS: O CLIENTE PODE FAZER VÁRIOS PEDIDOS E OS PEDIDOS PODEM TER VÁRIOS ITENS.

create database loja;

use loja;

create table cliente (
	cliente_id int primary key auto_increment,
    nome varchar(200) not null,
    sobrenome varchar(200) not null
);

create table pedidos (
	pedidos_id int primary key auto_increment,
    código_pedido int unique,
    quantidade_itens smallint,
    valor_pedido float,
    cliente_idfk int,
    constraint rel_pedido_cliente foreign key (cliente_idfk) references cliente(cliente_id)
);

create table item (
	item_id int primary key auto_increment,
    nome varchar(200),
    descricao varchar(500),
    valor_item float unsigned,
    pedidos_idfk int,
    constraint rel_item_pedido foreign key (pedidos_idfk) references pedidos(pedidos_id)
);

alter table pedidos change valor_pedido valor_pedido float unsigned; 
alter table pedidos change valor_pedido valor_pdd float unsigned;
alter table item add marca varchar(200);
alter table cliente add rua varchar(200);
alter table cliente add numero smallint, add bairro varchar(200), add cidade varchar(200), add estado varchar(200);

/* 	
	SINTAXE DO 'ALTER TABLE' É O COMANDO ('ALTER TABLE') SEGUINDO DA ENTIDADE A SER ALTERADA, 
FEITO ISSO, O COMANDO 'CHANGE' OU 'ADD' OU AINDA OUTRO COMANDO A SER ADICIONADO, DEPENDENDO 
DO QUE SE DESEJA REALIZAR NA ENTIDADE ESPECÍFICA.
	QUANDO UTILIZADO 'ADD', A SINTAXE SEGUE COM O NOME DO ATRIBUTO A SER ADICIONADO NA ENTIDADE
SEGUIDO DO 'DATATYPE' E DAS 'CONSTRAINTS' QUE SE DESEJA INCLUIR NA ENTIDADE.
	QUANDO APLICADO O 'CHANGE', DEVE-SE UTILIZAR UMA SEMÂNTICA SEMELHANTE AO 'ADD'. PORÉM, NESTE CASO,
O NOME DO ATRIBUTO DEVE SER REPETIDO DUAS VEZES, SEGUIDO DO 'DATATYPE' E DAS 'CONSTRAINTS'. COM O 'CHANGE'
AINDA, É POSSÍVEL MODIFICAR O NOME DO ATRIBUTO, INDICANDO PRIMEIRO O NOME ATUAL E, EM SEGUIDA, O NOVO NOME
DO ATRIBUTO, SEGUIDO PELO 'DATATYPE' E DAS 'CONSTRAINTS' CASO NECESSÁRIO.
	NAS DUAS SITUAÇÕES ('ADD' E 'CHANGE') É POSSÍVEL SEPARAR POR VÍRGULAS E ADICIONAR OU MODIFICAR MAIS ATRIBUTOS,
SEGUINDO A MESMA SINTAXE E SEMPRE DENTRO DE UMA MESMA ENTIDADE.
*/ 

desc pedidos;
describe item;

-- 'DESC' PODE SER SUBSTITUIDO POR 'DESCRIBE'.

-- EXERCÍCIO 02 - BANCO DE DADOS PARA CONTROLE DE LIVROS.
-- ENTIDADES: LIVRO, EDITORA, AUTOR, CATEGORIA.
/* 
	REQUISITOS:
		A) CADA LIVRO PODE PERTENCER A UMA ÚNICA EDITORA;
		B) CADA LIVRO PODE PERTENCER A UM ÚNICO AUTOR;
		C) LIVROS PODEM POSSUIR MAIS QUE UMA CATEGORIA;
*/

create database controle_livros;

use controle_livros;

create table autor (
	autor_id int primary key auto_increment,
    nome varchar(200) not null,
    sobrenome varchar(200) not null,
    cpf varchar(11) unique
);

alter table autor change cpf cpf varchar(11) unique not null;
desc autor;

create table editora (
	editora_id int primary key auto_increment,
    nome varchar(200) not null,
    cnpj varchar(14) unique not null,
    endereco varchar (500) not null
);

create table livro (
	livro_id int primary key auto_increment,
    titulo varchar(200) not null,
    descricao varchar(1000) not null,
    isbn varchar(21) unique not null,
    num_paginas smallint unsigned,
    autor_idfk int,
    editora_idfk int,
    constraint rel_livro_autor foreign key (autor_idfk) references autor(autor_id),
    constraint rel_livro_editora foreign key (editora_idfk) references editora(editora_id)
);

create table categoria (
	categoria_id int primary key auto_increment,
    nome varchar(200) not null,
    descricao varchar(1000)
);

create table livro_categoria (
	livro_idfk int,
    categoria_idfk int,
    primary key (livro_idfk,categoria_idfk),
    constraint rel_categ_livro_NN foreign key (livro_idfk) references livro(livro_id),
    constraint rel_livro_categ_NN foreign key (categoria_idfk) references categoria(categoria_id)
);

-- EXERCICIO 03 - BANCO DE DADOS PARA UMA INDUSTRIA.
-- ENTIDADES: PEÇAS, DEPÓSITOS, FORNECEDOR, PROJETO, FUNCIONÁRIO, DEPARTAMENTO.
/*
	REQUISITOS:
		A) CADA FUNCIONARIO PODE ESTAR ALOCADO A SOMENTE UM DEPARTAMENTO;
		B) CADA FUNCIONARIO PODE PERTENCER A MAIS DE UM PROJETO;
		C) UM PROJETO PODE UTILIZAR-SE DE VARIOS FORNECEDORES E DE VARIAS PECAS;
		D) UMA PECA PODE SER FORNECIDA POR VARIOS FORNECEDORES E ATENDER A VARIOS PROJETOS;
		E) UM FORNECEDOR PODE ATENDER A VARIOS PROJETOS E FORNECER VARIAS PECAS;
		F) UM DEPOSITO PODE CONTER VARIAS PECAS;
		G) DESEJA-SE TER UM CONTROLE DO MATERIAL UTILIZADO POR CADA PROJETO, IDENTIFICANDO INCLUSIVE
		O SEU FORNECEDOR. GRAVAR AS INFORMACOES DE DATA DE INICIO E HORAS TRABALHADAS NO PROJETO.

	ATRIBUTOS:
		A) PECAS: NUMERO, PESO E COR;
		B) DEPOSITO: NUMERO E ENDERECO;
		C) FORNECEDOR: NUMERO E ENDERECO;
		D) PROJETO: NUMERO E ORCAMENTO;
		E) FUNCIONARIO: NUMERO, SALARIO E TELEFONE;
		F) DEPARTAMENTO: NUMERO E SETOR.
*/

create database industria;

use industria;

create table deposito (
	deposito_id int primary key auto_increment,
    numero int unique not null,
    endereco varchar(500)
);

create table fornecedor (
	fornecedor_id int primary key auto_increment,
    numero int unique not null,
    endereco varchar(500)
);

create table departamento (
	dpto_id int primary key auto_increment,
    numero int unique not null,
    setor varchar(100)
);

create table projeto (
	projeto_id int primary key auto_increment,
    numero int unique not null,
    orcamento float unsigned not null
);

create table peca (
	peca_id int primary key auto_increment,
    numero int unique not null,
    peso float unsigned not null,
    cor varchar(20),
    deposito_idfk int,
    constraint rel_peca_deposito foreign key (deposito_idfk) references deposito(deposito_id)
);

create table funcionario (
	funcionario_id int primary key auto_increment,
    numero int unique not null,
    salario float unsigned not null,
    telefone varchar(20) not null,
    dpto_idfk int,
    constraint rel_funcionario_dpto foreign key (dpto_idfk) references departamento(dpto_id)
);

create table peca_fornecedor_NN (
	peca_idfk int,
    fornecedor_idfk int,
    primary key(peca_idfk,fornecedor_idfk),
    constraint rel_fornecedor_peca_NN foreign key (peca_idfk) references peca(peca_id),
    constraint rel_peca_fornecedor_NN foreign key (fornecedor_idfk) references fornecedor(fornecedor_id)
);

create table fornecedor_projeto_NN (
	fornecedor_idfk int,
    projeto_idfk int,
    primary key(fornecedor_idfk,projeto_idfk),
    constraint rel_projeto_fornecedor_NN foreign key (fornecedor_idfk) references fornecedor(fornecedor_id),
    constraint rel_fornecedor_projeto_NN foreign key (projeto_idfk) references projeto(projeto_id)
);

create table funcionario_projeto_NN (
	funcionario_idfk int,
    projeto_idfk int,
    primary key(funcionario_idfk,projeto_idfk),
    data_hora_inicio datetime,
    horas_trabalhadas time,
    constraint rel_projeto_funcionario_NN foreign key (funcionario_idfk) references funcionario(funcionario_id),
    constraint rel_funcionario_projeto_NN foreign key (projeto_idfk) references projeto(projeto_id)
);

create table projeto_peca_NN (
	projeto_idfk int,
    peca_idfk int,
    fornecedor_idfk int,
    primary key(projeto_idfk,peca_idfk,fornecedor_idfk),
    quantidade_peca smallint not null,
    constraint rel_projeto_peca_NN foreign key (peca_idfk) references peca(peca_id),
    constraint rel_peca_projeto_NN foreign key (projeto_idfk) references projeto(projeto_id),
    constraint rel_fornecedor_NN foreign key (fornecedor_idfk) references fornecedor(fornecedor_id)
);


-- EXERCÍCIO 04 - BANCO DE DADOS EDUCAÇÃO.
-- ENTIDADES: ESCOLA, TURMAS, PROFESSOR, SALA
/*
	REQUISITOS:
		A) UMA ESCOLA TEM VÁRIAS TURMAS;
        B) UMA TURMA TEM VÁRIOS PROFESSORES, SENDO QUE UM PROFESSOR PODE MINISTRAR AULAS EM MAIS DE
	UMA TURMA.
		C) UMA TURMA TEM SEMPRE AULAS NA MESMA SALA, MAS UMA SALA PODE ESTAR ASSOCIADA A VÁRIAS TURMAS
	COM HORÁRIOS DIFERENTES.
*/

create database educacao;

use educacao;

create table escola (
	escola_id int primary key auto_increment,
    nome varchar(200) not null unique,
    endereco varchar(1000) not null,
    cnpj varchar(14) not null unique
);

create table sala (
	sala_id int primary key auto_increment,
    numero smallint not null,
    localizacao varchar(1000)
);

create table professor (
	professor_id int primary key auto_increment,
    nome varchar(200) not null,
    sobrenome varchar(200) not null,
    cpf varchar(11) not null unique,
    endereco varchar(1000) not null
);

create table turma (
	turma_id int primary key auto_increment,
    nome varchar(200) not null,
    descicao varchar(1000) not null,
    escola_idfk int,
    sala_idfk int,
    constraint turma_escola foreign key (escola_idfk) references escola(escola_id),
    constraint turma_sala foreign key (sala_idfk) references sala(sala_id)
);

create table turma_professor_NN (
	turma_idfk int,
    professor_idfk int,
    primary key (turma_idfk, professor_idfk),
    constraint rel_professor_turma_NN foreign key (turma_idfk) references turma(turma_id),
    constraint rel_turma_professor_NN foreign key (professor_idfk) references professor(professor_id)
);

