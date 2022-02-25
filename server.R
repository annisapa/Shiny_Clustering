library(rattle.data)
library(ppclust)
data<-wine[,-1]
data

function(input, output, session) {
  

  selectedData <- reactive({
    data[, c(input$xcol, input$ycol)]
  })
  
  clusters <- reactive({
    fcm(selectedData(), input$clusters)
  })
  
  output$plot1 <- renderPlot({
    palette(c("#E41A1C",  "#984EA3", "#377EB8", "#4DAF4A",
              "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
    
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 3)
    points(clusters()$v, pch = 4, cex = 4, lwd = 4)
  })
  
}