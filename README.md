# **User Access Management System**

## **1. Introduction**
### **1.1 Purpose**
This document defines the requirements for a **User Access Management System**, which allows users to sign up, request software access, and facilitates access approvals or rejections by managers. It details system functionalities, user roles, and their interactions.

### **1.2 Scope**
The system offers the following capabilities:
- **User Registration** (Sign-Up)
- **User Authentication** (Login)
- **Software Management** (Admin Only)
- **Access Requests** (Submission, Approval/Rejection)

### **Technologies Used**
- Backend: **Java Servlets**
- Frontend: **JavaServer Pages (JSP)**
- Database: **PostgreSQL**
- Build Tool: **Maven**

---

## **2. Overall Description**
### **2.1 Product Perspective**
This web-based tool is designed to streamline and secure user access to organizational software, ensuring effective role-based management.

### **2.2 Product Functions**
- **Sign-Up:** Employees create accounts with the default role of "Employee."
- **Login:** Authenticated access for Employees, Managers, and Admins.
- **Software Management:** Admins can create and manage software records.
- **Access Requests:** Employees can request access to software applications.
- **Approval System:** Managers review and decide on access requests.

### **2.3 User Roles**
1. **Employee**:  
   - Can sign up, log in, and request access to software.  
2. **Manager**:  
   - Can log in and approve/reject software access requests.  
3. **Admin**:  
   - Full privileges to manage users, software, and requests.

---

## **3. Specific Requirements**
### **3.1 Sign-Up System**
- **SignUpServlet.java**:
  - Registers new users in the `users` table with the role "Employee."
- **signup.jsp**:
  - Form fields: Username, Password (Role is hidden, default "Employee").  

### **3.2 Login System**
- **LoginServlet.java**:
  - Validates user credentials and manages sessions.
  - Role-based redirection:
    - Employee → **requestAccess.jsp**
    - Manager → **pendingRequests.jsp**
    - Admin → **createSoftware.jsp**
- **login.jsp**:
  - Form fields: Username, Password.

### **3.3 Software Management**
- **SoftwareServlet.java**:
  - Adds new software to the `software` table.
- **createSoftware.jsp**:
  - Form fields: Name, Description, Access Levels (Read, Write, Admin).

### **3.4 Access Request System**
- **RequestServlet.java**:
  - Logs requests in the `requests` table with status "Pending."
- **requestAccess.jsp**:
  - Form fields: Software (dropdown), Access Type, Reason.

### **3.5 Approval System**
- **ApprovalServlet.java**:
  - Updates request status to "Approved" or "Rejected."
- **pendingRequests.jsp**:
  - Displays pending requests for Manager actions.

---

## **4. Database Design**
### **Tables**
1. **users**:
   - `id`: Primary key  
   - `username`: Unique, text  
   - `password`: Text  
   - `role`: Enum (Employee, Manager, Admin)  

2. **software**:
   - `id`: Primary key  
   - `name`: Text  
   - `description`: Text  
   - `access_levels`: Text (Read, Write, Admin)  

3. **requests**:
   - `id`: Primary key  
   - `user_id`: Foreign key to `users`  
   - `software_id`: Foreign key to `software`  
   - `access_type`: Enum (Read, Write, Admin)  
   - `reason`: Text  
   - `status`: Enum (Pending, Approved, Rejected)  

---

## **5. Deliverables**
- Source Code:
  - Java Servlets: `SignUpServlet`, `LoginServlet`, `SoftwareServlet`, `RequestServlet`, `ApprovalServlet`.
  - JSP Pages: `signup.jsp`, `login.jsp`, `createSoftware.jsp`, `requestAccess.jsp`, `pendingRequests.jsp`.
- Database Scripts: SQL file to create and populate `users`, `software`, and `requests` tables.
- Documentation: Setup instructions and system overview.

---

## **6. Setup Instructions**
### **6.1 Prerequisites**
- **JDK 8+**
- **Apache Tomcat 9+**
- **PostgreSQL 12+**
- **Maven 3.8+**

### **6.2 Installation**
1.

**File Name:** `create_tables.sql`  
**Description:** This SQL script sets up the initial database schema for the application. It creates three essential tables: `users`, `software`, and `requests`, with their respective fields and relationships.

**Prerequisites:**
1. Ensure you have PostgreSQL installed on your system.
2. Create the database by running the following command in your PostgreSQL terminal or client:
   ```sql
   CREATE DATABASE demo;
   ```

**Steps to Use the Script:**
1. Open your PostgreSQL terminal or a database client like pgAdmin.
2. Connect to the `demo` database:
   ```bash
   \c demo
   ```
   Or use your database client's interface to select the `demo` database.
3. Run the script using one of the following methods:
   - From the terminal:
     ```bash
     psql -U <username> -d demo -f create_tables.sql
     ```
   - From a database client, upload and execute the `create_tables.sql` file.


2. **Project Build**:
   - Run Maven:
     ```bash
     mvn clean install
     ```
   - Deploy `.war` file to Tomcat’s `webapps` folder.

3. **Access Application**:
   - Launch Tomcat and visit:
     ```
     http://localhost:8080/User-Access-Management-System
     ```

---

## **7. Evaluation Criteria**
- **Functionality:** All role-based actions are functional.
- **Code Structure:** Well-organized servlets, JSP files, and database queries.
- **Database Interaction:** Requests and approvals are accurately recorded.

---

## **Author**
**Vatsal Patel**  
Email: [vatsal.private@gmail.com](mailto:vatsal.private@gmail.com)  
