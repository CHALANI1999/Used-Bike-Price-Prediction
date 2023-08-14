library(shiny)
library(shinydashboard)

# Load your trained machine learning model
# Replace the "your_model_file.RDS" with the actual file path of your model
bike_model <- readRDS("bike_model.rds")
ui <- dashboardPage(
  
  # Dashboard header without title
  dashboardHeader(title = NULL, titleWidth = 0),
  
  # Sidebar layout
  dashboardSidebar(width = 290,
                   sidebarMenu(
                     # Set the first menu item as the home page with a home icon
                     menuItem("Home", tabName = "home", icon = icon('home')),
                     menuItem("Urgent sale", tabName = "urgentsale", icon = icon('exclamation-triangle')),
                     menuItem("Store", tabName = "store", icon = icon('shopping-cart'), 
                              menuSubItem("Featured", tabName = "subitem1"),
                              menuSubItem("Shop by Brand", tabName = "subitem2"),
                              menuSubItem("Shop by Budget", tabName = "subitem3"),
                              menuSubItem("Shop by Location", tabName = "subitem4")
                              
                     ),
                     menuItem("Prediction", tabName = 'pred', icon = icon('search'))
                   )),
  
  dashboardBody(
    # Content within the dashboard body
    tabItems(
      tabItem(tabName = "home",
              # Use a div to hold both the image and the text content
              tags$div(
                style = "position: relative; height: 100vh;",
                # Add the image using an img tag with blurred effect
                tags$img(src = "https://www.bikes4sale.in/pictures/default/um-renegade-commando-classic/um-renegade-commando-classic-pic-20-1366.jpg",
                         style = "position: absolute; top: 0; left: 0; right: 0; bottom: 0; width: 100%; height: 100%; object-fit: cover; filter: blur(5px);",
                         alt = "Background Image"),
                # Add text content on top of the image using a div with absolute position
                tags$div(
                  style = "position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center;",
                  tags$h1("Welcome to All India Bike Sharing Explorer", style = "color: white; font-size: 40px;"),
                  tags$p("Explore used bike data and make price predictions.", style = "color: white; font-size: 24px;")
                )
              )
      ),
      tabItem(tabName = "urgentsale",
              tags$h1("URGENT SALE!!!!"),
              # Use a fluidRow to create a row of boxes with images and descriptions
              fluidRow(
                # Box 1
                box(
                  width = 4,
                  status = "primary",
                  title = "Image 1",
                  collapsible = TRUE,
                  img(src = "https://www.bikes4sale.in/photos-2/554/554407/yamaha-fz-fi-v3-bs6-1680801248.jpeg", width = "100%", height = "200px"),
                  p("Description of Image 1")
                ),
                # Box 2
                box(
                  width = 4,
                  status = "info",
                  title = "Image 2",
                  collapsible = TRUE,
                  img(src = "https://www.bikes4sale.in/photos-2/554/554362/honda-cb-unicorn-1680791214.jpg", width = "100%", height = "200px"),
                  p("Description of Image 2")
                ),
                # Box 3
                box(
                  width = 4,
                  status = "warning",
                  title = "Image 3",
                  collapsible = TRUE,
                  img(src = "https://www.bikes4sale.in/photos-2/554/554358/royal-enfield-bullet-standard-350-1680841685.jpeg", width = "100%", height = "200px"),
                  p("Description of Image 3")
                ),
                # Box 4
                box(
                  width = 4,
                  status = "warning",
                  title = "Image 3",
                  collapsible = TRUE,
                  img(src = "https://www.bikes4sale.in/photos-2/554/554151/suzuki-gixxer-sf-fi-1680754276.jpeg", width = "100%", height = "200px"),
                  p("Description of Image 3")
                ),
                # Box 5
                box(
                  width = 4,
                  status = "warning",
                  title = "Image 3",
                  collapsible = TRUE,
                  img(src = "https://www.bikes4sale.in/photos-2/554/554380/bajaj-pulsar-rs-200-bs6-1680795136.jpeg", width = "100%", height = "200px"),
                  p("Description of Image 3")
                ),
                # Box 6
                box(
                  width = 4,
                  status = "warning",
                  title = "Image 3",
                  collapsible = TRUE,
                  img(src = "https://www.bikes4sale.in/photos-2/554/554250/hero-karizma-r-1680770491.jpeg", width = "100%", height = "200px"),
                  p("Description of Image 3")
                ),
                # Box 7
                box(
                  width = 4,
                  status = "warning",
                  title = "Image 3",
                  collapsible = TRUE,
                  img(src = "https://www.bikes4sale.in/photos-2/554/554358/royal-enfield-bullet-standard-350-1680841685.jpeg", width = "100%", height = "200px"),
                  p("Description of Image 3")
                ),
                # Box 8
                box(
                  width = 4,
                  status = "warning",
                  title = "Image 3",
                  collapsible = TRUE,
                  img(src = "https://www.bikes4sale.in/photos-2/554/554358/royal-enfield-bullet-standard-350-1680841685.jpeg", width = "100%", height = "200px"),
                  p("Description of Image 3")
                ),
                # Box 9
                box(
                  width = 4,
                  status = "warning",
                  title = "Image 3",
                  collapsible = TRUE,
                  img(src = "https://www.bikes4sale.in/photos-2/554/554358/royal-enfield-bullet-standard-350-1680841685.jpeg", width = "100%", height = "200px"),
                  p("Description of Image 3")
                )
                
                # Add more boxes as needed
              )
      ),
      tabItem(tabName = "store",
              
            
    ),
    tabItem(tabName = "subitem1",
            h2("FEATURED"),
            fluidRow(
              box(
                width = 4,
                status = "primary",
                title = "Image 1",
                collapsible = TRUE,
                img(src = "https://cdn1.acedms.com/w560-h325-cfix/photos/listing/2022-04-18/7369db99483f13e4ed7391e9e7950607_large.jpg", width = "100%", height = "200px"),
                p("Description of Image 1")
              ),
              # Box 2
              box(
                width = 4,
                status = "info",
                title = "Image 2",
                collapsible = TRUE,
                img(src = "https://cdn1.acedms.com/w560-h325-cfix/photos/listing/2022-03-02/0e56324aa9c6da0d07c0fb974af8a3db_large.jpg", width = "100%", height = "200px"),
                p("Description of Image 2")
              ),
              # Box 3
              box(
                width = 4,
                status = "warning",
                title = "Image 3",
                collapsible = TRUE,
                img(src = "https://cdn1.acedms.com/w560-h325-cfix/photos/listing/2021-10-25/d4ed38ebf4e6951895fdecc514fd26c6.jpg", width = "100%", height = "200px"),
                p("Description of Image 3")
              ),
              # Box 4
              box(
                width = 4,
                status = "warning",
                title = "Image 3",
                collapsible = TRUE,
                img(src = "https://www.bikes4sale.in/photos-2/503/503971/okaya-freedum-li-2-1678544924-200.jpg", width = "100%", height = "200px"),
                p("Description of Image 3")
              ),
              # Box 5
              box(
                width = 4,
                status = "warning",
                title = "Image 3",
                collapsible = TRUE,
                img(src = "https://www.bikes4sale.in/photos-2/554/554380/bajaj-pulsar-rs-200-bs6-1680795136.jpeg", width = "100%", height = "200px"),
                p("Description of Image 3")
              ),
              # Box 6
              box(
                width = 4,
                status = "warning",
                title = "Image 3",
                collapsible = TRUE,
                img(src = "https://www.bikes4sale.in/photos-2/556/556232/royal-enfield-classic-desert-storm-1681192978-200.jpg", width = "100%", height = "200px"),
                p("Description of Image 3")
              ),
              # Box 7
              box(
                width = 4,
                status = "warning",
                title = "Image 3",
                collapsible = TRUE,
                img(src = "https://www.bikes4sale.in/photos-2/554/554358/royal-enfield-bullet-standard-350-1680841685.jpeg", width = "100%", height = "200px"),
                p("Description of Image 3")
              ),
              # Box 8
              box(
                width = 4,
                status = "warning",
                title = "Image 3",
                collapsible = TRUE,
                img(src = "https://www.bikes4sale.in/photos-2/556/556370/suzuki-gixxer-bs6-1681208802-200.jpg", width = "100%", height = "200px"),
                p("Description of Image 3")
              ),
              # Box 9
              box(
                width = 4,
                status = "warning",
                title = "Image 3",
                collapsible = TRUE,
                img(src = "https://www.bikes4sale.in/photos-2/556/556417/royal-enfield-interceptor-650-twin-1681213234-200.jpeg", width = "100%", height = "200px"),
                p("Description of Image 3")
              ),
              
              
              fluidRow(
                column(width = 12, align = "center",
                       actionButton("moreDetails", tags$b("MORE DETAILS"), width = 150)
                )
              )
               
              
            )
    ),
    tabItem(tabName = "subitem2",
            h2("SHOP BY BRAND"),
            fluidRow(
              box(
                width = 4,
                status = "primary",
                title = "Image 1",
                collapsible = TRUE,
                img(src = "https://cdn1.acedms.com/w560-h325-cfix/photos/listing/2023-04-10/9df0890acd485b76f1ffbf41f7395c32.jpg.webp", width = "100%", height = "200px"),
                p("Description of Image 1")
              ),
              # Box 2
              box(
                width = 4,
                status = "info",
                title = "Image 2",
                collapsible = TRUE,
                img(src = "https://cdn1.acedms.com/w560-h325-cfix/photos/listing/2023-04-10/14399f7bf59bc66cc0a91e2e579d0cfb.jpg.webp", width = "100%", height = "200px"),
                p("Description of Image 2")
              ),
              # Box 3
              box(
                width = 4,
                status = "warning",
                title = "Image 3",
                collapsible = TRUE,
                img(src = "https://cdn1.acedms.com/w560-h325-cfix/photos/listing/2023-04-08/7a69021200c0f0e3b3a1bbbc295ed37d_large.jpg.webp", width = "100%", height = "200px"),
                p("Description of Image 3")
              ),
              # Box 4
              box(
                width = 4,
                status = "warning",
                title = "Image 3",
                collapsible = TRUE,
                img(src = "https://cdn1.acedms.com/w560-h325-cfix/photos/listing/2023-04-07/97f8f1cd660dcc66d62eb134581d4da9_large.jpg.webp", width = "100%", height = "200px"),
                p("Description of Image 3")
              ),
              # Box 5
              box(
                width = 4,
                status = "warning",
                title = "Image 3",
                collapsible = TRUE,
                img(src = "https://cdn1.acedms.com/w560-h325-cfix/photos/listing/2023-04-07/612c21e61dcd6de9fce20f847ad99e4b_large.jpg.webp", width = "100%", height = "200px"),
                p("Description of Image 3")
              ),
              # Box 6
              box(
                width = 4,
                status = "warning",
                title = "Image 3",
                collapsible = TRUE,
                img(src = "https://cdn1.acedms.com/w560-h325-cfix/photos/listing/2023-04-06/c3448d3d21b987222aa43c6c2f041fb1.jpg.webp", width = "100%", height = "200px"),
                p("Description of Image 3")
              ),
              # Box 7
              box(
                width = 4,
                status = "warning",
                title = "Image 3",
                collapsible = TRUE,
                img(src = "https://cdn1.acedms.com/w560-h325-cfix/photos/listing/2023-04-06/7cb48a23286fbc10d701b526c298caaa.jpg.webp", width = "100%", height = "200px"),
                p("Description of Image 3")
              ),
              # Box 8
              box(
                width = 4,
                status = "warning",
                title = "Image 3",
                collapsible = TRUE,
                img(src = "https://cdn1.acedms.com/w560-h325-cfix/photos/listing/2023-04-06/94be84a901381597b5661392750428a7.jpg.webp", width = "100%", height = "200px"),
                p("Description of Image 3")
              ),
              # Box 9
              box(
                width = 4,
                status = "warning",
                title = "Image 3",
                collapsible = TRUE,
                img(src = "https://cdn1.acedms.com/w560-h325-cfix/photos/listing/2023-04-06/a9aa993cfe8b8e3584d9eb7e1ef1c0f6_large.jpg.webp", width = "100%", height = "200px"),
                p("Description of Image 3")
              ),
              fluidRow(
                column(width = 12, align = "center",
                       actionButton("moreDetails", tags$b("MORE DETAILS"), width = 150)
                )
              )
              
              
              
            )
    ),
    tabItem(tabName = "subitem3",
            h2("SHOP BY BUDGET"),
            fluidRow(
              box(
                width = 4,
                status = "primary",
                title = "Image 1",
                collapsible = TRUE,
                img(src = "https://cdn1.acedms.com/w560-h325-cfix/photos/listing/2021-10-13/77b9d822b17653fa390b8924f608af23_large.jpg.webp", width = "100%", height = "200px"),
                p("Description of Image 1")
              ),
              # Box 2
              box(
                width = 4,
                status = "info",
                title = "Image 2",
                collapsible = TRUE,
                img(src = "https://cdn1.acedms.com/w560-h325-cfix/photos/listing/2021-09-30/0e7150943726e7d3aad7316184dbe49e_large.jpg.webp", width = "100%", height = "200px"),
                p("Description of Image 2")
              ),
              # Box 3
              box(
                width = 4,
                status = "warning",
                title = "Image 3",
                collapsible = TRUE,
                img(src = "https://cdn1.acedms.com/w560-h325-cfix/photos/listing/2021-07-10/7cb0672210f21cf1da996bcbd1ede91b_large.jpg.webp", width = "100%", height = "200px"),
                p("Description of Image 3")
              ),
              # Box 4
              box(
                width = 4,
                status = "warning",
                title = "Image 3",
                collapsible = TRUE,
                img(src = "https://www.bikes4sale.in/photos-2/554/554151/suzuki-gixxer-sf-fi-1680754276.jpeg", width = "100%", height = "200px"),
                p("Description of Image 3")
              ),
              # Box 5
              box(
                width = 4,
                status = "warning",
                title = "Image 3",
                collapsible = TRUE,
                img(src = "https://www.bikes4sale.in/photos-2/554/554380/bajaj-pulsar-rs-200-bs6-1680795136.jpeg", width = "100%", height = "200px"),
                p("Description of Image 3")
              ),
              # Box 6
              box(
                width = 4,
                status = "warning",
                title = "Image 3",
                collapsible = TRUE,
                img(src = "https://www.bikes4sale.in/photos-2/554/554250/hero-karizma-r-1680770491.jpeg", width = "100%", height = "200px"),
                p("Description of Image 3")
              ),
              # Box 7
              box(
                width = 4,
                status = "warning",
                title = "Image 3",
                collapsible = TRUE,
                img(src = "https://www.bikes4sale.in/photos-2/554/554358/royal-enfield-bullet-standard-350-1680841685.jpeg", width = "100%", height = "200px"),
                p("Description of Image 3")
              ),
              # Box 8
              box(
                width = 4,
                status = "warning",
                title = "Image 3",
                collapsible = TRUE,
                img(src = "https://www.bikes4sale.in/photos-2/554/554358/royal-enfield-bullet-standard-350-1680841685.jpeg", width = "100%", height = "200px"),
                p("Description of Image 3")
              ),
              # Box 9
              box(
                width = 4,
                status = "warning",
                title = "Image 3",
                collapsible = TRUE,
                img(src = "https://www.bikes4sale.in/photos-2/554/554358/royal-enfield-bullet-standard-350-1680841685.jpeg", width = "100%", height = "200px"),
                p("Description of Image 3")
              ),
              fluidRow(
                column(width = 12, align = "center",
                       actionButton("moreDetails", tags$b("MORE DETAILS"), width = 150)
                )
              )
              
              
              
            )
    ),
    tabItem(tabName = "subitem4",
            h2("SHOP BY LOCATION"),
            fluidRow(
              box(
                width = 4,
                status = "primary",
                title = "Image 1",
                collapsible = TRUE,
                img(src = "https://www.bikes4sale.in/photos-2/554/554407/yamaha-fz-fi-v3-bs6-1680801248.jpeg", width = "100%", height = "200px"),
                p("Description of Image 1")
              ),
              # Box 2
              box(
                width = 4,
                status = "info",
                title = "Image 2",
                collapsible = TRUE,
                img(src = "https://www.bikes4sale.in/photos-2/554/554362/honda-cb-unicorn-1680791214.jpg", width = "100%", height = "200px"),
                p("Description of Image 2")
              ),
              # Box 3
              box(
                width = 4,
                status = "warning",
                title = "Image 3",
                collapsible = TRUE,
                img(src = "https://www.bikes4sale.in/photos-2/554/554358/royal-enfield-bullet-standard-350-1680841685.jpeg", width = "100%", height = "200px"),
                p("Description of Image 3")
              ),
              # Box 4
              box(
                width = 4,
                status = "warning",
                title = "Image 3",
                collapsible = TRUE,
                img(src = "https://www.bikes4sale.in/photos-2/554/554151/suzuki-gixxer-sf-fi-1680754276.jpeg", width = "100%", height = "200px"),
                p("Description of Image 3")
              ),
              # Box 5
              box(
                width = 4,
                status = "warning",
                title = "Image 3",
                collapsible = TRUE,
                img(src = "https://www.bikes4sale.in/photos-2/554/554380/bajaj-pulsar-rs-200-bs6-1680795136.jpeg", width = "100%", height = "200px"),
                p("Description of Image 3")
              ),
              # Box 6
              box(
                width = 4,
                status = "warning",
                title = "Image 3",
                collapsible = TRUE,
                img(src = "https://www.bikes4sale.in/photos-2/554/554250/hero-karizma-r-1680770491.jpeg", width = "100%", height = "200px"),
                p("Description of Image 3")
              ),
              # Box 7
              box(
                width = 4,
                status = "warning",
                title = "Image 3",
                collapsible = TRUE,
                img(src = "https://www.bikes4sale.in/photos-2/554/554358/royal-enfield-bullet-standard-350-1680841685.jpeg", width = "100%", height = "200px"),
                p("Description of Image 3")
              ),
              # Box 8
              box(
                width = 4,
                status = "warning",
                title = "Image 3",
                collapsible = TRUE,
                img(src = "https://www.bikes4sale.in/photos-2/554/554358/royal-enfield-bullet-standard-350-1680841685.jpeg", width = "100%", height = "200px"),
                p("Description of Image 3")
              ),
              # Box 9
              box(
                width = 4,
                status = "warning",
                title = "Image 3",
                collapsible = TRUE,
                img(src = "https://www.bikes4sale.in/photos-2/554/554358/royal-enfield-bullet-standard-350-1680841685.jpeg", width = "100%", height = "200px"),
                p("Description of Image 3")
              ),
              fluidRow(
                column(width = 12, align = "center",
                       actionButton("moreDetails", tags$b("MORE DETAILS"), width = 150)
                )
              )
              
              
              
            )
    )
      ,
      tabItem(tabName = "pred",
              #Prediction tab content
              
              #Filters for categorical variables
              box(title = 'Categorical variables', status = 'primary', width = 12,
                  splitLayout(tags$head(tags$style(HTML(".shiny-split-layout > div {overflow: visible;}"))),
                              cellWidths = c('0%', '20%', '4%', '20%', '4%', '20%', '4%', '20%', '4%', '8%'),
                              selectInput('p_state', 'State', c("Andhra Pradesh","Assam","Bihar","Chhattisgarh",
                                                                "Delhi","Goa","Gujarat","Haryana",
                                                                "Himachal Pradesh" ,"Jammu and Kashmir","Jharkhand", "Karnataka",
                                                                "Kerala",    "Madhya Pradesh",       "Maharashtra",            "Odisha",
                                                                "Puducherry" ,           "Punjab" ,        "Rajasthan",
                                                                "Tamil Nadu",         "Telangana",     "Uttar Pradesh",       "Uttarakhand",
                                                                "West Bengal" , "Others")),
                              div(),
                              selectInput('p_owner', 'Owner', c("First Owner","Second Owner","Third Owner",
                                                                "Fourth Owner Or More")),
                              div(),
                              selectInput('p_brand', 'Brand', c("Bajaj","Benelli","BMW","Ducati","Harley-Davidson","Hero","Honda",
                                                                "Hyosung","Kawasaki","KTM","Mahindra","Royal Enfield"
                                                                ,"Suzuki","Triumph","TVS","Yamaha","Others")),
                              div()
                  )
              ),
              
              #Filters for numeric variables
              box(title = 'Numerical variables', status = 'primary', width = 12,
                  splitLayout(cellWidths = c('22%', '4%', '22%', '4%', '22%'),
                              numericInput('p_kms_driven', 'Kilometers Driven(km)', min = 0, value = 0),
                              
                              div(),
                              numericInput('p_power', 'Power (in CC)', min = 100, max = 2000, value = 100),
                              div(),
                              numericInput('p_age', 'Age (in years)', min = 1, value = 1)
                  )
              ),
              
              #Box to display the prediction results
              box(title = 'Prediction result', status = 'success', solidHeader = TRUE, width = 4, height = 100,
                  div(h5('Predicted Price:')),
                  verbatimTextOutput("value", placeholder = TRUE),
                  
                  actionButton('cal','Calculate', icon = icon('calculator'))
              ),
              
              #Box to display information about the model
              box(title = 'Model explanation', status = 'success', width = 8, height = 260,
                  helpText('The following model will predict the total number of bikes rented on a specific day of the week, hour, and weather conditions.'),
                  helpText('The name of the dataset used to train the model is "Bike Sharing Dataset Data Set", taken from the UCI Machine Learning Repository website. The data contains 17,379 observations and 16 attributes related to time and weather conditions.')
              )
      )
      
      
      
      
)
)
)
server <- function(input, output, session) {
  #React value when using the action button
  a = reactiveValues(result = NULL)
  
  observeEvent(input$cal, {

    
    #Dataframe for the single prediction
    values = data.frame(    brand_New = input$p_brand,
                            state= input$p_state,
                            kms_driven = input$p_kms_driven,
                            age = input$p_age,
                            power = input$p_power,
                            owner = input$p_owner 
                        )
    

    
    #Single preiction using the randomforest model
    a$result <-  predict(bike_model, 
                               newdata = values)
  })
  
  output$value <- renderText({
    #Display the prediction value
    paste(a$result)
  })

  
  
}


#Prediction model




shinyApp(ui, server)
