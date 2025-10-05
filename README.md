# Customer Complaints Analysis - Credit Card Services

A data engineering and analytics project focused on identifying complaint trends in the credit card sector using large-scale financial data and Google Cloud Platform. This academic project was completed as part of the _Harvesting, Storing, and Retrieving Data (ADTA 5240)_ course.

## Objective

To help a credit card company identify consumer pain points and improve service delivery by analyzing consumer complaints data published by the Consumer Financial Protection Bureau (CFPB).

---

## Dataset

- **Source**: [Consumer Complaint Database](https://catalog.data.gov/dataset/consumer-complaint-database) (DATA.GOV)
- **Size**: ~5 million records | 18 variables
- **Format**: CSV → cleaned and transformed into TSV

---

## Tools & Technologies

- **Cloud**: Google Cloud Platform (GCP) – Cloud Storage, BigQuery, Dataproc
- **Languages**: R, HiveQL, Spark SQL
- **Frameworks**: Hadoop Ecosystem – Hive, Spark (via Dataproc)
- **Visualization**: Tableau
- **Data Engineering**: HDFS, GCP Buckets, BigQuery Tables

---

## Workflow

### 1. Data Wrangling (R)

- Cleaned raw data using RStudio
- Filtered and encoded credit card-related records
- Exported to `.tsv` for GCP ingestion

### 2. Cloud Storage

- Uploaded cleaned data to GCP bucket `credit-data-bucket`
- Organized files into folders for full and subset datasets

### 3. BigQuery Analysis

- Executed SQL queries to:
  - Identify companies with the highest complaint counts
  - Analyze complaints by state and submission method
  - Calculate dispute rates and delayed responses

### 4. Hadoop Processing (via Dataproc)

- Set up Dataproc Cluster with Hive & Spark
- Loaded data to HDFS and created Hive table
- Performed same analytical queries in both Hive & Spark
- Benchmarked performance differences

### 5. Visualization (Tableau)

- Complaints trend over time
- Product-wise complaint distribution
- Geo heatmap of complaint volume across states

---

## Key Insights

- Spike in complaints observed from 2017 onwards
- Credit reporting and other categories contributed heavily post-2017
- Eastern U.S. states showed higher complaint volumes
- Spark consistently outperformed Hive in query execution time
