create table agenda (
	id int not null auto_increment, 
	nome varchar(20),
    contato tinyint (20) not null, 
    endereco varchar(30) not null,
    primary key (id)
);

describe agenda;

alter table agenda
modify column id int not null;

insert into agenda values
('2', 'Rogério', '71988743784', 'Praça da Sé');


DELETE FROM `agenda_telefonica`.`agenda` WHERE (`id` = '5');

select * from agenda;