

use Apex_Motors;
alter table images;
insert into Images ( id, images_url, reg) values ( 6, '/images/Apex_logo.jpeg','181/D/23456');

Drop table Stock;

create table Stock (reg varchar(100), make varchar(100), model varchar(100), year int, milage int , price int );
alter table stock
add primary key(reg);
create table Images (id int auto_increment primary key, images_url varchar(255), reg varchar(100), constraint foreign key (reg) references stock(reg));

Create table More_details (engine varchar(100), transmission varchar(100), nct date, body_type varchar(255), reg varchar(255), Doors varchar(100), color varchar(255), owners int, constraint foreign key (reg) references stock(reg));

alter table Stock;
insert into Stock(reg, make, model, year, milage, price) values ("152-D-40185", "Volkswagen", "Polo", 2015, 56000, 10450);
insert into Images(id, images_url, reg) values (2, "/images/152-D-40185/VW_img1.png", "152-D-40185");

create table Overview( Trim varchar(100), trim_level varchar(250), fuel_type varchar (255),
transmission varchar(255), body_type varchar(255), seats int, doors int, colour varchar(250), reg varchar(250), foreign key (reg) references stock(reg)

);
create table Ownership(Current_country_reg varchar(230), import_counrty varchar(230), owners int, NCT_Expiry varchar(230));
create table running_costs (road_tax int, combined_fuel_comp varchar(255), rural_fuel_comp varchar(230), urban_fuel_comp varchar(255));
create table performance( engine_size varchar(100), engine_power varchar(100), acceleration int, top_speed int, Torque int);
create table dimensions(external_length int, external_width int, external_height int, ground_clearance int, boot_vol int, fuel_tank_cap int);
create table features (Comfort varchar(300), Media varchar(300), assistance varchar(300), Style varchar(300), lighting varchar(300), Safety varchar(300), performance varchar(300)
);
alter table Overview
add column description varchar (1000);
alter table Ownership
add column reg varchar(255);
alter table Ownership
add foreign key (reg) references Stock(reg);
alter table running_costs
add column reg varchar(255);
alter table running_costs
add foreign key (reg) references Stock(reg);
alter table performance
add column reg varchar(255);
alter table performance
add foreign key (reg) references Stock(reg);
alter table dimensions
add column reg varchar(255);
alter table dimensions
add foreign key (reg) references Stock(reg);
alter table features
add column reg varchar(255);
alter table features
add foreign key (reg) references Stock(reg);

alter table Ownership
add column import_country varchar(255);

select * from features;
select * from Images
where reg="141-D-53176";

insert into Images(images_url, reg) values ('/images/141-D-53176/Audi_img2.png', '141-D-53176')