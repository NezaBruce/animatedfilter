create table product(
    id bigint not null auto_increment primary key,
     title varchar(75) not null,
     summary tinytext,
     type smallint not null,
     createAt datetime not null,
     updateAt datetime
);
CREATE TABLE ProductsAvailability ( id BIGINT NOT NULL auto_increment, 
productId BIGINT NOT NULL,  
storeStatus VARCHAR(200) NOT NULL DEFAULT 'Product out of stock', 
quantityInStore INT NOT NULL DEFAULT 0, 
lastTransactionDateTime DATETIME NOT NULL, 
PRIMARY KEY(id,productId));

create table transaction(id bigint not null primary key auto_increment,
productId bigint not null,
transactionType varchar(10) not null,
quantity int not null default 0,
transactionDateTime datetime not null,
comment text,
foreign key (productId) references product(id));

CREATE trigger Your_name_lol_startRecordingProductAvailability
AFTER INSERT on product
FOR EACH ROW
BEGIN

INSERT INTO productsAvailability(productId, storeStatus, lastTransactionDateTime) VALUES (new.id, "Available", new.createdAt);
UPDATE  productAvailability SET quantityInStore = quantityInStore +1 where productId = new.id;

END //
