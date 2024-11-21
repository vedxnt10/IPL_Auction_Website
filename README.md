# **Screenshots**
![Screenshot (915)](https://github.com/user-attachments/assets/c5ba3d7b-2176-4354-af9e-f61b93403974)
![Screenshot (916)](https://github.com/user-attachments/assets/acf1941e-c3a1-4ea5-bb9f-7ebc15239a68)
![Screenshot (917)](https://github.com/user-attachments/assets/4c590c86-6a8e-4dbd-9429-81c77c7ffb16)
![Screenshot (918)](https://github.com/user-attachments/assets/e6e2bed7-b80e-4953-8a2f-916e738e1dbe)
![Screenshot (921)](https://github.com/user-attachments/assets/86ad4606-61bd-49e6-8d01-b912f01aced4)
![Screenshot (919)](https://github.com/user-attachments/assets/8665216e-f1c5-4775-b497-751dba48cd25)
![Screenshot (920)](https://github.com/user-attachments/assets/a1839f7c-5504-4039-ad5e-55931f291bf0)
![Screenshot (924)](https://github.com/user-attachments/assets/e1dd013b-3b5a-4075-9c3d-45175819c72d)
![Screenshot (926)](https://github.com/user-attachments/assets/fe3731ad-7b8c-4b06-ab07-f2cb59d8cf27)


# **IPL Auction Web Application**
## **Description**
This project is a real-time web application designed for players to bid on teams and secure a place in the offline IPL auction. Key features include:
- **Real-Time Dashboards**: Players can view live dashboards and track their rankings.
- **User-Friendly Registration**: A streamlined team sign-up system reduces registration time.

---

## **Features**

1. **Registration System**
-Teams can register with their details such as team name, leader, and contact information.
-Prevents duplicate team names.
2. **Login & Authentication**
-Secure login using team credentials.
-Redirects authenticated users to a personalized dashboard.
3. **Bidding System**
-Players can place bids on teams in real-time.
-Tracks bidding history with timestamps.
4. **Leaderboard**
-Displays rankings based on total bid amounts.

---

## **How to Run**

### **Prerequisites**
- **Java JDK** (version 8 or above)
- **Apache Tomcat** (version 9 or above)
- **MySQL** (with a pre-configured database)
- **Maven**

### **Setup Instructions**
1. **Clone the repository:**
   ```bash
   git clone <repository_url>
   cd <project_directory>
2. **Configure the database:**
   - Create a MySQL database named newipl
   - Create 2 tables namely history and teams
   - Schema for history :
      | Field          | Type        | Null | Key | Default | Extra |
      |----------------|-------------|------|-----|---------|-------|
      | ID             | int         | YES  |     | NULL    |       |
      | TEAM_NAME      | varchar(40) | YES  |     | NULL    |       |
      | TIMES          | varchar(30) | YES  |     | NULL    |       |
      | DATES          | varchar(30) | YES  |     | NULL    |       |
      | AMOUNT         | int         | YES  |     | NULL    |       |
      | PRIORITY_TEAM  | varchar(30) | YES  |     | NULL    |       |
      | TRANSACTION_ID | bigint      | YES  |     | NULL    |       |
   - Schema for teams :
      | Field         | Type        | Null | Key | Default | Extra |
      |---------------|-------------|------|-----|---------|-------|
      | ID            | int         | YES  |     | NULL    |       |
      | TEAM_NAME     | varchar(40) | YES  |     | NULL    |       |
      | TEAM_LEAD     | varchar(40) | YES  |     | NULL    |       |
      | PASSWORD      | varchar(40) | YES  |     | NULL    |       |
      | TOTAL_AMOUNT  | int         | YES  |     | NULL    |       |
      | PRIORITY_TEAM | varchar(40) | YES  |     | NULL    |       |
      | PHONE         | varchar(13) | YES  |     | NULL    |       |
      | EMAIL         | varchar(40) | YES  |     | NULL    |       |
   - Update database credentials in MainController.java
   - String dbUser = "root";
   - String dbpass = "root@123";
3. **Build & deploy the project:**
    ```bash
   mvn clean install

