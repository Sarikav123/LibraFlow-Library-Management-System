/**Retrieve the book title, category, and rental price of all available books.**/
     	select Book_title ,Category ,Rental_Price  from Books where status='Yes';

/** List the employee names and their respective salaries in descending order of salary**/
		  select Emp_name,Salary from Employee order by salary desc;

/** Retrieve the book titles and the corresponding customers who have issued those books**/
      select c.Customer_name,B.Book_title from IssueStatus i
      join Customer c on c.Customer_Id=i.Issued_cust
      join Books B on B.ISBN=i.Isbn_book ;

/** Display the total count of books in each category.**/
      select Category,count(*) as CountOfBooks from Books group by  Category;

/**Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000**/
         select Emp_name,Position from Employee where salary=50000;

/**List the customer names who registered before 2022-01-01 and have not issued any books yet.**/
	select c.Customer_name from Customer c
     	left join IssueStatus i on c.Customer_Id=i.Issued_cust
     	where c.Reg_date <'2022-01-01' and i.issue_id is null;

/** Display the branch numbers and the total count of employees in each branch.**/
	SELECT branch_no, COUNT(*) AS total_employees
	FROM Employee
	GROUP BY branch_no
	ORDER BY branch_no;

/**Display the names of customers who have issued books in the month of June 2023**/
    
	select c.Customer_name from IssueStatus i 
	inner join Customer c on c.Customer_Id=i.Issued_cust
	where i.Issue_date between '2023-06-01' and '2023-06-30';

/** Retrieve Book_title from book table containing history**/
	SELECT Book_title
	FROM Books
	WHERE book_title LIKE '%history%';

/**Retrieve the branch numbers along with the count of employees for branches having more than 5 employees**/
       	select Branch_no, count(Emp_Id) from Employee
    	group by Branch_no having count(Emp_Id)>5
    	order by Branch_no desc;
    
/** Retrieve the names of employees who manage branches and their respective branch addresses.**/

    	SELECT e.Emp_name
	FROM Branch b
	JOIN Employee e ON b.Manager_Id = e.Emp_Id;

/** Display the names of customers who have issued books with a rental price higher than Rs. 25.**/
     
	select Customer_name from Customer c
	inner join IssueStatus i on i.Issued_cust=c.Customer_Id
	inner join Books b on b.ISBN=i.Isbn_book
	where b.Rental_Price>25;