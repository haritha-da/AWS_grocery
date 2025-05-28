# GroceryMate

## 🏆 GroceryMate E-Commerce Platform

[![Python](https://img.shields.io/badge/Language-Python%2C%20JavaScript-blue)](https://www.python.org/)
[![OS](https://img.shields.io/badge/OS-Linux%2C%20Windows%2C%20macOS-green)](https://www.kernel.org/)
[![Database](https://img.shields.io/badge/Database-PostgreSQL-336791)](https://www.postgresql.org/)
[![GitHub Release](https://img.shields.io/github/v/release/AlejandroRomanIbanez/AWS_grocery)](https://github.com/AlejandroRomanIbanez/AWS_grocery/releases/tag/v2.0.0)
[![Free](https://img.shields.io/badge/Free_for_Non_Commercial_Use-brightgreen)](#-license)

⭐ **Star us on GitHub** — it motivates us a lot!

---

## 📌 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Screenshots & Demo](#-screenshots--demo)
- [Prerequisites](#-prerequisites)
- [Installation](#-installation)
  - [Clone Repository](#-clone-repository)
  - [Configure PostgreSQL](#-configure-postgresql)
  - [Populate Database](#-populate-database)
  - [Set Up Python Environment](#-set-up-python-environment)
  - [Set Environment Variables](#-set-environment-variables)
  - [Start the Application](#-start-the-application)
- [AWS Setup](#-AWS-Setup)
- [Fork & Deploy](#-Fork-&-Deploy)
- [Docker](#-Docker)
- [Database on RDS](#-Database-on-RDS)
- [Infrastructure as Code](#-Infrastructure-as-Code)
- [S3 Integration](#-S3-Integration)
- [AWS Deployment Steps](#-AWS-Deployment-Steps)
   - [EC2](#-EC2)
   - [ELB](#-ELB)
   - [RDS](#-RDS)
   - [Running with Docker](#-Running-with-Docker)
   - [S3](#-S3)
   - [Infrastructure as Code](#-Infrastructure-as-Code)
   - [Deploy with Terraform](#-Deploy-with-Terraform)
- [Contributing](#-contributing)
- [Acknowledgements](#-Acknowledgements)
- [License](#-license)

## 🚀 Overview

GroceryMate is an application developed as part of the Masterschools program by **Alejandro Roman Ibanez**. It is a modern, full-featured e-commerce platform designed for seamless online grocery shopping. It provides an intuitive user interface and a secure backend, allowing users to browse products, manage their shopping basket, and complete purchases efficiently.

GroceryMate is a modern, full-featured e-commerce platform designed for seamless online grocery shopping. It provides an intuitive user interface and a secure backend, allowing users to browse products, manage their shopping basket, and complete purchases efficiently.

## 🛒 Features

- **🛡️ User Authentication**: Secure registration, login, and session management.
- **🔒 Protected Routes**: Access control for authenticated users.
- **🔎 Product Search & Filtering**: Browse products, apply filters, and sort by category or price.
- **⭐ Favorites Management**: Save preferred products.
- **🛍️ Shopping Basket**: Add, view, modify, and remove items.
- **💳 Checkout Process**:
  - Secure billing and shipping information handling.
  - Multiple payment options.
  - Automatic total price calculation.

## 📸 Screenshots & Demo

![imagen](https://github.com/user-attachments/assets/ea039195-67a2-4bf2-9613-2ee1e666231a)
![imagen](https://github.com/user-attachments/assets/a87e5c50-5a9e-45b8-ad16-2dbff41acd00)
![imagen](https://github.com/user-attachments/assets/589aae62-67ef-4496-bd3b-772cd32ca386)
![imagen](https://github.com/user-attachments/assets/2772b85e-81f7-446a-9296-4fdc2b652cb7)

<img width="1340" alt="s3 content" src="https://github.com/user-attachments/assets/32448cea-0954-413b-aaab-2cf2033bdaea" />

https://github.com/user-attachments/assets/d1c5c8e4-5b16-486a-b709-4cf6e6cce6bc

## 📋 Prerequisites

Ensure the following dependencies are installed before running the application:

- **🐍 Python (>=3.11)**
- **🐘 PostgreSQL** – Database for storing product and user information.
- **🛠️ Git** – Version control system.

## ⚙️ Installation

### 🔹 Clone Repository

```sh
git clone --branch version2 https://github.com/AlejandroRomanIbanez/AWS_grocery.git && cd AWS_grocery
```

### 🔹 Configure PostgreSQL

Before creating the database user, you can choose a custom username and password to enhance security. Replace `<your_secure_password>` with a strong password of your choice in the following commands.

Create database and user:

```sh
psql -U postgres -c "CREATE DATABASE grocerymate_db;"
psql -U postgres -c "CREATE USER grocery_user WITH ENCRYPTED PASSWORD '<your_secure_password>';"  # Replace <your_secure_password> with a strong password of your choice
psql -U postgres -c "ALTER USER grocery_user WITH SUPERUSER;"
```

### 🔹 Populate Database

```sh
psql -U grocery_user -d grocerymate_db -f backend/app/sqlite_dump_clean.sql
```

Verify insertion:

```sh
psql -U grocery_user -d grocerymate_db -c "SELECT * FROM users;"
psql -U grocery_user -d grocerymate_db -c "SELECT * FROM products;"
```

### 🔹 Set Up Python Environment


Install dependencies in an activated virtual Enviroment:

```sh
cd backend
pip install -r requirements.txt
```
OR (if pip doesn't exist)
```sh
pip3 install -r requirements.txt
```

### 🔹 Set Environment Variables

Create a `.env` file:

```sh
touch .env  # macOS/Linux
ni .env -Force  # Windows
```

Generate a secure JWT key:

```sh
python3 -c "import secrets; print(secrets.token_hex(32))"
```

Update `.env` with:

```ini
JWT_SECRET_KEY=<your_generated_key>
POSTGRES_USER=grocery_user
POSTGRES_PASSWORD=<your_password>
POSTGRES_DB=grocerymate_db
POSTGRES_HOST=localhost
POSTGRES_URI=postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:5432/${POSTGRES_DB}
```

### 🔹 Start the Application

```sh
python3 run.py
```

###  AWS Setup

- ✅ Connected to AWS account using IAM and SSO  
- ✅ Launched an EC2 instance in default VPC  
- ✅ Connected to EC2 using SSH and verified with a "Hello World" command  

###  Fork & Deploy

- ✅ Forked the GroceryMate repository  
- ✅ Deployed app on EC2 instance  
- ✅ Exposed the app to the internet using security groups  
- ✅ Set up an Elastic Load Balancer (ELB)  

###  Docker

- ✅ Created and pushed a custom `Dockerfile`  
- ✅ Built and ran Docker locally using `host.docker.internal` for PostgreSQL  
- ✅ Built and deployed Docker container on EC2  

###  Database on RDS

- ✅ Created an RDS PostgreSQL instance  
- ✅ Migrated the app's local DB to RDS  
- ✅ Allowed EC2 to connect to private RDS using security groups  
- ✅ Enabled RDS encryption and restricted access  

###  Infrastructure as Code

- ✅ Created `infrastructure/` folder in the forked repo  
- ✅ Wrote Terraform files for provisioning EC2, Security Groups, and RDS  
- ✅ Used AWS CLI and SSO to manage infrastructure  

###  S3 Integration

- ✅ Deployed S3 bucket using Terraform  
- ✅ Uploaded avatar images to S3 via AWS CLI  
- ✅ Modified app to pull avatars from S3 instead of local files  

---
## ☁️ AWS Deployment Steps

### EC2

- Deployed Docker container on Amazon Linux EC2  
- Security group allows HTTP/HTTPS traffic only from ELB

### ELB

- Attached EC2 instances to ELB  
- Health checks configured for `/health` endpoint  

### RDS

- PostgreSQL RDS instance in private subnet  
- Security group allows inbound from EC2 instance only

## 🐳 Running with Docker

### Build and run locally:

```bash
docker build -t grocerymate .
docker run -p 5000:5000 --env-file .env grocerymate
```

### S3

- Created S3 bucket via Terraform  
- Used AWS CLI to upload images  
- Updated app to use S3 URLs for avatar images  

---

## 📁 Infrastructure as Code (Terraform)

Folder: `/infrastructure`

Includes:

- `main.tf`: Provider and VPC setup  
- `ec2.tf`: EC2 instance definition  
- `rds.tf`: RDS PostgreSQL definition  
- `s3.tf`: S3 bucket and policy  
- `outputs.tf`: Output variables

### Deploy with Terraform

```bash
cd infrastructure
terraform init
terraform apply
```

---

## 📖 Usage

- Access the application at [http://localhost:5000](http://localhost:5000)
- Register/Login to your account
- Browse and search for products
- Manage favorites and shopping basket
- Proceed through the checkout process

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository.
2. Create a new feature branch (`feature/your-feature`).
3. Implement your changes and commit them.
4. Push your branch and create a pull request.

## 🙌 Acknowledgements

- Masterschool Cloud Track  
- GroceryMate App by Alejandro Roman Ibanez  
- AWS Documentation  
- Docker and Terraform Community

---


## 📜 License

This project is licensed under the MIT License.




