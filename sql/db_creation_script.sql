/*Dropt tables to recreate them*/
USE fidelight;
DROP TABLE IF EXISTS stats_company;
DROP TABLE IF EXISTS stats_reduction_user;
DROP TABLE IF EXISTS reduction_value;
DROP TABLE IF EXISTS seller;
DROP TABLE IF EXISTS balance;
DROP TABLE IF EXISTS ceo;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS user_type;
DROP TABLE IF EXISTS offer_subscription;
DROP TABLE IF EXISTS reduction;
DROP TABLE IF EXISTS company_location;
DROP TABLE IF EXISTS points_earning;
DROP TABLE IF EXISTS company;
DROP TABLE IF EXISTS points_earning_type;
DROP TABLE IF EXISTS company_type;
DROP TABLE IF EXISTS offer;
DROP TABLE IF EXISTS reduction_type;




/*Table to manage user types and privileges*/
CREATE TABLE user_type(
id smallint unsigned not null auto_increment,
name varchar(30) not null,
description varchar(200),
PRIMARY KEY (id));

/*Table to manage users*/
CREATE TABLE user(
id int unsigned not null auto_increment,
surname varchar(30),
name varchar(30),
login varchar(50) not null,
hash_pwd varchar(255) not null,
mail varchar(150),
registration_date date not null,
user_type smallint unsigned not null,
PRIMARY KEY (id),
FOREIGN KEY (user_type) REFERENCES user_type(id));

/*Table to manage companies types */
CREATE TABLE company_type(
id smallint unsigned not null auto_increment,
name varchar(50) not null,
description varchar(250),
PRIMARY KEY (id));

/*Table to manage companies*/
CREATE TABLE company(
id int unsigned not null auto_increment,
name varchar(50) not null,
description varchar(250),
phone int unsigned,
registration_date date not null,
company_type smallint unsigned not null,
PRIMARY KEY (id),
FOREIGN KEY (company_type) REFERENCES company_type(id));

/*Table to manage company locations */
CREATE TABLE company_location(
id int unsigned not null auto_increment,
company int unsigned not null,
location varchar(255),
PRIMARY KEY (id),
FOREIGN KEY (company) REFERENCES company(id));

/*Table to manage the types of earning ways to get fidelity points*/
CREATE TABLE points_earning_type(
id smallint unsigned not null auto_increment,
title varchar(30),
description varchar(250),
PRIMARY KEY (id));

/*Table to manage the way users can win fidelity points*/
CREATE TABLE points_earning(
company int unsigned not null,
points_earning_type smallint unsigned not null,
value smallint not null,
PRIMARY KEY (company, points_earning_type),
FOREIGN KEY (company) REFERENCES company(id),
FOREIGN KEY (points_earning_type) REFERENCES points_earning_type(id));

/*Table to manage offers FideLight proposes to companies*/
CREATE TABLE offer(
id int unsigned not null auto_increment,
name varchar(30),
description varchar(250),
value numeric(4,2) not null,
PRIMARY KEY (id));

/*Table to manage offers subscriptions of companies on FideLight's offers*/
CREATE TABLE offer_subscription(
company int unsigned not null,
offer int unsigned not null,
subscription_date date not null,
amount smallint not null,
PRIMARY KEY (company, offer),
FOREIGN KEY (company) REFERENCES company(id),
FOREIGN KEY (offer) REFERENCES offer(id));

/*Table to manage the user's balance*/
CREATE TABLE balance(
company int unsigned not null,
user int unsigned not null,
points int unsigned,
PRIMARY KEY (company, user),
FOREIGN KEY (company) REFERENCES company(id),
FOREIGN KEY (user) REFERENCES user(id));

/*Table to assign users to be sellers for compagnies*/
CREATE TABLE seller(
company int unsigned not null,
user int unsigned not null,
codes_scanned int unsigned,
PRIMARY KEY (company, user),
FOREIGN KEY (company) REFERENCES company(id),
FOREIGN KEY (user) REFERENCES user(id));

/*Table to assign a user to be the ceo of a company*/
CREATE TABLE ceo(
company int unsigned not null,	
user int unsigned not null,
iban varchar(30),
bic varchar(30),
card_number varchar(20),
card_expiration varchar(6),
card_crypto varchar(4),
PRIMARY KEY (company, user),
FOREIGN KEY (company) REFERENCES company(id),
FOREIGN KEY (user) REFERENCES user(id));

/*Table to manage reduction offers types*/
CREATE TABLE reduction_type(
id smallint unsigned not null auto_increment,
name varchar(30),
description varchar(150),
PRIMARY KEY (id));

/*Table to manage reduction offers proposed by compagnies*/
CREATE TABLE reduction(
id int unsigned not null auto_increment,
company int unsigned not null,
reduction_type smallint unsigned not null,
cost smallint unsigned,
description varchar(250),
product varchar(250),
nb_max int unsigned,
creation_date date,
start_date date not null,
expiration_date date,
repetition smallint unsigned,
PRIMARY KEY (id),
FOREIGN KEY (company) REFERENCES company(id),
FOREIGN KEY (reduction_type) REFERENCES reduction_type(id));

/*Table to manage data to analyse for compagnies*/
CREATE TABLE stats_company(
company int unsigned not null,
reduction int unsigned not null,
times_used int unsigned not null,
PRIMARY KEY (company, reduction),
FOREIGN KEY (company) REFERENCES company(id),
FOREIGN KEY (reduction) REFERENCES reduction(id));

/*Table to manage data about user's usage*/
CREATE TABLE stats_reduction_user(
user int unsigned not null,
reduction int unsigned not null,
date_first_use date,
nb_used smallint,
money_saved smallint,
PRIMARY KEY (user, reduction),
FOREIGN KEY (user) REFERENCES user(id),
FOREIGN KEY (reduction) REFERENCES reduction(id));

/*Table to manage the relation between a reduction value and users types*/
CREATE TABLE reduction_value(
user_type smallint unsigned not null,
reduction int unsigned not null,
value smallint unsigned,
PRIMARY KEY (user_type, reduction),
FOREIGN KEY (user_type) REFERENCES user_type(id),
FOREIGN KEY (reduction) REFERENCES reduction(id));