# Libraries
library(dplyr)
library(reshape2)

### Custom functions ###
clean_fw <- function(x){
  ## Function to clean fixed width data
  # Remove leading spaces
  foo <- gsub('^ +', '', x)
  # Convert spaces to |
  bar <- gsub(' +', '|', foo)
  # Strsplit and coerce to numeric
  # "\\|" is escaped to identify "|", else it'll be interpreted as "OR"
  foobar <- as.numeric(strsplit(bar, '\\|')[[1]])
  return(foobar)
}

read_uci_data <- function(x, verbose = TRUE){
  ## Function to read UCI dataset with automatic parsing
  # Verbose
  if(verbose)
    cat('Reading data from', x, '\n')
  
  # Read first line to identify if fixed-width or single entry
  if(!grepl(' ', scan(x, what = 'str', n = 1, sep = '\n', quiet = TRUE))){
    # If no space, suggests single entry, read using read.delim
    return(read.delim(x, stringsAsFactors = FALSE, header = FALSE))
  } else {
    # If contains space, suggest FWF, read using custom function
    return(do.call(rbind, unname(sapply(read.delim(x, stringsAsFactors = FALSE, header = FALSE)[,1], 
                                        clean_fw, simplify = FALSE))))
  }
  # Run garbage collection to ease memory usage
  invisible(gc)
}

### Features ###
# Read in feature list
featurelist <- read.table('UCI HAR Dataset/features.txt', stringsAsFactors = FALSE)[,2]
# Identify the features of interest which are tagged with "mean()" or "std()"
foi <- grep('mean\\(|std\\(', featurelist, value = TRUE)
# This will be used for mapping the X_train and X_test datasets

### Activities ###
# Read in activity list and use as a mapper
activitylist <-read.table('UCI HAR Dataset/activity_labels.txt', stringsAsFactors = FALSE,
                          header = FALSE)
dict_activity <- activitylist[,2]
names(dict_activity) <- activitylist[,1]
rm(activitylist)

### Read datasets ###
# Start with reading the train dataset
# We know that there are 561 features which are 16 characters wide
# To confirm:
# nchar(scan('UCI HAR Dataset/train/X_train.txt', what = 'character', sep = '\n', n = 1, quiet = TRUE))/16 # 561

## Feature dataset
# Read using fwf, which takes a little longer
# tf <- read.fwf('UCI HAR Dataset/train/X_train.txt', widths = rep(16, 561),
#                            header = FALSE, stringsAsFactors = FALSE)
# Alternatively, you could read it using the custom function (that takes a much shorter time)
train_features <- read_uci_data('UCI HAR Dataset/train/X_train.txt')
test_features <- read_uci_data('UCI HAR Dataset/test/X_test.txt')

all_features <- rbind(train_features, test_features)
if(ncol(all_features) == length(featurelist)){
  colnames(all_features) <- featurelist
}
# Subset for features of interest
sub_features <- all_features[,foi]

### Rename dataset ###
### Reorder names so that they make sense
## We know that we want to organize our data:
## [var] - [dimension] - [mean or std] - [measurement]
# First remove ()
dum_names <- gsub('\\(\\)', '', colnames(sub_features))
# Second, we reorder the column names
dum_names <- gsub('(^.*)(-[meanstd]+)([-XYZ]*)', '\\1\\3\\2', dum_names)
# Finally, we convert t to time and f to frequency
dum_names <- gsub('^t(.*)', '\\1_time', dum_names)
dum_names <- gsub('^f(.*)', '\\1_frequency', dum_names)
# Replace column names
colnames(sub_features) <- dum_names

### Subject dataset
train_subject <- read.delim('UCI HAR Dataset/train/subject_train.txt', stringsAsFactors = FALSE, header = FALSE)
test_subject <- read.delim('UCI HAR Dataset/test/subject_test.txt', stringsAsFactors = FALSE, header = FALSE)
all_subject <- rbind(train_subject, test_subject)
colnames(all_subject) <- 'subject'

### Activity dataset
train_action <- read.delim('UCI HAR Dataset/train/y_train.txt', stringsAsFactors = FALSE, header = FALSE)
test_action <- read.delim('UCI HAR Dataset/test/y_test.txt', stringsAsFactors = FALSE, header = FALSE)
all_activity <- rbind(train_action, test_action)
# This remaps the activities to the respective numbers and converts it to lower case
all_activity <- cbind(tolower(unname(dict_activity[all_activity[,1]])))
colnames(all_activity) <- 'activity'

### Combine all data
har <- Reduce(cbind, list(all_subject, all_activity, sub_features[,order(colnames(sub_features))]))

### Save dataset
write.table(har, file = 'har_cleaned.txt', sep = '\t',
            quote = FALSE, row.names = FALSE)

### Summarize dataset to create tidy dataset in wide format
har_summary <- har %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

### Tidy data in narrow format
har_m = melt(har, id = c('subject','activity'), factorsAsStrings = TRUE)
har_m$variable = as.character(har_m$variable)
har_m$statistic = gsub('.*[-XYZ]*-([meanstd]+)_[frequencytime]*', '\\1', har_m$variable)
har_m$measurement = gsub('.*[-XYZ]*-[meanstd]+_([frequencytime]*)', '\\1', har_m$variable)
har_m$dimension = gsub('.*-([XYZ]+)-[meanstd]+_[frequencytime]*', '\\1', har_m$variable)
har_m$dimension[nchar(har_m$dimension) > 1] = NA
har_m$varname = gsub('(.*)-[XYZ]+-[meanstd]+_[frequencytime]*', '\\1',har_m$variable)

har_summary_narrow = har_m[,-3] %>%
  group_by(subject, activity, varname, dimension, measurement, statistic) %>%
  summarise_all(mean)

write.table(har_summary_narrow, file = 'har_tidy.txt', sep = '\t',
            quote = FALSE, row.names = FALSE)
