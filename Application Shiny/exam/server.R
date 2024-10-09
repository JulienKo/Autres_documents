#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(plyr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    #exercice nuage de points
    
    head(iris)
    summary(iris)
    datanew <- iris[iris$Species==input$variable1,]
    p= ggplot(datanew, aes(Sepal.Length,Sepal.Width,  colour = Species))
    p+geom_point()
    p+geom_point(aes(shape = Species))
    p+geom_point(aes(shape = Species))+facet_grid(.~Species)
    p=p+geom_point(aes(shape = Species))+facet_grid(.~Species)
    p+ labs(title = "Linear modelling of Sepal.Length against Sepal.Width (IRIS) ", subtitle = "By Species")
    p=p+ labs(title = "Linear modelling of Sepal.Length against Sepal.Width (IRIS) ", subtitle = "By Species")
    p=p+scale_x_continuous(limits=c(input$x))+scale_y_continuous(limits=c(input$y))
    p=p+theme_bw()
    p=p+stat_smooth(method = input$radButton)
    
    
    if(length(input$variable1)==3){ #3 différents graphes
    coef = lm(Sepal.Width ~ Sepal.Length:Species + Species - 1, data=datanew)$coefficients
    
    ann_text = data.frame(Sepal.Length = 7, Sepal.Width = 4,
                          intercept = coef[1:3],
                          a = coef[4:6], 
                          Species = c('setosa', 'versicolor', 'virginica'))
    
    
    eq1=paste0(round(ann_text$a[1],2), "x + ",round(ann_text$intercept[1],2))
    eq2=paste0(round(ann_text$a[2],2), "x + ",round(ann_text$intercept[2],2))
    eq3=paste0(round(ann_text$a[3],2), "x + ",round(ann_text$intercept[3],2))
    p+geom_text(data=ann_text, aes(label =c(eq1,eq2,eq3) ) )
    
    }else{ #2 différents graphes
      
      if(length(input$variable1)==2){
        coef = lm(Sepal.Width ~ Sepal.Length:Species + Species - 1, data=datanew)$coefficients
        
        ann_text = data.frame(Sepal.Length = 7, Sepal.Width = 4,
                              intercept = coef[1:2],
                              a = coef[3:4], 
                              Species = input$variable1)
        
        
        eq1=paste0(round(ann_text$a[1],2), "x + ",round(ann_text$intercept[1],2))
        eq2=paste0(round(ann_text$a[2],2), "x + ",round(ann_text$intercept[2],2))
        p+geom_text(data=ann_text, aes(label =c(eq1,eq2) ) )
        
      }else{ #1 graphes
        
        coef = lm(Sepal.Width ~ Sepal.Length, data=datanew)$coefficients
        ann_text = data.frame(Sepal.Length = 7, Sepal.Width = 4,
                              intercept = coef[1],
                              a = coef[2], 
                              Species = input$variable1)
        eq1=paste0(round(ann_text$a[1],2), "x + ",round(ann_text$intercept[1],2))
        p+geom_text(data=ann_text, aes(label =c(eq1) ) )
      }
    }
    
    
    
  })
  
  output$plot2 <- renderPlot({
    datanew <- iris[iris$Species==input$variable2,]
    ggplot(datanew, aes(Sepal.Length, fill=Species))+  
      geom_histogram(bins = 30) + 
      geom_bar(position = "dodge") +
      theme_bw()
  })
  
  output$plot3 <- renderPlot({
    datanew <- iris[iris$Species==input$variable3,]
    p=ggplot(datanew, aes(Species, Petal.Length ))
    p+ geom_boxplot()  
    p + geom_boxplot(outlier.colour = "red", outlier.shape = 1)
    p + geom_boxplot(fill = "white", colour = "#3366FF") 
    p + geom_boxplot(aes(colour = Species))
  })
  
  output$plot4 <- renderPlot({
    datanew <- iris[iris$Species==input$variable4,]
    mu <- ddply(datanew, "Species", summarise, grp.mean=mean(Sepal.Length))
    ggplot(datanew, aes(x=Sepal.Length, fill=Species, color=Species)) +
      theme(legend.position="top")+
      geom_density(alpha=.1) +geom_vline(data=mu, aes(xintercept=grp.mean, color=Species),
                                         linetype="dashed")
    
  })
 
})
