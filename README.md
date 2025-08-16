Purpose: Demonstrates a modern retail data platform including ETL pipelines, data warehouses, and analytics.

Key components:

1) Catalog (MongoDB NoSQL) → product metadata for AceCart (laptops, mobiles, tablets)

2) Transactional (MySQL OLTP) → inventory and sales data

3) Staging warehouse (PostgreSQL) → temporary staging area for transformed data

4) Production warehouse (IBM DB2 Cloud) → dimensional model for BI dashboards

5) ETL pipelines (Apache Airflow) → move/transform data between OLTP, NoSQL, and warehouses

6) Analytics/BI: Spark for analysis, IBM Cognos Analytics for dashboards

7) Big Data platform: Hadoop cluster for raw data collection
