create database Apex_Motors;
use Apex_Motors;
Create table Stock(id int, reg varchar (100), make varchar(100), model varchar(100), year int, milage int, price varchar (255));
use Apex_Motors;
insert into Stock(id, reg, make, model, year, milage, price) values (1, '221/D/20466', 'Cupra', 'Formentor', 2022, 100000, 27000.00);
insert into Stock(id, reg, make, model, year, milage, price) values (2, '131/D/12345', 'Reault', 'Clio', 2013, 150000, 9000.00);
alter table stock
add column imagesUrl varchar (255);

use Apex_Motors;
select make from Stock;

alter table Stock;
update Stock
set images_url = '/Apex Motors/Apex_logo.jpeg';

select images_Url from Stock;


alter table stock
drop imagesUrl;

