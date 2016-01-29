pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        ## NOTE: Do not round the result!

		## Function call example: pollutantmean('c:/data/specdata', 'sulfate', 2:3)
		#print(id)
		#print (class(id))
		
		# Get the list of files 
		filelist <- list.files(directory, pattern='.csv', full.names = TRUE)
		#subset(dataset, ID == 1)

		#################### Create a Dataframe from all Observastions ####################
		for (file in filelist){
		  # if the merged dataset doesn't exist, create it
		  if (!exists("dataset")){
			dataset <- read.csv(file) }
		  else { temp_dataset <-read.csv(file)
			dataset<-rbind(dataset, temp_dataset)
			rm(temp_dataset)
		  }
		   
		}
		
		#mean(dataset[1:1000,2], na.rm = TRUE)
		#mean(dataset[dataset$ID > 1 & dataset$ID <= 3,2], na.rm = TRUE)
		
		if (pollutant == "nitrate") {col = 3}
		if (pollutant == "sulfate") {col = 2}

		#Calculate Mean 
		#mu <- mean(dataset[dataset$ID == id, 2], na.rm = TRUE)
		#sub <- dataset[dataset$ID == id, 2]
		#sub <- dataset[dataset$ID %in% id, col]
		mean(dataset[dataset$ID %in% id, col], na.rm = TRUE) 
}