# online_retail_sales_db
A comprehensive database design project for an Online Retail Sales platform, featuring a 3NF normalized PostgreSQL schema, ERD, DDL for table creation, DML for sample data, and SQL queries for sales reporting.
# Online Retail Sales Database Design

# Project Objective

The primary objective of this project is to design a well-normalized SQL schema for an e-commerce platform. This involves identifying key entities, defining their relationships, ensuring data integrity through proper normalization (up to 3NF), and demonstrating the database's functionality with sample data and reporting queries.

# Tools Used

* **Database Management System (DBMS):** PostgreSQL
* **ER Diagram Design:** [dbdiagram.io]([https://dbdiagram.io](https://dbdiagram.io/d/68822b08cca18e685c8ee788)/)

# Database Schema Overview

The database schema is designed to support core online retail operations, structured into the following key tables, ensuring a 3rd Normal Form (3NF) compliant design:

* `Customers`: Stores user registration details, including personal and contact information.
* `Categories`: Holds different categories to organize products (e.g., Electronics, Books).
* `Products`: Contains information about all items available for sale, including pricing, stock, and category.
* `Orders`: Records details of each customer order, such as order date, total amount, and status.
* `Order_Items`: A crucial junction table that captures the many-to-many relationship between `Orders` and `Products`. It details which products were part of which order, their quantity,    and the price at the time of purchase.
* `Payments`: Stores records of all payment transactions associated with orders.

# Project Structure

Online_Retail_Sales_DB/
├── schema.sql
├── sample_data.sql
├── reports.sql
└── README.md

# How to Set Up and Use the Database

Follow these steps to set up and interact with the database on your local machine:

#Prerequisites

* **PostgreSQL:** Ensure you have PostgreSQL installed and running on your system.
* **psql client:** The command-line interface for PostgreSQL is recommended for running the scripts.

### Setup Instructions

1.  **Create a New Database:**
    Open your PostgreSQL client (e.g., `psql` terminal, pgAdmin, DBeaver) and create a new database.
    ```sql
    CREATE DATABASE retail_sales_db;
    ```

2.  **Connect to the Database:**
    Connect to your newly created database.
    ```bash
    psql -U your_username -d retail_sales_db
    ```
    (Replace `your_username` with your PostgreSQL username)

3.  **Create Tables (Run `schema.sql`):**
    Execute the `schema.sql` script to create all the necessary tables with their defined columns, primary keys, foreign keys, and constraints.
    ```bash
    psql -U your_username -d retail_sales_db -f schema.sql
    ```

4.  **Populate with Sample Data (Run `sample_data.sql`):**
    After creating the tables, populate them with sample data using the `sample_data.sql` script. This data will be used for testing queries.
    ```bash
    psql -U your_username -d retail_sales_db -f sample_data.sql
    ```

## Exploring Data and Reports

Once the database is set up and populated, you can run the reporting queries and views:

1.  **Execute Reporting Queries and Views (Run `reports.sql`):**
    This script contains various `JOIN` queries to retrieve combined data and defines several SQL `VIEW`s for common reporting needs.
    ```bash
    psql -U your_username -d retail_sales_db -f reports.sql
    ```

2.  **Interact Directly (Optional):**
    You can also connect to your `retail_sales_db` using your PostgreSQL client and run individual `SELECT` statements from `reports.sql` or
    create your own queries to explore the data.
    ```sql
    -- Example: Select all customers
    SELECT * FROM Customers;

    -- Example: Use a created view
    SELECT * FROM Customer_Spending_Summary;
    ```

## ER Diagram

You can visualize the complete database schema and its relationships by importing the `dbdiagram.io` definition used during the design phase.

* **Link to dbdiagram.io ERD: https://dbdiagram.io/d/68822b08cca18e685c8ee788**
    

## Deliverables Checklist

The following deliverables have been produced as part of this project:

* [x] **ER Diagram:** Conceptual and Logical ER Diagram, finalized in 3NF (available via dbdiagram.io link).
* [x] **SQL Schema (DDL):** `schema.sql` file containing all `CREATE TABLE` statements with constraints.
* [x] **Sample Data (DML):** `sample_data.sql` file for populating the tables with realistic data.
* [x] **Query Report:** `reports.sql` file containing `JOIN` queries and `VIEW` definitions for sales analysis.


## Project Outcome

This project successfully demonstrates the entire lifecycle of designing a normalized SQL database for an online retail platform. 
From conceptual entity identification to detailed DDL scripting, data population, and complex query generation,
it provides a robust foundation for understanding relational database principles and their application in real-world scenarios.
