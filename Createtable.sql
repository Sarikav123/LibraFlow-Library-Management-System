/****Create Six tables **/
    Create table Branch(
  	  Branch_no INT primary Key,
      Manager_Id INT,
      Branch_address varchar(100), 
      Contact_no varchar(15)
      );

    Create table Employee (
  	  Emp_Id INT primary key,
      Emp_name varchar(100),
      Position varchar(100),
      Salary INT,
      Branch_no INT,
      foreign key (Branch_no) references Branch(Branch_no)
      );

    Create table Books(
  	  ISBN INT Primary Key,
      Book_title varchar(100),
      Category varchar(100),
      Rental_Price DECIMAL(10, 2),
      Status char(4) check (Status IN ('Yes','No')),
      Author varchar(100),
      Publisher varchar(100)
  	  );
    
    Create table Customer (
      Customer_Id INT Primary Key,
    	Customer_name varchar(100),
    	Customer_address varchar(100),
    	Reg_date datetime
      );

   Create table IssueStatus(
  	  Issue_Id INT Primary Key,
      Issued_cust INT ,  
      Issued_book_name varchar(100),
      Issue_date datetime,
      Isbn_book INT,
      Foreign key (Issued_cust) references Customer(Customer_Id),
  	  Foreign key (Isbn_book) references Books(ISBN)
      );

  Create table ReturnStatus(
  	  Return_Id INT Primary Key,
      Return_cust varchar(100),
      Return_book_name varchar(100),
      Return_date datetime,
      Isbn_book2 INT,
      Foreign Key (Isbn_book2) references Books(ISBN)    
  	  );