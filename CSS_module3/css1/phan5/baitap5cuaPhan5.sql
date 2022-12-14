
-- Bước 1: Tạo cơ sở dữ liệu demo
create database Products ;
use Products ;
-- Bước 2: Tạo bảng Products với các trường dữ liệu sau:
-- Id
-- productCode
-- productName
-- productPrice
-- productAmount
-- productDescription
-- productStatus
-- Chèn một số dữ liệu mẫu cho bảng Products.
create table Products (
	id int auto_increment,
	productCode int not null,
	productName varchar(50) not null unique,
	productPrice double not null 
    check (productPrice > 0),
	productAmount int not null
    check (productAmount >= 0),
	productDescription varchar(100),
	productStatus boolean,
    primary key(id)
);
-- Bước 3:
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
-- So sánh câu truy vấn trước và sau khi tạo index
explain select * from products ;

create unique index  index_produceCode 
on products (productCode);

explain select * from products ;

create index  index_product_name_price 
on products  (productname , productprice ) ;

explain select * from products ;

-- Bước 4:
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
-- Tiến hành sửa đổi view
-- Tiến hành xoá view
create view Product_view as 
select productCode, productName, productPrice, productStatus from products;

create or replace view Product_views as 
select * from products 
where productStatus = 1;

drop view product_view ; 

-- Bước 5:
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
-- Tạo store procedure thêm một sản phẩm mới
-- Tạo store procedure sửa thông tin sản phẩm theo id
-- Tạo store procedure xoá sản phẩm theo id

delimiter  // 
create procedure findAllProducts()
begin 
select * from products ;
end//

call findAllProducts() ;

-- thêm
DELIMITER //
create procedure addProduct(
IN newProductCode INT, 
in newProductName VARCHAR(50), 
in newProductPrice DOUBLE, 
in newProductAmount INT, 
in newProductDescription VARCHAR(100), 
in newProductStatus BOOLEAN)
BEGIN
	INSERT INTO products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUE (newProductCode, newProductName, newProductPrice, newProductAmount, newProductDescription, newProductStatus);
END //
    
-- sửa  
DELIMITER //
create procedure updateProduct(IN newId INT, 
	newProductCode INT,
	newProductName VARCHAR(50), 
	newProductPrice DOUBLE, 
	newProductAmount INT, 
	newProductDescription VARCHAR(100), 
	newProductStatus BOOLEAN)
BEGIN
	UPDATE products
    SET productCode = newProductCode,
		productName = newProductName,
        productPrice = newProductPrice,
        productAmount = newProductAmount,
        productDescription = newProductDescription,
        productStatus = newProductStatus
	WHERE id = newId;
END //

-- xóa  
DELIMITER //
create procedure deleteProduct(IN newId INT)
BEGIN
delete from products 
where id = newid;
end //

call addProduct(1523, "Iphone 12", 2000000, 200, "Sản xuất năm 2020", 1);
call addProduct(1526, "Iphone 12findAllProducts", 30012000, 100, "Sản xuất năm 2021", 1);
call updateProduct(1, 1527, "Iphone 5", 200000, 200, "Sản xuất năm 2014", 2);
call deleteProduct(1);
