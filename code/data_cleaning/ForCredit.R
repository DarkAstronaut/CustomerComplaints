#Go to Working Directry where complaints.csv is present
setwd("C:/Users/vk0589/OneDrive - UNT System/Documents/UNT/Courses/ADTA_5240/FinalProject/RStuff")
CData <- read.csv("C:/Users/vk0589/OneDrive - UNT System/Documents/UNT/Courses/ADTA_5240/FinalProject/ProjectDatasets/complaints.csv")
library(dplyr)

summary(CData)
names(CData)
#Renaming Column Names ----
CData2 <- CData
names(CData2) <- c("DateReceived",
                  "Product",
                  "SubProduct",
                  "Issue",
                  "SubIssue",
                  "ComplaintNarrative",
                  "CompanyPulicResponse",
                  "Company",
                  "State",
                  "ZIPCode",
                  "Tags",
                  "ConsumerConsent",
                  "SubmittedVia",
                  "DateSentToCompany",
                  "CompanyResponseToConsumer",
                  "TimelyResponse",
                  "ConsumerDisputed",
                  "ComplaintID")
head(CData2)

#Type Conversion ----
CData2$DateReceived <- as.Date(CData2$DateReceived)
CData2$Product <- as.factor(CData2$Product)
CData2$SubProduct <- as.factor(CData2$SubProduct)
CData2$Issue <- as.factor(CData2$SubIssue)
CData2$Company <- as.factor(CData2$Company)
CData2$State <- as.factor(CData2$State)
CData2$ZIPCode <- as.factor(CData2$ZIPCode)
CData2$Tags <- as.factor(CData2$Tags)
CData2$ConsumerConsent <- as.factor(CData2$ConsumerConsent)
CData2$SubmittedVia <- as.factor(CData2$SubmittedVia)
CData2$DateSentToCompany <- as.Date(CData2$DateSentToCompany)
CData2$CompanyResponseToConsumer <- as.factor(CData2$CompanyResponseToConsumer)
CData2$TimelyResponse <- as.factor(CData2$TimelyResponse)
CData2$ConsumerDisputed <- as.factor(CData2$ConsumerDisputed)

summary(CData2$Product)

CDataReq <- CData2 %>%
  select(c(1:5, 8:18)) #Removing ComplaintNarriative and CompanyPublicResponse Cols.

#Getting Credit Data ----
##Only Credit Card ----
CreditOnly <- CData2 %>% 
  filter(Product == "Credit card") #Information of only Product = 'Credit card'
##Credit Card + 3 Columns ----
CreditPartial <- CData2 %>% 
  filter(Product == "Credit card"|
         Product == "Credit card or prepaid card"|
         Product == "Credit reporting"|
         Product == "Credit reporting or other personal consumer reports")

##All 5 Columns containing word 'Credit' ----
CreditFull <- CData2 %>% 
  filter(Product == "Credit card"|
         Product == "Credit card or prepaid card"|
         Product == "Credit reporting"|
         Product == "Credit reporting or other personal consumer reports"|
         Product == "Credit reporting, credit repair services, or other personal consumer reports")

#Above 3 datasets without ComplaintNarrative and CompanyPublicResponse

##Only Credit Card ----
CreditOnly16 <- CDataReq %>% 
  filter(Product == "Credit card") #Information of only Product = 'Credit card'
##Credit Card + 3 Columns ----
CreditPartial16 <- CDataReq %>% 
  filter(Product == "Credit card"|
           Product == "Credit card or prepaid card"|
           Product == "Credit reporting"|
           Product == "Credit reporting or other personal consumer reports")

##All 5 Columns containing word 'Credit' ----
CreditFull16 <- CDataReq %>% 
  filter(Product == "Credit card"|
           Product == "Credit card or prepaid card"|
           Product == "Credit reporting"|
           Product == "Credit reporting or other personal consumer reports"|
           Product == "Credit reporting, credit repair services, or other personal consumer reports")


head(CreditOnly16) #Product - CreditCard

head(CreditFull16) # All 5 Products

summary(CreditFull16)

#Experiments ----
#CSV doesn't work at columns data has ',' in-between
##Exporting in tabSpace
write.table(CreditOnly, "C:/Users/vk0589/OneDrive - UNT System/Documents/UNT/Courses/ADTA_5240/FinalProject/ProjectDatasets/Experiments/CreditOnly.tsv", 
            row.names = FALSE, quote = FALSE, sep = "\t") #Didn't work for 18

write.table(CreditOnly16, "C:/Users/vk0589/OneDrive - UNT System/Documents/UNT/Courses/ADTA_5240/FinalProject/ProjectDatasets/Experiments/CreditOnly16.tsv", 
            row.names = FALSE, quote = FALSE, sep = "\t") #Worked for 16 Columns 

write.table(CreditOnly, "C:/Users/vk0589/OneDrive - UNT System/Documents/UNT/Courses/ADTA_5240/FinalProject/ProjectDatasets/Experiments/CreditOnlyTT.tsv", 
            row.names = FALSE, quote = FALSE, sep = "\t\t") #NotPossible with Limitations of GCP

#Creating CreditPartil16 and CreditFull16 with tabSpace
write.table(CreditPartial16, "C:/Users/vk0589/OneDrive - UNT System/Documents/UNT/Courses/ADTA_5240/FinalProject/ProjectDatasets/Experiments/CreditPartial16.tsv", 
            row.names = FALSE, quote = FALSE, sep = "\t")

write.table(CreditFull16, "C:/Users/vk0589/OneDrive - UNT System/Documents/UNT/Courses/ADTA_5240/FinalProject/ProjectDatasets/Experiments/CreditFull16.tsv", 
            row.names = FALSE, quote = FALSE, sep = "\t")
