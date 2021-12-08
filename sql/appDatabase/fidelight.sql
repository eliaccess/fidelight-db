/*Create the database*/
DROP DATABASE IF EXISTS fidelight;
CREATE DATABASE fidelight;
USE fidelight;

/*Drop tables to recreate them*/
DROP TABLE IF EXISTS transaction;
DROP TABLE IF EXISTS user_like;
DROP TABLE IF EXISTS schedule;
DROP TABLE IF EXISTS discount_value;
DROP TABLE IF EXISTS discount_repetition;
DROP TABLE IF EXISTS discount;
DROP TABLE IF EXISTS discount_type;
DROP TABLE IF EXISTS ticket;
DROP TABLE IF EXISTS seller;
DROP TABLE IF EXISTS balance;
DROP TABLE IF EXISTS paying_method;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS user_type;
DROP TABLE IF EXISTS user_category;
DROP TABLE IF EXISTS offer_subscription;
DROP TABLE IF EXISTS company_location_picture;
DROP TABLE IF EXISTS company_location;
DROP TABLE IF EXISTS points_earning;
DROP TABLE IF EXISTS company;
DROP TABLE IF EXISTS points_earning_type;
DROP TABLE IF EXISTS company_type;
DROP TABLE IF EXISTS offer;


/*Table to manage user types and privileges*/
CREATE TABLE user_type(
id int unsigned not null auto_increment,
name varchar(30) not null,
description varchar(200),
PRIMARY KEY (id));

/*Table to manage users*/
CREATE TABLE user(
id int unsigned not null auto_increment,
surname varchar(50),
name varchar(50),
hash_pwd binary(60),
salt varchar(30) not null,
qr_key varchar(10) not null,
email varchar(100),
phone varchar(25),
registration_date datetime not null,
birthdate date,
profile_picture_link varchar(255),
verified smallint unsigned,
active smallint unsigned,
PRIMARY KEY (id));

/*Table to manage users*/
CREATE TABLE user_social(
id int unsigned not null auto_increment,
user int unsigned not null,
social_id varchar(255) not null,
email varchar(100),
provider varchar(30) not null,
PRIMARY KEY (id),
FOREIGN KEY (user) REFERENCES user(id));

/*Table to link a user to a user type */
CREATE TABLE user_category(
user int unsigned not null,
user_type int unsigned not null,
description text,
PRIMARY KEY (user, user_type),
FOREIGN KEY (user) REFERENCES user(id),
FOREIGN KEY (user_type) REFERENCES user_type(id));

/*Table to manage payment methods*/
CREATE TABLE paying_method(
id int unsigned not null,
user int unsigned not null,
iban varchar(34),
bic varchar(11),
card_number varchar(20),
card_expiration varchar(7),
card_crypto varchar(5),
PRIMARY KEY (id),
FOREIGN KEY (user) REFERENCES user(id));

/*Table to manage companies types */
CREATE TABLE company_type(
id smallint unsigned not null auto_increment,
name varchar(50) not null,
description text,
logo_link varchar(255),
PRIMARY KEY (id));

/*Table to manage companies*/
CREATE TABLE company(
id int unsigned not null auto_increment,
login varchar(50) not null,
name varchar(50) not null,
hash_pwd binary(60) not null,
salt varchar(30) not null,
email varchar(100) not null,
description text,
phone varchar(25) not null,
registration_date datetime not null,
website varchar(255),
background_picture varchar(255),
logo_link varchar(255),
paying_method int unsigned,
company_type smallint unsigned not null,
verified smallint unsigned,
active smallint unsigned,
PRIMARY KEY (id),
FOREIGN KEY (paying_method) REFERENCES paying_method(id),
FOREIGN KEY (company_type) REFERENCES company_type(id));

/*Table to manage company locations */
CREATE TABLE company_location(
id int unsigned not null auto_increment,
company int unsigned not null,
phone varchar(25),
siret varchar(14),
longitude decimal(10,8),
latitude decimal(10,8),
street_number varchar(10) not null,
street_name varchar(100) not null,
city varchar(50) not null,
country varchar(70) not null,
billing_adress smallint unsigned,
PRIMARY KEY (id),
FOREIGN KEY (company) REFERENCES company(id));

