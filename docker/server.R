

library(httr)
library(jsonlite)

function(input, output, session) {

  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    iris[, c(input$xcol, input$ycol)]
  })

  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })

  output$plot1 <- renderPlot({
    palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
      "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))

    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 3)
    points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
  })

 output$random_number <- renderText({

    splen <- input$seplen
    ptwid <- input$petwid
    # Make the POST request
    response <- POST(
	url <- "https://plumber-app-521739183727.us-central1.run.app/predict_petal_length",
	body = toJSON(list("petal_width" = ptwid, "sepal_length" = splen)),
	add_headers("Content-Type" = "application/json")
    )
    data = fromJSON(rawToChar(response$content))
    unlist(data)
  })
}
