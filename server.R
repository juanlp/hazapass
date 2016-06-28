library(shiny)
library(datasets)
Logged = FALSE;
PASSWORD <- data.frame(Brukernavn = "cmuh", Password = "5d41402abc4b2a76b9719d911017c592")
# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {
  source("www/Login.R",  local = TRUE)
  
  observe({
    if (USER$Logged == TRUE) {
      output$side <- renderUI({
        sliderInput("side", "Number of observations:", 
                    min = 10000, max = 90000, 
                    value = 50000, step = 10000)
      })
      
      output$main <- renderPlot({
        dist <- NULL
        dist <- rnorm(input$main)
        hist(dist, breaks = 100, main = paste("Your password:", input$passwd))
      })
    }
  })
})