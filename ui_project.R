#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Shiny Part 1
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predict Solar Radiation from Ozone(ppb)"),
  

  sidebarLayout(
    sidebarPanel(
      h3("Introduction"),
      h4("This application uses the airquality dataset inbuilt in R. The air quality dataset consists of daily readings of air quality values from May, 1973 to September 30, 1973"),
      h3("Method"),
      h4("Here we apply linear regression to predict the solar radiation according to the Ozone level on a given day"),
     sliderInput("sliderOzone", "What is the Ozone level of today?", min = 1, max = 168, value = 1),
     checkboxInput("showModel", "Show/Hide Model", value = TRUE),
     submitButton("Submit")
    ),
    
    mainPanel(
       h3("Graphic view of linear model"),
       plotOutput("plot1"),
       h3("Predicted Solar radiation from Ozone level"),
       textOutput("predOzone")

       
    )
  )
))





