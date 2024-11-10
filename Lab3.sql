---1. Creating a database:

create table Factory(  
    NUer Number(8) primary key,
    NomU varchar(10) ,
    city_u varchar (10)
);
create table PRODUCT (
NP Number(4) primary key, 
NAME varchar(10), COLOR varchar(10), WEIGHT Number(4) check(WEIGHT>0));
create table SUPPLIER (NF Number(4)primary key, NAME varchar(20), CITY_F varchar(20));
create table DELIVERY (NP Number(4) constraint fk1_dl references product(NP),
NAKED Number(4) constraint fk2_dl references Factory(NUer),
NF  Number(4) constraint fk3_dl references SUPPLIER(NF), 
QUANTITY Number(4) check(QUANTITY>0 ),
constraint pk1_dl primary key(NP ,NAKED,NF ));
---2. Modifying database tables
---1:
alter table SUPPLIER add STATUS VARCHAR(20);
---2:
alter table product modify weight number(5) check (weight>0);
---3:
alter table product add constraint ch1_p check(color in('red' , 'green' ,'black'));
---3. Inserting data into the database
---1:

insert into factory values(1,'Citroen','Paris');
insert into factory values(2,'Peugeot','Sochaux');
insert into factory values(3,'Citroen','Sochaux');
insert into product values(1,'Plaquette', 'black',257);
insert into product values(2,'Siège','red',15230);
insert into product values(3,'Siège','green' ,15230);
insert into Supplier(NF,Name ,Status , city_F) values(1,'Monroe','producteur','Lyon');
insert into Supplier(NF,Name ,Status , city_F) values(2,'Au bon siège','Sous-traitant','Limoges');
insert into Supplier(NF,Name ,Status , city_F) values(3,'Saint Gobain','producteur','Paris');
insert into DELIVERY values(3,1,2 ,60);
insert into DELIVERY values(1,2,3 ,2500);
insert into DELIVERY values(1,3,3 ,3000);
insert into DELIVERY values(2,2,3 ,120);
insert into DELIVERY values(3,1,1 ,49);
insert into DELIVERY values(3,2,1 ,45);
insert into DELIVERY values(3,3,1 ,78);

---4. Querying a database:
---1:

select * from Factory ; 
select * from Product ; 
select * from Delivery ;
select * from Supplier
---2:
update Supplier set City_F='italy' where NF=1;
---3:
select * from Factory where (City_U='Sochaux');
---4:
select nomU from Factory order by(nomU) ;
---5:
select NAME from Supplier order by(name) DESC;
---6:
select np from product where name like '%te' and weight between 200 and 300;
---7:
select * from supplier where name like 'M%';
---8:
select * from product where name like'__a%';
---9:
select distinct(city_u) from Factory ;
---10:
select min(weight) from product;
---11:
select sum(quantity) from delivery where NF=1;
---12:
select count(NP) from product;
---13:
select NF,AVG(quantity) from delivery group by (NF) ;
---14:
select count(NF) from delivery where (naked=1) and (np=3);
---15:
select s.name from supplier s , delivery d where (s.nf=d.nf) and(d.naked=1) and(d.np=3);
---16:
select s.name from supplier s , factory f ,delivery d , product p where (d.nf=s.nf) and(d.naked=f.nuer)
and(f.city_u in('Paris','Sochaux'))and(p.np=d.np)and(p.color='green');

---17:
select avg(quantity) from delivery where np=3;
---18:
select np ,sum(quantity) from delivery where np=1 or np=2 or np=3 group by (np); 
---19:
select count(distinct(nf)) from delivery;
---20:
select avg(quantity) , count(np) from delivery group by(np);
---21:
select avg(quantity) , count(np) from delivery where(np =(select np from delivery group by np having count(np)>3)) group by(np);
select np , count(np) from delivery group by np having count(np)>3;