/*Table to manage company locations pictures for their profile*/
CREATE TABLE company_location_picture(
id int unsigned not null auto_increment,
company_location int unsigned not null,
picture_link varchar(255),
PRIMARY KEY (id),
FOREIGN KEY (company_location) REFERENCES company_location(id));

/*Table to manage open hours of company locations for their profile*/
CREATE TABLE schedule(
id int unsigned not null auto_increment,
company_location int unsigned not null,
day smallint,
open_am time,
close_am time,
open_pm time,
close_pm time,
PRIMARY KEY (id),
FOREIGN KEY (company_location) REFERENCES company_location(id));

/*Table to manage the tickets*/
CREATE TABLE ticket(
id int unsigned not null auto_increment,
user int unsigned,
company int unsigned,
title varchar(100),
message text,
answer_to int unsigned,
post_date datetime,
open smallint unsigned,
PRIMARY KEY (id),
FOREIGN KEY (user) REFERENCES user(id),
FOREIGN KEY (company) REFERENCES company(id),
FOREIGN KEY (answer_to) REFERENCES ticket(id));

/*Table to manage the types of earning ways to get fidelity points*/
CREATE TABLE points_earning_type(
id smallint unsigned not null auto_increment,
title varchar(100),
description text,
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
name varchar(50),
description text,
price float,
active smallint,
PRIMARY KEY (id));

/*Table to manage offers subscriptions of companies on FideLight's offers*/
CREATE TABLE offer_subscription(
company int unsigned not null,
offer int unsigned not null,
subscription_date datetime not null,
amount smallint not null,
active smallint,
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

/*Table to manage the user's liked companies*/
CREATE TABLE user_like(
company int unsigned not null,
user int unsigned not null,
PRIMARY KEY (company, user),
FOREIGN KEY (company) REFERENCES company(id),
FOREIGN KEY (user) REFERENCES user(id));

/*Table to assign users to be sellers for compagnies*/
CREATE TABLE seller(
id int unsigned not null auto_increment,
company int unsigned not null,
login varchar(50) not null,
hash_pwd binary(60) not null,
salt varchar(30) not null,
PRIMARY KEY (id),
FOREIGN KEY (company) REFERENCES company(id));

/*Table to manage discount types*/
CREATE TABLE discount_type(
id int unsigned not null auto_increment,
name varchar(100),
description text,
PRIMARY KEY (id));

/*Table to manage discounts proposed by compagnies*/
CREATE TABLE discount(
id int unsigned not null auto_increment,
company int unsigned not null,
discount_type int unsigned not null,
times_used integer unsigned,
cost integer,
name varchar(100),
description text,
picture_link varchar(255),
product varchar(100),
nb_max int unsigned,
creation_date datetime,
start_date date not null,
expiration_date date,
per_day smallint unsigned,
active smallint unsigned,
PRIMARY KEY (id),
FOREIGN KEY (company) REFERENCES company(id),
FOREIGN KEY (discount_type) REFERENCES discount_type(id));

/*Table to manage discount repetition*/
CREATE TABLE discount_repetition(
discount int unsigned not null,
monday smallint,
tuesday smallint,
wednesday smallint,
thursday smallint,
friday smallint,
saturday smallint,
sunday smallint,
PRIMARY KEY (discount),
FOREIGN KEY (discount) REFERENCES discount(id));

/*Table to manage the relation between discount values and user types*/
CREATE TABLE discount_value(
user_type int unsigned not null,
discount int unsigned not null,
value float,
PRIMARY KEY (user_type, discount),
FOREIGN KEY (user_type) REFERENCES user_type(id),
FOREIGN KEY (discount) REFERENCES discount(id));

/*Table to manage transactions*/
CREATE TABLE transaction(
id int unsigned not null auto_increment,
user int unsigned not null,
discount int unsigned,
value float,
nb_used int unsigned not null,
seller int unsigned,
company int unsigned not null,
money_saved float,
PRIMARY KEY (id),
FOREIGN KEY (user) REFERENCES user(id),
FOREIGN KEY (company) REFERENCES company(id),
FOREIGN KEY (seller) REFERENCES seller(id));
