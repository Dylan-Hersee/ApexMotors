create database Apex_Motors;
use Apex_Motors;
Create table Stock(reg varchar (100) primary key, make varchar(100), model varchar(100), year int, milage int, price varchar (255));
use Apex_Motors;
insert into Stock( reg, make, model, year, milage, price) values ( '221/D/20466', 'Cupra', 'Formentor', 2022, 100000, 27000.00);
insert into Stock( reg, make, model, year, milage, price) values ( '131/D/12345', 'Reault', 'Clio', 2013, 150000, 9000.00);
alter table stock
add column imagesUrl varchar (255);

use Apex_Motors;
select make from Stock;

drop table stock;
select images_Url from Stock
where reg = '221/d/20466';

use apex_motors;
create table Images (id int auto_increment primary Key, Images_url varchar(255), reg varchar(100));

alter table images;
insert into images (id, images_url, reg) values ( 1, 'https://images.unsplash.com/photo-1580273916550-e323be2ae537?q=80&w=928&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', '221/D/20466');

select * from Images;
alter table images;
insert into images (id, Images_url, reg ) values( 4, '/images/Apex_logo.jpeg', '261/WX/12345');
insert into Stock (reg, make, model, year, milage, price) values ('261/WX/12345', 'Audi', 'A1', 2026, 50000, '40000.00');

select * from Stock;
update images
set images_url = '/images/Apex_logo.jpeg'
where reg = '221/D/20466';




