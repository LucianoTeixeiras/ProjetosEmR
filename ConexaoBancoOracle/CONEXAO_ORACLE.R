#Conexão com Oracle

# Load RODBC package
install.packages(c('RODBC','ODB','RMYSQL','DBI','RJDBC','rJava'))

library(RODBC)
library(ODB)
library(rJava)
library(DBI)
library(RJDBC)
library(odbc)
library(RMySQL)


# Create a connection to the database called "channel"
channel <- odbcConnect("banco", uid="usuario", pwd="senha", believeNRows=FALSE)

# Check that connection is working (Optional)
odbcGetInfo(channel)

# Find out what tables are available (Optional)
Tables <- sqlTables(channel, schema="schema")

View(Tables)

# Query the database and put the results into the data frame "dataframe"
dataframe <- sqlQuery(channel, "Select * From PROD2.EMAIL")

View(dataframe)

odbcClose(channel)


#MySQL

con <- dbConnect(MySQL(),
                 user="root", password="260775",
                 dbname="BigData", host="localhost")
on.exit(dbDisconnect(con))