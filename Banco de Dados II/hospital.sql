create table paciente (cpf int (20), primary key (cpf), nome varchar (60) not null, telefone int (20), plano_de_saude varchar (60) not null);
create table medicamento (codigo_medicamento int(15), primary key (codigo_medicamento), nome_medicamento varchar(60) not null, tipo varchar(20) not null);
create table medico (crm int(10), primary key (crm), nome varchar(60) not null, telefone int(20), email varchar(60) not null);
create table exame (codigo_exame int(20), primary key (codigo_exame), nome varchar(40) not null);
create table consulta (id_consulta int(10), primary key (id_consulta), data_consulta varchar(10) not null, tipo_consulta varchar(40) not null, cpf int(20) not null, crm int(10) not null, foreign key (cpf) references paciente (cpf), foreign key (crm) references medico (crm));
create table prescreve (id_consulta int(10) not null, codigo_medicamento int(15) not null, foreign key (id_consulta) references consulta (id_consulta), foreign key (codigo_medicamento) references medicamento (codigo_medicamento));
create table solicita (id_consulta int(10) not null, codigo_exame int(20) not null, resultado varchar(40) not null, obs varchar(60), foreign key (id_consulta) references consulta (id_consulta), foreign key (codigo_exame) references exame (codigo_exame));

insert into paciente values (123456789, 'Valter', 39475875, 'basico');
insert into medicamento values (4248524, 'dipirona', 'comprimido');
insert into medico values (678514, 'Vagner', 49725469, 'vagner@gmail.com');
insert into exame values (457, 'endocrino');
insert into consulta values (5896, '14/08/2012', 'endocrino', 123456789, 678514);
insert into prescreve values (5896, 4248524);
insert into solicita values (5896, 457, '...', '...');

show tables;

select*from paciente;
select*from medicamento;
select*from medico;
select*from exame;
select*from consulta;
select*from prescreve;
select*from solicita;

update medico set telefone = 49725469 where crm = 678514;