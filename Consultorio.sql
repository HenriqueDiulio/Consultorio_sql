/*
Programador: Henrique Diulio
Data de inicio: 01/11/2022 as 13:44
Data de finalização: 02/11/2022 as 
*/
create database Consultorio;
use Consultorio;

/* Criacao da tabela consulta medico*/
create table Medico(
crm int not null,
nome_med varchar(90) not null,
primary key(crm));

/*Criacao da tabela paciente */
create table Paciente(
cpf int not null,
nome_pac varchar(90) not null,
ano_nasc int not null,
primary key(cpf)
);

/*Criacao da tabela consulta com chave estrangeira*/
create table consulta(
crm int not null,
cpf int not null,
data_cons date not null,
primary key(crm,cpf),
foreign key(crm) references Medico(crm),
foreign key(cpf) references Paciente(cpf)
);

/*Inserindo CMR, nome do medico na tabela medico */
insert into medico(crm, nome_med)
value(1010,"João");
insert into medico(crm, nome_med)
value(1020,"Nunes");
insert into medico(crm, nome_med)
value(1030,"Flavio");
insert into medico(crm, nome_med)
value(1040,"Gabriel");

/*Inserindo CPF, nome do paciente e ano de nascimento na tabela paciente*/
insert into paciente(cpf, nome_pac, ano_nasc)
value(003489423, "Toin da Silva", 1972);
insert into paciente(cpf, nome_pac, ano_nasc)
value(000117244, "Pedro Pereira", 1968);
insert into paciente(cpf, nome_pac, ano_nasc)
value(090372141, "Guilherme Souza", 2008);
insert into paciente(cpf, nome_pac, ano_nasc)
value(077172299, "Henrique Vitor", 2004);
insert into paciente(cpf, nome_pac, ano_nasc)
value(088111233, "Erick Douglas", 1994);

/*Inserindo CRM do medico, Cpf do paciente e a data da consulta na tabela de consulta*/
insert into consulta(crm, cpf, data_cons)
value(1010,003489423,"2022-11-01");
insert into consulta(crm, cpf, data_cons)
value(1020,000117244,"2023-01-10");
insert into consulta(crm, cpf, data_cons)
value(1030,090372141,"2022-11-14");
insert into consulta(crm, cpf, data_cons)
value(1040,077172299,"2023-03-27");
insert into consulta(crm, cpf, data_cons)
value(1010,088111233,"2022-12-06");

/*Listando o nome de todos os médicos da tabela medico */
select nome_med
from medico;

/*Listando o nome e o ano de nascimento dos paciêntes da tabela paciente que começam com a letra H */
select nome_pac, ano_nasc
from  paciente
where nome_pac like 'H%';

/* Listando todos os dados dos pacietes que nasceram em 1972 e 2004, ordenando em ordem alfabetica*/
select* 
from paciente
where ano_nasc between 1972 and 2004
order by nome_pac desc;

/*Inserindo campo sexo na tabela paciente*/
alter table paciente add sexo enum('F','M');

/* Inserindo mais um paciente na tabela paciente */
update paciente
set nome_pac = "Josiane Lannes"
where cpf = 20933403;

/*Listando o nome dos medicos e seus respectivos pacientes*/
select medico.nome_med, paciente.nome_pac
from medico join consulta
on medico.crm = consulta.crm
join paciente
on consulta.cpf = paciente.cpf;



