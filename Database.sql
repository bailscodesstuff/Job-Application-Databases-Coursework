create table candidate(
	candidate_number integer primary key,
	first_name varchar(20) NOT NULL,
	last_name varchar(20) NOT NULL,
	phone_number integer NOT NULL UNIQUE
	);

create table company(
	company_name varchar(30) primary key,
	comapany_id integer NOT NULL
	);

##my three relational databases
create table qualification(
	qualification_name varchar(25) NOT NULL,
	candidate_number integer NOT NULL,
	FOREIGN KEY (candidate_number) REFERENCES candidate(candidate_number)
	);

create table job_history(
	job_number integer primary key,
	candidate_number integer NOT NULL,
	title varchar(30) NOT NULL,
	FOREIGN KEY (candidate_number) REFERENCES candidate(candidate_number)
	);

create table openings(
	opening_number integer primary key,
	company_name varchar(30) not null,
	hourly_pay money not null,
	start_date date not null,
	end_date date not null,
	required_qualifications varchar(30) not null,
	FOREIGN KEY (company_name) REFERENCES company(company_name)
	);



insert into qualification(qualification_name, candidate_number) values
	("History Degree", 103),
	("Maths Degree", 105),
	("PE A-Level", 107);



insert into qualification(qualification_name, candidate_number) values
	("Maths GCSE", 101),
	("English A-Level", 101),
	("History Degree", 102)
	

insert into job_history(job_number, candidate_number, title) values
	(1, 101, "Data Scientist"),
	(4, 102, "Teacher"),
	(10, 102, "Politician");

insert into openings(opening_number, company_name, hourly_pay, start_date, end_date,
	required_qualifications) values
	(13344, "Tax Assitant", 9.99, "2012-12-04", "2015-09-05", "Maths GCSE"),
	(13355, "Data Company", 19.99, "2017-07-12", "2021-07-12", "Maths Degree"),
	(14355, "Historian", 30.08, "2011-10-10", "2021-10-10", "History Degree");



insert into qualification(qualification_name, candidate_number) values
	("Maths GCSE", 104),
	("English A-Level", 105),
	("Maths GCSE", 107);

insert into job_history(job_number, candidate_number, title) values
	(6, 104, "Teacher"),
	(7, 107, "Cleaner"),
	(11, 105, "Journalist");

insert into qualification(qualification_name, candidate_number) values
	("Maths Degree", 107);

insert into candidate(candidate_number, first_name, last_name, phone_number) values
	(101, "Timmy", "Tervo", "07347818908"),
	(102, "Bernard", "Mansfield", "07152951094"),
	(103, "John", "Smith", "07293783400"),
	(104, "harry", "potter", "07347999098"),
	(105, "karen", "van", "07938651344"),
	(107, "lionel", "Smesy", "07416883401");


insert into openings(opening_number, company_name, hourly_pay, start_date, end_date,
	required_qualifications) values
	
	(15000, "Tax Organisation", 15.09, "2012-12-04", "2015-09-05", "Maths Degree"),
	(3, "Data Organisation", 45.90, "2017-07-12", "2021-07-12", "Maths Degree"),
	(4, "Teacher CO", 25.00, "2011-10-10", "2021-10-10", "English A-Level");

insert into openings(opening_number, company_name, hourly_pay, start_date, end_date,
	required_qualifications) values
	(9, "English Co", 16.00, "2011-10-10", "2021-10-10", "English A-Level");


insert into qualification(qualification_name, candidate_number) values
	("Maths Degree", 107);






select qualification.candidate_number as 'Candidate ID',
qualification.qualification_name as "Qualification",
candidate.first_name as "First Name", 
openings.company_name as "Company Name"
from qualification
LEFT JOIN openings on openings.required_qualifications=qualification.qualification_name
LEFT JOIN candidate on candidate.candidate_number=qualification.candidate_number


where qualification.qualification_name = openings.required_qualifications
GROUP BY openings.company_name
	HAVING openings.hourly_pay > 15.00

ORDER BY qualification.candidate_number DESC;
