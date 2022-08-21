-- PAULO HENRIQUE SALING

-- QUESTÃO 01. 

-- CRIAR BANCO DE DADOS CONTROLE DE LIVROS 

create database Controle_livros;
use Controle_livros; 

create table editoras (
	editora_id int primary key auto_increment,
    nome varchar(300) not null,
    cnpj varchar(14) not null
);

create table livros (
	livro_id int primary key auto_increment,
	nome varchar(300) not null,
	paginas smallint not null,
	ISBN varchar(13) not null,
    editora_idfk int,
    constraint rel_livro_editora foreign key (editora_idfk) references editoras(editora_id)
);

create table autores (
	autor_id int primary key auto_increment,
    nome varchar(300) not null,
    sobrenome varchar(300) not null,
    cpf varchar(300) not null
);

create table categoria (
	categoria_id int primary key auto_increment,
    nome varchar(300) not null,
    descricao varchar(1000)
);

create table livro_autor (
	livro_idfk int,
    autores_idfk int,
    primary key(livro_idfk, autores_idfk),
    constraint rel_livro_autor_NN foreign key (livro_idfk) references livros(livro_id),
    constraint rel_autor_livro_NN foreign key (autores_idfk) references autores(autor_id)
);

create table livro_categoria (
	livro_idfk int,
    categoria_idfk int,
    primary key(livro_idfk, categoria_idfk),
    constraint rel_livro_categ_NN foreign key (livro_idfk) references livros(livro_id),
    constraint rel_categ_livro_NN foreign key (categoria_idfk) references categoria(categoria_id)
);

-- COMANDOS DML 

insert into editoras (nome, cnpj)
	values ("CIA das Letras","12635968000136"), ("Mesa de Madeira","85912003000163");
    
select * from editoras;

insert into categoria (nome, descricao)
	values ("Terror", "Aterrorizante, Cativante, Pânico, Mortes, Decaptacao"), 
		("Comedia Romântica", "Romance, Comedia, Piadas, Viagem, Conquista, Atrapalhadas");
    
select * from categoria;

insert into autores (nome, sobrenome, cpf)
	values ("Paulo","Coelho", "52369875312"),
		("Gabriel Garicia","Marques", "85245674596");

select * from autores;

insert into livros (nome, paginas, ISBN)
	values ("Veronica Decide Morrer", 150, "325671002548"),
		("100 Anos de Solidão", 330, "7800236574123");
        
select * from livros;

update editoras
	set cnpj = "78522006000125"
    where editora_id = 1;

select * from editoras;

update autores
	set sobrenome = "Saling"
	where autor_id = 1;

select * from autores;

update livros
	set nome = "Nuvem de Sangue"
    where livro_id = 1;

select * from livros;

update categoria
	set nome = "Cult"
    where categoria_id = 1;
    
select * from categoria;

delete from categoria
	where categoria_id = 2;

select * from categoria;

delete from livros
	where livro_id = 2;

select * from livros;

delete from autores
	where autor_id = 2;
    
delete from editoras
	where editora_id = 2;

select * from editoras;

insert into livro_autor
	values (1,1);
    
select * from livro_autor;

insert into livro_categoria
	values (1,1);
    
select * from livro_categoria;

-- QUESTÃO 02

-- CRIAR BANCO DE DADOS ESCOLA

create database escola_01;

use escola_01;

create table aula (
	aula_id int primary key auto_increment,
    data_hora datetime not null,
    descricao varchar(1000)
);

create table turma (
	turma_id int primary key auto_increment,
    codigo_turma varchar(20) unique,
    nome varchar(200)
);

create table alunos (
	aluno_id int primary key auto_increment,
    nome varchar(200) not null,
    sobrenome varchar(200) not null,
    cpf varchar(11) not null,
    aula_idfk int,
    turma_idfk int,
    constraint rel_aluno_aula foreign key (aula_idfk) references aula(aula_id),
    constraint rel_aluno_turma foreign key (turma_idfk) references turma(turma_id)
);

create table professor (
	professor_id int primary key auto_increment,
    nome varchar(200) not null,
    cpf varchar(11) not null,
    aula_idfk int,
    constraint rel_professor_aula foreign key (aula_idfk) references aula(aula_id)
);

create table professor_turma (
	professor_idfk int,
    turma_idfk int,
    primary key (professor_idfk, turma_idfk),
    constraint rel_professor_turma_NN foreign key (professor_idfk) references professor(professor_id),
    constraint rel_turma_professor_NN foreign key (turma_idfk) references turma(turma_id)
);

-- DESENVOLVER COMANDOS DML

