# LibraFlow-Library-Management-System
LibraFlow is a comprehensive Library Management System designed to efficiently track books, manage branches, employees, and customers, and streamline book issuance and return processes
🛠️ Features

    Maintain and track books, employees, customers, and transactions
    
    Issue and return book records with real-time status updates
    
    Query-based reporting for insights into book availability, employee details, and customer activities
    
    Data integrity with foreign key relationships

🏛 Database Schema

    The project consists of six core tables:
    
    Branch (Tracks library branches and managers)
    
    Employee (Manages employee details and salaries)
    
    Books (Stores book details including availability and price)
    
    Customer (Manages customer information and registration)
    
    IssueStatus (Records book issuance transactions)
    
    ReturnStatus (Records book return transactions)

SQL QUERIES

1. /**Create a database named library

      create database Library;

2. Create Six tables 
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
3. INSERTINg DATA INTO THE TABLES
              -- Insert records into Branch
      INSERT INTO Branch VALUES 
      (101, 201, '123 Main St, New York, NY', 9876543210),
      (102, 202, '456 Elm St, Los Angeles, CA', 9876543211),
      (103, 203, '789 Maple St, Chicago, IL', 9876543212),
      (104, 204, '101 Pine St, Houston, TX', 9876543213),
      (105, 205, '202 Oak St, Phoenix, AZ', 9876543214),
      (106, 206, '303 Birch St, San Francisco, CA', 9876543215),
      (107, 207, '404 Cedar St, Seattle, WA', 9876543216),
      (108, 208, '505 Walnut St, Denver, CO', 9876543217),
      (109, 209, '606 Spruce St, Miami, FL', 9876543218),
      (110, 210, '707 Aspen St, Boston, MA', 9876543219);
      
      -- Insert records into Employee
      INSERT INTO Employee VALUES 
      (301, 'John Doe', 'Manager', 75000, 101),
      (302, 'Jane Smith', 'Assistant', 50000, 102),
      (303, 'Mike Johnson', 'Clerk', 40000, 103),
      (304, 'Emily Davis', 'Librarian', 55000, 104),
      (305, 'Chris Wilson', 'Manager', 77000, 105),
      (306, 'Sara White', 'Clerk', 42000, 106),
      (307, 'Tom Brown', 'Librarian', 56000, 107),
      (308, 'Laura Green', 'Assistant', 52000, 108),
      (309, 'James Black', 'Manager', 80000, 109),
      (310, 'Anna Grey', 'Clerk', 43000, 110);
      
      -- Insert records into Books
      INSERT INTO Books VALUES 
      (1001, 'SQL Mastery', 'Technology', 15.99, 'Yes', 'John Doe', 'TechPress'),
      (1002, 'Python Basics', 'Programming', 20.99, 'Yes', 'Jane Smith', 'CodeHouse'),
      (1003, 'Data Science 101', 'Data', 25.99, 'No', 'Mike Johnson', 'DataWorld'),
      (1004, 'Web Dev Guide', 'Technology', 17.50, 'Yes', 'Emily Davis', 'WebBooks'),
      (1005, 'AI for Beginners', 'AI', 22.00, 'No', 'Chris Wilson', 'AI Press'),
      (1006, 'Machine Learning', 'AI', 30.00, 'Yes', 'Sara White', 'TechPress'),
      (1007, 'Cloud Computing', 'Technology', 19.99, 'Yes', 'Tom Brown', 'CloudHub'),
      (1008, 'Cyber Security', 'Security', 21.50, 'No', 'Laura Green', 'SecurePub'),
      (1009, 'Big Data Insights', 'Data', 28.75, 'Yes', 'James Black', 'DataWorld'),
      (1010, 'Java Programming', 'Programming', 24.50, 'Yes', 'Anna Grey', 'CodeHouse');
      
      -- Insert records into Customer
      INSERT INTO Customer VALUES 
      (401, 'Alice Walker', '123 Maple St, NY', '2022-01-15'),
      (402, 'Bob Marley', '456 Pine St, CA', '2022-02-20'),
      (403, 'Charlie Brown', '789 Oak St, IL', '2022-03-25'),
      (404, 'Diana Prince', '101 Cedar St, TX', '2022-04-10'),
      (405, 'Evan Wright', '202 Walnut St, AZ', '2022-05-05'),
      (406, 'Fiona Glen', '303 Birch St, CA', '2022-06-12'),
      (407, 'George Orwell', '404 Spruce St, WA', '2022-07-18'),
      (408, 'Hannah Lee', '505 Aspen St, CO', '2022-08-23'),
      (409, 'Ian Fleming', '606 Elm St, FL', '2022-09-30'),
      (410, 'Jack Ryan', '707 Main St, MA', '2022-10-05');
      
      -- Insert records into IssueStatus
      INSERT INTO IssueStatus VALUES 
      (501, 401, 'SQL Mastery', '2023-01-10', 1001),
      (502, 402, 'Python Basics', '2023-01-11', 1002),
      (503, 403, 'Data Science 101', '2023-01-12', 1003),
      (504, 404, 'Web Dev Guide', '2023-01-13', 1004),
      (505, 405, 'AI for Beginners', '2023-01-14', 1005),
      (506, 406, 'Machine Learning', '2023-01-15', 1006),
      (507, 407, 'Cloud Computing', '2023-01-16', 1007),
      (508, 408, 'Cyber Security', '2023-01-17', 1008),
      (509, 409, 'Big Data Insights', '2023-01-18', 1009),
      (510, 410, 'Java Programming', '2023-01-19', 1010);
      
      -- Insert records into ReturnStatus
      INSERT INTO ReturnStatus VALUES 
      (601, 'Alice Walker', 'SQL Mastery', '2023-01-20', 1001),
      (602, 'Bob Marley', 'Python Basics', '2023-01-21', 1002),
      (603, 'Charlie Brown', 'Data Science 101', '2023-01-22', 1003),
      (604, 'Diana Prince', 'Web Dev Guide', '2023-01-23', 1004),
      (605, 'Evan Wright', 'AI for Beginners', '2023-01-24', 1005),
      (606, 'Fiona Glen', 'Machine Learning', '2023-01-25', 1006),
      (607, 'George Orwell', 'Cloud Computing', '2023-01-26', 1007),
      (608, 'Hannah Lee', 'Cyber Security', '2023-01-27', 1008),
      (609, 'Ian Fleming', 'Big Data Insights', '2023-01-28', 1009),
      (610, 'Jack Ryan', 'Java Programming', '2023-01-29', 1010);

4. Retrieve the book title, category, and rental price of all available books.
     	select Book_title ,Category ,Rental_Price  from Books where status='Yes'

5. List the employee names and their respective salaries in descending order of salary
		  select Emp_name,Salary from Employee order by salary desc

6. Retrieve the book titles and the corresponding customers who have issued those books
      select c.Customer_name,B.Book_title from IssueStatus i
      join Customer c on c.Customer_Id=i.Issued_cust
      join Books B on B.ISBN=i.Isbn_book 

9. Display the total count of books in each category.
      select Category,count(*) as CountOfBooks from Books group by  Category;

10.Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000
         select Emp_name,Position from Employee where salary=50000

11. List the customer names who registered before 2022-01-01 and have not issued any books yet.
	select c.Customer_name from Customer c
     	left join IssueStatus i on c.Customer_Id=i.Issued_cust
     	where c.Reg_date <'2022-01-01' and i.issue_id is null

12. Display the branch numbers and the total count of employees in each branch.
	SELECT branch_no, COUNT(*) AS total_employees
	FROM Employee
	GROUP BY branch_no
	ORDER BY branch_no;

13. Display the names of customers who have issued books in the month of June 2023
    
	select c.Customer_name from IssueStatus i 
	inner join Customer c on c.Customer_Id=i.Issued_cust
	where i.Issue_date between '2023-06-01' and '2023-06-30'

14. Retrieve Book_title from book table containing history
	SELECT Book_title
	FROM Books
	WHERE book_title LIKE '%history%';

16. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
       	select Branch_no, count(Emp_Id) from Employee
    	group by Branch_no having count(Emp_Id)>5
    	order by Branch_no desc
    
17. 
