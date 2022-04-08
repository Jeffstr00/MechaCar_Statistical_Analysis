library(dplyr)

# read CSV file into car_table
car_table <- read.csv(file='MechaCar_mpg.csv', check.names=F, stringsAsFactors=F)

# generate multiple linear regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=car_table)

# generate summary statistics
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=car_table))

# read CSV file in as suspension_table
suspension_table <- read.csv(file='Suspension_Coil.csv', check.names=F, stringsAsFactors=F)

# create summary table with multiple columns
total_summary <- suspension_table %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),sD=sd(PSI))

# create a grouped summary table
lot_summary <- suspension_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),sD=sd(PSI), .groups='keep')

# perform t-Test to determine if PSI across all lots is statistically different from the population mean of 1500PSI
t.test(suspension_table$PSI,mu=1500)

# create table for each lot number
lot1 <- suspension_table %>% filter(Manufacturing_Lot=="Lot1")
lot2 <- suspension_table %>% filter(Manufacturing_Lot=="Lot2")
lot3 <- suspension_table %>% filter(Manufacturing_Lot=="Lot3")

# use t-Test to determine if the PSI for each manufacturing lot is statistically different from the population mean
t.test(lot1$PSI,mu=1500)
t.test(lot2$PSI,mu=1500)
t.test(lot3$PSI,mu=1500)