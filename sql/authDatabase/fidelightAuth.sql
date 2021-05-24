/*Create the database*/
DROP DATABASE IF EXISTS fidelightAuth;
CREATE DATABASE fidelightAuth;
USE fidelight;

/*Drop tables to recreate them*/
DROP TABLE IF EXISTS user_refresh_token;
DROP TABLE IF EXISTS company_refresh_token;

/*Table to manage user refresh tokens*/
CREATE TABLE user_refresh_token(
id int unsigned not null,
refresh_token varchar(200) not null,
PRIMARY KEY (id));

/*Table to manage companies refresh tokens*/
CREATE TABLE company_refresh_token(
id int unsigned not null,
refresh_token varchar(200) not null,
PRIMARY KEY (id));
