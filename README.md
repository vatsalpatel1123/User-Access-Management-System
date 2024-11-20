# **User Access Management System** 
## **Project Overview**
The **User Access Management System** is a web-based application that allows users to sign up, log in, request access to software applications, and enables managers to approve or reject these access requests. The system is built using Java Servlets, JSP, and PostgreSQL as the database management system.
### **Key Features**
- **User Registration (Sign-Up)**: Users can sign up and create an account with a default role of **Employee**.
- **User Authentication (Login)**: Registered users can log in with their credentials.
- **Software Management (Admin Only)**: Admins can add new software applications.
- **Access Request Submission**: Employees can request access to software applications.
- **Access Request Approval**: Managers can approve or reject access requests.
---
## **Technologies Used**
- **Backend**: Java Servlets
- **Frontend**: JavaServer Pages (JSP)
- **Database**: PostgreSQL
- **Build Tool**: Maven
- **Server**: Apache Tomcat or equivalent Java servlet container
---
## **System Requirements**
- Java Development Kit (JDK) 8 or above
- Apache Tomcat 9 or above
- PostgreSQL 12 or above
- Maven 3.8 or above
---
## **Project Setup Instructions**
### **Step 1: Install Prerequisites**
1. **Java Development Kit (JDK)**:
   - Download and install the [JDK](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html).
   - Ensure `JAVA_HOME` environment variable is set correctly.
2. **Apache Tomcat**:
   - Download and install [Apache Tomcat](https://tomcat.apache.org/).
   - Set up your environment to use Tomcat by adding the `CATALINA_HOME` environment variable.
3. **PostgreSQL**:
   - Install PostgreSQL from [here](https://www.postgresql.org/download/).
   - Set up a PostgreSQL database and create a user to manage the application.
4. **Maven**:
   - Install Maven from [here](https://maven.apache.org/download.cgi) and set up the `MAVEN_HOME` environment variable.
---
### **Step 2: Database Setup**
1. **Create Database**:
   - In PostgreSQL, create a new database for the application:
   ```sql
   CREATE DATABASE demo;
   ```
2. **Create Tables**:
   - Use the provided **SQL script** (e.g., `create_tables.sql`) to create the necessary tables:
   ```sql
   -- users table
   CREATE TABLE users (
       id SERIAL PRIMARY KEY,
       username VARCHAR(255) UNIQUE NOT NULL,
       password VARCHAR(255) NOT NULL,
       role VARCHAR(50) NOT NULL
   );
   -- software table
   CREATE TABLE software (
       id SERIAL PRIMARY KEY,
       name VARCHAR(255) NOT NULL,
       description TEXT,
       access_levels TEXT
   );
   -- requests table
   CREATE TABLE requests (
       id SERIAL PRIMARY KEY,
       user_id INTEGER REFERENCES users(id),
       software_id INTEGER REFERENCES software(id),
       access_type VARCHAR(50),
       reason TEXT,
       status VARCHAR(50) DEFAULT 'Pending'
   );
   ```
---
### **Step 3: Configuring the Project**
### **Step 4: Build the Project with Maven**
1. Navigate to the project root directory and run the following Maven command to build the project:
   ```bash
   mvn clean install
   ```
2. The Maven build will download the required dependencies, compile the code, and package the project into a `.war` file.
---
### **Step 5: Deploy the Application to Apache Tomcat**
1. **Deploy WAR File**:
   - Copy the generated `.war` file from the `target/` directory into the **webapps** folder of your Tomcat server.
   Example: `target/user-access-management.war` → `tomcat/webapps/`.
2. **Start Tomcat**:
   - Start the Tomcat server by navigating to the `bin` directory and running:
   ```bash
   ./startup.sh   # On Linux/Mac
   startup.bat    # On Windows
   ```
3. **Access the Application**:
   - Open a web browser and navigate to:
   ```
   http://localhost:8080/user-access-management
   ```
   You should be able to see the application homepage and start using the system.
---
## **Running the System**
### **1. Sign Up**
- Navigate to the **Sign-Up Page** (`signup.jsp`), enter your details, and submit the form.
- This will create a new user with the role **Employee**.
### **2. Login**
- Go to the **Login Page** (`login.jsp`), enter your username and password, and log in.
- Based on your role, you'll be redirected to the appropriate page:
  - **Employee**: Access Request Page (`requestAccess.jsp`)
  - **Manager**: Pending Requests Page (`pendingRequests.jsp`)
  - **Admin**: Software Creation Page (`createSoftware.jsp`)
### **3. Admin Features**
- Admin users can create software applications through the **Software Creation Page** (`createSoftware.jsp`).
- Admins have full access to manage users, software, and requests.
### **4. Employee Features**
- Employees can request access to software applications via the **Access Request Page** (`requestAccess.jsp`).
### **5. Manager Features**
- Managers can view pending requests and approve or reject them on the **Pending Requests Page** (`pendingRequests.jsp`).
---
## **Troubleshooting**
- **Database Connection Issues**: Ensure your PostgreSQL server is running and that the connection settings (URL, username, password) are correct in the servlets.
- **Server Not Starting**: Check the Tomcat logs for any errors. Ensure that your `.war` file is correctly deployed.
- **Page Not Found**: Double-check that the Tomcat server is running on the correct port and that the `.war` file is deployed successfully.
---
## **License**
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
---

This **README** provides comprehensive instructions to set up and run the **User Access Management System** locally, covering all the required steps from database creation to deploying the application.
