#
#Exercice3
#

library(shiny)
#library(ggplot2)

shinyServer(function(input, output) {
  
  output$plot1 <- renderPlot({
   # x=rnorm(input$n)
   # y=rnorm(input$n)
    x = seq(-10, 10, l=input$n)
    y = sin(2*x*pi)
  
    plot(x,y,col=input$Color,pch=16,main=input$Title)
    if (input$plotType)
      plot(x ,y,type="l", col=input$Color, lwd=input$lineWidth)
     })
 
  
  output$downloadPlot <- downloadHandler(
    filename =  function() {
      paste("plot", input$fformat, sep=".")
    },
    content = function(file) {
      if(input$fformat == "png")
        png(file) 
      else
        pdf(file) 
      x = seq(-10, 10, l=input$n)
      y = sin(2*x*pi)
      plot(x,y,col=input$Color,pch=16,main=input$Title)
      if (input$plotType)
        plot(x ,y,type="l", col=input$Color, lwd=input$lineWidth)
      dev.off()  
      
    } 
  )

     
})
  

