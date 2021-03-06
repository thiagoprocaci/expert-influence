# Modelling Experts Behaviour in Q&A Communities to Predict Worthy Discussion

## Summary
This project is part of a scientific research. We are interested in knowing the influence of experts in discussions.
You can find here the analysis of the paper "Modelling Experts Behaviour in Q&A Communities to Predict Worthy Discussions" published at the 17th IEEE International Conference on Advanced Learning Technologies - ICALT 2017.
In other words, you will find here everything you need to reproduce this research.
First, read the paper and then follow the instructions below.


## Environment
- R version 3.2.2 (available at https://www.r-project.org/)
- MySQL database version 5.6.31 (available at http://dev.mysql.com/downloads/)
- Ubuntu version 15.10
- HeidiSQL version 9.3.0.4984

### Inserting data into MySQL
- Open folder database/biology
- Unzip bio-database.sql.zip
- Run bio-database.sql

## How did we extract the data?
We used the stackexchange API (http://api.stackexchange.com/docs/) to extract data from biology Q&A (http://biology.stackexchange.com/). Then, we loaded the data into MySQL.


## Analysis
For the analysis, each one has a folder with the SQL that generated the CSV file. We used the CSV as the input for our R script.

### A. Reputation and Participation Analysis
- Open folder A
- Execute: Rscript reputation.R

### B. Quality of Interactions
- Open folder B
- Execute: Rscript qualityInteraction.R

### C. Users Interactions and Evolution Analysis
- Open folder C
- Execute: Rscript evolution.R

### D. Best Answers Analysis
- Open folder D
- Execute: Rscript best.R

### E. Discussion Length Analysis
- Open folder E/part-1
- Execute: Rscript discussion.R
- Open folder E/part-2
- Execute: Rscript discussion.R

### F. Graph and Correlation Analysis
- Open folder F
- Execute: Rscript graph.R

### G. PREDICTIVE MODEL TO FINDING A WORTHY DISCUSSION
- Open folder G/nnet
- Execute: Rscript prediction-gbm.R
- Open folder G/gbm
- Execute: Rscript prediction-nnet.R
