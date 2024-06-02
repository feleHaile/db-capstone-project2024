# db-capstone-projectFele
This repository contans the code for a booking system designed to keep track of guests visiting Little Lemon resturant and their respective reservation times.
1. Title
Little Lemon Capstone Project: Designing and Implementing a Comprehensive Booking System

 2. Introduction
The Little Lemon Capstone Project aims to design and implement a robust database system for managing customer, order, menu, and booking information. This project also includes creating data visualizations using Tableau to provide insights into the business operations of Little Lemon. The project integrates several database management and data visualization techniques to enhance the efficiency and analytical capabilities of Little Lemon's operations.

 3. Project Objectives
•	Populate the database with provided data from an Excel file: Ensure accurate data migration and storage.
•	Develop and implement stored procedures for specific operations: Automate common database tasks to streamline operations.
•	Create insightful visualizations and dashboards in Tableau: Provide actionable insights through data visualization.
•	Document the entire process on GitHub: Ensure transparency and reproducibility of the project.
•	Prepare the project for peer review: Facilitate evaluation and feedback.

4. Project Scope
The project encompasses the following tasks:
•	Database Design: Creating a detailed database schema.
•	Data Ingestion: Importing data from an Excel file into the database, including data cleaning and transformation.
•	Stored Procedures Development: Implementing procedures like `GetMaxQuantity`, `ManageBooking`, `UpdateBooking`, `AddBooking`, and `CancelBooking`.
•	Data Visualization: Developing various dashboards and visualizations in Tableau to analyze sales and booking data.
•	Documentation: Documenting the entire process on GitHub.

5. ER Diagram
The Entity-Relationship (ER) diagram illustrates the database design and relationships between tables (Included in the Capstone project folder). 

 6. Data Ingestion Process
Data ingestion involves preparing and importing data from the Excel file into the database. This process includes the following steps:
•	Loading Data: Using Python to read the Excel file.
•	Data Cleaning: Removing duplicates and correcting inconsistencies.
•	Data Transformation: Converting data into the required formats.
•	Data Insertion: Using SQL to insert cleaned and transformed data into the database.
Importantly, the original dataset was significantly large, so it was reduced to a manageable sample size named LittleLemon_Data_Capstone.
7. Stored Procedures
Stored procedures automate repetitive tasks and ensure consistency in data management. The following procedures were implemented:
   `GetMaxQuantity`, `ManageBooking`, `UpdateBooking`, `AddBooking`, and `CancelBooking`.
 8. Data Visualizations
Data visualizations were created using Tableau to provide insights into sales and booking trends:
- Customer Sales Bar Chart: Displays sales for customers.
- Sales Trend Line Chart: Shows the sales trend by period.
- Sales Bubble Chart: Illustrates sales for all customers, highlighting names, profits, and sales on hover.
- Cuisine Sales Bar Chart: Compares sales of cuisines by period.
- Dynamic dashboard
9. Documentation and GitHub
The project is thoroughly documented and organized in the GitHub repository, which includes:
- ER Diagram
- SQL scripts for table creation and data insertion
- Stored procedure definitions
- Python scripts for data ingestion
- Tableau workbook
- README.md file explaining the project structure

GitHub Repository: [Little Lemon Capstone Project](https://github.com/feleHaile/db-capstone-project2024)

 10. Testing and Validation
The database and visualizations were tested for accuracy and reliability. This involved:
- Query validation: Ensuring SQL queries return correct results.
- Procedure testing: Verifying stored procedures perform as anticipated.
- Data consistency checks: Ensuring data integrity after insertion.
- Visualization accuracy: Cross-referencing Tableau visualizations with raw data.

 11. Challenges and Solutions
Several challenges were encountered and addressed during the project:
- Data Cleaning: Ensuring data consistency required extensive cleaning. This was managed using Python and pandas for automated data processing.
- Procedure Errors: Debugging SQL procedures involved meticulous examination of logic and syntax.
- Visualization Performance: Optimizing Tableau dashboards for better performance required efficient data querying and filtering techniques.

 12. Future Work
Potential future enhancements include:
- Additional Stored Procedures: Implementing more complex business logic.
- Advanced Analytics: Integrating predictive analytics and machine learning models.
- System Integration: Connecting the database with other business systems for real-time updates.

 13. Conclusion
The Little Lemon Capstone Project successfully implemented a comprehensive database and data visualization solution, enhancing the operational efficiency and analytical capabilities of Little Lemon. The project met all objectives and provided a solid foundation for future enhancements.

