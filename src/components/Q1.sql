## QUESTION ONE ##

CREATE TRIGGER IrategekaNezaBruce_startRecordingProductAvailability
AFTER
INSERT
ON product
FOR EACH ROW
BEGIN
SET @lastId = (SELECT id FROM product ORDER BY id DESC LIMIT 1);
IF @lastId IS NULL OR @lastID = '' THEN
    SET @lastId = 1;
END IF;
INSERT INTO ProductsAvailability(productId, storeStatus,lastTransactionDateTime) VALUES(@lastId,"Available",new.createdAt);
END//

### QUESTION 2 ####

CREATE TRIGGER triggerName
BEFORE
INSERT
ON transaction
FOR EACH ROW
BEGIN
IF(new.transactionType = 'IN') THEN
UPDATE ProductsAvailability SET storeStatus = 'Available', quantityInStore = new.quantity, lastTransactionDateTime = new.transactionDateTime WHERE productId=new.productId;
END IF;
IF(new.transactionType = 'OUT') THEN
    SET @quantityInStock = (SELECT quantityInStore FROM ProductsAvailability WHERE productId=new.productId LIMIT 1);
    IF(@quantityInStock - new.quantity > 0) THEN
        UPDATE ProductsAvailability SET storeStatus = 'Available', quantityInStore= new.quantity, lastTransactionDateTime = new.transactionDateTime WHERE productId=new.productId;
    END IF;    
END IF;
END///





CREATE TRIGGER TrigerName
BEFORE
INSERT
ON transaction
FOR EACH ROW
BEGIN
SET @quantityInStore = (SELECT quantityInStore FROM ProductsAvailability WHERE productId=new.productId LIMIT 1);
IF(new.transactionType = 'IN') THEN
UPDATE ProductsAvailability SET storeStatus = 'Available', quantityInStore =@quantityInStore + new.quantity, lastTransactionDateTime = new.transactionDateTime WHERE productId=new.productId;
END IF;
IF(new.transactionType = 'OUT') THEN
    IF(@quantityInStock - new.quantity > 0) THEN
        UPDATE ProductsAvailability SET storeStatus = 'Available', quantityInStore= @quantityInStore-new.quantity, lastTransactionDateTime = new.transactionDateTime WHERE productId=new.productId;
    END IF;   
END IF;
END //























CREATE TRIGGER TurinumugishaSouvenir_RecordingProductAvailability
BEFORE
INSERT
ON transaction
FOR EACH ROW
BEGIN
SET @quantityInStore = (SELECT quantityInStore FROM ProductsAvailability WHERE productId=new.productId LIMIT 1);
IF(new.transactionType = 'IN') THEN
UPDATE ProductsAvailability SET storeStatus = 'Available', quantityInStore =@quantityInStore + new.quantity, lastTransactionDateTime = new.transactionDateTime WHERE productId=new.productId;
END IF;
IF(new.transactionType = 'OUT') THEN
    IF(@quantityInStock - new.quantity > 0) THEN
        UPDATE ProductsAvailability SET storeStatus = 'Available', quantityInStore= @quantityInStore-new.quantity, lastTransactionDateTime = new.transactionDateTime WHERE productId=new.productId;
    ELSE
        UPDATE ProductsAvailability SET lastTransactionDateTime = new.transactionDateTime WHERE productId=new.productId;
    END IF;   
END IF;
END //

































