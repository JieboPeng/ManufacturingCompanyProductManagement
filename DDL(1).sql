-- Filename: CustomerOrder&ProductApplication-DDL
-- Authors: Jiebo Peng, Lilin Zeng, Si Wang
-- Description: DDL section is to CREATE DATABASE Assignment02 which include CREATE TABLE and CREATE CONSTRAINT

-- Create database
DROP database IF EXISTS Assignment02;
CREATE database IF NOT EXISTS Assignment02;
use Assignment02;

-- Drop 6 tables 
DROP TABLE IF EXISTS order_has_product;
DROP TABLE IF EXISTS product_has_part;
DROP TABLE IF EXISTS part;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS `order`;
DROP TABLE IF EXISTS customer;

-- Create customer table
CREATE TABLE customer
(
id                  INT          NOT NULL  AUTO_INCREMENT,
name                VARCHAR(50)  NOT NULL,
shipping_address    VARCHAR(50),
mailing_address     VARCHAR(50),
phone_number_1      CHAR(15),
phone_number_2      CHAR(15),
credit_limit        DECIMAL(10),
discount            INT,
-- Create the primary key constraint
CONSTRAINT pk_id    PRIMARY KEY(id));

-- Create order table
CREATE TABLE `order`
(
order_number       INT NOT NULL,
date               DATE,
qty                INT  CHECK (qty > 0),
amount_filled      INT,
amount_backordered INT,
customer_id        INT,
-- Create the primary key constraint
CONSTRAINT pk_order_number PRIMARY KEY(order_number),
-- Create the foreign key constraint
CONSTRAINT fk_customer_id FOREIGN KEY(customer_id)
                          REFERENCES customer(id));
                          
-- Create product table
CREATE TABLE product
(
code              VARCHAR(20) NOT NULL,
description       VARCHAR(50),
price             DECIMAL(20),
qty_on_hand       INT CHECK (qty_on_hand > 0),
qty_back_ordered  INT CHECK (qty_back_ordered > 0),
-- Create the primary key constraint
CONSTRAINT pk_code PRIMARY KEY(code));

-- Create part table
CREATE TABLE part
(
part_numb      VARCHAR(20)   NOT NULL,
description    VARCHAR(50),
inventory      INT CHECK (inventory > 0),
-- Create the primary key constraint
CONSTRAINT pk_part_numb PRIMARY KEY(part_numb));

-- Create product_has_part table
CREATE TABLE product_has_part
(
product_code   VARCHAR(20)   NOT NULL,
part_part_numb VARCHAR(20)   NOT NULL,
-- Create the primary key constraint
CONSTRAINT pk_product_code   PRIMARY KEY(product_code,part_part_numb),
-- Create the foreign key constraint
CONSTRAINT fk_product_code   FOREIGN KEY(product_code)
                             REFERENCES product(code),
-- Create the foreign key constraint                             
CONSTRAINT fk_part_part_numb FOREIGN KEY(part_part_numb)
                             REFERENCES part(part_numb));
                             
-- Create order_has_product table
CREATE TABLE order_has_product
(
order_order_number INT             NOT NULL,
product_code       VARCHAR(20)     NOT NULL,
-- Create the primary key constraint
CONSTRAINT pk_order_order_number   PRIMARY KEY(order_order_number,product_code),
-- Create the foreign key constraint
CONSTRAINT fk_order_order_number   FOREIGN KEY(order_order_number)
                                   REFERENCES `order`(order_number),
-- Create the foreign key constraint
CONSTRAINT fk_product_code1        FOREIGN KEY(product_code)
                                   REFERENCES product(code));


