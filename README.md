# Project expert-influence

## Summary
This project is part of a scientific research. We are interested in knowing the influence of experts in discussions.
You can find here the analysis of the paper "Modelling Experts Behaviour in Q&A Communities to Predict Worthy Discussions" published at xxxx".
In other words, you will find here everything you need to reproduce this research.


## Environment
- R version 3.2.2 (available at https://www.r-project.org/)
- MySQL database version 5.6.31 (available at http://dev.mysql.com/downloads/)
- Ubuntu version 15.10
- HeidiSQL version 9.3.0.4984

## Loading data into MySQL
- Open folder database/biology
- Unzip bio-database.sql.zip
- Run bio-database.sql

## Analysis
For the analysis, each one has a folder with the SQL that generated the CSV file. We used the CSV as the input for our R script.

#A. Reputation and Participation Analysis
- Open folder A
- Execute: Rscript reputation.R




