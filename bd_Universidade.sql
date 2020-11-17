create database universidade;

drop database universidade;

use universidade; 

create table aluno(
mat int primary key,
nome varchar not null,
endereco int not null,
cidade int not null
);

create table disciplinas(
cod_disc smallint primary key, 
nome_disc int not null,
carga_hor int not null
);

create table professores(
cod_prof smallint primary key not null, 
nome int not null,
endereco int not null,
cidade int not null
);

create table turma(
cod_turma smallint, 
cod_disc smallint,
cod_prof smallint,
ano smallint,
horario int not null,
constraint pk_turma primary key (cod_turma,cod_disc,cod_prof,ano),
constraint fk_turmadisc foreign key (cod_disc) references disciplinas(cod_disc),
constraint fk_turmaprof foreign key (cod_prof) references professores(cod_prof)
);


create table historico(
mat int,
cod_turma smallint, 
cod_disc smallint,
cod_prof smallint,
ano smallint,
frequencia int not null,
nota int not null,
constraint pk_historico primary key (mat,cod_turma,cod_disc,cod_prof,ano),
constraint fk_histaluno foreign key (mat) references aluno(mat),
constraint fk_hist foreign key (cod_turma,cod_disc,cod_prof,ano) references turma(cod_turma,cod_disc,cod_prof,ano)
);

insert into aluno values(2015010101, 'Jose de Alencar', 'Rua das Almas', 'Natal'),
(2015010102, 'João José', 'Avenida Ruy Carneiro', 'João Pessoa'),
(2015010103, 'Maria Joaquina', 'Rua Carrossel', 'Recife'),
(2015010104, 'Maria das Dores', 'Rua das Ladeiras', 'Fortaleza'),
(2015010105, 'Josué Claudino dos Santos', 'Centro', 'Natal'),
(2015010106, 'Josuélisson Claudino dos Santos', 'Centro', 'Natal');

insert into disciplinas values('BD', 'Banco de Dados', 100),
('POO', 'Programação com Acesso a Banco de Dados', 100),
('WEB', 'Autoria WEB', 50),
('ENG', 'Engenharia de Software', 80);

insert into professores values(212131, 'Nickerson Ferreira', 'Rria Manaíra', 'João Pessoa'),
(122135, 'Adorilson Bezerra', 'Avenida Salgado Filho', 'Natal'),
(192011, 'Diego Oliveira', 'Avenida Roberto Freire', 'Natal');

insert into turma values('BD', 1, 212131, 2015, '11H-12H'),
('BD', 2, 212131, 2015, '13H-14H'),
('POO', 1, 192011, 2015, '08H-09H'),
('WEB', 1, 192011, 2015, '07H-08H'),
('ENG', 1, 122135, 2015, '10H-11H');

