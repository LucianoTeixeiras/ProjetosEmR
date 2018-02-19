#Conexão com Oracle

# Load RODBC package
library(RODBC)

# Create a connection to the database called "channel"
channel <- odbcConnect("banco", uid="usuario", pwd="senha", believeNRows=FALSE)

# Check that connection is working (Optional)
odbcGetInfo(channel)

# Find out what tables are available (Optional)
Tables <- sqlTables(channel, schema="PROD2")

View(Tables)

# Query the database and put the results into the data frame "dataframe"
dataframe <- sqlQuery(channel, "Select * From PROD2.EMAIL")

View(dataframe)

odbcClose(channel)
