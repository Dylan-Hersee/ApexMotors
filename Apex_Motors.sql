create database Apex_Motors;
use Apex_Motors;
Create table Stock(reg varchar (100) primary key, make varchar(100), model varchar(100), year int, milage int, price varchar (255));
use Apex_Motors;
insert into Stock(id, reg, make, model, year, milage, price) values (1, '221/D/20466', 'Cupra', 'Formentor', 2022, 100000, 27000.00);
insert into Stock(id, reg, make, model, year, milage, price) values (2, '131/D/12345', 'Reault', 'Clio', 2013, 150000, 9000.00);
alter table stock
add column imagesUrl varchar (255);

use Apex_Motors;
select make from Stock;

drop table stock;
select images_Url from Stock
where reg = '221/d/20466';

use apex_motors;
create table Images (id int auto_increment primary Key, Images_url varchar(255), reg varchar(100));

alter table images
add foreign key (reg) references Stock(reg);

use Apex_Motors;




