#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  model = lm(Solar.R ~ Ozone , data = airquality)
  
  modelpred = reactive({
    OzoneInput = input$sliderOzone
    predict(model, newdata = data.frame(Ozone = OzoneInput))
  })
  
  output$plot1 = renderPlot ({
    OzoneInput = input$sliderOzone
    plot(Solar.R ~ Ozone , data = airquality, xlim = c(0, 150), ylim = c(0,350), main = "Prediction of Solar Radiation")
    if(input$showModel){
      abline(model, col = "Yellow", lwd = 2)
    }
    points(OzoneInput, modelpred(), col = "red", pch = 20, cex = 2)
    
  })
    output$predOzone = renderText({
      modelpred()
    })
  })
  
