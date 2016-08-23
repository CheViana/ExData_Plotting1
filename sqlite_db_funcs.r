createDb <- function() {
	con <- getConnection()

	# read csv file into sql database
	# Warning: this is going to take some time and disk space, 
	#   as your complete CSV file is transferred into an SQLite database.
	dbWriteTable(con, name="household_power_consumption", value="household_power_consumption.txt", 
	    row.names=FALSE, header=TRUE, sep = ";",
	    field.types=list(
	    	Date="character", 
	    	Time="character",
	    	Global_active_power="double(20,10)",
	    	Global_reactive_power="double(20,10)",
	    	Voltage="double(20,10)",
	    	Global_intensity="double(20,10)",
	    	Sub_metering_1="double(20,10)",
	    	Sub_metering_2="double(20,10)", 
	    	Sub_metering_3="double(20,10)"
	    	)
	    )	

	dbDisconnect(con)
	0
}

deleteTable <- function() {
	con <- getConnection()
	dbRemoveTable(con, "household_power_consumption")
	dbDisconnect(con)
	0
}

columnsOfTable <- function() {
	con <- getConnection()
	fields <- dbListFields(con, "household_power_consumption")
	dbDisconnect(con)
	fields	
}

readFromTable <- function() {
	con <- getConnection()
	
	# Query your data as you like
	yourData <- dbGetQuery(con, "SELECT * FROM household_power_consumption WHERE Date='01/02/2016' OR Date='02/02/2016'")

	dbDisconnect(con)
	yourData
}

getConnection <- function() {
	library(RSQLite)
	library(DBI)

	# Create/Connect to a database
	dbConnect(RSQLite::SQLite(), dbname="household_power_consumption_db.sqlite")	
}