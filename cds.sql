create database db_cds;
use db_cds;

create table Artista(
pk_id_art int primary key auto_increment,
nome_art varchar(100)
);
select*from Artista;
drop table Artista;

create table Gravadora(
cod_grav int primary key auto_increment,
nome_grav varchar(50)
);
select*from Gravadora;

create table Categoria(
cod_cat int primary key auto_increment,
nome_cat varchar(50)
);
select*from Categoria;

create table Estado(
sigla_est char(2) primary key,
nome_est char(50) 
);
select*from Estado;

create table Cidade(
cod_cid int primary key auto_increment,
nome_cid varchar(100)
);

create table Cliente(
cod_cli int primary key auto_increment,
nome_cli varchar(100),
end_cli varchar(200),
renda_cli decimal(10,2),
sexo_cli char(1)
);

create table Conjuge(
nome_conj varchar(100),
renda_conj decimal(10,2),
sexo_conj char(1)
);

create table Funcionario(
cod_func int primary key auto_increment,
nome_func varchar(100),
end_func varchar(200),
sal_func decimal(10,2),
sexo_func char(1)
);

create table Dependentes(
cod_dep int primary key auto_increment,
nome_dep varchar(100),
sexo_dep char(1)
);

create table titulo(
	pk_id_tit int auto_increment not null primary key,
    pk_id_cat int not null,
    pk_id_grav int not null,
    nome_cd varchar(100) not null,
    val_cd decimal(10,2) not null,
    qtd_estq int not null
);

create table Pedido(
	pk_id_ped int auto_increment not null primary key,
    pk_id_cli int not null,
    pk_id_func int not null,
    data_ped datetime not null,
    val_ped decimal(10,2) not null
);

CREATE TABLE titulo_pedido (
    pk_id_ped INT,
    pk_id_tit INT,
    PRIMARY KEY (pk_id_ped, pk_id_tit),
    qtd_cd int not null,
    val_cd Decimal(10,2) not null
);

create table tb_titulo_artista(
	pk_id_tit int not null,
    pk_id_art int not null, 
    primary key(pk_id_tit, pk_id_art)
);

alter table tb_titulo_artista
add constraint pk_fk_id_tit_titulo_artista
foreign key (pk_id_tit) references titulo(pk_id_tit);

alter table tb_titulo_artista
add constraint pk_fk_id_art_titulo_artista
foreign key (pk_id_art) references Artista(pk_id_art);

alter table titulo_pedido
add constraint fk_id_ped_titulo_pedido
foreign key (pk_id_ped) references Pedido(pk_id_ped);

alter table titulo_pedido
add constraint fk_id_tit_titulo_pedido
foreign key (pk_id_tit) references titulo(pk_id_tit);

alter table Pedido
add constraint fk_id_cli
foreign key (pk_id_cli) references Cliente(pk_id_cli);

alter table Pedido
add constraint fk_id_func
foreign key (pk_id_func) references Funcionario(pk_id_func);

alter table tb_titulo
add constraint fk_pk_id_cat
foreign key (pk_id_cat) references categoria(pk_id_cat);

alter table tb_titulo
add constraint fk_pk_id_grav
foreign key (pk_id_grav) references gravadora(pk_id_grav);

alter table Dependente
add constraint fk_pk_id_func
foreign key (pk_id_func) references Funcionario(pk_id_func);

alter table Conjuge
add constraint fk_pk_id_cli
foreign key (pk_id_cli) references Cliente(pk_id_cli);

alter table Cliente 
add column fk_id_cid int;

alter table Cliente
add constraint fk_id_cid
foreign key (fk_id_cid) references tb_cidade(pk_id_cid);