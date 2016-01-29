complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases

		filelist <- list.files(directory, pattern='.csv', full.names = TRUE)
				
		#################### Create a Dataframe from all Observastions ####################
		if (exists("dataset")){rm(dataset)}
		
		for (file in filelist){
		  # if the merged dataset doesn't exist, create it
		  if (!exists("dataset")){
			dataset <- read.csv(file) }
		  else { temp_dataset <-read.csv(file)
			dataset<-rbind(dataset, temp_dataset)
			rm(temp_dataset)
		  }
		   
		}
		
		data_sub <- dataset[dataset$ID %in% id, ]
		
		#for (i in data_sub[,4]) { print(i) }
		
		#min_id = min(data_sub[,4],na.rm=TRUE)
		#max_id = max(data_sub[,4],na.rm=TRUE)
		#ID <- min_id:max_id
		df = data.frame(id, nobs = NA)
		
		#for (i in df[,1]) {
		#	good <- complete.cases(data_sub[data_sub$ID %in% i,])
		#	cnt_good <- NROW(good[good==TRUE])
		#	df[i,2] = cnt_good
		#}
		
		for (i in id) {
			good <- complete.cases(data_sub[data_sub$ID %in% i,])
			cnt_good <- NROW(good[good==TRUE])
			df[df$id %in% i, 2] = cnt_good
		}
		
		df
		
		#good <- complete.cases(data_sub)
		#good_dataset <- data_sub[good,]
		
		#aggregate(cbind(count = ID) ~ good_dataset$ID, 
        #  data = good_dataset, 
        #  FUN = function(x){NROW(x)})
		
		
}