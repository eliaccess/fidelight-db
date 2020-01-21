/*Table to manage customers*/
DROP TABLE balance;
DROP TABLE customer;
DROP TABLE company;


CREATE TABLE customer(
id int unsigned not null auto_increment,
surname varchar(30) not null,
name varchar(30) not null,
hash_pwd varchar(255) not null,
mail varchar(150) not null,
constraint pk_customer primary key (id));

/*Table to manage companies*/
CREATE TABLE company(
id smallint unsigned not null auto_increment,
name varchar(50) not null,
hash_pwd varchar(255) not null,
mail varchar(150) not null,
constraint pk_company primary key (id));

/*Table to manage customer's balances*/
CREATE TABLE balance(
company_id smallint unsigned,
customer_id int unsigned,
points smallint unsigned not null,
constraint pk_balance primary key (company_id, customer_id),
constraint fk_balance_company_id foreign key (company_id) REFERENCES company(id),
constraint fk_balance_customer_id foreign key (customer_id) REFERENCES customer(id));

/*Table to manage sellers from companies*/
CREATE TABLE seller(
company_id smallint unsigned,
name varchar(50) not null,
hash_pwd varchar(255) not null,
mail varchar(150) not null,
constraint pk_seller primary key (company_id, name),
constraint fk_seller_company_id foreign key (company_id) REFERENCES company(id));

/*Table to manage offers from companies*/
CREATE TABLE offer(
id int unsigned not null auto_increment,
company_id smallint unsigned,
cost int unsigned not null,
constraint pk_balance primary key (id),
constraint fk_offer_company_id foreign key (company_id) REFERENCES company(id));

/*Table to manage the reductions with this form : "-50€ off"*/
CREATE TABLE reduction_integer(
offer_id int unsigned,
value int unsigned not null,
description varchar(250) not null,
product varchar(50) not null,
constraint pk_reduction_integer primary key (offer_id),
constraint fk_reduction_integer_offer_id foreign key (offer_id) REFERENCES offer(id));

/*Table to manage the reductions with this form : "-50% off"*/
CREATE TABLE reduction_percentage(
offer_id int unsigned,
value int unsigned not null,
description varchar(250) not null,
product varchar(50) not null,
constraint pk_reduction_percentage primary key (offer_id),
constraint fk_reduction_percentage_offer_id foreign key (offer_id) REFERENCES offer(id));

/*Table to manage the reductions with this form : "The maxiburger at only 3€ tonight !"*/
CREATE TABLE new_value(
offer_id int unsigned,
value int unsigned not null,
description varchar(250) not null,
product varchar(50) not null,
constraint pk_new_value primary key (offer_id),
constraint fk_new_value_offer_id foreign key (offer_id) REFERENCES offer(id));


/*Make the UML of the earning points part*/
/*Add status to customer to have access to exclusive offers, such as "student"*/