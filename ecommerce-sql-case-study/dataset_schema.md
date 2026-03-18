# 🗂 Dataset Schema

The dataset consists of four relational tables:

## Customers
- customer_id
- name
- location

## Products
- product_id
- name
- category
- price

## Orders
- order_id
- order_date
- customer_id
- total_amount

## OrderDetails
- order_id
- product_id
- quantity
- price_per_unit
