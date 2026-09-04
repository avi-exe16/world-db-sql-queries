## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

This repository contains a collection of SQL queries written for the MySQL **World** sample database. The queries cover a wide range of topics, from basic SELECT statements to advanced subqueries and window functions. The goal is to provide a structured set of examples that demonstrate how to work with relational data effectively.

## Contents
- `assignment.txt` – outputs generated from running the queries
- `queries.sql` – all queries (Q1–Q50) collected in one script
- `assignment_append.bat` – batch file template to append query results to `assignment.txt`
- `README.md` – documentation and overview of the project

## Setup
1. Install MySQL and import the World sample database.
2. Clone this repository:
   ```bash
   git clone https://github.com/avi-exe16/world-db-sql-queries
Run queries directly from queries.sql using:

bash
mysql -u root -p world < queries.sql
Or use the batch file to append results into assignment.txt.

Highlights
Queries demonstrate:

Aggregations (SUM, AVG, MAX, MIN)

Joins between Country, City, and CountryLanguage tables

Subqueries and correlated subqueries

Window functions such as RANK

Challenge problems like finding top N records and comparisons

Covers 50 queries in total, grouped into assignments and challenge sections.

Learning Outcomes
Working through these queries helps reinforce:

Understanding of relational database design

Practical SQL skills for analysis and reporting

Use of automation with batch scripts

Documentation and reproducibility in database projects

License
This project is licensed under the MIT License. See the [Looks like the result wasn't safe to show. Let's switch things up and try something else!] file for details.
