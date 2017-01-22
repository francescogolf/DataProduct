

library(shiny)
library(ggplot2)
library(ggrepel)
library(dplyr)

dataset <- read.csv("https://raw.githubusercontent.com/francescogolf/Rawdatasets/master/Crimes.csv", header = TRUE, sep =";")

shinyServer(function(input, output) {

  
  output$plot1 <- renderPlot({
 
    dataset <- filter(dataset, Community.Area == input$commarea)
    ds2 <- dataset %>%
      group_by(Location.Description) %>%
      summarise(Arrests = sum(as.integer(Arrest)), Count = sum(as.integer(Count)))
    
    
    ggplot(ds2, aes(x=Count, y=Arrests)) +
      geom_point(size=4) +
      geom_smooth(method=lm) +
      geom_label_repel(aes(label=Location.Description, size=Count)) 
    
    })

})