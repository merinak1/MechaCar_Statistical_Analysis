library(tidyverse)
#####################
# Deliverable 1
#####################

mecha_data <- read.csv("MechaCar_mpg.csv")
# run a linear regression and a summary: Section 15.7.3. Read about PR(>|t|)
# Which 2 variable are stistically not random?
# In the analysis, mention the Multiple R Squared value, does it tell us this is a good predictor?
head(mecha_data)
lm(mpg ~  vehicle_length  + vehicle_weight  + spoiler_angle  + ground_clearance + AWD , data=mecha_data) #create linear model
summary(lm(mpg ~  vehicle_length  + vehicle_weight  + spoiler_angle  + ground_clearance + AWD , data=mecha_data))


#####################
## Deliverable 2
#####################
# summarize() 15.2.5
# group_by Manufacturing_Lot 15.2.5
suspcoil_data <- read.csv("Suspension_Coil.csv")
head(suspcoil_data)

total_summary <- suspcoil_data %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI), SD=sd(PSI),.groups = 'keep') #create summary table
lot_summary <- suspcoil_data %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI), SD=sd(PSI),.groups = 'keep') #create summary table

 
#####################
# Deliverable 3
#####################

# Run a t.test on all population
# Then use subset() to subset for each Manufacturing_Lot (there are 3 lots)
suspension_data <- read.csv("Suspension_Coil.csv",stringsAsFactors = F, check.names = F)

#Deliverable 3 Part 1
t.test(suspension_data$PSI,mu=1500)


#Deliverable 3 Part 2
population1 = subset(suspension_data, Manufacturing_Lot == 'Lot1')
t.test(population1$PSI,mu=1500)
# OR 
t.test(subset(suspension_data,Manufacturing_Lot == 'Lot1')$PSI, mu=1500)


t.test(subset(suspension_data,Manufacturing_Lot == 'Lot2')$PSI, mu=1500)


t.test(subset(suspension_data,Manufacturing_Lot == 'Lot3')$PSI, mu=1500)


mean(population1[['PSI']])

t.test(population1$PSI,mu=mean(suspension_data$PSI)) 

population2 = subset(suspension_data, Manufacturing_Lot == 'Lot2')
mean(population2[['PSI']])
t.test(population2$PSI,mu=mean(suspension_data$PSI)) 

population3 = subset(suspension_data, Manufacturing_Lot == 'Lot3')
mean(population3[['PSI']])
t.test(population3$PSI,mu=mean(suspension_data$PSI)) 

#t.test(mpg_1999$hwy,mpg_2008$hwy,paired = T) #compare the mean difference between two samples
#t.test(suspension_data,)
