#

library(shiny)
#library(ggplot2)

shinyUI(fluidPage(
  titlePanel("Application iris"),
   sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("variable", "Variables to show:",
                         c("setosa" = "cyl",
                           "versicolor" = "am",
                           "virginica" = "gear")),
      radioButtons("Color", "modèles",c("lm", "glm", "gam", "loess","MASS:rlm")),
      sliderInput("x", "Sepal.length range:",min = 4, max = 8,value = c(4,8)),
      sliderInput("y", "Sepal.width range:",min = 4, max = 8,value = c(4,8)),
      
    ),
     mainPanel(
        plotOutput("plot1"),
        tabsetPanel(
          tabPanel("Plot", plotOutput("plot"))
          #tabPanel("Summary", verbatimTextOutput("summary")),
          #tabPanel("Table", tableOutput("table"))
        )
     )
    )
))