insert into aula (data_hora,descricao)
	values ("2022-08-03 14:30:00", "Esta aula será no período da tarde na quarta-feira."),
    ("2022-08-04 15:30:00", "Esta aula iniciará na tarde de quinta-feira");

insert into alunos (nome, sobrenome, cpf)
	values ("Fulano A", "Epstein", "29347909012"),
	("Fulano B", "Kennedy", "67821348500"),
    ("Fulano C", "Washington", "18459236872");
    
insert into professor (nome, cpf)
	values ("Ciclano A", "49587194629"),
    ("Ciclano B","73845902611");
    
select * from professor;    
    
insert into turma (codigo_turma,nome)
	values ("001-TCV", "Turma Connect Vespertino - 01"),
    ("001-TADSN", "Turma Análise e Desenvolvimento de Sistemas Noturno - 01");
    
insert into professor_turma 
	values (1,2),
    (1,1),(2,1),(2,2);
    
update professor
	set aula_idfk = 1
    where professor_id = 2; 

update professor
	set aula_idfk = 1
    where professor_id = 1;    

select * from aula;

delete from aula
	where aula_id = 2;
    
select * from alunos;

delete from alunos
	where aluno_id = 3;
    
select * from professor;

insert into professor (nome,cpf)
	values ("Ciclano J","72983100274");
	
delete from professor
    where professor_id = 3;
    
select * from professor_turma;

delete from professor_turma
	where (professor_idfk,turma_idfk) = (1,2);
    
select*from turma;

insert into turma (codigo_turma, nome)
	values ("001-TCM","Turma Connect Matutino - 01"), ("002-TCM","Turma Connect Matutino - 02");

delete from turma
	where turma_id = 3;

delete from turma
	where turma_id = 4;
    
-- QUESTÃO 03

-- UTILIZAR O BANCO DE DADOS 'ESCOLA' DISPONIBILIZADO PELO PROFESSOR

CREATE DATABASE ESCOLA;

USE ESCOLA;

CREATE TABLE instrutores (
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	valor_hora INTEGER UNSIGNED NULL,
	certificados VARCHAR(255) NULL,
	PRIMARY KEY(id)
);

CREATE TABLE cursos (
	id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	requisito VARCHAR(255) NULL,
	carga_horaria SMALLINT UNSIGNED NULL,
	preco DOUBLE UNSIGNED NULL,
	PRIMARY KEY(id)
);
 
CREATE TABLE alunos (
	id INT NOT NULL AUTO_INCREMENT,
	cpf CHAR(11) NOT NULL,
	nome VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	fone CHAR(14) NOT NULL,
	data_nascimento DATE NULL,
	PRIMARY KEY(id)
);
 
CREATE TABLE turmas (
	id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	instrutores_id INT NOT NULL,
	cursos_id INTEGER UNSIGNED NOT NULL,
	data_inicio DATE NULL,
	data_final DATE NULL,
	carga_horaria SMALLINT UNSIGNED NULL,
	PRIMARY KEY(id),
	INDEX turmas_FKIndex1(cursos_id),
	INDEX turmas_FKIndex2(instrutores_id),
	CONSTRAINT CURSO_TURMA_FK FOREIGN KEY(cursos_id)
	REFERENCES cursos(id),
	CONSTRAINT INSTRUTOR_TURMA_FK FOREIGN KEY(instrutores_id)
	REFERENCES instrutores(id)
);
 
CREATE TABLE matriculas (
	id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	turmas_id INTEGER UNSIGNED NOT NULL,	
	alunos_id INT NOT NULL,
	data_matricula DATE NULL,
	PRIMARY KEY(id),
	CONSTRAINT ALUNO_MATRICULA_FK FOREIGN KEY(alunos_id)
	REFERENCES alunos(id),
	CONSTRAINT TURMA_MATRICULA_FK FOREIGN KEY(turmas_id)
	REFERENCES turmas(id)
);

-- ATIVIDADE 01) FAZER 5 'INSERT INTO' EM CADA TABELA DO BANCO DE DADOS;

select * from instrutores;

INSERT INTO instrutores (NOME, EMAIL, VALOR_HORA, CERTIFICADOS)
	VALUES ("Fulano A", "fulano_a@email.com", 2500, "educacao001"),
    ("Fulano B", "fulano_b@emial.com", 4200, "educacao001, educacao002, educacao003, educacao004"),
    ("Fulano C", "fulano_c@email.com", 2500, "educacao003"),
    ("Fulano D", "fulano_d@email.com", 3500, "educacao003, educacao005"),
    ("Fulano E", "fulano_e@email.com", 4500, "educacao001, educacao002, educacao003, educacao004, educacao004.1");
    
