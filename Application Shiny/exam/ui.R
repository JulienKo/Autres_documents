#COMMENTAIRE QUESTION 5 :
#On pourrait ajouter un controler textfield pour changer le titre du graphique, un bouton
#download pour télécharger le graphique, un slider pour sélectionner le nombre de points à afficher,
#un radioButtons pour sélectionner les couleurs à afficher sur les graphiques...

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Iris Shiny App"),
 
  navbarPage("Iris Shiny App",
                 tabPanel("Plot",
                          sidebarLayout(
                            sidebarPanel(
                              checkboxGroupInput("variable1", "Variables to show:",
                                                 c("Setosa"="setosa",
                                                   "Versicolor" = "versicolor",
                                                   "Virginica" = "virginica"), c("setosa", "versicolor", "virginica")),
                              radioButtons("radButton", 
                                           "Modèle de regression", 
                                           c("lm", "glm", "gam", "loess", "MASS:rlm")),
                              
                              sliderInput("x", "Sepal.length range:",
                                          min = 4, max = 8,
                                          value = c(4,8), step=0.1),
                              sliderInput("y", "Sepal.width range:",
                                          min = 2, max = 4.5,
                                          value = c(2,4.5), step=0.1)
                            ),
                            mainPanel(
                              plotOutput("distPlot")
                            )
                          )
                 ),
             tabPanel("Histogram",
                      sidebarLayout(
                        sidebarPanel(
                          checkboxGroupInput("variable2", "Variables to show:",
                                             c("Setosa"="setosa",
                                               "Versicolor" = "versicolor",
                                               "Virginica" = "virginica"), c("setosa", "versicolor", "virginica"))),
                        
                        mainPanel(
                          plotOutput("plot2")
                        )
                      )
             ),
             tabPanel("Boxplot",
                      sidebarLayout(
                        sidebarPanel(
                          checkboxGroupInput("variable3", "Variables to show:",
                                             c("Setosa"="setosa",
                                               "Versicolor" = "versicolor",
                                               "Virginica" = "virginica"), c("setosa", "versicolor", "virginica"))),
                          
                        mainPanel(
                          plotOutput("plot3")
                        )
                      )
             ),
             tabPanel("Density",
                      sidebarLayout(
                        sidebarPanel(
                          checkboxGroupInput("variable4", "Variables to show:",
                                             c("Setosa"="setosa",
                                               "Versicolor" = "versicolor",
                                               "Virginica" = "virginica"), c("setosa", "versicolor", "virginica"))
                        ),
                        mainPanel(
                          plotOutput("plot4")
                        )
                      )
             )
             
             )
       
       #tabsetPanel(
        # tabPanel("Plot distPlot",plotOutput("distPlot")),
         #tabPanel("Plot", plotOutput("plot2")),
         #tabPanel("Plot", plotOutput("plot3")),
         #tabPanel("Plot", plotOutput("plot4"))
       #)
    
  
))
