library(shiny)

shinyUI(navbarPage("Analytic dashboard for Chicago theft crimes",
                   tabPanel("Table",
                            
                            # Sidebar
                            sidebarLayout(
                              sidebarPanel(
                                selectInput("commarea", 
                                            label = "Choose a Community Area to display",
                                            choices = c(8, 24, 28, 32),
                                            selected = 8)
                              ),
                              
                              
                              mainPanel(
                                plotOutput("plot1",height="700"))
                              )
                            )
                   )
)

