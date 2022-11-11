create table carg (codigo_carg char(3) primary key, nome_carg char(35) not null, classe_carg char(1) not null, tipo_contrato_carg char(1) not null, salario_piso_carg decimal(7,2) unsigned not null, salario_teto_carg decimal(7,2) unsigned not null, ind_comissao_carg char(1) not null);

create table func (numero_func smallint unsigned primary key, nome_func varchar(40) not null, cpf_func char(11) not null, data_admissao_func date not null, data_saida_func date, situacao_func char(1) not null, codigo_carg char(3) not null, salario_base_pgto decimal(7,2) unsigned not null, foreign key (codigo_carg) references carg (codigo_carg));

create table dpto (codigo_dpto char(3) primary key, nome_dpto char(30) not null, numero_gerente smallint unsigned, foreign key (numero_gerente) references func (numero_func));

create table hist (numero_hist smallint unsigned, numero_func smallint unsigned not null, data_ini_hist date not null, codigo_carg char(3) not null, salario_base_pgto decimal(7,2) unsigned not null, primary key (numero_hist, numero_func), foreign key (codigo_carg) references carg (codigo_carg), foreign key (numero_func) references func (numero_func));

create table pgto (numero_func smallint unsigned, ano_ref_pgto int unsigned, mes_ref_pgto int unsigned, sal_base_pgto decimal(7,2) unsigned not null, total_desc_pgto decimal(7,2) unsigned not null, total_horas_pgto decimal(3,0) unsigned  not null, primary key (numero_func, ano_ref_pgto, mes_ref_pgto), foreign key (numero_func) references func (numero_func));

create table aloc (codigo_dpto char(3), numero_func smallint unsigned, primary key (codigo_dpto, numero_func), foreign key (codigo_dpto) references dpto (codigo_dpto), foreign key (numero_func) references func (numero_func));


insert into carg values('DBA', 'DBA', 'G', 'M', 10000, 20000, 'N');
insert into carg values('PGM', 'Programador', 'T', 'M', 2000, 8000, 'N');
insert into carg values('OPE', 'Operador', 'P', 'M', 2000, 20000, 'N');

insert into func values (1, 'Mario', '123', '2022-01-02', null, 'A', 'PGM', 8000);

select*from func;
select codigo_carg Codigo, nome_carg Nome from carg;