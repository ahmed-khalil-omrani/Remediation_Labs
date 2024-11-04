---Part1:

Insert into Store Values(1111,1234,'Sousse');
Insert into Store Values(2222,2345,'Sfax');
Insert into Store Values(3333,3456,'Ariana');



Insert into Category Values(1,'Bedroom');
Insert into Category Values(2,'Kitchen');


Insert into Product Values(1001,'Tablecloth','Red',220,1111,2,20);
Insert into Product Values(1002,'Pillow','White',575,2222,1,50);
Insert into Product Values(1003,'Chair','Black',100,3333,2,10);
Insert into Product Values(1004,'Table','White',100,3333,2,20);


Insert into Customer Values(101, 'Mbarek', 'Salim', 'Rue 365', 54878899, 'Sousse', 'C1');
Insert into Customer Values(102, 'Ben Ali', 'Amira', 'Rue 145', 52147789, 'Tunis', 'C2') ;
Insert into Customer Values(103, 'Souissi', 'Amel', 'Rue 250', 52351456, 'Sfax', 'C3') ;

Insert into Orders (CodeAchat, CodeProd, QTEORDER)Values(101, 1002, 12);
Insert into Orders (CodeAchat, CodeProd, QTEORDER)Values(102, 1001, 36);
Insert into Orders (CodeAchat, CodeProd, QTEORDER)Values(103, 1004, 5);
Insert into Orders (CodeAchat, CodeProd, QTEORDER)Values(103, 1003, 10);


---Part 2:
---1:
update CUSTOMER SET address='Street 355' where codeAcht=103;
---2:
update STORE SET city='RUE de Tunis' where Nummag=3333;
---3:
delete from Orders where
codeACHat=(select codeAcht from customer where city='Sfax');
delete customer where city='SFAX' ;
---4:
ALTER TABLE product drop constraint fk_pr1;
ALTER TABLE product 
ADD CONSTRAINT fk_pr1 
FOREIGN KEY (NumMag) 
REFERENCES Store(NumMag) 
ON UPDATE CASCADE;
update store set NUMMAG=410 where NumMag=2222;
---5:
update customer set numtel=97548548 where codeacht=101;
---6:
alter table orders drop constraint fk2_ord;
delete product where codeprod=1003;
---7:
select codeAcht , name , firstname 
from customer where city='Tunis' 
order by name;
---8:
select p.codeprod from product p , category c where (p.NumCat=c.Numcat) and (c.libcat='Kitchen');
---9:
select codeacht , name from customer c , store s where (c.city=s.city) and (s.Nummag=1111);
correction or
select * from customer where city where =(select city from store where nummag=1111
*/
---10:
select * from product where  (numcat =(select numcat from product where(codeprod=1001)))and not(codeprod=1001);
---11:

select * from customer where(codeacht not in(select distinct(codeachat) from orders);
---12:
select count(codeachat) from orders;
---13:
select codeachat , count(codeachat) from orders group by (codeachat);
---14:
select numcat , count(codeprod) from product group by(numcat);
---15:
select codeprod from product where (not(codeprod in (select codeprod from orders) ));
---16:
select (*) from customer where name like '%a%';