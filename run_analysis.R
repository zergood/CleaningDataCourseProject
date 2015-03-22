cleanXdata <- function(data){
    actualColumns <- read.table("mean_std.csv")
    clean <- data[, actualColumns[, 1]]
    names(clean) <- actualColumns[, 2]
    clean
}

run_analysis <- function(){
    #READING PHASE
    X_train <- read.table(unzip("HARDataset.zip", "UCI HAR Dataset/train/X_train.txt"))
    y_train <- read.table(unzip("HARDataset.zip", "UCI HAR Dataset/train/y_train.txt"))
    subject_train <- read.table(unzip("HARDataset.zip", "UCI HAR Dataset/train/subject_train.txt"))
    X_test <- read.table(unzip("HARDataset.zip", "UCI HAR Dataset/test/X_test.txt"))
    y_test <- read.table(unzip("HARDataset.zip", "UCI HAR Dataset/test/y_test.txt"))
    subject_test <- read.table(unzip("HARDataset.zip", "UCI HAR Dataset/test/subject_test.txt"))
    activity_labels <- read.table(unzip("HARDataset.zip", "UCI HAR Dataset/activity_labels.txt"))
    
    #MERGING PHASE
    subject <- rbind(subject_train, subject_test)
    y <- rbind(y_train, y_test)   
    X <- rbind(X_train, X_test)
    y_with_lables <- merge(y, activity_labels)
    clean_X <- cleanXdata(X)
    clean_with_Y <- mutate(clean_X, activity=y_with_lables[, 2])
    clean <- mutate(clean_with_Y, subject_id = subject[, 1])
    
    #PROCESSING PHASE
    grouped <- group_by(cleanData, activity, subject_id)
    result <- summarise_each(grouped, funs(mean))
    
    #SAVE RESULTS
    write.table(result, "result.csv")
}