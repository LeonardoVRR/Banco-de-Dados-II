create table estado (idEstado char(2), primary key (idEstado), nome varchar(45));

create table Editora (idEditora smallint(6) unsigned, nome varchar(60) not null, logradouro varchar(80), numero smallint(6) unsigned, complemento varchar(60), bairro varchar(60), cidade varchar(60), cep char(8), UF char(2), primary key (idEditora), foreign key (UF) references estado (idEstado));

create table Idioma (idIdioma char(2), descricao varchar(40), primary key (idIdioma));

create table Livro (idLivro smallint(6) unsigned, nome varchar(120) not null, codISBN varchar(13), numEdicao tinyint(4) unsigned, nomesAutores varchar(80), anoEdicao year, idioma char(2) not null, codEditora smallint(6) unsigned, primary key (idLivro), foreign key (idioma) references Idioma (idIdioma), foreign key (codEditora) references editora (idEditora));