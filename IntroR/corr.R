corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
        ## NOTE: Do not round the result!
	

		complete_list <- complete(directory)

		filelist <- list.files(directory, pattern='.csv', full.names = TRUE)
		
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
		
		#df_cl = data.frame(complete_list[,1], covv = NA)
		if(exists("cv_temp")){rm (cv_temp)}

		cv_temp <- vector()
		
		# complete_list = return from complete() function 
		for (i in complete_list[,1]){
			if (complete_list[i,2] > threshold){
				cv_temp <- c(cv_temp, cor(dataset[dataset$ID %in% i,3], dataset[dataset$ID %in% i,2], use="complete.obs"))
				}
		}
		
		cv_temp
}

