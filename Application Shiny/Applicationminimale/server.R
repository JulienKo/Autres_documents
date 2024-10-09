library(shiny)
library(ggplot2)

function(input, output, session) {
  n <- reactive({
    input$n
  })

  points <- reactive({
    data.frame(x = rnorm(n()), y = rnorm(n()))
  })

  sineData <- reactive({
    data.frame(x = points()$x, y = sin(2*pi*points()$x))
  })

  color <- reactive({
    input$color
  })

  f1.points <- reactive({
    if (input$connect) {

      points_order <- points()[order(points()$x, decreasing = FALSE), ]
      plot(points_order$x, points_order$y, col = color(), xlab = "x", ylab = "y"
           , main = input$pointsTitle, type = "l", lwd = input$lineWidth)
    } else {

      plot(points()$x, points()$y, pch = 19, col = color(), xlab = "x", ylab = "y"
           , main = input$pointsTitle)
    }
  })

  f2.points <- reactive({
    if (input$connect) {

      points_order.2 <- sineData()[order(sineData()$x, decreasing = FALSE), ]
      plot(points_order.2$x, points_order.2$y, col = color(), xlab = "x", ylab = "y"
           , main = input$sineTitle, type = "l", lwd = input$lineWidth)

    } else {


      plot(sineData()$x, sineData()$y, pch = 19, col = color(), xlab = "x"
           , ylab = "Sin(2.pi.x)"
           , main = input$sineTitle)
    }
  })

  output$pointsPlot <- renderPlot({
    print(f1.points())

  })

  output$sinePlot <- renderPlot({
    print(f2.points())
  })

  output$downloadGraphs <- downloadHandler(
    filename = "Mes-graphiques.jpg"
    , content = function(file) {
      ggsave(file, c(f1.points(), f2.points()))
    }

    #file.copy("plot.pdf", file, overwrite=TRUE)
  )
}








