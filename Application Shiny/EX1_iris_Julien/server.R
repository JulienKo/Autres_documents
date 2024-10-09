#
#Exercice1
#

library(shiny)
#library(ggplot2)

shinyServer(function(input, output) {
  
  output$plot1 <- renderPlot({
    library(ggplot2)  # charger la librairie ggplot2
    library(MASS)
    library(plyr)
    head(iris)        #charger le jeux de donnée
    p = ggplot(iris, aes(Sepal.Length,Sepal.Width,  colour = Species))     #nuage de points représentant Sepal.Width en 
    p=p+geom_point()                                                       # fonction de Sepal.Length selon Species
    p=p+geom_point(aes(shape = Species))+facet_grid(.~Species)
    p=p+geom_point(aes(colour = input$variable))
    p=p+stat_smooth(method = input$Color)
    p
     })
 
  output$plot <- renderPlot({
    ggplot(iris, aes(Sepal.Length, fill=Species))+ geom_histogram(bins = 30) + geom_bar(position = "dodge") + theme_bw()
    ggplot(iris, aes(x=Sepal.Length, color=Species)) +geom_histogram(bins = 30,fill="white")+ theme_bw()
    p=ggplot(iris, aes(x=Sepal.Length, color=Species)) +geom_histogram(bins = 30,fill="white", alpha=0.5, position="identity")
    p=p+labs(title = "Histogramme (IRIS) ") 
    p
  })
    
    
  })
  

