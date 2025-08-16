Purpose: Demonstrates a modern retail data platform including ETL pipelines, data warehouses, and analytics.

Key components:

Catalog (MongoDB NoSQL) → product metadata for AceCart (laptops, mobiles, tablets)

Transactional (MySQL OLTP) → inventory and sales data

Staging warehouse (PostgreSQL) → temporary staging area for transformed data

Production warehouse (IBM DB2 Cloud) → dimensional model for BI dashboards

ETL pipelines (Apache Airflow) → move/transform data between OLTP, NoSQL, and warehouses

Analytics/BI: Spark for analysis, IBM Cognos Analytics for dashboards

Big Data platform: Hadoop cluster for raw data collection
