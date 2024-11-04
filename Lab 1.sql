CREATE TABLE STORE(
  NumMag Number(8) primary key,
  Surface Number(5) ,
  City varchar(15) Default('TUNIS')
);
CREATE TABLE CATEGORY(
   NumCat Number(2) primary key check(NumCat in(1,2,3,4)),
   LibCat varchar(20)
);
Create table PRODUCT( CodeProd Number(5) primary key,
Designation varchar(20),
color varchar(10),
QteStock Number(6) check(QteStock>0),
NumMag Number(8) constraint fk_pr1 references STORE(NumMag),
NumCat Number(2) constraint fk_pr2 references CATEGORY(NumCat)
);
Create table BUYER(
codeAcht Number(4) primary key, 
Name varchar(20),
firstname varchar(20),
address varchar(50),
NumTel Number(8),
City varchar(20) Default('SOUSSE'),
typeachat varchar(20)
);
CREATE TABLE orders (
        CodeAchat Number(4),
        CodeProd Number(5) ,
        DateC Date Default(sysdate),
        constraint pk1_ord primary key(CodeAchat , CodeProd , DateC),
        constraint fk1_ord foreign key (CodeAchat) references Buyer(codeacht),
        constraint fk2_ord foreign key (CodeProd) references Product(CodeProd)
);
Create TABLE SUPPLIER (
    MatF Number(4) primary key,
    Name varchar(20),
    firstname varchar(20),
    numTel Number(8)
)
-----3:

---1:
alter table Product add (MinQ Number(6)); 
---2:
alter table Product add (Weight Number(8) check(Weight>0));
---3:
alter table Product add constraint con_p1 check(QteStock>=MinQ);
---4:
alter table Product modify DESIGNATION varchar(20);
---5:
alter table Orders add QteOrder Number(4) check(QteOrder>=1)
---6:

alter table Product add constraint check (Color in('Red','Green','Yellow','Black','Blue' , 'White' ,'Brown'));
---7:
alter table Product add constraint check (CodeProd between 1000 and 9999);
---8:
alter table Buyer add constraint cons_p2 Unique(address); 
---9:*/
rename Buyer to customer;
---10:

alter table product drop column Weight;
---11:
Drop table Supplier;
---12:
alter table Product drop constraint con_p1;