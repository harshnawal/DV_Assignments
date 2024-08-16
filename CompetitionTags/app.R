library(shiny)


ui <- fluidPage(
  
  
  titlePanel("Histograms of Attributes"),
  
  
  sidebarLayout(
    sidebarPanel(
      
    ),
    
    mainPanel(
      
      plotOutput("histogram1"),
      plotOutput("histogram2"),
      plotOutput("histogram3")
    )
  )
)


server <- function(input, output) {
  
  
  data <- read.csv("CompetitionTags.csv")
  
  
  
  output$histogram1 <- renderPlot({
    hist(data$Id, main = "Histogram of Id", xlab = "Id", col = "lightblue")
  })
  
  output$histogram2 <- renderPlot({
    hist(data$CompetitionId, main = "Histogram of CompetitionId", 
         xlab = "CompetitionId", col = "lightgreen")
  })
  
  output$histogram3 <- renderPlot({
    hist(data$TagId, main = "Histogram of TagId", xlab = "TagId", col = "lightcoral")
  })
}

# Run the application
shinyApp(ui = ui, server = server)
