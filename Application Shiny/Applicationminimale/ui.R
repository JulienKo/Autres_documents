library(shiny)
shinyUI(fluidPage(
  titlePanel(" Application minimale "),
  sidebarLayout(
    sidebarPanel(
      numericInput("n", "Entrer une valeur pour n:", 25, min = 1),
      checkboxInput("connect", "Connecter les valeurs de x et y", FALSE),
      radioButtons("color", "Choisir une couleur de graphique:",
                   choices = c("rouge" = "red"
                                       , "bleu" = "blue"
                                       , "vert" = "green")),
      textInput("pointsTitle", "Titre pour le nuage de points:", value = "Nuage de points de (x,y)"),
      textInput("sineTitle", "Titre pour la courbe en forme de sinusoide:"
                , value = "Sin(2.pi.x) en fonction des valeurs de x"),
      sliderInput("lineWidth", "Epaisseur de la ligne", min = 1, max = 5, value = 1, step = 0.1),
      downloadButton("downloadGraphs", "Télécharger les graphiques en format JPG")
    ),
    mainPanel(
      plotOutput("pointsPlot"),
      plotOutput("sinePlot")
    )
  )
))
