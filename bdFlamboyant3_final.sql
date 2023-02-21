/*Criando o Banco*/
create database bdFlamboyant3;

/*usando o Banco*/
use bdFlamboyant3;

/*Criando as tabelas*/
create table tblLogin(
usuario varchar(50) primary key,
senha varchar(10),
tipo int
);

create table tblCliente (
ClienteId int primary key auto_increment,
ClienteNome varchar (60) not null,
ClienteTel varchar (15) not null,
ClienteCep varchar (15) not null,
ClienteEmail varchar (80) not null,
ClienteEndereco varchar (60) not null,
usuario varchar(50),
senha varchar(10)
);

insert into tblCliente values (default, "Johnny", "12345678910","0505050","johnny@hotmail.com","Rua guaipá","Johnny","123456");

create table tblCardapio (
CardapioId int primary key auto_increment,
NomeCardapio varchar (100) not null,
DesCardapio varchar (200) not null,
VlCardapio varchar(8) not null,
imagemCardapio varchar(255)
);

create table tblFormaPagamento(
CodEspecialidade int primary key auto_increment,
Especialidade varchar(50)
);

create table tblPagamento (
Codigo_Pag int primary key auto_increment,
ClienteId int,
foreign key (ClienteId) references tblCliente (ClienteId),
CodEspecialidade int,
foreign key (CodEspecialidade ) references tblFormaPagamento(CodEspecialidade),
codVenda int,
foreign key (CodVenda) references tblVenda (CodVenda),
codItemVenda int,
foreign key (CodItemVenda) references itemVenda(CodItemVenda)
); 

create table tblPedido (
Codigo_Ped int primary key auto_increment,
Descricao_Ped varchar (200) not null,
Endereco_Ped varchar (100),
Delivery_Ped boolean,
Quant_Pro int,
CardapioId int,
foreign key (CardapioId) references tblCardapio (CardapioId),
Codigo_Pag int,
foreign key (Codigo_Pag) references tblPagamento (Codigo_Pag),
ClienteId int,
foreign key (ClienteId) references tblCliente (ClienteId)
);


create table tblVenda(
codVenda int primary key auto_increment,
ClienteId int references tbCliente(ClienteId),
datavenda varchar(10),
horavenda varchar(10),
valorFInal varchar(50)
);

select * from tblVenda;

create table itemVenda(
codItemVenda int primary key auto_increment,
codVenda int references tblVenda(codVenda),
CardapioId int references tblCardapio(CardapioId),
qtdeVendas int,
valorParcial varchar(50)
);

/*Inserindo na Tabela*/
Insert into tblLogin values ('Daniel' ,'123456');
Insert into tblLogin values ('Johnny' ,'123456', 1);
Insert into tblLogin values ('Mayara' ,'123456');
Insert into tblLogin values ('Giovanna' ,'123456');
Insert into tblLogin values ('Valentina' ,'123456');
Insert into tblLogin values ('Gustavo' ,'123456');
Insert into tblLogin values ('Pedro' ,'123456');

/*Inserindo na tabela Cardapio*/
insert into tblCardapio values (default, 'Bolinho assado de grão de bico', 'descrição', '50,00');
insert into tblCardapio values (default, 'Feijoada Vegana', 'descrição', '50,00');
insert into tblCardapio values (default, 'Churrasco Vegano', 'descrição', '28,00');
insert into tblCardapio values (default, 'Moqueca de banana da terra', 'descrição', '65,00');
insert into tblCardapio values (default, 'Sopa de feijão preto com mostarda', 'descrição', '37,00');
insert into tblCardapio values (default, 'Salada com maionese de cenoura', 'descrição', '18,99');
insert into tblCardapio values (default, 'Pão integral com açúcar de coco', 'descrição', '20,00');
insert into tblCardapio values (default, 'Coxinha de Jaca', 'descrição', '05,00');
insert into tblCardapio values (default, 'Chocolate Vegano','descrição', '15,00');
insert into tblCardapio values (default, 'Bolo Vegano', 'descrição', '37,00');

/*Inserindo na tabela FormaPagamento*/
insert into tblFormaPagamento values(default, 'Dinheiro');
insert into tblFormaPagamento values(default, 'Débito');
insert into tblFormaPagamento values(default, 'Crédito');
insert into tblFormaPagamento values(default, 'Pix');

/*Inserindo na tabela de Pagamento*/
insert into tblPagamento values(default, '09/06/2022', 1, 1);

/*Atualizando a tabela*/
alter table tblPagamento add valorFInal varchar(50);


/*Selecionando as tabelas*/
select * from tblLogin;
select * from tblCliente;
select * from tblCardapio;
select * from tblFormaPagamento;
select * from tblPagamento;
select * from tblPedido;
select * from tblVenda;
select * from itemVenda;

update tblCliente set ClienteNome = "Roneytrix" where ClienteId= 6;
update tblCliente set senha = "1234567" where ClienteId= 6;
