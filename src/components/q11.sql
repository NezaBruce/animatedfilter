CREATE TRIGGER Irategeka_Neza_Bruce_RecordingProductAvailability
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
END $$