# E-Commerce Database

This database is designed to manage users, products, and orders for an e-commerce application. It includes tables to store information about users, the products they purchase, and their orders. Additionally, views and queries are provided for analyzing data, such as calculating total sales, generating revenue reports, and tracking inventory.

## Key Features:
1. Users: Stores information about the users including username, email, and password.
2. Products: Stores information about the available products, including product names, descriptions, prices, and stock levels.
3. Orders: Tracks the orders placed by users, with details on the quantity of products purchased.

## Database Schema

### 1. Users Table
Stores user information.

- user_id (Primary Key): Unique identifier for each user.
- username: The name of the user.
- email: Email of the user (must be unique).
- password: User's password.

### 2. Products Table
Stores product information.

- product_id (Primary Key): Auto-generated unique identifier for each product.
- product_name: Name of the product.
- description: Description of the product.
- price: Price of the product.
- stock: Available stock of the product (default is 0).

### 3. Orders Table
Tracks product orders made by users.

- order_id (Primary Key): Auto-generated unique identifier for each order.
- user_id: Foreign key referencing the users table.
- product_id: Foreign key referencing the products table.
- quantity: The quantity of the product ordered (default is 1).

### Views
- Order_summary
This view provides a summary of the total orders placed by each user.
![image](https://github.com/user-attachments/assets/1bcfb83c-28db-4535-afc3-ed39324a02cf)


### Queries Containes
1. Retrieve all users and their emails,

2. Check products with more than 10 items in stock,

3. Check products cheaper than $20,

4. Get total number of orders per user,

5. Calculate total revenue from all orders,

6. Calculate total revenue per product,

7. Find total quantity of items sold for each product,

8. Calculate the total amount spent by each user.
