# Load required packages
library(shiny)
library(caret)
library(randomForest)
library(shinydashboard)
# Read data
data=read.csv("D:/3RD YEAR/SEMESTER II/ST3082/Project III Materials//Used_Bikes.csv")
View(data)
library(plyr)
library(dplyr)
library(stringr)
library(mgsub)
library(ggplot2)
library(corrplot)
library(psych)
library(packHV)
library(moments)
library(tidyverse)

#Removing duplicates
sum(duplicated(data))
data=distinct(data)
nrow(data)
#Replacing "" with NA
data = replace(data, data=='', NA)
colSums(is.na(data))
#Removing records with price=0
data=data[data$price != 0, ] 
data=data[data$kms_driven != 0, ] 
data=data[data$age != 0, ] 
data=data[data$power != 0, ] 
nrow(data)

#Create brand_New column
table(data$brand)
brand_New=c()
for(i in 1:length(data$brand)){
  if((data$brand[i]=="Ideal")|(data$brand[i]=="Indian")|
     (data$brand[i]=="LML")|(data$brand[i]=="Rajdoot")|
     (data$brand[i]=="Yezdi")|(data$brand[i]=="MV")|(data$brand[i]=="Jawa")){
    brand_New[i]="Others"
    
  }else{
    brand_New[i]=data$brand[i]
  }
  
}
table(brand_New)
data=cbind(data,brand_New)



#Create the state column
# read in the second file with unique cities and their corresponding state
df= read.csv("D:/3RD YEAR/SEMESTER II/ST3082/Project III Materials//cities.csv")
sum(duplicated(df))
df=distinct(df)
table(df$State)
nrow(df)

state=c()
for(i in 1:nrow(df)){
  for(j in 1:nrow(data)){
    if(data$city[j]==df$city[i]){
      state[j]=df$State[i]
    }else{
      next
    }
  }
}

for(i in 1:length(state)){
  if((state[i]=="Arunachal Pradesh")|(state[i]=="Meghalaya")|
     (state[i]=="Sikkim")){
    state[i]="Others"
  }else{
    state[i]=state[i]
  }
}
table(state)
data=cbind(data,state)


#Factoring
data$owner= factor(data$owner,level=c("First Owner","Second Owner","Third Owner",
                                      "Fourth Owner Or More"))
data$brand_New = factor(data$brand_New,level=c("Bajaj","Benelli","BMW","Ducati","Harley-Davidson","Hero","Honda",
                                               "Hyosung","Kawasaki","KTM","Mahindra","Royal Enfield"
                                               ,"Suzuki","Triumph","TVS","Yamaha","Others"))
data$state = factor(data$state,level=c("Andhra Pradesh","Assam","Bihar","Chhattisgarh",
                                       "Delhi","Goa","Gujarat","Haryana",
                                       "Himachal Pradesh" ,"Jammu and Kashmir","Jharkhand", "Karnataka",
                                       "Kerala",    "Madhya Pradesh",       "Maharashtra",            "Odisha",
                                       "Puducherry" ,           "Punjab" ,        "Rajasthan",
                                       "Tamil Nadu",         "Telangana",     "Uttar Pradesh",       "Uttarakhand",
                                       "West Bengal" , "Others"))

#Splitting the data in to training and testing sets
set.seed(123)
indexes=sample(1:nrow(data),0.2*nrow(data))
testset=data[indexes,]
trainset=data[-indexes,]
trainset_new=subset(trainset,select=-c(bike_name,city,brand))
testset_new=subset(testset,select=-c(bike_name,city,brand))

library(mdatools)
library(caret)
dummy_coding= dummyVars(" ~ . ", data = trainset_new)
trainset_encoded=predict(dummy_coding, newdata =trainset_new)

View(trainset_encoded)

x=trainset_encoded[,-1]
x[,c(1,6,7)]=scale(x[,c(1,6,7)], center = TRUE, scale = TRUE)
y=as.matrix(trainset_encoded[,1])
set.seed(100)
ModelPLS = pls(x,y,cv=5, info = "Bike Price prediction")
#Checking Outliers
Model0=setDistanceLimits(ModelPLS,lim.type = ModelPLS$lim.type,alpha=0.05)
plotXYResiduals(Model0,show.labels=FALSE,labels="indices")
# Identify outlier indices
# get row indices for outliers in calibration set
outliers = which(categorize(Model0, ModelPLS$res$cal) == "outlier")
length(outliers)
trainset_new=trainset_new %>%  filter(!row_number() %in% outliers)
View(trainset_new)
data1=trainset_new
data1[,c(2,4,5)]=scale(data1[,c(2,4,5)], center = TRUE, scale = TRUE)

# Separate the response variable from the predictors
y1 = data1$price

set.seed(100)
indexes=sample(1:nrow(data1),0.1*nrow(data1))
data_new=data1[indexes,]

# Define the tuning grid
tune_grid = expand.grid(
  mtry =15,
  splitrule = "variance",
  min.node.size = 1
  
)
# Tune the hyperparameters using the tune() function
library(ranger)


# Perform 5-fold cross-validation 
set.seed(100)
bike_model = train(
  price~ .,
  data = data1,
  method = "ranger",
  trControl = trainControl(method = "cv", number = 5, verboseIter = TRUE),
  tuneGrid=tune_grid,
  
)




# Define UI
# Define UI
ui <- dashboardPage(
  dashboardHeader(title = "Bike Price Prediction"),
  
  dashboardSidebar(
    numericInput("kms_driven", "Kilometers Driven", min = 0, value = 0),
    numericInput("power", "Power (in CC)", min = 100, max = 2000, value = 100),
    numericInput("age", "Age (in years)", min = 1, value = 1),
    selectInput("brand", "Brand", choices = levels(data$brand_New)),
    selectInput("state", "State", choices = levels(data$state)),
    selectInput("owner", "Number of Previous Owners", choices = levels(data$owner))
  ),
  
  dashboardBody(
    fluidRow(
      box(
        h4("Predicted Price: "),
        textOutput("predicted_price")
      )
    )
  )
)

# Define server
server <- function(input, output) {
  
  # Function to generate predictions
  output$predicted_price <- renderText({
    new_data <- data.frame(kms_driven = input$kms_driven,
                           power = input$power,
                           age = input$age,
                           brand_New = ifelse(input$brand == "Others", "Other", input$brand),
                           state = input$state,
                           owner = input$owner)
    predict(bike_model, newdata = new_data)
  })
}

# Run the app
shinyApp(ui = ui, server = server)