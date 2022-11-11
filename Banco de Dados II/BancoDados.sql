create table FUNC (numero_func int, primary key(numero_func), nome_func varchar(40) not null, cpf_func char(40) not null, data_admissao_func date not null, data_saida_func date, situacao_func char(1) not null, codigo_carg char(3) not null, salario_base_func decimal(7,2) not null);
show tables;
show create table dpto;
desc FUNC;
desc dpto;
desc aloc;
desc pgto;
desc carg;
create table dpto (codigo_dpto char(3), primary key(codigo_dpto), nome_dpto char(30) not null, numero_gerente smallint unsigned);
create table aloc (codigo_dpto char(3), numero_func smallint, primary key (codigo_dpto,numero_func));
create table pgto (ano_ref_pgto int unsigned, mes_ref_pgto int unsigned, numero_func smallint unsigned, sal_base_pgto decimal (7,2) unsigned not null, total_desc_pgto decimal (7,2) unsigned not null, total_horas_pgto decimal (3,0) unsigned not null, primary key (ano_ref_pgto, mes_ref_pgto,numero_func));
create table hist (numero_hist smallint, numero_func smallint, data_ini_hist timestamp not null, codigo_carg char(3) not null, salario_base_func decimal(7,2) not null, primary key (numero_hist,numero_func));
create table carg (codigo_carg char(3), primary key (codigo_carg), nome_carg char(35) not null, classe_carg char(1) not null, tipo_contrato_carg char(1) not null, salario_piso_carg decimal(7,2) not null, salario_teto_carg decimal(7,2) not null, ind_comissao_carg char(1) not null);
alter table carg
change salario_piso_carg salario_piso_carg decimal(7,2) unsigned not null,
change salario_teto_carg salario_teto_carg decimal(7,2) unsigned not null;
alter table hist
change numero_hist numero_hist smallint unsigned not null,
change numero_func numero_func smallint unsigned not null,
change salario_base_func salario_base_func decimal(7,2) unsigned not null;
alter table aloc
change numero_func numero_func smallint unsigned;
alter table dpto add constraint foreign key (numero_gerente) references func (numero_func);
alter table func 
modify salario_base_func decimal(7,2) unsigned not null;
alter table func add constraint foreign key (codigo_carg) references carg (codigo_carg);
alter table aloc add constraint foreign key (codigo_dpto) references dpto (codigo_dpto), add constraint foreign key (numero_func) references func (numero_func);
alter table hist add constraint foreign key (codigo_carg) references carg (codigo_carg), add constraint foreign key (numero_func) references func (numero_func);
alter table pgto add constraint foreign key (numero_func) references func (numero_func);