# Data-Platform-for-Retail-Data-Analytics
This project demonstrates a modern ETL pipeline and data warehouse design tailored for retail or finance sectors. It uses Apache Airflow to transform raw sales transaction data into a clean, analytics-ready dimensional model in DB2 on Cloud. The transformed data is then visualized through IBM Cognos Analytics and further analyzed using Spark.

AceCart's online presence is primarily through its website, which customers access using a variety of devices like laptops, mobiles and tablets.

1) Catalog data of the products - stored in the MongoDB NoSQL server.

2) Transactional data like inventory and sales - stored in the MySQL database server.

3) Data is periodically extracted from these two databases and put into the staging data warehouse running on PostgreSQL.

4) The production data warehouse - the cloud instance of IBM DB2 server.

5) BI teams connect to the IBM DB2 for operational dashboard creation. IBM Cognos Analytics is used to create dashboards.

6) AceCart uses Hadoop cluster as its big data platform where all the data is collected for analytics purposes.

7) Spark is used to analyse the data on the Hadoop cluster.

8) To move data between OLTP, NoSQL and the data warehouse, ETL pipelines are used and these run on Apache Airflow
