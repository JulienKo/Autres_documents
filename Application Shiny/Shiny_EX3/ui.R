#
#Exercice 3
#

library(shiny)
#library(ggplot2)

shinyUI(fluidPage(
  titlePanel("Application minimale"),
   sidebarLayout(
    sidebarPanel(
      numericInput('n', 'Nombre de points', 25, min = 0, max = 300),
      checkboxInput("plotType", "Line" ),
      radioButtons("Color", "Couleur",c("Rouge"="red", "Bleu"="blue","Vert"="green")),
      textInput("Title","Titre"),
      sliderInput("lineWidth", "Largeur", min=1.0, max=5.0, value=3, step=0.1),
      radioButtons('fformat', 'Format du document ', c('PDF', 'png'),inline = TRUE),
      downloadButton('downloadPlot', 'Download Plot')
      
      
      
    ),
     mainPanel(
        plotOutput("plot1")
    
     )
    )
))
