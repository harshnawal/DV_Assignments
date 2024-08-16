library(shiny)


ui <- fluidPage(
  
  
  titlePanel("Histograms of Attributes"),
  
  
  sidebarLayout(
    sidebarPanel(
      
    ),
    
    mainPanel(
      
      plotOutput("histogram1"),
      plotOutput("histogram2"),
      plotOutput("histogram3"),
      plotOutput("histogram4"),
      plotOutput("histogram5"),
      plotOutput("histogram6"),
      plotOutput("histogram7")
    )
  )
)


server <- function(input, output) {
  
  
  data <- read.csv("DatasetTaskSubmissions.csv")
  
  
  output$histogram1 <- renderPlot({
    hist(data$Id, main = "Histogram of Id", xlab = "Id", col = "lightblue")
  })
  
  output$histogram2 <- renderPlot({
    hist(data$DatasetTaskId, main = "Histogram of DatasetTaskId", 
         xlab = "DatasetTaskId", col = "lightgreen")
  })
  
  output$histogram3 <- renderPlot({
    hist(data$SubmittedUserId, main = "Histogram of SubmittedUserId", 
         xlab = "SubmittedUserId", col = "lightcoral")
  })
  
  output$histogram4 <- renderPlot({
    
    data$CreationDate <- as.POSIXct(data$CreationDate, format = "%m/%d/%Y %H:%M:%S")
    hist(data$CreationDate, main = "Histogram of CreationDate", 
         xlab = "CreationDate", col = "lightyellow")
  })
  
  output$histogram5 <- renderPlot({
    hist(data$KernelId, main = "Histogram of KernelId", 
         xlab = "KernelId", col = "lightcyan")
  })
  
  output$histogram6 <- renderPlot({
    hist(data$DatasetId, main = "Histogram of DatasetId", 
         xlab = "DatasetId", col = "lightpink")
  })
  
  output$histogram7 <- renderPlot({
    
    data$AcceptedDate <- as.POSIXct(data$AcceptedDate, format = "%m/%d/%Y %H:%M:%S")
    hist(data$AcceptedDate, main = "Histogram of AcceptedDate", 
         xlab = "AcceptedDate", col = "lightgreen")
  })
}


shinyApp(ui = ui, server = server)

