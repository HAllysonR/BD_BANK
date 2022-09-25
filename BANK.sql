create database Bank;
use Bank;

create table bankAccounst(
	Id_account INT auto_increment primary key,
    Ag_num int not null,
    Ac_num int not null,
    SALDO FLOAT,
    constraint identification_account_constraint unique (Ag_num, Ac_num)
);

create table bankClient(
	Id_client int auto_increment ,
    ClienteAccount int,
    CPF char(11) not null,
    RG char(9) not null,
    Nome varchar(20) not null,
    Endereço varchar(100) not null,
    Renda_mensal float,
    primary key (Id_client,ClienteAccount),
    constraint fk_account_client foreign key (ClienteAccount) references bankAccounst(Id_account)
    on update cascade
);

create table bankTransactions(
		Id_transaction int auto_increment primary key,
        Ocorrencia datetime,
        Status_transaction varchar(20),
        Valor_transferido float,
        Source_account int,
        Destionation_account int,
        Constraint fk_source_transaction foreign key (Source_account) references 
		bankAccounst(Id_account),
        Constraint fk_destionation_transaction foreign key (Destionation_account) references 
		bankAccounst(Id_account)
);