select * from alunos;

insert into alunos (cpf, nome, email, fone, data_nascimento)
	values ("92743012387","Ricochete","ricochete@email.com", "99999999999","2000-12-12"),
    ("78234782389","Brusque","brusque@email.com", "88888888888","2001-11-13"),
    ("12893721390","Lousecan","lousecan@email.com","77777777777","2002-10-13"),
    ("98023894239","Kisla","kisla@email.com","66666666666","2003-09-14"),
    ("89457238497","Miska","miska@email.com","55555555555","2004-08-15");

select * from cursos;

insert into cursos (nome,requisito,carga_horaria,preco)
	values ("connect","prova e analise de perfil",500,2000.00),
    ("ADS","vestibular",3000,2000.00),
    ("mecidina","vestibular",7000,10000.00),
    ("engenharia ambiental","vestibular",6000,2500.00),
    ("programação","prova",450,1500.00);
    
select * from turmas;

insert into turmas (instrutores_id,cursos_id,data_inicio,data_final,carga_horaria)
	values (1,1,"2022-04-05","2022-10-10",500),
    (1,2,"2022-01-02","2024-03-10",3000),
    (3,2,"2022-01-03","2028-03-15",7000),
    (2,3,"2020-08-23","2025-08-23",6000),
    (5,5,"2023-07-31","2027-03-29",450);

select * from matriculas;

insert into matriculas (turmas_id,alunos_id)
	values (1,1),(1,2),(1,3),(1,4),(1,5),(2,1),(2,2),(2,3),(2,4),(2,5);
    
-- ATIVIDADE 02) FAZER UM 'UPDATE' NA TABEALA INSTRUTORES, ALTERANDO O NOME DE UM DOS INSTRUTORES (FILTRAR PELO ID DO INSTRUTOR);    

select * from instrutores;

update instrutores
	set nome = "Fulano Alterado"
	where id = 3;
    
select * from instrutores;

-- ATIVIDADE 03) FAZER UM 'UPDATE' NA TABEALA INSTRUTORES, ALTERANDO O EMAIL DE UM DOS INSTRUTORES (FILTRAR PELO NOME DO INSTRUTOR); 

update instrutores
	set email = "fulano_alterado@email.com"
	where nome = "Fulano Alterado";

select * from instrutores;

-- ATIVIDADE 04) FAZER DOIS 'UPDATE' NA TABEALA CURSOS, SEGUINDO A MESMA LÓGICA DAS ATIVIDADES 2 E 3;

select * from cursos;

update cursos
	set nome = "Banco de Dados - 01"
    where id = 3;

select * from cursos;

update cursos
	set carga_horaria = 3500
	where nome = "Banco de Dados - 01";

-- ATIVIDADE 05) FAZER DOIS 'UPDATE' NA TABEALA TURMAS TROCANDO O INSTRUTOR DE DUAS TURMAS DIFERENTES;

select * from turmas;

update turmas
	set instrutores_id = 4
	where id = 1;

select * from turmas;

update turmas
	set instrutores_id = 3
    where id = 5;
    
select * from turmas;

-- ATIVIDADE 06) FAZER DOIS 'DELETE' POR TABELA DO BANCO DE DADOS;

select * from matriculas;

select * from alunos;

desc alunos;

insert into alunos (cpf,nome,email,fone,data_nascimento)
	values ("81273891235","Ciclano F","ciclano_f@email.com","44444444444","2005-07-16"),
    ("12903182930","Ciclano G","ciclano_g@email.com","33333333333","2006-06-17"),
    ("12893908468","Ciclano H","ciclano_h@email.com","22222222222","2007-05-18");

delete from alunos
	where id = 6;

delete from alunos
    where id = 7;

select * from alunos;

select * from cursos;

select * from turmas;

delete from cursos
	where id = 4;

update turmas
	set cursos_id = 3
    where id = 1;
    
delete from cursos
	where id = 1;

update turmas
	set instrutores_id = 2
    where id = 1;

select * from turmas;

select * from instrutores;

delete from instrutores
	where id = 4;

delete from instrutores
	where id = 5;

select * from instrutores;

select* from turmas;

select * from matriculas;

delete from turmas
	where id = 4;
    
delete from turmas
	where id = 5;

select * from turmas;

select * from matriculas;

delete from matriculas
	where id = 10;
    
delete from matriculas
	where id = 3;
    
select * from matriculas;

-- FIM DA LISTA 004.


  