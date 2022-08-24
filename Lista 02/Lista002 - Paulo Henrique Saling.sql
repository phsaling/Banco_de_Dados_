-- Nome: Paulo Henrique Saling

-- Questão 01;

create database lista002;

use lista002; 

-- Questão 02;

create table alunos (
	aluno_id int primary key auto_increment,
	nome varchar(50),
	telefone varchar(50),
    cidade varchar(50)
); 

-- Questão 03;

desc alunos;

-- Questão 04;

create table alunos2 (
	alunos2_id int primary key auto_increment,
    nome varchar(200),
    telefone varchar(50),
	cidade varchar(100)
	);
    
desc alunos2;
    
-- Questão 05;

create table funcionarios (
	funcionarios_id int primary key auto_increment,
    nome varchar(100),
	endereco varchar(500),
	telefone varchar(50),
    cidade varchar(50),
    estado varchar(50),
    cep int,
    rg varchar(12),
    cpf char(11),
    salario double
); 

desc funcionarios;

-- Questão 06;

create table fornecedores (
	fornecedores_id int primary key auto_increment,
    nome varchar(100),
	endereco varchar(500),
	telefone varchar(50),
    cidade varchar(50),
    estado varchar(50),
    cep int,
    cnpj varchar(20),
    email varchar(200)
);  

desc fornecedores;

-- Questão 07;

create table livros (
	livros_id int primary key auto_increment,
    nome varchar(200),
    categoria varchar(200),
    resumo varchar(1000),
    preco_custo float,
    preco_venda float
); 

desc livros;

-- Questão 08;

desc alunos;
desc alunos2;
desc funcionarios;
desc fornecedores;
desc livros;

-- Questão 09; 

create table estoque (
	estoque_id int primary key auto_increment,
    nome_do_produto varchar(300),
    categoria varchar(100),
    quantidade int,
    fornecedor varchar(50)
);

desc estoque;

-- Questão 10;

create table notas (
	notas_id int primary key auto_increment,
	nome_do_aluno varchar(150),
    bimestre int
); 

desc notas;

-- Questão 11;

create table caixa (
	caixa_id int primary key auto_increment,
    _data varchar(10),
    descricao varchar(300),
    debito float,
    credito float
);

desc caixa; 

create table contas_a_pagar (
	contas_pagar_id int primary key auto_increment,
    data_conta varchar(10),
    descricao varchar(300),
    valor float,
    data_pagamento varchar(10)
    ); 
    
desc contas_a_pagar;

-- Questão 12

create table contas_a_receber (
	contas_receber_id int primary key auto_increment,
    data_conta varchar(10),
    descricao varchar(300),
    valor float,
    data_recebimento varchar(10)
    );
    
desc contas_a_receber;

-- Questão 13

create table filmes (
	filmes_id int primary key auto_increment,
    nome varchar(50),
    sinopse varchar(500),
    categoria varchar(50),
    diretor varchar(50)
    );

desc filmes;

-- Questão 14

create table CDs (
	CDs_id int primary key auto_increment,
    nome varchar(50),
    cantor varchar(50),
    ano int,
    quantidade_musicas int
    );
    
desc CDs;

-- Questão 15

drop table alunos;

-- Questão 16

desc alunos;

-- Questão 17

drop table livros;
   
-- Questão 18

drop table contas_a_pagar;

-- Questão 19

drop table contas_a_receber;

-- Questão 20

drop table filmes;

-- Questão 21

desc filmes;
desc  CDs;
desc caixa;

-- Questão 22

alter table caixa rename to caixa_supermercado;

-- Questão 23 

desc caixa_supermercado;

-- Quatão 24

alter table estoque rename to produtos;

-- Questão 25

alter table notas rename to aprovados;

-- Questão 26

alter table aprovados rename to notas;

-- Questão 27

create table dinheiro (
	dinheiro_id int primary key auto_increment
    );

drop table dinheiro;

-- Questão 28

drop table notas;

-- Questão 29

alter table caixa_supermercado rename to caixa;

-- Questão 30

alter table caixa rename to mercadinho;

-- Questão 31

alter table alunos2 rename to estudantes;

-- Questão 32

desc alunos2;
desc estudantes;

-- Questão 33

alter table estudantes rename to super_estudantes;
drop table super_estudantes;

-- Questão 34

desc super_estudantes;
desc alunos;
desc alunos2;

-- Questão 35

create table alunos (
	alunos_id int primary key auto_increment,
    nome varchar(50)
    );

alter table alunos add estado varchar(50);

-- Questão 36

  create table caixa (
	caixa_id int primary key auto_increment,
    _data varchar(10),
    descricao varchar(300),
    debito float,
    credito float
);

-- Questão 37

alter table caixa add observacao varchar(300);

-- Questão 38

alter table alunos add cpf varchar(11);

-- Questão 39

desc caixa;

-- Questão 40

alter table caixa add saldo float;

    