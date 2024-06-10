# Personal project
# Overview
At present, monitoring and predicting the number of DRM keys used for content encryption is crucial not only for the Technical Solutions team but also for other departments in general, as it directly relates to the costs and business planning of FPT Television. However, despite its importance, currently there is no reports on this matter. Therefore, this project aims to address the issue by providing accurate information on the key issuance situation and predicting future key issuance trend.
# Original Data
Stored in "data" folder, SQL query is applied to DB contains csv file in this folder.
DRM_Data.csv is the result, which is then used for the Jupyter Notebook.
# Description of tables 
- Customer: Contain customer information: customer identifier (customerid), customer device identifier (mac), customer information creation date and time (created_date).
- CustomerService: Contains information about customer services and corresponding transactions: customer identifier (CustomerID), service identifier (ServiceID), transaction amount (Amount), transaction date and time (Date)
- Log_Get_DRM_List: Contains information about the customer's DRM (Digital Rights Management) history: customer identifier (CustomeID), date DRM was obtained (Date), device identifier when DRM was obtained (Mac)
- Log_BHD_MovieID: Record activities related to watching customer BHD movies: customer identifier (CustomerID), movie identifier (MovieID), file type (FTYPE), movie playing time (REALTIMEPLAYING), ...
- MV_PropertiecShowVN: Contains information about movies: movie identifier (id), main genre (toptitle), title (titleEN), release year (release), actors (actors), directors (directors), flag only DRM support with 0 being no DRM support and 1 being DRM support (isDRM),...
- Log_Fimplus_movieID: Record activities related to watching customer Film Plus movies: customer identifier (customerid), movie identifier (movieid), file type (Ftype), movie playing time (Realtimeplaying), movie viewing time ( Date), movie folder (Folder), user type (Utype).
# Definition - Conceptual Map - Data Model - HowTo
Refer to Documents_ERD.xlsx




