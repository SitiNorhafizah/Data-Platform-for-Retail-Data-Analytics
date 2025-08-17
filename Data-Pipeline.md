Data Pipelines Using Apache AirFlow



Scenario

Write a pipeline that analyzes the web server log file, extracts the required lines(ending with html) and fields(time stamp, size ) and transforms (bytes to mb) and load (append to an existing file.)



Objectives

In this assignment, you will author an Apache Airflow DAG using Bash operators that will:



Extract data from a web server log file

Transform the data

Load the transformed data into a tar file





theia@theiadocker-fieza9559:/home/project$ mkdir -p /home/project/airflow/dags/capstone

theia@theiadocker-fieza9559:/home/project$ ls -l /home/project/airflow/dags/capstone

total 0

theia@theiadocker-fieza9559:/home/project$ ls -l /home/project/airflow/dags

total 4

drwxr-sr-x 2 theia users 4096 Aug 16 22:09 capstone

theia@theiadocker-fieza9559:/home/project$ cd /airflow/dags/capstone

bash: cd: /airflow/dags/capstone: No such file or directory

theia@theiadocker-fieza9559:/home/project$ cd /home/project/airflow/dags/capstone

theia@theiadocker-fieza9559:/home/project/airflow/dags/capstone$ wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0321EN-SkillsNetwork/ETL/accesslog.txt

--2025-08-16 22:13:41--  https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0321EN-SkillsNetwork/ETL/accesslog.txt

Resolving cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud (cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud)... 169.63.118.104, 169.63.118.104

Connecting to cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud (cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud)|169.63.118.104|:443... connected.

HTTP request sent, awaiting response... 200 OK

Length: 2370789 (2.3M) \[text/plain]

Saving to: 'accesslog.txt'



accesslog.txt      100%\[===============>]   2.26M  --.-KB/s    in 0.02s   



2025-08-16 22:13:41 (115 MB/s) - 'accesslog.txt' saved \[2370789/2370789]



theia@theiadocker-fieza9559:/home/project/airflow/dags/capstone$ theia@thei

theia@theiadocker-fieza9559:/home/project$ mkdir -p /home/project/airflow/dtheia@theiadocker-fieza9559:/home/project$ mkdir -p /home/project/airflow/dags/capstone

theia@theiadocker-fieza9559:/home/project$ ls -l mkdir -p /home/project/airtheia@theiadocker-fieza9559:/home/project$ ls -l mkdir -p /home/project/air capstone

total 0

theia@theiadocker-fieza9559:/home/project$ ls -l /home/project/airflow/dags

total 4

drwxr-sr-x 2 theia users 4096 Aug 16 22:09 capstone

theia@theiadocker-fieza9559:/home/project$ cd /airflow/dags/capstone

bash: cd: /airflow/dags/capstone: No such file or directory

theia@theiadocker-fieza9559:/home/project$ cd /home/project/airflow/dags/capstone

theia@theiadocker-fieza9559:/home/project/airflow/dags/capstone$ wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0321EN-SkillsNetwork/ETL/accesslog.txt

--2025-08-16 22:13:41--  https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0321EN-SkillsNetwork/ETL/accesslog.txt

Resolving cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud (cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud)... 169.63.118.104, 169.63.118.104

Connecting to cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud (cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud)|169.63.118.104|:443... connected.

HTTP request sent, awaiting response... 200 OK

Length: 2370789 (2.3M) \[text/plain]

Saving to: 'accesslog.txt'



accesslog.txt      100%\[===============>]   2.26M  --.-KB/s    in 0.02s   



2025-08-16 22:13:41 (115 MB/s) - 'accesslog.txt' saved \[2370789/2370789]



theia@theiadocker-fieza9559:/home/project/airflow/dags/capstone$ ls -l

total 2316

-rw-r--r-- 1 theia users 2370789 Sep 29  2022 accesslog.txt

theia@theiadocker-fieza9559:/home/project/airflow/dags/capstone$ 



**B) Create DAG files using Bash operator**



\# import the libraries



from datetime import timedelta

\# The DAG object; we'll need this to instantiate a DAG

from airflow.models import DAG

\# Operators; you need this to write tasks!

from airflow.operators.bash\_operator import BashOperator

\# This makes scheduling easy

from airflow.utils.dates import days\_ago



\#defining DAG arguments



\# You can override them on a per-task basis during operator initialization

default\_args = {

&nbsp;   'owner': 'Siti\_Norhafizah',

&nbsp;   'start\_date': days\_ago(0),

&nbsp;   'email': \['student1@gmail.com'],

&nbsp;   'email\_on\_failure': True,

&nbsp;   'email\_on\_retry': True,

&nbsp;   'retries': 1,

&nbsp;   'retry\_delay': timedelta(minutes=5),

}

\# defining the DAG



\# define the DAG

dag = DAG(

&nbsp;   'process\_web\_log',

&nbsp;   default\_args=default\_args,

&nbsp;   description='A DAG to process web logs daily',

&nbsp;   schedule\_interval=timedelta(days=1),

)

\# define the tasks



\# define the first task



extract = BashOperator(

&nbsp;   task\_id='extract',

&nbsp;   bash\_command='awk '{print $1}\\' /home/project/airflow/dags/capstone/accesslog.txt > /home/project/airflow/dags/capstone/extracted\_data.txt',

&nbsp;   dag=dag,

)



\# define the second task

transform\_and\_load = BashOperator(

&nbsp;   task\_id='transform\_data',

&nbsp;   bash\_command=bash\_command="grep -v '198.46.149.143' /home/project/airflow/dags/capstone/extracted\_data.txt > /home/project/airflow/dags/capstone/transformed\_data.txt",

&nbsp;   dag=dag,

)



load\_data = BashOperator(

&nbsp;   task\_id='load\_data',

&nbsp;   bash\_command='tar -cvf /home/project/airflow/dags/capstone/weblog.tar /home/project/airflow/dags/capstone/transformed\_data.txt',

&nbsp;   dag=dag,

)



\# Define task pipeline

extract\_data >> transform\_data >> load\_data

